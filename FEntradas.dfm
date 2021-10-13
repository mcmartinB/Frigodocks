object Entradas: TEntradas
  Left = 131
  Top = 148
  HorzScrollBar.Visible = False
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Mantenimiento de Albaranes de Entradas'
  ClientHeight = 648
  ClientWidth = 1063
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
    Top = 319
    Width = 1069
    Height = 302
    Enabled = False
    TabOrder = 3
    object GridLineas: TDBGrid
      Left = 1
      Top = 1
      Width = 1067
      Height = 300
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
          FieldName = 'familia_le'
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
          FieldName = 'articulo_le'
          Title.Caption = 'Art'#237'culo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NombreArticulo'
          Title.Caption = 'Nombre Art'#237'culo'
          Width = 254
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Caducidad'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'bultos_le'
          Title.Caption = 'Bultos'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'estuches_bulto_le'
          Title.Caption = 'Est.Bulto'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'estuches_sueltos_le'
          Title.Caption = 'Est.Sueltos'
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'unidades_le'
          Title.Caption = 'Unidades'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'palets_le'
          Title.Caption = 'Palets'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lote_le'
          Title.Caption = 'Lote'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lote_origen_le'
          Title.Caption = 'Lote Origen'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'camara_le'
          Title.Caption = 'C'#225'mara'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'zona_le'
          Title.Caption = 'Zona'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'manejo_le'
          Title.Caption = 'Manejo'
          Visible = True
        end>
    end
  end
  object BarraEstado: TStatusBar
    Left = 0
    Top = 625
    Width = 1063
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
    Width = 1063
    Height = 63
    Align = alTop
    Color = 15395562
    ParentBackground = False
    TabOrder = 0
    OnExit = PanelClavesExit
    object StaticText12: TStaticText
      Left = 314
      Top = 6
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
      TabOrder = 3
    end
    object cEmpresa: TEdit
      Left = 393
      Top = 3
      Width = 30
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
      Left = 450
      Top = 3
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
      Left = 314
      Top = 35
      Width = 58
      Height = 20
      Caption = 'Albar'#225'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object cAlbaran: TEdit
      Left = 393
      Top = 32
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
      TabOrder = 4
      OnEnter = ColorEnter
      OnExit = ColorExitSinCeros
    end
    object cLupaEmpresas: TSimpleSearch
      Left = 424
      Top = 3
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
    Top = 101
    Width = 1063
    Height = 221
    Align = alTop
    BorderStyle = bsSingle
    Color = 15128264
    ParentBackground = False
    TabOrder = 1
    object StaticText13: TStaticText
      Left = 30
      Top = 11
      Width = 52
      Height = 20
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 14
    end
    object StaticText2: TStaticText
      Left = 30
      Top = 38
      Width = 47
      Height = 20
      Caption = 'Fecha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 16
    end
    object StaticText3: TStaticText
      Left = 30
      Top = 65
      Width = 38
      Height = 20
      Caption = 'Hora'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 19
    end
    object StaticText4: TStaticText
      Left = 30
      Top = 92
      Width = 94
      Height = 20
      Caption = 'Tipo Entrada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 21
    end
    object StaticText6: TStaticText
      Left = 30
      Top = 120
      Width = 93
      Height = 20
      Caption = 'Temperatura'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 23
    end
    object tNomcliente: TPanel
      Left = 194
      Top = 6
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
      Left = 486
      Top = 11
      Width = 88
      Height = 20
      Caption = 'Trasportista'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 15
    end
    object StaticText7: TStaticText
      Left = 486
      Top = 40
      Width = 67
      Height = 20
      Caption = 'Matricula'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 18
    end
    object StaticText11: TStaticText
      Left = 486
      Top = 68
      Width = 92
      Height = 20
      Caption = 'Procedencia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 20
    end
    object StaticText16: TStaticText
      Left = 486
      Top = 92
      Width = 109
      Height = 20
      Caption = 'Observaciones'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 22
    end
    object StaticText17: TStaticText
      Left = 486
      Top = 120
      Width = 95
      Height = 20
      Caption = 'S/Referencia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 25
    end
    object cTrasportista: TcxDBTextEdit
      Left = 603
      Top = 8
      DataBinding.DataField = 'transportista_ce'
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
      Width = 364
    end
    object cMatricula: TcxDBTextEdit
      Left = 603
      Top = 35
      DataBinding.DataField = 'matricula_ce'
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
      Width = 206
    end
    object cProcedencia: TcxDBTextEdit
      Left = 603
      Top = 63
      DataBinding.DataField = 'procedencia_ce'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 10
      Width = 364
    end
    object cObservacion: TcxDBTextEdit
      Left = 603
      Top = 90
      DataBinding.DataField = 'observaciones_ce'
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
      Width = 364
    end
    object cReferencia: TcxDBTextEdit
      Left = 603
      Top = 118
      DataBinding.DataField = 'concepto2_ce'
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
      Width = 364
    end
    object cCliente: TcxDBTextEdit
      Left = 132
      Top = 6
      DataBinding.DataField = 'cliente_ce'
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
      Width = 36
    end
    object cTipoEntrada: TDBLookupComboBox
      Left = 132
      Top = 90
      Width = 328
      Height = 24
      DataField = 'tipo_entrada_ce'
      DataSource = DSMaestro
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'codigo_te'
      ListField = 'des'
      ListSource = DSTiposEntrada
      ParentFont = False
      TabOrder = 6
      OnEnter = cTipoEntradaEnter
      OnKeyPress = cTipoEntradaKeyPress
    end
    object cTemperatura: TcxDBTextEdit
      Left = 132
      Top = 118
      DataBinding.DataField = 'temperatura_ce'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 7
      OnExit = cTemperaturaExit
      Width = 31
    end
    object cHora: TMaskEdit
      Left = 132
      Top = 63
      Width = 57
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
      OnChange = cHoraChange
      OnEnter = cHoraEnter
      OnExit = cHoraExit
    end
    object StaticText18: TStaticText
      Left = 172
      Top = 120
      Width = 20
      Height = 20
      Caption = #186'C'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 24
    end
    object Panel1: TPanel
      Left = 0
      Top = 147
      Width = 1067
      Height = 69
      ParentColor = True
      TabOrder = 13
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
        DataBinding.DataField = 'importe_entrada_ce'
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
        Top = 35
        DataBinding.DataField = 'concepto_ce'
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
        Top = 39
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
        DataBinding.DataField = 'horas_entrada_ce'
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
    object cFechaAlbaran: TcxDateEdit
      Left = 132
      Top = 35
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
      Width = 100
    end
    object StaticText28: TStaticText
      Left = 244
      Top = 38
      Width = 142
      Height = 20
      Caption = 'Ref. Albar'#225'n Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 17
    end
    object cRefCliente_: TcxDBTextEdit
      Left = 387
      Top = 35
      DataBinding.DataField = 'ref_cliente_ce'
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
      Width = 73
    end
    object cLupaClientes: TSimpleSearch
      Left = 174
      Top = 6
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
    Top = 568
    Width = 1063
    Height = 57
    Align = alBottom
    BorderStyle = bsSingle
    Color = 15128264
    ParentBackground = False
    TabOrder = 7
    Visible = False
    object cFamilia: TcxDBTextEdit
      Left = 10
      Top = 26
      DataBinding.DataField = 'familia_le'
      DataBinding.DataSource = DSLineas
      Properties.OnChange = cFamiliaChange
      TabOrder = 13
      OnEnter = cFamiliaEnter
      OnExit = cFamiliaExit
      OnKeyDown = cFamiliaKeyDown
      Width = 29
    end
    object cArticulo: TcxDBTextEdit
      Left = 56
      Top = 26
      DataBinding.DataField = 'articulo_le'
      DataBinding.DataSource = DSLineas
      Properties.OnChange = cArticuloChange
      TabOrder = 15
      OnEnter = cArticuloEnter
      OnExit = cArticuloExit
      OnKeyDown = cArticuloKeyDown
      Width = 37
    end
    object cBultos: TcxDBTextEdit
      Left = 377
      Top = 26
      DataBinding.DataField = 'bultos_le'
      DataBinding.DataSource = DSLineas
      TabOrder = 19
      OnExit = cBultosExit
      OnKeyPress = SinSignos
      Width = 61
    end
    object cEstBulto: TcxDBTextEdit
      Left = 437
      Top = 26
      DataBinding.DataField = 'estuches_bulto_le'
      DataBinding.DataSource = DSLineas
      TabOrder = 20
      OnExit = cEstBultoExit
      OnKeyPress = SinSignos
      Width = 62
    end
    object cEstSueltos: TcxDBTextEdit
      Left = 498
      Top = 26
      DataBinding.DataField = 'estuches_sueltos_le'
      DataBinding.DataSource = DSLineas
      TabOrder = 21
      OnExit = cEstSueltosExit
      OnKeyPress = SinSignos
      Width = 75
    end
    object cPalets: TcxDBTextEdit
      Left = 631
      Top = 26
      DataBinding.DataField = 'palets_le'
      DataBinding.DataSource = DSLineas
      Properties.OnChange = cPaletsChange
      TabOrder = 23
      OnExit = cPaletsExit
      OnKeyPress = SinSignos
      Width = 53
    end
    object cLote: TcxDBTextEdit
      Left = 683
      Top = 26
      DataBinding.DataField = 'lote_le'
      DataBinding.DataSource = DSLineas
      Properties.CharCase = ecUpperCase
      TabOrder = 24
      OnExit = cLoteExit
      Width = 55
    end
    object cCamara: TcxDBTextEdit
      Left = 813
      Top = 26
      DataBinding.DataField = 'camara_le'
      DataBinding.DataSource = DSLineas
      Properties.CharCase = ecUpperCase
      TabOrder = 26
      Width = 46
    end
    object cZona: TcxDBTextEdit
      Left = 858
      Top = 26
      DataBinding.DataField = 'zona_le'
      DataBinding.DataSource = DSLineas
      Properties.CharCase = ecUpperCase
      TabOrder = 27
      Width = 50
    end
    object cManejo: TcxDBTextEdit
      Left = 908
      Top = 26
      DataBinding.DataField = 'manejo_le'
      DataBinding.DataSource = DSLineas
      Properties.CharCase = ecUpperCase
      TabOrder = 28
      OnEnter = cManejoEnter
      OnExit = cManejoExit
      Width = 47
    end
    object tNomFamilia: TPanel
      Left = 993
      Top = 30
      Width = 57
      Height = 21
      Alignment = taLeftJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 29
      Visible = False
    end
    object tNomArticulo: TPanel
      Left = 109
      Top = 26
      Width = 180
      Height = 21
      Alignment = taLeftJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 17
    end
    object StaticText14: TStaticText
      Left = 10
      Top = 7
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
      TabOrder = 0
    end
    object StaticText15: TStaticText
      Left = 56
      Top = 7
      Width = 233
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
      TabOrder = 1
    end
    object Caducidad: TStaticText
      Left = 289
      Top = 7
      Width = 88
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Caducidad'
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
    object StaticText19: TStaticText
      Left = 377
      Top = 7
      Width = 60
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
      TabOrder = 3
    end
    object StaticText20: TStaticText
      Left = 437
      Top = 7
      Width = 61
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Est. Bulto'
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
    object StaticText21: TStaticText
      Left = 498
      Top = 7
      Width = 74
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Est. Sueltos'
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
    object StaticText22: TStaticText
      Left = 572
      Top = 7
      Width = 59
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
      TabOrder = 6
    end
    object StaticText23: TStaticText
      Left = 631
      Top = 7
      Width = 52
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
      Left = 683
      Top = 7
      Width = 55
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
      TabOrder = 8
    end
    object StaticText25: TStaticText
      Left = 813
      Top = 7
      Width = 45
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
      TabOrder = 10
    end
    object StaticText26: TStaticText
      Left = 859
      Top = 7
      Width = 49
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
      TabOrder = 11
    end
    object StaticText27: TStaticText
      Left = 908
      Top = 7
      Width = 47
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Manejo'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 12
    end
    object cFechaCaducidad: TcxDateEdit
      Left = 289
      Top = 26
      ParentFont = False
      TabOrder = 18
      OnExit = CompruebaFecha
      Width = 88
    end
    object LupaFamilia: TSimpleSearch
      Left = 40
      Top = 26
      Width = 16
      Height = 21
      TabOrder = 14
      TabStop = False
      OnClick = LupaFamiliaClick
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
    object LupaArticulo: TSimpleSearch
      Left = 93
      Top = 26
      Width = 16
      Height = 21
      TabOrder = 16
      TabStop = False
      OnClick = LupaArticuloClick
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
    object cUnidades: TcxDBCurrencyEdit
      Left = 572
      Top = 26
      DataBinding.DataField = 'unidades_le'
      DataBinding.DataSource = DSLineas
      TabOrder = 22
      OnExit = cUnidadesExit
      OnKeyPress = SinSignos
      Width = 60
    end
    object StaticText29: TStaticText
      Left = 738
      Top = 7
      Width = 75
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
      TabOrder = 9
    end
    object cLoteOrigen: TcxDBTextEdit
      Left = 738
      Top = 26
      DataBinding.DataField = 'lote_origen_le'
      DataBinding.DataSource = DSLineas
      Properties.CharCase = ecUpperCase
      TabOrder = 25
      Width = 75
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
    AfterPost = QMaestroAfterPost
    AfterCancel = QMaestroAfterCancel
    DatabaseName = 'BDFrigo'
    RequestLive = True
    SQL.Strings = (
      'select * from cabecera_entradas')
    Left = 765
    Top = 34
    object QMaestroempresa_ce: TStringField
      FieldName = 'empresa_ce'
      Origin = 'BDFRIGO.cabecera_entradas.empresa_ce'
      FixedChar = True
      Size = 3
    end
    object QMaestroalbaran_ce: TIntegerField
      FieldName = 'albaran_ce'
      Origin = 'BDFRIGO.cabecera_entradas.albaran_ce'
    end
    object QMaestrocliente_ce: TStringField
      FieldName = 'cliente_ce'
      Origin = 'BDFRIGO.cabecera_entradas.cliente_ce'
      FixedChar = True
      Size = 4
    end
    object QMaestrofecha_albaran_ce: TStringField
      FieldName = 'fecha_albaran_ce'
      Origin = 'BDFRIGO.cabecera_entradas.fecha_albaran_ce'
      FixedChar = True
      Size = 10
    end
    object QMaestroimporte_entrada_ce: TFloatField
      FieldName = 'importe_entrada_ce'
      Origin = 'BDFRIGO.cabecera_entradas.importe_entrada_ce'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object QMaestrohoras_entrada_ce: TFloatField
      FieldName = 'horas_entrada_ce'
      Origin = 'BDFRIGO.cabecera_entradas.horas_entrada_ce'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object QMaestronumero_factura_ce: TIntegerField
      FieldName = 'numero_factura_ce'
      Origin = 'BDFRIGO.cabecera_entradas.numero_factura_ce'
    end
    object QMaestrotemperatura_ce: TSmallintField
      FieldName = 'temperatura_ce'
      Origin = 'BDFRIGO.cabecera_entradas.temperatura_ce'
    end
    object QMaestroconcepto_ce: TStringField
      FieldName = 'concepto_ce'
      Origin = 'BDFRIGO.cabecera_entradas.concepto_ce'
      FixedChar = True
      Size = 60
    end
    object QMaestrotipo_entrada_ce: TStringField
      FieldName = 'tipo_entrada_ce'
      Origin = 'BDFRIGO.cabecera_entradas.tipo_entrada_ce'
      FixedChar = True
      Size = 1
    end
    object QMaestrotransportista_ce: TStringField
      FieldName = 'transportista_ce'
      Origin = 'BDFRIGO.cabecera_entradas.transportista_ce'
      FixedChar = True
      Size = 30
    end
    object QMaestromatricula_ce: TStringField
      FieldName = 'matricula_ce'
      Origin = 'BDFRIGO.cabecera_entradas.matricula_ce'
      FixedChar = True
      Size = 15
    end
    object QMaestroprocedencia_ce: TStringField
      FieldName = 'procedencia_ce'
      Origin = 'BDFRIGO.cabecera_entradas.procedencia_ce'
      FixedChar = True
      Size = 30
    end
    object QMaestroobservaciones_ce: TStringField
      FieldName = 'observaciones_ce'
      Origin = 'BDFRIGO.cabecera_entradas.observaciones_ce'
      FixedChar = True
      Size = 30
    end
    object QMaestroconcepto2_ce: TStringField
      FieldName = 'concepto2_ce'
      Origin = 'BDFRIGO.cabecera_entradas.concepto2_ce'
      FixedChar = True
      Size = 15
    end
    object QMaestrohora_ce: TStringField
      FieldName = 'hora_ce'
      Origin = 'BDFRIGO.cabecera_entradas.hora_ce'
      FixedChar = True
      Size = 8
    end
    object QMaestrofecha_factura_ce: TStringField
      FieldName = 'fecha_factura_ce'
      Origin = 'BDFRIGO.cabecera_entradas.fecha_factura_ce'
      FixedChar = True
      Size = 10
    end
    object QMaestrofecha_modif_ce: TStringField
      FieldName = 'fecha_modif_ce'
      Origin = 'BDFRIGO.cabecera_entradas.fecha_modif_ce'
      FixedChar = True
      Size = 10
    end
    object QMaestroref_cliente_ce: TStringField
      FieldName = 'ref_cliente_ce'
      Origin = 'BDFRIGO.cabecera_entradas.ref_cliente_ce'
      FixedChar = True
      Size = 9
    end
  end
  object DSMaestro: TDataSource
    DataSet = QMaestro
    OnStateChange = DSMaestroStateChange
    OnDataChange = DSMaestroDataChange
    Left = 797
    Top = 33
  end
  object QContar: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select count(*) from cabecera_entradas')
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
      'select * from linea_entradas'
      'where empresa_le=:empresa_ce'
      'and albaran_le=:albaran_ce'
      'order by empresa_le, albaran_le, lote_le')
    Left = 766
    Top = 64
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'empresa_ce'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'albaran_ce'
        ParamType = ptUnknown
        Size = 4
      end>
    object QLineasempresa_le: TStringField
      FieldName = 'empresa_le'
      Origin = 'BDFRIGO.linea_entradas.empresa_le'
      FixedChar = True
      Size = 3
    end
    object QLineasalbaran_le: TIntegerField
      FieldName = 'albaran_le'
      Origin = 'BDFRIGO.linea_entradas.albaran_le'
    end
    object QLineasfamilia_le: TStringField
      FieldName = 'familia_le'
      Origin = 'BDFRIGO.linea_entradas.familia_le'
      FixedChar = True
      Size = 3
    end
    object QLineasarticulo_le: TStringField
      FieldName = 'articulo_le'
      Origin = 'BDFRIGO.linea_entradas.articulo_le'
      FixedChar = True
      Size = 5
    end
    object QLineaslote_le: TStringField
      DisplayWidth = 8
      FieldName = 'lote_le'
      Origin = 'BDFRIGO.linea_entradas.lote_le'
      FixedChar = True
      Size = 8
    end
    object QLineasbultos_le: TIntegerField
      FieldName = 'bultos_le'
      Origin = 'BDFRIGO.linea_entradas.bultos_le'
    end
    object QLineasunidades_le: TFloatField
      FieldName = 'unidades_le'
      Origin = 'BDFRIGO.linea_entradas.unidades_le'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object QLineascamara_le: TSmallintField
      FieldName = 'camara_le'
      Origin = 'BDFRIGO.linea_entradas.camara_le'
    end
    object QLineaszona_le: TStringField
      FieldName = 'zona_le'
      Origin = 'BDFRIGO.linea_entradas.zona_le'
      FixedChar = True
      Size = 6
    end
    object QLineasmanejo_le: TStringField
      FieldName = 'manejo_le'
      Origin = 'BDFRIGO.linea_entradas.manejo_le'
      FixedChar = True
      Size = 1
    end
    object QLineaspalets_le: TIntegerField
      FieldName = 'palets_le'
      Origin = 'BDFRIGO.linea_entradas.palets_le'
    end
    object QLineasestuches_bulto_le: TSmallintField
      FieldName = 'estuches_bulto_le'
      Origin = 'BDFRIGO.linea_entradas.estuches_bulto_le'
    end
    object QLineasestuches_sueltos_le: TSmallintField
      FieldName = 'estuches_sueltos_le'
      Origin = 'BDFRIGO.linea_entradas.estuches_sueltos_le'
    end
    object QLineasNombreArticulo: TStringField
      FieldKind = fkCalculated
      FieldName = 'NombreArticulo'
      Size = 30
      Calculated = True
    end
    object QLineasNombreFamilia: TStringField
      FieldKind = fkCalculated
      FieldName = 'NombreFamilia'
      Size = 30
      Calculated = True
    end
    object QLineascaducidad_le: TStringField
      FieldName = 'caducidad_le'
      Origin = 'BDFRIGO."dbo.linea_entradas".caducidad_le'
      FixedChar = True
      Size = 10
    end
    object QLineasCaducidad: TStringField
      FieldKind = fkCalculated
      FieldName = 'Caducidad'
      Size = 10
      Calculated = True
    end
    object QLineasfecha_modif_le: TStringField
      FieldName = 'fecha_modif_le'
      Origin = 'BDFRIGO.linea_entradas.fecha_modif_le'
      FixedChar = True
      Size = 10
    end
    object QLineaslote_origen_le: TStringField
      FieldName = 'lote_origen_le'
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
  object QTiposEntrada: TQuery
    OnCalcFields = QTiposEntradaCalcFields
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select *'
      'from tipos_entrada')
    Left = 920
    Top = 32
    object QTiposEntradacodigo_te: TStringField
      FieldName = 'codigo_te'
      Origin = 'BDFRIGO.tipos_entrada.codigo_te'
      FixedChar = True
      Size = 1
    end
    object QTiposEntradadescripcion_te: TStringField
      FieldName = 'descripcion_te'
      Origin = 'BDFRIGO."dbo.tipos_entrada".descripcion_te'
      FixedChar = True
      Size = 35
    end
    object QTiposEntradades: TStringField
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
  object DSTiposEntrada: TDataSource
    DataSet = QTiposEntrada
    Left = 920
    Top = 64
  end
  object QAlmacenes: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'SELECT * FROM ALMACENES')
    Left = 16
    Top = 40
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
    object QAlmacenesestuches_bulto_al: TSmallintField
      FieldName = 'estuches_bulto_al'
      Origin = 'BDFRIGO.almacenes.estuches_bulto_al'
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
