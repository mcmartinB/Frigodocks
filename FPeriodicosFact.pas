unit FPeriodicosFact;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ActnMan, ActnCtrls, ExtCtrls, StdCtrls, ComCtrls, DB,
  DBTables, Mask, DBCtrls, Buttons, cxGraphics, cxControls, cxLookAndFeels,
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
  cxTextEdit, cxDBEdit, dxSkinsdxBarPainter, Menus, cxButtons, SimpleSearch,
  dxBar, cxClasses, cxCurrencyEdit;

type
  TPeriodicosFact = class(TForm)
    BarraEstado: TStatusBar;
    Timer1: TTimer;
    QMaestro: TQuery;
    DSMaestro: TDataSource;
    PanelDatos: TPanel;
    QContar: TQuery;
    StaticText2: TStaticText;
    cTarifa: TcxDBTextEdit;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    cImporteThermo: TcxDBTextEdit;
    GroupBox1: TGroupBox;
    StaticText10: TStaticText;
    StaticText11: TStaticText;
    StaticText13: TStaticText;
    StaticText14: TStaticText;
    StaticText15: TStaticText;
    StaticText16: TStaticText;
    cConcepto1a: TcxDBTextEdit;
    cConcepto2a: TcxDBTextEdit;
    cConcepto3a: TcxDBTextEdit;
    cConcepto1b: TcxDBTextEdit;
    cConcepto2b: TcxDBTextEdit;
    cConcepto3b: TcxDBTextEdit;
    QMaestroempresa_pf: TStringField;
    QMaestrocliente_pf: TStringField;
    QMaestrotarifa_pf: TStringField;
    QMaestrohoras1_pf: TFloatField;
    QMaestrohoras2_pf: TFloatField;
    QMaestroimporte_thermoking_pf: TFloatField;
    QMaestroimporte_oficina_pf: TFloatField;
    QMaestrogastos_administra_pf: TFloatField;
    QMaestrootros_servicios_pf: TFloatField;
    QMaestrostatus_factura_pf: TStringField;
    QMaestrotexto1_pf: TStringField;
    QMaestrotexto2_pf: TStringField;
    QMaestroconcepto2a_pf: TStringField;
    QMaestroconcepto2b_pf: TStringField;
    QMaestroimporte_concepto2_pf: TFloatField;
    QMaestroconcepto3a_pf: TStringField;
    QMaestroconcepto3b_pf: TStringField;
    QMaestroimporte_concepto3_pf: TFloatField;
    QMaestrohoras_clima_pf: TFloatField;
    QMaestrokw_thermoking_pf: TIntegerField;
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
    cEmpresa: TEdit;
    StaticText12: TStaticText;
    cCliente: TEdit;
    tNomEmpresa: TPanel;
    tNomcliente: TPanel;
    cLupaClilentes: TSimpleSearch;
    cLupaTarifas: TSimpleSearch;
    cLupaEmpresas: TSimpleSearch;
    cHoras1: TcxDBCurrencyEdit;
    cHoras2: TcxDBCurrencyEdit;
    cImporteCarretilla: TcxDBCurrencyEdit;
    cImporteThermoking: TcxDBCurrencyEdit;
    cElectricidadOfi: TcxDBCurrencyEdit;
    cServAdmin: TcxDBCurrencyEdit;
    cImporteConcepto1: TcxDBCurrencyEdit;
    cImporteConcepto2: TcxDBCurrencyEdit;
    cImporteConcepto3: TcxDBCurrencyEdit;
    StaticText17: TStaticText;
    cConcepto4a: TcxDBTextEdit;
    cConcepto4b: TcxDBTextEdit;
    StaticText18: TStaticText;
    cImporteConcepto4: TcxDBCurrencyEdit;
    StaticText19: TStaticText;
    cConcepto5a: TcxDBTextEdit;
    cConcepto5b: TcxDBTextEdit;
    StaticText20: TStaticText;
    cImporteConcepto5: TcxDBCurrencyEdit;
    QMaestroconcepto4a_pf: TStringField;
    QMaestroconcepto4b_pf: TStringField;
    QMaestroimporte_concepto4_pf: TCurrencyField;
    QMaestroconcepto5_pf: TStringField;
    QMaestroconcepto5b_pf: TStringField;
    QMaestroimporte_concepto5_pf: TCurrencyField;
    bConsumos: TdxBarLargeButton;
    QMaestroimporte_kwthermo_pf: TFloatField;
    QMaestroimporte_carretilla_pf: TFloatField;
    QAux1: TQuery;
    QAux2: TQuery;
    cStatusFactura: TDBRadioGroup;
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
    procedure PanelDatosEnter(Sender: TObject);
    procedure DSMaestroStateChange(Sender: TObject);
    procedure AlMoverRegistro(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Busqueda(Sender: TObject);
    procedure QMaestroAfterInsert(DataSet: TDataSet);
    procedure ColorEnter(Sender: TObject);
    procedure ColorExit(Sender: TObject);
    procedure cEmpresaChange(Sender: TObject);
    procedure cClienteChange(Sender: TObject);
    procedure cLupaEmpresasClick(Sender: TObject);
    procedure cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaClientesClick(Sender: TObject);
    procedure cClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaTarifasClick(Sender: TObject);
    procedure cTarifaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure QMaestroBeforePost(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure bConsumosClick(Sender: TObject);
  private
    {Private declarations}
    SwAlta: Boolean;
    PosRegistro, NRegistros: Integer;
    procedure Mensaje(Texto: string);
    procedure BotonesPosicion;
    function ValidarCabecera(): Boolean;
    function ValidarDetalles(): Boolean;
    function EjecutaQuery(Empresa, Cliente: string): Boolean;
    function EjecutaQueryBus: Boolean;
    procedure QuitarColorAlta();
    procedure PonerColorAlta();
    function SumarElectricidadOfi: currency;
    function SumarElectricidadThermo: currency;
    function SumarElectricidadCarre: currency;

    procedure ActualizaConsumo;
  public
    sEmpresaPer, sClientePer: string;
    { Public declarations }
  end;

var
  PeriodicosFact: TPeriodicosFact;

implementation

uses
  UGLobal, MBaseDatos, BPeriodicosFact, FConsumos;

{$R *.dfm}

//------------------------ CREACION DEL FORMULARIO -----------------------------
procedure TPeriodicosFact.FormCreate(Sender: TObject);
begin
  Top := 1;
  Left := 0;

  SwAlta := False;
  PosRegistro := 0;
  NRegistros := 0;

  cEmpresa.Text := EmpresaGlobal;

  QMaestro.AfterScroll := AlMoverRegistro;
end;

//------------------------ CIERRE DEL FORMULARIO -------------------------------
procedure TPeriodicosFact.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

//----------------------- CIERRRE DEL QUERY DEL FORMULARIO ---------------------
procedure TPeriodicosFact.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
  if QMaestro.state in dsEditModes then
  begin
    case MessageBox(Handle, PChar('¿Desea guardar el registro?'), PChar(Self.Caption), MB_ICONQUESTION + MB_YESNOCANCEL + MB_DEFBUTTON1) of
      IDYES:
        Aceptar(Self);
      IDNO:
        QMaestro.Cancel;
      IDCANCEL:
        CanClose := False;
    end;
  end;
end;

//--------------------- MENSAJES DE LA BARRA DE ESTADO -------------------------
procedure TPeriodicosFact.Mensaje(Texto: string);
begin
  if BarraEstado.SimplePanel then
    BarraEstado.SimpleText := Texto
  else if BarraEstado.Panels.Count = 0 then
  begin
    BarraEstado.SimplePanel := True;
    BarraEstado.SimpleText := Texto;
  end
  else
    BarraEstado.Panels[0].Text := Texto;
  Timer1.Enabled := false;
  Timer1.Enabled := true;
end;

//--------------------- TIMER PARALOS MENSAJES ---------------------------------
procedure TPeriodicosFact.Timer1Timer(Sender: TObject);
begin
  if BarraEstado.SimplePanel then
    BarraEstado.SimpleText := ''
  else if BarraEstado.Panels.Count = 0 then
  begin
    BarraEstado.SimplePanel := True;
    BarraEstado.SimpleText := '';
  end
  else
    BarraEstado.Panels[0].Text := '';
  Timer1.Enabled := False;
end;

//-------------- HABILITAR BOTONES DE POSICION DE REGISTRO ---------------------
procedure TPeriodicosFact.BotonesPosicion;
begin
  if (SwAlta = False) and (QMaestro.State <> dsEdit) then
  begin
    BBusqueda.Enabled := True;
    BSalir.Enabled := True;
    if NRegistros > 0 then
    begin
      BBorrar.Enabled := True;
      BCancelar.Enabled := True;
      BConsumos.Enabled := True;
    end
    else
    begin
      BBorrar.Enabled := False;
      BCancelar.Enabled := False;
      BConsumos.Enabled := False;
    end;
    BAceptar.Enabled := False;
    BAlta.Enabled := True;

    if NRegistros <= 1 then    //1 o ningun registro
    begin
      BPrimero.Enabled := False;
      BAnterior.Enabled := False;
      BSiguiente.Enabled := False;
      BUltimo.Enabled := False;
    end
    else if PosRegistro = NRegistros then   //Ultimo registro
    begin
      BPrimero.Enabled := True;
      BAnterior.Enabled := True;
      BSiguiente.Enabled := False;
      BUltimo.Enabled := False;
    end
    else if PosRegistro = 1 then   //Primer registro
    begin
      BPrimero.Enabled := False;
      BAnterior.Enabled := False;
      BSiguiente.Enabled := True;
      BUltimo.Enabled := True;
    end
    else      //Registros del centro
    begin
      BPrimero.Enabled := True;
      BAnterior.Enabled := True;
      BSiguiente.Enabled := True;
      BUltimo.Enabled := True;
    end;
    BarraEstado.Panels[1].Text := 'Registro ' + IntToStr(PosRegistro) + ' de ' + IntToStr(NRegistros);
  end
  else
  begin
    BBusqueda.Enabled := False;
    BSalir.Enabled := False;
    BBorrar.Enabled := False;
    BConsumos.Enabled := False;
    BAlta.Enabled := False;
    BCancelar.Enabled := True;
    BAceptar.Enabled := True;
  end;
end;

//--------------------- BOTON ALTA ---------------------------------------------
procedure TPeriodicosFact.Alta(Sender: TObject);
begin
  swAlta := True;
  PonerColorAlta();
  Mensaje('Alta de Registro');
  BarraEstado.Panels[1].Text := '';

  NRegistros := 0;
  PosRegistro := 0;

  QMaestro.Close;

  PanelClaves.Enabled := True;

  cEmpresa.Text := EmpresaGlobal;
  cCliente.Text := '';
  cCliente.SetFocus;

  cLupaTarifas.Enabled := False;

     //Botones
  BCancelar.Enabled := True;
  BBusqueda.Enabled := False;
  BAlta.Enabled := False;
  BBorrar.Enabled := False;
  BConsumos.Enabled := False;
  BSalir.Enabled := False;
  BPrimero.Enabled := False;
  BSiguiente.Enabled := False;
  BAnterior.Enabled := False;
  BUltimo.Enabled := False;
end;

//--------------------- BOTON BORRAR -------------------------------------------
procedure TPeriodicosFact.Borrar(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Va a borrarse el registro ¿Está seguro?'), PChar(Self.Caption), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) = IDYES then
  begin
    try
      if not QMaestro.Database.InTransaction then
        QMaestro.Database.StartTransaction;
      QMaestro.Delete;
      if QMaestro.Database.InTransaction then
        QMaestro.Database.Commit;

      if PosRegistro = NRegistros then  //Solo si es el ultimo dec. el numero de reg. actual
        Dec(PosRegistro);
      Dec(NRegistros);     //Dec. el numero de registros total
      BotonesPosicion();   //Actualizamos los botones de direccion

      if NRegistros = 0 then
      begin
        PanelClaves.Enabled := True;
        cEmpresa.Text := EmpresaGlobal;
        cCliente.SetFocus;
        cLupaTarifas.Enabled := False;
      end;
    except
      on E: Exception do
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
procedure TPeriodicosFact.Primero(Sender: TObject);
begin
  PosRegistro := 1;          //Numero de registro en el que estamos
  QMaestro.First;
  BotonesPosicion();
end;

//-------------------------- REGISTRO ANTERIOR ---------------------------------
procedure TPeriodicosFact.Anterior(Sender: TObject);
begin
  if PosRegistro > 1 then
    Dec(PosRegistro);        //Numero de registro en el que estamos
  QMaestro.Prior;
  BotonesPosicion();
end;

//-------------------------- MANTENIMIENTO CONSUMOS ---------------------------------
procedure TPeriodicosFact.bConsumosClick(Sender: TObject);
var
  Aux: TConsumos;
  Oficina: currency;
begin
  sEmpresaPer := cEmpresa.Text;
  sClientePer := cCliente.Text;
  try
    Aux := TConsumos.Create(Self);
    with Aux do
    begin
      sEmpresa := sEmpresaPer;
      sCliente := sClientePer;
      bBusqueda.Visible := ivNever;
      cEmpresa.Text := sEmpresa;
      cCliente.Text := sCliente;
      cEmpresa.ReadOnly := True;
      cCliente.ReadOnly := True;
      ShowModal;
    end;
  finally
    FreeAndNil(Aux);
  end;

  if not (QMaestro.State in dsEditModes) then
    QMaestro.Edit;
  QMaestro.FieldByName('importe_oficina_pf').AsFloat := SumarElectricidadOfi;
  QMaestro.FieldByName('importe_kwthermo_pf').AsFloat := SumarElectricidadThermo;
  QMaestro.FieldByName('importe_carretilla_pf').AsFloat := SumarElectricidadCarre;
  QMaestro.Post;

  BotonesPosicion();
end;

//-------------------------- REGISTRO SIGUIENTE --------------------------------
procedure TPeriodicosFact.Siguiente(Sender: TObject);
begin
  if PosRegistro < NRegistros then
    Inc(PosRegistro);       //Numero de registro en el que estamos
  QMaestro.Next;
  BotonesPosicion();
end;

function TPeriodicosFact.SumarElectricidadCarre: currency;
var
  QAux: TQuery;
begin
  QAux := TQuery.Create(nil);
  try
    QAux.DatabaseName := DMBaseDatos.BDFrigo.DatabaseName;

        //MANTENIMIENTO CLIENTE
    QAux.SQL.Add(' SELECT SUM(TOTAL_CS) TOTAL_CS FROM CONSUMOS' + '   JOIN CONCEPTOS ON EMPRESA_C = EMPRESA_CS AND CODIGO_C = CONCEPTO_CS AND TIPO_C = ''C'' ' +   // Electricidad Carretilla
      ' WHERE EMPRESA_CS=' + QuotedStr(QMaestro.FieldByName('EMPRESA_PF').AsString) + ' AND CLIENTE_CS=' + QuotedStr(QMaestro.FieldByName('CLIENTE_PF').AsString));
    QAux.Open;

    if QAux.FieldByName('TOTAL_CS').AsCurrency <> null then
      Result := QAux.FieldByName('TOTAL_CS').AsCurrency
    else
      Result := 0;

  finally
    QAux.Close;
    FreeAndNil(QAux);
  end;
end;

function TPeriodicosFact.SumarElectricidadOfi: currency;
var
  QAux: TQuery;
begin
  QAux := TQuery.Create(nil);
  try
    QAux.DatabaseName := DMBaseDatos.BDFrigo.DatabaseName;

        //MANTENIMIENTO CLIENTE
    QAux.SQL.Add(' SELECT SUM(TOTAL_CS) TOTAL_CS FROM CONSUMOS' + '   JOIN CONCEPTOS ON EMPRESA_C = EMPRESA_CS AND CODIGO_C = CONCEPTO_CS AND TIPO_C = ''O'' ' +   // Electricidad Oficina
      ' WHERE EMPRESA_CS=' + QuotedStr(QMaestro.FieldByName('EMPRESA_PF').AsString) + ' AND CLIENTE_CS=' + QuotedStr(QMaestro.FieldByName('CLIENTE_PF').AsString));
    QAux.Open;

    if QAux.FieldByName('TOTAL_CS').AsCurrency <> null then
      Result := QAux.FieldByName('TOTAL_CS').AsCurrency
    else
      Result := 0;

  finally
    QAux.Close;
    FreeAndNil(QAux);
  end;
end;

function TPeriodicosFact.SumarElectricidadThermo: currency;
var
  QAux: TQuery;
begin
  QAux := TQuery.Create(nil);
  try
    QAux.DatabaseName := DMBaseDatos.BDFrigo.DatabaseName;

        //MANTENIMIENTO CLIENTE
    QAux.SQL.Add(' SELECT SUM(TOTAL_CS) TOTAL_CS FROM CONSUMOS' + '   JOIN CONCEPTOS ON EMPRESA_C = EMPRESA_CS AND CODIGO_C = CONCEPTO_CS AND TIPO_C = ''T'' ' +   // Electricidad Thermoking
      ' WHERE EMPRESA_CS=' + QuotedStr(QMaestro.FieldByName('EMPRESA_PF').AsString) + ' AND CLIENTE_CS=' + QuotedStr(QMaestro.FieldByName('CLIENTE_PF').AsString));
    QAux.Open;

    if QAux.FieldByName('TOTAL_CS').AsCurrency <> null then
      Result := QAux.FieldByName('TOTAL_CS').AsCurrency
    else
      Result := 0;

  finally
    QAux.Close;
    FreeAndNil(QAux);
  end;
end;

//-------------------------- ULTIMO REGISTRO -----------------------------------
procedure TPeriodicosFact.Ultimo(Sender: TObject);
begin
  PosRegistro := NRegistros; //Numero de registro en el que estamos
  QMaestro.Last;
  BotonesPosicion();
end;

//----------------------------- BUSQUEDA ---------------------------------------
procedure TPeriodicosFact.Busqueda(Sender: TObject);
var
  Aux: TBusquedaPeriodicos;
begin
  try
    Aux := TBusquedaPeriodicos.Create(Self);
    with Aux do
    begin
      AceptarTodos := True;
      ShowModal;
      if EmpresaBus <> '' then   //Seleccionamos un registro del grid resultado
      begin
        if EjecutaQuery(EmpresaBus, ClienteBus) then
        begin
          Self.PanelClaves.Enabled := False;
          cLupaTarifas.Enabled := True;
        end
        else  //Si no hay registros que mostrar
        begin
          Self.PanelClaves.Enabled := True;
          cEmpresa.Text := EmpresaGlobal;
          cCliente.Text := '';
          cCliente.SetFocus;
          cLupaTarifas.Enabled := False;
          Mensaje('Registro no existe');
        end;
      end
      else if ModalResult = mrOk then  //Aceptamos desde el boton ACEPTAR (Devolvemos todos los registros del filtro)
      begin
        if EjecutaQueryBus() then
        begin
          Self.PanelClaves.Enabled := False;
          cLupaTarifas.Enabled := True;
        end
        else  //Si no hay registros que mostrar
        begin
          Self.PanelClaves.Enabled := True;
          cEmpresa.Text := EmpresaGlobal;
          cCliente.Text := '';
          cCliente.SetFocus;
          cLupaTarifas.Enabled := False;
          Mensaje('Registro no existe');
        end;
      end
    end;
  finally
    FreeAndNil(Aux);
  end;
end;

//------------------------ BOTON ACEPTAR ----------------------------------------
procedure TPeriodicosFact.Aceptar(Sender: TObject);
var
  Posicion: TBookmark;
begin
  if ValidarCabecera() and ValidarDetalles() then   //Comprobamos que los datos son correctos
  begin
    if QMaestro.State in [dsEdit, dsInsert] then
    begin
               //GRABACION DEL REGISTRO
      try
        if QMaestro.State = dsEdit then  //Modificar
        begin
          Posicion := QMaestro.GetBookmark;

          if not QMaestro.Database.InTransaction then
            QMaestro.Database.StartTransaction;
          QMaestro.Post;
          if QMaestro.Database.InTransaction then
            QMaestro.Database.Commit;

          ActualizaConsumo;

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

          EjecutaQuery(cEmpresa.Text, cCliente.Text);     //Refrescamos el Query -- En algun caso se perdia el registro activo

          swAlta := False;
          QuitarColorAlta();

          PosRegistro := 1;
          NRegistros := 1;
                       //Finalizacion de la grabacion
          Mensaje('Registro Grabado');
        end;
      except
        on E: Exception do
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
procedure TPeriodicosFact.Cancelar(Sender: TObject);
begin
  if QMaestro.State in dsEditModes then
  begin
    case MessageBox(Handle, PChar('¿Desea cancelar los cambios?'), PChar(Self.Caption), MB_ICONQUESTION + MB_YESNOCANCEL + MB_DEFBUTTON1) of
      IDYES:
        if QMaestro.State = dsEdit then   //Modificacion
        begin
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
  end
  else
    QMaestro.Close;

      //A partir de aqui se hace si cancelo un alta
  PanelClaves.Enabled := True;
  cLupaTarifas.Enabled := False;
  SwAlta := False;

  QuitarColorAlta();
  cEmpresa.Text := EmpresaGlobal;
  cCliente.Text := '';
  cCliente.SetFocus;

  PosRegistro := 0;
  NRegistros := 0;

  Mensaje('Cambios Ignorados');

  BotonesPosicion();
end;

//----------------------------- SALIR ------------------------------------------
procedure TPeriodicosFact.Salir(Sender: TObject);
begin
  Close;
end;

//-------------------------- VALIDACION DE DATOS CABECERA ----------------------
function TPeriodicosFact.ValidarCabecera(): Boolean;
begin
  Result := True;
  if cEmpresa.Text = '' then
  begin
    Result := False;
    Mensaje('Falta el código de empresa');
    cEmpresa.SetFocus;
  end
  else if cCliente.Text = '' then
  begin
    Result := False;
    Mensaje('Falta el código de cliente');
    cCliente.SetFocus;
  end
  else if tNomEmpresa.Caption = '' then
  begin
    Result := False;
    Mensaje('La empresa no existe');
    cEmpresa.SetFocus;
  end
  else if tNomCliente.Caption = '' then
  begin
    Result := False;
    Mensaje('El Cliente no existe');
    cCliente.SetFocus;
  end;
end;

//-------------------------- VALIDACION DE DATOS DETALLES-----------------------
function TPeriodicosFact.ValidarDetalles(): Boolean;
begin
  Result := True;
end;

//------------------- FOCO EN EL PANEL DE DATOS --------------------------------
procedure TPeriodicosFact.PanelDatosEnter(Sender: TObject);
begin
  if QMaestro.IsEmpty then
  begin
    if ValidarCabecera() then
    begin
      if not SwAlta then  //Si no es alta
      begin
        if not EjecutaQuery(cEmpresa.Text, cCliente.Text) then   //Si no hay datos
        begin
          cLupaTarifas.Enabled := False;
          cCliente.SetFocus;
          Mensaje('El registro no existe');
        end
        else  //Si hay datos
        begin
          PanelClaves.Enabled := False;
          cLupaTarifas.Enabled := True;
        end;
      end
      else
      begin
                   //No existe -> Hacemos el alta
        if not EjecutaQuery(cEmpresa.Text, cCliente.Text) then   //Si no hay datos
        begin
          PanelClaves.Enabled := False;
          cLupaTarifas.Enabled := True;
          cTarifa.SetFocus;
          QMaestro.append;
          Mensaje('Alta de Registro');
        end
        else  //El registro ya existe
        begin
          Mensaje('El registro ya existe');
          QMaestro.Close;
          BarraEstado.Panels[1].Text := '';
          cLupaTarifas.Enabled := False;
          cCliente.SetFocus;
        end;
      end;
    end;
  end;
end;

//------------------------ APERTURA DE LA QUERY PRINCIPAL ----------------------
function TPeriodicosFact.EjecutaQuery(Empresa, Cliente: string): Boolean;
begin
  Result := False;
  NRegistros := 0;
  PosRegistro := 0;
  try
    QMaestro.Close;
    QMaestro.SQL.Clear;
    QMaestro.SQL.Add(' SELECT * FROM PERIODICOS_FACTURACION ' + ' WHERE EMPRESA_PF=' + QuotedStr(Empresa) + ' AND CLIENTE_PF=' + QuotedStr(Cliente));

    QMaestro.Open;
    if QMaestro.IsEmpty then
      Result := False
    else
    begin
      try    //Contamos los Registros
        with QContar do
        begin
          Close;
          SQL.Clear;
          SQL.Add(' SELECT COUNT(*) AS NREGISTROS FROM PERIODICOS_FACTURACION ' + ' WHERE EMPRESA_PF=' + QuotedStr(Empresa) + ' AND CLIENTE_PF=' + QuotedStr(Cliente));
          Open;
          NRegistros := FieldByName('NRegistros').AsInteger;  //Contamos los registros
          PosRegistro := 1;
        end;
      finally
        QContar.Close;
      end;
      Result := True;
    end;
    BotonesPosicion();
  except
    on E: Exception do
      CapturaErrores(E);
  end;
end;

//---------------- APERTURA DE LA QUERY PRINCIPAL DESDE LA BUSQUEDA-------------
function TPeriodicosFact.EjecutaQueryBus: Boolean;
begin
  Result := False;
  NRegistros := 0;
  PosRegistro := 0;
  try
    QMaestro.Close;
    QMaestro.SQL.Clear;
    QMaestro.SQL.Add('SELECT * FROM PERIODICOS_FACTURACION ' + 'ORDER BY EMPRESA_PF, CLIENTE_PF');
    QMaestro.Open;
    if QMaestro.IsEmpty then
      Result := False
    else
    begin
      try    //Contamos los Registros
        with QContar do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT COUNT(*) AS NREGISTROS FROM PERIODICOS_FACTURACION');
          Open;
          NRegistros := FieldByName('NRegistros').AsInteger;  //Contamos los registros
          PosRegistro := 1;
        end;
      finally
        QContar.Close;
      end;
      Result := True;
    end;
    BotonesPosicion();
  except
    on E: Exception do
      CapturaErrores(E);
  end;
end;

procedure TPeriodicosFact.ActualizaConsumo;
begin

//     QAux1.SQL.Clear;
//     QAux1.SQL.ADD(' select facturado_cs from consumos ' +
//                  ' where empresa_cs = ' +  QuotedStr(QMaestro.FieldByName('empresa_pf').AsString) +
//                  '  and cliente_cs = ' +  QuotedStr(QMaestro.FieldByName('cliente_pf').AsString) );
//     QAux1.Open;

//     if (( QMaestro.FieldByName('status_factura_pf').AsString = 'N' ) and
//        ( QAux1.fieldbyname('facturado_cs').AsString = 'S' )) then
//     begin
       QAux2.SQL.Clear;
       QAux2.SQL.Add(' UPDATE CONSUMOS ' +
                    ' SET FACTURADO_CS=' + QuotedStr(QMaestro.FieldByName('status_factura_pf').AsString) +
                    ' WHERE EMPRESA_CS=' + QuotedStr(QMaestro.FieldByName('empresa_pf').AsString) +
                    ' AND CLIENTE_CS=' + QuotedStr(QMaestro.FieldByName('cliente_pf').AsString) );
       QAux2.ExecSql;
//     end;
end;

//-------------------- EVENTO SCROLL -------------------------------------------
procedure TPeriodicosFact.AlMoverRegistro(DataSet: TDataSet);
begin
  if SwAlta = False then  //El estado es de visualizacion
  begin
    cEmpresa.Text := QMaestro.FieldByName('EMPRESA_PF').AsString;  //No estan enganchados a BD y debemos asignarlos a mano
    cCliente.Text := QMaestro.FieldByName('CLIENTE_PF').AsString;
  end;
end;

//--------------------- CAMBIO DE ESTADO DEL DATA SOURCE -----------------------
procedure TPeriodicosFact.DSMaestroStateChange(Sender: TObject);
begin
  BAceptar.Enabled := QMaestro.State in dsEditModes;
  if QMaestro.State in dsEditModes then
  begin
    BPrimero.Enabled := False;
    BAnterior.Enabled := False;
    BSiguiente.Enabled := False;
    BUltimo.Enabled := False;
    BBorrar.Enabled := False;
    BConsumos.Enabled := False;
    BAlta.Enabled := False;
    BBusqueda.Enabled := False;
  end;
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TPeriodicosFact.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = 109) and BBorrar.Enabled then                     //Baja
    Borrar(Self)
  else if (Key = 107) and BAlta.Enabled then                  //Alta
  begin
    Key := 0;
    Application.ProcessMessages;
    Alta(Self);
  end
  else if (Key = VK_F5) and BAceptar.Enabled then        //F5 graba
    Aceptar(Self)
  else if (Key = VK_F6) and BBusqueda.Enabled then  //F6 busqueda experta
    Busqueda(Self)
  else if Key = 40 then                             //Flecha arriba
    PostMessage(Handle, WM_NEXTDLGCTL, 0, 0)
  else if Key = 38 then                        //Flecha abajo
    PostMessage(Handle, WM_NEXTDLGCTL, 1, 0);
end;


//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TPeriodicosFact.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
  end
  else if Key = #27 then
  begin
    Key := #0;
    if BCancelar.Enabled then
      Cancelar(Self)
    else
      Close;
  end;
end;

//---------------------- DESPUES DE INSERTAR -----------------------------------
procedure TPeriodicosFact.QMaestroAfterInsert(DataSet: TDataSet);
begin
  QMaestro.FieldByName('EMPRESA_PF').AsString := cEmpresa.Text;
  QMaestro.FieldByName('CLIENTE_PF').AsString := cCliente.Text;
  QMaestro.FieldByName('STATUS_FACTURA_PF').AsString := 'N';
end;

//---------------------- PONE EL COLOR DE FOCO DE LOS CAMPOS CLAVES ------------
procedure TPeriodicosFact.ColorEnter(Sender: TObject);
begin
  if Sender is TEdit then           //Si el componente es un TDBEdit
  begin
    if not SwAlta then
      TEdit(Sender).Color := clMoneyGreen;
  end;
end;

//---------------------- QUITA EL COLOR DE FOCO DE LOS CAMPOS CLAVE ------------
procedure TPeriodicosFact.ColorExit(Sender: TObject);
begin
  if Sender is TEdit then           //Si el componente es un TDBEdit
  begin
    if not SwAlta then
      TEdit(Sender).Color := clWindow;
    if Length(TEdit(Sender).Text) > 0 then
      TEdit(Sender).Text := RellenarCeros(TEdit(Sender).Text, TEdit(Sender).MaxLength, 'I');
  end;
end;

//---------------------- QUITA EL COLOR DE ALTA DE LOS CAMPOS CLAVE ------------
procedure TPeriodicosFact.QuitarColorAlta();
begin
  cEmpresa.Color := clWindow;
  cCliente.Color := clWindow;
end;

//---------------------- PONE EL COLOR DE ALTA DE LOS CAMPOS CLAVE -------------
procedure TPeriodicosFact.PonerColorAlta();
begin
  cEmpresa.Color := clYellow;
  cCliente.Color := clYellow;
end;

//----------------------- CAMBIO DE LA EMPRESA ---------------------------------
procedure TPeriodicosFact.cEmpresaChange(Sender: TObject);
var
  Empresa: string;
begin
  Empresa := RellenarCeros(cEmpresa.Text, cEmpresa.MaxLength, 'I');

  tNomEmpresa.Caption := NomEmpresa(Empresa);
  tNomCliente.Caption := NomCliente(Empresa, cCliente.Text);
end;

//----------------------- CAMBIO DEL CLIENTE -----------------------------------
procedure TPeriodicosFact.cClienteChange(Sender: TObject);
begin
  tNomCliente.Caption := NomCliente(cEmpresa.Text, RellenarCeros(cCliente.Text, cCliente.MaxLength, 'I'));
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TPeriodicosFact.cLupaEmpresasClick(Sender: TObject);
var
  CodEmpresa: string;
begin
  CodEmpresa := LupaEmpresas();
  if CodEmpresa <> '' then
    cEmpresa.Text := CodEmpresa;
  cEmpresa.SetFocus;
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TPeriodicosFact.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F2 then
    cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TPeriodicosFact.cLupaClientesClick(Sender: TObject);
var
  CodCliente: string;
begin
  if cEmpresa.Text <> '' then
  begin
    CodCliente := LupaClientes(RellenarCeros(cEmpresa.Text, cEmpresa.MaxLength, 'I'));
    if CodCliente <> '' then
      cCliente.Text := CodCliente;
    cCliente.SetFocus;  
  end
  else
  begin
    MessageDlg(Chr(13) + 'Seleccione antes la empresa', mtError, [mbOk], 0);
    cEmpresa.SetFocus;
  end;
end;

//-------------------------- LUPA (F2) DE CLIENTES -----------------------------
procedure TPeriodicosFact.cClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F2 then
    cLupaClientesClick(Self);
end;

//-------------------------- LUPA DE TARIFAS -----------------------------------
procedure TPeriodicosFact.cLupaTarifasClick(Sender: TObject);
var
  Tarifa: string;
begin
  Tarifa := LupaTarifas(cEmpresa.Text);
  if not (QMaestro.State in dsEditModes) then
  begin
    if Tarifa <> '' then
    begin
      QMaestro.Edit;
      QMaestro.FieldByName('Tarifa_pf').AsString := Tarifa;
    end;
  end
  else if Tarifa <> '' then
    QMaestro.FieldByName('Tarifa_pf').AsString := Tarifa;
  cTarifa.SetFocus;  
end;

//-------------------------- LUPA (F2) DE TARIFAS ------------------------------
procedure TPeriodicosFact.cTarifaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F2 then
    cLupaTarifasClick(Self);
end;

procedure TPeriodicosFact.QMaestroBeforePost(DataSet: TDataSet);
begin
  if QMaestro['tarifa_pf'] = '' then
    QMaestro['tarifa_pf'] := NULL;
end;

procedure TPeriodicosFact.FormActivate(Sender: TObject);
begin
  cCliente.SetFocus;
end;

end.

