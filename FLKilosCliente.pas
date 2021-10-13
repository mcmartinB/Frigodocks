unit FLKilosCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, DBTables, StdCtrls, ComCtrls,
  ToolWin,  Buttons,
  Provider, DBClient, Mask, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxCore,
  cxDateUtils, dxSkinsCore, dxSkinBlue, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, Menus, dxSkinsdxBarPainter, dxBar, cxClasses, cxButtons,
  SimpleSearch;

type
  TListadoKilosPorCliente = class(TForm)
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
    GroupBox3: TGroupBox;
    cOrden: TComboBox;
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
   ListadoKilosPorCliente: TListadoKilosPorCliente;

implementation

uses MBaseDatos, UGLobal, LKilosCliente;

{$R *.dfm}

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TListadoKilosPorCliente.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then  //F5 aceptar
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TListadoKilosPorCliente.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TListadoKilosPorCliente.Aceptar(Sender: TObject);
Var
   QAux, Query1: TQuery;
   Entradas, Salidas: Real;
begin
     PostMessage(Handle,WM_NEXTDLGCTL,0,0);
     Application.ProcessMessages;
     try
        if ValidarSeleccion() then
        begin
             with TQRKilosPorCliente.Create(Application) do  //Creamos dinámicamente el report
             try
                tEmpresa.Caption:=cEmpresa.Text + '-' + tNomEmpresa.Caption;
                tClientes.Caption:=cClienteDesde.Text + '-' + cClienteHasta.Text;
                tFechas.Caption:=cFechaDesde.Text + '-' + cFechaHasta.Text;

                Query1:=TQuery.Create(Self);
                try
                   Query1.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                   Query1.SQL.Add(' SELECT * FROM CLIENTES ' +
                                  ' WHERE EMPRESA_C=' + QuotedStr(cEmpresa.Text) +
                                  ' AND CODIGO_C BETWEEN ' + QuotedStr(cClienteDesde.Text) + ' AND ' + QuotedStr(cClienteHasta.Text));
                   Query1.Open;
                   if not Query1.IsEmpty then
                   begin
                        ClientDataSet1.CreateDataSet;

                        //ORDEN
                        if cOrden.ItemIndex=0 then
                           ClientDataSet1.IndexFieldNames:='codigo'
                        else if cOrden.ItemIndex=1 then
                                ClientDataSet1.IndexFieldNames:='nombre';

                        ClientDataSet1.Open;
                        QAux:=TQuery.Create(Self);
                        try
                           QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                           while not Query1.Eof do
                           begin
                                //Calculamos el total de entradas
                                QAux.SQL.Clear;
                                QAux.SQL.Add(' SELECT SUM(UNIDADES_LE) AS ENTRADAS ' +
                                             ' FROM CABECERA_ENTRADAS, LINEA_ENTRADAS ' +
                                             ' WHERE EMPRESA_CE=EMPRESA_LE ' +
                                             ' AND ALBARAN_CE=ALBARAN_LE ' +
                                             ' AND FECHA_ALBARAN_CE BETWEEN ' + QuotedStr(AnyoMesDia(cFechaDesde.Text)) + ' AND ' + QuotedStr(AnyoMesDia(cFechaHasta.Text)) +
                                             ' AND CLIENTE_CE=' + QuotedStr(Query1.FieldByName('Codigo_c').AsString));
                                QAux.Open;
                                Entradas:=QAux.FieldByName('Entradas').AsFloat;
                                QAux.Close;

                                //Calculamos el total de salidas
                                QAux.SQL.Clear;
                                QAux.SQL.Add(' SELECT SUM(UNIDADES_LS) AS SALIDAS ' +
                                             ' FROM CABECERA_SALIDAS, LINEA_SALIDAS ' +
                                             ' WHERE EMPRESA_CS=EMPRESA_LS ' +
                                             ' AND ALBARAN_CS=ALBARAN_LS ' +
                                             ' AND FECHA_ALBARAN_CS BETWEEN ' + QuotedStr(AnyoMesDia(cFechaDesde.Text)) + ' AND ' + QuotedStr(AnyoMesDia(cFechaHasta.Text)) +
                                             ' AND CLIENTE_CS=' + QuotedStr(Query1.FieldByName('Codigo_c').AsString));
                                QAux.Open;
                                Salidas:=QAux.FieldByName('Salidas').AsFloat;
                                QAux.Close;

                                //Insertamos en el ClientDataSet (Tabla Temporal)
                                ClientDataSet1.Insert;
                                ClientDataSet1.FieldByName('Codigo').AsString:=Query1.FieldByName('Codigo_c').AsString;
                                ClientDataSet1.FieldByName('Nombre').AsString:=Query1.FieldByName('Nombre_Juridico_c').AsString;
                                ClientDataSet1.FieldByName('Entradas').AsFloat:=Entradas;
                                ClientDataSet1.FieldByName('Salidas').AsFloat:=Salidas;
                                ClientDataSet1.Post;

                                Query1.Next;
                            end;
                        finally
                               FreeAndNil(QAux);
                        end;
                        ClientDataSet1.First;
                        Preview;              //Previsualizamos
                   end
                   else
                       MessageDlg (Chr(13) + 'Listado sin datos', mtError,[mbOk],0);
                 finally
                        Query1.Close;
                        FreeAndNil(Query1);
                 end;
             finally
                    Free;              //Liberamos el Report
             end;
        end;
     except
           on E:Exception do
                CapturaErrores(E);
     end;
end;
//----------------------- VALIDA LA SELECCION ----------------------------------
function TListadoKilosPorCliente.ValidarSeleccion(): Boolean;
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
     end;
end;

//---------------------- PONE EL COLOR DEL FOCO --------------------------------
procedure TListadoKilosPorCliente.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clMoneyGreen;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TListadoKilosPorCliente.ColorExit(Sender: TObject);
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
procedure TListadoKilosPorCliente.ColorExitSinCeros(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clWindow
     else if Sender is TComboBox then           //Si el componente es un TComboBox
             TComboBox(Sender).Color:=clWindow;
end;

//------------------------- CREACION DEL FORMULARIO ----------------------------
procedure TListadoKilosPorCliente.FormCreate(Sender: TObject);
begin
     Top:=1;
     Left:=0;
     cFechaDesde.Text:='01/01/' + IntToStr(Year(date()));
     cFechaHasta.Date:=Date();
     cEmpresa.Text:=EmpresaGlobal;
end;

//------------------------- CIERRE DEL FORMULARIO ------------------------------
procedure TListadoKilosPorCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

//------------------------- BOTON SALIR ----------------------------------------
procedure TListadoKilosPorCliente.BSalirClick(Sender: TObject);
begin
     Close;
end;

//------------------------ AL CAMBIAR LA EMPRESA -------------------------------
procedure TListadoKilosPorCliente.cEmpresaChange(Sender: TObject);
begin
     tNomEmpresa.Caption:= NomEmpresa(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TListadoKilosPorCliente.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TListadoKilosPorCliente.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresa.Text:=CodEmpresa;
     cEmpresa.SetFocus;
end;

end.
