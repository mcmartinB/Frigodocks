unit FArticulosClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ActnMan, ActnCtrls, ExtCtrls, StdCtrls, ComCtrls, DB,
  DBTables, Mask, DBCtrls,
  Buttons, Grids, DBGrids, DBClient,
  Provider, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlue, Menus,
  cxButtons, SimpleSearch, cxTextEdit, cxDBEdit, dxSkinsdxBarPainter, dxBar,
  cxClasses ;

type
  TArticulosClientes = class(TForm)
    BarraEstado: TStatusBar;
    Timer1: TTimer;
    QMaestro: TQuery;
    DSMaestro: TDataSource;
    PanelDatos: TPanel;
    QContar: TQuery;
    QMaestroempresa_ac: TStringField;
    QMaestrocliente_ac: TStringField;
    QMaestroarticulo_ac: TStringField;
    QMaestroarti_cli_ac: TStringField;
    GridLineas: TDBGrid;
    PanelEntrada: TPanel;
    QArticulos: TQuery;
    DSArticulos: TDataSource;
    QMaestroNombreArticulo: TStringField;
    QMaestrofamilia_ac: TStringField;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    cArticulo: TcxDBTextEdit;
    cArticuloCli: TcxDBTextEdit;
    tNomArticulo: TPanel;
    StaticText2: TStaticText;
    cFamilia: TcxDBTextEdit;
    tNomFamilia: TPanel;
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
    StaticText1: TStaticText;
    cCliente: TEdit;
    StaticText12: TStaticText;
    cEmpresa: TEdit;
    tNomEmpresa: TPanel;
    tNomCliente: TPanel;
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
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Busqueda(Sender: TObject);
    procedure QMaestroAfterInsert(DataSet: TDataSet);
    procedure ColorEnter(Sender: TObject);
    procedure ColorExit(Sender: TObject);
    procedure cEmpresaChange(Sender: TObject);
    procedure cClienteChange(Sender: TObject);
    procedure cArticuloChange(Sender: TObject);
    procedure cFamiliaChange(Sender: TObject);
    procedure cFamiliaExit(Sender: TObject);
    procedure cArticuloExit(Sender: TObject);
    procedure cArticuloCliExit(Sender: TObject);
    procedure AlMoverRegistro(DataSet: TDataSet);
    procedure GridLineasDblClick(Sender: TObject);
    procedure cLupaEmpresasClick(Sender: TObject);
    procedure cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaClientesClick(Sender: TObject);
    procedure cClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaFamiliasClick(Sender: TObject);
    procedure cFamiliaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaArticulosClick(Sender: TObject);
    procedure cArticuloKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);

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
    function  EjecutaQueryBus(EmpresaBus, ClienteBus, FamiliaBus, ArticuloBus, ArticuloCliBus: String):Boolean; overload;
    function  EjecutaQueryBus(WhereBus: String):Boolean; overload;
    procedure QuitarColorAlta();
    procedure PonerColorAlta();
  public
    { Public declarations }
  end;

var
   ArticulosClientes: TArticulosClientes;

implementation

uses UGLobal, MBaseDatos, DM, FPrincipal, BArticulosCliente;

{$R *.dfm}

//------------------------ CREACION DEL FORMULARIO -----------------------------
procedure TArticulosClientes.FormCreate(Sender: TObject);
begin
     Top:=1;
     Left:=0;

     SwAlta:=False;
     PosRegistro:=0;
     NRegistros:=0;

     cEmpresa.Text:=EmpresaGlobal;

     QMaestro.AfterScroll:=AlMoverRegistro;

     QArticulos.Open;
end;

//-------------------- EVENTO SCROLL -------------------------------------------
procedure TArticulosClientes.AlMoverRegistro(DataSet: TDataSet);
begin
     if SwAlta=False then  //El estado es de visualizacion
     begin
          cEmpresa.Text:=QMaestro.FieldByName('EMPRESA_AC').AsString;
          cCliente.Text:=QMaestro.FieldByName('CLIENTE_AC').AsString;  //No estan enganchados a BD y debemos asignarlos a mano
     end;
end;

//------------------------ CIERRE DEL FORMULARIO -------------------------------
procedure TArticulosClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;

     QArticulos.Close;
end;

//----------------------- CIERRRE DEL QUERY DEL FORMULARIO ---------------------
procedure TArticulosClientes.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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
procedure TArticulosClientes.Mensaje(Texto: String );
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
procedure TArticulosClientes.Timer1Timer(Sender: TObject);
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
procedure TArticulosClientes.BotonesPosicion();
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
procedure TArticulosClientes.Alta(Sender: TObject);
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
          cFamilia.SetFocus;

          Mensaje('Alta de registro');
          BAceptar.Enabled:=True;
     end
     else  //No hemos localizado datos aun
     begin
          NRegistros:=0;
          PosRegistro:=0;

          PanelClaves.Enabled:=True;

          cEmpresa.Text:=EmpresaGlobal;
          cCliente.Text:='';
          cCliente.SetFocus;
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
procedure TArticulosClientes.Borrar(Sender: TObject);
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

//-------------------------- PRIMER REGISTRO ----------------------------------- OK
procedure TArticulosClientes.Primero(Sender: TObject);
begin
     PosRegistro:=1;          //Numero de registro en el que estamos
     QMaestro.First;
     BotonesPosicion();
end;

//-------------------------- REGISTRO ANTERIOR ---------------------------------  OK
procedure TArticulosClientes.Anterior(Sender: TObject);
begin
     if PosRegistro>1 then
        Dec(PosRegistro);        //Numero de registro en el que estamos
     QMaestro.Prior;
     BotonesPosicion();
end;

//-------------------------- REGISTRO SIGUIENTE --------------------------------  OK
procedure TArticulosClientes.Siguiente(Sender: TObject);
begin
     if PosRegistro<NRegistros then
        Inc(PosRegistro);       //Numero de registro en el que estamos
     QMaestro.Next;
     BotonesPosicion();
end;

//-------------------------- ULTIMO REGISTRO -----------------------------------  OK
procedure TArticulosClientes.Ultimo(Sender: TObject);
begin
     PosRegistro:=NRegistros; //Numero de registro en el que estamos
     QMaestro.Last;
     BotonesPosicion();
end;

//----------------------------- BUSQUEDA ---------------------------------------
procedure TArticulosClientes.Busqueda(Sender: TObject);
Var
   Aux: TBusquedaArticulosCliente;
begin
     try
        Aux:=TBusquedaArticulosCliente.Create(Self);
        with Aux do
        begin
             ShowModal;
             if (FamiliaBus<>'') or (ArticuloBus<>'') or (ArticuloCliBus<>'') then   //Seleccionamos un registro del grid resultado
             begin
                  if EjecutaQueryBus(EmpresaBus, ClienteBus, FamiliaBus, ArticuloBus, ArticuloCliBus) then
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
end;

//------------------------ BOTON ACEPTAR ----------------------------------------
procedure TArticulosClientes.Aceptar(Sender: TObject);
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
procedure TArticulosClientes.Cancelar(Sender: TObject);
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
                                cEmpresa.Text:=EmpresaGlobal;
                                cCliente.Text:='';
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

           cEmpresa.Text:=EmpresaGlobal;
           cCliente.Text:='';
           PosRegistro:=0;
           NRegistros:=0;
           cCliente.SetFocus;

           BotonesPosicion();
      end;
end;

//----------------------------- SALIR ------------------------------------------
procedure TArticulosClientes.Salir(Sender: TObject);
begin
     Close;
end;

//-------------------------- VALIDACION DE DATOS CABECERA ----------------------
function TArticulosClientes.ValidarCabecera():Boolean;
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
function TArticulosClientes.ValidarDetalles():Boolean;
begin
     if cFamilia.Text='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'Falta la familia', mtError,[mbOk],0);
          cFamilia.SetFocus;
     end
     else if tNomFamilia.Caption='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'La familia no existe', mtError,[mbOk],0);
          cFamilia.SetFocus;
     end
     else if cArticulo.Text='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'Falta el artículo', mtError,[mbOk],0);
          cArticulo.SetFocus;
     end
     else if tNomArticulo.Caption='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'El artículo no existe', mtError,[mbOk],0);
          cArticulo.SetFocus;
     end
     else if cArticuloCli.Text='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'Falta el artículo del cliente', mtError,[mbOk],0);
          cArticuloCli.SetFocus;
     end
     else
        Result:=ValidadRegistro();
end;

//------------------------ APERTURA DE LA QUERY PRINCIPAL ----------------------  OK
function TArticulosClientes.ValidadRegistro():Boolean;
Var
   QAux: TQuery;
begin
     Result:=True;
     try
        QAux:=TQuery.Create(nil);
        try
           With QAux do
           begin
                DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                SQL.Add(' SELECT * ' +
                        ' FROM ARTICULOS_CLIENTE ' +
                        ' WHERE EMPRESA_AC=' + QuotedStr(cEmpresa.Text) +
                        ' AND FAMILIA_AC=' + QuotedStr(cFamilia.Text) +
                        ' AND ARTICULO_AC=' + QuotedStr(cArticulo.Text));
                Open;
                if not IsEmpty() then
                begin
                     MessageDlg (Chr(13) + 'El articulo ya existe', mtError,[mbOk],0);
                     cFamilia.SetFocus;
                     Result:=False;
                     exit;
                end;
                Close;
                SQL.Clear;
                SQL.Add(' SELECT * ' +
                        ' FROM ARTICULOS_CLIENTE ' +
                        ' WHERE ARTI_CLI_AC=' + QuotedStr(cArticuloCli.Text));
                Open;
                if not IsEmpty() then
                begin
                     MessageDlg (Chr(13) + 'El artículo/cliente ya existe', mtError,[mbOk],0);
                     cArticuloCli.SetFocus;
                     Result:=False;
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
procedure TArticulosClientes.PanelDatosEnter(Sender: TObject);
begin
     if ValidarCabecera() then
     begin
          if not QMaestro.Active then  //Si no hay registros abiertos
          begin
               if not SwAlta then  //Si no es alta
               begin
                    if not EjecutaQuery(cEmpresa.Text, cCliente.Text) then   //Si no hay datos
                    begin
                         cCliente.SetFocus;
                         Mensaje('El registro no existe');
                    end
                    else  //Si hay datos
                        PanelClaves.Enabled:=False;
               end
               else
               begin
                    EjecutaQuery(cempresa.Text, cCliente.Text);

                    QMaestro.append;

                    PanelClaves.Enabled:=False;
                    PanelDatos.Enabled:=False;

                    PanelEntrada.Visible:=True;
                    cFamilia.SetFocus;

                    Mensaje('Alta de registro');
                    BAceptar.Enabled:=True;
               end;
         end;
     end;
end;

//------------------------ APERTURA DE LA QUERY PRINCIPAL ----------------------  OK
function TArticulosClientes.EjecutaQuery(Empresa, Cliente: String):Boolean;
begin
     Result:=False;
     NRegistros:=0;
     PosRegistro:=0;
     try
        QMaestro.Close;
        QMaestro.SQL.Clear;
        QMaestro.SQL.Add(' SELECT * FROM ARTICULOS_CLIENTE ' +
                         ' WHERE EMPRESA_AC=' + QuotedStr(Empresa) +
                         ' AND CLIENTE_AC=' + QuotedStr(Cliente) +
                         ' ORDER BY EMPRESA_AC, CLIENTE_AC, FAMILIA_AC, ARTICULO_AC');
        QMaestro.Open;
        if QMaestro.IsEmpty then
           Result:=False
        else
        begin
             QMaestro.First;
             try    //Contamos los Registros
                With QContar do
                begin
                     Close;
                     SQL.Clear;
                     SQL.Add(' SELECT COUNT(*) AS NREGISTROS ' +
                             ' FROM ARTICULOS_CLIENTE ' +
                             ' WHERE EMPRESA_AC=' + QuotedStr(Empresa) +
                             ' AND CLIENTE_AC=' + QuotedStr(Cliente));
                     Open;
                     NRegistros:=FieldByName('NRegistros').AsInteger;  //Contamos los registros
                     PosRegistro:=1;
                end;
             finally
                    QContar.Close;
             end;
             Result:=True;
        end;
        QMaestro.First;
        BotonesPosicion();
    except
          on E:Exception do
               CapturaErrores(E);
    end;
end;

//---------------- APERTURA DE LA QUERY PRINCIPAL DESDE LA BUSQUEDA-------------
function TArticulosClientes.EjecutaQueryBus(EmpresaBus, ClienteBus, FamiliaBus, ArticuloBus, ArticuloCliBus: String):Boolean;
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
        QMaestro.SQL.Add('SELECT * FROM ARTICULOS_CLIENTE ');
        if EmpresaBus<>'' then
        begin
             WhereBus:=' WHERE EMPRESA_AC=' + QuotedStr(EmpresaBus);
             HayWhere:=True;
        end;
        if ClienteBus<>'' then
        begin
             if HayWhere then
                WhereBus:=WhereBus + ' AND CLIENTE_AC=' + QuotedStr(ClienteBus)
             else
                 WhereBus:=' WHERE CLIENTE_AC=' + QuotedStr(ClienteBus);
        end;
        if FamiliaBus<>'' then
        begin
             if HayWhere then
                WhereBus:=WhereBus + ' AND FAMILIA_AC=' + QuotedStr(FamiliaBus)
             else
                 WhereBus:=' WHERE FAMILIA_AC=' + QuotedStr(FamiliaBus);
        end;
        if ArticuloBus<>'' then
        begin
             if HayWhere then
                WhereBus:=WhereBus + ' AND ARTICULO_AC=' + QuotedStr(ArticuloBus)
             else
                 WhereBus:=' WHERE ARTICULO_AC=' + QuotedStr(ArticuloBus);
        end;
        if ArticuloCliBus<>'' then
        begin
             if HayWhere then
                WhereBus:=WhereBus + ' AND ARTI_CLI_AC=' + QuotedStr(ArticuloCliBus)
             else
                 WhereBus:=' WHERE ARTI_CLI_AC=' + QuotedStr(ArticuloCliBus);
        end;
        QMaestro.SQL.Add(WhereBus + ' ORDER BY EMPRESA_AC, CLIENTE_AC');
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
                     SQL.Add('SELECT COUNT(*) AS NREGISTROS FROM ARTICULOS_CLIENTE ' + WhereBus);
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
function TArticulosClientes.EjecutaQueryBus(WhereBus: String):Boolean;
begin
     Result:=False;
     NRegistros:=0;
     PosRegistro:=0;
     try
        QMaestro.Close;
        QMaestro.SQL.Clear;
        QMaestro.SQL.Add('SELECT * FROM ARTICULOS_CLIENTE ' +
                         WhereBus +
                         ' ORDER BY EMPRESA_AC, CLIENTE_AC');
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
                     SQL.Add('SELECT COUNT(*) AS NREGISTROS FROM ARTICULOS_CLIENTE ' + WhereBus);
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

//--------------------- CAMBIO DE ESTADO DEL DATA SOURCE -----------------------
procedure TArticulosClientes.DSMaestroStateChange(Sender: TObject);
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
procedure TArticulosClientes.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
procedure TArticulosClientes.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TArticulosClientes.QMaestroAfterInsert(DataSet: TDataSet);
begin
     //Campos que no estan enlazados a BD
     QMaestro.FieldByName('EMPRESA_AC').AsString:=cEmpresa.Text;
     QMaestro.FieldByName('CLIENTE_AC').AsString:=cCliente.Text;
end;

//---------------------- PONE EL COLOR DE FOCO DE LOS CAMPOS CLAVES ------------
procedure TArticulosClientes.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          if not SwAlta then
             TEdit(Sender).Color:=clMoneyGreen;
     end;
end;

//---------------------- QUITA EL COLOR DE FOCO DE LOS CAMPOS CLAVE ------------
procedure TArticulosClientes.ColorExit(Sender: TObject);
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
procedure TArticulosClientes.QuitarColorAlta();
begin
     cEmpresa.Color:=clWindow;
     cCliente.Color:=clWindow;
end;

//---------------------- PONE EL COLOR DE ALTA DE LOS CAMPOS CLAVE -------------
procedure TArticulosClientes.PonerColorAlta();
begin
     cEmpresa.Color:=clYellow;
     cCliente.Color:=clYellow;
end;

//----------------------- CAMBIO DE LA EMPRESA ---------------------------------
procedure TArticulosClientes.cEmpresaChange(Sender: TObject);
begin
     tNomEmpresa.Caption:=NomEmpresa(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
end;

//----------------------- CAMBIO DEL CLIENTE -----------------------------------
procedure TArticulosClientes.cClienteChange(Sender: TObject);
begin
     tNomCliente.Caption:=NomCliente(cEmpresa.Text, RellenarCeros(cCliente.Text,cCliente.MaxLength,'I'));
end;

//----------------------- CAMBIO DEL ARTICULO ----------------------------------
procedure TArticulosClientes.cArticuloChange(Sender: TObject);
begin
     tNomArticulo.Caption:=NomArticulo(cEmpresa.Text, cFamilia.Text, cArticulo.Text);
end;

//----------------------- CAMBIO DE LA FAMILIA ---------------------------------
procedure TArticulosClientes.cFamiliaChange(Sender: TObject);
begin
     if QMaestro.State in dsEditModes then
     begin
          tNomFamilia.Caption:=NomFamilia(cEmpresa.Text, cFamilia.Text);
          tNomArticulo.Caption:=NomArticulo(cEmpresa.Text,
                                            cFamilia.Text,
                                            cArticulo.Text);
     end
     else
     begin
          tNomFamilia.Caption:=NomFamilia(QMaestro.FieldByName('Empresa_ac').AsString,
                                          QMaestro.FieldByName('Familia_ac').AsString);
          tNomArticulo.Caption:=NomArticulo(QMaestro.FieldByName('Empresa_ac').AsString,
                                            QMaestro.FieldByName('Familia_ac').AsString,
                                            QMaestro.FieldByName('Articulo_ac').AsString);
     end;
end;

//----------------------- AL SALIR DE LA FAMILIA -------------------------------
procedure TArticulosClientes.cFamiliaExit(Sender: TObject);
begin
     //Rellenamos con ceros si estamos insertando o modificando
     if QMaestro.State in dsEditModes then
        if Length(TcxDBTextEdit(Sender).Text)>0 then
           QMaestro.FieldByName('FAMILIA_AC').AsString:=RellenarCeros(TcxDBTextEdit(Sender).Text,TcxDBTextEdit(Sender).Properties.MaxLength,'I');
end;

//----------------------- AL SALIR DEL ARTICULO --------------------------------
procedure TArticulosClientes.cArticuloExit(Sender: TObject);
begin
     //Rellenamos con ceros si estamos insertando o modificando
     if QMaestro.State in dsEditModes then
        if Length(TcxDBTextEdit(Sender).Text)>0 then
           QMaestro.FieldByName('ARTICULO_AC').AsString:=RellenarCeros(TcxDBTextEdit(Sender).Text,TcxDBTextEdit(Sender).Properties.MaxLength,'I');
end;

//----------------------- AL SALIR DEL ARTICULO DEL CLIENTE --------------------
procedure TArticulosClientes.cArticuloCliExit(Sender: TObject);
begin
     //Rellenamos con ceros si estamos insertando o modificando
     if QMaestro.State in dsEditModes then
        if Length(TcxDBTextEdit(Sender).Text)>0 then
           QMaestro.FieldByName('arti_cli_ac').AsString:=RellenarCeros(TcxDBTextEdit(Sender).Text,TcxDBTextEdit(Sender).Properties.MaxLength,'I');
end;

//--------------------------- AL DAR DOBLE CLIK EN UNA LINEA - MODIFICAMOS ------
procedure TArticulosClientes.GridLineasDblClick(Sender: TObject);
begin
     PanelClaves.Enabled:=False;
     PanelDatos.Enabled:=False;
     PanelEntrada.Visible:=True;

     cFamilia.SetFocus;
     QMaestro.Edit;
     
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
procedure TArticulosClientes.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresa.Text:=CodEmpresa;
     cEmpresa.SetFocus;
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TArticulosClientes.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if Key=VK_F2 then
       cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TArticulosClientes.cLupaClientesClick(Sender: TObject);
Var
   CodCliente: String;
begin
     if cEmpresa.Text<>'' then
     begin
          CodCliente:=LupaClientes(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
          if CodCliente<>'' then
             cCliente.Text:=CodCliente;
          cCliente.Setfocus;
     end
     else
     begin
          MessageDlg (Chr(13) + 'Seleccione antes la empresa', mtError,[mbOk],0);
          cEmpresa.SetFocus;
     end;
end;

//-------------------------- LUPA (F2) DE CLIENTES -----------------------------
procedure TArticulosClientes.cClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if Key=VK_F2 then
       cLupaClientesClick(Self);
end;

//-------------------------- LUPA DE FAMILIAS ----------------------------------
procedure TArticulosClientes.cLupaFamiliasClick(Sender: TObject);
Var
   Familia: String;
begin
     Familia:=LupaFamilias(cEmpresa.Text);
     if not (QMaestro.State in dsEditModes) then
     begin
          if Familia<>'' then
          begin
               QMaestro.Edit;
               QMaestro.FieldByName('Familia_ac').AsString:=Familia;
          end;
     end
     else if Familia<>'' then
             QMaestro.FieldByName('Familia_ac').AsString:=Familia;
     cFamilia.SetFocus;
end;

//------------------------- LUPA (F2) DE FAMILIAS ------------------------------
procedure TArticulosClientes.cFamiliaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaFamiliasClick(Self);
end;

//-------------------------- LUPA DE ARTICULOS ---------------------------------
procedure TArticulosClientes.cLupaArticulosClick(Sender: TObject);
Var
   Articulo, Familia: String;
begin
     if (cFamilia.Text<>'') and (tNomFamilia.Caption<>'') then
     begin
          Familia:=RellenarCeros(cFamilia.Text,cFamilia.Properties.MaxLength,'I');
          Articulo:=LupaArticulos(cEmpresa.Text, Familia);
          if not (QMaestro.State in dsEditModes) then
          begin
               if Articulo<>'' then
               begin
                    QMaestro.Edit;
                    QMaestro.FieldByName('Articulo_ac').AsString:=Articulo;
               end;
          end
          else if Articulo<>'' then
                  QMaestro.FieldByName('Articulo_ac').AsString:=Articulo;
          cArticulo.Setfocus;
     end
     else
     begin
          MessageDlg (Chr(13) + 'Seleccione antes la familia', mtError,[mbOk],0);
          cFamilia.SetFocus;
     end;
end;

//-------------------------- LUPA (F2) DE ARTICULOS ----------------------------
procedure TArticulosClientes.cArticuloKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaArticulosClick(Self);
end;

procedure TArticulosClientes.FormActivate(Sender: TObject);
begin
     if PanelClaves.Enabled then
        cCliente.SetFocus;
end;

end.








