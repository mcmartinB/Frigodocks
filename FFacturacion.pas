unit FFacturacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ActnMan, ActnCtrls, ExtCtrls, StdCtrls, ComCtrls, DB,
  DBTables, Mask, DBCtrls,
  Buttons, IniFiles, DateUtils, DBClient, Grids, DBGrids, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxCore, cxDateUtils, dxSkinsCore, dxSkinBlue, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, Menus, dxSkinsdxBarPainter, dxBar, cxClasses,
  cxButtons, SimpleSearch;

type
  TFacturacion = class(TForm)
    BarraEstado: TStatusBar;
    Timer1: TTimer;
    PanelClaves: TPanel;
    GroupBox1: TGroupBox;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    GroupBox2: TGroupBox;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    cFechaDesde: TcxDateEdit;
    cFechaHasta: TcxDateEdit;
    Panel1: TPanel;
    StaticText12: TStaticText;
    cEmpresa: TEdit;
    tNomEmpresa: TPanel;
    GroupBox3: TGroupBox;
    StaticText5: TStaticText;
    cFechaFactura: TcxDateEdit;
    StaticText6: TStaticText;
    cTipoFacturacion: TComboBox;
    cClienteDesde: TEdit;
    cClienteHasta: TEdit;
    StaticText7: TStaticText;
    cPeriodo: TComboBox;
    QClientes: TQuery;
    QEmpresas: TQuery;
    QTarifas: TQuery;
    QPeriodicosFact: TQuery;
    QCabeceraEntradas: TQuery;
    QAux: TQuery;
    QLineaEntradas: TQuery;
    QCabeceraSalidas: TQuery;
    QLineaSalidas: TQuery;
    QCabeceraFacturas: TQuery;
    QLineaFacturas: TQuery;
    QTarifasempresa_t: TStringField;
    QTarifascodigo_t: TStringField;
    QTarifasprecio_congelacion_m3_t: TFloatField;
    QTarifasprecio_congelacion_kg_t: TFloatField;
    QTarifasprecio_refrigera_m3_t: TFloatField;
    QTarifastipo0_t: TFloatField;
    QTarifastipo1_t: TFloatField;
    QTarifastipo2_t: TFloatField;
    QTarifastipo3_t: TFloatField;
    QTarifastipo4_t: TFloatField;
    QTarifasprecio_hora1_t: TFloatField;
    QTarifasprecio_hora2_t: TFloatField;
    QTarifasfrio_palet_t: TFloatField;
    QTarifasmanejo_palet_t: TFloatField;
    QClientesempresa_c: TStringField;
    QClientescodigo_c: TStringField;
    QClientesnombre_juridico_c: TStringField;
    QClientesnombre_comercial_c: TStringField;
    QClientesdomicilio_c: TStringField;
    QClientescp_c: TStringField;
    QClientespoblacion_c: TStringField;
    QClientesdomicilio_correo_c: TStringField;
    QClientescp_correo_c: TStringField;
    QClientespoblacion_correo_c: TStringField;
    QClientestelefono1_c: TStringField;
    QClientestelefono2_c: TStringField;
    QClientesfax_c: TStringField;
    QClientescif_dni_c: TStringField;
    QClientesorigen_c: TStringField;
    QClientesimp_alquiler_oficina_c: TFloatField;
    QClientesimp_thermoking_c: TFloatField;
    QClientesprecio_kw_thermo_c: TFloatField;
    QClientesimp_cargo_fijo_c: TFloatField;
    QClientesprecio_horas_ent_sal_c: TFloatField;
    QClientesimp_minimo_facturacion_c: TFloatField;
    QClientesperiodo_factura_c: TStringField;
    QClientestarifa_c: TStringField;
    QClientesm3_facturacion_c: TIntegerField;
    QClientesm3_refrigeracion_c: TIntegerField;
    QClientesdias_pago_c: TSmallintField;
    QClientesforma_pago_c: TStringField;
    QClientescuenta_cliente_c: TStringField;
    QClientesnombre_banco_c: TStringField;
    QClientesdomicilio_banco_c: TStringField;
    QClientescp_banco_c: TStringField;
    QClientespoblacion_banco_c: TStringField;
    QClientesultimo_stock_c: TFloatField;
    QClientesnumerador_lotes_c: TIntegerField;
    QClientesnom_autorizado1_c: TStringField;
    QClientescif_autorizado1_c: TStringField;
    QClientesfecha_autorizado1_c: TStringField;
    QClientesnom_autorizado2_c: TStringField;
    QClientescif_autorizado2_c: TStringField;
    QClientesfecha_autorizado2_c: TStringField;
    QClientescomentario_c: TStringField;
    QClientesvalor_stock_c: TFloatField;
    QClientesimp_pendiente_pago_c: TFloatField;
    QClientesmercancia_retenida_c: TStringField;
    QClientestlfmovil_c: TStringField;
    QClientesemail_c: TStringField;
    QClientesweb_c: TStringField;
    QClientesprecio_hor_clima_c: TFloatField;
    QClientescuenta_contable_c: TStringField;
    QClientescodigo_pago_c: TStringField;
    QClientesnotas_c: TMemoField;
    QClientesultimo_stock_pal_c: TFloatField;
    QCabeceraFacturasempresa_cf: TStringField;
    QCabeceraFacturascliente_cf: TStringField;
    QCabeceraFacturasnumero_factura_cf: TIntegerField;
    QCabeceraFacturasfecha_factura_cf: TStringField;
    QCabeceraFacturasfecha_vencimiento_cf: TStringField;
    QCabeceraFacturasfecha_desde_cf: TStringField;
    QCabeceraFacturasfecha_hasta_cf: TStringField;
    QCabeceraFacturasimporte_bruto_cf: TFloatField;
    QCabeceraFacturasporcentaje_iva_cf: TFloatField;
    QCabeceraFacturasimporte_iva_cf: TFloatField;
    QCabeceraFacturasimporte_neto_cf: TFloatField;
    QCabeceraFacturastipo_cf: TStringField;
    QCabeceraFacturasnum_contabilizacion_cf: TIntegerField;
    QCabeceraFacturasultimo_stock_cf: TFloatField;
    QCabeceraFacturasfecha_contabilizacion_cf: TStringField;
    QCabeceraFacturasporcentaje_retencion_cf: TFloatField;
    QCabeceraFacturasimporte_retencion_cf: TFloatField;
    QClientesretencion_c: TFloatField;
    cLupaEmpresas: TSimpleSearch;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    bAceptar: TdxBarLargeButton;
    bSalir: TdxBarLargeButton;
    qMovimientosExtra: TQuery;
    QMovimientosEnt: TQuery;
    QMovimientosSal: TQuery;
    QClientesprecio_mvto_lote_c: TCurrencyField;
    QConsumosElectricos: TQuery;
    QConsumoFacturas: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure Aceptar(Sender: TObject);
    procedure Salir(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ColorExitRellenaCeros(Sender: TObject);
    procedure cEmpresaChange(Sender: TObject);
    procedure DesActivarColorFoco(Sender: TObject);
    procedure ActivarColorFoco(Sender: TObject);
    procedure cPeriodoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cTipoFacturacionKeyPress(Sender: TObject; var Key: Char);
    procedure cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaEmpresasClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cPeriodoKeyPress(Sender: TObject; var Key: Char);
    procedure SinFlechasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);

  private
    {Private declarations}

    procedure Mensaje(Texto: String );
    function  Validar():Boolean;
    procedure Facturar();
    procedure DatosEmpresa(Var NumFactura: Integer; Var Iva: Real);
    function  EsArticuloPalet(Empresa, Familia, Articulo: String):Boolean;
    procedure MercanciaRetenidaCliente(Empresa, Cliente: String);
    function  SumarHorMin(Horas1, Horas2: Real):Real;

    function EntradaDiaSiguiente(Empresa:string; Fecha: TDate): Real;
  public
    { Public declarations }

  end;

var
   Facturacion: TFacturacion;

implementation

uses UGLobal, MBaseDatos, DM, LFactura;

{$R *.dfm}

//------------------------ CREACION DEL FORMULARIO -----------------------------
procedure TFacturacion.FormCreate(Sender: TObject);
begin
     Top:=1;
     Left:=0;

     cFechaFactura.Date:=Date();
     cFechaHasta.Date:=Date();

     cEmpresa.Text:=EmpresaGlobal;

     //Inicialmente Informativa
     cTipoFacturacion.ItemIndex:=0;

     //Preparo la tabla de Clientes
     QClientes.Close;
     QClientes.SQL.Clear;
     QClientes.SQL.Add(' SELECT * FROM CLIENTES ' +
                       ' WHERE EMPRESA_C=:Empresa ' +
                       ' AND CODIGO_C BETWEEN :ClienteDesde and :ClienteHasta ' +
                       ' AND PERIODO_FACTURA_C=:PeriodoFactura ' +
                       ' ORDER BY CODIGO_C');
     QClientes.Prepare;

     //Preparo la tabla de Empresas
     QEmpresas.Close;
     QEmpresas.SQL.Clear;
     QEmpresas.SQL.Add(' SELECT * FROM EMPRESAS ' +
                       ' WHERE CODIGO_E=:Empresa ');
     QEmpresas.Prepare;

     //Preparo la tabla de Tarifas
     QTarifas.Close;
     QTarifas.SQL.Clear;
     QTarifas.SQL.Add(' SELECT * FROM TARIFAS ' +
                      ' WHERE EMPRESA_T=:Empresa ' +
                      ' AND CODIGO_T=:Codigo');
     QTarifas.Prepare;
end;

//------------------------ CIERRE DEL FORMULARIO -------------------------------
procedure TFacturacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

//----------------------- CIERRRE DEL QUERY DEL FORMULARIO ---------------------
procedure TFacturacion.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
     CanClose:=True;
end;

//--------------------- MENSAJES DE LA BARRA DE ESTADO -------------------------
procedure TFacturacion.Mensaje(Texto: String );
begin
     if BarraEstado.SimplePanel then
        BarraEstado.SimpleText:=Texto
     else if BarraEstado.Panels.Count=0 then
          begin
               BarraEstado.SimplePanel:=True;
               BarraEstado.SimpleText:=Texto;
          end
          else
              BarraEstado.Panels[0].Text:=Texto;
     Timer1.Enabled:=false;
     Timer1.Enabled:=true;
end;

//--------------------- TIMER PARALOS MENSAJES ---------------------------------
procedure TFacturacion.Timer1Timer(Sender: TObject);
begin
     if BarraEstado.SimplePanel then
         BarraEstado.SimpleText:=''
     else if BarraEstado.Panels.Count = 0 then
          begin
               BarraEstado.SimplePanel:=True;
               BarraEstado.SimpleText:='';
          end
          else
              BarraEstado.Panels[0].Text:='';
     Timer1.Enabled:=False;
end;

//------------------------ BOTON ACEPTAR ----------------------------------------
procedure TFacturacion.Aceptar(Sender: TObject);
begin
     Application.ProcessMessages;
     if Validar() then   //Comprobamos que los datos son correctos
     begin
          try
             BSalir.Enabled:=False;

             //Abrimos Clientes
             QClientes.Close;
             QClientes.ParamByName('Empresa').AsString:=RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I');
             QClientes.ParamByName('ClienteDesde').AsString:=RellenarCeros(cClienteDesde.Text,cClienteDesde.MaxLength,'I');
             QClientes.ParamByName('ClienteHasta').AsString:=RellenarCeros(cClienteHasta.Text,cClienteHasta.MaxLength,'I');
             QClientes.ParamByName('PeriodoFactura').AsString:=copy(cPeriodo.Text,1,1);
             QClientes.Open;
             if QClientes.IsEmpty then
                MessageDlg (Chr(13) + 'No existe ningún cliente incluido en los rangos indicados', mtError,[mbOk],0)
             else
                 Facturar();
             QClientes.Close;
             BSalir.Enabled:=True;
          except
                on E:Exception do
                     begin
                          CapturaErrores(E);
                          BSalir.Enabled:=True;
                     end;
          end;
     end;
end;

//------------ LEEMOS EL NUMERADOR DE FACTURAS Y EL IVA DE LA EMPRESA ----------
procedure TFacturacion.DatosEmpresa(Var NumFactura: Integer; Var Iva: Real);
begin
     QEmpresas.Close;
     QEmpresas.ParamByName('Empresa').AsString:=cEmpresa.Text;
     QEmpresas.Open;
     if not QEmpresas.IsEmpty then
     begin
          NumFactura:=QEmpresas.FieldByName('Num_Facturas_e').AsInteger;
          Iva:=QEmpresas.FieldByName('Iva_e').AsFloat;
     end;
     QEmpresas.Close;
end;

//----------------------------- SALIR ------------------------------------------
procedure TFacturacion.Salir(Sender: TObject);
begin
     Close;
end;

//-------------------------- VALIDACION DE DATOS CABECERA ----------------------
function TFacturacion.Validar():Boolean;
begin
     Result:=True;
     cFechaDesde.PostEditValue;
     cFechaHasta.PostEditValue;
     cFechaFactura.PostEditValue;
     if cEmpresa.Text='' then  //Empresa
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'Falta el código de empresa', mtError,[mbOk],0);
          cEmpresa.SetFocus;
     end
     else if tNomEmpresa.Caption='' then  //Empresa
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'La empresa no existe', mtError,[mbOk],0);
          cEmpresa.SetFocus;
     end
     else if cPeriodo.ItemIndex<0 then   //Periodo Facturacion
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'Periodo de facturación: D-Diaria, S-Semanal, Q-Quincenal o M-Mensual', mtError,[mbOk],0);
          cPeriodo.SetFocus;
     end
     else if cClienteDesde.Text='' then  //Cliente Desde
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'Falta cliente desde', mtError,[mbOk],0);
          cClienteDesde.SetFocus;
     end
     else if cClienteHasta.Text='' then  //Cliente Hasta
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'Falta cliente hasta', mtError,[mbOk],0);
          cClienteHasta.SetFocus;
     end
     else if RellenarCeros(cClienteDesde.Text,cClienteDesde.MaxLength,'I') > RellenarCeros(cClienteHasta.Text,cClienteHasta.MaxLength,'I') then  //Rango de Clientes
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'Rango de clientes incorrecto', mtError,[mbOk],0);
          cClienteDesde.SetFocus;
     end
     else if not EsFecha(cFechaDesde.Text) then  //Fecha Desde
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'Fecha de movimiento desde incorrecta', mtError,[mbOk],0);
          cFechaDesde.SetFocus;
     end
     else if not EsFecha(cFechaHasta.Text) then  //Fecha Hasta
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'Fecha de movimiento hasta incorrecta', mtError,[mbOk],0);
          cFechaHasta.SetFocus;
     end
     else if cFechaDesde.Date > cFechaHasta.Date then  //Rango de fechas de movimiento
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'Rango de fechas de movimiento incorrecto', mtError,[mbOk],0);
          cFechaDesde.SetFocus;
     end
     else if not EsFecha(cFechaFactura.Text) then  //Fecha Factura
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'Fecha de factura incorrecta', mtError,[mbOk],0);
          cFechaFactura.SetFocus;
     end
     else if cTipoFacturacion.ItemIndex<0 then    //Tipo de Facturacion
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'Tipo de facturación: I-Informativa o D-Definitiva', mtError,[mbOk],0);
          cTipoFacturacion.SetFocus;
     end;
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TFacturacion.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then        //F5 graba
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TFacturacion.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13 then
     begin
          Key:=#0;
          PostMessage(Handle,WM_NEXTDLGCTL,0,0);
     end
     else if Key=#27 then
          begin
               Key:=#0;
               Close;
          end;
end;

//---------------------- QUITA EL COLOR DE FOCO DE LOS CAMPOS CLAVE ------------
procedure TFacturacion.ColorExitRellenaCeros(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
         TEdit(Sender).Color:=clWindow;
          if Length(TEdit(Sender).Text)>0 then
             TEdit(Sender).Text:=RellenarCeros(TEdit(Sender).Text,TEdit(Sender).MaxLength,'I');
     end;
end;

//----------------------- CAMBIO DE LA EMPRESA ---------------------------------
procedure TFacturacion.cEmpresaChange(Sender: TObject);
begin
     tNomEmpresa.Caption:=NomEmpresa(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
end;

//----------------------- ACTIVA EL COLOR DEL FOCO -----------------------------
procedure TFacturacion.ActivarColorFoco(Sender: TObject);
begin
     if Sender is  TEdit then        //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clMoneygreen
     else if Sender is  TcxDateEdit then        //Si el componente es un TcxDateEdit
             TcxDateEdit(Sender).Style.Color:=clMoneygreen
          else if Sender is  TComboBox then        //Si el componente es un TcxDateEdit
                  TComboBox(Sender).Color:=clMoneygreen;
end;

//----------------------- DESACTIVA EL COLOR DEL FOCO -----------------------------
procedure TFacturacion.DesActivarColorFoco(Sender: TObject);
begin
     if Sender is  TEdit then        //Si el componente es un TEdit
        TEdit(Sender).Color:=clWindow
     else if Sender is  TcxDateEdit then        //Si el componente es un TcxDateEdit
             TcxDateEdit(Sender).Style.Color:=clWindow
          else if Sender is  TComboBox then        //Si el componente es un TcxDateEdit
                  TComboBox(Sender).Color:=clWindow;
end;

//--------- PULSACION DE TECLAS EN EL COMBO DE PERIODOS DE FACTURACION ---------
procedure TFacturacion.cPeriodoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=68) then  //D
     begin
          Key:=0;
          cPeriodo.ItemIndex:=0;
          cPeriodo.Text:='DIARIA';
     end
     else if (Key=77) then //M
     begin
          Key:=0;
          cPeriodo.ItemIndex:=3;
          cPeriodo.Text:='MENSUAL';
     end
     else if (Key=81) then  //Q
     begin
          Key:=0;
          cPeriodo.ItemIndex:=2;
          cPeriodo.Text:='QUINCENAL';
     end
     else if (Key=83) then //S
     begin
          Key:=0;
          cPeriodo.ItemIndex:=1;
          cPeriodo.Text:='SEMANAL';
     end
     else
         Key:=0;
     Application.ProcessMessages;
end;

//--------- PULSACION DE TECLAS EN EL COMBO DE PERIODOS DE FACTURACION ---------
procedure TFacturacion.cPeriodoKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key<>#68) and (Key<>#77) and (Key<>#81) and (Key<>#83) and (Key<>#8) then   //D, M, D, S, DELETE
     begin
          Key:=#0;
          Application.ProcessMessages;
     end;
end;

//--------- PULSACION DE TECLAS EN EL COMBO DE PERIODOS DE FACTURACION ---------
procedure TFacturacion.SinFlechasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=37) or (Key=38) or (Key=39) or (Key=40) then   //FLECHAS
     begin
          Key:=0;
          Application.ProcessMessages;
     end;
end;

//------------------- COMPRUEBA SI LA UNIDAD DE MEDIDA ES EL PALET -------------
function TFacturacion.EntradaDiaSiguiente(Empresa:string; Fecha: TDate): Real;
Var QAux: TQuery;
begin
     Result:=0;
     QAux:=TQuery.Create(nil);
     try
        With QAux do
        begin
             DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
             SQL.Add(' SELECT TOTAL_ENTRADO_TSX ' +
                     ' FROM TEMP_STOCK_X_DIA ' +
                     ' WHERE EMPRESA_TSX=' + QuotedStr(Empresa) +
                     ' AND FECHA_TSX=' + QuotedStr(AnyoMesDia(DateToStr(Fecha))) );
             Open;
             if not IsEmpty then
               Result := FieldByName('TOTAL_ENTRADO_TSX').AsFloat;
        end;
     finally
            QAux.Close;
            FreeAndNil(QAux);
     end;
end;

function TFacturacion.EsArticuloPalet(Empresa, Familia, Articulo: String):Boolean;
Var
   QAux: TQuery;
begin
     Result:=False;
     QAux:=TQuery.Create(nil);
     try
        With QAux do
        begin
             DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
             SQL.Add(' SELECT * ' +
                     ' FROM ARTICULOS ' +
                     ' WHERE EMPRESA_A=' + QuotedStr(Empresa) +
                     ' AND FAMILIA_A=' + QuotedStr(Familia) +
                     ' AND CODIGO_A=' + QuotedStr(Articulo));
             Open;
             if FieldByName('Unidad_Medida_a').AsString='P' then
                Result:=True;
        end;
     finally
            QAux.Close;
            FreeAndNil(QAux);
     end;
end;

//-- ACTUALIZA EL VALOR DE MERCANCIA RETENIDA DEL CLIENTE ----------------------
procedure TFacturacion.MercanciaRetenidaCliente(Empresa, Cliente: String);
Var
   PendientePago: String;
   QAux: TQuery;
begin
     QAux:=TQuery.Create(nil);
     try
        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

        //Leemos el valor del stock y el del importe pendiente de pagar
        QAux.SQL.Clear;
        QAux.SQL.Add(' SELECT VALOR_STOCK_C, IMP_PENDIENTE_PAGO_C' +
                     ' FROM CLIENTES' +
                     ' WHERE EMPRESA_C=' + QuotedStr(Empresa) +
                     ' AND CODIGO_C=' + QuotedStr(Cliente));
        QAux.Open;
        if QAux.FieldByName('Valor_Stock_c').AsFloat >= QAux.FieldByName('Imp_pendiente_Pago_c').AsFloat then
           PendientePago:='N'
        else
            PendientePago:='S';
        QAux.Close;

        //Modificamos el Valor de Mercancia Retenida
        QAux.SQL.Clear;
        QAux.SQL.Add(' UPDATE CLIENTES' +
                     ' SET MERCANCIA_RETENIDA_C=' + QuotedStr(PendientePago) +
                     ' WHERE EMPRESA_C=' + QuotedStr(Empresa) +
                     ' AND CODIGO_C=' + QuotedStr(Cliente));
        QAux.ExecSQL;
     finally
            QAux.Close;
            FreeAndNil(QAux);
     end;
end;

//---------------------------- FACTURACION -------------------------------------
procedure TFacturacion.Facturar();
Var
   NumFactura, NumFacturaDesde, NumLineaFactura, NumConsumoFactura, Dias, TotalMov, Longcadena: Integer;
   TotalTipo0, TotalTipo1, TotalTipo2, TotalTipo3, TotalTipo4, TotalEntrado, TotalImpEnt, TotalHorEnt, TEntradoTsd: Real;
   TotalSalido, TotalSalidoMismoDia, TotalImpSal, TotalHorSal, TSacadoTsd, UltimoStockTsd, UltimoStockPalet, PEntrado, PSacado: Real;
   Iva, ImporteNeto, ImporteIva, ImporteRetencion, ImporteBruto, ImporteAux, CantidadAux, PrecioHora1, PrecioHora2: Real;
   Descripcion, UnidadDiaria, DescripcionLF, DescripcionMov, Cadena, Subcadena: String;
   Definitiva, ExistenConceptos, ImpTituloConservExistDiarias, swPrimera: Boolean;
   FechaVencimiento, FechaInicio, FechaFin, FechaTsd, FechaSiguiente: TDate;
   TotalManejoPalet, TarifaDiaria, Entradas, Salidas, PEntradaDiaSiguiente, TarifaMovExtra: Real;
begin
    try
       Definitiva:=cTipoFacturacion.ItemIndex=1; //Si ItemIndex=0 -> Informativa y si ItemIndex=1 -> Definitiva
       DatosEmpresa(NumFactura, Iva);
       NumFacturaDesde:=NumFactura;

       //Borramos las facturas de la tabla temporal
       if not Definitiva then    //Informativa
       begin
            QConsumoFacturas.Close;
            QConsumoFacturas.SQL.Clear;
            QConsumoFacturas.SQL.Add('DELETE FROM TEMP_CONSUMO_ELECTRICO_FACTURAS ');
            QConsumoFacturas.ExecSQL;

            QLineaFacturas.Close;
            QLineaFacturas.SQL.Clear;
            QLineaFacturas.SQL.Add('DELETE FROM TEMP_LINEA_FACTURAS ');
            QLineaFacturas.ExecSQL;

            QCabeceraFacturas.Close;
            QCabeceraFacturas.SQL.Clear;
            QCabeceraFacturas.SQL.Add('DELETE FROM TEMP_CABECERA_FACTURAS ');
            QCabeceraFacturas.ExecSQL;
       end;

       //Para cada Cliente
       While not QClientes.Eof do
       begin
            QCabeceraFacturas.Close;
            QCabeceraFacturas.SQL.Clear;
            QLineaFacturas.Close;
            QLineaFacturas.SQL.Clear;
            QConsumoFacturas.Close;
            QConsumoFacturas.SQL.Clear;
            if Definitiva then  //Definitiva
            begin
                 QCabeceraFacturas.SQL.Add('SELECT * FROM CABECERA_FACTURAS ');
                 QLineaFacturas.SQL.Add('SELECT * FROM LINEA_FACTURAS ');
                 QConsumoFacturas.SQL.Add('SELECT * FROM CONSUMO_ELECTRICO_FACTURAS ');
            end
            else   //Informativa
            begin
                 QLineaFacturas.SQL.Add('SELECT * FROM TEMP_LINEA_FACTURAS ');
                 QCabeceraFacturas.SQL.Add('SELECT * FROM TEMP_CABECERA_FACTURAS ');
                 QConsumoFacturas.SQL.Add('SELECT * FROM TEMP_CONSUMO_ELECTRICO_FACTURAS ');
            end;
            QCabeceraFacturas.Open;
            QLineaFacturas.Open;
            QConsumoFacturas.Open;

            NumLineaFactura:=0;  //Inicialmente no hay lineas
            ImporteNeto:=0;
            ImporteBruto:=0;
            FechaVencimiento:=IncDay(cFechaFactura.Date,QClientes.FieldByName('dias_pago_c').AsInteger);

            //Abrimos la tabla Tarifas
            QTarifas.Close;
            QTarifas.ParamByName('Empresa').AsString:=QClientes.FieldByName('Empresa_c').AsString;
            QTarifas.ParamByName('Codigo').AsString:=QClientes.FieldByName('Tarifa_c').AsString;
            QTarifas.Open;

            //Grabamos la cabecera de la factura
            QCabeceraFacturas.Insert;
            QCabeceraFacturas.FieldByName('Empresa_cf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
            QCabeceraFacturas.FieldByName('Cliente_cf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
            QCabeceraFacturas.FieldByName('Numero_Factura_cf').AsInteger:=NumFactura;
            QCabeceraFacturas.FieldByName('Fecha_Factura_cf').AsString:=AnyoMesDia(cFechaFactura.Text);
            QCabeceraFacturas.FieldByName('Fecha_Vencimiento_cf').AsString:=AnyoMesDia(FechaVencimiento);
            QCabeceraFacturas.FieldByName('Fecha_Desde_cf').AsString:=AnyoMesDia(cFechaDesde.Text);
            QCabeceraFacturas.FieldByName('Fecha_Hasta_cf').AsString:=AnyoMesDia(cFechaHasta.Text);
            QCabeceraFacturas.FieldByName('Importe_Bruto_cf').AsFloat:=0;
            QCabeceraFacturas.FieldByName('Porcentaje_Iva_cf').AsFloat:=Iva;
            QCabeceraFacturas.FieldByName('Importe_Iva_cf').AsFloat:=0;
            QCabeceraFacturas.FieldByName('Importe_Neto_cf').AsFloat:=0;
            QCabeceraFacturas.FieldByName('Tipo_cf').AsString:='1';
            QCabeceraFacturas['Num_Contabilizacion_cf']:=NULL;
            QCabeceraFacturas.FieldByName('Ultimo_Stock_cf').AsFloat:=QClientes.FieldByName('ultimo_stock_c').AsFloat;
            QCabeceraFacturas.FieldByName('Fecha_Contabilizacion_cf').AsString:='';
            QCabeceraFacturas.FieldByName('porcentaje_retencion_cf').AsFloat:=QClientes.FieldByName('retencion_c').Asfloat;
            QCabeceraFacturas.FieldByName('Importe_retencion_cf').AsFloat:=0;
            QCabeceraFacturas.Post;

            //M3 CONGELACION (OK)
            if (QClientes.FieldByName('M3_Facturacion_c').AsInteger<>0) and (QTarifas.FieldByName('Precio_Congelacion_M3_t').AsFloat<>0) then
            begin
                 Inc(NumLineaFactura);   //Incrementamos el nº de linea de la factura

                 ImporteAux:=Redondear(QClientes.FieldByName('M3_Facturacion_c').AsInteger * QTarifas.FieldByName('Precio_Congelacion_M3_t').AsFloat,2);
                 ImporteNeto:=ImporteNeto + ImporteAux;

                 QLineaFacturas.Insert;
                 QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                 QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                 QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                 QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                 QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                 QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                 QLineaFacturas.FieldByName('Descripcion_lf').AsString:='M3 CONGELACION';
                 QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=QClientes.FieldByName('M3_Facturacion_c').AsInteger;
                 QLineaFacturas.FieldByName('Unidad_lf').AsString:='m3';
                 QLineaFacturas.FieldByName('Precio_lf').AsFloat:=QTarifas.FieldByName('Precio_Congelacion_M3_t').AsFloat;
                 QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                 QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                 QLineaFacturas.Post;
            end;
            //M3 REFRIGERACION (OK)
            if (QClientes.FieldByName('M3_refrigeracion_c').AsInteger<>0) and (QTarifas.FieldByName('Precio_refrigera_m3_t').AsFloat<>0) then
            begin
                 Inc(NumLineaFactura);   //Incrementamos el nº de linea de la factura

                 ImporteAux:=Redondear(QClientes.FieldByName('M3_refrigeracion_c').AsInteger * QTarifas.FieldByName('Precio_refrigera_m3_t').AsFloat,2);
                 ImporteNeto:=ImporteNeto + ImporteAux;

                 QLineaFacturas.Insert;
                 QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                 QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                 QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                 QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                 QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                 QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                 QLineaFacturas.FieldByName('Descripcion_lf').AsString:='M3 REFRIGERACION';
                 QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=QClientes.FieldByName('M3_refrigeracion_c').AsInteger;
                 QLineaFacturas.FieldByName('Unidad_lf').AsString:='m3';
                 QLineaFacturas.FieldByName('Precio_lf').AsFloat:=QTarifas.FieldByName('Precio_refrigera_m3_t').AsFloat;
                 QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                 QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                 QLineaFacturas.Post;
            end;
            //ALQUILER OFICINA (OK)
            if QClientes.FieldByName('imp_alquiler_oficina_c').AsFloat<>0 then
            begin
                 Inc(NumLineaFactura);   //Incrementamos el nº de linea de la factura

                 ImporteAux:=QClientes.FieldByName('imp_alquiler_oficina_c').AsFloat;
                 ImporteNeto:=ImporteNeto + ImporteAux;

                 QLineaFacturas.Insert;
                 QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                 QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                 QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                 QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                 QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                 QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                 QLineaFacturas.FieldByName('Descripcion_lf').AsString:='SERVICIO OFICINA';
                 QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                 QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                 QLineaFacturas.Post;
            end;
            //SERVICIO THERMOKING (OK)
            if QClientes.FieldByName('imp_thermoking_c').AsFloat<>0 then
            begin
                 Inc(NumLineaFactura);   //Incrementamos el nº de linea de la factura

                 ImporteAux:=QClientes.FieldByName('imp_thermoking_c').AsFloat;
                 ImporteNeto:=ImporteNeto + ImporteAux;

                 QLineaFacturas.Insert;
                 QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                 QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                 QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                 QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                 QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                 QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                 QLineaFacturas.FieldByName('Descripcion_lf').AsString:='SERVICIO THERMOKING';
                 QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                 QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                 QLineaFacturas.Post;
            end;
            //CARGO FIJO (OK)
            if QClientes.FieldByName('imp_cargo_fijo_c').AsFloat<>0 then
            begin
                 Inc(NumLineaFactura);   //Incrementamos el nº de linea de la factura

                 ImporteAux:=QClientes.FieldByName('imp_cargo_fijo_c').AsFloat;
                 ImporteNeto:=ImporteNeto + ImporteAux;

                 QLineaFacturas.Insert;
                 QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                 QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                 QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                 QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                 QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                 QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                 QLineaFacturas.FieldByName('Descripcion_lf').AsString:='CARGO FIJO';
                 QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                 QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                 QLineaFacturas.Post;
            end;

            //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            //++++++++++++++++    DATOS DEL PERIODICO DE FACTURACION   ++++++++
            //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            QPeriodicosFact.Close;
            QPeriodicosFact.SQL.Clear;
            QPeriodicosFact.SQL.Add(' SELECT * FROM PERIODICOS_FACTURACION ' +
                                    ' WHERE EMPRESA_PF=' + QuotedStr(QClientes.FieldByName('Empresa_c').AsString) +
                                    ' AND CLIENTE_PF=' + QuotedStr(QClientes.FieldByName('Codigo_c').AsString) +
                                    ' AND STATUS_FACTURA_PF=' + QuotedStr('N'));
            QPeriodicosFact.Open;
            if not QPeriodicosFact.IsEmpty then  //Si existe Periodico de Facturacion
            begin
                 PrecioHora1:=0;
                 PrecioHora2:=0;
                 //Si el Periodico de Facturacion tiene Tarifa
                 if QPeriodicosFact.FieldByName('Tarifa_pf').AsString<>'' then
                 begin
                      //Abrimos la tabla Tarifas
                      QTarifas.Close;
                      QTarifas.ParamByName('Empresa').AsString:=QPeriodicosFact.FieldByName('Empresa_pf').AsString;
                      QTarifas.ParamByName('Codigo').AsString:=QPeriodicosFact.FieldByName('Tarifa_pf').AsString;
                      QTarifas.Open;
                      PrecioHora1:=QTarifas.FieldByName('Precio_Hora1_t').AsFloat;
                      PrecioHora2:=QTarifas.FieldByName('Precio_Hora2_t').AsFloat;
                      QTarifas.Close;
                 end;
                 //HORAS CAPATAZ (HORAS 1)  (OK)
                 if (QPeriodicosFact.FieldByName('Horas1_pf').AsFloat<>0) and (PrecioHora1<>0)  then
                 begin
                      Inc(NumLineaFactura);   //Incrementamos el nº de linea de la factura

                      ImporteAux:=Redondear((ParteEntera(QPeriodicosFact.FieldByName('Horas1_pf').AsFloat) * PrecioHora1) +
                                           ((StrToInt(RellenarCeros(ParteDecimal(QPeriodicosFact.FieldByName('Horas1_pf').AsFloat),2,'D'))/60)* PrecioHora1), 2);
                      ImporteNeto:=ImporteNeto + ImporteAux;

                      QLineaFacturas.Insert;
                      QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                      QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                      QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                      QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                      QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                      QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                      QLineaFacturas.FieldByName('Descripcion_lf').AsString:='HORAS CAPATAZ';
                      QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=QPeriodicosFact.FieldByName('Horas1_pf').AsFloat;
                      QLineaFacturas.FieldByName('Unidad_lf').AsString:='hor';
                      QLineaFacturas.FieldByName('Precio_lf').AsFloat:=PrecioHora1;
                      QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                      QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                      QLineaFacturas.Post;
                 end;
                 //HORAS PEON-CARRETILLA (HORAS 2) (OK)
                 if (QPeriodicosFact.FieldByName('Horas2_pf').AsFloat<>0) and (PrecioHora2<>0)  then
                 begin
                      Inc(NumLineaFactura);   //Incrementamos el nº de linea de la factura

                      ImporteAux:=Redondear((ParteEntera(QPeriodicosFact.FieldByName('Horas2_pf').AsFloat) * PrecioHora2) +
                                           ((StrToInt(RellenarCeros(ParteDecimal(QPeriodicosFact.FieldByName('Horas2_pf').AsFloat),2,'D'))/60)* PrecioHora2), 2);
                      ImporteNeto:=ImporteNeto + ImporteAux;

                      QLineaFacturas.Insert;
                      QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                      QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                      QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                      QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                      QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                      QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                      QLineaFacturas.FieldByName('Descripcion_lf').AsString:='HORAS PEON-CARRETILLA';
                      QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=QPeriodicosFact.FieldByName('Horas2_pf').AsFloat;
                      QLineaFacturas.FieldByName('Unidad_lf').AsString:='hor';
                      QLineaFacturas.FieldByName('Precio_lf').AsFloat:=PrecioHora2;
                      QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                      QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                      QLineaFacturas.Post;
                 end;
                 //CARGO THERMOKING  (OK)
                 if QPeriodicosFact.FieldByName('importe_thermoking_pf').AsFloat<>0 then
                 begin
                      Inc(NumLineaFactura);   //Incrementamos el nº de linea de la factura

                      ImporteAux:=QPeriodicosFact.FieldByName('importe_thermoking_pf').AsFloat;
                      ImporteNeto:=ImporteNeto + ImporteAux;

                      QLineaFacturas.Insert;
                      QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                      QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                      QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                      QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                      QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                      QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                      QLineaFacturas.FieldByName('Descripcion_lf').AsString:='CARGO THERMOKING';
                      QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                      QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                      QLineaFacturas.Post;
                 end;
                 //TIEMPO THERMOKING (OK)
//                 if (QPeriodicosFact.FieldByName('kw_thermoking_pf').AsInteger<>0) and (QClientes.FieldByName('precio_kw_thermo_c').AsFloat<>0) then
                 if QPeriodicosFact.FieldByName('importe_kwthermo_pf').AsFloat<>0 then
                 begin
                      Inc(NumLineaFactura);   //Incrementamos el nº de linea de la factura

//                      ImporteAux:=Redondear(QPeriodicosFact.FieldByName('kw_thermoking_pf').AsInteger * QClientes.FieldByName('precio_kw_thermo_c').AsFloat,2);
                      ImporteAux:= QPeriodicosFact.FieldByName('importe_kwthermo_pf').AsFloat;
                      ImporteNeto:=ImporteNeto + ImporteAux;

                      QLineaFacturas.Insert;
                      QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                      QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                      QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                      QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                      QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                      QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                      QLineaFacturas.FieldByName('Descripcion_lf').AsString:='TIEMPO THERMOKING';
//                      QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=QPeriodicosFact.FieldByName('kw_thermoking_pf').AsInteger;
//                      QLineaFacturas.FieldByName('Unidad_lf').AsString:='kw';
//                      QLineaFacturas.FieldByName('Precio_lf').AsFloat:=QClientes.FieldByName('precio_kw_thermo_c').AsFloat;
                      QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                      QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                      QLineaFacturas.Post;
                 end;
                 //HORAS CLIMATIZACION (OK)
                 if (QPeriodicosFact.FieldByName('horas_clima_pf').AsFloat<>0) and (QClientes.FieldByName('precio_hor_clima_c').AsFloat<>0) then
                 begin
                      Inc(NumLineaFactura);   //Incrementamos el nº de linea de la factura

                      ImporteAux:=Redondear((ParteEntera(QPeriodicosFact.FieldByName('horas_clima_pf').AsFloat) * QClientes.FieldByName('precio_hor_clima_c').AsFloat) +
                                           ((StrToInt(RellenarCeros(ParteDecimal(QPeriodicosFact.FieldByName('horas_clima_pf').AsFloat),2,'D'))/60)* QClientes.FieldByName('precio_hor_clima_c').AsFloat), 2);
                      ImporteNeto:=ImporteNeto + ImporteAux;

                      QLineaFacturas.Insert;
                      QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                      QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                      QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                      QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                      QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                      QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                      QLineaFacturas.FieldByName('Descripcion_lf').AsString:='HORAS CLIMATIZACION';
                      QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=QPeriodicosFact.FieldByName('horas_clima_pf').AsFloat;
                      QLineaFacturas.FieldByName('Unidad_lf').AsString:='hor';
                      QLineaFacturas.FieldByName('Precio_lf').AsFloat:=QClientes.FieldByName('precio_hor_clima_c').AsFloat;
                      QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                      QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                      QLineaFacturas.Post;
                 end;
                 //ELECTRICIDAD CARRETILLA (OK)
                 if QPeriodicosFact.FieldByName('importe_carretilla_pf').AsFloat<>0 then
                 begin
                      Inc(NumLineaFactura);   //Incrementamos el nº de linea de la factura

                      ImporteAux:=QPeriodicosFact.FieldByName('importe_carretilla_pf').AsFloat;
                      ImporteNeto:=ImporteNeto + ImporteAux;

                      QLineaFacturas.Insert;
                      QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                      QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                      QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                      QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                      QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                      QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                      QLineaFacturas.FieldByName('Descripcion_lf').AsString:='ELECTRICIDAD CARRETILLA';
                      QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                      QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                      QLineaFacturas.Post;
                 end;
                 //ELECTRICIDAD OFICINA (OK)
                 if QPeriodicosFact.FieldByName('importe_oficina_pf').AsFloat<>0 then
                 begin
                      Inc(NumLineaFactura);   //Incrementamos el nº de linea de la factura

                      ImporteAux:=QPeriodicosFact.FieldByName('importe_oficina_pf').AsFloat;
                      ImporteNeto:=ImporteNeto + ImporteAux;

                      QLineaFacturas.Insert;
                      QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                      QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                      QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                      QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                      QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                      QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                      QLineaFacturas.FieldByName('Descripcion_lf').AsString:='ELECTRICIDAD OFICINA';
                      QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                      QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                      QLineaFacturas.Post;
                 end;
                 //SERVICIOS ADMINISTRATIVOS (OK)
                 if QPeriodicosFact.FieldByName('gastos_administra_pf').AsFloat<>0 then
                 begin
                      Inc(NumLineaFactura);   //Incrementamos el nº de linea de la factura

                      ImporteAux:=QPeriodicosFact.FieldByName('gastos_administra_pf').AsFloat;
                      ImporteNeto:=ImporteNeto + ImporteAux;

                      QLineaFacturas.Insert;
                      QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                      QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                      QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                      QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                      QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                      QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                      QLineaFacturas.FieldByName('Descripcion_lf').AsString:='SERVICIOS ADMINISTRATIVOS';
                      QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                      QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                      QLineaFacturas.Post;
                 end;
                 //OTROS SERVICIOS (OK)
                 if QPeriodicosFact.FieldByName('otros_servicios_pf').AsFloat<>0 then
                 begin
                      Inc(NumLineaFactura);   //Incrementamos el nº de linea de la factura

                      ImporteAux:=QPeriodicosFact.FieldByName('otros_servicios_pf').AsFloat;
                      ImporteNeto:=ImporteNeto + ImporteAux;

                      if (QPeriodicosFact.FieldByName('texto1_pf').AsString='') and (QPeriodicosFact.FieldByName('texto2_pf').AsString='') then
                      begin
                           QLineaFacturas.Insert;
                           QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                           QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                           QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                           QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                           QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                           QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                           QLineaFacturas.FieldByName('Descripcion_lf').AsString:='OTROS SERVICIOS';
                           QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                           QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                           QLineaFacturas.Post;
                      end
                      else
                      begin
                           if QPeriodicosFact.FieldByName('texto1_pf').AsString<>'' then
                           begin
                                QLineaFacturas.Insert;
                                QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                QLineaFacturas.FieldByName('Descripcion_lf').AsString:=QPeriodicosFact.FieldByName('texto1_pf').AsString;
                                if QPeriodicosFact.FieldByName('texto2_pf').AsString='' then
                                begin
                                     QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                                     QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                                end
                                else
                                    Inc(NumLineaFactura);
                                QLineaFacturas.Post;
                           end;
                           if QPeriodicosFact.FieldByName('texto2_pf').AsString<>'' then
                           begin
                                QLineaFacturas.Insert;
                                QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                QLineaFacturas.FieldByName('Descripcion_lf').AsString:=QPeriodicosFact.FieldByName('texto2_pf').AsString;
                                QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                                QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                                QLineaFacturas.Post;
                           end;
                      end;
                 end;
                 //OTROS CONCEPTOS (OK)
                 if QPeriodicosFact.FieldByName('importe_concepto2_pf').AsFloat<>0 then
                 begin
                      Inc(NumLineaFactura);   //Incrementamos el nº de linea de la factura

                      ImporteAux:=QPeriodicosFact.FieldByName('importe_concepto2_pf').AsFloat;
                      ImporteNeto:=ImporteNeto + ImporteAux;

                      if (QPeriodicosFact.FieldByName('concepto2a_pf').AsString='') and (QPeriodicosFact.FieldByName('concepto2b_pf').AsString='') then
                      begin
                           QLineaFacturas.Insert;
                           QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                           QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                           QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                           QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                           QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                           QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                           QLineaFacturas.FieldByName('Descripcion_lf').AsString:='OTROS CONCEPTOS';
                           QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                           QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                           QLineaFacturas.Post;
                      end
                      else
                      begin
                           if QPeriodicosFact.FieldByName('concepto2a_pf').AsString<>'' then
                           begin
                                QLineaFacturas.Insert;
                                QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                QLineaFacturas.FieldByName('Descripcion_lf').AsString:=QPeriodicosFact.FieldByName('concepto2a_pf').AsString;
                                if QPeriodicosFact.FieldByName('concepto2b_pf').AsString='' then
                                begin
                                     QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                                     QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                                end
                                else
                                    Inc(NumLineaFactura);
                                QLineaFacturas.Post;
                           end;
                           if QPeriodicosFact.FieldByName('concepto2b_pf').AsString<>'' then
                           begin
                                QLineaFacturas.Insert;
                                QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                QLineaFacturas.FieldByName('Descripcion_lf').AsString:=QPeriodicosFact.FieldByName('concepto2b_pf').AsString;
                                QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                                QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                                QLineaFacturas.Post;
                           end;
                      end;
                 end;
                 //OTROS CONCEPTOS (OK)
                 if QPeriodicosFact.FieldByName('importe_concepto3_pf').AsFloat<>0 then
                 begin
                      Inc(NumLineaFactura);   //Incrementamos el nº de linea de la factura

                      ImporteAux:=QPeriodicosFact.FieldByName('importe_concepto3_pf').AsFloat;
                      ImporteNeto:=ImporteNeto + ImporteAux;

                      if (QPeriodicosFact.FieldByName('concepto3a_pf').AsString='') and (QPeriodicosFact.FieldByName('concepto3b_pf').AsString='') then
                      begin
                           QLineaFacturas.Insert;
                           QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                           QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                           QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                           QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                           QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                           QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                           QLineaFacturas.FieldByName('Descripcion_lf').AsString:='OTROS CONCEPTOS';
                           QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                           QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                           QLineaFacturas.Post;
                      end
                      else
                      begin
                           if QPeriodicosFact.FieldByName('concepto3a_pf').AsString<>'' then
                           begin
                                QLineaFacturas.Insert;
                                QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                QLineaFacturas.FieldByName('Descripcion_lf').AsString:=QPeriodicosFact.FieldByName('concepto3a_pf').AsString;
                                if QPeriodicosFact.FieldByName('concepto3b_pf').AsString='' then
                                begin
                                     QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                                     QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                                end
                                else
                                    Inc(NumLineaFactura);
                                QLineaFacturas.Post;
                           end;
                           if QPeriodicosFact.FieldByName('concepto3b_pf').AsString<>'' then
                           begin
                                QLineaFacturas.Insert;
                                QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                QLineaFacturas.FieldByName('Descripcion_lf').AsString:=QPeriodicosFact.FieldByName('concepto3b_pf').AsString;
                                QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                                QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                                QLineaFacturas.Post;
                           end;
                      end;
                 end;
                                  //OTROS CONCEPTOS (OK)
                 if QPeriodicosFact.FieldByName('importe_concepto4_pf').AsFloat<>0 then
                 begin
                      Inc(NumLineaFactura);   //Incrementamos el nº de linea de la factura

                      ImporteAux:=QPeriodicosFact.FieldByName('importe_concepto4_pf').AsFloat;
                      ImporteNeto:=ImporteNeto + ImporteAux;

                      if (QPeriodicosFact.FieldByName('concepto4a_pf').AsString='') and (QPeriodicosFact.FieldByName('concepto4b_pf').AsString='') then
                      begin
                           QLineaFacturas.Insert;
                           QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                           QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                           QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                           QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                           QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                           QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                           QLineaFacturas.FieldByName('Descripcion_lf').AsString:='OTROS CONCEPTOS';
                           QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                           QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                           QLineaFacturas.Post;
                      end
                      else
                      begin
                           if QPeriodicosFact.FieldByName('concepto4a_pf').AsString<>'' then
                           begin
                                QLineaFacturas.Insert;
                                QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                QLineaFacturas.FieldByName('Descripcion_lf').AsString:=QPeriodicosFact.FieldByName('concepto4a_pf').AsString;
                                if QPeriodicosFact.FieldByName('concepto4b_pf').AsString='' then
                                begin
                                     QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                                     QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                                end
                                else
                                    Inc(NumLineaFactura);
                                QLineaFacturas.Post;
                           end;
                           if QPeriodicosFact.FieldByName('concepto4b_pf').AsString<>'' then
                           begin
                                QLineaFacturas.Insert;
                                QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                QLineaFacturas.FieldByName('Descripcion_lf').AsString:=QPeriodicosFact.FieldByName('concepto4b_pf').AsString;
                                QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                                QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                                QLineaFacturas.Post;
                           end;
                      end;
                 end;
                 //OTROS CONCEPTOS (OK)
                 if QPeriodicosFact.FieldByName('importe_concepto5_pf').AsFloat<>0 then
                 begin
                      Inc(NumLineaFactura);   //Incrementamos el nº de linea de la factura

                      ImporteAux:=QPeriodicosFact.FieldByName('importe_concepto5_pf').AsFloat;
                      ImporteNeto:=ImporteNeto + ImporteAux;

                      if (QPeriodicosFact.FieldByName('concepto5a_pf').AsString='') and (QPeriodicosFact.FieldByName('concepto5b_pf').AsString='') then
                      begin
                           QLineaFacturas.Insert;
                           QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                           QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                           QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                           QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                           QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                           QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                           QLineaFacturas.FieldByName('Descripcion_lf').AsString:='OTROS CONCEPTOS';
                           QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                           QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                           QLineaFacturas.Post;
                      end
                      else
                      begin
                           if QPeriodicosFact.FieldByName('concepto5a_pf').AsString<>'' then
                           begin
                                QLineaFacturas.Insert;
                                QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                QLineaFacturas.FieldByName('Descripcion_lf').AsString:=QPeriodicosFact.FieldByName('concepto5a_pf').AsString;
                                if QPeriodicosFact.FieldByName('concepto5b_pf').AsString='' then
                                begin
                                     QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                                     QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                                end
                                else
                                    Inc(NumLineaFactura);
                                QLineaFacturas.Post;
                           end;
                           if QPeriodicosFact.FieldByName('concepto5b_pf').AsString<>'' then
                           begin
                                QLineaFacturas.Insert;
                                QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                QLineaFacturas.FieldByName('Descripcion_lf').AsString:=QPeriodicosFact.FieldByName('concepto5b_pf').AsString;
                                QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                                QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                                QLineaFacturas.Post;
                           end;
                      end;
                 end;
            end;
            QPeriodicosFact.Close;
            //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            //++++++++++++++++    MOVIMIENTOS EXTRA LOTE TERMINADO     ++++++++
            //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

            if QClientes.FieldByName('precio_mvto_lote_c').AsFloat<>0 then
            begin
                TotalMov := 0;
                DescripcionMov := '';
                QMovimientosExtra.Close;
                QMovimientosExtra.SQL.Clear;
    //            QMovimientosExtra.SQL.Add(' SELECT lote_ls, fecha_albaran_cs, albaran_cs, count(distinct albaran_ls)  movimientos '  +
                QMovimientosExtra.SQL.Add(' SELECT lote_ls, count(distinct albaran_ls)  movimientos '  +
                                          '   FROM CABECERA_SALIDAS ' +
                                          '         JOIN LINEA_SALIDAS ON EMPRESA_CS=EMPRESA_LS AND ALBARAN_CS=ALBARAN_LS ' +
                                          '    WHERE EMPRESA_CS=' +  QuotedStr(QClientes.FieldByName('Empresa_c').AsString) +
                                          '    AND CLIENTE_CS=' + QuotedStr(QClientes.FieldByName('Codigo_c').AsString) +
                                          '    AND fecha_albaran_cs BETWEEN ' + QuotedStr(AnyoMesDia(cFechaDesde.Text)) + ' and ' + QuotedStr(AnyoMesDia(cFechaHasta.Text)) +
                                          '   group by lote_ls  ');
                QMovimientosExtra.Open;
                while not QMovimientosExtra.Eof do
                begin
                  //Buscamos Las entradas relacionadas al LOTE
                    QMovimientosEnt.Close;
                    QMovimientosEnt.SQL.Clear;
                    QMovimientosEnt.SQL.Add(  ' SELECT sum(bultos_le) bultos_le ' +
                                              '   FROM CABECERA_ENTRADAS  ' +
                                              '        JOIN LINEA_ENTRADAS ON EMPRESA_CE=EMPRESA_LE AND ALBARAN_CE=ALBARAN_LE ' +
                                              '   WHERE EMPRESA_CE='  +  QuotedStr(QClientes.FieldByName('Empresa_c').AsString) +
                                              '   AND CLIENTE_CE='  + QuotedStr(QClientes.FieldByName('Codigo_c').AsString) +
                                              '   AND LOTE_LE='  + QuotedStr(QMovimientosExtra.FieldByName('lote_ls').AsString) );
                    QMovimientosEnt.Open;

                    //Buscamos las salidas hasta la fecha de facturacion relacionado al LOTE
                    QMovimientosSal.Close;
                    QMovimientosSal.SQL.Clear;
                    QMovimientosSal.SQL.Add(' SELECT max( fecha_albaran_cs ) fecha_albaran_cs, count( distinct albaran_ls ) salidas, ' +
                                            '         sum( bultos_ls ) bultos_ls, sum( unidades_ls ) unidades_ls   ' +
                                            ' FROM CABECERA_SALIDAS  ' +
                                            '       JOIN LINEA_SALIDAS ON EMPRESA_CS=EMPRESA_LS AND ALBARAN_CS=ALBARAN_LS  ' +
                                            '  WHERE EMPRESA_CS='  +  QuotedStr(QClientes.FieldByName('Empresa_c').AsString) +
                                            '  AND CLIENTE_CS=' + QuotedStr(QClientes.FieldByName('Codigo_c').AsString) +
                                            '  AND LOTE_LS=' + QuotedStr(QMovimientosExtra.FieldByName('lote_ls').AsString) +
                                            '  and fecha_albaran_cs <= ' + QuotedStr(AnyoMesDia(cFechaHasta.Text)) );
                    QMovimientosSal.Open;

                     //Comprobamos is esl LOT TERMINADO
                     if (QMovimientosEnt.FieldByName('bultos_le').AsFloat = QMovimientosSal.FieldByName('bultos_ls').AsFloat) and
                         (QMovimientosSal.FieldByName('salidas').AsInteger > 1) then
                     begin
                          TotalMov := TotalMov + (QMovimientosSal.FieldByName('salidas').AsInteger -1);
                          if DescripcionMov = '' then
                              DescripcionMov := QMovimientosExtra.FieldByName('lote_ls').AsString
                          else
                            if Pos(QMovimientosExtra.FieldByName('lote_ls').AsString, DescripcionMov) = 0  then
                              DescripcionMov := DescripcionMov + '+' + QMovimientosExtra.FieldByName('lote_ls').AsString;
                     end;

                     QMovimientosExtra.Next;
                end;

                //Si existen movimientos extra de LOTES
                if TotalMov <> 0 then
                begin
                    //Imprimir lineas
                    TarifaMovExtra := QClientes.FieldByName('precio_mvto_lote_c').Asfloat;
                    ImporteAux:=Redondear(TotalMov * TarifaMovExtra, 2);
                    ImporteNeto:=ImporteNeto + ImporteAux;

                    Inc(NumLineaFactura);
                    QLineaFacturas.Insert;
                    QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                    QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                    QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                    QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                    QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                    QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                    QLineaFacturas.FieldByName('Descripcion_lf').AsString:='MANEJOS MANIPULACION LOTE';
                    QLineaFacturas.Post;


                    // Para imprimir todos los lotes
                    if Length (DescripcionMov) > 35 then
                    begin
                        LongCadena := 0;
                        Cadena :=  DescripcionMov;
                        while LongCadena <= Length (DescripcionMov)  do
                        begin

                          subCadena := copy(Cadena, LongCadena+1, 35);
                          LongCadena := LongCadena + 35;

                          if LongCadena > Length (DescripcionMov)  then
                          begin
                            Inc(NumLineaFactura);
                            QLineaFacturas.Insert;
                            QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                            QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                            QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                            QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                            QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                            QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                            QLineaFacturas.FieldByName('Descripcion_lf').AsString:=subCadena;
                            QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=TotalMov;
                            QLineaFacturas.FieldByName('Unidad_lf').AsString:='';
                            QLineaFacturas.FieldByName('Precio_lf').AsFloat:=TarifaMovExtra;
                            QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                            QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                            QLineaFacturas.Post;
                          end
                          else
                          begin
                            Inc(NumLineaFactura);
                            QLineaFacturas.Insert;
                            QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                            QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                            QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                            QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                            QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                            QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                            QLineaFacturas.FieldByName('Descripcion_lf').AsString:=subCadena;
                            QLineaFacturas.FieldByName('Cantidad_lf').AsString:='';
                            QLineaFacturas.FieldByName('Unidad_lf').AsString:='';
                            QLineaFacturas.FieldByName('Precio_lf').AsString:='';
                            QLineaFacturas.FieldByName('Tipo_lf').AsString:='';
                            QLineaFacturas.FieldByName('Importe_lf').AsString:='';
                          end;

                        end;
                    end
                    else
                    begin
                        Inc(NumLineaFactura);
                        QLineaFacturas.Insert;
                        QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                        QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                        QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                        QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                        QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                        QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                        QLineaFacturas.FieldByName('Descripcion_lf').AsString:=DescripcionMov;
                        QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=TotalMov;
                        QLineaFacturas.FieldByName('Unidad_lf').AsString:='';
                        QLineaFacturas.FieldByName('Precio_lf').AsFloat:=TarifaMovExtra;
                        QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                        QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                        QLineaFacturas.Post;
                    end;
                end;
            end;
            //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            //++++++++++++++++          CONSUMO ELECTRICO              ++++++++
            //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            QConsumosElectricos.Close;
            QConsumosElectricos.SQL.Clear;
            QConsumosElectricos.SQL.Add(' SELECT * FROM CONSUMOS '  +
                                      '    WHERE EMPRESA_CS=' +  QuotedStr(QClientes.FieldByName('Empresa_c').AsString) +
                                      '    AND CLIENTE_CS=' + QuotedStr(QClientes.FieldByName('Codigo_c').AsString) +
                                      '    AND CONSUMO_CS <> 0 ' +
                                      '    AND FACTURADO_CS =' + QuotedStr('N') );

            NumConsumoFactura:=0;
            QConsumosElectricos.Open;
            while not QConsumosElectricos.eof do
            begin

                Inc(NumConsumoFactura);
                QConsumoFacturas.Insert;
                QConsumoFacturas.FieldByName('Empresa_cef').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                QConsumoFacturas.FieldByName('Cliente_cef').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                QConsumoFacturas.FieldByName('Numero_Factura_cef').AsInteger:=NumFactura;
                QConsumoFacturas.FieldByName('Fecha_Factura_cef').AsString:=AnyoMesDia(cFechaFactura.Text);
                QConsumoFacturas.FieldByName('Numero_Linea_cef').AsInteger:=NumConsumoFactura;
                QConsumoFacturas.FieldByName('Concepto_cef').AsString:=QConsumosElectricos.FieldByName('concepto_cs').AsString;
                QConsumoFacturas.FieldByName('lectura_actual_cef').AsInteger:=QConsumosElectricos.FieldByName('lectura_actual_cs').AsInteger;
                QConsumoFacturas.FieldByName('lectura_anterior_cef').AsInteger:=QConsumosElectricos.FieldByName('lectura_anterior_cs').AsInteger;
                QConsumoFacturas.FieldByName('consumo_cef').AsInteger:=QConsumosElectricos.FieldByName('consumo_cs').AsInteger;
                QConsumoFacturas.FieldByName('precio_cef').AsFloat:=QConsumosElectricos.FieldByName('precio_cs').AsFloat;
                QConsumoFacturas.FieldByName('total_cef').AsFloat:=QConsumosElectricos.FieldByName('total_cs').AsFloat;
                QConsumoFacturas.Post;

                QConsumosElectricos.Next;
            end;

            //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            //++++++++++++++++    FACTURACION DIARIA                 ++++++++++
            //++++++++++++++++    DATOS DE LA TABLA TEMP_STOCK_X_DIA ++++++++++
            //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            if cPeriodo.Text='DIARIA' then  //Facturacion Diaria
            begin
                 //Borramos la tabla TEMP_STOCK_X_DIA
                 QAux.Close;
                 QAux.SQL.Clear;
                 QAux.SQL.Add(' DELETE FROM TEMP_STOCK_X_DIA ' +
                              ' WHERE EMPRESA_TSX=' + QuotedStr(QClientes.FieldByName('Empresa_c').AsString));
                 QAux.ExecSQL;

                 FechaTsd:=cFechaDesde.Date;

                 While FechaTsd<=cFechaHasta.Date do
                 begin
                      //Insertamos en la tabla TEMP_STOCK_X_DIA
                      QAux.Close;
                      QAux.SQL.Clear;
                      QAux.SQL.Add('INSERT INTO TEMP_STOCK_X_DIA VALUES(:Empresa, :FechaTsd, 0, 0)');
                      QAux.ParamByName('Empresa').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                      QAux.ParamByName('FechaTsd').AsString:=AnyoMesDia(FechaTsd);
                      QAux.ExecSQL;

                      FechaTsd:=FechaTsd + 1;  //Incrementamos la fecha
                 end;
            end;

            //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            //++++++++ DATOS DE LAS TABLAS CABECERAS-LINEAS DE ENTRADA  +++++++
            //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

            //Inicializacion de variables
            TotalTipo0:=0;
            TotalTipo1:=0;
            TotalTipo2:=0;
            TotalTipo3:=0;
            TotalTipo4:=0;
            TotalEntrado:=0;
            TotalSalidoMismoDia:=0;
            TotalImpEnt:=0;
            TotalHorEnt:=0;
            ExistenConceptos:=False;

            TotalManejoPalet:=0;

            //Preparacion de la tabla Cabecera de Entradas
            QCabeceraEntradas.Close;
            QCabeceraEntradas.SQL.Clear;
            QCabeceraEntradas.SQL.Add(' SELECT * FROM CABECERA_ENTRADAS ' +
                                      ' WHERE EMPRESA_CE=' +  QuotedStr(QClientes.FieldByName('Empresa_c').AsString) +
                                      ' AND CLIENTE_CE=' + QuotedStr(QClientes.FieldByName('Codigo_c').AsString) +
                                      ' AND (NUMERO_FACTURA_CE IS NULL OR NUMERO_FACTURA_CE=0) ');

            // Gregorio 20/04/2012 MANEJOS Palets Entrados en el periodo que se factura no coje anteriores
            if QTarifas.FieldByName('manejo_palet_t').AsFloat<>0 then
              QCabeceraEntradas.SQL.Add(' AND FECHA_ALBARAN_CE between ' + QuotedStr(AnyoMesDia(cFechaDesde.Text)) + ' and ' + QuotedStr(AnyoMesDia(cFechaHasta.Text)))
            else
              QCabeceraEntradas.SQL.Add(' AND FECHA_ALBARAN_CE<=' + QuotedStr(AnyoMesDia(cFechaHasta.Text)));

            //Abrimos la tabla de Cabeceras de Entrada
            QCabeceraEntradas.Open;
            While not QCabeceraEntradas.Eof do  //Para cada Entrada
            begin


                 TEntradoTsd:=0; //Queremos controlar el Stock Pendiente
                 //Acumular en TotalImpEnt y en TotalHorEnt (OK)
                 if QCabeceraEntradas.FieldByName('Concepto_ce').AsString='' then //No Existe concepto
                 begin
                      if QCabeceraEntradas.FieldByName('Importe_Entrada_ce').AsFloat<>0 then
                         TotalImpEnt:=TotalImpEnt + QCabeceraEntradas.FieldByName('Importe_Entrada_ce').AsFloat;
                      if QCabeceraEntradas.FieldByName('Horas_Entrada_ce').AsFloat<>0 then
                         TotalHorEnt:=SumarHorMin(TotalHorEnt,QCabeceraEntradas.FieldByName('Horas_Entrada_ce').AsFloat);
                 end
                 else //Existe Concepto
                     ExistenConceptos:=True;

                 //Abrimos la tabla de Lineas de Entrada
                 QLineaEntradas.Close;
                 QLineaEntradas.SQL.Clear;
                 QLineaEntradas.SQL.Add(' SELECT * FROM LINEA_ENTRADAS ' +
                                        ' WHERE EMPRESA_LE=' +  QuotedStr(QClientes.FieldByName('Empresa_c').AsString) +
                                        ' AND ALBARAN_LE='+ QuotedStr(IntToStr(QCabeceraEntradas.FieldByName('Albaran_ce').AsInteger)));
                 QLineaEntradas.Open;
                 While not QLineaEntradas.Eof do //Para cada Linea de Entrada
                 begin
                      //Los palets no se facturan
                      if not EsArticuloPalet(QLineaEntradas.FieldByName('Empresa_le').AsString,
                                             QLineaEntradas.FieldByName('Familia_le').AsString,
                                             QLineaEntradas.FieldByName('Articulo_le').AsString) then
                      begin
                           //Acumular en TotalEntrado
                           if ((QTarifas.FieldByName('manejo_palet_t').AsCurrency <> 0) or (QTarifas.FieldByName('frio_palet_t').AsCurrency <> 0)) then
                             TotalEntrado:=TotalEntrado + QLineaEntradas.FieldByName('palets_le').AsFloat
                           else
                             TotalEntrado:=TotalEntrado + QLineaEntradas.FieldByName('Unidades_le').AsFloat;

                           //Facturacion Diaria - Acumular en TEntradoTsd
                           if cPeriodo.Text='DIARIA' then
                             begin
                             if ((QTarifas.FieldByName('manejo_palet_t').AsCurrency <> 0) or (QTarifas.FieldByName('frio_palet_t').AsCurrency <> 0)) then
                               TEntradoTsd:=TEntradoTsd + QLineaEntradas.FieldByName('palets_le').AsFloat
                             else
                               TEntradoTsd:=TEntradoTsd + QLineaEntradas.FieldByName('Unidades_le').AsFloat;
                             end;

                           //Vemos si hay unidades salidas con la misma fecha de entrada y las restamos
                           QAux.Close;
                           QAux.SQL.Clear;
                           QAux.SQL.Add(' SELECT UNID_SAL_MISMO_DIA_AL, palets_salidos_al FROM ALMACENES ' +
                                        ' WHERE EMPRESA_AL=' + QuotedStr(QLineaEntradas.FieldByName('Empresa_le').AsString) +
                                        ' AND CLIENTE_AL=' + QuotedStr(QCabeceraEntradas.FieldByName('Cliente_ce').AsString) +
                                        ' AND LOTE_AL=' + QuotedStr(QLineaEntradas.FieldByName('Lote_le').AsString));
                           QAux.Open;

                           //Palets
                           if ((QTarifas.FieldByName('manejo_palet_t').AsCurrency <> 0) or (QTarifas.FieldByName('frio_palet_t').AsCurrency <> 0)) then
                           begin
                                TotalEntrado:=TotalEntrado - QAux.FieldByName('palets_salidos_al').AsFloat;
                                TotalSalidoMismoDia:=TotalSalidoMismoDia + QAux.FieldByName('palets_salidos_al').AsFloat;
                           end
                           else //Unidades
                           begin
                                if QAux.FieldByName('UNID_SAL_MISMO_DIA_AL').AsFloat<>0 then
                                begin
                                        TotalEntrado:=TotalEntrado  - QAux.FieldByName('UNID_SAL_MISMO_DIA_AL').AsFloat;
                                        TotalSalidoMismoDia:=TotalSalidoMismoDia + QAux.FieldByName('UNID_SAL_MISMO_DIA_AL').AsFloat;
                                end;
                           end;
                           QAux.Close;

                           //Acumulamos en el tipo de manejo
                           case StrToInt(QLineaEntradas.FieldByName('Manejo_le').AsString) of
                                0: TotalTipo0:=TotalTipo0 + QLineaEntradas.FieldByName('Unidades_le').AsFloat;   //Manejo 0
                                1: TotalTipo1:=TotalTipo1 + QLineaEntradas.FieldByName('Unidades_le').AsFloat;   //Manejo 1
                                2: TotalTipo2:=TotalTipo2 + QLineaEntradas.FieldByName('Unidades_le').AsFloat;   //Manejo 2
                                3: TotalTipo3:=TotalTipo3 + QLineaEntradas.FieldByName('Unidades_le').AsFloat;   //Manejo 3
                                4: TotalTipo4:=TotalTipo4 + QLineaEntradas.FieldByName('Unidades_le').AsFloat;   //Manejo 4
                                //5: TotalManejoPalet:=TotalManejoPalet + QLineaEntradas.fieldByName('palets_le').AsCurrency;  // Manejo Palet
                           end;
                      end;
                      QLineaEntradas.Next;
                 end;
                 QLineaEntradas.Close;
                 //Facturacion Diaria - Modificar la tabla TEMP_STOCK_X_DIA  (OK)
                 if (cPeriodo.Text='DIARIA') and (TEntradoTsd<>0) then
                 begin
                      QAux.Close;
                      QAux.SQL.Clear;
                      QAux.SQL.Add(' UPDATE TEMP_STOCK_X_DIA ' +
                                   ' SET TOTAL_ENTRADO_TSX=TOTAL_ENTRADO_TSX + :Entrado ' +
                                   ' WHERE EMPRESA_TSX=' + QuotedStr(QCabeceraEntradas.FieldByName('Empresa_ce').AsString) +
                                   ' AND FECHA_TSX=' + QuotedStr(QCabeceraEntradas.FieldByName('Fecha_Albaran_ce').AsString));
                      QAux.ParamByName('Entrado').AsFloat:=TEntradoTsd;
                      TotalManejoPalet:= TotalManejoPalet + TEntradoTsd;
                      QAux.ExecSQL;
                      QAux.Close;
                 end;
                 //Siguiente Albaran de Entrada
                 QCabeceraEntradas.Next;
            end;
            QCabeceraEntradas.Close;

            //Abrimos la tabla Tarifas
            QTarifas.Close;
            QTarifas.ParamByName('Empresa').AsString:=QClientes.FieldByName('Empresa_c').AsString;
            QTarifas.ParamByName('Codigo').AsString:=QClientes.FieldByName('Tarifa_c').AsString;
            QTarifas.Open;

            //Acumular los TotalTipoX o Manejos o Frio

             //Manejo Palet (OK)
            if (TEntradoTsd<>0) and (QTarifas.FieldByName('manejo_palet_t').AsFloat<>0) then
            begin
                 //Total Palets Entrados
                 //ImporteAux:=Redondear(TEntradoTsd * QTarifas.FieldByName('manejo_palet_t').AsFloat, 2);
                 ImporteAux:=Redondear(TotalManejoPalet * QTarifas.FieldByName('manejo_palet_t').AsFloat, 2);
                 ImporteNeto:=ImporteNeto + ImporteAux;

                 Inc(NumLineaFactura);

                 QLineaFacturas.Insert;
                 QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                 QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                 QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                 QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                 QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                 QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                 QLineaFacturas.FieldByName('Descripcion_lf').AsString:='MANEJOS';
                 QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=TotalManejoPalet;//TEntradoTsd
                 QLineaFacturas.FieldByName('Unidad_lf').AsString:='Pal';
                 QLineaFacturas.FieldByName('Precio_lf').AsFloat:=QTarifas.FieldByName('manejo_palet_t').AsFloat;
                 QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                 QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                 QLineaFacturas.Post;
            end
            else
            begin
                //Manejo 0 (OK)
                if (TotalTipo0<>0) and (QTarifas.FieldByName('Tipo0_t').AsFloat<>0) then
                begin
                   ImporteAux:=Redondear(TotalTipo0 * QTarifas.FieldByName('Tipo0_t').AsFloat, 2);
                   ImporteNeto:=ImporteNeto + ImporteAux;

                   Inc(NumLineaFactura);

                   QLineaFacturas.Insert;
                   QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                   QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                   QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                   QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                   QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                   QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                   QLineaFacturas.FieldByName('Descripcion_lf').AsString:='MANEJOS PALETIZADOS';
                   QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=TotalTipo0;
                   if QTarifas.FieldByName('manejo_palet_t').AsFloat <> 0 then
                       QLineaFacturas.FieldByName('Unidad_lf').AsString:='Pal'
                   else
                       QLineaFacturas.FieldByName('Unidad_lf').AsString:='kg';
                   QLineaFacturas.FieldByName('Precio_lf').AsFloat:=QTarifas.FieldByName('Tipo0_t').AsFloat;
                   QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                   QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                   QLineaFacturas.Post;
                end;
                //Manejo 1 (OK)
                if (TotalTipo1<>0) and (QTarifas.FieldByName('Tipo1_t').AsFloat<>0) then
                begin
                     ImporteAux:=Redondear(TotalTipo1 * QTarifas.FieldByName('Tipo1_t').AsFloat, 2);
                     ImporteNeto:=ImporteNeto + ImporteAux;

                     Inc(NumLineaFactura);

                     QLineaFacturas.Insert;
                     QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                     QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                     QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                     QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                     QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                     QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                     QLineaFacturas.FieldByName('Descripcion_lf').AsString:='MANEJOS MANIPULADOS';
                     QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=TotalTipo1;
                     QLineaFacturas.FieldByName('Unidad_lf').AsString:='kg';
                     QLineaFacturas.FieldByName('Precio_lf').AsFloat:=QTarifas.FieldByName('Tipo1_t').AsFloat;
                     QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                     QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                     QLineaFacturas.Post;
                end;
                //Manejos 2, 3 y 4  (OK)
                ImporteAux:=0;
                if (TotalTipo2<>0) and (QTarifas.FieldByName('Tipo2_t').AsFloat<>0) then
                   ImporteAux:=ImporteAux + Redondear(TotalTipo2 * QTarifas.FieldByName('Tipo2_t').AsFloat, 2);
                if (TotalTipo3<>0) and (QTarifas.FieldByName('Tipo3_t').AsFloat<>0) then
                   ImporteAux:=ImporteAux + Redondear(TotalTipo3 * QTarifas.FieldByName('Tipo3_t').AsFloat, 2);
                if (TotalTipo4<>0) and (QTarifas.FieldByName('Tipo4_t').AsFloat<>0) then
                   ImporteAux:=ImporteAux + Redondear(TotalTipo4 * QTarifas.FieldByName('Tipo4_t').AsFloat, 2);

                if ImporteAux<>0 then //(OK)
                begin
                     ImporteNeto:=ImporteNeto + ImporteAux;

                     Inc(NumLineaFactura);

                     QLineaFacturas.Insert;
                     QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                     QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                     QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                     QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                     QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                     QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                     QLineaFacturas.FieldByName('Descripcion_lf').AsString:='MANEJOS VARIOS';
                     QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=TotalTipo2 + TotalTipo3 + TotalTipo4;
                     QLineaFacturas.FieldByName('Unidad_lf').AsString:='kg';
                     QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                     QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                     QLineaFacturas.Post;
                end;
            end;

            //Acumular la conservacion de entradas  (OK)
            if (cPeriodo.Text<>'DIARIA') and
               (QClientes.FieldByName('m3_facturacion_c').AsInteger=0) and
               (TotalEntrado<>0) and
               ((QTarifas.FieldByName('precio_congelacion_kg_t').AsFloat<>0) or
                (QTarifas.FieldByName('frio_palet_t').AsFloat<>0)) then
            begin
                 if QTarifas.FieldByName('frio_palet_t').AsFloat <> 0 then
                     ImporteAux:=Redondear(TotalEntrado * QTarifas.FieldByName('frio_palet_t').AsFloat, 2)
                 else
                     ImporteAux:=Redondear(TotalEntrado * QTarifas.FieldByName('precio_congelacion_kg_t').AsFloat, 2);
                 ImporteNeto:=ImporteNeto + ImporteAux;

                 Inc(NumLineaFactura);

                 QLineaFacturas.Insert;
                 QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                 QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                 QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                 QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                 QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                 QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                 QLineaFacturas.FieldByName('Descripcion_lf').AsString:='CONSERVACION ENTRADAS';
                 QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=TotalEntrado;
                 if QTarifas.FieldByName('frio_palet_t').AsFloat <> 0 then
                 begin
                      QLineaFacturas.FieldByName('Unidad_lf').AsString:='Pal';
                      QLineaFacturas.FieldByName('Precio_lf').AsFloat:=QTarifas.FieldByName('frio_palet_t').AsFloat;
                 end
                 else
                 begin
                      QLineaFacturas.FieldByName('Unidad_lf').AsString:='kg';
                      QLineaFacturas.FieldByName('Precio_lf').AsFloat:=QTarifas.FieldByName('precio_congelacion_kg_t').AsFloat;
                 end;
                 QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                 QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                 QLineaFacturas.Post;
            end;


            // Esto ya no hace falta pq hemos creado en la tabla de Clientes ultimo_stock_pal_c  Gregorio 2011/11/08
            /////////////////////////////////////////////////////////////////////////////////////
            //Stock de Almacen Pendiente  Gregorio 2011/11/07
            /////////////////////////////////////////////////////////////////////////////////////

   {         QAux.close;
            QAux.SQL.Clear;
            QAux.SQL.Add(' SELECT sum(unidades_entradas_al) as EntradaUnid, ' +
                         '        sum(palets_entrados_al) as EntradaPal ' +
                         '   FROM almacenes ' +
                         '  WHERE empresa_al=' +  QuotedStr(QClientes.FieldByName('Empresa_c').AsString) +
                         '    AND cliente_al=' + QuotedStr(QClientes.FieldByName('Codigo_c').AsString) +
                         '    AND fecha_entrada_al <' + QuotedStr(AnyoMesDia(cFechaDesde.Text)) +
                         '    AND fecha_caducidad_al >' + QuotedStr(AnyoMesDia(cFechaDesde.Text)));
            QAux.Open;

            if ((QTarifas.FieldByName('manejo_palet_t').AsCurrency <> 0) or
                (QTarifas.FieldByName('frio_palet_t').AsCurrency <> 0)) then
              Entradas:= QAux.FieldByName('EntradaPal').AsFloat
            else
              Entradas:= QAux.FieldByName('EntradaUnid').AsFloat;

            QAux.close;
            QAux.SQL.Clear;
            QAux.SQL.Add(' SELECT sum(unidades_salidas_al) as salidaUnid, ' +
                         '        sum(palets_salidos_al) as SalidaPal ' +
                         '   FROM almacenes ' +
                         '  WHERE empresa_al=' +  QuotedStr(QClientes.FieldByName('Empresa_c').AsString) +
                         '    AND cliente_al=' + QuotedStr(QClientes.FieldByName('Codigo_c').AsString) +
                         '    AND fecha_modif_al <' + QuotedStr(AnyoMesDia(cFechaDesde.Text)) +
                         '    AND fecha_caducidad_al >' + QuotedStr(AnyoMesDia(cFechaDesde.Text)));
            QAux.Open;

            if ((QTarifas.FieldByName('manejo_palet_t').AsCurrency <> 0) or
                (QTarifas.FieldByName('frio_palet_t').AsCurrency <> 0)) then
              Salidas:= QAux.FieldByName('SalidaPal').AsFloat
            else
              Salidas:= QAux.FieldByName('SalidaUnid').AsFloat;

            UltimoStockPalet:= Entradas - Salidas;
   }
            ////////////////////////////////////////////////////////////////////////////////////////////

             //Acumular la conservacion de existencias (OK)
            if (cPeriodo.Text<>'DIARIA') and
               (QClientes.FieldByName('m3_facturacion_c').AsInteger=0) and
               (QClientes.FieldByName('m3_refrigeracion_c').AsInteger=0) and
               (QClientes.FieldByName('ultimo_stock_c').AsFloat>0) and
               ((QTarifas.FieldByName('precio_congelacion_kg_t').AsFloat<>0) or
                (QTarifas.FieldByName('frio_palet_t').AsFloat<>0)) then
            begin
                 if QTarifas.FieldByName('frio_palet_t').AsFloat <> 0 then
                   ImporteAux:=Redondear(QClientes.FieldByName('ultimo_stock_pal_c').AsFloat * QTarifas.FieldByName('frio_palet_t').AsFloat, 2)
                 else
                   ImporteAux:=Redondear(QClientes.FieldByName('ultimo_stock_c').AsFloat * QTarifas.FieldByName('precio_congelacion_kg_t').AsFloat, 2);
                 ImporteNeto:=ImporteNeto + ImporteAux;


                 Inc(NumLineaFactura);

                 QLineaFacturas.Insert;
                 QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                 QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                 QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                 QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                 QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                 QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                 //QLineaFacturas.FieldByName('Descripcion_lf').AsString:='CONSERVACION'; //'CONSERVACION EXISTENCIAS';

                 if QTarifas.FieldByName('frio_palet_t').AsFloat <> 0 then
                 begin
                      QLineaFacturas.FieldByName('Unidad_lf').AsString:='Pal';
                      QLineaFacturas.FieldByName('Descripcion_lf').AsString:='CONSERVACION'; //'CONSERVACION EXISTENCIAS';
                      QLineaFacturas.FieldByName('Precio_lf').AsFloat:=QTarifas.FieldByName('frio_palet_t').AsFloat;
                      QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=QClientes.FieldByName('ultimo_stock_pal_c').AsFloat;
                 end
                 else
                 begin
                      QLineaFacturas.FieldByName('Unidad_lf').AsString:='kg';
                      QLineaFacturas.FieldByName('Descripcion_lf').AsString:='CONSERVACION EXISTENCIAS';
                      QLineaFacturas.FieldByName('Precio_lf').AsFloat:=QTarifas.FieldByName('precio_congelacion_kg_t').AsFloat;
                      QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=QClientes.FieldByName('ultimo_stock_c').AsFloat;
                 end;
                 QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                 QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                 QLineaFacturas.Post;
            end;

            //Acumular el TotalImpEnt  (OK)
            if TotalImpEnt<>0 then
            begin
                 ImporteNeto:=ImporteNeto + TotalImpEnt;

                 Inc(NumLineaFactura);

                 QLineaFacturas.Insert;
                 QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                 QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                 QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                 QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                 QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                 QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                 QLineaFacturas.FieldByName('Descripcion_lf').AsString:='IMPORTE ENTRADAS';
                 QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                 QLineaFacturas.FieldByName('Importe_lf').AsFloat:=TotalImpEnt;
                 QLineaFacturas.Post;
            end;

            //Acumular el TotalHorEnt (OK)
            if (TotalHorEnt<>0) and (QClientes.FieldByName('precio_horas_ent_sal_c').AsFloat<>0) then
            begin
                 ImporteAux:=Redondear((ParteEntera(TotalHorEnt) * QClientes.FieldByName('precio_horas_ent_sal_c').AsFloat) +
                                      ((StrToInt(RellenarCeros(ParteDecimal(TotalHorEnt),2,'D'))/60)* QClientes.FieldByName('precio_horas_ent_sal_c').AsFloat), 2);

                 ImporteNeto:=ImporteNeto + ImporteAux;

                 Inc(NumLineaFactura);

                 QLineaFacturas.Insert;
                 QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                 QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                 QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                 QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                 QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                 QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                 QLineaFacturas.FieldByName('Descripcion_lf').AsString:='HORAS ENTRADAS';
                 QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=TotalHorEnt;
                 QLineaFacturas.FieldByName('Unidad_lf').AsString:='hor';
                 QLineaFacturas.FieldByName('Precio_lf').AsFloat:=QClientes.FieldByName('precio_horas_ent_sal_c').AsFloat;
                 QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                 QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                 QLineaFacturas.Post;
            end;

            //Acumular los ImportesEntrada y HorasEntrada con Concepto (OK)
            if ExistenConceptos then
            begin
                 QCabeceraEntradas.Close;
                 QCabeceraEntradas.SQL.Clear;
                 QCabeceraEntradas.SQL.Add(' SELECT ALBARAN_CE, FECHA_ALBARAN_CE, IMPORTE_ENTRADA_CE, HORAS_ENTRADA_CE, CONCEPTO_CE ' +
                                           ' FROM CABECERA_ENTRADAS ' +
                                           ' WHERE EMPRESA_CE=' + QuotedStr(QClientes.FieldByName('Empresa_c').AsString) +
                                           ' AND CLIENTE_CE=' + QuotedStr(QClientes.FieldByName('Codigo_c').AsString) +
                                           ' AND (CONCEPTO_CE IS NOT NULL AND CONCEPTO_CE<>' + QuotedStr('') + ')');
                 QCabeceraEntradas.SQL.Add(' AND (NUMERO_FACTURA_CE IS NULL OR NUMERO_FACTURA_CE=0) ' +
                                                ' AND FECHA_ALBARAN_CE<=' + QuotedStr(AnyoMesDia(cFechaHasta.Text)));
                 QCabeceraEntradas.SQL.Add(' ORDER BY ALBARAN_CE');

                 QCabeceraEntradas.Open;
                 while not QCabeceraEntradas.Eof do
                 begin
                      //Mostrar ImporteEntrada   (OK)
                      if QCabeceraEntradas.FieldByName('IMPORTE_ENTRADA_CE').AsFloat<>0 then
                      begin
                           ImporteNeto:=ImporteNeto + QCabeceraEntradas.FieldByName('IMPORTE_ENTRADA_CE').AsFloat;

                           Inc(NumLineaFactura);

                           QLineaFacturas.Insert;
                           QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                           QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                           QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                           QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                           QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                           QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                           QLineaFacturas.FieldByName('Descripcion_lf').AsString:='IMPORTE ENTRADA';
                           QLineaFacturas.Post;
                           //FicheroIni.WriteString('L' +  IntToStr(NumLineaFactura),'Descripcion','IMPORTE ENTRADA');

                           Inc(NumLineaFactura);
                           QLineaFacturas.Insert;
                           QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                           QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                           QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                           QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                           QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                           QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                           QLineaFacturas.FieldByName('Descripcion_lf').AsString:='ALBARAN: ' + IntToStr(QCabeceraEntradas.FieldByName('ALBARAN_CE').AsInteger) + '-' + DiaMesAnyo(QCabeceraEntradas.FieldByName('FECHA_ALBARAN_CE').AsString);
                           QLineaFacturas.Post;

                           Inc(NumLineaFactura);
                           if Length(QCabeceraEntradas.FieldByName('CONCEPTO_CE').AsString)>30 then
                           begin
                                QLineaFacturas.Insert;
                                QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                QLineaFacturas.FieldByName('Descripcion_lf').AsString:=Copy(QCabeceraEntradas.FieldByName('CONCEPTO_CE').AsString,1,30);
                                QLineaFacturas.Post;

                                Inc(NumLineaFactura);

                                QLineaFacturas.Insert;
                                QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                QLineaFacturas.FieldByName('Descripcion_lf').AsString:=Copy(QCabeceraEntradas.FieldByName('CONCEPTO_CE').AsString,31,30);
                                QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                                QLineaFacturas.FieldByName('Importe_lf').AsFloat:=QCabeceraEntradas.FieldByName('IMPORTE_ENTRADA_CE').AsFloat;
                                QLineaFacturas.Post;
                           end
                           else
                           begin
                                QLineaFacturas.Insert;
                                QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                QLineaFacturas.FieldByName('Descripcion_lf').AsString:=QCabeceraEntradas.FieldByName('CONCEPTO_CE').AsString;
                                QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                                QLineaFacturas.FieldByName('Importe_lf').AsFloat:=QCabeceraEntradas.FieldByName('IMPORTE_ENTRADA_CE').AsFloat;
                                QLineaFacturas.Post;
                           end;
                      end;
                      //Mostrar HorasEntrada    (OK)
                      if (QCabeceraEntradas.FieldByName('HORAS_ENTRADA_CE').AsFloat<>0) and (QClientes.FieldByName('precio_horas_ent_sal_c').AsFloat<>0) then
                      begin
                           ImporteAux:=Redondear((ParteEntera(QCabeceraEntradas.FieldByName('HORAS_ENTRADA_CE').AsFloat) * QClientes.FieldByName('precio_horas_ent_sal_c').AsFloat) +
                                                ((StrToInt(RellenarCeros(ParteDecimal(QCabeceraEntradas.FieldByName('HORAS_ENTRADA_CE').AsFloat),2,'D'))/60)* QClientes.FieldByName('precio_horas_ent_sal_c').AsFloat), 2);


                           ImporteNeto:=ImporteNeto + ImporteAux;

                           Inc(NumLineaFactura);

                           QLineaFacturas.Insert;
                           QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                           QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                           QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                           QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                           QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                           QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                           QLineaFacturas.FieldByName('Descripcion_lf').AsString:='HORAS ENTRADA';
                           QLineaFacturas.Post;

                           Inc(NumLineaFactura);

                           QLineaFacturas.Insert;
                           QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                           QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                           QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                           QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                           QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                           QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                           QLineaFacturas.FieldByName('Descripcion_lf').AsString:='ALBARAN: ' + IntToStr(QCabeceraEntradas.FieldByName('ALBARAN_CE').AsInteger) + '-' + DiaMesAnyo(QCabeceraEntradas.FieldByName('FECHA_ALBARAN_CE').AsString);
                           QLineaFacturas.Post;

                           Inc(NumLineaFactura);
                           if Length(QCabeceraEntradas.FieldByName('CONCEPTO_CE').AsString)>30 then
                           begin
                                QLineaFacturas.Insert;
                                QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                QLineaFacturas.FieldByName('Descripcion_lf').AsString:=Copy(QCabeceraEntradas.FieldByName('CONCEPTO_CE').AsString,1,30);
                                QLineaFacturas.Post;

                                Inc(NumLineaFactura);

                                QLineaFacturas.Insert;
                                QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                QLineaFacturas.FieldByName('Descripcion_lf').AsString:=Copy(QCabeceraEntradas.FieldByName('CONCEPTO_CE').AsString,31,30);
                                QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=QCabeceraEntradas.FieldByName('HORAS_ENTRADA_CE').AsFloat;
                                QLineaFacturas.FieldByName('Unidad_lf').AsString:='hor';
                                QLineaFacturas.FieldByName('Precio_lf').AsFloat:=QClientes.FieldByName('precio_horas_ent_sal_c').AsFloat;
                                QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                                QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                                QLineaFacturas.Post;
                           end
                           else
                           begin
                                QLineaFacturas.Insert;
                                QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                QLineaFacturas.FieldByName('Descripcion_lf').AsString:=QCabeceraEntradas.FieldByName('CONCEPTO_CE').AsString;
                                QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=QCabeceraEntradas.FieldByName('HORAS_ENTRADA_CE').AsFloat;
                                QLineaFacturas.FieldByName('Unidad_lf').AsString:='hor';
                                QLineaFacturas.FieldByName('Precio_lf').AsFloat:=QClientes.FieldByName('precio_horas_ent_sal_c').AsFloat;
                                QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                                QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                                QLineaFacturas.Post;
                           end;
                      end;
                      QCabeceraEntradas.Next;
                 end;
                 QCabeceraEntradas.Close;
            end;

            //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            //++++++++++++++++++++++++ DATOS DE LAS TABLAS CABECERAS-LINEAS DE SALIDA ++++++++++++++++++++
            //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            //Valores Iniciales
            TotalSalido:=0;
            TotalImpSal:=0;
            TotalHorSal:=0;
            ExistenConceptos:=False;

            //Preparacion de la tabla Cabecera de Salidas
            QCabeceraSalidas.Close;
            QCabeceraSalidas.SQL.Clear;
            QCabeceraSalidas.SQL.Add(' SELECT EMPRESA_CS, ALBARAN_CS, FECHA_ALBARAN_CS, IMPORTE_SALIDA_CS, HORAS_SALIDA_CS, TIPO_SALIDA_CS, CONCEPTO_CS ' +
                                     ' FROM CABECERA_SALIDAS ' +
                                     ' WHERE EMPRESA_CS=' +  QuotedStr(QClientes.FieldByName('Empresa_c').AsString) +
                                     ' AND CLIENTE_CS=' + QuotedStr(QClientes.FieldByName('Codigo_c').AsString) +
                                     ' AND (NUMERO_FACTURA_CS IS NULL OR NUMERO_FACTURA_CS=0) ' +
                                     ' AND FECHA_ALBARAN_CS<=' + QuotedStr(AnyoMesDia(cFechaHasta.Text)));
            QCabeceraSalidas.Open;
            //Datos de todas las cabeceras_salida
            while not QCabeceraSalidas.Eof do
            begin
                 TSacadoTsd:=0;
                 //Acumular en TotalImpSal y en TotalHorSal
                 if (QCabeceraSalidas.FieldByName('tipo_salida_cs').AsString='N') and (QCabeceraSalidas.FieldByName('Concepto_cs').AsString='') then //Sin Conceptos
                 begin
                      if QCabeceraSalidas.FieldByName('Importe_salida_cs').AsFloat<>0 then
                         TotalImpSal:=TotalImpSal + QCabeceraSalidas.FieldByName('Importe_salida_cs').AsFloat;
                      if QCabeceraSalidas.FieldByName('horas_salida_cs').AsFloat<>0 then
                         TotalHorSal:=SumarHorMin(TotalHorSal,QCabeceraSalidas.FieldByName('Horas_Salida_cs').AsFloat);
                 end
                 else
                     ExistenConceptos:=True;

                 //Datos de todas las linea_salida
                 QLineaSalidas.Close;
                 QLineaSalidas.SQL.Clear;
                 QLineaSalidas.SQL.Add(' SELECT * FROM LINEA_SALIDAS ' +
                                       ' WHERE EMPRESA_LS=' +  QuotedStr(QClientes.FieldByName('Empresa_c').AsString) +
                                       ' AND ALBARAN_LS=' + IntToStr(QCabeceraSalidas.FieldByName('Albaran_cs').AsInteger));
                 QLineaSalidas.Open;
                 While not QLineaSalidas.Eof do
                 begin
                      //Los palets no se facturan
                      if not EsArticuloPalet(QLineaSalidas.FieldByName('Empresa_ls').AsString,
                                             QLineaSalidas.FieldByName('Familia_ls').AsString,
                                             QLineaSalidas.FieldByName('Articulo_ls').AsString) then
                      begin
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                           //Gregorio 26/10/2011
                           //Acumular en TotalEntrado
                           if ((QTarifas.FieldByName('manejo_palet_t').AsCurrency <> 0) or (QTarifas.FieldByName('frio_palet_t').AsCurrency <> 0)) then
                             TotalSalido:=TotalSalido + QLineaSalidas.FieldByName('palets_ls').AsFloat
                           else
                             TotalSalido:=TotalSalido + QLineaSalidas.FieldByName('Unidades_ls').AsFloat;

                           //Facturacion Diaria - Acumular en TSacadoTsd
                           if cPeriodo.Text='DIARIA' then
                             begin
                             if ((QTarifas.FieldByName('manejo_palet_t').AsCurrency <> 0) or (QTarifas.FieldByName('frio_palet_t').AsCurrency <> 0)) then
                               TSacadoTsd:=TSacadoTsd + QLineaSalidas.FieldByName('palets_ls').AsFloat
                             else
                               TSacadoTsd:=TSacadoTsd + QLineaSalidas.FieldByName('Unidades_ls').AsFloat;
                             end;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                          //sustituido por lo de arriba
                          {
                           if QLineaSalidas.FieldByName('Unidades_ls').AsFloat<>0 then
                           begin
                                TotalSalido:=TotalSalido + QLineaSalidas.FieldByName('Unidades_ls').AsFloat;
                                if cPeriodo.Text='DIARIA' then //Facturacion Diaria
                                   TSacadoTsd:=TSacadoTsd + QLineaSalidas.FieldByName('Unidades_ls').AsFloat;
                           end;
                           }
                      end;
                      QLineaSalidas.Next;
                 end;
                 QlineaSalidas.Close;

                 //Facturacion Diaria - Modificar la tabla TEMP_STOCK_X_DIA
                 if (cPeriodo.Text='DIARIA') and (TSacadoTsd<>0) then
                 begin
                      //Modificamos la tabla TEMP_STOCK_X_DIA
                      QAux.Close;
                      QAux.SQL.Clear;
                      QAux.SQL.Add(' UPDATE TEMP_STOCK_X_DIA ' +
                                   ' SET TOTAL_SACADO_TSX=TOTAL_SACADO_TSX + :Sacado ' +
                                   ' WHERE EMPRESA_TSX=' + QuotedStr(QCabeceraSalidas.FieldByName('Empresa_cs').AsString) +
                                   ' AND FECHA_TSX=' + QuotedStr(QCabeceraSalidas.FieldByName('Fecha_Albaran_cs').AsString));
                      QAux.ParamByName('Sacado').AsFloat:=TSacadoTsd;
                      QAux.ExecSQL;
                 end;
                 QCabeceraSalidas.Next;
            end;
            QCabeceraSalidas.Close;

            //Acumular el TotalImpSal
            if TotalImpSal<>0 then
            begin
                 ImporteNeto:=ImporteNeto + TotalImpSal;

                 Inc(NumLineaFactura);

                 QLineaFacturas.Insert;
                 QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                 QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                 QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                 QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                 QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                 QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                 QLineaFacturas.FieldByName('Descripcion_lf').AsString:='IMPORTE SALIDAS';
                 QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                 QLineaFacturas.FieldByName('Importe_lf').AsFloat:=TotalImpSal;
                 QLineaFacturas.Post;
            end;

            //Acumular el TotalHorSal
            if (TotalHorSal<>0) and (QClientes.FieldByName('precio_horas_ent_sal_c').AsFloat<>0) then
            begin
                 ImporteAux:=Redondear((ParteEntera(TotalHorSal) * QClientes.FieldByName('precio_horas_ent_sal_c').AsFloat) +
                                      ((StrToInt(RellenarCeros(ParteDecimal(TotalHorSal),2,'D'))/60)* QClientes.FieldByName('precio_horas_ent_sal_c').AsFloat), 2);
                 ImporteNeto:=ImporteNeto + ImporteAux;

                 Inc(NumLineaFactura);

                 QLineaFacturas.Insert;
                 QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                 QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                 QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                 QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                 QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                 QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                 QLineaFacturas.FieldByName('Descripcion_lf').AsString:='HORAS SALIDAS';
                 QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=TotalHorSal;
                 QLineaFacturas.FieldByName('Unidad_lf').AsString:='hor';
                 QLineaFacturas.FieldByName('Precio_lf').AsFloat:=QClientes.FieldByName('precio_horas_ent_sal_c').AsFloat;
                 QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                 QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                 QLineaFacturas.Post;
            end;

            //Acumular los ImporteSalida y HorasSalida con Concepto
            if ExistenConceptos then
            begin
                 QCabeceraSalidas.Close;
                 QCabeceraSalidas.SQL.Clear;
                 QCabeceraSalidas.SQL.Add(' SELECT ALBARAN_CS, FECHA_ALBARAN_CS, IMPORTE_SALIDA_CS, HORAS_SALIDA_CS, TIPO_SALIDA_CS, CONCEPTO_CS ' +
                                          ' FROM CABECERA_SALIDAS ' +
                                          ' WHERE EMPRESA_CS=' + QuotedStr(QClientes.FieldByName('Empresa_c').AsString) +
                                          ' AND CLIENTE_CS=' + QuotedStr(QClientes.FieldByName('Codigo_c').AsString) +
                                          ' AND TIPO_SALIDA_CS=' + QuotedStr('N') +
                                          ' AND (CONCEPTO_CS IS NOT NULL AND CONCEPTO_CS<> ' + QuotedStr('') + ')');
                 QCabeceraSalidas.SQL.Add(' AND (NUMERO_FACTURA_CS IS NULL OR NUMERO_FACTURA_CS=0) ' +
                                               ' AND FECHA_ALBARAN_CS<=' + QuotedStr(AnyoMesDia(cFechaHasta.Text)));
                 QCabeceraSalidas.SQL.Add(' ORDER BY ALBARAN_CS');
                 QCabeceraSalidas.Open;
                 While not QCabeceraSalidas.Eof do
                 begin
                      //Mostrar ImporteSalida
                      if QCabeceraSalidas.FieldByName('IMPORTE_SALIDA_CS').AsFloat<>0 then
                      begin
                           ImporteNeto:=ImporteNeto + QCabeceraSalidas.FieldByName('IMPORTE_SALIDA_CS').AsFloat;

                           Inc(NumLineaFactura);

                           QLineaFacturas.Insert;
                           QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                           QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                           QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                           QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                           QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                           QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                           QLineaFacturas.FieldByName('Descripcion_lf').AsString:='IMPORTE SALIDA';
                           QLineaFacturas.Post;

                           Inc(NumLineaFactura);

                           QLineaFacturas.Insert;
                           QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                           QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                           QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                           QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                           QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                           QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                           QLineaFacturas.FieldByName('Descripcion_lf').AsString:='ALBARAN: ' + IntToStr(QCabeceraSalidas.FieldByName('ALBARAN_CS').AsInteger) + '-' + DiaMesAnyo(QCabeceraSalidas.FieldByName('FECHA_ALBARAN_CS').AsString);
                           QLineaFacturas.Post;

                           Inc(NumLineaFactura);
                           if Length(QCabeceraSalidas.FieldByName('CONCEPTO_CS').AsString)>30 then
                           begin
                                QLineaFacturas.Insert;
                                QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                QLineaFacturas.FieldByName('Descripcion_lf').AsString:=Copy(QCabeceraSalidas.FieldByName('CONCEPTO_CS').AsString,1,30);
                                QLineaFacturas.Post;

                                Inc(NumLineaFactura);
                                QLineaFacturas.Insert;
                                QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                QLineaFacturas.FieldByName('Descripcion_lf').AsString:=Copy(QCabeceraSalidas.FieldByName('CONCEPTO_CS').AsString,31,30);
                                QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                                QLineaFacturas.FieldByName('Importe_lf').AsFloat:=QCabeceraSalidas.FieldByName('IMPORTE_SALIDA_CS').AsFloat;
                                QLineaFacturas.Post;
                           end
                           else
                           begin
                                QLineaFacturas.Insert;
                                QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                QLineaFacturas.FieldByName('Descripcion_lf').AsString:=QCabeceraSalidas.FieldByName('CONCEPTO_CS').AsString;
                                QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                                QLineaFacturas.FieldByName('Importe_lf').AsFloat:=QCabeceraSalidas.FieldByName('IMPORTE_SALIDA_CS').AsFloat;
                                QLineaFacturas.Post;
                           end;
                      end;
                      //Mostrar HorasSalida
                      if (QCabeceraSalidas.FieldByName('HORAS_SALIDA_CS').AsFloat<>0) and  (QClientes.FieldByName('precio_horas_ent_sal_c').AsFloat<>0) then
                      begin
                           CantidadAux:=(ParteEntera(QCabeceraSalidas.FieldByName('HORAS_SALIDA_CS').AsFloat) + (StrToInt(ParteDecimal(QCabeceraSalidas.FieldByName('HORAS_SALIDA_CS').AsFloat))/60));
                           ImporteAux:=Redondear((ParteEntera(QCabeceraSalidas.FieldByName('HORAS_SALIDA_CS').AsFloat) * QClientes.FieldByName('precio_horas_ent_sal_c').AsFloat) +
                                                ((StrToInt(RellenarCeros(ParteDecimal(QCabeceraSalidas.FieldByName('HORAS_SALIDA_CS').AsFloat),2,'D'))/60)* QClientes.FieldByName('precio_horas_ent_sal_c').AsFloat), 2);
                           ImporteNeto:=ImporteNeto + ImporteAux;

                           Inc(NumLineaFactura);

                           QLineaFacturas.Insert;
                           QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                           QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                           QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                           QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                           QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                           QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                           QLineaFacturas.FieldByName('Descripcion_lf').AsString:='HORAS SALIDA';
                           QLineaFacturas.Post;

                           Inc(NumLineaFactura);

                           QLineaFacturas.Insert;
                           QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                           QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                           QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                           QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                           QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                           QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                           QLineaFacturas.FieldByName('Descripcion_lf').AsString:='ALBARAN: ' + IntToStr(QCabeceraSalidas.FieldByName('ALBARAN_CS').AsInteger) + '-' + DiaMesAnyo(QCabeceraSalidas.FieldByName('FECHA_ALBARAN_CS').AsString);
                           QLineaFacturas.Post;

                           Inc(NumLineaFactura);
                           if Length(QCabeceraSalidas.FieldByName('CONCEPTO_CS').AsString)>30 then
                           begin
                                QLineaFacturas.Insert;
                                QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                QLineaFacturas.FieldByName('Descripcion_lf').AsString:=Copy(QCabeceraSalidas.FieldByName('CONCEPTO_CS').AsString,1,30);
                                QLineaFacturas.Post;

                                Inc(NumLineaFactura);

                                QLineaFacturas.Insert;
                                QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                QLineaFacturas.FieldByName('Descripcion_lf').AsString:=Copy(QCabeceraSalidas.FieldByName('CONCEPTO_CS').AsString,31,30);
                                QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=QCabeceraSalidas.FieldByName('HORAS_SALIDA_CS').AsFloat;
                                QLineaFacturas.FieldByName('Unidad_lf').AsString:='hor';
                                QLineaFacturas.FieldByName('Precio_lf').AsFloat:=QClientes.FieldByName('precio_horas_ent_sal_c').AsFloat;
                                QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                                QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                                QLineaFacturas.Post;
                           end
                           else
                           begin
                                QLineaFacturas.Insert;
                                QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                QLineaFacturas.FieldByName('Descripcion_lf').AsString:=QCabeceraSalidas.FieldByName('CONCEPTO_CS').AsString;
                                QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=QCabeceraSalidas.FieldByName('HORAS_SALIDA_CS').AsFloat;
                                QLineaFacturas.FieldByName('Unidad_lf').AsString:='hor';
                                QLineaFacturas.FieldByName('Precio_lf').AsFloat:=QClientes.FieldByName('precio_horas_ent_sal_c').AsFloat;
                                QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                                QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                                QLineaFacturas.Post;
                           end;
                      end;
                      QCabeceraSalidas.Next;
                 end;
                 QCabeceraSalidas.Close;
            end;
            //------------ SALIDA DE DATOS EN CASO DE QUE PERIODO_FACTURACION = "D" (DIARIA) --------
            //--------------------------------- FACTURACION DIARIA ----------------------------------

            // MODIFICACION 21/10/2011 VAMOS A METER AQUI EL FRIO PALET

            if (cPeriodo.Text='DIARIA') and
               (QClientes.FieldByName('M3_Facturacion_c').AsInteger=0) and
               (QClientes.FieldByName('M3_refrigeracion_c').AsInteger=0) then
            begin
                 ImpTituloConservExistDiarias:=False;
                 FechaInicio:=0;
                 FechaFin:=0;


                 if QTarifas.FieldByName('frio_palet_t').AsFloat <> 0 then
                   begin
                   UltimoStockTsd:=QClientes.FieldByName('ultimo_stock_pal_c').AsFloat;
                   TarifaDiaria:= QTarifas.FieldByName('frio_palet_t').AsFloat;
                   UnidadDiaria:= 'Pal';
                   DescripcionLF:= 'CONSERVACION:';
                   end
                 else
                   begin
                   UltimoStockTsd:=QClientes.FieldByName('ultimo_stock_c').AsFloat;
                   TarifaDiaria:= QTarifas.FieldByName('precio_congelacion_kg_t').AsFloat;
                   UnidadDiaria:= 'Kg';
                   DescripcionLF:= 'CONSERVACION DE EXISTENCIAS:';
                   end;

                 QAux.Close;
                 QAux.SQL.Clear;
                 QAux.SQL.Add(' SELECT * FROM TEMP_STOCK_X_DIA ' +
                              ' WHERE EMPRESA_TSX=' + QuotedStr(QClientes.FieldByName('Empresa_c').AsString) +
                              ' ORDER BY EMPRESA_TSX, FECHA_TSX ');
                 QAux.Open;

                 swPrimera := true;
                 While not QAux.Eof do
                 begin

                      FechaSiguiente := StrToDate(DiaMesAnyo(QAux.FieldByName('Fecha_tsx').AsString)) + 1;
                      PEntradaDiaSiguiente :=  EntradaDiaSiguiente(QAux.FieldbyName('empresa_tsx').AsString, FechaSiguiente);

                      //buscamos si el primer dia tenemos alguna entrada o salida
                      if (swPrimera) then
                      begin
                         if ((QAux.FieldByName('total_entrado_tsx').AsFloat<>0) or (QAux.FieldByName('total_sacado_tsx').AsFloat<>0))  then
                          begin
                              FechaInicio:=StrToDate(DiaMesAnyo(QAux.FieldByName('Fecha_tsx').AsString));
                              PEntrado:=QAux.FieldByName('total_entrado_tsx').AsFloat;
//                            PSacado:=QAux.FieldByName('total_sacado_tsx').AsFloat;
                          end
                          else if PEntradaDiaSiguiente <> 0  then
                              FechaInicio:=StrToDate(DiaMesAnyo(QAux.FieldByName('Fecha_tsx').AsString));
                      end;

                      if swPrimera then
                        swPrimera := false;

                      //ENTRADAS  y SALIDAS
                      if (PEntradaDiaSiguiente <> 0) and
                          (QAux.FieldByName('total_sacado_tsx').AsFloat<>0) then
                      begin
                           if ((FechaInicio<>0) and (FechaInicio < cFechaHasta.Date)) then
                           begin

                                // Gregorio 18/04/2012 CONSERVACION: STOCK + PALET ENTRADOS - PALET SALIDOS
                                {
                                //Manejo Palet Tenemos que cobrar el palet aunque salga ese dia
                                UltimoStockPalet:=UltimoStockTsd + PEntrado;
                                }
                                //Kg ó Palet Tenemos que controlar bien el stock

                                UltimoStockTsd:=UltimoStockTsd + PEntrado - PSacado;

                                // Gregorio 12/07/2012 para que cobre la conservacion en el dia que salen los Palets tb
                                {
                                if (QAux.FieldByName('total_entrado_tsx').AsFloat=0) and (QAux.FieldByName('total_sacado_tsx').AsFloat>0) then
                                  FechaFin:=StrToDate(DiaMesAnyo(QAux.FieldByName('Fecha_tsx').AsString))
                                else
                                  FechaFin:=StrToDate(DiaMesAnyo(QAux.FieldByName('Fecha_tsx').AsString)) - 1;
                                }

                                FechaFin:=StrToDate(DiaMesAnyo(QAux.FieldByName('Fecha_tsx').AsString));

                                // Gregorio 15/11/2011 Cobro conservacion de PALETS
                                Dias:=DaysBetween(FechaFin, FechaInicio) + 1;

                                {if QTarifas.FieldByName('frio_palet_t').AsFloat <> 0 then
                                  ImporteAux:=Redondear(Dias * UltimoStockPalet * TarifaDiaria, 2)
                                else}
                                ImporteAux:=Redondear(Dias * UltimoStockTsd * TarifaDiaria, 2);
                                ImporteNeto:=ImporteNeto + ImporteAux;

                                if not ImpTituloConservExistDiarias then
                                begin
                                     ImpTituloConservExistDiarias:=True;
                                     Inc(NumLineaFactura);

                                     QLineaFacturas.Insert;
                                     QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                     QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                     QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                     QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                     QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                     QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                     QLineaFacturas.FieldByName('Descripcion_lf').AsString:=DescripcionLF;
                                     QLineaFacturas.Post;
                                end;

                                Inc(NumLineaFactura);
                                if FechaInicio=FechaFin then
                                   Descripcion:=DateToStr(FechaInicio)
                                else
                                    Descripcion:=DateToStr(FechaInicio) + ' hasta ' + DateToStr(FechaFin);

                                QLineaFacturas.Insert;
                                QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                QLineaFacturas.FieldByName('Descripcion_lf').AsString:=Descripcion;

                                // Gregorio 18/04/2012 CONSERVACION: STOCK + PALET ENTRADOS - PALET SALIDOS
                                {if QTarifas.FieldByName('frio_palet_t').AsFloat <> 0 then
                                  QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=UltimoStockPalet
                                else}
                                  QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=UltimoStockTsd;

                                QLineaFacturas.FieldByName('Unidad_lf').AsString:=UnidadDiaria;
                                QLineaFacturas.FieldByName('Precio_lf').AsFloat:=TarifaDiaria;
                                QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                                QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                                QLineaFacturas.Post;

                                FechaInicio:=StrToDate(DiaMesAnyo(QAux.FieldByName('Fecha_tsx').AsString)) + 1;
                                FechaFin:=0;
                                PEntrado:=PEntradaDiaSiguiente;
//                                if DiaMesAnyo(QAux.FieldByName('Fecha_tsx').AsString) < cFechaHasta.text then
                                PSacado:=QAux.FieldByName('total_sacado_tsx').AsFloat
//                                else
//                                  PSacado:=0;
                           end
{
                           else if ((FechaInicio<>0) and (FechaInicio = cFechaHasta.Date)) then
                           begin
                                //Kg ó Palet Tenemos que controlar bien el stock
                                UltimoStockTsd:=UltimoStockTsd + PEntrado - PSacado + QAux.FieldByName('total_entrado_tsx').AsFloat;

                                FechaFin:=StrToDate(DiaMesAnyo(QAux.FieldByName('Fecha_tsx').AsString));

                                // Gregorio 15/11/2011 Cobro conservacion de PALETS
                                Dias:=DaysBetween(FechaFin, FechaInicio) + 1;

                                ImporteAux:=Redondear(Dias * UltimoStockTsd * TarifaDiaria, 2);
                                ImporteNeto:=ImporteNeto + ImporteAux;

                                if not ImpTituloConservExistDiarias then
                                begin
                                     ImpTituloConservExistDiarias:=True;
                                     Inc(NumLineaFactura);

                                     QLineaFacturas.Insert;
                                     QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                     QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                     QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                     QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                     QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                     QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                     QLineaFacturas.FieldByName('Descripcion_lf').AsString:=DescripcionLF;
                                     QLineaFacturas.Post;
                                end;

                                Inc(NumLineaFactura);
                                Descripcion:=DateToStr(FechaInicio);

                                QLineaFacturas.Insert;
                                QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                QLineaFacturas.FieldByName('Descripcion_lf').AsString:=Descripcion;
                                QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=UltimoStockTsd;
                                QLineaFacturas.FieldByName('Unidad_lf').AsString:=UnidadDiaria;
                                QLineaFacturas.FieldByName('Precio_lf').AsFloat:=TarifaDiaria;
                                QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                                QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                                QLineaFacturas.Post;

                                FechaInicio:=StrToDate(DiaMesAnyo(QAux.FieldByName('Fecha_tsx').AsString)) + 1;
                                FechaFin:=0;
                           end
}
                           else
                           begin
                                FechaInicio:=StrToDate(DiaMesAnyo(QAux.FieldByName('Fecha_tsx').AsString));
                                PEntrado:=PEntradaDiaSiguiente;
                                PSacado:=QAux.FieldByName('total_sacado_tsx').AsFloat;
                           end;
                      end
                      else if ((PEntradaDiaSiguiente <> 0)  or
                               (QAux.FieldByName('total_sacado_tsx').AsFloat<>0)) then
                      begin
                            //ENTRADAS
                            if (PEntradaDiaSiguiente <> 0) then
                            begin
                                 if ((FechaInicio<>0) and (FechaInicio < cFechaHasta.Date)) then
                                 begin

                                      // Gregorio 18/04/2012 CONSERVACION: STOCK + PALET ENTRADOS - PALET SALIDOS
                                      {
                                      //Manejo Palet Tenemos que cobrar el palet aunque salga ese dia
                                      UltimoStockPalet:=UltimoStockTsd + PEntrado;
                                      }
                                      //Kg ó Palet Tenemos que controlar bien el stock

                                   UltimoStockTsd:=UltimoStockTsd + PEntrado - PSacado;

                                      // Gregorio 12/07/2012 para que cobre la conservacion en el dia que salen los Palets tb
                                      {
                                      if (QAux.FieldByName('total_entrado_tsx').AsFloat=0) and (QAux.FieldByName('total_sacado_tsx').AsFloat>0) then
                                        FechaFin:=StrToDate(DiaMesAnyo(QAux.FieldByName('Fecha_tsx').AsString))
                                      else
                                        FechaFin:=StrToDate(DiaMesAnyo(QAux.FieldByName('Fecha_tsx').AsString)) - 1;
                                      }

                                      FechaFin:=StrToDate(DiaMesAnyo(QAux.FieldByName('Fecha_tsx').AsString));

                                      // Gregorio 15/11/2011 Cobro conservacion de PALETS
                                      Dias:=DaysBetween(FechaFin, FechaInicio) + 1;

                                      {if QTarifas.FieldByName('frio_palet_t').AsFloat <> 0 then
                                        ImporteAux:=Redondear(Dias * UltimoStockPalet * TarifaDiaria, 2)
                                      else}
                                      ImporteAux:=Redondear(Dias * UltimoStockTsd * TarifaDiaria, 2);
                                      ImporteNeto:=ImporteNeto + ImporteAux;

                                      if not ImpTituloConservExistDiarias then
                                      begin
                                           ImpTituloConservExistDiarias:=True;
                                           Inc(NumLineaFactura);

                                           QLineaFacturas.Insert;
                                           QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                           QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                           QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                           QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                           QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                           QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                           QLineaFacturas.FieldByName('Descripcion_lf').AsString:=DescripcionLF;
                                           QLineaFacturas.Post;
                                      end;

                                      Inc(NumLineaFactura);
                                      if FechaInicio=FechaFin then
                                         Descripcion:=DateToStr(FechaInicio)
                                      else
                                          Descripcion:=DateToStr(FechaInicio) + ' hasta ' + DateToStr(FechaFin);

                                      QLineaFacturas.Insert;
                                      QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                      QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                      QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                      QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                      QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                      QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                      QLineaFacturas.FieldByName('Descripcion_lf').AsString:=Descripcion;

                                      // Gregorio 18/04/2012 CONSERVACION: STOCK + PALET ENTRADOS - PALET SALIDOS
                                      {if QTarifas.FieldByName('frio_palet_t').AsFloat <> 0 then
                                        QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=UltimoStockPalet
                                      else}
                                        QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=UltimoStockTsd;

                                      QLineaFacturas.FieldByName('Unidad_lf').AsString:=UnidadDiaria;
                                      QLineaFacturas.FieldByName('Precio_lf').AsFloat:=TarifaDiaria;
                                      QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                                      QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                                      QLineaFacturas.Post;

                                      FechaInicio:=StrToDate(DiaMesAnyo(QAux.FieldByName('Fecha_tsx').AsString)) + 1;
                                      FechaFin:=0;
                                      PEntrado:=PEntradaDiaSiguiente;
//                                      if DiaMesAnyo(QAux.FieldByName('Fecha_tsx').AsString) < cFechaHasta.text then
                                      PSacado:=QAux.FieldByName('total_sacado_tsx').AsFloat
//                                      else
//                                        PSacado:=0;
                                 end
{
                                 else if ((FechaInicio<>0) and (FechaInicio = cFechaHasta.Date)) then
                                 begin
                                      //Kg ó Palet Tenemos que controlar bien el stock
                                      UltimoStockTsd:=UltimoStockTsd + PEntrado - PSacado + QAux.FieldByName('total_entrado_tsx').AsFloat;

                                      FechaFin:=StrToDate(DiaMesAnyo(QAux.FieldByName('Fecha_tsx').AsString));

                                      // Gregorio 15/11/2011 Cobro conservacion de PALETS
                                      Dias:=DaysBetween(FechaFin, FechaInicio) + 1;

                                      ImporteAux:=Redondear(Dias * UltimoStockTsd * TarifaDiaria, 2);
                                      ImporteNeto:=ImporteNeto + ImporteAux;

                                      if not ImpTituloConservExistDiarias then
                                      begin
                                           ImpTituloConservExistDiarias:=True;
                                           Inc(NumLineaFactura);

                                           QLineaFacturas.Insert;
                                           QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                           QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                           QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                           QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                           QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                           QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                           QLineaFacturas.FieldByName('Descripcion_lf').AsString:=DescripcionLF;
                                           QLineaFacturas.Post;
                                      end;

                                      Inc(NumLineaFactura);
                                      Descripcion:=DateToStr(FechaInicio);

                                      QLineaFacturas.Insert;
                                      QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                      QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                      QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                      QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                      QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                      QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                      QLineaFacturas.FieldByName('Descripcion_lf').AsString:=Descripcion;
                                      QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=UltimoStockTsd;
                                      QLineaFacturas.FieldByName('Unidad_lf').AsString:=UnidadDiaria;
                                      QLineaFacturas.FieldByName('Precio_lf').AsFloat:=TarifaDiaria;
                                      QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                                      QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                                      QLineaFacturas.Post;

                                      FechaInicio:=StrToDate(DiaMesAnyo(QAux.FieldByName('Fecha_tsx').AsString)) + 1;
                                      FechaFin:=0;
                                 end
}
                                 else
                                 begin
                                      FechaInicio:=StrToDate(DiaMesAnyo(QAux.FieldByName('Fecha_tsx').AsString));
                                      PEntrado:=PEntradaDiaSiguiente;
                                      PSacado:=QAux.FieldByName('total_sacado_tsx').AsFloat;
                                 end;
                            end;

                            //SALIDAS
                            if (QAux.FieldByName('total_sacado_tsx').AsFloat<>0) then
                            begin
                                 if ((FechaInicio<>0) and (FechaInicio <= cFechaHasta.Date)) then
                                 begin

                                      // Gregorio 18/04/2012 CONSERVACION: STOCK + PALET ENTRADOS - PALET SALIDOS
                                      {
                                      //Manejo Palet Tenemos que cobrar el palet aunque salga ese dia
                                      UltimoStockPalet:=UltimoStockTsd + PEntrado;
                                      }
                                      //Kg ó Palet Tenemos que controlar bien el stock

                                      UltimoStockTsd:=UltimoStockTsd + PEntrado - PSacado;

                                      // Gregorio 12/07/2012 para que cobre la conservacion en el dia que salen los Palets tb
                                      {
                                      if (QAux.FieldByName('total_entrado_tsx').AsFloat=0) and (QAux.FieldByName('total_sacado_tsx').AsFloat>0) then
                                        FechaFin:=StrToDate(DiaMesAnyo(QAux.FieldByName('Fecha_tsx').AsString))
                                      else
                                        FechaFin:=StrToDate(DiaMesAnyo(QAux.FieldByName('Fecha_tsx').AsString)) - 1;
                                      }

                                      FechaFin:=StrToDate(DiaMesAnyo(QAux.FieldByName('Fecha_tsx').AsString));

                                      // Gregorio 15/11/2011 Cobro conservacion de PALETS
                                      Dias:=DaysBetween(FechaFin, FechaInicio) + 1;

                                      {if QTarifas.FieldByName('frio_palet_t').AsFloat <> 0 then
                                        ImporteAux:=Redondear(Dias * UltimoStockPalet * TarifaDiaria, 2)
                                      else}
                                      ImporteAux:=Redondear(Dias * UltimoStockTsd * TarifaDiaria, 2);
                                      ImporteNeto:=ImporteNeto + ImporteAux;

                                      if not ImpTituloConservExistDiarias then
                                      begin
                                           ImpTituloConservExistDiarias:=True;
                                           Inc(NumLineaFactura);

                                           QLineaFacturas.Insert;
                                           QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                           QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                           QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                           QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                           QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                           QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                           QLineaFacturas.FieldByName('Descripcion_lf').AsString:=DescripcionLF;
                                           QLineaFacturas.Post;
                                      end;

                                      Inc(NumLineaFactura);
                                      if FechaInicio=FechaFin then
                                         Descripcion:=DateToStr(FechaInicio)
                                      else
                                          Descripcion:=DateToStr(FechaInicio) + ' hasta ' + DateToStr(FechaFin);

                                      QLineaFacturas.Insert;
                                      QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                      QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                      QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                      QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                      QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                      QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                      QLineaFacturas.FieldByName('Descripcion_lf').AsString:=Descripcion;

                                      // Gregorio 18/04/2012 CONSERVACION: STOCK + PALET ENTRADOS - PALET SALIDOS
                                      {if QTarifas.FieldByName('frio_palet_t').AsFloat <> 0 then
                                        QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=UltimoStockPalet
                                      else}
                                        QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=UltimoStockTsd;

                                      QLineaFacturas.FieldByName('Unidad_lf').AsString:=UnidadDiaria;
                                      QLineaFacturas.FieldByName('Precio_lf').AsFloat:=TarifaDiaria;
                                      QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                                      QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                                      QLineaFacturas.Post;

                                      FechaInicio:=StrToDate(DiaMesAnyo(QAux.FieldByName('Fecha_tsx').AsString)) + 1;
                                      FechaFin:=0;
                                      PEntrado:=0;
//                                      if DiaMesAnyo(QAux.FieldByName('Fecha_tsx').AsString) < cFechaHasta.text then
                                      PSacado:=QAux.FieldByName('total_sacado_tsx').AsFloat
//                                      else
//                                        PSacado:=0;
                                 end
{
                                 else if ((FechaInicio<>0) and (FechaInicio = cFechaHasta.Date)) then
                                 begin
                                      //Kg ó Palet Tenemos que controlar bien el stock
                                      UltimoStockTsd:=UltimoStockTsd + PEntrado - PSacado + QAux.FieldByName('total_entrado_tsx').AsFloat;

                                      FechaFin:=StrToDate(DiaMesAnyo(QAux.FieldByName('Fecha_tsx').AsString));

                                      // Gregorio 15/11/2011 Cobro conservacion de PALETS
                                      Dias:=DaysBetween(FechaFin, FechaInicio) + 1;

                                      ImporteAux:=Redondear(Dias * UltimoStockTsd * TarifaDiaria, 2);
                                      ImporteNeto:=ImporteNeto + ImporteAux;

                                      if not ImpTituloConservExistDiarias then
                                      begin
                                           ImpTituloConservExistDiarias:=True;
                                           Inc(NumLineaFactura);

                                           QLineaFacturas.Insert;
                                           QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                           QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                           QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                           QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                           QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                           QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                           QLineaFacturas.FieldByName('Descripcion_lf').AsString:=DescripcionLF;
                                           QLineaFacturas.Post;
                                      end;

                                      Inc(NumLineaFactura);
                                      Descripcion:=DateToStr(FechaInicio);

                                      QLineaFacturas.Insert;
                                      QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                      QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                      QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                      QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                      QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                      QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                      QLineaFacturas.FieldByName('Descripcion_lf').AsString:=Descripcion;
                                      QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=UltimoStockTsd;
                                      QLineaFacturas.FieldByName('Unidad_lf').AsString:=UnidadDiaria;
                                      QLineaFacturas.FieldByName('Precio_lf').AsFloat:=TarifaDiaria;
                                      QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                                      QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                                      QLineaFacturas.Post;

                                      FechaInicio:=StrToDate(DiaMesAnyo(QAux.FieldByName('Fecha_tsx').AsString)) + 1;
                                      FechaFin:=0;
                                 end
}
                                 else
                                 begin
                                      FechaInicio:=StrToDate(DiaMesAnyo(QAux.FieldByName('Fecha_tsx').AsString));
                                      PEntrado:=QAux.FieldByName('total_entrado_tsx').AsFloat;
                                      PSacado:=QAux.FieldByName('total_sacado_tsx').AsFloat;
                                 end;
                            end
                      end
                      else
                      begin
                           if FechaInicio=0 then
                           begin
                                FechaInicio:=StrToDate(DiaMesAnyo(QAux.FieldByName('Fecha_tsx').AsString));
                                PEntrado:=0;
                                PSacado:=0;
                           end
                      end;
                      QAux.Next;
                 end;
                 {
                 if FechaInicio<>0 then
                 begin
                      FechaFin:=StrToDate(DiaMesAnyo(QAux.FieldByName('Fecha_tsx').AsString));

                      // Gregorio 15/11/2011 Cobro conservacion de PALETS
                      Dias:=DaysBetween(FechaFin, FechaInicio) + 1;
                      // Gregorio 18/04/2012 CONSERVACION: STOCK + PALET ENTRADOS - PALET SALIDOS

                      //Manejo Palet Tenemos que cobrar el palet aunque salga ese dia
                      //UltimoStockPalet:=UltimoStockTsd + PEntrado;

                      //Kg ó Palet Tenemos que controlar bien el stock
                      UltimoStockTsd:=UltimoStockTsd + PEntrado - PSacado;
                      //if QTarifas.FieldByName('frio_palet_t').AsFloat <> 0 then
                      //  ImporteAux:=Redondear(Dias * UltimoStockPalet * TarifaDiaria, 2)
                      //else
                        ImporteAux:=Redondear(Dias * UltimoStockTsd * TarifaDiaria, 2);
                      ImporteNeto:=ImporteNeto + ImporteAux;

                      //if ((UltimoStockTsd<>0) or (UltimoStockPalet<>0)) then
                      if UltimoStockTsd<>0 then
                      begin
                           if not ImpTituloConservExistDiarias then
                           begin
                                ImpTituloConservExistDiarias:=True;
                                Inc(NumLineaFactura);

                                QLineaFacturas.Insert;
                                QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                                QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                                QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                                QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                                QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                                QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                                QLineaFacturas.FieldByName('Descripcion_lf').AsString:=DescripcionLF;
                                QLineaFacturas.Post;
                           end;
                           Inc(NumLineaFactura);
                           if FechaInicio=FechaFin then
                              Descripcion:=DateToStr(FechaInicio)
                           else
                               Descripcion:=DateToStr(FechaInicio) + ' hasta ' + DateToStr(FechaFin);

                           QLineaFacturas.Insert;
                           QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                           QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                           QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                           QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                           QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                           QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                           QLineaFacturas.FieldByName('Descripcion_lf').AsString:=Descripcion;

                           //if QTarifas.FieldByName('frio_palet_t').AsFloat <> 0 then
                           //  QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=UltimoStockPalet
                           //else
                             QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=UltimoStockTsd;

                           QLineaFacturas.FieldByName('Unidad_lf').AsString:=UnidadDiaria;
                           QLineaFacturas.FieldByName('Precio_lf').AsFloat:=TarifaDiaria;
                           QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                           QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                           QLineaFacturas.Post;
                      end;
                 end;
                 }

                // CARMEN 23/08/2018
                // Facturar si no ha habido movimientos
                UltimoStockTsd:=UltimoStockTsd + PEntrado - PSacado;
                if ((FechaInicio <= cFechaHasta.Date) and (FechaFin = 0) and ((UltimoStockTsd) <> 0)) then
                begin
                  FechaFin:=cFechaHasta.Date;

                  // Gregorio 15/11/2011 Cobro conservacion de PALETS
                  Dias:=DaysBetween(FechaFin, FechaInicio) + 1;

                  ImporteAux:=Redondear(Dias * UltimoStockTsd * TarifaDiaria, 2);
                  ImporteNeto:=ImporteNeto + ImporteAux;

                  if not ImpTituloConservExistDiarias then
                  begin
                       ImpTituloConservExistDiarias:=True;
                       Inc(NumLineaFactura);

                       QLineaFacturas.Insert;
                       QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                       QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                       QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                       QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                       QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                       QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                       QLineaFacturas.FieldByName('Descripcion_lf').AsString:=DescripcionLF;
                       QLineaFacturas.Post;
                  end;

                  Inc(NumLineaFactura);
                  if FechaInicio=FechaFin then
                     Descripcion:=DateToStr(FechaInicio)
                  else
                      Descripcion:=DateToStr(FechaInicio) + ' hasta ' + DateToStr(FechaFin);

                  QLineaFacturas.Insert;
                  QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                  QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                  QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                  QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                  QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                  QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                  QLineaFacturas.FieldByName('Descripcion_lf').AsString:=Descripcion;

                  QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=UltimoStockTsd;

                  QLineaFacturas.FieldByName('Unidad_lf').AsString:=UnidadDiaria;
                  QLineaFacturas.FieldByName('Precio_lf').AsFloat:=TarifaDiaria;
                  QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                  QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                  QLineaFacturas.Post;
                end;

                 // Gregorio Comentado para ver contenido Tabla 21/10/2011
                 //Borramos la tabla TEMP_STOCK_X_DIA
                 QAux.Close;
                 QAux.SQL.Clear;
                 QAux.SQL.Add(' DELETE FROM TEMP_STOCK_X_DIA ' +
                              ' WHERE EMPRESA_TSX=' + QClientes.FieldByName('Empresa_c').AsString);
                 QAux.ExecSQL;

            end;
            //Si hay lineas en la factura
            if NumLineaFactura>0 then
            begin
                 //-- MINIMO A FACTURAR --
                 if ImporteNeto<QClientes.FieldByName('imp_minimo_facturacion_c').AsFloat then
                 begin
                      Inc(NumLineaFactura);

                      QLineaFacturas.Insert;
                      QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                      QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                      QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                      QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                      QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                      QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                      QLineaFacturas.FieldByName('Descripcion_lf').AsString:='TOTAL';
                      QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                      QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteNeto;
                      QLineaFacturas.Post;

                      Inc(NumLineaFactura);

                      QLineaFacturas.Insert;
                      QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                      QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                      QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                      QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                      QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                      QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                      QLineaFacturas.FieldByName('Descripcion_lf').AsString:='MINIMO FACTURACION';
                      QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                      QLineaFacturas.FieldByName('Importe_lf').AsFloat:=QClientes.FieldByName('imp_minimo_facturacion_c').AsFloat;
                      QLineaFacturas.Post;

                      ImporteNeto:=QClientes.FieldByName('imp_minimo_facturacion_c').AsFloat;
                 end;

                 //--- TOTAL DE LA FACTURA --------------------------------
                 ImporteIva:=Redondear((ImporteNeto * Iva)/100,2);
                 ImporteRetencion:= Redondear((ImporteNeto * QClientes.FieldByName('retencion_c').AsFloat)/100,2);
                 ImporteBruto:=ImporteNeto + ImporteIva - ImporteRetencion;

                 //Modificamos la cabecera de la factura
                 QCabeceraFacturas.Close;
                 QCabeceraFacturas.SQL.Clear;
                 if Definitiva then
                    QCabeceraFacturas.SQL.Add('UPDATE CABECERA_FACTURAS ')
                 else
                     QCabeceraFacturas.SQL.Add('UPDATE TEMP_CABECERA_FACTURAS ');
                 QCabeceraFacturas.SQL.Add(' SET IMPORTE_BRUTO_CF=:ImporteBruto ' +
                                               ' ,PORCENTAJE_IVA_CF=:Iva ' +
                                               ' ,IMPORTE_IVA_CF=:ImporteIva ' +
                                               ' ,IMPORTE_NETO_CF=:ImporteNeto ' +
                                               ' ,PORCENTAJE_RETENCION_CF=:Retencion ' +
                                               ' ,IMPORTE_RETENCION_CF=:ImporteRetencion ' +
                                           ' WHERE EMPRESA_CF=' + QuotedStr(QClientes.FieldByName('Empresa_c').AsString) +
                                           ' AND CLIENTE_CF=' + QuotedStr(QClientes.FieldByName('Codigo_c').AsString) +
                                           ' AND NUMERO_FACTURA_CF=' + IntToStr(NumFactura) +
                                           ' AND FECHA_FACTURA_CF=' + QuotedStr(AnyoMesDia(cFechaFactura.Text)));
                 QCabeceraFacturas.ParamByName('ImporteBruto').AsFloat:=ImporteBruto;
                 QCabeceraFacturas.ParamByName('Iva').AsFloat:=Iva;
                 QCabeceraFacturas.ParamByName('ImporteIva').AsFloat:=ImporteIva;
                 QCabeceraFacturas.ParamByName('ImporteNeto').AsFloat:=ImporteNeto;
                 QCabeceraFacturas.ParamByName('Retencion').AsFloat:=QClientes.FieldByName('retencion_c').AsFloat;
                 QCabeceraFacturas.ParamByName('ImporteRetencion').AsFloat:=ImporteRetencion;
                 QCabeceraFacturas.ExecSQL;
                 QCabeceraFacturas.Close;
//            end;

                 //------------- MODIFICACIONES EN LA BASE DE DATOS -------------------------------------
                 if Definitiva then
                 begin
                      try
                         if not DMBaseDatos.BDFrigo.InTransaction then
                            DMBaseDatos.BDFrigo.StartTransaction;

                         //Marcamos el albaran con el nº y fecha de factura
                         QAux.Close;
                         QAux.SQL.Clear;
                         QAux.SQL.Add(' UPDATE CABECERA_ENTRADAS ' +
                                      ' SET NUMERO_FACTURA_CE=' + IntToStr(NumFactura) + ',' +
                                          ' FECHA_FACTURA_CE= ' + QuotedStr(AnyoMesDia(cFechaFactura.Text)) +
                                      ' WHERE EMPRESA_CE=' +  QuotedStr(QClientes.FieldByName('Empresa_c').AsString) +
                                      ' AND CLIENTE_CE=' + QuotedStr(QClientes.FieldByName('Codigo_c').AsString) +
                                      ' AND (NUMERO_FACTURA_CE IS NULL OR NUMERO_FACTURA_CE=0) ' +
                                      ' AND FECHA_ALBARAN_CE<=' + QuotedStr(AnyoMesDia(cFechaHasta.Text)));
                         QAux.ExecSQL;

                         //Marcamos el albaran con el nº y fecha de factura
                         QAux.Close;
                         QAux.SQL.Clear;
                         QAux.SQL.Add(' UPDATE CABECERA_SALIDAS ' +
                                      ' SET NUMERO_FACTURA_CS=' + IntToStr(NumFactura) + ',' +
                                          ' FECHA_FACTURA_CS= ' + QuotedStr(AnyoMesDia(cFechaFactura.Text)) +
                                      ' WHERE EMPRESA_CS=' +  QuotedStr(QClientes.FieldByName('Empresa_c').AsString) +
                                      ' AND CLIENTE_CS=' + QuotedStr(QClientes.FieldByName('Codigo_c').AsString) +
                                      ' AND (NUMERO_FACTURA_CS IS NULL OR NUMERO_FACTURA_CS=0) ' +
                                      ' AND FECHA_ALBARAN_CS<=' + QuotedStr(AnyoMesDia(cFechaHasta.Text)));
                         QAux.ExecSQL;

                         //------------------- Incrementar Numero Factura -------------------------------
                         QAux.Close;
                         QAux.SQL.Clear;
                         QAux.SQL.Add(' UPDATE EMPRESAS ' +
                                      ' SET NUM_FACTURAS_E=NUM_FACTURAS_E + 1 ' +
                                      ' WHERE CODIGO_E=' + QuotedStr(QClientes.FieldByName('Empresa_c').AsString));
                         QAux.ExecSQL;


                         if QTarifas.FieldByName('frio_palet_t').AsFloat <> 0 then
                           begin
                           //---- Actualizar UltimoStock Palet ---------------------------------------------
                           //Le sumo el total salido el mismo dia porque en el calculo del total entrado se lo he restado antes
                           //y en el total salido si que está includo
                           QAux.Close;
                           QAux.SQL.Clear;
                           QAux.SQL.Add(' UPDATE CLIENTES ' +
                                        ' SET ultimo_stock_pal_c=ultimo_stock_pal_c + :TotalEntrado - :TotalSalido + :TotalSalidoMismoDia ' +
                                        ' WHERE EMPRESA_C=' + QuotedStr(QClientes.FieldByName('Empresa_c').AsString) +
                                        ' AND CODIGO_C=' + QuotedStr(QClientes.FieldByName('Codigo_c').AsString));
                           QAux.ParamByName('TotalEntrado').AsFloat:=TotalEntrado;
                           QAux.ParamByName('TotalSalido').AsFloat:=TotalSalido;
                           QAux.ParamByName('TotalSalidoMismoDia').AsFloat:=TotalSalidoMismoDia;
                           QAux.ExecSQL;
                           end
                         else
                           begin
                           //---- Actualizar UltimoStock, PendientePago -----------------------------------
                           //Le sumo el total salido el mismo dia porque en el calculo del total entrado se lo he restado antes
                           //y en el total salido si que está includo
                           QAux.Close;
                           QAux.SQL.Clear;
                           QAux.SQL.Add(' UPDATE CLIENTES ' +
                                        ' SET ULTIMO_STOCK_C=ULTIMO_STOCK_C + :TotalEntrado - :TotalSalido + :TotalSalidoMismoDia, ' +
                                            ' IMP_PENDIENTE_PAGO_C=IMP_PENDIENTE_PAGO_C + :ImporteBruto ' +
                                        ' WHERE EMPRESA_C=' + QuotedStr(QClientes.FieldByName('Empresa_c').AsString) +
                                        ' AND CODIGO_C=' + QuotedStr(QClientes.FieldByName('Codigo_c').AsString));
                           QAux.ParamByName('TotalEntrado').AsFloat:=TotalEntrado;
                           QAux.ParamByName('TotalSalido').AsFloat:=TotalSalido;
                           QAux.ParamByName('TotalSalidoMismoDia').AsFloat:=TotalSalidoMismoDia;
                           QAux.ParamByName('ImporteBruto').AsFloat:=ImporteBruto;
                           QAux.ExecSQL;
                           end;


                         //---- Actualizar Mercancia retenida --------------------------------------------
                         MercanciaRetenidaCliente(QClientes.FieldByName('Empresa_c').AsString,
                                                  QClientes.FieldByName('Codigo_c').AsString);

                         //--------- Actualizar StatusFactura en Periodo_Facturacion si existe -----------
                         QAux.Close;
                         QAux.SQL.Clear;
                         QAux.SQL.Add(' UPDATE PERIODICOS_FACTURACION ' +
                                      ' SET STATUS_FACTURA_PF=' + QuotedStr('S') + ',' +
                                      '     IMPORTE_CARRETILLA_PF = 0, IMPORTE_KWTHERMO_PF = 0, IMPORTE_OFICINA_PF = 0 ' +
                                      ' WHERE EMPRESA_PF=' + QuotedStr(QClientes.FieldByName('Empresa_c').AsString) +
                                      ' AND CLIENTE_PF=' + QuotedStr(QClientes.FieldByName('Codigo_c').AsString) +
                                      ' AND STATUS_FACTURA_PF=' + QuotedStr('N'));
                         QAux.ExecSQL;

                                 //--------- Actualizar StatusFactura, NumeroFactura y FechaFactura en Consumos Electricos si existe -----------
                         QAux.Close;
                         QAux.SQL.Clear;
                         QAux.SQL.Add(' UPDATE CONSUMOS ' +
                                      ' SET FACTURADO_CS=' + QuotedStr('S') + ', ' +
                                      '     LECTURA_ANTERIOR_CS = LECTURA_ACTUAL_CS ' + ', ' +
                                      '     LECTURA_ACTUAL_CS = 0 ' +  ', ' +
                                      '     CONSUMO_CS = 0 ' + ', ' +
                                      '     TOTAL_CS = 0' +
                                      ' WHERE EMPRESA_CS=' + QuotedStr(QClientes.FieldByName('Empresa_c').AsString) +
                                      ' AND CLIENTE_CS=' + QuotedStr(QClientes.FieldByName('Codigo_c').AsString) +
                                      ' AND CONSUMO_CS <> 0' +
                                      ' AND FACTURADO_CS=' + QuotedStr('N'));
                         QAux.ExecSQL;

                         if DMBaseDatos.BDFrigo.InTransaction then
                            DMBaseDatos.BDFrigo.Commit;
                            
                      except
                            MessageDlg (Chr(13) + 'Error al facturar el cliente: ' + QClientes.FieldByName('Codigo_c').AsString, mtError,[mbOk],0);

                            if DMBaseDatos.BDFrigo.InTransaction then
                               DMBaseDatos.BDFrigo.Rollback;
                      end;
                 end;
                 Inc(NumFactura); //Incremento el numero de factura
            end
            else  //No existen lineas
            begin
                //Cabecera
                 QAux.Close;
                 QAux.SQL.Clear;
                 if not Definitiva then    //Informativa
                 begin
                      QAux.Close;
                      QAux.SQL.Clear;
                      QAux.SQL.Add('DELETE FROM TEMP_CABECERA_FACTURAS ' +
                                   ' WHERE EMPRESA_CF=' + QuotedStr(QClientes.FieldByName('Empresa_c').AsString) +
                                   ' AND CLIENTE_CF=' + QuotedStr(QClientes.FieldByName('Codigo_c').AsString) +
                                   ' AND NUMERO_FACTURA_CF=' + IntToStr(NumFactura));

                 end
                 else //Definitiva
                 begin
                      QAux.SQL.Add('DELETE FROM CABECERA_FACTURAS ' +
                                   ' WHERE EMPRESA_CF=' + QuotedStr(QClientes.FieldByName('Empresa_c').AsString) +
                                   ' AND CLIENTE_CF=' + QuotedStr(QClientes.FieldByName('Codigo_c').AsString) +
                                   ' AND NUMERO_FACTURA_CF=' + IntToStr(NumFactura));
                 end;
                 QAux.ExecSQL;
                 //Consumos
                 QAux.Close;
                 QAux.SQL.Clear;
                 if not Definitiva then    //Informativa
                 begin
                      QAux.Close;
                      QAux.SQL.Clear;
                      QAux.SQL.Add('DELETE FROM TEMP_CONSUMO_ELECTRICO_FACTURAS ' +
                                   ' WHERE EMPRESA_CEF=' + QuotedStr(QClientes.FieldByName('Empresa_c').AsString) +
                                   ' AND CLIENTE_CEF=' + QuotedStr(QClientes.FieldByName('Codigo_c').AsString) +
                                   ' AND NUMERO_FACTURA_CEF=' + IntToStr(NumFactura));

                 end
                 else //Definitiva
                 begin
                      QAux.SQL.Add('DELETE FROM CONSUMO_ELECTRICO_FACTURAS ' +
                                   ' WHERE EMPRESA_CEF=' + QuotedStr(QClientes.FieldByName('Empresa_c').AsString) +
                                   ' AND CLIENTE_CEF=' + QuotedStr(QClientes.FieldByName('Codigo_c').AsString) +
                                   ' AND NUMERO_FACTURA_CEF=' + IntToStr(NumFactura));
                 end;
                 QAux.ExecSQL;


            end;
            QClientes.Next;  //Siguiente Cliente
       end;
       QCabeceraFacturas.Close;
       QLineaFacturas.Close;
       ImprimirFacturacion(Definitiva, NumFacturaDesde, NumFactura,cEmpresa.Text, cClienteDesde.Text, cClienteHasta.Text, cFechaFactura.Date);

     except
           On E: Exception do
                 CapturaErrores(E);
     end;
end;

//--------- PULSACION DE TECLAS EN EL COMBO DE TIPO FACTURACION ----------------
procedure TFacturacion.cTipoFacturacionKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key='I') or (Key='i') then  //I
     begin
          Key:=#0;
          cTipoFacturacion.ItemIndex:=0;
          cTipoFacturacion.Text:='INFORMATIVA';
     end
     else if (Key='D') or (Key='d') then //D
     begin
          Key:=#0;
          cTipoFacturacion.ItemIndex:=1;
          cTipoFacturacion.Text:='DEFINITIVA';
     end
     else
         Key:=#0;
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TFacturacion.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TFacturacion.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresa.Text:=CodEmpresa;
     cEmpresa.SetFocus;
end;

procedure TFacturacion.FormDestroy(Sender: TObject);
begin
     QClientes.Close;
     QEmpresas.Close;
     QTarifas.Close;
     QPeriodicosFact.Close;
     QMovimientosExtra.Close;
     QMovimientosEnt.Close;
     QMovimientosSal.Close;
     QCabeceraSalidas.Close;
     QLineaSalidas.Close;
     QCabeceraEntradas.Close;
     QLineaEntradas.Close;
     
     QEmpresas.UnPrepare;
     QClientes.UnPrepare;
     QTarifas.UnPrepare;
end;

//-- SUMA DOS TIEMPOS, ENTENDIENDO QUE LOS DECIMALES SON MINUTOS( VALOR MAXIMO 59)
function TFacturacion.SumarHorMin(Horas1, Horas2: Real):Real;
Var
   Hora, Minutos: Integer;
begin
     Hora:=ParteEntera(Horas1) + ParteEntera(Horas2);
     Minutos:=StrToInt(ParteDecimal(Horas1)) + StrToInt(ParteDecimal(Horas2));

     Hora:=Hora + ((Minutos) div 60);

     Minutos:=Minutos - (((Minutos) div 60) * 60);

     result:=StrToFloat(IntToStr(Hora) + ',' + RellenarCeros(IntToStr(Minutos),2,'I'));
end;

procedure TFacturacion.FormActivate(Sender: TObject);
begin
     if PanelClaves.Enabled then
        cPeriodo.SetFocus;
end;

end.

