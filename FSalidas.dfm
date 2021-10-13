object Salidas: TSalidas
  Left = 101
  Top = 151
  HorzScrollBar.Visible = False
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Mantenimiento de Albaranes de Salidas'
  ClientHeight = 648
  ClientWidth = 1064
  Color = clBtnFace
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
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PanelLineas: TPanel
    Left = 0
    Top = 344
    Width = 1081
    Height = 284
    Enabled = False
    TabOrder = 4
    object GridLineas: TDBGrid
      Left = 1
      Top = 1
      Width = 1079
      Height = 282
      Align = alClient
      Ctl3D = True
      DataSource = DSLineas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -8
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnDblClick = GridLineasDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'lote_ls'
          Title.Caption = 'Lote'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tipo_lote_ls'
          Title.Caption = 'Tipo Lote'
          Width = 89
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'familia_ls'
          Title.Caption = 'Familia'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'NombreFamilia'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'lote_origen_ls'
          Title.Caption = 'Lote Origen'
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'articulo_ls'
          Title.Caption = 'Art'#237'culo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NombreArticulo'
          Title.Caption = 'Nombre Art'#237'culo'
          Width = 188
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Camara'
          Width = 51
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Zona'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'bultos_ls'
          Title.Caption = 'Bultos'
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'palets_ls'
          Title.Caption = 'Palets'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'estuches_sueltos_ls'
          Title.Caption = 'Estuches'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'unidades_ls'
          Title.Caption = 'Unidades'
          Width = 84
          Visible = True
        end>
    end
  end
  object BarraEstado: TStatusBar
    Left = 0
    Top = 625
    Width = 1064
    Height = 23
    Color = 15395562
    Panels = <
      item
        Width = 850
      end
      item
        Width = 50
      end>
  end
  object PanelClaves: TPanel
    Left = 0
    Top = 38
    Width = 1064
    Height = 41
    Align = alTop
    Color = 15395562
    ParentBackground = False
    TabOrder = 0
    OnExit = PanelClavesExit
    object StaticText12: TStaticText
      Left = 25
      Top = 12
      Width = 66
      Height = 20
      AutoSize = False
      Caption = 'Empresa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object cEmpresa: TEdit
      Left = 115
      Top = 9
      Width = 36
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
      OnChange = cEmpresaChange
      OnEnter = ColorEnter
      OnExit = cEmpresaExit
      OnKeyDown = cEmpresaKeyDown
    end
    object tNomEmpresa: TPanel
      Left = 177
      Top = 9
      Width = 265
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 2
    end
    object StaticText1: TStaticText
      Left = 455
      Top = 11
      Width = 58
      Height = 20
      Caption = 'Albar'#225'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object cAlbaran: TEdit
      Left = 528
      Top = 9
      Width = 58
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 7
      ParentFont = False
      TabOrder = 3
      OnEnter = ColorEnter
      OnExit = ColorExitSinCeros
    end
    object cLupaEmpresas: TSimpleSearch
      Left = 152
      Top = 9
      Width = 24
      Height = 24
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
  end
  object PanelCabecera: TPanel
    Left = 0
    Top = 79
    Width = 1064
    Height = 264
    Align = alTop
    BorderStyle = bsSingle
    Color = 15128264
    ParentBackground = False
    TabOrder = 1
    object StaticText13: TStaticText
      Left = 25
      Top = 13
      Width = 52
      Height = 20
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 16
    end
    object StaticText2: TStaticText
      Left = 25
      Top = 39
      Width = 47
      Height = 20
      Caption = 'Fecha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 17
    end
    object StaticText3: TStaticText
      Left = 215
      Top = 39
      Width = 38
      Height = 20
      Caption = 'Hora'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 18
    end
    object StaticText4: TStaticText
      Left = 25
      Top = 91
      Width = 85
      Height = 20
      Caption = 'Tipo Salida'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 23
    end
    object tNomcliente: TPanel
      Left = 176
      Top = 10
      Width = 265
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 2
    end
    object StaticText5: TStaticText
      Left = 25
      Top = 117
      Width = 67
      Height = 20
      Caption = 'Orden N'#186
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 25
    end
    object StaticText7: TStaticText
      Left = 25
      Top = 141
      Width = 67
      Height = 20
      Caption = 'Matricula'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 26
    end
    object StaticText11: TStaticText
      Left = 286
      Top = 91
      Width = 109
      Height = 20
      Caption = 'Observaciones'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 24
    end
    object cMatricula: TcxDBTextEdit
      Left = 115
      Top = 140
      DataBinding.DataField = 'matricula_cs'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 9
      Width = 208
    end
    object cCliente: TcxDBTextEdit
      Left = 115
      Top = 10
      AutoSize = False
      DataBinding.DataField = 'cliente_cs'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.OnChange = cClienteChange
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 0
      OnExit = cClienteExit
      OnKeyDown = cClienteKeyDown
      Height = 24
      Width = 36
    end
    object cTipoSalida: TDBLookupComboBox
      Left = 115
      Top = 88
      Width = 166
      Height = 24
      DataField = 'tipo_salida_cs'
      DataSource = DSMaestro
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'codigo_ts'
      ListField = 'des'
      ListSource = DSTiposSalida
      ParentFont = False
      TabOrder = 7
      OnEnter = cTipoSalidaEnter
      OnKeyPress = cTipoSalidaKeyPress
    end
    object cHora: TMaskEdit
      Left = 254
      Top = 37
      Width = 55
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
      TabOrder = 4
      OnChange = cHoraChange
      OnEnter = cHoraEnter
      OnExit = cHoraExit
    end
    object Panel1: TPanel
      Left = 0
      Top = 194
      Width = 1077
      Height = 67
      Color = 15128264
      ParentBackground = False
      TabOrder = 15
      object StaticText8: TStaticText
        Left = 154
        Top = 11
        Width = 56
        Height = 20
        Caption = 'Importe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object cImporte: TcxDBTextEdit
        Left = 233
        Top = 7
        DataBinding.DataField = 'importe_salida_cs'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 0
        OnExit = cImporteExit
        Width = 100
      end
      object cConcepto: TcxDBTextEdit
        Left = 233
        Top = 34
        DataBinding.DataField = 'concepto_cs'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 4
        Width = 605
      end
      object StaticText10: TStaticText
        Left = 154
        Top = 38
        Width = 70
        Height = 20
        Caption = 'Concepto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
      object StaticText9: TStaticText
        Left = 639
        Top = 11
        Width = 120
        Height = 20
        Caption = 'Horas a Facturar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object cHorasFacturar: TcxDBTextEdit
        Left = 769
        Top = 7
        DataBinding.DataField = 'horas_salida_cs'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 1
        OnExit = cHorasFacturarExit
        Width = 68
      end
    end
    object GroupBox1: TGroupBox
      Left = 504
      Top = 1
      Width = 480
      Height = 53
      Caption = 'Retira'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      object StaticText18: TStaticText
        Left = 340
        Top = 22
        Width = 44
        Height = 20
        Caption = 'N.I.F. '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object cRetira: TcxDBTextEdit
        Left = 11
        Top = 20
        AutoSize = False
        DataBinding.DataField = 'retira_cs'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 0
        Height = 24
        Width = 320
      end
      object cNifRetira: TcxDBTextEdit
        Left = 381
        Top = 20
        DataBinding.DataField = 'nif_retira_cs'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 1
        Width = 89
      end
    end
    object cOrden: TcxDBTextEdit
      Left = 115
      Top = 114
      DataBinding.DataField = 'orden_numero_cs'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 8
      Width = 141
    end
    object cObservaciones: TcxDBTextEdit
      Left = 395
      Top = 88
      AutoSize = False
      DataBinding.DataField = 'observaciones_cs'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 12
      Height = 24
      Width = 590
    end
    object GroupBox2: TGroupBox
      Left = 395
      Top = 112
      Width = 590
      Height = 52
      Caption = 'Autorizados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 13
      object tAutorizado1: TPanel
        Left = 8
        Top = 18
        Width = 265
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 0
      end
      object tAutorizado2: TPanel
        Left = 314
        Top = 18
        Width = 265
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 1
      end
    end
    object cFechaAlbaran: TcxDateEdit
      Left = 115
      Top = 37
      ParentFont = False
      Properties.OnChange = cFechaAlbaranChange
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 3
      OnDblClick = cFechaAlbaranDblClick
      OnEnter = cFechaAlbaranEnter
      OnExit = cFechaExit
      Width = 94
    end
    object StaticText16: TStaticText
      Left = 285
      Top = 61
      Width = 57
      Height = 20
      Caption = 'Destino'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 20
    end
    object cDestino: TcxDBTextEdit
      Left = 395
      Top = 62
      AutoSize = False
      DataBinding.DataField = 'destino_cs'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 11
      Height = 24
      Width = 590
    end
    object StaticText17: TStaticText
      Left = 25
      Top = 65
      Width = 93
      Height = 20
      Caption = 'Temperatura'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 22
    end
    object cTemperatura: TcxDBTextEdit
      Left = 115
      Top = 62
      DataBinding.DataField = 'temperatura_cs'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 6
      OnExit = cTemperaturaExit
      Width = 31
    end
    object StaticText20: TStaticText
      Left = 148
      Top = 63
      Width = 20
      Height = 20
      Caption = #186'C'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 21
    end
    object StaticText27: TStaticText
      Left = 25
      Top = 168
      Width = 45
      Height = 20
      Caption = 'Notas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 27
    end
    object CNotas: TcxDBTextEdit
      Left = 115
      Top = 166
      AutoSize = False
      DataBinding.DataField = 'notas_cs'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 14
      Height = 24
      Width = 870
    end
    object StaticText28: TStaticText
      Left = 314
      Top = 39
      Width = 58
      Height = 20
      Caption = 'Ref. Cli.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 19
    end
    object cRefCliente_: TcxDBTextEdit
      Left = 370
      Top = 37
      TabStop = False
      DataBinding.DataField = 'ref_cliente_cs'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 5
      Width = 72
    end
    object cLupaClientes: TSimpleSearch
      Left = 151
      Top = 10
      Width = 24
      Height = 24
      Enabled = False
      TabOrder = 1
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
  object PanelInsertarLinea: TPanel
    Left = 0
    Top = 572
    Width = 1064
    Height = 53
    Align = alBottom
    BorderStyle = bsSingle
    Color = 15128264
    ParentBackground = False
    TabOrder = 7
    Visible = False
    object cFamilia: TcxDBTextEdit
      Left = 95
      Top = 26
      DataBinding.DataField = 'familia_ls'
      DataBinding.DataSource = DSLineas
      Properties.OnChange = cFamiliaChange
      TabOrder = 12
      OnClick = cFamiliaClick
      OnEnter = cFamiliaEnter
      OnExit = cFamiliaExit
      OnKeyDown = cFamiliaKeyDown
      Width = 29
    end
    object cArticulo: TcxDBTextEdit
      Left = 247
      Top = 26
      AutoSize = False
      DataBinding.DataField = 'articulo_ls'
      DataBinding.DataSource = DSLineas
      Properties.OnChange = cArticuloChange
      TabOrder = 15
      OnClick = cArticuloClick
      OnEnter = cArticuloEnter
      OnExit = cArticuloExit
      OnKeyDown = cArticuloKeyDown
      Height = 21
      Width = 37
    end
    object cLote: TcxDBTextEdit
      Left = 2
      Top = 26
      DataBinding.DataField = 'lote_ls'
      DataBinding.DataSource = DSLineas
      Properties.CharCase = ecUpperCase
      TabOrder = 10
      OnEnter = cLoteEnter
      OnExit = cLoteExit
      OnKeyDown = cLoteKeyDown
      Width = 75
    end
    object tNomFamilia: TPanel
      Left = 897
      Top = 26
      Width = 47
      Height = 21
      Alignment = taLeftJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBackground = False
      ParentColor = True
      ParentFont = False
      TabOrder = 25
      Visible = False
    end
    object tNomArticulo: TPanel
      Left = 302
      Top = 27
      Width = 198
      Height = 19
      Alignment = taLeftJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBackground = False
      ParentColor = True
      ParentFont = False
      TabOrder = 26
    end
    object StaticText14: TStaticText
      Left = 95
      Top = 5
      Width = 46
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Familia'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 1
    end
    object StaticText15: TStaticText
      Left = 247
      Top = 5
      Width = 253
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Art'#237'culo'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 3
    end
    object StaticText19: TStaticText
      Left = 628
      Top = 5
      Width = 58
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Bultos'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 6
    end
    object StaticText21: TStaticText
      Left = 756
      Top = 5
      Width = 32
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Est.'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 8
    end
    object StaticText22: TStaticText
      Left = 790
      Top = 5
      Width = 87
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Unidades'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 9
    end
    object StaticText23: TStaticText
      Left = 687
      Top = 5
      Width = 68
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Palets'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 7
    end
    object StaticText24: TStaticText
      Left = 2
      Top = 5
      Width = 92
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Lote'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
    object StaticText25: TStaticText
      Left = 502
      Top = 5
      Width = 55
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'C'#225'mara'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 4
    end
    object StaticText26: TStaticText
      Left = 559
      Top = 5
      Width = 68
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Zona'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 5
    end
    object cBultos: TDBEdit
      Left = 628
      Top = 26
      Width = 57
      Height = 19
      AutoSize = False
      DataField = 'bultos_ls'
      DataSource = DSLineas
      TabOrder = 21
      OnEnter = ColorEnter
      OnExit = cBultosExit
      OnKeyPress = SinSignos
    end
    object cPalets: TDBEdit
      Left = 687
      Top = 26
      Width = 67
      Height = 19
      AutoSize = False
      DataField = 'palets_ls'
      DataSource = DSLineas
      TabOrder = 22
      OnEnter = ColorEnter
      OnExit = cPaletsExit
      OnKeyPress = SinSignos
    end
    object cEstuches: TDBEdit
      Left = 756
      Top = 26
      Width = 31
      Height = 19
      AutoSize = False
      DataField = 'estuches_sueltos_ls'
      DataSource = DSLineas
      TabOrder = 23
      OnEnter = ColorEnter
      OnExit = cEstuchesExit
      OnKeyPress = SinSignos
    end
    object cCamara: TEdit
      Left = 502
      Top = 26
      Width = 34
      Height = 19
      AutoSize = False
      TabOrder = 17
      OnEnter = cCamaraEnter
      OnExit = cCamaraExit
      OnKeyDown = cCamaraKeyDown
    end
    object cZona: TEdit
      Left = 559
      Top = 26
      Width = 48
      Height = 19
      AutoSize = False
      TabOrder = 19
      OnEnter = cZonaEnter
      OnExit = cZonaExit
      OnKeyDown = cCamaraKeyDown
    end
    object LupaArticulo: TSimpleSearch
      Left = 284
      Top = 26
      Width = 16
      Height = 21
      TabOrder = 16
      TabStop = False
      OnClick = cLupaArticulosClick
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'MoneyTwins'
      OptionsImage.ImageIndex = 2
      OptionsImage.Images = FDM.ilxImagenes
      Titulo = 'Busqueda de Art'#237'culo'
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
    object LupaFamilia: TSimpleSearch
      Left = 124
      Top = 26
      Width = 16
      Height = 21
      TabOrder = 13
      TabStop = False
      OnClick = cLupaFamiliasClick
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'MoneyTwins'
      OptionsImage.ImageIndex = 2
      OptionsImage.Images = FDM.ilxImagenes
      Titulo = 'Busqueda de Familia'
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
    object LupaLote: TSimpleSearch
      Left = 78
      Top = 26
      Width = 16
      Height = 21
      TabOrder = 11
      TabStop = False
      OnClick = LupaLoteClick
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'MoneyTwins'
      OptionsImage.ImageIndex = 2
      OptionsImage.Images = FDM.ilxImagenes
      Titulo = 'Busqueda de Lote'
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
      Database = 'BDFrigo'
      Tecla = '<Ninguna>'
      Concatenar = False
    end
    object LupaCamara: TSimpleSearch
      Left = 539
      Top = 26
      Width = 16
      Height = 21
      TabOrder = 18
      TabStop = False
      OnClick = LupaCamaraClick
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'MoneyTwins'
      OptionsImage.ImageIndex = 2
      OptionsImage.Images = FDM.ilxImagenes
      Titulo = 'Busqueda de Camara'
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
    object LupaZona: TSimpleSearch
      Left = 609
      Top = 26
      Width = 16
      Height = 21
      TabOrder = 20
      TabStop = False
      OnClick = LupaZonaClick
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'MoneyTwins'
      OptionsImage.ImageIndex = 2
      OptionsImage.Images = FDM.ilxImagenes
      Titulo = 'Busqueda de Zona'
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
    object cUnidades: TcxDBCurrencyEdit
      Left = 790
      Top = 26
      DataBinding.DataField = 'unidades_ls'
      DataBinding.DataSource = DSLineas
      TabOrder = 24
      OnEnter = cUnidadesEnter
      OnExit = cUnidadesExit
      OnKeyPress = SinSignos
      Width = 87
    end
    object StaticText29: TStaticText
      Left = 142
      Top = 5
      Width = 104
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Lote Origen'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 2
    end
    object cLoteOrigen: TcxDBTextEdit
      Left = 142
      Top = 26
      DataBinding.DataField = 'lote_origen_ls'
      DataBinding.DataSource = DSLineas
      Properties.CharCase = ecUpperCase
      TabOrder = 14
      OnExit = cLoteOrigenExit
      Width = 104
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 885
    Top = 34
  end
  object QMaestro: TQuery
    AfterOpen = QMaestroAfterOpen
    BeforeClose = QMaestroBeforeClose
    AfterInsert = QMaestroAfterInsert
    BeforeEdit = QMaestroBeforeEdit
    AfterEdit = QMaestroAfterEdit
    BeforePost = QMaestroBeforePost
    AfterCancel = QMaestroAfterCancel
    DatabaseName = 'BDFrigo'
    RequestLive = True
    SQL.Strings = (
      'select * from cabecera_salidas')
    Left = 765
    Top = 33
    object QMaestroempresa_cs: TStringField
      FieldName = 'empresa_cs'
      Origin = 'BDFRIGO.cabecera_salidas.empresa_cs'
      FixedChar = True
      Size = 3
    end
    object QMaestroalbaran_cs: TIntegerField
      FieldName = 'albaran_cs'
      Origin = 'BDFRIGO.cabecera_salidas.albaran_cs'
    end
    object QMaestrocliente_cs: TStringField
      FieldName = 'cliente_cs'
      Origin = 'BDFRIGO.cabecera_salidas.cliente_cs'
      FixedChar = True
      Size = 4
    end
    object QMaestrotipo_salida_cs: TStringField
      FieldName = 'tipo_salida_cs'
      Origin = 'BDFRIGO.cabecera_salidas.tipo_salida_cs'
      FixedChar = True
      Size = 1
    end
    object QMaestroimporte_salida_cs: TFloatField
      FieldName = 'importe_salida_cs'
      Origin = 'BDFRIGO.cabecera_salidas.importe_salida_cs'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object QMaestrohoras_salida_cs: TFloatField
      FieldName = 'horas_salida_cs'
      Origin = 'BDFRIGO.cabecera_salidas.horas_salida_cs'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object QMaestronumero_factura_cs: TIntegerField
      FieldName = 'numero_factura_cs'
      Origin = 'BDFRIGO.cabecera_salidas.numero_factura_cs'
    end
    object QMaestroorden_numero_cs: TStringField
      FieldName = 'orden_numero_cs'
      Origin = 'BDFRIGO.cabecera_salidas.orden_numero_cs'
      FixedChar = True
      Size = 12
    end
    object QMaestromatricula_cs: TStringField
      FieldName = 'matricula_cs'
      Origin = 'BDFRIGO.cabecera_salidas.matricula_cs'
      FixedChar = True
      Size = 30
    end
    object QMaestroretira_cs: TStringField
      FieldName = 'retira_cs'
      Origin = 'BDFRIGO.cabecera_salidas.retira_cs'
      FixedChar = True
      Size = 40
    end
    object QMaestronif_retira_cs: TStringField
      FieldName = 'nif_retira_cs'
      Origin = 'BDFRIGO.cabecera_salidas.nif_retira_cs'
      FixedChar = True
      Size = 15
    end
    object QMaestrohora_cs: TStringField
      FieldName = 'hora_cs'
      Origin = 'BDFRIGO.cabecera_salidas.hora_cs'
      FixedChar = True
      Size = 8
    end
    object QMaestroconcepto_cs: TStringField
      FieldName = 'concepto_cs'
      Origin = 'BDFRIGO.cabecera_salidas.concepto_cs'
      FixedChar = True
      Size = 60
    end
    object QMaestrofecha_albaran_cs: TStringField
      FieldName = 'fecha_albaran_cs'
      Origin = 'BDFRIGO.cabecera_salidas.fecha_albaran_cs'
      FixedChar = True
      Size = 10
    end
    object QMaestrofecha_factura_cs: TStringField
      FieldName = 'fecha_factura_cs'
      Origin = 'BDFRIGO.cabecera_salidas.fecha_factura_cs'
      FixedChar = True
      Size = 10
    end
    object QMaestrodestino_cs: TStringField
      FieldName = 'destino_cs'
      Origin = 'BDFRIGO.cabecera_salidas.destino_cs'
      FixedChar = True
      Size = 30
    end
    object QMaestroobservaciones_cs: TStringField
      FieldName = 'observaciones_cs'
      Origin = 'BDFRIGO.cabecera_salidas.observaciones_cs'
      FixedChar = True
      Size = 60
    end
    object QMaestrofecha_modif_cs: TStringField
      FieldName = 'fecha_modif_cs'
      Origin = 'BDFRIGO.cabecera_salidas.fecha_modif_cs'
      FixedChar = True
      Size = 10
    end
    object QMaestrotemperatura_cs: TSmallintField
      FieldName = 'temperatura_cs'
      Origin = 'BDFRIGO.cabecera_salidas.temperatura_cs'
    end
    object QMaestronotas_cs: TStringField
      DisplayWidth = 250
      FieldName = 'notas_cs'
      Size = 250
    end
    object QMaestroref_cliente_cs: TStringField
      FieldName = 'ref_cliente_cs'
      Origin = 'BDFRIGO.cabecera_salidas.ref_cliente_cs'
      FixedChar = True
      Size = 9
    end
  end
  object DSMaestro: TDataSource
    DataSet = QMaestro
    OnStateChange = DSMaestroStateChange
    Left = 797
    Top = 33
  end
  object QContar: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select count(*) from cabecera_salidas')
    Left = 845
    Top = 33
  end
  object DSLineas: TDataSource
    DataSet = QLineas
    Left = 799
    Top = 64
  end
  object QLineas: TQuery
    BeforeInsert = QLineasBeforeInsert
    BeforeEdit = QLineasBeforeEdit
    BeforePost = QLineasBeforePost
    OnCalcFields = QLineasCalcFields
    DatabaseName = 'BDFrigo'
    DataSource = DSMaestro
    RequestLive = True
    SQL.Strings = (
      'select * from linea_salidas'
      'where empresa_ls=:empresa_cs'
      'and albaran_ls=:albaran_cs'
      'order by empresa_ls, albaran_ls, nlinea_ls')
    Left = 766
    Top = 64
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'empresa_cs'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'albaran_cs'
        ParamType = ptUnknown
        Size = 4
      end>
    object QLineasempresa_ls: TStringField
      FieldName = 'empresa_ls'
      Origin = 'BDFRIGO.linea_salidas.empresa_ls'
      FixedChar = True
      Size = 3
    end
    object QLineasalbaran_ls: TIntegerField
      FieldName = 'albaran_ls'
      Origin = 'BDFRIGO.linea_salidas.albaran_ls'
    end
    object QLineasfamilia_ls: TStringField
      FieldName = 'familia_ls'
      Origin = 'BDFRIGO.linea_salidas.familia_ls'
      FixedChar = True
      Size = 3
    end
    object QLineasarticulo_ls: TStringField
      FieldName = 'articulo_ls'
      Origin = 'BDFRIGO.linea_salidas.articulo_ls'
      FixedChar = True
      Size = 5
    end
    object QLineaslote_ls: TStringField
      DisplayWidth = 8
      FieldName = 'lote_ls'
      Origin = 'BDFRIGO.linea_salidas.lote_ls'
      FixedChar = True
      Size = 7
    end
    object QLineasbultos_ls: TIntegerField
      FieldName = 'bultos_ls'
      Origin = 'BDFRIGO.linea_salidas.bultos_ls'
    end
    object QLineasunidades_ls: TFloatField
      FieldName = 'unidades_ls'
      Origin = 'BDFRIGO.linea_salidas.unidades_ls'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object QLineasestuches_sueltos_ls: TSmallintField
      FieldName = 'estuches_sueltos_ls'
      Origin = 'BDFRIGO.linea_salidas.estuches_sueltos_ls'
    end
    object QLineastipo_lote_ls: TStringField
      FieldName = 'tipo_lote_ls'
      Origin = 'BDFRIGO.linea_salidas.tipo_lote_ls'
      FixedChar = True
      Size = 1
    end
    object QLineaspalets_ls: TIntegerField
      FieldName = 'palets_ls'
      Origin = 'BDFRIGO.linea_salidas.palets_ls'
    end
    object QLineasNombreFamilia: TStringField
      FieldKind = fkCalculated
      FieldName = 'NombreFamilia'
      Size = 30
      Calculated = True
    end
    object QLineasNombreArticulo: TStringField
      FieldKind = fkCalculated
      FieldName = 'NombreArticulo'
      Size = 30
      Calculated = True
    end
    object QLineasCamara: TSmallintField
      FieldKind = fkCalculated
      FieldName = 'Camara'
      DisplayFormat = '#'
      Calculated = True
    end
    object QLineasZona: TStringField
      FieldKind = fkCalculated
      FieldName = 'Zona'
      Size = 6
      Calculated = True
    end
    object QLineasfecha_modif_ls: TStringField
      FieldName = 'fecha_modif_ls'
      Origin = 'BDFRIGO.linea_salidas.fecha_modif_ls'
      FixedChar = True
      Size = 10
    end
    object QLineasnlinea_ls: TIntegerField
      FieldName = 'nlinea_ls'
      Origin = 'BDFRIGO.linea_salidas.nlinea_ls'
    end
    object QLineaslote_origen_ls: TStringField
      FieldName = 'lote_origen_ls'
      Size = 10
    end
  end
  object QArticulos: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select *'
      'from articulos')
    Left = 844
    Top = 64
  end
  object QTiposSalida: TQuery
    OnCalcFields = QTiposSalidaCalcFields
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select *'
      'from tipos_salida')
    Left = 920
    Top = 32
    object QTiposSalidacodigo_ts: TStringField
      FieldName = 'codigo_ts'
      Origin = 'BDFRIGO."dbo.tipos_salida".codigo_ts'
      FixedChar = True
      Size = 1
    end
    object QTiposSalidadescripcion_ts: TStringField
      FieldName = 'descripcion_ts'
      Origin = 'BDFRIGO."dbo.tipos_salida".descripcion_ts'
      FixedChar = True
      Size = 15
    end
    object QTiposSalidades: TStringField
      FieldKind = fkCalculated
      FieldName = 'des'
      Size = 50
      Calculated = True
    end
  end
  object QFamilias: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select * from familias')
    Left = 884
    Top = 64
  end
  object DSTiposSalida: TDataSource
    DataSet = QTiposSalida
    Left = 920
    Top = 64
  end
  object QAlmacenes: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'SELECT * FROM ALMACENES')
    Left = 960
    Top = 32
    object QAlmacenesempresa_al: TStringField
      FieldName = 'empresa_al'
      Origin = 'BDFRIGO.almacenes.empresa_al'
      FixedChar = True
      Size = 3
    end
    object QAlmacenescliente_al: TStringField
      FieldName = 'cliente_al'
      Origin = 'BDFRIGO.almacenes.cliente_al'
      FixedChar = True
      Size = 4
    end
    object QAlmacenesfamilia_al: TStringField
      FieldName = 'familia_al'
      Origin = 'BDFRIGO.almacenes.familia_al'
      FixedChar = True
      Size = 3
    end
    object QAlmacenesarticulo_al: TStringField
      FieldName = 'articulo_al'
      Origin = 'BDFRIGO.almacenes.articulo_al'
      FixedChar = True
      Size = 5
    end
    object QAlmaceneslote_al: TStringField
      FieldName = 'lote_al'
      Origin = 'BDFRIGO.almacenes.lote_al'
      FixedChar = True
      Size = 7
    end
    object QAlmacenesbultos_entrados_al: TIntegerField
      FieldName = 'bultos_entrados_al'
      Origin = 'BDFRIGO.almacenes.bultos_entrados_al'
    end
    object QAlmacenesbultos_salidos_al: TIntegerField
      FieldName = 'bultos_salidos_al'
      Origin = 'BDFRIGO.almacenes.bultos_salidos_al'
    end
    object QAlmacenesunidades_entradas_al: TFloatField
      FieldName = 'unidades_entradas_al'
      Origin = 'BDFRIGO.almacenes.unidades_entradas_al'
    end
    object QAlmacenesunidades_salidas_al: TFloatField
      FieldName = 'unidades_salidas_al'
      Origin = 'BDFRIGO.almacenes.unidades_salidas_al'
    end
    object QAlmacenesunidades_destruidas_al: TFloatField
      FieldName = 'unidades_destruidas_al'
      Origin = 'BDFRIGO.almacenes.unidades_destruidas_al'
    end
    object QAlmacenesunidades_mermas_al: TFloatField
      FieldName = 'unidades_mermas_al'
      Origin = 'BDFRIGO.almacenes.unidades_mermas_al'
    end
    object QAlmacenesstatus_retenido_al: TStringField
      FieldName = 'status_retenido_al'
      Origin = 'BDFRIGO.almacenes.status_retenido_al'
      FixedChar = True
      Size = 1
    end
    object QAlmacenesnumero_camara_al: TSmallintField
      FieldName = 'numero_camara_al'
      Origin = 'BDFRIGO.almacenes.numero_camara_al'
    end
    object QAlmaceneszona_al: TStringField
      FieldName = 'zona_al'
      Origin = 'BDFRIGO.almacenes.zona_al'
      FixedChar = True
      Size = 6
    end
    object QAlmacenesestuches_sueltos_al: TIntegerField
      FieldName = 'estuches_sueltos_al'
      Origin = 'BDFRIGO.almacenes.estuches_sueltos_al'
    end
    object QAlmacenestipo_lote_al: TStringField
      FieldName = 'tipo_lote_al'
      Origin = 'BDFRIGO.almacenes.tipo_lote_al'
      FixedChar = True
      Size = 1
    end
    object QAlmacenesunid_sal_mismo_dia_al: TFloatField
      FieldName = 'unid_sal_mismo_dia_al'
      Origin = 'BDFRIGO.almacenes.unid_sal_mismo_dia_al'
    end
    object QAlmacenespalets_entrados_al: TIntegerField
      FieldName = 'palets_entrados_al'
      Origin = 'BDFRIGO.almacenes.palets_entrados_al'
    end
    object QAlmacenespalets_salidos_al: TIntegerField
      FieldName = 'palets_salidos_al'
      Origin = 'BDFRIGO.almacenes.palets_salidos_al'
    end
    object QAlmacenesfecha_entrada_al: TStringField
      FieldName = 'fecha_entrada_al'
      Origin = 'BDFRIGO.almacenes.fecha_entrada_al'
      FixedChar = True
      Size = 10
    end
    object QAlmacenesfecha_caducidad_al: TStringField
      FieldName = 'fecha_caducidad_al'
      Origin = 'BDFRIGO.almacenes.fecha_caducidad_al'
      FixedChar = True
      Size = 10
    end
    object QAlmacenesestuches_bulto_al: TIntegerField
      FieldName = 'estuches_bulto_al'
      Origin = 'BDFRIGO.ALMACENES.estuches_bulto_al'
    end
    object QAlmacenesestuches_totales_al: TIntegerField
      FieldName = 'estuches_totales_al'
      Origin = 'BDFRIGO.ALMACENES.estuches_totales_al'
    end
    object QAlmacenesfecha_modif_al: TStringField
      FieldName = 'fecha_modif_al'
      Origin = 'BDFRIGO.ALMACENES.fecha_modif_al'
      FixedChar = True
      Size = 10
    end
    object QAlmacenesobservaciones_retenido_al: TStringField
      FieldName = 'observaciones_retenido_al'
      Origin = 'BDFRIGO.almacenes.observaciones_retenido_al'
      Size = 60
    end
    object strngfldQAlmaceneslote_origen_al: TStringField
      FieldName = 'lote_origen_al'
      Size = 10
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
    Left = 736
    Top = 32
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
          ItemName = 'bAltaL'
        end
        item
          Visible = True
          ItemName = 'bBorrarL'
        end
        item
          Visible = True
          ItemName = 'bPrimeroL'
        end
        item
          Visible = True
          ItemName = 'bAnteriorL'
        end
        item
          Visible = True
          ItemName = 'bSiguienteL'
        end
        item
          Visible = True
          ItemName = 'bUltimoL'
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
      Visible = ivAlways
      LargeImageIndex = 0
      OnClick = Alta
      AutoGrayScale = False
    end
    object bBorrar: TdxBarLargeButton
      Caption = 'Borrar'
      Category = 0
      Enabled = False
      Hint = 'Borrar Registro'
      Visible = ivAlways
      LargeImageIndex = 1
      OnClick = Borrar
      AutoGrayScale = False
    end
    object bAltaL: TdxBarLargeButton
      Caption = 'Alta L'#237'nea'
      Category = 0
      Enabled = False
      Hint = 'Alta L'#237'nea'
      Visible = ivAlways
      LargeImageIndex = 13
      OnClick = BAltaLinea
      AutoGrayScale = False
    end
    object bBorrarL: TdxBarLargeButton
      Caption = 'Borrar Linea'
      Category = 0
      Enabled = False
      Hint = 'Borrar Linea'
      Visible = ivAlways
      LargeImageIndex = 14
      OnClick = BBorrarLinea
      AutoGrayScale = False
    end
    object bUltimoL: TdxBarLargeButton
      Caption = 'Ult. L'#237'nea'
      Category = 0
      Enabled = False
      Hint = #218'ltima Linea'
      Visible = ivAlways
      LargeImageIndex = 17
      OnClick = BUltimoLClick
      AutoGrayScale = False
    end
    object bSiguienteL: TdxBarLargeButton
      Caption = 'Sig. L'#237'nea'
      Category = 0
      Enabled = False
      Hint = 'Siguiente L'#237'nea'
      Visible = ivAlways
      LargeImageIndex = 18
      OnClick = BSiguienteLClick
      AutoGrayScale = False
    end
    object bPrimeroL: TdxBarLargeButton
      Caption = 'Prim. L'#237'nea'
      Category = 0
      Enabled = False
      Hint = 'Primera Linea'
      Visible = ivAlways
      LargeImageIndex = 19
      OnClick = BPrimeroLClick
      AutoGrayScale = False
    end
    object bAnteriorL: TdxBarLargeButton
      Caption = 'Ant. L'#237'nea'
      Category = 0
      Enabled = False
      Hint = 'Anterior L'#237'nea'
      Visible = ivAlways
      LargeImageIndex = 20
      OnClick = BAnteriorLClick
      AutoGrayScale = False
    end
  end
end
