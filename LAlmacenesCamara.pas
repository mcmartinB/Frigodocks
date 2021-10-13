unit LAlmacenesCamara;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables;

type
  TQRAlmacenesCamara = class(TQuickRep)
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
    QRDBText5: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText3: TQRDBText;
    Query1BultosStock: TFloatField;
    Query1UnidadesStock: TFloatField;
    Query1PaletsStock: TFloatField;
    QRDBText11: TQRDBText;
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
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRSysData2: TQRSysData;
    tTotBultosStock: TQRLabel;
    tTotEstuchesSueltos: TQRLabel;
    QRShape2: TQRShape;
    tTotUnidadesStock: TQRLabel;
    QRGroup2: TQRGroup;
    QRBand4: TQRBand;
    tTotBultosStockArt: TQRLabel;
    tTotEstuchesSueltosArt: TQRLabel;
    tTotUnidadesStockArt: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape3: TQRShape;
    tFecha: TQRLabel;
    QRShape5: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    tArticulos: TQRLabel;
    tFamilias: TQRLabel;
    tEmpresa: TQRLabel;
    QRLabel42: TQRLabel;
    tLotes: TQRLabel;
    tCamaras: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    tZonas: TQRLabel;
    QRLabel49: TQRLabel;
    tCaducados: TQRLabel;
    QRLabel1: TQRLabel;
    tTipos: TQRLabel;
    tTotLoteArt: TQRLabel;
    tTotCamaraArt: TQRLabel;
    tTotZonaArt: TQRLabel;
    tTotLote: TQRLabel;
    tTotCamara: TQRLabel;
    tTotZona: TQRLabel;
    QRLabel3: TQRLabel;
    tRetenido: TQRLabel;
    strngfldQuery1lote_origen_al: TStringField;
    t1: TQRLabel;
    qrdbtxtlote_al: TQRDBText;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure Query1CalcFields(DataSet: TDataSet);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickRepAfterPrint(Sender: TObject);

  private

  public
        ClienteAnt: String;
        AgruparArticulo: Boolean;
        TotBultosStock, TotEstuchesSueltos: Integer;
        TotUnidadesStock: Real;
        TotBultosStockArt, TotEstuchesSueltosArt: Integer;
        TotUnidadesStockArt: Real;
        TotLotesArt, TotCamarasArt, TotZonasArt: integer;
        slLotesArt, slCamarasArt, slZonasArt: TStringList;
        TotLotes, TotCamaras, TotZonas: integer;
        slLotes, slCamaras, slZonas: TStringList;
  end;


implementation

uses UGLobal;

{$R *.DFM}

procedure TQRAlmacenesCamara.QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
    tArticulo.Caption:=Query1.FieldByName('Codigo_a').AsString + '-' + Query1.FieldByName('Denominacion_a').AsString;

    if Query1.FieldByName('status_retenido_al').AsString='S' then
    begin
      tRetenido.Caption:='R';  //RENETIDO
      tRetenido.Color := clRed;
    end
    else
    begin
      tRetenido.Caption:='';
      tRetenido.Color := clWhite;
    end;

end;

procedure TQRAlmacenesCamara.Query1CalcFields(DataSet: TDataSet);
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

procedure TQRAlmacenesCamara.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
     ClienteAnt:='';
     TotBultosStock:=0;
     TotEstuchesSueltos:=0;
     TotUnidadesStock:=0;

     TotLotesArt:= 0;
     TotCamarasArt:= 0;
     TotZonasArt:= 0;

     slLotesArt:= TStringList.Create;
     slCamarasArt:= TStringList.Create;
     slZonasArt:= TStringList.Create;

     TotLotes:= 0;
     TotCamaras:= 0;
     TotZonas:= 0;

     slLotes:= TStringList.Create;
     slCamaras:= TStringList.Create;
     slZonas:= TStringList.Create;
end;

procedure TQRAlmacenesCamara.QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     if ClienteAnt<>Query1.FieldByName('Cliente_al').AsString then
     begin
          tCliente.Caption:=Query1.FieldByName('Cliente_al').AsString +
                            '-' +
                            NomCliente(Query1.FieldByName('Empresa_al').AsString,
                                       Query1.FieldByName('Cliente_al').AsString);
          ClienteAnt:=Query1.FieldByName('Cliente_al').AsString;
          TotBultosStock:=0;
          TotEstuchesSueltos:=0;
          TotUnidadesStock:=0;

          TotLotes:= 0;
          TotCamaras:= 0;
          TotZonas:= 0;

          slLotes.Clear;
          slCamaras.Clear;
          slZonas.Clear;
     end;
end;

procedure TQRAlmacenesCamara.QRBand2AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
var
  iPos: integer;
begin
     TotBultosStockArt:=TotBultosStockArt + Query1.FieldByName('BultosStock').AsInteger;
     TotEstuchesSueltosArt:=TotEstuchesSueltosArt + Query1.FieldByName('Estuches_Sueltos_al').AsInteger;
     TotUnidadesStockArt:=TotUnidadesStockArt + Query1.FieldByName('UnidadesStock').AsFloat;

     if slLotesArt.IndexOf( Query1.FieldByName('lote_al').AsString ) < 0 then
     begin
       slLotesArt.Add( Query1.FieldByName('lote_al').AsString );
       TotLotesArt:= TotLotesArt + 1;
     end;
     if slCamarasArt.IndexOf( Query1.FieldByName('numero_camara_al').AsString ) < 0 then
     begin
       slCamarasArt.Add( Query1.FieldByName('numero_camara_al').AsString );
       TotCamarasArt:= TotCamarasArt + 1;
     end;
     if slZonasArt.IndexOf( Query1.FieldByName('zona_al').AsString ) < 0 then
     begin
       slZonasArt.Add( Query1.FieldByName('zona_al').AsString );
       TotZonasArt:= TotZonasArt + 1;
     end;


     TotBultosStock:=TotBultosStock + Query1.FieldByName('BultosStock').AsInteger;
     TotEstuchesSueltos:=TotEstuchesSueltos + Query1.FieldByName('Estuches_Sueltos_al').AsInteger;
     TotUnidadesStock:=TotUnidadesStock + Query1.FieldByName('UnidadesStock').AsFloat;

     if slLotes.IndexOf( Query1.FieldByName('lote_al').AsString ) < 0 then
     begin
       slLotes.Add( Query1.FieldByName('lote_al').AsString );
       TotLotes:= TotLotes + 1;
     end;
     if slCamaras.IndexOf( Query1.FieldByName('numero_camara_al').AsString ) < 0 then
     begin
       slCamaras.Add( Query1.FieldByName('numero_camara_al').AsString );
       TotCamaras:= TotCamaras + 1;
     end;
     if slZonas.IndexOf( Query1.FieldByName('zona_al').AsString ) < 0 then
     begin
       slZonas.Add( Query1.FieldByName('zona_al').AsString );
       TotZonas:= TotZonas + 1;
     end;
end;

procedure TQRAlmacenesCamara.QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     tTotBultosStock.Caption:=IntToStr(TotBultosStock);
     tTotEstuchesSueltos.Caption:=IntToStr(TotEstuchesSueltos);
     tTotUnidadesStock.Caption:=FormatFloat('#,##0.00',TotUnidadesStock);

     tTotLote.Caption:=IntToStr(TotLotes);
     tTotCamara.Caption:=IntToStr(TotCamaras);
     tTotZona.Caption:=IntToStr(TotZonas);
end;

procedure TQRAlmacenesCamara.QRBand4AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
     TotBultosStockArt:=0;
     TotEstuchesSueltosArt:=0;
     TotUnidadesStockArt:=0;

     TotLotesArt:= 0;
     TotCamarasArt:= 0;
     TotZonasArt:= 0;

     slLotesArt.Clear;
     slCamarasArt.Clear;
     slZonasArt.Clear;
end;

procedure TQRAlmacenesCamara.QRBand4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     PrintBand:=AgruparArticulo;
     if AgruparArticulo then
     begin
          tTotBultosStockArt.Caption:=IntToStr(TotBultosStockArt);
          tTotEstuchesSueltosArt.Caption:=IntToStr(TotEstuchesSueltosArt);
          tTotUnidadesStockArt.Caption:=FormatFloat('#,##0.00',TotUnidadesStockArt);

          tTotLoteArt.Caption:=IntToStr(TotLotesArt);
          tTotCamaraArt.Caption:=IntToStr(TotCamarasArt);
          tTotZonaArt.Caption:=IntToStr(TotZonasArt);
     end;
end;

procedure TQRAlmacenesCamara.QRGroup2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     PrintBand:=AgruparArticulo;
end;

procedure TQRAlmacenesCamara.QuickRepAfterPrint(Sender: TObject);
begin
  FreeAndNil( slLotes );
  FreeAndNil( slCamaras );
  FreeAndNil( slZonas );

  FreeAndNil( slLotesArt );
  FreeAndNil( slCamarasArt );
  FreeAndNil( slZonas );
end;

end.
