object ListadoArticulosCliente: TListadoArticulosCliente
  Left = 78
  Top = 268
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Listado de Art'#237'culos de Cliente'
  ClientHeight = 357
  ClientWidth = 360
  Color = 15128264
  Font.Charset = ANSI_CHARSET
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
  object GroupBox1: TGroupBox
    Left = 32
    Top = 165
    Width = 299
    Height = 70
    Caption = 'Familia'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object StaticText2: TStaticText
      Left = 25
      Top = 31
      Width = 38
      Height = 18
      Caption = 'Desde'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object cFamiliaDesde: TEdit
      Left = 74
      Top = 28
      Width = 28
      Height = 22
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      TabOrder = 1
      Text = '000'
      OnEnter = ColorEnter
      OnExit = ColorExit
    end
    object StaticText3: TStaticText
      Left = 181
      Top = 31
      Width = 34
      Height = 18
      Caption = 'Hasta'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object cFamiliaHasta: TEdit
      Left = 230
      Top = 28
      Width = 28
      Height = 22
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      TabOrder = 3
      Text = 'ZZZ'
      OnEnter = ColorEnter
      OnExit = ColorExit
    end
  end
  object BarraEstado: TStatusBar
    Left = 0
    Top = 334
    Width = 360
    Height = 23
    Color = 15592941
    Panels = <
      item
        Width = 400
      end
      item
        Width = 50
      end>
  end
  object StaticText1: TStaticText
    Left = 35
    Top = 52
    Width = 55
    Height = 18
    Caption = 'Empresa'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object cEmpresa: TEdit
    Left = 105
    Top = 49
    Width = 30
    Height = 22
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
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
    Left = 160
    Top = 49
    Width = 172
    Height = 23
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = True
    ParentFont = False
    TabOrder = 6
  end
  object GroupBox3: TGroupBox
    Left = 32
    Top = 88
    Width = 299
    Height = 70
    Caption = 'Cliente'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object StaticText4: TStaticText
      Left = 25
      Top = 31
      Width = 38
      Height = 18
      Caption = 'Desde'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object cClienteDesde: TEdit
      Left = 74
      Top = 28
      Width = 38
      Height = 22
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 4
      ParentFont = False
      TabOrder = 1
      Text = '0000'
      OnEnter = ColorEnter
      OnExit = ColorExit
    end
    object StaticText5: TStaticText
      Left = 181
      Top = 31
      Width = 34
      Height = 18
      Caption = 'Hasta'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object cClienteHasta: TEdit
      Left = 230
      Top = 28
      Width = 38
      Height = 22
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 4
      ParentFont = False
      TabOrder = 3
      Text = 'ZZZZ'
      OnEnter = ColorEnter
      OnExit = ColorExit
    end
  end
  object GroupBox4: TGroupBox
    Left = 32
    Top = 244
    Width = 299
    Height = 70
    Caption = 'Art'#237'culo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object StaticText6: TStaticText
      Left = 25
      Top = 31
      Width = 38
      Height = 18
      Caption = 'Desde'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object cArticuloDesde: TEdit
      Left = 74
      Top = 28
      Width = 38
      Height = 22
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 5
      ParentFont = False
      TabOrder = 1
      Text = '00000'
      OnEnter = ColorEnter
      OnExit = ColorExit
    end
    object StaticText7: TStaticText
      Left = 181
      Top = 31
      Width = 34
      Height = 18
      Caption = 'Hasta'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object cArticuloHasta: TEdit
      Left = 230
      Top = 28
      Width = 38
      Height = 22
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 5
      ParentFont = False
      TabOrder = 3
      Text = 'ZZZZZ'
      OnEnter = ColorEnter
      OnExit = ColorExit
    end
  end
  object cLupaEmpresas: TSimpleSearch
    Left = 136
    Top = 49
    Width = 22
    Height = 23
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
    Left = 288
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
