unit FClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ActnMan, ActnCtrls, ExtCtrls, StdCtrls, ComCtrls, DB,
  DBTables, Mask, DBCtrls,
  Buttons, Grids, DBGrids, QuickRpt,
  QRCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxCore,
  cxDateUtils, cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit, cxDBEdit,
  dxSkinsdxBarPainter, Menus, cxButtons, SimpleSearch, dxBar, cxClasses,
  cxCurrencyEdit;

type
  TClientes = class(TForm)
    BarraEstado: TStatusBar;
    Timer1: TTimer;
    QMaestro: TQuery;
    DSMaestro: TDataSource;
    PanelDatos: TPanel;
    QContar: TQuery;
    Paginas: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    StaticText4: TStaticText;
    cDomicilio: TcxDBTextEdit;
    StaticText32: TStaticText;
    cPoblacion: TcxDBTextEdit;
    StaticText5: TStaticText;
    GroupBox2: TGroupBox;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    cPoblacionCorreo: TcxDBTextEdit;
    cDomicilioCorreo: TcxDBTextEdit;
    StaticText33: TStaticText;
    cCpCliente: TcxDBTextEdit;
    cCpCorreo: TcxDBTextEdit;
    GroupBox4: TGroupBox;
    StaticText36: TStaticText;
    StaticText37: TStaticText;
    StaticText38: TStaticText;
    GroupBox8: TGroupBox;
    StaticText20: TStaticText;
    StaticText21: TStaticText;
    StaticText22: TStaticText;
    StaticText48: TStaticText;
    StaticText31: TStaticText;
    GroupBox9: TGroupBox;
    StaticText45: TStaticText;
    StaticText46: TStaticText;
    StaticText47: TStaticText;
    GroupBox10: TGroupBox;
    StaticText17: TStaticText;
    StaticText18: TStaticText;
    StaticText13: TStaticText;
    StaticText14: TStaticText;
    StaticText15: TStaticText;
    StaticText16: TStaticText;
    StaticText42: TStaticText;
    StaticText19: TStaticText;
    StaticText44: TStaticText;
    StaticText41: TStaticText;
    StaticText43: TStaticText;
    GroupBox11: TGroupBox;
    StaticText34: TStaticText;
    StaticText51: TStaticText;
    StaticText40: TStaticText;
    GroupBox12: TGroupBox;
    StaticText49: TStaticText;
    StaticText35: TStaticText;
    cCtaContable: TcxDBTextEdit;
    cNumLotes: TcxDBTextEdit;
    cM3Congelacion: TcxDBTextEdit;
    cM3Refrigeracion: TcxDBTextEdit;
    cCodigoPago: TcxDBTextEdit;
    cFormaPago: TcxDBTextEdit;
    cDiasPago: TcxDBTextEdit;
    cNomAutorizado1: TcxDBTextEdit;
    cNomBanco: TcxDBTextEdit;
    cDomicilioBanco: TcxDBTextEdit;
    cPoblacionBanco: TcxDBTextEdit;
    cCPBanco: TcxDBTextEdit;
    cCtaBanco: TcxDBTextEdit;
    StaticText39: TStaticText;
    Panel1: TPanel;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText27: TStaticText;
    StaticText29: TStaticText;
    cComentario: TcxDBTextEdit;
    cNombreComercial: TcxDBTextEdit;
    cNombreJuridico: TcxDBTextEdit;
    StaticText30: TStaticText;
    Panel3: TPanel;
    StaticText25: TStaticText;
    cEmail: TcxDBTextEdit;
    cPaginaWeb: TcxDBTextEdit;
    StaticText26: TStaticText;
    StaticText10: TStaticText;
    cTlf1: TcxDBTextEdit;
    cTlfMovil: TcxDBTextEdit;
    StaticText24: TStaticText;
    StaticText23: TStaticText;
    StaticText11: TStaticText;
    cTlf2: TcxDBTextEdit;
    cFax: TcxDBTextEdit;
    StaticText50: TStaticText;
    cNomAutorizado2: TcxDBTextEdit;
    StaticText52: TStaticText;
    StaticText53: TStaticText;
    QMaestroempresa_c: TStringField;
    QMaestrocodigo_c: TStringField;
    QMaestronombre_juridico_c: TStringField;
    QMaestronombre_comercial_c: TStringField;
    QMaestrodomicilio_c: TStringField;
    QMaestrocp_c: TStringField;
    QMaestropoblacion_c: TStringField;
    nota: TStringField;
    QMaestrocp_correo_c: TStringField;
    QMaestropoblacion_correo_c: TStringField;
    QMaestrotelefono1_c: TStringField;
    QMaestrotelefono2_c: TStringField;
    QMaestrofax_c: TStringField;
    QMaestrocif_dni_c: TStringField;
    QMaestroorigen_c: TStringField;
    QMaestroimp_alquiler_oficina_c: TFloatField;
    QMaestroimp_thermoking_c: TFloatField;
    QMaestroprecio_kw_thermo_c: TFloatField;
    QMaestroimp_cargo_fijo_c: TFloatField;
    QMaestroprecio_horas_ent_sal_c: TFloatField;
    QMaestroimp_minimo_facturacion_c: TFloatField;
    QMaestroperiodo_factura_c: TStringField;
    QMaestrotarifa_c: TStringField;
    QMaestrodias_pago_c: TSmallintField;
    QMaestroforma_pago_c: TStringField;
    QMaestrocuenta_cliente_c: TStringField;
    QMaestronombre_banco_c: TStringField;
    QMaestrodomicilio_banco_c: TStringField;
    QMaestrocp_banco_c: TStringField;
    QMaestropoblacion_banco_c: TStringField;
    QMaestroultimo_stock_c: TFloatField;
    QMaestronumerador_lotes_c: TIntegerField;
    QMaestronom_autorizado1_c: TStringField;
    QMaestrocif_autorizado1_c: TStringField;
    QMaestronom_autorizado2_c: TStringField;
    QMaestrocif_autorizado2_c: TStringField;
    QMaestrocomentario_c: TStringField;
    QMaestroimp_valor_stock_c: TFloatField;
    QMaestroimp_pendiente_pago_c: TFloatField;
    QMaestromercancia_retenida_c: TStringField;
    QMaestrotlfmovil_c: TStringField;
    QMaestroemail_c: TStringField;
    QMaestroweb_c: TStringField;
    QMaestroprecio_hor_clima_c: TFloatField;
    QMaestrocuenta_contable_c: TStringField;
    QMaestrocodigo_pago_c: TStringField;
    QTiposPeriodoFact: TQuery;
    DSTiposPeriodoFact: TDataSource;
    cPeriodoFact: TDBLookupComboBox;
    QOrigenes: TQuery;
    DSOrigenes: TDataSource;
    cOrigen: TDBLookupComboBox;
    QOrigenescodigo_o: TStringField;
    cMercanciaRetenida: TDBComboBox;
    QTarifas: TQuery;
    DSTarifas: TDataSource;
    QMaestrom3_facturacion_c: TIntegerField;
    QMaestrom3_refrigeracion_c: TIntegerField;
    tNomProvinciaCli: TPanel;
    tNomProvinciaCorreo: TPanel;
    tNomProvinciaBanco: TPanel;
    QMaestrofecha_autorizado1_c: TStringField;
    QMaestrofecha_autorizado2_c: TStringField;
    cFechaAutoriz1: TcxDateEdit;
    cFechaAutoriz2: TcxDateEdit;
    QTiposPeriodoFactcodigo_pf: TStringField;
    QTiposPeriodoFactdescripcion_pf: TStringField;
    QTiposPeriodoFactdes: TStringField;
    QOrigenesdescripcion_o: TStringField;
    QOrigenesdes: TStringField;
    cTarifa: TDBLookupComboBox;
    TabSheet3: TTabSheet;
    GroupBox3: TGroupBox;
    QMaestronotas_c: TMemoField;
    StaticText6: TStaticText;
    QMaestroultimo_stock_pal_c: TCurrencyField;
    StaticText9: TStaticText;
    QMaestroretencion_c: TFloatField;
    dbcbActivo: TDBCheckBox;
    QMaestroactivo_c: TIntegerField;
    cNif: TcxDBTextEdit;
    cNifAutorizado1: TcxDBTextEdit;
    cNifAutorizado2: TcxDBTextEdit;
    DBMemo1: TDBMemo;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    bAlta: TdxBarLargeButton;
    bBorrar: TdxBarLargeButton;
    bPrimero: TdxBarLargeButton;
    bAnterior: TdxBarLargeButton;
    bSiguiente: TdxBarLargeButton;
    bUltimo: TdxBarLargeButton;
    bAceptar: TdxBarLargeButton;
    bCancelar: TdxBarLargeButton;
    bBusqueda: TdxBarLargeButton;
    bSalir: TdxBarLargeButton;
    PanelClaves: TPanel;
    StaticText1: TStaticText;
    cCodigo: TEdit;
    StaticText12: TStaticText;
    cEmpresa: TEdit;
    tNomEmpresa: TPanel;
    cLupaEmpresas: TSimpleSearch;
    cLupaClilentes: TSimpleSearch;
    cUltimoStock: TcxDBCurrencyEdit;
    cUltimoStockPal: TcxDBCurrencyEdit;
    cValorStock: TcxDBCurrencyEdit;
    cPendientePago: TcxDBCurrencyEdit;
    cServicioOficina: TcxDBCurrencyEdit;
    cImporteTermoking: TcxDBCurrencyEdit;
    cPrecioKwTermoking: TcxDBCurrencyEdit;
    cPrecioMvtoLoteTerminado: TcxDBCurrencyEdit;
    cPrecioHoraEntSal: TcxDBCurrencyEdit;
    cCargoFijo: TcxDBCurrencyEdit;
    cMinFacturar: TcxDBCurrencyEdit;
    cRetencion: TcxDBCurrencyEdit;
    QMaestroprecio_mvto_lote_c: TCurrencyField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

    procedure Timer1Timer(Sender: TObject);
    procedure Alta(Sender: TObject);
    procedure Borrar(Sender: TObject);
    procedure Primero(Sender: TObject);
    procedure Anterior(Sender: TObject);
    procedure Siguiente(Sender: TObject);
    procedure Ultimo(Sender: TObject);
    procedure Aceptar(Sender: TObject);
    procedure Cancelar(Sender: TObject);
    procedure Salir(Sender: TObject);
    procedure PanelDatosEnter(Sender: TObject);

    procedure AlMoverRegistro(DataSet: TDataSet);
    procedure Busqueda(Sender: TObject);

    procedure DSMaestroStateChange(Sender: TObject);
    procedure QMaestroAfterInsert(DataSet: TDataSet);
    procedure QMaestroBeforeEdit(DataSet: TDataSet);
    procedure QMaestroAfterPost(DataSet: TDataSet);
    procedure QMaestroBeforePost(DataSet: TDataSet);

    procedure ColorEnter(Sender: TObject);
    procedure ColorExit(Sender: TObject);
    procedure cEmpresaChange(Sender: TObject);
    procedure cCpClienteExit(Sender: TObject);
    procedure cCpCorreoExit(Sender: TObject);
    procedure cCPBancoExit(Sender: TObject);
    procedure VerMercaciaRetenida(Sender: TObject);
    procedure NoModificar(Sender: TObject);
    procedure cCpClienteChange(Sender: TObject);
    procedure cCpCorreoChange(Sender: TObject);
    procedure cCPBancoChange(Sender: TObject);
    procedure ComprobarFechaExit(Sender: TObject);
    procedure cFechaAutorizChange(Sender: TObject);

    procedure QTiposPeriodoFactCalcFields(DataSet: TDataSet);
    procedure QOrigenesCalcFields(DataSet: TDataSet);

    procedure cLupaEmpresasClick(Sender: TObject);
    procedure cLupaClientesClick(Sender: TObject);

    procedure cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

    procedure cOrigenKeyPress(Sender: TObject; var Key: Char);
    procedure cPeriodoFactKeyPress(Sender: TObject; var Key: Char);

    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure FormActivate(Sender: TObject);
    procedure tNomProvinciaCorreoClick(Sender: TObject);


  private
    {Private declarations}
    SwAlta: Boolean;
    PosRegistro, NRegistros: Integer;
    StockAnterior, StockPalAnterior: Real;
    FechaAutorizadoAnt1, FechaAutorizadoAnt2: String;

    procedure Mensaje(Texto: String );
    procedure BotonesPosicion;
    function  ValidarCabecera():Boolean;
    function  ValidarDetalles():Boolean;
    function  EjecutaQuery(Empresa, Codigo: String):Boolean;
    function  EjecutaQueryBus(WhereBus: String):Boolean;
    procedure QuitarColorAlta();
    procedure PonerColorAlta();

    function NifCorrecto: Boolean;
    function ValidaCIF(Cif: string):boolean;
    function LetraNIF(DNI: String): Char;

  public
    { Public declarations }
  end;

var
   Clientes: TClientes;

implementation

uses UGLobal, MBaseDatos, DM, BClientes, FPrincipal, BEmpresas, FEmpresas;

{$R *.dfm}

//------------------------ CREACION DEL FORMULARIO -----------------------------
procedure TClientes.FormCreate(Sender: TObject);
begin
     Top:=1;
     Left:=0;

     SwAlta:=False;
     PosRegistro:=0;
     NRegistros:=0;

     cEmpresa.Text:=EmpresaGlobal;

     QMaestro.AfterScroll:=AlMoverRegistro;
     QTiposPeriodoFact.Open;
     QOrigenes.Open;
     Paginas.ActivePage:=TabSheet1;

end;

//------------------------ CIERRE DEL FORMULARIO -------------------------------
procedure TClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QTiposPeriodoFact.Close;
     QOrigenes.Close;
     QTarifas.Close;

     Action:=caFree;
end;

//----------------------- CIERRRE DEL QUERY DEL FORMULARIO ---------------------
procedure TClientes.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
     CanClose:=True;
     if QMaestro.state in dsEditModes then
     begin
          case MessageBox( Handle, PChar('¿Desea guardar el registro?'),
                           PChar(Self.Caption),
                           MB_ICONQUESTION + MB_YESNOCANCEL + MB_DEFBUTTON1 ) of
                  IDYES:
                        Aceptar(Self);
                  IDNO:
                       QMaestro.Cancel;
                  IDCANCEL:
                           CanClose:=False;
          end;
    end;
end;

//--------------------- MENSAJES DE LA BARRA DE ESTADO -------------------------
procedure TClientes.Mensaje(Texto: String );
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
procedure TClientes.Timer1Timer(Sender: TObject);
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

procedure TClientes.tNomProvinciaCorreoClick(Sender: TObject);
begin

end;

//-------------- HABILITAR BOTONES DE POSICION DE REGISTRO ---------------------
procedure TClientes.BotonesPosicion;
begin
     if (SwAlta=False) and (QMaestro.State<>dsEdit) then
     begin
          BBusqueda.Enabled:=True;
          BSalir.Enabled:=True;
          if NRegistros>0 then
          begin
               BBorrar.Enabled:=True;
               BCancelar.Enabled:=True;
          end
          else
          begin
               BBorrar.Enabled:=False;
               BCancelar.Enabled:=False;
          end;
          BAceptar.Enabled:=False;
          BAlta.Enabled:=True;

          if NRegistros<=1 then    //1 o ningun registro
          begin
               BPrimero.Enabled:=False;
               BAnterior.Enabled:=False;
               BSiguiente.Enabled:=False;
               BUltimo.Enabled:=False;
          end
          else if PosRegistro=NRegistros then   //Ultimo registro
          begin
               BPrimero.Enabled:=True;
               BAnterior.Enabled:=True;
               BSiguiente.Enabled:=False;
               BUltimo.Enabled:=False;
          end
          else if PosRegistro=1 then   //Primer registro
               begin
                    BPrimero.Enabled:=False;
                    BAnterior.Enabled:=False;
                    BSiguiente.Enabled:=True;
                    BUltimo.Enabled:=True;
               end
               else      //Registros del centro
               begin
                    BPrimero.Enabled:=True;
                    BAnterior.Enabled:=True;
                    BSiguiente.Enabled:=True;
                    BUltimo.Enabled:=True;
               end;
          BarraEstado.Panels[1].Text := 'Registro ' + IntToStr(PosRegistro) + ' de ' +  IntToStr(NRegistros);
    end
    else
    begin
         BBusqueda.Enabled:=False;
         BSalir.Enabled:=False;
         BBorrar.Enabled:=False;
         BAlta.Enabled:=False;
         BCancelar.Enabled:=True;
         BAceptar.Enabled:=True;
    end;
end;

//--------------------- BOTON ALTA ---------------------------------------------
procedure TClientes.Alta(Sender: TObject);
begin
     swAlta:=True;
     PonerColorAlta();
     Mensaje('Alta de Registro');
     BarraEstado.Panels[1].Text:='';

     NRegistros:=0;
     PosRegistro:=0;

     QMaestro.Close;

     PanelClaves.Enabled:=True;

     cEmpresa.Text:=EmpresaGlobal;
     cCodigo.SetFocus;
     cCodigo.Text:='';

     Paginas.ActivePage:=TabSheet1;

     //Botones
     BCancelar.Enabled:=True;
     //BAceptar.Enabled:=True;
     BAceptar.Enabled:=False;
     BBusqueda.Enabled:=False;
     BAlta.Enabled:=False;
     BBorrar.Enabled:=False;
     BSalir.Enabled:=False;
     BPrimero.Enabled:=False;
     BSiguiente.Enabled:=False;
     BAnterior.Enabled:=False;
     BUltimo.Enabled:=False;
end;

//--------------------- BOTON BORRAR -------------------------------------------
procedure TClientes.Borrar(Sender: TObject);
begin
     if MessageBox(Handle, PChar('Va a borrarse el registro ¿Está seguro?'),
                   PChar(Self.Caption),
                   MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1)=IDYES then
     begin
          try
             if not QMaestro.Database.InTransaction then
                QMaestro.Database.StartTransaction;
             QMaestro.Delete;
             if QMaestro.Database.InTransaction then
                QMaestro.Database.Commit;

             if PosRegistro=NRegistros then  //Solo si es el ultimo dec. el numero de reg. actual
                Dec(PosRegistro);
             Dec(NRegistros);     //Dec. el numero de registros total
             BotonesPosicion();   //Actualizamos los botones de direccion

             if NRegistros=0 then
             begin
                  PanelClaves.Enabled:=True;
                  cCodigo.SetFocus;
             end;
           except
                 on E:Exception do
                      begin
                           CapturaErrores(E);
                           QMaestro.Cancel;
                           if DMBaseDatos.BDFrigo.InTransaction then
                              QMaestro.Database.Rollback;
                      end;
           end;
     end;
end;

//-------------------------- PRIMER REGISTRO -----------------------------------
procedure TClientes.Primero(Sender: TObject);
begin
     PosRegistro:=1;          //Numero de registro en el que estamos
     QMaestro.First;
     BotonesPosicion();
end;

//-------------------------- REGISTRO ANTERIOR ---------------------------------
procedure TClientes.Anterior(Sender: TObject);
begin
     if PosRegistro>1 then
        Dec(PosRegistro);        //Numero de registro en el que estamos
     QMaestro.Prior;
     BotonesPosicion();
end;

//-------------------------- REGISTRO SIGUIENTE --------------------------------
procedure TClientes.Siguiente(Sender: TObject);
begin
     if PosRegistro<NRegistros then
        Inc(PosRegistro);       //Numero de registro en el que estamos
     QMaestro.Next;
     BotonesPosicion();
end;

//-------------------------- ULTIMO REGISTRO -----------------------------------  
procedure TClientes.Ultimo(Sender: TObject);
begin
     PosRegistro:=NRegistros; //Numero de registro en el que estamos
     QMaestro.Last;
     BotonesPosicion();
end;

//----------------------------- BUSQUEDA ---------------------------------------
procedure TClientes.Busqueda(Sender: TObject);
Var
   Aux: TBusquedaClientes;
begin
     try
        Aux:=TBusquedaClientes.Create(Self);
        with Aux do
        begin
             AceptarTodos:=True;
             EmpresaParam:=EmpresaGlobal;
             ShowModal;
             if (CodigoBus<>'') and (EmpresaBus<>'') then   //Seleccionamos un registro del grid resultado
             begin
                  if EjecutaQuery(EmpresaBus, CodigoBus) then
                     Self.PanelClaves.Enabled:=False
                  else  //Si no hay registros que mostrar
                  begin
                       Self.PanelClaves.Enabled:=True;
                       cEmpresa.Text:=EmpresaGlobal;
                       cCodigo.Text:='';
                       cCodigo.SetFocus;
                       Mensaje('Registro no existe');
                  end;
             end
             else if ModalResult=mrOk then  //Aceptamos desde el boton ACEPTAR (Devolvemos todos los registros del filtro)
             begin
                  if EjecutaQueryBus(WhereBus) then
                     Self.PanelClaves.Enabled:=False
                  else  //Si no hay registros que mostrar
                  begin
                       Self.PanelClaves.Enabled:=True;
                       cEmpresa.Text:=EmpresaGlobal;
                       cCodigo.Text:='';
                       cCodigo.SetFocus;
                       Mensaje('Registro no existe');
                 end;
            end
        end;
     finally
            FreeAndNil(Aux);
     end;
end;

//------------------------ BOTON ACEPTAR ----------------------------------------
procedure TClientes.Aceptar(Sender: TObject);
Var
   Posicion: TBookmark;
begin
     if ValidarCabecera() and ValidarDetalles() then   //Comprobamos que los datos son correctos
     begin
          if QMaestro.State in [dsEdit,dsInsert] then
          begin
               //GRABACION DEL REGISTRO
               try
                  if QMaestro.State=dsEdit then  //Modificar
                  begin
                       Posicion:=QMaestro.GetBookmark;

                       if not QMaestro.Database.InTransaction then
                          QMaestro.Database.StartTransaction;
                       QMaestro.Post;
                       if QMaestro.Database.InTransaction then
                          QMaestro.Database.Commit;

                       Application.ProcessMessages;

                       QMaestro.DisableControls;
                       QMaestro.Close;
                       QMaestro.Open;
                       QMaestro.GotoBookmark(Posicion);
                       QMaestro.EnableControls;
                  end
                  else   //Alta
                  begin
                       if not QMaestro.Database.InTransaction then
                          QMaestro.Database.StartTransaction;
                       QMaestro.Post;
                       if QMaestro.Database.InTransaction then
                          QMaestro.Database.Commit;

                       EjecutaQuery(cEmpresa.Text, cCodigo.Text);     //Refrescamos el Query -- En algun caso se perdia el registro activo

                       swAlta:=False;
                       QuitarColorAlta();

                       PosRegistro:=1;
                       NRegistros:=1;
                       //Finalizacion de la grabacion
                       Mensaje('Registro Grabado');
                  end;
               except
                     on E:Exception do
                          begin
                               CapturaErrores(E);
                               if DMBaseDatos.BDFrigo.InTransaction then
                                  QMaestro.Database.Rollback;
                          end;
               end;
          end;
          BotonesPosicion();
     end;
end;

//--------------------- BOTON CANCELAR -----------------------------------------
procedure TClientes.Cancelar(Sender: TObject);
begin
     if QMaestro.State in dsEditModes then
     begin
          case MessageBox(Handle, PChar('¿Desea cancelar los cambios?'),
                           PChar(Self.Caption),
                           MB_ICONQUESTION + MB_YESNOCANCEL + MB_DEFBUTTON1) of
                IDYES:
                      if QMaestro.State = dsEdit then   //Modificacion
                      begin
                           //Estos campos no estan enganchados a BD
                           cFechaAutoriz1.Text:=FechaAutorizadoAnt1;
                           cFechaAutoriz2.Text:=FechaAutorizadoAnt2;

                           QMaestro.Cancel;

                           BotonesPosicion();
                           Exit;
                      end
                      else   //Alta
                          QMaestro.Cancel;
                IDNO:
                     begin
                          Aceptar(Self);
                          Exit;
                     end;
                IDCANCEL:
                         Exit;
          end;
      end;

      QMaestro.Close;

      //A partir de aqui se hace si cancelo un alta
      PanelClaves.Enabled:=True;
      SwAlta:=False;

      QuitarColorAlta();
      cEmpresa.Text:=EmpresaGlobal;
      cCodigo.Text:='';
      cCodigo.SetFocus;
      cFechaAutoriz1.Text:='';
      cFechaAutoriz2.Text:='';

      PosRegistro:=0;
      NRegistros:=0;

      Mensaje('Cambios Ignorados');

      BotonesPosicion();
end;

//----------------------------- SALIR ------------------------------------------
procedure TClientes.Salir(Sender: TObject);
begin
     Close;
end;

//-------------------------- VALIDACION DE DATOS CABECERA ----------------------
function TClientes.ValidarCabecera():Boolean;
begin
     Result:=True;
     if cEmpresa.Text='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'Falta la empresa', mtError,[mbOk],0);
          cEmpresa.SetFocus;
     end
     else if tNomEmpresa.Caption='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'La empresa no existe', mtError,[mbOk],0);
          cEmpresa.SetFocus;
     end
     else if cCodigo.Text='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'Falta el código', mtError,[mbOk],0);
          cCodigo.SetFocus;
     end;
end;

//-------------------------- VALIDACION DE DATOS DETALLES-----------------------
function TClientes.ValidarDetalles():Boolean;
begin
     Result:=True;
     if cNombreJuridico.Text='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'El nombre jurídico es obligatorio', mtError,[mbOk],0);
          Paginas.ActivePage:=TabSheet1;
          cNombreJuridico.SetFocus;
     end
     else if cNif.Text='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'El N.I.F. es obligatorio', mtError,[mbOk],0);
          Paginas.ActivePage:=TabSheet1;
          cNif.SetFocus;
     end
{
     else if not NifCorrecto then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'El N.I.F. es incorrecto', mtError,[mbOk],0);
          Paginas.ActivePage:=TabSheet1;
          cNif.SetFocus;
     end
}
     else if cOrigen.Text='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'El origen es obligatorio', mtError,[mbOk],0);
          Paginas.ActivePage:=TabSheet1;
          cOrigen.SetFocus;
     end
     else if cDomicilio.Text='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'El domicilio es obligatorio', mtError,[mbOk],0);
          Paginas.ActivePage:=TabSheet1;
          cDomicilio.SetFocus;
     end
     else if cCpCliente.Text='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'El código postal del cliente es obligatorio', mtError,[mbOk],0);
          Paginas.ActivePage:=TabSheet1;
          cCpCliente.SetFocus;
     end
     else if (copy(cOrigen.Text,1,1)='N') and (cCpCliente.Text<>'') and (tNomProvinciaCli.Caption='') then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'El código postal del cliente es incorrecto', mtError,[mbOk],0);
          Paginas.ActivePage:=TabSheet1;
          cCpCliente.SetFocus;
     end
     else if cPoblacion.Text='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'La población es obligatoria', mtError,[mbOk],0);
          Paginas.ActivePage:=TabSheet1;
          cPoblacion.SetFocus;
     end
     else if cNumLotes.Text='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'El numerador de lotes es obligatorio', mtError,[mbOk],0);
          Paginas.ActivePage:=TabSheet2;
          cNumLotes.SetFocus;
     end
     else if cPeriodoFact.Text='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'El periodo de facturación es obligatorio', mtError,[mbOk],0);
          Paginas.ActivePage:=TabSheet2;
          cPeriodoFact.SetFocus;
     end
     else if cTarifa.Text='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'El código de tarifa es obligatorio', mtError,[mbOk],0);
          Paginas.ActivePage:=TabSheet2;
          cTarifa.SetFocus;
     end
     else if cM3Congelacion.Text='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'M3 congelación obligatorio', mtError,[mbOk],0);
          Paginas.ActivePage:=TabSheet2;
          cM3Congelacion.SetFocus;
     end
     else if cM3Refrigeracion.Text='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'M3 Refrigeración obligatorio', mtError,[mbOk],0);
          Paginas.ActivePage:=TabSheet2;
          cM3Refrigeracion.SetFocus;
     end
     else if True then
     begin
     
     end
     else if cDiasPago.Text='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'Los días de pago son obligatorios', mtError,[mbOk],0);
          Paginas.ActivePage:=TabSheet2;
          cDiasPago.SetFocus;
     end
     else if (copy(cOrigen.Text,1,1)='N') and (cCpCorreo.Text<>'') and (tNomProvinciaCorreo.Caption='') then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'El código postal del correo es incorrecto', mtError,[mbOk],0);
          Paginas.ActivePage:=TabSheet1;
          cCpCorreo.SetFocus;
     end
     else if (copy(cOrigen.Text,1,1)='N') and (cCpBanco.Text<>'') and (tNomProvinciaBanco.Caption='') then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'El código postal del banco es incorrecto', mtError,[mbOk],0);
          Paginas.ActivePage:=TabSheet2;
          cCpBanco.SetFocus;
     end
     else if cFechaAutoriz1.Text<>'' then
     begin
          if not EsFecha(cFechaAutoriz1.Text) then
          begin
               Result:=False;
               MessageDlg (Chr(13) + 'Fecha incorrecta', mtError,[mbOk],0);
               Paginas.ActivePage:=TabSheet2;
               cFechaAutoriz1.SetFocus;
          end;
     end
     else if cFechaAutoriz2.Text<>'' then
     begin
          if not EsFecha(cFechaAutoriz2.Text) then
          begin
               Result:=False;
               MessageDlg (Chr(13) + 'Fecha incorrecta', mtError,[mbOk],0);
               Paginas.ActivePage:=TabSheet2;
               cFechaAutoriz2.SetFocus;
          end;
     end;
end;

//------------------- FOCO EN EL PANEL DE DATOS --------------------------------
procedure TClientes.PanelDatosEnter(Sender: TObject);
begin
     if QMaestro.IsEmpty then
     begin
          if ValidarCabecera() then
          begin
               if not SwAlta then  //Si no es alta
               begin
                    if not EjecutaQuery(cEmpresa.Text, cCodigo.Text) then   //Si no hay datos
                    begin
                         cCodigo.SetFocus;
                         Mensaje('El registro no existe');
                    end
                    else  //Si hay datos
                    begin
                        PanelClaves.Enabled:=False;
                        Paginas.ActivePage :=  TabSheet1;
                        cNombreJuridico.SetFocus;
                    end
               end
               else
               begin
                    //No existe -> Hacemos el alta
                    if not EjecutaQuery(cempresa.Text, cCodigo.Text) then   //Si no hay datos
                    begin
                         PanelClaves.Enabled:=False;
                         Paginas.ActivePage:=TabSheet1;
                         cNombreJuridico.SetFocus;
                         QMaestro.append;
                         Mensaje('Alta de registro');
                         BAceptar.Enabled:=True;
                    end
                    else  //El registro ya existe
                    begin
                         Mensaje('El registro ya existe');
                         QMaestro.Close;
                         BarraEstado.Panels[1].Text:='';
                         cCodigo.SetFocus;
                    end;
               end;
          end;
     end
end;

//------------------------ APERTURA DE LA QUERY PRINCIPAL ----------------------  OK
function TClientes.EjecutaQuery(Empresa, Codigo: String):Boolean;
begin
     Result:=False;
     NRegistros:=0;
     PosRegistro:=0;
     try
        QMaestro.Close;
        QMaestro.SQL.Clear;
        QMaestro.SQL.Add(' SELECT * FROM CLIENTES ' +
                         ' WHERE EMPRESA_C=' + QuotedStr(Empresa) +
                         ' AND CODIGO_C=' + QuotedStr(Codigo));
        QMaestro.Open;
        if QMaestro.IsEmpty then
           Result:=False
        else
        begin
             //Contamos los Registros
             NRegistros:=1;
             PosRegistro:=1;
             Result:=True;
        end;
        BotonesPosicion();
    except
          on E:Exception do
               CapturaErrores(E);
    end;
end;

//---------------- APERTURA DE LA QUERY PRINCIPAL DESDE LA BUSQUEDA-------------
function TClientes.EjecutaQueryBus(WhereBus: String):Boolean;
begin
     Result:=False;
     NRegistros:=0;
     PosRegistro:=0;
     try
        QMaestro.Close;
        QMaestro.SQL.Clear;
        QMaestro.SQL.Add('SELECT * FROM CLIENTES ' +
                         WhereBus +
                         ' ORDER BY EMPRESA_C, CODIGO_C');
        QMaestro.Open;
        if QMaestro.IsEmpty then
           Result:=False
        else
        begin
             try    //Contamos los Registros
                With QContar do
                begin
                     Close;
                     SQL.Clear;
                     SQL.Add('SELECT COUNT(*) AS NREGISTROS FROM CLIENTES ' + WhereBus);
                     Open;
                     NRegistros:=FieldByName('NRegistros').AsInteger;  //Contamos los registros
                     PosRegistro:=1;
                end;
             finally
                    QContar.Close;
             end;
             Result:=True;
        end;
        BotonesPosicion();
    except
          on E:Exception do
               CapturaErrores(E);
    end;
end;

//-------------------- EVENTO SCROLL -------------------------------------------  OK
procedure TClientes.AlMoverRegistro(DataSet: TDataSet);
begin
     QTarifas.Close;
     QTarifas.ParamByName('Empresa').AsString:=QMaestro.FieldByName('Empresa_c').AsString;
     QTarifas.Open;

     StockAnterior:=QMaestro.FieldByName('ULTIMO_STOCK_C').AsFloat;
     StockPalAnterior:=QMaestro.FieldByName('ultimo_stock_pal_c').AsFloat;

     if SwAlta=False then  //El estado es de visualizacion
     begin
          cEmpresa.Text:=QMaestro.FieldByName('EMPRESA_C').AsString;  //No estan enganchados a BD y debemos asignarlos a mano
          cCodigo.Text:=QMaestro.FieldByName('CODIGO_C').AsString;
          //Desactivamos el evento cambio de las fechas
          cFechaAutoriz1.Properties.OnChange:=Nil;
          cFechaAutoriz2.Properties.OnChange:=Nil;
          //Asignamos el valor a las fechas
          cFechaAutoriz1.Text:=DiaMesAnyo(QMaestro.FieldByName('fecha_autorizado1_c').AsString);
          cFechaAutoriz2.Text:=DiaMesAnyo(QMaestro.FieldByName('fecha_autorizado2_c').AsString);
          //Activamos el evento cambio de las fechas
          cFechaAutoriz1.Properties.OnChange:=cFechaAutorizChange;
          cFechaAutoriz2.Properties.OnChange:=cFechaAutorizChange;
     end;
end;

//--------------------- CAMBIO DE ESTADO DEL DATA SOURCE -----------------------
procedure TClientes.DSMaestroStateChange(Sender: TObject);
begin
     BAceptar.Enabled:=QMaestro.State in dsEditModes;
     if QMaestro.State in dsEditModes then
     begin
          BPrimero.Enabled:=False;
          BAnterior.Enabled:=False;
          BSiguiente.Enabled:=False;
          BUltimo.Enabled:=False;
          BBorrar.Enabled:=False;
          BAlta.Enabled:=False;
          BBusqueda.Enabled:=False;
     end;
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TClientes.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=109) and BBorrar.Enabled then                     //Baja
        Borrar(Self)
     else if (Key=107) and BAlta.Enabled then                  //Alta
          begin
               Key:=0;
               Application.ProcessMessages;
               Alta(Self);
          end
          else if (Key=VK_F5) and BAceptar.Enabled then        //F5 graba
                  Aceptar(Self)
               else if (Key=VK_F6) and BBusqueda.Enabled then  //F6 busqueda experta
                       Busqueda(Self)
                     else if Key=40 then                             //Flecha arriba
                             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
                          else if Key=38 then                        //Flecha abajo
                                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TClientes.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13 then
     begin
          if DBMemo1.Focused then exit;
          Key:=#0;
          PostMessage(Handle,WM_NEXTDLGCTL,0,0);
     end
     else if Key=#27 then
          begin
               Key:=#0;
               if BCancelar.Enabled then
                  Cancelar(Self)
               else
                   Close;
          end;
end;


//---------------------- DESPUES DE INSERTAR -----------------------------------
procedure TClientes.QMaestroAfterInsert(DataSet: TDataSet);
begin
     //Campos que no estan enlazados a BD
     QMaestro.FieldByName('EMPRESA_C').AsString:=cEmpresa.Text;
     QMaestro.FieldByName('CODIGO_C').AsString:=cCodigo.Text;

     //Valores por defecto
     QMaestro.FieldByName('VALOR_STOCK_C').AsFloat:=0;
     QMaestro.FieldByName('IMP_PENDIENTE_PAGO_C').AsFloat:=0;
     QMaestro.FieldByName('MERCANCIA_RETENIDA_C').AsString:='N';
     QMaestro.FieldByName('ACTIVO_C').AsFloat:=1;
end;

//---------------------- PONE EL COLOR DE FOCO DE LOS CAMPOS CLAVES ------------
procedure TClientes.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          if not SwAlta then
             TEdit(Sender).Color:=clMoneyGreen;
     end;
end;

//---------------------- QUITA EL COLOR DE FOCO DE LOS CAMPOS CLAVE ------------
procedure TClientes.ColorExit(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          if not SwAlta then
            TEdit(Sender).Color:=clWindow;
          if Length(TEdit(Sender).Text)>0 then
             TEdit(Sender).Text:=RellenarCeros(TEdit(Sender).Text,TEdit(Sender).MaxLength,'I');
     end;
end;

//---------------------- QUITA EL COLOR DE ALTA DE LOS CAMPOS CLAVE ------------
procedure TClientes.QuitarColorAlta();
begin
     cEmpresa.Color:=clWindow;
     cCodigo.Color:=clWindow;
end;

//---------------------- PONE EL COLOR DE ALTA DE LOS CAMPOS CLAVE -------------
procedure TClientes.PonerColorAlta();
begin
     cEmpresa.Color:=clYellow;
     cCodigo.Color:=clYellow;
end;

//----------------------- CAMBIO DE LA EMPRESA ---------------------------------
procedure TClientes.cEmpresaChange(Sender: TObject);
begin
     tNomEmpresa.Caption:=NomEmpresa(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
end;

//------------------------ AL SALIR DEL CODIGO POSTAL --------------------------
procedure TClientes.cCpClienteExit(Sender: TObject);
begin
if (QMaestro.State in dsEditModes) then
  begin
  if copy(cOrigen.Text,1,1) = 'N' then
    begin
    if (cCpCliente.Text<>'') then
      begin
      if (tNomProvinciaCli.Caption='') then
        begin
        cCpCliente.SetFocus;
        MessageDlg (Chr(13) + 'El código postal es incorrecto', mtError,[mbOk],0);
        end;
      end
    else
      begin
      cCpCliente.SetFocus;
      MessageDlg (Chr(13) + 'El código postal es obligatorio', mtError,[mbOk],0);
      end;
    end;

  end;
end;

//------------------------ AL SALIR DEL CODIGO POSTAL DEL CORREO ---------------
procedure TClientes.cCpCorreoExit(Sender: TObject);
begin
     if (QMaestro.State in dsEditModes) and
        (copy(cOrigen.Text,1,1) = 'N') and
        (tNomProvinciaCorreo.Caption='') and
        (cCpCorreo.Text<>'') then
     begin
          cCpCorreo.SetFocus;
          MessageDlg (Chr(13) + 'El código postal es incorrecto', mtError,[mbOk],0);
     end;
end;

//------------------------ AL SALIR DEL CODIGO POSTAL DEL BANCO ----------------
procedure TClientes.cCPBancoExit(Sender: TObject);
begin
     if (QMaestro.State in dsEditModes) and
        (copy(cOrigen.Text,1,1) = 'N') and
        (tNomProvinciaBanco.Caption='') and
        (cCpBanco.Text<>'') then
     begin
          cCpBanco.SetFocus;
          MessageDlg (Chr(13) + 'El código postal es incorrecto', mtError,[mbOk],0);
     end;
end;

//-------- AL CAMBIAR EL VALOR DEL STOCK Y EL VALOR DE LO PENDIENTE DE PAGO ----
procedure TClientes.VerMercaciaRetenida(Sender: TObject);
begin
     if QMaestro.State in dsEditModes then
     begin
          if QMaestro.FieldByName('VALOR_STOCK_C').AsFloat >=QMaestro.FieldByName('IMP_PENDIENTE_PAGO_C').AsFloat then
             QMaestro.FieldByName('MERCANCIA_RETENIDA_C').AsString:='N'
          else
              QMaestro.FieldByName('MERCANCIA_RETENIDA_C').AsString:='S';
     end;
end;

//------------------------- DESPUES DE GRABAR ----------------------------------
procedure TClientes.QMaestroAfterPost(DataSet: TDataSet);
Var
   QAux: TQuery;
begin
     if not swAlta then
     begin
          //Se ha modificado el campo ULTIMO STOCK ---> Insertamos en AUDITORIA
          if (StockAnterior<>QMaestro.FieldByName('ULTIMO_STOCK_C').Asfloat) then
          begin
               QAux:=TQuery.Create(nil);
               try
                  With QAux do
                  begin
                       DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                       SQL.Add('INSERT INTO AUDITORIA (FECHA_A,HORA_A,USUARIO_A,OPERACION_A,CLIENTE_A,UNI_ENTRADAS_A,UNI_SALIDAS_A) ' +
                               'VALUES (:FECHA, ' +
                                      ' :HORA, ' +
                                        QuotedStr(UsuarioGlobal) + ',' +
                                        QuotedStr('U') + ',' +
                                        QuotedStr(QMaestro.FieldByName('Codigo_c').AsString) + ',' +
                                      ' :UNI_ENTRADAS, ' +
                                      ' :UNI_SALIDAS)');
                       ParamByName('FECHA').AsString:=AnyoMesDia(Date);
                       ParamByName('HORA').AsString:=TimeToStr(Time);
                       ParamByName('UNI_ENTRADAS').AsFloat:=StockAnterior;
                       ParamByName('UNI_SALIDAS').AsFloat:=QMaestro.FieldByName('ULTIMO_STOCK_C').Asfloat;
                       ExecSql;
                  end;
               finally
                      QAux.Close;
                      FreeAndNil(QAux);
               end;
          end;

          //Se ha modificado el campo ULTIMO STOCK PALET ---> Insertamos en AUDITORIA
          if (StockPalAnterior<>QMaestro.FieldByName('ultimo_stock_pal_c').Asfloat) then
          begin
               QAux:=TQuery.Create(nil);
               try
                  With QAux do
                  begin
                       DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                       SQL.Add('INSERT INTO AUDITORIA (FECHA_A,HORA_A,USUARIO_A,OPERACION_A,CLIENTE_A,PAL_ENTRADOS_A,PAL_SALIDOS_A) ' +
                               'VALUES (:FECHA, ' +
                                      ' :HORA, ' +
                                        QuotedStr(UsuarioGlobal) + ',' +
                                        QuotedStr('U') + ',' +
                                        QuotedStr(QMaestro.FieldByName('Codigo_c').AsString) + ',' +
                                      ' :PAL_ENTRADOS, ' +
                                      ' :PAL_SALIDOS)');
                       ParamByName('FECHA').AsString:=AnyoMesDia(Date);
                       ParamByName('HORA').AsString:=TimeToStr(Time);
                       ParamByName('PAL_ENTRADOS').AsFloat:=StockPalAnterior;
                       ParamByName('PAL_SALIDOS').AsFloat:=QMaestro.FieldByName('ultimo_stock_pal_c').Asfloat;
                       ExecSql;
                  end;
               finally
                      QAux.Close;
                      FreeAndNil(QAux);
               end;
          end;

     end;
end;

//---------------------- COMPROBAR NIF -------------------
function TClientes.NifCorrecto : Boolean;
begin
  result := true;
  if not (QMaestro.State in dsEditModes) then exit;

  if cNif.text = '' then
    begin
    result := false;
    exit;
    end;

  if cNif.text[1] in ['a'..'z','A'..'Z'] then // parece ser un cif / nie
    begin

    if not ValidaCIF( cNif.text ) then
      begin
      MessageBox(Handle, 'El NIF/CIF/NIE introducido no es correcto', 'Error', 16);
      result := false;
      end;

    end
  else  // entonces será un nif
    begin

    if Trim(cNif.text)[ Length(Trim(cNif.text)) ] in ['a'..'z','A'..'Z'] then // me dan la letra, voy a comprobar
      begin

      if LetraNIF( Copy(cNif.Text,1, Length(Trim(cNif.text)) - 1) ) <> Trim(cNif.text)[ Length(Trim(cNif.text)) ] then
        begin
        MessageBox(Handle, 'El NIF/CIF/NIE introducido no es correcto', 'Error', 16);
        result := false;
        end;

      end
    else // no me dan la letra: la añado yo.
      begin
//      Self.DataSource.DataSet.FieldByName(Self.DataField).asstring :=
//        Self.DataSource.DataSet.FieldByName(Self.DataField).asstring + LetraNIF( Self.text );
      end;
    end;
end;

function TClientes.ValidaCIF(Cif: string) : boolean;
var
  Suma, Control : integer;
  n : byte;

begin

  Result:=False;
  Cif:=UpperCase(Cif);

  {El cif debe ser de 9 cifras}
  if Length(Cif)<>9 then exit;

        { verificacion para CIF tipo X }
  if Cif[1] = 'X' then
    begin
    { extranjero calculamos el NIF}
    { usamos la función NIF del truco [9] que calula la letra del DNI }
    result := LetraNIF(copy(cif,2,7)) = Cif[9];
    end
  else if Cif[1] = 'Y' then
    begin
    { extranjero calculamos el NIF}
    { usamos la función NIF del truco [9] que calula la letra del DNI }
    { cambiamos la Y por un 1 para par que el calculo de la Letra sea correcto}
    result := LetraNIF('1' + copy(cif,2,7)) = Cif[9];
    end
  else
    begin
    Suma := StrToInt(Cif[3]) + StrToInt(Cif[5]) + StrToInt(Cif[7]);
    for n := 1 to 4 do
      begin
      Suma := Suma + ((2 * StrToInt(Cif[2 * n])) mod 10) +
                     ((2 * StrToInt(Cif[2 * n])) div 10);
      end;

    Control := 10 - (Suma mod 10);

    if Cif[1] = 'P' then {Control tipo letra}
      begin
      Result := (Cif[9] = Chr(64 + Control))
      end
    else
      begin {Control tipo número}
      if Control = 10 then Control := 0;
      Result := (StrToInt(Cif[9]) = Control);
      end;
    end;

end;

function TClientes.LetraNIF(DNI: String): Char;
begin
  Result := Copy('TRWAGMYFPDXBNJZSQVHLCKET',StrToInt(DNI) mod 23+1,1)[1];
end;

//---------------------- AVISO: CAMPO NO DEBERIA MODIFICARSE -------------------
procedure TClientes.NoModificar(Sender: TObject);
begin
     if  QMaestro.State <> dsInsert then
        Mensaje('**** AVISO: EL CAMPO NO DEBERÍA MODIFICARSE ****');
end;

//----------------------- ANTES DE GRABAR -------------------------------------
procedure TClientes.QMaestroBeforePost(DataSet: TDataSet);
begin
     if QMaestro.FieldByName('VALOR_STOCK_C').AsFloat>=QMaestro.FieldByName('IMP_PENDIENTE_PAGO_C').AsFloat then
        QMaestro.FieldByName('MERCANCIA_RETENIDA_C').AsString:='N'
     else
         QMaestro.FieldByName('MERCANCIA_RETENIDA_C').AsString:='S';
     QMaestro.FieldByName('fecha_autorizado1_c').AsString:=AnyoMesDia(cFechaAutoriz1.Text);
     QMaestro.FieldByName('fecha_autorizado2_c').AsString:=AnyoMesDia(cFechaAutoriz2.Text);
end;

//------------------------- AL CAMBIAR EL CP DEL CLIENTE -----------------------
procedure TClientes.cCpClienteChange(Sender: TObject);
begin
  if QMaestro.State in dsEditModes then
    tNomProvinciaCli.Caption:=Provincia(copy(cOrigen.text,1,1),cCpCliente.Text)
  else
    tNomProvinciaCli.Caption:=Provincia(QMaestro.FieldByName('origen_c').AsString,
                                        QMaestro.FieldByName('Cp_c').AsString);
end;

//------------------------- AL CAMBIAR EL CP DEL CORREO ------------------------
procedure TClientes.cCpCorreoChange(Sender: TObject);
begin
  if QMaestro.State in dsEditModes then
    tNomProvinciaCorreo.Caption:=Provincia(copy(cOrigen.Text,1,1),cCpCorreo.Text)
  else
    tNomProvinciaCorreo.Caption:=Provincia(QMaestro.FieldByName('origen_c').AsString,
                                           QMaestro.FieldByName('Cp_Correo_c').AsString);
end;

//------------------------- AL CAMBIAR EL CP DEL BANCO -------------------------
procedure TClientes.cCPBancoChange(Sender: TObject);
begin
  if QMaestro.State in dsEditModes then
    tNomProvinciaBanco.Caption:=Provincia(copy(cOrigen.Text,1,1), cCpBanco.Text)
  else
    tNomProvinciaBanco.Caption:=Provincia(QMaestro.FieldByName('origen_c').AsString,
                                          QMaestro.FieldByName('Cp_Banco_c').AsString);
end;

//------------------------- COMPROBAR FECHA AL SALIR ---------------------------
procedure TClientes.ComprobarFechaExit(Sender: TObject);
begin
     if TcxDateEdit(Sender).Text<>'  /  /    ' then
     begin
          if not EsFecha(TcxDateEdit(Sender).Text) then
          begin
               TcxDateEdit(Sender).SetFocus;
               MessageDlg (Chr(13) + 'Fecha incorrecta', mtError,[mbOk],0);
          end;
     end;
end;

//------------------------- AL MODIFICAR LA FECHA PONEMOS EN EDICION -----------
procedure TClientes.cFechaAutorizChange(Sender: TObject);
begin
     if (QMaestro.Active) and  not (QMaestro.State in dsEditModes) then  //Ponemos en edicion si no lo esta
        QMaestro.Edit;
end;

//------------------------- ANTES DE MODIFICAR ---------------------------------
procedure TClientes.QMaestroBeforeEdit(DataSet: TDataSet);
begin
     FechaAutorizadoAnt1:=DiaMesAnyo(QMaestro.FieldByName('fecha_autorizado1_c').AsString);
     FechaAutorizadoAnt2:=DiaMesAnyo(QMaestro.FieldByName('fecha_autorizado2_c').AsString);
end;

//---- CAMPO CALCULADO PARA LA DESCRIPCION DEL PERIODICO DE FACTURACION --------
procedure TClientes.QTiposPeriodoFactCalcFields(DataSet: TDataSet);
begin
     QTiposPeriodoFact.FieldByName('des').AsString:=QTiposPeriodoFact.FieldByName('codigo_pf').AsString +
                                                    ' - ' +
                                                    QTiposPeriodoFact.FieldByName('descripcion_pf').AsString;
end;

//------------ CAMPO CALCULADO PARA LA DESCRIPCION DEL ORIGEN ------------------
procedure TClientes.QOrigenesCalcFields(DataSet: TDataSet);
begin
     QOrigenes.FieldByName('des').AsString:=QOrigenes.FieldByName('codigo_o').AsString +
                                            ' - ' +
                                            QOrigenes.FieldByName('descripcion_o').AsString;
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TClientes.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresa.Text:=CodEmpresa;
     cEmpresa.SetFocus;   
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TClientes.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if Key=VK_F2 then
       cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TClientes.cLupaClientesClick(Sender: TObject);
Var
   CodCliente: String;
begin
     if cEmpresa.Text<>'' then
     begin
          CodCliente:=LupaClientes(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
          if CodCliente<>'' then
             cCodigo.Text:=CodCliente;
          cCodigo.SetFocus;
     end
     else
     begin
          MessageDlg (Chr(13) + 'Seleccione antes la empresa', mtError,[mbOk],0);
          cEmpresa.SetFocus;
     end;
end;

//-------------------------- LUPA (F2) DE CLIENTES -----------------------------
procedure TClientes.cCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if Key=VK_F2 then
       cLupaClientesClick(Self);
end;

//------------------------ CONTROL DE TECLAS EN EL ORIGEN ----------------------
procedure TClientes.cOrigenKeyPress(Sender: TObject; var Key: Char);
Var
   Pulsacion: char;
begin
     Pulsacion:=UpCase(Key);
     if (Pulsacion='N') or (Pulsacion='C') or (Pulsacion='E') then
     begin
          if not (QMaestro.State in dsEditModes) then  //Si estamos visualizando
             if Pulsacion<>cOrigen.KeyValue then  //Si cambiamos el codigo entonces ponemos en edicion
                QMaestro.Edit;
          if QMaestro.State in dsEditModes then  //Si estamos modificando o insertando
             QMaestro.FieldByName('Origen_c').AsString:=Pulsacion;
     end;
     Key:=#0;
end;

//------------------------- CONTROL DE TECLAS EN EL CLIENTE  -------------------
procedure TClientes.cPeriodoFactKeyPress(Sender: TObject; var Key: Char);
Var
   Pulsacion: char;
begin
     Pulsacion:=UpCase(Key);
     if (Pulsacion='S') or (Pulsacion='B') or (Pulsacion='D') or (Pulsacion='M') or (Pulsacion='Q') then
     begin
          if not (QMaestro.State in dsEditModes) then  //Si estamos visualizando
          begin
               if Pulsacion<>cPeriodoFact.KeyValue then  //Si cambiamos el codigo entonces ponemos en edicion
                  QMaestro.Edit;
          end;
          if QMaestro.State in dsEditModes then  //Si estamos modificando o insertando
             QMaestro.FieldByName('periodo_factura_c').AsString:=Pulsacion;
     end;
     Key:=#0;
end;

//------------------------- CONTROL DE TECLAS EN EL CLIENTE  -------------------
procedure TClientes.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Paginas.Focused then
     begin
          if Key=33 then
             Paginas.ActivePage:=TabSheet1
          else if Key=34 then
                  Paginas.ActivePage:=TabSheet2;
     end;
end;

//------------------------- AL ACTIVAR EL FORMULARIO ---------------------------
procedure TClientes.FormActivate(Sender: TObject);
begin
     //Foco en el Cliente
     if PanelClaves.Enabled then
        cCodigo.SetFocus;
end;

end.
