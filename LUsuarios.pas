unit LUsuarios;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables;

type
  TQRUsuarios = class(TQuickRep)
    Query1: TQuery;
    QRBand1: TQRBand;
    QRLabel21: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRShape4: TQRShape;
    QRBand3: TQRBand;
    QRSysData2: TQRSysData;
    QTiposUsuario: TQuery;
    tTipo: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  private

  public

  end;

var
  QRUsuarios: TQRUsuarios;

implementation

uses UGLobal;

{$R *.DFM}


procedure TQRUsuarios.QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     tTipo.Caption:=Query1.FieldByName('tipo_u').AsString + '-' + NomTipoUsuario(Query1.FieldByName('tipo_u').AsString);
end;

end.
