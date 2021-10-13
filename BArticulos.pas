unit BArticulos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, DBTables, StdCtrls, ComCtrls,
  ToolWin, Buttons, 
  kbmMemTable, Provider, DBClient, 
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  dxSkinXmas2008Blue, cxButtons, SimpleSearch, dxSkinsdxBarPainter, dxBar,
  cxClasses;

type
  TBusquedaArticulos = class(TForm)
    Query1: TQuery;
    DS: TDataSource;
    Timer1: TTimer;
    PanelDatos: TPanel;
    GridLineas: TDBGrid;
    QContar: TQuery;
    BarraEstado: TStatusBar;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
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
    Label3: TLabel;
    StaticText1: TStaticText;
    cEmpresaBus: TEdit;
    tNomEmpresa: TPanel;
    StaticText13: TStaticText;
    cFamiliaBus: TEdit;
    tNomFamilia: TPanel;
    cDenominacionBus: TEdit;
    StaticText2: TStaticText;
    cCodigoBus: TEdit;
    cLupaFamilias: TSimpleSearch;
    cLupaEmpresas: TSimpleSearch;
    procedure NuevaBusqueda(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Aceptar(Sender: TObject);
    procedure Cancelar(Sender: TObject);
    procedure GridLineasDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
    procedure FormActivate(Sender: TObject);
    procedure cFamiliaBusChange(Sender: TObject);
    procedure cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaEmpresasClick(Sender: TObject);
    procedure cLupaFamiliasClick(Sender: TObject);
    procedure cFamiliaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    TextoSql: String;
    PosRegistro, NRegistros: Integer;
    procedure Mensaje(Texto: String );
    procedure BotonesPosicion;

  public
       { Public declarations }
       EmpresaBus, FamiliaBus, CodigoBus: String;
       WhereBus: String;
       EmpresaParam, FamiliaParam: String;
       AceptarTodos: Boolean;

       function EjecutarQuery(): Boolean;
  end;

var
   BusquedaArticulos: TBusquedaArticulos;

implementation

uses MBaseDatos, UGLobal, BFamilias;

{$R *.dfm}

//----------------------- BOTON NUEVA BUSQUEDA ---------------------------------
procedure TBusquedaArticulos.NuevaBusqueda(Sender: TObject);
begin
     Self.Height:=237;
     GridLineas.TabStop:=False;
     PanelDatos.Visible:=False;
     PanelDatos.Visible:=False;
     PanelClaves.Visible:=True;
     Query1.Close;
     ClientDataset1.Close;
     cEmpresaBus.Text:=EmpresaParam;
     if EmpresaParam<>'' then
        cEmpresaBus.ReadOnly:=True;
     //cFamiliaBus.Text:=FamiliaParam;
     //if FamiliaParam<>'' then
     //   cFamiliaBus.ReadOnly:=True;
     cDenominacionBus.SetFocus;
     cCodigoBus.Text:='';
     cDenominacionBus.Text:='';
     NRegistros:=0;
     PosRegistro:=0;
     BotonesPosicion();
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TBusquedaArticulos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then  //F5 aceptar
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TBusquedaArticulos.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13 then  //Enter
     begin
          if (GridLineas.Focused) and (not ClientDataset1.IsEmpty) then  //Foco en el Grid y existen datos
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
procedure TBusquedaArticulos.Aceptar(Sender: TObject);
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
               EmpresaBus:=ClientDataSet1.FieldByName('EMPRESA_A').AsString;
               FamiliaBus:=ClientDataSet1.FieldByName('FAMILIA_A').AsString;
               CodigoBus:=ClientDataSet1.FieldByName('CODIGO_A').AsString;
          end;
          ModalResult:=mrOk;
     end;
end;

//-------------------------- EJECUTA LA QUERY DE FILTRO ------------------------
function TBusquedaArticulos.EjecutarQuery(): Boolean;
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
                    ' FROM ARTICULOS ');
     if EmpresaParam<>'' then
     begin
          WhereBus:=' WHERE EMPRESA_A=' + QuotedStr(EmpresaParam);
          HayWhere:=True;
     end
     else if cEmpresaBus.Text<>'' then
     begin
          WhereBus:=' WHERE EMPRESA_A=' + QuotedStr(RellenarCeros(cEmpresaBus.Text, cEmpresaBus.MaxLength,'I'));
          HayWhere:=True;
     end;
     if cFamiliaBus.Text<>'' then
     begin
          if HayWhere then
             WhereBus:=WhereBus + ' AND FAMILIA_A=' + QuotedStr(RellenarCeros(cFamiliaBus.Text, cFamiliaBus.MaxLength,'I'))
          else
          begin
               WhereBus:=' WHERE FAMILIA_A=' + QuotedStr(RellenarCeros(cFamiliaBus.Text, cFamiliaBus.MaxLength,'I'));
               HayWhere:=True;
          end;
     end;
     if cCodigoBus.Text<>'' then
     begin
          if HayWhere then
             WhereBus:=WhereBus + ' AND CODIGO_A=' + QuotedStr(RellenarCeros(cCodigoBus.Text, cCodigoBus.MaxLength,'I') )
          else
          begin
               WhereBus:=' WHERE CODIGO_A=' + QuotedStr(RellenarCeros(cCodigoBus.Text, cCodigoBus.MaxLength,'I'));
               HayWhere:=True;
          end;
     end;
     if cDenominacionBus.Text<>'' then
     begin
          if HayWhere then
             WhereBus:=WhereBus + ' AND DENOMINACION_A LIKE' + QuotedStr(StringReplace(cDenominacionBus.Text,'*','%',[rfReplaceAll]))
          else
              WhereBus:=' WHERE DENOMINACION_A LIKE ' + QuotedStr(StringReplace(cDenominacionBus.Text,'*','%',[rfReplaceAll]));
     end;
     Query1.SQL.Add(WhereBus);
     TextoSql:=Query1.SQL.Text;
     Query1.SQL.Add(' ORDER BY DENOMINACION_A');
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
                          ' FROM ARTICULOS ' +
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
     end;
end;

//----------------------- BOTON CANCELAR ---------------------------------------
procedure TBusquedaArticulos.Cancelar(Sender: TObject);
begin
     ModalResult:=mrCancel;
end;

//----------------------------- DOBLE CLICK EN EL GRID -------------------------
procedure TBusquedaArticulos.GridLineasDblClick(Sender: TObject);
begin
     EmpresaBus:=ClientDataSet1.FieldByName('EMPRESA_A').AsString;
     FamiliaBus:=ClientDataSet1.FieldByName('FAMILIA_A').AsString;
     CodigoBus:=ClientDataSet1.FieldByName('CODIGO_A').AsString;
     ModalResult:=mrOk;
end;

//--------------------- MENSAJES DE LA BARRA DE ESTADO -------------------------
procedure TBusquedaArticulos.Mensaje(Texto: String );
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
procedure TBusquedaArticulos.Timer1Timer(Sender: TObject);
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
procedure TBusquedaArticulos.FormCreate(Sender: TObject);
begin
     Self.Height:=237;
     PosRegistro:=0;
     NRegistros:=0;
end;

//----------------------- ORDENACION DE LOS DATOS DEL GRID ---------------------
procedure TBusquedaArticulos.GridLineasTitleClick(Column: TColumn);
begin
     ClientDataset1.Close;
     Query1.Close;
     Query1.SQL.Clear;
     Query1.SQL.Add(TextoSql +
                    ' ORDER BY ' + Column.FieldName);
     Query1.Open;
     ClientDataSet1.Open;
end;

//----------------------- CAMBIO DE LA EMPRESA ---------------------------------
procedure TBusquedaArticulos.cEmpresaBusChange(Sender: TObject);
Var
   Empresa: String;
begin
     Empresa:=RellenarCeros(cEmpresaBus.Text,cEmpresaBus.MaxLength,'I');

     tNomEmpresa.Caption:=NomEmpresa(Empresa);
     tNomFamilia.Caption:=NomFamilia(Empresa, cFamiliaBus.Text);
end;

//---------------------- PONE EL COLOR DE FOCO DE LOS CAMPOS CLAVES ------------
procedure TBusquedaArticulos.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clMoneyGreen;
end;

//---------------------- QUITA EL COLOR DE FOCO DE LOS CAMPOS CLAVE ------------
procedure TBusquedaArticulos.ColorExit(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          TEdit(Sender).Color:=clWindow;
          if Length(TEdit(Sender).Text)>0 then
             TEdit(Sender).Text:=RellenarCeros(TEdit(Sender).Text,TEdit(Sender).MaxLength,'I');
     end;
end;

//-------------------------- PRIMER REGISTRO -----------------------------------
procedure TBusquedaArticulos.Primero(Sender: TObject);
begin
     ClientDataset1.First;
end;

//-------------------------- REGISTRO ANTERIOR ---------------------------------
procedure TBusquedaArticulos.Anterior(Sender: TObject);
begin
     ClientDataset1.Prior;
end;

//-------------------------- REGISTRO SIGUIENTE --------------------------------
procedure TBusquedaArticulos.Siguiente(Sender: TObject);
begin
     ClientDataset1.Next;
end;

//-------------------------- ULTIMO REGISTRO -----------------------------------
procedure TBusquedaArticulos.Ultimo(Sender: TObject);
begin
     ClientDataset1.Last;
end;

//-------------- HABILITAR BOTONES DE POSICION DE REGISTRO ---------------------
procedure TBusquedaArticulos.BotonesPosicion;
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
procedure TBusquedaArticulos.ClientDataSet1AfterScroll(DataSet: TDataSet);
begin
     PosRegistro:=ClientDataSet1.RecNo;
     BotonesPosicion();
end;

//-------------------------- AL ACTIVAR EL FORMULARIO --------------------------
procedure TBusquedaArticulos.FormActivate(Sender: TObject);
begin
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
          cEmpresaBus.Text:=EmpresaParam;
          cDenominacionBus.SetFocus;
     end;
end;

//------------------------ AL CAMBIAR LA FAMILIA -------------------------------
procedure TBusquedaArticulos.cFamiliaBusChange(Sender: TObject);
begin
     tNomFamilia.Caption:=NomFamilia(cEmpresaBus.Text, RellenarCeros(cFamiliaBus.Text,cFamiliaBus.MaxLength,'I'));
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TBusquedaArticulos.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TBusquedaArticulos.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresaBus.Text:=CodEmpresa;
     cEmpresaBus.SetFocus;
end;

//-------------------------- LUPA DE FAMILIAS-----------------------------------
procedure TBusquedaArticulos.cLupaFamiliasClick(Sender: TObject);
Var
   Familia: String;
begin
     if cEmpresaBus.Text<>'' then
     begin
          Familia:=LupaFamilias(RellenarCeros(cEmpresaBus.Text,cEmpresaBus.MaxLength,'I'));
          if Familia<>'' then
             cFamiliaBus.Text:=Familia;
          cFamiliaBus.SetFocus;
     end
     else
     begin
          MessageDlg (Chr(13) + 'Seleccione antes la empresa', mtError,[mbOk],0);
          cEmpresaBus.SetFocus;
     end;
end;

//-------------------------- LUPA (F2) DE FAMILIAS -----------------------------
procedure TBusquedaArticulos.cFamiliaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaFamiliasClick(Self);
end;

end.
