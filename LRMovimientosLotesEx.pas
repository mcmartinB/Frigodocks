unit LRMovimientosLotesEx;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables, DBClient;

type
  TQRMovimientosLotesEx = class(TQuickRep)
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    tEmpresa: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    cdsMvtoLotes: TClientDataSet;
    QRLabel1: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    cdsMvtoLotesFecha: TStringField;
    cdsMvtoLotesBultosEnt: TIntegerField;
    cdsMvtoLotesUnidadesEnt: TFloatField;
    cdsMvtoLotesBultosSal: TIntegerField;
    cdsMvtoLotesUnidadesSal: TFloatField;
    cdsMvtoLotesAlbaran: TStringField;
    QRGroup1: TQRGroup;
    QRBand4: TQRBand;
    cdsMvtoLotesCliente: TStringField;
    QRShape4: TQRShape;
    cdsMvtoLotesEmpresa: TStringField;
    cdsMvtoLoteslote: TStringField;
    cdsMvtoLotesfecha_out: TStringField;
    cdsMvtoLotesdias: TIntegerField;
    cdsMvtoLotesmovimientos: TIntegerField;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    SummaryBand1: TQRBand;
    QRDBText7: TQRDBText;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRShape2: TQRShape;
    QRExpr5: TQRExpr;
    QRLabel12: TQRLabel;
    t1: TQRLabel;
    qrdbtxtlote: TQRDBText;
    strngfldMvtoLoteslote_origen: TStringField;
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);

  private
    sCli: string;
    n_lotes: Integer;
  public

  end;

var
  QRMovimientosLotesEx: TQRMovimientosLotesEx;

implementation

uses UGLobal;

{$R *.DFM}

procedure TQRMovimientosLotesEx.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRGroup1.Height:= 0;
end;

procedure TQRMovimientosLotesEx.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
 n_lotes := 0;
end;

procedure TQRMovimientosLotesEx.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inc(n_lotes);
end;

procedure TQRMovimientosLotesEx.QRBand4AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  n_lotes := 0;
end;

procedure TQRMovimientosLotesEx.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel12.Caption := IntToStr(n_lotes);
end;

procedure TQRMovimientosLotesEx.QRDBText6Print(sender: TObject;
  var Value: String);
var
  sAux: string;
begin
  sAux := cdsMvtoLotes.FieldByName('Empresa').AsString + Value;
  if sCli <> sAux then
  begin
    Value:= Value + ' - ' + NomCliente( cdsMvtoLotes.FieldByName('Empresa').AsString, Value );
    sCli:=  sAux;
  end
  else
  begin
    Value:= '';
  end;
end;

procedure TQRMovimientosLotesEx.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  sCli:= '';
end;

procedure TQRMovimientosLotesEx.QRDBText7Print(sender: TObject;
  var Value: String);
begin
  Value:= ' TOTAL ' + NomCliente( cdsMvtoLotes.FieldByName('Empresa').AsString, Value );
end;

end.
