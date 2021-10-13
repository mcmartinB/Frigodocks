unit FRestaurarCopiaSeguridad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ActnMan, ActnCtrls, ExtCtrls, StdCtrls, ComCtrls, DB,
  DBTables, Mask, DBCtrls, SistelDBCtrls, stlEdit, tipos, SistelNumEdit,
  Buttons, ToolEdit, IniFiles, DateUtils, DBClient, Grids, DBGrids;

type
  TRestaurarCopiaSeguridad = class(TForm)
    ToolBar1: TToolBar;
    BAceptar: TToolButton;
    ToolButton5: TToolButton;
    BSalir: TToolButton;
    BarraEstado: TStatusBar;
    PanelClaves: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Aceptar(Sender: TObject);
    procedure Salir(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

  private
    {Private declarations}

  public
    { Public declarations }
  end;

var
   RestaurarCopiaSeguridad: TRestaurarCopiaSeguridad;
   FocoAnt:TWinControl;

implementation

uses UGLobal, MBaseDatos, DM, LFactura;

{$R *.dfm}

//------------------------ CREACION DEL FORMULARIO -----------------------------
procedure TRestaurarCopiaSeguridad.FormCreate(Sender: TObject);
begin
     Top:=1;
     Left:=0;
end;

//------------------------ CIERRE DEL FORMULARIO -------------------------------
procedure TRestaurarCopiaSeguridad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

//----------------------- CIERRRE DEL QUERY DEL FORMULARIO ---------------------
procedure TRestaurarCopiaSeguridad.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
     CanClose:=True;
end;

//------------------------ BOTON ACEPTAR ----------------------------------------
procedure TRestaurarCopiaSeguridad.Aceptar(Sender: TObject);
Var
   Ruta: String;
   QAux: TQuery;
begin
     try
       QAux:=TQuery.Create(Application);
       try
          with QAux do
          begin
               DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
               Ruta:='C:\Proyectos\Frigodocks\Programa\Ejecutable\CopiasSeguridad\Frigo-18_08_2008-12_39_06';
               QAux.SQL.Add('RESTORE DATABASE [Frigo] FROM  DISK = N' +
                            QuotedStr(Ruta) +
                            'WITH  FILE = 1,  NOUNLOAD,  STATS = 10');
               QAux.ExecSQL;
          end;
       finally
              QAux.Close;
              FreeAndNil(QAux);
       end;
     except
           On E: Exception do
                 MessageDlg (Chr(13) + 'Error al realizar la recuperacion de la copia de seguridad', mtError,[mbOk],0);
     end;end;

//----------------------------- SALIR ------------------------------------------
procedure TRestaurarCopiaSeguridad.Salir(Sender: TObject);
begin
     Close;
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TRestaurarCopiaSeguridad.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then        //F5 graba
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TRestaurarCopiaSeguridad.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13 then
     begin
          Key:=#0;
          PostMessage(Handle,WM_NEXTDLGCTL,0,0);
     end
     else if Key=#27 then
          begin
               Key:=#0;
               Close;
          end;
end;


end.
