unit BUnidadesMedida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, DBTables, StdCtrls, ComCtrls,
  ToolWin, Buttons,
  Provider, DBClient, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
  TBusquedaUnidadesMedida = class(TForm)
    Query1: TQuery;
    DS: TDataSource;
    Timer1: TTimer;
    PanelDatos: TPanel;
    GridLineas: TDBGrid;
    QContar: TQuery;
    BarraEstado: TStatusBar;
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
    Label1: TLabel;
    StaticText2: TStaticText;
    cEmpresaBus: TEdit;
    cCodigoBus: TEdit;
    tNomEmpresa: TPanel;
    cLupaEmpresas: TSimpleSearch;
    procedure NuevaBusqueda(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Aceptar(Sender: TObject);
    procedure Cancelar(Sender: TObject);
    procedure GridLineasDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure GridLineasTitleClick(Column: TColumn);
    procedure cEmpresaBusChange(Sender: TObject);
    procedure ColorEnter(Sender: TObject);
    procedure ColorExit(Sender: TObject);
    procedure Primero(Sender: TObject);
    procedure Anterior(Sender: TObject);
    procedure Siguiente(Sender: TObject);
    procedure Ultimo(Sender: TObject);
    procedure ClientDataSet1AfterScroll(DataSet: TDataSet);
    procedure cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaEmpresasClick(Sender: TObject);

  private
     TextoSql: String;
     PosRegistro, NRegistros: Integer;
     { Private declarations }
     procedure Mensaje(Texto: String );
     procedure BotonesPosicion;    

  public
       { Public declarations }
       EmpresaBus, CodigoBus: String;
       WhereBus: String;
       EmpresaParam: String;
       AceptarTodos: Boolean;
       function EjecutarQuery():Boolean;
  end;

var
   BusquedaUnidadesMedida: TBusquedaUnidadesMedida;

implementation

uses MBaseDatos, UGLobal;

{$R *.dfm}

//----------------------- BOTON NUEVA BUSQUEDA ---------------------------------
procedure TBusquedaUnidadesMedida.NuevaBusqueda(Sender: TObject);
begin
     Self.Height:=187;
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
     NRegistros:=0;
     PosRegistro:=0;
     BotonesPosicion();
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TBusquedaUnidadesMedida.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then  //F5 aceptar
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TBusquedaUnidadesMedida.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TBusquedaUnidadesMedida.Aceptar(Sender: TObject);
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
               ClientDataset1.Close;
          end;
          BotonesPosicion();
     end
     else
     begin
          if not AceptarTodos then
          begin
               EmpresaBus:=ClientDataSet1.FieldByName('EMPRESA_U').AsString;
               CodigoBus:=ClientDataSet1.FieldByName('CODIGO_U').AsString;
          end;
          ModalResult:=mrOk;
     end;
end;

//-------------------------- EJECUTA LA QUERY DE FILTRO ------------------------
function TBusquedaUnidadesMedida.EjecutarQuery():Boolean;
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
                    ' FROM UNIDADES ');
     if cEmpresaBus.Text<>'' then
     begin
          WhereBus:=' WHERE EMPRESA_U=' + QuotedStr(cEmpresaBus.Text);
          HayWhere:=True;
     end;
     if cCodigoBus.Text<>'' then
     begin
          if HayWhere then
             WhereBus:=WhereBus + ' AND CODIGO_U=' + QuotedStr(cCodigoBus.Text)
          else
              WhereBus:=' WHERE CODIGO_U=' + QuotedStr(cCodigoBus.Text);
     end;
     Query1.SQL.Add(WhereBus);
     TextoSql:=Query1.SQL.Text;
     Query1.SQL.Add(' ORDER BY EMPRESA_U, CODIGO_U');
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
                          ' FROM UNIDADES ' +
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
procedure TBusquedaUnidadesMedida.Cancelar(Sender: TObject);
begin
     ModalResult:=mrCancel;
end;

//----------------------------- DOBLE CLICK EN EL GRID -------------------------
procedure TBusquedaUnidadesMedida.GridLineasDblClick(Sender: TObject);
begin
     EmpresaBus:=ClientDataSet1.FieldByName('EMPRESA_U').AsString;
     CodigoBus:=ClientDataSet1.FieldByName('CODIGO_U').AsString;
     ModalResult:=mrOk;
end;

//--------------------- MENSAJES DE LA BARRA DE ESTADO -------------------------
procedure TBusquedaUnidadesMedida.Mensaje(Texto: String );
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
procedure TBusquedaUnidadesMedida.Timer1Timer(Sender: TObject);
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
procedure TBusquedaUnidadesMedida.FormCreate(Sender: TObject);
begin
     Self.Height:=187;
     Self.width:=470;
end;

//------------------------ ACTIVACION DEL FORMULARIO ---------------------------
procedure TBusquedaUnidadesMedida.FormActivate(Sender: TObject);
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
         cCodigoBus.SetFocus;
end;

//----------------------- ORDENACION DE LOS DATOS DEL GRID ---------------------
procedure TBusquedaUnidadesMedida.GridLineasTitleClick(Column: TColumn);
begin
     ClientDataSet1.Close;
     Query1.Close;
     Query1.SQL.Clear;
     Query1.SQL.Add(TextoSql +
                    ' ORDER BY ' + Column.FieldName);
     Query1.Open;
     ClientDataSet1.Open;
end;

//----------------------- CAMBIO DE LA EMPRESA ---------------------------------
procedure TBusquedaUnidadesMedida.cEmpresaBusChange(Sender: TObject);
begin
     tNomEmpresa.Caption:=NomEmpresa(RellenarCeros(cEmpresaBus.Text,cEmpresaBus.MaxLength,'I'));
end;

//---------------------- PONE EL COLOR DEL FOCO --------------------------------
procedure TBusquedaUnidadesMedida.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clMoneyGreen;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TBusquedaUnidadesMedida.ColorExit(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          TEdit(Sender).Color:=clWindow;
          if Length(TEdit(Sender).Text)>0 then
             TEdit(Sender).Text:=RellenarCeros(TEdit(Sender).Text,TEdit(Sender).MaxLength,'I');
     end;
end;

//-------------------------- PRIMER REGISTRO -----------------------------------
procedure TBusquedaUnidadesMedida.Primero(Sender: TObject);
begin
     ClientDataSet1.First;
end;

//-------------------------- REGISTRO ANTERIOR ---------------------------------
procedure TBusquedaUnidadesMedida.Anterior(Sender: TObject);
begin
     ClientDataSet1.Prior;
end;

//-------------------------- REGISTRO SIGUIENTE --------------------------------
procedure TBusquedaUnidadesMedida.Siguiente(Sender: TObject);
begin
     ClientDataSet1.Next;
end;

//-------------------------- ULTIMO REGISTRO -----------------------------------
procedure TBusquedaUnidadesMedida.Ultimo(Sender: TObject);
begin
     ClientDataSet1.Last;
end;

//-------------- HABILITAR BOTONES DE POSICION DE REGISTRO ---------------------
procedure TBusquedaUnidadesMedida.BotonesPosicion;
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
procedure TBusquedaUnidadesMedida.ClientDataSet1AfterScroll(DataSet: TDataSet);
begin
     PosRegistro:=ClientDataSet1.RecNo;
     BotonesPosicion();
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TBusquedaUnidadesMedida.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TBusquedaUnidadesMedida.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresaBus.Text:=CodEmpresa;
     cEmpresaBus.SetFocus;
end;

end.
