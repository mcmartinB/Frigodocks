unit Password;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, ExtCtrls, Buttons,DbTables, Db, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlue, dxGDIPlusClasses, cxImage, cxTextEdit, Menus, cxButtons;

type
  TFPassword = class(TForm)
    cxImage1: TcxImage;
    cUsuario: TcxTextEdit;
    cPwd: TcxTextEdit;
    bAceptar: TcxButton;
    bCancelar: TcxButton;
    spl1: TSplitter;
    teIniciarSesion: TcxTextEdit;
    cxImage2: TcxImage;
    cxImage3: TcxImage;
    procedure FormCreate(Sender: TObject);
    function  ComprobarUsuario():Boolean;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ActivaColor(Sender: TObject);
    procedure DesactivaColor(Sender: TObject);
    procedure Aceptar(Sender: TObject);
    procedure Cancelar(Sender: TObject);
    procedure cPwdExit(Sender: TObject);
    procedure teUsuarioPropertiesChange(Sender: TObject);
    procedure cUsuarioEnter(Sender: TObject);
    procedure cUsuarioExit(Sender: TObject);
    procedure cPwdEnter(Sender: TObject);
  private
         { Private declarations }
         NumIntentos: Integer;
  public
         { Public declarations }
  end;

implementation

{$R *.DFM}

uses MBaseDatos, UGLobal;

//-------------------------- CREACI�N DEL FORMULARIO ---------------------------
procedure TFPassword.FormCreate(Sender: TObject);
begin
//     Image1.Picture.LoadFromFile(GetCurrentDir() + '\Recursos\password.jpg');
     NumIntentos:=3;
end;

//----------------- ACTIVAR EL COLOR AL SALIR DEL CONTROL ----------------------
procedure TFPassword.ActivaColor(Sender: TObject);
begin
     if Sender is  TEDIT then      //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clAqua;
end;

//---------------- DESACTIVAR EL COLOR AL SALIR DEL CONTROL --------------------
procedure TFPassword.DesActivaColor(Sender: TObject);
begin
     if Sender is  TEDIT then      //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clWindow;
end;

//---- FUNCION QUE COMPRUEBA SI EL USUARIO ESTA DADO DE ALTA EN LA APLICACION --
function TFPassword.ComprobarUsuario():Boolean;
Var
   QAux: TQuery;
begin
     ComprobarUsuario:=False;
     try
        QAux:=TQuery.Create(Self);
        try
           QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
           QAux.SQL.Add(' SELECT * FROM USUARIOS ' +
                        ' WHERE CODIGO_U=' + QuotedStr(cUsuario.Text) +
                        ' AND PASSWORD_U=' + QuotedStr(cPwd.Text));
           QAux.Open;
           if not QAux.IsEmpty then
           begin
                if (cUsuario.Text=QAux.FieldByName('Codigo_u').AsString) and (cPwd.Text=QAux.FieldByName('Password_u').AsString) then
                begin
                     UsuarioGlobal:=QAux.FieldByName('Codigo_u').AsString;
                     TipoUsuarioGlobal:=QAux.FieldByName('Tipo_u').AsString;
                     ComprobarUsuario:=True;
                end;
           end;
        finally
               QAux.Close;
               FreeAndNil(QAux);
        end;
     except
           MessageDlg('Problemas al intentar comprobar si el usuario esta registrado',mtError,[mbOk],0);
     end;
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TFPassword.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F5 then        //F5
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TFPassword.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13 then
     begin
          Key:=#0;
          PostMessage(Handle,WM_NEXTDLGCTL,0,0);
     end
     else if Key=#27 then
             Application.Terminate;
end;

procedure TFPassword.teUsuarioPropertiesChange(Sender: TObject);
begin

end;

//-------------------------- BOTON ACEPTAR -------------------------------------
procedure TFPassword.Aceptar(Sender: TObject);
begin
     if cUsuario.Text='' then
     begin
          MessageDlg('Introduzca el nombre de usuario',mtError,[mbOk],0);
          cUsuario.SetFocus;
     end
     else if cPwd.Text='' then
          begin
               MessageDlg('Introduzca la contrase�a',mtError,[mbOk],0);
               cPwd.SetFocus;
          end
          else
          begin
               if not ComprobarUsuario() then
               begin
                    case NumIntentos of
                          3:
                            MessageDlg('El "Nombre de Usuario" o la "Clave de Acceso" no son correctos.' +
                                       Chr(13) + 'Por favor, intente de nuevo la conexi�n.',mtError,[mbOk],0);
                          2:
                            MessageDlg('El "Nombre de Usuario" o la "Clave de Acceso" no son correctos.' +
                                       Chr(13) + 'Por favor, intente de nuevo la conexi�n. Ser� el �ltimo intento que se le permite.',mtError,[mbOk],0);
                          1:
                            begin
                                 MessageDlg('El "Nombre de Usuario" o la "Clave de Acceso" no son correctos.' +
                                            Chr(13) + 'Por favor, si continua teniendo problemas pongase en contacto con el departamento de inform�tica. ' +
                                            Chr(13) + 'No se le permiten m�s intentos.',mtError,[mbOk],0);
                                 Application.Terminate;           
                            end;
                     end;
                     Dec(NumIntentos);
               end
               else
                    Close;
          end;
end;

//-------------------------- BOTON CANCELAR ------------------------------------
procedure TFPassword.Cancelar(Sender: TObject);
begin
     Close;
     //Application.Terminate;
end;

//--------------------- AL SALIR DE LA CONTRASE�A ------------------------------
procedure TFPassword.cPwdEnter(Sender: TObject);
begin
  if cPwd.Text = 'Introduce Clave' then
  begin
    cPwd.Text := '';
    cPwd.Style.Font.Color := clNone;

    cPwd.Properties.CharCase := ecUpperCase;
    cPwd.Properties.EchoMode := eemPassword;
  end
end;

procedure TFPassword.cPwdExit(Sender: TObject);
begin
  if cPwd.Text = '' then
  begin
    cPwd.Properties.CharCase := ecNormal;
    cPwd.Properties.EchoMode := eemNormal;

    cPwd.Text := 'Introduce Clave';
    cPwd.Style.Font.Color := clBtnShadow;
  end;

   cPwd.Style.Color:=clWindow;

   if (cPwd.Text<>'') and (cUsuario.Text<>'') then
      Aceptar(Self);
end;

procedure TFPassword.cUsuarioEnter(Sender: TObject);
begin
  if cUsuario.Text = 'Introduce Usuario' then
  begin
    cUsuario.Text := '';
    cUsuario.Style.Font.Color := clNone;
    
    cUsuario.Properties.CharCase := ecUpperCase;
  end
end;

procedure TFPassword.cUsuarioExit(Sender: TObject);
begin
  if cUsuario.Text = '' then
  begin
    cUsuario.Properties.CharCase := ecNormal;

    cUsuario.Text := 'Introduce Usuario';
    cUsuario.Style.Font.Color := clBtnShadow;
  end;
end;

end.
