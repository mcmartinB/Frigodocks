unit LArticulosCliente;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables;

type
  TQRArticulosCliente = class(TQuickRep)
    Query1: TQuery;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    tEmpresa: TQRLabel;
    QRShape4: TQRShape;
    QRBand3: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    tCliente: TQRLabel;
    tArticulo: TQRLabel;
    QArticulos: TQuery;
    QRLabel6: TQRLabel;
    tFamilia: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape7: TQRShape;
    QRShape2: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    tClientes: TQRLabel;
    tFamilias: TQRLabel;
    tArticulosss: TQRLabel;
    tArticulos: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);

  private

  public
        ClienteAnt, FamiliaAnt: String;
  end;

var
  QRArticulosCliente: TQRArticulosCliente;

implementation

uses UGLobal;

{$R *.DFM}

procedure TQRArticulosCliente.QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     //Buscamos el nombre del articulo
     QArticulos.Close;
     QArticulos.ParamByName('Familia').AsString:=Query1.FieldByName('Familia_ac').AsString;
     QArticulos.ParamByName('Articulo').AsString:=Query1.FieldByName('Articulo_ac').AsString;
     QArticulos.Open;
     tArticulo.Caption:=Query1.FieldByName('Articulo_ac').AsString + '-' + QArticulos.FieldByName('Denominacion_a').AsString;
     QArticulos.Close;

     //Si cambia la familia hacemos un salto de pagina
     if FamiliaAnt<>Query1.FieldByName('Familia_ac').AsString then
        Self.NewPage;
end;

procedure TQRArticulosCliente.QRBand1BeforePrint(Sender: TQRCustomBand;var PrintBand: Boolean);
begin
     //Si cambia el cliente busco su nombre
     if ClienteAnt<>Query1.FieldByName('Cliente_ac').AsString then
        tCliente.Caption:=Query1.FieldByName('Cliente_ac').AsString +
                          '-' +
                          NomCliente(Query1.FieldByName('Empresa_ac').AsString, Query1.FieldByName('Cliente_ac').AsString);
     //Si cambia la familia busco su nombre
     if FamiliaAnt<>Query1.FieldByName('Familia_ac').AsString then
        tFamilia.Caption:=Query1.FieldByName('Familia_ac').AsString +
                          '-' +
                          NomFamilia(Query1.FieldByName('Empresa_ac').AsString,Query1.FieldByName('Familia_ac').AsString);
end;

procedure TQRArticulosCliente.QRBand1AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
     //Despues de imprimir me guardo el cliente y la familia
     ClienteAnt:=Query1.FieldByName('Cliente_ac').AsString;
     FamiliaAnt:=Query1.FieldByName('Familia_ac').AsString;
end;

end.
