object ListadoAlmacenes: TListadoAlmacenes
  Left = 161
  Top = 110
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Listado de Almacenes'
  ClientHeight = 592
  ClientWidth = 798
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
    Left = 20
    Top = 40
    Width = 760
    Height = 57
  end
  object cEmpresa: TEdit
    Left = 148
    Top = 59
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
    TabOrder = 1
    OnChange = cEmpresaChange
    OnEnter = ColorEnter
    OnExit = ColorExit
    OnKeyDown = cEmpresaKeyDown
  end
  object GroupBox1: TGroupBox
    Left = 20
    Top = 277
    Width = 368
    Height = 54
    Caption = 'Familia'
    Color = 15128264
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 15
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
    object cFamiliaDesde: TEdit
      Left = 109
      Top = 19
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
      Text = '000'
      OnEnter = ColorEnter
      OnExit = ColorExit
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
    object cFamiliaHasta: TEdit
      Left = 277
      Top = 19
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
      TabOrder = 1
      Text = 'ZZZ'
      OnEnter = ColorEnter
      OnExit = ColorExit
    end
  end
  object BarraEstado: TStatusBar
    Left = 0
    Top = 569
    Width = 798
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
    Left = 73
    Top = 62
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
    Left = 207
    Top = 59
    Width = 233
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = True
    ParentFont = False
    TabOrder = 3
  end
  object GroupBox4: TGroupBox
    Left = 20
    Top = 330
    Width = 368
    Height = 54
    Caption = 'Art'#237'culo'
    Color = 15128264
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 17
    object StaticText6: TStaticText
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
    object cArticuloDesde: TEdit
      Left = 109
      Top = 19
      Width = 49
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 5
      ParentFont = False
      TabOrder = 0
      Text = '00000'
      OnEnter = ColorEnter
      OnExit = ColorExit
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
    object cArticuloHasta: TEdit
      Left = 277
      Top = 19
      Width = 49
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 5
      ParentFont = False
      TabOrder = 1
      Text = 'ZZZZZ'
      OnEnter = ColorEnter
      OnExit = ColorExit
    end
  end
  object GroupBox2: TGroupBox
    Left = 412
    Top = 319
    Width = 368
    Height = 54
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
    TabOrder = 16
    object cOrden: TComboBox
      Left = 75
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
      ItemIndex = 3
      ParentFont = False
      TabOrder = 0
      Text = 'NOMBRE ART'#205'CULO'
      OnEnter = ColorEnter
      OnExit = ColorExit
      OnKeyPress = cOrdenKeyPress
      Items.Strings = (
        'LOTE'
        'C'#211'D. FAMILIA '
        'C'#211'D. ART'#205'CULO'
        'NOMBRE ART'#205'CULO'
        'C'#193'MARA'
        'ZONA'
        'FECHA ENTRADA'
        'FECHA CADUCIDAD')
    end
  end
  object GroupBox3: TGroupBox
    Left = 20
    Top = 103
    Width = 368
    Height = 54
    Caption = 'Cliente'
    Color = 15128264
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 8
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
    Left = 20
    Top = 157
    Width = 368
    Height = 54
    Caption = 'Lote'
    Color = 15128264
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 10
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
    object cLoteDesde: TEdit
      Left = 109
      Top = 19
      Width = 80
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      TabOrder = 0
      Text = '0'
      OnEnter = ColorEnter
      OnExit = ColorExitSinCeros
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
    object cLoteHasta: TEdit
      Left = 277
      Top = 19
      Width = 80
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      TabOrder = 1
      Text = 'ZZZZZZZZ'
      OnEnter = ColorEnter
      OnExit = ColorExitSinCeros
    end
  end
  object GroupBox6: TGroupBox
    Left = 20
    Top = 385
    Width = 368
    Height = 54
    Caption = 'C'#225'mara'
    Color = 15128264
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 19
    object StaticText4: TStaticText
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
    object cCamaraDesde: TEdit
      Left = 109
      Top = 19
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
      Text = '0'
      OnEnter = ColorEnter
      OnExit = ColorExitSinCeros
    end
    object StaticText11: TStaticText
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
    object cCamaraHasta: TEdit
      Left = 277
      Top = 19
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
      TabOrder = 1
      Text = '999'
      OnEnter = ColorEnter
      OnExit = ColorExitSinCeros
    end
  end
  object GroupBox7: TGroupBox
    Left = 20
    Top = 441
    Width = 368
    Height = 54
    Caption = 'Zona'
    Color = 15128264
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 21
    object StaticText12: TStaticText
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
    object cZonaDesde: TEdit
      Left = 109
      Top = 19
      Width = 51
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 6
      ParentFont = False
      TabOrder = 0
      Text = '0'
      OnEnter = ColorEnter
      OnExit = ColorExitSinCeros
    end
    object StaticText13: TStaticText
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
    object cZonaHasta: TEdit
      Left = 277
      Top = 19
      Width = 56
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 6
      ParentFont = False
      TabOrder = 1
      Text = 'ZZZZZZ'
      OnEnter = ColorEnter
      OnExit = ColorExitSinCeros
    end
  end
  object GroupBox8: TGroupBox
    Left = 412
    Top = 103
    Width = 368
    Height = 54
    Caption = 'Normal / Importaci'#243'n'
    Color = 15128264
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 9
    object cNormImp: TComboBox
      Left = 75
      Top = 24
      Width = 254
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
      OnEnter = ColorEnter
      OnExit = ColorExit
      OnKeyPress = cNormImpKeyPress
      Items.Strings = (
        'TODOS'
        'NORMAL'
        'IMPORTACI'#211'N - PENDIENTE'
        'IMPORTACI'#211'N - ABANDONADO'
        'IMPORTACI'#211'N - AUTORIZADO'
        'REGULARIZACI'#211'N')
    end
  end
  object GroupBox9: TGroupBox
    Left = 412
    Top = 157
    Width = 368
    Height = 54
    Caption = 'Tipo'
    Color = 15128264
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 11
    object cTipo: TComboBox
      Left = 75
      Top = 19
      Width = 94
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
      Text = 'CLIENTE'
      OnChange = cTipoChange
      OnEnter = ColorEnter
      OnExit = ColorExit
      OnKeyPress = cTipoKeyPress
      Items.Strings = (
        'NORMAL'
        'CLIENTE'
        'CAMARA')
    end
  end
  object GroupBox10: TGroupBox
    Left = 412
    Top = 211
    Width = 368
    Height = 54
    Caption = 'Caducados'
    Color = 15128264
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 12
    object cCaducados: TComboBox
      Left = 75
      Top = 19
      Width = 78
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
      OnEnter = ColorEnter
      OnExit = ColorExit
      OnKeyPress = cCaducadosKeyPress
      Items.Strings = (
        'TODOS'
        'SI'
        'NO')
    end
  end
  object StaticText14: TStaticText
    Left = 471
    Top = 62
    Width = 88
    Height = 20
    Caption = 'Fecha / Hora'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
  end
  object GroupBox11: TGroupBox
    Left = 412
    Top = 264
    Width = 368
    Height = 54
    Caption = 'Agrupaci'#243'n'
    Color = 15128264
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 14
    object cAgrupacion: TComboBox
      Left = 75
      Top = 19
      Width = 102
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
      Text = 'NADA'
      OnChange = cAgrupacionChange
      OnEnter = ColorEnter
      OnExit = ColorExit
      OnKeyPress = cAgrupacionKeyPress
      Items.Strings = (
        'NADA'
        'ART'#205'CULO'
        '')
    end
  end
  object cLupaEmpresas: TSimpleSearch
    Left = 181
    Top = 59
    Width = 24
    Height = 24
    TabOrder = 2
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
  object cFecha: TcxDateEdit
    Left = 564
    Top = 59
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 4
    OnEnter = ColorEnter
    OnExit = ColorExit
    Width = 100
  end
  object cHora: TMaskEdit
    Left = 670
    Top = 59
    Width = 67
    Height = 24
    CharCase = ecUpperCase
    EditMask = '99:99:99;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 8
    ParentFont = False
    TabOrder = 5
    OnExit = cHoraExit
  end
  object GroupBox12: TGroupBox
    Left = 20
    Top = 217
    Width = 368
    Height = 54
    Caption = 'Lote Origen'
    Color = 15128264
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 13
    object StaticText15: TStaticText
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
    object cLoteOrigenDesde: TEdit
      Left = 109
      Top = 19
      Width = 80
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      OnEnter = ColorEnter
      OnExit = ColorExitSinCeros
    end
    object StaticText16: TStaticText
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
    object cLoteOrigenHasta: TEdit
      Left = 277
      Top = 19
      Width = 80
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 1
      OnEnter = ColorEnter
      OnExit = ColorExitSinCeros
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
    Left = 424
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
