 unit BPeriodicosFact;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, DBTables, StdCtrls, ComCtrls,
  ToolWin, Buttons, 
  DBClient, Provider, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
  dxSkinsdxBarPainter, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxButtons, SimpleSearch, dxBar, cxClasses;

type
  TBusquedaPeriodicos = class(TForm)
    Query1: TQuery;
    DS: TDataSource;
    Timer1: TTimer;
    PanelDatos: TPanel;
    GridLineas: TDBGrid;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    BarraEstado: TStatusBar;
    ClientDataSet1empresa_pf: TStringField;
    ClientDataSet1cliente_pf: TStringField;
    ClientDataSet1tarifa_pf: TStringField;
    ClientDataSet1horas1_pf: TFloatField;
    ClientDataSet1horas2_pf: TFloatField;
    ClientDataSet1importe_thermoking_pf: TFloatField;
    ClientDataSet1kw_thermoking_pf: TIntegerField;
    ClientDataSet1importe_oficina_pf: TFloatField;
    ClientDataSet1gastos_administra_pf: TFloatField;
    ClientDataSet1otros_servicios_pf: TFloatField;
    ClientDataSet1status_factura_pf: TStringField;
    ClientDataSet1texto1_pf: TStringField;
    ClientDataSet1texto2_pf: TStringField;
    ClientDataSet1concepto2a_pf: TStringField;
    ClientDataSet1concepto2b_pf: TStringField;
    ClientDataSet1importe_concepto2_pf: TFloatField;
    ClientDataSet1concepto3a_pf: TStringField;
    ClientDataSet1concepto3b_pf: TStringField;
    ClientDataSet1importe_concepto3_pf: TFloatField;
    ClientDataSet1horas_clima_pf: TFloatField;
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
    cEmpresaBus: TEdit;
    StaticText12: TStaticText;
    cClienteBus: TEdit;
    StaticText1: TStaticText;
    tNomEmpresa: TPanel;
    tNomcliente: TPanel;
    cLupaEmpresas: TSimpleSearch;
    cLupaClilentes: TSimpleSearch;
    procedure NuevaBusqueda(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Aceptar(Sender: TObject);
    procedure Cancelar(Sender: TObject);
    procedure GridLineasDblClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure cEmpresaBusChange(Sender: TObject);
    procedure cClienteBusChange(Sender: TObject);
    procedure ColorEnter(Sender: TObject);
    procedure ColorExit(Sender: TObject);
    procedure GridLineasTitleClick(Column: TColumn);
    procedure Primero(Sender: TObject);
    procedure Anterior(Sender: TObject);
    procedure Siguiente(Sender: TObject);
    procedure Ultimo(Sender: TObject);
    procedure ClientDataSet1AfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaEmpresasClick(Sender: TObject);
    procedure cLupaClientesClick(Sender: TObject);
    procedure cClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    
  private
    { Private declarations }
    TextoSql: String;
    PosRegistro, NRegistros: Integer;
    procedure Mensaje(Texto: String );
    procedure BotonesPosicion;
  public
       { Public declarations }
       EmpresaBus, ClienteBus: String;
       AceptarTodos: Boolean;
  end;

var
   BusquedaPeriodicos: TBusquedaPeriodicos;

implementation

uses MBaseDatos, UGLobal;

{$R *.dfm}

//----------------------- BOTON NUEVA BUSQUEDA ---------------------------------
procedure TBusquedaPeriodicos.NuevaBusqueda(Sender: TObject);
begin
     Self.Height:=182;
     GridLineas.TabStop:=False;
     PanelDatos.Enabled:=False;
     PanelDatos.Visible:=False;
     PanelClaves.Visible:=True;
     Query1.Close;
     ClientDataSet1.Close;
     cEmpresaBus.Text:=EmpresaGlobal;
     cClienteBus.Text:='';
     cClienteBus.SetFocus;
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TBusquedaPeriodicos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then  //F5 aceptar
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TBusquedaPeriodicos.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13 then  //Enter
     begin
          if (GridLineas.Focused) and (not ClientDataSet1.IsEmpty) then  //Foco en el Grid y existen datos
          begin
               GridLineasDblClick(Self);
               ModalResult:=mrOk;
          end
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
procedure TBusquedaPeriodicos.Aceptar(Sender: TObject);
Var
   HayWhere: Boolean;
begin
     HayWhere:=False;
     if not ClientDataSet1.Active then
     begin
          TextoSql:='';
          Query1.SQL.Clear;
          Query1.SQL.Add(' SELECT * ' +
                         ' FROM PERIODICOS_FACTURACION ');
          if cEmpresaBus.Text<>'' then
          begin
               Query1.SQL.Add(' WHERE EMPRESA_PF=' + QuotedStr(cEmpresaBus.Text));
               HayWhere:=True;
          end;
          if cClienteBus.Text<>'' then
          begin
               if HayWhere then
                  Query1.SQL.Add(' AND CLIENTE_PF=' + QuotedStr(cClienteBus.Text))
               else
                   Query1.SQL.Add(' WHERE CLIENTE_PF=' + QuotedStr(cClienteBus.Text));
          end;
          TextoSql:=Query1.SQL.Text;
          Query1.SQL.Add(' ORDER BY EMPRESA_PF, CLIENTE_PF');
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
          end
          else
          begin
               Mensaje('No existen datos');
               Query1.Close;
               ClientDataSet1.Close;
          end;
     end
     else
     begin
          if not AceptarTodos then
          begin
               EmpresaBus:=cEmpresaBus.Text;
               ClienteBus:=cClienteBus.Text;
          end;
          ModalResult:=mrOk;
     end;
end;

//----------------------- BOTON CANCELAR ---------------------------------------
procedure TBusquedaPeriodicos.Cancelar(Sender: TObject);
begin
     ModalResult:=mrCancel;
end;

//----------------------------- DOBLE CLICK EN EL GRID -------------------------
procedure TBusquedaPeriodicos.GridLineasDblClick(Sender: TObject);
begin
     EmpresaBus:=ClientDataSet1.FieldByName('EMPRESA_PF').AsString;
     ClienteBus:=ClientDataSet1.FieldByName('CLIENTE_PF').AsString;
     ModalResult:=mrOk;
end;

//--------------------- MENSAJES DE LA BARRA DE ESTADO -------------------------
procedure TBusquedaPeriodicos.Mensaje(Texto: String );
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
procedure TBusquedaPeriodicos.Timer1Timer(Sender: TObject);
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

//------------------------ CAMBIA LA EMPRESA -----------------------------------
procedure TBusquedaPeriodicos.cEmpresaBusChange(Sender: TObject);
Var
   Empresa: String;
begin
     Empresa:=RellenarCeros(cEmpresaBus.Text,cEmpresaBus.MaxLength,'I');

     tNomEmpresa.Caption:=NomEmpresa(Empresa);
     tNomCliente.Caption:=NomCliente(Empresa,cClienteBus.Text);
end;

//------------------------- CAMBIA EL CLIENTE ----------------------------------
procedure TBusquedaPeriodicos.cClienteBusChange(Sender: TObject);
begin
     tNomCliente.Caption:=NomCliente(cEmpresaBus.Text,RellenarCeros(cClienteBus.Text,cClienteBus.MaxLength,'I'));
end;

//---------------------- PONE EL COLOR DE FOCO DE LOS CAMPOS CLAVES ------------
procedure TBusquedaPeriodicos.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clMoneyGreen;
end;

//---------------------- QUITA EL COLOR DE FOCO DE LOS CAMPOS CLAVE ------------
procedure TBusquedaPeriodicos.ColorExit(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          TEdit(Sender).Color:=clWindow;
          if Length(TEdit(Sender).Text)>0 then
             TEdit(Sender).Text:=RellenarCeros(TEdit(Sender).Text,TEdit(Sender).MaxLength,'I');
     end;
end;

//----------------------- ORDENACION DE LOS DATOS DEL GRID ---------------------
procedure TBusquedaPeriodicos.GridLineasTitleClick(Column: TColumn);
begin
     ClientDataSet1.Close;
     Query1.Close;
     Query1.SQL.Clear;
     Query1.SQL.Add(TextoSql +
                    ' ORDER BY ' + Column.FieldName);
     Query1.Open;
     ClientDataSet1.Open;
end;

//-------------------------- PRIMER REGISTRO -----------------------------------
procedure TBusquedaPeriodicos.Primero(Sender: TObject);
begin
     ClientDataSet1.First;
end;

//-------------------------- REGISTRO ANTERIOR ---------------------------------
procedure TBusquedaPeriodicos.Anterior(Sender: TObject);
begin
     ClientDataSet1.Prior;
end;

//-------------------------- REGISTRO SIGUIENTE --------------------------------
procedure TBusquedaPeriodicos.Siguiente(Sender: TObject);
begin
     ClientDataSet1.Next;
end;

//-------------------------- ULTIMO REGISTRO -----------------------------------
procedure TBusquedaPeriodicos.Ultimo(Sender: TObject);
begin
     ClientDataSet1.Last;
end;

//-------------- HABILITAR BOTONES DE POSICION DE REGISTRO ---------------------
procedure TBusquedaPeriodicos.BotonesPosicion;
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
procedure TBusquedaPeriodicos.ClientDataSet1AfterScroll(DataSet: TDataSet);
begin
     PosRegistro:=ClientDataSet1.RecNo;
     NRegistros:=ClientDataSet1.RecordCount;
     BotonesPosicion();
end;


procedure TBusquedaPeriodicos.FormCreate(Sender: TObject);
begin
     Self.Height:=182;
     Self.width:=700;
     PosRegistro:=0;
     NRegistros:=0;
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TBusquedaPeriodicos.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TBusquedaPeriodicos.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresaBus.Text:=CodEmpresa;
     cEmpresaBus.Setfocus;
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TBusquedaPeriodicos.cLupaClientesClick(Sender: TObject);
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
procedure TBusquedaPeriodicos.cClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaClientesClick(Self);
end;

procedure TBusquedaPeriodicos.FormActivate(Sender: TObject);
begin
     cEmpresaBus.Text:=EmpresaGlobal;
     cClienteBus.SetFocus;
end;

end.
