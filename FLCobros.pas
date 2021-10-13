unit FLCobros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, DBTables, StdCtrls, ComCtrls,
  ToolWin,Buttons,
  Provider, DBClient, Mask, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxCore,
  cxDateUtils, dxSkinsCore, dxSkinBlue, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, Menus, dxSkinsdxBarPainter, dxBar, cxClasses, cxButtons,
  SimpleSearch;

type
  TListadoCobros = class(TForm)
    cClientes: TGroupBox;
    StaticText2: TStaticText;
    cClienteDesde: TEdit;
    StaticText3: TStaticText;
    cClienteHasta: TEdit;
    BarraEstado: TStatusBar;
    StaticText1: TStaticText;
    cEmpresa: TEdit;
    tNomEmpresa: TPanel;
    GBfactura: TGroupBox;
    StaticText4: TStaticText;
    cFacturaDesde: TEdit;
    StaticText5: TStaticText;
    cFacturaHasta: TEdit;
    GBFecFactura: TGroupBox;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    GBOrden: TGroupBox;
    cOrden: TComboBox;
    GBTipo: TGroupBox;
    cTipoListado: TComboBox;
    GBFecPago: TGroupBox;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    cFechaDesde: TcxDateEdit;
    cFechaHasta: TcxDateEdit;
    cFecPagoDesde: TcxDateEdit;
    cFecPagoHasta: TcxDateEdit;
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
    procedure ColorExitSinCeros(Sender: TObject);
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
   ListadoCobros: TListadoCobros;

implementation

uses MBaseDatos, UGLobal, LCobrosTabla, LCobrosFicha;

{$R *.dfm}

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TListadoCobros.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then  //F5 aceptar
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TListadoCobros.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TListadoCobros.Aceptar(Sender: TObject);
Var
   CadSql: String;
begin
     PostMessage(Handle,WM_NEXTDLGCTL,0,0);
     Application.ProcessMessages;
     try
        if ValidarSeleccion() then
        begin
             CadSql:=' SELECT * FROM COBROS ' +
                     ' WHERE EMPRESA_CO=' + QuotedStr(cEmpresa.Text) +
                     ' AND CLIENTE_CO BETWEEN ' + QuotedStr(cClienteDesde.Text) + ' AND ' + QuotedStr(cClienteHasta.Text) +
                     ' AND FACTURA_CO BETWEEN ' + cFacturaDesde.Text + ' AND ' + cFacturaHasta.Text +
                     ' AND FECHA_FACTURA_CO BETWEEN ' + QuotedStr(AnyoMesDia(cFechaDesde.Text)) + ' AND ' + QuotedStr(AnyoMesDia(cFechaHasta.Text)) +
                     ' AND FECHA_PAGO_CO BETWEEN ' + QuotedStr(AnyoMesDia(cFecPagoDesde.Text)) + ' AND ' + QuotedStr(AnyoMesDia(cFecPagoHasta.Text));

             //ORDEN
             if cOrden.ItemIndex=0 then
                CadSql:=CadSql + ' ORDER BY CLIENTE_CO,FACTURA_CO'
             else if cOrden.ItemIndex=1 then
                     CadSql:=CadSql + ' ORDER BY FACTURA_CO'
                  else
                      CadSql:=CadSql + ' ORDER BY FECHA_FACTURA_CO, FACTURA_CO';

             if cTipoListado.ItemIndex=0 then
             begin
                  with TQRCobrosTabla.Create(Application) do  //Creamos dinámicamente el report
                  try
                     tEmpresa.Caption:=cEmpresa.Text + '-' + tNomEmpresa.Caption;
                     tClientes.Caption:=cClienteDesde.Text + '-' + cClienteHasta.Text;
                     tFacturas.Caption:=cFacturaDesde.Text + '-' + cFacturaHasta.Text;
                     tFechaFacturas.Caption:=cFechaDesde.Text + '-' + cFechaHasta.Text;
                     tFechaPagos.Caption:=cFecPagoDesde.Text + '-' + cFecPagoHasta.Text;

                     Query1.Close;
                     Query1.SQL.Clear;
                     Query1.SQL.Add(CadSql);
                     Query1.Open;
                     if not Query1.IsEmpty then
                        Preview              //Previsualizamos
                     else
                         MessageDlg (Chr(13) + 'Listado sin datos', mtError,[mbOk],0);
                     Query1.Close;
                  finally
                     Free;              //Liberamos el Report
                  end;
             end
             else
             begin
                  with TQRCobrosFicha.Create(Application) do  //Creamos dinámicamente el report
                  try
                     tEmpresa.Caption:=cEmpresa.Text + '-' + tNomEmpresa.Caption;
                     tClientes.Caption:=cClienteDesde.Text + '-' + cClienteHasta.Text;
                     tFacturas.Caption:=cFacturaDesde.Text + '-' + cFacturaHasta.Text;
                     tFechaFacturas.Caption:=cFechaDesde.Text + '-' + cFechaHasta.Text;
                     tFechaPagos.Caption:=cFecPagoDesde.Text + '-' + cFecPagoHasta.Text;

                     Query1.Close;
                     Query1.SQL.Clear;
                     Query1.SQL.Add(CadSql);
                     Query1.Open;
                     if not Query1.IsEmpty then
                        Preview              //Previsualizamos
                     else
                         MessageDlg (Chr(13) + 'Listado sin datos', mtError,[mbOk],0);
                     Query1.Close;
                  finally
                     Free;              //Liberamos el Report
                  end;
             end;
        end;
     except
           on E:Exception do
                CapturaErrores(E);
     end;
end;
//----------------------- VALIDA LA SELECCION ----------------------------------
function TListadoCobros.ValidarSeleccion(): Boolean;
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
     else if cFacturaDesde.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta factura desde', mtError,[mbOk],0);
          cFacturaDesde.SetFocus;
          Result:=False;
     end
     else if cFacturaHasta.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta factura hasta', mtError,[mbOk],0);
          cFacturaHasta.SetFocus;
          Result:=False;
     end
     else if cFacturaDesde.Text>cFacturaHasta.Text then
     begin
          MessageDlg (Chr(13) + 'Rango de facturas incorrecto', mtError,[mbOk],0);
          cFacturaDesde.SetFocus;
          Result:=False;
     end
     else if not EsFecha(cFechaDesde.Text) then
     begin
          MessageDlg (Chr(13) + 'La fecha factura desde es incorrecta', mtError,[mbOk],0);
          cFechaDesde.SetFocus;
          Result:=False;
     end
     else if not EsFecha(cFechaHasta.Text) then
     begin
          MessageDlg (Chr(13) + 'La fecha factura hasta es incorrecta', mtError,[mbOk],0);
          cFechaHasta.SetFocus;
          Result:=False;
     end
     else if cFechaDesde.Date>cFechaHasta.Date then
     begin
          MessageDlg (Chr(13) + 'Rango de fechas de factura incorrecto', mtError,[mbOk],0);
          cFechaDesde.SetFocus;
          Result:=False;
     end
     else if not EsFecha(cFecPagoDesde.Text) then
     begin
          MessageDlg (Chr(13) + 'La fecha pago desde es incorrecta', mtError,[mbOk],0);
          cFecPagoDesde.SetFocus;
          Result:=False;
     end
     else if not EsFecha(cFechaHasta.Text) then
     begin
          MessageDlg (Chr(13) + 'La fecha pago hasta es incorrecta', mtError,[mbOk],0);
          cFecPagoHasta.SetFocus;
          Result:=False;
     end
     else if cFecPagoDesde.Date>cFecPagoHasta.Date then
     begin
          MessageDlg (Chr(13) + 'Rango de fechas de pago incorrecto', mtError,[mbOk],0);
          cFecPagoDesde.SetFocus;
          Result:=False;
     end;
end;

//---------------------- PONE EL COLOR DEL FOCO --------------------------------
procedure TListadoCobros.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clMoneyGreen;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TListadoCobros.ColorExit(Sender: TObject);
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

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TListadoCobros.ColorExitSinCeros(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clWindow
     else if Sender is TComboBox then           //Si el componente es un TComboBox
             TComboBox(Sender).Color:=clWindow;
end;

//------------------------- CREACION DEL FORMULARIO ----------------------------
procedure TListadoCobros.FormCreate(Sender: TObject);
begin
     Top:=1;
     Left:=0;
     cFechaDesde.Text:='01/01/' + IntToStr(Year(date()));
     cFechaHasta.Date:=Date();
     cFecPagoDesde.Text:='01/01/' + IntToStr(Year(date()));
     cFecPagoHasta.Date:=Date();
     cEmpresa.Text:=EmpresaGlobal;
end;

//------------------------- CIERRE DEL FORMULARIO ------------------------------
procedure TListadoCobros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

//------------------------- BOTON SALIR ----------------------------------------
procedure TListadoCobros.BSalirClick(Sender: TObject);
begin
     Close;
end;

//------------------------ AL CAMBIAR LA EMPRESA -------------------------------
procedure TListadoCobros.cEmpresaChange(Sender: TObject);
begin
     tNomEmpresa.Caption:= NomEmpresa(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TListadoCobros.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TListadoCobros.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresa.Text:=CodEmpresa;
     cEmpresa.SetFocus;
end;

end.
