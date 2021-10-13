unit FConsumos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  dxSkinsCore, dxSkinBlue, dxSkinsdxBarPainter, dxBar, cxClasses, StdCtrls,
  cxButtons, SimpleSearch, ExtCtrls, Grids, DBGrids, DB, DBTables, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxDBEdit, cxCurrencyEdit, ComCtrls,
  cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TConsumos = class(TForm)
    PanelClaves: TPanel;
    StaticText12: TStaticText;
    cEmpresa: TEdit;
    tNomEmpresa: TPanel;
    cLupaEmpresas: TSimpleSearch;
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
    bImprimir: TdxBarLargeButton;
    bAlta: TdxBarLargeButton;
    bBorrar: TdxBarLargeButton;
    bAltaL: TdxBarLargeButton;
    bBorrarL: TdxBarLargeButton;
    bUltimoL: TdxBarLargeButton;
    bSiguienteL: TdxBarLargeButton;
    bPrimeroL: TdxBarLargeButton;
    bAnteriorL: TdxBarLargeButton;
    StaticText13: TStaticText;
    cCliente: TEdit;
    cLupaClientes: TSimpleSearch;
    tNomcliente: TPanel;
    StaticText1: TStaticText;
    cAnyoConsumo: TEdit;
    StaticText2: TStaticText;
    cMesConsumo: TEdit;
    PanelLineas: TPanel;
    GridLineas: TDBGrid;
    QMaestro: TQuery;
    DSMaestro: TDataSource;
    QLineas: TQuery;
    DSLineas: TDataSource;
    QMaestroempresa_cc: TStringField;
    QMaestrocliente_cc: TStringField;
    QMaestroanyo_cc: TIntegerField;
    QMaestromes_cc: TIntegerField;
    QMaestrostatus_factura_cc: TStringField;
    QMaestronumero_factura_cc: TIntegerField;
    strngfldQLineasempresa_lc: TStringField;
    strngfldQLineascliente_lc: TStringField;
    QLineasanyo_lc: TIntegerField;
    QLineasmes_lc: TIntegerField;
    QLineasconcepto_lc: TStringField;
    QLineaslectura_actual_lc: TIntegerField;
    QLineaslectura_anterior_lc: TIntegerField;
    QLineasconsumo_lc: TIntegerField;
    QLineasprecio_lc: TCurrencyField;
    QLineastotal_lc: TCurrencyField;
    BarraEstado: TStatusBar;
    Timer1: TTimer;
    PanelCabecera: TPanel;
    cFactura: TcxDBTextEdit;
    StaticText8: TStaticText;
    QContar: TQuery;
    QConceptos: TQuery;
    QLineasNombreConcepto: TStringField;
    QMaestrofecha_factura_cc: TStringField;
    PanelInsertarLinea: TPanel;
    StaticText14: TStaticText;
    cConcepto: TcxDBTextEdit;
    LupaConcepto: TSimpleSearch;
    tNomConcepto: TPanel;
    StaticText3: TStaticText;
    cLecturaActual: TcxDBCurrencyEdit;
    StaticText4: TStaticText;
    cLecturaAnterior: TcxDBCurrencyEdit;
    StaticText5: TStaticText;
    cConsumo: TcxDBCurrencyEdit;
    StaticText6: TStaticText;
    cPrecio: TcxDBCurrencyEdit;
    StaticText7: TStaticText;
    cTotal: TcxDBCurrencyEdit;
    StaticText9: TStaticText;
    cFechaFactura: TcxDBDateEdit;
    Panel1: TPanel;
    StaticText10: TStaticText;
    cTotalConsumo: TcxCurrencyEdit;
    cxCurrencyEdit1: TcxCurrencyEdit;
    procedure cLupaEmpresasClick(Sender: TObject);
    procedure cEmpresaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cEmpresaChange(Sender: TObject);
    procedure ColorEnter(Sender: TObject);
    procedure ColorExit(Sender: TObject);
    procedure cLupaClientesClick(Sender: TObject);
    procedure cClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cClienteChange(Sender: TObject);
    procedure LupaConceptoClick(Sender: TObject);
    procedure cConceptoEnter(Sender: TObject);
    procedure cConceptoExit(Sender: TObject);
    procedure cConceptoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cConceptoPropertiesChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bAltaClick(Sender: TObject);
    procedure PanelClavesExit(Sender: TObject);
    procedure Borrar(Sender: TObject);
    procedure Primero(Sender: TObject);
    procedure Anterior(Sender: TObject);
    procedure Siguiente(Sender: TObject);
    procedure Ultimo(Sender: TObject);
    procedure bImprimirClick(Sender: TObject);
    procedure Busqueda(Sender: TObject);
    procedure bAltaLinea(Sender: TObject);
    procedure bBorrarLinea(Sender: TObject);
    procedure bPrimeroLClick(Sender: TObject);
    procedure bAnteriorLClick(Sender: TObject);
    procedure bSiguienteLClick(Sender: TObject);
    procedure bUltimoLClick(Sender: TObject);
    procedure Aceptar(Sender: TObject);
    procedure QMaestroBeforeEdit(DataSet: TDataSet);
    procedure QMaestroAfterEdit(DataSet: TDataSet);
    procedure QMaestroAfterInsert(DataSet: TDataSet);
    procedure QMaestroAfterOpen(DataSet: TDataSet);
    procedure QMaestroBeforeClose(DataSet: TDataSet);
    procedure QMaestroBeforePost(DataSet: TDataSet);
    procedure SinSignos(Sender: TObject; var Key: Char);
    procedure cPrecioEnter(Sender: TObject);
    procedure cPrecioExit(Sender: TObject);
    procedure Cancelar(Sender: TObject);
    procedure Salir(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

    procedure DSMaestroDataChange(Sender: TObject; Field: TField);
    procedure DSMaestroStateChange(Sender: TObject);
    procedure AlMoverRegistro(DataSet: TDataSet);

    procedure QLineasCalcFields(DataSet: TDataSet);
    procedure QLineasBeforeEdit(DataSet: TDataSet);
    procedure QLineasBeforeInsert(DataSet: TDataSet);
    procedure GridLineasDblClick(Sender: TObject);
    procedure cMesConsumoExit(Sender: TObject);
    procedure Calculo(Sender: TObject);
    procedure CalculoTotalConsumo;
    procedure PanelLineasEnter(Sender: TObject);
    procedure QLineasAfterScroll(DataSet: TDataSet);

  private
    { Private declarations }
    bFreeEdit: Boolean;
    SwAlta: Boolean;
    PosRegistro, NRegistros: Integer;
    SQLWhere, EmpresaAnt, ClienteAnt: String;
    AnyoAnt, MesAnt: integer;
    sEmpresa, sCliente: string;
    sAnyo, SMes: Integer;

    LConceptoAnt: String;
    LLecturaActualAnt, LLecturaAnteriorAnt, LConsumoAnt, LPrecioAnt, LTotalAnt: Integer;


    procedure Mensaje( Texto: String );
    procedure BotonesPosicion;

    function  ValidarClaves():Boolean;
    function  ValidarCabecera():Boolean;
    function  ValidarLinea():Boolean;

    function  ComprobarConsumos(): Boolean;
    procedure EliminarConsumo();

    function  EjecutaQuery(Empresa, Cliente: String; Anyo, Mes: Integer):Boolean;
    function  EjecutaQueryMas():Boolean;
    function  EjecutaQueryBus(WhereBus: String):Boolean;

    procedure QuitarColorAlta();
    procedure PonerColorAlta();

    function ObtenerPrecio(): Currency;
    function ObtenerUltimaLectura(): Currency;

    function ExisteConcepto(): boolean;

  public
    { Public declarations }
  end;

var
  Consumos: TConsumos;

implementation

uses UGLobal, MBaseDatos, BConsumos;

{$R *.dfm}

procedure TConsumos.Aceptar(Sender: TObject);
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
                     EjecutaQuery(cEmpresa.Text, cCliente.Text, StrToInt(cAnyoConsumo.Text), StrToInt(cMesConsumo.Text));

                     PosRegistro:=1;
                     NRegistros:=1;

                     //Finalizacion de la grabacion
                     Mensaje('Registro Grabado');

                     swAlta:=False;
                     QuitarColorAlta();

                     //Insertamos Lineas
                     bAltaLinea(Self);
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

         CalculoTotalConsumo;    //Muestra total de consumos
         cPrecio.OnExit:=Nil;

         //Si el campo esta vacio se pone a CERO
         if cLecturaActual.Text='' then
            QLineas.FieldByName('lectura_actual_lc').AsInteger:=0;
         if cLecturaAnterior.Text='' then
            QLineas.FieldByName('lectura_anterior_lc').AsInteger:=0;
         if cConsumo.Text='' then
            QLineas.FieldByName('consumo_lc').AsInteger:=0;
         if cPrecio.Text='' then
            QLineas.FieldByName('precio_lc').AsInteger:=0;
         if cTotal.Text='' then
            QLineas.FieldByName('total_lc').AsInteger:=0;

         if ValidarLinea() then   //Comprobamos que los datos de la linea son correctos
         begin
              try
                 if not DMBaseDatos.BDFrigo.InTransaction then
                    DMBaseDatos.BDFrigo.StartTransaction;
                 if QLineas.State=dsInsert then      //INSERTAR LINEA
                 begin
                      QLineas.Post;
                      if QMaestro.Database.InTransaction then
                         DMBaseDatos.BDFrigo.Commit;

                      //Para actualizar el Grid
                      QLineas.Close;
                      QLineas.Open;

                      //----------------- NUEVA ALTA --------------------------------
                      QLineas.Insert;

                      cPrecio.OnExit:=Nil;
                      cConcepto.SetFocus;
                      cPrecio.OnExit:=cPrecioExit;

                      //------------------------ DATOS DE LA LINEA POR DEFECTO ------
                      QLineas.FieldByName('Empresa_lc').AsString:=QMaestro.FieldByName('Empresa_cc').AsString;
                      QLineas.FieldByName('Cliente_lc').AsString:=QMaestro.FieldByName('Cliente_cc').AsString;
                      QLineas.FieldByName('Anyo_lc').AsInteger:=QMaestro.FieldByName('Anyo_cc').AsInteger;
                      QLineas.FieldByName('Mes_lc').AsInteger:=QMaestro.FieldByName('Mes_cc').AsInteger;

                      //Valores por defecto
                      QLineas.FieldByName('precio_lc').AsFloat:= ObtenerPrecio();     //CARMEN!!
                      //------------------------ DATOS DE LA LINEA POR DEFECTO ------
                 end
                 else  //MODIFICAR LINEA
                 begin
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
              cPrecio.OnExit:=cPrecioExit;
         end;
    end;
    BotonesPosicion();
end;

//-------------------- EVENTO SCROLL -------------------------------------------
procedure TConsumos.AlMoverRegistro(DataSet: TDataSet);
begin
     if SwAlta=False then  //El estado es de visualizacion
     begin
          cEmpresa.Text:=QMaestro.FieldByName('EMPRESA_CC').AsString;  //No estan enganchados a BD y debemos asignarlos a mano
          cCliente.Text:=QMaestro.FieldByName('CLIENTE_CC').AsString;
          cAnyoConsumo.Text:=QMaestro.FieldByName('ANYO_CC').AsString;
          cMesConsumo.Text:=QMaestro.FieldByName('MES_CC').AsString;
     end;
end;


procedure TConsumos.Anterior(Sender: TObject);
begin
     if PosRegistro>1 then
        Dec(PosRegistro);        //Numero de registro en el que estamos
     QMaestro.Prior;
     BotonesPosicion();
end;

procedure TConsumos.bAltaClick(Sender: TObject);
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
     PanelLineas.Enabled:=True;
     PanelInsertarLinea.Visible:=False;

     cEmpresa.Text:=EmpresaGlobal;
     cCliente.Text:='';
     cAnyoConsumo.Text:='';
     cMesConsumo.Text:='';
     cCliente.SetFocus;

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
end;

procedure TConsumos.bAltaLinea(Sender: TObject);
begin
     if not (QMaestro.State in [dsEdit,dsInsert]) then   //Cabecera
     begin
          if QMaestro.FieldByName('Fecha_Factura_cc').AsString<>'' then
             MessageDlg (Chr(13) + 'No puede modificar consumos eléctricos ya facturados', mtError,[mbOk],0)
          else
          begin
               QLineas.Insert;

               PanelInsertarLinea.Visible:=True;

               cConcepto.Enabled:=True;
               cLecturaActual.Enabled:=True;
               cLecturaAnterior.Enabled:=True;

               //------------------------ DATOS DE LA LINEA POR DEFECTO -------------
               QLineas.FieldByName('Empresa_lc').AsString:=QMaestro.FieldByName('Empresa_cc').AsString;
               QLineas.FieldByName('Cliente_lc').AsString:=QMaestro.FieldByName('Cliente_cc').AsString;
               QLineas.FieldByName('anyo_lc').AsInteger:=QMaestro.FieldByName('anyo_cc').AsInteger;
               QLineas.FieldByName('mes_lc').AsInteger:=QMaestro.FieldByName('mes_cc').AsInteger;

               //Valores por defecto
               QLineas.FieldByName('precio_lc').AsFloat:= ObtenerPrecio();     //CARMEN!!

               //------------------------ DATOS DE LA LINEA POR DEFECTO -------------

               cConcepto.SetFocus;

               PanelClaves.Enabled:=False;
               PanelCabecera.Enabled:=False;
               PanelLineas.Enabled:=False;

               BotonesPosicion();
          end;
     end;
end;

procedure TConsumos.bAnteriorLClick(Sender: TObject);
begin
     QLineas.Prior;
end;

procedure TConsumos.bBorrarLinea(Sender: TObject);
begin
     if not QLineas.IsEmpty then  //Existen líneas
     begin
          //Un albaran facturado no puede modificarse
          if QMaestro.FieldByName('Fecha_Factura_cc').AsString<>'' then
             MessageDlg (Chr(13) + 'No puede modificar consumos eléctricos ya facturados', mtError,[mbOk],0)
          else
          begin
               try
                   //Borramos la linea
                   if MessageBox(Handle, PChar('Va a borrarse la linea ¿Está seguro?'),
                                 PChar(Self.Caption),
                                 MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1)=IDYES then
                   begin
                        if not QLineas.Database.InTransaction then
                           QLineas.Database.StartTransaction;
                        QLineas.Delete;
                        if QLineas.Database.InTransaction then
                           QLineas.Database.Commit;

                        if QLineas.IsEmpty then  //No existen lineas
                        begin
                             //Si el consumo no tiene lineas preguntamos si lo borramos
                             if QLineas.IsEmpty then
                             begin
                                  if MessageBox(Handle, PChar('Cabecera de Consumo sin líneas.' + chr(13) + '¿Desea eliminarlo?'),
                                                PChar(Self.Caption),
                                                MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1)=IDYES then
                                     EliminarConsumo();
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
          end;
     end;
end;

procedure TConsumos.bImprimirClick(Sender: TObject);
begin
{
     ImprimirAlbaran(QMaestro.FieldByName('Empresa_ce').AsString,
                     QMaestro.FieldByName('Cliente_ce').AsString,
                     QMaestro.FieldByName('ref_cliente_ce').AsString,
                     QMaestro.FieldByName('Albaran_ce').AsInteger,
                     DiaMesAnyo(QMaestro.FieldByName('Fecha_Albaran_ce').AsString));
}
end;

procedure TConsumos.Borrar(Sender: TObject);
begin
     if QMaestro.FieldByName('Fecha_Factura_cc').AsString<>'' then
        MessageDlg (Chr(13) + 'No puede borrar un consumo ya facturado', mtError,[mbOk],0)
     else
     begin
          if MessageBox(Handle, PChar('Va a borrarse el Consumo ¿Está seguro?'),
                        PChar(Self.Caption),
                        MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1)=IDYES then
             EliminarConsumo();
     end;
end;


procedure TConsumos.cClienteChange(Sender: TObject);
begin
     tNomCliente.Caption:=NomCliente(cEmpresa.Text, RellenarCeros(cCliente.Text,cCliente.MaxLength,'I'));
end;

procedure TConsumos.cClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaClientesClick(Self);
end;

procedure TConsumos.cConceptoEnter(Sender: TObject);
begin
     //Asignamos el evento de cambio para mostrar la descripcion
     cConcepto.Properties.OnChange:=cConceptoPropertiesChange;
end;

procedure TConsumos.cConceptoExit(Sender: TObject);
begin
     if QLineas.State in dsEditModes then
        if cConcepto.Text<>'' then
           QLineas.FieldByName('concepto_lc').AsString:=RellenarCeros(cConcepto.Text,cConcepto.Properties.MaxLength,'I');

     //Desasignamos el evento de cambio para mostrar la descripcion
     cConcepto.Properties.OnChange:=Nil;
end;

procedure TConsumos.cConceptoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_F2 then
        LupaConceptoClick(Self);
end;

procedure TConsumos.cConceptoPropertiesChange(Sender: TObject);
begin
     tNomConcepto.Caption:=NomConcepto(cEmpresa.Text, RellenarCeros(cConcepto.Text,cConcepto.Properties.MaxLength,'I'));
     if QLineas.State in dsEditModes then
     begin
       QLineas.FieldByName('lectura_anterior_lc').AsFloat := ObtenerUltimaLectura();
       QLineas.FieldByName('consumo_lc').AsFloat:= 0;
     end
end;

procedure TConsumos.cEmpresaChange(Sender: TObject);
begin
     tNomEmpresa.Caption:=NomEmpresa(RellenarCeros(cEmpresa.Text, cEmpresa.MaxLength, 'I'));
end;

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

procedure TConsumos.FormActivate(Sender: TObject);
begin
     if PanelClaves.Enabled then
        cCliente.SetFocus;
end;

procedure TConsumos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QConceptos.Close;
     QContar.Close;
     QMaestro.Close;
     QLineas.Close;

     Action:=caFree;
end;

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

procedure TConsumos.FormCreate(Sender: TObject);
begin
     Top:=1;
     Left:=0;

     SwAlta:=False;
     PosRegistro:=0;
     NRegistros:=0;

     cEmpresa.Text:=EmpresaGlobal;
     
     QMaestro.AfterScroll:=AlMoverRegistro;

     QConceptos.Open;

     //------------------ Preparamos la tabla de artículos ---------------------
     QConceptos.Close;
     QConceptos.SQL.Clear;
     QConceptos.SQL.Add(' SELECT EMPRESA_C, CODIGO_C, DESCRIPCION_C FROM CONCEPTOS ' +
                        ' WHERE EMPRESA_C=:Empresa ' +
                        ' AND CODIGO_C=:Codigo '  );
     QConceptos.Prepare;
end;

procedure TConsumos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      if (Key=VK_F5) and BAceptar.Enabled then        //F5 graba
         Aceptar(Self)
      else if (Key=VK_F6) and BBusqueda.Enabled then  //F6 busqueda experta
               Busqueda(Self)
           else if (Key=40) and (not GridLineas.Focused) then                             //Flecha arriba
                   PostMessage(Handle,WM_NEXTDLGCTL,0,0)
                else if (Key=38) and (not GridLineas.Focused) then                        //Flecha abajo
                        PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

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

procedure TConsumos.GridLineasDblClick(Sender: TObject);
var
  bPuedoModificar: boolean;
begin
     if not (QMaestro.State in [dsEdit,dsInsert]) then   //Cabecera
     begin
       if QMaestro.FieldByName('Fecha_Factura_cc').AsString<>'' then
       Begin
         MessageDlg (Chr(13) + 'No puede modificar Consumos Eléctricos ya facturados.', mtError,[mbOk],0);
         bPuedoModificar:= False;
       end
       else
       begin
         bPuedoModificar:= True;
       end;

          if bPuedoModificar then
          begin
               PanelInsertarLinea.Visible:=True;

               cConcepto.Properties.ReadOnly:=False;

               cConcepto.Style.Font.Color:=clBlack;

               cConcepto.SetFocus;;

               QLineas.Edit;

               //Para mostrar las descripcion de la familia y el articulo
               cConceptoPropertiesChange(self);

               PanelClaves.Enabled:=False;
               PanelCabecera.Enabled:=False;
               PanelLineas.Enabled:=False;

               BotonesPosicion();
          end;
     end;
end;

procedure TConsumos.LupaConceptoClick(Sender: TObject);
Var
   Concepto: String;
begin
     if not cConcepto.Properties.ReadOnly then
     begin
          Concepto:=LupaConceptos(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
          if Concepto<>'' then
               QLineas.FieldByName('concepto_lc').AsString:=Concepto;
     end;
end;

procedure TConsumos.cEmpresaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key=VK_F2 then
       cLupaEmpresasClick(Self);
end;

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

procedure TConsumos.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresa.Text:=CodEmpresa;
end;

procedure TConsumos.cMesConsumoExit(Sender: TObject);
begin

//    PanelClavesExit(Self);
end;

procedure TConsumos.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          if not SwAlta then
             TEdit(Sender).Color:=clMoneyGreen;
     end
     else if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          if not SwAlta then
             TEdit(Sender).Color:=clMoneyGreen;
     end;
end;

//---------------------- PONE EL COLOR DE ALTA DE LOS CAMPOS CLAVE -------------
procedure TConsumos.PanelClavesExit(Sender: TObject);
begin
     if QMaestro.IsEmpty then
     begin
          if ValidarClaves() then
          begin
               if not SwAlta then  //Si no es alta
               begin
                    if not EjecutaQuery(cEmpresa.Text, cCliente.Text, StrToInt(cAnyoConsumo.Text), StrToInt(cMesConsumo.Text)) then   //Si no hay datos
                    begin
                         cCliente.SetFocus;
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
                    if not EjecutaQuery(cEmpresa.Text, cCliente.Text, StrToInt(cAnyoConsumo.Text), StrToInt(cMesConsumo.Text)) then   //Si no hay datos
                    begin
                         PanelClaves.Enabled:=False;
                         PanelLineas.Enabled:=True;
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
                         cCliente.SetFocus;
                         cLupaClientes.Enabled:=False;
                    end;
               end;
           end;
     end;
end;

procedure TConsumos.PanelLineasEnter(Sender: TObject);
begin
  CalculoTotalConsumo;
end;

procedure TConsumos.Primero(Sender: TObject);
begin
     PosRegistro:=1;          //Numero de registro en el que estamos
     QMaestro.First;
     BotonesPosicion();
end;

procedure TConsumos.QLineasAfterScroll(DataSet: TDataSet);
begin
  CalculoTotalConsumo
end;

procedure TConsumos.QLineasBeforeEdit(DataSet: TDataSet);
begin
     //Guardamos los datos de la linea antes de modificarla
     LConceptoAnt:=QLineas.FieldByName('Concepto_lc').AsString;
     LLecturaActualAnt:=QLineas.FieldByName('Lectura_Actual_lc').AsInteger;
     LLecturaAnteriorAnt:=QLineas.FieldByName('Lectura_Anterior_lc').AsInteger;
     LConsumoAnt:=QLineas.FieldByName('Consumo_lc').AsInteger;
     LPrecioAnt:=QLineas.FieldByName('Precio_lc').AsInteger;
     LTotalAnt:=QLineas.FieldByName('Total_lc').AsInteger;
end;

procedure TConsumos.QLineasBeforeInsert(DataSet: TDataSet);
begin
     tNomConcepto.Caption:='';
end;

procedure TConsumos.QLineasCalcFields(DataSet: TDataSet);
begin
     //Rellenamos el nombre del concepto
     QConceptos.Close;
     QConceptos.ParamByName('Empresa').AsString:=QLineas.FieldByName('Empresa_lc').AsString;
     QConceptos.ParamByName('Codigo').AsString:=QLineas.FieldByName('Concepto_lc').AsString;
     QConceptos.Open;
     QLineas.FieldByName('NombreConcepto').AsString:=QConceptos.FieldByName('descripcion_c').AsString;

end;

procedure TConsumos.QMaestroAfterEdit(DataSet: TDataSet);
begin
  bFreeEdit:= QMaestro.FieldByName('Fecha_Factura_cc').AsString='';
  if not bFreeEdit then
  begin
    //MessageDlg (Chr(13) + 'Albarán ya facturado, recuerde que no puede modificar ni la empresa, número albaran, cliente y fecha.', mtWarning,[mbOk],0);
    sEmpresa:= QMaestro.FieldByName('empresa_cc').AsString;
    sCliente:= QMaestro.FieldByName('cliente_cc').AsString;
    sAnyo:= QMaestro.FieldByName('anyo_cc').AsInteger;
    sMes:= QMaestro.FieldByName('mes_cc').AsInteger;
  end;
end;

procedure TConsumos.QMaestroAfterInsert(DataSet: TDataSet);
begin
  bFreeEdit:= True;
     QMaestro.FieldByName('EMPRESA_CC').AsString:=cEmpresa.Text;
     QMaestro.FieldByName('CLIENTE_CC').AsString:=cCliente.Text;
     QMaestro.FieldByName('ANYO_CC').AsString:=cAnyoConsumo.Text;
     QMaestro.FieldByName('MES_CC').AsString:=cMesConsumo.Text;

     QMaestro.FieldByName('STATUS_FACTURA_CC').AsString := 'N';

end;

procedure TConsumos.QMaestroAfterOpen(DataSet: TDataSet);
begin
     QLineas.Open;
end;

procedure TConsumos.QMaestroBeforeClose(DataSet: TDataSet);
begin
     QLineas.Close;
end;

procedure TConsumos.QMaestroBeforeEdit(DataSet: TDataSet);
begin
     PanelLineas.Enabled:=False;
     EmpresaAnt:=QMaestro.FieldByName('Empresa_cc').AsString;
     ClienteAnt:=QMaestro.FieldByName('Cliente_cc').AsString;
     AnyoAnt:=QMaestro.FieldByName('Anyo_cc').AsInteger;
     MesAnt:=QMaestro.FieldByName('Mes_cc').AsInteger;
end;

procedure TConsumos.QMaestroBeforePost(DataSet: TDataSet);
begin
//     QMaestro.FieldByName('Cliente_cc').AsString:=RellenarCeros(cCliente.Text,cCliente.Properties.MaxLength,'I');


  //que no se puede modificar de la cabecera una vez facturado
  if not bFreeEdit then
  begin
    if ( sEmpresa <> QMaestro.FieldByName('empresa_cc').AsString ) or
       ( sCliente <> QMaestro.FieldByName('cliente_cc').AsString ) or
       ( sAnyo <> QMaestro.FieldByName('anyo_cc').AsInteger ) or
       ( sMes <> QMaestro.FieldByName('mes_cc').AsInteger ) then
    begin
      MessageDlg (Chr(13) + 'Consumo Eléctrico ya facturado, no se puede modificar ni la empresa, cliente, Año y Mes.', mtWarning,[mbOk],0);
      Abort;
    end;
  end;
end;

//---------------------- QUITA EL COLOR DE ALTA DE LOS CAMPOS CLAVE ------------
procedure TConsumos.QuitarColorAlta();
begin
     cEmpresa.Color:=clWindow;
     cCliente.Color:=clWindow;
     cAnyoConsumo.Color:=clWindow;
     cMesConsumo.Color:=clWindow;
end;

//---------------------- PONE EL COLOR DE ALTA DE LOS CAMPOS CLAVE -------------
procedure TConsumos.PonerColorAlta();
begin
     cEmpresa.Color:=clYellow;
     cCliente.Color:=clYellow;
     cAnyoConsumo.Color:=clYellow;
     cMesConsumo.Color:=clYellow;
end;


procedure TConsumos.Salir(Sender: TObject);
begin
     Close;
end;

procedure TConsumos.Siguiente(Sender: TObject);
begin
     if PosRegistro<NRegistros then
        Inc(PosRegistro);       //Numero de registro en el que estamos
     QMaestro.Next;
     BotonesPosicion();
end;

procedure TConsumos.SinSignos(Sender: TObject; var Key: Char);
begin
     if (Key='-') or (Key='+') then Key:=#0;
end;

procedure TConsumos.Ultimo(Sender: TObject);
begin
     PosRegistro:=NRegistros; //Numero de registro en el que estamos
     QMaestro.Last;
     BotonesPosicion();
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
function TConsumos.ObtenerPrecio(): currency;
Var
   QAux: TQuery;
begin
     Result:=0;
     QAux:=TQuery.Create(nil);
     try
        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

        //MANTENIMIENTO CLIENTE
        QAux.SQL.Add(' SELECT PRECIO_KW_THERMO_C FROM CLIENTES' +
                     ' WHERE EMPRESA_C=' + QuotedStr(QMaestro.FieldByName('EMPRESA_CC').AsString) +
                     ' AND CODIGO_C=' + QuotedStr(QMaestro.FieldByName('CLIENTE_CC').AsString));
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

//------------------- BUSQUEDA ULTIMA LECTURA POR EMPRESA, CLIENTE Y CONCEPTO ---------------
function TConsumos.ObtenerUltimaLectura(): currency;
Var
   QAux: TQuery;
begin
     QAux:=TQuery.Create(nil);
     try
        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

        //MANTENIMIENTO CLIENTE
        QAux.SQL.Add(' SELECT MAX(LECTURA_ACTUAL_LC) LECTURA_ACTUAL_LC FROM LINEA_CONSUMOS L1 ' +
                     '  WHERE L1.EMPRESA_LC =' + QuotedStr(QLineas.FieldByName('EMPRESA_LC').AsString)  +
                     '    AND L1.CLIENTE_LC= ' + QuotedStr(QLineas.FieldByName('CLIENTE_LC').AsString) +
                     '    AND L1.CONCEPTO_LC =' + QuotedStr(QLineas.FieldByName('CONCEPTO_LC').AsString) +
                     '    AND L1.ANYO_LC = (SELECT MAX(L2.ANYO_LC) FROM LINEA_CONSUMOS L2    ' +
                     '  				             WHERE L2.EMPRESA_LC = L1.EMPRESA_LC             ' +
                     '  				               AND L2.CLIENTE_LC = L1.CLIENTE_LC             ' +
                     '  				           	   AND L2.CONCEPTO_LC = L1.CONCEPTO_LC           ' +
                     '  				            	 AND L2.ANYO_LC <= L1.ANYO_LC)                 ' +
                     '    AND L1.MES_LC = (SELECT MAX(L3.MES_LC) FROM LINEA_CONSUMOS L3      ' +
                     '  				          	WHERE L3.EMPRESA_LC = L1.EMPRESA_LC              ' +
                     '  					            AND L3.CLIENTE_LC = L1.CLIENTE_LC              ' +
                     '  					            AND L3.CONCEPTO_LC = L1.CONCEPTO_LC            ' +
                     '  						          AND L3.ANYO_LC = L1.ANYO_LC                    ' +
                     '  						          AND L3.MES_LC <= L1.MES_LC)                    ' );
        QAux.Open;

        if not QAux.IsEmpty then
          Result:=QAux.FieldByName('LECTURA_ACTUAL_LC').AsCurrency
        else
          Result:=0;

      finally
             QAux.Close;
             FreeAndNil(QAux);
      end
end;

//------------------- PRECIO CONSUMO ELECTRICO POR CLIENTE ---------------
function TConsumos.ExisteConcepto(): boolean;
Var
   QAux: TQuery;
begin
     QAux:=TQuery.Create(nil);
     try
        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

        //MANTENIMIENTO CLIENTE
        QAux.SQL.Add(' SELECT * FROM LINEA_CONSUMOS' +
                     ' WHERE EMPRESA_LC=' + QuotedStr(QLineas.FieldByName('EMPRESA_LC').AsString) +
                     ' AND CLIENTE_LC=' + QuotedStr(QLineas.FieldByName('CLIENTE_LC').AsString) +
                     ' AND ANYO_LC=' + QuotedStr(QLineas.FieldByName('ANYO_LC').AsString) +
                     ' AND MES_LC=' + QuotedStr(QLineas.FieldByName('MES_LC').AsString) +
                     ' AND CONCEPTO_LC=' + QuotedStr(QLineas.FieldByName('CONCEPTO_LC').AsString) );
        QAux.Open;

        Result := not Qaux.IsEmpty;

      finally
             QAux.Close;
             FreeAndNil(QAux);
      end
end;

//-------------------------- VALIDACION DE DATOS CLAVE ----------------------
function TConsumos.ValidarClaves():Boolean;
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
     else if cCliente.Text='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'Falta el código del cliente', mtError,[mbOk],0);
          cCliente.SetFocus;
     end
     else if tNomCliente.Caption='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'El cliente no existe', mtError,[mbOk],0);
          cCliente.SetFocus;
     end
     else if cAnyoConsumo.Text='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'Falta introducir el Año', mtError,[mbOk],0);
          cAnyoConsumo.SetFocus;
     end
     else if cMesConsumo.Text='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'Falta introducir el Mes', mtError,[mbOk],0);
          cMesConsumo.SetFocus;
     end
     else if swAlta then  //Alta
             Result:=ComprobarConsumos();
end;


//-------------------------- VALIDACION DE DATOS CABECERA ----------------------
function TConsumos.ValidarCabecera():Boolean;
begin
//
end;

//-------------------------- VALIDACION DE LOS DATOS DE LA LINEA ---------------
function TConsumos.ValidarLinea():Boolean;
begin
    Result:=True;
     //concepto repetido
     if (ExisteConcepto) then
     begin
       Result:=False;
       cConcepto.SetFocus;
       MessageDlg (Chr(13) + 'Atencion! Ya se ha introducido este concepto en el consumo', mtError,[mbOk],0);
       Exit;
     end;
     //FAMILIA
     if (cConcepto.Text='') then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'El código del concepto es obligatorio', mtError,[mbOk],0);
          cConcepto.SetFocus;
          Exit;
     end;
     //NOMBRE CONCEPTO
     if tNomConcepto.Caption='' then
     begin
          Result:=False;
          cConcepto.SetFocus;
          MessageDlg (Chr(13) + 'El concepto no existe', mtError,[mbOk],0);
          Exit;
     end;
     //LECTURA ACTUAL
     if (not EsNumerico(cLecturaActual.Text)) or (StrToInt(cLecturaActual.Text)<=0)  then
     begin
          Result:=False;
          cLecturaActual.SetFocus;
          MessageDlg (Chr(13) + 'La Lectura Actual debe ser mayor que cero', mtError,[mbOk],0);
          Exit;
     end;
     //LECTURA ANTERIOR
     if (not EsNumerico(cLecturaAnterior.Text)) or (StrToInt(cLecturaAnterior.Text)<0)  then
     begin
          Result:=False;
          cLecturaAnterior.SetFocus;
          MessageDlg (Chr(13) + 'La Lectura Anterior debe ser mayor o igual que cero', mtError,[mbOk],0);
          Exit;
     end;
     //CONSUMO
     if (not EsNumerico(cConsumo.Text)) or (StrToInt(cConsumo.Text)<0)  then
     begin
          Result:=False;
          cConsumo.SetFocus;
          MessageDlg (Chr(13) + 'El Consumo debe ser mayor o igual que cero', mtError,[mbOk],0);
          Exit;
     end;
end;


//--------------------- COMPRUEBA EL CONSUMO -----------------------------------
function TConsumos.ComprobarConsumos(): Boolean;
Var
   QAux: TQuery;
begin
     Result:=True;
     //Comprobamos que el consumo no exista
     QAux:=TQuery.Create(nil);
     try
        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

        QAux.SQL.Add(' SELECT * FROM CABECERA_CONSUMOS' +
                     ' WHERE EMPRESA_CC=' + QuotedStr(cEmpresa.Text) +
                     ' AND CLIENTE_CC=' + QuotedStr(cCliente.Text) +
                     ' AND ANYO_CC=' + QuotedStr(cAnyoConsumo.Text) +
                     ' AND MES_CC=' + QuotedStr(cMesConsumo.Text)  );
        QAux.Open;
        if not QAux.IsEmpty then  //Si encontramos el albaran
        begin
             MessageDlg (Chr(13) + 'La cabecera de consumo ya existe', mtError,[mbOk],0);
             cAnyoConsumo.SetFocus;
             Result:=False;
        end;
      finally
             QAux.Close;
             FreeAndNil(QAux);
      end;
end;

procedure TConsumos.cPrecioEnter(Sender: TObject);
begin
     cPrecio.OnExit:=cPrecioExit;
end;

procedure TConsumos.cPrecioExit(Sender: TObject);
begin
//     if ComprobarManejo() then
        if (QLineas.State in [dsEdit,dsInsert]) then
           Aceptar(Self);
end;

procedure TConsumos.DSMaestroDataChange(Sender: TObject; Field: TField);
begin
{
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
}
end;

procedure TConsumos.DSMaestroStateChange(Sender: TObject);
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

//---------------------- BORRADO DE UN CONSUMO ---------------------------------
procedure TConsumos.EliminarConsumo();
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

                  //Borrado de las lineas
                 QAux.Close;
                 QAux.SQL.Clear;
                 QAux.SQL.Add(' DELETE FROM LINEA_CONSUMOS ' +
                               ' WHERE EMPRESA_LC=' + QuotedStr(QMaestro.FieldByName('EMPRESA_CC').AsString) +
                               ' AND CLIENTE_LC=' + QuotedStr(QMaestro.FieldByName('CLIENTE_CC').AsString) +
                               ' AND ANYO_LC =' + IntToStr(QMaestro.FieldByName('ANYO_CC').AsInteger) +
                               ' AND MES_LC =' + IntToStr(QMaestro.FieldByName('MES_CC').AsInteger) );
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
             cCliente.SetFocus;

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


//-------------- HABILITAR BOTONES DE POSICION DE REGISTRO ---------------------
procedure TConsumos.BotonesPosicion;
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

procedure TConsumos.bPrimeroLClick(Sender: TObject);
begin
     QLineas.First;
end;

procedure TConsumos.bSiguienteLClick(Sender: TObject);
begin
     QLineas.Next;
end;

procedure TConsumos.bUltimoLClick(Sender: TObject);
begin
     QLineas.Last;
end;

//----------------------------- BUSQUEDA ---------------------------------------
procedure TConsumos.Busqueda(Sender: TObject);
Var
   Aux: TBusquedaConsumos;
begin
     try
        Aux:=TBusquedaConsumos.Create(Self);
        with Aux do
        begin
             ShowModal;
             if (EmpresaBus<>'')  then   //Seleccionamos un registro del grid resultado
             begin
                  Application.ProcessMessages;
                  if EjecutaQuery(EmpresaBus, ClienteBus, AnyoBus, MesBus) then
                  begin
                       Self.PanelClaves.Enabled:=False;
                       Self.PanelLineas.Enabled:=True;
                  end
                  else  //Si no hay registros que mostrar
                  begin
                       Self.PanelClaves.Enabled:=True;
                       cEmpresa.Text:=EmpresaGlobal;
                       cCliente.Text:='';
                       cAnyoBus.Text:='';
                       cCliente.SetFocus;
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
                       cCliente.Text:='';
                       cAnyoConsumo.Text:='';
                       cMesConsumo.Text:='';
                       cCliente.SetFocus;
                       Mensaje('Registro no existe');
                 end;
            end
        end;
     finally
            FreeAndNil(Aux);
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
        QAux.SQL.Add(' SELECT SUM(TOTAL_LC) TOTAL_LC FROM LINEA_CONSUMOS' +
                     ' WHERE EMPRESA_LC=' + QuotedStr(QMaestro.FieldByName('EMPRESA_CC').AsString) +
                     ' AND CLIENTE_LC=' + QuotedStr(QMaestro.FieldByName('CLIENTE_CC').AsString) +
                     ' AND ANYO_LC= ' + QMaestro.FieldByName('ANYO_CC').AsString +
                     ' AND MES_LC=' + QMaestro.FieldByName('MES_CC').AsString );
        QAux.Open;

        if not QAux.IsEmpty then
          cTotalConsumo.Text := FloattoStr(QAux.FieldByName('TOTAL_LC').AsFloat)
        else
          cTotalConsumo.Text:='0';

      finally
             QAux.Close;
             FreeAndNil(QAux);
      end
end;

procedure TConsumos.Calculo(Sender: TObject);
begin
  if QLineas.State in dsEditModes then
  begin
     //Consummo
     QLineas.FieldByName('consumo_lc').AsFloat:=QLineas.FieldByName('lectura_actual_lc').AsFloat - QLineas.FieldByName('lectura_anterior_lc').AsFloat;
     //Total
     QLineas.FieldByName('total_lc').AsFloat:=QLineas.FieldByName('consumo_lc').AsFloat * QLineas.FieldByName('precio_lc').AsFloat;
  end;
end;

procedure TConsumos.Cancelar(Sender: TObject);
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
{
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
}
                           Exit;
                      end
                      else   //Alta
                      begin
                           QMaestro.Cancel;

                           PanelClaves.Enabled:=True;
                           PanelLineas.Enabled:=True;
                           SwAlta:=False;

                           QuitarColorAlta();
{
                           cHora.OnChange:=Nil;
                           cHora.Text:='';
                           cHora.OnChange:=cHoraChange;

                           cFechaAlbaran.Properties.OnChange:=Nil;
                           cFechaAlbaran.Date:=0;
                           cFechaAlbaran.Properties.OnChange:=cFechaAlbaranChange;
}
                           cEmpresa.Text:=EmpresaGlobal;
                           cCliente.Text:='';
                           cAnyoConsumo.Text:='';
                           cMesConsumo.Text:='';
                           cCliente.SetFocus;

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

          Imprimir:=False;
          if QLineas.State=dsInsert then
             Imprimir:=True;

          QLineas.Cancel;

          //Habilito lo que puede estar deshabilitado
          cConcepto.Enabled:=True;

          PanelInsertarLinea.Visible:=False;
          PanelClaves.Enabled:=False;
          PanelCabecera.Enabled:=True;
          PanelLineas.Enabled:=True;

          //Si el consumo no tiene lineas preguntamos si lo borramos
          if QLineas.IsEmpty then
          begin
               if MessageBox(Handle, PChar('Cabecera de Consumo sin líneas.' + chr(13) + '¿Desea eliminarlo?'),
                             PChar(Self.Caption),
                             MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1)=IDYES then
                  EliminarConsumo();
          end;
{
          else if Imprimir then
                  ImprimirConsumo(QMaestro.FieldByName('Empresa_cc').AsString,
                                  QMaestro.FieldByName('Cliente_ce').AsString,
                                  QMaestro.FieldByName('ref_cliente_ce').AsString,
                                  QMaestro.FieldByName('Albaran_ce').AsInteger,
                                  DiaMesAnyo(QMaestro.FieldByName('Fecha_Albaran_ce').AsString));
}
          BotonesPosicion();
     end
     else if not QMaestro.IsEmpty then  //Cancelamos con registros activo
     begin
          QMaestro.Close;

          //A partir de aqui se hace si cancelo un alta
          PanelClaves.Enabled:=True;
          PanelLineas.Enabled:=True;
          SwAlta:=False;

          QuitarColorAlta();

          cEmpresa.Text:=EmpresaGlobal;
          cCliente.Text:='';
          cAnyoConsumo.Text:='';
          cMesConsumo.Text:='';
          cCliente.SetFocus;
{
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
 }
          PosRegistro:=0;
          NRegistros:=0;

          Mensaje('Cambios Ignorados');

          BotonesPosicion();
     end
     else
     begin
          PanelClaves.Enabled:=True;
          PanelLineas.Enabled:=True;
          SwAlta:=False;

          QuitarColorAlta();

          cEmpresa.Text:=EmpresaGlobal;
          cCliente.Text:='';
          cAnyoConsumo.Text:='';
          cMesConsumo.Text:='';
          cCliente.SetFocus;

{
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
}
          PosRegistro:=0;
          NRegistros:=0;

          Mensaje('Cambios Ignorados');

          BotonesPosicion();
     end;
end;

//------------------------ APERTURA DE LA QUERY PRINCIPAL ----------------------
function TConsumos.EjecutaQuery(Empresa, Cliente: String; Anyo, Mes: Integer):Boolean;
begin
     Result:=False;
     NRegistros:=0;
     PosRegistro:=0;
     try
        //QLineas.Close;
        QMaestro.Close;
        QMaestro.SQL.Clear;
        QMaestro.SQL.Add(' SELECT * FROM CABECERA_CONSUMOS ');
        SQLWhere:=' WHERE (EMPRESA_CC=' + QuotedStr(Empresa) +
                  ' AND CLIENTE_CC=' + QuotedStr(Cliente) +
                  ' AND ANYO_CC=' + IntToStr(Anyo) +
                  ' AND MES_CC=' + IntToStr(Mes) +') ';
        QMaestro.SQL.Add(SQLWhere);
        QMaestro.SQL.Add(' ORDER BY EMPRESA_CC, CLIENTE_CC, ANYO_CC, MES_CC');
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
                                     ' FROM CABECERA_CONSUMOS ' +
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
function TConsumos.EjecutaQueryMas():Boolean;
begin
     Result:=False;

     try

        SQLWhere:=SQLWhere + ' OR (EMPRESA_CC=' + QuotedStr(EmpresaAnt) + ' AND CLIENTE_CE=' + QuotedStr(ClienteAnt) +
                                 ' AND ANYO_CC= ' + IntToStr(AnyoAnt) + ' AND MES_CC= ' + IntToStr(MesAnt) +  ') ';

        QMaestro.Close;
        QMaestro.SQL.Clear;
        QMaestro.SQL.Add('SELECT * FROM CABECERA_CONSUMOS ' +
                         SQLWhere +
                         ' ORDER BY EMPRESA_CC, CLIENTE_CC, ANYO_CC, MES_CC ');
        QMaestro.Open;
        if QMaestro.IsEmpty then
           Result:=False
        else
        begin
             QMaestro.Locate('Empresa_cc;cliente_cc;anyo_cc;mes_cc', VarArrayOf([EmpresaAnt,ClienteAnt,AnyoAnt, MesAnt]),[]);
             Result:=True;
        end;
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
        SQLWhere:=WhereBus;

        QMaestro.Close;
        QMaestro.SQL.Clear;
        QMaestro.SQL.Add('SELECT * FROM CABECERA_CONSUMOS ' +
                         WhereBus +
                         ' ORDER BY EMPRESA_CC, CLIENTE_CC, ANYO_CC, MES_CC');
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
                     SQL.Add('SELECT COUNT(*) AS NREGISTROS FROM CABECERA_CONSUMOS ' + WhereBus);
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



end.
