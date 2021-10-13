unit FLArticulos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, DBTables, StdCtrls, ComCtrls,
  ToolWin, Buttons,
  Provider, DBClient, Mask, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, dxSkinsCore, dxSkinBlue, dxSkinsdxBarPainter,
  dxBar, cxClasses, cxButtons, SimpleSearch;

type
  TListadoArticulos = class(TForm)
    GroupBox1: TGroupBox;
    StaticText2: TStaticText;
    cFamiliaDesde: TEdit;
    StaticText3: TStaticText;
    cFamiliaHasta: TEdit;
    BarraEstado: TStatusBar;
    StaticText1: TStaticText;
    cEmpresa: TEdit;
    tNomEmpresa: TPanel;
    GroupBox4: TGroupBox;
    StaticText6: TStaticText;
    cArticuloDesde: TEdit;
    StaticText7: TStaticText;
    cArticuloHasta: TEdit;
    cDenominacion: TEdit;
    StaticText4: TStaticText;
    GroupBox2: TGroupBox;
    cOrden: TComboBox;
    GroupBox11: TGroupBox;
    cAgrupacion: TComboBox;
    cLupaEmpresas: TSimpleSearch;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    bAceptar: TdxBarLargeButton;
    bSalir: TdxBarLargeButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Aceptar(Sender: TObject);
    procedure ColorEnter(Sender: TObject);
    procedure ColorExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BSalirClick(Sender: TObject);
    procedure cEmpresaChange(Sender: TObject);
    procedure cOrdenKeyPress(Sender: TObject; var Key: Char);
    procedure cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaEmpresasClick(Sender: TObject);

  private
    { Private declarations }
    function ValidarSeleccion(): Boolean;

  public
       { Public declarations }
   
  end;

var
   ListadoArticulos: TListadoArticulos;

implementation

uses MBaseDatos, UGLobal, LArticulosCliente, LArticulos;

{$R *.dfm}

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TListadoArticulos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then  //F5 aceptar
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TListadoArticulos.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13 then  //Enter
     begin
          Key:=#0;
          PostMessage(Handle,WM_NEXTDLGCTL,0,0);
     end
     else if Key=#27 then  //Esc
          begin
               Key:=#0;
               Close;
          end;
end;

//----------------------- BOTON ACEPTAR ----------------------------------------
procedure TListadoArticulos.Aceptar(Sender: TObject);
var
   SQLRi: String;
begin
     Application.ProcessMessages;
     try
        PostMessage(Handle,WM_NEXTDLGCTL,0,0);
        if ValidarSeleccion() then
        begin
             with TQRArticulos.Create(Application) do  //Creamos dinámicamente el report
             try
                tEmpresa.Caption:=cEmpresa.Text + '-' + tNomEmpresa.Caption;
                tFamilias.Caption:=cFamiliaDesde.Text + '-' + cFamiliaHasta.Text;
                tArticulos.Caption:=cArticuloDesde.Text + '-' + cArticuloHasta.Text;
                if cAgrupacion.ItemIndex=1 then
                   AgruparFamilia:=True
                else
                    AgruparFamilia:=False;

                Query1.SQL.Clear;
                Query1.SQL.Add(' SELECT * FROM ARTICULOS, UNIDADES ' +
                               ' WHERE EMPRESA_A=EMPRESA_U ' +
                               ' AND UNIDAD_MEDIDA_A=CODIGO_U ' +
                               ' AND EMPRESA_A=' + QuotedStr(cEmpresa.Text) +
                               ' AND FAMILIA_A BETWEEN ' + QuotedStr(cFamiliaDesde.Text) + ' AND ' + QuotedStr(cFamiliaHasta.Text) +
                               ' AND CODIGO_A BETWEEN ' + QuotedStr(cArticuloDesde.Text) + ' AND ' + QuotedStr(cArticuloHasta.Text));
                if cDenominacion.Text<>'' then
                   Query1.SQL.Add(' AND DENOMINACION_A LIKE ' + QuotedStr(StringReplace(cDenominacion.Text, '*', '%',[rfReplaceAll])));
                if cOrden.ItemIndex=0 then
                begin
                     if AgruparFamilia then
                        Query1.SQL.Add(' ORDER BY FAMILIA_A, CODIGO_A')
                     else
                         Query1.SQL.Add(' ORDER BY CODIGO_A');
                end
                else
                begin
                     if AgruparFamilia then
                        Query1.SQL.Add(' ORDER BY FAMILIA_A, DENOMINACION_A')
                     else
                         Query1.SQL.Add(' ORDER BY DENOMINACION_A');
                end;
                Query1.Open;
                if not Query1.IsEmpty then
                    Preview              //Previsualizamos
                else
                    MessageDlg (Chr(13) + 'Listado sin datos', mtError,[mbOk],0);
                Query1.Close;
              finally
                 Free;              //Liberamos el Report
                 Application.ProcessMessages;
             end;
        end;
     except
           on E:Exception do
                CapturaErrores(E);
     end;
end;

//----------------------- VALIDA LA SELECCION ----------------------------------
function TListadoArticulos.ValidarSeleccion(): Boolean;
begin
     Result:=True;
     if cEmpresa.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta la empresa', mtError,[mbOk],0);
          cEmpresa.SetFocus;
          Result:=False;
     end
     else if tNomEmpresa.Caption='' then
     begin
          MessageDlg (Chr(13) + 'La empresa no existe', mtError,[mbOk],0);
          cEmpresa.SetFocus;
          Result:=False;
     end
     else if cFamiliaDesde.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta familia desde', mtError,[mbOk],0);
          cFamiliaDesde.SetFocus;
          Result:=False;
     end
     else if cFamiliaHasta.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta familia hasta', mtError,[mbOk],0);
          cFamiliaHasta.SetFocus;
          Result:=False;
     end
     else if cFamiliaDesde.Text>cFamiliaHasta.Text then
     begin
          MessageDlg (Chr(13) + 'Rango de familias incorrecto', mtError,[mbOk],0);
          cFamiliaDesde.SetFocus;
          Result:=False;
     end
     else if cArticuloDesde.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta artículo desde', mtError,[mbOk],0);
          cArticuloDesde.SetFocus;
          Result:=False;
     end
     else if cArticuloHasta.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta artículo hasta', mtError,[mbOk],0);
          cArticuloHasta.SetFocus;
          Result:=False;
     end
     else if cArticuloDesde.Text>cArticuloHasta.Text then
     begin
          MessageDlg (Chr(13) + 'Rango de artículos incorrecto', mtError,[mbOk],0);
          cArticuloDesde.SetFocus;
          Result:=False;
     end;
end;

//---------------------- PONE EL COLOR DEL FOCO --------------------------------
procedure TListadoArticulos.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clMoneyGreen;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TListadoArticulos.ColorExit(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          TEdit(Sender).Color:=clWindow;
          if Length(TEdit(Sender).Text)>0 then
             TEdit(Sender).Text:=RellenarCeros(TEdit(Sender).Text,TEdit(Sender).MaxLength,'I');
     end
     else if Sender is TComboBox then           //Si el componente es un TComboBox
             TComboBox(Sender).Color:=clWindow;
end;

//------------------------- CREACION DEL FORMULARIO ----------------------------
procedure TListadoArticulos.FormCreate(Sender: TObject);
begin
     Top:=1;
     Left:=0;

     cOrden.ItemIndex:=1;     //Orden por denominacion
     cAgrupacion.ItemIndex:=0; //Sin Agrupacion
     cEmpresa.Text:=EmpresaGlobal;
end;

//------------------------- CIERRE DEL FORMULARIO ------------------------------
procedure TListadoArticulos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

//------------------------- BOTON SALIR ----------------------------------------
procedure TListadoArticulos.BSalirClick(Sender: TObject);
begin
     Close;
end;

//------------------------ AL CAMBIAR LA EMPRESA -------------------------------
procedure TListadoArticulos.cEmpresaChange(Sender: TObject);
begin
     tNomEmpresa.Caption:= NomEmpresa(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
end;

//--------- PULSACION DE TECLAS EN EL COMBO DE ORDEN ---------------------------
procedure TListadoArticulos.cOrdenKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key='C') or (Key='c') then
     begin
          Key:=#0;
          cOrden.ItemIndex:=0;
          cOrden.Text:='CÓDIGO';
     end
     else if (Key='N') or (Key='n') then
     begin
          Key:=#0;
          cOrden.ItemIndex:=1;
          cOrden.Text:='NOMBRE';
     end
     else
         Key:=#0;
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TListadoArticulos.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TListadoArticulos.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresa.Text:=CodEmpresa;
     cEmpresa.SetFocus;
end;


end.
