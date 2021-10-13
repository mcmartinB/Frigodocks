unit FLClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, DBTables, StdCtrls, ComCtrls,
  ToolWin, Buttons,
  Provider, DBClient, Mask, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, dxSkinsCore, dxSkinBlue, cxButtons, SimpleSearch,
  dxSkinsdxBarPainter, dxBar, cxClasses;

type
  TListadoClientes = class(TForm)
    BarraEstado: TStatusBar;
    StaticText1: TStaticText;
    cEmpresa: TEdit;
    tNomEmpresa: TPanel;
    GroupBox3: TGroupBox;
    StaticText4: TStaticText;
    cClienteDesde: TEdit;
    StaticText5: TStaticText;
    cClienteHasta: TEdit;
    GroupBox2: TGroupBox;
    cMercancia: TComboBox;
    GroupBox1: TGroupBox;
    cOrden: TComboBox;
    GroupBox4: TGroupBox;
    cTipo: TComboBox;
    cActivo: TComboBox;
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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BSalirClick(Sender: TObject);
    procedure cEmpresaChange(Sender: TObject);
    procedure cMercanciaKeyPress(Sender: TObject; var Key: Char);
    procedure cTipoKeyPress(Sender: TObject; var Key: Char);
    procedure cOrdenKeyPress(Sender: TObject; var Key: Char);
    procedure cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaEmpresasClick(Sender: TObject);
    procedure cActivoKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    function ValidarSeleccion(): Boolean;

  public
       { Public declarations }

  end;

var
   ListadoClientes: TListadoClientes;

implementation

uses MBaseDatos, UGLobal, LClientesFicha, LClientesLista;

{$R *.dfm}

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TListadoClientes.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then  //F5 aceptar
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TListadoClientes.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TListadoClientes.Aceptar(Sender: TObject);
Var
   CadSql: String;
begin
     PostMessage(Handle,WM_NEXTDLGCTL,0,0);
     Application.ProcessMessages;
     try
        if ValidarSeleccion() then
        begin
             CadSql:=' SELECT * FROM CLIENTES ' +
                     ' WHERE EMPRESA_C=' + QuotedStr(cEmpresa.Text) +
                     ' AND CODIGO_C BETWEEN ' + QuotedStr(cClienteDesde.Text) + ' AND ' + QuotedStr(cClienteHasta.Text);

             if cActivo.ItemIndex<>0 then
             begin
                  if cActivo.ItemIndex=1 then
                     CadSql:=CadSql + ' AND ACTIVO_C = 1 '
                  else
                      CadSql:=CadSql + ' AND ACTIVO_C = 0 ';
             end;

             if cMercancia.ItemIndex<>0 then
             begin
                  if cMercancia.ItemIndex=1 then
                     CadSql:=CadSql + ' AND CODIGO_C NOT IN(SELECT CLIENTE_AL FROM ALMACENES WHERE EMPRESA_AL=EMPRESA_C AND (UNIDADES_ENTRADAS_AL-UNIDADES_SALIDAS_AL- UNIDADES_MERMAS_AL - UNIDADES_DESTRUIDAS_AL)>0)'
                  else
                      CadSql:=CadSql + ' AND CODIGO_C IN(SELECT CLIENTE_AL FROM ALMACENES WHERE EMPRESA_AL=EMPRESA_C AND (UNIDADES_ENTRADAS_AL-UNIDADES_SALIDAS_AL- UNIDADES_MERMAS_AL - UNIDADES_DESTRUIDAS_AL)>0)';
             end;

             if cOrden.ItemIndex=0 then
                CadSql:=CadSql + ' ORDER BY CODIGO_C'
             else
                 CadSql:=CadSql + ' ORDER BY NOMBRE_JURIDICO_C';

             if cTipo.ItemIndex=0 then //Ficha
             begin
                  with TQRClientesFicha.Create(Application) do  //Creamos dinámicamente el report
                  try
                     tEmpresa.Caption:=cEmpresa.Text + '-' + tNomEmpresa.Caption;
                     tClientes.Caption:=cClienteDesde.Text + '-' + cClienteHasta.Text;
                     tMercancia.Caption:=cMercancia.Text;

                     Query1.Close;
                     Query1.SQL.Clear;
                     Query1.SQL.Add(CadSql);
                     Query1.Open;
                     if not Query1.IsEmpty then
                        Preview              //Previsualizamos
                     else
                         MessageDlg (Chr(13) + 'Listado sin datos', mtError,[mbOk],0);
                     Query1.Close;
                  finally
                      Free;              //Liberamos el Report
                  end;
             end
             else   //Lista
             begin
                  with TQRClientesLista.Create(Application) do  //Creamos dinámicamente el report
                  try
                     tEmpresa.Caption:=cEmpresa.Text + '-' + tNomEmpresa.Caption;
                     tClientes.Caption:=cClienteDesde.Text + '-' + cClienteHasta.Text;
                     tMercancia.Caption:=cMercancia.Text;
                     
                     Query1.Close;
                     Query1.SQL.Clear;
                     Query1.SQL.Add(CadSql);
                     Query1.Open;
                     if not Query1.IsEmpty then
                        Preview              //Previsualizamos
                     else
                         MessageDlg (Chr(13) + 'Listado sin datos', mtError,[mbOk],0);
                     Query1.Close;
                  finally
                      Free;              //Liberamos el Report
                  end;
             end;
             Application.ProcessMessages;
        end;
     except
           on E:Exception do
                CapturaErrores(E);
     end;
end;

//----------------------- VALIDA LA SELECCION ----------------------------------
function TListadoClientes.ValidarSeleccion(): Boolean;
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
     end;
end;

//---------------------- PONE EL COLOR DEL FOCO --------------------------------
procedure TListadoClientes.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clMoneyGreen;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TListadoClientes.ColorExit(Sender: TObject);
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

//------------------------- CREACION DEL FORMULARIO ----------------------------
procedure TListadoClientes.FormCreate(Sender: TObject);
begin
     Top:=1;
     Left:=0;

     cActivo.ItemIndex:=0;
     cTipo.ItemIndex:=1;
     cMercancia.ItemIndex:=0;
     cOrden.ItemIndex:=1;

     cEmpresa.Text:=EmpresaGlobal;
end;

//------------------------- CIERRE DEL FORMULARIO ------------------------------
procedure TListadoClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

//------------------------- BOTON SALIR ----------------------------------------
procedure TListadoClientes.BSalirClick(Sender: TObject);
begin
     Close;
end;

//------------------------ AL CAMBIAR LA EMPRESA -------------------------------
procedure TListadoClientes.cEmpresaChange(Sender: TObject);
begin
     tNomEmpresa.Caption:= NomEmpresa(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
end;

//-------------- PULSACION DE TECLAS EN EL COMBO DE MERCANCIA ------------------
procedure TListadoClientes.cMercanciaKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key='T') or (Key='t') then
     begin
          Key:=#0;
          cMercancia.ItemIndex:=0;
          cMercancia.Text:='TODOS';
     end
     else if (Key='S') or (Key='s') then
     begin
          Key:=#0;
          cMercancia.ItemIndex:=1;
          cMercancia.Text:='SIN MERCANCÍA';
     end
     else if (Key='C') or (Key='c') then
     begin
          Key:=#0;
          cMercancia.ItemIndex:=2;
          cMercancia.Text:='CON MERCANCÍA';
     end
     else
          Key:=#0;
end;

//-------------- PULSACION DE TECLAS EN EL COMBO DE TIPO -----------------------
procedure TListadoClientes.cTipoKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key='F') or (Key='f') then
     begin
          Key:=#0;
          cTipo.ItemIndex:=0;
          cTipo.Text:='FICHA';
     end
     else if (Key='L') or (Key='l') then
     begin
          Key:=#0;
          cTipo.ItemIndex:=1;
          cTipo.Text:='LISTA';
     end
     else
         Key:=#0;
end;

//-------------- PULSACION DE TECLAS EN EL COMBO DE ORDEN ----------------------
procedure TListadoClientes.cOrdenKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key='C') or (Key='c') then
     begin
          Key:=#0;
          cOrden.ItemIndex:=0;
          cOrden.Text:='CÓDIGO';
     end
     else if (Key='N') or (Key='n') then
     begin
          Key:=#0;
          cOrden.ItemIndex:=1;
          cOrden.Text:='NOMBRE';
     end
     else
         Key:=#0;
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TListadoClientes.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TListadoClientes.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresa.Text:=CodEmpresa;
     cEmpresa.Setfocus;
end;

procedure TListadoClientes.cActivoKeyPress(Sender: TObject;
  var Key: Char);
begin
     if (Key='T') or (Key='t') then
     begin
          Key:=#0;
          cActivo.ItemIndex:=0;
          cActivo.Text:='TODOS';
     end
     else if (Key='A') or (Key='a') then
     begin
          Key:=#0;
          cActivo.ItemIndex:=1;
          cActivo.Text:='ACTIVOS';
     end
     else if (Key='N') or (Key='n') then
     begin
          Key:=#0;
          cActivo.ItemIndex:=2;
          cActivo.Text:='NO ACTIVOS';
     end
     else
          Key:=#0;
end;

end.
