unit FContabilizacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, DBTables, StdCtrls, ComCtrls,
  ToolWin, Buttons,
  Provider, DBClient, Mask,  cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, dxSkinsCore, dxSkinBlue, dxSkinsdxBarPainter,
  dxBar, cxClasses, cxButtons, SimpleSearch;

type
  TContabilizacion = class(TForm)
    BarraEstado: TStatusBar;
    StaticText1: TStaticText;
    cEmpresa: TEdit;
    tNomEmpresa: TPanel;
    Bevel1: TBevel;
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
    function  ValidarSeleccion(): Boolean;
    function  LeerEmpresa(Empresa: String; Var CtaIngresos: Integer; Var CtaIva, Seccion, CtaIngresosAnalitica, Planta: String):Integer;
    procedure Contabilizar(Empresa: String);
  public
       { Public declarations }

  end;

var
   Contabilizacion: TContabilizacion;

implementation

uses MBaseDatos, UGLobal, LArticulosCliente, LAlmacenesNormal, LAlmacenesCliente;

{$R *.dfm}

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TContabilizacion.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then  //F5 aceptar
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TContabilizacion.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TContabilizacion.Aceptar(Sender: TObject);
begin
     try
        PostMessage(Handle,WM_NEXTDLGCTL,0,0);
        Application.ProcessMessages;
        if ValidarSeleccion() then
           Contabilizar(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
     except
           on E:Exception do
                CapturaErrores(E);
     end;
end;

//----------------------- VALIDA LA SELECCION ----------------------------------
function TContabilizacion.ValidarSeleccion(): Boolean;
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
     end;
end;

//---------------------- PONE EL COLOR DEL FOCO --------------------------------
procedure TContabilizacion.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clMoneyGreen
//     else if Sender is  TcxDateEdit then        //Si el componente es un TDateEdit
//             TcxDateEdit(Sender).Color:=clMoneygreen
          else if Sender is TComboBox then           //Si el componente es un TComboBox
                  TComboBox(Sender).Color:=clMoneygreen;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TContabilizacion.ColorExit(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          TEdit(Sender).Color:=clWindow;
          if Length(TEdit(Sender).Text)>0 then
             TEdit(Sender).Text:=RellenarCeros(TEdit(Sender).Text,TEdit(Sender).MaxLength,'I');
     end
     else if Sender is TComboBox then           //Si el componente es un TComboBox
             TComboBox(Sender).Color:=clWindow;
//          else if Sender is  TDateEdit then        //Si el componente es un TDateEdit
//                  TDateEdit(Sender).Color:=clWindow;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TContabilizacion.ColorExitSinCeros(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clWindow
     else if Sender is TComboBox then           //Si el componente es un TComboBox
             TComboBox(Sender).Color:=clWindow;
//          else if Sender is  TDateEdit then        //Si el componente es un TDateEdit
//                  TDateEdit(Sender).Color:=clWindow;
end;

//------------------------- CREACION DEL FORMULARIO ----------------------------
procedure TContabilizacion.FormCreate(Sender: TObject);
begin
     Top:=1;
     Left:=0;

     cEmpresa.Text:=EmpresaGlobal;
end;

//------------------------- CIERRE DEL FORMULARIO ------------------------------
procedure TContabilizacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

//------------------------- BOTON SALIR ----------------------------------------
procedure TContabilizacion.BSalirClick(Sender: TObject);
begin
     Close;
end;

//------------------------ AL CAMBIAR LA EMPRESA -------------------------------
procedure TContabilizacion.cEmpresaChange(Sender: TObject);
begin
     tNomEmpresa.Caption:= NomEmpresa(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TContabilizacion.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TContabilizacion.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresa.Text:=CodEmpresa;
     cEmpresa.SetFocus;
end;

//------------ LEEMOS EL NUMERADOR CONTABILIZACIONES Y LO INCREMENTAMOS -------------
function TContabilizacion.LeerEmpresa(Empresa: String; Var CtaIngresos: Integer; Var CtaIva, Seccion, CtaIngresosAnalitica, Planta: String):Integer;
Var
   QAux: TQuery;
begin
     try
        QAux:=TQuery.Create(nil);
        try
           QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

           //Leemos el Numerador de Contabilizaciones
           QAux.SQL.Add(' SELECT * ' +
                        ' FROM EMPRESAS ' +
                        ' WHERE CODIGO_E=' + QuotedStr(Empresa));
           QAux.Open;
           CtaIngresos:=QAux.FieldByName('cuenta_ingresos_e').AsInteger;
           CtaIva:=QAux.FieldByName('cuenta_iva_e').AsString;
           Seccion:=QAux.FieldByName('seccion_e').AsString;
           CtaIngresosAnalitica:=QAux.FieldByName('cta_ingre_anali_e').AsString;
           Planta:=QAux.FieldByName('planta_e').AsString;
           Result:=QAux.FieldByName('num_conta_e').AsInteger;

           if not QAux.IsEmpty then
           begin
                //Modifico el Valor del Numerador de Albaranes
                 QAux.Close;
                 QAux.SQL.Clear;
                 QAux.SQL.Add(' UPDATE EMPRESAS ' +
                              ' SET NUM_CONTA_E=NUM_CONTA_E + 1 ' +
                              ' WHERE CODIGO_E=' + QuotedStr(Empresa));
                 QAux.ExecSql;
           end;
        finally
               QAux.Close;
               FreeAndNil(QAux);
        end;
     except
           on E:Exception do
                begin
                     CapturaErrores(E);
                     MessageDlg (Chr(13) + 'Error al leer el contador de contabilizaciones', mtError,[mbOk],0);
                     Result:=0;
                end;
     end;
end;

//------------ REALIZA LA COPIA DE SEGURIDAD DE LA BASE DE DATOS ---------------
procedure TContabilizacion.Contabilizar(Empresa: String);
Var
   QFacturas, QClientes, QAux: TQuery;
   DirDestino, NomFichero: String;
   NumConta, CtaIngresos: Integer;
   CtaIva, Seccion, CtaIngresosAnalitica, Planta: String;
   Fichero: TextFile;
begin
     if MessageBox(Application.Handle, PChar('¿Desea realizar la contabilización?'),
                   PChar('CONTABILIZACIÓN'),
                   MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1)=IDYES then
     begin
          QFacturas:=TQuery.Create(Self);
          QClientes:=TQuery.Create(Self);
          QAux:=TQuery.Create(Self);
          try
             //Clientes
             QClientes.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
             QClientes.SQL.Add(' SELECT CUENTA_CONTABLE_C, CODIGO_PAGO_C ' +
                               ' FROM CLIENTES ' +
                               ' WHERE EMPRESA_C=' + QuotedStr(Empresa) +
                               ' AND CODIGO_C=:Cliente');
             QClientes.Prepare;

             //Facturas
             QFacturas.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
             QFacturas.SQL.Add(' SELECT * FROM CABECERA_FACTURAS ' +
                               ' WHERE EMPRESA_CF=' + QuotedStr(Empresa) +
                               ' AND (NUM_CONTABILIZACION_CF IS NULL OR NUM_CONTABILIZACION_CF=0)' +
                               ' AND (FECHA_CONTABILIZACION_CF IS NULL OR FECHA_CONTABILIZACION_CF=' + QuotedStr('') + ')' +
                               ' ORDER BY CLIENTE_CF, NUMERO_FACTURA_CF, FECHA_FACTURA_CF');

             //Query de Contabilizacion
             QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
             QAux.SQL.Add(' UPDATE CABECERA_FACTURAS ' +
                          ' SET NUM_CONTABILIZACION_CF=:NumConta, ' +
                          '     FECHA_CONTABILIZACION_CF=:FechaConta ' +
                          ' WHERE EMPRESA_CF=' + QuotedStr(Empresa) +
                          ' AND NUMERO_FACTURA_CF=:Factura');
             QAux.Prepare;

             QFacturas.Open;
             if not QFacturas.IsEmpty() then
             begin
                  DirDestino:=ExtractFilePath(Application.ExeName) + 'Contabilizado';
                  if DirectoryExists(DirDestino) then
                  begin
                       NumConta:=LeerEmpresa(Empresa, CtaIngresos, CtaIva, Seccion, CtaIngresosAnalitica, Planta);
                       if NumConta<>0 then
                       begin
                            NomFichero:='BIC049_' + IntToStr(NumConta) + '.txt';
                            DirDestino:=DirDestino + '\' + NomFichero;
                            //Abrimos el Fichero
                            AssignFile(Fichero, DirDestino);
                            Rewrite(Fichero);
                            try
                               While not QFacturas.Eof do
                               begin
                                    QClientes.Close;
                                    QClientes.ParamByName('Cliente').AsString:=QFacturas.FieldByName('Cliente_cf').AsString;
                                    QClientes.Open;

                                    Writeln(Fichero,
                                            'T;FGC;FCP-049' +
                                            Copy(QFacturas.FieldByName('Fecha_Factura_cf').AsString,3,2) +                         //2 Digitos del año
                                            '-' +
                                            RellenarCeros(IntToStr(QFacturas.FieldByName('Numero_Factura_cf').AsInteger),5,'I') +  //Numero de factura
                                            ';' +
                                            Planta +
                                            ';' +
                                            CtaIva +
                                            ';' +
                                            DiaMesAnyo(QFacturas.FieldByName('Fecha_Factura_cf').AsString) +
                                            ';' +
                                            QClientes.FieldByName('Cuenta_Contable_c').AsString +
                                            ';001;EUR;1;' +
                                            QClientes.FieldByName('Cuenta_Contable_c').AsString +
                                            ';001;PEN;;' +
                                            DiaMesAnyo(QFacturas.FieldByName('Fecha_Factura_cf').AsString) +
                                            ';;');

                                    Writeln(Fichero,
                                            'D;1;' +
                                            Planta +
                                            ';SPA;' +
                                            IntToStr(CtaIngresos) +
                                            ';AES;' +
                                            CtaIngresosAnalitica +
                                            ';' +
                                            FloatToStr(QFacturas.FieldByName('Importe_Neto_cf').AsFloat) +
                                            ';' +
                                            CtaIva +
                                            ';FGC ' +
                                            QClientes.FieldByName('Cuenta_Contable_c').AsString );

                                    Writeln(Fichero,
                                            'A;1;1;' +
                                            //CtaIngresosAnalitica +
                                            'AX1;' +
                                            Seccion +
                                            ';;;;;;;' +
                                            FloatToStr(QFacturas.FieldByName('Importe_Neto_cf').AsFloat) +
                                            ';;');

                                    Writeln(Fichero,
                                            'E;1;' +
                                            DiaMesAnyo(QFacturas.FieldByName('Fecha_Factura_cf').AsString) +
                                            ';' +
                                            CtaIva +
                                            ';' +
                                            QClientes.FieldByName('Codigo_pago_c').AsString +
                                            ';' +
                                            FloatToStr(QFacturas.FieldByName('Importe_Bruto_cf').AsFloat) +
                                            ';001;001');

                                    QAux.Close;
                                    QAux.ParamByName('NumConta').AsInteger:=NumConta;
                                    QAux.ParamByName('FechaConta').AsString:=AnyoMesDia(Date());
                                    QAux.ParamByName('Factura').AsInteger:=QFacturas.FieldByName('Numero_Factura_cf').AsInteger;
                                    QAux.ExecSQL;

                                    QFacturas.Next;
                               end;
                            finally
                                   CloseFile(Fichero);
                            end;
                            Reset(Fichero);
                            if FileSize(Fichero)<>0 then
                               MessageDlg (Chr(13) + 'Contabilización Finalizada.' + chr(13) + chr(13) +
                                           'Nº de contabilización: ' + IntToStr(NumConta) + chr(13) + chr(13) +
                                           'Nombre del Fichero: ' + NomFichero, mtInformation,[mbOk],0)
                            else
                                MessageDlg (Chr(13) + 'El fichero de contabilización está vacío', mtInformation,[mbOk],0);
                            CloseFile(Fichero);
                       end;
                  end
                     else
                         MessageDlg(Chr(13) +
                                    'La ruta de contabilización no existe.' +
                                    Chr(13) +
                                    'El proceso no puede continuar.', mtError,[mbOk],0);
             end
             else
                 MessageDlg (Chr(13) + 'No existe ninguna factura a contabilizar', mtInformation,[mbOk],0);
          finally
                 QFacturas.Close;
                 FreeAndNil(QFacturas);
                 QClientes.Close;
                 FreeAndNil(QClientes);
                 QAux.Close;
                 FreeAndNil(QAux);
          end;
     end;
end;


end.
