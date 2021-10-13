unit BClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, DBTables, StdCtrls, ComCtrls,
  ToolWin, Buttons, 
  Provider, DBClient, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinsdxBarPainter, dxBar, cxClasses, cxButtons,
  SimpleSearch;

type
  TBusquedaClientes = class(TForm)
    Query1: TQuery;
    DS: TDataSource;
    Timer1: TTimer;
    PanelDatos: TPanel;
    QContar: TQuery;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
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
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    StaticText1: TStaticText;
    tNomEmpresa: TPanel;
    cCodigoBus: TEdit;
    cEmpresaBus: TEdit;
    cNombreJuriBus: TEdit;
    cNifBus: TEdit;
    cNombreComerBus: TEdit;
    GridLineas: TDBGrid;
    cLupaEmpresas: TSimpleSearch;
    BarraEstado: TStatusBar;
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
    procedure cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaEmpresasClick(Sender: TObject);
    
  private
    { Private declarations }
    TextoSql: String;
    PosRegistro, NRegistros: Integer;
    procedure Mensaje(Texto: String );
    procedure BotonesPosicion;

  public
       { Public declarations }
       EmpresaBus, CodigoBus: String;
       WhereBus: String;
       EmpresaParam: String;
       AceptarTodos: Boolean;
       function EjecutarQuery(): Boolean;
  end;

var
   BusquedaClientes: TBusquedaClientes;

implementation

uses MBaseDatos, UGLobal;

{$R *.dfm}

//----------------------- BOTON NUEVA BUSQUEDA ---------------------------------
procedure TBusquedaClientes.NuevaBusqueda(Sender: TObject);
begin
     Self.Height:=263;
     Self.width:=521;
     GridLineas.TabStop:=False;
     PanelDatos.Enabled:=False;
     PanelDatos.Visible:=False;
     PanelClaves.Visible:=True;
     Query1.Close;
     ClientDataSet1.Close;
     cEmpresaBus.Text:=EmpresaParam;
     if EmpresaParam<>'' then
        cEmpresaBus.ReadOnly:=True;
     cCodigoBus.Text:='';
     cCodigoBus.SetFocus;
     cNombreJuriBus.Text:='';
     cNombreComerBus.Text:='';
     cNifBus.Text:='';

     NRegistros:=0;
     PosRegistro:=0;
     BotonesPosicion();
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TBusquedaClientes.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then  //F5 aceptar
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TBusquedaClientes.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TBusquedaClientes.Aceptar(Sender: TObject);
begin
     if not ClientDataSet1.Active then
     begin
          if EjecutarQuery() then
          begin
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
             EmpresaBus:=ClientDataSet1.FieldByName('EMPRESA_C').AsString;
             CodigoBus:=ClientDataSet1.FieldByName('CODIGO_C').AsString;
          end;
          ModalResult:=mrOk;
     end;
end;

//-------------------------- EJECUTA LA QUERY DE FILTRO ------------------------
function TBusquedaClientes.EjecutarQuery():Boolean;
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
                    ' FROM CLIENTES ');
     if EmpresaParam<>'' then
     begin
          WhereBus:=' WHERE EMPRESA_C=' + QuotedStr(EmpresaParam);
          HayWhere:=True;
     end
     else if cEmpresaBus.Text<>'' then
     begin
          WhereBus:=' WHERE EMPRESA_C=' + QuotedStr(RellenarCeros(cEmpresaBus.Text,cEmpresaBus.MaxLength,'I'));
          HayWhere:=True;
     end;
     if cCodigoBus.Text<>'' then
     begin
          if HayWhere then
             WhereBus:=WhereBus + ' AND CODIGO_C=' + QuotedStr(RellenarCeros(cCodigoBus.Text, cCodigoBus.MaxLength,'I'))
          else
          begin
               WhereBus:=' WHERE CODIGO_C=' + QuotedStr(RellenarCeros(cCodigoBus.Text, cCodigoBus.MaxLength,'I'));
               HayWhere:=True;
          end;
     end;
     if cNombreJuriBus.Text<>'' then
     begin
          if HayWhere then
             WhereBus:=WhereBus + ' AND NOMBRE_JURIDICO_C LIKE' + QuotedStr('%' + StringReplace(cNombreJuriBus.Text,'*','%',[rfReplaceAll]) + '%')
          else
          begin
               WhereBus:=' WHERE NOMBRE_JURIDICO_C LIKE ' + QuotedStr('%' + StringReplace(cNombreJuriBus.Text,'*','%',[rfReplaceAll]) + '%');
               HayWhere:=True;
          end;
     end;
     if cNombreComerBus.Text<>'' then
     begin
          if HayWhere then
             WhereBus:=WhereBus + ' AND NOMBRE_COMERCIAL_C LIKE' + QuotedStr('%' + StringReplace(cNombreComerBus.Text,'*','%',[rfReplaceAll]) + '%')
          else
          begin
               WhereBus:=' WHERE NOMBRE_COMERCIAL_C LIKE ' + QuotedStr('%' + StringReplace(cNombreComerBus.Text,'*','%',[rfReplaceAll]) + '%');
               HayWhere:=True;
          end;
     end;
     if cNifBus.Text<>'' then
     begin
          if HayWhere then
             WhereBus:=WhereBus + ' AND CIF_DNI_C LIKE' + QuotedStr('%' + StringReplace(cNifBus.Text,'*','%',[rfReplaceAll]) + '%')
          else
              WhereBus:=' WHERE CIF_DNI_C LIKE ' + QuotedStr('%' + StringReplace(cNifBus.Text,'*','%',[rfReplaceAll]) + '%');
     end;
     Query1.SQL.Add(WhereBus);
     TextoSql:=Query1.SQL.Text;
     Query1.SQL.Add(' ORDER BY EMPRESA_C, CODIGO_C');
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
                          ' FROM CLIENTES ' +
                          WhereBus);
                  Open;
                  NRegistros:=FieldByName('NRegistros').AsInteger;  //Contamos los registros
                  PosRegistro:=1;
              end;
          finally
                 QContar.Close;
          end;
          Self.Height:=433;
          Result:=True;
     end
end;

//----------------------- BOTON CANCELAR ---------------------------------------
procedure TBusquedaClientes.Cancelar(Sender: TObject);
begin
     ModalResult:=mrCancel;
end;

//----------------------------- DOBLE CLICK EN EL GRID -------------------------
procedure TBusquedaClientes.GridLineasDblClick(Sender: TObject);
begin
     EmpresaBus:=ClientDataSet1.FieldByName('EMPRESA_C').AsString;
     CodigoBus:=ClientDataSet1.FieldByName('CODIGO_C').AsString;
     ModalResult:=mrOk;
end;

//--------------------- MENSAJES DE LA BARRA DE ESTADO -------------------------
procedure TBusquedaClientes.Mensaje(Texto: String );
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
procedure TBusquedaClientes.Timer1Timer(Sender: TObject);
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
procedure TBusquedaClientes.FormCreate(Sender: TObject);
begin
     PosRegistro:=0;
     NRegistros:=0;
end;

//----------------------- ORDENACION DE LOS DATOS DEL GRID ---------------------
procedure TBusquedaClientes.GridLineasTitleClick(Column: TColumn);
begin
     ClientDataSet1.Close;
     Query1.Close;
     Query1.SQL.Clear;
     Query1.SQL.Add(TextoSql +
                    ' ORDER BY ' + Column.FieldName);
     Query1.Open;
     ClientDataSet1.Open;
end;

//---------------------- PONE EL COLOR DEL FOCO --------------------------------
procedure TBusquedaClientes.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clMoneyGreen;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TBusquedaClientes.ColorExit(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          TEdit(Sender).Color:=clWindow;
          if Length(TEdit(Sender).Text)>0 then
             TEdit(Sender).Text:=RellenarCeros(TEdit(Sender).Text,TEdit(Sender).MaxLength,'I');
     end;
end;

//----------------------- CAMBIO DE LA EMPRESA ---------------------------------
procedure TBusquedaClientes.cEmpresaBusChange(Sender: TObject);
begin
     tNomEmpresa.Caption:=NomEmpresa(RellenarCeros(cEmpresaBus.Text,cEmpresaBus.MaxLength,'I'));
end;

//-------------------------- PRIMER REGISTRO -----------------------------------
procedure TBusquedaClientes.Primero(Sender: TObject);
begin
     ClientDataSet1.First;
end;

//-------------------------- REGISTRO ANTERIOR ---------------------------------
procedure TBusquedaClientes.Anterior(Sender: TObject);
begin
     ClientDataSet1.Prior;
end;

//-------------------------- REGISTRO SIGUIENTE --------------------------------
procedure TBusquedaClientes.Siguiente(Sender: TObject);
begin
     ClientDataSet1.Next;
end;

//-------------------------- ULTIMO REGISTRO -----------------------------------
procedure TBusquedaClientes.Ultimo(Sender: TObject);
begin
     ClientDataSet1.Last;
end;

//-------------- HABILITAR BOTONES DE POSICION DE REGISTRO ---------------------
procedure TBusquedaClientes.BotonesPosicion;
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
procedure TBusquedaClientes.ClientDataSet1AfterScroll(DataSet: TDataSet);
begin
     PosRegistro:=ClientDataSet1.RecNo;
     BotonesPosicion();
end;

procedure TBusquedaClientes.FormActivate(Sender: TObject);
begin
     cEmpresaBus.Text:=EmpresaParam;

     if ClientDataSet1.Active then
     begin
          PanelClaves.Visible:=False;
          PanelDatos.Enabled:=True;
          PanelDatos.Visible:=True;
          GridLineas.TabStop:=True;
          GridLineas.SetFocus;

          BotonesPosicion();
     end
     else
     begin
          Self.Height:=263;
          Self.width:=521;
          GridLineas.TabStop:=False;
          PanelDatos.Enabled:=False;
          PanelDatos.Visible:=False;
          PanelClaves.Visible:=True;
          cCodigoBus.SetFocus;
     end;
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TBusquedaClientes.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TBusquedaClientes.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresaBus.Text:=CodEmpresa;
     cEmpresaBus.SetFocus;
end;


end.
