unit LKilosCliente;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables, DBClient;

type
  TQRKilosPorCliente = class(TQuickRep)
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
    QRLabel14: TQRLabel;
    tClientes: TQRLabel;
    QRBand2: TQRBand;
    tCliente: TQRLabel;
    QRLabel18: TQRLabel;
    tFechas: TQRLabel;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Nombre: TStringField;
    ClientDataSet1Codigo: TStringField;
    ClientDataSet1Entradas: TFloatField;
    ClientDataSet1Salidas: TFloatField;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);

  private

  public

  end;

var
  QRKilosPorCliente: TQRKilosPorCliente;

implementation

uses UGLobal;

{$R *.DFM}

procedure TQRKilosPorCliente.QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     tCliente.Caption:=ClientDataSet1.FieldByName('Codigo').AsString +  '-' +
                       ClientDataSet1.FieldByName('Nombre').AsString;
end;

end.
