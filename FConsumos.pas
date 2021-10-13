unit FConsumos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ActnMan, ActnCtrls, ExtCtrls, StdCtrls, ComCtrls, DB,
  DBTables, Mask, DBCtrls,
  Buttons, Grids, DBGrids, DBClient,
  Provider, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlue, Menus,
  cxButtons, SimpleSearch, cxTextEdit, cxDBEdit, dxSkinsdxBarPainter, dxBar,
  cxClasses, cxCurrencyEdit ;

type
  TConsumos = class(TForm)
    BarraEstado: TStatusBar;
    Timer1: TTimer;
    QMaestro: TQuery;
    DSMaestro: TDataSource;
    PanelDatos: TPanel;
    QContar: TQuery;
    GridLineas: TDBGrid;
    PanelEntrada: TPanel;
    QConceptos: TQuery;
    DSConceptos: TDataSource;
    cConcepto: TcxDBTextEdit;
    tNomConcepto: TPanel;
    cLupaConceptos: TSimpleSearch;
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
    cCliente: TEdit;
    StaticText12: TStaticText;
    cEmpresa: TEdit;
    tNomEmpresa: TPanel;
    tNomCliente: TPanel;
    QMaestroempresa_cs: TStringField;
    QMaestrocliente_cs: TStringField;
    QMaestroconcepto_cs: TStringField;
    QMaestrolectura_actual_cs: TIntegerField;
    QMaestrolectura_anterior_cs: TIntegerField;
    QMaestroconsumos_cs: TIntegerField;
    QMaestroprecio_cs: TFloatField;
    QMaestrototalo_cs: TFloatField;
    QMaestrofacturado_cs: TStringField;
    StaticText14: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    cLecturaActual: TcxDBTextEdit;
    cLecturaAnterior: TcxDBTextEdit;
    cConsumo: TcxDBTextEdit;
    cPrecio: TcxDBTextEdit;
    cTotal: TcxDBTextEdit;
    QMaestroNombreConcepto: TStringField;
    Panel1: TPanel;
    StaticText10: TStaticText;
    cTotalConsumo: TcxCurrencyEdit;
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
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Busqueda(Sender: TObject);
    procedure QMaestroAfterInsert(DataSet: TDataSet);
    procedure ColorEnter(Sender: TObject);
    procedure ColorExit(Sender: TObject);
    procedure cEmpresaChange(Sender: TObject);
    procedure cClienteChange(Sender: TObject);
    procedure Calculo(Sender: TObject);
    procedure AlMoverRegistro(DataSet: TDataSet);
    procedure GridLineasDblClick(Sender: TObject);
    procedure cLupaEmpresasClick(Sender: TObject);
    procedure cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaClientesClick(Sender: TObject);
    procedure cClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaConceptosClick(Sender: TObject);
    procedure cConceptoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure cConceptoPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cConceptoExit(Sender: TObject);
    procedure QMaestroCalcFields(DataSet: TDataSet);
    procedure cStatusFacturaChange(Sender: TObject);
    procedure QMaestroAfterScroll(DataSet: TDataSet);

  private
    {Private declarations}
    SwAlta: Boolean;
    PosRegistro, NRegistros: Integer;

    procedure Mensaje(Texto: String );
    procedure BotonesPosicion();
    function  ValidarCabecera():Boolean;
    function  ValidarDetalles():Boolean;
    function  ValidadRegistro():Boolean;
    function  EjecutaQuery(Empresa, Cliente: String):Boolean;
    function  EjecutaQueryBus(EmpresaBus, ClienteBus, ConceptoBus: String):Boolean; overload;
    function  EjecutaQueryBus(WhereBus: String):Boolean; overload;    procedure QuitarColorAlta();
    procedure PonerColorAlta();
    function ObtenerPrecio(): Currency;
    function ExisteConcepto(): Boolean;

    procedure CalculoTotalConsumo;

//    function EjecutaQueryBus(EmpresaBus, ClienteBus, Conceptobus: String): Boolean;
  public
    sEmpresa, sCliente: String;
    { Public declarations }
  end;

var
   Consumos: TConsumos;

implementation

uses UGLobal, MBaseDatos, DM, FPrincipal, BArticulosCliente;

{$R *.dfm}

//------------------------ CREACION DEL FORMULARIO -----------------------------
procedure TConsumos.FormCreate(Sender: TObject);
begin
     Top:=1;
     Left:=0;

     SwAlta:=False;
     PosRegistro:=0;
     NRegistros:=0;

     QMaestro.AfterScroll:=AlMoverRegistro;

     //------------------ Preparamos la tabla de artículos ---------------------
     QConceptos.Close;
     QConceptos.SQL.Clear;
     QConceptos.SQL.Add(' SELECT EMPRESA_C, CODIGO_C, DESCRIPCION_C FROM CONCEPTOS ' +
                        ' WHERE EMPRESA_C=:Empresa ' +
                        ' AND CODIGO_C=:Codigo '  );
     QConceptos.Prepare;
end;

//-------------------- EVENTO SCROLL -------------------------------------------
procedure TConsumos.AlMoverRegistro(DataSet: TDataSet);
begin
     if SwAlta=False then  //El estado es de visualizacion
     begin
          cEmpresa.Text:=QMaestro.FieldByName('EMPRESA_CS').AsString;
          cCliente.Text:=QMaestro.FieldByName('CLIENTE_CS').AsString;  //No estan enganchados a BD y debemos asignarlos a mano
     end;
end;

//------------------------ CIERRE DEL FORMULARIO -------------------------------
procedure TConsumos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;

     QConceptos.Close;
end;

//----------------------- CIERRRE DEL QUERY DEL FORMULARIO ---------------------
procedure TConsumos.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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
procedure TConsumos.Mensaje(Texto: String );
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

//------------------- PRECIO CONSUMO ELECTRICO POR CLIENTE ---------------
function TConsumos.ObtenerPrecio: Currency;
Var
   QAux: TQuery;
begin
     Result:=0;
     QAux:=TQuery.Create(nil);
     try
        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

        //MANTENIMIENTO CLIENTE
        QAux.SQL.Add(' SELECT PRECIO_KW_THERMO_C FROM CLIENTES' +
                     ' WHERE EMPRESA_C=' + QuotedStr(QMaestro.FieldByName('EMPRESA_CS').AsString) +
                     ' AND CODIGO_C=' + QuotedStr(QMaestro.FieldByName('CLIENTE_CS').AsString));
        QAux.Open;

        if not QAux.IsEmpty then
          Result:=QAux.FieldByName('precio_kw_thermo_c').AsCurrency
        else
          Result:=0;

      finally
             QAux.Close;
             FreeAndNil(QAux);
      end
end;

//--------------------- TIMER PARALOS MENSAJES ---------------------------------
procedure TConsumos.Timer1Timer(Sender: TObject);
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
procedure TConsumos.BotonesPosicion();
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
          else
          begin
               BPrimero.Enabled:=True;
               BAnterior.Enabled:=True;
               BSiguiente.Enabled:=True;
               BUltimo.Enabled:=True;
          end;
          BarraEstado.Panels[1].Text := IntToStr(NRegistros) + ' Registros';
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
procedure TConsumos.Alta(Sender: TObject);
begin
     swAlta:=True;
     PonerColorAlta();
     Mensaje('Alta de Registro');
     BarraEstado.Panels[1].Text:='';

     if QMaestro.Active then    //Ya existen datos en pantalla
     begin
          QMaestro.append;

          PanelClaves.Enabled:=False;
          PanelDatos.Enabled:=False;

          PanelEntrada.Visible:=True;

          //Valores por defecto
          QMaestro.FieldByName('facturado_cs').AsString := 'N';
          QMaestro.FieldByName('precio_cs').AsFloat:= ObtenerPrecio();

          cConcepto.SetFocus;

          Mensaje('Alta de registro');
          BAceptar.Enabled:=True;
     end
     else  //No hemos localizado datos aun
     begin
          NRegistros:=0;
          PosRegistro:=0;

          PanelClaves.Enabled:=True;

          cEmpresa.Text:=sEmpresa;
          cCliente.Text:=sCliente;
          cCliente.SetFocus;
          bAlta.Click;
     end;

     //Botones
     BCancelar.Enabled:=True;
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
procedure TConsumos.Borrar(Sender: TObject);
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
                  cEmpresa.Text:=sEmpresa;
                  cCliente.Text:=sCliente;
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

//-------------------------- PRIMER REGISTRO ----------------------------------- OK
procedure TConsumos.Primero(Sender: TObject);
begin
     PosRegistro:=1;          //Numero de registro en el que estamos
     QMaestro.First;
     BotonesPosicion();
end;

//-------------------------- REGISTRO ANTERIOR ---------------------------------  OK
procedure TConsumos.Anterior(Sender: TObject);
begin
     if PosRegistro>1 then
        Dec(PosRegistro);        //Numero de registro en el que estamos
     QMaestro.Prior;
     BotonesPosicion();
end;

//-------------------------- REGISTRO SIGUIENTE --------------------------------  OK
procedure TConsumos.Siguiente(Sender: TObject);
begin
     if PosRegistro<NRegistros then
        Inc(PosRegistro);       //Numero de registro en el que estamos
     QMaestro.Next;
     BotonesPosicion();
end;

//-------------------------- ULTIMO REGISTRO -----------------------------------  OK
procedure TConsumos.Ultimo(Sender: TObject);
begin
     PosRegistro:=NRegistros; //Numero de registro en el que estamos
     QMaestro.Last;
     BotonesPosicion();
end;

//----------------------------- BUSQUEDA ---------------------------------------
procedure TConsumos.Busqueda(Sender: TObject);
//Var
//   Aux: TBusquedaArticulosCliente;
begin
{
     try
        Aux:=TBusquedaArticulosCliente.Create(Self);
        with Aux do
        begin
             ShowModal;
             if (FamiliaBus<>'') or (ArticuloBus<>'') or (ArticuloCliBus<>'') then   //Seleccionamos un registro del grid resultado
             begin
                  if EjecutaQueryBus(EmpresaBus, ClienteBus, ConceptoBus) then
                     Self.PanelClaves.Enabled:=False
                  else  //Si no hay registros que mostrar
                  begin
                       Self.PanelClaves.Enabled:=True;

                       cEmpresa.Text:=EmpresaGlobal;
                       cCliente.Text:='';
                       cCliente.SetFocus;
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
                       Mensaje('Registro no existe');
                 end;
            end
        end;
     finally
            FreeAndNil(Aux);
     end;
}
end;

//------------------------ BOTON ACEPTAR ----------------------------------------
procedure TConsumos.Aceptar(Sender: TObject);
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
                       if QMaestro.Database.InTransaction then
                          QMaestro.Database.Commit;

                       Application.ProcessMessages;

                       QMaestro.DisableControls;
                       QMaestro.Close;
                       QMaestro.Open;
                       QMaestro.GotoBookmark(Posicion);
                       QMaestro.EnableControls;

                       PanelDatos.Enabled:=True;
                       PanelEntrada.Visible:=False;
                       BotonesPosicion(); 
                  end
                  else   //Alta
                  begin
                       if not QMaestro.Database.InTransaction then
                          QMaestro.Database.StartTransaction;
                       QMaestro.Post;
                       if QMaestro.Database.InTransaction then
                          QMaestro.Database.Commit;

                       swAlta:=False;
                       EjecutaQuery(cEmpresa.Text, cCliente.Text);     //Refrescamos el Query -- En algun caso se perdia el registro activo

                       QuitarColorAlta();

                       PanelEntrada.Visible:=False;
                       PanelDatos.Enabled:=True;
                       PanelClaves.Enabled:=False;

                       //Finalizacion de la grabacion
                       Mensaje('Registro Grabado');
                  end;
                  CalculoTotalConsumo;
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
end;

//--------------------- BOTON CANCELAR -----------------------------------------
procedure TConsumos.Cancelar(Sender: TObject);
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
                           PanelEntrada.Visible:=False;
                           PanelDatos.Enabled:=True;
                           Exit;
                      end
                      else   //Alta
                      begin
                           QMaestro.Cancel;

                           SwAlta:=False;

                           QuitarColorAlta();

                           QMaestro.First;
                           BotonesPosicion();
                           PanelEntrada.Visible:=False;
                           if QMaestro.IsEmpty then
                           begin
                                PanelClaves.Enabled:=True;
                                cEmpresa.Text:=sEmpresa;
                                cCliente.Text:=sCliente;
                                cCliente.SetFocus;
                           end
                           else
                               PanelDatos.Enabled:=True;

                           Mensaje('Cambios Ignorados');
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
      begin
           QMaestro.Close;

           SwAlta:=False;

           QuitarColorAlta();
           
           PanelClaves.Enabled:=True;
           PanelDatos.Enabled:=True;
           PanelEntrada.Visible:=False;

           cEmpresa.Text:=sEmpresa;
           cCliente.Text:=sCliente;
           PosRegistro:=0;
           NRegistros:=0;
           cCliente.SetFocus;

           BotonesPosicion();
           close;
      end;
end;

//----------------------------- SALIR ------------------------------------------
procedure TConsumos.Salir(Sender: TObject);
begin
     Close;
end;

//-------------------------- VALIDACION DE DATOS CABECERA ----------------------
function TConsumos.ValidarCabecera():Boolean;
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
     else if cCliente.Text='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'Falta el cliente', mtError,[mbOk],0);
          cCliente.SetFocus;
     end
     else if tNomCliente.Caption='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'El cliente no existe', mtError,[mbOk],0);
          cCliente.SetFocus;
     end;
end;

//-------------------------- VALIDACION DE DATOS DETALLES-----------------------
function TConsumos.ValidarDetalles():Boolean;
begin
     //concepto repetido
     if (ExisteConcepto) then
     begin
       Result:=False;
       cConcepto.SetFocus;
       MessageDlg (Chr(13) + 'Atencion! Ya se ha introducido este concepto en el consumo', mtError,[mbOk],0);
       Exit;
     end
     else if cConcepto.Text='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'Falta el concepto', mtError,[mbOk],0);
          cConcepto.SetFocus;
     end
     else if tNomConcepto.Caption='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'El concepto no existe', mtError,[mbOk],0);
          cConcepto.SetFocus;
     end
     //LECTURA ACTUAL
     else if (not EsNumerico(cLecturaActual.Text)) or (StrToInt(cLecturaActual.Text)<=0)  then
     begin
          Result:=False;
          cLecturaActual.SetFocus;
          MessageDlg (Chr(13) + 'La Lectura Actual debe ser mayor que cero', mtError,[mbOk],0);
          Exit;
     end
     //LECTURA ANTERIOR
     else if (not EsNumerico(cLecturaAnterior.Text)) or (StrToInt(cLecturaAnterior.Text)<0)  then
     begin
          Result:=False;
          cLecturaAnterior.SetFocus;
          MessageDlg (Chr(13) + 'La Lectura Anterior debe ser mayor o igual que cero', mtError,[mbOk],0);
          Exit;
     end
     //CONSUMO
     else if (not EsNumerico(cConsumo.Text)) or (StrToInt(cConsumo.Text)<0)  then
     begin
          Result:=False;
          cConsumo.SetFocus;
          MessageDlg (Chr(13) + 'El Consumo debe ser mayor o igual que cero', mtError,[mbOk],0);
          Exit;
     end
     else
        Result:=ValidadRegistro();
end;

//------------------------ APERTURA DE LA QUERY PRINCIPAL ----------------------  OK
function TConsumos.ValidadRegistro():Boolean;
Var
   QAux: TQuery;
begin

    Result:=True;
    if not swAlta then exit;
     try
        QAux:=TQuery.Create(nil);
        try
           With QAux do
           begin
                DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                SQL.Add(' SELECT * ' +
                        ' FROM CONSUMOS ' +
                        ' WHERE EMPRESA_CS=' + QuotedStr(cEmpresa.Text) +
                        ' AND CLIENTE_CS=' + QuotedStr(cCliente.Text) +
                        ' AND CONCEPTO_CS=' + QuotedStr(cConcepto.Text));
                Open;
                if not IsEmpty() then
                begin
                     MessageDlg (Chr(13) + 'El concepto ya existe', mtError,[mbOk],0);
                     cConcepto.SetFocus;
                     Result:=False;
                     exit;
                end;
           end;
        finally
               QAux.Close;
               FreeAndNil(QAux);
        end;
     except
           raise;
     end;
end;

//------------------- FOCO EN EL PANEL DE DATOS --------------------------------
procedure TConsumos.PanelDatosEnter(Sender: TObject);
begin
     if ValidarCabecera() then
     begin
          if not QMaestro.Active then  //Si no hay registros abiertos
          begin
               if not SwAlta then  //Si no es alta
               begin
                    if not EjecutaQuery(cEmpresa.Text, cCliente.Text) then   //Si no hay datos
                    begin
                           bAlta.Click;
//                         cCliente.SetFocus;
//                         Mensaje('El registro no existe');
                    end
                    else//Si hay datos
                    begin
                        PanelClaves.Enabled:=False;
                        CalculoTotalConsumo;
                    end;
               end
               else
               begin
                    EjecutaQuery(cempresa.Text, cCliente.Text);

                    QMaestro.append;

                    PanelClaves.Enabled:=False;
                    PanelDatos.Enabled:=False;

                    PanelEntrada.Visible:=True;
                    cConcepto.SetFocus;

                    Mensaje('Alta de registro');
                    BAceptar.Enabled:=True;
               end;
         end;
     end;
end;

//------------------------ APERTURA DE LA QUERY PRINCIPAL ----------------------  OK
function TConsumos.EjecutaQuery(Empresa, Cliente: String):Boolean;
begin
     Result:=False;
     NRegistros:=0;
     PosRegistro:=0;
     try
        QMaestro.Close;
        QMaestro.SQL.Clear;
        QMaestro.SQL.Add(' SELECT * FROM CONSUMOS ' +
                         ' WHERE EMPRESA_CS=' + QuotedStr(Empresa) +
                         ' AND CLIENTE_CS=' + QuotedStr(Cliente) +
                         ' ORDER BY EMPRESA_CS, CLIENTE_CS, CONCEPTO_CS');
        QMaestro.Open;
        if QMaestro.IsEmpty then
        begin
           cEmpresa.Text := sEmpresa;
           cCliente.Text := sCliente;
           Result:=False
        end
        else
        begin
             QMaestro.First;
             try    //Contamos los Registros
                With QContar do
                begin
                     Close;
                     SQL.Clear;
                     SQL.Add(' SELECT COUNT(*) AS NREGISTROS ' +
                             ' FROM CONSUMOS ' +
                             ' WHERE EMPRESA_CS=' + QuotedStr(Empresa) +
                             ' AND CLIENTE_CS=' + QuotedStr(Cliente));
                     Open;
                     NRegistros:=FieldByName('NRegistros').AsInteger;  //Contamos los registros
                     PosRegistro:=1;
                end;
             finally
                    QContar.Close;
             end;
             Result:=True;
        end;
        if not QMaestro.IsEmpty then      
          QMaestro.First;
        BotonesPosicion();
    except
          on E:Exception do
               CapturaErrores(E);
    end;
end;

//---------------- APERTURA DE LA QUERY PRINCIPAL DESDE LA BUSQUEDA-------------
function TConsumos.EjecutaQueryBus(EmpresaBus, ClienteBus, ConceptoBus: String):Boolean;
Var
   WhereBus: String;
   HayWhere: Boolean;
begin
     Result:=False;
     HayWhere:=False;
     NRegistros:=0;
     PosRegistro:=0;
     try
        QMaestro.Close;
        QMaestro.SQL.Clear;
        QMaestro.SQL.Add('SELECT * FROM CONSUMOS ');
        if EmpresaBus<>'' then
        begin
             WhereBus:=' WHERE EMPRESA_CS=' + QuotedStr(EmpresaBus);
             HayWhere:=True;
        end;
        if ClienteBus<>'' then
        begin
             if HayWhere then
                WhereBus:=WhereBus + ' AND CLIENTE_CS=' + QuotedStr(ClienteBus)
             else
                 WhereBus:=' WHERE CLIENTE_CS=' + QuotedStr(ClienteBus);
        end;
        if ConceptoBus<>'' then
        begin
             if HayWhere then
                WhereBus:=WhereBus + ' AND CONCEPTO_CS=' + QuotedStr(ConceptoBus)
             else
                 WhereBus:=' WHERE CONCEPTO_CS=' + QuotedStr(ConceptoBus);
        end;
        QMaestro.SQL.Add(WhereBus + ' ORDER BY EMPRESA_CS, CLIENTE_CS');
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
                     SQL.Add('SELECT COUNT(*) AS NREGISTROS FROM CONSUMOS ' + WhereBus);
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
function TConsumos.EjecutaQueryBus(WhereBus: String):Boolean;
begin
     Result:=False;
     NRegistros:=0;
     PosRegistro:=0;
     try
        QMaestro.Close;
        QMaestro.SQL.Clear;
        QMaestro.SQL.Add('SELECT * FROM CONSUMOS ' +
                         WhereBus +
                         ' ORDER BY EMPRESA_CS, CLIENTE_CS');
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
                     SQL.Add('SELECT COUNT(*) AS NREGISTROS FROM CONSUMOS ' + WhereBus);
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

function TConsumos.ExisteConcepto(): boolean;
Var
   QAux: TQuery;
begin
    if not swAlta then exit;

     QAux:=TQuery.Create(nil);
     try
        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

        //MANTENIMIENTO CLIENTE
        QAux.SQL.Add(' SELECT * FROM CONSUMOS' +
                     ' WHERE EMPRESA_CS=' + QuotedStr(QMaestro.FieldByName('EMPRESA_CS').AsString) +
                     ' AND CLIENTE_CS=' + QuotedStr(QMaestro.FieldByName('CLIENTE_CS').AsString) +
                     ' AND CONCEPTO_CS=' + QuotedStr(QMaestro.FieldByName('CONCEPTO_CS').AsString) );
        QAux.Open;

        Result := not Qaux.IsEmpty;

      finally
             QAux.Close;
             FreeAndNil(QAux);
      end
end;

//--------------------- CAMBIO DE ESTADO DEL DATA SOURCE -----------------------
procedure TConsumos.DSMaestroStateChange(Sender: TObject);
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
procedure TConsumos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
procedure TConsumos.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TConsumos.FormShow(Sender: TObject);
begin
   cEmpresa.Text:=sEmpresa;
   cCliente.Text:=sCliente;
end;

//---------------------- DESPUES DE INSERTAR -----------------------------------
procedure TConsumos.QMaestroAfterInsert(DataSet: TDataSet);
begin
     //Campos que no estan enlazados a BD
     QMaestro.FieldByName('EMPRESA_CS').AsString:=cEmpresa.Text;
     QMaestro.FieldByName('CLIENTE_CS').AsString:=cCliente.Text;
end;

procedure TConsumos.QMaestroAfterScroll(DataSet: TDataSet);
begin
    CalculoTotalConsumo;
end;

procedure TConsumos.QMaestroCalcFields(DataSet: TDataSet);
begin
     //Rellenamos el nombre del concepto
     QConceptos.Close;
     QConceptos.ParamByName('Empresa').AsString:=QMaestro.FieldByName('Empresa_cs').AsString;
     QConceptos.ParamByName('Codigo').AsString:=QMaestro.FieldByName('Concepto_cs').AsString;
     QConceptos.Open;
     QMaestro.FieldByName('NombreConcepto').AsString:=QConceptos.FieldByName('descripcion_c').AsString;
end;

//---------------------- PONE EL COLOR DE FOCO DE LOS CAMPOS CLAVES ------------
procedure TConsumos.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          if not SwAlta then
             TEdit(Sender).Color:=clMoneyGreen;
     end;
end;

//---------------------- QUITA EL COLOR DE FOCO DE LOS CAMPOS CLAVE ------------
procedure TConsumos.ColorExit(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          if not SwAlta then
            TEdit(Sender).Color:=clWindow;
          if Length(TEdit(Sender).Text)>0 then
             TEdit(Sender).Text:=RellenarCeros(TEdit(Sender).Text,TEdit(Sender).MaxLength,'I');
     end;
end;

procedure TConsumos.cStatusFacturaChange(Sender: TObject);
begin
end;

//---------------------- QUITA EL COLOR DE ALTA DE LOS CAMPOS CLAVE ------------
procedure TConsumos.QuitarColorAlta();
begin
     cEmpresa.Color:=clWindow;
     cCliente.Color:=clWindow;
end;

//---------------------- PONE EL COLOR DE ALTA DE LOS CAMPOS CLAVE -------------
procedure TConsumos.PonerColorAlta();
begin
     cEmpresa.Color:=clYellow;
     cCliente.Color:=clYellow;
end;

//----------------------- CAMBIO DE LA EMPRESA ---------------------------------
procedure TConsumos.cEmpresaChange(Sender: TObject);
begin
     tNomEmpresa.Caption:=NomEmpresa(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
end;

//----------------------- CAMBIO DEL CLIENTE -----------------------------------
procedure TConsumos.cClienteChange(Sender: TObject);
begin
     tNomCliente.Caption:=NomCliente(cEmpresa.Text, RellenarCeros(cCliente.Text,cCliente.MaxLength,'I'));
end;

//----------------------- CAMBIO DEL CONCEPTO -----------------------------------
procedure TConsumos.cConceptoPropertiesChange(Sender: TObject);
begin
     tNomConcepto.Caption:=NomConcepto(cEmpresa.Text, cConcepto.Text);
end;

procedure TConsumos.Calculo(Sender: TObject);
begin
  if QMaestro.State in dsEditModes then
  begin
     //Consummo
     QMaestro.FieldByName('consumo_cs').AsFloat:=QMaestro.FieldByName('lectura_actual_cs').AsFloat - QMaestro.FieldByName('lectura_anterior_cs').AsFloat;
     //Total
     QMaestro.FieldByName('total_cs').AsFloat:=QMaestro.FieldByName('consumo_cs').AsFloat * QMaestro.FieldByName('precio_cs').AsFloat;
  end;
end;

procedure TConsumos.CalculoTotalConsumo;
Var
   QAux: TQuery;
begin
     cTotalConsumo.Text := '0';
     QAux:=TQuery.Create(nil);
     try
        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

        //LINEAS CONSUMO
        QAux.SQL.Add(' SELECT SUM(TOTAL_CS) TOTAL_CS FROM CONSUMOS' +
                     ' WHERE EMPRESA_CS=' + QuotedStr(QMaestro.FieldByName('EMPRESA_CS').AsString) +
                     ' AND CLIENTE_CS=' + QuotedStr(QMaestro.FieldByName('CLIENTE_CS').AsString) );
        QAux.Open;

        if not QAux.IsEmpty then
          cTotalConsumo.Text := FloattoStr(QAux.FieldByName('TOTAL_CS').AsFloat)
        else
          cTotalConsumo.Text:='0';

      finally
             QAux.Close;
             FreeAndNil(QAux);
      end
end;

//--------------------------- AL DAR DOBLE CLIK EN UNA LINEA - MODIFICAMOS ------
procedure TConsumos.GridLineasDblClick(Sender: TObject);
begin
     PanelClaves.Enabled:=False;
     PanelDatos.Enabled:=False;
     PanelEntrada.Visible:=True;

     cLecturaActual.SetFocus;
     QMaestro.Edit;

     //Actualizamos precio
     QMaestro.FieldByName('precio_cs').AsFloat:= ObtenerPrecio();

     //Botones
     BAceptar.Enabled:=True;
     BCancelar.Enabled:=True;
     BBusqueda.Enabled:=False;
     BAlta.Enabled:=False;
     BBorrar.Enabled:=False;
     BSalir.Enabled:=False;
     BPrimero.Enabled:=False;
     BSiguiente.Enabled:=False;
     BAnterior.Enabled:=False;
     BUltimo.Enabled:=False;
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TConsumos.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresa.Text:=CodEmpresa;
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TConsumos.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if Key=VK_F2 then
       cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TConsumos.cLupaClientesClick(Sender: TObject);
Var
   CodCliente: String;
begin
     if cEmpresa.Text<>'' then
     begin
          CodCliente:=LupaClientes(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
          if CodCliente<>'' then
             cCliente.Text:=CodCliente;
     end
     else
     begin
          MessageDlg (Chr(13) + 'Seleccione antes la empresa', mtError,[mbOk],0);
          cEmpresa.SetFocus;
     end;
end;

//-------------------------- LUPA (F2) DE CLIENTES -----------------------------
procedure TConsumos.cClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if Key=VK_F2 then
       cLupaClientesClick(Self);
end;

//-------------------------- LUPA (F2) DE CONCEPTOS ---------------------------------
procedure TConsumos.cLupaConceptosClick(Sender: TObject);
Var
   Concepto: String;
begin
     if not cConcepto.Properties.ReadOnly then
     begin
          Concepto:=LupaConceptos(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
          if Concepto<>'' then
               QMaestro.FieldByName('concepto_cs').AsString:=Concepto;
          cConcepto.SetFocus;     
     end;
end;

//----------------------- AL SALIR DEL CONCEPTO --------------------------------
procedure TConsumos.cConceptoExit(Sender: TObject);
begin
     //Rellenamos con ceros si estamos insertando o modificando
     if QMaestro.State in dsEditModes then
        if Length(TcxDBTextEdit(Sender).Text)>0 then
           QMaestro.FieldByName('CONCEPTO_CS').AsString:=RellenarCeros(TcxDBTextEdit(Sender).Text,TcxDBTextEdit(Sender).Properties.MaxLength,'I');
end;

procedure TConsumos.cConceptoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaConceptosClick(Self);
end;

procedure TConsumos.FormActivate(Sender: TObject);
begin
     if PanelClaves.Enabled then
        cCliente.SetFocus;
end;

end.








