unit FLEntradas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, DBTables, StdCtrls, ComCtrls,
  ToolWin, Buttons,
  Provider, DBClient, Mask, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, dxSkinsCore, dxSkinBlue, cxControls, cxContainer, cxEdit, dxCore,
  cxDateUtils, dxSkinsdxBarPainter, dxBar, cxClasses, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxButtons, SimpleSearch;

type
  TListadoEntradas = class(TForm)
    GroupBox1: TGroupBox;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    BarraEstado: TStatusBar;
    StaticText1: TStaticText;
    cEmpresa: TEdit;
    tNomEmpresa: TPanel;
    GroupBox2: TGroupBox;
    cOrden: TComboBox;
    GroupBox3: TGroupBox;
    StaticText5: TStaticText;
    cClienteDesde: TEdit;
    StaticText8: TStaticText;
    cClienteHasta: TEdit;
    GroupBox5: TGroupBox;
    StaticText9: TStaticText;
    cAlbaranDesde: TEdit;
    StaticText10: TStaticText;
    cAlbaranHasta: TEdit;
    GroupBox8: TGroupBox;
    cNormImp: TComboBox;
    Bevel1: TBevel;
    cLupaEmpresas: TSimpleSearch;
    cFechaDesde: TcxDateEdit;
    cxDateEdit1: TcxDateEdit;
    cFechaHasta: TcxDateEdit;
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
    procedure cOrdenKeyPress(Sender: TObject; var Key: Char);
    procedure cNormImpKeyPress(Sender: TObject; var Key: Char);
    procedure cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaEmpresasClick(Sender: TObject);
    procedure cAlbaranDesdeKeyPress(Sender: TObject; var Key: Char);
    procedure cAlbaranHastaKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    function ValidarSeleccion(): Boolean;

  public
       { Public declarations }
   
  end;

var
   ListadoEntradas: TListadoEntradas;

implementation

uses MBaseDatos, UGLobal, LArticulosCliente, LAlmacenesNormal, LAlmacenesCliente,
     LEntradasCliente, LEntradasFecha;

{$R *.dfm}

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TListadoEntradas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then  //F5 aceptar
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TListadoEntradas.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TListadoEntradas.Aceptar(Sender: TObject);
Var
   SqlCad: String;
begin
     try
        PostMessage(Handle,WM_NEXTDLGCTL,0,0);
        Application.ProcessMessages;
        if ValidarSeleccion() then
        begin
             SqlCad:=' SELECT * FROM CABECERA_ENTRADAS, LINEA_ENTRADAS ' +
                     ' WHERE EMPRESA_CE=EMPRESA_LE ' +
                     ' AND ALBARAN_CE=ALBARAN_LE ' +
                     ' AND CLIENTE_CE BETWEEN ' + QuotedStr(cClienteDesde.Text) + ' AND ' + QuotedStr(cClienteHasta.Text) +
                     ' AND ALBARAN_CE BETWEEN ' + QuotedStr(cAlbaranDesde.Text) + ' AND ' + QuotedStr(cAlbaranHasta.Text) +
                     ' AND FECHA_ALBARAN_CE BETWEEN ' + QuotedStr(AnyoMesDia(cFechaDesde.Text)) + ' AND ' + QuotedStr(AnyoMesDia(cFechaHasta.Text));

             if cNormImp.ItemIndex=1 then  //NORMAL
                SqlCad:=SqlCad + ' AND TIPO_ENTRADA_CE=' + QuotedStr('N')
                else if cNormImp.ItemIndex=2 then   //IMPORTACION
                        SqlCad:=SqlCad + ' AND TIPO_ENTRADA_CE=' + QuotedStr('I')
                     else if cNormImp.ItemIndex=3 then   //REGULARIZACION
                             SqlCad:=SqlCad + ' AND TIPO_ENTRADA_CE=' + QuotedStr('R');

             if cOrden.ItemIndex=0 then
             begin
                  SqlCad:=SqlCad + ' ORDER BY CLIENTE_CE, FECHA_ALBARAN_CE, ALBARAN_CE';
                  with TQREntradasCliente.Create(Application) do  //Creamos dinámicamente el report
                  try
                     tEmpresa.Caption:=cEmpresa.Text + '-' + tNomEmpresa.Caption;
                     tClientes.Caption:=cClienteDesde.Text + ' - ' + cClienteHasta.Text;
                     tAlbaranes.Caption:=cAlbaranDesde.Text + ' - ' + cAlbaranHasta.Text;
                     tFechas.Caption:=cFechaDesde.Text + ' - ' + cFechaHasta.Text;
                     tTipos.Caption:=cNormImp.Text;
                     tFecha.Caption:='FECHA: ' + DateToStr(Date());
                     Query1.SQL.Clear;
                     Query1.SQL.Add(SqlCad);
                     Query1.Open;
                     if not Query1.IsEmpty then
                        Preview              //Previsualizamos
                     else
                         MessageDlg (Chr(13) + 'Listado sin datos', mtError,[mbOk],0);
                     Query1.Close;
                  finally
                        Free;              //Liberamos el Report
                        Application.ProcessMessages;
                  end;
             end
             else
             begin
                  SqlCad:=SqlCad + ' ORDER BY FECHA_ALBARAN_CE, ALBARAN_CE';
                  with TQREntradasFecha.Create(Application) do  //Creamos dinámicamente el report
                  try
                     tEmpresa.Caption:=cEmpresa.Text + '-' + tNomEmpresa.Caption;
                     tClientes.Caption:=cClienteDesde.Text + ' - ' + cClienteHasta.Text;
                     tAlbaranes.Caption:=cAlbaranDesde.Text + ' - ' + cAlbaranHasta.Text;
                     tFechas.Caption:=cFechaDesde.Text + ' - ' + cFechaHasta.Text;
                     tTipos.Caption:=cNormImp.Text;
                    tFecha.Caption:='FECHA: ' + DateToStr(Date());
                     Query1.SQL.Clear;
                     Query1.SQL.Add(SqlCad);
                     Query1.Open;
                     if not Query1.IsEmpty then
                        Preview              //Previsualizamos
                     else
                         MessageDlg (Chr(13) + 'Listado sin datos', mtError,[mbOk],0);
                     Query1.Close;
                  finally
                        Free;              //Liberamos el Report
                        Application.ProcessMessages;
                  end;
             end;
        end;
     except
           on E:Exception do
                CapturaErrores(E);
     end;
end;

//----------------------- VALIDA LA SELECCION ----------------------------------
function TListadoEntradas.ValidarSeleccion(): Boolean;
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
     else if cAlbaranDesde.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta albarán desde', mtError,[mbOk],0);
          cAlbaranDesde.SetFocus;
          Result:=False;
     end
     else if cAlbaranHasta.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta albarán hasta', mtError,[mbOk],0);
          cAlbaranHasta.SetFocus;
          Result:=False;
     end
     else if cAlbaranDesde.Text>cAlbaranHasta.Text then
     begin
          MessageDlg (Chr(13) + 'Rango de albaranes incorrecto', mtError,[mbOk],0);
          cAlbaranDesde.SetFocus;
          Result:=False;
     end
     else if not EsFecha(cFechaDesde.Text) then
     begin
          cFechaDesde.SetFocus;
          MessageDlg (Chr(13) + 'La fecha desde es incorrecta', mtError,[mbOk],0);
          Result:=False;
     end
     else if not EsFecha(cFechaHasta.Text) then
     begin
          cFechaHasta.SetFocus;
          MessageDlg (Chr(13) + 'La fecha hasta es incorrecta', mtError,[mbOk],0);
          Result:=False;
     end
     else if cFechaDesde.date>cFechaHasta.date then
     begin
          MessageDlg (Chr(13) + 'Rango de fechas incorrecto', mtError,[mbOk],0);
          cFechaDesde.SetFocus;
          Result:=False;
     end;
end;

//---------------------- PONE EL COLOR DEL FOCO --------------------------------
procedure TListadoEntradas.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clMoneyGreen
     else if Sender is  TcxDateEdit then        //Si el componente es un TDateEdit
             TcxDateEdit(Sender).Style.Color:=clMoneygreen
          else if Sender is TComboBox then           //Si el componente es un TComboBox
                  TComboBox(Sender).Color:=clMoneygreen;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TListadoEntradas.ColorExit(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          TEdit(Sender).Color:=clWindow;
          if Length(TEdit(Sender).Text)>0 then
             TEdit(Sender).Text:=RellenarCeros(TEdit(Sender).Text,TEdit(Sender).MaxLength,'I');
     end
     else if Sender is TComboBox then           //Si el componente es un TComboBox
             TComboBox(Sender).Color:=clWindow
          else if Sender is  TcxDateEdit then        //Si el componente es un TDateEdit
                  TcxDateEdit(Sender).Style.Color:=clWindow;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TListadoEntradas.ColorExitSinCeros(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clWindow
     else if Sender is TComboBox then           //Si el componente es un TComboBox
             TComboBox(Sender).Color:=clWindow
          else if Sender is  TcxDateEdit then        //Si el componente es un TDateEdit
                  TcxDateEdit(Sender).Style.Color:=clWindow;
end;

//------------------------- CREACION DEL FORMULARIO ----------------------------
procedure TListadoEntradas.FormCreate(Sender: TObject);
begin
     Top:=1;
     Left:=0;
     cFechaDesde.Date:=StrToDate('01/01/' + IntToStr(Year(Date())));
     cFechaHasta.Date:=Date();
     cEmpresa.Text:=EmpresaGlobal;
end;

//------------------------- CIERRE DEL FORMULARIO ------------------------------
procedure TListadoEntradas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

//------------------------- BOTON SALIR ----------------------------------------
procedure TListadoEntradas.BSalirClick(Sender: TObject);
begin
     Close;
end;

//------------------------ AL CAMBIAR LA EMPRESA -------------------------------
procedure TListadoEntradas.cEmpresaChange(Sender: TObject);
begin
     tNomEmpresa.Caption:= NomEmpresa(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
end;

//--------- PULSACION DE TECLAS EN EL COMBO DE ORDEN ---------------------------
procedure TListadoEntradas.cOrdenKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key='C') or (Key='c') then  //CLIENTE
        cOrden.ItemIndex:=0
     else if (Key='F') or (Key='f') then  //FECHA ALBARAN
             cOrden.ItemIndex:=1;
     Key:=#0;
end;

//------------------------ PULSACION DE TECLAS EN EL COMBO ---------------------
procedure TListadoEntradas.cNormImpKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key='T') or (Key='t') then  //TODOS
        cNormImp.ItemIndex:=0
     else if (Key='N') or (Key='n') then  //NORMAL
             cNormImp.ItemIndex:=1
          else if (Key='I') or (Key='i') then  //IMPORTACIÓN
                  cNormImp.ItemIndex:=2
               else if (Key='R') or (Key='r') then  //REGULARIZACION
                       cNormImp.ItemIndex:=3;
     Key:=#0;
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TListadoEntradas.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TListadoEntradas.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresa.Text:=CodEmpresa;
     cEmpresa.SetFocus;
end;

//------------------------ SOLO PERMITIMOS PULSAR NUMEROS ----------------------
procedure TListadoEntradas.cAlbaranDesdeKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key<>'1') and (Key<>'2')and (Key<>'3') and (Key<>'4') and (Key<>'5') and
        (Key<>'6') and (Key<>'7') and (Key<>'8') and (Key<>'9') and (Key<>'0') and (Key<>#8) then
         Key:=#0;
end;

//------------------------ SOLO PERMITIMOS PULSAR NUMEROS ----------------------
procedure TListadoEntradas.cAlbaranHastaKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key<>'1') and (Key<>'2')and (Key<>'3') and (Key<>'4') and (Key<>'5') and
        (Key<>'6') and (Key<>'7') and (Key<>'8') and (Key<>'9') and (Key<>'0') and (Key<>#8) then
         Key:=#0;
end;

end.
