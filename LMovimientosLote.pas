unit LMovimientosLote;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables, DBClient;

type
  TQRMovimientosLote = class(TQuickRep)
    QRBand1: TQRBand;
    QRShape7: TQRShape;
    QRShape1: TQRShape;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    tEmpresa: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel14: TQRLabel;
    tCliente: TQRLabel;
    QRBand2: TQRBand;
    QRLabel18: TQRLabel;
    tLote: TQRLabel;
    ClientDataSet1: TClientDataSet;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    ClientDataSet1Fecha: TStringField;
    ClientDataSet1BultosEnt: TIntegerField;
    ClientDataSet1EstXBulto: TIntegerField;
    ClientDataSet1EstuchesSueltosEnt: TIntegerField;
    ClientDataSet1UnidadesEnt: TFloatField;
    ClientDataSet1BultosSal: TIntegerField;
    ClientDataSet1EstuchesSueltosSal: TIntegerField;
    ClientDataSet1UnidadesSal: TFloatField;
    QRShape5: TQRShape;
    ClientDataSet1Albaran: TStringField;
    QRGroup1: TQRGroup;
    QRBand4: TQRBand;
    QRLabel16: TQRLabel;
    tTotalBultos: TQRLabel;
    tTotalEstuches: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    tTotalUnidades: TQRLabel;
    ClientDataSet1Cliente: TStringField;
    QRShape4: TQRShape;
    tTotalBultosSal: TQRLabel;
    tTotalEstuchesSueltosSal: TQRLabel;
    tTotalUnidadesSal: TQRLabel;
    QRLabel10: TQRLabel;
    tArticulo: TQRLabel;
    ClientDataSet1Familia: TStringField;
    ClientDataSet1Articulo: TStringField;
    QRLabel13: TQRLabel;
    tEstBulto: TQRLabel;
    tEstSueltos: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape6: TQRShape;
    QRLabel15: TQRLabel;
    strngfldClientDataSet1LoteOrigen: TStringField;
    qrl1: TQRLabel;
    qrdbtxtBultosEnt: TQRDBText;

  private

  public

  end;

var
  QRMovimientosLote: TQRMovimientosLote;

implementation

uses UGLobal;

{$R *.DFM}

end.
