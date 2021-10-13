unit LMovimientosCliente;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables, DBClient;

type
  TQRMovimientosCliente = class(TQuickRep)
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
    tClientes: TQRLabel;
    QRBand2: TQRBand;
    ClientDataSet1: TClientDataSet;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRDBText3: TQRDBText;
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
    ClientDataSet1Cliente: TStringField;
    QRShape4: TQRShape;
    tTotalBultosCliSal: TQRLabel;
    tTotalEstuchesCliSal: TQRLabel;
    tTotalUnidadesCliSal: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    ClientDataSet1TipoSal: TStringField;
    tTotalBultosCliEnt: TQRLabel;
    tTotalEstuchesCliEnt: TQRLabel;
    tTotalUnidadesCliEnt: TQRLabel;
    ClientDataSet1LoteEnt: TStringField;
    ClientDataSet1LoteSal: TStringField;
    QRLabel1: TQRLabel;
    tFechas: TQRLabel;
    tFamiliasx: TQRLabel;
    tFamilias: TQRLabel;
    QRLabel21: TQRLabel;
    tArticulos: TQRLabel;
    QRLabel17: TQRLabel;
    tCliente: TQRLabel;
    ClientDataSet1Empresa: TStringField;
    QRLabel18: TQRLabel;
    tTotalBultosEnt: TQRLabel;
    tTotalEstuchesEnt: TQRLabel;
    tTotalUnidadesEnt: TQRLabel;
    tTotalBultosSal: TQRLabel;
    tTotalEstuchesSal: TQRLabel;
    tTotalUnidadesSal: TQRLabel;
    QRShape6: TQRShape;
    ClientDataSet1Familia: TStringField;
    ClientDataSet1Articulo: TStringField;
    ClientDataSet1NomArticulo: TStringField;
    QRLabel19: TQRLabel;
    tArticulo: TQRLabel;
    ClientDataSet1TipoEnt: TStringField;
    t1: TQRLabel;
    qrdbtxtLoteSal: TQRDBText;
    strngfldClientDataSet1LoteOrigenSal: TStringField;
    t2: TQRLabel;
    strngfldClientDataSet1LoteOrigenEnt: TStringField;
    qrdbtxtLoteOrigenSal: TQRDBText;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);

  private
         TotalBultosCliEnt, TotalBultosCliSal: Integer;
         TotalEstuchesCliEnt, TotalEstuchesCliSal: Integer;
         TotalUnidadesCliEnt, TotalUnidadesCliSal: Real;
  public
        NClientes, NumCliente: Integer;
  end;

var
  QRMovimientosCliente: TQRMovimientosCliente;

implementation

uses UGLobal;

{$R *.DFM}

procedure TQRMovimientosCliente.QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     tCliente.Caption:=ClientDataSet1.FieldByName('Cliente').AsString +
                       '-' +
                       NomCliente(ClientDataSet1.FieldByName('Empresa').AsString, ClientDataSet1.FieldByName('Cliente').AsString);
end;

//------------------ DESPUES DE DE IMPRIMIR EL PIE DE GRUPO DEL CLIENTE --------
procedure TQRMovimientosCliente.QRBand4AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
     TotalBultosCliEnt:=0;
     TotalBultosCliSal:=0;
     TotalEstuchesCliEnt:=0;
     TotalEstuchesCliSal:=0;
     TotalUnidadesCliEnt:=0;
     TotalUnidadesCliSal:=0;
end;

//-------------------- ANTES DE IMPRIMIR EL DETALLE ----------------------------
procedure TQRMovimientosCliente.QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     tArticulo.Caption:=ClientDataSet1.FieldByName('Familia').AsString +
                        '/' +
                        ClientDataSet1.FieldByName('Articulo').AsString +
                        '-' +
                        ClientDataSet1.FieldByName('NomArticulo').AsString;
     TotalBultosCliEnt:=TotalBultosCliEnt + ClientDataSet1.FieldByName('BultosEnt').AsInteger;
     TotalBultosCliSal:=TotalBultosCliSal + ClientDataSet1.FieldByName('BultosSal').AsInteger;
     TotalEstuchesCliEnt:=TotalEstuchesCliEnt + ClientDataSet1.FieldByName('EstuchesSueltosEnt').AsInteger;
     TotalEstuchesCliSal:=TotalEstuchesCliSal + ClientDataSet1.FieldByName('EstuchesSueltosSal').AsInteger;
     TotalUnidadesCliEnt:=TotalUnidadesCliEnt + ClientDataSet1.FieldByName('UnidadesEnt').AsFloat;
     TotalUnidadesCliSal:=TotalUnidadesCliSal + ClientDataSet1.FieldByName('UnidadesSal').AsFloat;
end;

procedure TQRMovimientosCliente.QRBand4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     tTotalBultosCliEnt.Caption:=IntToStr(TotalBultosCliEnt);
     tTotalBultosCliSal.Caption:=IntToStr(TotalBultosCliSal);
     tTotalEstuchesCliEnt.Caption:=IntToStr(TotalEstuchesCliEnt);
     tTotalEstuchesCliSal.Caption:=IntToStr(TotalEstuchesCliSal);
     tTotalUnidadesCliEnt.Caption:=FormatFloat('#,##0.00',TotalUnidadesCliEnt);
     tTotalUnidadesCliSal.Caption:=FormatFloat('#,##0.00',TotalUnidadesCliSal);

     if NumCliente=NClientes then
     begin
          QRShape6.Enabled:=True;
          QRLabel18.Enabled:=True;
          tTotalBultosEnt.Enabled:=True;
          tTotalEstuchesEnt.Enabled:=True;
          tTotalUnidadesEnt.Enabled:=True;
          tTotalBultosSal.Enabled:=True;
          tTotalBultosSal.Enabled:=True;
          tTotalEstuchesSal.Enabled:=True;
          tTotalUnidadesSal.Enabled:=True;
     end
     else
     begin
          QRShape6.Enabled:=False;
          QRLabel18.Enabled:=False;
          tTotalBultosEnt.Enabled:=False;
          tTotalEstuchesEnt.Enabled:=False;
          tTotalUnidadesEnt.Enabled:=False;
          tTotalBultosSal.Enabled:=False;
          tTotalBultosSal.Enabled:=False;
          tTotalEstuchesSal.Enabled:=False;
          tTotalUnidadesSal.Enabled:=False;
     end;
end;

procedure TQRMovimientosCliente.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
     NumCliente:=0;
end;

procedure TQRMovimientosCliente.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     Inc(NumCliente);
end;

end.
