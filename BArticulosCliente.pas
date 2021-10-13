unit BArticulosCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, DBTables, StdCtrls, ComCtrls,
  ToolWin, Buttons,
  Provider, DBClient, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  dxSkinsCore, dxSkinBlue, cxButtons, SimpleSearch, dxSkinsdxBarPainter, dxBar,
  cxClasses;

type
  TBusquedaArticulosCliente = class(TForm)
    Query1: TQuery;
    DS: TDataSource;
    Timer1: TTimer;
    PanelDatos: TPanel;
    GridLineas: TDBGrid;
    QContar: TQuery;
    BarraEstado: TStatusBar;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1empresa_ac: TStringField;
    ClientDataSet1cliente_ac: TStringField;
    ClientDataSet1familia_ac: TStringField;
    ClientDataSet1articulo_ac: TStringField;
    ClientDataSet1arti_cli_ac: TStringField;
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
    Label5: TLabel;
    nbLabel5: TLabel;
    StaticText1: TStaticText;
    tNomEmpresa: TPanel;
    cEmpresaBus: TEdit;
    cArticuloBus: TEdit;
    cArticuloCliBus: TEdit;
    cClienteBus: TEdit;
    tNomCliente: TPanel;
    StaticText13: TStaticText;
    cFamiliaBus: TEdit;
    tNomFamilia: TPanel;
    tNomArticulo: TPanel;
    cLupaEmpresas: TSimpleSearch;
    cLupaClientes: TSimpleSearch;
    cLupaFamilias: TSimpleSearch;
    cLupaArticulos: TSimpleSearch;
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
    procedure cFamiliaBusChange(Sender: TObject);
    procedure cArticuloBusChange(Sender: TObject);
    function  ValidarFiltro():Boolean;
    procedure cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaEmpresasClick(Sender: TObject);
    procedure cLupaClientesClick(Sender: TObject);
    procedure cClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaFamiliasClick(Sender: TObject);
    procedure cFamiliaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaArticulosClick(Sender: TObject);
    procedure cArticuloKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
    TextoSql: String;
    PosRegistro, NRegistros: Integer;
    procedure Mensaje(Texto: String );
    procedure BotonesPosicion;

  public
       { Public declarations }
       EmpresaBus, ClienteBus, FamiliaBus, ArticuloBus, ArticuloCliBus : String;
       WhereBus: String;
  end;

var
   BusquedaArticulosCliente: TBusquedaArticulosCliente;

implementation

uses MBaseDatos, UGLobal;

{$R *.dfm}

//----------------------- BOTON NUEVA BUSQUEDA ---------------------------------
procedure TBusquedaArticulosCliente.NuevaBusqueda(Sender: TObject);
begin
     Self.Height:=275;
     Self.width:=510;
     GridLineas.TabStop:=False;
     PanelDatos.Enabled:=False;
     PanelDatos.Visible:=False;
     PanelClaves.Visible:=True;
     Query1.Close;
     ClientDataSet1.Close;
     cEmpresaBus.Text:=EmpresaGlobal;
     cClienteBus.SetFocus;
     cClienteBus.Text:='';
     cFamiliaBus.Text:='';
     cArticuloBus.Text:='';
     cArticuloCliBus.Text:='';
      
     NRegistros:=0;
     PosRegistro:=0;
     BotonesPosicion();
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TBusquedaArticulosCliente.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then  //F5 aceptar
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TBusquedaArticulosCliente.FormKeyPress(Sender: TObject; var Key: Char);
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

//---------------------- COMPROBACION DEL FILTRO -------------------------------
function TBusquedaArticulosCliente.ValidarFiltro():Boolean;
begin
     result:=True;
     if cEmpresaBus.Text='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'Falta la empresa', mtError,[mbOk],0);
          cEmpresaBus.SetFocus;
     end
     else if tNomEmpresa.Caption='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'La empresa no existe', mtError,[mbOk],0);
          cEmpresaBus.SetFocus;
     end
     else if cClienteBus.Text='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'Falta el cliente', mtError,[mbOk],0);
          cClienteBus.SetFocus;
     end
     else if tNomCliente.Caption='' then
     begin
          Result:=False;
          MessageDlg (Chr(13) + 'El cliente no existe', mtError,[mbOk],0);
          cClienteBus.SetFocus;
     end;
end;

//----------------------- BOTON ACEPTAR ----------------------------------------
procedure TBusquedaArticulosCliente.Aceptar(Sender: TObject);
Var
   HayWhere: Boolean;
begin
     if ValidarFiltro() then
     begin
         NRegistros:=0;
         PosRegistro:=0;
         HayWhere:=False;
         if not ClientDataSet1.Active then
         begin
              WhereBus:='';
              Query1.SQL.Clear;
              Query1.SQL.Add(' SELECT * ' +
                             ' FROM ARTICULOS_CLIENTE ');
              if cEmpresaBus.Text<>'' then
              begin
                   WhereBus:=' WHERE EMPRESA_AC=' + QuotedStr(cEmpresaBus.Text);
                   HayWhere:=True;
              end;
              if cClienteBus.Text<>'' then
              begin
                   if HayWhere then
                      WhereBus:=WhereBus + ' AND CLIENTE_AC=' + QuotedStr(cClienteBus.Text)
                   else
                   begin
                        WhereBus:=' WHERE CLIENTE_AC=' + QuotedStr(cClienteBus.Text);
                        HayWhere:=True;
                   end;
              end;
              if cFamiliaBus.Text<>'' then
              begin
                   if HayWhere then
                      WhereBus:=WhereBus + ' AND FAMILIA_AC=' + QuotedStr(cFamiliaBus.Text)
                   else
                   begin
                        WhereBus:=' WHERE FAMILIA_AC=' + QuotedStr(cFamiliaBus.Text);
                        HayWhere:=True;
                   end;
              end;
              if cArticuloBus.Text<>'' then
              begin
                   if HayWhere then
                      WhereBus:=WhereBus + ' AND ARTICULO_AC=' + QuotedStr(cArticuloBus.Text)
                   else
                   begin
                        WhereBus:=' WHERE ARTICULO_AC=' + QuotedStr(cArticuloBus.Text);
                        HayWhere:=True;
                   end;
              end;
              if cArticuloCliBus.Text<>'' then
              begin
                   if HayWhere then
                      WhereBus:=WhereBus + ' AND ARTI_CLI_AC=' + QuotedStr(cArticuloCliBus.Text)
                   else
                       WhereBus:=' WHERE ARTI_CLI_AC=' + QuotedStr(cArticuloCliBus.Text);
              end;
              Query1.SQL.Add(WhereBus);
              TextoSql:=Query1.SQL.Text;
              Query1.SQL.Add(' ORDER BY EMPRESA_AC, CLIENTE_AC, FAMILIA_AC, ARTICULO_AC');
              Query1.Open;
              if not Query1.IsEmpty then
              begin
                   ClientDataSet1.Open;
                   Self.Height:=433;
                   //Self.width:=949;
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
                                   ' FROM ARTICULOS_CLIENTE ' +
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
end;

//----------------------- BOTON CANCELAR ---------------------------------------
procedure TBusquedaArticulosCliente.Cancelar(Sender: TObject);
begin
     ModalResult:=mrCancel;
end;

//----------------------------- DOBLE CLICK EN EL GRID -------------------------
procedure TBusquedaArticulosCliente.GridLineasDblClick(Sender: TObject);
begin
     EmpresaBus:=ClientDataSet1.FieldByName('EMPRESA_AC').AsString;
     ClienteBus:=ClientDataSet1.FieldByName('CLIENTE_AC').AsString;
     FamiliaBus:=ClientDataSet1.FieldByName('FAMILIA_AC').AsString;
     ArticuloBus:=ClientDataSet1.FieldByName('ARTICULO_AC').AsString;
     ArticuloCliBus:=ClientDataSet1.FieldByName('ARTI_CLI_AC').AsString;
     
     ModalResult:=mrOk;
end;

//--------------------- MENSAJES DE LA BARRA DE ESTADO -------------------------
procedure TBusquedaArticulosCliente.Mensaje(Texto: String );
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
procedure TBusquedaArticulosCliente.Timer1Timer(Sender: TObject);
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
procedure TBusquedaArticulosCliente.FormCreate(Sender: TObject);
begin
     Self.Height:=275;
     Self.width:=510;
     PosRegistro:=0;
     NRegistros:=0;

     cEmpresaBus.Text:=EmpresaGlobal;
end;

//----------------------- ORDENACION DE LOS DATOS DEL GRID ---------------------
procedure TBusquedaArticulosCliente.GridLineasTitleClick(Column: TColumn);
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
procedure TBusquedaArticulosCliente.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clMoneyGreen;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TBusquedaArticulosCliente.ColorExit(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          TEdit(Sender).Color:=clWindow;
          if Length(TEdit(Sender).Text)>0 then
             TEdit(Sender).Text:=RellenarCeros(TEdit(Sender).Text,TEdit(Sender).MaxLength,'I');
     end;
end;

//----------------------- CAMBIO DE LA EMPRESA ---------------------------------
procedure TBusquedaArticulosCliente.cEmpresaBusChange(Sender: TObject);
Var
   Empresa: String;
begin
     Empresa:=RellenarCeros(cEmpresaBus.Text,cEmpresaBus.MaxLength,'I');

     tNomEmpresa.Caption:=NomEmpresa(Empresa);
     tNomCliente.Caption:=NomCliente(Empresa, cClienteBus.Text);
     tNomFamilia.Caption:=NomFamilia(Empresa, cFamiliaBus.Text);
     tNomArticulo.Caption:=NomArticulo(Empresa,
                                       cFamiliaBus.Text,
                                       cArticuloBus.Text);
end;

//-------------------------- PRIMER REGISTRO -----------------------------------
procedure TBusquedaArticulosCliente.Primero(Sender: TObject);
begin
     ClientDataSet1.First;
end;

//-------------------------- REGISTRO ANTERIOR ---------------------------------
procedure TBusquedaArticulosCliente.Anterior(Sender: TObject);
begin
     ClientDataSet1.Prior;
end;

//-------------------------- REGISTRO SIGUIENTE --------------------------------
procedure TBusquedaArticulosCliente.Siguiente(Sender: TObject);
begin
     ClientDataSet1.Next;
end;

//-------------------------- ULTIMO REGISTRO -----------------------------------
procedure TBusquedaArticulosCliente.Ultimo(Sender: TObject);
begin
     ClientDataSet1.Last;
end;

//-------------- HABILITAR BOTONES DE POSICION DE REGISTRO ---------------------
procedure TBusquedaArticulosCliente.BotonesPosicion;
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
procedure TBusquedaArticulosCliente.ClientDataSet1AfterScroll(DataSet: TDataSet);
begin
     PosRegistro:=ClientDataSet1.RecNo;
     BotonesPosicion();
end;

procedure TBusquedaArticulosCliente.cClienteBusChange(Sender: TObject);
begin
     tNomCliente.Caption:=NomCliente(cEmpresaBus.Text, RellenarCeros(cClienteBus.Text,cClienteBus.MaxLength,'I'));
end;

procedure TBusquedaArticulosCliente.cFamiliaBusChange(Sender: TObject);
Var
   Familia: String;
begin
     Familia:=RellenarCeros(cFamiliaBus.Text,cFamiliaBus.MaxLength,'I');

     tNomFamilia.Caption:=NomFamilia(cEmpresaBus.Text,Familia);
     tNomArticulo.Caption:=NomArticulo(cEmpresaBus.Text,
                                       Familia,
                                       cArticuloBus.Text);
end;

procedure TBusquedaArticulosCliente.cArticuloBusChange(Sender: TObject);
begin
     tNomArticulo.Caption:=NomArticulo(cEmpresaBus.Text,
                                       cFamiliaBus.Text,
                                       RellenarCeros(cArticuloBus.Text,cArticuloBus.MaxLength,'I'));
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TBusquedaArticulosCliente.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TBusquedaArticulosCliente.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresaBus.Text:=CodEmpresa;
     cEmpresaBus.SetFocus;
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TBusquedaArticulosCliente.cLupaClientesClick(Sender: TObject);
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
procedure TBusquedaArticulosCliente.cClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaClientesClick(Self);
end;

//-------------------------- LUPA DE FAMILIAS-----------------------------------
procedure TBusquedaArticulosCliente.cLupaFamiliasClick(Sender: TObject);
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
procedure TBusquedaArticulosCliente.cFamiliaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaFamiliasClick(Self);
end;

//-------------------------- LUPA DE ARTICULOS ---------------------------------
procedure TBusquedaArticulosCliente.cLupaArticulosClick(Sender: TObject);
Var
   Articulo, Familia: String;
begin
     if cEmpresaBus.Text<>'' then
     begin
          if (cFamiliaBus.Text<>'') and (tNomFamilia.Caption<>'') then
          begin
               Familia:=RellenarCeros(cFamiliaBus.Text,cFamiliaBus.MaxLength,'I');
               Articulo:=LupaArticulos(RellenarCeros(cEmpresaBus.Text,cEmpresaBus.MaxLength,'I'),
                                       Familia);
          end
          else
          begin
               Familia:='';
               Articulo:=LupaFamiliaArticulos(RellenarCeros(cEmpresaBus.Text,cEmpresaBus.MaxLength,'I'),Familia);
          end;
          if Articulo<>'' then
          begin
               cArticuloBus.Text:=Articulo;
               if Familia<>'' then
                  cFamiliaBus.Text:=Familia;
          end;
          cFamiliaBus.SetFocus;
     end
     else
     begin
          MessageDlg (Chr(13) + 'Seleccione antes la empresa', mtError,[mbOk],0);
          cEmpresaBus.SetFocus;
     end;
end;

//-------------------------- LUPA (F2) DE ARTICULOS ----------------------------
procedure TBusquedaArticulosCliente.cArticuloKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaArticulosClick(Self);
end;

procedure TBusquedaArticulosCliente.FormActivate(Sender: TObject);
begin
     cClienteBus.SetFocus;
end;

end.
