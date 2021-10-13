unit FLMovimientosLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, DBTables, StdCtrls, ComCtrls,
  ToolWin, Buttons,
  Provider, DBClient, Mask, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, dxSkinsCore, dxSkinBlue, cxButtons, SimpleSearch,
  dxSkinsdxBarPainter, dxBar, cxClasses;

type
  TListadoMovimientosLote = class(TForm)
    BarraEstado: TStatusBar;
    StaticText1: TStaticText;
    cEmpresa: TEdit;
    tNomEmpresa: TPanel;
    StaticText2: TStaticText;
    cCliente: TEdit;
    tNomCliente: TPanel;
    StaticText3: TStaticText;
    cLote: TEdit;
    cLupaEmpresas: TSimpleSearch;
    cLupaClilentes: TSimpleSearch;
    cLupaLotes: TSimpleSearch;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    bAceptar: TdxBarLargeButton;
    bSalir: TdxBarLargeButton;
    stxt1: TStaticText;
    edtLoteOrigen: TEdit;
    cLupaLoteOrigen: TSimpleSearch;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Aceptar(Sender: TObject);
    procedure ColorEnter(Sender: TObject);
    procedure ColorExit(Sender: TObject);
    procedure ColorExitSinCeros(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BSalirClick(Sender: TObject);
    procedure cEmpresaChange(Sender: TObject);
    procedure cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaEmpresasClick(Sender: TObject);
    procedure cLupaClientesClick(Sender: TObject);
    procedure cClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cClienteChange(Sender: TObject);
    procedure cLupaLotesClick(Sender: TObject);
    procedure cLoteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaLoteOrigenClick(Sender: TObject);

  private
    { Private declarations }
    function ValidarSeleccion(): Boolean;
    procedure DatosAlmacen(Empresa, Cliente, Lote: String; Var StockBultos, EstTotales, EstBulto, EstSueltos: Integer; Var StockUnidades: Real);
  public
       { Public declarations }
   
  end;

var
   ListadoMovimientosLote: TListadoMovimientosLote;

implementation

uses MBaseDatos, UGLobal, LKilosCliente, LMovimientosLote;

{$R *.dfm}

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TListadoMovimientosLote.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then  //F5 aceptar
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TListadoMovimientosLote.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13 then  //Enter
     begin
          Key:=#0;
          PostMessage(Handle,WM_NEXTDLGCTL,0,0);
     end
     else if Key=#27 then  //Esc
          begin
               Key:=#0;
               Close;
          end;
end;

//----------------------- BOTON ACEPTAR ----------------------------------------
procedure TListadoMovimientosLote.Aceptar(Sender: TObject);
Var
   Query1: TQuery;
   TotalBultosEnt, TotalBultosSal, EstuchesBulto: Integer;
   TotalEstuchesEnt, TotalEstuchesSal: Integer;
   TotalUnidadesEnt, TotalUnidadesSal: Real;
   TotalEstuchesSueltosSal, EstSueltos, EstBulto, StockBultos, EstTotales: Integer;
   StockUnidades: Real;
begin
     TotalBultosEnt:=0;
     TotalEstuchesEnt:=0;
     TotalUnidadesEnt:=0;
     TotalBultosSal:=0;
     TotalEstuchesSal:=0;
     TotalUnidadesSal:=0;
     TotalEstuchesSueltosSal:=0;
     TotalEstuchesSal:=0;

     PostMessage(Handle,WM_NEXTDLGCTL,0,0);
     Application.ProcessMessages;
     try
        if ValidarSeleccion() then
        begin
             with TQRMovimientosLote.Create(Application) do  //Creamos dinámicamente el report
             try
                tEmpresa.Caption:=cEmpresa.Text + '-' + tNomEmpresa.Caption;

                Query1:=TQuery.Create(Self);
                ClientDataSet1.CreateDataSet;
                try
                   Query1.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

                   ClientDataSet1.Open;

                   //ENTRADAS
                   Query1.SQL.Add(' SELECT * FROM CABECERA_ENTRADAS, LINEA_ENTRADAS ' +
                                  ' WHERE EMPRESA_CE=EMPRESA_LE ' +
                                  ' AND ALBARAN_CE=ALBARAN_LE ' +
                                  ' AND EMPRESA_CE=' + QuotedStr(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I')) +
                                  ' AND CLIENTE_CE=' + QuotedStr(cCliente.Text) +
                                  ' AND LOTE_LE=' + QuotedStr(cLote.Text));
                   Query1.Open;
                   if not Query1.IsEmpty then
                   begin
                        while not Query1.Eof do
                        begin
                             //Insertamos en el ClientDataSet (Tabla Temporal)
                             ClientDataSet1.Append;
                             ClientDataSet1.FieldByName('Cliente').AsString:=Query1.FieldByName('Cliente_ce').AsString;
                             ClientDataSet1.FieldByName('Albaran').AsInteger:=Query1.FieldByName('Albaran_ce').AsInteger;
                             ClientDataSet1.FieldByName('Fecha').AsString:=DiaMesAnyo(Query1.FieldByName('Fecha_Albaran_ce').AsString);
                             ClientDataSet1.FieldByName('LoteOrigen').asString := Query1.FieldByName('lote_origen_le').AsString;
                             ClientDataSet1.FieldByName('BultosEnt').AsInteger:=Query1.FieldByName('Bultos_le').AsInteger;
                             TotalBultosEnt:=TotalBultosEnt + Query1.FieldByName('Bultos_le').AsInteger;
                             ClientDataSet1.FieldByName('EstXBulto').AsInteger:=Query1.FieldByName('Estuches_Bulto_le').AsInteger;
                             ClientDataSet1.FieldByName('EstuchesSueltosEnt').AsInteger:=Query1.FieldByName('Estuches_Sueltos_le').AsInteger;
                             TotalEstuchesEnt:=TotalEstuchesEnt +
                                               Query1.FieldByName('Estuches_Bulto_le').AsInteger * Query1.FieldByName('Bultos_le').AsInteger +
                                               Query1.FieldByName('Estuches_Sueltos_le').AsInteger;
                             ClientDataSet1.FieldByName('UnidadesEnt').AsFloat:=Query1.FieldByName('Unidades_le').AsFloat;
                             ClientDataSet1['BultosSal']:=NULL;
                             ClientDataSet1['EstuchesSueltosSal']:=NULL;
                             ClientDataSet1['UnidadesSal']:=NULL;
                             ClientDataSet1.FieldByName('Familia').AsString:=Query1.FieldByName('Familia_le').AsString;
                             ClientDataSet1.FieldByName('Articulo').AsString:=Query1.FieldByName('Articulo_le').AsString;
                             TotalUnidadesEnt:=TotalUnidadesEnt + Query1.FieldByName('Unidades_le').AsFloat;

                             ClientDataSet1.Post;
                             EstuchesBulto:=Query1.FieldByName('Estuches_Bulto_le').AsInteger;
                             Query1.Next;
                        end;
                   end;

                   //SALIDAS
                   Query1.Close;
                   Query1.SQL.Clear;
                   Query1.SQL.Add(' SELECT * FROM CABECERA_SALIDAS, LINEA_SALIDAS ' +
                                  ' WHERE EMPRESA_CS=EMPRESA_LS ' +
                                  ' AND ALBARAN_CS=ALBARAN_LS ' +
                                  ' AND EMPRESA_CS=' + QuotedStr(cEmpresa.Text) +
                                  ' AND CLIENTE_CS=' + QuotedStr(cCliente.Text) +
                                  ' AND LOTE_LS=' + QuotedStr(cLote.Text));
                   Query1.Open;
                   if not Query1.IsEmpty then
                   begin
                        while not Query1.Eof do
                        begin
                             //Insertamos en el ClientDataSet (Tabla Temporal)
                             ClientDataSet1.Append;
                             ClientDataSet1.FieldByName('Cliente').AsString:=Query1.FieldByName('Cliente_cs').AsString;
                             ClientDataSet1.FieldByName('Albaran').AsInteger:=Query1.FieldByName('Albaran_cs').AsInteger;
                             ClientDataSet1.FieldByName('Fecha').AsString:=DiaMesAnyo(Query1.FieldByName('Fecha_Albaran_cs').AsString);
                             ClientDataSet1.FieldByName('LoteOrigen').asString := Query1.FieldByName('lote_origen_ls').AsString;
                             ClientDataSet1['BultosEnt']:=NULL;
                             ClientDataSet1['EstXBulto']:=NULL;
                             ClientDataSet1['EstuchesSueltosEnt']:=NULL;
                             ClientDataSet1['UnidadesEnt']:=NULL;
                             ClientDataSet1.FieldByName('BultosSal').AsInteger:=Query1.FieldByName('Bultos_ls').AsInteger;
                             TotalBultosSal:=TotalBultosSal + Query1.FieldByName('Bultos_ls').AsInteger;
                             ClientDataSet1.FieldByName('EstuchesSueltosSal').AsInteger:=Query1.FieldByName('Estuches_Sueltos_ls').AsInteger;
                             TotalEstuchesSueltosSal:=TotalEstuchesSueltosSal + Query1.FieldByName('Estuches_Sueltos_ls').AsInteger;
                             TotalEstuchesSal:=TotalEstuchesSal +
                                               EstuchesBulto * Query1.FieldByName('Bultos_ls').AsInteger +
                                               Query1.FieldByName('Estuches_Sueltos_ls').AsInteger;
                             ClientDataSet1.FieldByName('UnidadesSal').AsFloat:=Query1.FieldByName('Unidades_ls').AsFloat;
                             ClientDataSet1.FieldByName('Familia').AsString:=Query1.FieldByName('Familia_ls').AsString;
                             ClientDataSet1.FieldByName('Articulo').AsString:=Query1.FieldByName('Articulo_ls').AsString;
                             TotalUnidadesSal:=TotalUnidadesSal + Query1.FieldByName('Unidades_ls').AsFloat;
                             ClientDataSet1.Post;

                             Query1.Next;
                        end;
                   end;
                   if not ClientDataSet1.IsEmpty then
                   begin
                        ClientDataSet1.First;
                        tCliente.Caption:=cCliente.Text + '-' + tNomCliente.Caption;
                        tArticulo.Caption:=ClientDataSet1.FieldByName('Articulo').AsString + '-' +
                                           NomArticulo(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'),
                                                       ClientDataSet1.FieldByName('Familia').AsString,
                                                       ClientDataSet1.FieldByName('Articulo').AsString);
                        tLote.Caption:=cLote.Text;

                        tTotalBultosSal.Caption:=FloatToStr(TotalBultosSal);
                        tTotalEstuchesSueltosSal.Caption:=IntToStr(TotalEstuchesSueltosSal);
                        tTotalUnidadesSal.Caption:=FormatFloat('#,##0.00', TotalUnidadesSal);

                        //tTotalUnidades.Caption:=FormatFloat('#,##0.00', TotalUnidadesEnt-TotalUnidadesSal);
                        //tTotalEstuches.Caption:=IntToStr(TotalEstuchesEnt - TotalEstuchesSal);
                        //tTotalBultos.Caption:=IntToStr(TotalBultosEnt - TotalBultosSal);

                        //Los datos del pie de pagina antes se calculaban pero ahora se sacan directamente del almacen
                        DatosAlmacen(cEmpresa.Text,
                                     ClientDataSet1.FieldByName('Cliente').AsString,
                                     cLote.Text,
                                     StockBultos,
                                     EstTotales,
                                     EstBulto,
                                     EstSueltos,
                                     StockUnidades);
                        tTotalBultos.Caption:=IntToStr(StockBultos);
                        tTotalUnidades.Caption:=FormatFloat('#,##0.00',StockUnidades);
                        tTotalEstuches.Caption:=IntToStr(EstTotales);
                        tEstBulto.Caption:=IntToStr(EstBulto);
                        tEstSueltos.Caption:=IntToStr(EstSueltos);
                        Preview;    //Previsualizamos
                   end
                   else
                       MessageDlg (Chr(13) + 'Listado sin datos', mtError,[mbOk],0);
                 finally
                        Query1.Close;
                        FreeAndNil(Query1);
                        ClientDataSet1.Close;
                        ClientDataSet1.Free;
                 end;
             finally
                    Free;    //Liberamos el Report
             end;
        end;
     except
           on E:Exception do
                CapturaErrores(E);
     end;
end;

//----------------------- VALIDA LA SELECCION ----------------------------------
function TListadoMovimientosLote.ValidarSeleccion(): Boolean;
begin
     Result:=True;
     if cEmpresa.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta la empresa', mtError,[mbOk],0);
          cEmpresa.SetFocus;
          Result:=False;
     end
     else if tNomEmpresa.Caption='' then
     begin
          MessageDlg (Chr(13) + 'La empresa no existe', mtError,[mbOk],0);
          cEmpresa.SetFocus;
          Result:=False;
     end;
end;

//---------------------- PONE EL COLOR DEL FOCO --------------------------------
procedure TListadoMovimientosLote.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clMoneyGreen;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TListadoMovimientosLote.ColorExit(Sender: TObject);
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

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TListadoMovimientosLote.ColorExitSinCeros(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clWindow
     else if Sender is TComboBox then           //Si el componente es un TComboBox
             TComboBox(Sender).Color:=clWindow;
end;

//------------------------- CREACION DEL FORMULARIO ----------------------------
procedure TListadoMovimientosLote.FormCreate(Sender: TObject);
begin
     Top:=1;
     Left:=0;

     cEmpresa.Text:=EmpresaGlobal;
end;

//------------------------- CIERRE DEL FORMULARIO ------------------------------
procedure TListadoMovimientosLote.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

//------------------------- BOTON SALIR ----------------------------------------
procedure TListadoMovimientosLote.BSalirClick(Sender: TObject);
begin
     Close;
end;

//------------------------ AL CAMBIAR LA EMPRESA -------------------------------
procedure TListadoMovimientosLote.cEmpresaChange(Sender: TObject);
begin
     tNomEmpresa.Caption:= NomEmpresa(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TListadoMovimientosLote.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TListadoMovimientosLote.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresa.Text:=CodEmpresa;
     cEmpresa.SetFocus;
end;

//-------------------------- LUPA DE CLIENTES ----------------------------------
procedure TListadoMovimientosLote.cLupaClientesClick(Sender: TObject);
Var
   CodCliente: String;
begin
     if cEmpresa.Text<>'' then
     begin
          CodCliente:=LupaClientes(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
          if CodCliente<>'' then
             cCliente.Text:=CodCliente;
          cCliente.SetFocus;
     end
     else
     begin
          MessageDlg (Chr(13) + 'Seleccione antes la empresa', mtError,[mbOk],0);
          cEmpresa.SetFocus;
     end;
end;

//--------------------- CONTROL DE TECLADO EN CLIENTE --------------------------
procedure TListadoMovimientosLote.cClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaClientesClick(Self);
end;

//--------------------- AL CAMBIAR EL CLIENTE ----------------------------------
procedure TListadoMovimientosLote.cClienteChange(Sender: TObject);
begin
     tNomCliente.Caption:=NomCliente(cEmpresa.Text, RellenarCeros(cCliente.Text,cCliente.MaxLength,'I'));
end;

//--------------------- LUPA DE LOTES ------------------------------------------
procedure TListadoMovimientosLote.cLupaLotesClick(Sender: TObject);
Var
   Lote: String;
begin
     if cEmpresa.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta la empresa', mtError,[mbOk],0);
          cEmpresa.SetFocus;
     end
     else if tNomEmpresa.Caption='' then
     begin
          MessageDlg (Chr(13) + 'La empresa no existe', mtError,[mbOk],0);
          cEmpresa.SetFocus;
     end
     else if cCliente.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta el cliente', mtError,[mbOk],0);
          cCliente.SetFocus;
     end
     else if tNomCliente.Caption='' then
     begin
          MessageDlg (Chr(13) + 'El cliente no existe', mtError,[mbOk],0);
          cCliente.SetFocus;
     end
     else
     begin
          Lote:=LupaLotes(
            RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'),
            RellenarCeros(cCliente.Text,cCliente.MaxLength,'I'),
            cLote.Text,
            edtLoteOrigen.Text);

          if Lote<>'' then
             cLote.Text:=Lote;
          cLote.SetFocus;
     end;
end;

procedure TListadoMovimientosLote.cLupaLoteOrigenClick(Sender: TObject);
var
  Lote: String;
begin
  if cEmpresa.Text='' then
  begin
    MessageDlg (Chr(13) + 'Falta la empresa', mtError,[mbOk],0);
    cEmpresa.SetFocus;
  end
  else if tNomEmpresa.Caption='' then
  begin
    MessageDlg (Chr(13) + 'La empresa no existe', mtError,[mbOk],0);
    cEmpresa.SetFocus;
  end
  else if cCliente.Text='' then
  begin
    MessageDlg (Chr(13) + 'Falta el cliente', mtError,[mbOk],0);
    cCliente.SetFocus;
  end
  else if tNomCliente.Caption='' then
  begin
    MessageDlg (Chr(13) + 'El cliente no existe', mtError,[mbOk],0);
    cCliente.SetFocus;
  end
  else
  begin
    Lote:=LupaLotesOrigen(
      RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'),
      RellenarCeros(cCliente.Text,cCliente.MaxLength,'I'),
    cLote.Text,
    edtLoteOrigen.Text);

    if Lote<>'' then
      edtLoteOrigen.Text:=Lote;
    edtLoteOrigen.SetFocus;
  end;
end;

procedure TListadoMovimientosLote.cLoteKeyDown(Sender: TObject;  var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
     begin
      if cLote.Focused then
        cLupaLotesClick(Self)
      else if edtLoteOrigen.Focused then
        cLupaLoteOrigenClick(Self);
     end;
end;

procedure TListadoMovimientosLote.DatosAlmacen(Empresa, Cliente, Lote: String; Var StockBultos, EstTotales, EstBulto, EstSueltos: Integer; Var StockUnidades: Real);
Var
   Aux: TQuery;
begin
     try
        Aux:=TQuery.Create(Nil);
        with Aux do
        begin
             DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
             Close;
             SQL.Clear;
             SQL.Add(' SELECT *  ' +
                     ' FROM ALMACENES ' +
                     ' WHERE EMPRESA_AL=' + QuotedStr(Empresa) +
                     ' AND LOTE_AL=' + QuotedStr(Lote) +
                     ' AND CLIENTE_AL=' + QuotedStr(Cliente));
             Open;
             if IsEmpty then
             begin
                  EstBulto:=0;
                  EstSueltos:=0;
             end
             else
             begin
                  StockBultos:=FieldByName('Bultos_Entrados_al').AsInteger-FieldByName('Bultos_Salidos_al').AsInteger;
                  StockUnidades:=FieldByName('Unidades_Entradas_al').AsFloat -
                                 FieldByName('Unidades_Salidas_al').AsFloat -
                                 FieldByName('Unidades_Destruidas_al').AsFloat -
                                 FieldByName('Unidades_Mermas_al').AsFloat;
                  EstTotales:=FieldByName('Estuches_Totales_al').AsInteger;
                  EstBulto:=FieldByName('Estuches_Bulto_al').AsInteger;
                  EstSueltos:=FieldByName('Estuches_Sueltos_al').AsInteger;
             end;
        end;
     finally
            Aux.Close;
            FreeAndNil(Aux);
     end;
end;

end.
