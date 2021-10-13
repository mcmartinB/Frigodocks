unit FLMovimientosLotesEx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, Mask, ExtCtrls, StdCtrls, Buttons,
  DB, DBTables, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxCore, cxDateUtils, dxSkinsCore, dxSkinBlue, Menus,
  cxButtons, SimpleSearch, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  dxSkinsdxBarPainter, dxBar, cxClasses;

type
  TLMovimientosLotesEx = class(TForm)
    cClientes: TGroupBox;
    StaticText2: TStaticText;
    cClienteDesde: TEdit;
    StaticText3: TStaticText;
    cClienteHasta: TEdit;
    StaticText1: TStaticText;
    cEmpresa: TEdit;
    tNomEmpresa: TPanel;
    GroupBox2: TGroupBox;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    tNomClienteDesde: TPanel;
    tNomClienteHasta: TPanel;
    BarraEstado: TStatusBar;
    Query1: TQuery;
    ProgressBar: TProgressBar;
    cbxFinalizados: TComboBox;
    cFechaDesde: TcxDateEdit;
    cFechaHasta: TcxDateEdit;
    cLupaEmpresas: TSimpleSearch;
    cLupaClienteDesde: TSimpleSearch;
    cLupaClienteHasta: TSimpleSearch;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    bAceptar: TdxBarLargeButton;
    bSalir: TdxBarLargeButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Aceptar(Sender: TObject);
    procedure BSalirClick(Sender: TObject);
    procedure cLupaEmpresasClick(Sender: TObject);
    procedure cEmpresaChange(Sender: TObject);
    procedure ColorEnter(Sender: TObject);
    procedure ColorExit(Sender: TObject);
    procedure cEmpresaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cClienteDesdeChange(Sender: TObject);
    procedure cLupaClientesDesdeClick(Sender: TObject);
    procedure cClienteDesdeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cLupaClientesHastaClick(Sender: TObject);
    procedure cClienteHastaChange(Sender: TObject);
    procedure cClienteHastaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Query1AfterOpen(DataSet: TDataSet);
    procedure Query1BeforeClose(DataSet: TDataSet);
  private
    { Private declarations }
    QueryNumLotes: TQuery;
    QueryMain: TQuery;
    QuerySalidas: TQuery;
    QueryEntradas: TQuery;
    DSMain: TDataSource;

    function ValidarSeleccion: Boolean;
  public
    { Public declarations }
  end;

var
  LMovimientosLotesEx: TLMovimientosLotesEx;


implementation

{$R *.dfm}

uses MBaseDatos, UGLobal, LRMovimientosLotesEx, DateUtils;

procedure TLMovimientosLotesEx.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then  //F5 aceptar
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

procedure TLMovimientosLotesEx.FormKeyPress(Sender: TObject;
  var Key: Char);

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

//----------------------- VALIDA LA SELECCION ----------------------------------
function TLMovimientosLotesEx.ValidarSeleccion: Boolean;
var
  dAux: TDateTime;
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
  if cClienteDesde.Text='' then
  begin
    MessageDlg (Chr(13) + 'Falta el cliente desde', mtError,[mbOk],0);
    cClienteDesde.SetFocus;
    Result:=False;
  end;
  if cClienteHasta.Text='' then
  begin
    MessageDlg (Chr(13) + 'Falta el cliente hasta', mtError,[mbOk],0);
    cClienteHasta.SetFocus;
    Result:=False;
  end;
  if not TryStrToDate(cFechaDesde.Text, dAux ) then
  begin
    MessageDlg (Chr(13) + 'Falta la fecha desde o es incorrecta', mtError,[mbOk],0);
    cFechaDesde.SetFocus;
    Result:=False;
  end;
  if not TryStrToDate(cFechaHasta.Text, dAux ) then
  begin
    MessageDlg (Chr(13) + 'Falta la fecha hasta o es incorrecta', mtError,[mbOk],0);
    cFechaHasta.SetFocus;
    Result:=False;
  end;
end;

procedure TLMovimientosLotesEx.Aceptar(Sender: TObject);
var
  dIni, dFin: TDateTime;
  iDias: integer;
  bFlag: boolean;
begin
   PostMessage(Handle,WM_NEXTDLGCTL,0,0);
   Application.ProcessMessages;
   try
     if ValidarSeleccion() then
     begin
       with TQRMovimientosLotesEx.Create(Application) do  //Creamos dinámicamente el report
         try
            tEmpresa.Caption:=cEmpresa.Text + '-' + tNomEmpresa.Caption;
            cdsMvtoLotes.CreateDataSet;
            try
               cdsMvtoLotes.Open;

               ProgressBar.Min:= 0;
               ProgressBar.Position:=0;
               ProgressBar.Max:= 1;
               ProgressBar.Step:= 1;

               QueryNumLotes.ParamByName('empresa').AsString:= RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I');
               QueryNumLotes.ParamByName('cliente_desde').AsString:= cClienteDesde.Text;
               QueryNumLotes.ParamByName('cliente_hasta').AsString:= cClienteHasta.Text;
               QueryNumLotes.ParamByName('fecha_ini').AsString:= AnyoMesDia( cFechaDesde.date );
               QueryNumLotes.ParamByName('fecha_fin').AsString:= AnyoMesDia( cFechaHasta.date );
               QueryNumLotes.Open;
               ProgressBar.Max:= QueryNumLotes.FieldByName('lotes').AsInteger;


               QueryMain.ParamByName('empresa').AsString:= RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I');
               QueryMain.ParamByName('cliente_desde').AsString:= cClienteDesde.Text;
               QueryMain.ParamByName('cliente_hasta').AsString:= cClienteHasta.Text;
               QueryMain.ParamByName('fecha_ini').AsString:= AnyoMesDia( cFechaDesde.date );
               QueryMain.ParamByName('fecha_fin').AsString:= AnyoMesDia( cFechaHasta.date );
               QueryMain.Open;
               if not QueryMain.IsEmpty then
               begin
                 while not QueryMain.Eof do
                 begin
                   if cbxFinalizados.ItemIndex = 0 then
                   begin
                     //Finalizados
                     bFlag:= QuerySalidas.FieldByName('bultos_ls').AsInteger = QueryEntradas.FieldByName('BULTOS_LE').AsInteger;
                   end
                   else
                   if cbxFinalizados.ItemIndex = 1 then
                   begin
                     //Finalizados
                     bFlag:= QuerySalidas.FieldByName('bultos_ls').AsInteger <> QueryEntradas.FieldByName('BULTOS_LE').AsInteger;
                   end
                   else
                   begin
                     //Indiferente
                     bFlag:= True;
                   end;

                   if bFlag then
                   begin
                     //Insertamos en el ClientDataSet (Tabla Temporal)
                     cdsMvtoLotes.Append;
                     cdsMvtoLotes.FieldByName('empresa').AsString:=QueryMain.FieldByName('EMPRESA').AsString;
                     cdsMvtoLotes.FieldByName('cliente').AsString:=QueryMain.FieldByName('CLIENTE').AsString;
                     cdsMvtoLotes.FieldByName('lote').AsString:=QueryMain.FieldByName('LOTE').AsString;
                     cdsMvtoLotes.FieldByName('lote_origen').AsString:=QueryMain.FieldByName('LOTE_ORIGEN').AsString;
                     //cdsMvtoLotes.FieldByName('factura').AsString:=QueryMain.FieldByName('NUMERO_FACTURA_CS').AsString;
                     //cdsMvtoLotes.FieldByName('fecha_fac').AsString:=QueryMain.FieldByName('FECHA_FACTURA_CS').AsString;

                     //OUT
                     cdsMvtoLotes.FieldByName('fecha_out').AsString:= DiaMesAnyo( QuerySalidas.FieldByName('fecha_albaran_cs').AsString );
                     cdsMvtoLotes.FieldByName('bultos_out').AsInteger:=QuerySalidas.FieldByName('bultos_ls').AsInteger;
                     cdsMvtoLotes.FieldByName('unidades_out').AsInteger:=QuerySalidas.FieldByName('unidades_ls').AsInteger;
                     dFin:= StrToDate( DiaMesAnyo( QuerySalidas.FieldByName('fecha_albaran_cs').AsString ) );

                     //IN
                     cdsMvtoLotes.FieldByName('albaran_in').AsString:=QueryEntradas.FieldByName('ALBARAN_CE').AsString;
                     cdsMvtoLotes.FieldByName('fecha_in').AsString:=DiaMesAnyo( QueryEntradas.FieldByName('FECHA_ALBARAN_CE').AsString );
                     cdsMvtoLotes.FieldByName('bultos_in').AsInteger:=QueryEntradas.FieldByName('BULTOS_LE').AsInteger;
                     cdsMvtoLotes.FieldByName('unidades_in').AsInteger:=QueryEntradas.FieldByName('UNIDADES_LE').AsInteger;
                     dIni:= StrToDate( DiaMesAnyo( QueryEntradas.FieldByName('FECHA_ALBARAN_CE').AsString ) );


                     cdsMvtoLotes.FieldByName('movimientos').AsInteger:=QuerySalidas.FieldByName('salidas').AsInteger;
                     iDias:= Trunc( dFin - dIni );
                     cdsMvtoLotes.FieldByName('dias').AsInteger:= iDias + 1;
                     cdsMvtoLotes.Post;
                   end;

                   QueryMain.Next;
                   ProgressBar.StepIt;
                   Application.ProcessMessages;
                 end;

                 Preview;    //Previsualizamos
               end
               else
                 MessageDlg (Chr(13) + 'Listado sin datos', mtError,[mbOk],0);
            finally
               QueryMain.Close;
               cdsMvtoLotes.Close;
               cdsMvtoLotes.Free;
            end;
         finally
           Free;    //Liberamos el Report
         end;
        end;
   except
     on E:Exception do
         CapturaErrores(E);
   end;

   ProgressBar.Min:= 0;
   ProgressBar.Position:=0;
   ProgressBar.Max:= 1;
   ProgressBar.Step:= 1;
end;

procedure TLMovimientosLotesEx.BSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TLMovimientosLotesEx.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clMoneyGreen;
end;

procedure TLMovimientosLotesEx.ColorExit(Sender: TObject);
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

procedure TLMovimientosLotesEx.cEmpresaChange(Sender: TObject);
begin
   tNomEmpresa.Caption:= NomEmpresa(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
end;

procedure TLMovimientosLotesEx.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresa.Text:=CodEmpresa;
     cEmpresa.SetFocus;
end;

procedure TLMovimientosLotesEx.cEmpresaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

procedure TLMovimientosLotesEx.cClienteDesdeChange(Sender: TObject);
begin
     tNomClienteDesde.Caption:=NomCliente(cEmpresa.Text, RellenarCeros(cClienteDesde.Text,cClienteDesde.MaxLength,'I'));
end;


procedure TLMovimientosLotesEx.cLupaClientesDesdeClick(Sender: TObject);
Var
   CodCliente: String;
begin
     if cEmpresa.Text<>'' then
     begin
          CodCliente:=LupaClientes(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
          if CodCliente<>'' then
             cClienteDesde.Text:=CodCliente;
          cClienteDesde.SetFocus;
     end
     else
     begin
          MessageDlg (Chr(13) + 'Seleccione antes la empresa', mtError,[mbOk],0);
          cEmpresa.SetFocus;
     end;
end;

procedure TLMovimientosLotesEx.cClienteDesdeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=VK_F2 then
        cLupaClientesDesdeClick( self );
end;

procedure TLMovimientosLotesEx.cClienteHastaChange(Sender: TObject);
begin
     tNomClienteHasta.Caption:=NomCliente(cEmpresa.Text, RellenarCeros(cClienteHasta.Text,cClienteHasta.MaxLength,'I'));
end;

procedure TLMovimientosLotesEx.cLupaClientesHastaClick(Sender: TObject);
Var
   CodCliente: String;
begin
     if cEmpresa.Text<>'' then
     begin
          CodCliente:=LupaClientes(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
          if CodCliente<>'' then
             cClienteHasta.Text:=CodCliente;
          cClienteHasta.SetFocus;
     end
     else
     begin
          MessageDlg (Chr(13) + 'Seleccione antes la empresa', mtError,[mbOk],0);
          cEmpresa.SetFocus;
     end;
end;

procedure TLMovimientosLotesEx.cClienteHastaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=VK_F2 then
        cLupaClientesHastaClick(Self);
end;

procedure TLMovimientosLotesEx.FormCreate(Sender: TObject);
var
  dFEcha: TDateTime;
  iMes, iDia, iAno: word;
begin
  cEmpresa.Text:= '001';
  dFEcha:= IncMonth( Now, -1 );
  Decodedate( dFEcha, iAno, iMes, iDia );
  cFechaDesde.Date:= EncodeDate( iAno, iMes, 1 );
  cFechaHasta.Date:= EncodeDate( iAno, iMes, DaysInAMonth( iAno, iMes ) );

  //NUM LOTES
  QueryNumLotes:=TQuery.Create(Self);
  QueryNumLotes.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
  QueryNumLotes.SQL.Add(' SELECT count( distinct LOTE_LS ) LOTES ');
  QueryNumLotes.SQL.Add(' FROM CABECERA_SALIDAS ');
  QueryNumLotes.SQL.Add('      JOIN LINEA_SALIDAS ON EMPRESA_CS=EMPRESA_LS  AND ALBARAN_CS=ALBARAN_LS ');
  QueryNumLotes.SQL.Add(' WHERE EMPRESA_CS=:empresa ');
  QueryNumLotes.SQL.Add(' AND CLIENTE_CS BETWEEN :cliente_desde and :cliente_hasta ');
  QueryNumLotes.SQL.Add(' AND FECHA_ALBARAN_CS BETWEEN :fecha_ini and :fecha_fin ');

  //LOTES CON SALIDA EN EL PERIODO
  QueryMain:=TQuery.Create(Self);
  QueryMain.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
  //NUMERO_FACTURA_CS, FECHA_FACTURA_CS,
  QueryMain.SQL.Add(' SELECT CS1.EMPRESA_CS EMPRESA, CS1.CLIENTE_CS CLIENTE, CL1.LOTE_LS LOTE, CL1.LOTE_ORIGEN_LS LOTE_ORIGEN ');
  QueryMain.SQL.Add(' FROM CABECERA_SALIDAS CS1');
  QueryMain.SQL.Add('      JOIN LINEA_SALIDAS CL1 ON CS1.EMPRESA_CS=CL1.EMPRESA_LS  AND CS1.ALBARAN_CS=CL1.ALBARAN_LS ');
  QueryMain.SQL.Add(' WHERE CS1.EMPRESA_CS=:empresa ');
  QueryMain.SQL.Add(' AND CS1.CLIENTE_CS BETWEEN :cliente_desde and :cliente_hasta ');
  QueryMain.SQL.Add(' AND CS1.FECHA_ALBARAN_CS BETWEEN :fecha_ini and :fecha_fin ');
  QueryMain.SQL.Add(' AND CS1.ALBARAN_CS = (SELECT MAX(CS2.ALBARAN_CS) FROM CABECERA_SALIDAS CS2 ');
  QueryMain.SQL.Add(' 												JOIN LINEA_SALIDAS CL2 ON  CS2.EMPRESA_CS=CL2.EMPRESA_LS  AND CS2.ALBARAN_CS=CL2.ALBARAN_LS  ');
  QueryMain.SQL.Add(' 					             WHERE CS2.EMPRESA_CS = CS1.EMPRESA_CS  ');
  QueryMain.SQL.Add(' 						           	 AND CS2.CLIENTE_CS = CS1.CLIENTE_CS  ');
  QueryMain.SQL.Add(' 							           AND CL2.LOTE_LS = CL1.LOTE_LS)       ');

  //QueryMain.SQL.Add(' AND ISNULL(NUMERO_FACTURA_CS,'') = '' ');
  QueryMain.SQL.Add(' GROUP BY EMPRESA_CS, CLIENTE_CS, LOTE_LS, LOTE_ORIGEN_LS ');
  QueryMain.SQL.Add(' ORDER BY EMPRESA_CS, CLIENTE_CS, LOTE_LS, LOTE_ORIGEN_LS ');


  DSMain:= TDataSource.Create( self );
  DSMain.DataSet:= QueryMain;

  QueryMain.AfterOpen:= Query1AfterOpen;
  QueryMain.BeforeClose:= Query1BeforeClose;

  QuerySalidas:=TQuery.Create(Self);
  QuerySalidas.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
  QuerySalidas.SQL.Add(' SELECT max( fecha_albaran_cs ) fecha_albaran_cs, count( distinct albaran_ls ) salidas, ');
  QuerySalidas.SQL.Add('        sum( bultos_ls ) bultos_ls, sum( unidades_ls ) unidades_ls ');
  QuerySalidas.SQL.Add(' FROM CABECERA_SALIDAS ');
  QuerySalidas.SQL.Add('      JOIN LINEA_SALIDAS ON EMPRESA_CS=EMPRESA_LS AND ALBARAN_CS=ALBARAN_LS ');
  QuerySalidas.SQL.Add(' WHERE EMPRESA_CS= :EMPRESA ');
  QuerySalidas.SQL.Add(' AND CLIENTE_CS= :CLIENTE ');
  QuerySalidas.SQL.Add(' AND LOTE_LS= :LOTE ');
  QuerySalidas.DataSource:=  DSMain;

  QueryEntradas:=TQuery.Create(Self);
  QueryEntradas.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
  QueryEntradas.SQL.Add(' SELECT EMPRESA_CE, ALBARAN_CE, FECHA_ALBARAN_CE, CLIENTE_CE, LOTE_LE, ');
  QueryEntradas.SQL.Add('        SUM(BULTOS_LE) BULTOS_LE, SUM(UNIDADES_LE) UNIDADES_LE ');
  QueryEntradas.SQL.Add(' FROM CABECERA_ENTRADAS ');
  QueryEntradas.SQL.Add('      JOIN LINEA_ENTRADAS ON EMPRESA_CE=EMPRESA_LE AND ALBARAN_CE=ALBARAN_LE ');
  QueryEntradas.SQL.Add(' WHERE EMPRESA_CE= :EMPRESA ');
  QueryEntradas.SQL.Add(' AND CLIENTE_CE= :CLIENTE ');
  QueryEntradas.SQL.Add(' AND LOTE_LE= :LOTE ');
  QueryEntradas.SQL.Add(' group by EMPRESA_CE, ALBARAN_CE, FECHA_ALBARAN_CE, CLIENTE_CE, LOTE_LE ');
  QueryEntradas.DataSource:=  DSMain;
end;

procedure TLMovimientosLotesEx.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil( QueryNumLotes );
  FreeAndNil( QueryMain );
  FreeAndNil( QuerySalidas );
  FreeAndNil( QueryEntradas );

  Action:= caFree;
end;

procedure TLMovimientosLotesEx.Query1AfterOpen(DataSet: TDataSet);
begin
  QuerySalidas.Open;
  QueryEntradas.Open;
end;

procedure TLMovimientosLotesEx.Query1BeforeClose(DataSet: TDataSet);
begin
  QuerySalidas.Close;
  QueryEntradas.Close;
end;

end.

