unit FLMovimientosCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, DBTables, StdCtrls, ComCtrls,
  ToolWin, Buttons,
  Provider, DBClient, Mask, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxCore,
  cxDateUtils, dxSkinsCore, dxSkinBlue, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, Menus, cxButtons, SimpleSearch, dxSkinsdxBarPainter, dxBar,
  cxClasses;

type
  TListadoMovimientosCliente = class(TForm)
    cClientes: TGroupBox;
    StaticText2: TStaticText;
    cClienteDesde: TEdit;
    StaticText3: TStaticText;
    cClienteHasta: TEdit;
    BarraEstado: TStatusBar;
    StaticText1: TStaticText;
    cEmpresa: TEdit;
    tNomEmpresa: TPanel;
    GroupBox2: TGroupBox;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    GroupBox4: TGroupBox;
    StaticText4: TStaticText;
    cArticuloDesde: TEdit;
    StaticText5: TStaticText;
    cArticuloHasta: TEdit;
    GroupBox1: TGroupBox;
    StaticText8: TStaticText;
    cFamiliaDesde: TEdit;
    StaticText9: TStaticText;
    cFamiliaHasta: TEdit;
    cFechaDesde: TcxDateEdit;
    cFechaHasta: TcxDateEdit;
    cLupaEmpresas: TSimpleSearch;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    bAceptar: TdxBarLargeButton;
    bSalir: TdxBarLargeButton;
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

  private
    { Private declarations }
    function ValidarSeleccion(): Boolean;

  public
       { Public declarations }
   
  end;

var
   ListadoMovimientosCliente: TListadoMovimientosCliente;

implementation

uses MBaseDatos, UGLobal, LMovimientosCliente;

{$R *.dfm}

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TListadoMovimientosCliente.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then  //F5 aceptar
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TListadoMovimientosCliente.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TListadoMovimientosCliente.Aceptar(Sender: TObject);
Var
   QEntradas, QSalidas, QClientes: TQuery;
   TotalBultosEnt, TotalBultosSal: Integer;
   TotalEstuchesEnt, TotalEstuchesSal: Integer;
   TotalUnidadesEnt, TotalUnidadesSal: Real;
   PrimerRegistroCliente: Boolean;
begin
     TotalBultosEnt:=0;
     TotalEstuchesEnt:=0;
     TotalUnidadesEnt:=0;
     TotalBultosSal:=0;
     TotalEstuchesSal:=0;
     TotalUnidadesSal:=0;

     PostMessage(Handle,WM_NEXTDLGCTL,0,0);
     Application.ProcessMessages;
     try
        if ValidarSeleccion() then
        begin
             with TQRMovimientosCliente.Create(Application) do  //Creamos dinámicamente el report
             try
                tEmpresa.Caption:=cEmpresa.Text + '-' + tNomEmpresa.Caption;
                tClientes.Caption:=cClienteDesde.Text + '-' + cClienteHasta.Text;
                tFechas.Caption:=cFechaDesde.Text + '-' + cFechaHasta.Text;
                tFamilias.Caption:=cFamiliaDesde.Text + '-' + cFamiliaHasta.Text;
                tArticulos.Caption:=cArticuloDesde.Text + '-' + cArticuloHasta.Text;

                QEntradas:=TQuery.Create(Self);
                QSalidas:=TQuery.Create(Self);
                QClientes:=TQuery.Create(Self);
                ClientDataSet1.CreateDataSet;
                try
                   QEntradas.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                   QSalidas.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                   QClientes.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

                   //CLIENTES
                   QCLientes.Close;
                   QClientes.SQL.Clear;
                   QClientes.SQL.Add(' SELECT CODIGO_C FROM CLIENTES ' +
                                     ' WHERE EMPRESA_C=' + QuotedStr(cEmpresa.Text) +
                                     ' AND CODIGO_C BETWEEN ' + QuotedStr(cClienteDesde.Text) + ' AND ' + QuotedStr(cClienteHasta.Text) +
                                     ' GROUP BY CODIGO_C ' +
                                     ' ORDER BY CODIGO_C');
                   QCLientes.Open;
                   //ENTRADAS
                   QEntradas.SQL.Add(' SELECT * FROM CABECERA_ENTRADAS, LINEA_ENTRADAS ' +
                                     ' WHERE EMPRESA_CE=EMPRESA_LE ' +
                                     ' AND ALBARAN_CE=ALBARAN_LE ' +
                                     ' AND EMPRESA_CE=' + QuotedStr(cEmpresa.Text) +
                                     ' AND CLIENTE_CE=:Cliente ' +
                                     ' AND FECHA_ALBARAN_CE BETWEEN ' + QuotedStr(AnyoMesDia(cFechaDesde.Text)) + ' AND ' + QuotedStr(AnyoMesDia(cFechaHasta.Text)) +
                                     ' AND FAMILIA_LE BETWEEN ' + QuotedStr(cFamiliaDesde.Text) + ' AND ' + QuotedStr(cFamiliaHasta.Text) +
                                     ' AND ARTICULO_LE BETWEEN ' + QuotedStr(cArticuloDesde.Text) + ' AND ' + QuotedStr(cArticuloHasta.Text));
                   QEntradas.Prepare;

                   //SALIDAS
                   QSalidas.SQL.Add(' SELECT * FROM CABECERA_SALIDAS, LINEA_SALIDAS ' +
                                    ' WHERE EMPRESA_CS=EMPRESA_LS ' +
                                    ' AND ALBARAN_CS=ALBARAN_LS ' +
                                    ' AND EMPRESA_CS=' + QuotedStr(cEmpresa.Text) +
                                    ' AND CLIENTE_CS=:Cliente ' +
                                    ' AND FECHA_ALBARAN_CS BETWEEN ' + QuotedStr(AnyoMesDia(cFechaDesde.Text)) + ' AND ' + QuotedStr(AnyoMesDia(cFechaHasta.Text)) +
                                    ' AND FAMILIA_LS BETWEEN ' + QuotedStr(cFamiliaDesde.Text) + ' AND ' + QuotedStr(cFamiliaHasta.Text) +
                                    ' AND ARTICULO_LS BETWEEN ' + QuotedStr(cArticuloDesde.Text) + ' AND ' + QuotedStr(cArticuloHasta.Text));
                   QSalidas.Prepare;

                   QClientes.Open;
                   ClientDataSet1.Open;

                   //Para cada Cliente
                   While not QClientes.Eof do
                   begin
                        PrimerRegistroCliente:=True;
                        QEntradas.Close;
                        QEntradas.ParamByName('Cliente').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                        QEntradas.Open;
                        while not QEntradas.Eof do
                        begin
                             //Insertamos en el ClientDataSet (Tabla Temporal)
                             ClientDataSet1.Append;
                             ClientDataSet1.FieldByName('Empresa').AsString:=cEmpresa.Text;
                             ClientDataSet1.FieldByName('Cliente').AsString:=QEntradas.FieldByName('Cliente_ce').AsString;
                             ClientDataSet1.FieldByName('Albaran').AsInteger:=QEntradas.FieldByName('Albaran_ce').AsInteger;
                             ClientDataSet1.FieldByName('Fecha').AsString:=DiaMesAnyo(QEntradas.FieldByName('Fecha_Albaran_ce').AsString);
                             ClientDataSet1.FieldByName('Familia').AsString:=QEntradas.FieldByName('Familia_le').AsString;
                             ClientDataSet1.FieldByName('Articulo').AsString:=QEntradas.FieldByName('Articulo_le').AsString;
                             ClientDataSet1.FieldByName('NomArticulo').AsString:=NomArticulo(cEmpresa.Text,
                                                                                             QEntradas.FieldByName('Familia_le').AsString,
                                                                                             QEntradas.FieldByName('Articulo_le').AsString);
                             ClientDataSet1.FieldByName('LoteEnt').AsString:=QEntradas.FieldByName('Lote_le').AsString;
                             ClientDataSet1.FieldByName('LoteOrigenEnt').AsString:=QEntradas.FieldByName('lote_origen_le').AsString;
                             ClientDataSet1.FieldByName('BultosEnt').AsInteger:=QEntradas.FieldByName('Bultos_le').AsInteger;
                             ClientDataSet1.FieldByName('EstXBulto').AsInteger:=QEntradas.FieldByName('Estuches_Bulto_le').AsInteger;
                             ClientDataSet1.FieldByName('EstuchesSueltosEnt').AsInteger:=QEntradas.FieldByName('Estuches_Sueltos_le').AsInteger;
                             ClientDataSet1.FieldByName('UnidadesEnt').AsFloat:=QEntradas.FieldByName('Unidades_le').AsFloat;
                             ClientDataSet1.FieldByName('TipoEnt').AsString:=QEntradas.FieldByName('Tipo_Entrada_ce').AsString;
                             ClientDataSet1['LoteSal']:=NULL;
                             ClientDataSet1['LoteOrigenSal']:=NULL;
                             ClientDataSet1['TipoSal']:=NULL;
                             ClientDataSet1['BultosSal']:=NULL;
                             ClientDataSet1['EstuchesSueltosSal']:=NULL;
                             ClientDataSet1['UnidadesSal']:=NULL;
                             ClientDataSet1.Post;

                             //Para contar los Clientes que hay en el listado
                             if PrimerRegistroCliente then
                             begin
                                  Inc(NClientes);
                                  PrimerRegistroCliente:=False;
                             end;

                             TotalBultosEnt:=TotalBultosEnt + QEntradas.FieldByName('Bultos_le').AsInteger;
                             TotalEstuchesEnt:=TotalEstuchesEnt +
                                               QEntradas.FieldByName('Estuches_Sueltos_le').AsInteger;
                             TotalUnidadesEnt:=TotalUnidadesEnt + QEntradas.FieldByName('Unidades_le').AsFloat;

                             QEntradas.Next;
                        end;
                        QEntradas.Close;

                        QSalidas.Close;
                        QSalidas.ParamByName('Cliente').AsString:=QClientes.FieldByName('Codigo_c').AsString;
                        QSalidas.Open;
                        while not QSalidas.Eof do
                        begin
                             //Insertamos en el ClientDataSet (Tabla Temporal)
                             ClientDataSet1.Append;
                             ClientDataSet1.FieldByName('Empresa').AsString:=cEmpresa.Text;
                             ClientDataSet1.FieldByName('Cliente').AsString:=QSalidas.FieldByName('Cliente_cs').AsString;
                             ClientDataSet1.FieldByName('Albaran').AsInteger:=QSalidas.FieldByName('Albaran_cs').AsInteger;
                             ClientDataSet1.FieldByName('Fecha').AsString:=DiaMesAnyo(QSalidas.FieldByName('Fecha_Albaran_cs').AsString);
                             ClientDataSet1.FieldByName('Familia').AsString:=QSalidas.FieldByName('Familia_ls').AsString;
                             ClientDataSet1.FieldByName('Articulo').AsString:=QSalidas.FieldByName('Articulo_ls').AsString;
                             ClientDataSet1.FieldByName('NomArticulo').AsString:=NomArticulo(cEmpresa.Text,
                                                                                             QSalidas.FieldByName('Familia_ls').AsString,
                                                                                             QSalidas.FieldByName('Articulo_ls').AsString);
                             ClientDataSet1['LoteEnt']:=NULL;
                             ClientDataSet1['LoteOrigenEnt']:=NULL;
                             ClientDataSet1['TipoEnt']:=NULL;
                             ClientDataSet1['BultosEnt']:=NULL;
                             ClientDataSet1['EstXBulto']:=NULL;
                             ClientDataSet1['EstuchesSueltosEnt']:=NULL;
                             ClientDataSet1['UnidadesEnt']:=NULL;
                             ClientDataSet1.FieldByName('TipoSal').AsString:=QSalidas.FieldByName('Tipo_Lote_ls').AsString;
                             ClientDataSet1.FieldByName('LoteSal').AsString:=QSalidas.FieldByName('Lote_ls').AsString;
                             ClientDataSet1.FieldByName('LoteOrigenSal').AsString:=QSalidas.FieldByName('Lote_origen_ls').AsString;
                             ClientDataSet1.FieldByName('BultosSal').AsInteger:=QSalidas.FieldByName('Bultos_ls').AsInteger;
                             ClientDataSet1.FieldByName('EstuchesSueltosSal').AsInteger:=QSalidas.FieldByName('Estuches_Sueltos_ls').AsInteger;
                             ClientDataSet1.FieldByName('UnidadesSal').AsFloat:=QSalidas.FieldByName('Unidades_ls').AsFloat;
                             ClientDataSet1.Post;

                             //Para contar los Clientes que hay en el listado
                             if PrimerRegistroCliente then
                             begin
                                  Inc(NClientes);
                                  PrimerRegistroCliente:=False;
                             end;

                             TotalBultosSal:=TotalBultosSal + QSalidas.FieldByName('Bultos_ls').AsInteger;
                             TotalEstuchesSal:=TotalEstuchesSal + QSalidas.FieldByName('Estuches_Sueltos_ls').AsInteger;
                             TotalUnidadesSal:=TotalUnidadesSal + QSalidas.FieldByName('Unidades_ls').AsFloat;

                             QSalidas.Next;
                        end;
                        QSalidas.Close;
                        QClientes.Next;
                   end;
                   if not ClientDataSet1.IsEmpty then
                   begin
                        ClientDataSet1.First;

                        tTotalBultosSal.Caption:=FloatToStr(TotalBultosSal);
                        tTotalEstuchesSal.Caption:=IntToStr(TotalEstuchesSal);
                        tTotalUnidadesSal.Caption:=FormatFloat('#,##0.00', TotalUnidadesSal);
                        tTotalBultosEnt.Caption:=FloatToStr(TotalBultosEnt);
                        tTotalEstuchesEnt.Caption:=IntToStr(TotalEstuchesEnt);
                        tTotalUnidadesEnt.Caption:=FormatFloat('#,##0.00', TotalUnidadesEnt);

                        Preview;    //Previsualizamos
                   end
                   else
                       MessageDlg (Chr(13) + 'Listado sin datos', mtError,[mbOk],0);
                 finally
                        QEntradas.Close;
                        QSalidas.Close;
                        QClientes.Close;

                        FreeAndNil(QEntradas);
                        FreeAndNil(QSalidas);
                        FreeAndNil(QClientes);

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
function TListadoMovimientosCliente.ValidarSeleccion(): Boolean;
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
     end
     else if cClienteDesde.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta cliente desde', mtError,[mbOk],0);
          cClienteDesde.SetFocus;
          Result:=False;
     end
     else if cClienteHasta.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta cliente hasta', mtError,[mbOk],0);
          cClienteHasta.SetFocus;
          Result:=False;
     end
     else if cClienteDesde.Text>cClienteHasta.Text then
     begin
          MessageDlg (Chr(13) + 'Rango de clientes incorrecto', mtError,[mbOk],0);
          cClienteDesde.SetFocus;
          Result:=False;
     end
     else if not EsFecha(cFechaDesde.Text) then
     begin
          MessageDlg (Chr(13) + 'La fecha desde es incorrecta', mtError,[mbOk],0);
          cFechaDesde.SetFocus;
          Result:=False;
     end
     else if not EsFecha(cFechaHasta.Text) then
     begin
          MessageDlg (Chr(13) + 'La fecha hasta es incorrecta', mtError,[mbOk],0);
          cFechaHasta.SetFocus;
          Result:=False;
     end
     else if cFechaDesde.Date>cFechaHasta.Date then
     begin
          MessageDlg (Chr(13) + 'Rango de fechas incorrecto', mtError,[mbOk],0);
          cFechaDesde.SetFocus;
          Result:=False;
     end
     else if cFamiliaDesde.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta familia desde', mtError,[mbOk],0);
          cFamiliaDesde.SetFocus;
          Result:=False;
     end
     else if cFamiliaHasta.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta familia hasta', mtError,[mbOk],0);
          cFamiliaHasta.SetFocus;
          Result:=False;
     end
     else if cFamiliaDesde.Text>cFamiliaHasta.Text then
     begin
          MessageDlg (Chr(13) + 'Rango de familias incorrecto', mtError,[mbOk],0);
          cFamiliaDesde.SetFocus;
          Result:=False;
     end
     else if cArticuloDesde.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta artículo desde', mtError,[mbOk],0);
          cArticuloDesde.SetFocus;
          Result:=False;
     end
     else if cArticuloHasta.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta artículo hasta', mtError,[mbOk],0);
          cFamiliaHasta.SetFocus;
          Result:=False;
     end
     else if cArticuloDesde.Text>cArticuloHasta.Text then
     begin
          MessageDlg (Chr(13) + 'Rango de artículos incorrecto', mtError,[mbOk],0);
          cArticuloDesde.SetFocus;
          Result:=False;
     end;
end;

//---------------------- PONE EL COLOR DEL FOCO --------------------------------
procedure TListadoMovimientosCliente.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clMoneyGreen;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TListadoMovimientosCliente.ColorExit(Sender: TObject);
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
procedure TListadoMovimientosCliente.ColorExitSinCeros(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clWindow
     else if Sender is TComboBox then           //Si el componente es un TComboBox
             TComboBox(Sender).Color:=clWindow;
end;

//------------------------- CREACION DEL FORMULARIO ----------------------------
procedure TListadoMovimientosCliente.FormCreate(Sender: TObject);
begin
     Top:=1;
     Left:=0;
     cFechaDesde.Text:='01/01/' + IntToStr(Year(date()));
     cFechaHasta.Date:=Date();
     cEmpresa.Text:=EmpresaGlobal;
end;

//------------------------- CIERRE DEL FORMULARIO ------------------------------
procedure TListadoMovimientosCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

//------------------------- BOTON SALIR ----------------------------------------
procedure TListadoMovimientosCliente.BSalirClick(Sender: TObject);
begin
     Close;
end;

//------------------------ AL CAMBIAR LA EMPRESA -------------------------------
procedure TListadoMovimientosCliente.cEmpresaChange(Sender: TObject);
begin
     tNomEmpresa.Caption:= NomEmpresa(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TListadoMovimientosCliente.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TListadoMovimientosCliente.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresa.Text:=CodEmpresa;
     cEmpresa.SetFocus;
end;

end.
