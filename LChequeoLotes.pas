unit LChequeoLotes;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables, DBClient, Dialogs;

type
  TQRChequeoLotes = class(TQuickRep)
    QRBand2: TQRBand;
    Albaran: TQRDBText;
    Fecha: TQRDBText;
    Lote: TQRDBText;
    tArticulo: TQRLabel;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    tEmpresa: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel17: TQRLabel;
    tCliente: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
  private
         ClienteAnt: String;
  public

  end;

var
  QRChequeoLotes: TQRChequeoLotes;

implementation

uses UGLobal, MBaseDatos;

{$R *.DFM}

procedure TQRChequeoLotes.QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     tEmpresa.Caption:=NomEmpresa(Self.DataSet.FieldByName('Empresa').AsString);
     tCliente.Caption:=Self.DataSet.FieldByName('Cliente').AsString +
                       '-' +
                       NomCliente(Self.DataSet.FieldByName('Empresa').AsString, Self.DataSet.FieldByName('Cliente').AsString);
end;

//-------------------- ANTES DE IMPRIMIR EL DETALLE ----------------------------
procedure TQRChequeoLotes.QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     tArticulo.Caption:=Self.DataSet.FieldByName('Familia').AsString +
                        '/' +
                        Self.DataSet.FieldByName('Articulo').AsString +
                        '-' +
                        Self.DataSet.FieldByName('NomArticulo').AsString;
     if ClienteAnt<>Self.DataSet.FieldByName('Cliente').AsString then
        Self.NewPage;
end;

procedure TQRChequeoLotes.QRBand2AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
     ClienteAnt:=Self.DataSet.FieldByName('Cliente').AsString;
end;

procedure TQRChequeoLotes.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
     ClienteAnt:='';
end;

end.
