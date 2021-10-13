object Almacenes: TAlmacenes
  Left = 154
  Top = 169
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Mantenimiento de Almacenes'
  ClientHeight = 694
  ClientWidth = 651
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
    Top = 671
    Width = 651
    Height = 23
    Color = 15395562
    Panels = <
      item
        Width = 475
      end
      item
        Width = 50
      end>
  end
  object PanelDatos: TPanel
    Left = 0
    Top = 137
    Width = 651
    Height = 534
    Align = alClient
    Color = 15128264
    ParentBackground = False
    TabOrder = 3
    OnEnter = PanelDatosEnter
    object GBoxUnidades: TGroupBox
      Left = 77
      Top = 255
      Width = 242
      Height = 195
      Caption = 'Unidades'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object StaticText8: TStaticText
        Left = 17
        Top = 26
        Width = 54
        Height = 20
        Caption = 'Entradas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object StaticText9: TStaticText
        Left = 17
        Top = 55
        Width = 45
        Height = 20
        Caption = 'Salidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object StaticText10: TStaticText
        Left = 17
        Top = 83
        Width = 108
        Height = 20
        Caption = 'Salidas Mismo D'#237'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object StaticText11: TStaticText
        Left = 17
        Top = 171
        Width = 35
        Height = 20
        Caption = 'Stock'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
      end
      object StaticText14: TStaticText
        Left = 17
        Top = 141
        Width = 50
        Height = 20
        Caption = 'Mermas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object StaticText15: TStaticText
        Left = 17
        Top = 112
        Width = 64
        Height = 20
        Caption = 'Destruidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object cUnidadesEntradas: TcxDBCurrencyEdit
        Left = 152
        Top = 22
        AutoSize = False
        DataBinding.DataField = 'unidades_entradas_al'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.DisplayFormat = ',0.00;-,0.00'
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextStyle = []
        Style.IsFontAssigned = True
        TabOrder = 0
        Height = 24
        Width = 73
      end
      object cUnidadesSalidas: TcxDBCurrencyEdit
        Left = 152
        Top = 51
        AutoSize = False
        DataBinding.DataField = 'unidades_salidas_al'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.DisplayFormat = ',0.00;-,0.00'
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextStyle = []
        Style.IsFontAssigned = True
        TabOrder = 2
        Height = 24
        Width = 73
      end
      object cUnidadesSalidasMismoDia: TcxDBCurrencyEdit
        Left = 152
        Top = 80
        AutoSize = False
        DataBinding.DataField = 'unid_sal_mismo_dia_al'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.DisplayFormat = ',0.00;-,0.00'
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextStyle = []
        Style.IsFontAssigned = True
        TabOrder = 4
        Height = 24
        Width = 73
      end
      object cUnidadesDestruidas: TcxDBCurrencyEdit
        Left = 152
        Top = 110
        AutoSize = False
        DataBinding.DataField = 'unidades_destruidas_al'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.DisplayFormat = ',0.00;-,0.00'
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextStyle = []
        Style.IsFontAssigned = True
        TabOrder = 6
        Height = 24
        Width = 73
      end
      object cUnidadesMermas: TcxDBCurrencyEdit
        Left = 152
        Top = 139
        AutoSize = False
        DataBinding.DataField = 'unidades_mermas_al'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.DisplayFormat = ',0.00;-,0.00'
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextStyle = []
        Style.IsFontAssigned = True
        TabOrder = 8
        Height = 24
        Width = 73
      end
      object cUnidadesStock: TcxDBCurrencyEdit
        Left = 152
        Top = 168
        AutoSize = False
        DataBinding.DataField = 'CALC_UNIDADES_STOCK'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.ReadOnly = True
        Style.Color = 15128264
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clRed
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 10
        Height = 24
        Width = 73
      end
    end
    object GBoxPalets: TGroupBox
      Left = 341
      Top = 255
      Width = 195
      Height = 114
      Caption = 'Palets'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
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
        TabOrder = 1
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
        TabOrder = 3
      end
      object StaticText19: TStaticText
        Left = 18
        Top = 80
        Width = 35
        Height = 20
        Caption = 'Stock'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object cPaletsEntrados: TcxDBTextEdit
        Left = 103
        Top = 20
        DataBinding.DataField = 'palets_entrados_al'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 0
        Width = 73
      end
      object cPaletsSalidos: TcxDBTextEdit
        Left = 103
        Top = 49
        DataBinding.DataField = 'palets_salidos_al'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 2
        Width = 73
      end
      object cPaletsStock: TcxDBTextEdit
        Left = 103
        Top = 79
        TabStop = False
        DataBinding.DataField = 'CALC_PALETS_STOCK'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.ReadOnly = True
        Style.Color = 15128264
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clRed
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 4
        Width = 73
      end
    end
    object Panel1: TPanel
      Left = 77
      Top = 456
      Width = 482
      Height = 72
      TabOrder = 8
      object StaticText23: TStaticText
        Left = 25
        Top = 42
        Width = 72
        Height = 20
        Caption = 'N'#186' C'#225'mara'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object StaticText24: TStaticText
        Left = 197
        Top = 42
        Width = 54
        Height = 20
        Caption = 'N'#186' Zona'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
      object cCamera: TcxDBTextEdit
        Left = 103
        Top = 39
        DataBinding.DataField = 'numero_camara_al'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 2
        Width = 73
      end
      object cZona: TcxDBTextEdit
        Left = 262
        Top = 39
        DataBinding.DataField = 'zona_al'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 3
        Width = 73
      end
      object cRetenido: TDBCheckBox
        Left = 20
        Top = 12
        Width = 79
        Height = 17
        Caption = 'Retenido'
        DataField = 'status_retenido_al'
        DataSource = DSMaestro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        OnClick = cRetenidoClick
      end
      object cObservaciones: TcxDBTextEdit
        Left = 103
        Top = 8
        DataBinding.DataField = 'observaciones_retenido_al'
        DataBinding.DataSource = DSMaestro
        Enabled = False
        ParentFont = False
        Properties.MaxLength = 60
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 0
        Width = 363
      end
    end
    object GBoxBultos: TGroupBox
      Left = 77
      Top = 137
      Width = 242
      Height = 112
      Caption = 'Bultos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
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
        TabOrder = 1
      end
      object cBultosEnt: TcxDBTextEdit
        Left = 150
        Top = 25
        DataBinding.DataField = 'bultos_entrados_al'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.OnChange = cBultosEntChange
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 0
        Width = 73
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
        TabOrder = 3
      end
      object StaticText7: TStaticText
        Left = 19
        Top = 84
        Width = 35
        Height = 20
        Caption = 'Stock'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object cBultosSalidos: TcxDBTextEdit
        Left = 150
        Top = 54
        DataBinding.DataField = 'bultos_salidos_al'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.OnChange = cBultosEntChange
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 2
        Width = 73
      end
      object cBultosStock: TcxDBTextEdit
        Left = 150
        Top = 84
        TabStop = False
        DataBinding.DataField = 'CALC_BULTOS_STOCK'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.ReadOnly = True
        Style.Color = 15128264
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clRed
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 5
        Width = 73
      end
    end
    object GBoxEstuches: TGroupBox
      Left = 342
      Top = 137
      Width = 195
      Height = 112
      Caption = 'Estuches'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
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
        TabOrder = 1
      end
      object StaticText20: TStaticText
        Left = 18
        Top = 86
        Width = 46
        Height = 20
        Caption = 'Totales'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object StaticText21: TStaticText
        Left = 18
        Top = 57
        Width = 46
        Height = 20
        Caption = 'Sueltos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object cEstuchesPorBulto: TcxDBTextEdit
        Left = 103
        Top = 25
        DataBinding.DataField = 'estuches_bulto_al'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.OnChange = cBultosEntChange
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 0
        Width = 73
      end
      object cEstuchesTotales: TcxDBTextEdit
        Left = 103
        Top = 84
        TabStop = False
        DataBinding.DataField = 'estuches_totales_al'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.ReadOnly = False
        Style.Color = 15128264
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clRed
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 4
        Width = 73
      end
      object cEstuchesSueltos: TcxDBTextEdit
        Left = 103
        Top = 54
        DataBinding.DataField = 'estuches_sueltos_al'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.OnChange = cBultosEntChange
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 2
        Width = 73
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 649
      Height = 100
      Align = alTop
      Color = 15128264
      ParentBackground = False
      TabOrder = 0
      object StaticText2: TStaticText
        Left = 99
        Top = 13
        Width = 45
        Height = 20
        Caption = 'Familia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object StaticText3: TStaticText
        Left = 99
        Top = 42
        Width = 47
        Height = 20
        Caption = 'Articulo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object cArticulo: TcxDBTextEdit
        Left = 176
        Top = 40
        DataBinding.DataField = 'articulo_al'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.OnChange = cArticuloChange
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 4
        OnEnter = cFamiliaEnter
        OnExit = cArticuloExit
        OnKeyDown = cArticuloKeyDown
        Width = 44
      end
      object tNomArticulo: TPanel
        Left = 221
        Top = 40
        Width = 274
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 5
      end
      object tNomFamilia: TPanel
        Left = 207
        Top = 11
        Width = 288
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 1
      end
      object cFamilia: TcxDBTextEdit
        Left = 176
        Top = 11
        DataBinding.DataField = 'familia_al'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.OnChange = cFamiliaChange
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 0
        OnEnter = cFamiliaEnter
        OnExit = cFamiliaExit
        OnKeyDown = cFamiliaKeyDown
        Width = 30
      end
      object cLupaFamilias: TSimpleSearch
        Left = 496
        Top = 11
        Width = 24
        Height = 24
        TabOrder = 2
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
        Left = 496
        Top = 40
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
      object StaticText25: TStaticText
        Left = 99
        Top = 70
        Width = 68
        Height = 20
        Caption = 'Lote origen'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object cLoteOrigen: TcxDBTextEdit
        Left = 176
        Top = 70
        DataBinding.DataField = 'lote_origen_al'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.MaxLength = 10
        Properties.OnChange = cArticuloChange
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 9
        Width = 120
      end
    end
    object StaticText4: TStaticText
      Left = 99
      Top = 110
      Width = 57
      Height = 20
      Caption = 'Tipo Lote'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object cTipoLote: TDBLookupComboBox
      Left = 176
      Top = 107
      Width = 322
      Height = 24
      DataField = 'tipo_lote_al'
      DataSource = DSMaestro
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'codigo_tl'
      ListField = 'des'
      ListSource = DSTiposEntrada
      ParentFont = False
      TabOrder = 1
      OnCloseUp = cTipoLoteCloseUp
      OnEnter = cTipoLoteEnter
      OnKeyPress = cTipoLoteKeyPress
    end
    object GBoxFechas: TGroupBox
      Left = 342
      Top = 379
      Width = 217
      Height = 53
      Caption = 'Fechas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      object StaticText22: TStaticText
        Left = 18
        Top = 23
        Width = 63
        Height = 20
        Caption = 'Caducidad'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object cFechaCaducidad: TcxDateEdit
        Left = 101
        Top = 20
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 0
        OnExit = cFechaCaducidadExit
        Width = 100
      end
    end
  end
  object PanelClaves: TPanel
    Left = 0
    Top = 38
    Width = 651
    Height = 99
    Align = alTop
    Color = 15395562
    ParentBackground = False
    TabOrder = 1
    object StaticText12: TStaticText
      Left = 99
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
      TabOrder = 3
    end
    object cEmpresa: TEdit
      Left = 176
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
      Left = 232
      Top = 8
      Width = 266
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 2
    end
    object StaticText13: TStaticText
      Left = 99
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
      TabOrder = 7
    end
    object cCliente: TEdit
      Left = 176
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
      OnKeyDown = cClientesKeyDown
    end
    object tNomcliente: TPanel
      Left = 238
      Top = 37
      Width = 261
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 6
    end
    object StaticText1: TStaticText
      Left = 99
      Top = 69
      Width = 33
      Height = 20
      Caption = 'Lote'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
    end
    object cLote: TEdit
      Left = 176
      Top = 66
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
      TabOrder = 8
      OnEnter = ColorEnter
      OnExit = ColorExitSinCeros
    end
    object cLupaEmpresas: TSimpleSearch
      Left = 206
      Top = 8
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
      Left = 212
      Top = 37
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
    Left = 424
    Top = 98
  end
  object QMaestro: TQuery
    AfterOpen = QMaestroAfterOpen
    AfterInsert = QMaestroAfterInsert
    BeforeEdit = QMaestroBeforeEdit
    BeforePost = QMaestroBeforePost
    OnCalcFields = QMaestroCalcFields
    DatabaseName = 'BDFrigo'
    RequestLive = True
    SQL.Strings = (
      'select * from almacenes')
    Left = 304
    Top = 97
    object QMaestroempresa_al: TStringField
      FieldName = 'empresa_al'
      Origin = 'BDFRIGO.almacenes.empresa_al'
      FixedChar = True
      Size = 3
    end
    object QMaestrocliente_al: TStringField
      FieldName = 'cliente_al'
      Origin = 'BDFRIGO.almacenes.cliente_al'
      FixedChar = True
      Size = 4
    end
    object QMaestrofamilia_al: TStringField
      FieldName = 'familia_al'
      Origin = 'BDFRIGO.almacenes.familia_al'
      FixedChar = True
      Size = 3
    end
    object QMaestroarticulo_al: TStringField
      FieldName = 'articulo_al'
      Origin = 'BDFRIGO.almacenes.articulo_al'
      FixedChar = True
      Size = 5
    end
    object QMaestrolote_al: TStringField
      FieldName = 'lote_al'
      Origin = 'BDFRIGO.almacenes.lote_al'
      FixedChar = True
      Size = 7
    end
    object QMaestrobultos_entrados_al: TIntegerField
      FieldName = 'bultos_entrados_al'
      Origin = 'BDFRIGO.almacenes.bultos_entrados_al'
    end
    object QMaestrobultos_salidos_al: TIntegerField
      FieldName = 'bultos_salidos_al'
      Origin = 'BDFRIGO.almacenes.bultos_salidos_al'
    end
    object QMaestrounidades_entradas_al: TFloatField
      FieldName = 'unidades_entradas_al'
      Origin = 'BDFRIGO.almacenes.unidades_entradas_al'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object QMaestrounidades_salidas_al: TFloatField
      FieldName = 'unidades_salidas_al'
      Origin = 'BDFRIGO.almacenes.unidades_salidas_al'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object QMaestrounidades_mermas_al: TFloatField
      FieldName = 'unidades_mermas_al'
      Origin = 'BDFRIGO.almacenes.unidades_mermas_al'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object QMaestrounidades_destruidas_al: TFloatField
      FieldName = 'unidades_destruidas_al'
      Origin = 'BDFRIGO.almacenes.unidades_destruidas_al'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object QMaestrostatus_retenido_al: TStringField
      FieldName = 'status_retenido_al'
      Origin = 'BDFRIGO.almacenes.status_retenido_al'
      FixedChar = True
      Size = 1
    end
    object QMaestronumero_camara_al: TSmallintField
      FieldName = 'numero_camara_al'
      Origin = 'BDFRIGO.almacenes.numero_camara_al'
    end
    object QMaestrozona_al: TStringField
      FieldName = 'zona_al'
      Origin = 'BDFRIGO.almacenes.zona_al'
      FixedChar = True
      Size = 6
    end
    object QMaestrotipo_lote_al: TStringField
      FieldName = 'tipo_lote_al'
      Origin = 'BDFRIGO.almacenes.tipo_lote_al'
      FixedChar = True
      Size = 1
    end
    object QMaestrounid_sal_mismo_dia_al: TFloatField
      FieldName = 'unid_sal_mismo_dia_al'
      Origin = 'BDFRIGO.almacenes.unid_sal_mismo_dia_al'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object QMaestropalets_entrados_al: TIntegerField
      FieldName = 'palets_entrados_al'
      Origin = 'BDFRIGO.almacenes.palets_entrados_al'
    end
    object QMaestropalets_salidos_al: TIntegerField
      FieldName = 'palets_salidos_al'
      Origin = 'BDFRIGO.almacenes.palets_salidos_al'
    end
    object QMaestroestuches_sueltos_al: TIntegerField
      FieldName = 'estuches_sueltos_al'
      Origin = 'BDFRIGO.almacenes.estuches_sueltos_al'
    end
    object QMaestroCALCBULTOS_STOCK: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CALC_BULTOS_STOCK'
      Calculated = True
    end
    object QMaestroCALC_PALETS_STOCK: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CALC_PALETS_STOCK'
      Calculated = True
    end
    object QMaestroCALC_UNIDADES_STOCK: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_UNIDADES_STOCK'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
      Calculated = True
    end
    object QMaestrofecha_entrada_al: TStringField
      FieldName = 'fecha_entrada_al'
      Origin = 'BDFRIGO.almacenes.fecha_entrada_al'
      FixedChar = True
      Size = 10
    end
    object QMaestrofecha_caducidad_al: TStringField
      FieldName = 'fecha_caducidad_al'
      Origin = 'BDFRIGO.almacenes.fecha_caducidad_al'
      FixedChar = True
      Size = 10
    end
    object QMaestroestuches_totales_al: TIntegerField
      FieldName = 'estuches_totales_al'
      Origin = 'BDFRIGO.almacenes.estuches_totales_al'
    end
    object QMaestroestuches_bulto_al: TIntegerField
      FieldName = 'estuches_bulto_al'
      Origin = 'BDFRIGO.almacenes.estuches_bulto_al'
    end
    object QMaestrofecha_modif_al: TStringField
      FieldName = 'fecha_modif_al'
      Origin = 'BDFRIGO.almacenes.fecha_modif_al'
      FixedChar = True
      Size = 10
    end
    object QMaestroobservaciones_retenido_al: TStringField
      FieldName = 'observaciones_retenido_al'
      Origin = 'BDFRIGO.almacenes.observaciones_retenido_al'
      Size = 60
    end
    object QMaestrolote_origen_al: TStringField
      FieldName = 'lote_origen_al'
      Size = 10
    end
  end
  object DSMaestro: TDataSource
    DataSet = QMaestro
    OnStateChange = DSMaestroStateChange
    Left = 336
    Top = 97
  end
  object QContar: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select count(*) from almacenes')
    Left = 384
    Top = 97
  end
  object QTiposLote: TQuery
    OnCalcFields = QTiposLoteCalcFields
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select *'
      'from tipos_lote'
      ''
      '')
    Left = 472
    Top = 96
    object QTiposLotedes: TStringField
      FieldKind = fkCalculated
      FieldName = 'des'
      Size = 50
      Calculated = True
    end
    object QTiposLotecodigo_tl: TStringField
      FieldName = 'codigo_tl'
      Origin = 'BDFRIGO."dbo.tipos_lote".codigo_tl'
      FixedChar = True
      Size = 1
    end
    object QTiposLotedescripcion_tl: TStringField
      FieldName = 'descripcion_tl'
      Origin = 'BDFRIGO."dbo.tipos_lote".descripcion_tl'
      FixedChar = True
      Size = 35
    end
  end
  object DSTiposEntrada: TDataSource
    DataSet = QTiposLote
    Left = 504
    Top = 96
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
