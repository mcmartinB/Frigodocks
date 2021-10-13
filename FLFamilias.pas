unit FLFamilias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, DBTables, StdCtrls, ComCtrls,
  ToolWin,  Buttons,
  Provider, DBClient, Mask, dxSkinsCore, dxSkinBlue,
  dxSkinsdxBarPainter, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxButtons, SimpleSearch, dxBar, cxClasses;

type
  TListadoFamilias = class(TForm)
    GroupBox1: TGroupBox;
    StaticText2: TStaticText;
    cFamiliaDesde: TEdit;
    StaticText3: TStaticText;
    cFamiliaHasta: TEdit;
    BarraEstado: TStatusBar;
    StaticText1: TStaticText;
    cEmpresa: TEdit;
    tNomEmpresa: TPanel;
    GroupBox2: TGroupBox;
    cOrden: TComboBox;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    bAceptar: TdxBarLargeButton;
    bSalir: TdxBarLargeButton;
    cLupaEmpresas: TSimpleSearch;
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
   ListadoFamilias: TListadoFamilias;

implementation

uses MBaseDatos, UGLobal, LFamilias;

{$R *.dfm}

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TListadoFamilias.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then  //F5 aceptar
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TListadoFamilias.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TListadoFamilias.Aceptar(Sender: TObject);
begin
     Application.ProcessMessages;
     try
        if ValidarSeleccion() then
        begin
             with TQRFamilias.Create(Application) do  //Creamos dinámicamente el report
             try
                tEmpresa.Caption:=RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I') + '-' + tNomEmpresa.Caption;
                tFamilias.Caption:=cFamiliaDesde.Text + '-' + cFamiliaHasta.Text;
                
                Query1.SQL.Clear;
                Query1.SQL.Add(' SELECT * FROM FAMILIAS ' +
                               ' WHERE EMPRESA_F=' + QuotedStr(Rellenarceros(cEmpresa.Text,cEmpresa.MaxLength,'I')) +
                               ' AND CODIGO_F BETWEEN ' + QuotedStr(cFamiliaDesde.Text) + ' AND ' + QuotedStr(cFamiliaHasta.Text));
                if cOrden.ItemIndex=0 then
                   Query1.SQL.Add(' ORDER BY CODIGO_F')
                else
                    Query1.SQL.Add(' ORDER BY DESCRIPCION_F');
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
function TListadoFamilias.ValidarSeleccion(): Boolean;
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
     end;
end;

//---------------------- PONE EL COLOR DEL FOCO --------------------------------
procedure TListadoFamilias.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clMoneyGreen;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TListadoFamilias.ColorExit(Sender: TObject);
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
procedure TListadoFamilias.FormCreate(Sender: TObject);
begin
     Top:=1;
     Left:=0;

     cEmpresa.Text:=EmpresaGlobal;
end;

//------------------------- CIERRE DEL FORMULARIO ------------------------------
procedure TListadoFamilias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

//------------------------- BOTON SALIR ----------------------------------------
procedure TListadoFamilias.BSalirClick(Sender: TObject);
begin
     Close;
end;

//------------------------ AL CAMBIAR LA EMPRESA -------------------------------
procedure TListadoFamilias.cEmpresaChange(Sender: TObject);
begin
     tNomEmpresa.Caption:= NomEmpresa(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
end;

//--------- PULSACION DE TECLAS EN EL COMBO DE ORDEN ---------------------------
procedure TListadoFamilias.cOrdenKeyPress(Sender: TObject; var Key: Char);
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
procedure TListadoFamilias.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TListadoFamilias.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresa.Text:=CodEmpresa;
     cEmpresa.SetFocus;
end;

end.
