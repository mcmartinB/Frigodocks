unit FTarifas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ActnMan, ActnCtrls, ExtCtrls, StdCtrls, ComCtrls, DB,
  DBTables, Mask, DBCtrls, 
  Buttons, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
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
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  cxTextEdit, cxDBEdit, dxSkinsdxBarPainter, dxBar, cxClasses, Menus, cxButtons,
  SimpleSearch, cxCurrencyEdit;

type
  TTarifas = class(TForm)
    BarraEstado: TStatusBar;
    Timer1: TTimer;
    QMaestro: TQuery;
    DSMaestro: TDataSource;
    PanelDatos: TPanel;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    StaticText10: TStaticText;
    StaticText11: TStaticText;
    QContar: TQuery;
    QMaestroempresa_t: TStringField;
    QMaestroprecio_congelacion_m3_t: TFloatField;
    QMaestroprecio_congelacion_kg_t: TFloatField;
    QMaestroprecio_refrigera_m3_t: TFloatField;
    QMaestrotipo0_t: TFloatField;
    QMaestrotipo1_t: TFloatField;
    QMaestrotipo2_t: TFloatField;
    QMaestrotipo3_t: TFloatField;
    QMaestrotipo4_t: TFloatField;
    QMaestroprecio_hora1_t: TFloatField;
    QMaestroprecio_hora2_t: TFloatField;
    QMaestrocodigo_t: TStringField;
    StaticText13: TStaticText;
    StaticText14: TStaticText;
    QMaestrofrio_palet_t: TFloatField;
    QMaestromanejo_palet_t: TFloatField;
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
    StaticText12: TStaticText;
    cEmpresa: TEdit;
    tNomEmpresa: TPanel;
    cLupaEmpresas: TSimpleSearch;
    cCodigo: TEdit;
    cCongelacionM3: TcxDBCurrencyEdit;
    cCongelacionEurKg: TcxDBCurrencyEdit;
    cRefrigeraEurM3: TcxDBCurrencyEdit;
    cTipo0: TcxDBCurrencyEdit;
    cTipo1: TcxDBCurrencyEdit;
    cTipo2: TcxDBCurrencyEdit;
    cTipo3: TcxDBCurrencyEdit;
    cTipo4: TcxDBCurrencyEdit;
    cEurosHora1: TcxDBCurrencyEdit;
    cEurosHora2: TcxDBCurrencyEdit;
    cFrioPalet: TcxDBCurrencyEdit;
    cManejoPalet: TcxDBCurrencyEdit;
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
    procedure ColorExitRellenarCeros(Sender: TObject);
    procedure cEmpresaChange(Sender: TObject);
    procedure cEmpresaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cLupaEmpresasClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    {Private declarations}
    SwAlta: Boolean;
    PosRegistro, NRegistros: Integer;
    procedure Mensaje(Texto: String );
    procedure BotonesPosicion;
    function  ValidarCabecera():Boolean;
    function  ValidarDetalles():Boolean;
    function  EjecutaQuery(Empresa, Codigo: String):Boolean;
    function  EjecutaQueryBus(WhereBus: String):Boolean;
    procedure QuitarColorAlta();
    procedure PonerColorAlta();
  public
    { Public declarations }
  end;

var
   Tarifas: TTarifas;

implementation

uses UGLobal, MBaseDatos, DM, BTarifas;

{$R *.dfm}

//------------------------ CREACION DEL FORMULARIO -----------------------------
procedure TTarifas.FormCreate(Sender: TObject);
begin
     Top:=1;
     Left:=0;

     SwAlta:=False;
     PosRegistro:=0;
     NRegistros:=0;

     cEmpresa.Text:=EmpresaGlobal;

     QMaestro.AfterScroll:=AlMoverRegistro;
end;

//------------------------ CIERRE DEL FORMULARIO -------------------------------
procedure TTarifas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

//----------------------- CIERRRE DEL QUERY DEL FORMULARIO ---------------------
procedure TTarifas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
     CanClose:=True;
     if QMaestro.state in dsEditModes then
     begin
          case MessageBox( Handle, PChar('?Desea guardar el registro?'),
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
procedure TTarifas.Mensaje(Texto: String );
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
procedure TTarifas.Timer1Timer(Sender: TObject);
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
procedure TTarifas.BotonesPosicion;
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
procedure TTarifas.Alta(Sender: TObject);
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
procedure TTarifas.Borrar(Sender: TObject);
begin
     if MessageBox(Handle, PChar('Va a borrarse el registro ?Est? seguro?'),
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

                  cEmpresa.Text:=EmpresaGlobal;
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
procedure TTarifas.Primero(Sender: TObject);
begin
     PosRegistro:=1;          //Numero de registro en el que estamos
     QMaestro.First;
     BotonesPosicion();
end;

//-------------------------- REGISTRO ANTERIOR ---------------------------------
procedure TTarifas.Anterior(Sender: TObject);
begin
     if PosRegistro>1 then
        Dec(PosRegistro);        //Numero de registro en el que estamos
     QMaestro.Prior;
     BotonesPosicion();
end;

//-------------------------- REGISTRO SIGUIENTE --------------------------------
procedure TTarifas.Siguiente(Sender: TObject);
begin
     if PosRegistro<NRegistros then
        Inc(PosRegistro);       //Numero de registro en el que estamos
     QMaestro.Next;
     BotonesPosicion();
end;

//-------------------------- ULTIMO REGISTRO -----------------------------------
procedure TTarifas.Ultimo(Sender: TObject);
begin
     PosRegistro:=NRegistros; //Numero de registro en el que estamos
     QMaestro.Last;
     BotonesPosicion();
end;

//----------------------------- BUSQUEDA ---------------------------------------
procedure TTarifas.Busqueda(Sender: TObject);
Var
   Aux: TBusquedaTarifas;
begin
     try
        Aux:=TBusquedaTarifas.Create(Self);
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
                       cCodigo.SetFocus;
                       cCodigo.Text:='';
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
                       cCodigo.SetFocus;
                       cCodigo.Text:='';
                       Mensaje('Registro no existe');
                 end;
            end
        end;
     finally
            FreeAndNil(Aux);
     end;
end;

//------------------------ BOTON ACEPTAR ----------------------------------------
procedure TTarifas.Aceptar(Sender: TObject);
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
procedure TTarifas.Cancelar(Sender: TObject);
begin
     if QMaestro.State in dsEditModes then
     begin
          case MessageBox(Handle, PChar('?Desea cancelar los cambios?'),
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
      cCodigo.SetFocus;
      cCodigo.Text:='';

      PosRegistro:=0;
      NRegistros:=0;

      Mensaje('Cambios Ignorados');

      BotonesPosicion();
end;

//----------------------------- SALIR ------------------------------------------
procedure TTarifas.Salir(Sender: TObject);
begin
     Close;
end;

//-------------------------- VALIDACION DE DATOS CABECERA ----------------------
function TTarifas.ValidarCabecera():Boolean;
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
     else if cCodigo.Text='' then
     begin
          Result:=False;
          Mensaje('Falta el c?digo');
          cCodigo.SetFocus;
     end;
end;

//-------------------------- VALIDACION DE DATOS DETALLES-----------------------
function TTarifas.ValidarDetalles():Boolean;
begin
     Result:=True;
end;

//------------------- FOCO EN EL PANEL DE DATOS --------------------------------
procedure TTarifas.PanelDatosEnter(Sender: TObject);
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
                        PanelClaves.Enabled:=False;
               end
               else
               begin
                    //No existe -> Hacemos el alta
                    if not EjecutaQuery(cempresa.Text, cCodigo.Text) then   //Si no hay datos
                    begin
                         PanelClaves.Enabled:=False;
                         cCongelacionM3.SetFocus;
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
     end;
end;

//------------------------ APERTURA DE LA QUERY PRINCIPAL ----------------------
function TTarifas.EjecutaQuery(Empresa, Codigo: String):Boolean;
begin
     Result:=False;
     NRegistros:=0;
     PosRegistro:=0;
     try
        QMaestro.Close;
        QMaestro.SQL.Clear;
        QMaestro.SQL.Add(' SELECT * FROM TARIFAS ' +
                         ' WHERE EMPRESA_T=' + QuotedStr(Empresa) +
                         ' AND CODIGO_T=' + QuotedStr(Codigo) +
                         ' ORDER BY EMPRESA_T, CODIGO_T');

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
                             ' FROM TARIFAS ' +
                             ' WHERE EMPRESA_T=' + QuotedStr(Empresa) +
                             ' AND CODIGO_T=' + QuotedStr(Codigo));
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
function TTarifas.EjecutaQueryBus(WhereBus: String):Boolean;
begin
     Result:=False;
     NRegistros:=0;
     PosRegistro:=0;
     try
        QMaestro.Close;
        QMaestro.SQL.Clear;
        QMaestro.SQL.Add('SELECT * FROM TARIFAS ' +
                         WhereBus +
                         ' ORDER BY EMPRESA_T, CODIGO_T');
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
                     SQL.Add('SELECT COUNT(*) AS NREGISTROS FROM TARIFAS ' + WhereBus);
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
procedure TTarifas.AlMoverRegistro(DataSet: TDataSet);
begin
     if SwAlta=False then  //El estado es de visualizacion
     begin
          cEmpresa.Text:=QMaestro.FieldByName('EMPRESA_T').AsString;  //No estan enganchados a BD y debemos asignarlos a mano
          cCodigo.Text:=QMaestro.FieldByName('CODIGO_T').AsString;
     end;
end;

//--------------------- CAMBIO DE ESTADO DEL DATA SOURCE -----------------------
procedure TTarifas.DSMaestroStateChange(Sender: TObject);
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
procedure TTarifas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
procedure TTarifas.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TTarifas.QMaestroAfterInsert(DataSet: TDataSet);
begin
     QMaestro.FieldByName('EMPRESA_T').AsString:=cEmpresa.Text;
     QMaestro.FieldByName('CODIGO_T').AsString:=cCodigo.Text;
end;

//---------------------- PONE EL COLOR DE FOCO DE LOS CAMPOS CLAVES ------------
procedure TTarifas.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          if not SwAlta then
             TEdit(Sender).Color:=clMoneyGreen;
     end;
end;

//---------------------- QUITA EL COLOR DE FOCO DE LOS CAMPOS CLAVE ------------
procedure TTarifas.ColorExitRellenarCeros(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          if not SwAlta then
            TEdit(Sender).Color:=clWindow;
          if Length(TEdit(Sender).Text)>0 then
             TEdit(Sender).Text:=RellenarCeros(TEdit(Sender).Text,TEdit(Sender).MaxLength,'I');
     end;
end;

//---------------------- QUITA EL COLOR DE FOCO DE LOS CAMPOS CLAVE ------------
procedure TTarifas.ColorExit(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          if not SwAlta then
            TEdit(Sender).Color:=clWindow;
     end;
end;

//---------------------- QUITA EL COLOR DE ALTA DE LOS CAMPOS CLAVE ------------
procedure TTarifas.QuitarColorAlta();
begin
     cEmpresa.Color:=clWindow;
     cCodigo.Color:=clWindow;
end;

//---------------------- PONE EL COLOR DE ALTA DE LOS CAMPOS CLAVE -------------
procedure TTarifas.PonerColorAlta();
begin
     cEmpresa.Color:=clYellow;
     cCodigo.Color:=clYellow;
end;

//----------------------- CAMBIO DE LA EMPRESA ---------------------------------
procedure TTarifas.cEmpresaChange(Sender: TObject);
begin
     tNomEmpresa.Caption:=NomEmpresa(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TTarifas.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TTarifas.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresa.Text:=CodEmpresa;
     cEmpresa.SetFocus;
end;

procedure TTarifas.FormActivate(Sender: TObject);
begin
     cCodigo.SetFocus;
end;

end.
