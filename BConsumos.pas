unit BConsumos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, DBTables, StdCtrls, ComCtrls,
  ToolWin,  Buttons,
  Provider, DBClient, Mask,  cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxCore,
  cxDateUtils, dxSkinsCore, dxSkinBlue, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, Menus, cxButtons, SimpleSearch, dxSkinsdxBarPainter, dxBar,
  cxClasses;

type
  TBusquedaConsumos = class(TForm)
    PanelClaves: TPanel;
    nbLabel5: TLabel;
    Query1: TQuery;
    DS: TDataSource;
    Timer1: TTimer;
    PanelDatos: TPanel;
    GridLineas: TDBGrid;
    StaticText1: TStaticText;
    tNomEmpresa: TPanel;
    cEmpresaBus: TEdit;
    QContar: TQuery;
    BarraEstado: TStatusBar;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    cClienteBus: TEdit;
    tNomcliente: TPanel;
    cLupaEmpresas: TSimpleSearch;
    cLupaClilentes: TSimpleSearch;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    bNuevaBusqueda: TdxBarButton;
    bPrimero: TdxBarButton;
    bAnterior: TdxBarButton;
    bSiguiente: TdxBarButton;
    bUltimo: TdxBarButton;
    bAceptar: TdxBarButton;
    bCancelar: TdxBarButton;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    cAnyoBus: TEdit;
    Label1: TLabel;
    Label4: TLabel;
    cMesBus: TEdit;
    ClientDataSet1empresa_cc: TStringField;
    ClientDataSet1cliente_cc: TStringField;
    ClientDataSet1anyo_cc: TIntegerField;
    ClientDataSet1mes_cc: TIntegerField;
    ClientDataSet1status_factura_cc: TStringField;
    ClientDataSet1numero_factura_cc: TIntegerField;
    ClientDataSet1fecha_factura_cc: TStringField;
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
    function  Validar():Boolean;
  public
       { Public declarations }
       EmpresaBus, ClienteBus: String;
       AnyoBus, MesBus: Integer;
       EmpresaOk, ClienteOK: String;
       AnyoOK, MesOK: Integer;
       WhereBus: String;
       TipoLote: String;
  end;

var
   BusquedaConsumos: TBusquedaConsumos;

implementation

uses MBaseDatos, UGLobal;

{$R *.dfm}

//----------------------- BOTON NUEVA BUSQUEDA ---------------------------------
procedure TBusquedaConsumos.NuevaBusqueda(Sender: TObject);
begin
     Self.Height:=296;
     Self.width:=500;
     GridLineas.TabStop:=False;
     PanelDatos.Enabled:=False;
     PanelDatos.Visible:=False;
     PanelClaves.Visible:=True;
     Query1.Close;
     ClientDataSet1.Close;
     cClienteBus.SetFocus;
     cEmpresaBus.Text:=EmpresaGlobal;
     cClienteBus.Text:='';
     cAnyoBus.Text:='';
     cMesBus.Text:='';
     NRegistros:=0;
     PosRegistro:=0;
     BotonesPosicion();
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TBusquedaConsumos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then  //F5 aceptar
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TBusquedaConsumos.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TBusquedaConsumos.Aceptar(Sender: TObject);
Var
   HayWhere: Boolean;
begin
     NRegistros:=0;
     PosRegistro:=0;
     HayWhere:=False;
     if not ClientDataSet1.Active then
     begin
          if Validar() then
          begin
               WhereBus:='';
               Query1.SQL.Clear;
               Query1.SQL.Add(' SELECT * ' +
                              ' FROM CABECERA_CONSUMOS ');
               if cEmpresaBus.Text<>'' then
               begin
                    WhereBus:=' WHERE ( EMPRESA_CC=' + QuotedStr(RellenarCeros(cEmpresaBus.Text, cEmpresaBus.MaxLength, 'I'));
                    HayWhere:=True;
               end;
               if cClienteBus.Text<>'' then
               begin
                    if HayWhere then
                       WhereBus:=WhereBus + ' AND CLIENTE_CC=' + QuotedStr(RellenarCeros(cClienteBus.Text, cClienteBus.MaxLength, 'I'))
                    else
                    begin
                         WhereBus:=' WHERE ( CLIENTE_CC=' + QuotedStr(RellenarCeros(cClienteBus.Text, cClienteBus.MaxLength, 'I'));
                         HayWhere:=True;
                    end;
               end;
               if cAnyoBus.Text<>'' then
               begin
                    if HayWhere then
                       WhereBus:=WhereBus + ' AND ANYO_CC=' + cAnyoBus.Text
                    else
                    begin
                         WhereBus:=' WHERE ( ANYO_CC=' + cAnyoBus.Text;
                         HayWhere:=True;
                    end;
               end;
               if cMesBus.Text<>'' then
               begin
                    if HayWhere then
                       WhereBus:=WhereBus + ' AND MES_CC=' + cMesBus.Text
                    else
                    begin
                         WhereBus:=' WHERE ( MES_CC=' + cMesBus.Text;
                         HayWhere:=True;
                    end;
               end;

{
               if (cAnyoDesdeBus.Text<>'') and (cAnyoHastaBus.Text<>'') then
               begin
                    if HayWhere then
                       WhereBus:=WhereBus + ' AND ANYO_CC BETWEEN ' + QuotedStr(cAnyoDesdeBus.Text) + ' AND ' + QuotedStr(cAnyoHastaBus.Text)
                    else
                        WhereBus:=' WHERE ( ANYO_CC BETWEEN ' + QuotedStr(cAnyoDesdeBus.Text) + ' AND ' + QuotedStr(cAnyoHastaBus.Text) );
               end;
               if (cMesDesdeBus.Text<>'') and (cMesHastaBus.Text<>'') then
               begin
                    if HayWhere then
                       WhereBus:=WhereBus + ' AND MES_CC BETWEEN ' + QuotedStr(cMesDesdeBus.Text) + ' AND ' + QuotedStr(cMesHastaBus.Text)
                    else
                        WhereBus:=' WHERE ( MES_CC BETWEEN ' + QuotedStr(cMesDesdeBus.Text) + ' AND ' + QuotedStr(cMesHastaBus.Text) );
               end;
 }
               if WhereBus<>'' then
                  WhereBus:=WhereBus + ')';
               Query1.SQL.Add(WhereBus);
               TextoSql:=Query1.SQL.Text;
               Query1.SQL.Add(' ORDER BY EMPRESA_CC, CLIENTE_CC, ANYO_CC, MES_CC');
               Query1.Open;
               if not Query1.IsEmpty then
               begin
                    ClientDataSet1.Open;
                    Self.Height:=625;
                    Self.width:=500;
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
                                    ' FROM CABECERA_CONSUMOS ' +
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
          end;
     end
     else
     begin
          EmpresaOK:=ClientDataSet1.FieldByName('EMPRESA_CC').AsString;
          ClienteOK:=ClientDataSet1.FieldByName('CLIENTE_CC').AsString;
          AnyoOK:=ClientDataSet1.FieldByName('ANYO_CC').AsInteger;
          MesOK:=ClientDataSet1.FieldByName('MES_CC').AsInteger;
          ModalResult:=mrOk;
     end;
end;

//----------------------- BOTON CANCELAR ---------------------------------------
procedure TBusquedaConsumos.Cancelar(Sender: TObject);
begin
     ModalResult:=mrCancel;
end;

//----------------------------- DOBLE CLICK EN EL GRID -------------------------
procedure TBusquedaConsumos.GridLineasDblClick(Sender: TObject);
begin
     EmpresaBus:=ClientDataSet1.FieldByName('EMPRESA_CC').AsString;
     ClienteBus:=ClientDataSet1.FieldByName('CLIENTE_CC').AsString;
     AnyoBus:=ClientDataSet1.FieldByName('ANYO_CC').AsInteger;
     MesBus:=ClientDataSet1.FieldByName('MES_CC').AsInteger;

     ModalResult:=mrOk;
end;

//--------------------- MENSAJES DE LA BARRA DE ESTADO -------------------------
procedure TBusquedaConsumos.Mensaje(Texto: String );
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
procedure TBusquedaConsumos.Timer1Timer(Sender: TObject);
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
procedure TBusquedaConsumos.FormCreate(Sender: TObject);
begin
     Self.Height:=296;
     Self.width:=500;
     PosRegistro:=0;
     NRegistros:=0;

     cEmpresaBus.Text:=EmpresaGlobal;

     TipoLote:='';
end;

//----------------------- ORDENACION DE LOS DATOS DEL GRID ---------------------
procedure TBusquedaConsumos.GridLineasTitleClick(Column: TColumn);
begin
     ClientDataSet1.Close;
     Query1.Close;
     Query1.SQL.Clear;
{
     if Column.FieldName='fecha_factura_cc' then
        Query1.SQL.Add(TextoSql +
                       ' ORDER BY FECHA_FACTURA_CC')
     else if Column.FieldName='anyo_cc' then
             Query1.SQL.Add(TextoSql +
                            ' ORDER BY ANYO_CC')
     else if Column.FieldName='mes_cc' then
             Query1.SQL.Add(TextoSql +
                            ' ORDER BY MES_CC')
          else
}
          Query1.SQL.Add(TextoSql +
                              ' ORDER BY ' + Column.FieldName);
     Query1.Open;
     ClientDataSet1.Open;
end;

//---------------------- PONE EL COLOR DEL FOCO --------------------------------
procedure TBusquedaConsumos.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clMoneyGreen;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TBusquedaConsumos.ColorExit(Sender: TObject);
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
procedure TBusquedaConsumos.cEmpresaBusChange(Sender: TObject);
Var
   Empresa: String;
begin
     Empresa:=RellenarCeros(cEmpresaBus.Text, cEmpresaBus.MaxLength, 'I');

     tNomEmpresa.Caption:=NomEmpresa(Empresa);
     tNomCliente.Caption:=NomCliente(Empresa, cClienteBus.Text);
end;

//-------------------------- PRIMER REGISTRO -----------------------------------
procedure TBusquedaConsumos.Primero(Sender: TObject);
begin
     ClientDataSet1.First;
end;

//-------------------------- REGISTRO ANTERIOR ---------------------------------
procedure TBusquedaConsumos.Anterior(Sender: TObject);
begin
     ClientDataSet1.Prior;
end;

//-------------------------- REGISTRO SIGUIENTE --------------------------------
procedure TBusquedaConsumos.Siguiente(Sender: TObject);
begin
     ClientDataSet1.Next;
end;

//-------------------------- ULTIMO REGISTRO -----------------------------------
procedure TBusquedaConsumos.Ultimo(Sender: TObject);
begin
     ClientDataSet1.Last;
end;

//-------------- HABILITAR BOTONES DE POSICION DE REGISTRO ---------------------
procedure TBusquedaConsumos.BotonesPosicion;
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
procedure TBusquedaConsumos.ClientDataSet1AfterScroll(DataSet: TDataSet);
begin
     PosRegistro:=ClientDataSet1.RecNo;
     BotonesPosicion();
end;

//-------------------- AL CAMBIAR EL CLIENTE -----------------------------------
procedure TBusquedaConsumos.cClienteBusChange(Sender: TObject);
begin
     tNomCliente.Caption:=NomCliente(cEmpresaBus.Text,
                                     RellenarCeros(cClienteBus.Text, cClienteBus.MaxLength, 'I'));
end;

//------------------------ CALCULO DE CAMPOS CALCULADOS ------------------------
procedure TBusquedaConsumos.ClientDataSet1CalcFields(DataSet: TDataSet);
begin
     //Cambia el formato de la fecha de entrada al visualizar (YYYY/MM/DD --> DD/MM/YYYY)
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TBusquedaConsumos.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TBusquedaConsumos.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresaBus.Text:=CodEmpresa;
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TBusquedaConsumos.cLupaClientesClick(Sender: TObject);
Var
   CodCliente: String;
begin
     if cEmpresaBus.Text<>'' then
     begin
          CodCliente:=LupaClientes(RellenarCeros(cEmpresaBus.Text,cEmpresaBus.MaxLength,'I'));
          if CodCliente<>'' then
             cClienteBus.Text:=CodCliente;
     end
     else
     begin
          MessageDlg (Chr(13) + 'Seleccione antes la empresa', mtError,[mbOk],0);
          cEmpresaBus.SetFocus;
     end;
end;

//-------------------------- LUPA (F2) DE CLIENTES -----------------------------
procedure TBusquedaConsumos.cClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaClientesClick(Self);
end;

procedure TBusquedaConsumos.FormActivate(Sender: TObject);
begin
     cClienteBus.SetFocus;
end;

//-------------------------- VALIDACION DE LA SELECCION ------------------------
function TBusquedaConsumos.Validar():Boolean;
begin
{
     Result:=True;
     cAnyoDesdeBus.PostEditValue;
     cAnyoHastaBus.PostEditValue;
     if (cAnyoDesdeBus.Text<>'')  then
     begin
          MessageDlg (Chr(13) + 'El campo Año desde es incorrecta', mtError,[mbOk],0);
          cFechaDesdeBus.SetFocus;
          Result:=False;
     end
     else if (cAnyoDesdeBus.Text<>'') then
     begin
          MessageDlg (Chr(13) + 'El campo Año hasta es incorrecta', mtError,[mbOk],0);
          cFechaHastaBus.SetFocus;
          Result:=False;
     end
     else if cAnyoDesdeBus.Date>cAnyoDesdeBus.Date then
     begin
          MessageDlg (Chr(13) + 'Rango de fechas incorrecto', mtError,[mbOk],0);
          cFechaDesdeBus.SetFocus;
          Result:=False;
     end
}
end;

end.
