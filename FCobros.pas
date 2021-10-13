unit FCobros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ActnMan, ActnCtrls, ExtCtrls, StdCtrls, ComCtrls, DB,
  DBTables, Mask, DBCtrls,
  Buttons, cxGraphics, cxControls, cxLookAndFeels,
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
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxCore,
  cxDateUtils, cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit, cxDBEdit,
  dxSkinsdxBarPainter, dxBar, cxClasses, Menus, cxButtons, SimpleSearch,
  cxCurrencyEdit ;

type
  TCobros = class(TForm)
    BarraEstado: TStatusBar;
    Timer1: TTimer;
    QMaestro: TQuery;
    DSMaestro: TDataSource;
    PanelDatos: TPanel;
    StaticText2: TStaticText;
    QContar: TQuery;
    StaticText4: TStaticText;
    cTipoDocumento: TDBLookupComboBox;
    QTipoCobros: TQuery;
    DSTipoCobros: TDataSource;
    QMaestroempresa_co: TStringField;
    QMaestrocliente_co: TStringField;
    QMaestrofactura_co: TIntegerField;
    QMaestrotipo_cobro_co: TStringField;
    QMaestroimporte_co: TFloatField;
    QMaestrofecha_factura_co: TStringField;
    QMaestrofecha_pago_co: TStringField;
    QTipoCobroscodigo_tc: TStringField;
    QTipoCobrosdescripcion_tc: TStringField;
    QTipoCobrosdes: TStringField;
    QMaestroserial_co: TIntegerField;
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
    StaticText12: TStaticText;
    cEmpresa: TEdit;
    tNomEmpresa: TPanel;
    StaticText1: TStaticText;
    cCliente: TEdit;
    tNomcliente: TPanel;
    StaticText3: TStaticText;
    StaticText38: TStaticText;
    StaticText53: TStaticText;
    cFactura: TEdit;
    cFechaFactura: TcxDateEdit;
    cFechaPago: TcxDateEdit;
    cLupaEmpresas: TSimpleSearch;
    cLupaClientes: TSimpleSearch;
    cLupaFacturas: TSimpleSearch;
    cImporte: TcxDBCurrencyEdit;
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
    procedure QMaestroBeforePost(DataSet: TDataSet);
    procedure QMaestroBeforeEdit(DataSet: TDataSet);
    procedure QTipoCobrosCalcFields(DataSet: TDataSet);
    procedure cLupaEmpresasClick(Sender: TObject);
    procedure cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaClientesClick(Sender: TObject);
    procedure cClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaFacturasClick(Sender: TObject);
    procedure cFacturaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cTipoDocumentoKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);

  private
    {Private declarations}
    SwAlta: Boolean;
    PosRegistro, NRegistros: Integer;
    ImporteAntiguo: Real;
    procedure Mensaje(Texto: String );
    procedure BotonesPosicion;
    function  ValidarCabecera():Boolean;
    function  ValidarDetalles():Boolean;
    function  EjecutaQuery(Empresa, Cliente: String; Factura: Integer; FechaFactura, FechaPago: TDateTime):Boolean;overload;
    function  EjecutaQuery(Serial: Integer):Boolean;overload;
    function  EjecutaQueryBus(WhereBus: String):Boolean;
    procedure QuitarColorAlta();
    procedure PonerColorAlta();
    function  ExisteFactura():Boolean;
    function  ValidarCobro(Estado: TDataSetState):Boolean;
    procedure ModificarMercancia(Empresa, Cliente: String; Importe: Real);
    function  NewSerialCobros():Integer;
  public
    { Public declarations }
  end;

var
   Cobros: TCobros;

implementation

uses UGLobal, MBaseDatos, DM, BCobros;

{$R *.dfm}

//------------------------ CREACION DEL FORMULARIO -----------------------------
procedure TCobros.FormCreate(Sender: TObject);
begin
     Top:=1;
     Left:=0;

     SwAlta:=False;
     PosRegistro:=0;
     NRegistros:=0;

     cEmpresa.Text:=EmpresaGlobal;

     QMaestro.AfterScroll:=AlMoverRegistro;
     QTipoCobros.Open;
end;

//------------------------ CIERRE DEL FORMULARIO -------------------------------
procedure TCobros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
     QTipoCobros.Close;
end;

//----------------------- CIERRRE DEL QUERY DEL FORMULARIO ---------------------
procedure TCobros.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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
procedure TCobros.Mensaje(Texto: String );
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
procedure TCobros.Timer1Timer(Sender: TObject);
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
procedure TCobros.BotonesPosicion;
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
procedure TCobros.Alta(Sender: TObject);
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
     cCliente.Text:='';
     cCliente.SetFocus;
     cFactura.Text:='';
     cFechaFactura.Text:='';
     cFechaPago.Date:=Date();

     //Botones
     BCancelar.Enabled:=True;
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
procedure TCobros.Borrar(Sender: TObject);
begin
     if MessageBox(Handle, PChar('Va a borrarse el registro ¿Está seguro?'),
                   PChar(Self.Caption),
                   MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1)=IDYES then
     begin
          try
             if not QMaestro.Database.InTransaction then
                QMaestro.Database.StartTransaction;
             ModificarMercancia(QMaestro.FieldByName('Empresa_co').AsString,
                                QMaestro.FieldByName('Cliente_co').AsString,
                                -QMaestro.FieldByName('Importe_co').AsFloat);
             QMaestro.Delete;
             if QMaestro.Database.InTransaction then
                QMaestro.Database.Commit;

             if PosRegistro=NRegistros then  //Solo si es el ultimo dec. el numero de reg. actual
                Dec(PosRegistro);
             Dec(NRegistros);     //Dec. el numero de registros total
             BotonesPosicion();   //Actualizamos los botones de direccion

             if NRegistros=0 then
             begin
                  QMaestro.Close;
                  cEmpresa.Text:=EmpresaGlobal;
                  cCliente.Text:='';
                  cFactura.Text:='';
                  cFechaFactura.Text:='';
                  cFechaPago.Text:='';

                  PanelClaves.Enabled:=True;
                  cCliente.SetFocus;
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
end;

//-------------------------- PRIMER REGISTRO -----------------------------------
procedure TCobros.Primero(Sender: TObject);
begin
     PosRegistro:=1;          //Numero de registro en el que estamos
     QMaestro.First;
     BotonesPosicion();
end;

//-------------------------- REGISTRO ANTERIOR ---------------------------------
procedure TCobros.Anterior(Sender: TObject);
begin
     if PosRegistro>1 then
        Dec(PosRegistro);        //Numero de registro en el que estamos
     QMaestro.Prior;
     BotonesPosicion();
end;

//-------------------------- REGISTRO SIGUIENTE --------------------------------
procedure TCobros.Siguiente(Sender: TObject);
begin
     if PosRegistro<NRegistros then
        Inc(PosRegistro);       //Numero de registro en el que estamos
     QMaestro.Next;
     BotonesPosicion();
end;

//-------------------------- ULTIMO REGISTRO -----------------------------------
procedure TCobros.Ultimo(Sender: TObject);
begin
     PosRegistro:=NRegistros; //Numero de registro en el que estamos
     QMaestro.Last;
     BotonesPosicion();
end;

//----------------------------- BUSQUEDA ---------------------------------------
procedure TCobros.Busqueda(Sender: TObject);
Var
   Aux: TBusquedaCobros;
begin
     try
        Aux:=TBusquedaCobros.Create(Self);
        with Aux do
        begin
             ShowModal;
             if SerialBus<>-1 then   //Seleccionamos un registro del grid resultado
             begin
                  if EjecutaQuery(SerialBus) then
                     Self.PanelClaves.Enabled:=False
                  else  //Si no hay registros que mostrar
                  begin
                       Self.PanelClaves.Enabled:=True;
                       cEmpresa.Text:=EmpresaGlobal;
                       cCliente.Text:='';
                       cCliente.SetFocus;
                       cFactura.Text:='';
                       cFechaFactura.Text:='';
                       cFechaPago.Text:='';
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
                       cCliente.Text:='';
                       cCliente.SetFocus;
                       cFactura.Text:='';
                       cFechaFactura.Text:='';
                       cFechaPago.Text:='';
                       Mensaje('Registro no existe');
                 end;
             end
        end;
     finally
            FreeAndNil(Aux);
     end;
end;

//------------------------ BOTON ACEPTAR ----------------------------------------
procedure TCobros.Aceptar(Sender: TObject);
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
                       try
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
                        finally
                               QMaestro.FreeBookmark(Posicion);
                        end;
                  end
                  else   //Alta
                  begin
                       if not QMaestro.Database.InTransaction then
                          QMaestro.Database.StartTransaction;
                       QMaestro.Post;
                       if QMaestro.Database.InTransaction then
                          QMaestro.Database.Commit;

                       swAlta:=False;
                       QuitarColorAlta();

                       PosRegistro:=1;
                       NRegistros:=1;
                       //Finalizacion de la grabacion
                       Mensaje('Registro Grabado');
                  end;
               except
                     on E:EAbort do
                          begin
                               if DMBaseDatos.BDFrigo.InTransaction then
                                  QMaestro.Database.Rollback;
                          end;
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
procedure TCobros.Cancelar(Sender: TObject);
begin
     if QMaestro.State in dsEditModes then
     begin
          case MessageBox(Handle, PChar('¿Desea cancelar los cambios?'),
                           PChar(Self.Caption),
                           MB_ICONQUESTION + MB_YESNOCANCEL + MB_DEFBUTTON1) of
                IDYES:
                      if QMaestro.State = dsEdit then   //Modificacion
                      begin
                           QMaestro.Cancel;
                           BotonesPosicion();
                           Exit;
                      end
                      else   //Alta
                      begin
                           QMaestro.Cancel;
                           QMaestro.Close;
                      end;
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
      PanelClaves.Enabled:=True;
      SwAlta:=False;

      QuitarColorAlta();
      cEmpresa.Text:=EmpresaGlobal;
      cCliente.Text:='';
      cCliente.SetFocus;
      cFactura.Text:='';
      cFechaFactura.Text:='';
      cFechaPago.Text:='';

      PosRegistro:=0;
      NRegistros:=0;

      Mensaje('Cambios Ignorados');

      BotonesPosicion();
end;

//----------------------------- SALIR ------------------------------------------
procedure TCobros.Salir(Sender: TObject);
begin
     Close;
end;

//-------------------------- VALIDACION DE DATOS CABECERA ----------------------
function TCobros.ValidarCabecera():Boolean;
begin
     Result:=True;
     if cEmpresa.Text='' then
     begin
          Result:=False;
          Mensaje('Falta la empresa');
          cEmpresa.SetFocus;
     end
     else if tNomEmpresa.Caption='' then
     begin
          Result:=False;
          Mensaje('La empresa no existe');
          cEmpresa.SetFocus;
     end
     else if cCliente.Text='' then
     begin
          Result:=False;
          Mensaje('Falta el código de cliente');
          cCliente.SetFocus;
     end
     else if tNomCliente.Caption='' then
     begin
          Result:=False;
          Mensaje('El cliente no existe');
          cCliente.SetFocus;
     end
     else if cFactura.Text='' then
     begin
          Result:=False;
          Mensaje('Falta el número de factura');
          cFactura.SetFocus;
     end
     else if not EsNumerico(cFactura.Text) then
     begin
          Result:=False;
          Mensaje('Número de factura incorrecto');
          cFactura.SetFocus;
     end
     else if cFechaFactura.Text='' then
     begin
          Result:=False;
          Mensaje('Fecha de la factura incorrecta');
          cFechaFactura.SetFocus;
     end
     else if cFechaPago.Text='' then
     begin
          Result:=False;
          Mensaje('Fecha de pago incorrecta');
          cFechaPago.SetFocus;
     end
     else
     begin
          if not ExisteFactura() then  //Comprobamos que existe la factura
          begin
               Result:=False;
               Mensaje('La factura no existe');
               cCliente.SetFocus;
          end;
     end;
end;

//-------------------------- VALIDACION DE DATOS DETALLES-----------------------
function TCobros.ValidarDetalles():Boolean;
begin
     Result:=True;
     if cTipoDocumento.Text='' then
     begin
          Result:=False;
          Mensaje('El tipo de cobro no existe');
          cTipoDocumento.SetFocus;
     end
     else if (cImporte.Text='') or (cImporte.Text='0') or (cImporte.Text='0,00') or (cImporte.Text='0.00') then
     begin
          Result:=False;
          Mensaje('Importe Incorrecto');
          cImporte.SetFocus;
     end;
end;

//------------------- FOCO EN EL PANEL DE DATOS --------------------------------
procedure TCobros.PanelDatosEnter(Sender: TObject);
begin
     if QMaestro.IsEmpty then
     begin
          if ValidarCabecera() then
          begin
               if not SwAlta then  //Si no es alta
               begin
                    if not EjecutaQuery(cEmpresa.Text, cCliente.Text, StrToInt(cFactura.Text), cFechaFactura.Date, cFechaPago.Date) then   //Si no hay datos
                    begin
                         cCliente.SetFocus;
                         Mensaje('El registro no existe');
                    end
                    else  //Si hay datos
                        PanelClaves.Enabled:=False;
               end
               else
               begin
                    //No existe -> Hacemos el alta
                    QMaestro.DisableControls;
                    if not EjecutaQuery(cEmpresa.Text, cCliente.Text, StrToInt(cFactura.Text), cFechaFactura.Date, cFechaPago.Date) then   //Si no hay datos
                    begin
                         PanelClaves.Enabled:=False;
                         cTipoDocumento.SetFocus;
                         QMaestro.append;
                         Mensaje('Alta de registro');
                         BAceptar.Enabled:=True;
                    end
                    else  //El registro ya existe
                    begin
                         if MessageBox(Handle, PChar('Ya existe un pago con esta fecha. ¿Desea Continuar?'),
                            PChar(Self.Caption),
                            MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1)=IDYES then
                         begin
                              PanelClaves.Enabled:=False;
                              cImporte.SetFocus;  //Parche para que el desplegable me funcione bien
                              cTipoDocumento.SetFocus;
                              QMaestro.append;
                              Mensaje('Alta de registro');
                              BAceptar.Enabled:=True;
                         end
                         else
                             Cancelar(Self);
                    end;
                    QMaestro.EnableControls;
               end;
          end;
     end;
end;

//------------------------ APERTURA DE LA QUERY PRINCIPAL ----------------------
function TCobros.EjecutaQuery(Empresa, Cliente: String; Factura: Integer; FechaFactura, FechaPago: TDateTime):Boolean;
begin
     Result:=False;
     NRegistros:=0;
     PosRegistro:=0;
     try
        QMaestro.Close;
        QMaestro.SQL.Clear;
        QMaestro.SQL.Add(' SELECT * FROM COBROS ' +
                         ' WHERE EMPRESA_CO=' + QuotedStr(Empresa) +
                         ' AND CLIENTE_CO=' + QuotedStr(Cliente) +
                         ' AND FACTURA_CO=' + IntToStr(Factura) +
                         ' AND FECHA_FACTURA_CO=:FechaFactura ' +
                         ' AND FECHA_PAGO_CO=:FechaPago ' +
                         ' ORDER BY EMPRESA_CO, CLIENTE_CO, FACTURA_CO, FECHA_FACTURA_CO, FECHA_PAGO_CO');
        QMaestro.ParamByName('FechaFactura').AsString:=AnyoMesDia(FechaFactura);
        QMaestro.ParamByName('FechaPago').AsString:=AnyoMesDia(FechaPago);
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
                     SQL.Add(' SELECT COUNT(*) AS NREGISTROS ' +
                             ' FROM COBROS ' +
                             ' WHERE EMPRESA_CO=' + QuotedStr(Empresa) +
                             ' AND CLIENTE_CO=' + QuotedStr(Cliente) +
                             ' AND FACTURA_CO=' + IntToStr(Factura) +
                             ' AND FECHA_FACTURA_CO=:FechaFactura' +
                             ' AND FECHA_PAGO_CO=:FechaPago');
                     ParamByName('FechaFactura').AsString:=AnyoMesDia(FechaFactura);
                     ParamByName('FechaPago').AsString:=AnyoMesDia(FechaPago);
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

//------------------------ APERTURA DE LA QUERY PRINCIPAL ----------------------
function TCobros.EjecutaQuery(Serial: Integer):Boolean;
begin
     Result:=False;
     NRegistros:=0;
     PosRegistro:=0;
     try
        QMaestro.Close;
        QMaestro.SQL.Clear;
        QMaestro.SQL.Add(' SELECT * FROM COBROS ' +
                         ' WHERE SERIAL_CO=' + IntToStr(Serial));
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
                     SQL.Add(' SELECT COUNT(*) AS NREGISTROS ' +
                             ' FROM COBROS ' +
                             ' WHERE SERIAL_CO=' + IntToStr(Serial));
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

//---------------- APERTURA DE LA QUERY PRINCIPAL DESDE LA BUSQUEDA-------------   OK
function TCobros.EjecutaQueryBus(WhereBus: String):Boolean;
begin
     Result:=False;
     NRegistros:=0;
     PosRegistro:=0;
     try
        QMaestro.Close;
        QMaestro.SQL.Clear;
        QMaestro.SQL.Add('SELECT * FROM COBROS ' +
                         WhereBus +
                         ' ORDER BY EMPRESA_CO, CLIENTE_CO, FACTURA_CO, FECHA_FACTURA_CO, FECHA_PAGO_CO');
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
                     SQL.Add('SELECT COUNT(*) AS NREGISTROS FROM COBROS ' + WhereBus);
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

//-------------------- EVENTO SCROLL -------------------------------------------
procedure TCobros.AlMoverRegistro(DataSet: TDataSet);
begin
     if SwAlta=False then  //El estado es de visualizacion
     begin
          cEmpresa.Text:=QMaestro.FieldByName('EMPRESA_CO').AsString;  //No estan enganchados a BD y debemos asignarlos a mano
          cCliente.Text:=QMaestro.FieldByName('CLIENTE_CO').AsString;
          cFactura.Text:=QMaestro.FieldByName('FACTURA_CO').AsString;
          cFechaFactura.Text:=DiaMesAnyo(QMaestro.FieldByName('FECHA_FACTURA_CO').AsString);
          cFechaPago.Text:=DiaMesAnyo(QMaestro.FieldByName('FECHA_PAGO_CO').AsString);
     end;
end;

//--------------------- CAMBIO DE ESTADO DEL DATA SOURCE -----------------------
procedure TCobros.DSMaestroStateChange(Sender: TObject);
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
procedure TCobros.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
procedure TCobros.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TCobros.QMaestroAfterInsert(DataSet: TDataSet);
begin
     QMaestro.FieldByName('Serial_co').AsInteger:=NewSerialCobros();
     QMaestro.FieldByName('EMPRESA_CO').AsString:=cEmpresa.Text;
     QMaestro.FieldByName('CLIENTE_CO').AsString:=cCliente.Text;
     QMaestro.FieldByName('FACTURA_CO').AsInteger:=StrToInt(cFactura.Text);
     QMaestro.FieldByName('FECHA_FACTURA_CO').AsString:=AnyoMesDia(cFechaFactura.Text);
     QMaestro.FieldByName('FECHA_PAGO_CO').AsString:=AnyoMesDia(cFechaPago.Text);
end;

//---------------------- PONE EL COLOR DE FOCO DE LOS CAMPOS CLAVES ------------
procedure TCobros.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          if not SwAlta then
             TEdit(Sender).Color:=clMoneyGreen;
     end;
end;

//---------------------- QUITA EL COLOR DE FOCO DE LOS CAMPOS CLAVE ------------
procedure TCobros.ColorExit(Sender: TObject);
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
procedure TCobros.QuitarColorAlta();
begin
     cEmpresa.Color:=clWindow;
     cCliente.Color:=clWindow;
     cFactura.Color:=clWindow;
     cFechaFactura.Style.Color:=clWindow;
     cFechaPago.Style.Color:=clWindow;
end;

//---------------------- PONE EL COLOR DE ALTA DE LOS CAMPOS CLAVE -------------
procedure TCobros.PonerColorAlta();
begin
     cEmpresa.Color:=clYellow;
     cCliente.Color:=clYellow;
     cFactura.Color:=clYellow;
     cFechaFactura.Style.Color:=clYellow;
     cFechaPago.Style.Color:=clYellow;
end;

//----------------------- CAMBIO DE LA EMPRESA ---------------------------------
procedure TCobros.cEmpresaChange(Sender: TObject);
Var
   Empresa: String;
begin
     Empresa:=RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I');

     tNomEmpresa.Caption:=NomEmpresa(Empresa);
     tNomCliente.Caption:=NomCliente(Empresa, cCliente.Text);
end;

//----------------------- CAMBIO DE CLIENTE ------------------------------------
procedure TCobros.cClienteChange(Sender: TObject);
begin
     tNomCliente.Caption:=NomCliente(cEmpresa.Text,
                                     RellenarCeros(cCliente.Text,cCliente.MaxLength,'I'));
end;

//----------------------- COMPRUEBA SI EXISTE LA FACTURA -----------------------
function TCobros.ExisteFactura():Boolean;
Var
   QAux: TQuery;
begin
     result:=False;
     try
        QAux:=TQuery.Create(nil);
        try
           With QAux do
           begin
                DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                SQL.Add(' SELECT * ' +
                        ' FROM CABECERA_FACTURAS ' +
                        ' WHERE EMPRESA_CF=' + QuotedStr(cEmpresa.Text) +
                        ' AND CLIENTE_CF=' + QuotedStr(cCliente.Text) +
                        ' AND NUMERO_FACTURA_CF=' + cFactura.Text +
                        ' AND FECHA_FACTURA_CF=:FechaFactura');
                ParamByName('FechaFactura').AsString:=AnyoMesDia(cFechaFactura.Text);
                Open;
                if not IsEmpty() then
                   result:=True
                else
                    result:=False;
           end;
        finally
               QAux.Close;
               FreeAndNil(QAux);
        end;
     except
           on E:Exception do
                CapturaErrores(E);
     end;
end;

//----------------------- COMPRUEBA SI PODEMOS GRABAR EL COBRO -----------------
function TCobros.ValidarCobro(Estado: TDataSetState):Boolean;
Var
   QAux: TQuery;
begin
     result:=False;
     try
        QAux:=TQuery.Create(nil);
        try
           With QAux do
           begin
                DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                SQL.Add(' SELECT SUM(IMPORTE_CO) AS IMPORTE, IMPORTE_BRUTO_CF ' +
                        ' FROM COBROS, CABECERA_FACTURAS ' +
                        ' WHERE EMPRESA_CO=EMPRESA_CF ' +
                        ' AND CLIENTE_CO=CLIENTE_CF ' +
                        ' AND FACTURA_CO=NUMERO_FACTURA_CF ' +
                        ' AND FECHA_FACTURA_CO=FECHA_FACTURA_CF ' +
                        ' AND EMPRESA_CO=' + QuotedStr(cEmpresa.Text) +
                        ' AND CLIENTE_CO=' + QuotedStr(cCliente.Text) +
                        ' AND FACTURA_CO=' + cFactura.Text +
                        ' AND FECHA_FACTURA_CO=:FechaFactura ' +
                        ' GROUP BY IMPORTE_BRUTO_CF');
                ParamByName('FechaFactura').AsString:=AnyoMesDia(cFechaFactura.Text);
                Open;
                if not IsEmpty() then
                begin
                     if Estado=dsInsert then   //Insertamos
                     begin
                          if Redondear(QMaestro.FieldByName('Importe_co').AsFloat + QAux.FieldByName('Importe').AsFloat,2)>QAux.FieldByName('Importe_Bruto_cf').AsFloat then
                          begin
                               result:=True;
                               Application.MessageBox('El total cobrado sobrepasa el importe de la factura', '¡ATENCIÓN!', MB_OK);
                          end
                          else
                              result:=True;
                     end   //Modificamos
                     else if Redondear(QMaestro.FieldByName('Importe_co').AsFloat + QAux.FieldByName('Importe').AsFloat - ImporteAntiguo,2)>QAux.FieldByName('Importe_Bruto_cf').AsFloat then
                          begin
                               result:=True;
                               Application.MessageBox('El total cobrado sobrepasa el importe de la factura', '¡ATENCIÓN!', MB_OK);
                          end
                          else
                              result:=True;
                end
                else
                begin
                     Close;
                     SQL.Clear;
                     SQL.Add(' SELECT IMPORTE_BRUTO_CF ' +
                             ' FROM CABECERA_FACTURAS ' +
                             ' WHERE EMPRESA_CF=' + QuotedStr(cEmpresa.Text) +
                             ' AND CLIENTE_CF=' + QuotedStr(cCliente.Text) +
                             ' AND NUMERO_FACTURA_CF=' + cFactura.Text +
                             ' AND FECHA_FACTURA_CF=:FechaFactura ');
                     ParamByName('FechaFactura').AsString:=AnyoMesDia(cFechaFactura.Text);
                     Open;
                     if QMaestro.FieldByName('Importe_co').AsFloat>QAux.FieldByName('Importe_Bruto_cf').AsFloat then
                     begin
                          Application.MessageBox('El total cobrado sobrepasa el importe de la factura', '¡ATENCIÓN!', MB_OK);
                          result:=true;
                     end
                     else
                         result:=True;
                end;
           end;
        finally
               QAux.Close;
               FreeAndNil(QAux);
        end;
     except
           on E:Exception do
                CapturaErrores(E);
     end;
end;

//------------------ MODIFICAR MERCANCIA RETENIDA ------------------------------
procedure TCobros.ModificarMercancia(Empresa, Cliente: String; Importe: Real);
Var
   QAux, QAux2: TQuery;
begin
     QAux:=TQuery.Create(nil);
     try
        QAux2:=TQuery.Create(nil);
        try
           QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
           QAux2.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

           QAux.SQL.Add('SELECT VALOR_STOCK_C, IMP_PENDIENTE_PAGO_C ' +
                        ' FROM CLIENTES ' +
                        ' WHERE EMPRESA_C=' + QuotedStr(Empresa) +
                        ' AND CODIGO_C=' + QuotedStr(Cliente));
           QAux.Open;
           if not QAux.IsEmpty() then
           begin
                {
                QAux2.SQL.Add('UPDATE CLIENTES ' +
                              ' SET IMP_PENDIENTE_PAGO_C=:Importe, ' +
                              ' MERCANCIA_RETENIDA_C=:MercanciaRetenida ' +
                              ' WHERE EMPRESA_C=' + QuotedStr(Empresa) +
                              ' AND CODIGO_C=' + QuotedStr(Cliente));
                if QAux.FieldByName('VALOR_STOCK_C').AsFloat >= Redondear((QAux.FieldByName('IMP_PENDIENTE_PAGO_C').AsFloat) + Importe,2) then
                   QAux2.ParamByName('MercanciaRetenida').AsString:='N'
                else
                    QAux2.ParamByName('MercanciaRetenida').AsString:='S';
                QAux2.ParamByName('Importe').AsFloat:=Redondear(QAux.FieldByName('IMP_PENDIENTE_PAGO_C').AsFloat + Importe,2);
                QAux2.ExecSql;
                }
                QAux2.SQL.Add('UPDATE CLIENTES ' +
                              ' SET IMP_PENDIENTE_PAGO_C=IMP_PENDIENTE_PAGO_C - :Importe, ' +
                              ' MERCANCIA_RETENIDA_C=:MercanciaRetenida ' +
                              ' WHERE EMPRESA_C=' + QuotedStr(Empresa) +
                              ' AND CODIGO_C=' + QuotedStr(Cliente));
                if QAux.FieldByName('VALOR_STOCK_C').AsFloat >= Redondear((QAux.FieldByName('IMP_PENDIENTE_PAGO_C').AsFloat) - Importe,2) then
                   QAux2.ParamByName('MercanciaRetenida').AsString:='N'
                else
                    QAux2.ParamByName('MercanciaRetenida').AsString:='S';
                QAux2.ParamByName('Importe').AsFloat:=Importe;
                QAux2.ExecSql;
           end;
        finally
               QAux2.Close;
               FreeAndNil(QAux2);
        end;
     finally
            QAux.Close;
            FreeAndNil(QAux);
     end;
end;

//--------------------------- ANTES DE GRABAR UN COBRO -------------------------
procedure TCobros.QMaestroBeforePost(DataSet: TDataSet);
begin
     //ACTUALIZAMOS EL IMPORTE DEL VALOR PENDIENTE DE PAGO Y DE MERCANCIA RETENIDA
     if QMaestro.State=dsInsert then  //Insercion
     begin
          if not ValidarCobro(QMaestro.State) then        //Validamos las condiciones del cobro
             Abort
          else
          begin
               ModificarMercancia(QMaestro.FieldByName('Empresa_co').AsString,
                                  QMaestro.FieldByName('Cliente_co').AsString,
                                  QMaestro.FieldByName('Importe_co').AsFloat);

          end;
     end
     else if QMaestro.State=dsEdit then  //Modificacion
          begin
               if not ValidarCobro(QMaestro.State) then    //Validamos las condiciones del cobro
                  Abort
               else
                   ModificarMercancia(QMaestro.FieldByName('Empresa_co').AsString,
                                      QMaestro.FieldByName('Cliente_co').AsString,
                                      QMaestro.FieldByName('Importe_co').AsFloat - ImporteAntiguo);
         end;
end;

//---------------------------- ANTES DE MODIFICAR ------------------------------
procedure TCobros.QMaestroBeforeEdit(DataSet: TDataSet);
begin
     //Guardamos el importe anterior
     ImporteAntiguo:=QMaestro.FieldByName('Importe_co').AsFloat;
end;

//------------ CAMPO CALCULADO PARA LA DESCRIPCION DEL TIPO DE COBRO -----------
procedure TCobros.QTipoCobrosCalcFields(DataSet: TDataSet);
begin
     QTipoCobros.FieldByName('des').AsString:=QTipoCobros.FieldByName('codigo_tc').AsString +
                                              ' - ' +
                                              QTipoCobros.FieldByName('descripcion_tc').AsString;
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TCobros.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresa.Text:=CodEmpresa;
     cEmpresa.SetFocus;
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TCobros.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if Key=VK_F2 then
       cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE CLIENTES ----------------------------------
procedure TCobros.cLupaClientesClick(Sender: TObject);
Var
   CodCliente: String;
begin
     if cEmpresa.Text<>'' then
     begin
          CodCliente:=LupaClientes(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
          if CodCliente<>'' then
             cCliente.Text:=CodCliente;
          cCliente.SetFocus;
     end
     else
     begin
          MessageDlg (Chr(13) + 'Seleccione antes la empresa', mtError,[mbOk],0);
          cEmpresa.SetFocus;
     end;
end;

//-------------------------- LUPA (F2) DE CLIENTES -----------------------------
procedure TCobros.cClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if Key=VK_F2 then
       cLupaClientesClick(Self);
end;

//-------------------------- LUPA DE FACTURAS ----------------------------------
procedure TCobros.cLupaFacturasClick(Sender: TObject);
Var
   Factura, Fecha: String;
begin
     if cEmpresa.Text='' then
     begin
          MessageDlg (Chr(13) + 'Seleccione antes la empresa', mtError,[mbOk],0);
          cEmpresa.SetFocus;
     end
     else if cCliente.Text='' then
          begin
               MessageDlg (Chr(13) + 'Seleccione antes el cliente', mtError,[mbOk],0);
               cCliente.SetFocus;
          end
          else
          begin
               Factura:=LupaFacturas(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'),
                                     RellenarCeros(cCliente.Text,cCliente.MaxLength,'I'),
                                     Fecha);
               if (Factura<>'') and (Fecha<>'') then
               begin
                    cFactura.Text:=Factura;
                    cFechaFactura.Text:=Fecha;
               end;
               cFactura.SetFocus;
          end;
end;

//-------------------------- LUPA (F2) DE FACTURAS -----------------------------
procedure TCobros.cFacturaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
       cLupaFacturasClick(Self);
end;

//----------------------- NUEVO SERIAL DE COBROS -------------------------------
function TCobros.NewSerialCobros():Integer;
Var
   QAux: TQuery;
begin
     Result:=0;
     try
        QAux:=TQuery.Create(nil);
        try
           With QAux do
           begin
                DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                SQL.Add(' SELECT MAX(SERIAL_CO) SERIAL ' +
                        ' FROM COBROS');
                Open;
                Result:=FieldByName('SERIAL').AsInteger + 1;
           end;
        finally
               QAux.Close;
               FreeAndNil(QAux);
        end;
     except
           on E:Exception do
                CapturaErrores(E);
     end;
end;

//------------------------ CONTROL DE TECLAS EN EL TIPO DE COBRO ---------------
procedure TCobros.cTipoDocumentoKeyPress(Sender: TObject; var Key: Char);
Var
   Pulsacion: char;
begin
     Pulsacion:=UpCase(Key);
     if (Pulsacion='C') or (Pulsacion='E') or (Pulsacion='I') or (Pulsacion='L') or (Pulsacion='O') or (Pulsacion='P') or (Pulsacion='R') or (Pulsacion='T') then
     begin
          if not (QMaestro.State in dsEditModes) then  //Si estamos visualizando
             if Pulsacion<>cTipoDocumento.KeyValue then  //Si cambiamos el codigo entonces ponemos en edicion
                QMaestro.Edit;
          if QMaestro.State in dsEditModes then  //Si estamos modificando o insertando
             QMaestro.FieldByName('tipo_cobro_co').AsString:=Pulsacion;
     end;
     Key:=#0;
end;

procedure TCobros.FormActivate(Sender: TObject);
begin
     if PanelClaves.Enabled then
        cCliente.SetFocus;
end;

end.
