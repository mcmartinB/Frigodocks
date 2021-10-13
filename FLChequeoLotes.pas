unit FLChequeoLotes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, DBTables, StdCtrls, ComCtrls,
  ToolWin, Buttons,
  Provider, DBClient, Mask, kbmMemTable, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Menus, dxSkinsCore, dxSkinBlue,
  dxSkinsdxBarPainter, dxBar, cxClasses, cxButtons, SimpleSearch;

type
  TChequeoLotes = class(TForm)
    BarraEstado: TStatusBar;
    StaticText1: TStaticText;
    cEmpresa: TEdit;
    tNomEmpresa: TPanel;
    QCabecerasEnt: TQuery;
    QLineasEnt: TQuery;
    QAlmacenes: TQuery;
    kbmMemTable1: TkbmMemTable;
    kbmMemTable1Albaran: TIntegerField;
    kbmMemTable1Fecha: TStringField;
    kbmMemTable1Cliente: TStringField;
    kbmMemTable1Empresa: TStringField;
    kbmMemTable1Familia: TStringField;
    kbmMemTable1Articulo: TStringField;
    kbmMemTable1NomArticulo: TStringField;
    kbmMemTable1NomCliente: TStringField;
    kbmMemTable1Lote: TStringField;
    QAlmacenesUpdate: TQuery;
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
    procedure cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaEmpresasClick(Sender: TObject);

  private
    { Private declarations }
    function ValidarSeleccion(): Boolean;
    procedure ChequearLotesImpotacion(Empresa: String);
  public
       { Public declarations }

  end;

var
   ChequeoLotes: TChequeoLotes;

implementation

uses MBaseDatos, UGLobal, LClientesFicha, LClientesLista, LChequeoLotes,
  LMovimientosCliente;

{$R *.dfm}

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TChequeoLotes.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then  //F5 aceptar
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TChequeoLotes.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TChequeoLotes.Aceptar(Sender: TObject);
Var
   Listado: TQRChequeoLotes;
begin
     Application.ProcessMessages;
     try
        if ValidarSeleccion() then
        begin                                                                                   
             if MessageBox(Handle,
                           PChar('La fecha del sistema es ' + DateToStr(Date()) + '.' + chr(13) +
                                'Si es incorrecta pulse Cancelar y ponga al día su ordenador.' + chr(13) + chr(13) +
                                'Este proceso marca como Lotes de Importación Abandonados ' + chr(13) +
                                'aquellos Lotes de Importación Pendientes de Autorización ' + chr(13) +
                                'que llegaron hace 45 días o más.' + chr(13) +
                                '¿Desea proceder?'),
                          PChar(Self.Caption),
                          MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1)=IDYES then
             begin
                  try
                     ChequearLotesImpotacion(RellenarCeros(cEmpresa.Text, cEmpresa.MaxLength,'I'));
                     if kbmMemTable1.IsEmpty then
                        MessageDlg (Chr(13) + 'No ha sido modificado ningún lote', mtError,[mbOk],0)
                     else
                     begin
                          kbmMemTable1.First;
                          Listado:=TQRChequeoLotes.Create(Self);
                          with Listado do
                          try
                             DataSet:=kbmMemTable1;
                             Fecha.DataSet:=kbmMemTable1;
                             Albaran.DataSet:=kbmMemTable1;
                             Lote.DataSet:=kbmMemTable1;
                             Preview;
                          finally
                                 FreeAndNil(Listado);
                          end;
                          Application.ProcessMessages;
                     end;
                 finally
                        kbmMemTable1.Close;
                 end;
             end;
        end;
     except
           on E:Exception do
                CapturaErrores(E);
     end;
end;

//----------------------- VALIDA LA SELECCION ----------------------------------
function TChequeoLotes.ValidarSeleccion(): Boolean;
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
procedure TChequeoLotes.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clMoneyGreen;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TChequeoLotes.ColorExit(Sender: TObject);
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
procedure TChequeoLotes.FormCreate(Sender: TObject);
begin
     Top:=1;
     Left:=0;

     cEmpresa.Text:=EmpresaGlobal;
end;

//------------------------- CIERRE DEL FORMULARIO ------------------------------
procedure TChequeoLotes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

//------------------------- BOTON SALIR ----------------------------------------
procedure TChequeoLotes.BSalirClick(Sender: TObject);
begin
     Close;
end;

//------------------------ AL CAMBIAR LA EMPRESA -------------------------------
procedure TChequeoLotes.cEmpresaChange(Sender: TObject);
begin
     tNomEmpresa.Caption:= NomEmpresa(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TChequeoLotes.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TChequeoLotes.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresa.Text:=CodEmpresa;
     cEmpresa.SetFocus;
end;

//------- MARCA COMO LOTES IMPORTADOS ABANDONADOS A LOS LOTES IMPORTADOS DE MAS DE 45 DIAS ------
procedure TChequeoLotes.ChequearLotesImpotacion(Empresa: String);
Var
   FechaTope: TDateTime;
begin
     FechaTope:=Date()-45;

    QCabecerasEnt.Close;
    QCabecerasEnt.SQL.Clear;
    QCabecerasEnt.SQL.Add(' SELECT * FROM CABECERA_ENTRADAS ' +
                          ' WHERE EMPRESA_CE=' + QuotedStr(Empresa) +
                          ' AND FECHA_ALBARAN_CE <= ' +  QuotedStr(AnyoMesDia(FechaTope)) +
                          ' AND TIPO_ENTRADA_CE=' + QuotedStr('I') +
                          ' ORDER BY CLIENTE_CE, ALBARAN_CE');

    QLineasEnt.Close;
    QLineasEnt.SQL.Clear;
    QLineasEnt.SQL.Add(' SELECT * FROM LINEA_ENTRADAS ' +
                       ' WHERE EMPRESA_LE=' + QuotedStr(Empresa) +
                       ' AND ALBARAN_LE=:Albaran ' +
                       ' ORDER BY LOTE_LE');
    QLineasEnt.Prepare;

    QAlmacenes.Close;
    QAlmacenes.SQL.Clear;
    QAlmacenes.SQL.Add(' SELECT * FROM ALMACENES ' +
                       ' WHERE EMPRESA_AL=' + QuotedStr(Empresa) +
                       ' AND CLIENTE_AL=:Cliente ' +
                       ' AND TIPO_LOTE_AL=' + QuotedStr('I') +
                       ' AND LOTE_AL=:Lote');
    QAlmacenes.Prepare;

    QCabecerasEnt.Open;
    if QCabecerasEnt.IsEmpty then
       MessageDlg('No hay Lotes de Importación para marcar como Abandonados', mtError,[mbOk],0)
    else
    begin
         kbmMemTable1.Open;
         While not QCabecerasEnt.Eof do
         begin
              QLineasEnt.Close;
              QLineasEnt.ParamByName('Albaran').AsInteger:=QCabecerasEnt.FieldByName('Albaran_ce').asInteger;
              QLineasEnt.Open;
              While not QLineasEnt.Eof do
              begin
                   QAlmacenes.Close;
                   QAlmacenes.ParamByName('Cliente').AsString:=QCabecerasEnt.FieldByName('Cliente_ce').AsString;
                   QAlmacenes.ParamByName('Lote').AsString:=QLineasEnt.FieldByName('Lote_le').AsString;
                   QAlmacenes.Open;
                   if not QAlmacenes.IsEmpty then
                   begin
                        QAlmacenes.Close;

                        QAlmacenesUpdate.Close;
                        QAlmacenesUpdate.SQL.Clear;
                        QAlmacenesUpdate.SQL.Add(' UPDATE ALMACENES ' +
                                                 ' SET TIPO_LOTE_AL=' + QuotedStr('B') +
                                                     ',FECHA_MODIF_AL=' + QuotedStr(AnyoMesDia(Date())) +
                                                 ' WHERE EMPRESA_AL=' + QuotedStr(Empresa) +
                                                 ' AND CLIENTE_AL=' + QuotedStr(QCabecerasEnt.FieldByName('Cliente_ce').AsString) +
                                                 ' AND LOTE_AL=' + QuotedStr(QLineasEnt.FieldByName('Lote_le').AsString));
                        QAlmacenesUpdate.ExecSQL;

                        kbmMemTable1.Append;
                        kbmMemTable1.FieldByName('Empresa').AsString:=Empresa;
                        kbmMemTable1.FieldByName('Cliente').AsString:=QCabecerasEnt.FieldByName('Cliente_ce').AsString;
                        kbmMemTable1.FieldByName('Albaran').AsInteger:=QCabecerasEnt.FieldByName('Albaran_ce').AsInteger;
                        kbmMemTable1.FieldByName('Fecha').AsString:=DiaMesAnyo(QCabecerasEnt.FieldByName('Fecha_Albaran_ce').AsString);
                        kbmMemTable1.FieldByName('Familia').AsString:=QLineasEnt.FieldByName('Familia_le').AsString;
                        kbmMemTable1.FieldByName('Articulo').AsString:=QLineasEnt.FieldByName('Articulo_le').AsString;
                        kbmMemTable1.FieldByName('NomArticulo').AsString:=NomArticulo(Empresa,
                                                                                      QLineasEnt.FieldByName('Familia_le').AsString,
                                                                                      QLineasEnt.FieldByName('Articulo_le').AsString);
                        kbmMemTable1.FieldByName('Lote').AsString:=QLineasEnt.FieldByName('Lote_le').AsString;
                        kbmMemTable1.Post;
                   end;
                   QLineasEnt.Next;
              end;
              QCabecerasEnt.Next;
         end;
    end;
    QCabecerasEnt.Close;
    QLineasEnt.Close;
    QAlmacenes.Close;
    QAlmacenesUpdate.Close;

    QAlmacenes.Unprepare;
    QLineasEnt.Unprepare;
end;

end.
