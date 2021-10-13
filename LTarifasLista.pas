unit LTarifasLista;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables;

type
  TQRTarifasLista = class(TQuickRep)
    Query1: TQuery;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    tEmpresa: TQRLabel;
    QRShape4: TQRShape;
    QRBand3: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel5: TQRLabel;
    cCodigo: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
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
    Query1empresa_t: TStringField;
    Query1codigo_t: TStringField;
    Query1precio_congelacion_m3_t: TFloatField;
    Query1precio_congelacion_kg_t: TFloatField;
    Query1precio_refrigera_m3_t: TFloatField;
    Query1tipo0_t: TFloatField;
    Query1tipo1_t: TFloatField;
    Query1tipo2_t: TFloatField;
    Query1tipo3_t: TFloatField;
    Query1tipo4_t: TFloatField;
    Query1precio_hora1_t: TFloatField;
    Query1precio_hora2_t: TFloatField;
    QRShape2: TQRShape;
    QRShape7: TQRShape;
    QRLabel14: TQRLabel;
    tTarifas: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    Query1frio_palet_t: TFloatField;
    Query1manejo_palet_t: TFloatField;

  private

  public
        ClienteAnt, FamiliaAnt: String;
  end;

var
  QRTarifasLista: TQRTarifasLista;

implementation

uses UGLobal;

{$R *.DFM}

end.
