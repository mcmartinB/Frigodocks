unit FPrincipal;

interface
                                
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, UGLobal, ComCtrls, StdCtrls, QRPrntr, untInterfaces,
  jpeg, ExtCtrls, DBTables, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  cxGroupBox;

type
  TPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    M_MANTENIMIENTOS: TMenuItem;
    M_LISTADOS: TMenuItem;
    M_PROCESOS: TMenuItem;
    M_IMPORTACION: TMenuItem;
    M_ADMINISTRACION: TMenuItem;
    M_CLIENTES: TMenuItem;
    M_TARIFAS: TMenuItem;
    M_PERIODICOS_FACT: TMenuItem;
    M_FACTURAS: TMenuItem;
    M_COBROS: TMenuItem;
    M_ALMACENES: TMenuItem;
    M_FAMILIAS: TMenuItem;
    M_ARTICULOS_CLIENTE: TMenuItem;
    M_UNIDADES_MEDIDA: TMenuItem;
    ML_EMPRESAS: TMenuItem;
    ML_CLIENTES: TMenuItem;
    ML_TARIFAS: TMenuItem;
    ML_PERIODICOS_FACT: TMenuItem;
    ML_FACTURAS: TMenuItem;
    ML_COBROS: TMenuItem;
    ML_ALMACENES: TMenuItem;
    ML_ENTRADAS: TMenuItem;
    ML_SALIDAS: TMenuItem;
    ML_ARTICULOS: TMenuItem;
    ML_ARTICULOS_CLIENTE: TMenuItem;
    ML_FAMILIAS: TMenuItem;
    ML_UNIDADES_MEDIDA: TMenuItem;
    ML_KILOS_CLIENTE: TMenuItem;
    ML_MOVIMIENTOS_LOTE: TMenuItem;
    ML_MOVIMIENTOS_CLI: TMenuItem;
    M_ENTRADAS: TMenuItem;
    M_SALIDAS: TMenuItem;
    M_FACTURACION: TMenuItem;
    M_REPETIR_FACTURA: TMenuItem;
    M_CONTABILIZACION: TMenuItem;
    M_PROCESO_AUTORIZ: TMenuItem;
    M_PROCESO_CHEQUEO: TMenuItem;
    M_USUARIOS: TMenuItem;
    ML_USUARIOS: TMenuItem;
    M_DESCARGA_DATOS: TMenuItem;
    M_Salir: TMenuItem;
    M_ARTICULOS: TMenuItem;
    M_EMPRESAS: TMenuItem;
    M_CONFIG_CORREO: TMenuItem;
    M_COPIA_SEGURIDAD: TMenuItem;
    M_CAMBIO_ARTI_FAM: TMenuItem;
    ML_MOVIMIENTOS_LOTES: TMenuItem;
    M_CONCEPTOS: TMenuItem;
    procedure MenuTarifas(Sender: TObject);
    procedure MenuFamilias(Sender: TObject);
    procedure MenuSalir(Sender: TObject);
    procedure MenuUnidadesdeMedida(Sender: TObject);
    procedure MenuPeridicosdeFacturacion(Sender: TObject);
    procedure MenuClientes(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MenuCobros(Sender: TObject);
    procedure MenuArticulos(Sender: TObject);
    procedure MenuAlmacen(Sender: TObject);
    procedure M_EMPRESASClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure M_SalirClick(Sender: TObject);
    procedure M_ARTICULOS_CLIENTEClick(Sender: TObject);
    procedure M_FACTURASClick(Sender: TObject);
    procedure MenuEntradas(Sender: TObject);
    procedure MenuSalidas(Sender: TObject);
    procedure MenuConfiguracionCorrreo(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuFacturacion(Sender: TObject);
    procedure MenuUsuarios(Sender: TObject);
    procedure MenuListadoEmpresas(Sender: TObject);
    procedure MenuListadoFamilias(Sender: TObject);
    procedure MenuListadoUnidadesMedida(Sender: TObject);
    procedure MenuListadoArtculosdeClientes(Sender: TObject);
    procedure MenuListadoArticulos(Sender: TObject);
    procedure MenuListadoClientes(Sender: TObject);
    procedure MenuListadoFicheroTarifas(Sender: TObject);
    procedure ML_ALMACENESClick(Sender: TObject);
    procedure ML_ENTRADASClick(Sender: TObject);
    procedure ML_SALIDASClick(Sender: TObject);
    procedure ML_PERIODICOS_FACTClick(Sender: TObject);
    procedure ML_FACTURASClick(Sender: TObject);
    procedure ML_COBROSClick(Sender: TObject);
    procedure ML_KILOS_CLIENTEClick(Sender: TObject);
    procedure ML_MOVIMIENTOS_LOTEClick(Sender: TObject);
    procedure ML_MOVIMIENTOS_CLIClick(Sender: TObject);
    procedure M_PROCESO_AUTORIZClick(Sender: TObject);
    procedure M_PROCESO_CHEQUEOClick(Sender: TObject);
    procedure ML_USUARIOSClick(Sender: TObject);
    procedure M_DESCARGA_DATOSClick(Sender: TObject);
    procedure M_COPIA_SEGURIDADClick(Sender: TObject);
    procedure M_CONTABILIZACIONClick(Sender: TObject);
    procedure M_REPETIR_FACTURAClick(Sender: TObject);
    procedure RestaurarCopiadeSeguridad1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure M_CAMBIO_ARTI_FAMClick(Sender: TObject);
    procedure ML_MOVIMIENTOS_LOTESClick(Sender: TObject);
    procedure M_CONSUMOClick(Sender: TObject);
    procedure M_CONCEPTOSClick(Sender: TObject);
  private
    { Private declarations }
    ErrorPermisos: Boolean;
    procedure CrearVentana(Tipo:TComponentClass);
    function  ConfigurarPermisosMenu(): Boolean;
    function  Permiso(Menu, TipoUsuario: String): Boolean;
  public
    { Public declarations }
  end;

var
   Principal: TPrincipal;

implementation

uses DM, MBaseDatos, FEmpresas, FFacturas, FClientes, FTarifas, FPeriodicosFact, FCobros,
     FAlmacenes, FArticulos, FArticulosClientes, FFamilias, FUnidadesMedida, FConceptos,
     FLEmpresas, FLClientes, FLTarifas, FLPeriodicos, FLAlmacenes, FLFacturas,
     FLCobros, FLEntradas, FLSalidas, FLArticulos, FLArticulosCliente, FLUnidades,
     FLFamilias, FLKilosCliente, FLMovimientosLote, FLMovimientosLotesEx, FLMovimientosCliente,
     FEntradas, FSalidas, FFacturacion, FRepeticionFactura, FContabilizacion, FConsumos, 
     FAutorizacion, FLChequeoLotes, FCambioFamiliaArticulo, FUsuarios,
     LUsuarios, FCorreo, FDescargarDatos, dlgPreview;
{
uses
      TraspasoBD,
      LTarifasLista,
      FRestaurarCopiaSeguridad,

}
{$R *.dfm}
//----------------------- CREA VENTANAS MDI ------------------------------------
procedure TPrincipal.CrearVentana(Tipo:TComponentClass);
var
   i:Integer;
begin
     //Mirar a ver si esta ya creado
     for i:=MDIChildCount-1 downto 0 do
     begin
          //Si la Ventana ya existe
          if MDIChildren[i].ClassType=Tipo then
          begin
               MDIChildren[i].Show;
               Exit;
          end;
     end;

     //Para que los form maximizados aparezcan desde el inicio maximizados
     LockWindowUpdate(Self.Handle);
     try
        Tipo.Create(Self);
     finally
            LockWindowUpdate(0);
     end;
end;

//--------------------- MANTENIMIENTO DE FAMILIAS ------------------------------
procedure TPrincipal.MenuTarifas(Sender: TObject);
begin
     CrearVentana(TTarifas);
end;

//--------------------- MANTENIMIENTO DE FAMILIAS ------------------------------
procedure TPrincipal.MenuFamilias(Sender: TObject);
begin
     CrearVentana(TFamilias);
end;

//--------------------- MANTENIMIENTO DE ALMACENES -----------------------------
procedure TPrincipal.MenuAlmacen(Sender: TObject);
begin
     CrearVentana(TAlmacenes);
end;

//--------------------- MANTENIMIENTO DE UNIDADES DE MEDIDA --------------------
procedure TPrincipal.MenuUnidadesdeMedida(Sender: TObject);
begin
     CrearVentana(TUnidadesMedida);
end;

//----------------- MANTENIMIENTO DE PERIODICOS DE FACTURACION -----------------
procedure TPrincipal.MenuPeridicosdeFacturacion(Sender: TObject);
begin
     CrearVentana(TPeriodicosFact);
end;

//--------------------- MANTENIMIENTO DE CLIENTES ------------------------------
procedure TPrincipal.MenuClientes(Sender: TObject);
begin
     CrearVentana(TClientes);
end;

//---------------------- MANTENIMIENTO DE COBROS -------------------------------
procedure TPrincipal.MenuCobros(Sender: TObject);
begin
     CrearVentana(TCobros);
end;

//---------------------- MANTENIMIENTO DE ARTICULOS ----------------------------
procedure TPrincipal.MenuArticulos(Sender: TObject);
begin
     CrearVentana(TArticulos);
end;

//----------------------- MANTENIMIENTO DE ARTICULOS DE CLIENTE ----------------
procedure TPrincipal.M_ARTICULOS_CLIENTEClick(Sender: TObject);
begin
     CrearVentana(TArticulosClientes);
end;

//-------------------- SALIR DE LA APLICACION ----------------------------------
procedure TPrincipal.MenuSalir(Sender: TObject);
begin
     Principal.Close;
end;

//--------------------------- ACTIVACION DEL FORMULARIO ------------------------
procedure TPrincipal.FormActivate(Sender: TObject);
begin
     Self.Top:=0;
     Self.Left:=0;
     if ErrorPermisos then
        Close;
end;

//----------------------- MANTENIMIENTO DE EMPRESAS ----------------------------
procedure TPrincipal.M_EMPRESASClick(Sender: TObject);
begin
     CrearVentana(TEmpresas);
end;

//------------------------ CIERRE DEL PROGRAMA PRINCIPAL -----------------------
procedure TPrincipal.FormCloseQuery(Sender: TObject;  var CanClose: Boolean);
begin
     if not ErrorPermisos then //Si no hay errores al configurar los permisos de usuario
     begin
          case MessageBox(Handle, PChar('¿Desea salir del programa?'),
                          PChar(Self.Caption),
                          MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1 ) of
               IDYES:
                     CanClose:=True;
               IDNO:
                    CanClose:=False;
          end;
     end
     else
         CanClose:=True;
end;

//------------------------- SALIR DEL PROGRAMA ---------------------------------
procedure TPrincipal.M_SalirClick(Sender: TObject);
begin
     Close;
end;

//------------------------- MANTENIMIENTO DE FACTURAS --------------------------
procedure TPrincipal.M_FACTURASClick(Sender: TObject);
begin
     CrearVentana(TFacturas);
end;

//-------------------------- MANTENIMIENTO DE ENTRADAS -------------------------
procedure TPrincipal.MenuEntradas(Sender: TObject);
begin
     CrearVentana(TEntradas);
end;

//-------------------------- MANTENIMIENTO DE SALIDAS --------------------------
procedure TPrincipal.MenuSalidas(Sender: TObject);
begin
     CrearVentana(TSalidas);
end;

//----------------- MANTENIMIENTO DE LA CONFIGURACION DE CORREO ----------------
procedure TPrincipal.MenuConfiguracionCorrreo(Sender: TObject);
begin
     CrearVentana(TCorreo);
end;

procedure TPrincipal.FormShow(Sender: TObject);
begin
    //Registrar preview
    RegisterPreviewClass(TPreviewInterface);

    Self.MakeFullyVisible;
end;

//-------------------- PROCESO DE FACTURACION ----------------------------------
procedure TPrincipal.MenuFacturacion(Sender: TObject);
begin
     CrearVentana(TFacturacion);
end;

//-------------------- MANTENIMIENTO DE USUARIOS -------------------------------
procedure TPrincipal.MenuUsuarios(Sender: TObject);
begin
     CrearVentana(TUsuarios);
end;

//-------------------- LISTADO DE EMPRESAS -------------------------------------
procedure TPrincipal.MenuListadoEmpresas(Sender: TObject);
begin
     CrearVentana(TListadoEmpresas);
end;

//-------------------- LISTADO DE FAMILIAS -------------------------------------
procedure TPrincipal.MenuListadoFamilias(Sender: TObject);
begin
     CrearVentana(TListadoFamilias);
end;

//-------------------- LISTADO DE UNIDADES -------------------------------------
procedure TPrincipal.MenuListadoUnidadesMedida(Sender: TObject);
begin
     CrearVentana(TListadoUnidades);
end;

//-------------------- LISTADO DE ARTICULOS DE CLIENTE -------------------------
procedure TPrincipal.MenuListadoArtculosdeClientes(Sender: TObject);
begin
     CrearVentana(TListadoArticulosCliente);
end;

//-------------------- LISTADO DE ARTICULOS ------------------------------------
procedure TPrincipal.MenuListadoArticulos(Sender: TObject);
begin
    CrearVentana(TListadoArticulos);
end;

//-------------------- LISTADO DE CLIENTES -------------------------------------
procedure TPrincipal.MenuListadoClientes(Sender: TObject);
begin
     CrearVentana(TListadoClientes);
end;

//-------------------- LISTADO DE TARIFAS --------------------------------------
procedure TPrincipal.MenuListadoFicheroTarifas(Sender: TObject);
begin
     CrearVentana(TListadoTarifas);
end;

//-------------------- LISTADO DE ALMACENES ------------------------------------
procedure TPrincipal.ML_ALMACENESClick(Sender: TObject);
begin
     CrearVentana(TListadoAlmacenes);
end;

//-------------------- LISTADO DE ENTRADAS -------------------------------------
procedure TPrincipal.ML_ENTRADASClick(Sender: TObject);
begin
     CrearVentana(TListadoEntradas);
end;

//-------------------- LISTADO DE SALIDAS -------------------------------------
procedure TPrincipal.ML_SALIDASClick(Sender: TObject);
begin
     CrearVentana(TListadoSalidas);
end;

//-------------------- LISTADO DE PERIODICOS -----------------------------------
procedure TPrincipal.ML_PERIODICOS_FACTClick(Sender: TObject);
begin
     CrearVentana(TListadoPeriodicos);
end;

//-------------------- LISTADO DE FACTURAS -------------------------------------
procedure TPrincipal.ML_FACTURASClick(Sender: TObject);
begin
      CrearVentana(TListadoFacturas);
end;

//-------------------- LISTADO DE COBROS ---------------------------------------
procedure TPrincipal.ML_COBROSClick(Sender: TObject);
begin
     CrearVentana(TListadoCobros);
end;

//-------------------- LISTADO DE KILOS POR CLIENTE ----------------------------
procedure TPrincipal.ML_KILOS_CLIENTEClick(Sender: TObject);
begin
     CrearVentana(TListadoKilosPorCliente);
end;

//-------------------- LISTADO DE MOVIMIENTOS POR LOTE -------------------------
procedure TPrincipal.ML_MOVIMIENTOS_LOTEClick(Sender: TObject);
begin
     CrearVentana(TListadoMovimientosLote);
end;

//-------------------- LISTADO DE MOVIMIENTOS POR LOTES -------------------------
procedure TPrincipal.ML_MOVIMIENTOS_LOTESClick(Sender: TObject);
begin
     CrearVentana(TLMovimientosLotesEx);
end;

//-------------------- LISTADO DE MOVIMIENTOS DE CLIENTE -----------------------
procedure TPrincipal.ML_MOVIMIENTOS_CLIClick(Sender: TObject);
begin
     CrearVentana(TListadoMovimientosCliente);
end;

//--------- PROCESO DE AUTORIZACION DE ENTRADAS DE IMPORTACION  ----------------
procedure TPrincipal.M_PROCESO_AUTORIZClick(Sender: TObject);
begin
     CrearVentana(TAutorizacion);
end;

//--------- CHEQUEO DE LOTES DE IMPORTACION ------------------------------------
procedure TPrincipal.M_PROCESO_CHEQUEOClick(Sender: TObject);
begin
     CrearVentana(TChequeoLotes);
end;

//----------------------- LISTADO DE USUARIOS ----------------------------------
procedure TPrincipal.ML_USUARIOSClick(Sender: TObject);
begin
     Application.ProcessMessages;
     try
        with TQRUsuarios.Create(Application) do  //Creamos dinámicamente el report
        try
           Query1.SQL.Clear;
           Query1.SQL.Add(' SELECT * FROM USUARIOS ' +
                          ' ORDER BY CODIGO_U');
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
     except
           on E:Exception do
                CapturaErrores(E);
     end;
end;

//-------------------------- DESCARGA DE DATOS DE UN AÑO -----------------------
procedure TPrincipal.M_DESCARGA_DATOSClick(Sender: TObject);
begin
     CrearVentana(TDescargaDatos);
end;

//-------------------------- COPIA DE SEGURIDAD DE LA BASE DE DATOS ------------
procedure TPrincipal.M_COPIA_SEGURIDADClick(Sender: TObject);
begin
     CopiaSeguridad();
end;

//-------------------------- CONTABILIZACION -----------------------------------
procedure TPrincipal.M_CONCEPTOSClick(Sender: TObject);
begin
     CrearVentana(TConceptos);
end;

procedure TPrincipal.M_CONSUMOClick(Sender: TObject);
begin
     CrearVentana(TConsumos);
end;

procedure TPrincipal.M_CONTABILIZACIONClick(Sender: TObject);
begin
     CrearVentana(TContabilizacion);
end;

//------------------------ REPETICION DE LA FACTURA ----------------------------
procedure TPrincipal.M_REPETIR_FACTURAClick(Sender: TObject);
begin
     CrearVentana(TRepetionFactura);
end;

//------------------- RECUPERACION DE UNA COPIA DE SEGURIDAD -------------------
procedure TPrincipal.RestaurarCopiadeSeguridad1Click(Sender: TObject);
begin
//     CrearVentana(TRestaurarCopiaSeguridad);
end;

//-------------------- AL CREAR EL FORMULARIO PRINCIPAL ------------------------
procedure TPrincipal.FormCreate(Sender: TObject);
begin
     //La empresa por defecto sera la 001
     EmpresaGlobal:='001';
     ErrorPermisos:=not ConfigurarPermisosMenu();
end;

//----- CONFIGURA EL MENU DEL PROGRAMA SEGUN LOS PERMISOS DEL TIPO DE USUARIO --
function TPrincipal.ConfigurarPermisosMenu(): Boolean;
Var
   NMenus, NSubMenus, i, j: Integer;
begin
     Result:=True;
     try
        i:=0;
        NMenus:=MainMenu1.Items.Count;        //Nº de menus
        MainMenu1.Items[NMenus-1].Visible:=True;
        While i<NMenus-1 do
        begin
             j:=0;
             NSubMenus:=MainMenu1.Items[i].Count;
             MainMenu1.Items[i].Visible:=Permiso(MainMenu1.Items[i].Name, TipoUsuarioGlobal);
             While j<NSubMenus do
             begin
                  MainMenu1.Items[i].Items[j].Visible:=Permiso(MainMenu1.Items[i].Items[j].Name, TipoUsuarioGlobal);
                  Inc(j);
             end;
             Inc(i);
        end;
     except
          on E:Exception do
               begin
                    MessageDlg (Chr(13) + 'Error al configurar los permisos de usuario', mtError,[mbOk],0);
                    Result:=False;
               end;
     end;
end;

//----------- DEVUELVE EL PERMISO PARA UN TIPO DE USUARIO EN UN MENU -----------
function TPrincipal.Permiso(Menu, TipoUsuario: String): Boolean;
Var
   QAux: TQuery;
begin
     QAux:=TQuery.Create(nil);
     try
        With QAux do
        begin
             DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
             SQL.Add(' SELECT PERMISO_PM ' +
                     ' FROM PERMISOS_MENU ' +
                     ' WHERE CODIGO_PM=' + QuotedStr(Menu) +
                     ' AND TIPO_USUARIO_PM=' + QuotedStr(TipoUsuario));
             Open;
             if not IsEmpty() then
                Result:=FieldByName('Permiso_pm').AsString='S'
             else
                 Result:=False;
        end;
     finally
            QAux.Close;
            FreeAndNil(QAux);
     end;
end;

//--- FORMULARIO PARA CAMBIAR EL CODIGO DE LA FAMILIA O CODIGO DE ARTICULO DE UN ARTICULO ---
procedure TPrincipal.M_CAMBIO_ARTI_FAMClick(Sender: TObject);
begin
     CrearVentana(TCambiarFamiliaArticulo);
end;


end.
