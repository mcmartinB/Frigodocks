object LMovimientosLotesEx: TLMovimientosLotesEx
  Left = 286
  Top = 254
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = '   MOVIMIENTOS LOTES TERMINADOS'
  ClientHeight = 320
  ClientWidth = 438
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object cClientes: TGroupBox
    Left = 25
    Top = 77
    Width = 383
    Height = 100
    Caption = 'Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    object StaticText2: TStaticText
      Left = 32
      Top = 33
      Width = 39
      Height = 20
      Caption = 'Desde'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object cClienteDesde: TEdit
      Left = 85
      Top = 31
      Width = 41
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 4
      ParentFont = False
      TabOrder = 0
      Text = '0000'
      OnChange = cClienteDesdeChange
      OnEnter = ColorEnter
      OnExit = ColorExit
      OnKeyDown = cClienteDesdeKeyDown
    end
    object StaticText3: TStaticText
      Left = 32
      Top = 65
      Width = 36
      Height = 20
      Caption = 'Hasta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object cClienteHasta: TEdit
      Left = 83
      Top = 61
      Width = 41
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
      Text = 'ZZZZ'
      OnChange = cClienteHastaChange
      OnEnter = ColorEnter
      OnExit = ColorExit
      OnKeyDown = cClienteHastaKeyDown
    end
    object tNomClienteDesde: TPanel
      Left = 150
      Top = 31
      Width = 218
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
    object tNomClienteHasta: TPanel
      Left = 150
      Top = 61
      Width = 218
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
    object cLupaClienteDesde: TSimpleSearch
      Left = 125
      Top = 31
      Width = 24
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TabStop = False
      OnClick = cLupaClientesDesdeClick
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
    object cLupaClienteHasta: TSimpleSearch
      Left = 125
      Top = 61
      Width = 24
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      TabStop = False
      OnClick = cLupaClientesHastaClick
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
  object StaticText1: TStaticText
    Left = 29
    Top = 46
    Width = 59
    Height = 20
    Caption = 'Empresa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object cEmpresa: TEdit
    Left = 104
    Top = 43
    Width = 31
    Height = 24
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 3
    ParentFont = False
    TabOrder = 4
    OnChange = cEmpresaChange
    OnEnter = ColorEnter
    OnExit = ColorExit
    OnKeyDown = cEmpresaKeyDown
  end
  object tNomEmpresa: TPanel
    Left = 161
    Top = 43
    Width = 246
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
  object GroupBox2: TGroupBox
    Left = 25
    Top = 179
    Width = 384
    Height = 54
    Caption = 'Fecha Salida'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    object StaticText6: TStaticText
      Left = 32
      Top = 22
      Width = 39
      Height = 20
      Caption = 'Desde'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object StaticText7: TStaticText
      Left = 224
      Top = 22
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
    object cFechaDesde: TcxDateEdit
      Left = 85
      Top = 18
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 0
      OnEnter = ColorEnter
      OnExit = ColorExit
      Width = 100
    end
    object cFechaHasta: TcxDateEdit
      Left = 275
      Top = 18
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 1
      OnEnter = ColorEnter
      OnExit = ColorExit
      Width = 100
    end
  end
  object BarraEstado: TStatusBar
    Left = 0
    Top = 297
    Width = 438
    Height = 23
    Color = 15592941
    Panels = <
      item
        Width = 450
      end
      item
        Width = 50
      end>
  end
  object ProgressBar: TProgressBar
    Left = 25
    Top = 268
    Width = 384
    Height = 16
    TabOrder = 10
  end
  object cbxFinalizados: TComboBox
    Left = 25
    Top = 243
    Width = 384
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 9
    Text = 'SOLO LOTES TERMINADOS'
    Items.Strings = (
      'SOLO LOTES TERMINADOS'
      'SOLO LOTES SIN TERMINAR'
      'TODOS LOS LOTES CON SALIDAS EN EL RANGO DE FECHAS')
  end
  object cLupaEmpresas: TSimpleSearch
    Left = 136
    Top = 42
    Width = 24
    Height = 24
    TabOrder = 3
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
  object Query1: TQuery
    AfterOpen = Query1AfterOpen
    BeforeClose = Query1BeforeClose
    Left = 8
    Top = 72
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
    Left = 368
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
      OnClick = BSalirClick
      AutoGrayScale = False
    end
  end
end
