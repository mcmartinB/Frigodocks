unit LFamilias;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables;

type
  TQRFamilias = class(TQuickRep)
    Query1: TQuery;
    QRBand1: TQRBand;
    QRLabel21: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    tEmpresa: TQRLabel;
    QRShape4: TQRShape;
    QRBand3: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    tFamilias: TQRLabel;
    QRShape7: TQRShape;

  private

  public

  end;

var
  QRFamilias: TQRFamilias;

implementation

uses UGLobal;

{$R *.DFM}


end.
