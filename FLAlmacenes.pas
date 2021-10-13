unit FLAlmacenes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, DBTables, StdCtrls, ComCtrls,
  ToolWin, Buttons,
  Provider, DBClient, Mask, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxCore,
  cxDateUtils, dxSkinsCore, dxSkinBlue, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, Menus, dxSkinsdxBarPainter, dxBar, cxClasses, cxButtons,
  SimpleSearch;

type
  TListadoAlmacenes = class(TForm)
    GroupBox1: TGroupBox;
    StaticText2: TStaticText;
    cFamiliaDesde: TEdit;
    StaticText3: TStaticText;
    cFamiliaHasta: TEdit;
    BarraEstado: TStatusBar;
    StaticText1: TStaticText;
    cEmpresa: TEdit;
    tNomEmpresa: TPanel;
    GroupBox4: TGroupBox;
    StaticText6: TStaticText;
    cArticuloDesde: TEdit;
    StaticText7: TStaticText;
    cArticuloHasta: TEdit;
    GroupBox2: TGroupBox;
    cOrden: TComboBox;
    GroupBox3: TGroupBox;
    StaticText5: TStaticText;
    cClienteDesde: TEdit;
    StaticText8: TStaticText;
    cClienteHasta: TEdit;
    GroupBox5: TGroupBox;
    StaticText9: TStaticText;
    cLoteDesde: TEdit;
    StaticText10: TStaticText;
    cLoteHasta: TEdit;
    GroupBox6: TGroupBox;
    StaticText4: TStaticText;
    cCamaraDesde: TEdit;
    StaticText11: TStaticText;
    cCamaraHasta: TEdit;
    GroupBox7: TGroupBox;
    StaticText12: TStaticText;
    cZonaDesde: TEdit;
    StaticText13: TStaticText;
    cZonaHasta: TEdit;
    GroupBox8: TGroupBox;
    cNormImp: TComboBox;
    GroupBox9: TGroupBox;
    cTipo: TComboBox;
    GroupBox10: TGroupBox;
    cCaducados: TComboBox;
    StaticText14: TStaticText;
    Bevel1: TBevel;
    GroupBox11: TGroupBox;
    cAgrupacion: TComboBox;
    cLupaEmpresas: TSimpleSearch;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    bAceptar: TdxBarLargeButton;
    bSalir: TdxBarLargeButton;
    cFecha: TcxDateEdit;
    cHora: TMaskEdit;
    GroupBox12: TGroupBox;
    StaticText15: TStaticText;
    cLoteOrigenDesde: TEdit;
    StaticText16: TStaticText;
    cLoteOrigenHasta: TEdit;
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
    procedure cOrdenKeyPress(Sender: TObject; var Key: Char);
    procedure cNormImpKeyPress(Sender: TObject; var Key: Char);
    procedure cLoteDesdeExit(Sender: TObject);
    procedure cTipoChange(Sender: TObject);
    procedure cCaducadosKeyPress(Sender: TObject; var Key: Char);
    procedure cTipoKeyPress(Sender: TObject; var Key: Char);
    procedure cAgrupacionKeyPress(Sender: TObject; var Key: Char);
    procedure cAgrupacionChange(Sender: TObject);
    procedure cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaEmpresasClick(Sender: TObject);
    procedure cHoraExit(Sender: TObject);

  private
    { Private declarations }
    LoteLike: Boolean;

    function ValidarSeleccion(): Boolean;

  public
       { Public declarations }
   
  end;

var
   ListadoAlmacenes: TListadoAlmacenes;

implementation

uses MBaseDatos, UGLobal, LArticulosCliente, LAlmacenesNormal, LAlmacenesCliente,
     LAlmacenesCamara;

{$R *.dfm}

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TListadoAlmacenes.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then  //F5 aceptar
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TListadoAlmacenes.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TListadoAlmacenes.Aceptar(Sender: TObject);
Var
   CadSql: String;
   QTempAlmacenes, QCSalidas, QLSalidas, QAux, QCEntradas, QLEntradas, QAuxEnt: TQuery;
   Cociente, TotalEstuches, TotalEstuchesAlma, TotalEstuchesLinea: Integer;
begin
     try
        PostMessage(Handle,WM_NEXTDLGCTL,0,0);
        Application.ProcessMessages;
        if ValidarSeleccion() then
        begin
             //STOCK A PARTIR DE LOS ALBARANES DE ENTRADA Y SALIDA
             if cFecha.Date < Date() then  //Fecha anterior
             begin
                  QTempAlmacenes:=TQuery.Create(Self);
                  try
                     With QTempAlmacenes do
                     begin
                          DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

                          //Vaciamos la tabla temporal
                          SQL.Add('DELETE FROM TEMP_LOTES_GUARDAR');
                          ExecSQL;

                          //Insertamos en la tabla temporal los almacenes afectados
                          SQL.Clear;
                          SQL.Add(' INSERT INTO TEMP_LOTES_GUARDAR ' +
                                  ' SELECT empresa_al, cliente_al, familia_al, articulo_al, lote_al, bultos_entrados_al, bultos_salidos_al, unidades_entradas_al, ' +
                                         ' unidades_salidas_al, unidades_destruidas_al, unidades_mermas_al, status_retenido_al, numero_camara_al, zona_al, estuches_bulto_al, ' +
                                         ' estuches_sueltos_al, estuches_totales_al, tipo_lote_al, fecha_entrada_al, fecha_caducidad_al, unid_sal_mismo_dia_al, palets_entrados_al, ' +
                                         ' palets_salidos_al, NULL, lote_origen_al FROM ALMACENES ' +

                                  ' WHERE ALMACENES.EMPRESA_AL=' + QuotedStr(cEmpresa.Text) +
                                  ' AND ALMACENES.CLIENTE_AL BETWEEN ' + QuotedStr(cClienteDesde.Text) + ' AND ' + QuotedStr(cClienteHasta.Text) +
                                  ' AND ALMACENES.FAMILIA_AL BETWEEN ' + QuotedStr(cFamiliaDesde.Text) + ' AND ' + QuotedStr(cFamiliaHasta.Text) +
                                  ' AND ALMACENES.ARTICULO_AL BETWEEN ' + QuotedStr(cArticuloDesde.Text) + ' AND ' + QuotedStr(cArticuloHasta.Text) +
                                  ' AND ALMACENES.NUMERO_CAMARA_AL BETWEEN ' + cCamaraDesde.Text + ' AND ' + cCamaraHasta.Text +
                                  ' AND ALMACENES.ZONA_AL BETWEEN ' + QuotedStr(cZonaDesde.Text) + ' AND ' + QuotedStr(cZonaHasta.Text) +
                                  ' AND FECHA_ENTRADA_AL<=' + QuotedStr(AnyoMesDia(cFecha.Text)));
                          //Si hay * en el lote usamos el Like en vez del Between
                          if LoteLike then
                             SQL.Add(' AND LOTE_AL LIKE ' + QuotedStr(StringReplace(cLoteDesde.Text, '*', '%',[rfReplaceAll])))
                          else
                              SQL.Add(' AND LOTE_AL BETWEEN ' + QuotedStr(cLoteDesde.Text) + ' AND ' + QuotedStr(cLoteHasta.Text));

                          if (cLoteOrigenDesde.Text <> '') and (cLoteOrigenHasta.Text <> '') then
                              SQL.Add(' AND (LOTE_ORIGEN_AL BETWEEN ' + QuotedStr(cLoteOrigenDesde.Text) + ' AND ' + QuotedStr(cLoteOrigenHasta.Text));

                          ExecSQL;
                     end;

                     //ENTRADAS
                     if (cTipo.Text = 'CLIENTE') and (cHora.Text <> '') then      //Se tendrá en cuenta tanto la fecha, como la hora introducida
                     begin

                     //SALIDAS
                     QCEntradas:=TQuery.Create(Self);
                     QLEntradas:=TQuery.Create(Self);
                     QAuxEnt:=TQuery.Create(Self);
                     //try

                        //Cabeceras de salida
                        QCEntradas.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                        QCEntradas.SQL.Add(' SELECT * FROM CABECERA_ENTRADAS ' +
                                          ' WHERE EMPRESA_CE=' + QuotedStr(cEmpresa.Text) +
                                          ' AND CLIENTE_CE BETWEEN ' + QuotedStr(cClienteDesde.Text) + ' AND ' + QuotedStr(cClienteHasta.Text) +
                                          ' AND FECHA_ALBARAN_CE>=' + QuotedStr(AnyoMesDia(cFecha.Text)) +
                                          ' AND HORA_CE>' + QuotedStr(Copy(cHora.Text,1,2) + ':' + Copy(cHora.Text,3,2) + ':00') +
                                          ' ORDER BY EMPRESA_CE, CLIENTE_CE, FECHA_ALBARAN_CE, ALBARAN_CE');
                        //Lineas de salida
                        QLEntradas.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                        QLEntradas.SQL.Add(' SELECT * FROM LINEA_ENTRADAS ' +
                                          ' WHERE EMPRESA_LE=' + QuotedStr(cEmpresa.Text) +
                                          ' AND ALBARAN_LE=:Albaran ' +
                                          ' AND FAMILIA_LE BETWEEN :FamiliaDesde AND :FamiliaHasta ' +
                                          ' AND ARTICULO_LE BETWEEN :ArticuloDesde AND :ArticuloHasta ');
                        if LoteLike then
                           QLEntradas.SQL.Add(' AND LOTE_LE LIKE :LikeLote ')
                        else
                            QLEntradas.SQL.Add(' AND LOTE_LE BETWEEN :LoteDesde AND :LoteHasta ');

                        if (cLoteOrigenDesde.Text <> '') and (cLoteOrigenHasta.Text <> '') then
                            QLEntradas.SQL.Add(' AND LOTE_ORIGEN_LE BETWEEN :LoteOrigenDesde AND :LoteOrigenHasta ');

                        //Tabla temporal de almacenes
                        QTempAlmacenes.Close;
                        QTempAlmacenes.SQL.Clear;
                        QTempAlmacenes.SQL.Add(' SELECT * FROM TEMP_LOTES_GUARDAR ' +
                                               ' WHERE EMPRESA_AL=' + QuotedStr(cEmpresa.Text) +
                                               ' AND CLIENTE_AL=:Cliente ' +
                                               ' AND LOTE_AL=:Lote');

                        //Modificacion de la tabla temporal de almacenes
                        QAuxEnt.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                        QAuxEnt.SQL.Add(' UPDATE TEMP_LOTES_GUARDAR ' +
                                     ' SET BULTOS_ENTRADOS_AL=BULTOS_ENTRADOS_AL - :BultoEntrados, ' +
                                         ' UNIDADES_ENTRADAS_AL=UNIDADES_ENTRADAS_AL - :UnidadesEntradas, ' +
                                         ' UNIDADES_DESTRUIDAS_AL=UNIDADES_DESTRUIDAS_AL - :UnidadesDestruidas, ' +
                                         ' UNIDADES_MERMAS_AL=UNIDADES_MERMAS_AL - :UnidadesMermas, ' +
                                         ' ESTUCHES_SUELTOS_AL=:EstuchesSueltos ' +
                                     ' WHERE EMPRESA_AL=' + QuotedStr(cEmpresa.Text) +
                                     ' AND CLIENTE_AL=:Cliente ' +
                                     ' AND LOTE_AL=:Lote');

                        QCEntradas.Open;
                        While not QCEntradas.Eof do  //Para cada Salida
                        begin
                             QLEntradas.Close;
                             QLEntradas.ParamByName('Albaran').AsInteger:=QCEntradas.FieldByName('Albaran_ce').AsInteger;
                             QLEntradas.ParamByName('FamiliaDesde').AsString:=cFamiliaDesde.Text;
                             QLEntradas.ParamByName('FamiliaHasta').AsString:=cFamiliaHasta.Text;
                             QLEntradas.ParamByName('ArticuloDesde').AsString:=cArticuloDesde.Text;
                             QLEntradas.ParamByName('ArticuloHasta').AsString:=cArticuloHasta.Text;
                             if LoteLike then
                                QLEntradas.ParamByName('LikeLote').AsString:=StringReplace(cLoteDesde.Text, '*', '%',[rfReplaceAll])
                             else
                             begin
                                  QLEntradas.ParamByName('LoteDesde').AsString:=cLoteDesde.Text;
                                  QLEntradas.ParamByName('LoteHasta').AsString:=cLoteHasta.Text;
                             end;

                             if (cLoteOrigenDesde.Text <> '') and (cLoteOrigenHasta.Text <> '') then
                             begin
                                  QLEntradas.ParamByName('LoteOrigenDesde').AsString:=cLoteOrigenDesde.Text;
                                  QLEntradas.ParamByName('LoteOrigenHasta').AsString:=cLoteOrigenHasta.Text;
                             end;

                             QLEntradas.Open;

                             While not QLEntradas.Eof do  //Para cada Linea de la Salida
                             begin
                                  QTempAlmacenes.Close;
                                  QTempAlmacenes.ParamByName('Cliente').AsString:=QCEntradas.FieldByName('Cliente_ce').AsString;
                                  QTempAlmacenes.ParamByName('Lote').AsString:=QLEntradas.FieldByName('Lote_le').AsString;
                                  QTempAlmacenes.Open;
                                  if not QTempAlmacenes.IsEmpty then   //Encontramos el Almacen
                                  begin
                                       QAuxEnt.ParamByName('Cliente').AsString:=QCEntradas.FieldByName('Cliente_ce').AsString;
                                       QAuxEnt.ParamByName('Lote').AsString:=QLEntradas.FieldByName('Lote_le').AsString;

                                       QAuxEnt.ParamByName('BultoEntrados').AsInteger:=QLEntradas.FieldByName('Bultos_le').AsInteger;
                                       //Entrada Normal
                                       if QCEntradas.FieldByName('Tipo_Entrada_ce').AsString='N' then
                                          QAuxEnt.ParamByName('UnidadesEntradas').AsFloat:=QLEntradas.FieldByName('Unidades_le').AsFloat
                                       else
                                           QAuxEnt.ParamByName('UnidadesEntradas').AsFloat:=0;
                                       //Entrada Destruida
                                       if QCEntradas.FieldByName('Tipo_Entrada_ce').AsString='D' then
                                          QAuxEnt.ParamByName('UnidadesDestruidas').AsFloat:=QLEntradas.FieldByName('Unidades_le').AsFloat
                                       else
                                           QAuxEnt.ParamByName('UnidadesDestruidas').AsFloat:=0;
                                       //Entrada de Regularizacion
                                       if QCEntradas.FieldByName('Tipo_Entrada_ce').AsString='R' then
                                          QAuxEnt.ParamByName('UnidadesMermas').AsFloat:=QLEntradas.FieldByName('Unidades_le').AsFloat
                                       else
                                           QAuxEnt.ParamByName('UnidadesMermas').AsFloat:=0;

                                       //--- CALCULO LOS ESTUCHES SUELTOS ---
                                       if QTempAlmacenes.FieldByName('Estuches_Bulto_al').AsInteger<>0 then
                                       begin
{
                                            //Estuches Totales del Almacen
                                            TotalEstuchesAlma:=((QTempAlmacenes.FieldByName('bultos_entrados_al').AsInteger -
                                                                 QTempAlmacenes.FieldByName('bultos_salidos_al').AsInteger) *
                                                                 QTempAlmacenes.FieldByName('estuches_bulto_al').AsInteger) +
                                                                 QTempAlmacenes.FieldByName('estuches_sueltos_al').AsInteger;
                                            //Estuches Totales de la Linea
                                            TotalEstuchesLinea:=(QLEntradas.FieldByName('Bultos_le').AsInteger *
                                                                 QTempAlmacenes.FieldByName('estuches_bulto_al').AsInteger) +
                                                                 QLEntradas.FieldByName('estuches_sueltos_le').AsInteger;
                                            //Estuches Totales Resultantes
                                            TotalEstuches:=TotalEstuchesAlma + TotalEstuchesLinea;

                                            //Division entera (TotalEstuches dividido EstuchesBulto)
                                            Cociente:=TotalEstuches div QTempAlmacenes.FieldByName('Estuches_Bulto_al').AsInteger;
}
                                            //Obtenemos los estuches sueltos
                                            QAuxEnt.ParamByName('EstuchesSueltos').AsInteger:=QTempAlmacenes.FieldByName('Estuches_sueltos_al').AsInteger - QLEntradas.FieldByName('estuches_sueltos_le').AsInteger;
                                       end
                                       else
                                           QAuxEnt.ParamByName('EstuchesSueltos').AsInteger:=0;

                                       //Modificamos la Tabla Temporal de Almacenes
                                       QAuxEnt.ExecSQL;
                                  end;
                                  QLEntradas.Next;
                             end;
                             QCEntradas.Next;
                        end;


                     end;

                     //SALIDAS
                     QCSalidas:=TQuery.Create(Self);
                     QLSalidas:=TQuery.Create(Self);
                     QAux:=TQuery.Create(Self);
                     //try

                        //Cabeceras de salida
                        QCSalidas.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                        QCSalidas.SQL.Add(' SELECT * FROM CABECERA_SALIDAS ' +
                                          ' WHERE EMPRESA_CS=' + QuotedStr(cEmpresa.Text) +
                                          ' AND CLIENTE_CS BETWEEN ' + QuotedStr(cClienteDesde.Text) + ' AND ' + QuotedStr(cClienteHasta.Text) );
                        if cTipo.Text = 'CLIENTE' then
                        begin
                          QCSalidas.SQL.Add(' AND (FECHA_ALBARAN_CS =' + QuotedStr(AnyoMesDia(cFecha.Text)) +
                                            '      AND HORA_CS >= ' + QuotedStr(Copy(cHora.Text,1,2) + ':' + Copy(cHora.Text,3,2) + ':' + Copy(cHora.Text,5,2))  +
                                            ' OR FECHA_ALBARAN_CS>' + QuotedStr(AnyoMesDia(cFecha.Text)) + ')' )
                        end
                        else
                          QCSalidas.SQL.Add(' AND FECHA_ALBARAN_CS>=' + QuotedStr(AnyoMesDia(cFecha.Text))  );

                        QCSalidas.SQL.Add(' ORDER BY EMPRESA_CS, CLIENTE_CS, FECHA_ALBARAN_CS, ALBARAN_CS');

                        //Lineas de salida
                        QLSalidas.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                        QLSalidas.SQL.Add(' SELECT * FROM LINEA_SALIDAS ' +
                                          ' WHERE EMPRESA_LS=' + QuotedStr(cEmpresa.Text) +
                                          ' AND ALBARAN_LS=:Albaran ' +
                                          ' AND FAMILIA_LS BETWEEN :FamiliaDesde AND :FamiliaHasta ' +
                                          ' AND ARTICULO_LS BETWEEN :ArticuloDesde AND :ArticuloHasta ');
                        if LoteLike then
                           QLSalidas.SQL.Add(' AND LOTE_LS LIKE :LikeLote ')
                        else
                            QLSalidas.SQL.Add(' AND LOTE_LS BETWEEN :LoteDesde AND :LoteHasta ');

                        if (cLoteOrigenDesde.Text <> '') and (cLoteOrigenHasta.Text <> '') then
                            QLSalidas.SQL.Add(' AND LOTE_ORIGEN_LS BETWEEN :LoteOrigenDesde AND :LoteOrigenHasta ');

                        //Tabla temporal de almacenes
                        QTempAlmacenes.Close;
                        QTempAlmacenes.SQL.Clear;
                        QTempAlmacenes.SQL.Add(' SELECT * FROM TEMP_LOTES_GUARDAR ' +
                                               ' WHERE EMPRESA_AL=' + QuotedStr(cEmpresa.Text) +
                                               ' AND CLIENTE_AL=:Cliente ' +
                                               ' AND LOTE_AL=:Lote');

                        //Modificacion de la tabla temporal de almacenes
                        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                        QAux.SQL.Add(' UPDATE TEMP_LOTES_GUARDAR ' +
                                     ' SET BULTOS_SALIDOS_AL=BULTOS_SALIDOS_AL - :BultoSalidos, ' +
                                         ' UNIDADES_SALIDAS_AL=UNIDADES_SALIDAS_AL - :UnidadesSalidas, ' +
                                         ' UNIDADES_DESTRUIDAS_AL=UNIDADES_DESTRUIDAS_AL - :UnidadesDestruidas, ' +
                                         ' UNIDADES_MERMAS_AL=UNIDADES_MERMAS_AL - :UnidadesMermas, ' +
                                         ' ESTUCHES_SUELTOS_AL=:EstuchesSueltos, ' +
                                         ' PALETS_SALIDOS_AL=PALETS_SALIDOS_AL - :PaletsSalidos ' +
                                     ' WHERE EMPRESA_AL=' + QuotedStr(cEmpresa.Text) +
                                     ' AND CLIENTE_AL=:Cliente ' +
                                     ' AND LOTE_AL=:Lote');

                        QCSalidas.Open;
                        While not QCSalidas.Eof do  //Para cada Salida
                        begin
                             QLSalidas.Close;
                             QLSalidas.ParamByName('Albaran').AsInteger:=QCSalidas.FieldByName('Albaran_cs').AsInteger;
                             QLSalidas.ParamByName('FamiliaDesde').AsString:=cFamiliaDesde.Text;
                             QLSalidas.ParamByName('FamiliaHasta').AsString:=cFamiliaHasta.Text;
                             QLSalidas.ParamByName('ArticuloDesde').AsString:=cArticuloDesde.Text;
                             QLSalidas.ParamByName('ArticuloHasta').AsString:=cArticuloHasta.Text;
                             if LoteLike then
                                QLSalidas.ParamByName('LikeLote').AsString:=StringReplace(cLoteDesde.Text, '*', '%',[rfReplaceAll])
                             else
                             begin
                                  QLSalidas.ParamByName('LoteDesde').AsString:=cLoteDesde.Text;
                                  QLSalidas.ParamByName('LoteHasta').AsString:=cLoteHasta.Text;
                             end;
                             if (cLoteOrigenDesde.Text <> '') and (cLoteOrigenHasta.Text <> '') then
                             begin
                               QLSalidas.ParamByName('LoteOrigenDesde').AsString:=cLoteOrigenDesde.Text;
                               QLSalidas.ParamByName('LoteOrigenHasta').AsString:=cLoteOrigenHasta.Text;
                             end;

                             QLSalidas.Open;

                             While not QLSalidas.Eof do  //Para cada Linea de la Salida
                             begin
                                  QTempAlmacenes.Close;
                                  QTempAlmacenes.ParamByName('Cliente').AsString:=QCSalidas.FieldByName('Cliente_cs').AsString;
                                  QTempAlmacenes.ParamByName('Lote').AsString:=QLSalidas.FieldByName('Lote_ls').AsString;
                                  QTempAlmacenes.Open;
                                  if not QTempAlmacenes.IsEmpty then   //Encontramos el Almacen
                                  begin
                                       QAux.ParamByName('Cliente').AsString:=QCSalidas.FieldByName('Cliente_cs').AsString;
                                       QAux.ParamByName('Lote').AsString:=QLSalidas.FieldByName('Lote_ls').AsString;

                                       QAux.ParamByName('BultoSalidos').AsInteger:=QLSalidas.FieldByName('Bultos_ls').AsInteger;
                                       //Salida Normal
                                       if QCSalidas.FieldByName('Tipo_Salida_cs').AsString='N' then
                                          QAux.ParamByName('UnidadesSalidas').AsFloat:=QLSalidas.FieldByName('Unidades_ls').AsFloat
                                       else
                                           QAux.ParamByName('UnidadesSalidas').AsFloat:=0;
                                       //Salida Destruida
                                       if QCSalidas.FieldByName('Tipo_Salida_cs').AsString='D' then
                                          QAux.ParamByName('UnidadesDestruidas').AsFloat:=QLSalidas.FieldByName('Unidades_ls').AsFloat
                                       else
                                           QAux.ParamByName('UnidadesDestruidas').AsFloat:=0;
                                       //Salida de Regularizacion
                                       if QCSalidas.FieldByName('Tipo_Salida_cs').AsString='R' then
                                          QAux.ParamByName('UnidadesMermas').AsFloat:=QLSalidas.FieldByName('Unidades_ls').AsFloat
                                       else
                                           QAux.ParamByName('UnidadesMermas').AsFloat:=0;
                                       QAux.ParamByName('PaletsSalidos').AsInteger:=QLSalidas.FieldByName('Palets_ls').AsInteger;

                                       //--- CALCULO LOS ESTUCHES SUELTOS ---
                                       if QTempAlmacenes.FieldByName('Estuches_Bulto_al').AsInteger<>0 then
                                       begin
                                            //Estuches Totales del Almacen
                                            TotalEstuchesAlma:=((QTempAlmacenes.FieldByName('bultos_entrados_al').AsInteger -
                                                                 QTempAlmacenes.FieldByName('bultos_salidos_al').AsInteger) *
                                                                 QTempAlmacenes.FieldByName('estuches_bulto_al').AsInteger) +
                                                                 QTempAlmacenes.FieldByName('estuches_sueltos_al').AsInteger;
                                            //Estuches Totales de la Linea
                                            TotalEstuchesLinea:=(QLSalidas.FieldByName('Bultos_ls').AsInteger *
                                                                 QTempAlmacenes.FieldByName('estuches_bulto_al').AsInteger) +
                                                                 QLSalidas.FieldByName('estuches_sueltos_ls').AsInteger;
                                            //Estuches Totales Resultantes
                                            TotalEstuches:=TotalEstuchesAlma + TotalEstuchesLinea;

                                            //Division entera (TotalEstuches dividido EstuchesBulto)
                                            Cociente:=TotalEstuches div QTempAlmacenes.FieldByName('Estuches_Bulto_al').AsInteger;

                                            //Obtenemos los estuches sueltos
                                            QAux.ParamByName('EstuchesSueltos').AsInteger:=TotalEstuches - (QTempAlmacenes.FieldByName('Estuches_Bulto_al').AsInteger*Cociente);
                                       end
                                       else
                                           QAux.ParamByName('EstuchesSueltos').AsInteger:=0;

                                       //Modificamos la Tabla Temporal de Almacenes
                                       QAux.ExecSQL;
                                  end;
                                  QLSalidas.Next;
                             end;
                             QCSalidas.Next;
                        end;
                      (*finally
                             QCSalidas.Close;
                             FreeAndNil(QCSalidas);

                             QLSalidas.Close;
                             FreeAndNil(QLSalidas);

                             QAux.Close;
                             FreeAndNil(QAux);
                      end;
                      *)
                  finally
                         if (cTipo.Text = 'CLIENTE') and (cHora.Text <> '') then
                         begin
                           QAuxEnt.Close;
                           FreeAndNil(QAuxEnt);

                           QLEntradas.Close;
                           FreeAndNil(QLEntradas);

                           QCEntradas.Close;
                           FreeAndNil(QCEntradas);
                         end;

                         QAux.Close;
                         FreeAndNil(QAux);

                         QTempAlmacenes.Close;
                         FreeAndNil(QTempAlmacenes);

                         QLSalidas.Close;
                         FreeAndNil(QLSalidas);

                         QCSalidas.Close;
                         FreeAndNil(QCSalidas);
                  end;
                  //Construimos la Query
                  CadSql:=' SELECT * FROM TEMP_LOTES_GUARDAR, ARTICULOS ';
             end
             else //STOCK A PARTIR DE LOS ALMACENES
                 CadSql:=' SELECT * FROM ALMACENES, ARTICULOS ';    //Construimos la Query

             //Construimos la Query
             CadSql:=CadSql +
                     ' WHERE EMPRESA_AL=EMPRESA_A ' +
                     ' AND FAMILIA_AL=FAMILIA_A ' +
                     ' AND ARTICULO_AL=CODIGO_A ' +
                     ' AND EMPRESA_A=' + QuotedStr(cEmpresa.Text) +
                     ' AND CLIENTE_AL BETWEEN ' + QuotedStr(cClienteDesde.Text) + ' AND ' + QuotedStr(cClienteHasta.Text) +
                     ' AND FAMILIA_AL BETWEEN ' + QuotedStr(cFamiliaDesde.Text) + ' AND ' + QuotedStr(cFamiliaHasta.Text) +
                     ' AND ARTICULO_AL BETWEEN ' + QuotedStr(cArticuloDesde.Text) + ' AND ' + QuotedStr(cArticuloHasta.Text) +
                     ' AND NUMERO_CAMARA_AL BETWEEN ' + cCamaraDesde.Text + ' AND ' + cCamaraHasta.Text +
                     ' AND ZONA_AL BETWEEN ' + QuotedStr(cZonaDesde.Text) + ' AND ' + QuotedStr(cZonaHasta.Text) +
                     ' AND ((BULTOS_ENTRADOS_AL-BULTOS_SALIDOS_AL)<> 0 ' +
                           ' OR ESTUCHES_SUELTOS_AL <> 0 ' +
                           ' OR (UNIDADES_ENTRADAS_AL - UNIDADES_SALIDAS_AL - UNIDADES_MERMAS_AL - UNIDADES_DESTRUIDAS_AL) <> 0)';

             //Si hay * en el lote usamos el Like en vez del Between
             if LoteLike then
                CadSql:=CadSql + ' AND LOTE_AL LIKE ' + QuotedStr(StringReplace(cLoteDesde.Text, '*', '%',[rfReplaceAll]))
             else
                 CadSql:=CadSql + ' AND LOTE_AL BETWEEN ' + QuotedStr(cLoteDesde.Text) + ' AND ' + QuotedStr(cLoteHasta.Text);

            if (cLoteOrigenDesde.Text <> '') and (cLoteOrigenHasta.Text <> '') then
                CadSql:=CadSql + ' AND LOTE_ORIGEN_AL BETWEEN ' + QuotedStr(cLoteOrigenDesde.Text) + ' AND ' + QuotedStr(cLoteOrigenHasta.Text);

             //TIPO LOTE NORMAL/IMPORTACION
             if cNormImp.ItemIndex=1 then
                CadSql:=CadSql + ' AND TIPO_LOTE_AL=' + QuotedStr('N')
             else if cNormImp.ItemIndex=2 then
                     CadSql:=CadSql + ' AND TIPO_LOTE_AL=' + QuotedStr('I')
                  else if cNormImp.ItemIndex=3 then
                          CadSql:=CadSql + ' AND TIPO_LOTE_AL=' + QuotedStr('B')
                       else if cNormImp.ItemIndex=4 then
                               CadSql:=CadSql + ' AND TIPO_LOTE_AL=' + QuotedStr('T')
                            else if cNormImp.ItemIndex=5 then
                                    CadSql:=CadSql + ' AND TIPO_LOTE_AL=' + QuotedStr('R');

             //CADUCADOS
             if cCaducados.ItemIndex=1 then  //SI
                CadSql:=CadSql + ' AND FECHA_CADUCIDAD_AL<' + QuotedStr(AnyoMesDia(cFecha.Text))
             else if cCaducados.ItemIndex=2 then  //NO
                     CadSql:=CadSql + ' AND FECHA_CADUCIDAD_AL>=' + QuotedStr(AnyoMesDia(cFecha.Text));

             //ORDEN
             if cOrden.ItemIndex=0 then //Orden por lote
                CadSql:=CadSql + ' ORDER BY CLIENTE_AL, LOTE_AL, DENOMINACION_A'
             else if cOrden.ItemIndex=1 then  //Orden por codigo familia
                     CadSql:=CadSql + ' ORDER BY CLIENTE_AL, FAMILIA_AL, DENOMINACION_A'
             else if cOrden.ItemIndex=2 then  //Orden por codigo familia/articulo
                     CadSql:=CadSql + ' ORDER BY CLIENTE_AL, ARTICULO_AL, DENOMINACION_A'
             else if cOrden.ItemIndex=3 then  //Orden por codigo nombre articulo
                     CadSql:=CadSql + ' ORDER BY CLIENTE_AL, DENOMINACION_A, FECHA_ENTRADA_AL'
             else if cOrden.ItemIndex=4 then  //Orden por camara
                     CadSql:=CadSql + ' ORDER BY CLIENTE_AL, NUMERO_CAMARA_AL, DENOMINACION_A'
             else if cOrden.ItemIndex=5 then  //Orden por camara
                     CadSql:=CadSql + ' ORDER BY CLIENTE_AL, ZONA_AL, DENOMINACION_A'
             else if cOrden.ItemIndex=6 then  //Orden por camara
                     CadSql:=CadSql + ' ORDER BY CLIENTE_AL, FECHA_ENTRADA_AL, DENOMINACION_A'
                  else //Orden por nombre articulo
                      CadSql:=CadSql + ' ORDER BY CLIENTE_AL, FECHA_CADUCIDAD_AL, DENOMINACION_A';

             //CLIENTE
             if cTipo.ItemIndex=1 then
             begin
                  with TQRAlmacenesCliente.Create(Application) do  //Creamos dinámicamente el report
                  try
                     //Agrupacion por articulo
                     if cAgrupacion.ItemIndex=1 then
                        AgruparArticulo:=True
                     else
                         AgruparArticulo:=False;

                     tEmpresa.Caption:=cEmpresa.Text + '-' + tNomEmpresa.Caption;
                     tFecha.Caption:='FECHA: ' + cFecha.Text;
                     tFamilias.Caption:=cFamiliaDesde.Text + '-' + cFamiliaHasta.Text;
                     tArticulos.Caption:=cArticuloDesde.Text + '-' + cArticuloHasta.Text;
                     tLotes.Caption:=cLoteDesde.Text + '-' + cLoteHasta.Text;
                     tCamaras.Caption:=cCamaraDesde.Text + '-' + cCamaraHasta.Text;
                     tZonas.Caption:=cZonaDesde.Text + '-' + cZonaHasta.Text;
                     tCaducados.Caption:=cCaducados.Text;
                     tTipos.Caption:=cNormImp.Text;
                     if cHora.Text <> '' then
                     begin
                      tHora.Caption:= 'HORA:' + Copy(cHora.Text,1,2) + ':' + Copy(cHora.Text,3,2);
                      if Copy(cHora.Text,5,2) <> '' then
                        tHora.Caption:=tHora.Caption + ':' + Copy(cHora.Text,5,2)
                      else
                        tHora.Caption:=tHora.Caption + ':' + '00';
                     end
                     else
                      tHora.Caption:= '';

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
                      Application.ProcessMessages;
                   end;
             end
             else
             //CAMARA
             if cTipo.ItemIndex=2 then
             begin
                  with TQRAlmacenesCamara.Create(Application) do  //Creamos dinámicamente el report
                  try
                     //Agrupacion por articulo
                     if cAgrupacion.ItemIndex=1 then
                        AgruparArticulo:=True
                     else
                         AgruparArticulo:=False;

                     tEmpresa.Caption:=cEmpresa.Text + '-' + tNomEmpresa.Caption;
                     tFecha.Caption:='FECHA: ' + cFecha.Text;
                     tFamilias.Caption:=cFamiliaDesde.Text + '-' + cFamiliaHasta.Text;
                     tArticulos.Caption:=cArticuloDesde.Text + '-' + cArticuloHasta.Text;
                     tLotes.Caption:=cLoteDesde.Text + '-' + cLoteHasta.Text;
                     tCamaras.Caption:=cCamaraDesde.Text + '-' + cCamaraHasta.Text;
                     tZonas.Caption:=cZonaDesde.Text + '-' + cZonaHasta.Text;
                     tCaducados.Caption:=cCaducados.Text;
                     tTipos.Caption:=cNormImp.Text;

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
                      Application.ProcessMessages;
                   end;
             end
             //NORMAL
             else
             begin
                  with TQRAlmacenesNormal.Create(Application) do  //Creamos dinámicamente el report
                  try
                     tEmpresa.Caption:=cEmpresa.Text + '-' + tNomEmpresa.Caption;
                     tEmpresaBis.Caption:=cEmpresa.Text + '-' + tNomEmpresa.Caption;
                     tFecha.Caption:='FECHA: ' + cFecha.Text;
                     tFechaBis.Caption:='FECHA: ' + cFecha.Text;
                     tFamilias.Caption:=cFamiliaDesde.Text + '-' + cFamiliaHasta.Text;
                     tArticulos.Caption:=cArticuloDesde.Text + '-' + cArticuloHasta.Text;
                     tLotes.Caption:=cLoteDesde.Text + '-' + cLoteHasta.Text;
                     tCamaras.Caption:=cCamaraDesde.Text + '-' + cCamaraHasta.Text;
                     tZonas.Caption:=cZonaDesde.Text + '-' + cZonaHasta.Text;
                     tCaducados.Caption:=cCaducados.Text;
                     tTipos.Caption:=cNormImp.Text;

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
                      Application.ProcessMessages;
                  end;
             end;
        end;
     except
           on E:Exception do
                CapturaErrores(E);
     end;
end;

//----------------------- VALIDA LA SELECCION ----------------------------------
function TListadoAlmacenes.ValidarSeleccion(): Boolean;
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
     else if not EsFecha(cFecha.Text) then
     begin
          cFecha.SetFocus;
          MessageDlg (Chr(13) + 'La fecha es incorrecta', mtError,[mbOk],0);
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
     end
     else if cLoteDesde.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta lote desde', mtError,[mbOk],0);
          cLoteDesde.SetFocus;
          Result:=False;
     end
     else if cLoteHasta.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta lote hasta', mtError,[mbOk],0);
          cLoteHasta.SetFocus;
          Result:=False;
     end
     else if cLoteDesde.Text>cLoteHasta.Text then
     begin
          MessageDlg (Chr(13) + 'Rango de lotes incorrecto', mtError,[mbOk],0);
          cLoteDesde.SetFocus;
          Result:=False;
     end
{
     else if cLoteOrigenDesde.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta lote origen desde', mtError,[mbOk],0);
          cLoteOrigenDesde.SetFocus;
          Result:=False;
     end
     else if cLoteOrigenHasta.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta lote origen hasta', mtError,[mbOk],0);
          cLoteOrigenHasta.SetFocus;
          Result:=False;
     end
}
     else if cLoteOrigenDesde.Text>cLoteOrigenHasta.Text then
     begin
          MessageDlg (Chr(13) + 'Rango de lotes origen incorrecto', mtError,[mbOk],0);
          cLoteOrigenDesde.SetFocus;
          Result:=False;
     end
     else if cFamiliaDesde.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta familia desde', mtError,[mbOk],0);
          cFamiliaDesde.SetFocus;
          Result:=False;
     end
     else if cFamiliaHasta.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta familia hasta', mtError,[mbOk],0);
          cFamiliaHasta.SetFocus;
          Result:=False;
     end
     else if cFamiliaDesde.Text>cFamiliaHasta.Text then
     begin
          MessageDlg (Chr(13) + 'Rango de familias incorrecto', mtError,[mbOk],0);
          cFamiliaDesde.SetFocus;
          Result:=False;
     end
     else if cArticuloDesde.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta artículo desde', mtError,[mbOk],0);
          cArticuloDesde.SetFocus;
          Result:=False;
     end
     else if cArticuloHasta.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta artículo hasta', mtError,[mbOk],0);
          cFamiliaHasta.SetFocus;
          Result:=False;
     end
     else if cArticuloDesde.Text>cArticuloHasta.Text then
     begin
          MessageDlg (Chr(13) + 'Rango de artículos incorrecto', mtError,[mbOk],0);
          cArticuloDesde.SetFocus;
          Result:=False;
     end
     else if cCamaraDesde.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta cámara desde', mtError,[mbOk],0);
          cCamaraDesde.SetFocus;
          Result:=False;
     end
     else if cCamaraHasta.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta cámara hasta', mtError,[mbOk],0);
          cCamaraHasta.SetFocus;
          Result:=False;
     end
     else if cCamaraDesde.Text>cCamaraHasta.Text then
     begin
          MessageDlg (Chr(13) + 'Rango de cámaras incorrecto', mtError,[mbOk],0);
          cCamaraDesde.SetFocus;
          Result:=False;
     end
     else if cZonaDesde.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta zona desde', mtError,[mbOk],0);
          cZonaDesde.SetFocus;
          Result:=False;
     end
     else if cZonaHasta.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta zona hasta', mtError,[mbOk],0);
          cZonaHasta.SetFocus;
          Result:=False;
     end
     else if cZonaDesde.Text>cZonaHasta.Text then
     begin
          MessageDlg (Chr(13) + 'Rango de zonas incorrecto', mtError,[mbOk],0);
          cZonaDesde.SetFocus;
          Result:=False;
     end;
end;

//---------------------- PONE EL COLOR DEL FOCO --------------------------------
procedure TListadoAlmacenes.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clMoneyGreen
     else if Sender is  TcxDateEdit then        //Si el componente es un TcxDateEdit
             TcxDateEdit(Sender).Style.Color:=clMoneygreen
          else if Sender is TComboBox then           //Si el componente es un TComboBox
                  TComboBox(Sender).Color:=clMoneygreen;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TListadoAlmacenes.ColorExit(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          TEdit(Sender).Color:=clWindow;
          if Length(TEdit(Sender).Text)>0 then
             TEdit(Sender).Text:=RellenarCeros(TEdit(Sender).Text,TEdit(Sender).MaxLength,'I');
     end
     else if Sender is TComboBox then           //Si el componente es un TComboBox
             TComboBox(Sender).Color:=clWindow
          else if Sender is  TcxDateEdit then        //Si el componente es un TcxDateEdit
                  TcxDateEdit(Sender).Style.Color:=clWindow;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TListadoAlmacenes.ColorExitSinCeros(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clWindow
     else if Sender is TComboBox then           //Si el componente es un TComboBox
             TComboBox(Sender).Color:=clWindow
          else if Sender is  TcxDateEdit then        //Si el componente es un TcxDateEdit
                  TcxDateEdit(Sender).Style.Color:=clWindow;
end;

//------------------------- CREACION DEL FORMULARIO ----------------------------
procedure TListadoAlmacenes.FormCreate(Sender: TObject);
var Fecha: TDateTime;
    Hour, Min, Sec, MSec: Word;
begin
     Top:=1;
     Left:=0;
     cFecha.Date:=Date();
     Fecha:= Now;
     DecodeTime(Fecha, Hour, Min, Sec, MSec);
     cHora.Text:=RellenarCeros(IntToStr(Hour),2,'I') + RellenarCeros(IntToStr(Min),2,'I') + RellenarCeros(IntToStr(Sec),2,'I'); //No esta enganchado
     LoteLike:=False;

     cEmpresa.Text:=EmpresaGlobal;
end;

//------------------------- CIERRE DEL FORMULARIO ------------------------------
procedure TListadoAlmacenes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

//------------------------- BOTON SALIR ----------------------------------------
procedure TListadoAlmacenes.BSalirClick(Sender: TObject);
begin
     Close;
end;

//------------------------ AL CAMBIAR LA EMPRESA -------------------------------
procedure TListadoAlmacenes.cEmpresaChange(Sender: TObject);
begin
     tNomEmpresa.Caption:= NomEmpresa(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
end;

//--------- PULSACION DE TECLAS EN EL COMBO DE ORDEN ---------------------------
procedure TListadoAlmacenes.cOrdenKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key='L') or (Key='l') then  //LOTE
        cOrden.ItemIndex:=0
     else if (Key='C') or (Key='c') then  //CÓD. FAMILIA / ARTÍCULO
              cOrden.ItemIndex:=1
          else if (Key='N') or (Key='n') then  //NOMBRE ARTÍCULO
                  cOrden.ItemIndex:=2;
     Key:=#0;
end;

//------------------------ PULSACION DE TECLAS EN EL COMBO ---------------------
procedure TListadoAlmacenes.cNormImpKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key='T') or (Key='t') then  //TODOS
        cNormImp.ItemIndex:=0
     else if (Key='N') or (Key='n') then  //NORMAL
             cNormImp.ItemIndex:=1
          else if (Key='P') or (Key='p') then  //IMPORTACIÓN - PENDIENTE
                  cNormImp.ItemIndex:=2
               else if (Key='A') or (Key='a') then  //IMPORTACIÓN - ABANDONADO
                       cNormImp.ItemIndex:=3
                     else if (Key='I') or (Key='i') then  //IMPORTACIÓN - AUTORIZADO
                             cNormImp.ItemIndex:=4
                          else if (Key='R') or (Key='r') then  //REGULARIZACION
                             cNormImp.ItemIndex:=5;
     Key:=#0;
end;

//--------------------------- AL SALIR DEL LOTE DESDE --------------------------
procedure TListadoAlmacenes.cLoteDesdeExit(Sender: TObject);
begin
     cLoteDesde.Color:=clWindow;
     if Pos('*',cLoteDesde.Text)>0 then
     begin
          cLoteHasta.Text:=cLoteDesde.Text;
          LoteLike:=True;
          //cFamiliaDesde.SetFocus;
          cLoteOrigenDesde.SetFocus
     end
     else
         LoteLike:=False;
end;

//------------------------- AL CAMBIAR EL TIPO ---------------------------------
procedure TListadoAlmacenes.cTipoChange(Sender: TObject);
begin
     if cTipo.ItemIndex=0 then
     begin
          cAgrupacion.ItemIndex:=0;
          cAgrupacion.TabStop:=False;
     end
     else
         cAgrupacion.TabStop:=True;
end;

//------------------------ PULSACION DE TECLAS EN EL COMBO ---------------------
procedure TListadoAlmacenes.cCaducadosKeyPress(Sender: TObject;  var Key: Char);
begin
     if (Key='T') or (Key='t') then  //TODOS
         cCaducados.ItemIndex:=0
     else if (Key='S') or (Key='s') then //SI
              cCaducados.ItemIndex:=1
          else if (Key='N') or (Key='n') then //NO
                   cCaducados.ItemIndex:=2;
     Key:=#0;
end;

//------------------------ PULSACION DE TECLAS EN EL COMBO ---------------------
procedure TListadoAlmacenes.cTipoKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key='N') or (Key='n') then  //NORMAL
     begin
          cTipo.ItemIndex:=0;

          cAgrupacion.ItemIndex:=0;
          cAgrupacion.TabStop:=False;
     end
     else if (Key='C') or (Key='c') then   //CLIENTE
     begin
          cTipo.ItemIndex:=1;
          cAgrupacion.TabStop:=True;
     end;
     Key:=#0;
end;

//------------------------ PULSACION DE TECLAS EN EL COMBO ---------------------
procedure TListadoAlmacenes.cAgrupacionKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key='N') or (Key='n') then  //NORMAL
        cAgrupacion.ItemIndex:=0
     else if ((Key='A') or (Key='a')) and (cTipo.ItemIndex=0) then  //ARTICULO
          cAgrupacion.ItemIndex:=1;
     Key:=#0;
end;

//------------------------ AL CAMBIAR LA AGRUPACION ----------------------------
procedure TListadoAlmacenes.cAgrupacionChange(Sender: TObject);
begin
     if cTipo.ItemIndex=0 then
        cAgrupacion.ItemIndex:=0;
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TListadoAlmacenes.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

procedure TListadoAlmacenes.cHoraExit(Sender: TObject);
begin
  if (cHora.Text <> '') and (Copy(cHora.Text, 3,2) = '') then
    cHora.Text := cHora.Text + '00' + '00';
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TListadoAlmacenes.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresa.Text:=CodEmpresa;
     cEmpresa.Setfocus;
end;


end.
