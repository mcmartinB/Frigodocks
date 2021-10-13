unit BFacturas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, DBTables, StdCtrls, ComCtrls,
  ToolWin, Buttons, 
  Provider, DBClient, Mask, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxCore,
  cxDateUtils, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, dxSkinsdxBarPainter,
  dxBar, cxClasses, Menus, cxButtons, SimpleSearch;

type
  TBusquedaFacturas = class(TForm)
    Query1: TQuery;
    DS: TDataSource;
    Timer1: TTimer;
    PanelDatos: TPanel;
    QContar: TQuery;
    BarraEstado: TStatusBar;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1FechaFactura: TStringField;
    ClientDataSet1FechaVencimiento: TStringField;
    ClientDataSet1empresa_cf: TStringField;
    ClientDataSet1cliente_cf: TStringField;
    ClientDataSet1numero_factura_cf: TIntegerField;
    ClientDataSet1fecha_factura_cf: TStringField;
    ClientDataSet1fecha_vencimiento_cf: TStringField;
    ClientDataSet1fecha_desde_cf: TStringField;
    ClientDataSet1fecha_hasta_cf: TStringField;
    ClientDataSet1importe_bruto_cf: TFloatField;
    ClientDataSet1porcentaje_iva_cf: TFloatField;
    ClientDataSet1importe_iva_cf: TFloatField;
    ClientDataSet1importe_neto_cf: TFloatField;
    ClientDataSet1tipo_cf: TStringField;
    ClientDataSet1num_contabilizacion_cf: TIntegerField;
    ClientDataSet1ultimo_stock_cf: TFloatField;
    ClientDataSet1fecha_contabilizacion_cf: TStringField;
    ClientDataSet1Contabilizada: TStringField;
    GridLineas: TDBGrid;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    bNuevaBusqueda: TdxBarButton;
    bPrimero: TdxBarButton;
    bAnterior: TdxBarButton;
    bSiguiente: TdxBarButton;
    bUltimo: TdxBarButton;
    bAceptar: TdxBarButton;
    bCancelar: TdxBarButton;
    PanelClaves: TPanel;
    nbLabel5: TLabel;
    Articulo: TLabel;
    StaticText1: TStaticText;
    tNomEmpresa: TPanel;
    cEmpresaBus: TEdit;
    cClienteBus: TEdit;
    tNomcliente: TPanel;
    StaticText13: TStaticText;
    cNumFacturaBus: TEdit;
    cFechaFacturaBus: TcxDateEdit;
    cLupaEmpresas: TSimpleSearch;
    cLupaClilentes: TSimpleSearch;
    procedure NuevaBusqueda(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Aceptar(Sender: TObject);
    procedure Cancelar(Sender: TObject);
    procedure GridLineasDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure GridLineasTitleClick(Column: TColumn);
    procedure ColorEnter(Sender: TObject);
    procedure ColorExit(Sender: TObject);
    procedure cEmpresaBusChange(Sender: TObject);
    procedure Primero(Sender: TObject);
    procedure Anterior(Sender: TObject);
    procedure Siguiente(Sender: TObject);
    procedure Ultimo(Sender: TObject);
    procedure ClientDataSet1AfterScroll(DataSet: TDataSet);
    procedure cClienteBusChange(Sender: TObject);
    procedure ClientDataSet1CalcFields(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaEmpresasClick(Sender: TObject);
    procedure cLupaClientesClick(Sender: TObject);
    procedure cClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    { Private declarations }
    TextoSql: String;
    PosRegistro, NRegistros: Integer;
    procedure Mensaje(Texto: String );
    procedure BotonesPosicion;

  public
       { Public declarations }
       EmpresaBus, ClienteBus, LoteBus, NumFacturaBus: String;
       FechaBus: TDateTime;
       WhereBus: String;
       EmpresaParam, ClienteParam: String;
       AceptarTodos: Boolean;
       function EjecutarQuery(): Boolean;
  end;

var
   BusquedaFacturas: TBusquedaFacturas;

implementation

uses MBaseDatos, UGLobal;

{$R *.dfm}

//----------------------- BOTON NUEVA BUSQUEDA ---------------------------------
procedure TBusquedaFacturas.NuevaBusqueda(Sender: TObject);
begin
     Self.Height:=240;
     Self.width:=580;
     GridLineas.TabStop:=False;
     PanelDatos.Enabled:=False;
     PanelDatos.Visible:=False;
     PanelClaves.Visible:=True;
     Query1.Close;
     ClientDataSet1.Close;
     cEmpresaBus.Text:=EmpresaParam;
     if EmpresaParam<>'' then
        cEmpresaBus.ReadOnly:=True;
     cClienteBus.Text:=ClienteParam;
     cClienteBus.SetFocus;
     if ClienteParam<>'' then
        cClienteBus.ReadOnly:=True;
     cNumFacturaBus.Text:='';
     cFechaFacturaBus.Text:='';
     NRegistros:=0;
     PosRegistro:=0;
     BotonesPosicion();
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TBusquedaFacturas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then  //F5 aceptar
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TBusquedaFacturas.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13 then  //Enter
     begin
          if (GridLineas.Focused) and (not ClientDataSet1.IsEmpty) then  //Foco en el Grid y existen datos
              GridLineasDblClick(Self)
          else
          begin
               Key:=#0;
               PostMessage(Handle,WM_NEXTDLGCTL,0,0);
          end;
     end
     else if Key=#27 then  //Esc
          begin
               Key:=#0;
               if BCancelar.Enabled then
                  Cancelar(Self)
               else
                   Close;
          end;
end;

//----------------------- BOTON ACEPTAR ----------------------------------------
procedure TBusquedaFacturas.Aceptar(Sender: TObject);
begin
     if not ClientDataSet1.Active then
     begin
          if EjecutarQuery() then
          begin
               //ClientDataSet1.Open;
               Self.Height:=486;
               Self.width:=725;
               PanelClaves.Visible:=False;
               PanelDatos.Enabled:=True;
               PanelDatos.Visible:=True;
               GridLineas.TabStop:=True;
               GridLineas.SetFocus;
          end
          else
          begin
               Mensaje('No existen datos');
               Query1.Close;
               ClientDataSet1.Close;
          end;
          BotonesPosicion();
     end
     else
     begin
          if not AceptarTodos then
          begin
               EmpresaBus:=ClientDataSet1.FieldByName('EMPRESA_CF').AsString;
               ClienteBus:=ClientDataSet1.FieldByName('CLIENTE_CF').AsString;
               NumFacturaBus:=ClientDataSet1.FieldByName('NUMERO_FACTURA_CF').AsString;
               FechaBus:=StrToDate(DiaMesAnyo(ClientDataSet1.FieldByName('FECHA_FACTURA_CF').AsString));               
          end;
          ModalResult:=mrOk;
     end;
end;

//-------------------------- EJECUTA LA QUERY DE FILTRO ------------------------
function TBusquedaFacturas.EjecutarQuery():Boolean;
Var
   HayWhere: Boolean;
begin
     Result:=False;

     NRegistros:=0;
     PosRegistro:=0;
     HayWhere:=False;

     WhereBus:='';
     Query1.SQL.Clear;
     Query1.SQL.Add(' SELECT * ' +
                    ' FROM CABECERA_FACTURAS ');
     if EmpresaParam<>'' then
     begin
          WhereBus:=' WHERE EMPRESA_CF=' + QuotedStr(EmpresaParam);
          HayWhere:=True;
     end
     else if cEmpresaBus.Text<>'' then
     begin
          WhereBus:=' WHERE EMPRESA_CF=' + QuotedStr(RellenarCeros(cEmpresaBus.Text, cEmpresaBus.MaxLength,'I'));
          HayWhere:=True;
     end;
     if ClienteParam<>'' then
     begin
          if HayWhere then
             WhereBus:=WhereBus + ' AND CLIENTE_CF=' + QuotedStr(ClienteParam)
          else
          begin
               WhereBus:=' WHERE CLIENTE_CF=' + QuotedStr(ClienteParam);
               HayWhere:=True;
          end;
     end
     else if cClienteBus.Text<>'' then
     begin
          if HayWhere then
             WhereBus:=WhereBus + ' AND CLIENTE_CF=' + QuotedStr(RellenarCeros(cClienteBus.Text,cClienteBus.MaxLength,'I'))
          else
          begin
               WhereBus:=' WHERE CLIENTE_CF=' + QuotedStr(RellenarCeros(cClienteBus.Text,cClienteBus.MaxLength,'I'));
               HayWhere:=True;
          end;
     end;
     if cNumFacturaBus.Text<>'' then
     begin
          if HayWhere then
             WhereBus:=WhereBus + ' AND NUMERO_FACTURA_CF=' + QuotedStr(cNumFacturaBus.Text)
          else
          begin
               WhereBus:=' WHERE NUMERO_FACTURA_CF=' + QuotedStr(cNumFacturaBus.Text);
               HayWhere:=True;
          end;
     end;
     if cFechaFacturaBus.Text<>'' then
     begin
          if HayWhere then
             WhereBus:=WhereBus + ' AND FECHA_FACTURA_CF=' + QuotedStr(AnyoMesDia(cFechaFacturaBus.Text))
          else
              WhereBus:=' WHERE FECHA_FACTURA_CF=' + QuotedStr(AnyoMesDia(cFechaFacturaBus.Text));
     end;
     Query1.SQL.Add(WhereBus);
     TextoSql:=Query1.SQL.Text;
     Query1.SQL.Add(' ORDER BY EMPRESA_CF, NUMERO_FACTURA_CF, FECHA_FACTURA_CF');
     Query1.Open;
     if not Query1.IsEmpty then
     begin
          ClientDataSet1.Open;

          try    //Contamos los Registros
             With QContar do
             begin
                  Close;
                  SQL.Clear;
                  SQL.Add(' SELECT COUNT(*) AS NREGISTROS ' +
                          ' FROM CABECERA_FACTURAS ' +
                          WhereBus);
                  Open;
                  NRegistros:=FieldByName('NRegistros').AsInteger;  //Contamos los registros
                  PosRegistro:=1;
             end;
          finally
                 QContar.Close;
          end;
          Result:=True;
     end;
end;

//----------------------- BOTON CANCELAR ---------------------------------------
procedure TBusquedaFacturas.Cancelar(Sender: TObject);
begin
     ModalResult:=mrCancel;
end;

//----------------------------- DOBLE CLICK EN EL GRID -------------------------
procedure TBusquedaFacturas.GridLineasDblClick(Sender: TObject);
begin
     EmpresaBus:=ClientDataSet1.FieldByName('EMPRESA_CF').AsString;
     ClienteBus:=ClientDataSet1.FieldByName('CLIENTE_CF').AsString;
     NumFacturaBus:=ClientDataSet1.FieldByName('NUMERO_FACTURA_CF').AsString;
     FechaBus:=StrToDate(DiaMesAnyo(ClientDataSet1.FieldByName('FECHA_FACTURA_CF').AsString));

     ModalResult:=mrOk;
end;

//--------------------- MENSAJES DE LA BARRA DE ESTADO -------------------------
procedure TBusquedaFacturas.Mensaje(Texto: String );
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
     Timer1.Enabled := false;
     Timer1.Enabled := true;
end;

//--------------------- TIMER PARALOS MENSAJES ---------------------------------
procedure TBusquedaFacturas.Timer1Timer(Sender: TObject);
begin
     if BarraEstado.SimplePanel then
         BarraEstado.SimpleText:=''
     else if BarraEstado.Panels.Count=0 then
          begin
               BarraEstado.SimplePanel:=True;
               BarraEstado.SimpleText:='';
          end
          else
              BarraEstado.Panels[0].Text:='';
     Timer1.Enabled:=False;
end;

//------------------------ CREACION DEL FORMULARIO -----------------------------
procedure TBusquedaFacturas.FormCreate(Sender: TObject);
begin
     PosRegistro:=0;
     NRegistros:=0;
end;

//----------------------- ORDENACION DE LOS DATOS DEL GRID ---------------------
procedure TBusquedaFacturas.GridLineasTitleClick(Column: TColumn);
begin
     ClientDataSet1.Close;
     Query1.Close;
     Query1.SQL.Clear;
     if Column.FieldName='FechaFactura' then
        Query1.SQL.Add(TextoSql +
                       ' ORDER BY FECHA_FACTURA_CF')
     else if Column.FieldName='FechaVencimiento' then
            Query1.SQL.Add(TextoSql +
                    ' ORDER BY fecha_vencimiento_cf')
          else
              Query1.SQL.Add(TextoSql +
                             ' ORDER BY ' + Column.FieldName);
     Query1.Open;
     ClientDataSet1.Open;
end;

//---------------------- PONE EL COLOR DEL FOCO --------------------------------
procedure TBusquedaFacturas.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clMoneyGreen;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TBusquedaFacturas.ColorExit(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          TEdit(Sender).Color:=clWindow;
          if Length(TEdit(Sender).Text)>0 then
             TEdit(Sender).Text:=RellenarCeros(TEdit(Sender).Text,TEdit(Sender).MaxLength,'I');
     end
     else if Sender is TComboBox then           //Si el componente es un TComboBox
             TComboBox(Sender).Color:=clWindow;
end;

//----------------------- CAMBIO DE LA EMPRESA ---------------------------------
procedure TBusquedaFacturas.cEmpresaBusChange(Sender: TObject);
Var
   Empresa: String;
begin
     Empresa:=RellenarCeros(cEmpresaBus.Text,cEmpresaBus.MaxLength,'I');

     tNomEmpresa.Caption:=NomEmpresa(Empresa);
     tNomCliente.Caption:=NomCliente(Empresa, cClienteBus.Text);
end;

//-------------------------- PRIMER REGISTRO -----------------------------------
procedure TBusquedaFacturas.Primero(Sender: TObject);
begin
     ClientDataSet1.First;
end;

//-------------------------- REGISTRO ANTERIOR ---------------------------------
procedure TBusquedaFacturas.Anterior(Sender: TObject);
begin
     ClientDataSet1.Prior;
end;

//-------------------------- REGISTRO SIGUIENTE --------------------------------
procedure TBusquedaFacturas.Siguiente(Sender: TObject);
begin
     ClientDataSet1.Next;
end;

//-------------------------- ULTIMO REGISTRO -----------------------------------
procedure TBusquedaFacturas.Ultimo(Sender: TObject);
begin
     ClientDataSet1.Last;
end;

//-------------- HABILITAR BOTONES DE POSICION DE REGISTRO ---------------------
procedure TBusquedaFacturas.BotonesPosicion;
begin
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
end;

//-------------------- AL CAMBIAR DE REGISTRO ----------------------------------
procedure TBusquedaFacturas.ClientDataSet1AfterScroll(DataSet: TDataSet);
begin
     PosRegistro:=ClientDataSet1.RecNo;
     BotonesPosicion();
end;

//-------------------- AL CAMBIAR EL CLIENTE -----------------------------------
procedure TBusquedaFacturas.cClienteBusChange(Sender: TObject);
begin
     tNomCliente.Caption:=NomCliente(cEmpresaBus.Text,RellenarCeros(cClienteBus.Text,cClienteBus.MaxLength,'I'));
end;

//-------------------- AL CALCULAR CAMPOS --------------------------------------
procedure TBusquedaFacturas.ClientDataSet1CalcFields(DataSet: TDataSet);
begin
     //Cambia el formato de la fecha de entrada al visualizar (YYYY/MM/DD --> DD/MM/YYYY)
     ClientDataSet1.FieldByName('FechaFactura').AsString:=DiaMesAnyo(ClientDataSet1.FieldByName('Fecha_Factura_cf').AsString);
     ClientDataSet1.FieldByName('FechaVencimiento').AsString:=DiaMesAnyo(ClientDataSet1.FieldByName('Fecha_Vencimiento_cf').AsString);
     if (ClientDataSet1.FieldByName('num_contabilizacion_cf').AsInteger=0) or (ClientDataSet1['num_contabilizacion_cf']=NULL) then
        ClientDataSet1.FieldByName('Contabilizada').AsString:='NO'
     else
         ClientDataSet1.FieldByName('Contabilizada').AsString:='SI';
end;

//--------------------- AL ACTIVAR EL FORMULARIO -------------------------------
procedure TBusquedaFacturas.FormActivate(Sender: TObject);
begin
     cEmpresaBus.Text:=EmpresaParam;
     cClienteBus.SetFocus;
     if ClientDataSet1.Active then
     begin
           PanelClaves.Visible:=False;
           PanelDatos.Enabled:=True;
           PanelDatos.Visible:=True;
           GridLineas.TabStop:=True;
           GridLineas.SetFocus;

           BotonesPosicion();
     end;
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TBusquedaFacturas.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TBusquedaFacturas.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresaBus.Text:=CodEmpresa;
     cEmpresaBus.SetFocus;
end;

//-------------------------- LUPA DE CLIENTES ----------------------------------
procedure TBusquedaFacturas.cLupaClientesClick(Sender: TObject);
Var
   CodCliente: String;
begin
     if cEmpresaBus.Text<>'' then
     begin
          CodCliente:=LupaClientes(RellenarCeros(cEmpresaBus.Text,cEmpresaBus.MaxLength,'I'));
          if CodCliente<>'' then
             cClienteBus.Text:=CodCliente;
          cClienteBus.SetFocus;
     end
     else
     begin
          MessageDlg (Chr(13) + 'Seleccione antes la empresa', mtError,[mbOk],0);
          cEmpresaBus.SetFocus;
     end;
end;

//-------------------------- LUPA (F2) DE CLIENTES -----------------------------
procedure TBusquedaFacturas.cClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaClientesClick(Self);
end;

end.
