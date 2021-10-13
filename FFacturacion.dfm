object Facturacion: TFacturacion
  Left = 569
  Top = 203
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Proceso de Facturaci'#243'n'
  ClientHeight = 465
  ClientWidth = 463
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object BarraEstado: TStatusBar
    Left = 0
    Top = 442
    Width = 463
    Height = 23
    Color = 15592941
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object PanelClaves: TPanel
    Left = 0
    Top = 38
    Width = 463
    Height = 404
    Align = alClient
    Color = 15128264
    ParentBackground = False
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 26
      Top = 158
      Width = 413
      Height = 73
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object StaticText1: TStaticText
        Left = 30
        Top = 35
        Width = 39
        Height = 20
        Caption = 'Desde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object StaticText2: TStaticText
        Left = 217
        Top = 35
        Width = 36
        Height = 20
        Caption = 'Hasta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object cClienteDesde: TEdit
        Left = 96
        Top = 32
        Width = 40
        Height = 24
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 4
        ParentFont = False
        TabOrder = 1
        Text = '0000'
        OnEnter = ActivarColorFoco
        OnExit = ColorExitRellenaCeros
      end
      object cClienteHasta: TEdit
        Left = 271
        Top = 32
        Width = 40
        Height = 24
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 4
        ParentFont = False
        TabOrder = 2
        Text = 'ZZZZ'
        OnEnter = ActivarColorFoco
        OnExit = ColorExitRellenaCeros
      end
    end
    object GroupBox2: TGroupBox
      Left = 26
      Top = 234
      Width = 413
      Height = 73
      Caption = 'Fecha de Movimiento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object StaticText3: TStaticText
        Left = 30
        Top = 35
        Width = 39
        Height = 20
        Caption = 'Desde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object StaticText4: TStaticText
        Left = 217
        Top = 35
        Width = 36
        Height = 20
        Caption = 'Hasta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object cFechaDesde: TcxDateEdit
        Left = 96
        Top = 32
        ParentFont = False
        TabOrder = 2
        OnEnter = ActivarColorFoco
        OnExit = DesActivarColorFoco
        Width = 101
      end
      object cFechaHasta: TcxDateEdit
        Left = 271
        Top = 32
        ParentFont = False
        TabOrder = 3
        OnEnter = ActivarColorFoco
        OnExit = DesActivarColorFoco
        Width = 98
      end
    end
    object Panel1: TPanel
      Left = 26
      Top = 24
      Width = 413
      Height = 128
      ParentColor = True
      TabOrder = 0
      object StaticText12: TStaticText
        Left = 50
        Top = 28
        Width = 66
        Height = 20
        AutoSize = False
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object cEmpresa: TEdit
        Left = 116
        Top = 25
        Width = 30
        Height = 24
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 0
        OnChange = cEmpresaChange
        OnEnter = ActivarColorFoco
        OnExit = ColorExitRellenaCeros
        OnKeyDown = cEmpresaKeyDown
      end
      object tNomEmpresa: TPanel
        Left = 172
        Top = 25
        Width = 195
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 2
      end
      object StaticText7: TStaticText
        Left = 50
        Top = 84
        Width = 171
        Height = 20
        AutoSize = False
        Caption = 'Periodo de Facturaci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object cPeriodo: TComboBox
        Left = 238
        Top = 79
        Width = 130
        Height = 24
        AutoComplete = False
        AutoDropDown = True
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 4
        OnEnter = ActivarColorFoco
        OnExit = DesActivarColorFoco
        OnKeyDown = SinFlechasKeyDown
        OnKeyPress = cPeriodoKeyPress
        OnKeyUp = cPeriodoKeyUp
        Items.Strings = (
          'DIARIA'
          'SEMANAL'
          'QUINCENAL'
          'MENSUAL')
      end
      object cLupaEmpresas: TSimpleSearch
        Left = 147
        Top = 25
        Width = 24
        Height = 24
        TabOrder = 5
        TabStop = False
        OnClick = cLupaEmpresasClick
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'MoneyTwins'
        OptionsImage.ImageIndex = 2
        OptionsImage.Images = FDM.ilxImagenes
        Titulo = 'Busqueda de Empresa'
        Campos = <
          item
            Etiqueta = 'Empresa'
            Campo = 'empresa_emp'
            Ancho = 100
            Tipo = ctCadena
          end
          item
            Etiqueta = 'Descripci'#243'n'
            Campo = 'nombre_emp'
            Ancho = 400
            Tipo = ctCadena
          end>
        Database = 'BDProyecto'
        Tecla = 'F2'
        Concatenar = False
      end
    end
    object GroupBox3: TGroupBox
      Left = 27
      Top = 312
      Width = 413
      Height = 73
      Caption = 'Facturaci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object StaticText5: TStaticText
        Left = 30
        Top = 32
        Width = 38
        Height = 20
        Caption = 'Fecha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object cFechaFactura: TcxDateEdit
        Left = 96
        Top = 29
        ParentFont = False
        TabOrder = 2
        OnEnter = ActivarColorFoco
        OnExit = DesActivarColorFoco
        Width = 98
      end
      object StaticText6: TStaticText
        Left = 222
        Top = 32
        Width = 29
        Height = 20
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object cTipoFacturacion: TComboBox
        Left = 271
        Top = 29
        Width = 130
        Height = 24
        AutoComplete = False
        AutoDropDown = True
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 3
        Text = 'INFORMATIVA'
        OnEnter = ActivarColorFoco
        OnExit = DesActivarColorFoco
        OnKeyDown = SinFlechasKeyDown
        OnKeyPress = cTipoFacturacionKeyPress
        Items.Strings = (
          'INFORMATIVA'
          'DEFINITIVA')
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 408
    Top = 58
  end
  object QClientes: TQuery
    DatabaseName = 'BDFrigo'
    RequestLive = True
    SQL.Strings = (
      'select * from clientes')
    Left = 8
    Top = 40
    object QClientesempresa_c: TStringField
      FieldName = 'empresa_c'
      Origin = 'BDFRIGO.clientes.empresa_c'
      FixedChar = True
      Size = 3
    end
    object QClientescodigo_c: TStringField
      FieldName = 'codigo_c'
      Origin = 'BDFRIGO.clientes.codigo_c'
      FixedChar = True
      Size = 4
    end
    object QClientesnombre_juridico_c: TStringField
      FieldName = 'nombre_juridico_c'
      Origin = 'BDFRIGO.clientes.nombre_juridico_c'
      FixedChar = True
      Size = 30
    end
    object QClientesnombre_comercial_c: TStringField
      FieldName = 'nombre_comercial_c'
      Origin = 'BDFRIGO.clientes.nombre_comercial_c'
      FixedChar = True
      Size = 30
    end
    object QClientesdomicilio_c: TStringField
      FieldName = 'domicilio_c'
      Origin = 'BDFRIGO.clientes.domicilio_c'
      FixedChar = True
      Size = 30
    end
    object QClientescp_c: TStringField
      FieldName = 'cp_c'
      Origin = 'BDFRIGO.clientes.cp_c'
      FixedChar = True
      Size = 10
    end
    object QClientespoblacion_c: TStringField
      FieldName = 'poblacion_c'
      Origin = 'BDFRIGO.clientes.poblacion_c'
      FixedChar = True
      Size = 25
    end
    object QClientesdomicilio_correo_c: TStringField
      FieldName = 'domicilio_correo_c'
      Origin = 'BDFRIGO.clientes.domicilio_correo_c'
      FixedChar = True
      Size = 30
    end
    object QClientescp_correo_c: TStringField
      FieldName = 'cp_correo_c'
      Origin = 'BDFRIGO.clientes.cp_correo_c'
      FixedChar = True
      Size = 10
    end
    object QClientespoblacion_correo_c: TStringField
      FieldName = 'poblacion_correo_c'
      Origin = 'BDFRIGO.clientes.poblacion_correo_c'
      FixedChar = True
      Size = 25
    end
    object QClientestelefono1_c: TStringField
      FieldName = 'telefono1_c'
      Origin = 'BDFRIGO.clientes.telefono1_c'
      FixedChar = True
      Size = 15
    end
    object QClientestelefono2_c: TStringField
      FieldName = 'telefono2_c'
      Origin = 'BDFRIGO.clientes.telefono2_c'
      FixedChar = True
      Size = 15
    end
    object QClientesfax_c: TStringField
      FieldName = 'fax_c'
      Origin = 'BDFRIGO.clientes.fax_c'
      FixedChar = True
      Size = 15
    end
    object QClientescif_dni_c: TStringField
      FieldName = 'cif_dni_c'
      Origin = 'BDFRIGO.clientes.cif_dni_c'
      FixedChar = True
      Size = 15
    end
    object QClientesorigen_c: TStringField
      FieldName = 'origen_c'
      Origin = 'BDFRIGO.clientes.origen_c'
      FixedChar = True
      Size = 1
    end
    object QClientesimp_alquiler_oficina_c: TFloatField
      FieldName = 'imp_alquiler_oficina_c'
      Origin = 'BDFRIGO.clientes.imp_alquiler_oficina_c'
    end
    object QClientesimp_thermoking_c: TFloatField
      FieldName = 'imp_thermoking_c'
      Origin = 'BDFRIGO.clientes.imp_thermoking_c'
    end
    object QClientesprecio_kw_thermo_c: TFloatField
      FieldName = 'precio_kw_thermo_c'
      Origin = 'BDFRIGO.clientes.precio_kw_thermo_c'
    end
    object QClientesimp_cargo_fijo_c: TFloatField
      FieldName = 'imp_cargo_fijo_c'
      Origin = 'BDFRIGO.clientes.imp_cargo_fijo_c'
    end
    object QClientesprecio_horas_ent_sal_c: TFloatField
      FieldName = 'precio_horas_ent_sal_c'
      Origin = 'BDFRIGO.clientes.precio_horas_ent_sal_c'
    end
    object QClientesimp_minimo_facturacion_c: TFloatField
      FieldName = 'imp_minimo_facturacion_c'
      Origin = 'BDFRIGO.clientes.imp_minimo_facturacion_c'
    end
    object QClientesperiodo_factura_c: TStringField
      FieldName = 'periodo_factura_c'
      Origin = 'BDFRIGO.clientes.periodo_factura_c'
      FixedChar = True
      Size = 1
    end
    object QClientestarifa_c: TStringField
      FieldName = 'tarifa_c'
      Origin = 'BDFRIGO.clientes.tarifa_c'
      FixedChar = True
      Size = 2
    end
    object QClientesm3_facturacion_c: TIntegerField
      FieldName = 'm3_facturacion_c'
      Origin = 'BDFRIGO.clientes.m3_facturacion_c'
    end
    object QClientesm3_refrigeracion_c: TIntegerField
      FieldName = 'm3_refrigeracion_c'
      Origin = 'BDFRIGO.clientes.m3_refrigeracion_c'
    end
    object QClientesdias_pago_c: TSmallintField
      FieldName = 'dias_pago_c'
      Origin = 'BDFRIGO.clientes.dias_pago_c'
    end
    object QClientesforma_pago_c: TStringField
      FieldName = 'forma_pago_c'
      Origin = 'BDFRIGO.clientes.forma_pago_c'
      FixedChar = True
      Size = 25
    end
    object QClientescuenta_cliente_c: TStringField
      FieldName = 'cuenta_cliente_c'
      Origin = 'BDFRIGO.clientes.cuenta_cliente_c'
      FixedChar = True
    end
    object QClientesnombre_banco_c: TStringField
      FieldName = 'nombre_banco_c'
      Origin = 'BDFRIGO.clientes.nombre_banco_c'
      FixedChar = True
      Size = 30
    end
    object QClientesdomicilio_banco_c: TStringField
      FieldName = 'domicilio_banco_c'
      Origin = 'BDFRIGO.clientes.domicilio_banco_c'
      FixedChar = True
      Size = 30
    end
    object QClientescp_banco_c: TStringField
      FieldName = 'cp_banco_c'
      Origin = 'BDFRIGO.clientes.cp_banco_c'
      FixedChar = True
      Size = 10
    end
    object QClientespoblacion_banco_c: TStringField
      FieldName = 'poblacion_banco_c'
      Origin = 'BDFRIGO.clientes.poblacion_banco_c'
      FixedChar = True
      Size = 25
    end
    object QClientesultimo_stock_c: TFloatField
      FieldName = 'ultimo_stock_c'
      Origin = 'BDFRIGO.clientes.ultimo_stock_c'
    end
    object QClientesnumerador_lotes_c: TIntegerField
      FieldName = 'numerador_lotes_c'
      Origin = 'BDFRIGO.clientes.numerador_lotes_c'
    end
    object QClientesnom_autorizado1_c: TStringField
      FieldName = 'nom_autorizado1_c'
      Origin = 'BDFRIGO.clientes.nom_autorizado1_c'
      FixedChar = True
      Size = 30
    end
    object QClientescif_autorizado1_c: TStringField
      FieldName = 'cif_autorizado1_c'
      Origin = 'BDFRIGO.clientes.cif_autorizado1_c'
      FixedChar = True
      Size = 15
    end
    object QClientesfecha_autorizado1_c: TStringField
      FieldName = 'fecha_autorizado1_c'
      Origin = 'BDFRIGO.clientes.fecha_autorizado1_c'
      FixedChar = True
      Size = 10
    end
    object QClientesnom_autorizado2_c: TStringField
      FieldName = 'nom_autorizado2_c'
      Origin = 'BDFRIGO.clientes.nom_autorizado2_c'
      FixedChar = True
      Size = 30
    end
    object QClientescif_autorizado2_c: TStringField
      FieldName = 'cif_autorizado2_c'
      Origin = 'BDFRIGO.clientes.cif_autorizado2_c'
      FixedChar = True
      Size = 15
    end
    object QClientesfecha_autorizado2_c: TStringField
      FieldName = 'fecha_autorizado2_c'
      Origin = 'BDFRIGO.clientes.fecha_autorizado2_c'
      FixedChar = True
      Size = 10
    end
    object QClientescomentario_c: TStringField
      FieldName = 'comentario_c'
      Origin = 'BDFRIGO.clientes.comentario_c'
      FixedChar = True
      Size = 40
    end
    object QClientesvalor_stock_c: TFloatField
      FieldName = 'valor_stock_c'
      Origin = 'BDFRIGO.clientes.valor_stock_c'
    end
    object QClientesimp_pendiente_pago_c: TFloatField
      FieldName = 'imp_pendiente_pago_c'
      Origin = 'BDFRIGO.clientes.imp_pendiente_pago_c'
    end
    object QClientesmercancia_retenida_c: TStringField
      FieldName = 'mercancia_retenida_c'
      Origin = 'BDFRIGO.clientes.mercancia_retenida_c'
      FixedChar = True
      Size = 1
    end
    object QClientestlfmovil_c: TStringField
      FieldName = 'tlfmovil_c'
      Origin = 'BDFRIGO.clientes.tlfmovil_c'
      FixedChar = True
      Size = 15
    end
    object QClientesemail_c: TStringField
      FieldName = 'email_c'
      Origin = 'BDFRIGO.clientes.email_c'
      FixedChar = True
      Size = 40
    end
    object QClientesweb_c: TStringField
      FieldName = 'web_c'
      Origin = 'BDFRIGO.clientes.web_c'
      FixedChar = True
      Size = 40
    end
    object QClientesprecio_hor_clima_c: TFloatField
      FieldName = 'precio_hor_clima_c'
      Origin = 'BDFRIGO.clientes.precio_hor_clima_c'
    end
    object QClientescuenta_contable_c: TStringField
      FieldName = 'cuenta_contable_c'
      Origin = 'BDFRIGO.clientes.cuenta_contable_c'
      FixedChar = True
      Size = 10
    end
    object QClientescodigo_pago_c: TStringField
      FieldName = 'codigo_pago_c'
      Origin = 'BDFRIGO.clientes.codigo_pago_c'
      FixedChar = True
      Size = 2
    end
    object QClientesnotas_c: TMemoField
      FieldName = 'notas_c'
      Origin = 'BDFRIGO.clientes.notas_c'
      BlobType = ftMemo
      Size = 1
    end
    object QClientesultimo_stock_pal_c: TFloatField
      FieldName = 'ultimo_stock_pal_c'
      Origin = 'BDFRIGO.clientes.ultimo_stock_pal_c'
    end
    object QClientesretencion_c: TFloatField
      FieldName = 'retencion_c'
      Origin = 'BDFRIGO.clientes.retencion_c'
    end
    object QClientesprecio_mvto_lote_c: TCurrencyField
      FieldName = 'precio_mvto_lote_c'
      Origin = 'BDFRIGO.clientes.precio_mvto_lote_c'
    end
  end
  object QEmpresas: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select * from empresas')
    Left = 8
    Top = 72
  end
  object QTarifas: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select * from tarifas')
    Left = 8
    Top = 104
    object QTarifasempresa_t: TStringField
      FieldName = 'empresa_t'
      Origin = 'BDFRIGO.tarifas.empresa_t'
      FixedChar = True
      Size = 3
    end
    object QTarifascodigo_t: TStringField
      FieldName = 'codigo_t'
      Origin = 'BDFRIGO.tarifas.codigo_t'
      FixedChar = True
      Size = 2
    end
    object QTarifasprecio_congelacion_m3_t: TFloatField
      FieldName = 'precio_congelacion_m3_t'
      Origin = 'BDFRIGO.tarifas.precio_congelacion_m3_t'
    end
    object QTarifasprecio_congelacion_kg_t: TFloatField
      FieldName = 'precio_congelacion_kg_t'
      Origin = 'BDFRIGO.tarifas.precio_congelacion_kg_t'
    end
    object QTarifasprecio_refrigera_m3_t: TFloatField
      FieldName = 'precio_refrigera_m3_t'
      Origin = 'BDFRIGO.tarifas.precio_refrigera_m3_t'
    end
    object QTarifastipo0_t: TFloatField
      FieldName = 'tipo0_t'
      Origin = 'BDFRIGO.tarifas.tipo0_t'
    end
    object QTarifastipo1_t: TFloatField
      FieldName = 'tipo1_t'
      Origin = 'BDFRIGO.tarifas.tipo1_t'
    end
    object QTarifastipo2_t: TFloatField
      FieldName = 'tipo2_t'
      Origin = 'BDFRIGO.tarifas.tipo2_t'
    end
    object QTarifastipo3_t: TFloatField
      FieldName = 'tipo3_t'
      Origin = 'BDFRIGO.tarifas.tipo3_t'
    end
    object QTarifastipo4_t: TFloatField
      FieldName = 'tipo4_t'
      Origin = 'BDFRIGO.tarifas.tipo4_t'
    end
    object QTarifasprecio_hora1_t: TFloatField
      FieldName = 'precio_hora1_t'
      Origin = 'BDFRIGO.tarifas.precio_hora1_t'
    end
    object QTarifasprecio_hora2_t: TFloatField
      FieldName = 'precio_hora2_t'
      Origin = 'BDFRIGO.tarifas.precio_hora2_t'
    end
    object QTarifasfrio_palet_t: TFloatField
      FieldName = 'frio_palet_t'
      Origin = 'BDFRIGO.tarifas.frio_palet_t'
    end
    object QTarifasmanejo_palet_t: TFloatField
      FieldName = 'manejo_palet_t'
      Origin = 'BDFRIGO.tarifas.manejo_palet_t'
    end
  end
  object QPeriodicosFact: TQuery
    DatabaseName = 'BDFrigo'
    Left = 40
    Top = 40
  end
  object QCabeceraEntradas: TQuery
    DatabaseName = 'BDFrigo'
    RequestLive = True
    SQL.Strings = (
      'select * from cabecera_entradas')
    Left = 40
    Top = 104
  end
  object QAux: TQuery
    DatabaseName = 'BDFrigo'
    Left = 8
    Top = 160
  end
  object QLineaEntradas: TQuery
    DatabaseName = 'BDFrigo'
    RequestLive = True
    SQL.Strings = (
      'select * from linea_entradas')
    Left = 72
    Top = 104
  end
  object QCabeceraSalidas: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select * from cabecera_salidas')
    Left = 72
    Top = 40
  end
  object QLineaSalidas: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select * from linea_salidas')
    Left = 104
    Top = 40
  end
  object QCabeceraFacturas: TQuery
    DatabaseName = 'BDFrigo'
    RequestLive = True
    SQL.Strings = (
      'select * from cabecera_facturas')
    Left = 160
    Top = 40
    object QCabeceraFacturasempresa_cf: TStringField
      FieldName = 'empresa_cf'
      Origin = 'BDFRIGO.cabecera_facturas.empresa_cf'
      FixedChar = True
      Size = 3
    end
    object QCabeceraFacturascliente_cf: TStringField
      FieldName = 'cliente_cf'
      Origin = 'BDFRIGO.cabecera_facturas.cliente_cf'
      FixedChar = True
      Size = 4
    end
    object QCabeceraFacturasnumero_factura_cf: TIntegerField
      FieldName = 'numero_factura_cf'
      Origin = 'BDFRIGO.cabecera_facturas.numero_factura_cf'
    end
    object QCabeceraFacturasfecha_factura_cf: TStringField
      FieldName = 'fecha_factura_cf'
      Origin = 'BDFRIGO.cabecera_facturas.fecha_factura_cf'
      FixedChar = True
      Size = 10
    end
    object QCabeceraFacturasfecha_vencimiento_cf: TStringField
      FieldName = 'fecha_vencimiento_cf'
      Origin = 'BDFRIGO.cabecera_facturas.fecha_vencimiento_cf'
      FixedChar = True
      Size = 10
    end
    object QCabeceraFacturasfecha_desde_cf: TStringField
      FieldName = 'fecha_desde_cf'
      Origin = 'BDFRIGO.cabecera_facturas.fecha_desde_cf'
      FixedChar = True
      Size = 10
    end
    object QCabeceraFacturasfecha_hasta_cf: TStringField
      FieldName = 'fecha_hasta_cf'
      Origin = 'BDFRIGO.cabecera_facturas.fecha_hasta_cf'
      FixedChar = True
      Size = 10
    end
    object QCabeceraFacturasimporte_bruto_cf: TFloatField
      FieldName = 'importe_bruto_cf'
      Origin = 'BDFRIGO.cabecera_facturas.importe_bruto_cf'
    end
    object QCabeceraFacturasporcentaje_iva_cf: TFloatField
      FieldName = 'porcentaje_iva_cf'
      Origin = 'BDFRIGO.cabecera_facturas.porcentaje_iva_cf'
    end
    object QCabeceraFacturasimporte_iva_cf: TFloatField
      FieldName = 'importe_iva_cf'
      Origin = 'BDFRIGO.cabecera_facturas.importe_iva_cf'
    end
    object QCabeceraFacturasimporte_neto_cf: TFloatField
      FieldName = 'importe_neto_cf'
      Origin = 'BDFRIGO.cabecera_facturas.importe_neto_cf'
    end
    object QCabeceraFacturastipo_cf: TStringField
      FieldName = 'tipo_cf'
      Origin = 'BDFRIGO.cabecera_facturas.tipo_cf'
      FixedChar = True
      Size = 1
    end
    object QCabeceraFacturasnum_contabilizacion_cf: TIntegerField
      FieldName = 'num_contabilizacion_cf'
      Origin = 'BDFRIGO.cabecera_facturas.num_contabilizacion_cf'
    end
    object QCabeceraFacturasultimo_stock_cf: TFloatField
      FieldName = 'ultimo_stock_cf'
      Origin = 'BDFRIGO.cabecera_facturas.ultimo_stock_cf'
    end
    object QCabeceraFacturasfecha_contabilizacion_cf: TStringField
      FieldName = 'fecha_contabilizacion_cf'
      Origin = 'BDFRIGO.cabecera_facturas.fecha_contabilizacion_cf'
      FixedChar = True
      Size = 10
    end
    object QCabeceraFacturasporcentaje_retencion_cf: TFloatField
      FieldName = 'porcentaje_retencion_cf'
      Origin = 'BDFRIGO.cabecera_facturas.porcentaje_retencion_cf'
    end
    object QCabeceraFacturasimporte_retencion_cf: TFloatField
      FieldName = 'importe_retencion_cf'
      Origin = 'BDFRIGO.cabecera_facturas.importe_retencion_cf'
    end
  end
  object QLineaFacturas: TQuery
    DatabaseName = 'BDFrigo'
    RequestLive = True
    SQL.Strings = (
      'select * from linea_facturas')
    Left = 192
    Top = 40
  end
  object dxBarManager1: TdxBarManager
    AutoDockColor = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockColor = 12819851
    ImageOptions.LargeImages = DMBaseDatos.ImagenesNew
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Blue'
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 376
    Top = 59
    DockControlHeights = (
      0
      0
      38
      0)
    object dxBarManager1Bar1: TdxBar
      AllowQuickCustomizing = False
      BorderStyle = bbsNone
      Caption = 'Principal'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 599
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bAceptar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bSalir'
        end>
      OneOnRow = True
      RotateWhenVertical = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object bAceptar: TdxBarLargeButton
      Caption = 'Aceptar'
      Category = 0
      Hint = 'Aceptar (F5)'
      Visible = ivAlways
      LargeImageIndex = 6
      OnClick = Aceptar
      AutoGrayScale = False
    end
    object bSalir: TdxBarLargeButton
      Caption = 'Salir'
      Category = 0
      Hint = 'Salir'
      Visible = ivAlways
      LargeImageIndex = 10
      OnClick = Salir
      AutoGrayScale = False
    end
  end
  object qMovimientosExtra: TQuery
    DatabaseName = 'BDFrigo'
    Left = 40
    Top = 72
  end
  object QMovimientosEnt: TQuery
    DatabaseName = 'BDFrigo'
    Left = 72
    Top = 72
  end
  object QMovimientosSal: TQuery
    DatabaseName = 'BDFrigo'
    Left = 104
    Top = 72
  end
  object QConsumosElectricos: TQuery
    DatabaseName = 'BDFrigo'
    Left = 104
    Top = 104
  end
  object QConsumoFacturas: TQuery
    DatabaseName = 'BDFrigo'
    RequestLive = True
    SQL.Strings = (
      'select * from consumo_electrico_facturas')
    Left = 224
    Top = 40
  end
end
