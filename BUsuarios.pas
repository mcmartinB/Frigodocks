unit BUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, DBTables, StdCtrls, ComCtrls,
  ToolWin, Buttons, 
  Provider, DBClient, dxSkinsCore, dxSkinBlue, dxSkinsdxBarPainter, dxBar,
  cxClasses;

type
  TBusquedaUsuarios = class(TForm)
    PanelClaves: TPanel;
    Query1: TQuery;
    DS: TDataSource;
    Timer1: TTimer;
    PanelDatos: TPanel;
    GridLineas: TDBGrid;
    StaticText1: TStaticText;
    cCodigoBus: TEdit;
    QContar: TQuery;
    BarraEstado: TStatusBar;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    StaticText3: TStaticText;
    cTipoUsuarioBus: TComboBox;
    StaticText2: TStaticText;
    cPasswordBus: TEdit;
    ClientDataSet1codigo_u: TStringField;
    ClientDataSet1password_u: TStringField;
    ClientDataSet1tipo_u: TStringField;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    bNuevaBusqueda: TdxBarButton;
    bPrimero: TdxBarButton;
    bAnterior: TdxBarButton;
    bSiguiente: TdxBarButton;
    bUltimo: TdxBarButton;
    bAceptar: TdxBarButton;
    bCancelar: TdxBarButton;
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
    procedure ColorExitSinCeros(Sender: TObject);
    procedure Primero(Sender: TObject);
    procedure Anterior(Sender: TObject);
    procedure Siguiente(Sender: TObject);
    procedure Ultimo(Sender: TObject);
    procedure ClientDataSet1AfterScroll(DataSet: TDataSet);

  private
    { Private declarations }
    TextoSql: String;
    PosRegistro, NRegistros: Integer;
    procedure Mensaje(Texto: String );
    procedure BotonesPosicion;

  public
       { Public declarations }
       CodigoBus: String;
       WhereBus: String;
  end;

var
   BusquedaUsuarios: TBusquedaUsuarios;

implementation

uses MBaseDatos, UGLobal;

{$R *.dfm}

//----------------------- BOTON NUEVA BUSQUEDA ---------------------------------
procedure TBusquedaUsuarios.NuevaBusqueda(Sender: TObject);
begin
     GridLineas.TabStop:=False;
     PanelDatos.Enabled:=False;
     PanelDatos.Visible:=False;
     PanelClaves.Visible:=True;
     Query1.Close;
     ClientDataSet1.Close;
     cCodigoBus.SetFocus;
     cCodigoBus.Text:='';
     NRegistros:=0;
     PosRegistro:=0;
     BotonesPosicion();
     Height:=220;
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TBusquedaUsuarios.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then  //F5 aceptar
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TBusquedaUsuarios.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TBusquedaUsuarios.Aceptar(Sender: TObject);
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
                         ' FROM USUARIOS ');
          if cCodigoBus.Text<>'' then
          begin
               WhereBus:=' WHERE CODIGO_U=' + QuotedStr(cCodigoBus.Text);
               HayWhere:=True;
          end;
          if cPasswordBus.Text<>'' then
          begin
               if HayWhere then
                  WhereBus:=WhereBus + ' AND PASSWORD_U=' + QuotedStr(cPasswordBus.Text)
               else
               begin
                    WhereBus:=' WHERE PASSWORD_U=' + QuotedStr(cPasswordBus.Text);
                    HayWhere:=True;
               end;
          end;
          if cTipoUsuarioBus.Text<>'' then
          begin
               if HayWhere then
                  WhereBus:=WhereBus + ' AND TIPO_U=' + QuotedStr(Copy(cTipoUsuarioBus.Text,1,1))
               else
                   WhereBus:=' WHERE TIPO_U=' + QuotedStr(Copy(cTipoUsuarioBus.Text,1,1));
          end;
          Query1.SQL.Add(WhereBus);
          TextoSql:=Query1.SQL.Text;
          Query1.SQL.Add(' ORDER BY CODIGO_U');
          Query1.Open;
          if not Query1.IsEmpty then
          begin
               ClientDataSet1.Open;
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
                               ' FROM USUARIOS ' +
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
procedure TBusquedaUsuarios.Cancelar(Sender: TObject);
begin
     ModalResult:=mrCancel;
end;

//----------------------------- DOBLE CLICK EN EL GRID -------------------------
procedure TBusquedaUsuarios.GridLineasDblClick(Sender: TObject);
begin
     CodigoBus:=ClientDataSet1.FieldByName('Codigo_u').AsString;
     ModalResult:=mrOk;
end;

//--------------------- MENSAJES DE LA BARRA DE ESTADO -------------------------
procedure TBusquedaUsuarios.Mensaje(Texto: String );
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
procedure TBusquedaUsuarios.Timer1Timer(Sender: TObject);
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
procedure TBusquedaUsuarios.FormCreate(Sender: TObject);
begin
     Height:=220;
     PosRegistro:=0;
     NRegistros:=0;
end;

//----------------------- ORDENACION DE LOS DATOS DEL GRID ---------------------
procedure TBusquedaUsuarios.GridLineasTitleClick(Column: TColumn);
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
procedure TBusquedaUsuarios.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clMoneyGreen;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TBusquedaUsuarios.ColorExit(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clWindow
     else if Sender is TComboBox then           //Si el componente es un TComboBox
             TComboBox(Sender).Color:=clWindow;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TBusquedaUsuarios.ColorExitSinCeros(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clWindow
     else if Sender is TComboBox then  //Si el componente es un TComboBox
             TComboBox(Sender).Color:=clWindow;
end;

//-------------------------- PRIMER REGISTRO -----------------------------------
procedure TBusquedaUsuarios.Primero(Sender: TObject);
begin
     ClientDataSet1.First;
end;

//-------------------------- REGISTRO ANTERIOR ---------------------------------
procedure TBusquedaUsuarios.Anterior(Sender: TObject);
begin
     ClientDataSet1.Prior;
end;

//-------------------------- REGISTRO SIGUIENTE --------------------------------
procedure TBusquedaUsuarios.Siguiente(Sender: TObject);
begin
     ClientDataSet1.Next;
end;

//-------------------------- ULTIMO REGISTRO -----------------------------------
procedure TBusquedaUsuarios.Ultimo(Sender: TObject);
begin
     ClientDataSet1.Last;
end;

//-------------- HABILITAR BOTONES DE POSICION DE REGISTRO ---------------------
procedure TBusquedaUsuarios.BotonesPosicion;
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
procedure TBusquedaUsuarios.ClientDataSet1AfterScroll(DataSet: TDataSet);
begin
     PosRegistro:=ClientDataSet1.RecNo;
     BotonesPosicion();
end;

end.
