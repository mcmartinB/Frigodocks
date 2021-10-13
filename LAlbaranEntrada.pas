unit LAlbaranEntrada;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables, Dialogs,
     jpeg;

type
  TQRAlbaranEntrada = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    tNumAlbaran: TQRLabel;
    tCliente: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRBand2: TQRBand;
    QRShape1: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QAux: TQuery;
    QLineas: TQuery;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    tNomArticulo: TQRLabel;
    QRImage1: TQRImage;
    QRImage2: TQRImage;
    QRImage3: TQRImage;
    QRImage4: TQRImage;
    QRImage5: TQRImage;
    QRBand3: TQRBand;
    tTituloImporte: TQRLabel;
    tImporteEntrada: TQRLabel;
    tConcepto: TQRLabel;
    tTituloConcepto: TQRLabel;
    QRLabel34: TQRLabel;
    tTituloHoras: TQRLabel;
    tHorasFacturar: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel28: TQRLabel;
    QRSysData2: TQRSysData;
    tUnidades: TQRLabel;
    SummaryBand1: TQRBand;
    qrlbl1: TQRLabel;
    qrxpr1: TQRExpr;
    qrxpr2: TQRExpr;
    qrxpr3: TQRExpr;
    QRExpr1: TQRExpr;
    qrSuma2: TQRExpr;
    qrSuma3: TQRExpr;
    qrSuma4: TQRExpr;
    qrSuma5: TQRExpr;
    qrSuma1: TQRLabel;
    bndNombreComercial: TQRChildBand;
    ChildBand2: TQRChildBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    tFecha: TQRLabel;
    tTransportista: TQRLabel;
    tProcedencia: TQRLabel;
    tObservacion: TQRLabel;
    tMatricula: TQRLabel;
    tReferencia: TQRLabel;
    tTemperatura: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    tNombreComercial: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape2: TQRShape;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
  private

  public
        NLineas, Linea: Integer;
        HayImporte, HayHoras, HayConcepto: Boolean;
  end;

var
   QRAlbaranEntrada: TQRAlbaranEntrada;

implementation

uses MBaseDatos, UGLobal;

{$R *.DFM}

procedure TQRAlbaranEntrada.QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     tNomArticulo.Caption:=QLineas.FieldByName('Articulo_le').AsString +
                           '-' +
                           NomArticulo(QLineas.FieldByName('Empresa_le').AsString,
                                       QLineas.FieldByName('Familia_le').AsString,
                                       QLineas.FieldByName('Articulo_le').AsString);
     tUnidades.Caption:=FormatFloat('#,##0.00',QLineas.FieldByName('Unidades_le').AsFloat) + ' ' +
                        NomUnidadAbreviada(QLineas.FieldByName('Empresa_le').AsString,
                                           QLineas.FieldByName('Familia_le').AsString,
                                           QLineas.FieldByName('Articulo_le').AsString)
end;

procedure TQRAlbaranEntrada.QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     if Linea=NLineas then  //Si es la ultima pagina (es la ultima linea)
     begin
          if HayImporte then
          begin
               tTituloImporte.Enabled:=True;
               tImporteEntrada.Enabled:=True;
          end
          else
          begin
               tTituloImporte.Enabled:=False;
               tImporteEntrada.Enabled:=False;
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

          qrSuma1.Enabled:= false;
          qrSuma2.Enabled:= false;
          qrSuma3.Enabled:= false;
          qrSuma4.Enabled:= false;
          qrSuma5.Enabled:= false;
     end
     else   //No es la ultima pagina
     begin
          tTituloImporte.Enabled:=False;
          tImporteEntrada.Enabled:=False;
          tTituloHoras.Enabled:=False;
          tHorasFacturar.Enabled:=False;
          tTituloConcepto.Enabled:=False;
          tConcepto.Enabled:=False;

          qrSuma1.Enabled:= True;
          qrSuma2.Enabled:= True;
          qrSuma3.Enabled:= True;
          qrSuma4.Enabled:= True;
          qrSuma5.Enabled:= True;
     end;
end;

procedure TQRAlbaranEntrada.QRBand2AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
     Inc(Linea);
end;

procedure TQRAlbaranEntrada.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
     Linea:=0;
end;

end.
