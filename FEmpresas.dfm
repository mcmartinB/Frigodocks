object Empresas: TEmpresas
  Left = 386
  Top = 192
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Mantenimiento de Empresas'
  ClientHeight = 574
  ClientWidth = 611
  Color = 16776176
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object BarraEstado: TStatusBar
    Left = 0
    Top = 551
    Width = 611
    Height = 23
    Color = 15592941
    Panels = <
      item
        Width = 430
      end
      item
        Alignment = taCenter
        Width = 50
      end>
  end
  object PanelDatos: TcxGroupBox
    Left = 0
    Top = 105
    Align = alClient
    ParentBackground = False
    ParentColor = False
    Style.Color = 15128264
    Style.LookAndFeel.NativeStyle = True
    Style.LookAndFeel.SkinName = 'Springtime'
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.SkinName = 'Springtime'
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.SkinName = 'Springtime'
    StyleHot.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.SkinName = 'Springtime'
    TabOrder = 1
    OnEnter = PanelDatosEnter
    Height = 446
    Width = 611
    object GroupBox1: TGroupBox
      Left = 36
      Top = 170
      Width = 533
      Height = 96
      Caption = ' Numeradores '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object StaticText10: TStaticText
        Left = 70
        Top = 29
        Width = 58
        Height = 20
        Caption = 'Entradas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object StaticText11: TStaticText
        Left = 70
        Top = 55
        Width = 50
        Height = 20
        Caption = 'Salidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object StaticText2: TStaticText
        Left = 293
        Top = 29
        Width = 56
        Height = 20
        Caption = 'Facturas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object StaticText3: TStaticText
        Left = 293
        Top = 55
        Width = 74
        Height = 20
        Caption = 'Contabilizar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object cNumEntradas: TcxDBTextEdit
        Left = 145
        Top = 26
        DataBinding.DataField = 'num_entradas_e'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.CharCase = ecUpperCase
        TabOrder = 4
        Width = 72
      end
      object cNumSalidas: TcxDBTextEdit
        Left = 145
        Top = 52
        DataBinding.DataField = 'num_salidas_e'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.CharCase = ecUpperCase
        TabOrder = 5
        Width = 72
      end
      object cNumFacturas: TcxDBTextEdit
        Left = 383
        Top = 25
        DataBinding.DataField = 'num_facturas_e'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.CharCase = ecUpperCase
        TabOrder = 6
        Width = 72
      end
      object cNumContabilizar: TcxDBTextEdit
        Left = 383
        Top = 52
        DataBinding.DataField = 'num_conta_e'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.CharCase = ecUpperCase
        TabOrder = 7
        Width = 72
      end
    end
    object Panel1: TPanel
      Left = 36
      Top = 23
      Width = 532
      Height = 141
      ParentColor = True
      TabOrder = 1
      object StaticText5: TStaticText
        Left = 22
        Top = 21
        Width = 53
        Height = 20
        Caption = 'Nombre'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object cNombre: TcxDBTextEdit
        Left = 97
        Top = 16
        AutoSize = False
        DataBinding.DataField = 'nombre_e'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.CharCase = ecUpperCase
        TabOrder = 1
        Height = 24
        Width = 413
      end
      object StaticText6: TStaticText
        Left = 22
        Top = 46
        Width = 60
        Height = 20
        Caption = 'Domicilio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object StaticText7: TStaticText
        Left = 22
        Top = 73
        Width = 28
        Height = 20
        Caption = 'C.P.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object StaticText8: TStaticText
        Left = 22
        Top = 98
        Width = 65
        Height = 20
        Caption = 'Poblaci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object cDomicilio: TcxDBTextEdit
        Left = 97
        Top = 42
        DataBinding.DataField = 'domicilio_e'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.CharCase = ecUpperCase
        TabOrder = 2
        Width = 413
      end
      object cCodigoPostal: TcxDBTextEdit
        Left = 97
        Top = 68
        DataBinding.DataField = 'codigo_postal_e'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Properties.OnChange = cCodigoPostalChange
        TabOrder = 3
        OnExit = cCodigoPostalExit
        Width = 43
      end
      object cPoblacion: TcxDBTextEdit
        Left = 97
        Top = 94
        DataBinding.DataField = 'poblacion_e'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.CharCase = ecUpperCase
        TabOrder = 4
        Width = 256
      end
      object tNomProvincia: TPanel
        Left = 143
        Top = 67
        Width = 210
        Height = 24
        ParentColor = True
        TabOrder = 8
      end
    end
    object Panel2: TPanel
      Left = 36
      Top = 286
      Width = 533
      Height = 145
      ParentColor = True
      TabOrder = 2
      object StaticText4: TStaticText
        Left = 22
        Top = 103
        Width = 25
        Height = 20
        Caption = 'IVA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object StaticText12: TStaticText
        Left = 22
        Top = 22
        Width = 82
        Height = 20
        Caption = 'Cta. Ingresos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object StaticText13: TStaticText
        Left = 21
        Top = 75
        Width = 105
        Height = 20
        Caption = 'Cta. Ing. Anal'#237'tica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object StaticText14: TStaticText
        Left = 22
        Top = 47
        Width = 51
        Height = 20
        Caption = 'Cta. IVA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object StaticText15: TStaticText
        Left = 280
        Top = 47
        Width = 53
        Height = 20
        Caption = 'Secci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object StaticText16: TStaticText
        Left = 280
        Top = 20
        Width = 92
        Height = 20
        Caption = #218'ltimo Usuario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object StaticText17: TStaticText
        Left = 280
        Top = 75
        Width = 42
        Height = 20
        Caption = 'Planta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object cCtaIngresos: TcxDBTextEdit
        Left = 145
        Top = 17
        DataBinding.DataField = 'cuenta_ingresos_e'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.CharCase = ecUpperCase
        TabOrder = 7
        Width = 66
      end
      object cCtaIngresosAna: TcxDBTextEdit
        Left = 145
        Top = 72
        DataBinding.DataField = 'cta_ingre_anali_e'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.CharCase = ecUpperCase
        TabOrder = 9
        Width = 66
      end
      object cSeccion: TcxDBTextEdit
        Left = 385
        Top = 44
        DataBinding.DataField = 'seccion_e'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.CharCase = ecUpperCase
        TabOrder = 12
        Width = 107
      end
      object cUltimoUsuario: TcxDBTextEdit
        Left = 385
        Top = 17
        DataBinding.DataField = 'ultimo_usuario_e'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.CharCase = ecUpperCase
        TabOrder = 11
        Width = 42
      end
      object cPlanta: TcxDBTextEdit
        Left = 385
        Top = 72
        DataBinding.DataField = 'planta_e'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.CharCase = ecUpperCase
        TabOrder = 13
        Width = 31
      end
      object cIva: TcxDBTextEdit
        Left = 145
        Top = 99
        DataBinding.DataField = 'iva_e'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.CharCase = ecUpperCase
        TabOrder = 10
        Width = 23
      end
      object cCtaIva: TcxDBTextEdit
        Left = 145
        Top = 44
        DataBinding.DataField = 'cuenta_iva_e'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.CharCase = ecUpperCase
        TabOrder = 8
        Width = 31
      end
    end
  end
  object PanelClaves: TPanel
    Left = 0
    Top = 38
    Width = 611
    Height = 67
    Align = alTop
    Color = 15395562
    ParentBackground = False
    TabOrder = 0
    object StaticText1: TStaticText
      Left = 57
      Top = 25
      Width = 54
      Height = 20
      Caption = 'C'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object cCodigo: TEdit
      Left = 132
      Top = 22
      Width = 31
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      TabOrder = 0
      OnEnter = ColorEnter
      OnExit = ColorExit
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 408
    Top = 37
  end
  object QMaestro: TQuery
    AfterInsert = QMaestroAfterInsert
    DatabaseName = 'BDFrigo'
    RequestLive = True
    SQL.Strings = (
      'select * from empresas')
    Left = 296
    Top = 36
    object QMaestrocodigo_e: TStringField
      FieldName = 'codigo_e'
      Origin = 'BDFRIGO.empresas.codigo_e'
      FixedChar = True
      Size = 3
    end
    object QMaestronombre_e: TStringField
      FieldName = 'nombre_e'
      Origin = 'BDFRIGO.empresas.nombre_e'
      FixedChar = True
      Size = 30
    end
    object QMaestrodomicilio_e: TStringField
      FieldName = 'domicilio_e'
      Origin = 'BDFRIGO.empresas.domicilio_e'
      FixedChar = True
      Size = 30
    end
    object QMaestrocodigo_postal_e: TStringField
      FieldName = 'codigo_postal_e'
      Origin = 'BDFRIGO.empresas.codigo_postal_e'
      FixedChar = True
      Size = 5
    end
    object QMaestropoblacion_e: TStringField
      FieldName = 'poblacion_e'
      Origin = 'BDFRIGO.empresas.poblacion_e'
      FixedChar = True
      Size = 25
    end
    object QMaestronum_entradas_e: TIntegerField
      FieldName = 'num_entradas_e'
      Origin = 'BDFRIGO.empresas.num_entradas_e'
    end
    object QMaestronum_salidas_e: TIntegerField
      FieldName = 'num_salidas_e'
      Origin = 'BDFRIGO.empresas.num_salidas_e'
    end
    object QMaestronum_facturas_e: TIntegerField
      FieldName = 'num_facturas_e'
      Origin = 'BDFRIGO.empresas.num_facturas_e'
    end
    object QMaestronum_conta_e: TIntegerField
      FieldName = 'num_conta_e'
      Origin = 'BDFRIGO.empresas.num_conta_e'
    end
    object QMaestroiva_e: TFloatField
      FieldName = 'iva_e'
      Origin = 'BDFRIGO.empresas.iva_e'
    end
    object QMaestrocta_ingre_anali_e: TStringField
      FieldName = 'cta_ingre_anali_e'
      Origin = 'BDFRIGO.empresas.cta_ingre_anali_e'
      FixedChar = True
      Size = 8
    end
    object QMaestrocuenta_ingresos_e: TIntegerField
      FieldName = 'cuenta_ingresos_e'
      Origin = 'BDFRIGO.empresas.cuenta_ingresos_e'
    end
    object QMaestroseccion_e: TStringField
      FieldName = 'seccion_e'
      Origin = 'BDFRIGO.empresas.seccion_e'
      FixedChar = True
      Size = 10
    end
    object QMaestroultimo_usuario_e: TStringField
      FieldName = 'ultimo_usuario_e'
      Origin = 'BDFRIGO.empresas.ultimo_usuario_e'
      FixedChar = True
      Size = 4
    end
    object QMaestrocuenta_iva_e: TStringField
      FieldName = 'cuenta_iva_e'
      Origin = 'BDFRIGO.empresas.cuenta_iva_e'
      FixedChar = True
      Size = 3
    end
    object QMaestroplanta_e: TStringField
      FieldName = 'planta_e'
      Origin = 'BDFRIGO.empresas.planta_e'
      FixedChar = True
      Size = 3
    end
  end
  object DSMaestro: TDataSource
    DataSet = QMaestro
    OnStateChange = DSMaestroStateChange
    Left = 328
    Top = 36
  end
  object QContar: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select count(*) from empresas')
    Left = 376
    Top = 36
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
          ItemName = 'bAceptar'
        end
        item
          Visible = True
          ItemName = 'bCancelar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bBusqueda'
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
    object bAlta: TdxBarLargeButton
      Caption = 'Alta'
      Category = 0
      Hint = 'Alta'
      Visible = ivAlways
      LargeImageIndex = 0
      OnClick = Alta
      AutoGrayScale = False
    end
    object bBorrar: TdxBarLargeButton
      Caption = 'Baja'
      Category = 0
      Enabled = False
      Hint = 'Baja'
      Visible = ivAlways
      LargeImageIndex = 1
      OnClick = Borrar
      AutoGrayScale = False
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
  end
end
