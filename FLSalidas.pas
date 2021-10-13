unit FLSalidas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, DBTables, StdCtrls, ComCtrls,
  ToolWin,Buttons,
  Provider, DBClient, Mask, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxCore,
  cxDateUtils, dxSkinsCore, dxSkinBlue, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, Menus, dxSkinsdxBarPainter, dxBar, cxClasses, cxButtons,
  SimpleSearch;

type
  TListadoSalidas = class(TForm)
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
    cTiposLote: TComboBox;
    Bevel1: TBevel;
    GroupBox4: TGroupBox;
    cTipoSalida: TComboBox;
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
    procedure cOrdenKeyPress(Sender: TObject; var Key: Char);
    procedure cTiposLoteKeyPress(Sender: TObject; var Key: Char);
    procedure cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaEmpresasClick(Sender: TObject);
    procedure cAlbaranDesdeKeyPress(Sender: TObject; var Key: Char);
    procedure cAlbaranHastaKeyPress(Sender: TObject; var Key: Char);
    procedure cTipoSalidaKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    function ValidarSeleccion(): Boolean;

  public
       { Public declarations }
   
  end;

var
   ListadoSalidas: TListadoSalidas;

implementation

uses MBaseDatos, UGLobal, LArticulosCliente, LAlmacenesNormal, LAlmacenesCliente,
     LSalidasCliente, LSalidasFecha;

{$R *.dfm}

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TListadoSalidas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then  //F5 aceptar
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TListadoSalidas.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TListadoSalidas.Aceptar(Sender: TObject);
Var
   SqlCad: String;
begin
     try
        PostMessage(Handle,WM_NEXTDLGCTL,0,0);
        Application.ProcessMessages;
        if ValidarSeleccion() then
        begin
             SqlCad:=' SELECT * FROM CABECERA_SALIDAS, LINEA_SALIDAS ' +
                     ' WHERE EMPRESA_CS=EMPRESA_LS ' +
                     ' AND ALBARAN_CS=ALBARAN_LS ' +
                     ' AND CLIENTE_CS BETWEEN ' + QuotedStr(cClienteDesde.Text) + ' AND ' + QuotedStr(cClienteHasta.Text) +
                     ' AND ALBARAN_CS BETWEEN ' + QuotedStr(cAlbaranDesde.Text) + ' AND ' + QuotedStr(cAlbaranHasta.Text) +
                     ' AND FECHA_ALBARAN_CS BETWEEN ' + QuotedStr(AnyoMesDia(cFechaDesde.Text)) + ' AND ' + QuotedStr(AnyoMesDia(cFechaHasta.Text));

             if cTiposLote.ItemIndex=1 then
                SqlCad:=SqlCad + ' AND TIPO_LOTE_LS=' + QuotedStr('N')
             else if cTiposLote.ItemIndex=2 then
                     SqlCad:=SqlCad + ' AND TIPO_LOTE_LS=' + QuotedStr('B')
                  else if cTiposLote.ItemIndex=3 then  //IMPORTACIÓN - ABANDONADO
                          SqlCad:=SqlCad + ' AND TIPO_LOTE_LS=' + QuotedStr('A')
                       else if cTiposLote.ItemIndex=4 then  //IMPORTACIÓN - PENDIENTE AUTORIZACION
                               SqlCad:=SqlCad + ' AND TIPO_LOTE_LS=' + QuotedStr('I')
                            else if cTiposLote.ItemIndex=5 then  //REGULARIZACION
                                    SqlCad:=SqlCad + ' AND TIPO_LOTE_LS=' + QuotedStr('R');

             if cTipoSalida.ItemIndex=1 then  //NORMAL
                SqlCad:=SqlCad + ' AND TIPO_SALIDA_CS=' + QuotedStr('N')
                else if cTipoSalida.ItemIndex=2 then   //DESTRUIDA
                        SqlCad:=SqlCad + ' AND TIPO_SALIDA_CS=' + QuotedStr('D')
                     else if cTipoSalida.ItemIndex=3 then   //REGULARIZACION
                             SqlCad:=SqlCad + ' AND TIPO_SALIDA_CS=' + QuotedStr('R');

             if cOrden.ItemIndex=0 then
             begin
                  SqlCad:=SqlCad + ' ORDER BY CLIENTE_CS, FECHA_ALBARAN_CS, ALBARAN_CS';
                  with TQRSalidasCliente.Create(Application) do  //Creamos dinámicamente el report
                  try
                     tEmpresa.Caption:=cEmpresa.Text + '-' + tNomEmpresa.Caption;
                     tClientes.Caption:=cClienteDesde.Text + ' - ' + cClienteHasta.Text;
                     tAlbaranes.Caption:=cAlbaranDesde.Text + ' - ' + cAlbaranHasta.Text;
                     tFechas.Caption:=cFechaDesde.Text + ' - ' + cFechaHasta.Text;
                     tTiposLote.Caption:= cTiposLote.Text;
                     tTiposSalida.Caption:=cTipoSalida.Text;
                     
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
                  SqlCad:=SqlCad + ' ORDER BY FECHA_ALBARAN_CS, ALBARAN_CS';
                  with TQRSalidasFecha.Create(Application) do  //Creamos dinámicamente el report
                  try
                     tEmpresa.Caption:=cEmpresa.Text + '-' + tNomEmpresa.Caption;
                     tEmpresa.Caption:=cEmpresa.Text + '-' + tNomEmpresa.Caption;
                     tClientes.Caption:=cClienteDesde.Text + ' - ' + cClienteHasta.Text;
                     tAlbaranes.Caption:=cAlbaranDesde.Text + ' - ' + cAlbaranHasta.Text;
                     tFechas.Caption:=cFechaDesde.Text + ' - ' + cFechaHasta.Text;
                     tTiposLote.Caption:= cTiposLote.Text;
                     tTiposSalida.Caption:=cTipoSalida.Text;
                     
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
function TListadoSalidas.ValidarSeleccion(): Boolean;
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
     else if cClienteDesde.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta albarán desde', mtError,[mbOk],0);
          cAlbaranDesde.SetFocus;
          Result:=False;
     end
     else if cClienteHasta.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta albarán hasta', mtError,[mbOk],0);
          cAlbaranHasta.SetFocus;
          Result:=False;
     end
     else if cClienteDesde.Text>cClienteHasta.Text then
     begin
          MessageDlg (Chr(13) + 'Rango de albaranes incorrecto', mtError,[mbOk],0);
          calbaranDesde.SetFocus;
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
     end;
end;

//---------------------- PONE EL COLOR DEL FOCO --------------------------------
procedure TListadoSalidas.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clMoneyGreen
     else if Sender is  TcxDateEdit then        //Si el componente es un TDateEdit
             TcxDateEdit(Sender).Style.Color:=clMoneygreen
          else if Sender is TComboBox then           //Si el componente es un TComboBox
                  TComboBox(Sender).Color:=clMoneygreen;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TListadoSalidas.ColorExit(Sender: TObject);
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
procedure TListadoSalidas.ColorExitSinCeros(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clWindow
     else if Sender is TComboBox then           //Si el componente es un TComboBox
             TComboBox(Sender).Color:=clWindow
          else if Sender is  TcxDateEdit then        //Si el componente es un TDateEdit
                  TcxDateEdit(Sender).Style.Color:=clWindow;
end;

//------------------------- CREACION DEL FORMULARIO ----------------------------
procedure TListadoSalidas.FormCreate(Sender: TObject);
begin
     Top:=1;
     Left:=0;
     cFechaDesde.Date:=StrToDate('01/01/' + IntToStr(Year(Date())));
     cFechaHasta.Date:=Date();
     cEmpresa.Text:=EmpresaGlobal;
end;

//------------------------- CIERRE DEL FORMULARIO ------------------------------
procedure TListadoSalidas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

//------------------------- BOTON SALIR ----------------------------------------
procedure TListadoSalidas.BSalirClick(Sender: TObject);
begin
     Close;
end;

//------------------------ AL CAMBIAR LA EMPRESA -------------------------------
procedure TListadoSalidas.cEmpresaChange(Sender: TObject);
begin
     tNomEmpresa.Caption:= NomEmpresa(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
end;

//--------- PULSACION DE TECLAS EN EL COMBO DE ORDEN ---------------------------
procedure TListadoSalidas.cOrdenKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key='C') or (Key='c') then  //CLIENTE
        cOrden.ItemIndex:=0
     else if (Key='F') or (Key='f') then  //FECHA ALBARAN
             cOrden.ItemIndex:=1;
     Key:=#0;
end;

//------------------------ PULSACION DE TECLAS EN EL COMBO ---------------------
procedure TListadoSalidas.cTiposLoteKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key='T') or (Key='t') then  //TODOS
        cTiposLote.ItemIndex:=0
     else if (Key='N') or (Key='n') then  //NORMAL
             cTiposLote.ItemIndex:=1
          else if (Key='B') or (Key='b') then  //IMPORTACIÓN - ABANDONADO
                  cTiposLote.ItemIndex:=2
               else if (Key='A') or (Key='a') then  //IMPORTACIÓN - ABANDONADO
                       cTiposLote.ItemIndex:=3
                    else if (Key='I') or (Key='i') then  //IMPORTACIÓN - PENDIENTE AUTORIZACION
                            cTiposLote.ItemIndex:=4
                         else if (Key='R') or (Key='r') then  //REGULARIZACION
                                  cTiposLote.ItemIndex:=5;
     Key:=#0;
end;

//------------------------ PULSACION DE TECLAS EN EL COMBO ---------------------
procedure TListadoSalidas.cTipoSalidaKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key='T') or (Key='t') then  //TODOS
        cTipoSalida.ItemIndex:=0
     else if (Key='N') or (Key='n') then  //NORMAL
             cTipoSalida.ItemIndex:=1
          else if (Key='D') or (Key='d') then  //DESTRUIDAS
                  cTipoSalida.ItemIndex:=2
               else if (Key='R') or (Key='r') then  //REGULARIZACION
                       cTipoSalida.ItemIndex:=3;
     Key:=#0;
end;
//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TListadoSalidas.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TListadoSalidas.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresa.Text:=CodEmpresa;
     cEmpresa.SetFocus;
end;

//------------------------ SOLO PERMITIMOS PULSAR NUMEROS ----------------------
procedure TListadoSalidas.cAlbaranDesdeKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key<>'1') and (Key<>'2')and (Key<>'3') and (Key<>'4') and (Key<>'5') and
        (Key<>'6') and (Key<>'7') and (Key<>'8') and (Key<>'9') and (Key<>'0') and (Key<>#8) then
         Key:=#0;
end;

//------------------------ SOLO PERMITIMOS PULSAR NUMEROS ----------------------
procedure TListadoSalidas.cAlbaranHastaKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key<>'1') and (Key<>'2')and (Key<>'3') and (Key<>'4') and (Key<>'5') and
        (Key<>'6') and (Key<>'7') and (Key<>'8') and (Key<>'9') and (Key<>'0') and (Key<>#8) then
         Key:=#0;
end;

end.
