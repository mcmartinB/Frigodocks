unit FEntradas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ActnMan, ActnCtrls, ExtCtrls, StdCtrls, ComCtrls, DB,
  DBTables, Mask, DBCtrls, Buttons, nbEdits, Grids, DBGrids, ImgList, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlue, dxCore, cxDateUtils, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, cxDBEdit, Menus, cxButtons, SimpleSearch,
  dxSkinsdxBarPainter, dxBar, cxClasses, cxCalc, cxCurrencyEdit;

type
  TEntradas = class(TForm)
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
    QLineasempresa_le: TStringField;
    QLineasalbaran_le: TIntegerField;
    QLineasarticulo_le: TStringField;
    QLineaslote_le: TStringField;
    QLineasbultos_le: TIntegerField;
    QLineasunidades_le: TFloatField;
    QLineascamara_le: TSmallintField;
    QLineaszona_le: TStringField;
    QLineasmanejo_le: TStringField;
    QLineaspalets_le: TIntegerField;
    QLineasestuches_bulto_le: TSmallintField;
    QLineasestuches_sueltos_le: TSmallintField;
    PanelCabecera: TPanel;
    StaticText13: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText6: TStaticText;
    tNomcliente: TPanel;
    StaticText5: TStaticText;
    StaticText7: TStaticText;
    StaticText11: TStaticText;
    StaticText16: TStaticText;
    StaticText17: TStaticText;
    cTrasportista: TcxDBTextEdit;
    cMatricula: TcxDBTextEdit;
    cProcedencia: TcxDBTextEdit;
    cObservacion: TcxDBTextEdit;
    cReferencia: TcxDBTextEdit;
    cCliente: TcxDBTextEdit;
    cTipoEntrada: TDBLookupComboBox;
    cTemperatura: TcxDBTextEdit;
    cHora: TMaskEdit;
    QLineasfamilia_le: TStringField;
    QTiposEntrada: TQuery;
    QTiposEntradacodigo_te: TStringField;
    PanelInsertarLinea: TPanel;
    cFamilia: TcxDBTextEdit;
    cArticulo: TcxDBTextEdit;
    cBultos: TcxDBTextEdit;
    cEstBulto: TcxDBTextEdit;
    cEstSueltos: TcxDBTextEdit;
    cPalets: TcxDBTextEdit;
    cLote: TcxDBTextEdit;
    cCamara: TcxDBTextEdit;
    cZona: TcxDBTextEdit;
    cManejo: TcxDBTextEdit;
    tNomFamilia: TPanel;
    tNomArticulo: TPanel;
    QFamilias: TQuery;
    StaticText14: TStaticText;
    StaticText15: TStaticText;
    Caducidad: TStaticText;
    StaticText19: TStaticText;
    StaticText20: TStaticText;
    StaticText21: TStaticText;
    StaticText22: TStaticText;
    StaticText23: TStaticText;
    StaticText24: TStaticText;
    StaticText25: TStaticText;
    StaticText26: TStaticText;
    StaticText27: TStaticText;
    DSTiposEntrada: TDataSource;
    StaticText18: TStaticText;
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
    QAlmacenesestuches_bulto_al: TSmallintField;
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
    cFechaCaducidad: TcxDateEdit;
    QAlmacenesfecha_entrada_al: TStringField;
    QAlmacenesfecha_caducidad_al: TStringField;
    cFechaAlbaran: TcxDateEdit;
    QMaestroempresa_ce: TStringField;
    QMaestroalbaran_ce: TIntegerField;
    QMaestrocliente_ce: TStringField;
    QMaestrofecha_albaran_ce: TStringField;
    QMaestroimporte_entrada_ce: TFloatField;
    QMaestrohoras_entrada_ce: TFloatField;
    QMaestronumero_factura_ce: TIntegerField;
    QMaestrotemperatura_ce: TSmallintField;
    QMaestroconcepto_ce: TStringField;
    QMaestrotipo_entrada_ce: TStringField;
    QMaestrotransportista_ce: TStringField;
    QMaestromatricula_ce: TStringField;
    QMaestroprocedencia_ce: TStringField;
    QMaestroobservaciones_ce: TStringField;
    QMaestroconcepto2_ce: TStringField;
    QMaestrohora_ce: TStringField;
    QMaestrofecha_factura_ce: TStringField;
    QTiposEntradadescripcion_te: TStringField;
    QTiposEntradades: TStringField;
    QLineascaducidad_le: TStringField;
    QLineasCaducidad: TStringField;
    QAlmacenesestuches_totales_al: TIntegerField;
    QAlmacenesfecha_modif_al: TStringField;
    QMaestrofecha_modif_ce: TStringField;
    QLineasfecha_modif_le: TStringField;
    StaticText28: TStaticText;
    cRefCliente_: TcxDBTextEdit;
    QMaestroref_cliente_ce: TStringField;
    cLupaEmpresas: TSimpleSearch;
    cLupaClientes: TSimpleSearch;
    LupaFamilia: TSimpleSearch;
    LupaArticulo: TSimpleSearch;
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
    cUnidades: TcxDBCurrencyEdit;
    StaticText29: TStaticText;
    cLoteOrigen: TcxDBTextEdit;
    QLineaslote_origen_le: TStringField;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);

    procedure Timer1Timer(Sender: TObject);

    procedure Alta(Sender: TObject);
    procedure Borrar(Sender: TObject);
    procedure Aceptar(Sender: TObject);
    procedure Cancelar(Sender: TObject);
    procedure Salir(Sender: TObject);

    procedure Primero(Sender: TObject);
    procedure Anterior(Sender: TObject);
    procedure Siguiente(Sender: TObject);
    procedure Ultimo(Sender: TObject);

    procedure BBorrarLinea(Sender: TObject);
    procedure BAltaLinea(Sender: TObject);

    procedure BImprimirClick(Sender: TObject);

    procedure BPrimeroLClick(Sender: TObject);
    procedure BAnteriorLClick(Sender: TObject);
    procedure BSiguienteLClick(Sender: TObject);
    procedure BUltimoLClick(Sender: TObject);

    procedure PanelClavesExit(Sender: TObject);

    procedure DSMaestroStateChange(Sender: TObject);
    procedure AlMoverRegistro(DataSet: TDataSet);
    procedure Busqueda(Sender: TObject);


    procedure ColorEnter(Sender: TObject);
    procedure ColorExit(Sender: TObject);
    procedure ColorExitSinCeros(Sender: TObject);

    procedure cEmpresaChange(Sender: TObject);
    procedure cClienteChange(Sender: TObject);

    procedure cFechaExit(Sender: TObject);
    procedure SinSignos(Sender: TObject; var Key: Char);
    procedure cFamiliaExit(Sender: TObject);
    procedure cArticuloExit(Sender: TObject);
    procedure cLoteExit(Sender: TObject);
    procedure cTemperaturaExit(Sender: TObject);
    procedure cImporteExit(Sender: TObject);
    procedure cHorasFacturarExit(Sender: TObject);

    procedure QMaestroBeforeEdit(DataSet: TDataSet);
    procedure QMaestroBeforePost(DataSet: TDataSet);
    procedure QMaestroBeforeClose(DataSet: TDataSet);
    procedure QMaestroAfterCancel(DataSet: TDataSet);
    procedure QMaestroAfterEdit(DataSet: TDataSet);
    procedure QMaestroAfterInsert(DataSet: TDataSet);
    procedure QMaestroAfterOpen(DataSet: TDataSet);
    procedure QMaestroAfterPost(DataSet: TDataSet);

    procedure QLineasBeforePost(DataSet: TDataSet);
    procedure QLineasBeforeInsert(DataSet: TDataSet);
    procedure QLineasBeforeEdit(DataSet: TDataSet);
    procedure QLineasCalcFields(DataSet: TDataSet);

    procedure QTiposEntradaCalcFields(DataSet: TDataSet);

    procedure DSMaestroDataChange(Sender: TObject; Field: TField);

    procedure cLupaEmpresasClick(Sender: TObject);
    procedure cLupaClientesClick(Sender: TObject);
    procedure LupaFamiliaClick(Sender: TObject);
    procedure LupaArticuloClick(Sender: TObject);

    procedure CompruebaFecha(Sender: TObject);

    procedure cFechaChange(Sender: TObject);
    procedure cFechaAlbaranEnter(Sender: TObject);
    procedure cFechaAlbaranChange(Sender: TObject);

    procedure cUnidadesExit(Sender: TObject);

    procedure cArticuloEnter(Sender: TObject);
    procedure cArticuloKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cArticuloChange(Sender: TObject);

    procedure cFamiliaEnter(Sender: TObject);
    procedure cFamiliaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cFamiliaChange(Sender: TObject);

    procedure cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cEmpresaExit(Sender: TObject);

    procedure cClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cClienteExit(Sender: TObject);

    procedure cTipoEntradaKeyPress(Sender: TObject; var Key: Char);
    procedure cTipoEntradaEnter(Sender: TObject);

    procedure cManejoEnter(Sender: TObject);
    procedure cManejoExit(Sender: TObject);

    procedure cHoraEnter(Sender: TObject);
    procedure cHoraExit(Sender: TObject);
    procedure cHoraChange(Sender: TObject);

    procedure cBultosExit(Sender: TObject);
    procedure cEstBultoExit(Sender: TObject);

    procedure cEstSueltosExit(Sender: TObject);

    procedure cPaletsChange(Sender: TObject);
    procedure cPaletsExit(Sender: TObject);

    procedure GridLineasDblClick(Sender: TObject);

    function  ValidarLote(): Boolean;
    procedure cFechaAlbaranDblClick(Sender: TObject);

  private
    {Private declarations}
    bFreeEdit: Boolean;
    sEmpresa, sAlbaran, sCliente: string;
    //, sFecha

    SwAlta, Contabilizada: Boolean;
    PosRegistro, NRegistros: Integer;
    LoteToca, TipoEntradaAnt, EmpresaAnt, ClienteAnt, LLoteAnt: String;
    LFamiliaAnt, LArticuloAnt: String;
    AlbaranAnt, LBultosAnt, LEstuchesBultoAnt, LEstuchesSueltosAnt, LPaletsAnt: Integer;
    LUnidadesAnt: Real;
    FechaAnt: String;
    FechaCaducidadAnt: String;
    SQLWhere: String;

    procedure Mensaje(Texto: String );
    procedure BotonesPosicion;

    procedure ComprobarCliente();
    function  ComprobarAlbaran(): Boolean;

    function  ValidarClaves():Boolean;
    function  ValidarCabecera():Boolean;
    function  ValidarLinea():Boolean;

    function  EjecutaQuery(Empresa: String; Albaran: Integer):Boolean;
    function  EjecutaQueryMas():Boolean;
    function  EjecutaQueryBus(WhereBus: String):Boolean;

    procedure QuitarColorAlta();
    procedure PonerColorAlta();

    function  LeerNumeroAlbaran(Empresa: String):Integer;
    procedure EliminarAlbaran();
    function  LeerLote(Empresa, Cliente: String):String;

    procedure ActualizarClienteEdit(Empresa, FamiliaOld, ArticuloOld, FamiliaNew, ArticuloNew, Cliente: String; NUnidadesOld, NUnidadesNew: Real);
    procedure ActualizarClienteAdd(Empresa, Familia, Articulo, Cliente, Lote: String; NUnidades: Real);
    procedure ActualizarClienteDelete(Empresa, Familia, Articulo, Cliente: String; NUnidades: Real);

    procedure MercanciaRetenidaCliente(Empresa, Cliente: String);
    procedure InsertarAlmacen();
    procedure BorrarAlmacen(Empresa, Cliente, Lote: String);
    function  ComprobarManejo():Boolean;
    function  ComprobarEstuchesSueltos():Boolean;

    function  ExistenSalidas():Boolean;
    function  LineaConSalidas():Boolean;
    function  AlbaranConSalidas():Boolean;

    function  ClienteDeAlta():Boolean;
    function  TipoLoteA_B(Empresa: String; Albaran: Integer; Cliente: String):String;
    function  ComprobarStockLinea():Boolean;
    procedure ImprimirAlbaran(Empresa, Cliente, RefCliente: String; Albaran: Integer; Fecha: String);
    function  ComprobarHora(Hora: String):Boolean;
    procedure ModificarAlmacenes();
  public
    { Public declarations }
  end;

var
   Entradas: TEntradas;

implementation

uses UGLobal, MBaseDatos, DM, BAlmacenes, FPrincipal, BEntradas,
     LAlbaranEntrada, QuickRpt;

{$R *.dfm}

//------------------------ CREACION DEL FORMULARIO -----------------------------
procedure TEntradas.FormCreate(Sender: TObject);
begin
     Top:=1;
     Left:=0;

     SwAlta:=False;
     PosRegistro:=0;
     NRegistros:=0;

     cEmpresa.Text:=EmpresaGlobal;
     
     QMaestro.AfterScroll:=AlMoverRegistro;

     QFamilias.Open;
     QTiposEntrada.Open;

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
end;

//------------------------ CIERRE DEL FORMULARIO -------------------------------
procedure TEntradas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QArticulos.Close;
     QFamilias.Close;
     QTiposEntrada.Close;
     QContar.Close;
     QMaestro.Close;
     QLineas.Close;
     QAlmacenes.Close;

     Action:=caFree;
end;

//----------------------- CIERRRE DEL QUERY DEL FORMULARIO ---------------------
procedure TEntradas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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
procedure TEntradas.Mensaje(Texto: String );
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
procedure TEntradas.Timer1Timer(Sender: TObject);
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

//-------------- HABILITAR BOTONES DE POSICION DE REGISTRO ---------------------
procedure TEntradas.BotonesPosicion;
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

//--------------------- BOTON ALTA DE ALBARAN ----------------------------------
procedure TEntradas.Alta(Sender: TObject);
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

     cFechaAlbaran.Properties.OnChange:=nil;
     cFechaAlbaran.Text:='';
     cFechaAlbaran.Properties.OnChange:=cFechaAlbaranChange;

     //Habilito los campos que puedan estar deshabilitados
     cCliente.Properties.ReadOnly:=False;
     cFechaAlbaran.Properties.ReadOnly:=False;
     cTipoEntrada.ReadOnly:=False;

     cCliente.TabStop:=True;
     cFechaAlbaran.TabStop:=True;
     cTipoEntrada.TabStop:=True;

     cCliente.Style.Font.Color:=clBlack;
     cFechaAlbaran.Style.Font.Color:=clBlack;
     cTipoEntrada.Font.Color:=clBlack;

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

     //Colocamos el numero del albaran
     if (Length(cEmpresa.Text)>0) and (cAlbaran.Text='') then
     begin
          cAlbaran.Text:=IntToStr(LeerNumeroAlbaran(cEmpresa.Text));
          if cAlbaran.Text='0' then
             cEmpresa.SetFocus;
     end;
end;

//--------------------- BOTON BORRAR -------------------------------------------
procedure TEntradas.Borrar(Sender: TObject);
begin
    {CARMEN!!
     if QMaestro.FieldByName('Fecha_Factura_ce').AsString<>'' then
        MessageDlg (Chr(13) + 'No puede borrar un albarán ya facturado', mtError,[mbOk],0)
     else
     }
     if AlbaranConSalidas() then
             MessageDlg (Chr(13) + 'No puede borrar un albarán con salidas', mtError,[mbOk],0)
     else
     begin
          if MessageBox(Handle, PChar('Va a borrarse el albarán ¿Está seguro?'),
                        PChar(Self.Caption),
                        MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1)=IDYES then
             EliminarAlbaran();
     end;
end;

//---------------------- BORRADO DE UN ALBARAN ---------------------------------
procedure TEntradas.EliminarAlbaran();
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

                if not DMBaseDatos.BDFrigo.InTransaction then
                   DMBaseDatos.BDFrigo.StartTransaction;

                QLineas.First;
                while not QLineas.Eof do
                begin
                     //Actualizamos el valor del stock y el de mercancia retenida del cliente
                     ActualizarClienteDelete(QMaestro.FieldByName('Empresa_ce').AsString,
                                             QLineas.FieldByName('Familia_le').AsString,
                                             QLineas.FieldByName('Articulo_le').AsString,
                                             QMaestro.FieldByName('Cliente_ce').AsString,
                                             QLineas.FieldByName('Unidades_le').AsFloat);
                     //Borramos al almacen relacionado
                     BorrarAlmacen(QMaestro.FieldByName('Empresa_ce').AsString,
                                   QMaestro.FieldByName('Cliente_ce').AsString,
                                   QLineas.FieldByName('Lote_le').AsString);

                     Qlineas.Next;
                end;

                //Borrado de las lineas
                QAux.Close;
                QAux.SQL.Clear;
                QAux.SQL.Add(' DELETE FROM LINEA_ENTRADAS ' +
                             ' WHERE EMPRESA_LE=' + QuotedStr(QMaestro.FieldByName('EMPRESA_CE').AsString) +
                             ' AND ALBARAN_LE=' + IntToStr(QMaestro.FieldByName('ALBARAN_CE').AsInteger));
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

//-------------------------- PRIMER REGISTRO -----------------------------------
procedure TEntradas.Primero(Sender: TObject);
begin
     PosRegistro:=1;          //Numero de registro en el que estamos
     QMaestro.First;
     BotonesPosicion();
end;

//-------------------------- REGISTRO ANTERIOR ---------------------------------
procedure TEntradas.Anterior(Sender: TObject);
begin
     if PosRegistro>1 then
        Dec(PosRegistro);        //Numero de registro en el que estamos
     QMaestro.Prior;
     BotonesPosicion();
end;

//-------------------------- REGISTRO SIGUIENTE --------------------------------
procedure TEntradas.Siguiente(Sender: TObject);
begin
     if PosRegistro<NRegistros then
        Inc(PosRegistro);       //Numero de registro en el que estamos
     QMaestro.Next;
     BotonesPosicion();
end;

//-------------------------- ULTIMO REGISTRO -----------------------------------
procedure TEntradas.Ultimo(Sender: TObject);
begin
     PosRegistro:=NRegistros; //Numero de registro en el que estamos
     QMaestro.Last;
     BotonesPosicion();
end;

//----------------------------- BUSQUEDA ---------------------------------------
procedure TEntradas.Busqueda(Sender: TObject);
Var
   Aux: TBusquedaEntradas;
begin
     try
        Aux:=TBusquedaEntradas.Create(Self);
        with Aux do
        begin
             ShowModal;
             if (EmpresaBus<>'') and (AlbaranBus<>0) then   //Seleccionamos un registro del grid resultado
             begin
                  Application.ProcessMessages;
                  if EjecutaQuery(EmpresaBus, AlbaranBus) then
                  begin
                       Self.PanelClaves.Enabled:=False;
                       Self.PanelLineas.Enabled:=True;
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
procedure TEntradas.Aceptar(Sender: TObject);
var
  loteOrigenAnterior: String;
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

                     if EjecutaQueryMas() then
                     begin
                          PanelClaves.Enabled:=False;
                          PanelLineas.Enabled:=True;
                     end;

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

                     QMaestro.Close;
                     EjecutaQuery(cEmpresa.Text, StrToInt(cAlbaran.Text));

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

                             QMaestro.Close;
                             QMaestro.Open;
                        end;
             end;
         end;
    end
    else   //LINEAS
    begin
         cManejo.OnExit:=Nil;

         //Si el campo esta vacio se pone a CERO
         if cBultos.Text='' then
            QLineas.FieldByName('Bultos_le').AsInteger:=0;
         if cEstBulto.Text='' then
            QLineas.FieldByName('Estuches_Bulto_le').AsInteger:=0;
         if cPalets.Text='' then
            QLineas.FieldByName('Palets_le').AsInteger:=0;
         if cEstSueltos.Text='' then
            QLineas.FieldByName('Estuches_Sueltos_le').AsInteger:=0;

         if ValidarLinea() then   //Comprobamos que los datos de la linea son correctos
         begin
              try
                 if not DMBaseDatos.BDFrigo.InTransaction then
                    DMBaseDatos.BDFrigo.StartTransaction;
                 if QLineas.State=dsInsert then      //INSERTAR LINEA
                 begin
                      //Actualizmos el Valor del Stock del cliente y el de mercacia retenida, e incrementa el numerador de lotes si corresponde
                      ActualizarClienteAdd(QMaestro.FieldByName('Empresa_ce').AsString,
                                           QLineas.FieldByName('Familia_le').AsString,
                                           QLineas.FieldByName('Articulo_le').AsString,
                                           QMaestro.FieldByName('Cliente_ce').AsString,
                                           QLineas.FieldByName('Lote_le').AsString,
                                           QLineas.FieldByName('Unidades_le').AsFloat);
                      InsertarAlmacen();

                      QLineas.Post;
                      if QMaestro.Database.InTransaction then
                         DMBaseDatos.BDFrigo.Commit;

                      loteOrigenAnterior := QLineas.FieldByName('lote_origen_le').AsString;

                      //Para actualizar el Grid
                      QLineas.Close;
                      QLineas.Open;

                      //----------------- NUEVA ALTA --------------------------------
                      QLineas.Insert;

                      cManejo.OnExit:=Nil;
                      cArticulo.SetFocus;
                      cManejo.OnExit:=cManejoExit;

                      //------------------------ DATOS DE LA LINEA POR DEFECTO ------
                      QLineas.FieldByName('Empresa_le').AsString:=QMaestro.FieldByName('Empresa_ce').AsString;
                      QLineas.FieldByName('Albaran_le').AsInteger:=QMaestro.FieldByName('Albaran_ce').AsInteger;
                      //Valores por defecto
                      QLineas.FieldByName('Bultos_le').AsInteger:=0;
                      QLineas.FieldByName('Estuches_bulto_le').AsInteger:=0;
                      QLineas.FieldByName('Estuches_sueltos_le').AsInteger:=0;
                      QLineas.FieldByName('Unidades_le').AsInteger:=0;
                      QLineas.FieldByName('Palets_le').AsInteger:=0;
                      LoteToca:=LeerLote(QMaestro.FieldByName('Empresa_ce').AsString,
                                         QMaestro.FieldByName('Cliente_ce').AsString);
                      QLineas.FieldByName('Lote_le').AsString:=LoteToca;
                      QLineas.FieldByName('Manejo_le').AsString:='1';

                      if loteOrigenAnterior <> '' then
                         QLineas.FieldByName('lote_origen_le').asString := loteOrigenAnterior;
                      //------------------------ DATOS DE LA LINEA POR DEFECTO ------
                 end
                 else  //MODIFICAR LINEA
                 begin
                      if LineaConSalidas() then
                         if not ComprobarStockLinea() then
                            Exit;

                      QLineas.Post;
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
              except
                    On E:Exception do
                         begin
                             CapturaErrores(E);
                             if DMBaseDatos.BDFrigo.InTransaction then
                                DMBaseDatos.BDFrigo.Rollback;
                         end;
              end;
              cManejo.OnExit:=cManejoExit;
         end;
    end;
    BotonesPosicion();
end;

//--------------------- BOTON CANCELAR -----------------------------------------
procedure TEntradas.Cancelar(Sender: TObject);
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

                           //Habilito los campos que puedan estar deshabilitados
                           cCliente.Properties.ReadOnly:=False;
                           cLupaClientes.Enabled:=True;
                           cFechaAlbaran.Properties.ReadOnly:=False;
                           cTipoEntrada.ReadOnly:=False;

                           cCliente.TabStop:=True;
                           cFechaAlbaran.TabStop:=True;
                           cTipoEntrada.TabStop:=True;

                           cCliente.Style.Font.Color:=clBlack;
                           cFechaAlbaran.Style.Font.Color:=clBlack;
                           cTipoEntrada.Font.Color:=clBlack;

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

                           cEmpresa.Text:=EmpresaGlobal;
                           cAlbaran.Text:='';
                           cAlbaran.SetFocus;

                           cLupaClientes.Enabled:=False;

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
          //Estos campos no estan enganchados a BD
          cFechaCaducidad.Text:=FechaCaducidadAnt;

          Imprimir:=False;
          if QLineas.State=dsInsert then
             Imprimir:=True;

          QLineas.Cancel;

          //Habilito lo que puede estar deshabilitado
          cFAmilia.Enabled:=True;
          cArticulo.Enabled:=True;
          cEstBulto.Enabled:=True;

          PanelInsertarLinea.Visible:=False;
          PanelClaves.Enabled:=False;
          PanelCabecera.Enabled:=True;
          PanelLineas.Enabled:=True;

          //Si el albaran no tiene lineas preguntamos si lo borramos
          if QLineas.IsEmpty then
          begin
               if MessageBox(Handle, PChar('Albarán sin líneas.' + chr(13) + '¿Desea eliminarlo?'),
                             PChar(Self.Caption),
                             MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1)=IDYES then
                  EliminarAlbaran();
          end
          else if Imprimir then
                  ImprimirAlbaran(QMaestro.FieldByName('Empresa_ce').AsString,
                                  QMaestro.FieldByName('Cliente_ce').AsString,
                                  QMaestro.FieldByName('ref_cliente_ce').AsString,
                                  QMaestro.FieldByName('Albaran_ce').AsInteger,
                                  DiaMesAnyo(QMaestro.FieldByName('Fecha_Albaran_ce').AsString));
          BotonesPosicion();
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

          cEmpresa.Text:=EmpresaGlobal;
          cAlbaran.Text:='';
          cAlbaran.SetFocus;

          //Habilito los campos que puedan estar deshabilitados
          cCliente.Properties.ReadOnly:=False;
          cLupaClientes.Enabled:=True;
          cFechaAlbaran.Properties.ReadOnly:=False;
          cTipoEntrada.ReadOnly:=False;

          cCliente.TabStop:=True;
          cFechaAlbaran.TabStop:=True;
          cTipoEntrada.TabStop:=True;

          cCliente.Style.Font.Color:=clBlack;
          cFechaAlbaran.Style.Font.Color:=clBlack;
          cTipoEntrada.Font.Color:=clBlack;

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

          cEmpresa.Text:=EmpresaGlobal;
          cAlbaran.Text:='';
          cAlbaran.SetFocus;

          //Habilito los campos que puedan estar deshabilitados
          cCliente.Properties.ReadOnly:=False;
          cLupaClientes.Enabled:=True;
          cFechaAlbaran.Properties.ReadOnly:=False;
          cTipoEntrada.ReadOnly:=False;


          cCliente.TabStop:=True;
          cFechaAlbaran.TabStop:=True;
          cTipoEntrada.TabStop:=True;

          cCliente.Style.Font.Color:=clBlack;
          cFechaAlbaran.Style.Font.Color:=clBlack;
          cTipoEntrada.Font.Color:=clBlack;

          PosRegistro:=0;
          NRegistros:=0;

          Mensaje('Cambios Ignorados');

          BotonesPosicion();
     end;
end;

//----------------------------- SALIR ------------------------------------------
procedure TEntradas.Salir(Sender: TObject);
begin
     Close;
end;

//-------------------------- VALIDACION DE DATOS CLAVE ----------------------
function TEntradas.ValidarClaves():Boolean;
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
function TEntradas.ValidarCabecera():Boolean;
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
     if not ComprobarHora(cHora.Text) then  //Hora
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'La hora es incorrecta', mtError,[mbOk],0);
          cHora.SetFocus;
          Exit;
     end;
     if Length(cTemperatura.Text)>0 then //Rango Temperatura
        if (StrToInt(cTemperatura.Text) < -99) or (StrToInt(cTemperatura.Text) > 99) then
        begin
             Result:=False;
             MessageDlg (Chr(13) + 'Temperatura fuera de rango', mtError,[mbOk],0);
             cTemperatura.SetFocus;
             cTemperatura.SelectAll;
             Exit;
        end;
     {//Correo Jose Maria de 06/09/2012 para utilizar campo Concepto como Observaciones
     if (QMaestro.FieldByName('Importe_Entrada_ce').AsFloat=0) and (QMaestro.FieldByName('Horas_Entrada_ce').AsFloat=0) and (cConcepto.Text<>'') then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'Sin importe ni horas no debe existir concepto', mtError,[mbOk],0);
          cConcepto.SetFocus;
          cConcepto.SelectAll;
          Exit;
     end;
     }
     Minutos:=StrToInt(RellenarCeros(ParteDecimal(QMaestro.FieldByName('horas_entrada_ce').AsFloat),2,'D'));
     if Minutos>59 then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'El rango de minutos en las horas de entrada es incorrecto', mtError,[mbOk],0);
          cHorasFacturar.SetFocus;
     end;
end;

//------------------- FOCO EN EL PANEL DE DATOS --------------------------------
procedure TEntradas.PanelClavesExit(Sender: TObject);
begin
     if QMaestro.IsEmpty then
     begin
          if ValidarClaves() then
          begin
               if not SwAlta then  //Si no es alta
               begin
                    if not EjecutaQuery(cEmpresa.Text, StrToInt(cAlbaran.Text)) then   //Si no hay datos
                    begin
                         cAlbaran.SetFocus;
                         Mensaje('El registro no existe');
                         cLupaClientes.Enabled:=False;
                    end
                    else  //Si hay datos
                    begin
                         PanelClaves.Enabled:=False;
                         PanelLineas.Enabled:=True;
                        // cLupaClientes.Enabled:=True;
                    end;
               end
               else
               begin
                    //No existe -> Hacemos el alta
                    if not EjecutaQuery(cEmpresa.Text, StrToInt(cAlbaran.Text)) then   //Si no hay datos
                    begin
                         PanelClaves.Enabled:=False;
                         PanelLineas.Enabled:=False;
                         cLupaClientes.Enabled:=True;

                         QMaestro.append;
                         Mensaje('Alta de registro');
                         BAceptar.Enabled:=True;
                    end
                    else  //El registro ya existe
                    begin
                         Mensaje('El registro ya existe');
                         QMaestro.Close;
                         BarraEstado.Panels[1].Text:='';
                         cAlbaran.SetFocus;
                         cLupaClientes.Enabled:=False;
                    end;
               end;
           end;
     end;
end;

//------------------------ APERTURA DE LA QUERY PRINCIPAL ----------------------
function TEntradas.EjecutaQuery(Empresa: String; Albaran: Integer):Boolean;
begin
     Result:=False;
     NRegistros:=0;
     PosRegistro:=0;
     try
        //QLineas.Close;
        QMaestro.Close;
        QMaestro.SQL.Clear;
        QMaestro.SQL.Add(' SELECT * FROM CABECERA_ENTRADAS ');
        SQLWhere:=' WHERE (EMPRESA_CE=' + QuotedStr(Empresa) +
                  ' AND ALBARAN_CE=' + IntToStr(Albaran) + ') ';
        QMaestro.SQL.Add(SQLWhere);
        QMaestro.SQL.Add(' ORDER BY EMPRESA_CE, CLIENTE_CE, ALBARAN_CE, FECHA_ALBARAN_CE');
        QMaestro.Open;
        if QMaestro.IsEmpty then
           Result:=False
        else
        begin
             try    //Contamos los Registros
                With QContar do
                begin
                     QContar.Close;
                     QContar.SQL.Clear;
                     QContar.SQL.Add(' SELECT COUNT(*) AS NREGISTROS ' +
                                     ' FROM CABECERA_ENTRADAS ' +
                                      SQLWhere);
                     QContar.Open;
                     NRegistros:=QContar.FieldByName('NRegistros').AsInteger;  //Contamos los registros
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

//---------------- APERTURA DE LA QUERY PRINCIPAL DESDE LA BUSQUEDA-------------
function TEntradas.EjecutaQueryBus(WhereBus: String):Boolean;
begin
     Result:=False;
     NRegistros:=0;
     PosRegistro:=0;
     try
        SQLWhere:=WhereBus;

        QMaestro.Close;
        QMaestro.SQL.Clear;
        QMaestro.SQL.Add('SELECT * FROM CABECERA_ENTRADAS ' +
                         WhereBus +
                         ' ORDER BY EMPRESA_CE, CLIENTE_CE, ALBARAN_CE, FECHA_ALBARAN_CE');
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
                     SQL.Add('SELECT COUNT(*) AS NREGISTROS FROM CABECERA_ENTRADAS ' + WhereBus);
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

//---------------- APERTURA DE LA QUERY PRINCIPAL DESDE LA BUSQUEDA-------------
function TEntradas.EjecutaQueryMas():Boolean;
begin
     Result:=False;

     try

        SQLWhere:=SQLWhere + ' OR (EMPRESA_CE=' + QuotedStr(EmpresaAnt) + ' AND ALBARAN_CE=' + IntToStr(AlbaranAnt) + ') ';

        QMaestro.Close;
        QMaestro.SQL.Clear;
        QMaestro.SQL.Add('SELECT * FROM CABECERA_ENTRADAS ' +
                         SQLWhere +
                         ' ORDER BY EMPRESA_CE, CLIENTE_CE, ALBARAN_CE, FECHA_ALBARAN_CE');
        QMaestro.Open;
        if QMaestro.IsEmpty then
           Result:=False
        else
        begin
             QMaestro.Locate('Empresa_ce;Albaran_ce', VarArrayOf([EmpresaAnt,AlbaranAnt]),[]);
             Result:=True;
        end;
    except
          on E:Exception do
               CapturaErrores(E);
    end;
end;

//-------------------- EVENTO SCROLL -------------------------------------------
procedure TEntradas.AlMoverRegistro(DataSet: TDataSet);
begin
     if SwAlta=False then  //El estado es de visualizacion
     begin
          cEmpresa.Text:=QMaestro.FieldByName('EMPRESA_CE').AsString;  //No estan enganchados a BD y debemos asignarlos a mano
          cAlbaran.Text:=QMaestro.FieldByName('ALBARAN_CE').AsString;
          if QMaestro.FieldByName('HORA_CE').AsString<>'' then
          begin
               cHora.OnChange:=Nil;
               cHora.Text:=StringReplace(QMaestro.FieldByName('HORA_CE').AsString, ':', '',[rfReplaceAll]);
               cHora.OnChange:=cHoraChange;
          end;
          if QMaestro.FieldByName('FECHA_ALBARAN_CE').AsString<>'' then
          begin
               cFechaAlbaran.Properties.OnChange:=Nil;
               cFechaAlbaran.Text:=DiaMesAnyo(QMaestro.FieldByName('FECHA_ALBARAN_CE').AsString);
               cFechaAlbaran.Properties.OnChange:=cFechaAlbaranChange;
          end;
     end;
end;

//--------------------- CAMBIO DE ESTADO DEL DATA SOURCE -----------------------
procedure TEntradas.DSMaestroStateChange(Sender: TObject);
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

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TEntradas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     {
     if (Key=109) and BBorrar.Enabled then
     begin                    //Baja
          if not cTemperatura.Focused then
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

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TEntradas.FormKeyPress(Sender: TObject; var Key: Char);
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

//---------------------- DESPUES DE INSERTAR -----------------------------------
procedure TEntradas.QMaestroAfterInsert(DataSet: TDataSet);
Var
   Hour, Min, Sec, MSec: Word;
   Fecha: TDateTime;
begin
  bFreeEdit:= True;
     QMaestro.FieldByName('EMPRESA_CE').AsString:=cEmpresa.Text;
     QMaestro.FieldByName('ALBARAN_CE').AsString:=cAlbaran.Text;

     //Valores por defecto
     Fecha:=Now;
     QMaestro.FieldByName('Fecha_Albaran_ce').AsString:=AnyoMesDia(Fecha);
     cFechaAlbaran.Text:=datetostr(Fecha);
     DecodeTime(Fecha, Hour, Min, Sec, MSec);
     cHora.Text:=RellenarCeros(IntToStr(Hour),2,'I') + RellenarCeros(IntToStr(Min),2,'I') + RellenarCeros(IntToStr(Sec),2,'I'); //No esta enganchado
     QMaestro.FieldByName('Tipo_Entrada_ce').AsString:='N';
     QMaestro.FieldByName('Importe_Entrada_ce').AsFloat:=0;
     QMaestro.FieldByName('Horas_Entrada_ce').AsFloat:=0;
end;

//---------------------- PONE EL COLOR DE FOCO DE LOS CAMPOS CLAVES ------------
procedure TEntradas.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          if not SwAlta then
             TEdit(Sender).Color:=clMoneyGreen;
     end;
end;

//---------------------- QUITA EL COLOR DE FOCO DE LOS CAMPOS CLAVE ------------
procedure TEntradas.ColorExit(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          if not SwAlta then
            TEdit(Sender).Color:=clWindow;
          if Length(TEdit(Sender).Text)>0 then
             TEdit(Sender).Text:=RellenarCeros(TEdit(Sender).Text,TEdit(Sender).MaxLength,'I');
     end;
end;

//------ QUITA EL COLOR DE FOCO DE LOS CAMPOS CLAVE SIN RELLENAR SIN CEROS -----
procedure TEntradas.ColorExitSinCeros(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          if not SwAlta then
            TEdit(Sender).Color:=clWindow;
     end;
end;

//---------------------- QUITA EL COLOR DE ALTA DE LOS CAMPOS CLAVE ------------
procedure TEntradas.QuitarColorAlta();
begin
     cEmpresa.Color:=clWindow;
     cAlbaran.Color:=clWindow;
end;

//---------------------- PONE EL COLOR DE ALTA DE LOS CAMPOS CLAVE -------------
procedure TEntradas.PonerColorAlta();
begin
     cEmpresa.Color:=clYellow;
     cAlbaran.Color:=clYellow;
end;

//----------------------- CAMBIO DE LA EMPRESA ---------------------------------
procedure TEntradas.cEmpresaChange(Sender: TObject);
begin
     tNomEmpresa.Caption:=NomEmpresa(RellenarCeros(cEmpresa.Text, cEmpresa.MaxLength, 'I'));
end;

//--------------------- AL CAMBIAR EL CLIENTE ----------------------------------
procedure TEntradas.cClienteChange(Sender: TObject);
begin
     if QMaestro.State=dsEdit then  //MODIFICAR
     begin
          if ExistenSalidas() then
          begin
               MessageDlg (Chr(13) + 'Existen salidas y el cliente no puede cambiarse', mtError,[mbOk],0);
               cCliente.Properties.OnChange:=Nil;
               cCliente.Text:=ClienteAnt;
               cCliente.Properties.OnChange:=cClienteChange;
          end
          else
              tNomCliente.Caption:=NomCliente(cEmpresa.Text, RellenarCeros(cCliente.Text,cCliente.Properties.MaxLength,'I'))
     end
     else
         tNomCliente.Caption:=NomCliente(QMaestro.FieldByName('Empresa_ce').AsString,
                                         RellenarCeros(cCliente.Text,cCliente.Properties.MaxLength,'I'));
end;

//--------------------- AL CAMBIAR EL CLIENTE ----------------------------------
procedure TEntradas.cFechaChange(Sender: TObject);
begin
     if QMaestro.State=dsEdit then  //MODIFICAR
     begin
          if ExistenSalidas() then
          begin
               MessageDlg (Chr(13) + 'Existen salidas y la fecha no puede cambiarse', mtError,[mbOk],0);
               cFechaAlbaran.Properties.OnChange:=Nil;
               QMaestro.FieldByName('Fecha_Albaran_ce').AsString:=AnyoMesDia(FechaAnt);
               cFechaAlbaran.Properties.OnChange:=cFechaChange;
          end;
     end;
end;

//-------------------------- ANTES DE GRABAR -----------------------------------
procedure TEntradas.QMaestroBeforePost(DataSet: TDataSet);
Var
   Lote: String;
begin
     QMaestro.FieldByName('Cliente_ce').AsString:=RellenarCeros(cCliente.Text,cCliente.Properties.MaxLength,'I');
     QMaestro.FieldByName('Hora_ce').AsString:=Copy(cHora.Text,1,2) + ':' + Copy(cHora.Text,3,2) + ':' + Copy(cHora.Text,5,2);
     QMaestro.FieldByName('Fecha_Albaran_ce').AsString:=AnyoMesDia(cFechaAlbaran.Text);
     if cImporte.Text='' then
        QMaestro.FieldByName('importe_entrada_ce').AsFloat:=0
     else
         QMaestro.FieldByName('Importe_entrada_ce').AsFloat:=Redondear(QMaestro.FieldByName('Importe_entrada_ce').AsFloat,2);
     if cHorasFacturar.Text='' then
        QMaestro.FieldByName('horas_entrada_ce').AsFloat:=0
     else
         QMaestro.FieldByName('horas_entrada_ce').AsFloat:=Redondear(QMaestro.FieldByName('horas_entrada_ce').AsFloat,2);

     QMaestro.FieldByName('Fecha_Modif_ce').AsString:=AnyoMesDia(Date());

     //MODIFICACION

     if QMaestro.State=dsEdit then
     begin
          //Comprobamos si el cambio de Tipo de Entrada es posible
          if TipoEntradaAnt<>QMaestro.FieldByName('Tipo_entrada_ce').AsString then
          begin
               //Si pasamos de Tipo Importado a Tipo Normal
               if (TipoEntradaAnt='I') and ((QMaestro.FieldByName('Tipo_entrada_ce').AsString='N') or (QMaestro.FieldByName('Tipo_entrada_ce').AsString='R')) then
               begin
                    //Si hay algun lote Abandonado o Autotizado no podemos cambiar el tipo
                    Lote:=TipoLoteA_B(QMaestro.FieldByName('Empresa_ce').AsString,
                                      QMaestro.FieldByName('Albaran_ce').AsInteger,
                                      ClienteAnt);
                    if Lote<>'' then
                    begin
                         MessageDlg (Chr(13) + 'No es posible cambiar el Tipo de Entrada: el lote ' + Lote + ' tiene status de Autorizado o Abandonado', mtError,[mbOk],0);
                         QMaestro.FieldByName('Tipo_Entrada_ce').AsString:=TipoEntradaAnt;
                    end;
               end;
          end;
     end;


  //que no se puede modificar de la cabecera una vez facturado
  if not bFreeEdit then
  begin
    if ( sEmpresa <> QMaestro.FieldByName('empresa_ce').AsString ) or
       ( sAlbaran <> QMaestro.FieldByName('ALBARAN_CE').AsString ) or
       ( sCliente <> QMaestro.FieldByName('cliente_ce').AsString ) then
       //( sFecha <> QMaestro.FieldByName('FECHA_ALBARAN_CE').AsString ) then
    begin
      MessageDlg (Chr(13) + 'Albarán ya facturado, no se puede modificar ni la empresa, número albaran, cliente y fecha.', mtWarning,[mbOk],0);
      Abort;
    end;
  end;
end;

//------------------------- AL SALIR DE LA HORA LA COMPROBAMOS -----------------
procedure TEntradas.cHoraExit(Sender: TObject);
begin
     cHora.Color:=clWindow;
     if not ComprobarHora(cHora.Text) then
     begin
          MessageDlg (Chr(13) + 'La hora es incorrecta', mtError,[mbOk],0);
          cHora.SetFocus;
     end;
end;

//------------------ AL CAMBIAR LA HORA PONEMOS EN EDICION ---------------------
procedure TEntradas.cHoraChange(Sender: TObject);
begin
     if not (QMaestro.State in [dsEdit,dsInsert]) then
        QMaestro.Edit;
end;

//--------------------- ANTES DE MODIFICAR LA CABECERA -------------------------
procedure TEntradas.QMaestroBeforeEdit(DataSet: TDataSet);
begin
     PanelLineas.Enabled:=False;
     TipoEntradaAnt:=QMaestro.FieldByName('Tipo_entrada_ce').AsString;
     EmpresaAnt:=QMaestro.FieldByName('Empresa_ce').AsString;
     AlbaranAnt:=QMaestro.FieldByName('Albaran_ce').AsInteger;
     ClienteAnt:=QMaestro.FieldByName('Cliente_ce').AsString;
     FechaAnt:=DiaMesAnyo(QMaestro.FieldByName('Fecha_Albaran_ce').AsString);
end;

//--------------------- DESPUES DE MODIFICAR LA CABECERA -----------------------
procedure TEntradas.QMaestroAfterEdit(DataSet: TDataSet);
begin
  bFreeEdit:= QMaestro.FieldByName('Fecha_Factura_ce').AsString='';
  if not bFreeEdit then
  begin
    //MessageDlg (Chr(13) + 'Albarán ya facturado, recuerde que no puede modificar ni la empresa, número albaran, cliente y fecha.', mtWarning,[mbOk],0);
    sEmpresa:= QMaestro.FieldByName('empresa_ce').AsString;
    sAlbaran:= QMaestro.FieldByName('ALBARAN_CE').AsString;
    sCliente:= QMaestro.FieldByName('cliente_ce').AsString;
    //sFecha:= QMaestro.FieldByName('FECHA_ALBARAN_CE').AsString;
  end;
  (*
     if QMaestro.FieldByName('Fecha_Factura_ce').AsString<>'' then
     begin
          MessageDlg (Chr(13) + 'No puede modificar un albarán ya facturado', mtError,[mbOk],0);
          QMaestro.Cancel;
          PanelLineas.Enabled:=True;
          BotonesPosicion();
     end;
  *)
end;

//------------------------ PRIMERA LINEA ---------------------------------------
procedure TEntradas.BPrimeroLClick(Sender: TObject);
begin
     QLineas.First;
end;

//------------------------- ANTERIOR LINEA -------------------------------------
procedure TEntradas.BAnteriorLClick(Sender: TObject);
begin
     QLineas.Prior;
end;

//------------------------- SIGUIENTE LINEA ------------------------------------
procedure TEntradas.BSiguienteLClick(Sender: TObject);
begin
     QLineas.Next;
end;

//------------------------- ULTIMA LINEA ---------------------------------------
procedure TEntradas.BUltimoLClick(Sender: TObject);
begin
     QLineas.Last;
end;

//------------------------- AL SALIR DE LA EMPRESA -----------------------------
procedure TEntradas.cEmpresaExit(Sender: TObject);
begin
     if Length(cEmpresa.Text)>0 then
        cEmpresa.Text:=RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I');
     if not SwAlta then
        cEmpresa.Color:=clWindow
     else
     begin
          if Length(cEmpresa.Text)>0 then
          begin
               cAlbaran.Text:=IntToStr(LeerNumeroAlbaran(cEmpresa.Text));
               if cAlbaran.Text='0' then
                  cEmpresa.SetFocus;
          end;
     end;
end;

//-------------------------- AL ENTRAR EN LA HORA ------------------------------
procedure TEntradas.cHoraEnter(Sender: TObject);
begin
     cHora.Color:=clMoneyGreen;
end;

//------------ LEEMOS EL NUMERADOR DE ALBARANES Y LO INCREMENTAMOS -------------
function TEntradas.LeerNumeroAlbaran(Empresa: String):Integer;
Var
   QAux: TQuery;
begin
     try
        QAux:=TQuery.Create(nil);
        try
           QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

           //Leemos el Numerador de Albaranes
           QAux.SQL.Add(' SELECT NUM_ENTRADAS_E ' +
                        ' FROM EMPRESAS ' +
                        ' WHERE CODIGO_E=' + QuotedStr(Empresa));
           if not DMBaseDatos.BDFrigo.InTransaction then
              DMBaseDatos.BDFrigo.StartTransaction;
           QAux.Open;
           Result:=QAux.FieldByName('NUM_ENTRADAS_E').AsInteger;

           if not QAux.IsEmpty then
           begin
                //Modifico el Valor del Numerador de Albaranes
                 QAux.Close;
                 QAux.SQL.Clear;
                 QAux.SQL.Add(' UPDATE EMPRESAS ' +
                              ' SET NUM_ENTRADAS_E=NUM_ENTRADAS_E + 1 ' +
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

//----------------------------- AL SALIR DEL CLIENTE ---------------------------
procedure TEntradas.cClienteExit(Sender: TObject);
begin
     if QMaestro.State in dsEditModes then
     begin
          if QMaestro.FieldByName('Cliente_ce').AsString<>'' then
             QMaestro.FieldByName('Cliente_ce').AsString:=RellenarCeros(cCliente.Text,cCliente.Properties.MaxLength,'I');
          ComprobarCliente();
     end;
end;

//------------------------- LEEMOS QUE LOTE TOCA -------------------------------
function TEntradas.LeerLote(Empresa, Cliente: String):String;
Var
   QAux: TQuery;
begin
     try
        QAux:=TQuery.Create(nil);
        try
           QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

           //Leemos el Numerador de Lotes
           QAux.SQL.Add(' SELECT NUMERADOR_LOTES_C ' +
                        ' FROM CLIENTES ' +
                        ' WHERE EMPRESA_C=' + QuotedStr(Empresa) +
                        ' AND CODIGO_C=' + QuotedStr(Cliente));
           QAux.Open;
           Result:=IntToStr(QAux.FieldByName('NUMERADOR_LOTES_C').AsInteger);
        finally
               QAux.Close;
               FreeAndNil(QAux);
        end;
     except
           on E:Exception do
                begin
                     CapturaErrores(E);
                     MessageDlg (Chr(13) + 'Error al leer el lote', mtError,[mbOk],0);
                     Result:='';
                end;
     end;
end;

//--------------------- AL CAMBIAR LA FAMILIA ----------------------------------
procedure TEntradas.cFamiliaChange(Sender: TObject);
begin
     tNomFamilia.Caption:=NomFamilia(cEmpresa.Text,
                                     RellenarCeros(cFamilia.Text,cFamilia.Properties.MaxLength,'I'));

     tNomArticulo.Caption:=NomArticulo(cEmpresa.Text,
                                       RellenarCeros(cFamilia.Text,cFamilia.Properties.MaxLength,'I'),
                                       RellenarCeros(cArticulo.Text,cArticulo.Properties.MaxLength,'I'));
end;

//--------------------- AL CAMBIAR EL ARTICULO ---------------------------------
procedure TEntradas.cArticuloChange(Sender: TObject);
Var
   Familia: String;
begin
     tNomArticulo.Caption:=NomArticuloUnidadFamilia(cEmpresa.Text, RellenarCeros(cArticulo.Text,cArticulo.Properties.MaxLength,'I'), Familia);
     if tNomArticulo.Caption<>'' then
     begin
          if QLineas.State in [dsEdit,dsInsert] then
          begin
               QLineas.FieldByName('Familia_le').AsString:=Familia;
               tNomFamilia.Caption:=NomFamilia(QLineas.FieldByName('Empresa_le').AsString, QLineas.FieldByName('Familia_le').AsString);
          end;
     end;
end;

//--------------------- ANTES DE CERRAR LA TABLA DE CABECERAS ------------------
procedure TEntradas.QMaestroBeforeClose(DataSet: TDataSet);
begin
     QLineas.Close;
end;

//---------------------- BORRAR LINEA ------------------------------------------
procedure TEntradas.BBorrarLinea(Sender: TObject);
begin
     if not QLineas.IsEmpty then  //Existen líneas
     begin
        {CARMEN!!
          //Un albaran facturado no puede modificarse
          if QMaestro.FieldByName('Fecha_Factura_ce').AsString<>'' then
             MessageDlg (Chr(13) + 'No puede modificar un albarán ya facturado', mtError,[mbOk],0)
          else
          begin
        }
               try
                  //Una linea con salidas no puede borrarse
                  if LineaConSalidas() then
                     MessageDlg (Chr(13) + 'La línea posee salidas y no puede borrarse.', mtError,[mbOk],0)
                  else
                  begin
                       //Borramos la linea
                       if MessageBox(Handle, PChar('Va a borrarse la linea ¿Está seguro?'),
                                     PChar(Self.Caption),
                                     MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1)=IDYES then
                       begin
                            if not QLineas.Database.InTransaction then
                               QLineas.Database.StartTransaction;
                            //Actualizamos el valor del stock y el de mercancia retenida del cliente
                            ActualizarClienteDelete(QMaestro.FieldByName('Empresa_ce').AsString,
                                                    QLineas.FieldByName('Familia_le').AsString,
                                                    QLineas.FieldByName('Articulo_le').AsString,
                                                    QMaestro.FieldByName('Cliente_ce').AsString,
                                                    QLineas.FieldByName('Unidades_le').AsFloat);
                            //Borramos al almacen relacionado
                            BorrarAlmacen(QMaestro.FieldByName('Empresa_ce').AsString,
                                          QMaestro.FieldByName('Cliente_ce').AsString,
                                          QLineas.FieldByName('Lote_le').AsString);
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
         // end;
     end;
end;

//--------------------- BOTON ALTA DE LINEA ------------------------------------
procedure TEntradas.BAltaLinea(Sender: TObject);
var
  loteOrigenAnterior: String;
begin
     if not (QMaestro.State in [dsEdit,dsInsert]) then   //Cabecera
     begin
      {CARMEN!!
          if QMaestro.FieldByName('Fecha_Factura_ce').AsString<>'' then
             MessageDlg (Chr(13) + 'No puede modificar un albarán ya facturado', mtError,[mbOk],0)
          else
      }
          begin
               loteOrigenAnterior := QLineas.FieldByName('lote_origen_le').AsString;

               QLineas.Insert;

               PanelInsertarLinea.Visible:=True;

               cFAmilia.Enabled:=True;
               cArticulo.Enabled:=True;
               cEstBulto.Enabled:=True;

               //cFamilia.SetFocus;
               cArticulo.SetFocus;

               //------------------------ DATOS DE LA LINEA POR DEFECTO -------------
               QLineas.FieldByName('Empresa_le').AsString:=QMaestro.FieldByName('Empresa_ce').AsString;
               QLineas.FieldByName('Albaran_le').AsInteger:=QMaestro.FieldByName('Albaran_ce').AsInteger;
               //Valores por defecto
               QLineas.FieldByName('Bultos_le').AsInteger:=0;
               QLineas.FieldByName('Estuches_bulto_le').AsInteger:=0;
               QLineas.FieldByName('Estuches_sueltos_le').AsInteger:=0;
               QLineas.FieldByName('Unidades_le').AsInteger:=0;
               QLineas.FieldByName('Palets_le').AsInteger:=0;
               LoteToca:=LeerLote(QMaestro.FieldByName('Empresa_ce').AsString,
                                  QMaestro.FieldByName('Cliente_ce').AsString);
               QLineas.FieldByName('Lote_le').AsString:=LoteToca;
               QLineas.FieldByName('Manejo_le').AsString:='1';

               if loteOrigenAnterior <> '' then
                 QLineas.FieldByName('lote_origen_le').asString := loteOrigenAnterior;
               //------------------------ DATOS DE LA LINEA POR DEFECTO -------------

               PanelClaves.Enabled:=False;
               PanelCabecera.Enabled:=False;
               PanelLineas.Enabled:=False;

               BotonesPosicion();
          end;
     end;
end;

//----------------------------- AL SALIR DE LA FECHA ---------------------------
procedure TEntradas.cFechaExit(Sender: TObject);
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

//--- PARA EVITAR QUE SE ESCRIBAN NUMEROS NEGATIVOS YA QUE SE CONFUNDA CON LOS BOTONES DE BORRAR Y AÑADIR ---
procedure TEntradas.SinSignos(Sender: TObject; var Key: Char);
begin
     if (Key='-') or (Key='+') then Key:=#0;
end;

//-------------------------- VALIDACION DE LOS DATOS DE LA LINEA ---------------
function TEntradas.ValidarLinea():Boolean;
begin
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
     //FECHA CADUCIDAD
     if cFechaCaducidad.text='  /  /    ' then
     begin
          Result:=False;
          cFechaCaducidad.SetFocus;
          MessageDlg (Chr(13) + 'La fecha de caducidad es obligatoria', mtError,[mbOk],0);
          Exit;
     end
     else
     begin
          if not EsFecha(cFechaCaducidad.Text) then
          begin
               Result:=False;
               cFechaCaducidad.SetFocus;
               MessageDlg (Chr(13) + 'La fecha de caducidad es incorrecta', mtError,[mbOk],0);
               Exit;
          end;
     end;
     //BULTOS
     if (not EsNumerico(cBultos.Text)) or (StrToInt(cBultos.Text)<=0)  then
     begin
          Result:=False;
          cBultos.SetFocus;
          MessageDlg (Chr(13) + 'El nº de bultos debe ser mayor que cero', mtError,[mbOk],0);
          Exit;
     end;
     //ESTUCHES / BULTO
     if (not EsNumerico(cEstBulto.Text)) or (StrToInt(cEstBulto.Text)<0)  then
     begin
          Result:=False;
          cEstBulto.SetFocus;
          MessageDlg (Chr(13) + 'El nº de estuches/bulto debe ser mayor o igual que cero', mtError,[mbOk],0);
          Exit;
     end;
     //ESTUCHES SUELTOS
     Result:=ComprobarEstuchesSueltos();
     if not Result then
        Exit;
     //UNIDADES
     if (not EsDecimal(cUnidades.Text)) or (StrToFloat(StringReplace(cUnidades.Text, '.', '',[rfReplaceAll]))<=0) then
     begin
          Result:=False;
          cUnidades.SetFocus;
          MessageDlg (Chr(13) + 'El nº de unidades debe ser mayor que cero', mtError,[mbOk],0);
          Exit;
     end;
     //PALETS
     if (not EsNumerico(cPalets.Text)) or (StrToInt(cPalets.Text)<0) then
     begin
          Result:=False;
          cPalets.SetFocus;
          MessageDlg (Chr(13) + 'El nº de palets debe ser mayor o igual que cero', mtError,[mbOk],0);
          Exit;
     end;
     //LOTE
     if not ValidarLote() then
     begin
          Result:=False;
          cLote.SetFocus;
          Exit;
     end;
     //CAMARA
     if cCamara.Text='' then
     begin
          Result:=False;
          cCamara.SetFocus;
          MessageDlg (Chr(13) + 'La camara es obligatoria', mtError,[mbOk],0);
          Exit;
     end;
     //ZONA
     if cZona.Text='' then
     begin
          Result:=False;
          cZona.SetFocus;
          MessageDlg (Chr(13) + 'La zona es obligatoria', mtError,[mbOk],0);
          Exit;
     end;
     //MANEJO
     if (cManejo.Text<>'0') and (cManejo.Text<>'1') and (cManejo.Text<>'2') and (cManejo.Text<>'3') and (cManejo.Text<>'4') then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'Valor de manejo incorrecto', mtError,[mbOk],0);
          cManejo.SetFocus;
     end;
end;

//---------------------- VALIDACION DEL LOTE -----------------------------------
function TEntradas.ValidarLote(): Boolean;
Var
   QAux: TQuery;
begin
     Result:=True;
     if cLote.Text='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'El lote es obligatorio', mtError,[mbOk],0);
     end
     else
     begin
          //El lote solo puede cambiarlo el usuario si no es numerico
          if EsNumerico(cLote.Text) then  //Lote numerico (No podemos cambiarlo)
          begin
               //Si hemos cambiado el lote -> deshacemos el cambio
               if QLineas.State=dsInsert then   //Insercion
               begin
                    if LoteToca<>cLote.Text then
                    begin
                         MessageDlg (Chr(13) + 'No puede cambiarse el lote poniendo tipo numerico.' + chr(13) +
                                     'Toca el lote: ' + LoteToca, mtError,[mbOk],0);
                         QLineas.FieldByName('Lote_le').AsString:=LoteToca;
                         Result:=False;
                         Exit;
                    end;
               end  //Modificacion
               else if LLoteAnt<>cLote.Text then
                    begin
                         MessageDlg (Chr(13) + 'No puede cambiarse el lote poniendo tipo numerico.' + chr(13) +
                                     'El lote era: ' + LLoteAnt, mtError,[mbOk],0);
                         QLineas.FieldByName('Lote_le').AsString:=LLoteAnt;
                         Result:=False;
                         Exit;
                    end;
          end;

          //Buscamos el lote en la tabla de almacenes
          QAux:=TQuery.Create(Self);
          try
              QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
              QAux.SQL.Clear;
              QAux.SQL.Add(' SELECT * FROM ALMACENES' +
                           ' WHERE EMPRESA_AL=' + QuotedStr(QMaestro.FieldByNAme('Empresa_ce').AsString) +
                           ' AND CLIENTE_AL=' + QuotedStr(QMaestro.FieldByNAme('Cliente_ce').AsString) +
                           ' AND LOTE_AL=' + QuotedStr(cLote.Text));
              QAux.Open;
              if not QAux.IsEmpty() then //Si el lote ya existe buscamos el que le tocaria
              begin
                   if (QLineas.State=dsInsert) or ((QLineas.State=dsEdit) and (LLoteAnt<>cLote.Text)) then
                   begin
                        LoteToca:=LeerLote(QMaestro.FieldByNAme('Empresa_ce').AsString,
                                           QMaestro.FieldByNAme('Cliente_ce').AsString);
                        MessageDlg (Chr(13) + 'Lote ya existente para este cliente, el nuevo lote es ' + LoteToca, mtError,[mbOk],0);
                        QLineas.FieldByNAme('Lote_le').AsString:=LoteToca;
                        Result:=False;
                   end;
              end;
          finally
                 QAux.Close;
                 FreeAndNil(QAux);
          end;
     end;
end;

//------------------------- AL SALIR DE LA FAMILIA -----------------------------
procedure TEntradas.cFamiliaExit(Sender: TObject);
begin
     if QLineas.State in dsEditModes then
        if cFamilia.Text<>'' then
        begin
             QLineas.FieldByName('Familia_le').AsString:=RellenarCeros(cFamilia.Text,cFamilia.Properties.MaxLength,'I');
             if tNomArticulo.Caption='' then
                QLineas.FieldByName('Articulo_le').AsString:='';
        end
        else
            QLineas.FieldByName('Articulo_le').AsString:='';

     //Desasignamos el evento de cambio para mostrar la descripcion
     cFamilia.Properties.OnChange:=Nil;
end;

//----------------------- AL ENTRAR EN LA FAMILIA ------------------------------
procedure TEntradas.cFamiliaEnter(Sender: TObject);
begin
     //Asignamos el evento de cambio para mostrar la descripcion
     cFamilia.Properties.OnChange:=cFamiliaChange;
end;

//------------------------- AL SALIR DEL ARTICULO ------------------------------
procedure TEntradas.cArticuloExit(Sender: TObject);
begin
     if QLineas.State in dsEditModes then
        if cArticulo.Text<>'' then
           QLineas.FieldByName('Articulo_le').AsString:=RellenarCeros(cArticulo.Text,cArticulo.Properties.MaxLength,'I');

     //Desasignamos el evento de cambio para mostrar la descripcion
     cArticulo.Properties.OnChange:=Nil;
end;

//----------------------- AL ENTRAR EN EL ARTICULO -----------------------------
procedure TEntradas.cArticuloEnter(Sender: TObject);
begin
     //Asignamos el evento de cambio para mostrar la descripcion
     cArticulo.Properties.OnChange:=cArticuloChange;
end;

//-- ACTUALIZA EL VALOR DEL STOCK Y EL DE MERCANCIA RETENIDA DEL CLIENTE -------
procedure TEntradas.ActualizarClienteAdd(Empresa, Familia, Articulo, Cliente, Lote: String; NUnidades: Real);
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
                     ' SET VALOR_STOCK_C=VALOR_STOCK_C + :Importe ');
        //Incrementamos el numerador de Lotes
        if EsNumerico(Lote) then
           QAux.SQL.Add(' , NUMERADOR_LOTES_C=NUMERADOR_LOTES_C + 1 ' );
        QAux.SQL.Add(' WHERE EMPRESA_C=' + QuotedStr(Empresa) +
                     ' AND CODIGO_C=' + QuotedStr(Cliente));
        QAux.ParamByName('Importe').AsFloat:=NUnidades * ValorPorKg;
        QAux.ExecSQL;

        MercanciaRetenidaCliente(Empresa, Cliente);
     finally
            QAux.Close;
            FreeAndNil(QAux);
     end;
end;

//-- ACTUALIZA EL VALOR DEL STOCK Y EL DE MERCANCIA RETENIDA DEL CLIENTE -------
procedure TEntradas.ActualizarClienteDelete(Empresa, Familia, Articulo, Cliente: String; NUnidades: Real);
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
                     ' SET VALOR_STOCK_C=VALOR_STOCK_C + :Importe ');
        QAux.SQL.Add(' WHERE EMPRESA_C=' + QuotedStr(Empresa) +
                     ' AND CODIGO_C=' + QuotedStr(Cliente));
        QAux.ParamByName('Importe').AsFloat:=(-NUnidades) * ValorPorKg;
        QAux.ExecSQL;

        MercanciaRetenidaCliente(Empresa, Cliente);
     finally
            QAux.Close;
            FreeAndNil(QAux);
     end;
end;

//-- ACTUALIZA EL VALOR DEL STOCK Y EL DE MERCANCIA RETENIDA DEL CLIENTE -------
procedure TEntradas.ActualizarClienteEdit(Empresa, FamiliaOld, ArticuloOld, FamiliaNew, ArticuloNew, Cliente: String; NUnidadesOld, NUnidadesNew: Real);
Var
   ValorPorKgOld, ValorPorKgNew: Real;
   QAux: TQuery;
begin
     QAux:=TQuery.Create(nil);
     try
        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

        //Leemos el precio del articulo anterior
        QAux.SQL.Add(' SELECT VALOR_POR_KG_A' +
                     ' FROM ARTICULOS' +
                     ' WHERE EMPRESA_A=' + QuotedStr(Empresa) +
                     ' AND FAMILIA_A=' + QuotedStr(FamiliaOld) +
                     ' AND CODIGO_A=' + QuotedStr(ArticuloOld));
        QAux.Open;
        ValorPorKgOld:=QAux.FieldByName('VALOR_POR_KG_A').AsFloat;
        QAux.Close;

        //Leemos el precio del articulo nuevo
        QAux.SQL.Clear;
        QAux.SQL.Add(' SELECT VALOR_POR_KG_A' +
                     ' FROM ARTICULOS' +
                     ' WHERE EMPRESA_A=' + QuotedStr(Empresa) +
                     ' AND FAMILIA_A=' + QuotedStr(FamiliaNew) +
                     ' AND CODIGO_A=' + QuotedStr(ArticuloNew));
        QAux.Open;
        ValorPorKgNew:=QAux.FieldByName('VALOR_POR_KG_A').AsFloat;
        QAux.Close;

        //Modificamos el valor del stock del cliente
        QAux.SQL.Clear;
        QAux.SQL.Add(' UPDATE CLIENTES' +
                     ' SET VALOR_STOCK_C=VALOR_STOCK_C - :ImporteOld + :ImporteNew ' +
                     ' WHERE EMPRESA_C=' + QuotedStr(Empresa) +
                     ' AND CODIGO_C=' + QuotedStr(Cliente));
        QAux.ParamByName('ImporteOld').AsFloat:=NUnidadesOld * ValorPorKgOld;
        QAux.ParamByName('ImporteNew').AsFloat:=NUnidadesNew * ValorPorKgNew;
        QAux.ExecSQL;

        MercanciaRetenidaCliente(Empresa, Cliente);
     finally
            QAux.Close;
            FreeAndNil(QAux);
     end;
end;

//-- ACTUALIZA EL VALOR De MERCANCIA RETENIDA DEL CLIENTE ----------------------
procedure TEntradas.MercanciaRetenidaCliente(Empresa, Cliente: String);
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

//---------------------- AL SALIR DEL LOTE -------------------------------------
procedure TEntradas.cLoteExit(Sender: TObject);
begin
     {
     if QLineas.State in dsEditModes then
     begin
          //El lote solo puede cambiarlo el usuario si no es numerico
          if EsNumerico(cLote.Text) then  //Lote numerico (No podemos cambiarlo)
          begin
               //Si hemos cambiado el lote -> deshacemos el cambio
               if QLineas.State=dsInsert then   //Insercion
               begin
                    if LoteToca<>cLote.Text then
                    begin
                         QLineas.FieldByName('Lote_le').AsString:=LoteToca;
                         MessageDlg (Chr(13) + 'No puede cambiarse el lote a tipo numerico', mtError,[mbOk],0);
                    end;
               end  //Modificacion
               else if LLoteAnt<>QLineas.FieldByName('Lote_le').AsString then
                    begin
                         QLineas.FieldByName('Lote_le').AsString:=LLoteAnt;
                         MessageDlg (Chr(13) + 'No puede cambiarse el lote a tipo numerico', mtError,[mbOk],0);
                    end;
          end;
     end;
    } 
end;

//--------------------- INSERTA EL ALMACEN AL INSERTAR UNA LINEA ---------------
procedure TEntradas.InsertarAlmacen();
Var
   QAux: TQuery;
begin
     QAux:=TQuery.Create(nil);
     try
        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

        QAux.SQL.Add('INSERT INTO ALMACENES ' +
                     'VALUES(:EMPRESA,' +      //Empresa
                            ':CLIENTE,' +      //Cliente
                            ':FAMILIA,' +      //Familia
                            ':ARTICULO,' +     //Articulo
                            ':LOTE,' +         //Lote
                            ':BULTOS,' +       //Bultos Entrados
                            '0,' +             //Bultos Salidos
                            ':UNIDADES,' +     //Unidades Entradas
                            '0,' +             //Unidades Salidas
                            '0,' +             //Unidades Destruidas
                            '0,' +             //Unidades Mermas
                            QuotedStr('N') +   //Status Retenido
                            ',:Camara,' +      //Camara
                            ':Zona,' +         //Zona
                            ':EstBulto,' +     //Estuches Bulto
                            ':EstSueltos,' +   //Estuches Sueltos
                            ':EstTotales, ' +  //Estuches Totales
                            ':TipoEntrada,' +  //Tipo Entrada
                            ':FechaAlbaran,' + //Fecha Albaran
                            ':FechaCaducidad,'+//Fecha Caducidad
                            '0,' +             //Unidades Salidas Mismo Dia
                            ':Palets,' +       //Palets Entrados
                            '0,' +             //Palets Salidos
                            ':FechaModif,' +   //Fecha de modificación
                            'null,' +          //Fecha de modificacion
                            ':lote_origen_al) '); // Lote origen
        QAux.ParamByName('Empresa').AsString:=QMaestro.FieldByName('Empresa_ce').AsString;
        QAux.ParamByName('Cliente').AsString:=QMaestro.FieldByName('Cliente_ce').AsString;
        QAux.ParamByName('Familia').AsString:=QLineas.FieldByName('Familia_le').AsString;
        QAux.ParamByName('Articulo').AsString:=QLineas.FieldByName('Articulo_le').AsString;
        QAux.ParamByName('Lote').AsString:=QLineas.FieldByName('Lote_le').AsString;
        QAux.ParamByName('Bultos').AsInteger:=QLineas.FieldByName('Bultos_le').AsInteger;
        QAux.ParamByName('Unidades').AsFloat:=QLineas.FieldByName('Unidades_le').AsFloat;
        QAux.ParamByName('Camara').AsInteger:=QLineas.FieldByName('Camara_le').AsInteger;
        QAux.ParamByName('Zona').AsString:=QLineas.FieldByName('Zona_le').AsString;
        QAux.ParamByName('EstBulto').AsInteger:=QLineas.FieldByName('Estuches_bulto_le').AsInteger;
        QAux.ParamByName('EstSueltos').AsInteger:=QLineas.FieldByName('Estuches_sueltos_le').AsInteger;
        QAux.ParamByName('EstTotales').AsInteger:=(QLineas.FieldByName('Estuches_bulto_le').AsInteger * QLineas.FieldByName('Bultos_le').AsInteger) +
                                                  QLineas.FieldByName('Estuches_sueltos_le').AsInteger;
        QAux.ParamByName('TipoEntrada').AsString:=QMaestro.FieldByName('Tipo_entrada_ce').AsString;
        QAux.ParamByName('FechaAlbaran').AsString:=QMaestro.FieldByName('Fecha_albaran_ce').AsString;
        QAux.ParamByName('FechaCaducidad').AsString:=AnyoMesDia(cFechaCaducidad.Date);
        QAux.ParamByName('Palets').AsInteger:=QLineas.FieldByName('Palets_le').AsInteger;
        QAux.ParamByName('FechaModif').AsString:=AnyoMesDia(Date());
        QAux.ParamByName('lote_origen_al').AsString:=QLineas.FieldByName('lote_origen_le').AsString;
        QAux.ExecSQL;
     finally
            QAux.Close;
            FreeAndNil(QAux);
     end;
end;

//--------------------- BORRA EL ALMACEN AL BORRAR UNA LINEA -------------------
procedure TEntradas.BorrarAlmacen(Empresa, Cliente, Lote: String);
Var
   QAux: TQuery;
begin
     QAux:=TQuery.Create(nil);
     try
        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

        QAux.SQL.Add(' DELETE ALMACENES ' +
                     ' WHERE EMPRESA_AL=' + QuotedStr(Empresa) +
                     ' AND CLIENTE_AL=' + QuotedStr(Cliente) +
                     ' AND LOTE_AL=' + QuotedStr(Lote));
        QAux.ExecSQL;
     finally
            QAux.Close;
            FreeAndNil(QAux);
     end;
end;

//------------------------- ANTES DE GRABAR UNA LINEA --------------------------
procedure TEntradas.QLineasBeforePost(DataSet: TDataSet);
Var
   QAux: TQuery;
   TotalEstuches, Cociente, EstuchesSueltos: Integer;
begin
     //Redondeo el campo de las unidades
     QLineas.FieldByName('Unidades_le').AsFloat:=Redondear(QLineas.FieldByName('Unidades_le').AsFloat,2);

     //Formato de la fecha de caducidad
     QLineas.FieldByName('Caducidad_le').AsString:=AnyoMesDia(cFechaCaducidad.Text);

     QLineas.FieldByName('Fecha_Modif_le').AsString:=AnyoMesDia(Date());

     //Modificar linea
     if DataSet.State=dsEdit then
     begin
          EstuchesSueltos:=0;
          TotalEstuches:=0;
          //CALCULO DE ESTUCHES SUELTOS
          if QLineas.FieldByName('Estuches_bulto_le').AsInteger<>0 then
          begin
               if ExistenSalidas() then
               begin
                    //Calculo el total de estuches (Stock Bultos) * EstuchesBulto + EstuchesSueltos
                    TotalEstuches:=((QLineas.FieldByName('Bultos_le').AsInteger - QAlmacenes.FieldByName('Bultos_Salidos_al').AsInteger) *
                                    QLineas.FieldByName('Estuches_Bulto_le').AsInteger) + QLineas.FieldByName('Estuches_Sueltos_le').AsInteger;
                    //Division entera (TotalEstuches dividido EstuchesBulto)
                    Cociente:=TotalEstuches div QLineas.FieldByName('Estuches_Bulto_le').AsInteger;
                    //Obtenemos los estuches sueltos
                    EstuchesSueltos:=TotalEstuches - (QLineas.FieldByName('Estuches_Bulto_le').AsInteger*Cociente);
               end
               else
                   EstuchesSueltos:=QLineas.FieldByName('Estuches_Sueltos_le').AsInteger;
          end;

          //Actualizamos el almacen
          QAux:=TQuery.Create(nil);
          try
             QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

             QAux.SQL.Add(' UPDATE ALMACENES ' +
                          ' SET FAMILIA_AL=:Familia, ' +
                              ' ARTICULO_AL=:Articulo, ' +
                              ' FECHA_CADUCIDAD_AL=:FechaCaducidad, ' +
                              ' BULTOS_ENTRADOS_AL=:BultosEntrados, ' +
                              ' ESTUCHES_BULTO_AL=:EstuchesBulto, ' +
                              ' ESTUCHES_SUELTOS_AL=:EstuchesSueltos, ' +
                              ' ESTUCHES_TOTALES_AL=:EstuchesTotales, ' +
                              ' UNIDADES_ENTRADAS_AL=:UnidadesEntradas, ' +
                              ' PALETS_ENTRADOS_AL=:PaletsEntrados, ' +
                              ' LOTE_AL=:LoteNew, ' +
                              ' FECHA_MODIF_AL=:FechaModif, ' +
                              ' NUMERO_CAMARA_AL=:Camara, ' +
                              ' ZONA_AL=:Zona, ' +
                              ' LOTE_ORIGEN_AL=:LoteOrigen ' +
                           ' WHERE EMPRESA_AL=:Empresa ' +
                           ' AND CLIENTE_AL=:Cliente ' +
                           ' AND LOTE_AL=:Lote');
              QAux.ParamByName('Familia').AsString:=QLineas.FieldByName('Familia_le').AsString;
              QAux.ParamByName('Articulo').AsString:=QLineas.FieldByName('Articulo_le').AsString;
              QAux.ParamByName('FechaCaducidad').AsString:=QLineas.FieldByName('Caducidad_le').AsString;
              QAux.ParamByName('BultosEntrados').AsInteger:=QLineas.FieldByName('Bultos_le').AsInteger;
              QAux.ParamByName('EstuchesBulto').AsInteger:=QLineas.FieldByName('Estuches_Bulto_le').AsInteger;
              QAux.ParamByName('EstuchesSueltos').AsInteger:=EstuchesSueltos;
              QAux.ParamByName('EstuchesTotales').AsInteger:=TotalEstuches;
              QAux.ParamByName('UnidadesEntradas').AsFloat:=QLineas.FieldByName('Unidades_le').AsFloat;
              QAux.ParamByName('PaletsEntrados').AsInteger:=QLineas.FieldByName('Palets_le').AsInteger;
              QAux.ParamByName('LoteNew').AsString:=QLineas.FieldByName('Lote_le').AsString;
              QAux.ParamByName('Empresa').AsString:=QMaestro.FieldByName('Empresa_ce').AsString;
              QAux.ParamByName('Cliente').AsString:=QMaestro.FieldByName('Cliente_ce').AsString;
              QAux.ParamByName('Lote').AsString:=LLoteAnt;     //Lote antes de modificar
              QAux.ParamByName('FechaModif').AsString:=AnyoMesDia(Date());
              QAux.ParamByName('Camara').AsInteger:=QLineas.FieldByName('Camara_le').AsInteger;
              QAux.ParamByName('Zona').AsString:=QLineas.FieldByName('Zona_le').AsString;
              QAux.ParamByName('LoteOrigen').AsString:=QLineas.FieldByName('lote_origen_le').AsString;

              QAux.ExecSql;
          finally
                 QAux.Close;
                 FreeAndNil(QAux);
          end;

          //Si cambia la familia, el articulo o las unidades
          if (LFamiliaAnt<>QLineas.FieldByName('Familia_le').AsString) or
             (LArticuloAnt<>QLineas.FieldByName('Articulo_le').AsString) or
             (LUnidadesAnt<>QLineas.FieldByName('Unidades_le').AsFloat) then
          begin
               //Cambiamos el valor del stock y el de mercancia retenida
               ActualizarClienteEdit(QLineas.FieldByName('Empresa_le').AsString,
                                     LFamiliaAnt,
                                     LArticuloAnt,
                                     QLineas.FieldByName('Familia_le').AsString,
                                     QLineas.FieldByName('Articulo_le').AsString,
                                     QMaestro.FieldByName('Cliente_ce').AsString,
                                     LUnidadesAnt,
                                     QLineas.FieldByName('Unidades_le').AsFloat);
           end;
     end;
end;

//------------------------ COMPRUEBA EL CLIENTE --------------------------------
procedure TEntradas.ComprobarCliente();
begin
     if QMaestro.FieldByName('Cliente_ce').AsString='' then exit;
     if (cCliente.Text='') then
     begin
          MessageDlg (Chr(13) + 'El código del cliente es obligatorio', mtError,[mbOk],0);
          cCliente.SetFocus;
     end
     else if tNomcliente.Caption='' then
     begin
          MessageDlg (Chr(13) + 'El cliente no existe', mtError,[mbOk],0);
          cCliente.SetFocus;
     end
     else
     begin
          //Comprobamos si el cliente esta dado de baja
          if not ClienteDeAlta() then
          begin
               MessageDlg (Chr(13) + 'Cliente ' + cCliente.Text + ' de baja', mtError,[mbOk],0);
               cCliente.SetFocus;
               if QMaestro.State=dsEdit then
                  QMaestro.FieldByName('Cliente_ce').AsString:=ClienteAnt
               else
                  QMaestro.FieldByName('Cliente_ce').AsString:='';
          end;
     end;
end;

//--------------------- COMPRUEBA EL ALBARAN -----------------------------------
function TEntradas.ComprobarAlbaran(): Boolean;
Var
   QAux: TQuery;
begin
     Result:=True;
     //Comprobamos que el albaran no exista
     QAux:=TQuery.Create(nil);
     try
        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

        QAux.SQL.Add(' SELECT * FROM CABECERA_ENTRADAS' +
                     ' WHERE EMPRESA_CE=' + QuotedStr(cEmpresa.Text) +
                     ' AND ALBARAN_CE=' + QuotedStr(cAlbaran.Text));
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

//--------------------- AL SALIR DE LA TEMPERATURA -----------------------------
procedure TEntradas.cTemperaturaExit(Sender: TObject);
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

//---------------------- AL SALIR DEL IMPORTE ----------------------------------
procedure TEntradas.cImporteExit(Sender: TObject);
begin
     if QMaestro.State in dsEditModes then
        QMaestro.FieldByName('Importe_entrada_ce').AsFloat:=Redondear(QMaestro.FieldByName('Importe_entrada_ce').AsFloat,2);
end;

//---------------------- AL SALIR DE LAS HORAS ---------------------------------
procedure TEntradas.cHorasFacturarExit(Sender: TObject);
Var
   Minutos: Integer;
begin
     if QMaestro.State in dsEditModes then
     begin
          if cHorasFacturar.Text='' then
             QMaestro.FieldByName('horas_entrada_ce').AsFloat:=0
          else if QMaestro.FieldByName('horas_entrada_ce').AsFloat<0 then
               begin
                    MessageDlg (Chr(13) + 'Las horas de entrada deben ser mayor o igual que cero', mtError,[mbOk],0);
                    cHorasFacturar.SetFocus;
               end
               else
               begin
                    QMaestro.FieldByName('horas_entrada_ce').AsFloat:=Redondear(QMaestro.FieldByName('horas_entrada_ce').AsFloat,2);
                    Minutos:=StrToInt(RellenarCeros(ParteDecimal(QMaestro.FieldByName('horas_entrada_ce').AsFloat),2,'D'));
                    if Minutos>59 then
                    begin
                         MessageDlg (Chr(13) + 'El rango de minutos en las horas de entrada es incorrecto', mtError,[mbOk],0);
                         cHorasFacturar.SetFocus;
                    end;
               end;
     end;
end;

//--------------------- COMPROBAMOS LA FECHA -----------------------------------
procedure TEntradas.CompruebaFecha(Sender: TObject);
begin
{
     try
        cFechaCaducidad.CheckValidDate;
     except
           On E: Exception do
                 begin
                      showMessage('La fecha de caducidad es incorrecta');
                      cFechaCaducidad.SetFocus;
                 end;
     end;
}
end;

//----------------------- AL CAMBIAR LOS PALETS --------------------------------
procedure TEntradas.cPaletsChange(Sender: TObject);
begin
     if QLineas.State in dsEditModes then
     begin
          //Calculamos el manejo
          if (cPalets.Text<>'0') and (cPalets.Text<>'') then  //Palets --> Manejo 0
             QLineas.FieldByName('Manejo_le').AsString:='0'
          else
              QLineas.FieldByName('Manejo_le').AsString:='1';
     end;
end;

//------------------------ AL SALIR DEL MANEJO ---------------------------------
procedure TEntradas.cManejoExit(Sender: TObject);
begin
     if ComprobarManejo() then
        if (QLineas.State in [dsEdit,dsInsert]) then
           Aceptar(Self);
end;

//------------------------- COMPRUEBA EL MANEJO --------------------------------
function TEntradas.ComprobarManejo():Boolean;
begin
     Result:=True;
     if (cManejo.Text<>'0') and (cManejo.Text<>'1') and (cManejo.Text<>'2') and
        (cManejo.Text<>'3') and (cManejo.Text<>'4') then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'Valor de manejo incorrecto', mtError,[mbOk],0);
          cManejo.SetFocus;
     end;
end;

//------------------------ COMPRUEBA ESTUCHES SUELTOS --------------------------
function TEntradas.ComprobarEstuchesSueltos():Boolean;
begin
     if (not EsNumerico(cEstSueltos.Text)) or (StrToInt(cEstSueltos.Text)<0) then
     begin
          Result:=False;
          cEstSueltos.SetFocus;
          MessageDlg (Chr(13) + 'El nº de estuches sueltos debe ser mayor o igual que cero', mtError,[mbOk],0);
     end
     else
         //ESTUCHESxBULTO=0 --> ESTUCHES SUELTOS=0
         if (StrToInt(cEstBulto.Text)=0) and (StrToInt(cEstSueltos.Text)>0) then
         begin
              Result:=False;
              MessageDlg (Chr(13) + 'Si estuches por bulto es 0, estuches sueltos debe ser 0', mtError,[mbOk],0);
              cEstSueltos.SetFocus
         end
         else if (StrToInt(cEstBulto.Text)<>0) and (StrToInt(cEstSueltos.Text)>=StrToInt(cEstBulto.Text)) then  //ESTUCHES_SUELTOS FUERA DE RANGO
              begin
                   Result:=False;
                   cEstSueltos.SetFocus;
                   MessageDlg (Chr(13) + 'Estuches sueltos debe ser menor que estuches por bulto', mtError,[mbOk],0);
              end
       else
           Result:=True;
end;

//------------------------- AL SALIR DE LAS UNIDADES ---------------------------
procedure TEntradas.cUnidadesExit(Sender: TObject);
begin
     //Redondeo de las unidades
     if QLineas.State in dsEditModes then
     begin
          QLineas.FieldByName('Unidades_le').AsFloat:=Redondear(QLineas.FieldByName('Unidades_le').AsFloat,2);
     end;
end;

//-------------------------- DESPUES DE ABRIR LA TABLA DE CABECERA -------------
procedure TEntradas.QMaestroAfterOpen(DataSet: TDataSet);
begin
     QLineas.Open;
end;

//-------------------------- AL CALCULAR LINEAS --------------------------------
procedure TEntradas.QLineasCalcFields(DataSet: TDataSet);
begin
     //Rellenamos el nombre del articulo
     QArticulos.Close;
     QArticulos.ParamByName('Empresa').AsString:=QLineas.FieldByName('Empresa_le').AsString;
     QArticulos.ParamByName('Familia').AsString:=QLineas.FieldByName('Familia_le').AsString;
     QArticulos.ParamByName('Articulo').AsString:=QLineas.FieldByName('Articulo_le').AsString;
     QArticulos.Open;
     QLineas.FieldByName('NombreArticulo').AsString:=QArticulos.FieldByName('denominacion_a').AsString;

     //Rellenamos el nombre de la familia
     QFamilias.Close;
     QFamilias.ParamByName('Empresa').AsString:=QLineas.FieldByName('Empresa_le').AsString;
     QFamilias.ParamByName('Familia').AsString:=QLineas.FieldByName('Familia_le').AsString;
     QFamilias.Open;
     QLineas.FieldByName('NombreFamilia').AsString:=QFamilias.FieldByName('descripcion_f').AsString;

     QLineas.FieldByName('Caducidad').AsString:=DiaMesAnyo(QLineas.FieldByName('Caducidad_le').AsString);
end;

//------------------------- ANTES DE INSERTAR ----------------------------------
procedure TEntradas.QLineasBeforeInsert(DataSet: TDataSet);
begin
     tNomFamilia.Caption:='';
     tNomArticulo.Caption:='';
end;

//---------------------- DOBLE CLICK EN LE GRID DE LINEAS ----------------------
procedure TEntradas.GridLineasDblClick(Sender: TObject);
var
  bPuedoModificar: boolean;
begin
     if not (QMaestro.State in [dsEdit,dsInsert]) then   //Cabecera
     begin
       if QMaestro.FieldByName('Fecha_Factura_ce').AsString<>'' then
       Begin
       { CARMEN!!
         //Solo puedo modifcar albaranes con mas de un año
         if ( Now - StrToDate( DiaMesAnyo(QMaestro.FieldByName('FECHA_ALBARAN_Ce').AsString) ) ) < 365 then
         begin
           MessageDlg (Chr(13) + 'No puede modificar un albarán ya facturado con menos de un año de antiguedad.', mtError,[mbOk],0);
           bPuedoModificar:= False;
         end
         else
         begin
}
           bPuedoModificar:= MessageDlg (Chr(13) + 'Albarán ya facturado, ¿seguro que quiere modificarlo?.', mtError,[mbYes,mbNo ],0) = mrYes;
//         end;
       end
       else
       begin
         bPuedoModificar:= True;
       end;

          if bPuedoModificar then
          begin
               if LineaConSalidas() then  //Existen salidas
               begin
                    if MessageBox(Handle, PChar('Línea con salidas, ¿Desea continuar?'),
                                  PChar(Self.Caption),
                                  MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1)=IDNO then
                       Exit;
                    PanelInsertarLinea.Visible:=True;

                    cFamilia.Properties.ReadOnly:=True;   //Si existen salidas en la linea no se puede modificar Articulo ni Estuches por bulto
                    cArticulo.Properties.ReadOnly:=True;
                    cEstBulto.Properties.ReadOnly:=True;
                    cLote.Properties.ReadOnly:=True;

                    cArticulo.Style.Font.Color:=clRed;
                    cFamilia.Style.Font.Color:=clRed;
                    cEstBulto.Style.Font.Color:=clRed;
                    cLote.Style.Font.Color:=clRed;

                    cArticulo.TabStop:=False;
                    cFamilia.TabStop:=False;
                    cEstBulto.TabStop:=False;
                    cLote.TabStop:=False;

                    cFechaCaducidad.SetFocus;
               end
               else
               begin
                    PanelInsertarLinea.Visible:=True;

                    cFamilia.Properties.ReadOnly:=False;
                    cArticulo.Properties.ReadOnly:=False;
                    cEstBulto.Properties.ReadOnly:=False;
                    cLote.Properties.ReadOnly:=False;

                    cArticulo.Style.Font.Color:=clBlack;
                    cFamilia.Style.Font.Color:=clBlack;
                    cEstBulto.Style.Font.Color:=clBlack;
                    cLote.Style.Font.Color:=clBlack;

                    cArticulo.TabStop:=True;
                    cFamilia.TabStop:=True;
                    cEstBulto.TabStop:=True;
                    cLote.TabStop:=True;

                    cFamilia.SetFocus;
               end;

               QLineas.Edit;

               //Para mostrar las descripcion de la familia y el articulo
               cArticuloChange(self);
               cFamiliaChange(self);
               cFechaCaducidad.Text:=DiaMesAnyo(QLineas.FieldByName('Caducidad_le').AsString);

               PanelClaves.Enabled:=False;
               PanelCabecera.Enabled:=False;
               PanelLineas.Enabled:=False;

               BotonesPosicion();
          end;
     end;
end;

//------------------- COMPRUEBA SI EXISTEN SALIDAS EN EL ALBARAN ---------------
function TEntradas.ExistenSalidas():Boolean;
Var
   QAux, QAux2: TQuery;
begin
     Result:=False;
     QAux:=TQuery.Create(nil);
     QAux2:=TQuery.Create(nil);
     try
        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
        QAux2.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

        //Lineas del Albaran de Entrada
        QAux.SQL.Add(' SELECT LOTE_LE FROM LINEA_ENTRADAS' +
                     ' WHERE EMPRESA_LE=' + QuotedStr(QMaestro.FieldByName('Empresa_ce').AsString) +
                     ' AND ALBARAN_LE=' + IntToStr(QMaestro.FieldByName('Albaran_ce').AsInteger));
        QAux.Open;

        //Lineas de Salidas
        QAux2.SQL.Add(' SELECT * FROM CABECERA_SALIDAS, LINEA_SALIDAS ' +
                      ' WHERE EMPRESA_CS=EMPRESA_LS ' +
                      ' AND ALBARAN_CS=ALBARAN_LS '+
                      ' AND EMPRESA_CS=:Empresa ' +
                      ' AND CLIENTE_CS=:Cliente ' +
                      ' AND LOTE_LS=:Lote');
        QAux2.Prepare;

        //Para cada linea de albaran
        While not QAux.Eof do
        begin
             QAux2.Close;
             QAux2.ParamByName('Empresa').AsString:=QMaestro.FieldByName('Empresa_ce').AsString;
             QAux2.ParamByName('Cliente').AsString:=QMaestro.FieldByName('Cliente_ce').AsString;
             QAux2.ParamByName('Lote').AsString:=QAux.FieldByName('Lote_le').AsString;
             QAux2.Open;
             if QAux2.IsEmpty then
                QAux.Next
             else
             begin
                  Result:=True;
                  Break;
             end;
        end;
      finally
             QAux.Close;
             FreeAndNil(QAux);
             QAux2.Close;
             FreeAndNil(QAux2);
      end;
end;

//------------------- COMPRUEBA SI EXISTEN SALIDAS EN LA LINEA -----------------
function TEntradas.LineaConSalidas():Boolean;
Var
   QAux: TQuery;
begin
     QAux:=TQuery.Create(nil);
     try
        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

        //Seleccionamos el almacen
        QAux.SQL.Add(' SELECT * FROM ALMACENES' +
                     ' WHERE EMPRESA_AL=' + QuotedStr(QMaestro.FieldByName('Empresa_ce').AsString) +
                     ' AND CLIENTE_AL=' + QuotedStr(QMaestro.FieldByName('Cliente_ce').AsString) +
                     ' AND LOTE_AL=' + QuotedStr(QLineas.FieldByName('Lote_le').AsString));
        QAux.Open;
        if (QAux.FieldByName('unidades_salidas_al').AsFloat<>0) or
           (QAux.FieldByName('unidades_destruidas_al').AsFloat<>0) or
           (QAux.FieldByName('unidades_mermas_al').AsFloat<>0) or
           (QAux.FieldByName('bultos_salidos_al').AsInteger<>0) then
           Result:=True
        else
            Result:=False;
      finally
             QAux.Close;
             FreeAndNil(QAux);
      end;
end;

//------------------- COMPRUEBA SI EXISTEN SALIDAS EN EL ALBARAN ---------------
function TEntradas.AlbaranConSalidas():Boolean;
Var
   QAux, QAux2: TQuery;
begin
     Result:=False;

     QAux:=TQuery.Create(nil);
     QAux2:=TQuery.Create(nil);
     try
        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
        QAux2.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

        //Seleccionamos el almacen
        QAux.SQL.Add(' SELECT * FROM LINEA_ENTRADAS' +
                     ' WHERE EMPRESA_LE=' + QuotedStr(QMaestro.FieldByName('Empresa_ce').AsString) +
                     ' AND ALBARAN_LE=' + QuotedStr(QMaestro.FieldByName('ALbaran_ce').AsString));

        QAux2.SQL.Add(' SELECT * FROM CABECERA_SALIDAS, LINEA_SALIDAS ' +
                      ' WHERE EMPRESA_CS=EMPRESA_LS ' +
                      ' AND ALBARAN_CS=ALBARAN_LS ' +
                      ' AND EMPRESA_CS=' + QuotedStr(QMaestro.FieldByName('Empresa_ce').AsString) +
                      ' AND CLIENTE_CS=' + QuotedStr(QMaestro.FieldByName('Cliente_ce').AsString) +
                      ' AND LOTE_LS=:Lote');
        QAux2.Prepare;

        QAux.Open;
        While not QAux.Eof do
        begin
             QAux2.Close;
             QAux2.ParamByName('Lote').AsString:=QAux.FieldByName('Lote_le').AsString;
             QAux2.Open;
             if not QAux2.IsEmpty then
             begin
                  Result:=True;
                  Break;
             end;
             QAux.Next;
        end;

      finally
             QAux.Close;
             FreeAndNil(QAux);

             QAux2.Close;
             QAux2.Prepare;
             FreeAndNil(QAux2);
      end;
end;

//------------------- COMPRUEBA SI UN CLIENTE ESTA DADO DE ALTA ----------------
function TEntradas.ClienteDeAlta():Boolean;
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

//--------------------- ANTES DE MODIFICAR UNA LINEA ---------------------------
procedure TEntradas.QLineasBeforeEdit(DataSet: TDataSet);
begin
     //Guardamos los datos de la linea antes de modificarla
     LFamiliaAnt:=QLineas.FieldByName('Familia_le').AsString;
     LArticuloAnt:=QLineas.FieldByName('Articulo_le').AsString;
     LLoteAnt:=QLineas.FieldByName('Lote_le').AsString;
     LBultosAnt:=QLineas.FieldByName('Bultos_le').AsInteger;
     LEstuchesBultoAnt:=QLineas.FieldByName('Estuches_Bulto_le').AsInteger;
     LEstuchesSueltosAnt:=QLineas.FieldByName('Estuches_Sueltos_le').AsInteger;
     LUnidadesAnt:=QLineas.FieldByName('Unidades_le').AsFloat;
     LPaletsAnt:=QLineas.FieldByName('Palets_le').AsInteger;
     FechaCaducidadAnt:=DiaMesAnyo(QLineas.FieldByName('Caducidad_le').AsString);

     //Abrimos el almacen para poder hacer calculos
     QAlmacenes.Close;
     QAlmacenes.ParamByName('Empresa').AsString:=QLineas.FieldByName('Empresa_le').AsString;
     QAlmacenes.ParamByName('Cliente').AsString:=QMaestro.FieldByName('Cliente_ce').AsString;
     QAlmacenes.ParamByName('Lote').AsString:=QLineas.FieldByName('Lote_le').AsString;
     QAlmacenes.Open;
end;

//-------------------------- AL CAMBIAR DE REGISTRO ----------------------------
procedure TEntradas.DSMaestroDataChange(Sender: TObject; Field: TField);
begin
     //Si existen salidas no podemos tocar Clientes, Fecha ni Tipo de Entrada
     if ExistenSalidas() then
     begin
          cCliente.Properties.ReadOnly:=True;
          cLupaClientes.Enabled:=False;
          cFechaAlbaran.Properties.ReadOnly:=True;
          cTipoEntrada.ReadOnly:=True;

          cCliente.TabStop:=False;
          cFechaAlbaran.TabStop:=False;
          cTipoEntrada.TabStop:=False;

          cCliente.Style.Font.Color:=clRed;
          cFechaAlbaran.Style.Font.Color:=clRed;
          cTipoEntrada.Font.Color:=clRed;
     end
     else
     begin
          cCliente.Properties.ReadOnly:=False;
          cLupaClientes.Enabled:=True;
          cFechaAlbaran.Properties.ReadOnly:=False;
          cTipoEntrada.ReadOnly:=False;

          cCliente.TabStop:=True;
          cFechaAlbaran.TabStop:=True;
          cTipoEntrada.TabStop:=True;

          cCliente.Style.Font.Color:=clBlack;
          cFechaAlbaran.Style.Font.Color:=clBlack;
          cTipoEntrada.Font.Color:=clBlack;
     end;
end;

//- DEVUELELVE UN LOTE SI EN EL ALBARAN HAY UNO CON CON TIPO ABANDONADO O TIPO AUTORIZADO -
function TEntradas.TipoLoteA_B(Empresa: String; Albaran: Integer; Cliente: String):String;
Var
   QAux, QAux2: TQuery;
begin
     Result:='';
     QAux:=TQuery.Create(nil);
     QAux2:=TQuery.Create(nil);
     try
        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
        QAux2.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

        //Lineas del Albaran de Entrada
        QAux.SQL.Add(' SELECT LOTE_LE FROM LINEA_ENTRADAS' +
                     ' WHERE EMPRESA_LE=' + QuotedStr(Empresa) +
                     ' AND ALBARAN_LE=' + IntToStr(Albaran));
        QAux.Open;

        //Lineas de Salidas
        QAux2.SQL.Add(' SELECT * FROM ALMACENES ' +
                      ' WHERE EMPRESA_AL=:Empresa ' +
                      ' AND CLIENTE_AL=:Cliente ' +
                      ' AND LOTE_AL=:Lote');
        QAux2.Prepare;

        //Para cada linea de albaran
        While not QAux.Eof do
        begin
             QAux2.Close;
             QAux2.ParamByName('Empresa').AsString:=Empresa;
             QAux2.ParamByName('Cliente').AsString:=Cliente;
             QAux2.ParamByName('Lote').AsString:=QAux.FieldByName('Lote_le').AsString;
             QAux2.Open;
             if (QAux2.FieldByName('Tipo_Lote_Al').AsString='B') or (QAux2.FieldByName('Tipo_Lote_Al').AsString='T') then
             begin
                  Result:=QAux.FieldByName('Lote_le').AsString;
                  Exit;
             end
             else
                 QAux.Next;
        end;
      finally
             QAux.Close;
             FreeAndNil(QAux);
             QAux2.Close;
             FreeAndNil(QAux2);
      end;
end;

//-------------------- COMPRUEBA EL STOCK AL GRABAR UNA LINEA ------------------
function TEntradas.ComprobarStockLinea():Boolean;
Var
   NEstuchesOldLinea, NEstuchesNewLinea, StockEstuches, StockPalets: Integer;
   StockUnidades: Real;
begin
     Result:=True;
     if not QAlmacenes.Active then
     begin
          //Abrimos el almacen para poder hacer calculos
          QAlmacenes.Close;
          QAlmacenes.ParamByName('Empresa').AsString:=QLineas.FieldByName('Empresa_le').AsString;
          QAlmacenes.ParamByName('Cliente').AsString:=QMaestro.FieldByName('Cliente_ce').AsString;
          QAlmacenes.ParamByName('Lote').AsString:=QLineas.FieldByName('Lote_le').AsString;
          QAlmacenes.Open;
     end;
     //Stock de bultos
     if StrToInt(cBultos.Text)<QAlmacenes.FieldByName('Bultos_Salidos_al').AsInteger then
     begin
          MessageDlg (Chr(13) + 'No puede dejar menos de ' +  IntToStr(QAlmacenes.FieldByName('Bultos_Salidos_al').AsInteger) +
                     ' bultos porque el stock sería negativo', mtError,[mbOk],0);
          CBultos.SetFocus;
          Result:=False;
          Exit;
     end;
     //Stock de Estuches por Bulto
     if StrToInt(cEstBulto.Text)<>0 then
     begin
          NEstuchesNewLinea:=(StrToInt(cBultos.Text) * StrToInt(cEstBulto.Text)) + StrToInt(cEstSueltos.Text);
          NEstuchesOldLinea:=(LBultosAnt * LEstuchesBultoAnt) + LEstuchesSueltosAnt;
          StockEstuches:=((QAlmacenes.FieldByName('Bultos_Entrados_al').AsInteger - QAlmacenes.FieldByName('Bultos_Salidos_al').AsInteger) *
                         QAlmacenes.FieldByName('Estuches_Bulto_al').AsInteger) + QAlmacenes.FieldByName('Estuches_Sueltos_al').AsInteger;
          if NEstuchesNewLinea < (NEstuchesOldLinea-StockEstuches) then
          begin
               MessageDlg (Chr(13) + 'No puede dejar menos de ' + IntToStr(NEstuchesOldLinea-StockEstuches) +
                          ' estuches porque el stock sería negativo' , mtError,[mbOk],0);
               cEstSueltos.SetFocus;
               Result:=False;
               Exit;
          end;
     end;
     //Stock de Palets
     StockPalets:=QAlmacenes.FieldByName('Palets_Entrados_al').AsInteger - QAlmacenes.FieldByName('Palets_Salidos_al').AsInteger;
     if (StockPalets + StrToInt(cPalets.Text) - LPaletsAnt)<0 then
     begin
          MessageDlg (Chr(13) + 'No puede dejar el stock de palets negativo' , mtError,[mbOk],0);
          cPalets.SetFocus;
          Result:=False;
          Exit;
     end;
     //Stock de Unidades
     StockUnidades:=QAlmacenes.FieldByName('Unidades_Entradas_al').AsFloat - QAlmacenes.FieldByName('Unidades_Salidas_al').AsFloat -
                    QAlmacenes.FieldByName('Unidades_Mermas_al').AsFloat - QAlmacenes.FieldByName('Unidades_Destruidas_al').AsFloat;  ;
     if (StockUnidades + Redondear(ValorFloat(cUnidades.Text),2) - LUnidadesAnt)<0 then
     begin
          MessageDlg (Chr(13) + 'No puede dejar el stock de unidades negativo' , mtError,[mbOk],0);
          cUnidades.SetFocus;
          Result:=False;
     end;
end;

//------------------- IMPRIMIR EL ALBARAN --------------------------------------
procedure TEntradas.ImprimirAlbaran(Empresa, Cliente, RefCliente: String; Albaran: Integer; Fecha: String);
begin
     try
        with TQRAlbaranEntrada.Create(nil) do
        try
           tCliente.Caption:=Cliente + '-';
           if RefCliente <> '' then
             tNumAlbaran.Caption:=RefCliente
           else
             tNumAlbaran.Caption:=IntToStr(Albaran);
           QAux.Close;
           QAux.SQL.Clear;
           QAux.SQL.Add(' SELECT * ' +
                        ' FROM CABECERA_ENTRADAS ' +
                        ' WHERE EMPRESA_CE=' + QuotedStr(Empresa) +
                        ' AND CLIENTE_CE=' + QuotedStr(Cliente) +
                        ' AND ALBARAN_CE=' + IntToStr(Albaran) +
                        ' AND FECHA_ALBARAN_CE=:Fecha');
           QAux.ParamByName('Fecha').AsString:=AnyoMesDia(Fecha);
           QAux.Open;
           tTransportista.Caption:=QAux.FieldByName('TRANSPORTISTA_CE').AsString;
           tProcedencia.Caption:=QAux.FieldByName('PROCEDENCIA_CE').AsString;
           tObservacion.Caption:=QAux.FieldByName('OBSERVACIONES_CE').AsString;
           tMatricula.Caption:=QAux.FieldByName('MATRICULA_CE').AsString;
           tReferencia.Caption:=QAux.FieldByName('CONCEPTO2_CE').AsString;
           tTemperatura.Caption:=QAux.FieldByName('TEMPERATURA_CE').AsString + ' ºC';
           tFecha.Caption:=Fecha + '  ' +  QAux.FieldByName('HORA_CE').AsString;
           if QAux.FieldByName('IMPORTE_ENTRADA_CE').AsFloat<>0 then
           begin
                HayImporte:=True;
                //tTituloImporte.Enabled:=True;
                //tImporteEntrada.Enabled:=True;
                tImporteEntrada.Caption:=FormatFloat(',0.00 Eur.',QAux.FieldByName('IMPORTE_ENTRADA_CE').AsFloat);
           end
           else
               HayImporte:=False;
           if QAux.FieldByName('HORAS_ENTRADA_CE').AsFloat<>0 then
           begin
                //tTituloHoras.Enabled:=True;
                //tHorasFacturar.Enabled:=True;
                HayHoras:=True;
                tHorasFacturar.Caption:=FormatFloat(',0.00',QAux.FieldByName('HORAS_ENTRADA_CE').AsFloat);
                if QAux.FieldByName('IMPORTE_ENTRADA_CE').AsFloat=0 then
                begin
                     tTituloHoras.Left:=tTituloImporte.Left;
                     tHorasFacturar.Left:=tImporteEntrada.Left;
                end;
           end
           else
               HayHoras:=False;
           if QAux.FieldByName('CONCEPTO_CE').AsString<>'' then
           begin
                //tTituloConcepto.Enabled:=True;
                //tConcepto.Enabled:=True;
                HayConcepto:=True;
                tConcepto.Caption:=QAux.FieldByName('CONCEPTO_CE').AsString;
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
                           ' FROM LINEA_ENTRADAS ' +
                           ' WHERE EMPRESA_LE=' + QuotedStr(Empresa) +
                           ' AND ALBARAN_LE=' + IntToStr(Albaran));
           QLineas.Open;

           NLineas:=QLineas.FieldByName('NLINEAS').AsInteger;

           QLineas.Close;
           QLineas.SQL.Clear;
           QLineas.SQL.Add(' SELECT  * ' +
                           ' FROM LINEA_ENTRADAS ' +
                           ' WHERE EMPRESA_LE=' + QuotedStr(Empresa) +
                           ' AND ALBARAN_LE=' + IntToStr(Albaran));
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

//---------------------- BOTON IMPRIMIR ALBARAN --------------------------------
procedure TEntradas.BImprimirClick(Sender: TObject);
begin
     ImprimirAlbaran(QMaestro.FieldByName('Empresa_ce').AsString,
                     QMaestro.FieldByName('Cliente_ce').AsString,
                     QMaestro.FieldByName('ref_cliente_ce').AsString,
                     QMaestro.FieldByName('Albaran_ce').AsInteger,
                     DiaMesAnyo(QMaestro.FieldByName('Fecha_Albaran_ce').AsString));
end;

//------------------------ DESPUES DE CANCELAR ---------------------------------
procedure TEntradas.QMaestroAfterCancel(DataSet: TDataSet);
begin
     cHora.OnChange:=Nil;
     cHora.Text:=StringReplace(QMaestro.FieldByName('HORA_CE').AsString, ':', '',[rfReplaceAll]);
     cHora.OnChange:=cHoraChange;

     cFechaAlbaran.Properties.OnChange:=Nil;
     cFechaAlbaran.Text:=DiaMesAnyo(QMaestro.FieldByName('FECHA_ALBARAN_CE').AsString);
     cFechaAlbaran.Properties.OnChange:=cFechaAlbaranChange;
end;

//----------------------- FUNCION QUE COMPRUEBA LA HORA ------------------------
function TEntradas.ComprobarHora(Hora: String):Boolean;
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

procedure TEntradas.cFechaAlbaranEnter(Sender: TObject);
begin
      cFechaAlbaran.Style.Color:=clMoneyGreen;
end;

procedure TEntradas.cFechaAlbaranChange(Sender: TObject);
begin
     if not (QMaestro.State in [dsEdit,dsInsert]) then
        QMaestro.Edit;
end;

//------------ CAMPO CALCULADO PARA LA DESCRIPCION DEL TIPO DE ENTRADA ---------
procedure TEntradas.QTiposEntradaCalcFields(DataSet: TDataSet);
begin
     QTiposEntrada.FieldByName('des').AsString:=QTiposEntrada.FieldByName('codigo_te').AsString +
                                                ' - ' +
                                                QTiposEntrada.FieldByName('descripcion_te').AsString;
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TEntradas.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TEntradas.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresa.Text:=CodEmpresa;
     cEmpresa.SetFocus;
end;

//-------------------------- LUPA DE CLIENTES ----------------------------------
procedure TEntradas.cLupaClientesClick(Sender: TObject);
Var
   Cliente: String;
begin
     Cliente:=LupaClientes(cEmpresa.Text);
     if not (QMaestro.State in dsEditModes) then
     begin
          if Cliente<>'' then
          begin
               QMaestro.Edit;
               QMaestro.FieldByName('Cliente_ce').AsString:=Cliente;
          end;
     end
     else if Cliente<>'' then
             QMaestro.FieldByName('Cliente_ce').AsString:=Cliente;
     cCliente.Setfocus;
end;

//-------------------------- LUPA (F2) DE CLIENTES -----------------------------
procedure TEntradas.cClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaClientesClick(Self);
end;

//-------------------------- LUPA DE FAMILIAS-----------------------------------
procedure TEntradas.LupaFamiliaClick(Sender: TObject);
Var
   Familia: String;
begin
     if not cFamilia.Properties.ReadOnly then
     begin
          Familia:=LupaFamilias(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
          if Familia<>'' then
               QLineas.FieldByName('Familia_le').AsString:=Familia;
     end;
end;

//-------------------------- LUPA (F2) DE FAMILIAS -----------------------------
procedure TEntradas.cFamiliaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        LupaFamiliaClick(Self);
end;

//-------------------------- LUPA DE ARTICULOS ---------------------------------
procedure TEntradas.LupaArticuloClick(Sender: TObject);
Var
   Articulo, Familia: String;
begin
     if not cArticulo.Properties.ReadOnly then
     begin
          if (cFamilia.Text<>'') and (tNomFamilia.Caption<>'') then
          begin
               Familia:=RellenarCeros(cFamilia.Text,cFamilia.Properties.MaxLength,'I');
               Articulo:=LupaArticulos(cEmpresa.Text, Familia);
               if Articulo<>'' then
                  QLineas.FieldByName('Articulo_le').AsString:=Articulo;
          end
          else //Si no pongo familia -> Muestro todos los articulos y devuelvo por referencia la familia
          begin
               Familia:='';
               Articulo:=LupaFamiliaArticulos(cEmpresa.Text, Familia);
               if Articulo<>'' then
               begin
                    cFamilia.Properties.OnChange:=Nil;
                    cFamilia.Properties.OnChange:=Nil;
                    QLineas.FieldByName('Familia_le').AsString:=Familia;
                    tNomFamilia.Caption:=NomFamilia(cEmpresa.Text, Familia);
                    tNomArticulo.Caption:=NomArticulo(cEmpresa.Text, Familia,Articulo);
                    QLineas.FieldByName('Articulo_le').AsString:=Articulo;
                    cFamilia.Properties.OnChange:=cFamiliaChange;
                    cArticulo.Properties.OnChange:=cArticuloChange;
               end;
          end;
     end;
end;

//-------------------------- LUPA (F2) DE ARTICULOS ----------------------------
procedure TEntradas.cArticuloKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        LupaArticuloClick(Self);
end;

//------------------------ DESPUES DE GRABAR LA CABECERA -----------------------
procedure TEntradas.QMaestroAfterPost(DataSet: TDataSet);
begin
     //Si cambiamos el cliente, la fecha de entrada o el tipo de entrada
     if ((ClienteAnt<>'') and (ClienteAnt<>QMaestro.FieldByName('Cliente_ce').AsString)) or
         ((FechaAnt<>'') and (FechaAnt<>DiaMesAnyo(QMaestro.FieldByName('Fecha_Albaran_ce').AsString))) or
         ((TipoEntradaAnt<>'') and (TipoEntradaAnt<>QMaestro.FieldByName('Tipo_Entrada_ce').AsString)) then
     begin
          ModificarAlmacenes();
     end;
     TipoEntradaAnt:='';
     ClienteAnt:='';
     FechaAnt:='';
end;

procedure TEntradas.ModificarAlmacenes();
Var
   QAux, QAux2: TQuery;
   Lote: String;
begin
     QAux:=TQuery.Create(nil);
     QAux2:=TQuery.Create(nil);
     try
        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
        QAux2.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

        //Lineas de entrada
        QAux.SQL.Add(' SELECT * FROM LINEA_ENTRADAS ' +
                     ' WHERE EMPRESA_LE=' + QuotedStr(QMaestro.FieldByName('Empresa_ce').AsString) +
                     ' AND ALBARAN_LE=' + IntToStr(QMaestro.FieldByName('Albaran_ce').AsInteger));
        QAux.Open;
        //Para cada linea
        While not QAux.Eof do
        begin
             //Modificamos el almacen
             QAux2.Close;
             QAux2.SQL.Clear;
             QAux2.SQL.Add(' UPDATE ALMACENES ' +
                           ' SET FECHA_MODIF_AL=' + QuotedStr(AnyoMesDia(Date())));
             //Cambia el Cliente -->Cambia el Lote
             if (ClienteAnt<>'') and (ClienteAnt<>QMaestro.FieldByName('Cliente_ce').AsString) then
             begin
                  //Leemos el nuevo lote
                  Lote:=LeerLote(QMaestro.FieldByName('Empresa_ce').AsString,
                                 QMaestro.FieldByName('Cliente_ce').AsString);
                  QAux2.SQL.Add(' ,CLIENTE_AL=' + QuotedStr(QMaestro.FieldByName('Cliente_ce').AsString) +
                                ' ,LOTE_AL=' + QuotedStr(Lote));
             end;
             //Cambia la fecha de entrada
             if FechaAnt<>DiaMesAnyo(QMaestro.FieldByName('Fecha_Albaran_ce').AsString) then
                QAux2.SQL.Add(' ,FECHA_ENTRADA_AL=' + QuotedStr(QMaestro.FieldByName('Fecha_Albaran_ce').AsString));

             QAux2.SQL.Add(' ,TIPO_LOTE_AL=' + QuotedStr(QMaestro.FieldByName('Tipo_entrada_ce').AsString));

             QAux2.SQL.Add(' WHERE EMPRESA_AL=' + QuotedStr(QMaestro.FieldByName('Empresa_ce').AsString) +
                           ' AND CLIENTE_AL=' + QuotedStr(ClienteAnt) +
                           ' AND LOTE_AL=' + QuotedStr(QAux.FieldByName('Lote_le').AsString));
             QAux2.ExecSQL;

             //Cambia el Cliente o el Tipo de Entrada
             if (ClienteAnt<>'') and (ClienteAnt<>QMaestro.FieldByName('Cliente_ce').AsString) then
             begin
                  QAux2.Close;
                  QAux2.SQL.Clear;
                  QAux2.SQL.Add(' UPDATE LINEA_ENTRADAS ' +
                                ' SET FECHA_MODIF_LE=' + QuotedStr(AnyoMesDia(Date())));
                  if (ClienteAnt<>'') and (ClienteAnt<>QMaestro.FieldByName('Cliente_ce').AsString) then
                  begin
                       QAux2.SQL.Add(', LOTE_LE=' + QuotedStr(Lote));

                       //Actualizamos el valor del stock y el de mercancia retenida del nuevo cliente
                       ActualizarClienteAdd(QAux.FieldByName('Empresa_le').AsString,
                                            QAux.FieldByName('Familia_le').AsString,
                                            QAux.FieldByName('Articulo_le').AsString,
                                            QMaestro.FieldByName('Cliente_ce').AsString,
                                            Lote,
                                            QAux.FieldByName('Unidades_le').AsFloat);
                       //Actualizamos el valor del stock y el de mercancia retenida del cliente anterior
                       ActualizarClienteDelete(QAux.FieldByName('Empresa_le').AsString,
                                               QAux.FieldByName('Familia_le').AsString,
                                               QAux.FieldByName('Articulo_le').AsString,
                                               ClienteAnt,
                                               QAux.FieldByName('Unidades_le').AsFloat);
                       MessageDlg (Chr(13) + 'El lote ' + QAux.FieldByName('Lote_le').AsString + ' cambia al ' + Lote, mtError,[mbOk],0);
                  end;
                  QAux2.SQL.Add(' WHERE EMPRESA_LE=' + QuotedStr(QAux.FieldByName('Empresa_le').AsString) +
                                ' AND ALBARAN_LE=' + IntToStr(QAux.FieldByName('Albaran_le').AsInteger) +
                                ' AND LOTE_LE=' + QuotedStr(QAux.FieldByName('Lote_le').AsString));
                  QAux2.ExecSQL;
             end;
             QAux.Next;
        end;
      finally
             QAux.Close;
             FreeAndNil(QAux);
             QAux2.Close;
             FreeAndNil(QAux2);
      end;
end;

//------------------------ CONTROL DE TECLAS EN EL TIPO DE ENTRADA -------------
procedure TEntradas.cTipoEntradaKeyPress(Sender: TObject; var Key: Char);
Var
   Pulsacion: char;
begin
     Pulsacion:=UpCase(Key);
     if (Pulsacion='N') or (Pulsacion='I') or (Pulsacion='R') then
     begin
          if not (QMaestro.State in dsEditModes) then  //Si estamos visualizando
             if Pulsacion<>cTipoEntrada.KeyValue then  //Si cambiamos el codigo entonces ponemos en edicion
                QMaestro.Edit;
          if QMaestro.State in dsEditModes then  //Si estamos modificando o insertando
             QMaestro.FieldByName('Tipo_entrada_ce').AsString:=Pulsacion;
     end;
     Key:=#0;
end;

//------------ AL RECIBIR EL FOCO EL TIPO DE ENTRADA ---------------------------
procedure TEntradas.cTipoEntradaEnter(Sender: TObject);
begin
     //Si el tipo de entrada no se puede cambiar pasamos el foco a otro campo
     if cTipoEntrada.ReadOnly then
        cTemperatura.SetFocus;
end;

//----------------- AL ENTRAR EN EL MANEJO -------------------------------------
procedure TEntradas.cManejoEnter(Sender: TObject);
begin
     cManejo.OnExit:=cManejoExit;
end;

//------------------------ AL ACTIVAR EL FORMULARIO ----------------------------
procedure TEntradas.FormActivate(Sender: TObject);
begin
     if PanelClaves.Enabled then
        cAlbaran.SetFocus;
end;

//------------------- AL SALIR DE BULTOS ---------------------------------------
procedure TEntradas.cBultosExit(Sender: TObject);
begin
     if QLineas.State in dsEditModes then
     begin
          //Si el campo esta vacio se pone a CERO
          if cBultos.Text='' then
             QLineas.FieldByName('Bultos_le').AsInteger:=0;
     end;
end;

//------------------- AL SALIR DE ESTUCHES POR BULTO ---------------------------
procedure TEntradas.cEstBultoExit(Sender: TObject);
begin
     if QLineas.State in dsEditModes then
     begin
          //Si el campo esta vacio se pone a CERO
          if cEstBulto.Text='' then
             QLineas.FieldByName('Estuches_Bulto_le').AsInteger:=0;
     end;
end;

//------------------- AL SALIR DE ESTUCHES SUELTOS -----------------------------
procedure TEntradas.cEstSueltosExit(Sender: TObject);
begin
     if QLineas.State in dsEditModes then
     begin
          //Si el campo esta vacio se pone a CERO
          if cEstSueltos.Text='' then
             QLineas.FieldByName('Estuches_Sueltos_le').AsInteger:=0;
     end;
end;

//------------------- AL SALIR DE PALETS ---------------------------------------
procedure TEntradas.cPaletsExit(Sender: TObject);
begin
     if QLineas.State in dsEditModes then
     begin
          //Si el campo esta vacio se pone a CERO
          if cPalets.Text='' then
             QLineas.FieldByName('Palets_le').AsInteger:=0;
     end;
end;

procedure TEntradas.cFechaAlbaranDblClick(Sender: TObject);
var
  sAux: string;
  bPuedoModificar: boolean;
begin
  if QMaestro.FieldByName('Fecha_Factura_ce').AsString<>'' then
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


