unit LSalidasFecha;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables;

type
  TQRSalidasFecha = class(TQuickRep)
    Query1: TQuery;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRLabel5: TQRLabel;
    QRShape4: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel27: TQRLabel;
    QRSysData2: TQRSysData;
    tFecha: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel8: TQRLabel;
    CabImporte: TQRLabel;
    CabHoras: TQRLabel;
    CabFactura: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    tEmpresa: TQRLabel;
    tClientes: TQRLabel;
    tAlbaranes: TQRLabel;
    tTiposLote: TQRLabel;
    tTiposSalida: TQRLabel;
    QRLabel15: TQRLabel;
    tFechas: TQRLabel;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRBand2: TQRBand;
    tArticulo: TQRLabel;
    tFechaSalida: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    Importe: TQRDBText;
    tHoras: TQRLabel;
    tFactura: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    Query1empresa_cs: TStringField;
    Query1albaran_cs: TIntegerField;
    Query1cliente_cs: TStringField;
    Query1tipo_salida_cs: TStringField;
    Query1fecha_albaran_cs: TStringField;
    Query1importe_salida_cs: TFloatField;
    Query1horas_salida_cs: TFloatField;
    Query1numero_factura_cs: TIntegerField;
    Query1fecha_factura_cs: TStringField;
    Query1orden_numero_cs: TStringField;
    Query1concepto_cs: TStringField;
    Query1matricula_cs: TStringField;
    Query1observaciones_cs: TStringField;
    Query1retira_cs: TStringField;
    Query1nif_retira_cs: TStringField;
    Query1hora_cs: TStringField;
    Query1empresa_ls: TStringField;
    Query1albaran_ls: TIntegerField;
    Query1familia_ls: TStringField;
    Query1articulo_ls: TStringField;
    Query1lote_ls: TStringField;
    Query1bultos_ls: TIntegerField;
    Query1unidades_ls: TFloatField;
    Query1estuches_sueltos_ls: TSmallintField;
    Query1tipo_lote_ls: TStringField;
    Query1palets_ls: TIntegerField;
    QRBand3: TQRBand;
    qrlbl1: TQRLabel;
    qrdbtxtlote_ls: TQRDBText;
    strngfldQuery1lote_origen_ls: TStringField;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);

  private

  public
        AlbaranAnt, ClienteAnt: String;
        AgruparArticulo: Boolean;
        TotBultosStock, TotEstuchesSueltos: Integer;
        TotUnidadesStock: Real;
        TotBultosStockArt, TotEstuchesSueltosArt: Integer;
        TotUnidadesStockArt: Real;
  end;

var
  QRSalidasFecha: TQRSalidasFecha;

implementation

uses UGLobal;

{$R *.DFM}

procedure TQRSalidasFecha.QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     if (AlbaranAnt<>'') and (AlbaranAnt=Query1.FieldByName('Albaran_cs').AsString) then
     begin
          tFechaSalida.Enabled:=False;
          QRDBText1.Enabled:=False;
          QRDBText9.Enabled:=False;
          QRDBText3.Enabled:=False;
          QRDBText8.Enabled:=False;
     end
     else
     begin
          tFechaSalida.Enabled:=True;
          QRDBText1.Enabled:=True;
          QRDBText9.Enabled:=True;
          QRDBText3.Enabled:=True;
          QRDBText8.Enabled:=True;
     end;
     AlbaranAnt:=Query1.FieldByName('Albaran_cs').AsString;

     tArticulo.Caption:=Query1.FieldByName('Familia_ls').AsString +
                        '/' +
                        Query1.FieldByName('Articulo_ls').AsString +
                        '-' +
                        NomArticulo(Query1.FieldByName('Empresa_cs').AsString,
                                    Query1.FieldByName('Familia_ls').AsString,
                                    Query1.FieldByName('Articulo_ls').AsString);
     tFechaSalida.Caption:=DiaMesAnyo(Query1.FieldByName('Fecha_Albaran_cs').AsString);
     if Query1.FieldByName('Horas_Salida_cs').AsFloat<>0 then
        tHoras.Caption:=IntToStr(ParteEntera(Query1.FieldByName('Horas_Salida_cs').AsFloat)) + ':' + ParteDecimal(Query1.FieldByName('Horas_Salida_cs').AsFloat)
     else
         tHoras.Caption:='';

     if Query1.FieldByName('Numero_Factura_cs').AsInteger=0 then
        tFactura.Caption:='-- NO --'
     else
         tFactura.Caption:=IntToStr(Query1.FieldByName('Numero_Factura_cs').AsInteger);
end;

procedure TQRSalidasFecha.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
     AlbaranAnt:='';
end;

end.
