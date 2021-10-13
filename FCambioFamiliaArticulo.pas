unit FCambioFamiliaArticulo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, DBTables, StdCtrls, ComCtrls,
  ToolWin, Buttons,
  Provider, DBClient, Mask, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, dxSkinsCore, dxSkinBlue, dxSkinsdxBarPainter, dxBar, cxClasses,
  cxButtons, SimpleSearch;

type
  TCambiarFamiliaArticulo = class(TForm)
    BarraEstado: TStatusBar;
    StaticText1: TStaticText;
    cEmpresa: TEdit;
    tNomEmpresa: TPanel;
    GroupBox2: TGroupBox;
    GroupBox11: TGroupBox;
    StaticText13: TStaticText;
    cFamiliaOld: TEdit;
    tNomFamiliaOld: TPanel;
    StaticText2: TStaticText;
    cFamiliaNew: TEdit;
    tNomFamiliaNew: TPanel;
    StaticText3: TStaticText;
    cArticuloOld: TEdit;
    tNomArticuloOld: TPanel;
    StaticText4: TStaticText;
    cArticuloNew: TEdit;
    QAux: TQuery;
    QAux2: TQuery;
    cLupaEmpresas: TSimpleSearch;
    cLupaFamiliasOld: TSimpleSearch;
    cLupaArticulosOld: TSimpleSearch;
    cLupaFamiliaNew: TSimpleSearch;
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
    procedure FormActivate(Sender: TObject);
    procedure cFamiliaOldChange(Sender: TObject);
    procedure cFamiliaNewChange(Sender: TObject);
    procedure cLupaFamiliasOldClick(Sender: TObject);
    procedure cLupaFamiliaNewClick(Sender: TObject);
    procedure cLupaArticulosOldClick(Sender: TObject);
    procedure cArticuloOldChange(Sender: TObject);
    procedure cFamiliaOldKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cFamiliaNewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cArticuloOldKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
    function Validar(): Boolean;

  public
       { Public declarations }
   
  end;

var
   CambiarFamiliaArticulo: TCambiarFamiliaArticulo;

implementation

uses MBaseDatos, UGLobal;

{$R *.dfm}

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TCambiarFamiliaArticulo.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then  //F5 aceptar
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TCambiarFamiliaArticulo.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TCambiarFamiliaArticulo.Aceptar(Sender: TObject);
Var
   Empresa, FamiliaOld, ArticuloOld, FamiliaNew, ArticuloNew: String;
begin
     try
        if Validar() then
        begin
             if MessageBox(Handle, PChar('Si cambiamos la familia o el código del artículo se modificará en toda la aplicación. ' + chr(13) +
                                         '¿Está seguro?'),
                           PChar(Self.Caption),
                           MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON1)=IDYES then
             begin
                  Empresa:=RellenarCeros(cEmpresa.Text, cEmpresa.MaxLength, 'I');
                  FamiliaOld:=RellenarCeros(cFamiliaOld.Text, cFamiliaOld.MaxLength, 'I');
                  ArticuloOld:=RellenarCeros(cArticuloOld.Text, cArticuloOld.MaxLength, 'I');

                  FamiliaNew:=RellenarCeros(cFamiliaNew.Text, cFamiliaNew.MaxLength, 'I');
                  ArticuloNew:=RellenarCeros(cArticuloNew.Text, cArticuloNew.MaxLength, 'I');

                  //Leemos el articulo antiguo
                  QAux2.Close;
                  QAux2.SQL.Clear;
                  QAux2.SQL.Add(' SELECT * FROM ARTICULOS ' +
                                ' WHERE EMPRESA_A=' + QuotedStr(Empresa) +
                                ' AND FAMILIA_A=' + QuotedStr(FamiliaOld) +
                                ' AND CODIGO_A=' + QuotedStr(ArticuloOld));
                  QAux2.Open;
                  if not QAux2.IsEmpty then
                  begin
                       //Insertamos el nuevo articulo
                       QAux.Close;
                       QAux.SQL.Clear;
                       QAux.SQL.Add('INSERT INTO ARTICULOS ' +
                                    ' VALUES(' + QuotedStr(Empresa) + ',' +
                                                 QuotedStr(FamiliaNew) + ',' +
                                                 QuotedStr(ArticuloNew) + ',' +
                                                 QuotedStr(QAux2.FieldByName('Denominacion_a').AsString) + ',' +
                                                 QuotedStr(QAux2.FieldByName('Unidad_Medida_a').AsString) + ',' +
                                               ' :Precio)');
                       QAux.ParamByName('Precio').AsFloat:=QAux2.FieldByName('Valor_Por_Kg_a').AsFloat;
                       QAux.ExecSQL;
                       QAux2.Close;

                       //Iniciamos Transaccion
                       if not DMBaseDatos.BDFrigo.InTransaction then
                          DMBaseDatos.BDFrigo.StartTransaction;

                       //Cambiamos el articulo de las lineas de entrada
                       QAux.Close;
                       QAux.SQL.Clear;
                       QAux.SQL.Add('UPDATE LINEA_ENTRADAS ' +
                                    ' SET FAMILIA_LE=' + QuotedStr(FamiliaNew) + ',' +
                                        ' ARTICULO_LE=' + QuotedStr(ArticuloNew) +
                                    ' WHERE EMPRESA_LE=' + QuotedStr(Empresa) +
                                    ' AND FAMILIA_LE=' + QuotedStr(FamiliaOld) +
                                    ' AND ARTICULO_LE=' + QuotedStr(ArticuloOld));
                       QAux.ExecSQL;

                       //Cambiamos el articulo de las lineas de salida
                       QAux.Close;
                       QAux.SQL.Clear;
                       QAux.SQL.Add('UPDATE LINEA_SALIDAS ' +
                                    ' SET FAMILIA_LS=' + QuotedStr(FamiliaNew) +
                                       ' ,ARTICULO_LS=' + QuotedStr(ArticuloNew) +
                                    ' WHERE EMPRESA_LS=' + QuotedStr(Empresa) +
                                    ' AND FAMILIA_LS=' + QuotedStr(FamiliaOld) +
                                    ' AND ARTICULO_LS=' + QuotedStr(ArticuloOld));
                       QAux.ExecSQL;

                       //Cambiamos el articulo de los almacenes
                       QAux.Close;
                       QAux.SQL.Clear;
                       QAux.SQL.Add('UPDATE ALMACENES ' +
                                    ' SET FAMILIA_AL=' + QuotedStr(FamiliaNew) +
                                       ' ,ARTICULO_AL=' + QuotedStr(ArticuloNew) +
                                    ' WHERE EMPRESA_AL=' + QuotedStr(Empresa) +
                                    ' AND FAMILIA_AL=' + QuotedStr(FamiliaOld) +
                                    ' AND ARTICULO_AL=' + QuotedStr(ArticuloOld));
                       QAux.ExecSQL;

                       //Cambiamos el articulo de los almacenes
                       QAux.Close;
                       QAux.SQL.Clear;
                       QAux.SQL.Add('UPDATE ARTICULOS_CLIENTE ' +
                                    ' SET FAMILIA_AC=' + QuotedStr(FamiliaNew) +
                                       ' ,ARTICULO_AC=' + QuotedStr(ArticuloNew) +
                                    ' WHERE EMPRESA_AC=' + QuotedStr(Empresa) +
                                    ' AND FAMILIA_AC=' + QuotedStr(FamiliaOld) +
                                    ' AND ARTICULO_AC=' + QuotedStr(ArticuloOld));
                       QAux.ExecSQL;

                       //Borramos el articulo antiguo
                       QAux.Close;
                       QAux.SQL.Clear;
                       QAux.SQL.Add('DELETE FROM ARTICULOS ' +
                                    ' WHERE EMPRESA_A=' + QuotedStr(Empresa) +
                                    ' AND FAMILIA_A=' + QuotedStr(FamiliaOld) +
                                    ' AND CODIGO_A=' + QuotedStr(ArticuloOld));
                       QAux.ExecSQL;
                  end;

                  if DMBaseDatos.BDFrigo.InTransaction then
                     DMBaseDatos.BDFrigo.Commit;
             end;
        end;
     except
           on E:Exception do
                begin
                     if DMBaseDatos.BDFrigo.InTransaction then
                        DMBaseDatos.BDFrigo.Rollback;

                     CapturaErrores(E);
                end;
     end;
end;

//----------------------- VALIDA LA SELECCION ----------------------------------
function TCambiarFamiliaArticulo.Validar(): Boolean;
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
     else if cFamiliaOld.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta la antigua familia', mtError,[mbOk],0);
          cFamiliaOld.SetFocus;
          Result:=False;
     end
     else if tNomFamiliaOld.Caption='' then
     begin
          MessageDlg (Chr(13) + 'La antigua familia no existe', mtError,[mbOk],0);
          cFamiliaOld.SetFocus;
          Result:=False;
     end
     else if cArticuloOld.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta el antiguo artículo', mtError,[mbOk],0);
          cArticuloOld.SetFocus;
          Result:=False;
     end
     else if tNomArticuloOld.Caption='' then
     begin
          MessageDlg (Chr(13) + 'El antiguo artículo no existe', mtError,[mbOk],0);
          cArticuloOld.SetFocus;
          Result:=False;
     end
     else if cFamiliaNew.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta la nueva familia', mtError,[mbOk],0);
          cFamiliaNew.SetFocus;
          Result:=False;
     end
     else if tNomFamiliaNew.Caption='' then
     begin
          MessageDlg (Chr(13) + 'La nueva familia no existe', mtError,[mbOk],0);
          cFamiliaNew.SetFocus;
          Result:=False;
     end
     else if cArticuloNew.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta el nuevo artículo', mtError,[mbOk],0);
          cArticuloNew.SetFocus;
          Result:=False;
     end
     else if ExisteArticulo(RellenarCeros(cEmpresa.Text, cEmpresa.MaxLength,'I'),
                            RellenarCeros(cFamiliaNew.Text, cFamiliaNew.MaxLength,'I'),
                            RellenarCeros(cArticuloNew.Text, cArticuloNew.MaxLength,'I')) then
          begin
               MessageDlg (Chr(13) + 'El nuevo artículo ya existe', mtError,[mbOk],0);
               cArticuloNew.SetFocus;
               Result:=False;
          end
          else if RellenarCeros(cArticuloNew.Text, cArticuloNew.MaxLength,'I')<>RellenarCeros(cArticuloOld.Text, cArticuloOld.MaxLength,'I') then
               begin
                    if ExisteArticulo(RellenarCeros(cEmpresa.Text, cEmpresa.MaxLength,'I'),
                                      RellenarCeros(cArticuloNew.Text, cArticuloNew.MaxLength,'I')) then
                    begin
                         MessageDlg (Chr(13) + 'El nuevo código de artículo ya existe', mtError,[mbOk],0);
                         cArticuloNew.SetFocus;
                         Result:=False;
                    end;
               end;
end;

//---------------------- PONE EL COLOR DEL FOCO --------------------------------
procedure TCambiarFamiliaArticulo.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clMoneyGreen;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TCambiarFamiliaArticulo.ColorExit(Sender: TObject);
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
procedure TCambiarFamiliaArticulo.FormCreate(Sender: TObject);
begin
     Top:=1;
     Left:=0;
     cEmpresa.Text:=EmpresaGlobal;
end;

//------------------------- CIERRE DEL FORMULARIO ------------------------------
procedure TCambiarFamiliaArticulo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

//------------------------- BOTON SALIR ----------------------------------------
procedure TCambiarFamiliaArticulo.BSalirClick(Sender: TObject);
begin
     Close;
end;

//------------------------ AL CAMBIAR LA EMPRESA -------------------------------
procedure TCambiarFamiliaArticulo.cEmpresaChange(Sender: TObject);
begin
     tNomEmpresa.Caption:= NomEmpresa(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TCambiarFamiliaArticulo.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TCambiarFamiliaArticulo.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresa.Text:=CodEmpresa;
     cEmpresa.SetFocus;
end;

//--------------------- AL ACTIVAR EL FORMULARIO -------------------------------
procedure TCambiarFamiliaArticulo.FormActivate(Sender: TObject);
begin
     cFamiliaOld.SetFocus;
end;

//---------------------- AL CAMBIAR LA FAMILIA ANTIGUA -------------------------
procedure TCambiarFamiliaArticulo.cFamiliaOldChange(Sender: TObject);
Var
   Empresa, Familia: String;
begin
     Empresa:=RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I');
     Familia:=RellenarCeros(cFamiliaOld.Text,cFamiliaOld.MaxLength,'I');

     tNomFamiliaOld.Caption:=NomFamilia(Empresa, Familia);
     tNomArticuloOld.Caption:=NomArticulo(Empresa, Familia, RellenarCeros(cArticuloOld.Text, cArticuloOld.MaxLength,'I'));
end;

//---------------------- AL CAMBIAR LA FAMILIA NUEVA ---------------------------
procedure TCambiarFamiliaArticulo.cFamiliaNewChange(Sender: TObject);
begin
     tNomFamiliaNew.Caption:=NomFamilia(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'),
                                        RellenarCeros(cFamiliaNew.Text,cFamiliaNew.MaxLength,'I'));
end;

//-------------------------- LUPA DE FAMILIAS ANTIGUAS -------------------------
procedure TCambiarFamiliaArticulo.cLupaFamiliasOldClick(Sender: TObject);
Var
   Familia: String;
begin
     if cEmpresa.Text<>'' then
     begin
          Familia:=LupaFamilias(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
          if Familia<>'' then
             cFamiliaOld.Text:=Familia;
          cFamiliaOld.SetFocus;
     end
     else
     begin
          MessageDlg (Chr(13) + 'Seleccione antes la empresa', mtError,[mbOk],0);
          cEmpresa.SetFocus;
     end;
end;

//-------------------------- LUPA DE FAMILIAS NUEVAS ---------------------------
procedure TCambiarFamiliaArticulo.cLupaFamiliaNewClick(Sender: TObject);
Var
   Familia: String;
begin
     if cEmpresa.Text<>'' then
     begin
          Familia:=LupaFamilias(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
          if Familia<>'' then
             cFamiliaNew.Text:=Familia;
          cFamiliaNew.SetFocus;
     end
     else
     begin
          MessageDlg (Chr(13) + 'Seleccione antes la empresa', mtError,[mbOk],0);
          cEmpresa.SetFocus;
     end;
end;

//-------------------------- LUPA DE ARTICULOS NUEVOS --------------------------
procedure TCambiarFamiliaArticulo.cLupaArticulosOldClick(Sender: TObject);
Var
   Articulo, Familia: String;
begin
     if (cFamiliaOld.Text<>'') and (tNomFamiliaOld.Caption<>'') then
     begin
          Familia:=RellenarCeros(cFamiliaOld.Text,cFamiliaOld.MaxLength,'I');
          Articulo:=LupaArticulos(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'), Familia);
     end
     else //Si no pongo familia -> Muestro todos los articulos y devuelvo por referencia la familia
     begin
          Familia:='';
          Articulo:=LupaFamiliaArticulos(cEmpresa.Text, Familia);
     end;
     if Articulo<>'' then
     begin
          cFamiliaOld.Text:=Familia;
          cArticuloOld.Text:=Articulo;
     end;
     cArticuloOld.SetFocus;
end;

//---------------------- AL CAMBIAR EL ARTICULO ANTIGUO ------------------------
procedure TCambiarFamiliaArticulo.cArticuloOldChange(Sender: TObject);
begin
     cArticuloNew.Text:=cArticuloOld.Text;
     tNomArticuloOld.Caption:=NomArticulo(cEmpresa.Text,
                                          RellenarCeros(cFamiliaOld.Text,cFamiliaOld.MaxLength,'I'),
                                          RellenarCeros(cArticuloOld.Text,cArticuloOld.MaxLength,'I'));
end;

//-------------------------- LUPA (F2) DE FAMILIAS ANTIGUAS --------------------
procedure TCambiarFamiliaArticulo.cFamiliaOldKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaFamiliasOldClick(Self);
end;

//-------------------------- LUPA (F2) DE FAMILIAS NUEVAS ----------------------
procedure TCambiarFamiliaArticulo.cFamiliaNewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaFamiliaNewClick(Self);
end;

//-------------------------- LUPA (F2) DE ARTICULOS NUEVOS ---------------------
procedure TCambiarFamiliaArticulo.cArticuloOldKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaArticulosOldClick(Self);
end;

end.
