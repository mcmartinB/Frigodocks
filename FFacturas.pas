unit FFacturas;

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
  dxSkinsdxBarPainter, dxBar, cxClasses, Menus, cxButtons, SimpleSearch ;

type
  TFacturas = class(TForm)
    BarraEstado: TStatusBar;
    Timer1: TTimer;
    QMaestro: TQuery;
    DSMaestro: TDataSource;
    PanelDatos: TPanel;
    QContar: TQuery;
    GBoxUnidades: TGroupBox;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    StaticText10: TStaticText;
    StaticText15: TStaticText;
    StaticText14: TStaticText;
    GroupBox1: TGroupBox;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    QMaestroempresa_cf: TStringField;
    QMaestrocliente_cf: TStringField;
    QMaestronumero_factura_cf: TIntegerField;
    QMaestrofecha_factura_cf: TStringField;
    QMaestrofecha_vencimiento_cf: TStringField;
    QMaestrofecha_desde_cf: TStringField;
    QMaestrofecha_hasta_cf: TStringField;
    QMaestroimporte_bruto_cf: TFloatField;
    QMaestroporcentaje_iva_cf: TFloatField;
    QMaestroimporte_iva_cf: TFloatField;
    QMaestroimporte_neto_cf: TFloatField;
    QMaestrotipo_cf: TStringField;
    QMaestronum_contabilizacion_cf: TIntegerField;
    QMaestroultimo_stock_cf: TFloatField;
    QMaestrofecha_contabilizacion_cf: TStringField;
    cFechaVencimiento: TcxDateEdit;
    cFechaConta: TcxDateEdit;
    cImporteNeto: TcxDBTextEdit;
    cIva: TcxDBTextEdit;
    cImporteIva: TcxDBTextEdit;
    cImporteTotal: TcxDBTextEdit;
    cNumContabilizacion: TcxDBTextEdit;
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
    PanelClaves: TPanel;
    StaticText12: TStaticText;
    cEmpresa: TEdit;
    tNomEmpresa: TPanel;
    StaticText13: TStaticText;
    cCliente: TEdit;
    tNomcliente: TPanel;
    StaticText1: TStaticText;
    cNumFactura: TEdit;
    StaticText2: TStaticText;
    cFechaFactura: TcxDateEdit;
    dxBarButton1: TdxBarButton;
    bImprimir: TdxBarLargeButton;
    bAlta: TdxBarLargeButton;
    bBorrar: TdxBarLargeButton;
    cLupaEmpresas: TSimpleSearch;
    cLupaClilentes: TSimpleSearch;
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
    procedure ColorExitSinCeros(Sender: TObject);
    procedure cEmpresaChange(Sender: TObject);
    procedure cClienteChange(Sender: TObject);
    procedure AntesModificar(DataSet: TDataSet);
    procedure cImporteNetoChange(Sender: TObject);
    procedure cIvaChange(Sender: TObject);
    procedure cFechaVencimientoChange(Sender: TObject);
    procedure cFechaContaChange(Sender: TObject);
    procedure QMaestroBeforePost(DataSet: TDataSet);
    procedure cLupaEmpresasClick(Sender: TObject);
    procedure cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaClientesClick(Sender: TObject);
    procedure cClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BImprimirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cFechaFacturaExit(Sender: TObject);

  private
    {Private declarations}
    SwAlta, Contabilizada: Boolean;
    PosRegistro, NRegistros: Integer;
    ImporteBrutoAnt: Real;
    FechaVencimientoAnt, FechaContaAnt: String;

    procedure Mensaje(Texto: String );
    procedure BotonesPosicion;
    function  ValidarCabecera():Boolean;
    function  ValidarDetalles():Boolean;
    function  EjecutaQuery(Empresa, Cliente, NumFactura: String; Fecha: TDateTime):Boolean;
    function  EjecutaQueryBus(WhereBus: String):Boolean;
    procedure QuitarColorAlta();
    procedure PonerColorAlta();
    procedure ActualizarCliente(Empresa, Cliente: String; Importe: Real; BorrarModificar: String);
    function  ExistenCobros(Empresa, Cliente: String; Factura: Integer; Fecha: String):Boolean;
    function  ValorCobros(Empresa, Cliente: String; Factura: Integer; Fecha: String):Real;
  public
    { Public declarations }
  end;

var
   Facturas: TFacturas;

implementation

uses UGLobal, MBaseDatos, DM, FPrincipal, BFacturas;

{$R *.dfm}

//------------------------ CREACION DEL FORMULARIO -----------------------------
procedure TFacturas.FormCreate(Sender: TObject);
begin
     Top:=1;
     Left:=0;

     SwAlta:=False;
     PosRegistro:=0;
     NRegistros:=0;

     QMaestro.AfterScroll:=AlMoverRegistro;
end;

//------------------------ CIERRE DEL FORMULARIO -------------------------------
procedure TFacturas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

//----------------------- CIERRRE DEL QUERY DEL FORMULARIO ---------------------
procedure TFacturas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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
procedure TFacturas.Mensaje(Texto: String );
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
procedure TFacturas.Timer1Timer(Sender: TObject);
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
procedure TFacturas.BotonesPosicion;
begin
     if (SwAlta=False) and (QMaestro.State<>dsEdit) then
     begin
          BBusqueda.Enabled:=True;
          BSalir.Enabled:=True;
          if NRegistros>0 then
          begin
               BBorrar.Enabled:=True;
               BImprimir.Enabled:=True;
               BCancelar.Enabled:=True;
          end
          else
          begin
               BBorrar.Enabled:=False;
               BImprimir.Enabled:=False;
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
         BImprimir.Enabled:=False;
         BAlta.Enabled:=False;
         BCancelar.Enabled:=True;
         BAceptar.Enabled:=True;
    end;
end;

//--------------------- BOTON ALTA ---------------------------------------------
procedure TFacturas.Alta(Sender: TObject);
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
     cCliente.SetFocus;
     cCliente.Text:='';
     cNumFactura.Text:='';
     cFechaFactura.Date:=0;

     //Botones
     BCancelar.Enabled:=True;
     //BAceptar.Enabled:=True;
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
end;

//--------------------- BOTON BORRAR -------------------------------------------
procedure TFacturas.Borrar(Sender: TObject);
begin
     if (QMaestro.FieldByName('num_contabilizacion_cf').AsInteger<>0) and (QMaestro.FieldByName('fecha_contabilizacion_cf').AsString<>'') then
        MessageDlg (Chr(13) + 'La factura está contabilizada y no puede borrarse', mtError,[mbOk],0)
     else if MessageBox(Handle, PChar('Va a borrarse el registro ¿Está seguro?'),
                        PChar(Self.Caption),
                        MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1)=IDYES then
          begin
               try
                  if not ExistenCobros(QMaestro.FieldByName('Empresa_cf').AsString,
                                       QMaestro.FieldByName('Cliente_cf').AsString,
                                       QMaestro.FieldByName('Numero_Factura_cf').AsInteger,
                                       DiaMesAnyo(QMaestro.FieldByName('Fecha_Factura_cf').AsString)) then
                  begin
                       if not QMaestro.Database.InTransaction then
                          QMaestro.Database.StartTransaction;
                       //Actualizamo Pendiente de Pago y Mercancia Retenida
                       ActualizarCliente(QMaestro.FieldByName('Empresa_cf').AsString,
                                         QMaestro.FieldByName('Cliente_cf').AsString,
                                         QMaestro.FieldByName('Importe_Bruto_cf').AsFloat,
                                         'BORRAR');
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
                            cEmpresa.Text:=EmpresaGlobal;
                            cCliente.SetFocus;
                       end;
                  end
                  else
                      MessageDlg (Chr(13) + 'La factura posee cobros y no puede borrarse', mtError,[mbOk],0);
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
procedure TFacturas.Primero(Sender: TObject);
begin
     PosRegistro:=1;          //Numero de registro en el que estamos
     QMaestro.First;
     BotonesPosicion();
end;

//-------------------------- REGISTRO ANTERIOR ---------------------------------
procedure TFacturas.Anterior(Sender: TObject);
begin
     if PosRegistro>1 then
        Dec(PosRegistro);        //Numero de registro en el que estamos
     QMaestro.Prior;
     BotonesPosicion();
end;

//-------------------------- REGISTRO SIGUIENTE --------------------------------
procedure TFacturas.Siguiente(Sender: TObject);
begin
     if PosRegistro<NRegistros then
        Inc(PosRegistro);       //Numero de registro en el que estamos
     QMaestro.Next;
     BotonesPosicion();
end;

//-------------------------- ULTIMO REGISTRO -----------------------------------
procedure TFacturas.Ultimo(Sender: TObject);
begin
     PosRegistro:=NRegistros; //Numero de registro en el que estamos
     QMaestro.Last;
     BotonesPosicion();
end;

//----------------------------- BUSQUEDA ---------------------------------------
procedure TFacturas.Busqueda(Sender: TObject);
Var
   Aux: TBusquedaFacturas;
begin
     try
        Aux:=TBusquedaFacturas.Create(Self);
        with Aux do
        begin
             AceptarTodos:=True;
             EmpresaParam:=EmpresaGlobal;
             ShowModal;
             if (ClienteBus<>'') and (EmpresaBus<>'') and (NumFacturaBus<>'') and (DateToStr(FechaBus)<>'') then   //Seleccionamos un registro del grid resultado
             begin
                  if EjecutaQuery(EmpresaBus, ClienteBus, NumFacturaBus, FechaBus) then
                     Self.PanelClaves.Enabled:=False
                  else  //Si no hay registros que mostrar
                  begin
                       Self.PanelClaves.Enabled:=True;
                       cEmpresa.Text:=EmpresaGlobal;
                       cCliente.Text:='';
                       cCliente.SetFocus;
                       cNumFactura.Text:='';
                       cFechaFactura.Date:=0;
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
                       cNumFactura.Text:='';
                       cFechaFactura.Date:=0;
                       Mensaje('Registro no existe');
                 end;
            end
        end;
     finally
            FreeAndNil(Aux);
     end;
end;

//------------------------ BOTON ACEPTAR ----------------------------------------
procedure TFacturas.Aceptar(Sender: TObject);
Var
   Posicion: TBookmark;
begin
     PostMessage(Handle,WM_NEXTDLGCTL,0,0);
     Application.ProcessMessages;
     if ValidarCabecera() and ValidarDetalles() then   //Comprobamos que los datos son correctos
     begin
          if QMaestro.State in [dsEdit,dsInsert] then
          begin
               //GRABACION DEL REGISTRO
               try
                  if QMaestro.State=dsEdit then  //Modificar
                  begin
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
                       //Validamos que los cobros no superen el valor de la factura
                       if ValorCobros(QMaestro.FieldByName('Empresa_cf').AsString,
                                      QMaestro.FieldByName('Cliente_cf').AsString,
                                      QMaestro.FieldByName('Numero_Factura_cf').AsInteger,
                                      DiaMesAnyo(QMaestro.FieldByName('Fecha_Factura_cf').AsString))>QMaestro.FieldByName('Importe_Bruto_cf').AsFloat then
                       begin
                            MessageDlg (Chr(13) + 'El total de la factura no puede ser inferior al total cobrado', mtError,[mbOk],0);
                            Exit;
                       end;

                       Posicion:=QMaestro.GetBookmark;

                       if not QMaestro.Database.InTransaction then
                          QMaestro.Database.StartTransaction;
                       //Actualizamo Pendiente de Pago y Mercancia Retenida
                       ActualizarCliente(QMaestro.FieldByName('Empresa_cf').AsString,
                                         QMaestro.FieldByName('Cliente_cf').AsString,
                                         QMaestro.FieldByName('Importe_Bruto_cf').AsFloat,
                                         'MODIFICAR');
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
                  else   //Alta (EL BOTON ESTA DESHABILITADO - NO SE PERMITE HACER ALTAS)
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
procedure TFacturas.Cancelar(Sender: TObject);
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
                           cFechaVencimiento.Text:=FechaVencimientoAnt;
                           cFechaConta.Text:=FechaContaAnt;

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
      PanelClaves.Enabled:=True;
      SwAlta:=False;

      QuitarColorAlta();
      cEmpresa.Text:=EmpresaGlobal;
      cCliente.Text:='';
      cCliente.SetFocus;
      cNumFactura.Text:='';
      cFechaFactura.Date:=0;
      cFechaVencimiento.Text:='';
      cFechaConta.Text:='';

      PosRegistro:=0;
      NRegistros:=0;

      Mensaje('Cambios Ignorados');

      BotonesPosicion();
end;

//----------------------------- SALIR ------------------------------------------
procedure TFacturas.Salir(Sender: TObject);
begin
     Close;
end;

//-------------------------- VALIDACION DE DATOS CABECERA ----------------------
function TFacturas.ValidarCabecera():Boolean;
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
          Mensaje('Falta el código del cliente');
          cCliente.SetFocus;
     end
     else if tNomCliente.Caption='' then
     begin
          Result:=False;
          Mensaje('El cliente no existe');
          cCliente.SetFocus;
     end
     else if cNumFactura.Text='' then
     begin
          Result:=False;
          Mensaje('Falta el número de la factura');
          cNumFactura.SetFocus;
     end
     else if cFechaFactura.Date=0 then
     begin
          Result:=False;
          Mensaje('Fecha de la factura incorrecta');
          cFechaFactura.SetFocus;
     end;
end;

//-------------------------- VALIDACION DE DATOS DETALLES-----------------------
function TFacturas.ValidarDetalles():Boolean;
begin
     Result:=True;
     if cImporteNeto.Text='' then
     begin
          Result:=False;
          Mensaje('Falta el importe neto');
          cImporteNeto.SetFocus;
     end
     else if cIva.Text='' then
     begin
          Result:=False;
          Mensaje('Falta el porcentaje de Iva');
          cIva.SetFocus;
     end
     else if cImporteTotal.Text='' then
     begin
          Result:=False;
          Mensaje('Falta el importe bruto');
          cImporteTotal.SetFocus;
     end
     else if cFechaVencimiento.Date=0 then
     begin
          Result:=False;
          Mensaje('Falta la fecha de vencimiento');
          cFechaVencimiento.SetFocus;
     end;
end;

//------------------- FOCO EN EL PANEL DE DATOS --------------------------------
procedure TFacturas.PanelDatosEnter(Sender: TObject);
begin
     if QMaestro.IsEmpty then
     begin
          if ValidarCabecera() then
          begin
               if not SwAlta then  //Si no es alta
               begin
                    if not EjecutaQuery(cEmpresa.Text, cCliente.Text, cNumFactura.Text, cFechaFactura.Date) then   //Si no hay datos
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
                    if not EjecutaQuery(cEmpresa.Text, cCliente.Text, cNumFactura.Text, cFechaFactura.Date) then   //Si no hay datos
                    begin
                         PanelClaves.Enabled:=False;
                         cImporteTotal.SetFocus;
                         QMaestro.append;
                         Mensaje('Alta de registro');
                         BAceptar.Enabled:=True;
                    end
                    else  //El registro ya existe
                    begin
                         Mensaje('El registro ya existe');
                         QMaestro.Close;
                         BarraEstado.Panels[1].Text:='';
                         cCliente.SetFocus;
                    end;
               end;
           end;
     end;
end;

//------------------------ APERTURA DE LA QUERY PRINCIPAL ----------------------
function TFacturas.EjecutaQuery(Empresa, Cliente, NumFactura: String; Fecha: TDateTime):Boolean;
begin
     Result:=False;
     NRegistros:=0;
     PosRegistro:=0;
     try
        QMaestro.Close;
        QMaestro.SQL.Clear;
        QMaestro.SQL.Add(' SELECT * FROM CABECERA_FACTURAS ' +
                         ' WHERE EMPRESA_CF=' + QuotedStr(Empresa) +
                         ' AND CLIENTE_CF=' + QuotedStr(Cliente) +
                         ' AND NUMERO_FACTURA_CF=' + QuotedStr(NumFactura) +
                         ' AND FECHA_FACTURA_CF=:Fecha ' +
                         ' ORDER BY EMPRESA_CF, CLIENTE_CF, NUMERO_FACTURA_CF, FECHA_FACTURA_CF');
        QMaestro.ParamByName('Fecha').AsString:=AnyoMesDia(Fecha);
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
                             ' FROM CABECERA_FACTURAS ' +
                             ' WHERE EMPRESA_CF=' + QuotedStr(Empresa) +
                             ' AND CLIENTE_CF=' + QuotedStr(Cliente) +
                             ' AND NUMERO_FACTURA_CF=' + QuotedStr(NumFactura) +
                             ' AND FECHA_FACTURA_CF=:Fecha');
                     ParamByName('Fecha').AsString:=AnyoMesDia(Fecha);
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
function TFacturas.EjecutaQueryBus(WhereBus: String):Boolean;
begin
     Result:=False;
     NRegistros:=0;
     PosRegistro:=0;
     try
        QMaestro.Close;
        QMaestro.SQL.Clear;
        QMaestro.SQL.Add('SELECT * FROM CABECERA_FACTURAS ' +
                         WhereBus +
                         ' ORDER BY EMPRESA_CF, CLIENTE_CF, NUMERO_FACTURA_CF, FECHA_FACTURA_CF');
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
                     SQL.Add('SELECT COUNT(*) AS NREGISTROS FROM CABECERA_FACTURAS ' + WhereBus);
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
procedure TFacturas.AlMoverRegistro(DataSet: TDataSet);
begin
     if SwAlta=False then  //El estado es de visualizacion
     begin
          cEmpresa.Text:=QMaestro.FieldByName('EMPRESA_CF').AsString;  //No estan enganchados a BD y debemos asignarlos a mano
          cCliente.Text:=QMaestro.FieldByName('CLIENTE_CF').AsString;
          cNumFactura.Text:=QMaestro.FieldByName('NUMERO_FACTURA_CF').AsString;
          cFechaFactura.Text:=DiaMesAnyo(QMaestro.FieldByName('FECHA_FACTURA_CF').AsString);

         //Desactivamos el evento cambio de las fechas
          cFechaVencimiento.Properties.OnChange:=Nil;
          //Asignamos el valor a las fechas
          cFechaVencimiento.Text:=DiaMesAnyo(QMaestro.FieldByName('Fecha_vencimiento_cf').AsString);
          //Activamos el evento cambio de las fechas
          cFechaVencimiento.Properties.OnChange:=cFechaVencimientoChange;

          //Desactivamos el evento cambio de las fechas
          cFechaConta.Properties.OnChange:=Nil;
          //Asignamos el valor a las fechas
          cFechaConta.Text:=DiaMesAnyo(QMaestro.FieldByName('fecha_contabilizacion_cf').AsString);
          //Activamos el evento cambio de las fechas
          cFechaConta.Properties.OnChange:=cFechaContaChange;
     end;
end;

//--------------------- CAMBIO DE ESTADO DEL DATA SOURCE -----------------------
procedure TFacturas.DSMaestroStateChange(Sender: TObject);
begin
     BAceptar.Enabled:=QMaestro.State in dsEditModes;
     if QMaestro.State in dsEditModes then
     begin
          BPrimero.Enabled:=False;
          BAnterior.Enabled:=False;
          BSiguiente.Enabled:=False;
          BUltimo.Enabled:=False;
          BBorrar.Enabled:=False;
          BImprimir.Enabled:=False;
          BAlta.Enabled:=False;
          BBusqueda.Enabled:=False;
     end;
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TFacturas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
procedure TFacturas.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TFacturas.QMaestroAfterInsert(DataSet: TDataSet);
begin
     QMaestro.FieldByName('EMPRESA_CF').AsString:=cEmpresa.Text;
     QMaestro.FieldByName('CLIENTE_CF').AsString:=cCliente.Text;
     QMaestro.FieldByName('NUMERO_FACTURA_CF').AsString:=cNumFactura.Text;
     QMaestro.FieldByName('FECHA_FACTURA_CF').AsString:=AnyoMesDia(cFechaFactura.Text);
     QMaestro.FieldByName('NUM_CONTABILIZACION_CF').AsInteger:=0;
     QMaestro.FieldByName('FECHA_CONTABILIZACION_CF').AsString:='';
end;

//---------------------- PONE EL COLOR DE FOCO DE LOS CAMPOS CLAVES ------------
procedure TFacturas.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          if not SwAlta then
             TEdit(Sender).Color:=clMoneyGreen;
     end;
end;

//---------------------- QUITA EL COLOR DE FOCO DE LOS CAMPOS CLAVE ------------
procedure TFacturas.ColorExit(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          if not SwAlta then
            TEdit(Sender).Color:=clWindow;
          if Length(TEdit(Sender).Text)>0 then
             TEdit(Sender).Text:=RellenarCeros(TEdit(Sender).Text,TEdit(Sender).MaxLength,'I');
     end;
end;

//---------------------- QUITA EL COLOR DE FOCO DE LOS CAMPOS CLAVE SIN FROMATEAR A CEROS ------------
procedure TFacturas.ColorExitSinCeros(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          if not SwAlta then
            TEdit(Sender).Color:=clWindow;
     end;
end;

//---------------------- QUITA EL COLOR DE ALTA DE LOS CAMPOS CLAVE ------------
procedure TFacturas.QuitarColorAlta();
begin
     cEmpresa.Color:=clWindow;
     cCliente.Color:=clWindow;
     cNumFactura.Color:=clWindow;
     cFechaFactura.Style.Color:=clWindow;
end;

//---------------------- PONE EL COLOR DE ALTA DE LOS CAMPOS CLAVE -------------
procedure TFacturas.PonerColorAlta();
begin
     cEmpresa.Color:=clYellow;
     cCliente.Color:=clYellow;
     cNumFactura.Color:=clYellow;
     cFechaFactura.Style.Color:=clYellow;
end;

//----------------------- CAMBIO DE LA EMPRESA ---------------------------------
procedure TFacturas.cEmpresaChange(Sender: TObject);
begin
     tNomEmpresa.Caption:=NomEmpresa(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
end;

//----------------------- CAMBIO DE CLIENTE ------------------------------------
procedure TFacturas.cClienteChange(Sender: TObject);
begin
     tNomCliente.Caption:=NomCliente(cEmpresa.Text, RellenarCeros(cCliente.Text,cCliente.MaxLength,'I'));
end;

//----------------------- ANTES DE MODIFICAR -----------------------------------
procedure TFacturas.AntesModificar(DataSet: TDataSet);
begin
     ImporteBrutoAnt:=QMaestro.FieldByName('importe_bruto_cf').AsFloat;
     FechaVencimientoAnt:=DiaMesAnyo(QMaestro.FieldByName('fecha_vencimiento_cf').AsString);
     FechaContaAnt:=DiaMesAnyo(QMaestro.FieldByName('fecha_contabilizacion_cf').AsString);
end;

//-- ACTUALIZA IMPORTE PENDIENTE DE PAGO Y  MERCANCIA RETENIDA DEL CLIENTE -----
procedure TFacturas.ActualizarCliente(Empresa, Cliente: String; Importe: Real; BorrarModificar: String);
Var
   QAux: TQuery;
   Mercanciaretenida: String;
begin
     QAux:=TQuery.Create(nil);
     try
        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
        //Modificamos el Importe Pendiente de Pago del Cliente
        QAux.SQL.Add('UPDATE CLIENTES ' +
                      ' SET IMP_PENDIENTE_PAGO_C=IMP_PENDIENTE_PAGO_C + :Importe ' +
                      ' WHERE EMPRESA_C=' + QuotedStr(Empresa) +
                      ' AND CODIGO_C=' + QuotedStr(Cliente));

        if BorrarModificar='BORRAR' then    //BORRAMOS FACTURA
           QAux.ParamByName('Importe').AsFloat:=-Importe
        else  //MODIFICAMOS FACTURA
            QAux.ParamByName('Importe').AsFloat:=Importe - ImporteBrutoAnt;

        QAux.ExecSql;
        //Leemos el valor del nuevo Importe Pendiente dePago y el del Valor del Stock
        QAux.SQL.Clear;
        QAux.SQL.Add('SELECT VALOR_STOCK_C, IMP_PENDIENTE_PAGO_C ' +
                     ' FROM CLIENTES ' +
                     ' WHERE EMPRESA_C=' +  QuotedStr(Empresa) +
                     ' AND CODIGO_C=' +  QuotedStr(Cliente));
        QAux.Open;
        //Comprobamos si tiene Mercancia Retenida
        if QAux.FieldByName('Valor_Stock_c').AsFloat>=QAux.FieldByName('Imp_Pendiente_Pago_c').AsFloat then
           MercanciaRetenida:='N'
        else
            MercanciaRetenida:='S';
        //Actualizamos el Valor de Mercacia Retenida del Cliente
        QAux.Close;
        QAux.SQL.Clear;
        QAux.SQL.Add('UPDATE CLIENTES ' +
                      ' SET MERCANCIA_RETENIDA_C=' + QuotedStr(MercanciaRetenida) +
                      ' WHERE EMPRESA_C=' + QuotedStr(Empresa) +
                      ' AND CODIGO_C=' + QuotedStr(Cliente));
        QAux.ExecSql;
     finally
            QAux.Close;
            FreeAndNil(QAux);
     end;
end;

//-------------- COMPRUEBA SI UNA FACTURA POSEE COBROS -------------------------
function TFacturas.ExistenCobros(Empresa, Cliente: String; Factura: Integer; Fecha: String):Boolean;
Var
   QAux: TQuery;

begin
     QAux:=TQuery.Create(nil);
     try
        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
        QAux.SQL.Add('SELECT * FROM COBROS ' +
                     ' WHERE EMPRESA_CO=' + QuotedStr(Empresa) +
                     ' AND CLIENTE_CO=' + QuotedStr(Cliente) +
                     ' AND FACTURA_CO=' + IntToStr(Factura) +
                     ' AND FECHA_FACTURA_CO=:Fecha');
        QAux.ParamByName('Fecha').AsString:=AnyoMesDia(Fecha);
        QAux.Open;
        if QAux.IsEmpty then
           Result:=False
        else
            Result:=True;
     finally
            QAux.Close;
            FreeAndNil(QAux);
     end;
end;

//----------------- DEVUELVE EL IMPORTE TOTAL DE LOS COBROS --------------------
function TFacturas.ValorCobros(Empresa, Cliente: String; Factura: Integer; Fecha: String):Real;
Var
   QAux: TQuery;
begin
     QAux:=TQuery.Create(nil);
     try
        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
        QAux.SQL.Add('SELECT SUM(IMPORTE_CO) AS IMPORTE FROM COBROS ' +
                     ' WHERE EMPRESA_CO=' + QuotedStr(Empresa) +
                     ' AND CLIENTE_CO=' + QuotedStr(Cliente) +
                     ' AND FACTURA_CO=' + IntToStr(Factura) +
                     ' AND FECHA_FACTURA_CO=:Fecha');
        QAux.ParamByName('Fecha').AsString:=AnyoMesDia(Fecha);
        QAux.Open;
        Result:=QAux.FieldByName('Importe').AsFloat;
     finally
            QAux.Close;
            FreeAndNil(QAux);
     end;
end;

//-------------------------- AL CAMBIAR EL IMPORTE NETO ------------------------
procedure TFacturas.cImporteNetoChange(Sender: TObject);
Var
   ImporteNeto: Real;
   Iva: Integer;
begin
     if QMaestro.State in dsEditModes then
     begin
          if EsDecimal(cImporteNeto.Text) then
          begin
               ImporteNeto:=StrToFloat(StringReplace(cImporteNeto.Text, '.', '',[rfReplaceAll]));
               Iva:=StrToInt(StringReplace(cIva.Text, '.', '',[rfReplaceAll]));

               QMaestro.FieldByName('importe_iva_cf').AsFloat:=ImporteNeto * (Iva/100);
               QMaestro.FieldByName('importe_bruto_cf').AsFloat:=ImporteNeto +
                                                                 QMaestro.FieldByName('importe_iva_cf').AsFloat;
          end
          else
          begin
               QMaestro.FieldByName('importe_iva_cf').AsFloat:=0;
               QMaestro.FieldByName('importe_bruto_cf').AsFloat:=0;
          end;
     end;
end;

//-------------------------- AL CAMBIAR EL IMPORTE BRUTO -----------------------
procedure TFacturas.cIvaChange(Sender: TObject);
Var
   ImporteNeto: Real;
   Iva: Integer;
begin
     if QMaestro.State in dsEditModes then
     begin
          if EsDecimal(cIva.Text) then
          begin
               ImporteNeto:=StrToFloat(StringReplace(cImporteNeto.Text, '.', '',[rfReplaceAll]));
               Iva:=StrToInt(StringReplace(cIva.Text, '.', '',[rfReplaceAll]));

               QMaestro.FieldByName('importe_iva_cf').AsFloat:=ImporteNeto * (Iva/100);
               QMaestro.FieldByName('importe_bruto_cf').AsFloat:=ImporteNeto +
                                                                 QMaestro.FieldByName('importe_iva_cf').AsFloat;
          end
          else
          begin
               QMaestro.FieldByName('importe_iva_cf').AsFloat:=0;
               QMaestro.FieldByName('importe_bruto_cf').AsFloat:=QMaestro.FieldByName('importe_neto_cf').AsFloat;
          end;
     end;
end;

//------------------------- AL MODIFICAR LA FECHA PONEMOS EN EDICION -----------
procedure TFacturas.cFechaVencimientoChange(Sender: TObject);
begin
     if (QMaestro.Active) and  not (QMaestro.State in dsEditModes) then  //Ponemos en edicion si no lo esta
        QMaestro.Edit;
end;

//------------------------- AL MODIFICAR LA FECHA PONEMOS EN EDICION -----------
procedure TFacturas.cFechaContaChange(Sender: TObject);
begin
     if (QMaestro.Active) and  not (QMaestro.State in dsEditModes) then  //Ponemos en edicion si no lo esta
        QMaestro.Edit;
end;

procedure TFacturas.cFechaFacturaExit(Sender: TObject);
begin
  
end;

//------------------------- ANTES DE GRABAR ------------------------------------
procedure TFacturas.QMaestroBeforePost(DataSet: TDataSet);
begin
     if cFechaVencimiento.Date<>0 then
        QMaestro.FieldByName('fecha_vencimiento_cf').AsString:=AnyoMesDia(cFechaVencimiento.Date)
     else
         QMaestro.FieldByName('fecha_vencimiento_cf').AsString:='';

      if cFechaConta.Date<>0 then
         QMaestro.FieldByName('fecha_contabilizacion_cf').AsString:=AnyoMesDia(cFechaConta.Date)
      else
         QMaestro.FieldByName('fecha_contabilizacion_cf').AsString:='';
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TFacturas.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresa.Text:=CodEmpresa;
     cEmpresa.SetFocus;   
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TFacturas.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if Key=VK_F2 then
       cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TFacturas.cLupaClientesClick(Sender: TObject);
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
procedure TFacturas.cClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if Key=VK_F2 then
       cLupaClientesClick(Self);
end;

//-------------------------- IMPRIME LA FACTURA --------------------------------
procedure TFacturas.BImprimirClick(Sender: TObject);
begin
     ImprimirFacturacion(True,                                                 //Definitiva
                         QMaestro.FieldByName('Numero_factura_cf').AsInteger,  //Facturacion desde
                         QMaestro.FieldByName('Numero_factura_cf').AsInteger,  //Facturacion hasta
                         QMaestro.FieldByName('Empresa_cf').AsString,          //Empresa Desde
                         QMaestro.FieldByName('Cliente_cf').AsString,          //Cliente Desde
                         QMaestro.FieldByName('Cliente_cf').AsString,                                  //Cliente Hasta
                         StrToDate(DiaMesAnyo(QMaestro.FieldByName('Fecha_Factura_cf').AsString)));     //Fecha Factura
end;

procedure TFacturas.FormActivate(Sender: TObject);
begin
     cEmpresa.Text:=EmpresaGlobal;
     if PanelClaves.Enabled then
        cCliente.SetFocus;
end;

end.


