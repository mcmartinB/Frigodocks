program Frigodocks;

uses
  Forms,
  Dialogs,
  FPrincipal in 'FPrincipal.pas' {Principal},
  UGLobal in 'UGLobal.pas',
  MBaseDatos in 'MBaseDatos.pas' {DMBaseDatos: TDataModule},
  untInterfaces in 'untInterfaces.pas',
  dlgConfigPrinter in 'dlgConfigPrinter.pas' {DConfigPrinter},
  Password in 'Password.pas' {FPassword},
  FEmpresas in 'FEmpresas.pas' {Empresas},
  BEmpresas in 'BEmpresas.pas' {BusquedaEmpresas},
  FFacturas in 'FFacturas.pas' {Facturas},
  LFactura in 'LFactura.pas' {QRFactura: TQuickRep},
  dlgPreview in 'dlgPreview.pas' {DPreview},
  BClientes in 'BClientes.pas' {BusquedaClientes},
  BTarifas in 'BTarifas.pas' {BusquedaTarifas},
  BFacturas in 'BFacturas.pas' {BusquedaFacturas},
  BArticulos in 'BArticulos.pas' {BusquedaArticulos},
  BFamilias in 'BFamilias.pas' {BusquedaFamilias},
  BConceptos in 'BConceptos.pas' {BusquedaConceptos},
  BLotes in 'BLotes.pas' {BusquedaLotes},
  FClientes in 'FClientes.pas' {Clientes},
  FTarifas in 'FTarifas.pas',
  FPeriodicosFact in 'FPeriodicosFact.pas' {PeriodicosFact},
  BPeriodicosFact in 'BPeriodicosFact.pas' {BusquedaPeriodicos},
  FCobros in 'FCobros.pas' {Cobros},
  BCobros in 'BCobros.pas' {BusquedaCobros},
  FAlmacenes in 'FAlmacenes.pas',
  BAlmacenes in 'BAlmacenes.pas' {BusquedaAlmacenes},
  FArticulos in 'FArticulos.pas' {Articulos},
  FConsumos in 'FConsumos.pas' {Consumos},
  BArticulosCliente in 'BArticulosCliente.pas' {BusquedaArticulosCliente},
  FFamilias in 'FFamilias.pas' {Familias},
  FConceptos in 'FConceptos.pas' {Conceptos},
  FLEmpresas in 'FLEmpresas.pas' {ListadoEmpresas},
  FLClientes in 'FLClientes.pas' {ListadoClientes},
  FLTarifas in 'FLTarifas.pas' {ListadoTarifas},
  FLPeriodicos in 'FLPeriodicos.pas' {ListadoPeriodicos},
  FLAlmacenes in 'FLAlmacenes.pas' {ListadoAlmacenes},
  FLFacturas in 'FLFacturas.pas' {ListadoFacturas},
  FLCobros in 'FLCobros.pas' {ListadoCobros},
  FLEntradas in 'FLEntradas.pas' {ListadoEntradas},
  FLSalidas in 'FLSalidas.pas' {ListadoSalidas},
  FLArticulos in 'FLArticulos.pas' {ListadoArticulos},
  FLArticulosCliente in 'FLArticulosCliente.pas' {ListadoArticulosCliente},
  FLUnidades in 'FLUnidades.pas' {ListadoUnidades},
  FLFamilias in 'FLFamilias.pas' {ListadoFamilias},
  FLMovimientosLote in 'FLMovimientosLote.pas' {ListadoMovimientosLote},
  FLMovimientosLotesEx in 'FLMovimientosLotesEx.pas' {LMovimientosLotesEx},
  FLMovimientosCliente in 'FLMovimientosCliente.pas' {ListadoMovimientosCliente},
  BConsumos in 'BConsumos.pas' {BusquedaConsumos},
  LAlbaranEntrada in 'LAlbaranEntrada.pas' {QRAlbaranEntrada: TQuickRep},
  FEntradas in 'FEntradas.pas' {Entradas},
  FSalidas in 'FSalidas.pas' {Salidas},
  BSalidas in 'BSalidas.pas' {BusquedaSalidas},
  BLotesCamaraZona in 'BLotesCamaraZona.pas' {BusquedaCamaraZona},
  FFacturacion in 'FFacturacion.pas' {Facturacion},
  FLKilosCliente in 'FLKilosCliente.pas' {ListadoKilosPorCliente},
  FRepeticionFactura in 'FRepeticionFactura.pas' {RepetionFactura},
  FContabilizacion in 'FContabilizacion.pas' {Contabilizacion},
  FAutorizacion in 'FAutorizacion.pas' {Autorizacion},
  FLChequeoLotes in 'FLChequeoLotes.pas' {ChequeoLotes},
  FCambioFamiliaArticulo in 'FCambioFamiliaArticulo.pas' {CambiarFamiliaArticulo},
  FUsuarios in 'FUsuarios.pas' {Usuarios},
  BUsuarios in 'BUsuarios.pas' {BusquedaUsuarios},
  LUsuarios in 'LUsuarios.pas' {QRUsuarios: TQuickRep},
  FCorreo in 'FCorreo.pas' {Correo},
  BCorreos in 'BCorreos.pas' {BusquedaCorreos},
  FDescargarDatos in 'FDescargarDatos.pas' {DescargaDatos},
  FUnidadesMedida in 'FUnidadesMedida.pas' {UnidadesMedida},
  BUnidadesMedida in 'BUnidadesMedida.pas' {BusquedaUnidadesMedida},
  BEntradas in 'BEntradas.pas' {BusquedaEntradas},
  FArticulosClientes in 'FArticulosClientes.pas' {ArticulosClientes},
  LAlbaranSalida in 'LAlbaranSalida.pas' {QRAlbaranSalida: TQuickRep},
  LEntradasFecha in 'LEntradasFecha.pas' {QREntradasFecha: TQuickRep},
  LEntradasCliente in 'LEntradasCliente.pas' {QREntradasCliente: TQuickRep},
  LSalidasCliente in 'LSalidasCliente.pas' {QRSalidasCliente: TQuickRep},
  LSalidasFecha in 'LSalidasFecha.pas' {QRSalidasFecha: TQuickRep},
  LMovimientosLote in 'LMovimientosLote.pas' {QRMovimientosLote: TQuickRep},
  LRMovimientosLotesEx in 'LRMovimientosLotesEx.pas' {QRMovimientosLotesEx: TQuickRep},
  LMovimientosCliente in 'LMovimientosCliente.pas' {QRMovimientosCliente: TQuickRep};

{$R *.res}
begin
     Application.Initialize;

     //Pedimos el password para conectar a la base de datos
     with TFPassword.Create(Application) do //Construimos el Formulario Password
     try
        DMBaseDatos:=TDMBaseDatos.Create(Application); //Contruimos el Modulo de Datos Consultas de BD
        ShowModal;
     finally
            Free;
     end;

     //Si no esta conectada la base de datos salimos
     if Not DMBaseDatos.BDFrigo.Connected then
     begin
          DMBaseDatos.Free;
          Application.Terminate;
     end
     else
     begin
          Application.CreateForm(TPrincipal, Principal);
  Application.Run;
     end;     
end.
