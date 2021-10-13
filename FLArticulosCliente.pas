unit FLArticulosCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, DBTables, StdCtrls, ComCtrls,
  ToolWin, Buttons,
  Provider, DBClient, Mask, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, dxSkinsCore, dxSkinBlue, cxButtons, SimpleSearch,
  dxSkinsdxBarPainter, dxBar, cxClasses;

type
  TListadoArticulosCliente = class(TForm)
    GroupBox1: TGroupBox;
    StaticText2: TStaticText;
    cFamiliaDesde: TEdit;
    StaticText3: TStaticText;
    cFamiliaHasta: TEdit;
    BarraEstado: TStatusBar;
    StaticText1: TStaticText;
    cEmpresa: TEdit;
    tNomEmpresa: TPanel;
    GroupBox3: TGroupBox;
    StaticText4: TStaticText;
    cClienteDesde: TEdit;
    StaticText5: TStaticText;
    cClienteHasta: TEdit;
    GroupBox4: TGroupBox;
    StaticText6: TStaticText;
    cArticuloDesde: TEdit;
    StaticText7: TStaticText;
    cArticuloHasta: TEdit;
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
    procedure cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaEmpresasClick(Sender: TObject);

  private
    { Private declarations }
    function ValidarSeleccion(): Boolean;

  public
       { Public declarations }
   
  end;

var
   ListadoArticulosCliente: TListadoArticulosCliente;

implementation

uses MBaseDatos, UGLobal, LArticulosCliente;

{$R *.dfm}

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TListadoArticulosCliente.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then  //F5 aceptar
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TListadoArticulosCliente.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TListadoArticulosCliente.Aceptar(Sender: TObject);
begin
     PostMessage(Handle,WM_NEXTDLGCTL,0,0);
     Application.ProcessMessages;
     try
        if ValidarSeleccion() then
        begin
             with TQRArticulosCliente.Create(Application) do  //Creamos dinámicamente el report
             try
                tEmpresa.Caption:=cEmpresa.Text + '-' + tNomEmpresa.Caption;
                tClientes.Caption:=cClienteDesde.Text + '-' + cClienteHasta.Text;
                tFamilias.Caption:=cFamiliaDesde.Text + '-' + cFamiliaHasta.Text;
                tArticulos.Caption:=cArticuloDesde.Text + '-' + cArticuloHasta.Text;

                QArticulos.Close;
                QArticulos.SQL.Clear;
                QArticulos.SQL.Add(' SELECT * FROM ARTICULOS ' +
                                   ' WHERE EMPRESA_A=' + QuotedStr(cEmpresa.Text) +
                                   ' AND FAMILIA_A=:FAMILIA ' +
                                   ' AND CODIGO_A=:ARTICULO');
                QArticulos.Prepare;

                Query1.SQL.Clear;
                Query1.SQL.Add(' SELECT * FROM ARTICULOS_CLIENTE ' +
                               ' WHERE EMPRESA_AC=' + QuotedStr(cEmpresa.Text) +
                               ' AND CLIENTE_AC BETWEEN ' + QuotedStr(cClienteDesde.Text) + ' AND ' + QuotedStr(cClienteHasta.Text) +
                               ' AND FAMILIA_AC BETWEEN ' + QuotedStr(cFamiliaDesde.Text) + ' AND ' + QuotedStr(cFamiliaHasta.Text) +
                               ' AND ARTICULO_AC BETWEEN ' + QuotedStr(cArticuloDesde.Text) + ' AND ' + QuotedStr(cArticuloHasta.Text) +
                               ' ORDER BY CLIENTE_AC, FAMILIA_AC, ARTICULO_AC, ARTI_CLI_AC');
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
function TListadoArticulosCliente.ValidarSeleccion(): Boolean;
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
     else if cClienteDesde.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta cliente desde', mtError,[mbOk],0);
          cClienteDesde.SetFocus;
          Result:=False;
     end
     else if cClienteHasta.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta cliente hasta', mtError,[mbOk],0);
          cClienteHasta.SetFocus;
          Result:=False;
     end
     else if cClienteDesde.Text>cClienteHasta.Text then
     begin
          MessageDlg (Chr(13) + 'Rango de clientes incorrecto', mtError,[mbOk],0);
          cClienteDesde.SetFocus;
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
          cFamiliaHasta.SetFocus;
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
procedure TListadoArticulosCliente.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clMoneyGreen;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TListadoArticulosCliente.ColorExit(Sender: TObject);
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
procedure TListadoArticulosCliente.FormCreate(Sender: TObject);
begin
     Top:=1;
     Left:=0;

     cEmpresa.Text:=EmpresaGlobal;
end;

//------------------------- CIERRE DEL FORMULARIO ------------------------------
procedure TListadoArticulosCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

//------------------------- BOTON SALIR ----------------------------------------
procedure TListadoArticulosCliente.BSalirClick(Sender: TObject);
begin
     Close;
end;

//------------------------ AL CAMBIAR LA EMPRESA -------------------------------
procedure TListadoArticulosCliente.cEmpresaChange(Sender: TObject);
begin
     tNomEmpresa.Caption:= NomEmpresa(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TListadoArticulosCliente.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TListadoArticulosCliente.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresa.Text:=CodEmpresa;
     cEmpresa.SetFocus;
end;

end.
