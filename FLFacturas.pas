unit FLFacturas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, DBTables, StdCtrls, ComCtrls,
  ToolWin, Buttons,
  Provider, DBClient, Mask, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxCore, cxDateUtils, dxSkinsCore,
  dxSkinBlue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, Menus,
  dxSkinsdxBarPainter, dxBar, cxClasses, cxButtons, SimpleSearch;

type
  TListadoFacturas = class(TForm)
    cClientes: TGroupBox;
    StaticText2: TStaticText;
    cClienteDesde: TEdit;
    StaticText3: TStaticText;
    cClienteHasta: TEdit;
    BarraEstado: TStatusBar;
    StaticText1: TStaticText;
    cEmpresa: TEdit;
    tNomEmpresa: TPanel;
    GroupBox1: TGroupBox;
    StaticText4: TStaticText;
    cFacturaDesde: TEdit;
    StaticText5: TStaticText;
    cFacturaHasta: TEdit;
    GroupBox2: TGroupBox;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    csds: TGroupBox;
    cTipoFactura: TComboBox;
    GroupBox3: TGroupBox;
    cOrden: TComboBox;
    GroupBox4: TGroupBox;
    cTipoListado: TComboBox;
    cFechaDesde: TcxDateEdit;
    cFechaHasta: TcxDateEdit;
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
   ListadoFacturas: TListadoFacturas;

implementation

uses MBaseDatos, UGLobal, LFacturasTabla, LFacturasFicha;

{$R *.dfm}

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TListadoFacturas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then  //F5 aceptar
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TListadoFacturas.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TListadoFacturas.Aceptar(Sender: TObject);
Var
   CadSql: String;
begin
     PostMessage(Handle,WM_NEXTDLGCTL,0,0);
     Application.ProcessMessages;
     try
        if ValidarSeleccion() then
        begin
             CadSql:=' SELECT * FROM CABECERA_FACTURAS ' +
                     ' WHERE EMPRESA_CF=' + QuotedStr(cEmpresa.Text) +
                     ' AND CLIENTE_CF BETWEEN ' + QuotedStr(cClienteDesde.Text) + ' AND ' + QuotedStr(cClienteHasta.Text) +
                     ' AND NUMERO_FACTURA_CF BETWEEN ' + cFacturaDesde.Text + ' AND ' + cFacturaHasta.Text +
                     ' AND FECHA_FACTURA_CF BETWEEN ' + QuotedStr(AnyoMesDia(cFechaDesde.Text)) + ' AND ' + QuotedStr(AnyoMesDia(cFechaHasta.Text));

             if cTipoFactura.ItemIndex=1 then //Cobradas
             begin
                  CadSql:=CadSql +
                         ' AND IMPORTE_BRUTO_CF <= (SELECT SUM(IMPORTE_CO) FROM COBROS ' +
                                                   ' WHERE EMPRESA_CO=EMPRESA_CF ' +
                                                   ' AND CLIENTE_CO=CLIENTE_CF ' +
                                                   ' AND FACTURA_CO=NUMERO_FACTURA_CF ' +
                                                   ' AND FECHA_FACTURA_CO=FECHA_FACTURA_CF) ';
             end
             else if cTipoFactura.ItemIndex=2 then //Pendientes de Cobro
                  begin
                       CadSql:=CadSql +
                               ' AND ((IMPORTE_BRUTO_CF > (SELECT SUM(IMPORTE_CO) FROM COBROS ' +
                                                        ' WHERE EMPRESA_CO=EMPRESA_CF ' +
                                                        ' AND CLIENTE_CO=CLIENTE_CF ' +
                                                        ' AND FACTURA_CO=NUMERO_FACTURA_CF ' +
                                                        ' AND FECHA_FACTURA_CO=FECHA_FACTURA_CF)) ' +
                                      ' OR (SELECT COUNT(*) FROM COBROS ' +
                                          ' WHERE EMPRESA_CO=EMPRESA_CF ' +
                                          ' AND CLIENTE_CO=CLIENTE_CF ' +
                                          ' AND FACTURA_CO=NUMERO_FACTURA_CF ' +
                                          ' AND FECHA_FACTURA_CO=FECHA_FACTURA_CF)=0)';
                  end;

             //ORDEN
             if cOrden.ItemIndex=0 then
                CadSql:=CadSql + ' ORDER BY CLIENTE_CF, NUMERO_FACTURA_CF'
             else if cOrden.ItemIndex=1 then
                     CadSql:=CadSql + ' ORDER BY NUMERO_FACTURA_CF'
                  else
                      CadSql:=CadSql + ' ORDER BY FECHA_FACTURA_CF, NUMERO_FACTURA_CF';

             if cTipoListado.ItemIndex=0 then
             begin
                  with TQRFacturasTabla.Create(Application) do  //Creamos dinámicamente el report
                  try
                     tEmpresa.Caption:=cEmpresa.Text + '-' + tNomEmpresa.Caption;
                     tClientes.Caption:=cClienteDesde.Text + '-' + cClienteHasta.Text;
                     tFacturas.Caption:=cFacturaDesde.Text + '-' + cFacturaHasta.Text;
                     tFechaFacturas.Caption:=cFechaDesde.Text + '-' + cFechaHasta.Text;
                     tTipoFacturas.Caption:=cTipoFactura.Text;

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
                  with TQRFacturasFicha.Create(Application) do  //Creamos dinámicamente el report
                  try
                     tEmpresa.Caption:=cEmpresa.Text + '-' + tNomEmpresa.Caption;
                     tClientes.Caption:=cClienteDesde.Text + '-' + cClienteHasta.Text;
                     tFacturas.Caption:=cFacturaDesde.Text + '-' + cFacturaHasta.Text;
                     tFechaFacturas.Caption:=cFechaDesde.Text + '-' + cFechaHasta.Text;
                     tTipoFacturas.Caption:=cTipoFactura.Text;

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
function TListadoFacturas.ValidarSeleccion(): Boolean;
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
          MessageDlg (Chr(13) + 'La fecha desde es incorrecta', mtError,[mbOk],0);
          cFechaDesde.SetFocus;
          Result:=False;
     end
     else if not EsFecha(cFechaHasta.Text) then
     begin
          MessageDlg (Chr(13) + 'La fecha hasta es incorrecta', mtError,[mbOk],0);
          cFechaHasta.SetFocus;
          Result:=False;
     end
     else if cFechaDesde.Date>cFechaHasta.Date then
     begin
          MessageDlg (Chr(13) + 'Rango de fechas incorrecto', mtError,[mbOk],0);
          cFechaDesde.SetFocus;
          Result:=False;
     end;
end;

//---------------------- PONE EL COLOR DEL FOCO --------------------------------
procedure TListadoFacturas.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clMoneyGreen;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TListadoFacturas.ColorExit(Sender: TObject);
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
procedure TListadoFacturas.ColorExitSinCeros(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clWindow
     else if Sender is TComboBox then           //Si el componente es un TComboBox
             TComboBox(Sender).Color:=clWindow;
end;

//------------------------- CREACION DEL FORMULARIO ----------------------------
procedure TListadoFacturas.FormCreate(Sender: TObject);
begin
     Top:=1;
     Left:=0;
     cFechaDesde.Text:='01/01/' + IntToStr(Year(date()));
     cFechaHasta.Date:=Date();
     cEmpresa.Text:=EmpresaGlobal;
end;

//------------------------- CIERRE DEL FORMULARIO ------------------------------
procedure TListadoFacturas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

//------------------------- BOTON SALIR ----------------------------------------
procedure TListadoFacturas.BSalirClick(Sender: TObject);
begin
     Close;
end;

//------------------------ AL CAMBIAR LA EMPRESA -------------------------------
procedure TListadoFacturas.cEmpresaChange(Sender: TObject);
begin
     tNomEmpresa.Caption:= NomEmpresa(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TListadoFacturas.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TListadoFacturas.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresa.Text:=CodEmpresa;
     cEmpresa.Setfocus;
end;

end.
