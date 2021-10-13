unit untInterfaces;

interface

uses Messages, Windows, Forms;

const
  kFalse=0;
  kTrue=1;

//************************************** **************************************
//MENSAJES                               **************************************
//************************************** **************************************
  BM_CHILDNOTIFY = WM_APP + 2000;
  {
   CHILD NOTIFY
      WPARAM = (OPEN,ACTIVATE,CLOSE,CHANGE_STATE,CHANGE_RECORD)
      LPARAM = NOTIFY_MESSAGE=(STATE,MASK,REGISTER,REGISTERS,DETAIL,DETAILS)
   CHILD NOTIFY
  }

  BM_PREVIEWNOTIFY = WM_APP + 2001;
  {
   CHILD NOTIFY
      WPARAM = (OPEN,CLOSE)
   CHILD NOTIFY
  }

  BM_ACTIONNOTIFY = WM_APP + 2002;
  {
   CHILD NOTIFY
      WPARAM = Button Press
   CHILD NOTIFY
  }

type
//************************************** **************************************
//ENUMERACIONES                          **************************************
//************************************** **************************************
  //Que es lo que produce el mensaje
  TEnumNotify = (enClose, enOpen, enActivate, enChangeState, enChangeRegister);

  //Estado en el que se encuentra el formulario hijo
  TEnumState = (esNone, esVisualizar, esInsertar, esModificar, esFiltrar, esInsertarDetalle,
                esAnyadirDetalle, esModificarDetalle);

  //Botones de la barra de herramientas
  TEnumButtons = (ebFiltrar, ebModificar, ebInsertar, ebBorrar, ebPrimero, ebAnterior, ebSiguiente,
                  ebModificarDetalle, ebInsertarDetalle, ebBorrarDetalle, ebUltimo, ebArriba, ebAbajo,
                  ebImprimir, ebAceptar, ebCancelar, ebCerrar);
  TSetButtons = set of TEnumButtons;

//************************************** **************************************
//ESTRUCTURAS                            **************************************
//************************************** **************************************
  //Estructura de datos que pasamos al formulario padre para que sepa cual es el estado
  //del formulario hijo
  TNotifyMessageEx = Record
    rState:TEnumState;
    rMask:TSetButtons;
    rRegister:Cardinal;
    rRegisters:Cardinal;
    rDetail:Cardinal;
    rDetails:Cardinal;
  end;
  PNotifyMessageEx = ^TNotifyMessageEx;

//************************************** **************************************
//PROCEDIMIENTOS                         **************************************
//************************************** **************************************
  //Enviamos mensajes al formulario padre
  procedure ChildNotifyEx(AOperation:TEnumNotify;
                        AState:TEnumState;
                        AMask:TSetButtons;
                        ARegister,ARegisters:Cardinal;
                        ADetail:Cardinal=0; ADetails:Cardinal=0);

  //Enviamos mensajes a los formularios hijos
  procedure ButtonPress(Button:Cardinal);

implementation

//Enviamos mensajes al formulario padre
procedure ChildNotifyEx(AOperation:TEnumNotify;
                        AState:TEnumState;
                        AMask:TSetButtons;
                        ARegister,ARegisters:Cardinal;
                        ADetail:Cardinal=0; ADetails:Cardinal=0);
var
  mensaje:TNotifyMessageEx;
begin
  //Construimos estructura con los datos recibidos
  mensaje.rState:=AState;
  mensaje.rMask:=AMask;
  mensaje.rRegister:=ARegister;
  mensaje.rRegisters:=ARegisters;
  mensaje.rDetail:=ADetail;
  mensaje.rDetails:=ADetails;

  //Enviamos mensaje a nuestro padre
  SendMessage(Application.MainForm.Handle, BM_CHILDNOTIFY, Ord(AOperation), Cardinal(@mensaje));
end;
 
//Enviamos mensajes a los formularios hijos
procedure ButtonPress(Button:Cardinal);
begin
     with Application.MainForm do
     begin
          if ActiveMDIChild<>nil then
          begin
               //Enviamos mensaje al hijo activo
               SendMessage(ActiveMDIChild.Handle, BM_ACTIONNOTIFY, Button, 0);
          end;
     end;
end;

end.

