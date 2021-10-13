unit FAutorizacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, DBTables, StdCtrls, ComCtrls,
  ToolWin, Buttons,
  Provider, DBClient, Mask, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxCore,
  cxDateUtils, dxSkinsCore, dxSkinBlue, Menus, dxSkinsdxBarPainter, dxBar,
  cxClasses, cxButtons, SimpleSearch, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar;

type
  TAutorizacion = class(TForm)
    BarraEstado: TStatusBar;
    StaticText1: TStaticText;
    cEmpresa: TEdit;
    tNomEmpresa: TPanel;
    PanelAlbaran: TGroupBox;
    StaticText6: TStaticText;
    cFecha: TcxDateEdit;
    AlbaranLote: TRadioGroup;
    StaticText9: TStaticText;
    cAlbaran: TEdit;
    PanelLote: TGroupBox;
    LupaLote: TSpeedButton;
    StaticText5: TStaticText;
    cLote: TEdit;
    StaticText2: TStaticText;
    cCliente: TEdit;
    tNomcliente: TPanel;
    cLupaEmpresas: TSimpleSearch;
    cLupaClientes: TSimpleSearch;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    bAceptar: TdxBarLargeButton;
    bSalir: TdxBarLargeButton;
    cLupaAlbaran: TSimpleSearch;
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
    procedure AlbaranLoteClick(Sender: TObject);
    procedure cLupaClientesClick(Sender: TObject);
    procedure cClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cClienteChange(Sender: TObject);
    function  ComprobarAlbaran():Boolean;
    function  ComprobarLote():Boolean;
    function  ComprobarLotesAlbaran():Boolean;
    procedure cAlbaranChange(Sender: TObject);
    function  FechaAlbaran(Empresa, Cliente, Albaran: String): TDateTime;
    procedure Autorizar();
    procedure LupaLoteClick(Sender: TObject);
    function  LupaLotes(Empresa, Cliente: String):Boolean;
    procedure cLupaAlbaranClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    function ValidarSeleccion(): Boolean;

  public
       { Public declarations }

  end;

var
   Autorizacion: TAutorizacion;

implementation

uses MBaseDatos, UGLobal, LCobrosTabla, LCobrosFicha, BLotes, BEntradas;

{$R *.dfm}

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TAutorizacion.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then  //F5 aceptar
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TAutorizacion.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TAutorizacion.Aceptar(Sender: TObject);
begin
     PostMessage(Handle,WM_NEXTDLGCTL,0,0);
     Application.ProcessMessages;
     try
        if ValidarSeleccion() then
           Autorizar();
     except
           on E:Exception do
                CapturaErrores(E);
     end;
end;
//----------------------- VALIDA LA SELECCION ----------------------------------
function TAutorizacion.ValidarSeleccion(): Boolean;
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
     else if cCliente.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta el cliente', mtError,[mbOk],0);
          cCliente.SetFocus;
          Result:=False;
     end
     else if AlbaranLote.ItemIndex=0 then
     begin
          if not ComprobarAlbaran() then
          begin
               cAlbaran.SetFocus;
               Result:=False;
          end;
     end
     else if AlbaranLote.ItemIndex=1 then
     begin
          if not ComprobarLote() then
          begin
               cLote.SetFocus;
               Result:=False;
          end;
     end;
end;

//----------------------- COMPRUEBA UN ALABARAN --------------------------------
function TAutorizacion.ComprobarAlbaran():Boolean;
Var
   QAux: TQuery;
begin
     Result:=True;
     if cAlbaran.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta el número de albarán', mtError,[mbOk],0);
          Result:=False;
     end
     else
     begin
          QAux:=TQuery.Create(nil);
          try
             With QAux do
             begin
                  DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                  SQL.Add(' SELECT * ' +
                          ' FROM CABECERA_ENTRADAS ' +
                          ' WHERE EMPRESA_CE=' + QuotedStr(cEmpresa.Text) +
                          ' AND CLIENTE_CE=' + QuotedStr(cCliente.Text) +
                          ' AND ALBARAN_CE=' + cAlbaran.Text);
                  Open;
                  if IsEmpty() then
                  begin
                       MessageDlg (Chr(13) + 'El albarán no pertenece al cliente o no existe', mtError,[mbOk],0);
                       Result:=False;
                  end
                  else if QAux.FieldByName('Tipo_entrada_ce').AsString='N' then
                  begin
                       MessageDlg (Chr(13) + 'El albarán no es de importación', mtError,[mbOk],0);
                       Result:=False;
                  end
                  else //Comprueba que no exista ningun lote abandonado
                      Result:=ComprobarLotesAlbaran();
             end;
          finally
                 QAux.Close;
                 FreeAndNil(QAux);
          end;
     end;
end;

//----------------------- COMPRUEBA UN LOTE ------------------------------------
function TAutorizacion.ComprobarLote():Boolean;
Var
   QAux: TQuery;
begin
     Result:=True;
     if cLote.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta el número de lote', mtError,[mbOk],0);
          Result:=False;
     end
     else
     begin
          QAux:=TQuery.Create(nil);
          try
             With QAux do
             begin
                  DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                  SQL.Add(' SELECT * ' +
                          ' FROM ALMACENES ' +
                          ' WHERE EMPRESA_AL=' + QuotedStr(cEmpresa.Text) +
                          ' AND CLIENTE_AL=' + QuotedStr(cCliente.Text) +
                          ' AND LOTE_AL=' + QuotedStr(cLote.Text));
                  Open;
                  if IsEmpty() then
                  begin
                       MessageDlg (Chr(13) + 'El lote no pertenece al cliente o no existe', mtError,[mbOk],0);
                       Result:=False;
                  end
                  else if QAux.FieldByName('Tipo_lote_al').AsString='N' then
                  begin
                       MessageDlg (Chr(13) + 'El lote no es de importación', mtError,[mbOk],0);
                       Result:=False;
                  end
                  else if QAux.FieldByName('Tipo_lote_al').AsString='T' then
                  begin
                       MessageDlg (Chr(13) + 'El lote ya está autorizado', mtError,[mbOk],0);
                       Result:=False;
                  end
                  else if QAux.FieldByName('Tipo_lote_al').AsString='B' then
                  begin
                       MessageDlg (Chr(13) + 'El lote fue abandonado', mtError,[mbOk],0);
                       Result:=False;
                  end;
             end;
          finally
                 QAux.Close;
                 FreeAndNil(QAux);
          end;
     end;
end;

//-------------- COMPRUEBA QUE NINGUN LOTE DEL ALABARAN ESTE ABANDONADO --------
function TAutorizacion.ComprobarLotesAlbaran():Boolean;
Var
   QAux, QAux2: TQuery;
begin
     Result:=True;
     QAux:=TQuery.Create(nil);
     QAux2:=TQuery.Create(nil);
     try
        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
        QAux2.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

        //Lineas del Albaran de Entrada
        QAux.SQL.Add(' SELECT LOTE_LE FROM LINEA_ENTRADAS' +
                     ' WHERE EMPRESA_LE=' + QuotedStr(cEmpresa.Text) +
                     ' AND ALBARAN_LE=' + QuotedStr(cAlbaran.Text));
        QAux.Open;

        //Almacenes
        QAux2.SQL.Add(' SELECT * FROM ALMACENES ' +
                      ' WHERE EMPRESA_AL=:Empresa ' +
                      ' AND CLIENTE_AL=:Cliente ' +
                      ' AND LOTE_AL=:Lote');
        QAux2.Prepare;

        //Para cada linea de albaran
        While not QAux.Eof do
        begin
             QAux2.Close;
             QAux2.ParamByName('Empresa').AsString:=cEmpresa.Text;
             QAux2.ParamByName('Cliente').AsString:=cCliente.Text;
             QAux2.ParamByName('Lote').AsString:=QAux.FieldByName('Lote_le').AsString;
             QAux2.Open;
             if QAux2.FieldByName('Tipo_Lote_al').AsString='B' then
             begin
                  MessageDlg (Chr(13) + 'El lote ' + QAux.FieldByName('Lote_le').AsString +  ' fue abandonado', mtError,[mbOk],0);
                  Result:=False;
                  Break;
             end;
             QAux.Next;
        end;
      finally
             QAux.Close;
             FreeAndNil(QAux);
             QAux2.Close;
             FreeAndNil(QAux2);
      end;
end;

//---------------------- PONE EL COLOR DEL FOCO --------------------------------
procedure TAutorizacion.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clMoneyGreen;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TAutorizacion.ColorExit(Sender: TObject);
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
procedure TAutorizacion.ColorExitSinCeros(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clWindow
     else if Sender is TComboBox then           //Si el componente es un TComboBox
             TComboBox(Sender).Color:=clWindow;
end;

//------------------------- CREACION DEL FORMULARIO ----------------------------
procedure TAutorizacion.FormCreate(Sender: TObject);
begin
     Top:=1;
     Left:=0;
end;

//------------------------- CIERRE DEL FORMULARIO ------------------------------
procedure TAutorizacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

//------------------------- BOTON SALIR ----------------------------------------
procedure TAutorizacion.BSalirClick(Sender: TObject);
begin
     Close;
end;

//------------------------ AL CAMBIAR LA EMPRESA -------------------------------
procedure TAutorizacion.cEmpresaChange(Sender: TObject);
begin
     tNomEmpresa.Caption:= NomEmpresa(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TAutorizacion.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TAutorizacion.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresa.Text:=CodEmpresa;
     cEmpresa.SetFocus;
end;

//------------------------- ALBARANES O LOTES ----------------------------------
procedure TAutorizacion.AlbaranLoteClick(Sender: TObject);
begin
     if AlbaranLote.ItemIndex=0 then
     begin
          PanelLote.Visible:=False;
          PanelAlbaran.Visible:=True;
     end
     else
     begin
          PanelLote.Visible:=True;
          PanelAlbaran.Visible:=False;
     end;
end;

//-------------------------- LUPA DE CLIENTES ----------------------------------
procedure TAutorizacion.cLupaClientesClick(Sender: TObject);
Var
   CodCliente: String;
begin
     if cEmpresa.Text<>'' then
     begin
          CodCliente:=LupaClientes(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
          if CodCliente<>'' then
             cCliente.Text:=CodCliente;
          cCliente.SetFocus;
     end
     else
     begin
          MessageDlg (Chr(13) + 'Seleccione antes la empresa', mtError,[mbOk],0);
          cEmpresa.SetFocus;
     end;
end;

//--------------------- CONTROL DE TECLADO EN CLIENTE --------------------------
procedure TAutorizacion.cClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaClientesClick(Self);
end;

//---------------------------- AL CAMBIAR EL CLIENTE ---------------------------
procedure TAutorizacion.cClienteChange(Sender: TObject);
begin
     tNomCliente.Caption:=NomCliente(cEmpresa.Text, RellenarCeros(cCliente.Text,cCliente.MaxLength,'I'));
end;

//---------------------------- AL CAMBIAR EL ALBARAN ---------------------------
procedure TAutorizacion.cAlbaranChange(Sender: TObject);
begin
     cFecha.Date:=FechaAlbaran(cEmpresa.Text, cCliente.Text, cAlbaran.Text);
end;

//---------------------------- DEVUELVE LA FECHA DE UN ALBARAN -----------------
function TAutorizacion.FechaAlbaran(Empresa, Cliente, Albaran: String): TDateTime;
Var
   QAux: TQuery;
begin
    QAux:=TQuery.Create(nil);
    try
       With QAux do
       begin
            DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
            SQL.Add(' SELECT * ' +
                    ' FROM CABECERA_ENTRADAS ' +
                    ' WHERE EMPRESA_CE=' + QuotedStr(cEmpresa.Text) +
                    ' AND CLIENTE_CE=' + QuotedStr(cCliente.Text) +
                    ' AND ALBARAN_CE=' + cAlbaran.Text);
            Open;
            if not IsEmpty() then
                 Result:=StrToDate(DiaMesAnyo(Qaux.FieldByName('Fecha_albaran_ce').AsString))
            else
                Result:=0;

       end;
    finally
           QAux.Close;
           FreeAndNil(QAux);
    end;
end;

//------------------------ PROCESO DE AUTORIZACION -----------------------------
procedure TAutorizacion.Autorizar();
Var
   QLineas, QAlmacenes: TQuery;
   NLotes: Integer;
begin
     try
        NLotes:=0;

        if not DMBaseDatos.BDFrigo.InTransaction then
           DMBaseDatos.BDFrigo.StartTransaction;

        if AlbaranLote.ItemIndex=0 then  //ALBARAN COMPLETO
        begin
             QLineas:=TQuery.Create(nil);
             QAlmacenes:=TQuery.Create(nil);
             try
                QLineas.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                QAlmacenes.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                QLineas.SQL.Add(' SELECT * ' +
                                ' FROM LINEA_ENTRADAS ' +
                                ' WHERE EMPRESA_LE=' + QuotedStr(cEmpresa.Text) +
                                ' AND ALBARAN_LE=' + cAlbaran.Text);
                QLineas.Open;
                While not QLineas.Eof do
                begin
                     QAlmacenes.SQL.Add(' UPDATE ALMACENES ' +
                                        ' SET TIPO_LOTE_AL=' + QuotedStr('T') +
                                            ',FECHA_MODIF_AL=' + QuotedStr(AnyoMesDia(Date())) +
                                        ' WHERE EMPRESA_AL=' + QuotedStr(cEmpresa.Text) +
                                        ' AND CLIENTE_AL=' + QuotedStr(cCliente.Text) +
                                        ' AND LOTE_AL=' + QuotedStr(QLineas.FieldByName('Lote_le').AsString));
                     QAlmacenes.ExecSql;
                     QLineas.Next;
                     Inc(NLotes);
                end;
             finally
                    QLineas.Close;
                    FreeAndNil(QLineas);
                    QAlmacenes.Close;
                    FreeAndNil(QAlmacenes);
             end;
        end
        else //UN LOTE
        begin
             QAlmacenes:=TQuery.Create(nil);
             try
                QAlmacenes.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                QAlmacenes.SQL.Add(' UPDATE ALMACENES ' +
                                   ' SET TIPO_LOTE_AL=' + QuotedStr('T') +
                                       ',FECHA_MODIF_AL=' + QuotedStr(AnyoMesDia(Date())) +
                                   ' WHERE EMPRESA_AL=' + QuotedStr(cEmpresa.Text) +
                                   ' AND CLIENTE_AL=' + QuotedStr(cCliente.Text) +
                                   ' AND LOTE_AL=' + QuotedStr(cLote.Text));
                QAlmacenes.ExecSql;
                Inc(NLotes);
             finally
                    QAlmacenes.Close;
                    FreeAndNil(QAlmacenes);
             end;
        end;
        if DMBaseDatos.BDFrigo.InTransaction then
           DMBaseDatos.BDFrigo.Commit;

        MessageDlg (Chr(13) + 'Lotes Autorizados: ' + IntToStr(NLotes), mtError,[mbOk],0);
     except
           on E:Exception do
                begin
                     CapturaErrores(E);
                     if DMBaseDatos.BDFrigo.InTransaction then
                        DMBaseDatos.BDFrigo.Rollback;
                end;
     end;
end;

//-------------------------- BUSQUEDA DE LOTES ---------------------------------
procedure TAutorizacion.LupaLoteClick(Sender: TObject);
begin
     LupaLotes(cEmpresa.Text, cCliente.Text);
end;

//-------------------------- BUSQUEDA DE LOTES ---------------------------------
function TAutorizacion.LupaLotes(Empresa, Cliente: String):Boolean;
Var
   Aux: TBusquedaLotes;
begin
     try
        Aux:=TBusquedaLotes.Create(Self);
        with Aux do
        begin
             Query1.SQL.Clear;
             Query1.SQL.Add(' SELECT LOTE_AL, TIPO_LOTE_AL, FAMILIA_AL, DESCRIPCION_F, ARTICULO_AL, ' +
                                   ' DENOMINACION_A, STATUS_RETENIDO_AL,  NUMERO_CAMARA_AL, ZONA_AL, ' +
                                   ' ESTUCHES_BULTO_AL, BULTOS_ENTRADOS_AL - BULTOS_SALIDOS_AL AS BULTOS_STOCK, ' +
                                   ' UNIDADES_ENTRADAS_AL - UNIDADES_SALIDAS_AL AS UNIDADES_STOCK, ESTUCHES_SUELTOS_AL ' +
                            ' FROM ALMACENES, ARTICULOS, FAMILIAS ' +
                            ' WHERE EMPRESA_AL=EMPRESA_A ' +
                            ' AND FAMILIA_AL=FAMILIA_A ' +
                            ' AND ARTICULO_AL=CODIGO_A ' +
                            ' AND EMPRESA_F=EMPRESA_A ' +
                            ' AND CODIGO_F=FAMILIA_A ' +
                            ' AND EMPRESA_AL=' + QuotedStr(Empresa) +
                            ' AND CLIENTE_AL=' + QuotedStr(Cliente));
             Query1.SQL.Add(' AND TIPO_LOTE_AL=' + QuotedStr('I'));
             Query1.Open;
             if Query1.IsEmpty then
                MessageDlg (Chr(13) + 'No existen lotes de importación', mtError,[mbOk],0)
             else
             begin
                  ShowModal;

                  Application.ProcessMessages;

                  if LoteBus<>'' then   //Seleccionamos un registro del grid resultado
                     cLote.Text:=LoteBus;
             end;
        end;
     finally
            FreeAndNil(Aux);
     end;
end;

//----------------------------- BUSQUEDA ---------------------------------------
procedure TAutorizacion.cLupaAlbaranClick(Sender: TObject);
Var
   Aux: TBusquedaEntradas;
begin
     try
        Aux:=TBusquedaEntradas.Create(Self);
        with Aux do
        begin
             TipoLote:='I';
             BNuevaBusqueda.Visible:=ivNever;
             cEmpresaBus.Text:=cEmpresa.Text;
             cClienteBus.Text:=cCliente.Text;
             cEmpresaBus.ReadOnly:=True;
             cClienteBus.ReadOnly:=True;
             cLupaEmpresas.Enabled:=False;
             cLupaClientes.Enabled:=False;
             ShowModal;
             if (EmpresaBus<>'') and (AlbaranBus<>0) then   //Seleccionamos un registro del grid resultado
                cAlbaran.Text:=IntToStr(AlbaranBus)
             else if (ModalResult=mrOk) and ((EmpresaOk<>'') and (AlbaranOk<>0)) then
                      cAlbaran.Text:=IntToStr(AlbaranOk);
        end;
     finally
            FreeAndNil(Aux);
     end;
end;


procedure TAutorizacion.FormActivate(Sender: TObject);
begin
     cEmpresa.Text:=EmpresaGlobal;
end;

end.
