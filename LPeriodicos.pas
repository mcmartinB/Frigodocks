unit LPeriodicos;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables;

type
  TQRPeriodicos = class(TQuickRep)
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
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    tClientes: TQRLabel;
    QRBand2: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRBand3: TQRBand;
    Query1: TQuery;
    Query1empresa_pf: TStringField;
    Query1cliente_pf: TStringField;
    Query1tarifa_pf: TStringField;
    Query1horas1_pf: TFloatField;
    Query1horas2_pf: TFloatField;
    Query1importe_thermoking_pf: TFloatField;
    Query1kw_thermoking_pf: TIntegerField;
    Query1importe_oficina_pf: TFloatField;
    Query1gastos_administra_pf: TFloatField;
    Query1otros_servicios_pf: TFloatField;
    Query1status_factura_pf: TStringField;
    Query1texto1_pf: TStringField;
    Query1texto2_pf: TStringField;
    Query1concepto2a_pf: TStringField;
    Query1concepto2b_pf: TStringField;
    Query1importe_concepto2_pf: TFloatField;
    Query1concepto3a_pf: TStringField;
    Query1concepto3b_pf: TStringField;
    Query1importe_concepto3_pf: TFloatField;
    Query1horas_clima_pf: TFloatField;
    QRLabel1: TQRLabel;
    QRLabel15: TQRLabel;
    tCliente: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    tFacturado: TQRLabel;
    tHoras1: TQRLabel;
    tHoras2: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText8: TQRDBText;
    Query1concepto4a_pf: TStringField;
    Query1concepto4b_pf: TStringField;
    Query1importe_concepto4_pf: TCurrencyField;
    Query1concepto5a_pf: TStringField;
    Query1concepto5b_pf: TStringField;
    Query1importe_concepto5_pf: TCurrencyField;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);

  private

  public

  end;

var
  QRPeriodicos: TQRPeriodicos;

implementation

uses UGLobal;

{$R *.DFM}

procedure TQRPeriodicos.QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     tCliente.Caption:=Query1.FieldByName('Cliente_pf').AsString +  '-' +
                       NomCliente(Query1.FieldByName('Empresa_pf').AsString,
                                  Query1.FieldByName('Cliente_pf').AsString);
     if Query1.FieldByName('Status_factura_pf').AsString='S' then
        tFacturado.Caption:='SI'
     else
         tFacturado.Caption:='NO';
     if Query1.FieldByName('Horas1_pf').AsFloat<>0 then
        tHoras1.Caption:=IntToStr(ParteEntera(Query1.FieldByName('Horas1_pf').AsFloat)) + ':' + RellenarCeros(ParteDecimal(Query1.FieldByName('Horas1_pf').AsFloat),2,'I')
     else
         tHoras1.Caption:='';
     if Query1.FieldByName('Horas2_pf').AsFloat<>0 then
        tHoras2.Caption:=IntToStr(ParteEntera(Query1.FieldByName('Horas2_pf').AsFloat)) + ':' + RellenarCeros(ParteDecimal(Query1.FieldByName('Horas2_pf').AsFloat),2,'I')
     else
         tHoras2.Caption:='';
end;

end.
