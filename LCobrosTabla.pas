unit LCobrosTabla;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables;

type
  TQRCobrosTabla = class(TQuickRep)
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
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    tClientes: TQRLabel;
    QRBand2: TQRBand;
    QRDBText3: TQRDBText;
    QRBand3: TQRBand;
    Query1: TQuery;
    tCliente: TQRLabel;
    QRLabel16: TQRLabel;
    tFacturas: TQRLabel;
    QRLabel18: TQRLabel;
    tFechaFacturas: TQRLabel;
    tTipoDoc: TQRLabel;
    tFechaFactura: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    tFechaPago: TQRLabel;
    Query1empresa_co: TStringField;
    Query1cliente_co: TStringField;
    Query1factura_co: TIntegerField;
    Query1fecha_factura_co: TStringField;
    Query1fecha_pago_co: TStringField;
    Query1tipo_cobro_co: TStringField;
    Query1importe_co: TFloatField;
    Query1serial_co: TIntegerField;
    QRLabel7: TQRLabel;
    tFechaPagos: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);

  private

  public

  end;

var
  QRCobrosTabla: TQRCobrosTabla;

implementation

uses UGLobal;

{$R *.DFM}

procedure TQRCobrosTabla.QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     tCliente.Caption:=Query1.FieldByName('Cliente_co').AsString +  '-' +
                       NomCliente(Query1.FieldByName('Empresa_co').AsString,
                                  Query1.FieldByName('Cliente_co').AsString);

     tTipoDoc.Caption:=NomTipoCobro(Query1.FieldByName('Tipo_Cobro_co').AsString);

     tFechaFactura.Caption:=DiaMesAnyo(Query1.FieldByName('Fecha_Factura_co').AsString);
     tFechaPago.Caption:=DiaMesAnyo(Query1.FieldByName('Fecha_Pago_co').AsString);
end;

end.
