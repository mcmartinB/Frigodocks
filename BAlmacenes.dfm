object BusquedaAlmacenes: TBusquedaAlmacenes
  Left = 348
  Top = 153
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Busqueda de Almacenes'
  ClientHeight = 791
  ClientWidth = 924
  Color = clInfoBk
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PanelDatos: TPanel
    Left = 0
    Top = 593
    Width = 924
    Height = 175
    Align = alClient
    Enabled = False
    TabOrder = 0
    object GridLineas: TDBGrid
      Left = 1
      Top = 1
      Width = 922
      Height = 173
      Align = alClient
      DataSource = DS
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = GridLineasDblClick
      OnTitleClick = GridLineasTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'empresa_al'
          Title.Caption = 'Empresa'
          Width = 46
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cliente_al'
          Title.Caption = 'Cliente'
          Width = 38
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nombre_juridico_c'
          Title.Caption = 'Nombre'
          Width = 259
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'familia_al'
          Title.Caption = 'Familia'
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'articulo_al'
          Title.Caption = 'Art'#237'culo'
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'denominacion_a'
          Title.Caption = 'Denominaci'#243'n'
          Width = 249
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lote_al'
          Title.Caption = 'Lote'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tipo_lote_al'
          Title.Caption = 'Tipo Lote'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Fecha'
          Title.Caption = 'Fecha Entrada'
          Width = 79
          Visible = True
        end>
    end
  end
  object BarraEstado: TStatusBar
    Left = 0
    Top = 768
    Width = 924
    Height = 23
    Color = 15395562
    Panels = <
      item
        Width = 380
      end
      item
        Width = 50
      end>
  end
  object PanelClaves: TPanel
    Left = 0
    Top = 22
    Width = 924
    Height = 571
    Align = alTop
    BorderStyle = bsSingle
    Color = 15128264
    ParentBackground = False
    TabOrder = 6
    object nbLabel5: TLabel
      Left = 71
      Top = 42
      Width = 44
      Height = 16
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object StaticText1: TStaticText
      Left = 71
      Top = 11
      Width = 59
      Height = 20
      Caption = 'Empresa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
    end
    object tNomEmpresa: TPanel
      Left = 212
      Top = 9
      Width = 260
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 11
    end
    object cEmpresaBus: TEdit
      Left = 155
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
      OnChange = cEmpresaBusChange
      OnEnter = ColorEnter
      OnExit = ColorExit
      OnKeyDown = cEmpresaKeyDown
    end
    object cClienteBus: TEdit
      Left = 155
      Top = 40
      Width = 36
      Height = 24
      AutoSize = False
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 4
      ParentFont = False
      TabOrder = 1
      OnChange = cClienteBusChange
      OnEnter = ColorEnter
      OnExit = ColorExit
      OnKeyDown = cClienteKeyDown
    end
    object tNomcliente: TPanel
      Left = 216
      Top = 40
      Width = 256
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 12
    end
    object StaticText2: TStaticText
      Left = 71
      Top = 74
      Width = 33
      Height = 20
      Caption = 'Lote'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 13
    end
    object cLoteBus: TEdit
      Left = 155
      Top = 71
      Width = 85
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      TabOrder = 2
      OnEnter = ColorEnter
      OnExit = ColorExitSinCeros
    end
    object StaticText3: TStaticText
      Left = 72
      Top = 192
      Width = 63
      Height = 20
      Caption = 'Tipo Lote'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 14
    end
    object cTipoLoteBus: TComboBox
      Left = 155
      Top = 189
      Width = 317
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 16
      MaxLength = 1
      ParentFont = False
      TabOrder = 4
      OnEnter = ColorEnter
      OnExit = ColorExit
      OnKeyPress = cTipoLoteBusKeyPress
      Items.Strings = (
        'N - NORMAL'
        'I - IMPORTACI'#211'N PENDIENTE AUTORIZACI'#211'N'
        'B - IMPORTACI'#211'N ABANDONADO'
        'T - IMPORTACI'#211'N AUTORIZADO'
        'R - REGULARIZACI'#211'N')
    end
    object Panel1: TPanel
      Left = 0
      Top = 104
      Width = 605
      Height = 76
      ParentColor = True
      TabOrder = 3
      object Articulo: TLabel
        Left = 71
        Top = 47
        Width = 51
        Height = 16
        Caption = 'Art'#237'culo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object StaticText13: TStaticText
        Left = 71
        Top = 13
        Width = 66
        Height = 20
        AutoSize = False
        Caption = 'Familia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object cFamiliaBus: TEdit
        Left = 155
        Top = 9
        Width = 30
        Height = 24
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 1
        OnChange = cFamiliaBusChange
        OnEnter = ColorEnter
        OnExit = ColorExit
        OnKeyDown = cFamiliaKeyDown
      end
      object tNomFamilia: TPanel
        Left = 212
        Top = 10
        Width = 260
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
      object tNomArticulo: TPanel
        Left = 225
        Top = 43
        Width = 247
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
      object cArticuloBus: TEdit
        Left = 155
        Top = 42
        Width = 44
        Height = 24
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 5
        ParentFont = False
        TabOrder = 4
        OnChange = cArticuloBusChange
        OnEnter = ColorEnter
        OnExit = ColorExit
        OnKeyDown = cArticuloKeyDown
      end
      object SimpleSearch1: TSimpleSearch
        Left = 187
        Top = 9
        Width = 23
        Height = 24
        TabOrder = 5
        TabStop = False
        OnClick = cLupaFamiliasClick
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
      object cLupaArticulos: TSimpleSearch
        Left = 199
        Top = 43
        Width = 24
        Height = 24
        TabOrder = 6
        TabStop = False
        OnClick = cLupaArticulosClick
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
    object GBoxBultos: TGroupBox
      Left = 42
      Top = 218
      Width = 242
      Height = 94
      Caption = 'Bultos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object StaticText5: TStaticText
        Left = 19
        Top = 29
        Width = 54
        Height = 20
        Caption = 'Entrados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object StaticText6: TStaticText
        Left = 19
        Top = 57
        Width = 45
        Height = 20
        Caption = 'Salidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object cBultosEnt: TEdit
        Left = 150
        Top = 25
        Width = 73
        Height = 24
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object cBultosSal: TEdit
        Left = 150
        Top = 54
        Width = 73
        Height = 24
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
    end
    object GBoxEstuches: TGroupBox
      Left = 306
      Top = 218
      Width = 185
      Height = 123
      Caption = 'Estuches'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      object StaticText18: TStaticText
        Left = 18
        Top = 29
        Width = 55
        Height = 20
        Caption = 'Por Bulto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object StaticText21: TStaticText
        Left = 18
        Top = 58
        Width = 46
        Height = 20
        Caption = 'Sueltos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object StaticText20: TStaticText
        Left = 18
        Top = 88
        Width = 46
        Height = 20
        Caption = 'Totales'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object cEstuchesBulto: TEdit
        Left = 93
        Top = 25
        Width = 73
        Height = 24
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object cEstuchesSueltos: TEdit
        Left = 93
        Top = 54
        Width = 73
        Height = 24
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object cEstuchesTotales: TEdit
        Left = 93
        Top = 84
        Width = 73
        Height = 24
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
    end
    object GBoxPalets: TGroupBox
      Left = 306
      Top = 348
      Width = 185
      Height = 83
      Caption = 'Palets'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      object StaticText16: TStaticText
        Left = 18
        Top = 24
        Width = 54
        Height = 20
        Caption = 'Entrados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object StaticText17: TStaticText
        Left = 18
        Top = 52
        Width = 45
        Height = 20
        Caption = 'Salidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object cPaletsEnt: TEdit
        Left = 93
        Top = 20
        Width = 73
        Height = 24
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object cPaletsSal: TEdit
        Left = 93
        Top = 49
        Width = 73
        Height = 24
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
    end
    object GBoxUnidades: TGroupBox
      Left = 42
      Top = 319
      Width = 242
      Height = 177
      Caption = 'Unidades'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      object StaticText8: TStaticText
        Left = 17
        Top = 28
        Width = 54
        Height = 20
        Caption = 'Entradas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object StaticText9: TStaticText
        Left = 17
        Top = 57
        Width = 45
        Height = 20
        Caption = 'Salidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object StaticText10: TStaticText
        Left = 17
        Top = 87
        Width = 108
        Height = 20
        Caption = 'Salidas Mismo D'#237'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object StaticText14: TStaticText
        Left = 17
        Top = 145
        Width = 50
        Height = 20
        Caption = 'Mermas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object StaticText15: TStaticText
        Left = 17
        Top = 117
        Width = 64
        Height = 20
        Caption = 'Destruidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object cUnidadeEnt: TEdit
        Left = 150
        Top = 25
        Width = 73
        Height = 24
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object cUnidadesSal: TEdit
        Left = 150
        Top = 54
        Width = 73
        Height = 24
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object cUnidadesSalMismoDia: TEdit
        Left = 150
        Top = 84
        Width = 73
        Height = 24
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object cDestruidas: TEdit
        Left = 150
        Top = 113
        Width = 73
        Height = 24
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object cMermas: TEdit
        Left = 150
        Top = 142
        Width = 73
        Height = 24
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
    end
    object Panel2: TPanel
      Left = 42
      Top = 508
      Width = 451
      Height = 41
      TabOrder = 9
      object StaticText23: TStaticText
        Left = 119
        Top = 12
        Width = 72
        Height = 20
        Caption = 'N'#186' C'#225'mara'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object StaticText24: TStaticText
        Left = 296
        Top = 12
        Width = 54
        Height = 20
        Caption = 'N'#186' Zona'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object cCamara: TEdit
        Left = 201
        Top = 9
        Width = 73
        Height = 24
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object cZona: TEdit
        Left = 358
        Top = 9
        Width = 73
        Height = 24
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object cRetenido: TCheckBox
        Left = 16
        Top = 12
        Width = 97
        Height = 17
        Caption = 'Retenido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
    end
    object cLupaEmpresas: TSimpleSearch
      Left = 186
      Top = 9
      Width = 24
      Height = 24
      TabOrder = 15
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
      Left = 193
      Top = 40
      Width = 21
      Height = 24
      TabOrder = 16
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
  object Query1: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'SELECT * FROM ALMACENES, CLIENTES, ARTICULOS '
      'WHERE EMPRESA_C=EMPRESA_AL '
      'AND CODIGO_C=CLIENTE_AL '
      'AND EMPRESA_A=EMPRESA_AL '
      'AND FAMILIA_A=FAMILIA_AL '
      'AND CODIGO_A=ARTICULO_AL')
    Left = 296
    Top = 48
  end
  object DS: TDataSource
    DataSet = ClientDataSet1
    Left = 296
    Top = 80
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 362
    Top = 80
  end
  object QContar: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select count(*) from tarifas')
    Left = 360
    Top = 49
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    AfterScroll = ClientDataSet1AfterScroll
    OnCalcFields = ClientDataSet1CalcFields
    Left = 328
    Top = 80
    object ClientDataSet1empresa_al: TStringField
      FieldName = 'empresa_al'
      FixedChar = True
      Size = 3
    end
    object ClientDataSet1cliente_al: TStringField
      FieldName = 'cliente_al'
      FixedChar = True
      Size = 4
    end
    object ClientDataSet1familia_al: TStringField
      FieldName = 'familia_al'
      FixedChar = True
      Size = 3
    end
    object ClientDataSet1articulo_al: TStringField
      FieldName = 'articulo_al'
      FixedChar = True
      Size = 5
    end
    object ClientDataSet1lote_al: TStringField
      FieldName = 'lote_al'
      FixedChar = True
      Size = 7
    end
    object ClientDataSet1tipo_lote_al: TStringField
      FieldName = 'tipo_lote_al'
      FixedChar = True
      Size = 1
    end
    object ClientDataSet1fecha_entrada_al: TStringField
      FieldName = 'fecha_entrada_al'
      FixedChar = True
      Size = 10
    end
    object ClientDataSet1Fecha: TStringField
      Alignment = taRightJustify
      FieldKind = fkCalculated
      FieldName = 'Fecha'
      Size = 10
      Calculated = True
    end
    object ClientDataSet1bultos_entrados_al: TIntegerField
      FieldName = 'bultos_entrados_al'
    end
    object ClientDataSet1bultos_salidos_al: TIntegerField
      FieldName = 'bultos_salidos_al'
    end
    object ClientDataSet1unidades_entradas_al: TFloatField
      FieldName = 'unidades_entradas_al'
    end
    object ClientDataSet1unidades_salidas_al: TFloatField
      FieldName = 'unidades_salidas_al'
    end
    object ClientDataSet1unidades_destruidas_al: TFloatField
      FieldName = 'unidades_destruidas_al'
    end
    object ClientDataSet1unidades_mermas_al: TFloatField
      FieldName = 'unidades_mermas_al'
    end
    object ClientDataSet1status_retenido_al: TStringField
      FieldName = 'status_retenido_al'
      FixedChar = True
      Size = 1
    end
    object ClientDataSet1numero_camara_al: TSmallintField
      FieldName = 'numero_camara_al'
    end
    object ClientDataSet1zona_al: TStringField
      FieldName = 'zona_al'
      FixedChar = True
      Size = 6
    end
    object ClientDataSet1estuches_bulto_al: TIntegerField
      FieldName = 'estuches_bulto_al'
    end
    object ClientDataSet1estuches_sueltos_al: TIntegerField
      FieldName = 'estuches_sueltos_al'
    end
    object ClientDataSet1estuches_totales_al: TIntegerField
      FieldName = 'estuches_totales_al'
    end
    object ClientDataSet1fecha_caducidad_al: TStringField
      FieldName = 'fecha_caducidad_al'
      FixedChar = True
      Size = 10
    end
    object ClientDataSet1unid_sal_mismo_dia_al: TFloatField
      FieldName = 'unid_sal_mismo_dia_al'
    end
    object ClientDataSet1palets_entrados_al: TIntegerField
      FieldName = 'palets_entrados_al'
    end
    object ClientDataSet1palets_salidos_al: TIntegerField
      FieldName = 'palets_salidos_al'
    end
    object ClientDataSet1fecha_modif_al: TStringField
      FieldName = 'fecha_modif_al'
      FixedChar = True
      Size = 10
    end
    object ClientDataSet1empresa_c: TStringField
      FieldName = 'empresa_c'
      FixedChar = True
      Size = 3
    end
    object ClientDataSet1codigo_c: TStringField
      FieldName = 'codigo_c'
      FixedChar = True
      Size = 4
    end
    object ClientDataSet1nombre_juridico_c: TStringField
      FieldName = 'nombre_juridico_c'
      FixedChar = True
      Size = 30
    end
    object ClientDataSet1nombre_comercial_c: TStringField
      FieldName = 'nombre_comercial_c'
      FixedChar = True
      Size = 30
    end
    object ClientDataSet1domicilio_c: TStringField
      FieldName = 'domicilio_c'
      FixedChar = True
      Size = 30
    end
    object ClientDataSet1cp_c: TStringField
      FieldName = 'cp_c'
      FixedChar = True
      Size = 5
    end
    object ClientDataSet1poblacion_c: TStringField
      FieldName = 'poblacion_c'
      FixedChar = True
      Size = 25
    end
    object ClientDataSet1domicilio_correo_c: TStringField
      FieldName = 'domicilio_correo_c'
      FixedChar = True
      Size = 30
    end
    object ClientDataSet1cp_correo_c: TStringField
      FieldName = 'cp_correo_c'
      FixedChar = True
      Size = 5
    end
    object ClientDataSet1poblacion_correo_c: TStringField
      FieldName = 'poblacion_correo_c'
      FixedChar = True
      Size = 25
    end
    object ClientDataSet1telefono1_c: TStringField
      FieldName = 'telefono1_c'
      FixedChar = True
      Size = 15
    end
    object ClientDataSet1telefono2_c: TStringField
      FieldName = 'telefono2_c'
      FixedChar = True
      Size = 15
    end
    object ClientDataSet1fax_c: TStringField
      FieldName = 'fax_c'
      FixedChar = True
      Size = 15
    end
    object ClientDataSet1cif_dni_c: TStringField
      FieldName = 'cif_dni_c'
      FixedChar = True
      Size = 15
    end
    object ClientDataSet1origen_c: TStringField
      FieldName = 'origen_c'
      FixedChar = True
      Size = 1
    end
    object ClientDataSet1imp_alquiler_oficina_c: TFloatField
      FieldName = 'imp_alquiler_oficina_c'
    end
    object ClientDataSet1imp_thermoking_c: TFloatField
      FieldName = 'imp_thermoking_c'
    end
    object ClientDataSet1precio_kw_thermo_c: TFloatField
      FieldName = 'precio_kw_thermo_c'
    end
    object ClientDataSet1imp_cargo_fijo_c: TFloatField
      FieldName = 'imp_cargo_fijo_c'
    end
    object ClientDataSet1precio_horas_ent_sal_c: TFloatField
      FieldName = 'precio_horas_ent_sal_c'
    end
    object ClientDataSet1imp_minimo_facturacion_c: TFloatField
      FieldName = 'imp_minimo_facturacion_c'
    end
    object ClientDataSet1periodo_factura_c: TStringField
      FieldName = 'periodo_factura_c'
      FixedChar = True
      Size = 1
    end
    object ClientDataSet1tarifa_c: TStringField
      FieldName = 'tarifa_c'
      FixedChar = True
      Size = 2
    end
    object ClientDataSet1m3_facturacion_c: TIntegerField
      FieldName = 'm3_facturacion_c'
    end
    object ClientDataSet1m3_refrigeracion_c: TIntegerField
      FieldName = 'm3_refrigeracion_c'
    end
    object ClientDataSet1dias_pago_c: TSmallintField
      FieldName = 'dias_pago_c'
    end
    object ClientDataSet1forma_pago_c: TStringField
      FieldName = 'forma_pago_c'
      FixedChar = True
      Size = 25
    end
    object ClientDataSet1cuenta_cliente_c: TStringField
      FieldName = 'cuenta_cliente_c'
      FixedChar = True
    end
    object ClientDataSet1nombre_banco_c: TStringField
      FieldName = 'nombre_banco_c'
      FixedChar = True
      Size = 30
    end
    object ClientDataSet1domicilio_banco_c: TStringField
      FieldName = 'domicilio_banco_c'
      FixedChar = True
      Size = 30
    end
    object ClientDataSet1cp_banco_c: TStringField
      FieldName = 'cp_banco_c'
      FixedChar = True
      Size = 5
    end
    object ClientDataSet1poblacion_banco_c: TStringField
      FieldName = 'poblacion_banco_c'
      FixedChar = True
      Size = 25
    end
    object ClientDataSet1ultimo_stock_c: TFloatField
      FieldName = 'ultimo_stock_c'
    end
    object ClientDataSet1numerador_lotes_c: TIntegerField
      FieldName = 'numerador_lotes_c'
    end
    object ClientDataSet1nom_autorizado1_c: TStringField
      FieldName = 'nom_autorizado1_c'
      FixedChar = True
      Size = 30
    end
    object ClientDataSet1cif_autorizado1_c: TStringField
      FieldName = 'cif_autorizado1_c'
      FixedChar = True
      Size = 15
    end
    object ClientDataSet1fecha_autorizado1_c: TStringField
      FieldName = 'fecha_autorizado1_c'
      FixedChar = True
      Size = 10
    end
    object ClientDataSet1nom_autorizado2_c: TStringField
      FieldName = 'nom_autorizado2_c'
      FixedChar = True
      Size = 30
    end
    object ClientDataSet1cif_autorizado2_c: TStringField
      FieldName = 'cif_autorizado2_c'
      FixedChar = True
      Size = 15
    end
    object ClientDataSet1fecha_autorizado2_c: TStringField
      FieldName = 'fecha_autorizado2_c'
      FixedChar = True
      Size = 10
    end
    object ClientDataSet1comentario_c: TStringField
      FieldName = 'comentario_c'
      FixedChar = True
      Size = 40
    end
    object ClientDataSet1valor_stock_c: TFloatField
      FieldName = 'valor_stock_c'
    end
    object ClientDataSet1imp_pendiente_pago_c: TFloatField
      FieldName = 'imp_pendiente_pago_c'
    end
    object ClientDataSet1mercancia_retenida_c: TStringField
      FieldName = 'mercancia_retenida_c'
      FixedChar = True
      Size = 1
    end
    object ClientDataSet1tlfmovil_c: TStringField
      FieldName = 'tlfmovil_c'
      FixedChar = True
      Size = 15
    end
    object ClientDataSet1email_c: TStringField
      FieldName = 'email_c'
      FixedChar = True
      Size = 40
    end
    object ClientDataSet1web_c: TStringField
      FieldName = 'web_c'
      FixedChar = True
      Size = 40
    end
    object ClientDataSet1precio_hor_clima_c: TFloatField
      FieldName = 'precio_hor_clima_c'
    end
    object ClientDataSet1cuenta_contable_c: TStringField
      FieldName = 'cuenta_contable_c'
      FixedChar = True
      Size = 10
    end
    object ClientDataSet1codigo_pago_c: TStringField
      FieldName = 'codigo_pago_c'
      FixedChar = True
      Size = 2
    end
    object ClientDataSet1empresa_a: TStringField
      FieldName = 'empresa_a'
      FixedChar = True
      Size = 3
    end
    object ClientDataSet1familia_a: TStringField
      FieldName = 'familia_a'
      FixedChar = True
      Size = 3
    end
    object ClientDataSet1codigo_a: TStringField
      FieldName = 'codigo_a'
      FixedChar = True
      Size = 5
    end
    object ClientDataSet1denominacion_a: TStringField
      FieldName = 'denominacion_a'
      FixedChar = True
      Size = 30
    end
    object ClientDataSet1unidad_medida_a: TStringField
      FieldName = 'unidad_medida_a'
      FixedChar = True
      Size = 1
    end
    object ClientDataSet1valor_por_kg_a: TFloatField
      FieldName = 'valor_por_kg_a'
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Query1
    Left = 328
    Top = 48
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
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Blue'
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 368
    Top = 32
    DockControlHeights = (
      0
      0
      22
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
      FloatLeft = 470
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bNuevaBusqueda'
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
        end>
      OneOnRow = True
      RotateWhenVertical = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object bNuevaBusqueda: TdxBarButton
      Caption = 'Nueva B'#250'squeda'
      Category = 0
      Hint = 'Nueva B'#250'squeda'
      Visible = ivAlways
      ImageIndex = 11
      OnClick = NuevaBusqueda
    end
    object bPrimero: TdxBarButton
      Caption = 'Primer Registro'
      Category = 0
      Enabled = False
      Hint = 'Primer Registro'
      Visible = ivAlways
      ImageIndex = 2
      OnClick = Primero
    end
    object bAnterior: TdxBarButton
      Caption = 'Anterior Registro'
      Category = 0
      Enabled = False
      Hint = 'Anterior Registro'
      Visible = ivAlways
      ImageIndex = 3
      OnClick = Anterior
    end
    object bSiguiente: TdxBarButton
      Caption = 'Siguiente Registro'
      Category = 0
      Enabled = False
      Hint = 'Siguiente Registro'
      Visible = ivAlways
      ImageIndex = 4
      OnClick = Siguiente
    end
    object bUltimo: TdxBarButton
      Caption = 'Ultimo Registro'
      Category = 0
      Enabled = False
      Hint = 'Ultimo Registro'
      Visible = ivAlways
      ImageIndex = 5
      OnClick = Ultimo
    end
    object bAceptar: TdxBarButton
      Caption = 'Aceptar'
      Category = 0
      Hint = 'Aceptar (F5)'
      Visible = ivAlways
      ImageIndex = 6
      OnClick = Aceptar
    end
    object bCancelar: TdxBarButton
      Caption = 'Cancelar'
      Category = 0
      Hint = 'Cancelar (Esc)'
      Visible = ivAlways
      ImageIndex = 7
      OnClick = Cancelar
    end
  end
end
