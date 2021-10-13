object Empresas: TEmpresas
  Left = 411
  Top = 154
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Mantenimiento de Empresas'
  ClientHeight = 574
  ClientWidth = 575
  Color = 16776176
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PanelDatos: TcxGroupBox
    Left = 0
    Top = 98
    Align = alClient
    Style.LookAndFeel.NativeStyle = False
    Style.LookAndFeel.SkinName = 'Office2010Blue'
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.SkinName = 'Office2010Blue'
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.SkinName = 'Office2010Blue'
    StyleHot.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.SkinName = 'Office2010Blue'
    TabOrder = 0
    ExplicitTop = 104
    Height = 453
    Width = 575
    object pnl1: TPanel
      Left = 22
      Top = 18
      Width = 532
      Height = 141
      TabOrder = 0
      object StaticText5: TStaticText
        Left = 23
        Top = 21
        Width = 59
        Height = 20
        Caption = 'Nombre'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object StaticText6: TStaticText
        Left = 23
        Top = 47
        Width = 69
        Height = 20
        Caption = 'Domicilio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object StaticText7: TStaticText
        Left = 23
        Top = 74
        Width = 32
        Height = 20
        Caption = 'C.P.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object StaticText8: TStaticText
        Left = 23
        Top = 99
        Width = 74
        Height = 20
        Caption = 'Poblaci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object cNombre: TcxDBTextEdit
        Left = 100
        Top = 20
        DataBinding.DataField = 'nombre_e'
        DataBinding.DataSource = DSMaestro
        Properties.CharCase = ecUpperCase
        TabOrder = 4
        Width = 413
      end
      object cDomicilio: TcxDBTextEdit
        Left = 100
        Top = 46
        DataBinding.DataField = 'domicilio_e'
        DataBinding.DataSource = DSMaestro
        Properties.CharCase = ecUpperCase
        TabOrder = 5
        Width = 413
      end
      object cCodigoPostal: TcxDBTextEdit
        Left = 100
        Top = 73
        DataBinding.DataField = 'codigo_postal_e'
        DataBinding.DataSource = DSMaestro
        Properties.CharCase = ecUpperCase
        Properties.OnChange = cCodigoPostalChange
        TabOrder = 6
        OnExit = cCodigoPostalOExit
        Width = 43
      end
      object tnomProvincia: TcxTextEdit
        Left = 147
        Top = 73
        TabStop = False
        Properties.ReadOnly = True
        Style.BorderStyle = ebsFlat
        Style.Color = clBtnFace
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = ''
        Style.Shadow = False
        Style.TransparentBorder = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = ''
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = ''
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = ''
        TabOrder = 7
        Width = 157
      end
      object cPoblacion: TcxDBTextEdit
        Left = 100
        Top = 98
        DataBinding.DataField = 'poblacion_e'
        DataBinding.DataSource = DSMaestro
        Properties.CharCase = ecUpperCase
        TabOrder = 8
        Width = 205
      end
    end
    object cxGroupBox1: TcxGroupBox
      Left = 22
      Top = 189
      Caption = 'Numeradores'
      PanelStyle.BorderWidth = 5
      Style.BorderStyle = ebsUltraFlat
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'Office2010Blue'
      Style.Shadow = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'Office2010Blue'
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = 'Office2010Blue'
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = 'Office2010Blue'
      TabOrder = 1
      Height = 148
      Width = 532
    end
  end
  object BarraEstado: TdxStatusBar
    Left = 0
    Top = 551
    Width = 575
    Height = 23
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 430
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end>
    PaintStyle = stpsUseLookAndFeel
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Lilian'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object PanelClaves: TcxGroupBox
    Left = 0
    Top = 38
    Align = alTop
    PanelStyle.OfficeBackgroundKind = pobkGradient
    Style.LookAndFeel.NativeStyle = False
    Style.LookAndFeel.SkinName = 'iMaginary'
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.SkinName = 'iMaginary'
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.SkinName = 'iMaginary'
    StyleHot.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.SkinName = 'iMaginary'
    TabOrder = 6
    ExplicitTop = 8
    Height = 60
    Width = 575
    object StaticText1: TStaticText
      Left = 45
      Top = 25
      Width = 54
      Height = 20
      Caption = 'C'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object cCodigo: TEdit
      Left = 120
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
      TabOrder = 1
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
  object BEEmpresa: TBusquedaExperta
    Titulo = 'Mantenimiento de Empresas'
    Tablas = 'empresas'
    Campos = <
      item
        Etiqueta = 'C'#243'digo'
        Campo = 'codigo_e'
        Tipo = ctCadena
        Lupa = False
        SSCampos = <>
        SSReferencias = <>
        SSConcatenar = False
      end
      item
        Etiqueta = 'Nombre'
        Campo = 'nombre_e'
        Tipo = ctCadena
        Lupa = False
        SSCampos = <>
        SSReferencias = <>
        SSConcatenar = False
      end>
    Restringido = False
    Left = 456
    Top = 40
  end
  object dxBarManager1: TdxBarManager
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
    ImageOptions.Images = DMBaseDatos.ImagenesNew
    ImageOptions.LargeImages = DMBaseDatos.ImagenesNew
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Blue'
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 496
    Top = 40
    DockControlHeights = (
      0
      0
      38
      0)
    object dxPrincipal: TdxBar
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      IsMainMenu = True
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
      MultiLine = True
      OneOnRow = True
      Row = 0
      UseOwnFont = True
      Visible = True
      WholeRow = True
    end
    object bAlta: TdxBarLargeButton
      Caption = 'Alta'
      Category = 0
      Hint = 'Alta'
      Visible = ivAlways
      LargeImageIndex = 0
      OnClick = Alta
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 0
    end
    object bBorrar: TdxBarLargeButton
      Caption = 'Baja'
      Category = 0
      Hint = 'Baja'
      Visible = ivAlways
      LargeImageIndex = 1
      OnClick = Borrar
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 1
    end
    object bPrimero: TdxBarLargeButton
      Caption = 'Primero'
      Category = 0
      Hint = 'Primer Registro'
      Visible = ivAlways
      LargeImageIndex = 2
      OnClick = Primero
      AutoGrayScale = False
    end
    object bAnterior: TdxBarLargeButton
      Caption = 'Anterior'
      Category = 0
      Hint = 'Anterior Registro'
      Visible = ivAlways
      LargeImageIndex = 3
      OnClick = Anterior
      AutoGrayScale = False
    end
    object bSiguiente: TdxBarLargeButton
      Caption = 'Siguiente'
      Category = 0
      Hint = 'Siguiente Registro'
      Visible = ivAlways
      LargeImageIndex = 4
      OnClick = Siguiente
      AutoGrayScale = False
    end
    object bUltimo: TdxBarLargeButton
      Caption = 'Ultimo'
      Category = 0
      Hint = #218'ltimo Registro'
      Visible = ivAlways
      LargeImageIndex = 5
      OnClick = Ultimo
      AutoGrayScale = False
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
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object bCancelar: TdxBarLargeButton
      Caption = 'Cancelar'
      Category = 0
      Hint = 'Cancelar (Esc)'
      Visible = ivAlways
      LargeImageIndex = 7
      OnClick = Cancelar
      AutoGrayScale = False
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object bBusqueda: TdxBarLargeButton
      Caption = 'Buscar'
      Category = 0
      Hint = 'Buscar'
      Visible = ivAlways
      LargeImageIndex = 8
      OnClick = BusquedaExperta
      AutoGrayScale = False
    end
    object bSalir: TdxBarLargeButton
      Caption = 'Salir'
      Category = 0
      Hint = 'Salir'
      Visible = ivAlways
      LargeImageIndex = 10
      AutoGrayScale = False
    end
  end
end
