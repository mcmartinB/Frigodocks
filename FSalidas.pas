unit FSalidas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ActnMan, ActnCtrls, ExtCtrls, StdCtrls, ComCtrls, DB,
  DBTables, Mask, DBCtrls, Buttons, nbEdits, Grids, DBGrids, ImgList, QRPrntr,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlue, dxCore, cxDateUtils, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxTextEdit, cxDBEdit, Menus, cxButtons,
  SimpleSearch, dxSkinsdxBarPainter, dxBar, cxClasses, cxCurrencyEdit;

type
  TSalidas = class(TForm)
    BarraEstado: TStatusBar;
    Timer1: TTimer;
    QMaestro: TQuery;
    DSMaestro: TDataSource;
    PanelClaves: TPanel;
    PanelLineas: TPanel;
    QContar: TQuery;
    StaticText12: TStaticText;
    cEmpresa: TEdit;
    tNomEmpresa: TPanel;
    StaticText1: TStaticText;
    cAlbaran: TEdit;
    DSLineas: TDataSource;
    QLineas: TQuery;
    GridLineas: TDBGrid;
    QArticulos: TQuery;
    PanelCabecera: TPanel;
    StaticText13: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    tNomcliente: TPanel;
    StaticText5: TStaticText;
    StaticText7: TStaticText;
    StaticText11: TStaticText;
    cMatricula: TcxDBTextEdit;
    cCliente: TcxDBTextEdit;
    cTipoSalida: TDBLookupComboBox;
    cHora: TMaskEdit;
    QTiposSalida: TQuery;
    PanelInsertarLinea: TPanel;
    cFamilia: TcxDBTextEdit;
    cArticulo: TcxDBTextEdit;
    cLote: TcxDBTextEdit;
    tNomFamilia: TPanel;
    tNomArticulo: TPanel;
    QFamilias: TQuery;
    StaticText14: TStaticText;
    StaticText15: TStaticText;
    StaticText19: TStaticText;
    StaticText21: TStaticText;
    StaticText22: TStaticText;
    StaticText23: TStaticText;
    StaticText24: TStaticText;
    DSTiposSalida: TDataSource;
    QLineasNombreArticulo: TStringField;
    QLineasNombreFamilia: TStringField;
    QAlmacenes: TQuery;
    QAlmacenesempresa_al: TStringField;
    QAlmacenescliente_al: TStringField;
    QAlmacenesfamilia_al: TStringField;
    QAlmacenesarticulo_al: TStringField;
    QAlmaceneslote_al: TStringField;
    QAlmacenesbultos_entrados_al: TIntegerField;
    QAlmacenesbultos_salidos_al: TIntegerField;
    QAlmacenesunidades_entradas_al: TFloatField;
    QAlmacenesunidades_salidas_al: TFloatField;
    QAlmacenesunidades_destruidas_al: TFloatField;
    QAlmacenesunidades_mermas_al: TFloatField;
    QAlmacenesstatus_retenido_al: TStringField;
    QAlmacenesnumero_camara_al: TSmallintField;
    QAlmaceneszona_al: TStringField;
    QAlmacenesestuches_sueltos_al: TIntegerField;
    QAlmacenestipo_lote_al: TStringField;
    QAlmacenesunid_sal_mismo_dia_al: TFloatField;
    QAlmacenespalets_entrados_al: TIntegerField;
    QAlmacenespalets_salidos_al: TIntegerField;
    Panel1: TPanel;
    StaticText8: TStaticText;
    cImporte: TcxDBTextEdit;
    cConcepto: TcxDBTextEdit;
    StaticText10: TStaticText;
    StaticText9: TStaticText;
    cHorasFacturar: TcxDBTextEdit;
    GroupBox1: TGroupBox;
    StaticText18: TStaticText;
    cRetira: TcxDBTextEdit;
    cOrden: TcxDBTextEdit;
    cObservaciones: TcxDBTextEdit;
    QMaestroempresa_cs: TStringField;
    QMaestroalbaran_cs: TIntegerField;
    QMaestrocliente_cs: TStringField;
    QMaestrotipo_salida_cs: TStringField;
    QMaestroimporte_salida_cs: TFloatField;
    QMaestrohoras_salida_cs: TFloatField;
    QMaestronumero_factura_cs: TIntegerField;
    QMaestroorden_numero_cs: TStringField;
    QMaestroconcepto_cs: TStringField;
    QMaestromatricula_cs: TStringField;
    QMaestroretira_cs: TStringField;
    QMaestronif_retira_cs: TStringField;
    QMaestrohora_cs: TStringField;
    GroupBox2: TGroupBox;
    tAutorizado1: TPanel;
    tAutorizado2: TPanel;
    QLineasempresa_ls: TStringField;
    QLineasalbaran_ls: TIntegerField;
    QLineasarticulo_ls: TStringField;
    QLineaslote_ls: TStringField;
    QLineasbultos_ls: TIntegerField;
    QLineasunidades_ls: TFloatField;
    QLineasestuches_sueltos_ls: TSmallintField;
    QLineastipo_lote_ls: TStringField;
    QLineaspalets_ls: TIntegerField;
    QLineasfamilia_ls: TStringField;
    QLineasCamara: TSmallintField;
    QLineasZona: TStringField;
    StaticText25: TStaticText;
    StaticText26: TStaticText;
    cNifRetira: TcxDBTextEdit;
    QAlmacenesfecha_entrada_al: TStringField;
    QAlmacenesfecha_caducidad_al: TStringField;
    QMaestrofecha_albaran_cs: TStringField;
    QMaestrofecha_factura_cs: TStringField;
    cFechaAlbaran: TcxDateEdit;
    QTiposSalidacodigo_ts: TStringField;
    QTiposSalidadescripcion_ts: TStringField;
    QTiposSalidades: TStringField;
    cBultos: TDBEdit;
    cPalets: TDBEdit;
    cEstuches: TDBEdit;
    cCamara: TEdit;
    cZona: TEdit;
    QAlmacenesestuches_bulto_al: TIntegerField;
    QAlmacenesestuches_totales_al: TIntegerField;
    StaticText16: TStaticText;
    cDestino: TcxDBTextEdit;
    QMaestrodestino_cs: TStringField;
    QMaestroobservaciones_cs: TStringField;
    QAlmacenesfecha_modif_al: TStringField;
    QMaestrofecha_modif_cs: TStringField;
    QLineasfecha_modif_ls: TStringField;
    QLineasnlinea_ls: TIntegerField;
    StaticText17: TStaticText;
    cTemperatura: TcxDBTextEdit;
    StaticText20: TStaticText;
    StaticText27: TStaticText;
    CNotas: TcxDBTextEdit;
    QMaestrotemperatura_cs: TSmallintField;
    QMaestronotas_cs: TStringField;
    StaticText28: TStaticText;
    cRefCliente_: TcxDBTextEdit;
    QMaestroref_cliente_cs: TStringField;
    cLupaEmpresas: TSimpleSearch;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    bPrimero: TdxBarLargeButton;
    bAnterior: TdxBarLargeButton;
    bSiguiente: TdxBarLargeButton;
    bUltimo: TdxBarLargeButton;
    bAceptar: TdxBarLargeButton;
    bCancelar: TdxBarLargeButton;
    bBusqueda: TdxBarLargeButton;
    bSalir: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    bImprimir: TdxBarLargeButton;
    bAlta: TdxBarLargeButton;
    bBorrar: TdxBarLargeButton;
    bAltaL: TdxBarLargeButton;
    bBorrarL: TdxBarLargeButton;
    bUltimoL: TdxBarLargeButton;
    bSiguienteL: TdxBarLargeButton;
    bPrimeroL: TdxBarLargeButton;
    bAnteriorL: TdxBarLargeButton;
    cLupaClientes: TSimpleSearch;
    LupaArticulo: TSimpleSearch;
    LupaFamilia: TSimpleSearch;
    LupaLote: TSimpleSearch;
    LupaCamara: TSimpleSearch;
    LupaZona: TSimpleSearch;
    cUnidades: TcxDBCurrencyEdit;
    QAlmacenesobservaciones_retenido_al: TStringField;
    StaticText29: TStaticText;
    cLoteOrigen: TcxDBTextEdit;
    QLineaslote_origen_ls: TStringField;
    strngfldQAlmaceneslote_origen_al: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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
    procedure PanelClavesExit(Sender: TObject);
    procedure DSMaestroStateChange(Sender: TObject);
    procedure AlMoverRegistro(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Busqueda(Sender: TObject);
    procedure QMaestroAfterInsert(DataSet: TDataSet);
    procedure ColorEnter(Sender: TObject);
    procedure ColorExit(Sender: TObject);
    procedure ColorExitSinCeros(Sender: TObject);
    procedure cEmpresaChange(Sender: TObject);
    procedure cClienteChange(Sender: TObject);
    procedure QMaestroBeforePost(DataSet: TDataSet);
    procedure cHoraExit(Sender: TObject);
    procedure cHoraChange(Sender: TObject);
    procedure QMaestroBeforeEdit(DataSet: TDataSet);
    procedure BPrimeroLClick(Sender: TObject);
    procedure BAnteriorLClick(Sender: TObject);
    procedure BSiguienteLClick(Sender: TObject);
    procedure BUltimoLClick(Sender: TObject);
    procedure cEmpresaExit(Sender: TObject);
    procedure cHoraEnter(Sender: TObject);
    procedure cClienteExit(Sender: TObject);
    procedure cFamiliaChange(Sender: TObject);
    procedure cArticuloChange(Sender: TObject);
    procedure QMaestroBeforeClose(DataSet: TDataSet);
    procedure BBorrarLinea(Sender: TObject);
    procedure BAltaLinea(Sender: TObject);
    procedure cFechaExit(Sender: TObject);
    procedure SinSignos(Sender: TObject; var Key: Char);
    procedure cFamiliaExit(Sender: TObject);
    procedure cArticuloExit(Sender: TObject);
    procedure cLoteExit(Sender: TObject);
    procedure cImporteExit(Sender: TObject);
    procedure cHorasFacturarExit(Sender: TObject);
    procedure cUnidadesExit(Sender: TObject);
    procedure QMaestroAfterOpen(DataSet: TDataSet);
    procedure QLineasCalcFields(DataSet: TDataSet);
    procedure QLineasBeforeInsert(DataSet: TDataSet);
    procedure GridLineasDblClick(Sender: TObject);
    procedure QMaestroAfterEdit(DataSet: TDataSet);
    procedure QLineasBeforeEdit(DataSet: TDataSet);
    procedure QMaestroAfterCancel(DataSet: TDataSet);
    procedure LupaLoteClick(Sender: TObject);
    procedure cLoteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cZonaExit(Sender: TObject);
    procedure cCamaraExit(Sender: TObject);
    procedure BImprimirClick(Sender: TObject);
    procedure cFechaAlbaranEnter(Sender: TObject);
    procedure cFechaAlbaranChange(Sender: TObject);
    procedure QTiposSalidaCalcFields(DataSet: TDataSet);
    procedure cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaEmpresasClick(Sender: TObject);
    procedure cLupaClientesClick(Sender: TObject);
    procedure cClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaFamiliasClick(Sender: TObject);
    procedure cFamiliaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaArticulosClick(Sender: TObject);
    procedure cArticuloKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cFamiliaEnter(Sender: TObject);
    procedure cArticuloEnter(Sender: TObject);
    procedure cFamiliaClick(Sender: TObject);
    procedure cArticuloClick(Sender: TObject);
    procedure cLoteEnter(Sender: TObject);
    procedure cCamaraEnter(Sender: TObject);
    procedure cZonaEnter(Sender: TObject);
    procedure QLineasBeforePost(DataSet: TDataSet);
    procedure cTipoSalidaKeyPress(Sender: TObject; var Key: Char);
    procedure cTipoSalidaEnter(Sender: TObject);
    procedure cUnidadesEnter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cBultosExit(Sender: TObject);
    procedure cPaletsExit(Sender: TObject);
    procedure cEstuchesExit(Sender: TObject);
    procedure LupaCamaraClick(Sender: TObject);
    procedure LupaZonaClick(Sender: TObject);
    procedure cCamaraKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cTemperaturaExit(Sender: TObject);
    procedure cFechaAlbaranDblClick(Sender: TObject);
    procedure bAltaLClick(Sender: TObject);
    procedure cLoteOrigenExit(Sender: TObject);

  private
    {Private declarations}
    bFreeEdit: Boolean;
    sEmpresa, sAlbaran, sCliente: string;
    //, sFecha: string;

    SwAlta, Contabilizada: Boolean;
    PosRegistro, NRegistros, AlbaranToca, NLinea: Integer;
    TipoSalidaAnt, ClienteAnt, LLoteAnt: String;
    LFamiliaAnt, LArticuloAnt: String;
    LBultosAnt, LEstuchesBultoAnt, LEstuchesSueltosAnt, LPaletsAnt: Integer;
    LUnidadesAnt: Real;
    FechaAnt: String;

    QAlmacenesLoteOrigen: TQuery;

    QLotesOrigen,
    QLotesOrigenCount: TQuery;

    procedure Mensaje(Texto: String);overload;
    procedure MensajeFijo(Texto: String);
    procedure BotonesPosicion;
    procedure ComprobarCliente();
    function  ComprobarAlbaran(): Boolean;
    function  ValidarClaves():Boolean;
    function  ValidarCabecera():Boolean;
    function  ValidarLinea():Boolean;
    function  EjecutaQuery(Empresa, Albaran: String):Boolean;
    function  EjecutaQueryBus(WhereBus: String):Boolean;
    procedure QuitarColorAlta();
    procedure PonerColorAlta();
    function  LeerNumeroAlbaran(Empresa: String):Integer;
    procedure EliminarAlbaran();
    procedure ActualizarCliente(EditAddDelete, Empresa, Familia, Articulo, Cliente: String; Unidades: Real);
    procedure ActualizarAlmacen(EditAddDelete, Empresa, Cliente, Lote, FechaAlbaran, TipoSalida: String; BultosLinea, EstuchesSueltosLinea, PaletsLinea:Integer; UnidadesLinea: Real);
    procedure MercanciaRetenidaCliente(Empresa, Cliente: String);
    function  ClienteDeAlta():Boolean;
    function  ClienteMercanciaRetenida():Boolean;
    function  ComprobarHora(Hora: String):Boolean;
    procedure PonerLote(Lote: String);
    function  NumLineasZona(Empresa, Albaran, Cliente, Zona: String; Camara: Integer):Integer;
    function  ComprobarBultos():Boolean;
    function  ComprobarEstuches():Boolean;
    function  ComprobarPalets():Boolean;
    function  ComprobarUnidades():Boolean;
    function  ComprobarLote(Empresa, Cliente, Lote, Familia, Articulo, Camara, Zona: String; LoteOrigen: String = ''):Boolean;
    function  ComprobarLoteRepetido(Empresa,  Lote: String; Albaran: Integer):Boolean;
    function  LupaLotes(Empresa, Cliente, Familia, Articulo, Camara, Zona: String; LoteOrigen: String = ''):Boolean;
    procedure ImprimirAlbaran(Empresa, Cliente, Fecha, ARefCliente: String; Albaran: Integer);
    function  NLineasAlbaran(Empresa: String; Albaran: Integer):Integer;
    procedure LupaCamaraZona();
  public
    { Public declarations }
  end;

var
   Salidas: TSalidas;

implementation

uses UGLobal, MBaseDatos, DM, BAlmacenes, FPrincipal, BSalidas, BLotes, LAlbaranSalida,
     BLotesCamaraZona, dlgPreview;

{$R *.dfm}

//OK
//------------------------ CREACION DEL FORMULARIO -----------------------------
procedure TSalidas.FormCreate(Sender: TObject);
begin
     Top:=1;
     Left:=0;

     SwAlta:=False;
     PosRegistro:=0;
     NRegistros:=0;

     cEmpresa.Text:=EmpresaGlobal;

     QMaestro.AfterScroll:=AlMoverRegistro;
 
     QFamilias.Open;
     QTiposSalida.Open;

     //------------------ Preparamos la tabla de artículos ---------------------
     QArticulos.Close;
     QArticulos.SQL.Clear;
     QArticulos.SQL.Add(' SELECT EMPRESA_A, UNIDAD_MEDIDA_A, DENOMINACION_A FROM ARTICULOS ' +
                        ' WHERE EMPRESA_A=:Empresa ' +
                        ' AND FAMILIA_A=:Familia ' +
                        ' AND CODIGO_A=:Articulo');
     QArticulos.Prepare;

     //------------------ Preparamos la tabla de familias ----------------------
     QFamilias.Close;
     QFamilias.SQL.Clear;
     QFamilias.SQL.Add(' SELECT DESCRIPCION_F FROM FAMILIAS ' +
                       ' WHERE EMPRESA_F=:Empresa ' +
                       ' AND CODIGO_F=:Familia');
     QFamilias.Prepare;

     //------------------ Preparamos la tabla de almacenes ---------------------
     QAlmacenes.Close;
     QAlmacenes.SQL.Clear;
     QAlmacenes.SQL.Add(' SELECT * FROM ALMACENES ' +
                        ' WHERE EMPRESA_AL=:Empresa ' +
                        ' AND CLIENTE_AL=:Cliente ' +
                        ' AND LOTE_AL=:Lote');
     QAlmacenes.Prepare;

     //------------------ Preparamos la tabla de almacenes para buscar por lote origen ---
     QAlmacenesLoteOrigen := TQuery.Create(Self);
     QAlmacenesLoteOrigen.DatabaseName := 'BDFrigo';
     QAlmacenesLoteOrigen.SQL.Add(' SELECT * FROM ALMACENES ' +
                        ' WHERE EMPRESA_AL=:Empresa ' +
                        ' AND CLIENTE_AL=:Cliente ' +
                        ' AND LOTE_AL=:Lote' +
                        ' AND LOTE_ORIGEN=:LoteOrigen');
     QAlmacenesLoteOrigen.Prepare;


     // ----------------- Lotes origen -----------------------------------------
     QLotesOrigenCount := TQuery.Create(Self);
     QLotesOrigenCount.DatabaseName := 'BDFrigo';
     QLotesOrigenCount.SQL.Add(' SELECT count(*) as total FROM ALMACENES ' +
                        ' WHERE EMPRESA_AL=:Empresa ' +
                        ' AND CLIENTE_AL=:Cliente ' +
                        ' AND LOTE_ORIGEN_AL=:LoteOrigen ');
     QLotesOrigenCount.Prepare;

     QLotesOrigen := TQuery.Create(Self);
     QLotesOrigen.DatabaseName := 'BDFrigo';
     QLotesOrigen.SQL.Add(' SELECT * FROM ALMACENES ' +
                        ' WHERE EMPRESA_AL=:Empresa ' +
                        ' AND CLIENTE_AL=:Cliente ' +
                        ' AND LOTE_ORIGEN_AL=:LoteOrigen');
     QLotesOrigen.Prepare;
end;

//OK
//------------------------ CIERRE DEL FORMULARIO -------------------------------
procedure TSalidas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QMaestro.Close;
     QLineas.Close;
     QAlmacenes.Close;
     QContar.Close;
     QArticulos.Close;
     QFamilias.Close;
     QTiposSalida.Close;

     Action:=caFree;
end;

//OK
//----------------------- CIERRE DEL QUERY DEL FORMULARIO ----------------------
procedure TSalidas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

//OK
//--------------------- MENSAJES DE LA BARRA DE ESTADO -------------------------
procedure TSalidas.Mensaje(Texto: String);
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

//OK
//--------------------- MENSAJES DE LA BARRA DE ESTADO -------------------------
procedure TSalidas.MensajeFijo(Texto: String);
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
     Timer1.Enabled:=False;
end;

//OK
//--------------------- TIMER PARALOS MENSAJES ---------------------------------
procedure TSalidas.Timer1Timer(Sender: TObject);
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

//OK
//-------------- HABILITAR BOTONES DE POSICION DE REGISTRO ---------------------
procedure TSalidas.BotonesPosicion;
begin
     if (SwAlta=False) and (QMaestro.State<>dsEdit) then
     begin
          if QLineas.State in dsEditModes then
          begin
               BCancelar.Enabled:=True;
               BAceptar.Enabled:=True;
               BBusqueda.Enabled:=False;
               BAlta.Enabled:=False;
               BBorrar.Enabled:=False;
               BImprimir.Enabled:=False;
               BSalir.Enabled:=False;
               BPrimero.Enabled:=False;
               BSiguiente.Enabled:=False;
               BAnterior.Enabled:=False;
               BUltimo.Enabled:=False;

               BAltaL.Enabled:=False;
               BBorrarL.Enabled:=False;
               BPrimeroL.Enabled:=False;
               BAnteriorL.Enabled:=False;
               BSiguienteL.Enabled:=False;
               BUltimoL.Enabled:=False;
          end
          else
          begin
               BBusqueda.Enabled:=True;
               BSalir.Enabled:=True;
               if NRegistros>0 then
               begin
                    BBorrar.Enabled:=True;
                    BImprimir.Enabled:=True;
                    BCancelar.Enabled:=True;

                    BAltaL.Enabled:=True;
                    BBorrarL.Enabled:=True;
                    BPrimeroL.Enabled:=True;
                    BAnteriorL.Enabled:=True;
                    BSiguienteL.Enabled:=True;
                    BUltimoL.Enabled:=True;
               end
               else
               begin
                    BBorrar.Enabled:=False;
                    BImprimir.Enabled:=False;
                    BCancelar.Enabled:=False;

                    BAltaL.Enabled:=False;
                    BBorrarL.Enabled:=False;
                    BPrimeroL.Enabled:=False;
                    BAnteriorL.Enabled:=False;
                    BSiguienteL.Enabled:=False;
                    BUltimoL.Enabled:=False;
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
          end;
          BarraEstado.Panels[1].Text := 'Registro ' + IntToStr(PosRegistro) + ' de ' +  IntToStr(NRegistros);
    end
    else
    begin
         BBusqueda.Enabled:=False;
         BSalir.Enabled:=False;
         BBorrar.Enabled:=False;
         BImprimir.Enabled:=False;
         BAlta.Enabled:=False;

         BAltaL.Enabled:=False;
         BBorrarL.Enabled:=False;
         BPrimeroL.Enabled:=False;
         BAnteriorL.Enabled:=False;
         BSiguienteL.Enabled:=False;
         BUltimoL.Enabled:=False;

         BCancelar.Enabled:=True;
         BAceptar.Enabled:=True;
    end;
end;

//OK
//--------------------- BOTON ALTA DE ALBARAN ----------------------------------
procedure TSalidas.Alta(Sender: TObject);
begin
     swAlta:=True;
     PonerColorAlta();
     Mensaje('Alta de Registro');
     BarraEstado.Panels[1].Text:='';

     NRegistros:=0;
     PosRegistro:=0;

     QMaestro.Close;

     PanelClaves.Enabled:=True;
     PanelCabecera.Enabled:=True;
     PanelLineas.Enabled:=False;
     PanelInsertarLinea.Visible:=False;

     cEmpresa.Text:=EmpresaGlobal;
     cAlbaran.Text:='';
     cAlbaran.SetFocus;

     cHora.OnChange:=nil;
     cHora.Text:='';
     cHora.OnChange:=cHoraChange;

     cTemperatura.Text:='-18';

     cFechaAlbaran.Properties.OnChange:=nil;
     cFechaAlbaran.Text:='';
     cFechaAlbaran.Properties.OnChange:=cFechaAlbaranChange;

     //Campos que no se pueden modificar (Solo en Altas)
     cCliente.Properties.ReadOnly:=False;
     cFechaAlbaran.Properties.ReadOnly:=False;
     //cHora.ReadOnly:=False;
     cTipoSalida.ReadOnly:=False;

     cCliente.TabStop:=True;
     cFechaAlbaran.TabStop:=True;
     //cHora.TabStop:=True;
     cTipoSalida.TabStop:=True;

     cCliente.Style.Font.Color:=clBlack;
     cFechaAlbaran.Style.Font.Color:=clBlack;
     //cHora.Font.Color:=clBlack;
     cTipoSalida.Font.Color:=clBlack;

     //Botones
     BCancelar.Enabled:=True;
     BAceptar.Enabled:=False;
     BBusqueda.Enabled:=False;
     BAlta.Enabled:=False;
     BBorrar.Enabled:=False;
     BImprimir.Enabled:=False;

     BSalir.Enabled:=False;
     BPrimero.Enabled:=False;
     BSiguiente.Enabled:=False;
     BAnterior.Enabled:=False;
     BUltimo.Enabled:=False;

     BAltaL.Enabled:=False;
     BBorrarL.Enabled:=False;
     BPrimeroL.Enabled:=False;
     BAnteriorL.Enabled:=False;
     BSiguienteL.Enabled:=False;
     BUltimoL.Enabled:=False;

     if (Length(cEmpresa.Text)>0) and (cAlbaran.Text='') then
     begin
          AlbaranToca:=LeerNumeroAlbaran(cEmpresa.Text);
          cAlbaran.Text:=IntToStr(AlbaranToca);
          if cAlbaran.Text='0' then
             cEmpresa.SetFocus;
     end;
end;

//OK
//--------------------- BOTON BORRAR -------------------------------------------
procedure TSalidas.Borrar(Sender: TObject);
begin
     {CARMEN!!
     if QMaestro.FieldByName('Fecha_Factura_cs').AsString<>'' then
        MessageDlg (Chr(13) + 'No puede borrar un albarán ya facturado', mtError,[mbOk],0)
     else
     begin
     }
          if MessageBox(Handle, PChar('Va a borrarse el albarán ¿Está seguro?'),
                        PChar(Self.Caption),
                        MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1)=IDYES then
             EliminarAlbaran();
     //end;
end;

//OK
//---------------------- BORRADO DE UN ALBARAN ---------------------------------
procedure TSalidas.EliminarAlbaran();
Var
   QAux: TQuery;
begin
     try
        //Borrado de las lineas
        if not QLineas.IsEmpty then
        begin
             QAux:=TQuery.Create(nil);
             try
                QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

                //Para cada linea que vamos a borrar actualizamos el cliente y el almacen
                QAux.SQL.Add(' SELECT * FROM CABECERA_SALIDAS, LINEA_SALIDAS ' +
                             ' WHERE EMPRESA_CS=EMPRESA_LS ' +
                             ' AND ALBARAN_CS=ALBARAN_LS ' +
                             ' AND EMPRESA_LS=' + QuotedStr(QMaestro.FieldByName('EMPRESA_CS').AsString) +
                             ' AND ALBARAN_LS=' + IntToStr(QMaestro.FieldByName('ALBARAN_CS').AsInteger));
                QAux.Open;
                while not QAux.Eof do
                begin
                     //Actualizamos el valor del stock y el de mercancia retenida del cliente
                     ActualizarCliente('DELETE',
                                       QAux.FieldByName('Empresa_ls').AsString,
                                       QAux.FieldByName('Familia_ls').AsString,
                                       QAux.FieldByName('Articulo_ls').AsString,
                                       QAux.FieldByName('Cliente_cs').AsString,
                                       QAux.FieldByName('Unidades_ls').AsFloat);
                     ActualizarAlmacen('DELETE',
                                       QAux.FieldByName('Empresa_ls').AsString,
                                       QAux.FieldByName('Cliente_cs').AsString,
                                       QAux.FieldByName('Lote_ls').AsString,
                                       QAux.FieldByName('Fecha_Albaran_cs').AsString,
                                       QAux.FieldByName('Tipo_Salida_cs').AsString,
                                       QAux.FieldByName('Bultos_ls').AsInteger,
                                       QAux.FieldByName('Estuches_Sueltos_ls').AsInteger,
                                       QAux.FieldByName('Palets_ls').AsInteger,
                                       QAux.FieldByName('Unidades_ls').AsFloat
                                      );
                     QAux.Next;
                end;
                //Borramos las lineas
                QAux.Close;
                QAux.SQL.Clear;
                QAux.SQL.Add(' DELETE FROM LINEA_SALIDAS ' +
                             ' WHERE EMPRESA_LS=' + QuotedStr(QMaestro.FieldByName('EMPRESA_CS').AsString) +
                             ' AND ALBARAN_LS=' + IntToStr(QMaestro.FieldByName('ALBARAN_CS').AsInteger));
                if not DMBaseDatos.BDFrigo.InTransaction then
                   DMBaseDatos.BDFrigo.StartTransaction;
                QAux.ExecSQL;
             finally
                    QAux.Close;
                    FreeAndNil(QAux);
             end;
        end;

        if not DMBaseDatos.BDFrigo.InTransaction then
           DMBaseDatos.BDFrigo.StartTransaction;
        QMaestro.Delete;
        if DMBaseDatos.BDFrigo.InTransaction then
           DMBaseDatos.BDFrigo.Commit;

        if PosRegistro=NRegistros then  //Solo si es el ultimo dec. el numero de reg. actual
           Dec(PosRegistro);
        Dec(NRegistros);     //Dec. el numero de registros total
        BotonesPosicion();   //Actualizamos los botones de direccion

        if NRegistros=0 then
        begin
             PanelClaves.Enabled:=True;
             cEmpresa.Text:=EmpresaGlobal;
             cAlbaran.SetFocus;

             cLupaClientes.Enabled:=False;

             cHora.OnChange:=Nil;
             cHora.Text:='';
             cHora.OnChange:=cHoraChange;

             cTemperatura.Text:='-18';

             cFechaAlbaran.Properties.OnChange:=Nil;
             cFechaAlbaran.Text:='';
             cFechaAlbaran.Properties.OnChange:=cFechaAlbaranChange;
        end;
     except
           on E:Exception do
                begin
                     CapturaErrores(E);
                     QMaestro.Cancel;
                     if DMBaseDatos.BDFrigo.InTransaction then
                        DMBaseDatos.BDFrigo.Rollback;
                end;
     end;
end;

//OK
//-------------------------- PRIMER REGISTRO -----------------------------------
procedure TSalidas.Primero(Sender: TObject);
begin
     PosRegistro:=1;          //Numero de registro en el que estamos
     QMaestro.First;
     BotonesPosicion();
end;

//OK
//-------------------------- REGISTRO ANTERIOR ---------------------------------
procedure TSalidas.Anterior(Sender: TObject);
begin
     if PosRegistro>1 then
        Dec(PosRegistro);        //Numero de registro en el que estamos
     QMaestro.Prior;
     BotonesPosicion();
end;

procedure TSalidas.bAltaLClick(Sender: TObject);
begin

end;

//OK
//-------------------------- REGISTRO SIGUIENTE --------------------------------
procedure TSalidas.Siguiente(Sender: TObject);
begin
     if PosRegistro<NRegistros then
        Inc(PosRegistro);       //Numero de registro en el que estamos
     QMaestro.Next;
     BotonesPosicion();
end;

//OK
//-------------------------- ULTIMO REGISTRO -----------------------------------
procedure TSalidas.Ultimo(Sender: TObject);
begin
     PosRegistro:=NRegistros; //Numero de registro en el que estamos
     QMaestro.Last;
     BotonesPosicion();
end;

//OK
//----------------------------- BUSQUEDA ---------------------------------------
procedure TSalidas.Busqueda(Sender: TObject);
Var
   Aux: TBusquedaSalidas;
begin
     try
        Aux:=TBusquedaSalidas.Create(Self);
        with Aux do
        begin
             ShowModal;
             if (EmpresaBus<>'') and (AlbaranBus<>'') then   //Seleccionamos un registro del grid resultado
             begin
                  Application.ProcessMessages;
                  if EjecutaQuery(EmpresaBus, AlbaranBus) then
                  begin
                       Self.PanelClaves.Enabled:=False;
                       Self.PanelLineas.Enabled:=True;

                       //Campos que no se pueden modificar
                       cCliente.Properties.ReadOnly:=True;
                       cLupaClientes.Enabled:=False;
                       cFechaAlbaran.Properties.ReadOnly:=True;
                       //cHora.ReadOnly:=True;
                       cTipoSalida.ReadOnly:=True;

                       cCliente.TabStop:=False;
                       cFechaAlbaran.TabStop:=False;
                       //cHora.TabStop:=False;
                       cTipoSalida.TabStop:=False;

                       cCliente.Style.Font.Color:=clRed;
                       cFechaAlbaran.Style.Font.Color:=clRed;
                       //cHora.Font.Color:=clRed;
                       cTipoSalida.Font.Color:=clRed;
                  end
                  else  //Si no hay registros que mostrar
                  begin
                       Self.PanelClaves.Enabled:=True;
                       cEmpresa.Text:=EmpresaGlobal;
                       cAlbaran.Text:='';
                       cAlbaran.SetFocus;
                       cLupaClientes.Enabled:=False;
                       Mensaje('Registro no existe');
                  end;
             end
             else if ModalResult=mrOk then  //Aceptamos desde el boton ACEPTAR (Devolvemos todos los registros del filtro)
             begin
                  Application.ProcessMessages;
                  if EjecutaQueryBus(WhereBus) then
                  begin
                       Self.PanelClaves.Enabled:=False;
                       Self.PanelLineas.Enabled:=True;

                       //Campos que no se pueden modificar
                       cCliente.Properties.ReadOnly:=True;
                       cLupaClientes.Enabled:=False;
                       cFechaAlbaran.Properties.ReadOnly:=True;
                       //cHora.ReadOnly:=True;
                       cTipoSalida.ReadOnly:=True;

                       cCliente.TabStop:=False;
                       cFechaAlbaran.TabStop:=False;
                       //cHora.TabStop:=False;
                       cTipoSalida.TabStop:=False;

                       cCliente.Style.Font.Color:=clRed;
                       cFechaAlbaran.Style.Font.Color:=clRed;
                       //cHora.Font.Color:=clRed;
                       cTipoSalida.Font.Color:=clRed;
                  end
                  else  //Si no hay registros que mostrar
                  begin
                       Self.PanelClaves.Enabled:=True;
                       cEmpresa.Text:=EmpresaGlobal;
                       cAlbaran.Text:='';
                       cAlbaran.SetFocus;
                       cLupaClientes.Enabled:=False;
                       Mensaje('Registro no existe');
                 end;
            end
        end;
     finally
            FreeAndNil(Aux);
     end;
end;

//------------------------ BOTON ACEPTAR ----------------------------------------
procedure TSalidas.Aceptar(Sender: TObject);
begin
     Application.ProcessMessages;
     if QMaestro.State in [dsEdit,dsInsert] then   //CABECERA
     begin
          if ValidarClaves() and ValidarCabecera() then   //Comprobamos que los datos son correctos
          begin
               //GRABACION DEL REGISTRO
               try
                  if QMaestro.State=dsEdit then  //MODIFICAR CABECERA
                  begin
                       PostMessage(Handle,WM_NEXTDLGCTL,0,0);
                       Application.ProcessMessages;

                       //Si esta contabilizada damos un aviso
                       if Contabilizada then
                       begin
                            if MessageBox(Handle, PChar('La facturra está contabilizada.' + chr(13) + '¿Desea modificarla de todas formas?'),
                                          PChar(Self.Caption),
                                          MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1)=IDNO then
                            begin
                                 QMaestro.Cancel;
                                 Exit;
                            end;
                       end;

                       if not QMaestro.Database.InTransaction then
                          QMaestro.Database.StartTransaction;
                       QMaestro.Post;
                       if QMaestro.Database.InTransaction then
                          QMaestro.Database.Commit;

                       PanelClaves.Enabled:=False;
                       PanelLineas.Enabled:=True;
                       
                       Application.ProcessMessages;
                  end
                  else if QMaestro.State=dsInsert then  //INSERTAR CABECERA
                  begin
                       PostMessage(Handle,WM_NEXTDLGCTL,0,0);
                       Application.ProcessMessages;

                       if not QMaestro.Database.InTransaction then
                          QMaestro.Database.StartTransaction;
                       QMaestro.Post;
                       if QMaestro.Database.InTransaction then
                          QMaestro.Database.Commit;

                       PosRegistro:=1;
                       NRegistros:=1;

                       //Finalizacion de la grabacion
                       Mensaje('Registro Grabado');

                       swAlta:=False;
                       QuitarColorAlta();

                       //Insertamos Lineas
                       BAltaLinea(Self);
                end;
             except
                   on E:Exception do
                        begin
                             CapturaErrores(E);
                             if DMBaseDatos.BDFrigo.InTransaction then
                                DMBaseDatos.BDFrigo.Rollback;
                        end;
             end;
         end;
    end
    else   //LINEAS
    begin
         cUnidades.OnExit:=Nil;

         //Si el campo esta vacio se pone a CERO
         if cBultos.Text='' then
            QLineas.FieldByName('Bultos_ls').AsInteger:=0;
         if cPalets.Text='' then
            QLineas.FieldByName('Palets_ls').AsInteger:=0;
         if cEstuches.Text='' then
            QLineas.FieldByName('Estuches_Sueltos_ls').AsInteger:=0;

         if ValidarLinea() then   //Comprobamos que los datos de la linea son correctos
         begin
              try
                 if not DMBaseDatos.BDFrigo.InTransaction then
                    DMBaseDatos.BDFrigo.StartTransaction;
                 if QLineas.State=dsInsert then      //INSERTAR LINEA
                 begin
                      QLineas.Post;

                      //Actualizmos el Valor del Stock del cliente y el de mercacia retenida
                      ActualizarCliente('ADD',
                                        QMaestro.FieldByName('Empresa_cs').AsString,
                                        QLineas.FieldByName('Familia_ls').AsString,
                                        QLineas.FieldByName('Articulo_ls').AsString,
                                        QMaestro.FieldByName('Cliente_cs').AsString,
                                        QLineas.FieldByName('Unidades_ls').AsFloat);
                      //Actualizamos el stock del almacen
                      ActualizarAlmacen('ADD',
                                        QMaestro.FieldByName('Empresa_cs').AsString,
                                        QMaestro.FieldByName('Cliente_cs').AsString,
                                        QLineas.FieldByName('Lote_ls').AsString,
                                        QMaestro.FieldByName('Fecha_Albaran_cs').AsString,
                                        QMaestro.FieldByName('Tipo_Salida_cs').AsString,
                                        QLineas.FieldByName('Bultos_ls').AsInteger,
                                        QLineas.FieldByName('Estuches_Sueltos_ls').AsInteger,
                                        QLineas.FieldByName('Palets_ls').AsInteger,
                                        QLineas.FieldByName('Unidades_ls').AsFloat
                                        );
                      if QMaestro.Database.InTransaction then
                         DMBaseDatos.BDFrigo.Commit;

                      //Para actualizar el Grid
                      QLineas.Close;
                      QLineas.Open;

                      //----------------- NUEVA ALTA --------------------------------
                      QLineas.Insert;

                      cLote.SetFocus;

                      //------------------------ DATOS DE LA LINEA POR DEFECTO -------------
                      QLineas.FieldByName('Empresa_ls').AsString:=QMaestro.FieldByName('Empresa_cs').AsString;
                      QLineas.FieldByName('Albaran_ls').AsString:=QMaestro.FieldByName('Albaran_cs').AsString;
                      QLineas.FieldByName('Bultos_ls').AsInteger:=0;
                      QLineas.FieldByName('Estuches_sueltos_ls').AsInteger:=0;
                      QLineas.FieldByName('Unidades_ls').AsInteger:=0;
                      QLineas.FieldByName('Palets_ls').AsInteger:=0;
                      QLineas.FieldByName('Tipo_lote_ls').AsString:=QMaestro.FieldByName('Tipo_Salida_cs').AsString;
                      QLineas.FieldByName('NLinea_ls').AsInteger:=Nlinea;
                      Inc(Nlinea);
                      //------------------------ DATOS DE LA LINEA POR DEFECTO -------------
                 end
                 else  //MODIFICAR LINEA
                 begin
                      QLineas.Post;

                      //Actualizmos el Valor del Stock del cliente y el de mercacia retenida
                      ActualizarCliente('EDIT',
                                        QMaestro.FieldByName('Empresa_cs').AsString,
                                        QLineas.FieldByName('Familia_ls').AsString,
                                        QLineas.FieldByName('Articulo_ls').AsString,
                                        QMaestro.FieldByName('Cliente_cs').AsString,
                                        QLineas.FieldByName('Unidades_ls').AsFloat);
                      //Actualizamos el stock del almacen
                      ActualizarAlmacen('EDIT',
                                        QMaestro.FieldByName('Empresa_cs').AsString,
                                        QMaestro.FieldByName('Cliente_cs').AsString,
                                        QLineas.FieldByName('Lote_ls').AsString,
                                        QMaestro.FieldByName('Fecha_Albaran_cs').AsString,
                                        QMaestro.FieldByName('Tipo_Salida_cs').AsString,
                                        QLineas.FieldByName('Bultos_ls').AsInteger,
                                        QLineas.FieldByName('Estuches_Sueltos_ls').AsInteger,
                                        QLineas.FieldByName('Palets_ls').AsInteger,
                                        QLineas.FieldByName('Unidades_ls').AsFloat
                                        );
                      if QMaestro.Database.InTransaction then
                         DMBaseDatos.BDFrigo.Commit;

                      //Para actualizar el Grid
                      QLineas.Close;
                      QLineas.Open;

                      PanelInsertarLinea.Visible:=False;
                      PanelClaves.Enabled:=False;
                      PanelCabecera.Enabled:=True;
                      PanelLineas.Enabled:=True;

                      BotonesPosicion();
                 end;
                 MensajeFijo('');
              except
                    On E:Exception do
                         begin
                             CapturaErrores(E);
                             if DMBaseDatos.BDFrigo.InTransaction then
                                DMBaseDatos.BDFrigo.Rollback;
                         end;
              end;
         end;
         cUnidades.OnExit:=cUnidadesExit;
    end;
    BotonesPosicion();
end;

//OK
//--------------------- BOTON CANCELAR -----------------------------------------
procedure TSalidas.Cancelar(Sender: TObject);
Var
   Imprimir: Boolean;
begin
     if QMaestro.State in dsEditModes then   //Añadir o modificar cabeceras
     begin
          case MessageBox(Handle, PChar('¿Desea cancelar los cambios?'),
                          PChar(Self.Caption),
                          MB_ICONQUESTION + MB_YESNOCANCEL + MB_DEFBUTTON1) of
                IDYES:
                      if QMaestro.State = dsEdit then   //Modificacion
                      begin
                           QMaestro.Cancel;
                           PanelLineas.Enabled:=True;
                           BotonesPosicion();
                           Exit;
                      end
                      else   //Alta
                      begin
                           QMaestro.Cancel;

                           PanelClaves.Enabled:=True;
                           PanelLineas.Enabled:=False;
                           SwAlta:=False;

                           QuitarColorAlta();

                           cHora.OnChange:=Nil;
                           cHora.Text:='';
                           cHora.OnChange:=cHoraChange;

                           cFechaAlbaran.Properties.OnChange:=Nil;
                           cFechaAlbaran.Text:='';
                           cFechaAlbaran.Properties.OnChange:=cFechaAlbaranChange;

                           cAlbaran.SetFocus;
                           cEmpresa.Text:=EmpresaGlobal;
                           cAlbaran.Text:='';

                           //Campos que no se pueden modificar
                           cCliente.Properties.ReadOnly:=False;
                           cLupaClientes.Enabled:=False;
                           cFechaAlbaran.Properties.ReadOnly:=False;
                           //cHora.ReadOnly:=False;
                           cTipoSalida.ReadOnly:=False;

                           cCliente.TabStop:=True;
                           cFechaAlbaran.TabStop:=True;
                           //cHora.TabStop:=True;
                           cTipoSalida.TabStop:=True;

                           cCliente.Style.Font.Color:=clBlack;
                           cFechaAlbaran.Style.Font.Color:=clBlack;
                           //cHora.Font.Color:=clBlack;
                           cTipoSalida.Font.Color:=clBlack;

                           PosRegistro:=0;
                           NRegistros:=0;

                           Mensaje('Cambios Ignorados');

                           BotonesPosicion();
                     end;
                IDNO:
                     Aceptar(Self);
                IDCANCEL:
                         Exit;
          end;
     end
     else if QLineas.State in dsEditModes then      //Añadir o modificar lineas
     begin
          Imprimir:=False;
          if QLineas.State=dsInsert then
             Imprimir:=True;

          QLineas.Cancel;
          QAlmacenes.Close;

          //Habilito lo que puede estar deshabilitado
          cFAmilia.Enabled:=True;
          cArticulo.Enabled:=True;

          cCamara.Text:='';
          cZona.Text:='';
          PanelInsertarLinea.Visible:=False;
          PanelClaves.Enabled:=False;
          PanelCabecera.Enabled:=True;

          //Si el albaran no tiene lineas preguntamos si lo borramos
          if QLineas.IsEmpty then
          begin
               if MessageBox(Handle, PChar('Albarán sin líneas.' + chr(13) + '¿Desea eliminarlo?'),
                             PChar(Self.Caption),
                             MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1)=IDYES then
                  EliminarAlbaran();
               PanelLineas.Enabled:=False;
          end
          else
          begin
               PanelLineas.Enabled:=True;
               if Imprimir then
                  ImprimirAlbaran(QMaestro.FieldByName('Empresa_cs').AsString,
                                  QMaestro.FieldByName('Cliente_cs').AsString,
                                  DiaMesAnyo(QMaestro.FieldByName('Fecha_Albaran_cs').AsString),
                                  QMaestro.FieldByName('ref_cliente_cs').AsString,
                                  QMaestro.FieldByName('Albaran_cs').AsInteger);
          end;

          BotonesPosicion();
          MensajeFijo('');
     end
     else if not QMaestro.IsEmpty then  //Cancelamos con registros activo
     begin
          QMaestro.Close;

          //A partir de aqui se hace si cancelo un alta
          PanelClaves.Enabled:=True;
          PanelLineas.Enabled:=False;
          SwAlta:=False;

          QuitarColorAlta();

          cHora.OnChange:=Nil;
          cHora.Text:='';
          cHora.OnChange:=cHoraChange;

          cFechaAlbaran.Properties.OnChange:=Nil;
          cFechaAlbaran.Text:='';
          cFechaAlbaran.Properties.OnChange:=cFechaAlbaranChange;

          cAlbaran.SetFocus;
          cEmpresa.Text:=EmpresaGlobal;
          cAlbaran.Text:='';

          //Campos que no se pueden modificar
          cCliente.Properties.ReadOnly:=False;
          cLupaClientes.Enabled:=False;
          cFechaAlbaran.Properties.ReadOnly:=False;
          //cHora.ReadOnly:=False;
          cTipoSalida.ReadOnly:=False;

          cCliente.TabStop:=True;
          cFechaAlbaran.TabStop:=True;
          //cHora.TabStop:=True;
          cTipoSalida.TabStop:=True;

          cCliente.Style.Font.Color:=clBlack;
          cFechaAlbaran.Style.Font.Color:=clBlack;
          //cHora.Font.Color:=clBlack;
          cTipoSalida.Font.Color:=clBlack;

          PosRegistro:=0;
          NRegistros:=0;

          Mensaje('Cambios Ignorados');

          BotonesPosicion();
     end
     else
     begin
          PanelClaves.Enabled:=True;
          PanelLineas.Enabled:=False;
          SwAlta:=False;

          QuitarColorAlta();

          cHora.OnChange:=Nil;
          cHora.Text:='';
          cHora.OnChange:=cHoraChange;

          cFechaAlbaran.Properties.OnChange:=Nil;
          cFechaAlbaran.Text:='';
          cFechaAlbaran.Properties.OnChange:=cFechaAlbaranChange;

          cAlbaran.SetFocus;
          cEmpresa.Text:=EmpresaGlobal;
          cAlbaran.Text:='';

          //Campos que no se pueden modificar
          cCliente.Properties.ReadOnly:=False;
          cLupaClientes.Enabled:=False;
          cFechaAlbaran.Properties.ReadOnly:=False;
          //cHora.ReadOnly:=False;
          cTipoSalida.ReadOnly:=False;

          cCliente.TabStop:=True;
          cFechaAlbaran.TabStop:=True;
          //cHora.TabStop:=True;
          cTipoSalida.TabStop:=True;

          cCliente.Style.Font.Color:=clBlack;
          cFechaAlbaran.Style.Font.Color:=clBlack;
          //cHora.Font.Color:=clBlack;
          cTipoSalida.Font.Color:=clBlack;

          PosRegistro:=0;
          NRegistros:=0;

          Mensaje('Cambios Ignorados');

          BotonesPosicion();
     end;
end;

//OK
//----------------------------- SALIR ------------------------------------------
procedure TSalidas.Salir(Sender: TObject);
begin
     Close;
end;

//OK
//-------------------------- VALIDACION DE DATOS CLAVE ----------------------
function TSalidas.ValidarClaves():Boolean;
begin
     Result:=True;
     if cEmpresa.Text='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'Falta el código de empresa', mtError,[mbOk],0);
          cEmpresa.SetFocus;
     end
     else if tNomEmpresa.Caption='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'La empresa no existe', mtError,[mbOk],0);
          cEmpresa.SetFocus;
     end
     else if cAlbaran.Text='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'Falta el código del albarán', mtError,[mbOk],0);
          cAlbaran.SetFocus;
     end
     else if swAlta then  //Alta
             Result:=ComprobarAlbaran();
end;

//-------------------------- VALIDACION DE DATOS CABECERA ----------------------
function TSalidas.ValidarCabecera():Boolean;
Var
   Minutos: Integer;
begin
     Result:=True;
     if (cCliente.Text='') then   //Cliente
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'El código del cliente es obligatorio', mtError,[mbOk],0);
          cCliente.SetFocus;
          Exit;
     end;
     if tNomCliente.Caption='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'El cliente no existe', mtError,[mbOk],0);
          cCliente.SetFocus;
          Exit;
     end;
     if not EsFecha(cFechaAlbaran.Text) then  //Fecha
     begin
          Result:=False;
          cFechaAlbaran.SetFocus;
          MessageDlg (Chr(13) + 'La fecha es incorrecta', mtError,[mbOk],0);
          Exit;
     end;
     if cMatricula.Text='' then   //Matricula
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'La matrícula es obligatoria', mtError,[mbOk],0);
          cMatricula.SetFocus;
          Exit;
     end;
     if cRetira.Text='' then   //Retira
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'Retira es obligatorio', mtError,[mbOk],0);
          cRetira.SetFocus;
          Exit;
     end;
     if cNifRetira.Text='' then   //NIF Retira
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'El N.I.F. retira es obligatorio', mtError,[mbOk],0);
          cNifRetira.SetFocus;
          Exit;
     end;
     if not ComprobarHora(CHora.Text) then  //Hora
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'La hora es incorrecta', mtError,[mbOk],0);
          cHora.SetFocus;
          Exit;
     end;

     //Correo Jose Maria de 06/09/2012 para utilizar campo Concepto como Observaciones
     {if (QMaestro.FieldByName('Importe_Salida_cs').AsFloat=0) and (QMaestro.FieldByName('Horas_Salida_cs').AsFloat=0) and (cConcepto.Text<>'') then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'Sin importe ni horas no debe existir concepto', mtError,[mbOk],0);
          cConcepto.SetFocus;
          cConcepto.SelectAll;
          Exit;
     end;}
     Minutos:=StrToInt(RellenarCeros(ParteDecimal(QMaestro.FieldByName('horas_salida_cs').AsFloat),2,'D'));
     if Minutos>59 then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'El rango de minutos en las horas de entrada es incorrecto', mtError,[mbOk],0);
          cHorasFacturar.SetFocus;
     end;
end;

//OK
//------------------- FOCO EN EL PANEL DE DATOS --------------------------------
procedure TSalidas.PanelClavesExit(Sender: TObject);
begin
     if QMaestro.IsEmpty then
     begin                                            
          if ValidarClaves() then
          begin
               if not SwAlta then  //Si no es alta
               begin
                    if not EjecutaQuery(cEmpresa.Text, cAlbaran.Text) then   //Si no hay datos
                    begin
                         cAlbaran.SetFocus;
                         Mensaje('El registro no existe');
                    end
                    else  //Si hay datos
                    begin
                         PanelClaves.Enabled:=False;
                         PanelLineas.Enabled:=True;

                         cOrden.SetFocus;

                         //Campos que no se pueden modificar
                         cCliente.Properties.ReadOnly:=True;
                         cLupaClientes.Enabled:=False;
                         cFechaAlbaran.Properties.ReadOnly:=True;
                         //cHora.ReadOnly:=True;
                         cTipoSalida.ReadOnly:=True;

                         cCliente.TabStop:=False;
                         cFechaAlbaran.TabStop:=False;
                         //cHora.TabStop:=False;
                         cTipoSalida.TabStop:=False;

                         cCliente.Style.Font.Color:=clRed;
                         cFechaAlbaran.Style.Font.Color:=clRed;
                         //cHora.Font.Color:=clRed;
                         cTipoSalida.Font.Color:=clRed;
                    end;
               end
               else
               begin
                    //No existe -> Hacemos el alta
                    if not EjecutaQuery(cEmpresa.Text, cAlbaran.Text) then   //Si no hay datos
                    begin
                         PanelClaves.Enabled:=False;
                         PanelLineas.Enabled:=False;

                         QMaestro.append;
                         Mensaje('Alta de registro');
                         BAceptar.Enabled:=True;

                         //Campos que no se pueden modificar (Solo en Altas)
                         cCliente.Properties.ReadOnly:=False;
                         cLupaClientes.Enabled:=True;
                         cFechaAlbaran.Properties.ReadOnly:=False;
                         //cHora.ReadOnly:=False;
                         cTipoSalida.ReadOnly:=False;

                         cCliente.TabStop:=True;
                         cFechaAlbaran.TabStop:=True;
                         //cHora.TabStop:=True;
                         cTipoSalida.TabStop:=True;

                         cCliente.Style.Font.Color:=clBlack;
                         cFechaAlbaran.Style.Font.Color:=clBlack;
                         //cHora.Font.Color:=clBlack;
                         cTipoSalida.Font.Color:=clBlack;
                    end
                    else  //El registro ya existe
                    begin
                         Mensaje('El registro ya existe');
                         QMaestro.Close;
                         BarraEstado.Panels[1].Text:='';
                         cAlbaran.SetFocus;
                    end;
               end;
          end;
     end;
end;

//OK
//------------------------ APERTURA DE LA QUERY PRINCIPAL ----------------------
function TSalidas.EjecutaQuery(Empresa, Albaran: String):Boolean;
begin
     Result:=False;
     NRegistros:=0;
     PosRegistro:=0;
     try
        //QLineas.Close;
        QMaestro.Close;
        QMaestro.SQL.Clear;
        QMaestro.SQL.Add(' SELECT * FROM CABECERA_SALIDAS ' +
                         ' WHERE EMPRESA_CS=' + QuotedStr(Empresa) +
                         ' AND ALBARAN_CS=' + QuotedStr(Albaran) +
                         ' ORDER BY EMPRESA_CS, ALBARAN_CS');
        QMaestro.Open;
        //QLineas.Open;
        if QMaestro.IsEmpty then
           Result:=False
        else
        begin
             try    //Contamos los Registros
                With QContar do
                begin
                     Close;
                     SQL.Clear;
                     SQL.Add(' SELECT COUNT(*) AS NREGISTROS ' +
                             ' FROM CABECERA_SALIDAS ' +
                             ' WHERE EMPRESA_CS=' + QuotedStr(Empresa) +
                             ' AND ALBARAN_CS=' + QuotedStr(Albaran));
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

//OK
//---------------- APERTURA DE LA QUERY PRINCIPAL DESDE LA BUSQUEDA-------------
function TSalidas.EjecutaQueryBus(WhereBus: String):Boolean;
begin
     Result:=False;
     NRegistros:=0;
     PosRegistro:=0;
     try
        QMaestro.Close;
        QMaestro.SQL.Clear;
        QMaestro.SQL.Add('SELECT * FROM CABECERA_SALIDAS ' +
                         WhereBus +
                         ' ORDER BY EMPRESA_CS, CLIENTE_CS, ALBARAN_CS, FECHA_ALBARAN_CS');
        QMaestro.Open;
        //QLineas.Open;
        if QMaestro.IsEmpty then
           Result:=False
        else
        begin
             try    //Contamos los Registros
                With QContar do
                begin
                     Close;
                     SQL.Clear;
                     SQL.Add('SELECT COUNT(*) AS NREGISTROS FROM CABECERA_SALIDAS ' + WhereBus);
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

//OK
//-------------------- EVENTO SCROLL -------------------------------------------
procedure TSalidas.AlMoverRegistro(DataSet: TDataSet);
begin
     if SwAlta=False then  //El estado es de visualizacion
     begin
          cEmpresa.Text:=QMaestro.FieldByName('EMPRESA_CS').AsString;  //No estan enganchados a BD y debemos asignarlos a mano
          cAlbaran.Text:=QMaestro.FieldByName('ALBARAN_CS').AsString;
          //if QMaestro.FieldByName('HORA_CS').AsString<>'' then
          //begin
               cHora.OnChange:=Nil;
               cHora.Text:=StringReplace(QMaestro.FieldByName('HORA_CS').AsString, ':', '',[rfReplaceAll]);
               cHora.OnChange:=cHoraChange;
          //end;
          if QMaestro.FieldByName('FECHA_ALBARAN_CS').AsString<>'' then
          begin
               cFechaAlbaran.Properties.OnChange:=Nil;
               cFechaAlbaran.Text:=DiaMesAnyo(QMaestro.FieldByName('FECHA_ALBARAN_CS').AsString);
               cFechaAlbaran.Properties.OnChange:=cFechaAlbaranChange;
          end;
     end;
end;

//OK
//--------------------- CAMBIO DE ESTADO DEL DATA SOURCE -----------------------
procedure TSalidas.DSMaestroStateChange(Sender: TObject);
begin
     BAceptar.Enabled:=QMaestro.State in dsEditModes;
     if QMaestro.State in dsEditModes then
     begin
          BPrimero.Enabled:=False;
          BAnterior.Enabled:=False;
          BSiguiente.Enabled:=False;
          BUltimo.Enabled:=False;

          BAltaL.Enabled:=False;
          BBorrarL.Enabled:=False;
          BPrimeroL.Enabled:=False;
          BAnteriorL.Enabled:=False;
          BSiguienteL.Enabled:=False;
          BUltimoL.Enabled:=False;

          BBorrar.Enabled:=False;
          BImprimir.Enabled:=False;
          BAlta.Enabled:=False;
          BBusqueda.Enabled:=False;
     end;
end;

//OK
//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TSalidas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    {
     if (Key=109) and BBorrar.Enabled then  //Baja
     begin
          Borrar(Self);
     end
     else if (Key=107) and BAlta.Enabled then                  //Alta
           begin
                Key:=0;
                Application.ProcessMessages;
                Alta(Self);
           end
           else
      }
      if (Key=VK_F5) and BAceptar.Enabled then        //F5 graba
             Aceptar(Self)
          else if (Key=VK_F6) and BBusqueda.Enabled then  //F6 busqueda experta
                  Busqueda(Self)
                else if (Key=40) and (not GridLineas.Focused) then                             //Flecha arriba
                        PostMessage(Handle,WM_NEXTDLGCTL,0,0)
                     else if (Key=38) and (not GridLineas.Focused) then                        //Flecha abajo
                             PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//OK
//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TSalidas.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13 then
     begin
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

//OK
//---------------------- DESPUES DE INSERTAR -----------------------------------
procedure TSalidas.QMaestroAfterInsert(DataSet: TDataSet);
Var
   Hour, Min, Sec, MSec: Word;
   Fecha: TDateTime;
begin
  bFreeEdit:= True;
  
     QMaestro.FieldByName('EMPRESA_CS').AsString:=cEmpresa.Text;
     QMaestro.FieldByName('ALBARAN_CS').AsString:=cAlbaran.Text;

     //Valores por defecto
     Fecha:=Now;
     cFechaAlbaran.Text:=DateToStr(Fecha);
     DecodeTime(Fecha, Hour, Min, Sec, MSec);
     cHora.Text:=RellenarCeros(IntToStr(Hour),2,'I') + RellenarCeros(IntToStr(Min),2,'I') + RellenarCeros(IntToStr(Sec),2,'I'); //No esta enganchado
     QMaestro.FieldByName('Tipo_Salida_cs').AsString:='N';
     QMaestro.FieldByName('Importe_Salida_cs').AsFloat:=0;
     QMaestro.FieldByName('Horas_Salida_cs').AsFloat:=0;
     QMaestro.FieldByName('temperatura_cs').AsInteger:=-18;
     QMaestro.FieldByName('notas_cs').AsString:='El cliente/Autorizado recibe conforme (bultos, estuches, unidades) y en perfectas condiciones de conservación, los articulos indicados en la presente salida. No admitiendose reclamación alguna una vez realizada la carga.';
end;

//OK
//---------------------- PONE EL COLOR DE FOCO DE LOS CAMPOS CLAVES ------------
procedure TSalidas.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          if not SwAlta then
             TEdit(Sender).Color:=clMoneyGreen;
     end
     else if Sender is TDBEdit then           //Si el componente es un TDBEdit
     begin
          if not SwAlta then
             TDBEdit(Sender).Color:=clMoneyGreen;
     end;
end;

//OK
//---------------------- QUITA EL COLOR DE FOCO DE LOS CAMPOS CLAVE ------------
procedure TSalidas.ColorExit(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          if not SwAlta then
            TEdit(Sender).Color:=clWindow;
          if Length(TEdit(Sender).Text)>0 then
             TEdit(Sender).Text:=RellenarCeros(TEdit(Sender).Text,TEdit(Sender).MaxLength,'I');
     end;
end;

//OK
//------ QUITA EL COLOR DE FOCO DE LOS CAMPOS CLAVE SIN RELLENAR SIN CEROS -----
procedure TSalidas.ColorExitSinCeros(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          if not SwAlta then
            TEdit(Sender).Color:=clWindow;
     end
     else if Sender is TDBEdit then           //Si el componente es un TDBEdit
     begin
          if not SwAlta then
            TDBEdit(Sender).Color:=clWindow;
     end;
end;

//OK
//---------------------- QUITA EL COLOR DE ALTA DE LOS CAMPOS CLAVE ------------
procedure TSalidas.QuitarColorAlta();
begin
     cEmpresa.Color:=clWindow;
     cAlbaran.Color:=clWindow;
end;

//OK
//---------------------- PONE EL COLOR DE ALTA DE LOS CAMPOS CLAVE -------------
procedure TSalidas.PonerColorAlta();
begin
     cEmpresa.Color:=clYellow;
     cAlbaran.Color:=clYellow;
end;

//OK
//----------------------- CAMBIO DE LA EMPRESA ---------------------------------
procedure TSalidas.cEmpresaChange(Sender: TObject);
begin
     tNomEmpresa.Caption:=NomEmpresa(RellenarCeros(cEmpresa.Text, cEmpresa.MaxLength, 'I'));
end;

//OK
//--------------------- AL CAMBIAR EL CLIENTE ----------------------------------
procedure TSalidas.cClienteChange(Sender: TObject);
Var
   Autorizado1, Autorizado2: String;
begin
     tNomCliente.Caption:=NomCliente(QMaestro.FieldByName('Empresa_cs').AsString,
                                     RellenarCeros(cCliente.Text,cCliente.Properties.MaxLength,'I'));
     //Si existe el cliente
     if tNomCliente.Caption<>'' then
     begin
          //Leemos el nombre de los autorizados
          NomAutorizadosCliente(Autorizado1, Autorizado2, QMaestro.FieldByName('Empresa_cs').AsString,RellenarCeros(cCliente.Text,cCliente.Properties.MaxLength,'I'));
          tAutorizado1.Caption:=Autorizado1;
          tAutorizado2.Caption:=Autorizado2;
     end
     else
     begin
          tAutorizado1.Caption:='';
          tAutorizado2.Caption:='';
     end;
end;

//OK
//-------------------------- ANTES DE GRABAR -----------------------------------
procedure TSalidas.QMaestroBeforePost(DataSet: TDataSet);
begin
     QMaestro.FieldByName('Cliente_cs').AsString:=RellenarCeros(cCliente.Text,cCliente.Properties.MaxLength,'I');
     QMaestro.FieldByName('Fecha_Albaran_cs').AsString:=AnyoMesDia(cFechaAlbaran.Text);
     QMaestro.FieldByName('Hora_cs').AsString:=Copy(cHora.Text,1,2) + ':' + Copy(cHora.Text,3,2) + ':' + Copy(cHora.Text,5,2);
     if cImporte.Text='' then
        QMaestro.FieldByName('Importe_Salida_cs').AsFloat:=0
     else
         QMaestro.FieldByName('Importe_Salida_cs').AsFloat:=Redondear(QMaestro.FieldByName('Importe_Salida_cs').AsFloat,2);
     if cHorasFacturar.Text='' then
        QMaestro.FieldByName('Horas_Salida_cs').AsFloat:=0
     else
         QMaestro.FieldByName('Horas_Salida_cs').AsFloat:=Redondear(QMaestro.FieldByName('Horas_Salida_cs').AsFloat,2);
     QMaestro.FieldByName('Fecha_Modif_cs').AsString:=AnyoMesDia(Date());

  //que no se puede modificar de la cabecera una vez facturado
  if not bFreeEdit then
  begin
    if ( sEmpresa <> QMaestro.FieldByName('empresa_cs').AsString ) or
       ( sAlbaran <> QMaestro.FieldByName('ALBARAN_Cs').AsString ) or
       ( sCliente <> QMaestro.FieldByName('cliente_cs').AsString ) then
       //( sFecha <> QMaestro.FieldByName('FECHA_ALBARAN_Cs').AsString ) then
    begin
      MessageDlg (Chr(13) + 'Albarán ya facturado, no se puede modificar ni la empresa, número albaran, cliente y fecha.', mtWarning,[mbOk],0);
      Abort;
    end;
  end;
end;

//OK
//------------------------- AL SALIR DE LA HORA LA COMPROBAMOS -----------------
procedure TSalidas.cHoraExit(Sender: TObject);
begin
     cHora.Color:=clWindow;

     if not ComprobarHora(cHora.Text) then
     begin
          MessageDlg (Chr(13) + 'La hora es incorrecta', mtError,[mbOk],0);
          cHora.SetFocus;
     end;
end;

//OK
//------------------ AL CAMBIAR LA HORA PONEMOS EN EDICION ---------------------
procedure TSalidas.cHoraChange(Sender: TObject);
begin
     if not (QMaestro.State in [dsEdit,dsInsert]) then
        QMaestro.Edit;
end;

//OK
//--------------------- ANTES DE MODIFICAR LA CABECERA -------------------------
procedure TSalidas.QMaestroBeforeEdit(DataSet: TDataSet);
begin
     PanelLineas.Enabled:=False;
     TipoSalidaAnt:=QMaestro.FieldByName('Tipo_salida_cs').AsString;
     ClienteAnt:=QMaestro.FieldByName('Cliente_cs').AsString;
     FechaAnt:=DiaMesAnyo(QMaestro.FieldByName('Fecha_Albaran_cs').AsString);
end;

//OK
//--------------------- DESPUES DE MODIFICAR LA CABECERA -----------------------
procedure TSalidas.QMaestroAfterEdit(DataSet: TDataSet);
begin
  bFreeEdit:= QMaestro.FieldByName('Fecha_Factura_cs').AsString='';
  if not bFreeEdit then
  begin
    //MessageDlg (Chr(13) + 'Albarán ya facturado, recuerde que no puede modificar ni la empresa, número albaran, cliente y fecha.', mtWarning,[mbOk],0);
    sEmpresa:= QMaestro.FieldByName('empresa_cs').AsString;
    sAlbaran:= QMaestro.FieldByName('ALBARAN_Cs').AsString;
    sCliente:= QMaestro.FieldByName('cliente_cs').AsString;
    //sFecha:= QMaestro.FieldByName('FECHA_ALBARAN_Cs').AsString;
  end;
  (*
     if QMaestro.FieldByName('Fecha_Factura_cs').AsString<>'' then
     begin
          MessageDlg (Chr(13) + 'No puede modificar un albarán ya facturado', mtError,[mbOk],0);
          QMaestro.Cancel;
          PanelLineas.Enabled:=True;
          BotonesPosicion();
     end;
  *)
end;

//OK
//------------------------ PRIMERA LINEA ---------------------------------------
procedure TSalidas.BPrimeroLClick(Sender: TObject);
begin
     QLineas.First;
end;

//OK
//------------------------- ANTERIOR LINEA -------------------------------------
procedure TSalidas.BAnteriorLClick(Sender: TObject);
begin
     QLineas.Prior;
end;

//OK
//------------------------- SIGUIENTE LINEA ------------------------------------
procedure TSalidas.BSiguienteLClick(Sender: TObject);
begin
     QLineas.Next;
end;

//OK
//------------------------- ULTIMA LINEA ---------------------------------------
procedure TSalidas.BUltimoLClick(Sender: TObject);
begin
     QLineas.Last;
end;

//OK
//------------------------- AL SALIR DE LA EMPRESA -----------------------------
procedure TSalidas.cEmpresaExit(Sender: TObject);
begin
     if Length(cEmpresa.Text)>0 then
        cEmpresa.Text:=RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I');
     if not SwAlta then
        cEmpresa.Color:=clWindow
     else
     begin
          if Length(cEmpresa.Text)>0 then
          begin
               AlbaranToca:=LeerNumeroAlbaran(cEmpresa.Text);
               cAlbaran.Text:=IntToStr(AlbaranToca);
               if cAlbaran.Text='0' then
                  cEmpresa.SetFocus;
          end;
     end;
end;

//OK
//-------------------------- AL ENTRAR EN LA HORA ------------------------------
procedure TSalidas.cHoraEnter(Sender: TObject);
begin
     cHora.Color:=clMoneyGreen;
end;

//OK
//------------ LEEMOS EL NUMERADOR DE ALBARANES Y LO INCREMENTAMOS -------------
function TSalidas.LeerNumeroAlbaran(Empresa: String):Integer;
Var
   QAux: TQuery;
begin
     try
        QAux:=TQuery.Create(nil);
        try
           QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

           //Leemos el Numerador de Albaranes
           QAux.SQL.Add(' SELECT NUM_SALIDAS_E ' +
                        ' FROM EMPRESAS ' +
                        ' WHERE CODIGO_E=' + QuotedStr(Empresa));
           if not DMBaseDatos.BDFrigo.InTransaction then
              DMBaseDatos.BDFrigo.StartTransaction;
           QAux.Open;
           Result:=QAux.FieldByName('NUM_SALIDAS_E').AsInteger;

           if not QAux.IsEmpty then
           begin
                //Modifico el Valor del Numerador de Albaranes
                 QAux.Close;
                 QAux.SQL.Clear;
                 QAux.SQL.Add(' UPDATE EMPRESAS ' +
                              ' SET NUM_SALIDAS_E=NUM_SALIDAS_E + 1 ' +
                              ' WHERE CODIGO_E=' + QuotedStr(Empresa));
                 QAux.ExecSql;
           end;
           if DMBaseDatos.BDFrigo.InTransaction then
              DMBaseDatos.BDFrigo.Commit;
        finally
               QAux.Close;
               FreeAndNil(QAux);
        end;
     except
           on E:Exception do
                begin
                     CapturaErrores(E);
                     if DMBaseDatos.BDFrigo.InTransaction then
                        DMBaseDatos.BDFrigo.Rollback;
                     MessageDlg (Chr(13) + 'Error al leer el contador de albaranes', mtError,[mbOk],0);
                     Result:=0;
                end;
     end;
end;

//OK
//----------------------------- AL SALIR DEL CLIENTE ---------------------------
procedure TSalidas.cClienteExit(Sender: TObject);
begin
     if QMaestro.State in dsEditModes then
     begin
          if QMaestro.FieldByName('Cliente_cs').AsString<>'' then
             QMaestro.FieldByName('Cliente_cs').AsString:=RellenarCeros(cCliente.Text,cCliente.Properties.MaxLength,'I');
          ComprobarCliente();
     end;
end;

//OK
//--------------------- AL CAMBIAR LA FAMILIA ----------------------------------
procedure TSalidas.cFamiliaChange(Sender: TObject);
begin
     tNomFamilia.Caption:=NomFamilia(cEmpresa.Text,
                                     RellenarCeros(cFamilia.Text,cFamilia.Properties.MaxLength,'I'));
     tNomArticulo.Caption:=NomArticulo(cEmpresa.Text,
                                       RellenarCeros(cFamilia.Text,cFamilia.Properties.MaxLength,'I'),
                                       RellenarCeros(cArticulo.Text,cArticulo.Properties.MaxLength,'I'));
end;

//OK
//--------------------- AL CAMBIAR EL ARTICULO ---------------------------------
procedure TSalidas.cArticuloChange(Sender: TObject);
Var
   Familia: String;
begin
     tNomArticulo.Caption:=NomArticuloUnidadFamilia(cEmpresa.Text, RellenarCeros(cArticulo.Text,cArticulo.Properties.MaxLength,'I'), Familia);
     if tNomArticulo.Caption<>'' then
        cFamilia.Text:=Familia;
end;

//OK
//--------------------- ANTES DE CERRAR LA TABLA DE CABECERAS ------------------
procedure TSalidas.QMaestroBeforeClose(DataSet: TDataSet);
begin
     QLineas.Close;
end;

//---------------------- BORRAR LINEA ------------------------------------------
procedure TSalidas.BBorrarLinea(Sender: TObject);
begin
     if not QLineas.IsEmpty then  //Existen líneas
     begin
        {CARMEN!!
          //Un albaran facturado no puede modificarse
          if QMaestro.FieldByName('Fecha_Factura_cs').AsString<>'' then
             MessageDlg (Chr(13) + 'No puede modificar un albarán ya facturado', mtError,[mbOk],0)
          else
          begin
       }
               try
                  //Borramos la linea
                  if MessageBox(Handle, PChar('Va a borrarse la linea ¿Está seguro?'),
                                PChar(Self.Caption),
                                MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1)=IDYES then
                  begin
                       if not QLineas.Database.InTransaction then
                          QLineas.Database.StartTransaction;
                       //Actualizamos el valor del stock y el de mercancia retenida del cliente
                       ActualizarCliente('DELETE',
                                         QMaestro.FieldByName('Empresa_cs').AsString,
                                         QLineas.FieldByName('Familia_ls').AsString,
                                         QLineas.FieldByName('Articulo_ls').AsString,
                                         QMaestro.FieldByName('Cliente_cs').AsString,
                                         QLineas.FieldByName('Unidades_ls').AsFloat);
                       ActualizarAlmacen('DELETE',
                                         QMaestro.FieldByName('Empresa_cs').AsString,
                                         QMaestro.FieldByName('Cliente_cs').AsString,
                                         QLineas.FieldByName('Lote_ls').AsString,
                                         QMaestro.FieldByName('Fecha_Albaran_cs').AsString,
                                         QMaestro.FieldByName('Tipo_Salida_cs').AsString,
                                         QLineas.FieldByName('Bultos_ls').AsInteger,
                                         QLineas.FieldByName('Estuches_Sueltos_ls').AsInteger,
                                         QLineas.FieldByName('Palets_ls').AsInteger,
                                         QLineas.FieldByName('Unidades_ls').AsFloat
                                        );
                       QLineas.Delete;
                       if QLineas.Database.InTransaction then
                          QLineas.Database.Commit;

                       if QLineas.IsEmpty then  //No existen lineas
                       begin
                            //Si el albaran no tiene lineas preguntamos si lo borramos
                            if QLineas.IsEmpty then
                            begin
                                 if MessageBox(Handle, PChar('Albarán sin líneas.' + chr(13) + '¿Desea eliminarlo?'),
                                               PChar(Self.Caption),
                                               MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1)=IDYES then
                                    EliminarAlbaran();
                            end;
                       end;
                  end;
               except
                     on E:Exception do
                          begin
                               CapturaErrores(E);
                               QLineas.Cancel;
                               QMaestro.Cancel;
                               if DMBaseDatos.BDFrigo.InTransaction then
                                  DMBaseDatos.BDFrigo.Rollback;
                          end;
               end;
        //  end;
     end;
end;

//OK
//--------------------- BOTON ALTA DE LINEA ------------------------------------
procedure TSalidas.BAltaLinea(Sender: TObject);
begin
     if not (QMaestro.State in [dsEdit,dsInsert]) then   //Cabecera
     begin
          cFamilia.Style.Color:=clWindow;
          cArticulo.Style.Color:=clWindow;
          cCamara.Color:=clWindow;
          cZona.Color:=clWindow;
          cBultos.Color:=clWindow;
          cPalets.Color:=clWindow;
          cEstuches.Color:=clWindow;
          cUnidades.Style.Color:=clWindow;

          {CARMEN!!
          if QMaestro.FieldByName('Fecha_Factura_cs').AsString<>'' then
             MessageDlg (Chr(13) + 'No puede modificar un albarán ya facturado', mtError,[mbOk],0)
          else
}
          begin
               NLinea:=NLineasAlbaran(cEmpresa.Text, StrToInt(cAlbaran.Text)) + 1;

               PanelInsertarLinea.Visible:=True;

               //---- Campos que no se pueden modificar ----
               cLote.Style.Font.Color:=clBlack;
               cLoteOrigen.Style.Font.Color:=clBlack;
               cFamilia.Style.Font.Color:=clBlack;
               cArticulo.Style.Font.Color:=clBlack;
               cCamara.Font.Color:=clBlack;
               cZona.Font.Color:=clBlack;

               cLote.Properties.ReadOnly:=False;
               cLoteOrigen.Properties.ReadOnly:=False;
               cFamilia.Properties.ReadOnly:=False;
               cArticulo.Properties.ReadOnly:=False;
               cCamara.ReadOnly:=False;
               cZona.ReadOnly:=False;

               cLote.TabStop:=True;
               cLoteOrigen.TabStop:=True;
               cFamilia.TabStop:=True;
               cArticulo.TabStop:=True;
               cCamara.TabStop:=True;
               cZona.TabStop:=True;

               cLote.OnKeyDown:=cLoteKeyDown;
               LupaLote.OnClick:=LupaLoteClick;
               LupaFamilia.OnClick:=cLupaFamiliasClick;
               LupaArticulo.OnClick:=cLupaArticulosClick;
               LupaCamara.OnClick:=LupaCamaraClick;
               LupaZona.OnClick:=LupaZonaClick;
               LupaLote.Enabled:=True;
               LupaFamilia.Enabled:=True;
               LupaArticulo.Enabled:=True;
               LupaCamara.Enabled:=True;
               LupaZona.Enabled:=True;
               //---- Campos que no se pueden modificar ----

               cLote.SetFocus;

               QLineas.Insert;

               //------------------------ DATOS DE LA LINEA POR DEFECTO -------------

               QLineas.FieldByName('Empresa_ls').AsString:=QMaestro.FieldByName('Empresa_cs').AsString;
               QLineas.FieldByName('Albaran_ls').AsString:=QMaestro.FieldByName('Albaran_cs').AsString;
               //Valores por defecto
               QLineas.FieldByName('Bultos_ls').AsInteger:=0;
               QLineas.FieldByName('Estuches_sueltos_ls').AsInteger:=0;
               QLineas.FieldByName('Unidades_ls').AsInteger:=0;
               QLineas.FieldByName('Palets_ls').AsInteger:=0;
               QLineas.FieldByName('Tipo_lote_ls').AsString:=QMaestro.FieldByName('Tipo_Salida_cs').AsString;
               QLineas.FieldByName('NLinea_ls').AsInteger:=Nlinea;
               Inc(Nlinea);
               //------------------------ DATOS DE LA LINEA POR DEFECTO -------------

               cCamara.Text:='';
               cZona.Text:='';

               PanelClaves.Enabled:=False;
               PanelCabecera.Enabled:=False;
               PanelLineas.Enabled:=False;

               BotonesPosicion();
          end;
     end;
end;

//OK
//----------------------------- AL SALIR DE LA FECHA ---------------------------
procedure TSalidas.cFechaExit(Sender: TObject);
begin
     cFechaAlbaran.Style.Color:=clWindow;

     if QMaestro.State in dsEditModes then
     begin
          if not EsFecha(cFechaAlbaran.Text) then
          begin
               cFechaAlbaran.SetFocus;
               MessageDlg (Chr(13) + 'La fecha es incorrecta', mtError,[mbOk],0);
          end;
     end;
end;

//OK
//--- PARA EVITAR QUE SE ESCRIBAN NUMEROS NEGATIVOS YA QUE SE CONFUNDA CON LOS BOTONES DE BORRAR Y AÑADIR ---
procedure TSalidas.SinSignos(Sender: TObject; var Key: Char);
begin
     if (Key='-') or (Key='+') then Key:=#0;
end;

//OK
//-------------------------- VALIDACION DE LOS DATOS DE LA LINEA ---------------
function TSalidas.ValidarLinea():Boolean;
begin
     Result:=True;
     //LOTE
     if (cLote.Text='') then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'El código del lote es obligatorio', mtError,[mbOk],0);
          cLote.SetFocus;
          Exit;
     end;
     //Comprobamos que el lote no se repita si estamos insertando
     if QLineas.State=dsInsert then
     begin
          if not ComprobarLoteRepetido(cEmpresa.Text, cLote.Text, StrToInt(cAlbaran.Text)) then
          begin
               Result:=False;
               MessageDlg (Chr(13) + 'El código del lote ya existe en otra línea', mtError,[mbOk],0);
               cLote.SetFocus;
               Exit;
          end;
     end;
     // Comprobar que el exite lote-lote_origen
     if cLoteOrigen.Text  <> '' then
     begin
        if not ComprobarLote(cEmpresa.Text,
                cCliente.Text,
                cLote.Text,
                '',
                '',
                '',
                '',
                cLoteOrigen.Text) then
        begin
          Result:=False;
          MessageDlg (Chr(13) + 'El Lote Origen no pertenece al Lote', mtError,[mbOk],0);
          cLoteOrigen.SetFocus;
          Exit;
        end;
     end;
     //FAMILIA
     if (cFamilia.Text='') then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'El código de la familia es obligatorio', mtError,[mbOk],0);
          cFamilia.SetFocus;
          Exit;
     end;
     //NOMBRE FAMILIA
     if tNomFamilia.Caption='' then
     begin
          Result:=False;
          cFamilia.SetFocus;
          MessageDlg (Chr(13) + 'La familia no existe', mtError,[mbOk],0);
          Exit;
     end;
     //PERTENECE LA FAMILIA AL LOTE
     if not ComprobarLote(cEmpresa.Text,
                          cCliente.Text,
                          cLote.Text,
                          RellenarCeros(cFamilia.Text,cFamilia.Properties.MaxLength,'I'),
                          '',
                          '',
                          '') then
     begin
          Result:=False;
          cFamilia.OnExit:=Nil;
          cLote.SetFocus;
          cFamilia.OnExit:=cFamiliaExit;
          MessageDlg (Chr(13) + 'La familia no pertenece al lote', mtError,[mbOk],0);
          Exit;
     end;
     //ARTICULO
     if (cArticulo.Text='') then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'El código del artículo es obligatorio', mtError,[mbOk],0);
          cArticulo.SetFocus;
          Exit;
     end;
     //NOMBRE ARTICULO
     if tNomArticulo.Caption='' then
     begin
          Result:=False;
          cArticulo.SetFocus;
          MessageDlg (Chr(13) + 'El artículo no existe', mtError,[mbOk],0);
          Exit;
     end;
     //PERTENECE EL ARTICULO AL LOTE
     if not ComprobarLote(cEmpresa.Text,
                          cCliente.Text,
                          cLote.Text,
                          '',
                          RellenarCeros(cArticulo.Text,cArticulo.Properties.MaxLength,'I'),
                          '',
                          '') then
     begin
          Result:=False;
          cArticulo.OnExit:=Nil;
          cLote.SetFocus;
          cArticulo.OnExit:=cArticuloExit;
          MessageDlg (Chr(13) + 'El artículo no pertenece al lote', mtError,[mbOk],0);
          Exit;
     end;
     //CAMARA
     if (cCamara.Text='') then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'La cámara es obligatoria', mtError,[mbOk],0);
          cCamara.SetFocus;
          Exit;
     end;
     //PERTENECE LA CAMARA AL LOTE
     if not ComprobarLote(cEmpresa.Text,
                          cCliente.Text,
                          cLote.Text,
                          '',
                          '',
                          cCamara.Text,
                          '') then
     begin
          Result:=False;
          cCamara.OnExit:=Nil;
          cLote.SetFocus;
          cCamara.OnExit:=cCamaraExit;
          MessageDlg (Chr(13) + 'La cámara no pertenece al lote', mtError,[mbOk],0);
          Exit;
     end;
     //ZONA
     if (cZona.Text='') then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'La zona es obligatoria', mtError,[mbOk],0);
          cZona.SetFocus;
          Exit;
     end;
     //PERTENECE LA ZONA AL LOTE
     if not ComprobarLote(cEmpresa.Text,
                          cCliente.Text,
                          cLote.Text,
                          '',
                          '',
                          '',
                          cZona.Text) then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'La zona no pertenece al lote', mtError,[mbOk],0);
          cZona.OnExit:=Nil;
          cLote.SetFocus;
          cZona.OnExit:=cZonaExit;
          Exit;
     end;
     //PALETS
     if not ComprobarPalets() then
     begin
          Result:=False;
          cPalets.SetFocus;
          Exit;
     end;
     //ESTUCHES
     if not ComprobarEstuches() then
     begin
          Result:=False;
          cEstuches.SetFocus;
          Exit;
     end;
     //UNIDADES
     if not ComprobarUnidades() then
     begin
          Result:=False;
          cUnidades.SetFocus;
          Exit;
     end;
     //BULTOS
     if not ComprobarBultos() then
     begin
          Result:=False;
          cBultos.SetFocus;
          Exit;
     end;
end;

//OK
//------------------------ COMPROBAR BULTOS ------------------------------------
function TSalidas.ComprobarBultos():Boolean;
Var
   StockEstuchesSueltos, NBultos: Integer;
begin
     Result:=True;
     if (not EsNumerico(cBultos.Text)) or (StrToInt(cBultos.Text)<0)  then
     begin
          MessageDlg (Chr(13) + 'El nº de bultos debe ser mayor o igual que cero', mtError,[mbOk],0);
          Result:=False;
     end
     else if StrToInt(cBultos.Text)>QAlmacenes.FieldByName('Bultos_Entrados_al').AsInteger then
     begin
          MessageDlg (Chr(13) + 'Sobrepasado el nº de bultos entrados, que es de ' +
                      IntToStr(QAlmacenes.FieldByName('Bultos_Entrados_al').AsInteger), mtError,[mbOk],0);
          Result:=False;
     end
     else
     begin
          if QAlmacenes.FieldByName('Estuches_Bulto_Al').AsInteger <> 0 then
          begin
               StockEstuchesSueltos:=QAlmacenes.FieldByName('Estuches_Sueltos_al').AsInteger + LEstuchesSueltosAnt - StrToInt(cEstuches.Text);
               //Division entera (TotalEstuches dividido EstuchesBulto)
               NBultos:=StockEstuchesSueltos div QAlmacenes.FieldByName('Estuches_Bulto_Al').AsInteger;
          end;
          if (QAlmacenes.FieldByName('Bultos_Entrados_al').AsInteger-QAlmacenes.FieldByName('Bultos_Salidos_al').AsInteger + NBultos + LBultosAnt - StrToInt(cBultos.Text))<0 then
          begin
               MessageDlg (Chr(13) + 'Sobrepasado el stock de bultos' , mtError,[mbOk],0);
               Result:=False;
          end;
     end;
end;

//OK
//------------------------ COMPROBAR ESTUCHES ----------------------------------
function TSalidas.ComprobarEstuches():Boolean;
Var
   EstuchesTotalesAnt, EstuchesTotalesNew : Integer;
begin
     Result:=True;
     // ESTUCHES_SUELTOS DEBE SER POSITIVO
     if (not EsNumerico(cEstuches.Text)) or (StrToInt(cEstuches.Text)<0)  then
     begin
          MessageDlg (Chr(13) + 'El nº de estuches debe ser mayor o igual que cero', mtError,[mbOk],0);
          Result:=False;
     end   //ESTUCHES_BULTO!=0 Y BULTOS SOBREPASA EL STOCK
     else if QAlmacenes.FieldByName('Estuches_Bulto_al').AsInteger<>0 then
     begin
          //ESTUCHES_SUELTOS >= ESTUCHES_BULTO
          if StrToInt(cEstuches.Text)>=QAlmacenes.FieldByName('Estuches_Bulto_al').AsInteger then
          begin
               MessageDlg (Chr(13) + 'El nº de estuches sueltos debe ser menor que el nº de estuches por bulto: ' + IntToStr(QAlmacenes.FieldByName('Estuches_Bulto_al').AsInteger), mtError,[mbOk],0);
               Result:=False;
          end
          else
          begin
               //Estuches totales de la linea anterior (Si es una modificacion tendra valor)
               EstuchesTotalesAnt:=((LBultosAnt * QAlmacenes.FieldByName('Estuches_Bulto_al').AsInteger) + LEstuchesSueltosAnt);
               //Estuches totales de la linea nueva
               EstuchesTotalesNew:=(QAlmacenes.FieldByName('Estuches_Bulto_al').AsInteger * StrToInt(cBultos.Text)) + StrToInt(cEstuches.Text);

               //Los estuches que quedan en el almacen + los estuches de la linea anterior tienen que ser >= que los estuches totales de la nueva linea
               if (QAlmacenes.FieldByName('Estuches_Totales_al').AsInteger + EstuchesTotalesAnt) < EstuchesTotalesNew then
               begin
                    MessageDlg (Chr(13) + 'Sobrepasado el stock de estuches que es de ' +
                                IntToStr(QAlmacenes.FieldByName('Estuches_Totales_al').AsInteger + EstuchesTotalesAnt) + ' con ' +  IntToStr(QAlmacenes.FieldByName('Estuches_Bulto_al').AsInteger) +
                                ' estuches por bulto', mtError,[mbOk],0);
                    Result:=False;
               end;
          end;
     end    // ESTUCHES_BULTO=0 Y ESTUCHES_SUELTOS!=0
     else
     begin
          if StrToInt(cEstuches.Text)<>0 then
          begin
               MessageDlg (Chr(13) + 'El número de estuches por bulto para este lote es 0, luego el número' +
                           ' de estuches sueltos debe ser también 0', mtError,[mbOk],0);
               Result:=False;
          end;
     end;
end;

//OK
//------------------------ COMPROBAR PALETS ------------------------------------
function TSalidas.ComprobarPalets():Boolean;
begin
     Result:=True;
     if (not EsNumerico(cPalets.Text)) or (StrToInt(cPalets.Text)<0) then
     begin
          MessageDlg (Chr(13) + 'El nº de palets debe ser mayor o igual que cero', mtError,[mbOk],0);
          Result:=False;
     end;
     {
     else if (QAlmacenes.FieldByName('Palets_Entrados_al').AsInteger-QAlmacenes.FieldByName('Palets_Salidos_al').AsInteger) + LPaletsAnt- StrToInt(cPalets.Text)<0 then
     begin
          MessageDlg (Chr(13) + 'Sobrepasado el stock de palets, que es de ' +
                      IntToStr(QAlmacenes.FieldByName('Palets_Entrados_al').AsInteger-QAlmacenes.FieldByName('Palets_Salidos_al').AsInteger + LPaletsAnt), mtError,[mbOk],0);
          Result:=False;
     end;
     }
end;

//OK
//------------------------ COMPROBAR UNIDADES ----------------------------------
function TSalidas.ComprobarUnidades():Boolean;
begin
     Result:=True;
     if (not EsDecimal(cUnidades.Text)) or (StrToFloat(StringReplace(cUnidades.Text, '.', '',[rfReplaceAll]))<0) then
     begin
          MessageDlg (Chr(13) + 'Las unidades deben ser positivas', mtError,[mbOk],0);
          Result:=False;
     end
     else if (StrToFloat(StringReplace(cUnidades.Text, '.', '',[rfReplaceAll]))=0) and (QMaestro.FieldByName('Tipo_salida_cs').asString='N') then
     begin
          MessageDlg (Chr(13) + 'El número de unidades debe ser mayor que cero para salidas normales', mtError,[mbOk],0);
          Result:=False;
     end
     else if (Redondear(QAlmacenes.FieldByName('Unidades_Entradas_al').AsFloat - QAlmacenes.FieldByName('Unidades_Salidas_al').AsFloat + LUnidadesAnt - StrToFloat(StringReplace(cUnidades.Text, '.', '',[rfReplaceAll])),2)<0) then
     begin
          MessageDlg (Chr(13) + 'Sobrepasado el stock de Unidades, que es de ' +
                      FloatToStr(QAlmacenes.FieldByName('Unidades_Entradas_al').AsFloat - QAlmacenes.FieldByName('Unidades_Salidas_al').AsFloat + LUnidadesAnt), mtError,[mbOk],0);
          Result:=False;
     end;
end;

//OK
//------------------------- AL SALIR DE LA FAMILIA -----------------------------
procedure TSalidas.cFamiliaExit(Sender: TObject);
begin
     if QLineas.State in dsEditModes then
        if cFamilia.Text<>'' then
        begin
             QLineas.FieldByName('Familia_ls').AsString:=RellenarCeros(cFamilia.Text,cFamilia.Properties.MaxLength,'I');
             if tNomArticulo.Caption='' then
                QLineas.FieldByName('Articulo_ls').AsString:='';

             if cLote.Text<>'' then
             begin
                  if not ComprobarLote(QMaestro.FieldByName('Empresa_cs').AsString,
                                       QMaestro.FieldByName('Cliente_cs').AsString,
                                       cLote.Text,
                                       cFamilia.Text,
                                       '','','') then
                  begin
                       MessageDlg (Chr(13) + 'La familia no pertenece al lote', mtError,[mbOk],0);
                       cLote.SetFocus;
                  end;
             end;
        end
        else
            QLineas.FieldByName('Articulo_ls').AsString:='';
end;

//OK
//------------------------- AL SALIR DEL ARTICULO ------------------------------
procedure TSalidas.cArticuloExit(Sender: TObject);
Var
   Familia: String;
begin
     if QLineas.State in dsEditModes then
     begin
          if cArticulo.Text<>'' then
             QLineas.FieldByName('Articulo_ls').AsString:=RellenarCeros(cArticulo.Text,cArticulo.Properties.MaxLength,'I');

          if (cLote.Text='') then
          begin
               if (cFamilia.Text<>'') then
               begin
                    if cArticulo.Text<>'' then
                    begin
                         if not LupaLotes(QMaestro.FieldByName('Empresa_cs').AsString,
                                          QMaestro.FieldByName('Cliente_cs').AsString,
                                          cFamilia.Text,
                                          cArticulo.Text,'','') then
                         begin
                              cLote.OnExit:=Nil;
                              cLote.SetFocus;
                              cLote.OnExit:=cLoteExit;
                         end;
                    end;
               end
               else
               begin
                    if cArticulo.Text<>'' then
                    begin
                         Familia:=LeerFamilia(QMaestro.FieldByName('Empresa_cs').AsString,cArticulo.Text);
                         if not LupaLotes(QMaestro.FieldByName('Empresa_cs').AsString,
                                          QMaestro.FieldByName('Cliente_cs').AsString,
                                          Familia,
                                          cArticulo.Text,'','') then
                         begin
                              cLote.OnExit:=Nil;
                              cLote.SetFocus;
                              cLote.OnExit:=cLoteExit;
                         end;
                    end;
               end;
          end;
     end;
end;

//OK
//-- ACTUALIZA EL VALOR DEL STOCK Y EL DE MERCANCIA RETENIDA DEL CLIENTE -------
procedure TSalidas.ActualizarCliente(EditAddDelete, Empresa, Familia, Articulo, Cliente: String; Unidades: Real);
Var
   ValorPorKg: Real;
   QAux: TQuery;
begin
     QAux:=TQuery.Create(nil);
     try
        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

        //Leemos el precio del articulo
        QAux.SQL.Add(' SELECT VALOR_POR_KG_A' +
                     ' FROM ARTICULOS' +
                     ' WHERE EMPRESA_A=' + QuotedStr(Empresa) +
                     ' AND FAMILIA_A=' + QuotedStr(Familia) +
                     ' AND CODIGO_A=' + QuotedStr(Articulo));
        QAux.Open;
        ValorPorKg:=QAux.FieldByName('VALOR_POR_KG_A').AsFloat;
        QAux.Close;

        //Modificamos el valor del stock del cliente
        QAux.SQL.Clear;
        QAux.SQL.Add(' UPDATE CLIENTES' +
                     ' SET VALOR_STOCK_C=VALOR_STOCK_C + :Importe ' +
                     ' WHERE EMPRESA_C=' + QuotedStr(Empresa) +
                     ' AND CODIGO_C=' + QuotedStr(Cliente));
        if EditAddDelete='ADD' then   //Insertar
           QAux.ParamByName('Importe').AsFloat:= -(Unidades * ValorPorKg)
        else if EditAddDelete='EDIT' then  //Modificar
                QAux.ParamByName('Importe').AsFloat:=(LUnidadesAnt - Unidades) * ValorPorKg
             else  //Borrar
                 QAux.ParamByName('Importe').AsFloat:=Unidades * ValorPorKg;
        QAux.ExecSQL;

        MercanciaRetenidaCliente(Empresa, Cliente);
     finally
            QAux.Close;
            FreeAndNil(QAux);
     end;
end;

//-- ACTUALIZA EL VALOR DE MERCANCIA RETENIDA DEL CLIENTE ----------------------
procedure TSalidas.MercanciaRetenidaCliente(Empresa, Cliente: String);
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

//OK
//---------------------- AL SALIR DEL LOTE -------------------------------------
procedure TSalidas.cLoteExit(Sender: TObject);
begin
     if QLineas.State=dsInsert then    //Insertar
     begin
          if (cLote.Text<>'') then
             PonerLote(cLote.Text)
          else
          begin
               cCamara.Text:='';
               cZona.Text:='';
               // vesteve - tTipoLote.Caption:='';
               QLineas.FieldByName('Familia_ls').AsString:='';
               QLineas.FieldByName('Articulo_ls').AsString:='';
               MensajeFijo('');
          end;
     end;
end;

//OK
//---------------------- COMPROBAMOS EL LOTE Y COLOCAMOS SUS DATOS -------------
procedure TSalidas.PonerLote(Lote: String);
Var
   BultosStock, PaletsStock: Integer;
   UnidadesStock: Real;
begin
     //Localizamos el almacen
     QAlmacenes.Close;
     QAlmacenes.ParamByName('Empresa').AsString:=QMaestro.FieldByName('Empresa_cs').AsString;
     QAlmacenes.ParamByName('Cliente').AsString:=QMaestro.FieldByName('Cliente_cs').AsString;
     QAlmacenes.ParamByName('Lote').AsString:=Lote;
     QAlmacenes.Open;

     //Comprobarmos si existe el lote
     if QAlmacenes.IsEmpty then
     begin
          MessageDlg(Chr(13) + 'Lote no existente o sin stock para este Cliente', mtError,[mbOk],0);
          QAlmacenes.Close;
          cLote.SetFocus;
          Exit;
     end;
     //Comprobamos si el lote es de importacion pendiente de autorizar
     if QAlmacenes.FieldByName('Tipo_Lote_al').AsString='I' then
     begin
          MessageDlg (Chr(13) + 'Salida no válida: Lote de importación pendiente de autorización', mtError,[mbOk],0);
          QAlmacenes.Close;
          cLote.SetFocus;
          Exit;
     end;
     //Comprobamos si el lote esta retenido
     if QAlmacenes.FieldByName('Status_Retenido_al').AsString='S' then
     begin
          MessageDlg (Chr(13) + 'Lote retenido, no puede realizar salidas' + Chr(13) + Chr(13) + 'OBSERVACIONES: ' + QAlmacenes.FieldByName('observaciones_retenido_al').AsString, mtError,[mbOk],0);
          QAlmacenes.Close;
          cLote.SetFocus;
          Exit;
     end;
{
     //Si es la camara 12 el numero de lineas en la misma zona no puede ser > que 15
     if QAlmacenes.FieldByName('Numero_Camara_al').AsInteger=12 then
     begin
          if NumLineasZona(QMaestro.FieldByName('Empresa_cs').AsString,
                           QMaestro.FieldByName('Albaran_cs').AsString,
                           QMaestro.FieldByName('Cliente_cs').AsString,
                           QAlmacenes.FieldByName('Zona_al').AsString,
                           QAlmacenes.FieldByName('Numero_Camara_al').AsInteger)>15  then
          begin
               MessageDlg (Chr(13) + 'Imposible realizar más de 15 líneas de salida con la misma zona', mtError,[mbOk],0);
               QAlmacenes.Close;
               cLote.SetFocus;
               Exit;
          end;
     end;
}
     BultosStock:=QAlmacenes.FieldByName('Bultos_Entrados_al').AsInteger - QAlmacenes.FieldByName('Bultos_Salidos_al').AsInteger;
     PaletsStock:=QAlmacenes.FieldByName('Palets_Entrados_al').AsInteger - QAlmacenes.FieldByName('Palets_Salidos_al').AsInteger;
     UnidadesStock:=QAlmacenes.FieldByName('Unidades_Entradas_al').AsFloat -
                    QAlmacenes.FieldByName('Unidades_Salidas_al').AsFloat -
                    QAlmacenes.FieldByName('Unidades_Mermas_al').AsFloat -
                    QAlmacenes.FieldByName('Unidades_Destruidas_al').AsFloat;
     if (BultosStock<=0) and (UnidadesStock<=0) and (QAlmacenes.FieldByName('Estuches_Sueltos_al').AsInteger<=0) then
     begin
          MessageDlg (Chr(13) + 'Lote sin stock para este cliente', mtError,[mbOk],0);
          QAlmacenes.Close;
          cLote.SetFocus;
          Exit;
     end;
     if QLineas.State<>dsEdit then //Si no estamos en edicion
        Qlineas.Edit;

     //Mostramos el Stock de Estuches, Bultos y Unidades
     if QAlmacenes.FieldByName('Estuches_Bulto_al').AsInteger=0 then
        MensajeFijo('STOCK: ' + IntToStr(BultosStock) +  ' BULTOS      ' +
                    IntToStr(PaletsStock) + ' PALETS      ' +
                    FormatFloat(',0.00',UnidadesStock) + ' UNIDADES')
     else
         MensajeFijo('STOCK:      ' +
                     IntToStr(QAlmacenes.FieldByName('Estuches_sueltos_al').AsInteger) +
                     ' ESTUCHES SUELTOS      ' +
                     IntToStr(QAlmacenes.FieldByName('estuches_bulto_al').AsInteger) +
                     ' ESTUCHES/BULTO      ' +
                     IntToStr(QAlmacenes.FieldByName('estuches_totales_al').AsInteger) +
                     ' ESTUCHES TOTALES      ' +
                     IntToStr(BultosStock) +
                      ' BULTOS      ' +
                     IntToStr(PaletsStock) +
                     ' PALETS      ' +
                     FormatFloat(',0.00',UnidadesStock) + ' UNIDADES');

     //Damos valor a los campos que leemos del almacen
     QLineas.FieldByName('Lote_ls').AsString:=Lote;
     // vesteve - tTipoLote.Caption:=NomTipoLote(QAlmacenes.FieldByName('Tipo_Lote_al').AsString);
     QLineas.FieldByName('Tipo_lote_ls').AsString:=QAlmacenes.FieldByName('Tipo_Lote_al').AsString;
     QLineas.FieldByName('Familia_ls').AsString:=QAlmacenes.FieldByName('Familia_al').AsString;
     QLineas.FieldByName('Articulo_ls').AsString:=QAlmacenes.FieldByName('Articulo_al').AsString;
     cZona.Text:=QAlmacenes.FieldByName('Zona_al').AsString;
     cCamara.Text:=IntToStr(QAlmacenes.FieldByName('Numero_Camara_al').AsInteger);
     QLineas.FieldByName('lote_origen_ls').AsString := QAlmacenes.FieldByName('lote_origen_al').asString;

     cLoteOrigen.EditModified := False;
     //Ponemos el foco en los bultos deshabilitando antes la salida del lote
     cLote.OnExit:=Nil;
     cBultos.SetFocus;
     cLote.OnExit:=cLoteExit;
end;

//OK
//--------------------- DEVUELVE EL NUMERO DE LINEAS DE UNA CAMARA/ZONA --------
function TSalidas.NumLineasZona(Empresa, Albaran, Cliente, Zona: String; Camara: Integer):Integer;
Var
   QAux: TQuery;
begin
     QAux:=TQuery.Create(nil);
     try
        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

        QAux.SQL.Clear;
        QAux.SQL.Add(' SELECT COUNT(*) AS NUM_LINEAS ' +
                     ' FROM LINEA_SALIDAS, ALMACENES ' +
                     ' WHERE EMPRESA_LS=EMPRESA_AL ' +
                     ' AND LOTE_LS=LOTE_AL ' +
                     ' AND EMPRESA_AL=' + QuotedStr(Empresa) +
                     ' AND ALBARAN_LS=' + QuotedStr(Albaran) +
                     ' AND CLIENTE_AL=' + QuotedStr(Cliente) +
                     ' AND NUMERO_CAMARA_AL=' + IntToStr(Camara) +
                     ' AND ZONA_AL=' + QuotedStr(Zona));
        QAux.Open;
        Result:=QAux.FieldByName('Num_Lineas').AsInteger;
     finally
            QAux.Close;
            FreeAndNil(QAux);
     end;
end;

//OK
//------------------------ COMPRUEBA EL CLIENTE --------------------------------
procedure TSalidas.ComprobarCliente();
begin
     if QMaestro.FieldByName('Cliente_cs').AsString='' then exit;
     if (cCliente.Text='') then
     begin
          MessageDlg (Chr(13) + 'El código del cliente es obligatorio', mtError,[mbOk],0);
          cCliente.SetFocus;
     end
     else if tNomcliente.Caption='' then
     begin
          MessageDlg (Chr(13) + 'El cliente no existe', mtError,[mbOk],0);
          cCliente.SetFocus;
     end      //Comprobamos si el cliente esta dado de baja
     else if not ClienteDeAlta() then
          begin
               MessageDlg (Chr(13) + 'Cliente ' + cCliente.Text + ' de baja', mtError,[mbOk],0);
               cCliente.SetFocus;
               if QMaestro.State=dsEdit then
                  QMaestro.FieldByName('Cliente_cs').AsString:=ClienteAnt
               else
                  QMaestro.FieldByName('Cliente_cs').AsString:='';
          end     //Comprobamos si el cliente tiene mercancia retenida
          else if ClienteMercanciaRetenida() then
               begin
                    if MessageBox(Handle, PChar('Cliente con mercancía retenida por falta de pago.' + chr(13) +
                                  '¿Desea realizar la Salida de todas formas?'),
                                  PChar(Self.Caption),
                                  MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1)=IDNO then
                    begin
                         cCliente.Text:='';
                         cCliente.SetFocus;
                    end
                    else
                        cHora.SetFocus;
               end;
end;

//OK
//--------------------- COMPRUEBA EL ALBARAN -----------------------------------
function TSalidas.ComprobarAlbaran(): Boolean;
Var
   QAux: TQuery;
begin
     Result:=True;
     //No permitimos cambiar el nº de albaran si es mayor que el que toca
     if StrToInt(cAlbaran.Text)>AlbaranToca then
     begin
          MessageDlg (Chr(13) + 'El nº de albarán es mayor que el que corresponde', mtError,[mbOk],0);
          cAlbaran.Text:=IntToStr(AlbaranToca);
          cAlbaran.SetFocus;
          Result:=False;
     end
     else            //Comprobamos que el albaran no exista
     begin
          QAux:=TQuery.Create(nil);
          try
             QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

             QAux.SQL.Add(' SELECT * FROM CABECERA_SALIDAS ' +
                          ' WHERE EMPRESA_CS=' + QuotedStr(cEmpresa.Text) +
                          ' AND ALBARAN_CS=' + QuotedStr(cAlbaran.Text));
             QAux.Open;
             if not QAux.IsEmpty then  //Si encontramos el albaran
             begin
                  MessageDlg (Chr(13) + 'El albarán ya existe', mtError,[mbOk],0);
                  cAlbaran.SetFocus;
                  Result:=False;
             end;
           finally
                  QAux.Close;
                  FreeAndNil(QAux);
           end;
     end;
end;

//OK
//---------------------- AL SALIR DEL IMPORTE ----------------------------------
procedure TSalidas.cImporteExit(Sender: TObject);
begin
     if QMaestro.State in dsEditModes then
        QMaestro.FieldByName('Importe_salida_cs').AsFloat:=Redondear(QMaestro.FieldByName('Importe_salida_cs').AsFloat,2);
end;

//OK
//---------------------- AL SALIR DE LAS HORAS ---------------------------------
procedure TSalidas.cHorasFacturarExit(Sender: TObject);
Var
   Minutos: Integer;
begin
     if QMaestro.State in dsEditModes then
     begin
          if cHorasFacturar.Text='' then
             QMaestro.FieldByName('horas_salida_cs').AsFloat:=0
          else if QMaestro.FieldByName('horas_salida_cs').AsFloat<0 then
               begin
                    MessageDlg (Chr(13) + 'Las horas de salida deben ser mayor o igual que cero', mtError,[mbOk],0);
                    cHorasFacturar.SetFocus;
               end
               else
               begin
                    QMaestro.FieldByName('horas_salida_cs').AsFloat:=Redondear(QMaestro.FieldByName('horas_salida_cs').AsFloat,2);
                    Minutos:=StrToInt(RellenarCeros(ParteDecimal(QMaestro.FieldByName('horas_salida_cs').AsFloat),2,'D'));
                    if Minutos>59 then
                    begin
                         MessageDlg (Chr(13) + 'El rango de minutos en las horas de salida es incorrecto', mtError,[mbOk],0);
                         cHorasFacturar.SetFocus;
                    end;
               end;
     end;
end;

//OK
//------------------------- AL SALIR DE LAS UNIDADES ---------------------------
procedure TSalidas.cUnidadesExit(Sender: TObject);
begin
     //Altas sucesivas
     if (QLineas.State in [dsEdit,dsInsert]) then
        Aceptar(Self);
  
end;

//OK
//-------------------------- DESPUES DE ABRIR LA TABLA DE CABECERA -------------
procedure TSalidas.QMaestroAfterOpen(DataSet: TDataSet);
begin
     QLineas.Open;
end;

//OK
//-------------------------- AL CALCULAR LINEAS --------------------------------
procedure TSalidas.QLineasCalcFields(DataSet: TDataSet);
begin
     QLineas.FieldByName('NombreFamilia').AsString:=NomFamilia(QLineas.FieldByName('Empresa_ls').AsString,
                                                               QLineas.FieldByName('Familia_ls').AsString);
     QLineas.FieldByName('NombreArticulo').AsString:=NomArticulo(QLineas.FieldByName('Empresa_ls').AsString,
                                                                 QLineas.FieldByName('Familia_ls').AsString,
                                                                 QLineas.FieldByName('Articulo_ls').AsString);
     //Localizamos el almacen
     QAlmacenes.Close;
     QAlmacenes.ParamByName('Empresa').AsString:=QLineas.FieldByName('Empresa_ls').AsString;
     QAlmacenes.ParamByName('Cliente').AsString:=QMaestro.FieldByName('Cliente_cs').AsString;
     QAlmacenes.ParamByName('Lote').AsString:=QLineas.FieldByName('Lote_ls').AsString;
     QAlmacenes.Open;

     QLineas.FieldByName('Camara').AsString:=QAlmacenes.FieldByName('Numero_Camara_al').AsString;
     QLineas.FieldByName('Zona').AsString:=QAlmacenes.FieldByName('Zona_al').AsString;
end;

//OK
//------------------------- ANTES DE INSERTAR ----------------------------------
procedure TSalidas.QLineasBeforeInsert(DataSet: TDataSet);
begin
     tNomFamilia.Caption:='';
     tNomArticulo.Caption:='';

     LFamiliaAnt:='';
     LArticuloAnt:='';
     LLoteAnt:='';
     LBultosAnt:=0;
     LEstuchesBultoAnt:=0;
     LEstuchesSueltosAnt:=0;
     LUnidadesAnt:=0;
     LPaletsAnt:=0;
end;

//OK
//---------------------- DOBLE CLICK EN LE GRID DE LINEAS ----------------------

procedure TSalidas.GridLineasDblClick(Sender: TObject);
var
 bPuedoModificar: boolean;
begin
     if not (QMaestro.State in [dsEdit,dsInsert]) then   //Cabecera
     begin
       if QMaestro.FieldByName('Fecha_Factura_cs').AsString<>'' then
       Begin
       { CARMEN!!
         //Solo puedo modifcar albaranes con mas de un año
         if ( Now - StrToDate( DiaMesAnyo(QMaestro.FieldByName('FECHA_ALBARAN_CS').AsString) ) ) < 365 then
         begin
           MessageDlg (Chr(13) + 'No puede modificar un albarán ya facturado con menos de un año de antiguedad.', mtError,[mbOk],0);
           bPuedoModificar:= False;
         end
         else
         begin
}
           bPuedoModificar:= MessageDlg (Chr(13) + 'Albarán ya facturado, ¿seguro que quiere modificarlo?.', mtError,[mbYes,mbNo ],0) = mrYes;
 //        end;
       end
       else
       begin
         bPuedoModificar:= True;
       end;


         if bPuedoModificar then
          begin
               PanelInsertarLinea.Visible:=True;
               cBultos.SetFocus;

               //Localizamos el almacen
               QAlmacenes.Close;
               QAlmacenes.ParamByName('Empresa').AsString:=QMaestro.FieldByName('Empresa_cs').AsString;
               QAlmacenes.ParamByName('Cliente').AsString:=QMaestro.FieldByName('Cliente_cs').AsString;
               QAlmacenes.ParamByName('Lote').AsString:=QLineas.FieldByName('Lote_ls').AsString;
               QAlmacenes.Open;
               if not QAlmacenes.IsEmpty then
               begin
                    // vesteve - tTipoLote.Caption:=NomTipoLote(QAlmacenes.FieldByName('Tipo_Lote_al').AsString);
                    cCamara.Text:=IntToStr(QAlmacenes.FieldByName('Numero_Camara_al').AsInteger);
                    cZona.Text:=QAlmacenes.FieldByName('Zona_al').AsString;
               end
               else
               begin
                    // vesteve - tTipoLote.Caption:='';
                    cCamara.Text:='';
                    cZona.Text:='';
               end;

               //---- Campos que no se pueden modificar ----
               cLote.Style.Font.Color:=clRed;
               cLoteOrigen.Style.Font.Color:=clRed;
               cFamilia.Style.Font.Color:=clRed;
               cArticulo.Style.Font.Color:=clRed;
               cCamara.Font.Color:=clRed;
               cZona.Font.Color:=clRed;

               cLote.Properties.ReadOnly:=True;
               cLoteOrigen.Properties.ReadOnly:=True;
               cFamilia.Properties.ReadOnly:=True;
               cArticulo.Properties.ReadOnly:=True;
               cCamara.ReadOnly:=True;
               cZona.ReadOnly:=True;

               cLote.TabStop:=False;
               cLoteOrigen.TabStop:=False;
               cFamilia.TabStop:=False;
               cArticulo.TabStop:=False;
               cCamara.TabStop:=False;
               cZona.TabStop:=False;

               cLote.OnKeyDown:=nil;
               LupaFamilia.OnClick:=nil;
               LupaLote.OnClick:=nil;
               LupaArticulo.OnClick:=nil;
               LupaCamara.OnClick:=Nil;
               LupaZona.OnClick:=Nil;
               LupaLote.Enabled:=False;
               LupaFamilia.Enabled:=False;
               LupaArticulo.Enabled:=False;
               LupaCamara.Enabled:=False;
               LupaZona.Enabled:=False;
               //---- Campos que no se pueden modificar ----

               PanelClaves.Enabled:=False;
               PanelCabecera.Enabled:=False;
               PanelLineas.Enabled:=False;

               tNomFamilia.Caption:=NomFamilia(cEmpresa.Text,
                                               RellenarCeros(cFamilia.Text,cFamilia.Properties.MaxLength,'I'));
               tNomArticulo.Caption:=NomArticulo(cEmpresa.Text,
                                                 RellenarCeros(cFamilia.Text,cFamilia.Properties.MaxLength,'I'),
                                                 RellenarCeros(cArticulo.Text,cArticulo.Properties.MaxLength,'I'));

               QLineas.Edit;

               BotonesPosicion();
          end;
     end;
end;

//OK
//------------------- COMPRUEBA SI UN CLIENTE ESTA DADO DE ALTA ----------------
function TSalidas.ClienteDeAlta():Boolean;
Var
   QAux: TQuery;
begin
     QAux:=TQuery.Create(nil);
     try
        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

        QAux.SQL.Add(' SELECT PERIODO_FACTURA_C FROM CLIENTES' +
                     ' WHERE EMPRESA_C=' + QuotedStr(cEmpresa.Text) +
                     ' AND CODIGO_C=' + QuotedStr(cCliente.Text));
        QAux.Open;
        if QAux.FieldByNAme('Periodo_Factura_c').AsString='B' then  //Si el cliente esta de baja
           Result:=False
        else
            Result:=True;
     finally
            QAux.Close;
            FreeAndNil(QAux);
     end;
end;

//OK
//------------------- COMPRUEBA SI UN CLIENTE TIENE MERCANCIA RETENIDA ---------
function TSalidas.ClienteMercanciaRetenida():Boolean;
Var
   QAux: TQuery;
begin
     QAux:=TQuery.Create(nil);
     try
        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

        QAux.SQL.Add(' SELECT MERCANCIA_RETENIDA_C FROM CLIENTES' +
                     ' WHERE EMPRESA_C=' + QuotedStr(cEmpresa.Text) +
                     ' AND CODIGO_C=' + QuotedStr(cCliente.Text));
        QAux.Open;
        if QAux.FieldByNAme('mercancia_retenida_c').AsString='S' then  //Si el cliente tiene mercancia retenida
           Result:=True
        else
            Result:=False;
     finally
            QAux.Close;
            FreeAndNil(QAux);
     end;
end;

//OK
//--------------------- ANTES DE MODIFICAR UNA LINEA ---------------------------
procedure TSalidas.QLineasBeforeEdit(DataSet: TDataSet);
Var
   BultosStock, PaletsStock: Integer;
   UnidadesStock: Real;

begin
     //Guardamos los datos de la linea antes de modificarla
     LFamiliaAnt:=QLineas.FieldByName('Familia_ls').AsString;
     LArticuloAnt:=QLineas.FieldByName('Articulo_ls').AsString;
     LLoteAnt:=QLineas.FieldByName('Lote_ls').AsString;
     LBultosAnt:=QLineas.FieldByName('Bultos_ls').AsInteger;
     LEstuchesSueltosAnt:=QLineas.FieldByName('Estuches_Sueltos_ls').AsInteger;
     LUnidadesAnt:=QLineas.FieldByName('Unidades_ls').AsFloat;
     LPaletsAnt:=QLineas.FieldByName('Palets_ls').AsInteger;

     //Abrimos el almacen para poder hacer calculos
     QAlmacenes.Close;
     QAlmacenes.ParamByName('Empresa').AsString:=QLineas.FieldByName('Empresa_ls').AsString;
     QAlmacenes.ParamByName('Cliente').AsString:=QMaestro.FieldByName('Cliente_cs').AsString;
     QAlmacenes.ParamByName('Lote').AsString:=QLineas.FieldByName('Lote_ls').AsString;
     QAlmacenes.Open;

     //Calculamos Stocks del Almacen
     BultosStock:=QAlmacenes.FieldByName('Bultos_Entrados_al').AsInteger - QAlmacenes.FieldByName('Bultos_Salidos_al').AsInteger;
     PaletsStock:=QAlmacenes.FieldByName('Palets_Entrados_al').AsInteger - QAlmacenes.FieldByName('Palets_Salidos_al').AsInteger;
     UnidadesStock:=QAlmacenes.FieldByName('Unidades_Entradas_al').AsFloat - QAlmacenes.FieldByName('Unidades_Salidas_al').AsFloat;

     //Mostramos el Stock de Estuches, Bultos y Unidades
     if QAlmacenes.FieldByName('Estuches_Bulto_al').AsInteger=0 then
        MensajeFijo('STOCK: ' + IntToStr(BultosStock) +  ' BULTOS      ' +
                    IntToStr(PaletsStock) + ' PALETS      ' +
                    FloatToStr(UnidadesStock) + ' UNIDADES')
     else
         MensajeFijo('STOCK:      ' +
                     IntToStr((QAlmacenes.FieldByName('estuches_bulto_al').AsInteger * BultosStock) + QAlmacenes.FieldByName('Estuches_sueltos_al').AsInteger) +
                     ' ESTUCHES      ' +
                     IntToStr(QAlmacenes.FieldByName('estuches_bulto_al').AsInteger) +
                     ' ESTUCHES/BULTO      ' +
                     IntToStr(QAlmacenes.FieldByName('Estuches_sueltos_al').AsInteger) +
                     ' ESTUCHES SUELTOS      ' +
                     IntToStr(BultosStock) +  ' BULTOS      ' +
                     IntToStr(PaletsStock) + ' PALETS      ' +
                     FloatToStr(UnidadesStock) + ' UNIDADES');
end;

//OK
//----------------------- DESPUES DE CANCELAR ----------------------------------
procedure TSalidas.QMaestroAfterCancel(DataSet: TDataSet);
begin
     cHora.OnChange:=Nil;
     cHora.Text:=StringReplace(QMaestro.FieldByName('HORA_CS').AsString, ':', '',[rfReplaceAll]);
     cHora.OnChange:=cHoraChange;

     cFechaAlbaran.Properties.OnChange:=Nil;
     cFechaAlbaran.Text:=DiaMesAnyo(QMaestro.FieldByName('FECHA_ALBARAN_CS').AsString);
     cFechaAlbaran.Properties.OnChange:=cFechaAlbaranChange;
end;

//OK
//----------------------- FUNCION QUE COMPRUEBA LA HORA ------------------------
function TSalidas.ComprobarHora(Hora: String):Boolean;
Var
   Horas, Minutos, Segundos: Integer;
   HorasS, MinutosS, SegundosS: String;
begin
     Result:=True;
     if QMaestro.State in dsEditModes then
     begin
          if Length(Hora)=6 then
          begin
               //Horas
               HorasS:=Copy(Hora,1,2);
               if EsNumerico(HorasS) then
                  Horas:=StrToInt(HorasS)
               else
                   Horas:=-1;
               //Minutos
               MinutosS:=Copy(Hora,3,2);
               if EsNumerico(MinutosS) then
                  Minutos:=StrToInt(MinutosS)
               else
                   Minutos:=-1;
               //Segundos
               SegundosS:=Copy(Hora,5,2);
               if EsNumerico(SegundosS) then
                  Segundos:=StrToInt(SegundosS)
               else
                   Segundos:=-1;

               if (not((Horas>=0) and (Horas<=23))) or (not((Minutos>=0) and (Minutos<=59))) or (not((Segundos>=0) and (Segundos<=59))) then
                   Result:=False;
          end
          else
               Result:=False;
     end;
end;

//OK
//----------------------- FUNCION QUE COMPRUEBA EL LOTE ------------------------
function TSalidas.ComprobarLote(Empresa, Cliente, Lote, Familia, Articulo, Camara, Zona: String; LoteOrigen: String = ''):Boolean;
Var
   QAux: TQuery;
begin
     QAux:=TQuery.Create(nil);
     try
        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

        QAux.SQL.Add(' SELECT * FROM ALMACENES ' +
                     ' WHERE EMPRESA_AL=' + QuotedStr(Empresa) +
                     ' AND CLIENTE_AL=' + QuotedStr(Cliente) +
                     ' AND LOTE_AL=' + QuotedStr(Lote));
        if Familia<>'' then
           QAux.SQL.Add(' AND FAMILIA_AL=' + QuotedStr(Familia));
        if Articulo<>'' then
           QAux.SQL.Add(' AND ARTICULO_AL=' + QuotedStr(Articulo));
        if Camara<>'' then
           QAux.SQL.Add(' AND NUMERO_CAMARA_AL=' + Camara);
        if Zona<>'' then
           QAux.SQL.Add(' AND ZONA_AL=' + QuotedStr(Zona));
        if LoteOrigen<>'' then
           QAux.SQL.Add(' AND LOTE_ORIGEN_AL=' + QuotedStr(LoteOrigen));
        QAux.Open;
        if QAux.IsEmpty then  //Si el cliente tiene mercancia retenida
           Result:=False
        else
            Result:=True;
     finally
            QAux.Close;
            FreeAndNil(QAux);
     end;

end;

//OK
//-------------------------- BUSQUEDA DE LOTES ---------------------------------
procedure TSalidas.LupaLoteClick(Sender: TObject);
begin
     LupaLotes(QMaestro.FieldByName('Empresa_cs').AsString,
               QMaestro.FieldByName('Cliente_cs').AsString,
               '','','','');
end;

//OK
//-------------------------- BUSQUEDA DE LOTES ---------------------------------
function TSalidas.LupaLotes(Empresa, Cliente, Familia, Articulo, Camara, Zona: String; LoteOrigen: String = ''):Boolean;
Var
   Aux: TBusquedaLotes;
begin
     try
        Aux:=TBusquedaLotes.Create(Self);
        with Aux do
        begin
             Query1.SQL.Clear;
             SQLText:=' SELECT LOTE_AL, TIPO_LOTE_AL, FAMILIA_AL, DESCRIPCION_F, ARTICULO_AL, ' +
                      ' DENOMINACION_A, STATUS_RETENIDO_AL,  NUMERO_CAMARA_AL, ZONA_AL, ' +
                      ' ESTUCHES_BULTO_AL, BULTOS_ENTRADOS_AL, BULTOS_SALIDOS_AL, ' +
                      ' UNIDADES_ENTRADAS_AL, UNIDADES_SALIDAS_AL, UNIDADES_MERMAS_AL, UNIDADES_DESTRUIDAS_AL, ESTUCHES_SUELTOS_AL, ' +
                      ' LOTE_ORIGEN_AL ' +
                      ' FROM ALMACENES, ARTICULOS, FAMILIAS ' +
                      ' WHERE EMPRESA_AL=EMPRESA_A ' +
                      ' AND FAMILIA_AL=FAMILIA_A ' +
                      ' AND ARTICULO_AL=CODIGO_A ' +
                      ' AND EMPRESA_F=EMPRESA_A ' +
                      ' AND CODIGO_F=FAMILIA_A ' +
                      ' AND EMPRESA_AL=' + QuotedStr(Empresa) +
                      ' AND CLIENTE_AL=' + QuotedStr(Cliente);
             if (Familia<>'') and (Articulo<>'') then
                SQLText:=SQLText + ' AND FAMILIA_AL=' + QuotedStr(Familia) +
                                   ' AND ARTICULO_AL=' + QuotedStr(Articulo);
             if Zona<>'' then
                SQLText:=SQLText + ' AND ZONA_AL=' + QuotedStr(Zona);
             if Camara<>'' then
                SQLText:=SQLText + ' AND NUMERO_CAMARA_AL=' + Camara;

             if LoteOrigen<>'' then
                SQLText:=SQLText + ' AND LOTE_ORIGEN_AL=' + QuotedStr(LoteOrigen);

             SQLText:=SQLText + ' AND ((BULTOS_ENTRADOS_AL - BULTOS_SALIDOS_AL)>0 OR (UNIDADES_ENTRADAS_AL - UNIDADES_SALIDAS_AL - UNIDADES_MERMAS_AL - UNIDADES_DESTRUIDAS_AL)>0 OR (ESTUCHES_SUELTOS_AL>0)) ' +
                                ' AND TIPO_LOTE_AL<>' + QuotedStr('I');
             Query1.Sql.Add(SQLText + ' ORDER BY DENOMINACION_A');
             Query1.Open;
             if Query1.IsEmpty then
             begin
                  MessageDlg (Chr(13) + 'No existen lotes', mtError,[mbOk],0);
                  Result:=False;
             end
             else
             begin
                  ShowModal;

                  Application.ProcessMessages;

                  if LoteBus<>'' then   //Seleccionamos un registro del grid resultado
                     PonerLote(LoteBus);
                  Result:=True;
              end;
        end;
     finally
            FreeAndNil(Aux);
     end;
end;

//OK
//--------------- CONTROL DE PULSACION DE TECLAS EN EL CAMPO LOTE --------------
procedure TSalidas.cLoteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=113 then   //F2
        LupaLoteClick(self);
end;

procedure TSalidas.cLoteOrigenExit(Sender: TObject);
var
  lote: String;
  numero: Integer;
begin
  if cLoteOrigen.EditModified  and  (cLoteOrigen.Text <> '') then
  begin
    cLoteOrigen.EditModified := False;
    if QLotesOrigenCount.Active then
      QLotesOrigenCount.Close;
    QLotesOrigenCount.ParamByName('Empresa').AsString := QMaestro.FieldByName('Empresa_cs').AsString;
    QLotesOrigenCount.ParamByName('Cliente').AsString := QMaestro.FieldByName('Cliente_cs').AsString;
    QLotesOrigenCount.ParamByName('LoteOrigen').AsString := cLoteOrigen.Text;
    QLotesOrigenCount.Open;
    numero := QLotesOrigenCount.FieldByName('total').asInteger;
    QLotesOrigenCount.Close;

    // No existe lote origen
    if numero = 0 then
    begin
      MessageDlg(Chr(13) + 'Lote origen no existente o sin stock para este Cliente', mtError,[mbOk],0);
      cLoteOrigen.SetFocus;
    end
    // Poner datos relacionados al lote origen
    else
    begin
      if QLotesOrigen.Active then
        QLotesOrigen.Close;
      QLotesOrigen.ParamByName('Empresa').AsString := QMaestro.FieldByName('Empresa_cs').AsString;
      QLotesOrigen.ParamByName('Cliente').AsString := QMaestro.FieldByName('Cliente_cs').AsString;
      QLotesOrigen.ParamByName('LoteOrigen').AsString := cLoteOrigen.Text;
      QLotesOrigen.Open;
      lote := QLotesOrigen.FieldByName('lote_al').asString;

      if numero = 1 then
        // Obtener lote
        PonerLote(lote)
      // Mostrar lupa para seleccionar lote-lote origen
      else if numero > 1 then
      begin
         LupaLotes(QMaestro.FieldByName('Empresa_cs').AsString,
                   QMaestro.FieldByName('Cliente_cs').AsString,
                   '','','','', cLoteOrigen.Text);
      end;
    end;
  end;
end;

//OK
//-------------------- AL SALIR DE LA ZONA -------------------------------------
procedure TSalidas.cZonaExit(Sender: TObject);
begin
     cZona.Color:=clWindow;
     if (cLote.Text='') then  //No hay lote
     begin
          if (cCamara.Text<>'') and (cZona.Text<>'') then   //Hay Camara y Zona
              LupaLotes(QMaestro.FieldByName('Empresa_cs').AsString,
                        QMaestro.FieldByName('Cliente_cs').AsString,
                        '',
                        '',
                        cZona.Text,
                        cCamara.Text);
     end
     else  //Hay Lote
     begin
          if cZona.Text<>'' then  //Hay Zona
          begin
                if not ComprobarLote(QMaestro.FieldByName('Empresa_cs').AsString,
                                     QMaestro.FieldByName('Cliente_cs').AsString,
                                     cLote.Text,
                                     '',
                                     '',
                                     '',
                                     cZona.Text) then
                begin
                     MessageDlg (Chr(13) + 'La zona no pertenece al lote', mtError,[mbOk],0);
                     cLote.SetFocus;
                end;
          end;
     end;
end;

//OK
//-------------------- AL SALIR DE LA CAMARA -----------------------------------
procedure TSalidas.cCamaraExit(Sender: TObject);
begin
     if QLineas.State in dsEditModes then
     begin
          cCamara.Color:=clWindow;
          if (cLote.Text<>'') and (cCamara.Text<>'') then
          begin
               if not ComprobarLote(QMaestro.FieldByName('Empresa_cs').AsString,
                                    QMaestro.FieldByName('Cliente_cs').AsString,
                                    cLote.Text,
                                    '',
                                    '',
                                    cCamara.Text,
                                    '') then
               begin
                    MessageDlg (Chr(13) + 'La cámara no pertenece al lote', mtError,[mbOk],0);
                    cLote.SetFocus;
               end;
          end;
    end;
end;

//OK
//- ACTUALIZA EL ALMACEN EN UNA INSERCION, UNA MODIFICACION O UN BORRADO DE LINEA -----
procedure TSalidas.ActualizarAlmacen(EditAddDelete, Empresa, Cliente, Lote, FechaAlbaran, TipoSalida: String; BultosLinea, EstuchesSueltosLinea, PaletsLinea:Integer; UnidadesLinea: Real);
Var
   QAux: TQuery;
   TotalEstuches, Cociente: Integer;
begin
     QAux:=TQuery.Create(nil);
     try
        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
        QAux.SQL.Clear;
        QAux.SQL.Add(' UPDATE ALMACENES ' +
                     ' SET BULTOS_SALIDOS_AL=BULTOS_SALIDOS_AL + :Bultos_Sal, ' +                    //Bultos Salidos
                         ' UNIDADES_SALIDAS_AL=UNIDADES_SALIDAS_AL + :Unidades_Sal, ' +              //Unidades Salidas
                         ' UNIDADES_DESTRUIDAS_AL=UNIDADES_DESTRUIDAS_AL + :Unidades_Des, ' +        //Unidades Destruidas
                         ' UNIDADES_MERMAS_AL=UNIDADES_MERMAS_AL + :Unidades_Mer, ' +                //Unidades Mermas
                         ' UNID_SAL_MISMO_DIA_AL=UNID_SAL_MISMO_DIA_AL + :Unidades_Mismo_Dia, ' +    //Unidades Salidas Mismo Dia
                         ' ESTUCHES_SUELTOS_AL=:EstSueltos, ' +                                      //Estuches Totales
                         ' ESTUCHES_TOTALES_AL=:EstTotales, ' +                                      //Estuches Sueltos
                         ' PALETS_SALIDOS_AL=PALETS_SALIDOS_AL + :PaletsSal, ' +                     //Palets Salidos
                         ' FECHA_MODIF_AL=:FechaModif ' +                                            //Fecha de Modificacion
                      ' WHERE EMPRESA_AL=' + QuotedStr(Empresa) +
                      ' AND CLIENTE_AL=' + QuotedStr(Cliente) +
                      ' AND LOTE_AL=' + QuotedStr(Lote));

        //Localizamos el almacen
        QAlmacenes.Close;
        QAlmacenes.ParamByName('Empresa').AsString:=Empresa;
        QAlmacenes.ParamByName('Cliente').AsString:=Cliente;
        QAlmacenes.ParamByName('Lote').AsString:=Lote;
        QAlmacenes.Open;
        if Not QAlmacenes.IsEmpty then
        begin
             //Calculo de los Estuches Sueltos
             if QAlmacenes.FieldByName('Estuches_Bulto_Al').AsInteger=0 then
             begin
                  QAux.ParamByName('EstSueltos').AsInteger:=0;
                  QAux.ParamByName('EstTotales').AsInteger:=0;
                  if (EditAddDelete='ADD') or (EditAddDelete='EDIT') then  //Insercion o Modificacion
                      QAux.ParamByName('Bultos_Sal').AsInteger:=BultosLinea - LBultosAnt
                  else
                      QAux.ParamByName('Bultos_Sal').AsInteger:=-BultosLinea;
             end
             else
             begin
                  if (EditAddDelete='ADD') or (EditAddDelete='EDIT') then  //Insercion o Modificacion
                     //Calculo de los estuches totales
                     TotalEstuches:=QAlmacenes.FieldByName('Estuches_Totales_Al').AsInteger -
                                   (BultosLinea * QAlmacenes.FieldByName('Estuches_Bulto_Al').AsInteger)
                                    - EstuchesSueltosLinea +
                                   (LBultosAnt * QAlmacenes.FieldByName('Estuches_Bulto_Al').AsInteger) + LEstuchesSueltosAnt
                  else  //Borrado
                      TotalEstuches:=QAlmacenes.FieldByName('Estuches_Totales_Al').AsInteger +
                                    (BultosLinea * QAlmacenes.FieldByName('Estuches_Bulto_Al').AsInteger)
                                    + EstuchesSueltosLinea;

                  QAux.ParamByName('EstTotales').AsInteger:=TotalEstuches;
                  //Division entera (TotalEstuches dividido EstuchesBulto)
                  Cociente:=TotalEstuches div QAlmacenes.FieldByName('Estuches_Bulto_Al').AsInteger;

                  if (Cociente * QAlmacenes.FieldByName('Estuches_Bulto_Al').AsInteger) <= TotalEstuches then
                     QAux.ParamByName('Bultos_Sal').AsInteger:=QAlmacenes.FieldByName('Bultos_Entrados_al').AsInteger - QAlmacenes.FieldByName('Bultos_Salidos_al').AsInteger - Cociente
                  else
                      QAux.ParamByName('Bultos_Sal').AsInteger:=QAlmacenes.FieldByName('Bultos_Entrados_al').AsInteger - QAlmacenes.FieldByName('Bultos_Salidos_al').AsInteger - Cociente -1;

                  //Obtenemos los estuches sueltos
                  QAux.ParamByName('EstSueltos').AsInteger:=TotalEstuches - ((QAlmacenes.FieldByName('Bultos_Entrados_al').AsInteger - QAlmacenes.FieldByName('Bultos_Salidos_al').AsInteger - QAux.ParamByName('Bultos_Sal').AsInteger) * QAlmacenes.FieldByName('Estuches_Bulto_Al').AsInteger);
             end;

             //Inicializo valores por si no los asigno
             QAux.ParamByName('Unidades_Sal').AsFloat:=0;
             QAux.ParamByName('Unidades_Mer').AsFloat:=0;
             QAux.ParamByName('Unidades_Des').AsFloat:=0;
             QAux.ParamByName('Unidades_Mismo_Dia').AsFloat:=0;

             if (EditAddDelete='ADD') or (EditAddDelete='EDIT') then   //Insercion o Modificacion
             begin
                  QAux.ParamByName('PaletsSal').AsInteger:=PaletsLinea - LPaletsAnt;

                  //Tipo Salida Normal
                  if QMaestro.FieldByName('Tipo_Salida_cs').AsString='N' then
                  begin
                       QAux.ParamByName('Unidades_Sal').AsFloat:=UnidadesLinea - LUnidadesAnt;
                       //Si la salida se hace el mismo dia que la entrada
                       if QAlmacenes.FieldByName('Fecha_Entrada_al').AsString=FechaAlbaran then
                          QAux.ParamByName('Unidades_Mismo_Dia').AsFloat:=UnidadesLinea - LUnidadesAnt;
                  end  //Tipo de Salida Destruida
                  else if QMaestro.FieldByName('Tipo_Salida_cs').AsString='D' then
                          QAux.ParamByName('Unidades_Des').AsFloat:=UnidadesLinea - LUnidadesAnt
                  else //Tipo de Salida Merma
                      if QMaestro.FieldByName('Tipo_Salida_cs').AsString='R' then
                         QAux.ParamByName('Unidades_Mer').AsFloat:=UnidadesLinea - LUnidadesAnt;
             end
             else  //Borrado
             begin
                  QAux.ParamByName('PaletsSal').AsInteger:=-PaletsLinea;

                  //Tipo Salida Normal
                  if TipoSalida='N' then
                  begin
                       QAux.ParamByName('Unidades_Sal').AsFloat:=-UnidadesLinea;
                       //Si la salida se hace el mismo dia que la entrada
                       if QAlmacenes.FieldByName('Fecha_Entrada_al').AsString=FechaAlbaran then
                          QAux.ParamByName('Unidades_Mismo_Dia').AsFloat:=-UnidadesLinea;
                  end  //Tipo de Salida Destruida
                  else if TipoSalida='D' then
                          QAux.ParamByName('Unidades_Des').AsFloat:=-UnidadesLinea
                  else //Tipo de Salida Merma
                      if TipoSalida='R' then
                         QAux.ParamByName('Unidades_Mer').AsFloat:=-UnidadesLinea;
             end;
             QAux.ParamByName('FechaModif').AsString:=AnyoMesDia(Date());
             QAlmacenes.Close;

             Application.ProcessMessages;

             QAux.ExecSQL;
       end
       else
           MessageDlg (Chr(13) + 'Error al actualizar el almacén', mtError,[mbOk],0);
     finally
            QAlmacenes.Close;
            QAux.Close;
            FreeAndNil(QAux);
     end;
end;

//************************* ALBARAN DE SALIDA **********************************
procedure TSalidas.ImprimirAlbaran(Empresa, Cliente, Fecha, ARefCliente: String; Albaran: Integer);
begin
     try
        with TQRAlbaranSalida.Create(nil) do
        try
           tCliente.Caption:=Cliente + '-';
           if ARefCliente <> '' then
             tNumAlbaran.Caption:= ARefCliente
           else
             tNumAlbaran.Caption:=IntToStr(Albaran);
           QAux.Close;
           QAux.SQL.Clear;
           QAux.SQL.Add(' SELECT * ' +
                        ' FROM CABECERA_SALIDAS ' +
                        ' WHERE EMPRESA_CS=' + QuotedStr(Empresa) +
                        ' AND CLIENTE_CS=' + QuotedStr(Cliente) +
                        ' AND ALBARAN_CS=' + IntToStr(Albaran) +
                        ' AND FECHA_ALBARAN_CS=' + QuotedStr(AnyoMesDia(Fecha)));
           QAux.Open;
           tObservacion.Caption:=QAux.FieldByName('OBSERVACIONES_CS').AsString;
           tRetira.Caption:=QAux.FieldByName('RETIRA_CS').AsString;
           tDestino.Caption:=QAux.FieldByName('DESTINO_CS').AsString;
           tNumOrden.Caption:=QAux.FieldByName('ORDEN_NUMERO_CS').AsString;
           tMatricula.Caption:=QAux.FieldByName('MATRICULA_CS').AsString;
           tNif.Caption:=QAux.FieldByName('NIF_RETIRA_CS').AsString;
           tFecha.Caption:=Fecha + '  ' + QAux.FieldByName('HORA_CS').AsString;
           if Trim( QAux.FieldByName('Notas_CS').AsString ) <> ''  then
           begin
             tNota.Caption:=QAux.FieldByName('Notas_CS').AsString;
             bndNotas.Enabled:= True;
           end
           else
           begin
             bndNotas.Enabled:= false;
           end;
           tTemperatura.Caption:=QAux.FieldByName('temperatura_CS').AsString +'ºC';
           if QAux.FieldByName('IMPORTE_SALIDA_CS').AsFloat<>0 then
           begin
                //tTituloImporte.Enabled:=True;
                //tImporteEntrada.Enabled:=True;
                HayImporte:=True;
                tImporteSalida.Caption:=FormatFloat(',0.00 Eur.',QAux.FieldByName('IMPORTE_SALIDA_CS').AsFloat);
           end
           else
               HayImporte:=False;
           if QAux.FieldByName('HORAS_SALIDA_CS').AsFloat<>0 then
           begin
                //tTituloHoras.Enabled:=True;
                //tHorasFacturar.Enabled:=True;
                HayHoras:=True;
                tHorasFacturar.Caption:=FormatFloat(',0.00',QAux.FieldByName('HORAS_SALIDA_CS').AsFloat);
                if QAux.FieldByName('IMPORTE_SALIDA_CS').AsFloat=0 then
                begin
                     tTituloHoras.Left:=tTituloImporte.Left;
                     tHorasFacturar.Left:=tImporteSalida.Left;
                end;
           end
           else
               HayHoras:=False;
           if QAux.FieldByName('CONCEPTO_CS').AsString<>'' then
           begin
                //tTituloConcepto.Enabled:=True;
                //tConcepto.Enabled:=True;
                HayConcepto:=True;
                tConcepto.Caption:=QAux.FieldByName('CONCEPTO_CS').AsString;
           end
           else
               HayConcepto:=False;

           QAux.Close;
           QAux.SQL.Clear;
           QAux.SQL.Add(' SELECT * ' +
                        ' FROM CLIENTES ' +
                        ' WHERE EMPRESA_C=' + QuotedStr(Empresa) +
                        ' AND CODIGO_C=' + QuotedStr(Cliente));
           QAux.Open;

           tCliente.Caption:=tCliente.Caption + QAux.FieldByName('NOMBRE_JURIDICO_C').AsString;
           if QAux.FieldByName('NOMBRE_COMERCIAL_C').AsString='' then
           begin
              bndNombreComercial.Height:= 0;
              tNombreComercial.Enabled:= false;
           end
           else
           begin
              bndNombreComercial.Height:= 17;
              tNombreComercial.Enabled:= True;
              tNombreComercial.Caption:= QAux.FieldByName('NOMBRE_COMERCIAL_C').AsString;
           end;
           QAux.Close;

           QLineas.Close;
           QLineas.SQL.Clear;
           QLineas.SQL.Add(' SELECT COUNT(*) AS NLINEAS ' +
                           ' FROM LINEA_SALIDAS ' +
                           ' WHERE EMPRESA_LS=' + QuotedStr(Empresa) +
                           ' AND ALBARAN_LS=' + IntToStr(Albaran));
           QLineas.Open;

           NLineas:=QLineas.FieldByName('NLINEAS').AsInteger;

           QLineas.Close;
           QLineas.SQL.Clear;
           QLineas.SQL.Add(' SELECT * ' +
                           ' FROM LINEA_SALIDAS ' +
                           ' WHERE EMPRESA_LS=' + QuotedStr(Empresa) +
                           ' AND ALBARAN_LS=' + IntToStr(Albaran) +
                           ' ORDER BY NLINEA_LS');
           QLineas.Open;

           //Lo usa el preview como parametros
           EmpresaGlobal:=Empresa;
           ClienteGlobal:=Cliente;

           Preview;
        finally
               QAux.Close;
               QLineas.Close;
               Free;
        end;
     except
            On E:Exception do
                 MessageDlg(E.Message,mtError,[mbOK],0);
     end;
end;

//--------------------------- BOTON IMPRIMIR -----------------------------------
procedure TSalidas.BImprimirClick(Sender: TObject);
begin
     ImprimirAlbaran(QMaestro.FieldByName('Empresa_cs').AsString,
                     QMaestro.FieldByName('Cliente_cs').AsString,
                     DiaMesAnyo(QMaestro.FieldByName('Fecha_Albaran_cs').AsString),
                     QMaestro.FieldByName('ref_cliente_cs').AsString,
                     QMaestro.FieldByName('Albaran_cs').AsInteger);
end;

//--------------------------- ENTRADA EN LA FECHA  -----------------------------
procedure TSalidas.cFechaAlbaranEnter(Sender: TObject);
begin
     cFechaAlbaran.Style.Color:=clMoneyGreen;
end;

//---------------------- AL CAMBIAR LA FECHA -----------------------------------
procedure TSalidas.cFechaAlbaranChange(Sender: TObject);
begin
     if not (QMaestro.State in [dsEdit,dsInsert]) then
        QMaestro.Edit;
end;

//------------ CAMPO CALCULADO PARA LA DESCRIPCION DEL TIPO DE SALIDA ----------
procedure TSalidas.QTiposSalidaCalcFields(DataSet: TDataSet);
begin
     QTiposSalida.FieldByName('des').AsString:=QTiposSalida.FieldByName('codigo_ts').AsString +
                                              ' - ' +
                                              QTiposSalida.FieldByName('descripcion_ts').AsString;
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TSalidas.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TSalidas.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresa.Text:=CodEmpresa;
     cEmpresa.SetFocus;
end;

//-------------------------- LUPA DE CLIENTES ----------------------------------
procedure TSalidas.cLupaClientesClick(Sender: TObject);
Var
   Cliente: String;
begin
     Cliente:=LupaClientes(cEmpresa.Text);
     if not (QMaestro.State in dsEditModes) then
     begin
          if Cliente<>'' then
          begin
               QMaestro.Edit;
               QMaestro.FieldByName('Cliente_cs').AsString:=Cliente;
          end;
     end
     else if Cliente<>'' then
             QMaestro.FieldByName('Cliente_cs').AsString:=Cliente;
     cCliente.SetFocus;
end;

//-------------------------- LUPA (F2) DE CLIENTES -----------------------------
procedure TSalidas.cClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaClientesClick(Self);
end;

//-------------------------- LUPA DE FAMILIAS-----------------------------------
procedure TSalidas.cLupaFamiliasClick(Sender: TObject);
Var
   Familia: String;
begin
     if cLote.Text='' then
     begin
          Familia:=LupaFamilias(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
          if Familia<>'' then
             cFamilia.Text:=Familia;
     end
     else
     begin
          MessageDlg (Chr(13) + 'Borre el lote para seleccionar familia/artículo', mtError,[mbOk],0);
          cLote.SetFocus;
     end;
end;

//-------------------------- LUPA (F2) DE FAMILIAS -----------------------------
procedure TSalidas.cFamiliaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaFamiliasClick(Self);
end;

//-------------------------- LUPA DE ARTICULOS ---------------------------------
procedure TSalidas.cLupaArticulosClick(Sender: TObject);
Var
   Articulo, Familia: String;
begin
     if cLote.Text='' then
     begin
           if (cFamilia.Text<>'') and (tNomFamilia.Caption<>'') then
           begin
                Familia:=RellenarCeros(cFamilia.Text,cFamilia.Properties.MaxLength,'I');
                Articulo:=LupaArticulos(cEmpresa.Text, Familia);
                if Articulo<>'' then
                begin
                     QLineas.FieldByName('Articulo_ls').AsString:=Articulo;
                     if not LupaLotes(QMaestro.FieldByName('Empresa_cs').AsString,
                                      QMaestro.FieldByName('Cliente_cs').AsString,
                                      cFamilia.Text,
                                      cArticulo.Text,'','') then
                     begin
                          cLote.OnExit:=Nil;
                          cLote.SetFocus;
                          cLote.OnExit:=cLoteExit;
                     end;
                end;
           end
           else //Si no pongo familia -> Muestro todos los articulos y devuelvo por referencia la familia
           begin
                Familia:='';
                Articulo:=LupaFamiliaArticulos(cEmpresa.Text, Familia);
                if Articulo<>'' then
                begin
                     cFamilia.Properties.OnChange:=Nil;
                     cArticulo.Properties.OnChange:=Nil;
                     QLineas.FieldByName('Familia_ls').AsString:=Familia;
                     tNomFamilia.Caption:=NomFamilia(cEmpresa.Text, Familia);
                     tNomArticulo.Caption:=NomArticulo(cEmpresa.Text, Familia,Articulo);
                     QLineas.FieldByName('Articulo_ls').AsString:=Articulo;
                     cFamilia.Properties.OnChange:=cFamiliaChange;
                     cArticulo.Properties.OnChange:=cArticuloChange;

                     if not LupaLotes(QMaestro.FieldByName('Empresa_cs').AsString,
                                      QMaestro.FieldByName('Cliente_cs').AsString,
                                      cFamilia.Text,
                                      cArticulo.Text,'','') then
                     begin
                          cLote.OnExit:=Nil;
                          cLote.SetFocus;
                          cLote.OnExit:=cLoteExit;
                     end;
                end;
           end;
     end
     else
     begin
          MessageDlg (Chr(13) + 'Borre el lote para seleccionar familia/artículo', mtError,[mbOk],0);
          cLote.SetFocus;
     end;
end;

//-------------------------- LUPA (F2) DE ARTICULOS ----------------------------
procedure TSalidas.cArticuloKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaArticulosClick(Self);
end;

//-------------------------- CLICK EN LA FAMILIA -------------------------------
procedure TSalidas.cFamiliaClick(Sender: TObject);
begin
     //Si hay lote y podemos modificar la familia porque estamos Insertando
     if (cLote.Text<>'') and (cFamilia.TabStop) then
        MessageDlg (Chr(13) + 'Borre el lote para seleccionar familia/artículo', mtError,[mbOk],0);
end;

//-------------------------- CLICK EN EL ARTICULO ------------------------------
procedure TSalidas.cArticuloClick(Sender: TObject);
begin
     //Si hay lote y podemos modificar el articulo porque estamos Insertando
     if (cLote.Text<>'') and (cArticulo.TabStop) then
        MessageDlg (Chr(13) + 'Borre el lote para seleccionar familia/artículo', mtError,[mbOk],0);
end;

//-------- COMPRUEBA SI EL LOTE YA EXISTE EN OTRA LINEA DEL MISMO ALBARAN ------
function TSalidas.ComprobarLoteRepetido(Empresa,  Lote: String; Albaran: Integer): Boolean;
Var
   QAux: TQuery;
begin
     Result:=False;
     QAux:=TQuery.Create(nil);
     try
        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

        //Leemos el valor del stock y el del importe pendiente de pagar
        QAux.SQL.Clear;
        QAux.SQL.Add(' SELECT * ' +
                     ' FROM LINEA_SALIDAS ' +
                     ' WHERE EMPRESA_LS=' + QuotedStr(Empresa) +
                     ' AND ALBARAN_LS=' + IntToStr(Albaran) +
                     ' AND LOTE_LS=' + QuotedStr(Lote));
        QAux.Open;
        if not QAux.IsEmpty() then
           Result:=False
        else
            Result:=True;
        QAux.Close;
     finally
            QAux.Close;
            FreeAndNil(QAux);
     end;
end;

//----------------------- AL ENTRAR EN EL LOTE ---------------------------------
procedure TSalidas.cLoteEnter(Sender: TObject);
begin
     //Si hay lote
     if cLote.Text<>'' then
     begin
          //Si no se puede entrar en el lote -> Estamos modificando y no se puede cambiar lote, familia, articulo
          if not cLote.TabStop then
             cBultos.SetFocus   //Foco en Bultos
          else
              cLote.SetFocus;   //Foco en Lote
     end;
end;

//----------------------- AL ENTRAR EN LA FAMILIA ------------------------------
procedure TSalidas.cFamiliaEnter(Sender: TObject);
begin
     //Si hay lote
     if (cLote.Text<>'') then
     begin
          //Si no se puede entrar en el lote -> Estamos modificando y no se puede cambiar lote, familia, articulo
          if not cFamilia.TabStop then
             cBultos.SetFocus   //Foco en Bultos
          else
              cLote.SetFocus;   //Foco en Lote
     end;
end;

//----------------------- AL ENTRAR EN EL ARTICULO -----------------------------
procedure TSalidas.cArticuloEnter(Sender: TObject);
begin
     //Si hay lote
     if cLote.Text<>'' then
     begin
          //Si no se puede entrar en el lote -> Estamos modificando y no se puede cambiar lote, familia, articulo
          if not cArticulo.TabStop then
             cBultos.SetFocus   //Foco en Bultos
          else
              cLote.SetFocus;   //Foco en Lote
     end;
end;

//----------------------- AL ENTRAR EN LA CAMARA -------------------------------
procedure TSalidas.cCamaraEnter(Sender: TObject);
begin
     cCamara.Color:=clMoneyGreen;
     //Si hay lote
     if cLote.Text<>'' then
     begin
          //Si no se puede entrar en la camara -> Estamos modificando y no se puede cambiar lote, familia, articulo
          if not cCamara.TabStop then
             cBultos.SetFocus;   //Foco en Bultos
     end;
end;

//----------------------- AL ENTRAR EN LA ZONA ---------------------------------
procedure TSalidas.cZonaEnter(Sender: TObject);
begin
     cZona.Color:=clMoneyGreen;
     //Si hay lote
     if cLote.Text<>'' then
     begin
          //Si no se puede entrar en la zona -> Estamos modificando y no se puede cambiar lote, familia, articulo
          if not cZona.TabStop then
             cBultos.SetFocus;   //Foco en Bultos
     end;
end;

//-------------------------- ANTES DE GRABAR UNA LINEA -------------------------
procedure TSalidas.QLineasBeforePost(DataSet: TDataSet);
begin
     QLineas.FieldByName('Fecha_Modif_ls').AsString:=AnyoMesDia(Date());
end;

//------------------------ CONTROL DE TECLAS EN EL TIPO DE SALIDA --------------
procedure TSalidas.cTipoSalidaKeyPress(Sender: TObject; var Key: Char);
Var
   Pulsacion: char;
begin
     Pulsacion:=UpCase(Key);
     if (Pulsacion='N') or (Pulsacion='R') or (Pulsacion='D') then
     begin
          if not (QMaestro.State in dsEditModes) then  //Si estamos visualizando
             if Pulsacion<>cTipoSalida.KeyValue then  //Si cambiamos el codigo entonces ponemos en edicion
                QMaestro.Edit;
          if QMaestro.State in dsEditModes then  //Si estamos modificando o insertando
             QMaestro.FieldByName('tipo_salida_cs').AsString:=Pulsacion;
     end;
     Key:=#0;
end;

//------------ AL RECIBIR EL FOCO EL TIPO DE SALIDA ----------------------------
procedure TSalidas.cTipoSalidaEnter(Sender: TObject);
begin
     //Si el tipo de salida no se puede cambiar pasamos el foco a otro campo
     if cTipoSalida.ReadOnly then
        cOrden.SetFocus;
end;

//----------------- AL ENTRAR EN UNIDADES --------------------------------------
procedure TSalidas.cUnidadesEnter(Sender: TObject);
begin
     cUnidades.OnExit:=cUnidadesExit;
end;

//---------------------- AL ACTIVAR EL FORMULARIO ------------------------------
procedure TSalidas.FormActivate(Sender: TObject);
begin
     if PanelClaves.Enabled then
        cAlbaran.SetFocus;
end;

//------------------- AL SALIR DE BULTOS ---------------------------------------
procedure TSalidas.cBultosExit(Sender: TObject);
begin
     if QLineas.State in dsEditModes then
     begin
          //Si el campo esta vacio se pone a CERO
          if cBultos.Text='' then
             QLineas.FieldByName('Bultos_ls').AsInteger:=0;
          cBultos.Color:=clWindow;   
     end;
end;

//------------------- AL SALIR DE PALETS ---------------------------------------
procedure TSalidas.cPaletsExit(Sender: TObject);
begin
     if QLineas.State in dsEditModes then
     begin
          //Si el campo esta vacio se pone a CERO
          if cPalets.Text='' then
             QLineas.FieldByName('Palets_ls').AsInteger:=0;
          cPalets.Color:=clWindow;   
     end;
end;

//------------------- AL SALIR DE ESTUCHES -------------------------------------
procedure TSalidas.cEstuchesExit(Sender: TObject);
begin
     if QLineas.State in dsEditModes then
     begin
          //Si el campo esta vacio se pone a CERO
          if cEstuches.Text='' then
             QLineas.FieldByName('Estuches_Sueltos_ls').AsInteger:=0;
          cEstuches.Color:=clWindow;
     end;
end;

//--------------- CALCULA EL NUMERO DE LINEAS DE UN ALBARAN DE SALIDA ----------
function TSalidas.NLineasAlbaran(Empresa: String; Albaran: Integer):Integer;
Var
   QAux: TQuery;
begin
     Result:=0;
     QAux:=TQuery.Create(nil);
     try
        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

        QAux.SQL.Clear;
        QAux.SQL.Add(' SELECT COUNT(*) AS LINEAS ' +
                     ' FROM LINEA_SALIDAS ' +
                     ' WHERE EMPRESA_LS=' + QuotedStr(Empresa) +
                     ' AND ALBARAN_LS=' + IntToStr(Albaran));
        QAux.Open;
        if not QAux.IsEmpty() then
           Result:=QAux.FieldByName('Lineas').AsInteger;
        QAux.Close;
     finally
            QAux.Close;
            FreeAndNil(QAux);
     end;
end;

procedure TSalidas.LupaZonaClick(Sender: TObject);
begin
     cZona.SetFocus;
     LupaCamaraZona();
end;

procedure TSalidas.LupaCamaraClick(Sender: TObject);
begin
     cCamara.SetFocus;
     LupaCamaraZona();
end;

procedure TSalidas.cCamaraKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        LupaCamaraZona();
end;

procedure TSalidas.LupaCamaraZona();
Var
   Aux: TBusquedaCamaraZona;
   Camara, Zona: String;
   MostrarLotes: TModalResult;
begin
     try
        Aux:=TBusquedaCamaraZona.Create(Self);
        Aux.cCamaraBus.Text:=cCamara.Text;
        Aux.cZonaBus.Text:=cZona.Text;
        Aux.ShowModal;
        Camara:=Aux.cCamaraBus.Text;
        Zona:=Aux.cZonaBus.Text;
        MostrarLotes:=Aux.ModalResult;
     finally
            FreeAndNil(Aux);
     end;
     if MostrarLotes=mrOk then
        LupaLotes(QMaestro.FieldByName('Empresa_cs').AsString,
                  QMaestro.FieldByName('Cliente_cs').AsString,
                  '','',
                  Camara,
                  Zona);
end;

procedure TSalidas.cTemperaturaExit(Sender: TObject);
begin
     if QMaestro.State in dsEditModes then
     begin
          if cTemperatura.Text<>'' then
          begin
               if (StrToInt(cTemperatura.Text) < -99) or (StrToInt(cTemperatura.Text) > 99) then
               begin
                    MessageDlg (Chr(13) + 'Temperatura fuera de rango', mtError,[mbOk],0);
                    cTemperatura.SetFocus;
                    cTemperatura.SelectAll;
               end;
          end;
     end;
end;

procedure TSalidas.cFechaAlbaranDblClick(Sender: TObject);
var
  sAux: string;
  bPuedoModificar: boolean;
begin
  if QMaestro.FieldByName('Fecha_Factura_cs').AsString<>'' then
  Begin
     bPuedoModificar:= MessageDlg (Chr(13) + 'Albarán ya facturado, ¿seguro que quiere modificarlo?.', mtError,[mbYes,mbNo ],0) = mrYes;
  end
  else
  begin
     bPuedoModificar:= True;
  end;

  if bPuedoModificar then
  begin
    sAux:= cFechaAlbaran.Text;
    if InputQuery('Cambiar fecha de salida.','Introduzca fecha (dd/mm/aaaa)', sAux ) then
    begin
      if EsFecha( sAux ) then
        cFechaAlbaran.Text:= sAux
      else
        ShowMessage('Fecha no valida.');
    end;
  end;
end;

end.


