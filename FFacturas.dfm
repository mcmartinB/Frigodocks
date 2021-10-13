object Facturas: TFacturas
  Left = 251
  Top = 321
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Mantenimiento de Facturas'
  ClientHeight = 414
  ClientWidth = 648
  Color = 16776176
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
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object BarraEstado: TStatusBar
    Left = 0
    Top = 391
    Width = 648
    Height = 23
    Color = 15395562
    Panels = <
      item
        Width = 450
      end
      item
        Width = 50
      end>
  end
  object PanelDatos: TPanel
    Left = 0
    Top = 169
    Width = 648
    Height = 222
    Align = alClient
    Color = 15128264
    ParentBackground = False
    TabOrder = 1
    OnEnter = PanelDatosEnter
    object GBoxUnidades: TGroupBox
      Left = 13
      Top = 19
      Width = 250
      Height = 176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object StaticText8: TStaticText
        Left = 17
        Top = 110
        Width = 82
        Height = 20
        Caption = 'Total Importe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object StaticText9: TStaticText
        Left = 17
        Top = 55
        Width = 24
        Height = 20
        Caption = 'IVA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object StaticText10: TStaticText
        Left = 17
        Top = 82
        Width = 73
        Height = 20
        Caption = 'Importe IVA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object StaticText15: TStaticText
        Left = 17
        Top = 26
        Width = 79
        Height = 20
        Caption = 'Importe Neto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object StaticText14: TStaticText
        Left = 17
        Top = 138
        Width = 74
        Height = 20
        Caption = 'Vencimiento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object cImporteTotal: TcxDBTextEdit
        Left = 128
        Top = 106
        DataBinding.DataField = 'importe_bruto_cf'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.ReadOnly = True
        Style.Color = 15128264
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        StyleDisabled.Color = clWindow
        TabOrder = 3
        Width = 100
      end
      object cIva: TcxDBTextEdit
        Left = 128
        Top = 51
        DataBinding.DataField = 'porcentaje_iva_cf'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.ReadOnly = True
        Properties.OnChange = cIvaChange
        Style.Color = 15128264
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        StyleDisabled.Color = clWindow
        TabOrder = 1
        Width = 36
      end
      object cImporteIva: TcxDBTextEdit
        Left = 128
        Top = 79
        DataBinding.DataField = 'importe_iva_cf'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.ReadOnly = True
        Style.Color = 15128264
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        StyleDisabled.Color = clWindow
        TabOrder = 2
        Width = 100
      end
      object cImporteNeto: TcxDBTextEdit
        Left = 128
        Top = 23
        DataBinding.DataField = 'importe_neto_cf'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.ReadOnly = True
        Properties.OnChange = cImporteNetoChange
        Style.Color = 15128264
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        StyleDisabled.Color = clWindow
        TabOrder = 0
        Width = 100
      end
      object cFechaVencimiento: TcxDateEdit
        Left = 128
        Top = 133
        AutoSize = False
        ParentFont = False
        Properties.OnChange = cFechaVencimientoChange
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 9
        Height = 21
        Width = 102
      end
    end
    object GroupBox1: TGroupBox
      Left = 275
      Top = 19
      Width = 197
      Height = 176
      Caption = 'Contabilizaci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object StaticText3: TStaticText
        Left = 17
        Top = 49
        Width = 49
        Height = 20
        Caption = 'N'#250'mero'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object cNumContabilizacion: TcxDBTextEdit
        Left = 84
        Top = 47
        DataBinding.DataField = 'num_contabilizacion_cf'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 1
        Width = 100
      end
      object StaticText4: TStaticText
        Left = 17
        Top = 107
        Width = 38
        Height = 20
        Caption = 'Fecha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object cFechaConta: TcxDateEdit
        Left = 87
        Top = 101
        AutoSize = False
        ParentFont = False
        Properties.OnChange = cFechaContaChange
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 3
        Height = 21
        Width = 98
      end
    end
  end
  object PanelClaves: TPanel
    Left = 0
    Top = 38
    Width = 648
    Height = 131
    Align = alTop
    Color = 15395562
    ParentBackground = False
    TabOrder = 6
    object StaticText12: TStaticText
      Left = 26
      Top = 11
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
      Left = 105
      Top = 8
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
      OnEnter = ColorEnter
      OnExit = ColorExit
      OnKeyDown = cEmpresaKeyDown
    end
    object tNomEmpresa: TPanel
      Left = 161
      Top = 8
      Width = 257
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
    object StaticText13: TStaticText
      Left = 26
      Top = 40
      Width = 48
      Height = 20
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object cCliente: TEdit
      Left = 105
      Top = 37
      Width = 36
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 4
      ParentFont = False
      TabOrder = 4
      OnChange = cClienteChange
      OnEnter = ColorEnter
      OnExit = ColorExit
      OnKeyDown = cClienteKeyDown
    end
    object tNomcliente: TPanel
      Left = 167
      Top = 37
      Width = 252
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 5
    end
    object StaticText1: TStaticText
      Left = 26
      Top = 69
      Width = 72
      Height = 20
      Caption = 'N'#186' Factura'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    object cNumFactura: TEdit
      Left = 105
      Top = 66
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
      TabOrder = 7
      OnEnter = ColorEnter
      OnExit = ColorExitSinCeros
    end
    object StaticText2: TStaticText
      Left = 26
      Top = 99
      Width = 41
      Height = 20
      Caption = 'Fecha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
    end
    object cFechaFactura: TcxDateEdit
      Left = 105
      Top = 96
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 9
      OnExit = cFechaFacturaExit
      Height = 21
      Width = 112
    end
    object cLupaEmpresas: TSimpleSearch
      Left = 135
      Top = 8
      Width = 24
      Height = 24
      TabOrder = 10
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
    object cLupaClilentes: TSimpleSearch
      Left = 141
      Top = 37
      Width = 24
      Height = 24
      TabOrder = 11
      TabStop = False
      OnClick = cLupaClientesClick
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'MoneyTwins'
      OptionsImage.ImageIndex = 2
      OptionsImage.Images = FDM.ilxImagenes
      Titulo = 'Busqueda de Cliente'
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
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 349
    Top = 98
  end
  object QMaestro: TQuery
    AfterInsert = QMaestroAfterInsert
    BeforeEdit = AntesModificar
    BeforePost = QMaestroBeforePost
    DatabaseName = 'BDFrigo'
    RequestLive = True
    SQL.Strings = (
      'select * from cabecera_facturas')
    Left = 229
    Top = 97
    object QMaestroempresa_cf: TStringField
      FieldName = 'empresa_cf'
      Origin = 'BDFRIGO.cabecera_facturas.empresa_cf'
      FixedChar = True
      Size = 3
    end
    object QMaestrocliente_cf: TStringField
      FieldName = 'cliente_cf'
      Origin = 'BDFRIGO.cabecera_facturas.cliente_cf'
      FixedChar = True
      Size = 4
    end
    object QMaestronumero_factura_cf: TIntegerField
      FieldName = 'numero_factura_cf'
      Origin = 'BDFRIGO.cabecera_facturas.numero_factura_cf'
    end
    object QMaestrofecha_factura_cf: TStringField
      FieldName = 'fecha_factura_cf'
      Origin = 'BDFRIGO.cabecera_facturas.fecha_factura_cf'
      FixedChar = True
      Size = 10
    end
    object QMaestrofecha_vencimiento_cf: TStringField
      FieldName = 'fecha_vencimiento_cf'
      Origin = 'BDFRIGO.cabecera_facturas.fecha_vencimiento_cf'
      FixedChar = True
      Size = 10
    end
    object QMaestrofecha_desde_cf: TStringField
      FieldName = 'fecha_desde_cf'
      Origin = 'BDFRIGO.cabecera_facturas.fecha_desde_cf'
      FixedChar = True
      Size = 10
    end
    object QMaestrofecha_hasta_cf: TStringField
      FieldName = 'fecha_hasta_cf'
      Origin = 'BDFRIGO.cabecera_facturas.fecha_hasta_cf'
      FixedChar = True
      Size = 10
    end
    object QMaestroimporte_bruto_cf: TFloatField
      FieldName = 'importe_bruto_cf'
      Origin = 'BDFRIGO.cabecera_facturas.importe_bruto_cf'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object QMaestroporcentaje_iva_cf: TFloatField
      FieldName = 'porcentaje_iva_cf'
      Origin = 'BDFRIGO.cabecera_facturas.porcentaje_iva_cf'
    end
    object QMaestroimporte_iva_cf: TFloatField
      FieldName = 'importe_iva_cf'
      Origin = 'BDFRIGO.cabecera_facturas.importe_iva_cf'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object QMaestroimporte_neto_cf: TFloatField
      FieldName = 'importe_neto_cf'
      Origin = 'BDFRIGO.cabecera_facturas.importe_neto_cf'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object QMaestrotipo_cf: TStringField
      FieldName = 'tipo_cf'
      Origin = 'BDFRIGO.cabecera_facturas.tipo_cf'
      FixedChar = True
      Size = 1
    end
    object QMaestronum_contabilizacion_cf: TIntegerField
      FieldName = 'num_contabilizacion_cf'
      Origin = 'BDFRIGO.cabecera_facturas.num_contabilizacion_cf'
    end
    object QMaestroultimo_stock_cf: TFloatField
      FieldName = 'ultimo_stock_cf'
      Origin = 'BDFRIGO.cabecera_facturas.ultimo_stock_cf'
    end
    object QMaestrofecha_contabilizacion_cf: TStringField
      FieldName = 'fecha_contabilizacion_cf'
      Origin = 'BDFRIGO.cabecera_facturas.fecha_contabilizacion_cf'
      FixedChar = True
      Size = 10
    end
  end
  object DSMaestro: TDataSource
    DataSet = QMaestro
    OnStateChange = DSMaestroStateChange
    Left = 261
    Top = 97
  end
  object QContar: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select count(*) from facturas')
    Left = 309
    Top = 97
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
    Left = 528
    Top = 40
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
          ItemName = 'bAlta'
        end
        item
          Visible = True
          ItemName = 'bBorrar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bPrimero'
        end
        item
          Visible = True
          ItemName = 'bAnterior'
        end
        item
          Visible = True
          ItemName = 'bSiguiente'
        end
        item
          Visible = True
          ItemName = 'bUltimo'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bImprimir'
        end
        item
          Visible = True
          ItemName = 'bBusqueda'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bAceptar'
        end
        item
          Visible = True
          ItemName = 'bCancelar'
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
    object bPrimero: TdxBarLargeButton
      Caption = 'Primero'
      Category = 0
      Enabled = False
      Hint = 'Primer Registro'
      Visible = ivAlways
      LargeImageIndex = 2
      OnClick = Primero
      AutoGrayScale = False
    end
    object bAnterior: TdxBarLargeButton
      Caption = 'Anterior'
      Category = 0
      Enabled = False
      Hint = 'Anterior Registro'
      Visible = ivAlways
      LargeImageIndex = 3
      OnClick = Anterior
      AutoGrayScale = False
    end
    object bSiguiente: TdxBarLargeButton
      Caption = 'Siguiente'
      Category = 0
      Enabled = False
      Hint = 'Siguiente Registro'
      Visible = ivAlways
      LargeImageIndex = 4
      OnClick = Siguiente
      AutoGrayScale = False
    end
    object bUltimo: TdxBarLargeButton
      Caption = 'Ultimo'
      Category = 0
      Enabled = False
      Hint = 'Ultimo Registro'
      Visible = ivAlways
      LargeImageIndex = 5
      OnClick = Ultimo
      AutoGrayScale = False
    end
    object bAceptar: TdxBarLargeButton
      Caption = 'Aceptar'
      Category = 0
      Enabled = False
      Hint = 'Aceptar (F5)'
      Visible = ivAlways
      LargeImageIndex = 6
      OnClick = Aceptar
      AutoGrayScale = False
    end
    object bCancelar: TdxBarLargeButton
      Caption = 'Cancelar'
      Category = 0
      Enabled = False
      Hint = 'Cancelar (Esc)'
      Visible = ivAlways
      LargeImageIndex = 7
      OnClick = Cancelar
      AutoGrayScale = False
    end
    object bBusqueda: TdxBarLargeButton
      Caption = 'B'#250'squeda'
      Category = 0
      Hint = 'B'#250'squeda'
      Visible = ivAlways
      LargeImageIndex = 8
      OnClick = Busqueda
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
    object dxBarButton1: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object bImprimir: TdxBarLargeButton
      Caption = 'Imprimir'
      Category = 0
      Enabled = False
      Hint = 'Imprimir'
      Visible = ivAlways
      LargeImageIndex = 12
      OnClick = BImprimirClick
      AutoGrayScale = False
    end
    object bAlta: TdxBarLargeButton
      Caption = 'Alta'
      Category = 0
      Hint = 'Alta Registro'
      Visible = ivNever
      LargeImageIndex = 0
      OnClick = Alta
      AutoGrayScale = False
    end
    object bBorrar: TdxBarLargeButton
      Caption = 'Borrar'
      Category = 0
      Enabled = False
      Hint = 'Borrar Registro'
      Visible = ivNever
      LargeImageIndex = 1
      OnClick = Borrar
      AutoGrayScale = False
    end
  end
end
