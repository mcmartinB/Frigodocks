unit FLTarifas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, DBTables, StdCtrls, ComCtrls,
  ToolWin, Buttons,
  Provider, DBClient, Mask, dxSkinsCore, dxSkinBlue,
  dxSkinsdxBarPainter, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxButtons, SimpleSearch, dxBar, cxClasses;

type
  TListadoTarifas = class(TForm)
    GroupBox1: TGroupBox;
    StaticText2: TStaticText;
    cCodigoDesde: TEdit;
    StaticText3: TStaticText;
    cCodigoHasta: TEdit;
    BarraEstado: TStatusBar;
    StaticText1: TStaticText;
    cEmpresa: TEdit;
    tNomEmpresa: TPanel;
    GroupBox2: TGroupBox;
    cTipo: TComboBox;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    bAceptar: TdxBarLargeButton;
    bSalir: TdxBarLargeButton;
    cLupaEmpresas: TSimpleSearch;
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
    procedure cTipoKeyPress(Sender: TObject; var Key: Char);
    procedure cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaEmpresasClick(Sender: TObject);

  private
    { Private declarations }
    function ValidarSeleccion(): Boolean;

  public
       { Public declarations }
   
  end;

var
   ListadoTarifas: TListadoTarifas;

implementation

uses MBaseDatos, UGLobal, LArticulosCliente, LArticulos, LTarifasLista,
  LTarifasFicha;

{$R *.dfm}

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TListadoTarifas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then  //F5 aceptar
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TListadoTarifas.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TListadoTarifas.Aceptar(Sender: TObject);
Var
   CadSql: String;
begin
     PostMessage(Handle,WM_NEXTDLGCTL,0,0);
     Application.ProcessMessages;
     try
        if ValidarSeleccion() then
        begin
             CadSql:=' SELECT * FROM TARIFAS ' +
                     ' WHERE EMPRESA_T=' + QuotedStr(cEmpresa.Text) +
                     ' AND CODIGO_T BETWEEN ' + QuotedStr(cCodigoDesde.Text) + ' AND ' + QuotedStr(cCodigoHasta.Text) +
                     ' ORDER BY CODIGO_T';

             if cTipo.ItemIndex=0 then
             begin
                  with TQRTarifasFicha.Create(Application) do  //Creamos dinámicamente el report
                  try
                     tEmpresa.Caption:=cEmpresa.Text + '-' + tNomEmpresa.Caption;
                     tTarifas.Caption:=cCodigoDesde.Text + '-' + cCodigoHasta.Text;

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
             else
             begin
                  with TQRTarifasLista.Create(Application) do  //Creamos dinámicamente el report
                  try
                     tEmpresa.Caption:=cEmpresa.Text + '-' + tNomEmpresa.Caption;
                     tTarifas.Caption:=cCodigoDesde.Text + '-' + cCodigoHasta.Text;

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
                  Application.ProcessMessages;
             end;
        end;
     except
           on E:Exception do
                CapturaErrores(E);
     end;
end;

//----------------------- VALIDA LA SELECCION ----------------------------------
function TListadoTarifas.ValidarSeleccion(): Boolean;
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
     else if cCodigoDesde.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta código desde', mtError,[mbOk],0);
          cCodigoDesde.SetFocus;
          Result:=False;
     end
     else if cCodigoHasta.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta código hasta', mtError,[mbOk],0);
          cCodigoHasta.SetFocus;
          Result:=False;
     end
     else if cCodigoDesde.Text>cCodigoHasta.Text then
     begin
          MessageDlg (Chr(13) + 'Rango de códigos incorrecto', mtError,[mbOk],0);
          cCodigoDesde.SetFocus;
          Result:=False;
     end;
end;

//---------------------- PONE EL COLOR DEL FOCO --------------------------------
procedure TListadoTarifas.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clMoneyGreen;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TListadoTarifas.ColorExit(Sender: TObject);
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
procedure TListadoTarifas.ColorExitSinCeros(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clWindow
     else if Sender is TComboBox then           //Si el componente es un TComboBox
             TComboBox(Sender).Color:=clWindow;
end;

//------------------------- CREACION DEL FORMULARIO ----------------------------
procedure TListadoTarifas.FormCreate(Sender: TObject);
begin
     Top:=1;
     Left:=0;

     cEmpresa.Text:=EmpresaGlobal;
end;

//------------------------- CIERRE DEL FORMULARIO ------------------------------
procedure TListadoTarifas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

//------------------------- BOTON SALIR ----------------------------------------
procedure TListadoTarifas.BSalirClick(Sender: TObject);
begin
     Close;
end;

//------------------------ AL CAMBIAR LA EMPRESA -------------------------------
procedure TListadoTarifas.cEmpresaChange(Sender: TObject);
begin
     tNomEmpresa.Caption:= NomEmpresa(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
end;

//--------- PULSACION DE TECLAS EN EL COMBO DE ORDEN ---------------------------
procedure TListadoTarifas.cTipoKeyPress(Sender: TObject; var Key: Char);
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

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TListadoTarifas.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TListadoTarifas.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresa.Text:=CodEmpresa;
     cEmpresa.Setfocus;
end;

end.
