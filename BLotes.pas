unit BLotes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, DBTables, StdCtrls, ComCtrls,
  ToolWin, Buttons, 
  Provider, DBClient, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinsdxBarPainter, dxBar, cxClasses;

type
  TBusquedaLotes = class(TForm)
    PanelDatos: TPanel;
    GridLineas: TDBGrid;
    BarraEstado: TStatusBar;
    Query1: TQuery;
    DS: TDataSource;
    Query1UnidadesStock: TFloatField;
    Query1BultosStock: TIntegerField;
    Query1LOTE_AL: TStringField;
    Query1TIPO_LOTE_AL: TStringField;
    Query1FAMILIA_AL: TStringField;
    Query1DESCRIPCION_F: TStringField;
    Query1ARTICULO_AL: TStringField;
    Query1DENOMINACION_A: TStringField;
    Query1STATUS_RETENIDO_AL: TStringField;
    Query1NUMERO_CAMARA_AL: TSmallintField;
    Query1ZONA_AL: TStringField;
    Query1ESTUCHES_BULTO_AL: TIntegerField;
    Query1BULTOS_ENTRADOS_AL: TIntegerField;
    Query1BULTOS_SALIDOS_AL: TIntegerField;
    Query1UNIDADES_ENTRADAS_AL: TFloatField;
    Query1UNIDADES_SALIDAS_AL: TFloatField;
    Query1UNIDADES_MERMAS_AL: TFloatField;
    Query1UNIDADES_DESTRUIDAS_AL: TFloatField;
    Query1ESTUCHES_SUELTOS_AL: TIntegerField;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    bNuevaBusqueda: TdxBarButton;
    bPrimero: TdxBarButton;
    bAnterior: TdxBarButton;
    bSiguiente: TdxBarButton;
    bUltimo: TdxBarButton;
    bAceptar: TdxBarButton;
    bCancelar: TdxBarButton;
    strngfldQuery1LOTE_ORIGEN_AL: TStringField;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Cancelar(Sender: TObject);
    procedure GridLineasDblClick(Sender: TObject);
    procedure Primero(Sender: TObject);
    procedure Anterior(Sender: TObject);
    procedure Siguiente(Sender: TObject);
    procedure Ultimo(Sender: TObject);
    procedure GridLineasTitleClick(Column: TColumn);
    procedure Query1CalcFields(DataSet: TDataSet);

  private
{
    FEmpresa: String;
    FCliente: String;
    FLote: String;
    FLoteOrigen: String;
    FTipoLote: String;

    FSQL: TStringList;
}
  public
       LoteBus: String;
       SQLText: String;

       //constructor Create(AOwner: TComponent; const empresa, cliente, lote, loteOrigen, tipoLote: String); reintroduce;
       //destructor Destroy; override;
  end;

var
   BusquedaLotes: TBusquedaLotes;

implementation

uses MBaseDatos, UGLobal;

{$R *.dfm}

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TBusquedaLotes.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13 then  //Enter
     begin
          if (GridLineas.Focused) and (not Query1.IsEmpty) then  //Foco en el Grid y existen datos
              GridLineasDblClick(Self)
          else
          begin
               Key:=#0;
               PostMessage(Handle,WM_NEXTDLGCTL,0,0);
          end;
     end
     else if Key=#27 then  //Esc
          begin
               Key:=#0;
               if BCancelar.Enabled then
                  Cancelar(Self)
               else
                   Close;
          end;
end;

//----------------------- BOTON CANCELAR ---------------------------------------
procedure TBusquedaLotes.Cancelar(Sender: TObject);
begin
     ModalResult:=mrCancel;
end;

{
constructor TBusquedaLotes.Create(AOwner: TComponent; const empresa, cliente, lote, loteOrigen, tipoLote: String);
begin
  inherited Create(AOwner);

  FEmpresa := empresa;
  FCliente := cliente;
  FLote := lote;
  FLoteOrigen := loteOrigen;
  FTipoLote := tipoLote;

  FSQL := TStringList.Create;

  with FSQL do
  begin
    Add(' SELECT LOTE_AL, TIPO_LOTE_AL, FAMILIA_AL, DESCRIPCION_F, ARTICULO_AL, ');
    Add('        DENOMINACION_A, STATUS_RETENIDO_AL,  NUMERO_CAMARA_AL, ZONA_AL, ');
    Add('        ESTUCHES_BULTO_AL, BULTOS_ENTRADOS_AL, BULTOS_SALIDOS_AL, ');
    Add('        UNIDADES_ENTRADAS_AL, UNIDADES_SALIDAS_AL,UNIDADES_MERMAS_AL, UNIDADES_DESTRUIDAS_AL, ');
    Add('        ESTUCHES_SUELTOS_AL, LOTE_ORIGEN_AL ');
    Add('   FROM ALMACENES, ARTICULOS, FAMILIAS ');
    Add('  WHERE EMPRESA_AL = EMPRESA_A ');
    Add('    AND FAMILIA_AL = FAMILIA_A ');
    Add('    AND ARTICULO_AL = CODIGO_A ');
    Add('    AND EMPRESA_F = EMPRESA_A ');
    Add('    AND CODIGO_F = FAMILIA_A ');
    Add('    AND EMPRESA_AL = ' + QuotedStr(FEmpresa) );
    Add('    AND CLIENTE_AL = ' + QuotedStr(FCliente) );
    if FLote <> '' then
      Add(' AND LOTE_AL = ' + QuotedStr(FLote));
    if FLoteOrigen <> '' then
      Add(' AND LOTE_ORIGEN_AL = ' + QuotedStr(FLoteOrigen));
    if FTipoLote <> '' then
      Add(' AND TIPO_LOTE_AL=' + QuotedStr('I'));
  end;
end;

destructor TBusquedaLotes.Destroy;
begin
  FSQL.Free;

  inherited;
end;
}
//----------------------------- DOBLE CLICK EN EL GRID -------------------------
procedure TBusquedaLotes.GridLineasDblClick(Sender: TObject);
begin
     LoteBus:=Query1.FieldByName('LOTE_AL').AsString;
     ModalResult:=mrOk;
end;

//-------------------------- PRIMER REGISTRO -----------------------------------
procedure TBusquedaLotes.Primero(Sender: TObject);
begin
     Query1.First;
end;

//-------------------------- REGISTRO ANTERIOR ---------------------------------
procedure TBusquedaLotes.Anterior(Sender: TObject);
begin
     Query1.Prior;
end;

//-------------------------- REGISTRO SIGUIENTE --------------------------------
procedure TBusquedaLotes.Siguiente(Sender: TObject);
begin
     Query1.Next;
end;

//-------------------------- ULTIMO REGISTRO -----------------------------------
procedure TBusquedaLotes.Ultimo(Sender: TObject);
begin
     Query1.Last;
end;

procedure TBusquedaLotes.GridLineasTitleClick(Column: TColumn);
begin
  Query1.Close;
  Query1.SQL.Clear;
  Query1.SQL.Add(SqlText +
                ' ORDER BY ' + Column.FieldName);
  Query1.Open;
end;

procedure TBusquedaLotes.Query1CalcFields(DataSet: TDataSet);
begin
     Query1.FieldByName('UnidadesStock').AsFloat:=Query1.FieldByName('unidades_entradas_al').AsFloat -
                                                   Query1.FieldByName('unidades_salidas_al').AsFloat -
                                                   Query1.FieldByName('unidades_mermas_al').AsFloat -
                                                   Query1.FieldByName('unidades_destruidas_al').AsFloat;
     Query1.FieldByName('BultosStock').AsFloat:=Query1.FieldByName('bultos_entrados_al').AsFloat -
                                                Query1.FieldByName('bultos_salidos_al').AsFloat;
end;

end.
