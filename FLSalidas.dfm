object ListadoSalidas: TListadoSalidas
  Left = 256
  Top = 211
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Listado de Salidas'
  ClientHeight = 516
  ClientWidth = 432
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
  object Bevel1: TBevel
    Left = 25
    Top = 45
    Width = 384
    Height = 57
  end
  object cEmpresa: TEdit
    Left = 108
    Top = 62
    Width = 32
    Height = 24
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 3
    ParentFont = False
    TabOrder = 3
    OnChange = cEmpresaChange
    OnEnter = ColorEnter
    OnExit = ColorExit
    OnKeyDown = cEmpresaKeyDown
  end
  object GroupBox1: TGroupBox
    Left = 25
    Top = 230
    Width = 384
    Height = 54
    Caption = 'Fechas de Albar'#225'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    object StaticText2: TStaticText
      Left = 56
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
    object StaticText3: TStaticText
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
      Left = 107
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
    Top = 493
    Width = 432
    Height = 23
    Color = 15592941
    Panels = <
      item
        Width = 800
      end
      item
        Width = 50
      end>
  end
  object StaticText1: TStaticText
    Left = 33
    Top = 65
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
  object tNomEmpresa: TPanel
    Left = 165
    Top = 62
    Width = 233
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
    Top = 418
    Width = 384
    Height = 54
    Caption = 'Orden'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    object cOrden: TComboBox
      Left = 51
      Top = 19
      Width = 214
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemHeight = 16
      ItemIndex = 0
      ParentFont = False
      TabOrder = 0
      Text = 'CLIENTE'
      OnEnter = ColorEnter
      OnExit = ColorExit
      OnKeyPress = cOrdenKeyPress
      Items.Strings = (
        'CLIENTE'
        'FECHA ALBARAN')
    end
  end
  object GroupBox3: TGroupBox
    Left = 25
    Top = 107
    Width = 384
    Height = 54
    Caption = 'Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    object StaticText5: TStaticText
      Left = 56
      Top = 21
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
    object cClienteDesde: TEdit
      Left = 109
      Top = 18
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
      OnEnter = ColorEnter
      OnExit = ColorExit
    end
    object StaticText8: TStaticText
      Left = 224
      Top = 21
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
    object cClienteHasta: TEdit
      Left = 277
      Top = 18
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
      TabOrder = 1
      Text = 'ZZZZ'
      OnEnter = ColorEnter
      OnExit = ColorExit
    end
  end
  object GroupBox5: TGroupBox
    Left = 25
    Top = 167
    Width = 384
    Height = 54
    Caption = 'Albar'#225'nes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    object StaticText9: TStaticText
      Left = 56
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
    object cAlbaranDesde: TEdit
      Left = 109
      Top = 19
      Width = 64
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 7
      ParentFont = False
      TabOrder = 0
      Text = '1'
      OnEnter = ColorEnter
      OnExit = ColorExitSinCeros
      OnKeyPress = cAlbaranDesdeKeyPress
    end
    object StaticText10: TStaticText
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
    object cAlbaranHasta: TEdit
      Left = 277
      Top = 19
      Width = 64
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
      Text = '9999999'
      OnEnter = ColorEnter
      OnExit = ColorExitSinCeros
      OnKeyPress = cAlbaranHastaKeyPress
    end
  end
  object GroupBox8: TGroupBox
    Left = 25
    Top = 292
    Width = 384
    Height = 54
    Caption = 'Tipos de Lote'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    object cTiposLote: TComboBox
      Left = 51
      Top = 19
      Width = 272
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentFont = False
      TabOrder = 0
      Text = 'TODOS'
      OnEnter = ColorEnter
      OnExit = ColorExit
      OnKeyPress = cTiposLoteKeyPress
      Items.Strings = (
        'TODOS'
        'NORMALES'
        'IMPORTACI'#211'N-ABANDONADOS'
        'IMPORTACI'#211'N-AUTORIZADOS'
        'IMPORTACI'#211'N-PENDIENTE AUTO'
        'REGULARIZACI'#211'N')
    end
  end
  object GroupBox4: TGroupBox
    Left = 25
    Top = 356
    Width = 384
    Height = 54
    Caption = 'Tipos de Salida'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    object cTipoSalida: TComboBox
      Left = 51
      Top = 19
      Width = 272
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentFont = False
      TabOrder = 0
      Text = 'TODOS'
      OnEnter = ColorEnter
      OnExit = ColorExit
      OnKeyPress = cTipoSalidaKeyPress
      Items.Strings = (
        'TODOS'
        'NORMALES'
        'DESTRUIDAS'
        'REGULARIZACI'#211'N')
    end
  end
  object cLupaEmpresas: TSimpleSearch
    Left = 141
    Top = 62
    Width = 24
    Height = 24
    TabOrder = 4
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
