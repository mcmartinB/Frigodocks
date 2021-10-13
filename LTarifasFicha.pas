unit LTarifasFicha;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables;

type
  TQRTarifasFicha = class(TQuickRep)
    Query1: TQuery;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRShape4: TQRShape;
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
    QRLabel5: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape7: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel14: TQRLabel;
    tEmpresa: TQRLabel;
    tTarifas: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel15: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText12: TQRDBText;
    Query1frio_palet_t: TFloatField;
    Query1manejo_palet_t: TFloatField;
    QRGroup1: TQRGroup;
    QRLabel1: TQRLabel;
    cCodigo: TQRDBText;
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);

  private

  public
        ClienteAnt, FamiliaAnt: String;
  end;

var
  QRTarifasFicha: TQRTarifasFicha;

implementation

uses UGLobal;

{$R *.DFM}

procedure TQRTarifasFicha.QRBand2AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
     //Self.NewPage;
end;

end.
