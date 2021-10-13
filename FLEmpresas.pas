unit FLEmpresas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, DBTables, StdCtrls, ComCtrls,
  ToolWin, Buttons,
  Provider, DBClient, Mask, dxSkinsCore, dxSkinBlue,
  dxSkinsdxBarPainter, dxBar, cxClasses;

type
  TListadoEmpresas = class(TForm)
    GroupBox1: TGroupBox;
    StaticText2: TStaticText;
    cEmpresaDesde: TEdit;
    StaticText3: TStaticText;
    cEmpresaHasta: TEdit;
    BarraEstado: TStatusBar;
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

  private
    { Private declarations }
    function ValidarSeleccion(): Boolean;

  public
       { Public declarations }
      
  end;

var
   ListadoEmpresas: TListadoEmpresas;

implementation

uses MBaseDatos, UGLobal, LEmpresa;

{$R *.dfm}

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TListadoEmpresas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then  //F5 aceptar
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TListadoEmpresas.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TListadoEmpresas.Aceptar(Sender: TObject);
begin
     Application.ProcessMessages;
     try
        if ValidarSeleccion() then
        begin
             with TQREmpresa.Create(Application) do  //Creamos dinámicamente el report
             try
                Query1.SQL.Clear;
                Query1.SQL.Add(' SELECT * FROM EMPRESAS ' +
                               ' WHERE CODIGO_E BETWEEN ' + QuotedStr(cEmpresaDesde.Text) + ' AND ' + QuotedStr(cEmpresaHasta.Text) +
                               ' ORDER BY CODIGO_E');
                Query1.Open;
                if not Query1.IsEmpty then
                    Preview              //Previsualizamos
                else
                    MessageDlg (Chr(13) + 'Listado si datos', mtError,[mbOk],0);
                Query1.Close;
              finally
                 Free;              //Liberamos el Report
                 Application.ProcessMessages;
             end;
        end;
     except
           on E:Exception do
                CapturaErrores(E);
     end;
end;

//----------------------- VALIDA LA SELECCION ----------------------------------
function TListadoEmpresas.ValidarSeleccion(): Boolean;
begin
     Result:=True;
     if cEmpresaDesde.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta empresa desde', mtError,[mbOk],0);
          cEmpresaDesde.SetFocus;
          Result:=False;
     end
     else if cEmpresaHasta.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta empresa hasta', mtError,[mbOk],0);
          cEmpresaHasta.SetFocus;
          Result:=False;
     end
     else if cEmpresaDesde.Text>cEmpresaHasta.Text then
     begin
          MessageDlg (Chr(13) + 'Rango de empresas incorrecto', mtError,[mbOk],0);
          cEmpresaDesde.SetFocus;
          Result:=False;
     end;
end;

//---------------------- PONE EL COLOR DEL FOCO --------------------------------
procedure TListadoEmpresas.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clMoneyGreen;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TListadoEmpresas.ColorExit(Sender: TObject);
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
procedure TListadoEmpresas.FormCreate(Sender: TObject);
begin
     Top:=1;
     Left:=0;
end;

//------------------------- CIERRE DEL FORMULARIO ------------------------------
procedure TListadoEmpresas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

//------------------------- BOTON SALIR ----------------------------------------
procedure TListadoEmpresas.BSalirClick(Sender: TObject);
begin
     Close;
end;

end.
