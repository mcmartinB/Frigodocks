unit FArticulos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ActnMan, ActnCtrls, ExtCtrls, StdCtrls, ComCtrls, DB,
  DBTables, Mask, DBCtrls,
  Buttons, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlue, Menus, cxButtons, SimpleSearch,
  cxTextEdit, cxDBEdit, dxSkinsdxBarPainter, dxBar, cxClasses, cxCurrencyEdit;

type
  TArticulos = class(TForm)
    BarraEstado: TStatusBar;
    Timer1: TTimer;
    QMaestro: TQuery;
    DSMaestro: TDataSource;
    PanelDatos: TPanel;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    QContar: TQuery;
    cUnidadMedida: TcxDBTextEdit;
    StaticText2: TStaticText;
    cDenominacion: TcxDBTextEdit;
    QMaestroempresa_a: TStringField;
    QMaestrofamilia_a: TStringField;
    QMaestrocodigo_a: TStringField;
    QMaestrodenominacion_a: TStringField;
    QMaestrounidad_medida_a: TStringField;
    QMaestrovalor_por_kg_a: TFloatField;
    cLupaUnidades: TSimpleSearch;
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
    cCodigo: TEdit;
    StaticText12: TStaticText;
    cEmpresa: TEdit;
    tNomEmpresa: TPanel;
    StaticText13: TStaticText;
    tNomFamilia: TPanel;
    cFamilia: TEdit;
    cLupaEmpresas: TSimpleSearch;
    cLupaFamilias: TSimpleSearch;
    Panel1: TPanel;
    tNomUnidad: TPanel;
    cValorKg: TcxDBCurrencyEdit;
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
    procedure cFamiliaChange(Sender: TObject);
    procedure cUnidadMedidaChange(Sender: TObject);
    procedure QMaestroBeforeEdit(DataSet: TDataSet);
    procedure QMaestroAfterPost(DataSet: TDataSet);
    procedure cLupaEmpresasClick(Sender: TObject);
    procedure cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaFamiliasClick(Sender: TObject);
    procedure cFamiliaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaUnidadesClick(Sender: TObject);
    procedure cUnidadMedidaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);

  private
    {Private declarations}
    SwAlta: Boolean;
    PosRegistro, NRegistros: Integer;
    AntiguoValorKg: Real;
    CerrarVentana: Boolean;

    procedure Mensaje(Texto: String );
    procedure BotonesPosicion;
    function  ValidarCabecera():Boolean;
    function  ValidarDetalles():Boolean;
    function  EjecutaQuery(Empresa, Familia, Codigo: String):Boolean;
    function  EjecutaQueryBus(WhereBus: String):Boolean;
    procedure QuitarColorAlta();
    procedure PonerColorAlta();
    procedure ActualizarClientes(Empresa, Familia, Articulo: String; ValorKg: Real);
  public
    { Public declarations }
  end;

var
   Articulos: TArticulos;

implementation

uses UGLobal, MBaseDatos, DM, BTarifas, BArticulos;

{$R *.dfm}

//------------------------ CREACION DEL FORMULARIO -----------------------------
procedure TArticulos.FormCreate(Sender: TObject);
begin
     Top:=1;
     Left:=0;

     SwAlta:=False;
     PosRegistro:=0;
     NRegistros:=0;
     CerrarVentana:=True;  //Para controlar que no se cierre la ventana

     cEmpresa.Text:=EmpresaGlobal;
     
     QMaestro.AfterScroll:=AlMoverRegistro;
end;

//------------------------ CIERRE DEL FORMULARIO -------------------------------
procedure TArticulos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if CerrarVentana then
        Action:=caFree;
end;

//----------------------- CIERRRE DEL QUERY DEL FORMULARIO ---------------------
procedure TArticulos.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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
procedure TArticulos.Mensaje(Texto: String );
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
procedure TArticulos.Timer1Timer(Sender: TObject);
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
procedure TArticulos.BotonesPosicion;
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
procedure TArticulos.Alta(Sender: TObject);
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
     cFamilia.Text:='';
     cCodigo.Text:='';
     cFamilia.SetFocus;

     cLupaUnidades.Enabled:=False;

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
procedure TArticulos.Borrar(Sender: TObject);
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
                  cFamilia.SetFocus;
                  cLupaUnidades.Enabled:=False;
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
procedure TArticulos.Primero(Sender: TObject);
begin
     PosRegistro:=1;          //Numero de registro en el que estamos
     QMaestro.First;
     BotonesPosicion();
end;

//-------------------------- REGISTRO ANTERIOR ---------------------------------
procedure TArticulos.Anterior(Sender: TObject);
begin
     if PosRegistro>1 then
        Dec(PosRegistro);        //Numero de registro en el que estamos
     QMaestro.Prior;
     BotonesPosicion();
end;

//-------------------------- REGISTRO SIGUIENTE --------------------------------
procedure TArticulos.Siguiente(Sender: TObject);
begin
     if PosRegistro<NRegistros then
        Inc(PosRegistro);       //Numero de registro en el que estamos
     QMaestro.Next;
     BotonesPosicion();
end;

//-------------------------- ULTIMO REGISTRO -----------------------------------
procedure TArticulos.Ultimo(Sender: TObject);
begin
     PosRegistro:=NRegistros; //Numero de registro en el que estamos
     QMaestro.Last;
     BotonesPosicion();
end;

//----------------------------- BUSQUEDA ---------------------------------------
procedure TArticulos.Busqueda(Sender: TObject);
Var
   Aux: TBusquedaArticulos;
begin
     try
        Aux:=TBusquedaArticulos.Create(Self);
        with Aux do
        begin
             AceptarTodos:=True;
             EmpresaParam:=cEmpresa.Text;
             ShowModal;
             if (CodigoBus<>'') and (EmpresaBus<>'') then   //Seleccionamos un registro del grid resultado
             begin
                  if EjecutaQuery(EmpresaBus, FamiliaBus, CodigoBus) then
                  begin
                       Self.PanelClaves.Enabled:=False;
                       cLupaUnidades.Enabled:=True;
                  end
                  else  //Si no hay registros que mostrar
                  begin
                       Self.PanelClaves.Enabled:=True;
                       cLupaUnidades.Enabled:=False;
                       cEmpresa.Text:=EmpresaGlobal;
                       cCodigo.Text:='';
                       cFamilia.SetFocus;
                       Mensaje('Registro no existe');
                  end;
             end
             else if ModalResult=mrOk then  //Aceptamos desde el boton ACEPTAR (Devolvemos todos los registros del filtro)
             begin
                  if EjecutaQueryBus(WhereBus) then
                  begin
                       Self.PanelClaves.Enabled:=False;
                       cLupaUnidades.Enabled:=True;
                  end
                  else  //Si no hay registros que mostrar
                  begin
                       Self.PanelClaves.Enabled:=True;
                       cLupaUnidades.Enabled:=False;
                       cEmpresa.Text:=EmpresaGlobal;
                       cCodigo.Text:='';
                       cFamilia.SetFocus;
                       Mensaje('Registro no existe');
                 end;
            end
        end;
     finally
            FreeAndNil(Aux);
     end;
end;

//------------------------ BOTON ACEPTAR ----------------------------------------
procedure TArticulos.Aceptar(Sender: TObject);
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

                       EjecutaQuery(cEmpresa.Text, cFamilia.Text, cCodigo.Text);     //Refrescamos el Query

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
                               Panel1.Visible:=False;
                               CerrarVentana:=True;
                               if DMBaseDatos.BDFrigo.InTransaction then
                                  QMaestro.Database.Rollback;
                          end;
               end;
          end;
          BotonesPosicion();
     end;
end;

//--------------------- BOTON CANCELAR -----------------------------------------
procedure TArticulos.Cancelar(Sender: TObject);
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
      cLupaUnidades.Enabled:=False;
      SwAlta:=False;

      QuitarColorAlta();

      cEmpresa.Text:=EmpresaGlobal;
      cFamilia.Text:='';
      cCodigo.Text:='';
      cFamilia.SetFocus;

      PosRegistro:=0;
      NRegistros:=0;

      Mensaje('Cambios Ignorados');

      BotonesPosicion();
end;

//----------------------------- SALIR ------------------------------------------
procedure TArticulos.Salir(Sender: TObject);
begin
     Close;
end;

//-------------------------- VALIDACION DE DATOS CABECERA ----------------------
function TArticulos.ValidarCabecera():Boolean;
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
     else if cFamilia.Text='' then
     begin
          Result:=False;
          Mensaje('Falta la familia');
          cFamilia.SetFocus;
     end
     else if tNomFamilia.Caption='' then
     begin
          Result:=False;
          Mensaje('La familia no existe');
          cFamilia.SetFocus;
     end
     else if cCodigo.Text='' then
     begin
          Result:=False;
          Mensaje('Falta el código');
          cCodigo.SetFocus;
     end;
end;

//-------------------------- VALIDACION DE DATOS DETALLES-----------------------
function TArticulos.ValidarDetalles():Boolean;
begin
     Result:=True;
     if cDenominacion.Text='' then
     begin
          Result:=False;
          Mensaje('Falta el nombre del artículo');
          cDenominacion.SetFocus;
     end
     else if cUnidadMedida.Text='' then
     begin
          Result:=False;
          Mensaje('Falta la unidad de medida');
          cUnidadMedida.SetFocus;
     end
     else if (cValorKg.Text='') then
     begin
          Result:=False;
          Mensaje('Falta el valor por kilo');
          cValorKg.SetFocus;
     end;
end;

//------------------- FOCO EN EL PANEL DE DATOS --------------------------------
procedure TArticulos.PanelDatosEnter(Sender: TObject);
begin
     if QMaestro.IsEmpty then
     begin
          if ValidarCabecera() then
          begin
               if not SwAlta then  //Si no es alta
               begin
                    if not EjecutaQuery(cEmpresa.Text, cFamilia.Text, cCodigo.Text) then   //Si no hay datos
                    begin
                         cLupaUnidades.Enabled:=False;
                         cFamilia.SetFocus;
                         Mensaje('El registro no existe');
                    end
                    else  //Si hay datos
                    begin
                         PanelClaves.Enabled:=False;
                         cLupaUnidades.Enabled:=True;
                    end;
               end
               else
               begin
                    //No existe -> Hacemos el alta
                    if not EjecutaQuery(cempresa.Text, cFamilia.Text, cCodigo.Text) then   //Si no hay datos
                    begin
                         PanelClaves.Enabled:=False;
                         cLupaUnidades.Enabled:=True;
                         cDenominacion.SetFocus;
                         QMaestro.append;
                         Mensaje('Alta de registro');
                         BAceptar.Enabled:=True;
                    end
                    else  //El registro ya existe
                    begin
                         Mensaje('El registro ya existe');
                         QMaestro.Close;
                         BarraEstado.Panels[1].Text:='';
                         cLupaUnidades.Enabled:=False;
                         cFamilia.SetFocus;
                    end;
               end;
           end;
     end;
end;

//------------------------ APERTURA DE LA QUERY PRINCIPAL ----------------------
function TArticulos.EjecutaQuery(Empresa, Familia, Codigo: String):Boolean;
begin
     Result:=False;
     NRegistros:=0;
     PosRegistro:=0;
     try
        QMaestro.Close;
        QMaestro.SQL.Clear;
        QMaestro.SQL.Add(' SELECT * FROM ARTICULOS ' +
                         ' WHERE EMPRESA_A=' + QuotedStr(Empresa) +
                         ' AND FAMILIA_A=' + QuotedStr(Familia) +
                         ' AND CODIGO_A=' + QuotedStr(Codigo) +
                         ' ORDER BY EMPRESA_A, FAMILIA_A, CODIGO_A');

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
                             ' FROM ARTICULOS ' +
                             ' WHERE EMPRESA_A=' + QuotedStr(Empresa) +
                             ' AND FAMILIA_A=' + QuotedStr(Familia) +
                             ' AND CODIGO_A=' + QuotedStr(Codigo));
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
function TArticulos.EjecutaQueryBus(WhereBus: String):Boolean;
begin
     Result:=False;
     NRegistros:=0;
     PosRegistro:=0;
     try
        QMaestro.Close;
        QMaestro.SQL.Clear;
        QMaestro.SQL.Add('SELECT * FROM ARTICULOS ' +
                         WhereBus +
                         ' ORDER BY EMPRESA_A, FAMILIA_A, CODIGO_A');
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
                     SQL.Add('SELECT COUNT(*) AS NREGISTROS FROM ARTICULOS ' + WhereBus);
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
procedure TArticulos.AlMoverRegistro(DataSet: TDataSet);
begin
     if SwAlta=False then  //El estado es de visualizacion
     begin
          cEmpresa.Text:=QMaestro.FieldByName('EMPRESA_A').AsString;  //No estan enganchados a BD y debemos asignarlos a mano
          cFamilia.Text:=QMaestro.FieldByName('FAMILIA_A').AsString;
          cCodigo.Text:=QMaestro.FieldByName('CODIGO_A').AsString;
     end;
end;

//--------------------- CAMBIO DE ESTADO DEL DATA SOURCE -----------------------
procedure TArticulos.DSMaestroStateChange(Sender: TObject);
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
procedure TArticulos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
procedure TArticulos.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TArticulos.QMaestroAfterInsert(DataSet: TDataSet);
begin
     QMaestro.FieldByName('EMPRESA_A').AsString:=cEmpresa.Text;
     QMaestro.FieldByName('FAMILIA_A').AsString:=cFamilia.Text;
     QMaestro.FieldByName('CODIGO_A').AsString:=cCodigo.Text;
end;

//---------------------- PONE EL COLOR DE FOCO DE LOS CAMPOS CLAVES ------------
procedure TArticulos.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          if not SwAlta then
             TEdit(Sender).Color:=clMoneyGreen;
     end;
end;

//---------------------- QUITA EL COLOR DE FOCO DE LOS CAMPOS CLAVE ------------
procedure TArticulos.ColorExit(Sender: TObject);
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
procedure TArticulos.QuitarColorAlta();
begin
     cEmpresa.Color:=clWindow;
     cFamilia.Color:=clWindow;
     cCodigo.Color:=clWindow;
end;

//---------------------- PONE EL COLOR DE ALTA DE LOS CAMPOS CLAVE -------------
procedure TArticulos.PonerColorAlta();
begin
     cEmpresa.Color:=clYellow;
     cFamilia.Color:=clYellow;
     cCodigo.Color:=clYellow;
end;

//----------------------- CAMBIO DE LA EMPRESA ---------------------------------
procedure TArticulos.cEmpresaChange(Sender: TObject);
Var
   Empresa: String;
begin
     Empresa:=RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I');

     tNomEmpresa.Caption:=NomEmpresa(Empresa);
     tNomFamilia.Caption:=NomFamilia(Empresa, cFamilia.Text);
end;

//------------------------ CAMBIO DE LA FAMILIA --------------------------------
procedure TArticulos.cFamiliaChange(Sender: TObject);
begin
     tNomFamilia.Caption:=NomFamilia(cEmpresa.Text, RellenarCeros(cFamilia.Text,cFamilia.MaxLength,'I'));
end;

//------------------------ CAMBIO DE LA UNIDAD ---------------------------------
procedure TArticulos.cUnidadMedidaChange(Sender: TObject);
begin
     if QMaestro.State in dsEditModes then
        tNomUnidad.Caption:=NomUnidad(cEmpresa.Text, cUnidadMedida.Text)
     else
         tNomUnidad.Caption:=NomUnidad(Qmaestro.FieldByName('EMPRESA_A').AsString, Qmaestro.FieldByName('UNIDAD_MEDIDA_A').AsString);
end;

//-- ACTUALIZA EL VALOR DEL STOCK Y EL DE MERCANCIA RETENIDA DE TODOS LOS CLIENTES ---
procedure TArticulos.ActualizarClientes(Empresa, Familia, Articulo: String; ValorKg: Real);
Var
   ImporteTmp: Real;
   QAux, QAux2: TQuery;
begin
     QAux:=TQuery.Create(nil);
     try
        QAux2:=TQuery.Create(nil);
        try
           QAux2.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
           QAux2.SQL.Add(' UPDATE CLIENTES ' +
                         ' SET VALOR_STOCK_C=:Importe, ' +
                         ' MERCANCIA_RETENIDA_C=:MercanciaRetenida ' +
                         ' WHERE EMPRESA_C=' + QuotedStr(Empresa) +
                         ' AND CODIGO_C=:Cliente');
           QAux2.Prepare;

           QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
           QAux.SQL.Add(' SELECT EMPRESA_AL, CLIENTE_AL, VALOR_STOCK_C, IMP_PENDIENTE_PAGO_C, ' +
                        ' SUM(UNIDADES_ENTRADAS_AL-UNIDADES_SALIDAS_AL) AS UNIDADES ' +
                        ' FROM CLIENTES, ALMACENES ' +
                        ' WHERE EMPRESA_C=EMPRESA_AL ' +
                        ' AND CODIGO_C=CLIENTE_AL ' +
                        ' AND EMPRESA_AL=' +  QuotedStr(Empresa) +
                        ' AND FAMILIA_AL=' + QuotedStr(Familia) +
                        ' AND ARTICULO_AL=' + QuotedStr(Articulo) +
                        ' GROUP BY EMPRESA_AL, CLIENTE_AL, VALOR_STOCK_C, IMP_PENDIENTE_PAGO_C ' +
                        ' HAVING SUM(UNIDADES_ENTRADAS_AL-UNIDADES_SALIDAS_AL)>0');
           QAux.Open;
           While not QAux.Eof do
           begin
                if QAux.FieldByName('UNIDADES').AsInteger<>0 then
                begin
                     ImporteTmp:=Redondear(QAux.FieldByName('VALOR_STOCK_C').AsFloat + (QAux.FieldByName('UNIDADES').AsFloat * (ValorKg - AntiguoValorKg)),2);
                     QAux2.ParamByName('Cliente').AsString:=QAux.FieldByName('CLIENTE_AL').AsString;
                     if ImporteTmp <= QAux.FieldByName('IMP_PENDIENTE_PAGO_C').AsFloat then
                        QAux2.ParamByName('MercanciaRetenida').AsString:='S'
                     else
                         QAux2.ParamByName('MercanciaRetenida').AsString:='N';
                     QAux2.ParamByName('Importe').AsFloat:=ImporteTmp;
                     QAux2.ExecSql;
                end;
                QAux.Next;
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

//---------------------------- ANTES DE MODIFICAR ------------------------------
procedure TArticulos.QMaestroBeforeEdit(DataSet: TDataSet);
begin
     //Guardamos el valor anterior del Valor_Por_Kg
     AntiguoValorKg:=QMaestro.FieldByName('VALOR_POR_KG_A').AsFloat;
end;

//---------------------------- DESPUES DE GRABAR MODIFICACION ------------------
procedure TArticulos.QMaestroAfterPost(DataSet: TDataSet);
begin
     if (swAlta=False) then //Si estamos modificando
     begin
          //Si Modificamos el Valor_Por_Kg
          if AntiguoValorKg<>QMaestro.FieldByName('VALOR_POR_KG_A').AsFloat then
          begin
               Panel1.Visible:=True;
               Application.ProcessMessages;
               CerrarVentana:=False;

               //Actualizamos el Valor del Stock y la Mercancia Retenida de los Clientes
               ActualizarClientes(QMaestro.FieldByName('EMPRESA_A').AsString,
                                  QMaestro.FieldByName('FAMILIA_A').AsString,
                                  QMaestro.FieldByName('CODIGO_A').AsString,
                                  QMaestro.FieldByName('VALOR_POR_KG_A').AsFloat);
               Panel1.Visible:=False;
               CerrarVentana:=True;
          end;
     end;
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TArticulos.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresa.Text:=CodEmpresa;
     cEmpresa.Setfocus;
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TArticulos.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if Key=VK_F2 then
       cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE FAMILIAS-----------------------------------
procedure TArticulos.cLupaFamiliasClick(Sender: TObject);
Var
   Familia: String;
begin
     if cEmpresa.Text<>'' then
     begin
          Familia:=LupaFamilias(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
          if Familia<>'' then
             cFamilia.Text:=Familia;
          cFamilia.Setfocus;
     end        
     else
     begin
          MessageDlg (Chr(13) + 'Seleccione antes la empresa', mtError,[mbOk],0);
          cEmpresa.SetFocus;
     end;
end;

//-------------------------- LUPA (F2) DE FAMILIAS -----------------------------
procedure TArticulos.cFamiliaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaFamiliasClick(Self);
end;

//-------------------------- LUPA DE UNIDADES ----------------------------------
procedure TArticulos.cLupaUnidadesClick(Sender: TObject);
Var
   CodUnidad: String;
begin
     CodUnidad:=LupaUnidades(cEmpresa.Text);
     if not (QMaestro.State in dsEditModes) then
     begin
          if CodUnidad<>'' then
          begin
               QMaestro.Edit;
               QMaestro.FieldByName('unidad_medida_a').AsString:=CodUnidad;

          end;
     end
     else if CodUnidad<>'' then
             QMaestro.FieldByName('unidad_medida_a').AsString:=CodUnidad;
     cUnidadMedida.SetFocus;
end;

//-------------------------- LUPA (F2) DE UNIDADES -----------------------------
procedure TArticulos.cUnidadMedidaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaUnidadesClick(Self);
end;

procedure TArticulos.FormActivate(Sender: TObject);
begin
     if PanelClaves.Enabled then
        cFamilia.SetFocus;
end;

end.
