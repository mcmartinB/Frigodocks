object ListadoClientes: TListadoClientes
  Left = 284
  Top = 199
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Listado de Clientes'
  ClientHeight = 447
  ClientWidth = 362
  Color = 15128264
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
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
  TextHeight = 14
  object BarraEstado: TStatusBar
    Left = 0
    Top = 424
    Width = 362
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
    Left = 23
    Top = 46
    Width = 59
    Height = 20
    Caption = 'Empresa'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object cEmpresa: TEdit
    Left = 98
    Top = 43
    Width = 32
    Height = 24
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
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
    Left = 157
    Top = 43
    Width = 183
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = True
    ParentFont = False
    TabOrder = 7
  end
  object GroupBox3: TGroupBox
    Left = 20
    Top = 78
    Width = 322
    Height = 101
    Caption = 'Cliente'
    Color = 15128264
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    object StaticText4: TStaticText
      Left = 31
      Top = 29
      Width = 41
      Height = 20
      Caption = 'Desde'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object cClienteDesde: TEdit
      Left = 80
      Top = 26
      Width = 41
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 4
      ParentFont = False
      TabOrder = 1
      Text = '0000'
      OnEnter = ColorEnter
      OnExit = ColorExit
    end
    object StaticText5: TStaticText
      Left = 184
      Top = 29
      Width = 38
      Height = 20
      Caption = 'Hasta'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object cClienteHasta: TEdit
      Left = 229
      Top = 26
      Width = 41
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 4
      ParentFont = False
      TabOrder = 3
      Text = 'ZZZZ'
      OnEnter = ColorEnter
      OnExit = ColorExit
    end
    object cActivo: TComboBox
      Left = 80
      Top = 58
      Width = 163
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentFont = False
      TabOrder = 4
      Text = 'TODOS'
      OnKeyPress = cActivoKeyPress
      Items.Strings = (
        'TODOS'
        'ACTIVOS'
        'NO ACTIVOS')
    end
  end
  object GroupBox2: TGroupBox
    Left = 19
    Top = 185
    Width = 322
    Height = 68
    Caption = 'Mercanc'#237'a'
    Color = 15128264
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 2
    object cMercancia: TComboBox
      Left = 80
      Top = 30
      Width = 163
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
      Text = 'TODOS'
      OnKeyPress = cMercanciaKeyPress
      Items.Strings = (
        'TODOS'
        'SIN MERCANC'#205'A'
        'CON MERCANC'#205'A')
    end
  end
  object GroupBox1: TGroupBox
    Left = 20
    Top = 336
    Width = 322
    Height = 68
    Caption = 'Orden'
    Color = 15128264
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 4
    object cOrden: TComboBox
      Left = 80
      Top = 30
      Width = 163
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemHeight = 16
      ItemIndex = 1
      ParentFont = False
      TabOrder = 0
      Text = 'NOMBRE'
      OnKeyPress = cOrdenKeyPress
      Items.Strings = (
        'C'#211'DIGO'
        'NOMBRE')
    end
  end
  object GroupBox4: TGroupBox
    Left = 20
    Top = 259
    Width = 322
    Height = 68
    Caption = 'Tipo Listado'
    Color = 15128264
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 3
    object cTipo: TComboBox
      Left = 80
      Top = 30
      Width = 163
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemHeight = 16
      ItemIndex = 1
      ParentFont = False
      TabOrder = 0
      Text = 'LISTA'
      OnKeyPress = cTipoKeyPress
      Items.Strings = (
        'FICHA'
        'LISTA')
    end
  end
  object cLupaEmpresas: TSimpleSearch
    Left = 131
    Top = 43
    Width = 24
    Height = 24
    TabOrder = 8
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
    Left = 304
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
