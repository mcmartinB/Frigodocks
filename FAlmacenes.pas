unit FAlmacenes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ActnMan, ActnCtrls, ExtCtrls, StdCtrls, ComCtrls, DB,
  DBTables, Mask, DBCtrls,
  Buttons,  cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlue, dxCore, cxDateUtils, Menus, cxButtons, SimpleSearch,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit, cxDBEdit,
  dxSkinsdxBarPainter, dxBar, cxClasses, cxCurrencyEdit ;

type
  TAlmacenes = class(TForm)
    BarraEstado: TStatusBar;
    Timer1: TTimer;
    QMaestro: TQuery;
    DSMaestro: TDataSource;
    PanelDatos: TPanel;
    QContar: TQuery;
    QMaestroempresa_al: TStringField;
    QMaestrocliente_al: TStringField;
    QMaestrofamilia_al: TStringField;
    QMaestroarticulo_al: TStringField;
    QMaestrolote_al: TStringField;
    QMaestrobultos_entrados_al: TIntegerField;
    QMaestrobultos_salidos_al: TIntegerField;
    QMaestrounidades_entradas_al: TFloatField;
    QMaestrounidades_salidas_al: TFloatField;
    QMaestrounidades_mermas_al: TFloatField;
    QMaestrostatus_retenido_al: TStringField;
    QMaestronumero_camara_al: TSmallintField;
    QMaestrozona_al: TStringField;
    QMaestrotipo_lote_al: TStringField;
    QMaestrounid_sal_mismo_dia_al: TFloatField;
    QMaestropalets_entrados_al: TIntegerField;
    QMaestropalets_salidos_al: TIntegerField;
    QTiposLote: TQuery;
    DSTiposEntrada: TDataSource;
    GBoxBultos: TGroupBox;
    StaticText5: TStaticText;
    cBultosEnt: TcxDBTextEdit;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    GBoxUnidades: TGroupBox;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    StaticText10: TStaticText;
    StaticText11: TStaticText;
    StaticText14: TStaticText;
    StaticText15: TStaticText;
    GBoxPalets: TGroupBox;
    StaticText16: TStaticText;
    StaticText17: TStaticText;
    StaticText19: TStaticText;
    GBoxEstuches: TGroupBox;
    StaticText18: TStaticText;
    StaticText20: TStaticText;
    StaticText21: TStaticText;
    Panel1: TPanel;
    StaticText23: TStaticText;
    StaticText24: TStaticText;
    Panel2: TPanel;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    cArticulo: TcxDBTextEdit;
    tNomArticulo: TPanel;
    tNomFamilia: TPanel;
    cFamilia: TcxDBTextEdit;
    cBultosSalidos: TcxDBTextEdit;
    cBultosStock: TcxDBTextEdit;
    cEstuchesPorBulto: TcxDBTextEdit;
    cEstuchesTotales: TcxDBTextEdit;
    cEstuchesSueltos: TcxDBTextEdit;
    cPaletsEntrados: TcxDBTextEdit;
    cPaletsSalidos: TcxDBTextEdit;
    cPaletsStock: TcxDBTextEdit;
    cCamera: TcxDBTextEdit;
    cZona: TcxDBTextEdit;
    cRetenido: TDBCheckBox;
    QMaestroCALCBULTOS_STOCK: TIntegerField;
    QMaestroCALC_PALETS_STOCK: TIntegerField;
    QMaestrounidades_destruidas_al: TFloatField;
    QMaestroestuches_sueltos_al: TIntegerField;
    QMaestroCALC_UNIDADES_STOCK: TFloatField;
    QMaestrofecha_entrada_al: TStringField;
    QMaestrofecha_caducidad_al: TStringField;
    QTiposLotedes: TStringField;
    QTiposLotecodigo_tl: TStringField;
    QTiposLotedescripcion_tl: TStringField;
    QMaestroestuches_totales_al: TIntegerField;
    QMaestroestuches_bulto_al: TIntegerField;
    QMaestrofecha_modif_al: TStringField;
    StaticText4: TStaticText;
    cTipoLote: TDBLookupComboBox;
    GBoxFechas: TGroupBox;
    StaticText22: TStaticText;
    cFechaCaducidad: TcxDateEdit;
    cLupaFamilias: TSimpleSearch;
    cLupaArticulos: TSimpleSearch;
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
    StaticText13: TStaticText;
    cCliente: TEdit;
    tNomcliente: TPanel;
    StaticText1: TStaticText;
    cLote: TEdit;
    cLupaEmpresas: TSimpleSearch;
    cLupaClilentes: TSimpleSearch;
    cUnidadesEntradas: TcxDBCurrencyEdit;
    cUnidadesSalidas: TcxDBCurrencyEdit;
    cUnidadesSalidasMismoDia: TcxDBCurrencyEdit;
    cUnidadesDestruidas: TcxDBCurrencyEdit;
    cUnidadesMermas: TcxDBCurrencyEdit;
    cUnidadesStock: TcxDBCurrencyEdit;
    cObservaciones: TcxDBTextEdit;
    QMaestroobservaciones_retenido_al: TStringField;
    StaticText25: TStaticText;
    cLoteOrigen: TcxDBTextEdit;
    QMaestrolote_origen_al: TStringField;
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
    procedure cFamiliaChange(Sender: TObject);
    procedure cArticuloChange(Sender: TObject);
    procedure cFamiliaExit(Sender: TObject);
    procedure cArticuloExit(Sender: TObject);
    procedure QMaestroCalcFields(DataSet: TDataSet);
    procedure QMaestroBeforeEdit(DataSet: TDataSet);
    procedure ActualizarCliente;
    procedure cTipoLoteEnter(Sender: TObject);
    procedure QMaestroAfterOpen(DataSet: TDataSet);
    procedure QTiposLoteCalcFields(DataSet: TDataSet);
    procedure cLupaEmpresasClick(Sender: TObject);
    procedure cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaClientesClick(Sender: TObject);
    procedure cClientesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaArticulosClick(Sender: TObject);
    procedure cLupaFamiliasClick(Sender: TObject);
    procedure cFamiliaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cArticuloKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure QMaestroBeforePost(DataSet: TDataSet);
    procedure cFamiliaEnter(Sender: TObject);
    procedure cTipoLoteCloseUp(Sender: TObject);
    procedure cTipoLoteKeyPress(Sender: TObject; var Key: Char);
    procedure cBultosEntChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cFechaCaducidadChange(Sender: TObject);
    procedure cFechaCaducidadExit(Sender: TObject);
    procedure cRetenidoClick(Sender: TObject);

  private
    {Private declarations}
    SwAlta: Boolean;
    PosRegistro, NRegistros: Integer;
    AntiguoStock: Real;
    TipoLoteAnt: String;
    FechaCaducidadAnt: String;

    procedure Mensaje(Texto: String );
    procedure BotonesPosicion;
    function  ValidarCabecera():Boolean;
    function  ValidarDetalles():Boolean;
    function  EjecutaQuery(Empresa, Cliente, Lote: String):Boolean;
    function  EjecutaQueryBus(WhereBus: String):Boolean;
    procedure QuitarColorAlta();
    procedure PonerColorAlta();
    procedure Auditar(Caracter: String);
  public
    { Public declarations }
  end;

var
   Almacenes: TAlmacenes;

implementation

uses UGLobal, MBaseDatos, DM, BAlmacenes, FPrincipal;

{$R *.dfm}

//------------------------ CREACION DEL FORMULARIO -----------------------------
procedure TAlmacenes.FormCreate(Sender: TObject);
begin
     Top:=1;
     Left:=0;

     SwAlta:=False;
     PosRegistro:=0;
     NRegistros:=0;

     cEmpresa.Text:=EmpresaGlobal;

     if TipoUsuarioGlobal='C' then   //El Usuario de Tipo 'C-Capataz' no puede modificar nada
        QMaestro.RequestLive:=False;

     QMaestro.AfterScroll:=AlMoverRegistro;
     QTiposLote.Open;

end;

//------------------------ CIERRE DEL FORMULARIO -------------------------------
procedure TAlmacenes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QTiposLote.Close;
     Action:=caFree;
end;

//----------------------- CIERRRE DEL QUERY DEL FORMULARIO ---------------------
procedure TAlmacenes.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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
procedure TAlmacenes.Mensaje(Texto: String );
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
procedure TAlmacenes.Timer1Timer(Sender: TObject);
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
procedure TAlmacenes.BotonesPosicion;
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
procedure TAlmacenes.Alta(Sender: TObject);
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
     cLote.Text:='';

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
procedure TAlmacenes.Borrar(Sender: TObject);
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
                  cEmpresa.Text:=EmpresaGlobal;
                  cCliente.SetFocus;
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
procedure TAlmacenes.Primero(Sender: TObject);
begin
     PosRegistro:=1;          //Numero de registro en el que estamos
     QMaestro.First;
     BotonesPosicion();
end;

//-------------------------- REGISTRO ANTERIOR ---------------------------------
procedure TAlmacenes.Anterior(Sender: TObject);
begin
     if PosRegistro>1 then
        Dec(PosRegistro);        //Numero de registro en el que estamos
     QMaestro.Prior;
     BotonesPosicion();
end;

//-------------------------- REGISTRO SIGUIENTE --------------------------------
procedure TAlmacenes.Siguiente(Sender: TObject);
begin
     if PosRegistro<NRegistros then
        Inc(PosRegistro);       //Numero de registro en el que estamos
     QMaestro.Next;
     BotonesPosicion();
end;

//-------------------------- ULTIMO REGISTRO -----------------------------------
procedure TAlmacenes.Ultimo(Sender: TObject);
begin
     PosRegistro:=NRegistros; //Numero de registro en el que estamos
     QMaestro.Last;
     BotonesPosicion();
end;

//----------------------------- BUSQUEDA ---------------------------------------
procedure TAlmacenes.Busqueda(Sender: TObject);
Var
   Aux: TBusquedaAlmacenes;
begin
     try
        Aux:=TBusquedaAlmacenes.Create(Self);
        with Aux do
        begin
             EmpresaParam:=cEmpresa.Text;
             ShowModal;
             if (ClienteBus<>'') and (EmpresaBus<>'') and (LoteBus<>'') then   //Seleccionamos un registro del grid resultado
             begin
                  if EjecutaQuery(EmpresaBus, ClienteBus, LoteBus) then
                     Self.PanelClaves.Enabled:=False
                  else  //Si no hay registros que mostrar
                  begin
                       Self.PanelClaves.Enabled:=True;
                       cEmpresa.Text:=EmpresaGlobal;
                       cCliente.Text:='';
                       cCliente.SetFocus;
                       cLote.Text:='';
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
                       cLote.Text:='';
                       Mensaje('Registro no existe');
                 end;
            end
        end;
     finally
            FreeAndNil(Aux);
     end;
end;

//------------------------ BOTON ACEPTAR ----------------------------------------
procedure TAlmacenes.Aceptar(Sender: TObject);
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
                       Posicion:=QMaestro.GetBookmark;

                       if not QMaestro.Database.InTransaction then
                          QMaestro.Database.StartTransaction;
                       QMaestro.Post;
                       //--------------------------------------------------
                       Auditar('S');            //Auditamos la modificacion
                       ActualizarCliente();     //Actualizar Cliente
                       //--------------------------------------------------
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

                       EjecutaQuery(cEmpresa.Text, cCliente.Text, cLote.Text);     //Refrescamos el Query -- En algun caso se perdia el registro activo

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
procedure TAlmacenes.Cancelar(Sender: TObject);
begin
     if QMaestro.State in dsEditModes then
     begin
          case MessageBox(Handle, PChar('¿Desea cancelar los cambios?'),
                           PChar(Self.Caption),
                           MB_ICONQUESTION + MB_YESNOCANCEL + MB_DEFBUTTON1) of
                IDYES:
                      if QMaestro.State = dsEdit then   //Modificacion
                      begin
                           cFechaCaducidad.Text:=FechaCaducidadAnt;

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
      cLote.Text:='';

      PosRegistro:=0;
      NRegistros:=0;

      Mensaje('Cambios Ignorados');

      BotonesPosicion();
end;

//----------------------------- SALIR ------------------------------------------
procedure TAlmacenes.Salir(Sender: TObject);
begin
     Close;
end;

//-------------------------- VALIDACION DE DATOS CABECERA ----------------------
function TAlmacenes.ValidarCabecera():Boolean;
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
     else if cLote.Text='' then
     begin
          Result:=False;
          Mensaje('Falta el código del lote');
          cLote.SetFocus;
     end;
end;

//-------------------------- VALIDACION DE DATOS DETALLES-----------------------
function TAlmacenes.ValidarDetalles():Boolean;
begin
     Result:=True;
     //+++++++++++++++++++++  BULTOS +++++++++++++++++++++++++++++++
     if QMaestro.FieldByName('bultos_entrados_al').AsInteger<0 then
     begin
          Result:=False;
          Mensaje('El número de bultos entrados debe ser positivo');
          cBultosEnt.SetFocus;
     end
     else if QMaestro.FieldByName('bultos_salidos_al').AsInteger<0 then
     begin
          Result:=False;
          Mensaje('El número de bultos salidos debe ser positivo');
          cBultosSalidos.SetFocus;
     end
     else if QMaestro.FieldByName('bultos_entrados_al').AsInteger<QMaestro.FieldByName('bultos_salidos_al').AsInteger then
     begin
          Result:=False;
          Mensaje('El nº de bultos salidos debe ser menor o igual que el nº de bultos entrados');
          cBultosSalidos.SetFocus;
     end
     else if QMaestro.FieldByName('CALC_BULTOS_STOCK').AsInteger<0 then
     begin
          Result:=False;
          Mensaje('El número de bultos en stock debe ser positivo');
          cBultosStock.SetFocus;
     end
     //+++++++++++++++++++++  ESTUCHES ++++++++++++++++++++++++++++++++++
     else if QMaestro.FieldByName('estuches_sueltos_al').AsInteger<0 then
     begin
          Result:=False;
          Mensaje('El número de estuches sueltos debe ser positivo');
          cEstuchesSueltos.SetFocus;
     end
     else if QMaestro.FieldByName('estuches_bulto_al').AsInteger<0 then
     begin
          Result:=False;
          Mensaje('El número de estuches por bulto debe ser positivo');
          cEstuchesPorBulto.SetFocus;
     end
     else if QMaestro.FieldByName('estuches_sueltos_al').AsInteger<0 then
     begin
          Result:=False;
          Mensaje('El número de estuches sueltos debe ser positivo');
          cEstuchesSueltos.SetFocus;
     end
     else if (QMaestro.FieldByName('estuches_bulto_al').AsInteger>0) and (QMaestro.FieldByName('estuches_bulto_al').AsInteger<=QMaestro.FieldByName('estuches_sueltos_al').AsInteger) then
     begin
          Result:=False;
          Mensaje('Estuches sueltos debe ser menor que estuches por bulto');
          cEstuchesPorBulto.SetFocus;
     end
     else if (QMaestro.FieldByName('estuches_bulto_al').AsInteger=0) and (QMaestro.FieldByName('estuches_sueltos_al').AsInteger<>0) then
     begin
          Result:=False;
          Mensaje('Si estuches por bulto es cero estuches sueltos debe ser cero');
          cEstuchesPorBulto.SetFocus;
     end
     //+++++++++++++++++++++  UNIDADES +++++++++++++++++++++++++++++++++
     else if QMaestro.FieldByName('unidades_entradas_al').AsFloat<0 then
     begin
          Result:=False;
          Mensaje('El número de unidades entradas debe ser positivo');
          cUnidadesEntradas.SetFocus;
     end
     else if QMaestro.FieldByName('unidades_salidas_al').AsFloat<0 then
     begin
          Result:=False;
          Mensaje('El número de unidades salidas debe ser positivo');
          cUnidadesSalidas.SetFocus;
     end
     else if QMaestro.FieldByName('unidades_salidas_al').AsFloat>QMaestro.FieldByName('unidades_entradas_al').AsFloat then
     begin
          Result:=False;
          Mensaje('Nº de unidades salidas debe ser menor o igual que el nº de unidades entradas');
          cUnidadesSalidas.SetFocus;
     end
     else if QMaestro.FieldByName('unid_sal_mismo_dia_al').AsFloat<0 then
     begin
          Result:=False;
          Mensaje('El número de unidades salidas el mismo día debe ser positivo');
          cUnidadesSalidasMismoDia.SetFocus;
     end
     else if QMaestro.FieldByName('unid_sal_mismo_dia_al').AsFloat>QMaestro.FieldByName('unidades_salidas_al').AsFloat then
     begin
          Result:=False;
          Mensaje('Nº de unidades salidas el mismo día deben ser menor o igual que el nº de unidades salidas');
          cUnidadesSalidasMismoDia.SetFocus;
     end
     else if QMaestro.FieldByName('unidades_destruidas_al').AsFloat<0 then
     begin
          Result:=False;
          Mensaje('El número de unidades destruidas debe ser positivo');
          cUnidadesDestruidas.SetFocus;
     end
     else if QMaestro.FieldByName('unidades_destruidas_al').AsFloat>QMaestro.FieldByName('unidades_entradas_al').AsFloat then
     begin
          Result:=False;
          Mensaje('Nº de unidades destruidas debe ser menor o igual que el nº de unidades entradas');
          cUnidadesDestruidas.SetFocus;
     end
     else if QMaestro.FieldByName('unidades_mermas_al').AsFloat<0 then
     begin
          Result:=False;
          Mensaje('El número de unidades de merma debe ser positivo');
          cUnidadesMermas.SetFocus;
     end
      else if QMaestro.FieldByName('unidades_mermas_al').AsFloat>QMaestro.FieldByName('unidades_entradas_al').AsFloat then
     begin
          Result:=False;
          Mensaje('Nº de unidades de merma debe ser menor o igual que el nº de unidades entradas');
          cUnidadesMermas.SetFocus;
     end
     else if QMaestro.FieldByName('CALC_UNIDADES_STOCK').AsInteger<0 then
     begin
          Result:=False;
          Mensaje('El número de unidades en stock debe ser positivo');
          cUnidadesStock.SetFocus;
     end
     //+++++++++++++++++++++ PALETS BULTOS +++++++++++++++++++++++++++++
     else if QMaestro.FieldByName('palets_entrados_al').AsInteger<0 then
     begin
          Result:=False;
          Mensaje('El número de palets entrados debe ser positivo');
          cPaletsEntrados.SetFocus;
     end
     else if QMaestro.FieldByName('palets_salidos_al').AsInteger<0 then
     begin
          Result:=False;
          Mensaje('El número de palets salidos debe ser positivo');
          cPaletsSalidos.SetFocus;
     end
     else if QMaestro.FieldByName('calc_unidades_stock').AsInteger<0 then
     begin
          Result:=False;
          Mensaje('El número de unidades en stock debe ser positivo');
          cUnidadesStock.SetFocus;
     end;
end;

//------------------- FOCO EN EL PANEL DE DATOS --------------------------------
procedure TAlmacenes.PanelDatosEnter(Sender: TObject);
begin
     if QMaestro.IsEmpty then
     begin
          if ValidarCabecera() then
          begin
               if not SwAlta then  //Si no es alta
               begin
                    if not EjecutaQuery(cEmpresa.Text, cCliente.Text, cLote.Text) then   //Si no hay datos
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
                    if not EjecutaQuery(cEmpresa.Text, cCliente.Text, cLote.Text) then   //Si no hay datos
                    begin
                         PanelClaves.Enabled:=False;
                         cFamilia.SetFocus;
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
function TAlmacenes.EjecutaQuery(Empresa, Cliente, Lote: String):Boolean;
begin
     Result:=False;
     NRegistros:=0;
     PosRegistro:=0;
     try
        QMaestro.Close;
        QMaestro.SQL.Clear;
        QMaestro.SQL.Add(' SELECT * FROM ALMACENES ' +
                         ' WHERE EMPRESA_AL=' + QuotedStr(Empresa) +
                         ' AND CLIENTE_AL=' + QuotedStr(Cliente) +
                         ' AND LOTE_AL=' + QuotedStr(Lote) +
                         ' ORDER BY EMPRESA_AL, CLIENTE_AL, LOTE_AL');
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
                             ' FROM ALMACENES ' +
                             ' WHERE EMPRESA_AL=' + QuotedStr(Empresa) +
                             ' AND CLIENTE_AL=' + QuotedStr(Cliente) +
                             ' AND LOTE_AL=' + QuotedStr(Lote));
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
function TAlmacenes.EjecutaQueryBus(WhereBus: String):Boolean;
begin
     Result:=False;
     NRegistros:=0;
     PosRegistro:=0;
     try
        QMaestro.Close;
        QMaestro.SQL.Clear;
        QMaestro.SQL.Add(' SELECT * FROM ALMACENES ' +
                         ' WHERE ' + WhereBus +
                         ' ORDER BY EMPRESA_AL, CLIENTE_AL, LOTE_AL');
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
                     SQL.Add('SELECT COUNT(*) AS NREGISTROS FROM ALMACENES WHERE ' + WhereBus);
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
procedure TAlmacenes.AlMoverRegistro(DataSet: TDataSet);
begin
     if SwAlta=False then  //El estado es de visualizacion
     begin
          cEmpresa.Text:=QMaestro.FieldByName('EMPRESA_AL').AsString;  //No estan enganchados a BD y debemos asignarlos a mano
          cCliente.Text:=QMaestro.FieldByName('CLIENTE_AL').AsString;
          cLote.Text:=QMaestro.FieldByName('LOTE_AL').AsString;
          //Desactivamos el evento cambio de las fechas
          cFechaCaducidad.Properties.OnChange:=Nil;
          //Asignamos el valor a las fechas
          cFechaCaducidad.Text:=DiaMesAnyo(QMaestro.FieldByName('fecha_caducidad_al').AsString);
          //Activamos el evento cambio de las fechas
          cFechaCaducidad.Properties.OnChange:=cFechaCaducidadChange;
          cObservaciones.Enabled := QMaestro.FieldByName('status_retenido_al').AsString = 'S';
     end;
end;

//--------------------- CAMBIO DE ESTADO DEL DATA SOURCE -----------------------
procedure TAlmacenes.DSMaestroStateChange(Sender: TObject);
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
procedure TAlmacenes.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     {
     if (Key=109) and BBorrar.Enabled then                     //Baja
        Borrar(Self)
     else
     if (Key=107) and BAlta.Enabled then                  //Alta
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
            else if Key=40 then                             //Flecha arriba
                    PostMessage(Handle,WM_NEXTDLGCTL,0,0)
                 else if Key=38 then                        //Flecha abajo
                         PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;


//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TAlmacenes.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TAlmacenes.QMaestroAfterInsert(DataSet: TDataSet);
begin
     QMaestro.FieldByName('EMPRESA_AL').AsString:=cEmpresa.Text;
     QMaestro.FieldByName('CLIENTE_AL').AsString:=cCliente.Text;
     QMaestro.FieldByName('LOTE_AL').AsString:=cLote.Text;
end;

//---------------------- PONE EL COLOR DE FOCO DE LOS CAMPOS CLAVES ------------
procedure TAlmacenes.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          if not SwAlta then
             TEdit(Sender).Color:=clMoneyGreen;
     end;
end;

//---------------------- QUITA EL COLOR DE FOCO DE LOS CAMPOS CLAVE ------------
procedure TAlmacenes.ColorExit(Sender: TObject);
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
procedure TAlmacenes.ColorExitSinCeros(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          if not SwAlta then
            TEdit(Sender).Color:=clWindow;
     end;
end;

//---------------------- QUITA EL COLOR DE ALTA DE LOS CAMPOS CLAVE ------------
procedure TAlmacenes.QuitarColorAlta();
begin
     cEmpresa.Color:=clWindow;
     cCliente.Color:=clWindow;
     cLote.Color:=clWindow;
end;

//---------------------- PONE EL COLOR DE ALTA DE LOS CAMPOS CLAVE -------------
procedure TAlmacenes.PonerColorAlta();
begin
     cEmpresa.Color:=clYellow;
     cCliente.Color:=clYellow;
     cLote.Color:=clYellow;
end;

//----------------------- CAMBIO DE LA EMPRESA ---------------------------------
procedure TAlmacenes.cEmpresaChange(Sender: TObject);
begin
     tNomEmpresa.Caption:=NomEmpresa(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
end;

//----------------------- CAMBIO DE CLIENTE ------------------------------------
procedure TAlmacenes.cClienteChange(Sender: TObject);
begin
     tNomCliente.Caption:=NomCliente(cEmpresa.Text, RellenarCeros(cCliente.Text,cCliente.MaxLength,'I'));
end;

//----------------------- CAMBIO DE FAMILIA ------------------------------------
procedure TAlmacenes.cFamiliaChange(Sender: TObject);
Var
   Familia: String;
begin
     if QMaestro.State in dsEditModes then
     begin
          Familia:=RellenarCeros(cFamilia.Text,cFamilia.Properties.MaxLength,'I');
          tNomFamilia.Caption:=NomFamilia(cEmpresa.Text, Familia);
          tNomArticulo.Caption:=NomArticulo(cEmpresa.Text,
                                            Familia,
                                            cArticulo.Text);
     end
     else
     begin
          tNomFamilia.Caption:=NomFamilia(QMaestro.FieldByName('Empresa_al').AsString,
                                          QMaestro.FieldByName('Familia_al').AsString);
          tNomArticulo.Caption:=NomArticulo(QMaestro.FieldByName('Empresa_al').AsString,
                                            QMaestro.FieldByName('Familia_al').AsString,
                                            QMaestro.FieldByName('Articulo_al').AsString);
     end;
end;

//----------------------- CAMBIO DEL ARTICULO ----------------------------------
procedure TAlmacenes.cArticuloChange(Sender: TObject);
begin
     if QMaestro.State in dsEditModes then
        tNomArticulo.Caption:=NomArticulo(cEmpresa.Text,
                                          RellenarCeros(cFamilia.Text,cFamilia.Properties.MaxLength,'I'),
                                          RellenarCeros(cArticulo.Text,cArticulo.Properties.MaxLength,'I'))
     else
         tNomArticulo.Caption:=NomArticulo(QMaestro.FieldByName('EMPRESA_AL').AsString,
                                           QMaestro.FieldByName('FAMILIA_AL').AsString,
                                           QMaestro.FieldByName('ARTICULO_AL').AsString);
end;

//----------------------- AL SALIR DE LA FAMILIA -------------------------------
procedure TAlmacenes.cFamiliaExit(Sender: TObject);
begin
     if QMaestro.State in dsEditModes then
        if Length(TcxDBTextEdit(Sender).Text)>0 then
           QMaestro.FieldByName('FAMILIA_AL').AsString:=RellenarCeros(TcxDBTextEdit(Sender).Text,TcxDBTextEdit(Sender).Properties.MaxLength,'I');
end;

//----------------------- AL SALIR DEL ARTICULO --------------------------------
procedure TAlmacenes.cArticuloExit(Sender: TObject);
begin
     if QMaestro.State in dsEditModes then
        if Length(TcxDBTextEdit(Sender).Text)>0 then
           QMaestro.FieldByName('ARTICULO_AL').AsString:=RellenarCeros(TcxDBTextEdit(Sender).Text,TcxDBTextEdit(Sender).Properties.MaxLength,'I');
end;

//----------------------- CALCULO DE CAMPOS CALCULADOS -------------------------
procedure TAlmacenes.QMaestroCalcFields(DataSet: TDataSet);
begin
     //Stock de Bultos
     QMaestro.FieldByName('CALC_BULTOS_STOCK').AsInteger:=QMaestro.FieldByName('BULTOS_ENTRADOS_AL').AsInteger - QMaestro.FieldByName('BULTOS_SALIDOS_AL').AsInteger;

     //Stock de Unidades
     QMaestro.FieldByName('CALC_UNIDADES_STOCK').AsFloat:=QMaestro.FieldByName('UNIDADES_ENTRADAS_AL').AsFloat -
                                                            (QMaestro.FieldByName('UNIDADES_SALIDAS_AL').AsFloat +
                                                             QMaestro.FieldByName('UNIDADES_MERMAS_AL').AsFloat +
                                                             QMaestro.FieldByName('UNIDADES_DESTRUIDAS_AL').AsFloat);
     //Stock de Palets
     QMaestro.FieldByName('CALC_PALETS_STOCK').AsInteger:=QMaestro.FieldByName('PALETS_ENTRADOS_AL').AsInteger - QMaestro.FieldByName('PALETS_SALIDOS_AL').AsInteger;
end;

//------------------- AUDITAMOS LA MODIFICACION DE LOTES -----------------------
procedure TAlmacenes.Auditar(Caracter: String);
Var
   QAux: TQuery;
begin
     QAux:=TQuery.Create(nil);
     try
        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
        QAux.SQL.Add('INSERT INTO AUDITORIA ' +
                     'VALUES(:Fecha, :Hora, ' +
                             QuotedStr(UsuarioGlobal) + ',' +
                             QuotedStr(Caracter) + ',' +
                             QuotedStr(QMaestro.FieldByName('Empresa_al').AsString) + ',' +
                             QuotedStr(QMaestro.FieldByName('Cliente_al').AsString) + ',' +
                             QuotedStr(QMaestro.FieldByName('Familia_al').AsString) + ',' +
                             QuotedStr(QMaestro.FieldByName('Articulo_al').AsString) + ',' +
                             QuotedStr(QMaestro.FieldByName('Lote_al').AsString) + ',' +
                             QuotedStr(IntToStr(QMaestro.FieldByName('Bultos_Entrados_al').AsInteger)) + ',' +
                             QuotedStr(IntToStr(QMaestro.FieldByName('bultos_salidos_al').AsInteger)) + ',' +
                             QuotedStr(IntToStr(QMaestro.FieldByName('CALC_BULTOS_STOCK').AsInteger)) + ',' +
                             ':UnidadesEnt,' +
                             ':UnidadesSal,' +
                             ':UnidadesDes,' +
                             ':UnidadesMer,' +
                             ':UnidadesStock,' +
                             QuotedStr(QMaestro.FieldByName('Status_Retenido_al').AsString) + ',' +
                             QuotedStr(IntToStr(QMaestro.FieldByName('Numero_Camara_al').AsInteger)) + ',' +
                             QuotedStr(QMaestro.FieldByName('Zona_al').AsString) + ',' +
                             QuotedStr(IntToStr(QMaestro.FieldByName('Estuches_Bulto_al').AsInteger)) + ',' +
                             QuotedStr(IntToStr(QMaestro.FieldByName('Estuches_Sueltos_al').AsInteger)) +  ',' +
                             ':PaletsEnt,' +
                             ':PaletsSal' + ')');
        QAux.ParamByName('Fecha').AsString:=AnyoMesDia(Date);
        QAux.ParamByName('Hora').AsString:=TimeToStr(Time);
        QAux.ParamByName('UnidadesEnt').AsFloat:=QMaestro.FieldByName('Unidades_Entradas_al').AsFloat;
        QAux.ParamByName('UnidadesSal').AsFloat:=QMaestro.FieldByName('Unidades_Salidas_al').AsFloat;
        QAux.ParamByName('UnidadesDes').AsFloat:=QMaestro.FieldByName('Unidades_Destruidas_al').AsFloat;
        QAux.ParamByName('UnidadesMer').AsFloat:=QMaestro.FieldByName('Unidades_Mermas_al').AsFloat;
        QAux.ParamByName('UnidadesStock').AsFloat:=QMaestro.FieldByName('CALC_UNIDADES_STOCK').AsFloat;
        QAux.ParamByName('PaletsEnt').AsFloat:=QMaestro.FieldByName('Palets_Entrados_al').AsFloat;
        QAux.ParamByName('PaletsSal').AsFloat:=QMaestro.FieldByName('Palets_Salidos_al').AsFloat;
        QAux.ExecSQL;
     finally
            QAux.Close;
            FreeAndNil(QAux);
     end;
end;

//----------------------- ANTES DE EDITAR (MODIFICAR) --------------------------
procedure TAlmacenes.QMaestroBeforeEdit(DataSet: TDataSet);
begin
     AntiguoStock:=QMaestro.FieldByName('CALC_UNIDADES_STOCK').AsFloat;  //Guardamos el valor del Stock
     TipoLoteAnt:=QMaestro.FieldByName('Tipo_lote_al').AsString;
     FechaCaducidadAnt:=DiaMesAnyo(QMaestro.FieldByName('fecha_caducidad_al').AsString);
     Auditar('E'); //Auditamos la modificacion
end;

//----------- ACTUALIZAR VALOR DEL STOCK Y MERCANCIA RETENIDA DEL CLIENTE ------
procedure TAlmacenes.ActualizarCliente;
Var
   QAux: TQuery;
   Precio: Real;
   MercanciaRetenida: String;
begin
     //Si ha cambiado unidades stock --> Actualizamos el valor del stock del cliente y el de mercancia retenida
     if AntiguoStock<>QMaestro.FieldByName('CALC_UNIDADES_STOCK').AsFloat then
     begin
          QAux:=TQuery.Create(nil);
          try
             QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

             //Leemos el Precio de Articulo
             QAux.SQL.Add(' SELECT VALOR_POR_KG_A ' +
                          ' FROM ARTICULOS ' +
                          ' WHERE EMPRESA_A=' + QuotedStr(QMaestro.FieldByName('Empresa_al').AsString) +
                          ' AND FAMILIA_A=' + QuotedStr(QMaestro.FieldByName('Familia_al').AsString) +
                          ' AND CODIGO_A=' + QuotedStr(QMaestro.FieldByName('Articulo_al').AsString));
             QAux.Open;
             if not QAux.IsEmpty then
                Precio:=QAux.FieldByName('VALOR_POR_KG_A').AsFloat
             else
                 Precio:=0;

             //Modifico el Valor del Stock del Cliente
             QAux.Close;
             QAux.SQL.Clear;
             QAux.SQL.Add(' UPDATE CLIENTES ' +
                          ' SET VALOR_STOCK_C=VALOR_STOCK_C - (:AntiguoStock * :Precio) + (:NuevoStock * :Precio) ' +
                          ' WHERE EMPRESA_C=' + QuotedStr(QMaestro.FieldByName('Empresa_al').AsString) +
                          ' AND CODIGO_C=' + QuotedStr(QMaestro.FieldByName('Cliente_al').AsString));
             QAux.ParamByName('AntiguoStock').AsFloat:=AntiguoStock;
             QAux.ParamByName('NuevoStock').AsFloat:=QMaestro.FieldByName('CALC_UNIDADES_STOCK').AsFloat;
             QAux.ParamByName('Precio').AsFloat:=Precio;
             QAux.ExecSql;

             //Actualizamos el Valor de Mercancia Retenida del Cliente

             //Leemos Valor del Stock y el de Pendiente Pago
             QAux.Close;
             QAux.SQL.Clear;
             QAux.SQL.Add(' SELECT VALOR_STOCK_C, IMP_PENDIENTE_PAGO_C ' +
                          ' FROM CLIENTES ' +
                          ' WHERE EMPRESA_C=' + QuotedStr(QMaestro.FieldByName('Empresa_al').AsString) +
                          ' AND CODIGO_C=' + QuotedStr(QMaestro.FieldByName('Cliente_al').AsString));
             QAux.Open;
             if not QAux.IsEmpty then
             begin
                   //Si el Valor del Stock es > que el Valor Pendiente de Pago
                   if(QAux.FieldByName('VALOR_STOCK_C').AsFloat>=QAux.FieldByName('IMP_PENDIENTE_PAGO_C').AsFloat) and
                     (QAux.FieldByName('IMP_PENDIENTE_PAGO_C').AsFloat>=0) then
                      MercanciaRetenida:='N'
                   else
                       MercanciaRetenida:='S';

                   //Modifico Mercancia Retenida
                   QAux.Close;
                   QAux.SQL.Clear;
                   QAux.SQL.Add(' UPDATE CLIENTES ' +
                                ' SET MERCANCIA_RETENIDA_C=:MercanciaRetenida ' +
                                ' WHERE EMPRESA_C=' + QuotedStr(QMaestro.FieldByName('Empresa_al').AsString) +
                                ' AND CODIGO_C=' + QuotedStr(QMaestro.FieldByName('Cliente_al').AsString));
                   QAux.ParamByName('MercanciaRetenida').AsString:=MercanciaRetenida;
                   QAux.ExecSql;
             end;
          finally
                 QAux.Close;
                 FreeAndNil(QAux);
          end;
     end;
end;

//--------------------- AL ENTRAR EN TIPO DE LOTE ------------------------------
procedure TAlmacenes.cTipoLoteEnter(Sender: TObject);
begin
     //Si es tipo regularizacion o tipo normal o existen salidas no podemos cambiar el Tipo de Lote
     if (QMaestro.FieldByName('TIPO_LOTE_AL').AsString='R') or
        (QMaestro.FieldByName('TIPO_LOTE_AL').AsString='N') or
        (QMaestro.FieldByName('BULTOS_SALIDOS_AL').AsInteger<>0) or
        (QMaestro.FieldByName('UNIDADES_SALIDAS_AL').AsFloat<>0) or
        (QMaestro.FieldByName('UNIDADES_DESTRUIDAS_AL').AsFloat<>0) or
        (QMaestro.FieldByName('UNIDADES_MERMAS_AL').AsFloat<>0) then
     begin
          cBultosEnt.SetFocus;
          Mensaje('Tipo lote normal o ya existen salidas --> No cambiar Tipo Lote');
     end;
end;

//----------------------- DESPUES DE ABRIR LA TABLA ----------------------------
procedure TAlmacenes.QMaestroAfterOpen(DataSet: TDataSet);
begin
     if QMaestro.IsEmpty then
        cRetenido.Checked:=False;
end;

procedure TAlmacenes.QTiposLoteCalcFields(DataSet: TDataSet);
begin
     QTiposLote.FieldByName('des').AsString:=QTiposLote.FieldByName('codigo_tl').AsString +
                                             ' - ' +
                                             QTiposLote.FieldByName('descripcion_tl').AsString;
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TAlmacenes.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresa.Text:=CodEmpresa;
     cEmpresa.SetFocus;
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TAlmacenes.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if Key=VK_F2 then
       cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TAlmacenes.cLupaClientesClick(Sender: TObject);
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
procedure TAlmacenes.cClientesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaClientesClick(Self);
end;

//-------------------------- LUPA DE ARTICULOS ---------------------------------
procedure TAlmacenes.cLupaArticulosClick(Sender: TObject);
Var
   Articulo, Familia: String;
begin
     Familia:=RellenarCeros(cFamilia.Text,cFamilia.Properties.MaxLength,'I');
     Articulo:=LupaArticulos(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'),
                             Familia);
     if not (QMaestro.State in dsEditModes) then
     begin
          if (cArticulo.Text<>Articulo) and  (Articulo<>'') then
          begin
               QMaestro.Edit;
               QMaestro.FieldByName('Articulo_al').AsString:=Articulo;
          end;
     end
     else if Articulo<>'' then
             QMaestro.FieldByName('Articulo_al').AsString:=Articulo;
     cArticulo.Setfocus;
end;

//-------------------------- LUPA (F2) DE ARTICULOS ----------------------------
procedure TAlmacenes.cArticuloKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaArticulosClick(Self);
end;

//-------------------------- LUPA DE FAMILIAS-----------------------------------
procedure TAlmacenes.cLupaFamiliasClick(Sender: TObject);
Var
   Familia: String;
begin
     Familia:=LupaFamilias(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
     if not (QMaestro.State in dsEditModes) then
     begin
          if (cFamilia.Text<>Familia) and  (Familia<>'') then
          begin
               QMaestro.Edit;
               QMaestro.FieldByName('Familia_al').AsString:=Familia;
          end;
     end
     else if Familia<>'' then
             QMaestro.FieldByName('Familia_al').AsString:=Familia;
     cFamilia.SetFocus;
end;

//-------------------------- LUPA (F2) DE FAMILIAS -----------------------------
procedure TAlmacenes.cFamiliaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaFamiliasClick(Self);
end;

//-------------------------- ANTES DE GRABAR -----------------------------------
procedure TAlmacenes.QMaestroBeforePost(DataSet: TDataSet);
begin
     //Al grabar el almacen ponemos la fecha de modificacion
     QMaestro.FieldByName('Fecha_Modif_al').AsString:=AnyoMesDia(Date());
     QMaestro.FieldByName('fecha_caducidad_al').AsString:=AnyoMesDia(cFechaCaducidad.Text);

     //Valores por defecto si hay nulos
     if QMaestro['bultos_entrados_al']=NULL then
         QMaestro['bultos_entrados_al']:=0;
     if QMaestro['bultos_salidos_al']=NULL then
         QMaestro['bultos_salidos_al']:=0;
     if QMaestro['unidades_entradas_al']=NULL then
         QMaestro['unidades_entradas_al']:=0;
     if QMaestro['unidades_salidas_al']=NULL then
         QMaestro['unidades_salidas_al']:=0;
     if QMaestro['unid_sal_mismo_dia_al']=NULL then
         QMaestro['unid_sal_mismo_dia_al']:=0;
     if QMaestro['unidades_destruidas_al']=NULL then
         QMaestro['unidades_destruidas_al']:=0;
     if QMaestro['unidades_mermas_al']=NULL then
         QMaestro['unidades_mermas_al']:=0;
     if QMaestro['estuches_bulto_al']=NULL then
         QMaestro['estuches_bulto_al']:=0;
     if QMaestro['estuches_sueltos_al']=NULL then
         QMaestro['estuches_sueltos_al']:=0;
     if QMaestro['palets_entrados_al']=NULL then
         QMaestro['palets_entrados_al']:=0;
     if QMaestro['palets_salidos_al']=NULL then
         QMaestro['palets_salidos_al']:=0;
end;

procedure TAlmacenes.cFamiliaEnter(Sender: TObject);
begin
     cBultosEnt.SetFocus;
end;

procedure TAlmacenes.cRetenidoClick(Sender: TObject);
begin
  cObservaciones.Enabled := (cRetenido.State = cbChecked);
end;

//-------------- NO PODEMOS CAMBIAR UN LOTE QUE NO ES NORMAL O REGULARIZACION A TIPO NORMAL O REGULARIZACION -----
procedure TAlmacenes.cTipoLoteCloseUp(Sender: TObject);
begin
     if ((TipoLoteAnt<>'N') and (TipoLoteAnt<>'R')) and ((QMaestro.FieldByName('Tipo_lote_al').AsString='N') or (QMaestro.FieldByName('Tipo_lote_al').AsString='R')) then
     begin
          MessageDlg (Chr(13) + 'Un lote no podemos cambiarlo a tipo normal', mtError,[mbOk],0);
          QMaestro.FieldByName('Tipo_lote_al').AsString:=TipoLoteAnt;
     end;
end;

//------------------------ CONTROL DE TECLAS EN EL TIPO DE LOTE ----------------
procedure TAlmacenes.cTipoLoteKeyPress(Sender: TObject; var Key: Char);
Var
   Pulsacion: char;
begin
     Pulsacion:=UpCase(Key);
     if (Pulsacion='B') or (Pulsacion='T') or (Pulsacion='I') or (Pulsacion='R') then
     begin
          if not (QMaestro.State in dsEditModes) then  //Si estamos visualizando
             if Pulsacion<>cTipoLote.KeyValue then  //Si cambiamos el codigo entonces ponemos en edicion
                QMaestro.Edit;
          if QMaestro.State in dsEditModes then  //Si estamos modificando o insertando
             QMaestro.FieldByName('Tipo_lote_al').AsString:=Pulsacion;
     end;
     Key:=#0;
end;

//---- AL CAMBIAR BULTOS ENTRADOS, BULTOS SALIDOS, ESTUCHES X BULTO Y ESTUCHES SUELTOS --
procedure TAlmacenes.cBultosEntChange(Sender: TObject);
begin
     if QMaestro.State in dsEditModes then
     begin
          //Si Bultos Entrados, Bultos Salidos y Estuches Sueltos tienen valor
          if (cBultosEnt.Text<>'') and (cBultosSalidos.Text<>'') and (cEstuchesPorBulto.Text<>'') then
          begin
               QMaestro.FieldByName('Estuches_totales_al').AsInteger:=((StrToInt(cBultosEnt.Text) - StrToInt(cBultosSalidos.Text)) * StrToInt(cEstuchesPorBulto.Text));
               //Sumamos los estuches sueltos si tienen valor
               if cEstuchesSueltos.Text<>'' then
                  QMaestro.FieldByName('Estuches_totales_al').AsInteger:=QMaestro.FieldByName('Estuches_totales_al').AsInteger + StrToInt(cEstuchesSueltos.Text);
          end
          else if cEstuchesSueltos.Text<>'' then //Si estuches sueltos tiene valor
                  QMaestro.FieldByName('Estuches_totales_al').AsInteger:=StrToInt(cEstuchesSueltos.Text)
               else
                   QMaestro.FieldByName('Estuches_totales_al').AsInteger:=0;
     end;
end;

procedure TAlmacenes.FormActivate(Sender: TObject);
begin
     if PanelClaves.Enabled then
        cCliente.SetFocus;
end;

procedure TAlmacenes.cFechaCaducidadChange(Sender: TObject);
begin
     if (QMaestro.Active) and  not (QMaestro.State in dsEditModes) then  //Ponemos en edicion si no lo esta
        QMaestro.Edit;
end;

procedure TAlmacenes.cFechaCaducidadExit(Sender: TObject);
begin
     if TcxDateEdit(Sender).Text<>'' then
     begin
          if not EsFecha(TcxDateEdit(Sender).Text) then
          begin
               TcxDateEdit(Sender).SetFocus;
               MessageDlg (Chr(13) + 'Fecha incorrecta', mtError,[mbOk],0);
          end;
     end;
end;

end.


