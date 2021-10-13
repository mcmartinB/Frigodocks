unit BCobros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, DBTables, StdCtrls, ComCtrls,
  ToolWin,Buttons,
  Provider, DBClient, Mask, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxCore,
  cxDateUtils, Menus, cxButtons, SimpleSearch, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, dxBar, cxClasses, dxSkinsCore, dxSkinBlue,
  dxSkinsdxBarPainter;

type
  TBusquedaCobros = class(TForm)
    Query1: TQuery;
    DS: TDataSource;                                               
    Timer1: TTimer;
    PanelDatos: TPanel;
    GridLineas: TDBGrid;
    QContar: TQuery;
    BarraEstado: TStatusBar;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1FechaFactura: TStringField;
    ClientDataSet1FechaCobro: TStringField;
    ClientDataSet1empresa_co: TStringField;
    ClientDataSet1cliente_co: TStringField;
    ClientDataSet1factura_co: TIntegerField;
    ClientDataSet1fecha_factura_co: TStringField;
    ClientDataSet1fecha_pago_co: TStringField;
    ClientDataSet1tipo_cobro_co: TStringField;
    ClientDataSet1importe_co: TFloatField;
    ClientDataSet1serial_co: TIntegerField;
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
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    StaticText1: TStaticText;
    tNomEmpresa: TPanel;
    cClienteBus: TEdit;
    cEmpresaBus: TEdit;
    cFechaFacturaBus: TcxDateEdit;
    cFechaPagoBus: TcxDateEdit;
    tNomcliente: TPanel;
    cFacturaBus: TEdit;
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
    procedure FormActivate(Sender: TObject);
    procedure cClienteBusChange(Sender: TObject);
    procedure ClientDataSet1CalcFields(DataSet: TDataSet);
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
       WhereBus: String;
       SerialBus: Integer;
  end;

var
   BusquedaCobros: TBusquedaCobros;

implementation

uses MBaseDatos, UGLobal;

{$R *.dfm}

//----------------------- BOTON NUEVA BUSQUEDA ---------------------------------
procedure TBusquedaCobros.NuevaBusqueda(Sender: TObject);
begin
     Self.Height:=278;
     Self.width:=530;
     GridLineas.TabStop:=False;
     PanelDatos.Enabled:=False;
     PanelDatos.Visible:=False;
     PanelClaves.Visible:=True;
     Query1.Close;
     ClientDataSet1.Close;
     cEmpresaBus.SetFocus;
     cEmpresaBus.Text:='';
     cClienteBus.Text:='';
     cFacturaBus.Text:='';
     cFechaFacturaBus.Date:=0;
     cFechaPagoBus.Date:=0;
     SerialBus:=-1;
     NRegistros:=0;
     PosRegistro:=0;
     BotonesPosicion();
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TBusquedaCobros.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then  //F5 aceptar
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TBusquedaCobros.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TBusquedaCobros.Aceptar(Sender: TObject);
Var
   HayWhere: Boolean;
begin
     NRegistros:=0;
     PosRegistro:=0;
     HayWhere:=False;
     if not ClientDataSet1.Active then
     begin
          WhereBus:='';
          Query1.SQL.Clear;
          Query1.SQL.Add(' SELECT * ' +
                         ' FROM COBROS ');
          if cEmpresaBus.Text<>'' then
          begin
               WhereBus:=' WHERE EMPRESA_CO=' + QuotedStr(cEmpresaBus.Text);
               HayWhere:=True;
          end;
          if cClienteBus.Text<>'' then
          begin
               if HayWhere then
                  WhereBus:=WhereBus + ' AND CLIENTE_CO=' + QuotedStr(cClienteBus.Text)
               else
               begin
                    WhereBus:=' WHERE CLIENTE_CO=' + QuotedStr(cClienteBus.Text);
                    HayWhere:=True;
               end;
          end;
          if cFacturaBus.Text<>'' then
          begin
               if HayWhere then
                  WhereBus:=WhereBus + ' AND FACTURA_CO=' + QuotedStr(cFacturaBus.Text)
               else
               begin
                    WhereBus:=' WHERE FACTURA_CO=' + QuotedStr(cFacturaBus.Text);
                    HayWhere:=True;
               end;
          end;
          if cFechaFacturaBus.Text<>'' then
          begin
               if HayWhere then
                  WhereBus:=WhereBus + ' AND FECHA_FACTURA_CO=' + QuotedStr(AnyoMesDia(cFechaFacturaBus.Text))
               else
               begin
                    WhereBus:=' WHERE FECHA_FACTURA_CO=' + QuotedStr(AnyoMesDia(cFechaFacturaBus.Text));
                    HayWhere:=True;
               end;
          end;
          if cFechaPagoBus.Text<>'' then
          begin
               if HayWhere then
                  WhereBus:=WhereBus + ' AND FECHA_PAGO_CO=' + QuotedStr(AnyoMesDia(cFechaPagoBus.Text))
               else
                   WhereBus:=' WHERE FECHA_PAGO_CO=' + QuotedStr(AnyoMesDia(cFechaPagoBus.Text));
          end;
          Query1.SQL.Add(WhereBus);
          TextoSql:=Query1.SQL.Text;
          Query1.SQL.Add(' ORDER BY EMPRESA_CO, CLIENTE_CO, FACTURA_CO, FECHA_FACTURA_CO, FECHA_PAGO_CO');
          Query1.Open;
          if not Query1.IsEmpty then
          begin
               ClientDataSet1.Open;
               Self.Height:=433;
               PanelClaves.Visible:=False;
               PanelDatos.Enabled:=True;
               PanelDatos.Visible:=True;
               GridLineas.TabStop:=True;
               GridLineas.SetFocus;
               try    //Contamos los Registros
                  With QContar do
                  begin
                       Close;
                       SQL.Clear;
                       SQL.Add(' SELECT COUNT(*) AS NREGISTROS ' +
                               ' FROM COBROS ' +
                               WhereBus);
                       Open;
                       NRegistros:=FieldByName('NRegistros').AsInteger;  //Contamos los registros
                       PosRegistro:=1;
                   end;
               finally
                      QContar.Close;
               end;
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
         ModalResult:=mrOk;
end;

//----------------------- BOTON CANCELAR ---------------------------------------
procedure TBusquedaCobros.Cancelar(Sender: TObject);
begin
     ModalResult:=mrCancel;
end;

//----------------------------- DOBLE CLICK EN EL GRID -------------------------
procedure TBusquedaCobros.GridLineasDblClick(Sender: TObject);
begin
     SerialBus:=ClientDataSet1.FieldByName('Serial_co').AsInteger;

     ModalResult:=mrOk;
end;

//--------------------- MENSAJES DE LA BARRA DE ESTADO -------------------------
procedure TBusquedaCobros.Mensaje(Texto: String );
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
procedure TBusquedaCobros.Timer1Timer(Sender: TObject);
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
procedure TBusquedaCobros.FormCreate(Sender: TObject);
begin
     Self.Height:=278;
     Self.width:=530;
     PosRegistro:=0;
     NRegistros:=0;

     SerialBus:=-1;
end;

//----------------------- ORDENACION DE LOS DATOS DEL GRID ---------------------
procedure TBusquedaCobros.GridLineasTitleClick(Column: TColumn);
begin
     ClientDataSet1.Close;
     Query1.Close;
     Query1.SQL.Clear;


     if Column.FieldName='FechaFactura' then
        Query1.SQL.Add(TextoSql +
                       ' ORDER BY FECHA_FACTURA_CO')
     else if Column.FieldName='FechaCobro' then
             Query1.SQL.Add(TextoSql +
                            ' ORDER BY FECHA_PAGO_CO')
          else Query1.SQL.Add(TextoSql +
                              ' ORDER BY ' + Column.FieldName);
     Query1.Open;
     ClientDataSet1.Open;
end;

//---------------------- PONE EL COLOR DEL FOCO --------------------------------
procedure TBusquedaCobros.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clMoneyGreen;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TBusquedaCobros.ColorExit(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          TEdit(Sender).Color:=clWindow;
          if Length(TEdit(Sender).Text)>0 then
             TEdit(Sender).Text:=RellenarCeros(TEdit(Sender).Text,TEdit(Sender).MaxLength,'I');
     end;
end;

//----------------------- CAMBIO DE LA EMPRESA ---------------------------------
procedure TBusquedaCobros.cEmpresaBusChange(Sender: TObject);
Var
   Empresa: String;
begin
     Empresa:=RellenarCeros(cEmpresaBus.Text,cEmpresaBus.MaxLength,'I');

     tNomEmpresa.Caption:=NomEmpresa(Empresa);
     tNomCliente.Caption:=NomCliente(Empresa, cClienteBus.Text);
end;

//-------------------------- PRIMER REGISTRO -----------------------------------
procedure TBusquedaCobros.Primero(Sender: TObject);
begin
     ClientDataSet1.First;
end;

//-------------------------- REGISTRO ANTERIOR ---------------------------------
procedure TBusquedaCobros.Anterior(Sender: TObject);
begin
     ClientDataSet1.Prior;
end;

//-------------------------- REGISTRO SIGUIENTE --------------------------------
procedure TBusquedaCobros.Siguiente(Sender: TObject);
begin
     ClientDataSet1.Next;
end;

//-------------------------- ULTIMO REGISTRO -----------------------------------
procedure TBusquedaCobros.Ultimo(Sender: TObject);
begin
     ClientDataSet1.Last;
end;

//-------------- HABILITAR BOTONES DE POSICION DE REGISTRO ---------------------
procedure TBusquedaCobros.BotonesPosicion;
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
procedure TBusquedaCobros.ClientDataSet1AfterScroll(DataSet: TDataSet);
begin
     PosRegistro:=ClientDataSet1.RecNo;
     BotonesPosicion();
end;

//-------------------------- AL ACTIVAR EL FORMULARIO --------------------------
procedure TBusquedaCobros.FormActivate(Sender: TObject);
begin
     Self.Top:=Self.Top + 50;
end;

//---------------------- CAMBIO DE CLIENTE -------------------------------------
procedure TBusquedaCobros.cClienteBusChange(Sender: TObject);
begin
     tNomCliente.Caption:=NomCliente(cEmpresaBus.Text, RellenarCeros(cClienteBus.Text,cClienteBus.MaxLength,'I'));
end;

//------------------------ CALCULO DE CAMPOS CALCULADOS ------------------------
procedure TBusquedaCobros.ClientDataSet1CalcFields(DataSet: TDataSet);
begin
     //Cambia el formato de la fecha de entrada al visualizar (YYYY/MM/DD --> DD/MM/YYYY)
     ClientDataSet1.FieldByName('FechaCobro').AsString:=DiaMesAnyo(ClientDataSet1.FieldByName('Fecha_Pago_co').AsString);
     ClientDataSet1.FieldByName('FechaFactura').AsString:=DiaMesAnyo(ClientDataSet1.FieldByName('Fecha_Factura_co').AsString);
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TBusquedaCobros.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TBusquedaCobros.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresaBus.Text:=CodEmpresa;
     cEmpresaBus.SetFocus;
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TBusquedaCobros.cLupaClientesClick(Sender: TObject);
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
procedure TBusquedaCobros.cClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaClientesClick(Self);
end;

end.
