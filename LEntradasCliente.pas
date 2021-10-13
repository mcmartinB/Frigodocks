unit LEntradasCliente;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables;

type
  TQREntradasCliente = class(TQuickRep)
    Query1: TQuery;
    QRBand2: TQRBand;
    tArticulo: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand1: TQRBand;
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
    QRLabel23: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    tFechaCaducidad: TQRLabel;
    tFechaEntrada: TQRLabel;
    Query1empresa_ce: TStringField;
    Query1albaran_ce: TIntegerField;
    Query1cliente_ce: TStringField;
    Query1fecha_albaran_ce: TStringField;
    Query1importe_entrada_ce: TFloatField;
    Query1horas_entrada_ce: TFloatField;
    Query1numero_factura_ce: TIntegerField;
    Query1fecha_factura_ce: TStringField;
    Query1temperatura_ce: TSmallintField;
    Query1concepto_ce: TStringField;
    Query1tipo_entrada_ce: TStringField;
    Query1transportista_ce: TStringField;
    Query1matricula_ce: TStringField;
    Query1procedencia_ce: TStringField;
    Query1observaciones_ce: TStringField;
    Query1concepto2_ce: TStringField;
    Query1hora_ce: TStringField;
    Query1empresa_le: TStringField;
    Query1albaran_le: TIntegerField;
    Query1familia_le: TStringField;
    Query1articulo_le: TStringField;
    Query1lote_le: TStringField;
    Query1bultos_le: TIntegerField;
    Query1unidades_le: TFloatField;
    Query1camara_le: TSmallintField;
    Query1zona_le: TStringField;
    Query1manejo_le: TStringField;
    Query1palets_le: TIntegerField;
    Query1estuches_bulto_le: TSmallintField;
    Query1estuches_sueltos_le: TSmallintField;
    Query1caducidad_le: TStringField;
    QRLabel3: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    CabImporte: TQRLabel;
    CabHoras: TQRLabel;
    CabFactura: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    Importe: TQRDBText;
    QRDBText14: TQRDBText;
    tCliente: TQRLabel;
    QRLabel2: TQRLabel;
    tHoras: TQRLabel;
    tFactura: TQRLabel;
    QRLabel4: TQRLabel;
    tClientes: TQRLabel;
    QRLabel9: TQRLabel;
    tAlbaranes: TQRLabel;
    QRLabel14: TQRLabel;
    tTipos: TQRLabel;
    QRLabel1: TQRLabel;
    tEmpresa: TQRLabel;
    QRShape2: TQRShape;
    QRSysData2: TQRSysData;
    tFecha: TQRLabel;
    QRLabel16: TQRLabel;
    tFechas: TQRLabel;
    QRLabel20: TQRLabel;
    qrdbtxtlote_le: TQRDBText;
    strngfldQuery1lote_origen_le: TStringField;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  private

  public
        ClienteAnt: String;
        AgruparArticulo: Boolean;
        TotBultosStock, TotEstuchesSueltos: Integer;
        TotUnidadesStock: Real;
        TotBultosStockArt, TotEstuchesSueltosArt: Integer;
        TotUnidadesStockArt: Real;
  end;

var
  QREntradasCliente: TQREntradasCliente;

implementation

uses UGLobal;

{$R *.DFM}

procedure TQREntradasCliente.QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     tArticulo.Caption:=Query1.FieldByName('Articulo_le').AsString +
                        '-' +
                        NomArticulo(Query1.FieldByName('Empresa_ce').AsString,
                                    Query1.FieldByName('Familia_le').AsString,
                                    Query1.FieldByName('Articulo_le').AsString);
     tFechaEntrada.Caption:=DiaMesAnyo(Query1.FieldByName('Fecha_Albaran_ce').AsString);
     tFechaCaducidad.Caption:=DiaMesAnyo(Query1.FieldByName('Caducidad_le').AsString);
     if Query1.FieldByName('Horas_Entrada_ce').AsFloat<>0 then
        tHoras.Caption:=IntToStr(ParteEntera(Query1.FieldByName('Horas_Entrada_ce').AsFloat)) + ':' + ParteDecimal(Query1.FieldByName('Horas_Entrada_ce').AsFloat)
     else
         tHoras.Caption:='';

     if Query1.FieldByName('Numero_Factura_ce').AsInteger=0 then
        tFactura.Caption:='-- NO --'
     else
         tFactura.Caption:=IntToStr(Query1.FieldByName('Numero_Factura_ce').AsInteger);
end;

procedure TQREntradasCliente.QRGroup1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     tCliente.Caption:=Query1.FieldByName('Cliente_ce').AsString +
                       '-' +
                       NomCliente(Query1.FieldByName('Empresa_ce').AsString,
                                  Query1.FieldByName('Cliente_ce').AsString);
end;

end.
