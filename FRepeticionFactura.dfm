object RepetionFactura: TRepetionFactura
  Left = 382
  Top = 244
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Repetici'#243'n de Factura'
  ClientHeight = 463
  ClientWidth = 443
  Color = 15128264
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
    Top = 440
    Width = 443
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
    Width = 443
    Height = 402
    Align = alClient
    ParentColor = True
    TabOrder = 1
    object Panel2: TPanel
      Left = 1
      Top = 219
      Width = 441
      Height = 191
      ParentColor = True
      TabOrder = 1
      object Bevel1: TBevel
        Left = 48
        Top = 44
        Width = 361
        Height = 5
        Shape = bsBottomLine
      end
      object StaticText13: TStaticText
        Left = 46
        Top = 14
        Width = 48
        Height = 20
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object tNomCliente: TPanel
        Left = 103
        Top = 11
        Width = 314
        Height = 24
        Alignment = taLeftJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 1
      end
      object StaticText1: TStaticText
        Left = 46
        Top = 68
        Width = 90
        Height = 20
        Caption = 'Importe Neto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object StaticText2: TStaticText
        Left = 46
        Top = 96
        Width = 40
        Height = 20
        Caption = 'I.V.A.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object StaticText5: TStaticText
        Left = 46
        Top = 124
        Width = 96
        Height = 20
        Caption = 'Importe I.V.A.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object StaticText6: TStaticText
        Left = 46
        Top = 153
        Width = 96
        Height = 20
        Caption = 'Importe Bruto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
      object tImporteNeto: TPanel
        Left = 143
        Top = 64
        Width = 122
        Height = 24
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = True
        ParentFont = False
        TabOrder = 6
      end
      object tIva: TPanel
        Left = 143
        Top = 92
        Width = 122
        Height = 24
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = True
        ParentFont = False
        TabOrder = 7
      end
      object tImporteIva: TPanel
        Left = 143
        Top = 120
        Width = 122
        Height = 24
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = True
        ParentFont = False
        TabOrder = 8
      end
      object tImporteBruto: TPanel
        Left = 143
        Top = 148
        Width = 122
        Height = 24
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = True
        ParentFont = False
        TabOrder = 9
      end
    end
    object GroupBox2: TGroupBox
      Left = 17
      Top = 126
      Width = 405
      Height = 73
      Caption = 'Periodo de Facturaci'#243'n'
      Color = 15128264
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 2
      object StaticText3: TStaticText
        Left = 46
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
        Left = 234
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
        Left = 112
        Top = 32
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 2
        OnEnter = ActivarColorFoco
        OnExit = DesActivarColorFoco
        Width = 101
      end
      object cFechaHasta: TcxDateEdit
        Left = 288
        Top = 32
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 3
        OnEnter = ActivarColorFoco
        OnExit = DesActivarColorFoco
        Width = 97
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 441
      Height = 111
      Align = alTop
      ParentColor = True
      TabOrder = 0
      object StaticText12: TStaticText
        Left = 10
        Top = 15
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
        TabOrder = 3
      end
      object StaticText7: TStaticText
        Left = 10
        Top = 46
        Width = 63
        Height = 20
        AutoSize = False
        Caption = 'Factura'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object StaticText8: TStaticText
        Left = 10
        Top = 80
        Width = 94
        Height = 20
        Caption = 'Fecha Factura'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
      object cFechaFactura: TcxDateEdit
        Left = 117
        Top = 77
        ParentFont = False
        Properties.OnChange = cFechaFacturaChange
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 2
        OnEnter = ActivarColorFoco
        OnExit = DesActivarColorFoco
        Width = 101
      end
      object cFactura: TEdit
        Left = 116
        Top = 44
        Width = 58
        Height = 24
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        TabOrder = 1
        OnChange = cFacturaChange
        OnEnter = ActivarColorFoco
        OnExit = cFacturaExit
      end
      object cEmpresa: TEdit
        Left = 116
        Top = 12
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
        Left = 173
        Top = 12
        Width = 235
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 6
      end
      object cLupaEmpresas: TSimpleSearch
        Left = 147
        Top = 12
        Width = 24
        Height = 24
        TabOrder = 7
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
  end
  object QClientes: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select * from clientes')
    Left = 240
    Top = 24
  end
  object QPeriodicosFact: TQuery
    DatabaseName = 'BDFrigo'
    Left = 272
    Top = 24
  end
  object QCabeceraSalidas: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select * from cabecera_salidas')
    Left = 304
    Top = 24
  end
  object QLineaSalidas: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select * from linea_salidas')
    Left = 336
    Top = 24
  end
  object QCabeceraFacturas: TQuery
    DatabaseName = 'BDFrigo'
    RequestLive = True
    Left = 368
    Top = 24
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 408
    Top = 58
  end
  object QEmpresas: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select * from empresas')
    Left = 240
    Top = 56
  end
  object QTarifas: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select * from tarifas')
    Left = 240
    Top = 88
  end
  object QCabeceraEntradas: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select * from cabecera_entradas')
    Left = 272
    Top = 88
  end
  object QLineaEntradas: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select * from linea_entradas')
    Left = 304
    Top = 88
  end
  object QAux: TQuery
    DatabaseName = 'BDFrigo'
    Left = 408
    Top = 96
  end
  object QLineaFacturas: TQuery
    DatabaseName = 'BDFrigo'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM LINEA_FACTURAS')
    Left = 408
    Top = 24
    object QLineaFacturasempresa_lf: TStringField
      FieldName = 'empresa_lf'
      Origin = 'BDFRIGO.LINEA_FACTURAS.empresa_lf'
      FixedChar = True
      Size = 3
    end
    object QLineaFacturascliente_lf: TStringField
      FieldName = 'cliente_lf'
      Origin = 'BDFRIGO.LINEA_FACTURAS.cliente_lf'
      FixedChar = True
      Size = 4
    end
    object QLineaFacturasnumero_factura_lf: TIntegerField
      FieldName = 'numero_factura_lf'
      Origin = 'BDFRIGO.LINEA_FACTURAS.numero_factura_lf'
    end
    object QLineaFacturasfecha_factura_lf: TStringField
      FieldName = 'fecha_factura_lf'
      Origin = 'BDFRIGO.LINEA_FACTURAS.fecha_factura_lf'
      FixedChar = True
      Size = 10
    end
    object QLineaFacturasnumero_linea_lf: TIntegerField
      FieldName = 'numero_linea_lf'
      Origin = 'BDFRIGO.LINEA_FACTURAS.numero_linea_lf'
    end
    object QLineaFacturascodigo_lf: TStringField
      FieldName = 'codigo_lf'
      Origin = 'BDFRIGO.LINEA_FACTURAS.codigo_lf'
      FixedChar = True
    end
    object QLineaFacturasdescripcion_lf: TStringField
      FieldName = 'descripcion_lf'
      Origin = 'BDFRIGO.LINEA_FACTURAS.descripcion_lf'
      FixedChar = True
      Size = 50
    end
    object QLineaFacturascantidad_lf: TFloatField
      FieldName = 'cantidad_lf'
      Origin = 'BDFRIGO.LINEA_FACTURAS.cantidad_lf'
    end
    object QLineaFacturasunidad_lf: TStringField
      FieldName = 'unidad_lf'
      Origin = 'BDFRIGO.LINEA_FACTURAS.unidad_lf'
      FixedChar = True
      Size = 10
    end
    object QLineaFacturasprecio_lf: TFloatField
      FieldName = 'precio_lf'
      Origin = 'BDFRIGO.LINEA_FACTURAS.precio_lf'
    end
    object QLineaFacturastipo_lf: TStringField
      FieldName = 'tipo_lf'
      Origin = 'BDFRIGO.LINEA_FACTURAS.tipo_lf'
      FixedChar = True
      Size = 1
    end
    object QLineaFacturasimporte_lf: TFloatField
      FieldName = 'importe_lf'
      Origin = 'BDFRIGO.LINEA_FACTURAS.importe_lf'
    end
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
end
