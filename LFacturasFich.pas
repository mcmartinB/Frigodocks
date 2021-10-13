unit LFacturasFich;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables;

type
  TQRFacturasTabla = class(TQuickRep)
    QRBand1: TQRBand;
    QRShape7: TQRShape;
    QRShape1: TQRShape;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    tEmpresa: TQRLabel;
    QRShape4: TQRShape;
    QRLabel2: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    tClientes: TQRLabel;
    QRLabel16: TQRLabel;
    tFacturas: TQRLabel;
    QRLabel17: TQRLabel;
    tTipoFacturas: TQRLabel;
    QRLabel18: TQRLabel;
    tFechaFacturas: TQRLabel;
    QRLabel1: TQRLabel;
    QRBand2: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    tCliente: TQRLabel;
    tContabilizada: TQRLabel;
    tFecha: TQRLabel;
    tVencimiento: TQRLabel;
    QRDBText1: TQRDBText;
    QRBand3: TQRBand;
    Query1: TQuery;
    Query1empresa_cf: TStringField;
    Query1cliente_cf: TStringField;
    Query1numero_factura_cf: TIntegerField;
    Query1fecha_factura_cf: TStringField;
    Query1fecha_vencimiento_cf: TStringField;
    Query1fecha_desde_cf: TStringField;
    Query1fecha_hasta_cf: TStringField;
    Query1importe_bruto_cf: TFloatField;
    Query1porcentaje_iva_cf: TFloatField;
    Query1importe_iva_cf: TFloatField;
    Query1importe_neto_cf: TFloatField;
    Query1tipo_cf: TStringField;
    Query1num_contabilizacion_cf: TIntegerField;
    Query1ultimo_stock_cf: TFloatField;
    Query1fecha_contabilizacion_cf: TStringField;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  private

  public

  end;

var
  QRFacturasTabla: TQRFacturasTabla;

implementation

uses UGLobal;

{$R *.DFM}


procedure TQRFacturasTabla.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     tCliente.Caption:=Query1.FieldByName('Cliente_cf').AsString +  '-' +
                       NomCliente(Query1.FieldByName('Empresa_cf').AsString,
                                  Query1.FieldByName('Cliente_cf').AsString);

     if (Query1.FieldByName('Num_Contabilizacion_cf').AsInteger<>0) and (Query1.FieldByName('Fecha_Contabilizacion_cf').AsString<>'') then
        tContabilizada.Caption:='SI'
     else
         tContabilizada.Caption:='NO';

     tFecha.Caption:=DiaMesAnyo(Query1.FieldByName('Fecha_Factura_cf').AsString);
     tVencimiento.Caption:=DiaMesAnyo(Query1.FieldByName('Fecha_Vencimiento_cf').AsString);
end;

end.
