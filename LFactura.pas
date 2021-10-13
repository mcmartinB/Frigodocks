unit LFactura;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg, DB, DBTables,
     DBClient, UGlobal, Variants, OleServer, CmAdmCtl;

const
     KLineas=25;   //Numero de lineas de cada hoja de la factura

type
  TQRFactura = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRImage1: TQRImage;
    QRImage2: TQRImage;
    QRImage3: TQRImage;
    QRImage4: TQRImage;
    QRImage5: TQRImage;
    QRShape1: TQRShape;
    QRSubDetail1: TQRSubDetail;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape3: TQRShape;
    QRDBCodigo: TQRDBText;
    QRDBArticulo: TQRDBText;
    QRDBUnidad: TQRDBText;
    QRDBPrecio: TQRDBText;
    QRDBTipo: TQRDBText;
    QRDBImporte: TQRDBText;
    LineaDetalle: TQRShape;
    QRBand2: TQRBand;
    QRLabel7: TQRLabel;
    tTipo: TQRLabel;
    QRLabel8: TQRLabel;
    tBase: TQRLabel;
    QRLabel9: TQRLabel;
    tPorcen1: TQRLabel;
    QRLabel10: TQRLabel;
    tCuota: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    tVencimiento: TQRLabel;
    tTotal: TQRLabel;
    QRShape22: TQRShape;
    QRShape18: TQRShape;
    tIva: TQRLabel;
    tImporte: TQRLabel;
    QRShape16: TQRShape;
    QRLabel6: TQRLabel;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    tFormaPago: TQRLabel;
    QRShape11: TQRShape;
    QClientes: TQuery;
    QFacturasC: TQuery;
    QFacturasCempresa_cf: TStringField;
    QFacturasCcliente_cf: TStringField;
    QFacturasCnumero_factura_cf: TIntegerField;
    QFacturasCfecha_factura_cf: TStringField;
    QFacturasCfecha_vencimiento_cf: TStringField;
    QFacturasCfecha_desde_cf: TStringField;
    QFacturasCfecha_hasta_cf: TStringField;
    QFacturasCimporte_bruto_cf: TFloatField;
    QFacturasCporcentaje_iva_cf: TFloatField;
    QFacturasCimporte_iva_cf: TFloatField;
    QFacturasCimporte_neto_cf: TFloatField;
    QFacturasCtipo_cf: TStringField;
    QFacturasCnum_contabilizacion_cf: TIntegerField;
    QFacturasCultimo_stock_cf: TFloatField;
    QFacturasCfecha_contabilizacion_cf: TStringField;
    QClientesempresa_c: TStringField;
    QClientescodigo_c: TStringField;
    QClientesnombre_juridico_c: TStringField;
    QClientesnombre_comercial_c: TStringField;
    QClientesdomicilio_c: TStringField;
    QClientescp_c: TStringField;
    QClientespoblacion_c: TStringField;
    QClientesdomicilio_correo_c: TStringField;
    QClientescp_correo_c: TStringField;
    QClientespoblacion_correo_c: TStringField;
    QClientestelefono1_c: TStringField;
    QClientestelefono2_c: TStringField;
    QClientesfax_c: TStringField;
    QClientescif_dni_c: TStringField;
    QClientesorigen_c: TStringField;
    QClientesimp_alquiler_oficina_c: TFloatField;
    QClientesimp_thermoking_c: TFloatField;
    QClientesprecio_kw_thermo_c: TFloatField;
    QClientesimp_cargo_fijo_c: TFloatField;
    QClientesprecio_horas_ent_sal_c: TFloatField;
    QClientesimp_minimo_facturacion_c: TFloatField;
    QClientesperiodo_factura_c: TStringField;
    QClientestarifa_c: TStringField;
    QClientesm3_facturacion_c: TIntegerField;
    QClientesm3_refrigeracion_c: TIntegerField;
    QClientesdias_pago_c: TSmallintField;
    QClientesforma_pago_c: TStringField;
    QClientescuenta_cliente_c: TStringField;
    QClientesnombre_banco_c: TStringField;
    QClientesdomicilio_banco_c: TStringField;
    QClientescp_banco_c: TStringField;
    QClientespoblacion_banco_c: TStringField;
    QClientesultimo_stock_c: TFloatField;
    QClientesnumerador_lotes_c: TIntegerField;
    QClientesnom_autorizado1_c: TStringField;
    QClientescif_autorizado1_c: TStringField;
    QClientesfecha_autorizado1_c: TStringField;
    QClientesnom_autorizado2_c: TStringField;
    QClientescif_autorizado2_c: TStringField;
    QClientesfecha_autorizado2_c: TStringField;
    QClientescomentario_c: TStringField;
    QClientesvalor_stock_c: TFloatField;
    QClientesimp_pendiente_pago_c: TFloatField;
    QClientesmercancia_retenida_c: TStringField;
    QClientestlfmovil_c: TStringField;
    QClientesemail_c: TStringField;
    QClientesweb_c: TStringField;
    QClientesprecio_hor_clima_c: TFloatField;
    QClientescuenta_contable_c: TStringField;
    QClientescodigo_pago_c: TStringField;
    QFacturasL: TQuery;
    QFacturasLempresa_lf: TStringField;
    QFacturasLcliente_lf: TStringField;
    QFacturasLnumero_factura_lf: TIntegerField;
    QFacturasLfecha_factura_lf: TStringField;
    QFacturasLnumero_linea_lf: TIntegerField;
    QFacturasLcodigo_lf: TStringField;
    QFacturasLdescripcion_lf: TStringField;
    QFacturasLcantidad_lf: TFloatField;
    QFacturasLunidad_lf: TStringField;
    QFacturasLimporte_lf: TFloatField;
    DSFacturasC: TDataSource;
    QRBand3: TQRBand;
    QFacturasLtipo_lf: TStringField;
    QFacturasLprecio_lf: TFloatField;
    tEmpresa: TQRLabel;
    QRLabel4: TQRLabel;
    tCliente: TQRLabel;
    tFacturaB: TQRLabel;
    tFechaFacturaB: TQRLabel;
    tCtaContable: TQRLabel;
    tPaginas: TQRLabel;
    tPeriodoFacturacion: TQRLabel;
    QRShape2: TQRShape;
    tNomCliente: TQRLabel;
    tDirCli1: TQRLabel;
    tDirCli2: TQRLabel;
    tDirCli3: TQRLabel;
    tNif: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape9: TQRShape;
    QRShape20: TQRShape;
    QRShape8: TQRShape;
    QRShape7: TQRShape;
    QRShape6: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape17: TQRShape;
    QRShape19: TQRShape;
    QRShape21: TQRShape;
    tCantidad: TQRLabel;
    tNomCliente2: TQRLabel;
    QRShape30: TQRShape;
    QRLabel2: TQRLabel;
    tTipoRetencion: TQRLabel;
    QRLabel15: TQRLabel;
    tBaseRetencion: TQRLabel;
    QRLabel29: TQRLabel;
    tPorcen2: TQRLabel;
    QRLabel31: TQRLabel;
    tCuotaRetencion: TQRLabel;
    QRLabel33: TQRLabel;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRLabel34: TQRLabel;
    tRetencion: TQRLabel;
    QFacturasCporcentaje_retencion_cf: TFloatField;
    QFacturasCimporte_retencion_cf: TFloatField;
    tNomCliente2B: TQRLabel;
    tDirCli1B: TQRLabel;
    tDirCli2B: TQRLabel;
    tDirCli3B: TQRLabel;
    tFactura: TQRLabel;
    tFechaFactura: TQRLabel;
    qrlpbnd1: TQRLoopBand;
    qrlConcepto: TQRLabel;
    COMAdminCatalog1: TCOMAdminCatalog;
    qrlLecAct: TQRLabel;
    qrlLecAnt: TQRLabel;
    qrlConsumo: TQRLabel;
    qrlPrecio: TQRLabel;
    qrlTotal: TQRLabel;
    QRLoopBand1: TQRLoopBand;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QFacturasE: TQuery;
    QFacturasEempresa_cef: TStringField;
    QFacturasEcliente_cef: TStringField;
    QFacturasEnumero_factura_cef: TIntegerField;
    QFacturasEfecha_factura_cef: TStringField;
    QFacturasEnumero_linea_cef: TIntegerField;
    QFacturasEconcepto_cef: TStringField;
    QFacturasElectura_actual_cef: TIntegerField;
    QFacturasElectura_anterior_cef: TIntegerField;
    QFacturasEconsumo_cef: TIntegerField;
    QFacturasEprecio_cef: TFloatField;
    QFacturasEtotal_cef: TFloatField;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickRepStartPage(Sender: TCustomQuickRep);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure DSFacturasCDataChange(Sender: TObject; Field: TField);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure qrlpbnd1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
         NLineasPag: Integer;    //Indice de numero de linea en una pagina
         NLineas: Integer;       //Indice de numero de linea en una factura
         NPagina: Integer;       //Indice de numero de pagina en una factura

         QConsumos: TQuery;
         totConsumos: Real;
         function NLineasFactura(): Integer;
  public
        TotalLineasFactura: Integer;  //Numero total de lineas que tiene una factura
        EmailDestino: String;
        FacturaDefinitiva: Boolean;
        ClienteAnt: String;

        constructor Create(AOwner: TComponent; ADefinitiva: boolean = True); reintroduce;
  end;

var
   QRFactura: TQRFactura;

implementation

uses MBaseDatos;

{$R *.DFM}

procedure TQRFactura.QRSubDetail1BeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
     if ClienteAnt='' then
     begin
          ClienteAnt:=QFacturasC.FieldByName('Cliente_cf').AsString;
          TotalLineasFactura:=NLineasFactura();
     end
     else if ClienteAnt<>QFacturasC.FieldByName('Cliente_cf').AsString then
          begin
               ClienteAnt:=QFacturasC.FieldByName('Cliente_cf').AsString;
               TotalLineasFactura:=NLineasFactura();
               NLineasPag:=1;
               NLineas:=1;
               NPagina:=1;
               Self.NewPage;
          end;

     if (NLineasPag=KLineas) then
     begin
          LineaDetalle.Enabled:=True;
          NLineasPag:=1;
     end
     else
     begin
          if NLineas=TotalLineasFactura then   //Ultima Pagina
             LineaDetalle.Enabled:=True
          else
              LineaDetalle.Enabled:=False;
          Inc(NLineasPag);
     end;
     if UpperCase(QFacturasL.FieldByName('Unidad_lf').AsString)='HOR' then
        tCantidad.Caption:=Format('%d:%s',[ParteEntera(QFacturasL.FieldByName('Cantidad_lf').AsFloat), RellenarCeros(ParteDecimal(QFacturasL.FieldByName('Cantidad_lf').AsFloat),2,'D')])
     else if QFacturasL['Cantidad_lf']<>NULL then
          begin
               if (UpperCase(QFacturasL.FieldByName('Unidad_lf').AsString)='M3') or (UpperCase(QFacturasL.FieldByName('Unidad_lf').AsString)='KW') then
                  tCantidad.Caption:=FloatToStr(QFacturasL.FieldByName('Cantidad_lf').AsFloat)
               else
                   tCantidad.Caption:=FormatFloat('#,##0.00',QFacturasL.FieldByName('Cantidad_lf').AsFloat);
          end
          else
              tCantidad.Caption:='';
     Inc(NLineas);
end;

procedure TQRFactura.QuickRepStartPage(Sender: TCustomQuickRep);
begin
     if NPagina>=(TotalLineasFactura/KLineas) then   //Ultima Pagina
     begin
          tFormaPago.Caption:='FORMA DE PAGO: ' + QClientes.FieldByName('forma_pago_c').AsString;
          tVencimiento.Caption:='VTO: ' + DiaMesAnyo(QFacturasC.FieldByName('Fecha_vencimiento_cf').AsString);
          tImporte.Caption:=FormatFloat('#,##0.00',QFacturasC.FieldByName('Importe_Neto_cf').AsFloat);

          tTipo.Caption:=QFacturasC.FieldByName('Tipo_cf').AsString;
          tBase.Caption:=FormatFloat('#,##0.00',QFacturasC.FieldByName('Importe_Neto_cf').AsFloat);
          tPorcen1.Caption:=FormatFloat('#,##0.00',QFacturasC.FieldByName('Porcentaje_Iva_cf').AsFloat);
          tIva.Caption:=FormatFloat('#,##0.00',QFacturasC.FieldByName('Importe_Iva_cf').AsFloat);

          tCuota.Caption:=FormatFloat('#,##0.00',QFacturasC.FieldByName('Importe_Iva_cf').AsFloat);
          tTotal.Caption:=FormatFloat('#,##0.00',QFacturasC.FieldByName('Importe_Bruto_cf').AsFloat);

          if QFacturasC.FieldByName('porcentaje_retencion_cf').AsFloat > 0 then
          begin
               tTipoRetencion.Caption:=QFacturasC.FieldByName('Tipo_cf').AsString;
               tBaseRetencion.Caption:=FormatFloat('#,##0.00',QFacturasC.FieldByName('Importe_Neto_cf').AsFloat);
               tPorcen2.Caption:=FormatFloat('#,##0.00',QFacturasC.FieldByName('porcentaje_retencion_cf').AsFloat);
               tRetencion.Caption:=FormatFloat('-#,##0.00',QFacturasC.FieldByName('importe_retencion_cf').AsFloat);

               tCuotaRetencion.Caption:=FormatFloat('-#,##0.00',QFacturasC.FieldByName('Importe_Retencion_cf').AsFloat);
          end
          else
          begin
               QRShape30.Pen.Color:= clwindow;
               QRShape31.Pen.Color:= clwindow;
               QRShape32.Pen.Color:= clwindow;
               QRShape33.Pen.Color:= clwindow;
               QRShape34.Pen.Color:= clwindow;
               QRShape35.Pen.Color:= clwindow;
               QRLabel2.Caption:='';
               tTipoRetencion.Caption:='';
               QRLabel15.Caption:='';
               tBaseRetencion.Caption:='';
               QRLabel29.Caption:='';
               tPorcen2.Caption:='';
               QRLabel31.Caption:='';
               tCuotaRetencion.Caption:='';
               QRLabel33.Caption:='';

               QRShape36.Pen.Color:= clwindow;
               QRLabel34.Caption:='';
               tRetencion.Caption:='';
          end;

     end    //No es la ultima pagina
     else
     begin
          tFormaPago.Caption:='';
          tVencimiento.Caption:='';
          tImporte.Caption:='';
          tPorcen1.Caption:='';
          tIva.Caption:='';
          tPorcen2.Caption:='';
          tRetencion.Caption:='';
          tTotal.Caption:='';
          //tPtas.Caption:='';
          tCuota.Caption:='';
          tCuotaRetencion.Caption:='';
          tBase.Caption:='';
          tTipo.Caption:='';
     end;
end;

procedure TQRFactura.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
     NLineasPag:=1;
     NLineas:=1;
     NPagina:=1;
     ClienteAnt:='';

end;

procedure TQRFactura.QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     if (TotalLineasFactura mod KLineas)=0 then
        tPaginas.Caption:='PÁGINA: ' + IntToStr(NPagina) + '/' + IntToStr(ParteEntera(TotalLineasFactura/KLineas))
     else
         tPaginas.Caption:='PÁGINA: ' + IntToStr(NPagina) + '/' + IntToStr(ParteEntera(TotalLineasFactura/KLineas) + 1);

     QClientes.Close;
     QClientes.ParamByName('Empresa').AsString:=QFacturasC.FieldByName('Empresa_cf').AsString;
     QClientes.ParamByName('Cliente').AsString:=QFacturasC.FieldByName('Cliente_cf').AsString;
     QClientes.Open;

     tEmpresa.Caption:=QFacturasC.FieldByName('Empresa_cf').AsString;
     tCliente.Caption:=QFacturasC.FieldByName('Cliente_cf').AsString;

     if FacturaDefinitiva then
        //tFactura.Caption:='FACTURA......: ' +
        tFactura.Caption:= 'FCP-049' +
                           Copy(QFacturasC.FieldByName('Fecha_Factura_cf').AsString,3,2) +
                           '-' +
                           RellenarCeros(IntToStr(QFacturasC.FieldByName('Numero_Factura_cf').AsInteger),5,'I')  //FCP-049 - 2 Digitos Año + Nº Factura
     else
         tFactura.Caption:='';
     //tFechaFactura.Caption:='FECHA FACTURA: ' +
     tFechaFactura.Caption:= DiaMesAnyo(QFacturasC.FieldByName('Fecha_Factura_cf').AsString);
     tPeriodoFacturacion.Caption:='PERIODO FACTURADO DEL ' +
                                   DiaMesAnyo(QFacturasC.FieldByName('Fecha_Desde_cf').AsString) +
                                   ' AL ' +
                                   DiaMesAnyo(QFacturasC.FieldByName('Fecha_Hasta_cf').AsString);

     tCtaContable.Caption:=QClientes.FieldByName('Cuenta_Contable_c').AsString;

     //Nombre Comercial
     if QClientes.FieldByName('Nombre_Comercial_c').AsString<>'' then
        tNomCliente.Caption:=QClientes.FieldByName('Nombre_Comercial_c').AsString
     else
         tNomCliente.Caption:='';

     //Nombre Juridico
     if QClientes.FieldByName('Nombre_Juridico_c').AsString<>'' then
        tNomCliente2.Caption:=QClientes.FieldByName('Nombre_Juridico_c').AsString
     else
         tNomCliente2.Caption:='';
     tNomCliente2B.Caption:=QClientes.FieldByName('Nombre_Juridico_c').AsString;

     //Domicilio del Correo o del Cliente
     if QClientes.FieldByName('Domicilio_Correo_c').AsString='' then
        tDirCli1.Caption:=QClientes.FieldByName('Domicilio_c').AsString
     else
        tDirCli1.Caption:=QClientes.FieldByName('Domicilio_Correo_c').AsString;
     tDirCli1B.Caption:=QClientes.FieldByName('Domicilio_c').AsString;

     //CP del Correo o del Cliente
     if QClientes.FieldByName('Cp_Correo_c').AsString='' then
        tDirCli2.Caption:=QClientes.FieldByName('Cp_c').AsString + ' ' + QClientes.FieldByName('Poblacion_c').AsString
     else
        tDirCli2.Caption:=QClientes.FieldByName('Cp_Correo_c').AsString + ' ' + QClientes.FieldByName('Poblacion_Correo_c').AsString;
     tDirCli2B.Caption:=QClientes.FieldByName('Cp_c').AsString + ' ' + QClientes.FieldByName('Poblacion_c').AsString;

     //Provincia del Correo o del Cliente
     if QClientes.FieldByName('Poblacion_Correo_c').AsString='' then
        tDirCli3.Caption:=Provincia(QClientes.FieldByName('Origen_c').AsString, QClientes.FieldByName('Cp_c').AsString)
     else
        tDirCli3.Caption:=Provincia(QClientes.FieldByName('Origen_c').AsString, QClientes.FieldByName('Cp_Correo_c').AsString);
     tDirCli3B.Caption:=Provincia(QClientes.FieldByName('Origen_c').AsString, QClientes.FieldByName('Cp_c').AsString);

     //CIF-DNI
     tNif.Caption:='C.I.F./D.N.I.    ' + QClientes.FieldByName('Cif_Dni_c').AsString;

    with QConsumos do
    begin
      totConsumos := 0;
      if Active then Close;
      ParamByName('empresa').asString := QFacturasC.FieldByName('empresa_cf').AsString;
      ParamByName('cliente').asString := QFacturasC.FieldByName('cliente_cf').AsString;
      ParamByName('factura').asInteger := QFacturasC.FieldByName('Numero_Factura_cf').AsInteger;
      ParamByName('fecha').asString := QFacturasC.FieldByName('Fecha_Factura_cf').AsString;
      Open;
      if not isEmpty then
      begin
        QRLoopBand1.PrintCount := 1;
        qrlpbnd1.PrintCount := RecordCount+2; // Total de registros + encabezado + totales
      end
      else
      begin
        QRLoopBand1.PrintCount := 0;
        qrlpbnd1.PrintCount := 0;
      end
    end;

end;

procedure TQRFactura.qrlpbnd1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  // Imprimir encabezado para los consumos
  if qrlpbnd1.Count = 0 then
  begin
    qrlpbnd1.Font.Style := qrlpbnd1.Font.Style + [ fsBold ];
    qrlConcepto.Caption := 'DETALLE DE CONCEPTOS';
    qrlLecAct.Caption := 'Lect. actual';
    qrlLecAnt.Caption := 'Lect. anterior';
    qrlConsumo.Caption := 'Consumo';
    qrlPrecio.Caption := 'Precio ud.';
    qrlTotal.Caption := 'Total';
    QRShape37.Enabled := True;
    QRShape38.Enabled := True;
    QRShape39.Enabled := True;
  end
  // Imprimir TOTAL para los consumos
  else if qrlpbnd1.Count = qrlpbnd1.PrintCount-1 then
  begin
    qrlpbnd1.Font.Style := qrlpbnd1.Font.Style + [ fsBold ];
    qrlConcepto.Caption := '';
    qrlLecAct.Caption := '';
    qrlLecAnt.Caption := '';
    qrlConsumo.Caption := '';
    qrlPrecio.Caption := 'TOTAL';
    qrlTotal.Caption := FormatFloat(',0.00', totConsumos);
    QRShape37.Enabled := False;
    QRShape38.Enabled := False;
    QRShape39.Enabled := False;
  end
  // Imprimir lineas de consumo
  else
    with QConsumos do
    begin
      qrlpbnd1.Font.Style := qrlpbnd1.Font.Style - [ fsBold ];
      qrlConcepto.Caption := FieldByName('descripcion_c').AsString;
      qrlLecAct.Caption := FieldByName('lectura_actual_cef').asString;
      qrlLecAnt.Caption := FieldByName('lectura_anterior_cef').asString;
      qrlConsumo.Caption := FieldByName('consumo_cef').asString;
      qrlPrecio.Caption := FormatFloat(',0.00', FieldByName('precio_cef').asFloat);
      qrlTotal.Caption := FormatFloat(',0.00', FieldByName('total_cef').asFloat);
      totConsumos := totConsumos + FieldByName('total_cef').asFloat;
      Next;
    end;

end;

constructor TQRFactura.Create(AOwner: TComponent; ADefinitiva: boolean = True);
begin
  inherited Create(AOwner);

  FacturaDefinitiva := ADefinitiva;

  QConsumos := TQuery.Create(self);
  with QConsumos do
  begin
    DatabaseName  := 'BDFrigo';
    SQL.Add('SELECT CONSUMOS.*, DESCRIPCION_C        ');
    if FacturaDefinitiva then
     SQL.Add(' FROM CONSUMO_ELECTRICO_FACTURAS CONSUMOS')
    else
     SQL.Add(' FROM TEMP_CONSUMO_ELECTRICO_FACTURAS CONSUMOS');

    SQL.Add('  JOIN CONCEPTOS ON EMPRESA_C = EMPRESA_CEF AND CODIGO_C = CONCEPTO_CEF ');
    SQL.Add(' WHERE EMPRESA_CEF = :empresa ');
    SQL.Add('   AND CLIENTE_CEF = :cliente ');
    SQL.Add('   AND NUMERO_FACTURA_CEF = :factura');
    SQL.Add('   AND FECHA_FACTURA_CEF = :fecha');

    ParamByName('empresa').DataType := ftString;
    ParamByName('cliente').DataType := ftString;
    ParamByName('factura').DataType := ftInteger;
    ParamByName('fecha').DataType := ftString;
  end;
end;

procedure TQRFactura.DSFacturasCDataChange(Sender: TObject; Field: TField);
begin
     //TotalLineasFactura:=NLineasFactura();
     QClientes.Close;
     QClientes.ParamByName('Empresa').AsString:=QFacturasC.FieldByName('Empresa_cf').AsString;
     QClientes.ParamByName('Cliente').AsString:=QFacturasC.FieldByName('Cliente_cf').AsString;
     QClientes.Open;
end;

function TQRFactura.NLineasFactura(): Integer;
Var
   QAux: TQuery;
begin
     QAux:=TQuery.Create(nil);
     try
        With QAux do
        begin
             DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
             SQL.Add(' SELECT COUNT(*) AS NLINEAS ');
             if FacturaDefinitiva then
                SQL.Add(' FROM LINEA_FACTURAS ')
             else
                 SQL.Add(' FROM TEMP_LINEA_FACTURAS ');
             SQL.Add(' WHERE EMPRESA_LF=' + QuotedStr(QFacturasC.FieldByName('Empresa_cf').AsString) +
                     ' AND CLIENTE_LF=' + QuotedStr(QFacturasC.FieldByName('Cliente_cf').AsString) +
                     ' AND NUMERO_FACTURA_LF=' + QuotedStr(QFacturasC.FieldByName('Numero_Factura_cf').AsString) +
                     ' AND FECHA_FACTURA_LF=' + QuotedStr(QFacturasC.FieldByName('Fecha_Factura_cf').AsString));
             Open;
             Result:=FieldByName('NLINEAS').AsInteger;
        end;
    finally
           QAux.Close;
           FreeAndNil(QAux);
    end;
end;

procedure TQRFactura.QRBand1AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
     Inc(NPagina);
end;

end.
