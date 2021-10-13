unit BSalidas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, DBTables, StdCtrls, ComCtrls,
  ToolWin, Buttons,
  Provider, DBClient, Mask, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxCore,
  cxDateUtils, dxSkinsCore, dxSkinBlue, Menus, dxSkinsdxBarPainter, dxBar,
  cxClasses, cxButtons, SimpleSearch, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar;

type
  TBusquedaSalidas = class(TForm)
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
    StaticText13: TStaticText;
    cAlbaranBus: TEdit;
    ClientDataSet1empresa_cs: TStringField;
    ClientDataSet1albaran_cs: TIntegerField;
    ClientDataSet1cliente_cs: TStringField;
    ClientDataSet1tipo_salida_cs: TStringField;
    ClientDataSet1importe_salida_cs: TFloatField;
    ClientDataSet1horas_salida_cs: TFloatField;
    ClientDataSet1numero_factura_cs: TIntegerField;
    ClientDataSet1orden_numero_cs: TStringField;
    ClientDataSet1concepto_cs: TStringField;
    ClientDataSet1matricula_cs: TStringField;
    ClientDataSet1observaciones_cs: TStringField;
    ClientDataSet1retira_cs: TStringField;
    ClientDataSet1nif_retira_cs: TStringField;
    ClientDataSet1hora_cs: TStringField;
    ClientDataSet1FechaAlbaran: TStringField;
    ClientDataSet1FechaFactura: TStringField;
    ClientDataSet1fecha_albaran_cs: TStringField;
    ClientDataSet1fecha_factura_cs: TStringField;
    GrupoFecha: TGroupBox;
    Articulo: TLabel;
    Label1: TLabel;
    cFechaDesdeBus: TcxDateEdit;
    cFechaHastaBus: TcxDateEdit;
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
    procedure Mensaje(Texto: String);
    procedure BotonesPosicion;
    function  Validar():Boolean;

  public
       { Public declarations }
       EmpresaBus, AlbaranBus: String;
       WhereBus: String;
  end;

var
   BusquedaSalidas: TBusquedaSalidas;

implementation

uses MBaseDatos, UGLobal;

{$R *.dfm}

//----------------------- BOTON NUEVA BUSQUEDA ---------------------------------
procedure TBusquedaSalidas.NuevaBusqueda(Sender: TObject);
begin
     Self.Height:=296;
     Self.width:=463;
     GridLineas.TabStop:=False;
     PanelDatos.Enabled:=False;
     PanelDatos.Visible:=False;
     PanelClaves.Visible:=True;
     Query1.Close;
     ClientDataSet1.Close;
     cClienteBus.SetFocus;
     cEmpresaBus.Text:=EmpresaGlobal;
     cClienteBus.Text:='';
     cAlbaranBus.Text:='';
     cFechaDesdeBus.Date:=0;
     cFechaHastaBus.Date:=0;    
     NRegistros:=0;
     PosRegistro:=0;
     BotonesPosicion();
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TBusquedaSalidas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then  //F5 aceptar
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TBusquedaSalidas.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TBusquedaSalidas.Aceptar(Sender: TObject);
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
                              ' FROM CABECERA_SALIDAS ');
               if cEmpresaBus.Text<>'' then
               begin
                    WhereBus:=' WHERE EMPRESA_CS=' + QuotedStr(RellenarCeros(cEmpresaBus.Text, cEmpresaBus.MaxLength, 'I'));
                    HayWhere:=True;
               end;
               if cClienteBus.Text<>'' then
               begin
                    if HayWhere then
                       WhereBus:=WhereBus + ' AND CLIENTE_CS=' + QuotedStr(RellenarCeros(cClienteBus.Text, cClienteBus.MaxLength, 'I'))
                    else
                    begin
                         WhereBus:=' WHERE CLIENTE_CS=' + QuotedStr(RellenarCeros(cClienteBus.Text, cClienteBus.MaxLength, 'I'));
                         HayWhere:=True;
                    end;
               end;
               if cAlbaranBus.Text<>'' then
               begin
                    if HayWhere then
                       WhereBus:=WhereBus + ' AND ALBARAN_CS=' + QuotedStr(cAlbaranBus.Text)
                    else
                    begin
                         WhereBus:=' WHERE ALBARAN_CS=' + QuotedStr(cAlbaranBus.Text);
                         HayWhere:=True;
                    end;
               end;
               if (cFechaDesdeBus.Text<>'') and (cFechaHastaBus.Text<>'') then
               begin
                    if HayWhere then
                       WhereBus:=WhereBus + ' AND FECHA_ALBARAN_CS BETWEEN ' + QuotedStr(AnyoMesDia(cFechaDesdeBus.Text)) + ' AND ' + QuotedStr(AnyoMesDia(cFechaHastaBus.Text))
                    else
                        WhereBus:=' WHERE FECHA_ALBARAN_CS BETWEEN ' + QuotedStr(AnyoMesDia(cFechaDesdeBus.Text)) + ' AND ' + QuotedStr(AnyoMesDia(cFechaHastaBus.Text));
               end;
               Query1.SQL.Add(WhereBus);
               TextoSql:=Query1.SQL.Text;
               Query1.SQL.Add(' ORDER BY EMPRESA_CS, CLIENTE_CS, ALBARAN_CS, FECHA_ALBARAN_CS');
               Query1.Open;
               if not Query1.IsEmpty then
               begin
                    ClientDataSet1.Open;
                    Self.Height:=535;
                    Self.width:=463;
                    PanelClaves.Visible:=False;
                    PanelDatos.Enabled:=True;
                    PanelDatos.Visible:=True;
                    GridLineas.TabStop:=True;
                    GridLineas.SetFocus;

                    Application.ProcessMessages;

                    try    //Contamos los Registros
                       With QContar do
                       begin
                            Close;
                            SQL.Clear;
                            SQL.Add(' SELECT COUNT(*) AS NREGISTROS ' +
                                    ' FROM CABECERA_SALIDAS ' +
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
         ModalResult:=mrOk;
end;

//----------------------- BOTON CANCELAR ---------------------------------------
procedure TBusquedaSalidas.Cancelar(Sender: TObject);
begin
     ModalResult:=mrCancel;
end;

//----------------------------- DOBLE CLICK EN EL GRID -------------------------
procedure TBusquedaSalidas.GridLineasDblClick(Sender: TObject);
begin
     EmpresaBus:=ClientDataSet1.FieldByName('EMPRESA_CS').AsString;
     AlbaranBus:=ClientDataSet1.FieldByName('ALBARAN_CS').AsString;

     ModalResult:=mrOk;
end;

//--------------------- MENSAJES DE LA BARRA DE ESTADO -------------------------
procedure TBusquedaSalidas.Mensaje(Texto: String );
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
procedure TBusquedaSalidas.Timer1Timer(Sender: TObject);
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
procedure TBusquedaSalidas.FormCreate(Sender: TObject);
begin
     Self.Height:=296;
     Self.width:=463;
     PosRegistro:=0;
     NRegistros:=0;

     cEmpresaBus.Text:=EmpresaGlobal;
end;

//----------------------- ORDENACION DE LOS DATOS DEL GRID ---------------------
procedure TBusquedaSalidas.GridLineasTitleClick(Column: TColumn);
begin
     ClientDataSet1.Close;
     Query1.Close;
     Query1.SQL.Clear;
     if Column.FieldName='FechaFactura' then
        Query1.SQL.Add(TextoSql +
                       ' ORDER BY FECHA_FACTURA_CS')
     else if Column.FieldName='FechaAlbaran' then
             Query1.SQL.Add(TextoSql +
                            ' ORDER BY FECHA_ALBARAN_CS')
          else Query1.SQL.Add(TextoSql +
                              ' ORDER BY ' + Column.FieldName);
     Query1.Open;
     ClientDataSet1.Open;
end;

//---------------------- PONE EL COLOR DEL FOCO --------------------------------
procedure TBusquedaSalidas.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clMoneyGreen;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TBusquedaSalidas.ColorExit(Sender: TObject);
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
procedure TBusquedaSalidas.cEmpresaBusChange(Sender: TObject);
Var
   Empresa: String;
begin
     Empresa:=RellenarCeros(cEmpresaBus.Text, cEmpresaBus.MaxLength, 'I');

     tNomEmpresa.Caption:=NomEmpresa(Empresa);
     tNomCliente.Caption:=NomCliente(Empresa, cClienteBus.Text);
end;

//-------------------------- PRIMER REGISTRO -----------------------------------
procedure TBusquedaSalidas.Primero(Sender: TObject);
begin
     ClientDataSet1.First;
end;

//-------------------------- REGISTRO ANTERIOR ---------------------------------
procedure TBusquedaSalidas.Anterior(Sender: TObject);
begin
     ClientDataSet1.Prior;
end;

//-------------------------- REGISTRO SIGUIENTE --------------------------------
procedure TBusquedaSalidas.Siguiente(Sender: TObject);
begin
     ClientDataSet1.Next;
end;

//-------------------------- ULTIMO REGISTRO -----------------------------------
procedure TBusquedaSalidas.Ultimo(Sender: TObject);
begin
     ClientDataSet1.Last;
end;

//-------------- HABILITAR BOTONES DE POSICION DE REGISTRO ---------------------
procedure TBusquedaSalidas.BotonesPosicion;
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
procedure TBusquedaSalidas.ClientDataSet1AfterScroll(DataSet: TDataSet);
begin
     PosRegistro:=ClientDataSet1.RecNo;
     BotonesPosicion();
end;

//-------------------- AL CAMBIAR EL CLIENTE -----------------------------------
procedure TBusquedaSalidas.cClienteBusChange(Sender: TObject);
begin
     tNomCliente.Caption:=NomCliente(cEmpresaBus.Text,
                                     RellenarCeros(cClienteBus.Text, cClienteBus.MaxLength, 'I'));
end;

//------------------------ CALCULO DE CAMPOS CALCULADOS ------------------------
procedure TBusquedaSalidas.ClientDataSet1CalcFields(DataSet: TDataSet);
begin
     //Cambia el formato de la fecha de entrada al visualizar (YYYY/MM/DD --> DD/MM/YYYY)
     ClientDataSet1.FieldByName('FechaAlbaran').AsString:=DiaMesAnyo(ClientDataSet1.FieldByName('Fecha_Albaran_cs').AsString);
     ClientDataSet1.FieldByName('FechaFactura').AsString:=DiaMesAnyo(ClientDataSet1.FieldByName('Fecha_Factura_cs').AsString);
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TBusquedaSalidas.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TBusquedaSalidas.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresaBus.Text:=CodEmpresa;
     cEmpresaBus.SetFocus;
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TBusquedaSalidas.cLupaClientesClick(Sender: TObject);
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
procedure TBusquedaSalidas.cClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaClientesClick(Self);
end;

//-------------------------- VALIDACION DE LA SELECCION ------------------------
function TBusquedaSalidas.Validar():Boolean;
begin
     Result:=True;
     cFechaDesdeBus.PostEditValue;
     cFechaHastaBus.PostEditValue;
     if (cFechaDesdeBus.Text<>'') and (not EsFecha(cFechaDesdeBus.Text)) then
     begin
          MessageDlg (Chr(13) + 'La fecha desde es incorrecta', mtError,[mbOk],0);
          cFechaDesdeBus.SetFocus;
          Result:=False;
     end
     else if (cFechaHastaBus.Text<>'') and (not EsFecha(cFechaHastaBus.Text)) then
     begin
          MessageDlg (Chr(13) + 'La fecha hasta es incorrecta', mtError,[mbOk],0);
          cFechaHastaBus.SetFocus;
          Result:=False;
     end
     else if cFechaDesdeBus.Date>cFechaHastaBus.Date then
     begin
          MessageDlg (Chr(13) + 'Rango de fechas incorrecto', mtError,[mbOk],0);
          cFechaDesdeBus.SetFocus;
          Result:=False;
     end
end;

procedure TBusquedaSalidas.FormActivate(Sender: TObject);
begin
     cClienteBus.SetFocus;
end;

end.
