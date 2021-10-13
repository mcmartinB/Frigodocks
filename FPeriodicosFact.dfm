object PeriodicosFact: TPeriodicosFact
  Left = 220
  Top = 160
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Mantenimiento de Peri'#243'dicos de Facturaci'#243'n'
  ClientHeight = 711
  ClientWidth = 846
  Color = clBtnFace
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
    Top = 688
    Width = 846
    Height = 23
    Color = 15395562
    Panels = <
      item
        Width = 650
      end
      item
        Width = 50
      end>
  end
  object PanelDatos: TPanel
    Left = 0
    Top = 132
    Width = 846
    Height = 556
    Align = alClient
    Color = 15128264
    ParentBackground = False
    TabOrder = 1
    OnEnter = PanelDatosEnter
    object StaticText2: TStaticText
      Left = 103
      Top = 27
      Width = 38
      Height = 20
      Caption = 'Tarifa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object cTarifa: TcxDBTextEdit
      Left = 255
      Top = 25
      AutoSize = False
      DataBinding.DataField = 'tarifa_pf'
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
      OnKeyDown = cTarifaKeyDown
      Height = 24
      Width = 32
    end
    object StaticText3: TStaticText
      Left = 103
      Top = 54
      Width = 42
      Height = 20
      Caption = 'Hora 1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object StaticText4: TStaticText
      Left = 103
      Top = 81
      Width = 42
      Height = 20
      Caption = 'Hora 2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object StaticText5: TStaticText
      Left = 103
      Top = 107
      Width = 146
      Height = 20
      Caption = 'Electricidad Carretilla ('#8364')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object StaticText6: TStaticText
      Left = 419
      Top = 107
      Width = 125
      Height = 20
      Caption = 'Serv. Administrativos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object StaticText7: TStaticText
      Left = 419
      Top = 81
      Width = 133
      Height = 20
      Caption = 'Electricidad Oficina ('#8364')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object StaticText8: TStaticText
      Left = 419
      Top = 54
      Width = 114
      Height = 20
      Caption = 'Kw Thermoking ('#8364')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object StaticText9: TStaticText
      Left = 419
      Top = 27
      Width = 121
      Height = 20
      Caption = 'Importe Thermoking'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
    object cImporteThermo: TcxDBTextEdit
      Left = 576
      Top = 52
      Hint = 'Ver desglose en Consumos Electricos'
      AutoSize = False
      DataBinding.DataField = 'importe_kwthermo_pf'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      ParentShowHint = False
      Properties.ReadOnly = True
      ShowHint = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 9
      Height = 24
      Width = 121
    end
    object GroupBox1: TGroupBox
      Left = 13
      Top = 138
      Width = 811
      Height = 327
      Caption = 'Otros Servicios'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      object StaticText10: TStaticText
        Left = 16
        Top = 41
        Width = 68
        Height = 20
        Caption = 'Concepto 1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object StaticText11: TStaticText
        Left = 16
        Top = 66
        Width = 49
        Height = 20
        Caption = 'Importe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object StaticText13: TStaticText
        Left = 16
        Top = 94
        Width = 68
        Height = 20
        Caption = 'Concepto 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object StaticText14: TStaticText
        Left = 16
        Top = 120
        Width = 49
        Height = 20
        Caption = 'Importe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object StaticText15: TStaticText
        Left = 16
        Top = 146
        Width = 68
        Height = 20
        Caption = 'Concepto 3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object StaticText16: TStaticText
        Left = 16
        Top = 174
        Width = 49
        Height = 20
        Caption = 'Importe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object cConcepto1a: TcxDBTextEdit
        Left = 118
        Top = 36
        AutoSize = False
        DataBinding.DataField = 'texto1_pf'
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
        Height = 24
        Width = 333
      end
      object cConcepto2a: TcxDBTextEdit
        Left = 118
        Top = 90
        AutoSize = False
        DataBinding.DataField = 'concepto2a_pf'
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
        Height = 24
        Width = 333
      end
      object cConcepto3a: TcxDBTextEdit
        Left = 118
        Top = 144
        AutoSize = False
        DataBinding.DataField = 'concepto3a_pf'
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
        Height = 24
        Width = 333
      end
      object cConcepto1b: TcxDBTextEdit
        Left = 459
        Top = 36
        AutoSize = False
        DataBinding.DataField = 'texto2_pf'
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
        Height = 24
        Width = 333
      end
      object cConcepto2b: TcxDBTextEdit
        Left = 459
        Top = 90
        AutoSize = False
        DataBinding.DataField = 'concepto2b_pf'
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
        Height = 24
        Width = 333
      end
      object cConcepto3b: TcxDBTextEdit
        Left = 459
        Top = 144
        AutoSize = False
        DataBinding.DataField = 'concepto3b_pf'
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
        Width = 333
      end
      object cImporteConcepto1: TcxDBCurrencyEdit
        Left = 118
        Top = 63
        AutoSize = False
        DataBinding.DataField = 'otros_servicios_pf'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextStyle = []
        Style.IsFontAssigned = True
        TabOrder = 12
        Height = 24
        Width = 121
      end
      object cImporteConcepto2: TcxDBCurrencyEdit
        Left = 118
        Top = 117
        AutoSize = False
        DataBinding.DataField = 'importe_concepto2_pf'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextStyle = []
        Style.IsFontAssigned = True
        TabOrder = 13
        Height = 24
        Width = 121
      end
      object cImporteConcepto3: TcxDBCurrencyEdit
        Left = 118
        Top = 171
        AutoSize = False
        DataBinding.DataField = 'importe_concepto3_pf'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextStyle = []
        Style.IsFontAssigned = True
        TabOrder = 14
        Height = 24
        Width = 121
      end
      object StaticText17: TStaticText
        Left = 16
        Top = 201
        Width = 68
        Height = 20
        Caption = 'Concepto 4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 15
      end
      object cConcepto4a: TcxDBTextEdit
        Left = 118
        Top = 199
        AutoSize = False
        DataBinding.DataField = 'concepto4a_pf'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 16
        Height = 24
        Width = 333
      end
      object cConcepto4b: TcxDBTextEdit
        Left = 459
        Top = 199
        AutoSize = False
        DataBinding.DataField = 'concepto4b_pf'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 17
        Height = 24
        Width = 333
      end
      object StaticText18: TStaticText
        Left = 16
        Top = 229
        Width = 49
        Height = 20
        Caption = 'Importe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 18
      end
      object cImporteConcepto4: TcxDBCurrencyEdit
        Left = 118
        Top = 226
        AutoSize = False
        DataBinding.DataField = 'importe_concepto4_pf'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextStyle = []
        Style.IsFontAssigned = True
        TabOrder = 19
        Height = 24
        Width = 121
      end
      object StaticText19: TStaticText
        Left = 16
        Top = 256
        Width = 68
        Height = 20
        Caption = 'Concepto 5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 20
      end
      object cConcepto5a: TcxDBTextEdit
        Left = 118
        Top = 254
        AutoSize = False
        DataBinding.DataField = 'concepto5a_pf'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 21
        Height = 24
        Width = 333
      end
      object cConcepto5b: TcxDBTextEdit
        Left = 459
        Top = 254
        AutoSize = False
        DataBinding.DataField = 'concepto5b_pf'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 22
        Height = 24
        Width = 333
      end
      object StaticText20: TStaticText
        Left = 16
        Top = 284
        Width = 49
        Height = 20
        Caption = 'Importe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 23
      end
      object cImporteConcepto5: TcxDBCurrencyEdit
        Left = 118
        Top = 281
        AutoSize = False
        DataBinding.DataField = 'importe_concepto5_pf'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextStyle = []
        Style.IsFontAssigned = True
        TabOrder = 24
        Height = 24
        Width = 121
      end
    end
    object cLupaTarifas: TSimpleSearch
      Left = 288
      Top = 25
      Width = 24
      Height = 24
      TabOrder = 11
      TabStop = False
      OnClick = cLupaTarifasClick
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
    object cHoras1: TcxDBCurrencyEdit
      Left = 255
      Top = 52
      AutoSize = False
      DataBinding.DataField = 'horas1_pf'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TextStyle = []
      Style.IsFontAssigned = True
      TabOrder = 12
      Height = 24
      Width = 121
    end
    object cHoras2: TcxDBCurrencyEdit
      Left = 255
      Top = 79
      AutoSize = False
      DataBinding.DataField = 'horas2_pf'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TextStyle = []
      Style.IsFontAssigned = True
      TabOrder = 13
      Height = 24
      Width = 121
    end
    object cImporteCarretilla: TcxDBCurrencyEdit
      Left = 255
      Top = 106
      Hint = 'Ver desglose en Consumos Electricos'
      AutoSize = False
      DataBinding.DataField = 'importe_carretilla_pf'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      ParentShowHint = False
      Properties.DisplayFormat = '0.00'
      Properties.ReadOnly = True
      ShowHint = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TextStyle = []
      Style.IsFontAssigned = True
      TabOrder = 14
      Height = 24
      Width = 121
    end
    object cImporteThermoking: TcxDBCurrencyEdit
      Left = 576
      Top = 24
      AutoSize = False
      DataBinding.DataField = 'importe_thermoking_pf'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TextStyle = []
      Style.IsFontAssigned = True
      TabOrder = 15
      Height = 24
      Width = 121
    end
    object cElectricidadOfi: TcxDBCurrencyEdit
      Left = 576
      Top = 79
      Hint = 'Ver desglose en Consumos Electricos'
      AutoSize = False
      DataBinding.DataField = 'importe_oficina_pf'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      ParentShowHint = False
      Properties.ReadOnly = True
      ShowHint = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TextStyle = []
      Style.IsFontAssigned = True
      TabOrder = 16
      Height = 24
      Width = 121
    end
    object cServAdmin: TcxDBCurrencyEdit
      Left = 576
      Top = 106
      AutoSize = False
      DataBinding.DataField = 'gastos_administra_pf'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TextStyle = []
      Style.IsFontAssigned = True
      TabOrder = 17
      Height = 24
      Width = 121
    end
    object cStatusFactura: TDBRadioGroup
      Left = 634
      Top = 477
      Width = 190
      Height = 55
      Caption = 'Facturado'
      Columns = 2
      DataField = 'status_factura_pf'
      DataSource = DSMaestro
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Items.Strings = (
        'SI'
        'NO')
      ParentBackground = True
      ParentFont = False
      TabOrder = 18
      Values.Strings = (
        'S'
        'N')
    end
  end
  object PanelClaves: TPanel
    Left = 0
    Top = 38
    Width = 846
    Height = 94
    Align = alTop
    Color = 15395562
    ParentBackground = False
    TabOrder = 5
    object StaticText1: TStaticText
      Left = 250
      Top = 26
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
      TabOrder = 0
    end
    object cEmpresa: TEdit
      Left = 324
      Top = 22
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
      OnChange = cEmpresaChange
      OnEnter = ColorEnter
      OnExit = ColorExit
      OnKeyDown = cEmpresaKeyDown
    end
    object StaticText12: TStaticText
      Left = 250
      Top = 53
      Width = 66
      Height = 20
      AutoSize = False
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object cCliente: TEdit
      Left = 324
      Top = 50
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
      TabOrder = 3
      OnChange = cClienteChange
      OnEnter = ColorEnter
      OnExit = ColorExit
      OnKeyDown = cClienteKeyDown
    end
    object tNomEmpresa: TPanel
      Left = 380
      Top = 22
      Width = 237
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 4
    end
    object tNomcliente: TPanel
      Left = 386
      Top = 50
      Width = 231
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
    object cLupaClilentes: TSimpleSearch
      Left = 360
      Top = 50
      Width = 24
      Height = 24
      TabOrder = 6
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
    object cLupaEmpresas: TSimpleSearch
      Left = 354
      Top = 22
      Width = 24
      Height = 24
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
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 784
    Top = 50
  end
  object QMaestro: TQuery
    AfterInsert = QMaestroAfterInsert
    BeforePost = QMaestroBeforePost
    DatabaseName = 'BDFrigo'
    RequestLive = True
    SQL.Strings = (
      'select * from periodicos_facturacion')
    Left = 720
    Top = 49
    object QMaestroempresa_pf: TStringField
      FieldName = 'empresa_pf'
      Origin = 'BDFRIGO.periodicos_facturacion.empresa_pf'
      FixedChar = True
      Size = 3
    end
    object QMaestrocliente_pf: TStringField
      FieldName = 'cliente_pf'
      Origin = 'BDFRIGO.periodicos_facturacion.cliente_pf'
      FixedChar = True
      Size = 4
    end
    object QMaestrotarifa_pf: TStringField
      FieldName = 'tarifa_pf'
      Origin = 'BDFRIGO.periodicos_facturacion.tarifa_pf'
      FixedChar = True
      Size = 1
    end
    object QMaestrohoras1_pf: TFloatField
      FieldName = 'horas1_pf'
      Origin = 'BDFRIGO.periodicos_facturacion.horas1_pf'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object QMaestrohoras2_pf: TFloatField
      FieldName = 'horas2_pf'
      Origin = 'BDFRIGO.periodicos_facturacion.horas2_pf'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object QMaestroimporte_thermoking_pf: TFloatField
      FieldName = 'importe_thermoking_pf'
      Origin = 'BDFRIGO.periodicos_facturacion.importe_thermoking_pf'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object QMaestroimporte_oficina_pf: TFloatField
      FieldName = 'importe_oficina_pf'
      Origin = 'BDFRIGO.periodicos_facturacion.importe_oficina_pf'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object QMaestrogastos_administra_pf: TFloatField
      FieldName = 'gastos_administra_pf'
      Origin = 'BDFRIGO.periodicos_facturacion.gastos_administra_pf'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object QMaestrootros_servicios_pf: TFloatField
      FieldName = 'otros_servicios_pf'
      Origin = 'BDFRIGO.periodicos_facturacion.otros_servicios_pf'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object QMaestrostatus_factura_pf: TStringField
      FieldName = 'status_factura_pf'
      Origin = 'BDFRIGO.periodicos_facturacion.status_factura_pf'
      FixedChar = True
      Size = 1
    end
    object QMaestrotexto1_pf: TStringField
      FieldName = 'texto1_pf'
      Origin = 'BDFRIGO.periodicos_facturacion.texto1_pf'
      FixedChar = True
      Size = 25
    end
    object QMaestrotexto2_pf: TStringField
      FieldName = 'texto2_pf'
      Origin = 'BDFRIGO.periodicos_facturacion.texto2_pf'
      FixedChar = True
      Size = 25
    end
    object QMaestroconcepto2a_pf: TStringField
      FieldName = 'concepto2a_pf'
      Origin = 'BDFRIGO.periodicos_facturacion.concepto2a_pf'
      FixedChar = True
      Size = 25
    end
    object QMaestroconcepto2b_pf: TStringField
      FieldName = 'concepto2b_pf'
      Origin = 'BDFRIGO.periodicos_facturacion.concepto2b_pf'
      FixedChar = True
      Size = 25
    end
    object QMaestroimporte_concepto2_pf: TFloatField
      FieldName = 'importe_concepto2_pf'
      Origin = 'BDFRIGO.periodicos_facturacion.importe_concepto2_pf'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object QMaestroconcepto3a_pf: TStringField
      FieldName = 'concepto3a_pf'
      Origin = 'BDFRIGO.periodicos_facturacion.concepto3a_pf'
      FixedChar = True
      Size = 25
    end
    object QMaestroconcepto3b_pf: TStringField
      FieldName = 'concepto3b_pf'
      Origin = 'BDFRIGO.periodicos_facturacion.concepto3b_pf'
      FixedChar = True
      Size = 25
    end
    object QMaestroimporte_concepto3_pf: TFloatField
      FieldName = 'importe_concepto3_pf'
      Origin = 'BDFRIGO.periodicos_facturacion.importe_concepto3_pf'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object QMaestrohoras_clima_pf: TFloatField
      FieldName = 'horas_clima_pf'
      Origin = 'BDFRIGO.periodicos_facturacion.horas_clima_pf'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object QMaestrokw_thermoking_pf: TIntegerField
      FieldName = 'kw_thermoking_pf'
      Origin = 'BDFRIGO.periodicos_facturacion.kw_thermoking_pf'
    end
    object QMaestroconcepto4a_pf: TStringField
      FieldName = 'concepto4a_pf'
      Origin = 'BDFRIGO.periodicos_facturacion.concepto4a_pf'
      FixedChar = True
      Size = 25
    end
    object QMaestroconcepto4b_pf: TStringField
      FieldName = 'concepto4b_pf'
      Origin = 'BDFRIGO.periodicos_facturacion.concepto4b_pf'
      FixedChar = True
      Size = 25
    end
    object QMaestroimporte_concepto4_pf: TCurrencyField
      FieldName = 'importe_concepto4_pf'
      Origin = 'BDFRIGO.periodicos_facturacion.importe_concepto4_pf'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
      currency = False
    end
    object QMaestroconcepto5_pf: TStringField
      FieldName = 'concepto5a_pf'
      Origin = 'BDFRIGO.periodicos_facturacion.concepto5a_pf'
      FixedChar = True
      Size = 25
    end
    object QMaestroconcepto5b_pf: TStringField
      FieldName = 'concepto5b_pf'
      Origin = 'BDFRIGO.periodicos_facturacion.concepto5b_pf'
      FixedChar = True
      Size = 25
    end
    object QMaestroimporte_concepto5_pf: TCurrencyField
      FieldName = 'importe_concepto5_pf'
      Origin = 'BDFRIGO.periodicos_facturacion.importe_concepto5_pf'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
      currency = False
    end
    object QMaestroimporte_kwthermo_pf: TFloatField
      FieldName = 'importe_kwthermo_pf'
      Origin = 'BDFRIGO.periodicos_facturacion.importe_kwthermo_pf'
      DisplayFormat = '0.00'
      currency = True
    end
    object QMaestroimporte_carretilla_pf: TFloatField
      FieldName = 'importe_carretilla_pf'
      Origin = 'BDFRIGO.periodicos_facturacion.importe_carretilla_pf'
      DisplayFormat = '0.00'
      currency = True
    end
  end
  object DSMaestro: TDataSource
    DataSet = QMaestro
    OnStateChange = DSMaestroStateChange
    Left = 720
    Top = 81
  end
  object QContar: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select count(*) from fichero_tarifa')
    Left = 752
    Top = 49
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
          ItemName = 'bConsumos'
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
    object bConsumos: TdxBarLargeButton
      Caption = 'Consumos'
      Category = 0
      Enabled = False
      Hint = 'Consumos El'#233'ctricos'
      Visible = ivAlways
      LargeImageIndex = 21
      OnClick = bConsumosClick
      AutoGrayScale = False
    end
  end
  object QAux1: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select count(*) from fichero_tarifa')
    Left = 800
    Top = 137
  end
  object QAux2: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select count(*) from fichero_tarifa')
    Left = 800
    Top = 177
  end
end
