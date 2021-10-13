unit FRepeticionFactura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ActnMan, ActnCtrls, ExtCtrls, StdCtrls, ComCtrls, DB,
  DBTables, Mask, DBCtrls,
  Buttons, IniFiles, DateUtils, DBClient, Grids, DBGrids, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxCore, cxDateUtils, dxSkinsCore, dxSkinBlue, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, dxSkinsdxBarPainter, Menus, cxButtons,
  SimpleSearch, dxBar, cxClasses;

type
  TRepetionFactura = class(TForm)
    BarraEstado: TStatusBar;
    PanelClaves: TPanel;
    Panel2: TPanel;
    StaticText13: TStaticText;
    tNomCliente: TPanel;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    Bevel1: TBevel;
    tImporteNeto: TPanel;
    tIva: TPanel;
    tImporteIva: TPanel;
    tImporteBruto: TPanel;
    QClientes: TQuery;
    QPeriodicosFact: TQuery;
    QCabeceraSalidas: TQuery;
    QLineaSalidas: TQuery;
    QCabeceraFacturas: TQuery;
    Timer1: TTimer;
    QEmpresas: TQuery;
    QTarifas: TQuery;
    QCabeceraEntradas: TQuery;
    QLineaEntradas: TQuery;
    QAux: TQuery;
    GroupBox2: TGroupBox;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    cFechaDesde: TcxDateEdit;
    cFechaHasta: TcxDateEdit;
    Panel1: TPanel;
    StaticText12: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    cFechaFactura: TcxDateEdit;
    cFactura: TEdit;
    cEmpresa: TEdit;
    tNomEmpresa: TPanel;
    QLineaFacturas: TQuery;
    QLineaFacturasempresa_lf: TStringField;
    QLineaFacturascliente_lf: TStringField;
    QLineaFacturasnumero_factura_lf: TIntegerField;
    QLineaFacturasfecha_factura_lf: TStringField;
    QLineaFacturasnumero_linea_lf: TIntegerField;
    QLineaFacturascodigo_lf: TStringField;
    QLineaFacturasdescripcion_lf: TStringField;
    QLineaFacturascantidad_lf: TFloatField;
    QLineaFacturasunidad_lf: TStringField;
    QLineaFacturasprecio_lf: TFloatField;
    QLineaFacturastipo_lf: TStringField;
    QLineaFacturasimporte_lf: TFloatField;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    bAceptar: TdxBarLargeButton;
    bSalir: TdxBarLargeButton;
    cLupaEmpresas: TSimpleSearch;
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
    procedure cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaEmpresasClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cPeriodoKeyPress(Sender: TObject; var Key: Char);
    procedure SinFlechasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cFacturaExit(Sender: TObject);
    procedure cFacturaChange(Sender: TObject);
    procedure cFechaFacturaChange(Sender: TObject);

  private
    {Private declarations}
    procedure Mensaje(Texto: String );
    function  Validar():Boolean;
    procedure Facturar();
    procedure DatosEmpresa(Var NumFactura: Integer; Var Iva: Real);
    function  EsArticuloPalet(Empresa, Familia, Articulo: String):Boolean;
    procedure MercanciaRetenidaCliente(Empresa, Cliente: String);
    function  SumarHorMin(Horas1, Horas2: Real):Real;
    function  LocalizarFactuar(): Boolean;

  public
    { Public declarations }
  end;

var
   RepetionFactura: TRepetionFactura;
   FocoAnt:TWinControl;

implementation

uses UGLobal, MBaseDatos, DM, LFactura;

{$R *.dfm}

//------------------------ CREACION DEL FORMULARIO -----------------------------
procedure TRepetionFactura.FormCreate(Sender: TObject);
begin
     Top:=1;
     Left:=0;

     cEmpresa.Text:=EmpresaGlobal;

     //Preparo la tabla de Clientes
     QClientes.Close;
     QClientes.SQL.Clear;
     QClientes.SQL.Add(' SELECT * FROM CLIENTES ' +
                       ' WHERE EMPRESA_C=:Empresa ' +
                       ' AND CODIGO_C=:Cliente ');
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
procedure TRepetionFactura.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

//----------------------- CIERRRE DEL QUERY DEL FORMULARIO ---------------------
procedure TRepetionFactura.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
     CanClose:=True;
end;

//--------------------- MENSAJES DE LA BARRA DE ESTADO -------------------------
procedure TRepetionFactura.Mensaje(Texto: String );
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
procedure TRepetionFactura.Timer1Timer(Sender: TObject);
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
procedure TRepetionFactura.Aceptar(Sender: TObject);
begin
     PostMessage(Handle,WM_NEXTDLGCTL,0,0);
     Application.ProcessMessages;
     if Validar() then   //Comprobamos que los datos son correctos
     begin
          try
             BSalir.Enabled:=False;

             //Abrimos el Cliente
             QClientes.Close;
             QClientes.ParamByName('Empresa').AsString:=QCabeceraFacturas.FieldByName('Empresa_cf').AsString;;
             QClientes.ParamByName('Cliente').AsString:=QCabeceraFacturas.FieldByName('Cliente_cf').AsString;
             QClientes.Open;
             if QClientes.IsEmpty then
                MessageDlg (Chr(13) + 'No existe ningún cliente de la factura', mtError,[mbOk],0)
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
procedure TRepetionFactura.DatosEmpresa(Var NumFactura: Integer; Var Iva: Real);
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
procedure TRepetionFactura.Salir(Sender: TObject);
begin
     Close;
end;

//-------------------------- VALIDACION DE DATOS CABECERA ----------------------
function TRepetionFactura.Validar():Boolean;
begin
     Result:=True;
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
     else if cFactura.Text='' then  //Factura
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'Falta el número de la factura', mtError,[mbOk],0);
          cFactura.SetFocus;
     end
     else if not EsNumerico(cFactura.Text) then  //Factura
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'El número de la factura es incorrecto', mtError,[mbOk],0);
          cFactura.SetFocus;
     end
     else if not EsFecha(cFechaFactura.Text) then  //Fecha Factura
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'Fecha de factura incorrecta', mtError,[mbOk],0);
          cFechaFactura.SetFocus;
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
     else
         LocalizarFactuar();
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TRepetionFactura.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then        //F5 graba
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TRepetionFactura.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TRepetionFactura.ColorExitRellenaCeros(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
         TEdit(Sender).Color:=clWindow;
          if Length(TEdit(Sender).Text)>0 then
             TEdit(Sender).Text:=RellenarCeros(TEdit(Sender).Text,TEdit(Sender).MaxLength,'I');
     end;
end;

//----------------------- CAMBIO DE LA EMPRESA ---------------------------------
procedure TRepetionFactura.cEmpresaChange(Sender: TObject);
begin
     tNomEmpresa.Caption:=NomEmpresa(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
     LocalizarFactuar();
end;

//----------------------- ACTIVA EL COLOR DEL FOCO -----------------------------
procedure TRepetionFactura.ActivarColorFoco(Sender: TObject);
begin
     if Sender is  TEdit then        //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clMoneygreen
     else if Sender is  TcxDateEdit then        //Si el componente es un TcxDateEdit
             TcxDateEdit(Sender).Style.Color:=clMoneygreen
          else if Sender is  TComboBox then        //Si el componente es un TcxDateEdit
                  TComboBox(Sender).Color:=clMoneygreen;
end;

//----------------------- DESACTIVA EL COLOR DEL FOCO -----------------------------
procedure TRepetionFactura.DesActivarColorFoco(Sender: TObject);
begin
     if Sender is  TEdit then        //Si el componente es un TEdit
        TEdit(Sender).Color:=clWindow
     else if Sender is  TcxDateEdit then        //Si el componente es un TcxDateEdit
             TcxDateEdit(Sender).Style.Color:=clWindow
          else if Sender is  TComboBox then        //Si el componente es un TcxDateEdit
                  TComboBox(Sender).Color:=clWindow;
end;

//--------- PULSACION DE TECLAS EN EL COMBO DE PERIODOS DE FACTURACION ---------
procedure TRepetionFactura.cPeriodoKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key<>#68) and (Key<>#77) and (Key<>#81) and (Key<>#83) and (Key<>#8) then   //D, M, D, S, DELETE
     begin
          Key:=#0;
          Application.ProcessMessages;
     end;
end;

//--------- PULSACION DE TECLAS EN EL COMBO DE PERIODOS DE FACTURACION ---------
procedure TRepetionFactura.SinFlechasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=37) or (Key=38) or (Key=39) or (Key=40) then   //FLECHAS
     begin
          Key:=0;
          Application.ProcessMessages;
     end;
end;

//------------------- COMPRUEBA SI LA UNIDAD DE MEDIDA ES EL PALET -------------
function TRepetionFactura.EsArticuloPalet(Empresa, Familia, Articulo: String):Boolean;
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
procedure TRepetionFactura.MercanciaRetenidaCliente(Empresa, Cliente: String);
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
procedure TRepetionFactura.Facturar();
Var
   NumFactura, NumLineaFactura, Dias: Integer;
   TotalTipo0, TotalTipo1, TotalTipo2, TotalTipo3, TotalTipo4, TotalEntrado, TotalImpEnt, TotalHorEnt, TEntradoTsd: Real;
   TotalSalido, TotalImpSal, TotalHorSal, TSacadoTsd, UltimoStockTsd, PEntrado, PSacado, ImporteBrutoAnt: Real;
   Iva, ImporteNeto, ImporteIva, ImporteBruto, ImporteAux, CantidadAux, PrecioHora1, PrecioHora2, UltimoStock: Real;
   Descripcion: String;
   ExistenConceptos, ImpTituloConservExistDiarias: Boolean;
   FechaVencimiento, FechaInicio, FechaFin, FechaTsd: TDate;
begin
    try
       DatosEmpresa(NumFactura, Iva);  //Leemos el nº de factura y el iva de la empresa (El nº de factura no nos hace falta)

       ImporteBrutoAnt:=QCabeceraFacturas.FieldByName('Importe_Bruto_cf').AsFloat;
       UltimoStock:=QCabeceraFacturas.FieldByName('Ultimo_Stock_cf').AsFloat;
       
       NumFactura:=QCabeceraFacturas.FieldByName('Numero_Factura_cf').AsInteger;
       NumLineaFactura:=0;  //Inicialmente no hay lineas
       ImporteNeto:=0;
       ImporteBruto:=0;

       //Abrimos la tabla Tarifas
       QTarifas.Close;
       QTarifas.ParamByName('Empresa').AsString:=QClientes.FieldByName('Empresa_c').AsString;
       QTarifas.ParamByName('Codigo').AsString:=QClientes.FieldByName('Tarifa_c').AsString;
       QTarifas.Open;

       QLineaFacturas.Close;
       QLineaFacturas.SQL.Clear;
       QLineaFacturas.SQL.Add(' DELETE FROM LINEA_FACTURAS ' +
                              ' WHERE EMPRESA_LF=' + QuotedStr(cEmpresa.Text) +
                              ' AND NUMERO_FACTURA_LF=' + IntToStr(NumFactura) +
                              ' AND FECHA_FACTURA_LF=' + QuotedStr(AnyoMesDia(cFechaFactura.Text)));
       QLineaFacturas.ExecSQL;
       QLineaFacturas.Close;
       QLineaFacturas.SQL.Clear;
       QLineaFacturas.SQL.Add('SELECT * FROM LINEA_FACTURAS ');
       QLineaFacturas.Open;

       QCabeceraFacturas.SQL.Add(' DELETE FROM CABECERA_FACTURAS ' +
                                 ' WHERE EMPRESA_CF=' + QuotedStr(cEmpresa.Text) +
                                 ' AND CLIENTE_CF=' + QuotedStr(QClientes.FieldByName('Codigo_c').AsString) +
                                 ' AND NUMERO_FACTURA_CF=' + IntToStr(NumFactura) +
                                 ' AND FECHA_FACTURA_CF=' + QuotedStr(AnyoMesDia(cFechaFactura.Text)));
       QCabeceraFacturas.ExecSQL;
       QCabeceraFacturas.Close;
       QCabeceraFacturas.SQL.Clear;
       QCabeceraFacturas.SQL.Add('SELECT * FROM CABECERA_FACTURAS ');
       QCabeceraFacturas.Open;

       FechaVencimiento:=IncDay(cFechaFactura.Date,QClientes.FieldByName('dias_pago_c').AsInteger);

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
       QCabeceraFacturas.FieldByName('Ultimo_Stock_cf').AsFloat:=UltimoStock;
       QCabeceraFacturas.FieldByName('Fecha_Contabilizacion_cf').AsString:='';
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
                               ' AND STATUS_FACTURA_PF=' + QuotedStr('S'));
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
            if (QPeriodicosFact.FieldByName('kw_thermoking_pf').AsInteger<>0) and (QClientes.FieldByName('precio_kw_thermo_c').AsFloat<>0) then
            begin
                 Inc(NumLineaFactura);   //Incrementamos el nº de linea de la factura

                 ImporteAux:=Redondear(QPeriodicosFact.FieldByName('kw_thermoking_pf').AsInteger * QClientes.FieldByName('precio_kw_thermo_c').AsFloat,2);
                 ImporteNeto:=ImporteNeto + ImporteAux;

                 QLineaFacturas.Insert;
                 QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
                 QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                 QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
                 QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
                 QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
                 QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
                 QLineaFacturas.FieldByName('Descripcion_lf').AsString:='TIEMPO THERMOKING';
                 QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=QPeriodicosFact.FieldByName('kw_thermoking_pf').AsInteger;
                 QLineaFacturas.FieldByName('Unidad_lf').AsString:='kw';
                 QLineaFacturas.FieldByName('Precio_lf').AsFloat:=QClientes.FieldByName('precio_kw_thermo_c').AsFloat;
                 QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                 QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                 QLineaFacturas.Post;
            end;
            //HORAS CLIMATIZACION (OK)
            if (QPeriodicosFact.FieldByName('horas_clima_pf').AsFloat<>0) and (QClientes.FieldByName('precio_hor_clima_c').AsFloat<>0) then
            begin
                 Inc(NumLineaFactura);   //Incrementamos el nº de linea de la factura

                 ImporteAux:=Redondear((ParteEntera(QPeriodicosFact.FieldByName('horas_clima_pf').AsFloat) * QClientes.FieldByName('precio_hor_clima_c').AsFloat) +
                                      (StrToInt(RellenarCeros(ParteDecimal(QPeriodicosFact.FieldByName('horas_clima_pf').AsFloat),2,'D'))/60)* QClientes.FieldByName('precio_hor_clima_c').AsFloat,2);
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
       end;
       QPeriodicosFact.Close;
       //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
       //++++++++++++++++    FACTURACION DIARIA                 ++++++++++
       //++++++++++++++++    DATOS DE LA TABLA TEMP_STOCK_X_DIA ++++++++++
       //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
       if QClientes.FieldByName('Periodo_Factura_c').AsString='D' then  //Facturacion Diaria
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
       TotalImpEnt:=0;
       TotalHorEnt:=0;
       ExistenConceptos:=False;

       //Preparacion de la tabla Cabecera de Entradas
       QCabeceraEntradas.Close;
       QCabeceraEntradas.SQL.Clear;
       QCabeceraEntradas.SQL.Add(' SELECT * FROM CABECERA_ENTRADAS ' +
                                 ' WHERE EMPRESA_CE=' +  QuotedStr(QClientes.FieldByName('Empresa_c').AsString) +
                                 ' AND CLIENTE_CE=' + QuotedStr(QClientes.FieldByName('Codigo_c').AsString) +
                                 ' AND NUMERO_FACTURA_CE=' + IntToStr(NumFactura) +
                                 ' AND FECHA_FACTURA_CE=' + QuotedStr(AnyoMesDia(cFechaFactura.Text)) +
                                 ' AND FECHA_ALBARAN_CE<=' + QuotedStr(AnyoMesDia(cFechaHasta.Text)));

       //Abrimos la tabla de Cabeceras de Entrada
       QCabeceraEntradas.Open;
       While not QCabeceraEntradas.Eof do  //Para cada Entrada
       begin
            TEntradoTsd:=0;
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
                      TotalEntrado:=TotalEntrado + QLineaEntradas.FieldByName('Unidades_le').AsFloat;

                      //Facturacion Diaria - Acumular en TEntradoTsd
                      if QClientes.FieldByName('Periodo_Factura_c').AsString='D' then  //Facturacion Diaria
                         TEntradoTsd:=TEntradoTsd + QLineaEntradas.FieldByName('Unidades_le').AsFloat;

                      //Vemos si hay unidades salidas con la misma fecha de entrada y las restamos
                      QAux.Close;
                      QAux.SQL.Clear;
                      QAux.SQL.Add(' SELECT UNID_SAL_MISMO_DIA_AL FROM ALMACENES ' +
                                   ' WHERE EMPRESA_AL=' + QuotedStr(QLineaEntradas.FieldByName('Empresa_le').AsString) +
                                   ' AND CLIENTE_AL=' + QuotedStr(QCabeceraEntradas.FieldByName('Cliente_ce').AsString) +
                                   ' AND LOTE_AL=' + QuotedStr(QLineaEntradas.FieldByName('Lote_le').AsString));
                      QAux.Open;
                      if QAux.FieldByName('UNID_SAL_MISMO_DIA_AL').AsFloat<>0 then
                         TotalEntrado:=TotalEntrado  - QAux.FieldByName('UNID_SAL_MISMO_DIA_AL').AsFloat;
                      QAux.Close;

                      //Acumulamos en el tipo de manejo
                      case StrToInt(QLineaEntradas.FieldByName('Manejo_le').AsString) of
                           0: TotalTipo0:=TotalTipo0 + QLineaEntradas.FieldByName('Unidades_le').AsFloat;   //Manejo 0
                           1: TotalTipo1:=TotalTipo1 + QLineaEntradas.FieldByName('Unidades_le').AsFloat;   //Manejo 1
                           2: TotalTipo2:=TotalTipo2 + QLineaEntradas.FieldByName('Unidades_le').AsFloat;   //Manejo 2
                           3: TotalTipo3:=TotalTipo3 + QLineaEntradas.FieldByName('Unidades_le').AsFloat;   //Manejo 3
                           4: TotalTipo4:=TotalTipo4 + QLineaEntradas.FieldByName('Unidades_le').AsFloat;   //Manejo 4
                      end;
                 end;
                 QLineaEntradas.Next;
            end;
            QLineaEntradas.Close;
            //Facturacion Diaria - Modificar la tabla TEMP_STOCK_X_DIA  (OK)
            if (QClientes.FieldByName('Periodo_Factura_c').AsString='D') and (TEntradoTsd<>0) then
            begin
                 QAux.Close;
                 QAux.SQL.Clear;
                 QAux.SQL.Add(' UPDATE TEMP_STOCK_X_DIA ' +
                              ' SET TOTAL_ENTRADO_TSX=TOTAL_ENTRADO_TSX + :Entrado ' +
                              ' WHERE EMPRESA_TSX=' + QuotedStr(QCabeceraEntradas.FieldByName('Empresa_ce').AsString) +
                              ' AND FECHA_TSX=' + QuotedStr(QCabeceraEntradas.FieldByName('Fecha_Albaran_ce').AsString));
                 QAux.ParamByName('Entrado').AsFloat:=TEntradoTsd;
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

       //Acumular los TotalTipoX o Manejos

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

       //Acumular la conservacion de entradas  (OK)
       if (QClientes.FieldByName('Periodo_Factura_c').AsString<>'D') and
          (QClientes.FieldByName('m3_facturacion_c').AsInteger=0) and
          (TotalEntrado<>0) and
          (QTarifas.FieldByName('precio_congelacion_kg_t').AsFloat<>0) then
       begin
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
            QLineaFacturas.FieldByName('Unidad_lf').AsString:='kg';
            QLineaFacturas.FieldByName('Precio_lf').AsFloat:=QTarifas.FieldByName('precio_congelacion_kg_t').AsFloat;
            QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
            QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
            QLineaFacturas.Post;
       end;

       //Acumular la conservacion de existencias (OK)
       if (QClientes.FieldByName('Periodo_Factura_c').AsString<>'D') and
          (QClientes.FieldByName('m3_facturacion_c').AsInteger=0) and
          (QClientes.FieldByName('m3_refrigeracion_c').AsInteger=0) and
          (UltimoStock>0) and
          (QTarifas.FieldByName('precio_congelacion_kg_t').AsFloat<>0) then
       begin
            ImporteAux:=Redondear(UltimoStock * QTarifas.FieldByName('precio_congelacion_kg_t').AsFloat, 2);
            ImporteNeto:=ImporteNeto + ImporteAux;

            Inc(NumLineaFactura);

            QLineaFacturas.Insert;
            QLineaFacturas.FieldByName('Empresa_lf').AsString:=QClientes.FieldByName('Empresa_c').AsString;
            QLineaFacturas.FieldByName('Cliente_lf').AsString:=QClientes.FieldByName('Codigo_c').AsString;
            QLineaFacturas.FieldByName('Numero_Factura_lf').AsInteger:=NumFactura;
            QLineaFacturas.FieldByName('Fecha_Factura_lf').AsString:=AnyoMesDia(cFechaFactura.Text);
            QLineaFacturas.FieldByName('Numero_Linea_lf').AsInteger:=NumLineaFactura;
            QLineaFacturas.FieldByName('Codigo_lf').AsString:='';
            QLineaFacturas.FieldByName('Descripcion_lf').AsString:='CONSERVACION EXISTENCIAS';
            QLineaFacturas.FieldByName('Cantidad_lf').AsFloat:=UltimoStock;
            QLineaFacturas.FieldByName('Unidad_lf').AsString:='kg';
            QLineaFacturas.FieldByName('Precio_lf').AsFloat:=QTarifas.FieldByName('precio_congelacion_kg_t').AsFloat;
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
                                      ' AND (CONCEPTO_CE IS NOT NULL AND CONCEPTO_CE<>' + QuotedStr('') + ')' +
                                      ' AND NUMERO_FACTURA_CE=' + IntToStr(NumFactura) +
                                      ' AND FECHA_ALBARAN_CE<=' + QuotedStr(AnyoMesDia(cFechaHasta.Text)) +
                                      ' ORDER BY ALBARAN_CE');
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
                                ' AND NUMERO_FACTURA_CS=' + IntToStr(NumFactura) +
                                ' AND FECHA_FACTURA_CS=' + QuotedStr(AnyoMesDia(cFechaFactura.Text)) +
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
                      if QLineaSalidas.FieldByName('Unidades_ls').AsFloat<>0 then
                      begin
                           TotalSalido:=TotalSalido + QLineaSalidas.FieldByName('Unidades_ls').AsFloat;
                           if QClientes.FieldByName('Periodo_Factura_c').AsString='D' then
                              TSacadoTsd:=TSacadoTsd + QLineaSalidas.FieldByName('Unidades_ls').AsFloat;
                      end;
                 end;
                 QLineaSalidas.Next;
            end;
            QlineaSalidas.Close;

            //Facturacion Diaria - Modificar la tabla TEMP_STOCK_X_DIA
            if (QClientes.FieldByName('Periodo_Factura_c').AsString='D') and (TSacadoTsd<>0) then
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
                                     ' AND (CONCEPTO_CS IS NOT NULL AND CONCEPTO_CS<> ' + QuotedStr('') + ')' +
                                     ' AND NUMERO_FACTURA_CS=' + IntToStr(NumFactura) +
                                     ' AND FECHA_ALBARAN_CS<=' + QuotedStr(AnyoMesDia(cFechaHasta.Text)) +
                                     ' ORDER BY ALBARAN_CS');
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
       if (QClientes.FieldByName('Periodo_Factura_c').AsString='D') and (QClientes.FieldByName('M3_Facturacion_c').AsInteger=0) and (QClientes.FieldByName('M3_refrigeracion_c').AsInteger=0) then
       begin
            ImpTituloConservExistDiarias:=False;
            FechaInicio:=0;
            FechaFin:=0;
            UltimoStockTsd:=UltimoStock;

            QAux.Close;
            QAux.SQL.Clear;
            QAux.SQL.Add(' SELECT * FROM TEMP_STOCK_X_DIA ' +
                         ' WHERE EMPRESA_TSX=' + QuotedStr(QClientes.FieldByName('Empresa_c').AsString) +
                         ' ORDER BY EMPRESA_TSX, FECHA_TSX ');
            QAux.Open;
            While not QAux.Eof do
            begin
                 if (QAux.FieldByName('total_entrado_tsx').AsFloat<>0) or (QAux.FieldByName('total_sacado_tsx').AsFloat<>0) then
                 begin
                      if FechaInicio<>0 then
                      begin
                           FechaFin:=StrToDate(DiaMesAnyo(QAux.FieldByName('Fecha_tsx').AsString)) - 1;
                           UltimoStockTsd:=UltimoStockTsd + PEntrado - PSacado;
                           Dias:=DaysBetween(FechaFin, FechaInicio) + 1;
                           ImporteAux:=Redondear(Dias * UltimoStockTsd * QTarifas.FieldByName('precio_congelacion_kg_t').AsFloat, 2);
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
                                QLineaFacturas.FieldByName('Descripcion_lf').AsString:='CONSERVACION DE EXISTENCIAS:';
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
                           QLineaFacturas.FieldByName('Unidad_lf').AsString:='Kg';
                           QLineaFacturas.FieldByName('Precio_lf').AsFloat:=QTarifas.FieldByName('precio_congelacion_kg_t').AsFloat;
                           QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                           QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                           QLineaFacturas.Post;

                           FechaInicio:=StrToDate(DiaMesAnyo(QAux.FieldByName('Fecha_tsx').AsString));
                           FechaFin:=0;
                           PEntrado:=QAux.FieldByName('total_entrado_tsx').AsFloat;
                           PSacado:=QAux.FieldByName('total_sacado_tsx').AsFloat;
                      end
                      else
                      begin
                           FechaInicio:=StrToDate(DiaMesAnyo(QAux.FieldByName('Fecha_tsx').AsString));
                           PEntrado:=QAux.FieldByName('total_entrado_tsx').AsFloat;
                           PSacado:=QAux.FieldByName('total_sacado_tsx').AsFloat;
                      end;
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
            if FechaInicio<>0 then
            begin
                 FechaFin:=StrToDate(DiaMesAnyo(QAux.FieldByName('Fecha_tsx').AsString));
                 UltimoStockTsd:=UltimoStockTsd + PEntrado - PSacado;
                 Dias:=DaysBetween(FechaFin, FechaInicio) + 1;
                 ImporteAux:=Redondear(Dias * UltimoStockTsd * QTarifas.FieldByName('precio_congelacion_kg_t').AsFloat,2);
                 ImporteNeto:=ImporteNeto + ImporteAux;
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
                           QLineaFacturas.FieldByName('Descripcion_lf').AsString:='CONSERVACION DE EXISTENCIAS:';
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
                      QLineaFacturas.FieldByName('Unidad_lf').AsString:='kg';
                      QLineaFacturas.FieldByName('Precio_lf').AsFloat:=QTarifas.FieldByName('precio_congelacion_kg_t').AsFloat;
                      QLineaFacturas.FieldByName('Tipo_lf').AsString:='1';
                      QLineaFacturas.FieldByName('Importe_lf').AsFloat:=ImporteAux;
                      QLineaFacturas.Post;
                 end;
            end;
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
            ImporteBruto:=ImporteNeto + ImporteIva;

            //Modificamos la cabecera de la factura
            QCabeceraFacturas.Close;
            QCabeceraFacturas.SQL.Clear;
            QCabeceraFacturas.SQL.Add('UPDATE CABECERA_FACTURAS ' +
                                      ' SET IMPORTE_BRUTO_CF=:ImporteBruto ' +
                                          ' ,PORCENTAJE_IVA_CF=:Iva ' +
                                          ' ,IMPORTE_IVA_CF=:ImporteIva ' +
                                          ' ,IMPORTE_NETO_CF=:ImporteNeto ' +
                                      ' WHERE EMPRESA_CF=' + QuotedStr(QClientes.FieldByName('Empresa_c').AsString) +
                                      ' AND CLIENTE_CF=' + QuotedStr(QClientes.FieldByName('Codigo_c').AsString) +
                                      ' AND NUMERO_FACTURA_CF=' + IntToStr(NumFactura) +
                                      ' AND FECHA_FACTURA_CF=' + QuotedStr(AnyoMesDia(cFechaFactura.Text)));
            QCabeceraFacturas.ParamByName('ImporteBruto').AsFloat:=ImporteBruto;
            QCabeceraFacturas.ParamByName('Iva').AsFloat:=Iva;
            QCabeceraFacturas.ParamByName('ImporteIva').AsFloat:=ImporteIva;
            QCabeceraFacturas.ParamByName('ImporteNeto').AsFloat:=ImporteNeto;
            QCabeceraFacturas.ExecSQL;
            QCabeceraFacturas.Close;
       end;

       //------------- MODIFICAICONES EN LA BASE DE DATOS -------------------------------------
       try
          if not DMBaseDatos.BDFrigo.InTransaction then
             DMBaseDatos.BDFrigo.StartTransaction;

          //---- Actualizar PendientePago --------------------------------------
          QAux.Close;
          QAux.SQL.Clear;
          QAux.SQL.Add(' UPDATE CLIENTES ' +
                       ' SET IMP_PENDIENTE_PAGO_C=IMP_PENDIENTE_PAGO_C + :ImporteBruto ' +
                       ' WHERE EMPRESA_C=' + QuotedStr(QClientes.FieldByName('Empresa_c').AsString) +
                       ' AND CODIGO_C=' + QuotedStr(QClientes.FieldByName('Codigo_c').AsString));
          QAux.ParamByName('ImporteBruto').AsFloat:=ImporteBruto - ImporteBrutoAnt;
          QAux.ExecSQL;

          //---- Actualizar Mercancia retenida --------------------------------------------
          MercanciaRetenidaCliente(QClientes.FieldByName('Empresa_c').AsString,
                                   QClientes.FieldByName('Codigo_c').AsString);

          ImprimirFacturacion(True,                                        //Definitiva
                              NumFactura,                                  //Factura desde
                              NumFactura,                                  //Factura Hasta
                              cEmpresa.Text,                               //Empresa
                              QClientes.FieldByName('Codigo_c').AsString,  //Cliente Desde
                              QClientes.FieldByName('Codigo_c').AsString,  //Cliente Hasta
                              cFechaFactura.Date);

          if DMBaseDatos.BDFrigo.InTransaction then
             DMBaseDatos.BDFrigo.Commit;

       except
             MessageDlg (Chr(13) + 'Error al facturar el cliente: ' + QClientes.FieldByName('Codigo_c').AsString, mtError,[mbOk],0);

             if DMBaseDatos.BDFrigo.InTransaction then
                DMBaseDatos.BDFrigo.Rollback;
       end;
       QCabeceraFacturas.Close;
       QLineaFacturas.Close;
     except
           On E: Exception do
                 CapturaErrores(E);
     end;
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TRepetionFactura.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TRepetionFactura.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresa.Text:=CodEmpresa;
     cEmpresa.SetFocus;
end;

procedure TRepetionFactura.FormDestroy(Sender: TObject);
begin
     QClientes.Close;
     QEmpresas.Close;
     QTarifas.Close;
     QPeriodicosFact.Close;
     QCabeceraSalidas.Close;
     QLineaSalidas.Close;
     QCabeceraEntradas.Close;
     QLineaEntradas.Close;
     
     QEmpresas.UnPrepare;
     QClientes.UnPrepare;
     QTarifas.UnPrepare;
end;

//-- SUMA DOS TIEMPOS, ENTENDIENDO QUE LOS DECIMALES SON MINUTOS( VALOR MAXIMO 59)
function TRepetionFactura.SumarHorMin(Horas1, Horas2: Real):Real;
Var
   Hora, Minutos: Integer;
begin
     Hora:=ParteEntera(Horas1) + ParteEntera(Horas2);
     Minutos:=StrToInt(ParteDecimal(Horas1)) + StrToInt(ParteDecimal(Horas2));

     Hora:=Hora + ((Minutos) div 60);

     Minutos:=Minutos - (((Minutos) div 60) * 60);

     result:=StrToFloat(IntToStr(Hora) + ',' + RellenarCeros(IntToStr(Minutos),2,'I'));
end;

procedure TRepetionFactura.cFacturaExit(Sender: TObject);
begin
     cFactura.Color:=clWindow;
end;

procedure TRepetionFactura.cFacturaChange(Sender: TObject);
begin
     LocalizarFactuar();
end;

function TRepetionFactura.LocalizarFactuar():Boolean;
begin
     if (cEmpresa.Text<>'') and (tNomEmpresa.Caption<>'') and (cFactura.Text<>'') and EsFecha(cFechaFactura.Text) then
      begin
           QCabeceraFacturas.Close;
           QCabeceraFacturas.SQL.Clear;
           QCabeceraFacturas.SQL.Add(' SELECT * FROM CABECERA_FACTURAS ' +
                             ' WHERE EMPRESA_CF=:Empresa ' +
                             ' AND NUMERO_FACTURA_CF=:Factura ' +
                             ' AND FECHA_FACTURA_CF=:Fecha');
           QCabeceraFacturas.ParamByName('Empresa').AsString:=RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I');
           QCabeceraFacturas.ParamByName('Factura').AsInteger:=StrToInt(cFactura.Text);
           QCabeceraFacturas.ParamByName('Fecha').AsString:=AnyoMesDia(cFechaFactura.Text);
           QCabeceraFacturas.Open;
           if not QCabeceraFacturas.IsEmpty then
           begin
                tNomCliente.Caption:=QCabeceraFacturas.FieldByName('Cliente_cf').AsString + '-' + NomCliente(QCabeceraFacturas.FieldByName('Empresa_cf').AsString, QCabeceraFacturas.FieldByName('Cliente_cf').AsString);
                tImporteNeto.Caption:=FormatFloat('0.00',QCabeceraFacturas.FieldByName('Importe_Neto_cf').AsFloat);
                tIva.Caption:=FormatFloat('0',QCabeceraFacturas.FieldByName('Porcentaje_Iva_cf').AsFloat);
                tImporteIva.Caption:=FormatFloat('0.00',QCabeceraFacturas.FieldByName('Importe_Iva_cf').AsFloat);
                tImportebruto.Caption:=FormatFloat('0.00',QCabeceraFacturas.FieldByName('Importe_Bruto_cf').AsFloat);
                BAceptar.Enabled:=True;
                Result:=True;
           end
           else
           begin
                BAceptar.Enabled:=False;
                Result:=False;
           end;
      end
      else
      begin
           BAceptar.Enabled:=False;
           Result:=False;
      end;
end;

procedure TRepetionFactura.cFechaFacturaChange(Sender: TObject);
begin
     LocalizarFactuar();
end;

end.
