unit LClientesFicha;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables;

type
  TQRClientesFicha = class(TQuickRep)
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    tEmpresa: TQRLabel;
    QRShape4: TQRShape;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    tCliente: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape6: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel29: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText24: TQRDBText;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRShape8: TQRShape;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRDBText43: TQRDBText;
    QRLabel53: TQRLabel;
    tProvincia: TQRLabel;
    tProvinciaCorreo: TQRLabel;
    Query1: TQuery;
    Query1empresa_c: TStringField;
    Query1codigo_c: TStringField;
    Query1nombre_juridico_c: TStringField;
    Query1nombre_comercial_c: TStringField;
    Query1domicilio_c: TStringField;
    Query1cp_c: TStringField;
    Query1poblacion_c: TStringField;
    Query1domicilio_correo_c: TStringField;
    Query1cp_correo_c: TStringField;
    Query1poblacion_correo_c: TStringField;
    Query1telefono1_c: TStringField;
    Query1telefono2_c: TStringField;
    Query1fax_c: TStringField;
    Query1cif_dni_c: TStringField;
    Query1origen_c: TStringField;
    Query1imp_alquiler_oficina_c: TFloatField;
    Query1imp_thermoking_c: TFloatField;
    Query1precio_kw_thermo_c: TFloatField;
    Query1imp_cargo_fijo_c: TFloatField;
    Query1precio_horas_ent_sal_c: TFloatField;
    Query1imp_minimo_facturacion_c: TFloatField;
    Query1periodo_factura_c: TStringField;
    Query1tarifa_c: TStringField;
    Query1dias_pago_c: TSmallintField;
    Query1forma_pago_c: TStringField;
    Query1cuenta_cliente_c: TStringField;
    Query1nombre_banco_c: TStringField;
    Query1domicilio_banco_c: TStringField;
    Query1cp_banco_c: TStringField;
    Query1poblacion_banco_c: TStringField;
    Query1ultimo_stock_c: TFloatField;
    Query1numerador_lotes_c: TIntegerField;
    Query1nom_autorizado1_c: TStringField;
    Query1cif_autorizado1_c: TStringField;
    Query1nom_autorizado2_c: TStringField;
    Query1cif_autorizado2_c: TStringField;
    Query1comentario_c: TStringField;
    Query1imp_valor_stock_c: TFloatField;
    Query1imp_pendiente_pago_c: TFloatField;
    Query1mercancia_retenida_c: TStringField;
    Query1tlfmovil_c: TStringField;
    Query1email_c: TStringField;
    Query1web_c: TStringField;
    Query1precio_hor_clima_c: TFloatField;
    Query1cuenta_contable_c: TStringField;
    Query1codigo_pago_c: TStringField;
    Query1m3_facturacion_c: TIntegerField;
    Query1m3_refrigeracion_c: TIntegerField;
    Query1fecha_autorizado1_c: TStringField;
    Query1fecha_autorizado2_c: TStringField;
    tMercanciaRetenida: TQRLabel;
    tOrigen: TQRLabel;
    QRLabel54: TQRLabel;
    tMercancia: TQRLabel;
    QRLabel55: TQRLabel;
    tClientes: TQRLabel;
    QRShape7: TQRShape;
    QRShape5: TQRShape;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  private

  public
        ClienteAnt, FamiliaAnt: String;
  end;

var
  QRClientesFicha: TQRClientesFicha;

implementation

uses UGLobal;

{$R *.DFM}

procedure TQRClientesFicha.QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     tCliente.Caption:=Query1.FieldByName('Codigo_c').AsString + '-' + Query1.FieldByName('Nombre_Juridico_c').AsString;
end;

procedure TQRClientesFicha.QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     tProvincia.Caption:=Provincia(Query1.FieldByName('Origen_c').AsString, Query1.FieldByName('Cp_c').AsString);
     tProvinciaCorreo.Caption:=Provincia(Query1.FieldByName('Origen_c').AsString, Query1.FieldByName('Cp_Correo_c').AsString);
     if Query1.FieldByName('Mercancia_Retenida_c').AsString='S' then
        tMercanciaRetenida.Caption:='SI'
     else
         tMercanciaRetenida.Caption:='NO';
     tOrigen.Caption:=NomOrigen(Query1.FieldByName('Origen_c').AsString);
end;

end.
