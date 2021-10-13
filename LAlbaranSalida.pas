unit LAlbaranSalida;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables, Dialogs, jpeg;

type
  TQRAlbaranSalida = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    tNumAlbaran: TQRLabel;
    tCliente: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape1: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRBand2: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    tNomArticulo: TQRLabel;
    QRBand4: TQRBand;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRSysData1: TQRSysData;
    QAux: TQuery;
    QLineas: TQuery;
    QRDBText5: TQRDBText;
    QRImage1: TQRImage;
    QRImage2: TQRImage;
    QRImage3: TQRImage;
    QRImage4: TQRImage;
    QRImage5: TQRImage;
    tTituloImporte: TQRLabel;
    tTituloConcepto: TQRLabel;
    tConcepto: TQRLabel;
    tImporteSalida: TQRLabel;
    tTituloHoras: TQRLabel;
    tHorasFacturar: TQRLabel;
    tUnidades: TQRLabel;
    bndNombreComercial: TQRChildBand;
    ChildBand2: TQRChildBand;
    SummaryBand1: TQRBand;
    qrlbl1: TQRLabel;
    qrxpr1: TQRExpr;
    qrxpr2: TQRExpr;
    qrxpr3: TQRExpr;
    qrSuma1: TQRLabel;
    qrSuma2: TQRExpr;
    qrSuma3: TQRExpr;
    qrSuma4: TQRExpr;
    bndNotas: TQRChildBand;
    ChildBand3: TQRChildBand;
    QRLabel32: TQRLabel;
    tNota: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    tFecha: TQRLabel;
    tRetira: TQRLabel;
    tObservacion: TQRLabel;
    tNumOrden: TQRLabel;
    tMatricula: TQRLabel;
    tNif: TQRLabel;
    QRLabel1: TQRLabel;
    tDestino: TQRLabel;
    QRLabel15: TQRLabel;
    tTemperatura: TQRLabel;
    tNombreComercial: TQRLabel;
    QRLabel28: TQRLabel;
    qrdbtxtlote_origen_ls: TQRDBText;
    QRShape2: TQRShape;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
        NLineas, Linea: Integer;
        HayImporte, HayHoras, HayConcepto: Boolean;
  end;

var
   QRAlbaranSalida: TQRAlbaranSalida;

implementation

uses MBaseDatos, UGLobal;

{$R *.DFM}

procedure TQRAlbaranSalida.QRBand2BeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
     tNomArticulo.Caption:=QLineas.FieldByName('Articulo_ls').AsString +
                           '-' +
                           NomArticulo(QLineas.FieldByName('Empresa_ls').AsString,
                                       QLineas.FieldByName('Familia_ls').AsString,
                                       QLineas.FieldByName('Articulo_ls').AsString);
     tUnidades.Caption:=FormatFloat('#,##0.00',QLineas.FieldByName('Unidades_ls').AsFloat) + ' ' +
                        NomUnidadAbreviada(QLineas.FieldByName('Empresa_ls').AsString,
                                           QLineas.FieldByName('Familia_ls').AsString,
                                           QLineas.FieldByName('Articulo_ls').AsString);
end;

procedure TQRAlbaranSalida.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
     Linea:=0;
end;

procedure TQRAlbaranSalida.QRBand2AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
     Inc(Linea);
end;

procedure TQRAlbaranSalida.QRBand4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     if Linea=NLineas then  //Si es la ultima pagina (es la ultima linea)
     begin
          if HayImporte then
          begin
               tTituloImporte.Enabled:=True;
               tImporteSalida.Enabled:=True;
          end
          else
          begin
               tTituloImporte.Enabled:=False;
               tImporteSalida.Enabled:=False;
          end;
          if HayHoras then
          begin
               tTituloHoras.Enabled:=True;
               tHorasFacturar.Enabled:=True;
          end
          else
          begin
               tTituloHoras.Enabled:=False;
               tHorasFacturar.Enabled:=False;
          end;
          if HayConcepto then
          begin
               tTituloConcepto.Enabled:=True;
               tConcepto.Enabled:=True;
          end
          else
          begin
               tTituloConcepto.Enabled:=False;
               tConcepto.Enabled:=False;
          end;

          qrSuma1.Enabled:= False;
          qrSuma2.Enabled:= False;
          qrSuma3.Enabled:= False;
          qrSuma4.Enabled:= False;
     end
     else   //No es la ultima pagina
     begin
          tTituloImporte.Enabled:=False;
          tImporteSalida.Enabled:=False;
          tTituloHoras.Enabled:=False;
          tHorasFacturar.Enabled:=False;
          tTituloConcepto.Enabled:=False;
          tConcepto.Enabled:=False;

          qrSuma1.Enabled:= True;
          qrSuma2.Enabled:= True;
          qrSuma3.Enabled:= True;
          qrSuma4.Enabled:= True;

     end;
end;

end.
