unit LArticulos;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables;

type
  TQRArticulos = class(TQuickRep)
    Query1: TQuery;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    TituloArticulo: TQRLabel;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    tEmpresa: TQRLabel;
    LineaFamilia2: TQRShape;
    QRBand3: TQRBand;
    QRSysData2: TQRSysData;
    TituloUnidad: TQRLabel;
    tArticulo: TQRLabel;
    TituloFamilia: TQRLabel;
    tFamilia: TQRLabel;
    QRDBText1: TQRDBText;
    TituloValor: TQRLabel;
    tUnidad: TQRLabel;
    Query1empresa_a: TStringField;
    Query1familia_a: TStringField;
    Query1codigo_a: TStringField;
    Query1denominacion_a: TStringField;
    Query1unidad_medida_a: TStringField;
    Query1valor_por_kg_a: TFloatField;
    Query1empresa_u: TStringField;
    Query1codigo_u: TStringField;
    Query1descripcion_u: TStringField;
    Query1des_abreviada_u: TStringField;
    QRLabel4: TQRLabel;
    tFamilias: TQRLabel;
    QRLabel9: TQRLabel;
    tArticulos: TQRLabel;
    LineaFamilia1: TQRShape;
    QRShape7: TQRShape;
    TituloFamilia2: TQRLabel;
    Familia: TQRDBText;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);

  private

  public
        ClienteAnt, FamiliaAnt: String;
        AgruparFamilia: Boolean;
  end;

var
  QRArticulos: TQRArticulos;

implementation

uses UGLobal;

{$R *.DFM}

procedure TQRArticulos.QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     tArticulo.Caption:=Query1.FieldByName('Codigo_a').AsString + '-' + Query1.FieldByName('Denominacion_a').AsString;
     tUnidad.Caption:=Query1.FieldByName('Unidad_Medida_a').AsString + '-' + Query1.FieldByName('Descripcion_u').AsString;

     if AgruparFamilia then
     begin
          //Si cambia la familia hacemos un salto de pagina
          if FamiliaAnt<>Query1.FieldByName('Familia_a').AsString then
             Self.NewPage;
     end;
end;

procedure TQRArticulos.QRBand1BeforePrint(Sender: TQRCustomBand;var PrintBand: Boolean);
begin
     if AgruparFamilia then
     begin
          //Si cambia la familia busco su nombre
          if FamiliaAnt<>Query1.FieldByName('Familia_a').AsString then
             tFamilia.Caption:=Query1.FieldByName('Familia_a').AsString +
                               '-' +
                               NomFamilia(Query1.FieldByName('Empresa_a').AsString,Query1.FieldByName('Familia_a').AsString);
     end;
end;

procedure TQRArticulos.QRBand1AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
     if AgruparFamilia then
     begin
          //Despues de imprimir me guardo la familia
          FamiliaAnt:=Query1.FieldByName('Familia_a').AsString;
     end;
end;

procedure TQRArticulos.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
     if not AgruparFamilia then
     begin
          LineaFamilia1.Enabled:=False;
          LineaFamilia2.Enabled:=False;
          tFamilia.Enabled:=False;
          TituloFamilia.Enabled:=False;
          QRBand1.Height:=164;
          TituloArticulo.Top:=TituloArticulo.Top-31;
          TituloUnidad.Top:=TituloUnidad.Top-31;
          TituloValor.Top:=TituloValor.Top-31;
          TituloFamilia2.Top:=TituloFamilia2.Top-31;
     end
     else
     begin
          TituloFamilia2.Enabled:=False;
          Familia.Enabled:=False;
     end;
end;

end.
