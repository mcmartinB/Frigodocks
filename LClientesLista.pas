unit LClientesLista;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables;

type
  TQRClientesLista = class(TQuickRep)
    Query1: TQuery;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRBand2: TQRBand;
    QRShape4: TQRShape;
    QRBand3: TQRBand;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRShape7: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel55: TQRLabel;
    tClientes: TQRLabel;
    tEmpresa: TQRLabel;
    QRLabel54: TQRLabel;
    tMercancia: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;

  private

  public
        ClienteAnt, FamiliaAnt: String;
  end;

var
  QRClientesLista: TQRClientesLista;

implementation

uses UGLobal;

{$R *.DFM}

end.
