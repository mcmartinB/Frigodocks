unit LAlmacenesNormal;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables;

type
  TQRAlmacenesNormal = class(TQuickRep)
    Query1: TQuery;
    QRBand2: TQRBand;
    tArticulo: TQRLabel;
    QRDBText1: TQRDBText;
    Query1empresa_al: TStringField;
    Query1cliente_al: TStringField;
    Query1familia_al: TStringField;
    Query1articulo_al: TStringField;
    Query1lote_al: TStringField;
    Query1bultos_entrados_al: TIntegerField;
    Query1bultos_salidos_al: TIntegerField;
    Query1unidades_entradas_al: TFloatField;
    Query1unidades_salidas_al: TFloatField;
    Query1unidades_destruidas_al: TFloatField;
    Query1unidades_mermas_al: TFloatField;
    Query1status_retenido_al: TStringField;
    Query1numero_camara_al: TSmallintField;
    Query1zona_al: TStringField;
    Query1estuches_bulto_al: TSmallintField;
    Query1estuches_sueltos_al: TIntegerField;
    Query1tipo_lote_al: TStringField;
    Query1fecha_entrada_al: TStringField;
    Query1fecha_caducidad_al: TStringField;
    Query1unid_sal_mismo_dia_al: TFloatField;
    Query1palets_entrados_al: TIntegerField;
    Query1palets_salidos_al: TIntegerField;
    Query1empresa_a: TStringField;
    Query1familia_a: TStringField;
    Query1codigo_a: TStringField;
    Query1denominacion_a: TStringField;
    Query1unidad_medida_a: TStringField;
    Query1valor_por_kg_a: TFloatField;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText3: TQRDBText;
    Query1BultosStock: TFloatField;
    Query1UnidadesStock: TFloatField;
    Query1PaletsStock: TFloatField;
    QRDBText11: TQRDBText;
    QRDBText14: TQRDBText;
    QRBand3: TQRBand;
    QRGroup1: TQRGroup;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    tCliente: TQRLabel;
    QRShape1: TQRShape;
    QRLabel5: TQRLabel;
    QRShape4: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRSysData2: TQRSysData;
    tTotBultosEnt: TQRLabel;
    tTotBultosSal: TQRLabel;
    tTotBultosStock: TQRLabel;
    tTotEstuchesSueltos: TQRLabel;
    tTotUnidadesEnt: TQRLabel;
    tTotUnidadesSal: TQRLabel;
    tTotUnidadesDes: TQRLabel;
    QRShape2: TQRShape;
    tTotUnidadesMer: TQRLabel;
    tTotUnidadesStock: TQRLabel;
    tTotPaletsEnt: TQRLabel;
    tTotPaletsSal: TQRLabel;
    tTotPaletsStock: TQRLabel;
    tFechaEntrada: TQRLabel;
    tFechaCaducidad: TQRLabel;
    tFecha: TQRLabel;
    QRBand4: TQRBand;
    QRShape3: TQRShape;
    QRLabel35: TQRLabel;
    tFechaBis: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape6: TQRShape;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRShape5: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    tArticulos: TQRLabel;
    tFamilias: TQRLabel;
    tEmpresaBis: TQRLabel;
    QRLabel42: TQRLabel;
    tLotes: TQRLabel;
    tCamaras: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    tZonas: TQRLabel;
    QRLabel49: TQRLabel;
    tCaducados: TQRLabel;
    QRLabel73: TQRLabel;
    tClienteBis: TQRLabel;
    QRLabel1: TQRLabel;
    tEmpresa: TQRLabel;
    QRLabel3: TQRLabel;
    tTipos: TQRLabel;
    tRetenido: TQRLabel;
    t1: TQRLabel;
    qrdbtxtlote_al: TQRDBText;
    strngfldQuery1lote_origen_al: TStringField;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure Query1CalcFields(DataSet: TDataSet);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);

  private

  public
        ClienteAnt: String;
        TotBultosEnt, TotBultosSal, TotBultosStock, TotEstuchesSueltos, TotPaletsEnt, TotPaletsSal, TotPaletsStock: Integer;
        TotUnidadesEnt, TotUnidadesSal, TotUnidadesDes, TotUnidadesMerma, TotUnidadesStock: Real;
  end;

var
  QRAlmacenesNormal: TQRAlmacenesNormal;

implementation

uses UGLobal;

{$R *.DFM}

procedure TQRAlmacenesNormal.QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     tArticulo.Caption:=Query1.FieldByName('Familia_al').AsString + '/' + Query1.FieldByName('Codigo_a').AsString + '-' + Query1.FieldByName('Denominacion_a').AsString;
     tFechaEntrada.Caption:=DiaMesAnyo(Query1.FieldByName('Fecha_Entrada_al').AsString);
     tFechaCaducidad.Caption:=DiaMesAnyo(Query1.FieldByName('Fecha_Caducidad_al').AsString);
     if Query1.FieldByName('status_retenido_al').AsString='S' then
     begin
        tRetenido.Caption:='R';  //RENETIDO
        tRetenido.Color := clRed
     end
     else
     begin
        tRetenido.Caption:='';
        tRetenido.Color := clWhite;
     end;

end;

procedure TQRAlmacenesNormal.Query1CalcFields(DataSet: TDataSet);
begin
     Query1.FieldByName('BultosStock').AsInteger:=Query1.FieldByName('Bultos_Entrados_al').AsInteger -
                                                  Query1.FieldByName('Bultos_Salidos_al').AsInteger;
     Query1.FieldByName('PaletsStock').AsInteger:=Query1.FieldByName('Palets_Entrados_al').AsInteger -
                                                  Query1.FieldByName('Palets_Salidos_al').AsInteger;
     Query1.FieldByName('UnidadesStock').AsFloat:=Query1.FieldByName('Unidades_Entradas_al').AsFloat -
                                                  Query1.FieldByName('Unidades_Salidas_al').AsFloat -
                                                  Query1.FieldByName('Unidades_Mermas_al').AsFloat -
                                                  Query1.FieldByName('Unidades_Destruidas_al').AsFloat;
end;

procedure TQRAlmacenesNormal.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
     ClienteAnt:='';
     TotBultosEnt:=0;
     TotBultosSal:=0;
     TotBultosStock:=0;
     TotEstuchesSueltos:=0;
     TotPaletsEnt:=0;
     TotPaletsSal:=0;
     TotPaletsStock:=0;
     TotUnidadesEnt:=0;
     TotUnidadesSal:=0;
     TotUnidadesDes:=0;
     TotUnidadesMerma:=0;
     TotUnidadesStock:=0;
end;

//------------------------------ ANTES DEL TITULO DE TODAS LAS PAGINAS ---------
procedure TQRAlmacenesNormal.QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     tCliente.Caption:=Query1.FieldByName('Cliente_al').AsString + '-' + NomCliente(Query1.FieldByName('Empresa_al').AsString, Query1.FieldByName('Cliente_al').AsString);
end;

//-------------------------- DESPUES DEL DETALLE -------------------------------
procedure TQRAlmacenesNormal.QRBand2AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
     ClienteAnt:=Query1.FieldByName('Cliente_al').AsString;
     
     TotBultosEnt:=TotBultosEnt + Query1.FieldByName('Bultos_Entrados_al').AsInteger;
     TotBultosSal:=TotBultosSal + Query1.FieldByName('Bultos_Salidos_al').AsInteger;
     TotBultosStock:=TotBultosStock + Query1.FieldByName('BultosStock').AsInteger;
     TotEstuchesSueltos:=TotEstuchesSueltos + Query1.FieldByName('Estuches_Sueltos_al').AsInteger;
     TotPaletsEnt:=TotPaletsEnt + Query1.FieldByName('Palets_Entrados_al').AsInteger;
     TotPaletsSal:=TotPaletsSal + Query1.FieldByName('Palets_Salidos_al').AsInteger;
     TotPaletsStock:=TotPaletsStock + Query1.FieldByName('PaletsStock').AsInteger;
     TotUnidadesEnt:=TotUnidadesEnt + Query1.FieldByName('Unidades_Entradas_al').AsFloat;
     TotUnidadesSal:=TotUnidadesSal + Query1.FieldByName('Unidades_Salidas_al').AsFloat;
     TotUnidadesDes:=TotUnidadesDes + Query1.FieldByName('Unidades_Destruidas_al').AsFloat;
     TotUnidadesMerma:=TotUnidadesMerma + Query1.FieldByName('Unidades_Mermas_al').AsFloat;
     TotUnidadesStock:=TotUnidadesStock + Query1.FieldByName('UnidadesStock').AsFloat;
end;

//------------------------- ANTES DEL PIE --------------------------------------
procedure TQRAlmacenesNormal.QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     tTotBultosEnt.Caption:=IntToStr(TotBultosEnt);
     tTotBultosSal.Caption:=IntToStr(TotBultosSal);
     tTotBultosStock.Caption:=IntToStr(TotBultosStock);
     tTotEstuchesSueltos.Caption:=IntToStr(TotEstuchesSueltos);
     tTotUnidadesEnt.Caption:=FormatFloat('#,##0.00',TotUnidadesEnt);
     tTotUnidadesSal.Caption:=FormatFloat('#,##0.00',TotUnidadesSal);
     tTotUnidadesDes.Caption:=FormatFloat('#,##0.00',TotUnidadesDes);
     tTotUnidadesMer.Caption:=FormatFloat('#,##0.00',TotUnidadesMerma);
     tTotUnidadesStock.Caption:=FormatFloat('#,##0.00',TotUnidadesStock);
     tTotPaletsEnt.Caption:=IntToStr(TotPaletsEnt);
     tTotPaletsSal.Caption:=IntToStr(TotPaletsSal);
     tTotPaletsStock.Caption:=IntToStr(TotPaletsStock);
end;

//------------- ANTES DE LA CABECERA DE LA PRIMERA HOJA ------------------------
procedure TQRAlmacenesNormal.QRBand4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     if Self.PageNumber=1 then  //Solo se imprime en la primera hoja
        PrintBand:=False
     else
     begin
          tClienteBis.Caption:=Query1.FieldByName('Cliente_al').AsString +
                               '-' +
                               NomCliente(Query1.FieldByName('Empresa_al').AsString,
                                          Query1.FieldByName('Cliente_al').AsString);
     end;
end;

//------------------ DESPUES DEL PIE -------------------------------------------
procedure TQRAlmacenesNormal.QRBand3AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
     TotBultosEnt:=0;
     TotBultosSal:=0;
     TotBultosStock:=0;
     TotEstuchesSueltos:=0;
     TotPaletsEnt:=0;
     TotPaletsSal:=0;
     TotUnidadesEnt:=0;
     TotUnidadesSal:=0;
     TotUnidadesDes:=0;
     TotUnidadesMerma:=0;
     TotUnidadesStock:=0;
end;

end.
