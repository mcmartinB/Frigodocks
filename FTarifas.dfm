object Tarifas: TTarifas
  Left = 593
  Top = 100
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Mantenimiento de Tarifas'
  ClientHeight = 581
  ClientWidth = 576
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
    Top = 558
    Width = 576
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
  object PanelDatos: TPanel
    Left = 0
    Top = 130
    Width = 576
    Height = 428
    Align = alClient
    Color = 15128264
    ParentBackground = False
    TabOrder = 1
    OnEnter = PanelDatosEnter
    object StaticText2: TStaticText
      Left = 86
      Top = 34
      Width = 94
      Height = 20
      Caption = 'Congelaci'#243'n M3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object StaticText3: TStaticText
      Left = 86
      Top = 66
      Width = 91
      Height = 20
      Caption = 'Congelaci'#243'n Kg'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object StaticText4: TStaticText
      Left = 86
      Top = 97
      Width = 101
      Height = 20
      Caption = 'Refrigeraci'#243'n M3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object StaticText5: TStaticText
      Left = 86
      Top = 128
      Width = 134
      Height = 20
      Caption = 'Manejo Tipo 0 (Palets)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object StaticText6: TStaticText
      Left = 86
      Top = 162
      Width = 86
      Height = 20
      Caption = 'Manejo Tipo 1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object StaticText7: TStaticText
      Left = 86
      Top = 193
      Width = 86
      Height = 20
      Caption = 'Manejo Tipo 2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object StaticText8: TStaticText
      Left = 86
      Top = 225
      Width = 86
      Height = 20
      Caption = 'Manejo Tipo 3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object StaticText9: TStaticText
      Left = 86
      Top = 258
      Width = 86
      Height = 20
      Caption = 'Manejo Tipo 4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object StaticText10: TStaticText
      Left = 86
      Top = 291
      Width = 81
      Height = 20
      Caption = 'Precio Hora 1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
    object StaticText11: TStaticText
      Left = 86
      Top = 321
      Width = 81
      Height = 20
      Caption = 'Precio Hora 2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
    end
    object StaticText13: TStaticText
      Left = 86
      Top = 353
      Width = 67
      Height = 20
      Caption = 'Frio / Palet'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
    end
    object StaticText14: TStaticText
      Left = 86
      Top = 385
      Width = 78
      Height = 20
      Caption = 'Manejo Palet'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
    end
    object cCongelacionM3: TcxDBCurrencyEdit
      Left = 261
      Top = 30
      AutoSize = False
      DataBinding.DataField = 'precio_congelacion_m3_t'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Properties.DecimalPlaces = 5
      Properties.DisplayFormat = ',0.00000;-,0.00000'
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
    object cCongelacionEurKg: TcxDBCurrencyEdit
      Left = 261
      Top = 62
      AutoSize = False
      DataBinding.DataField = 'precio_congelacion_kg_t'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Properties.DecimalPlaces = 5
      Properties.DisplayFormat = ',0.00000;-,0.00000'
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
    object cRefrigeraEurM3: TcxDBCurrencyEdit
      Left = 261
      Top = 93
      AutoSize = False
      DataBinding.DataField = 'precio_refrigera_m3_t'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Properties.DecimalPlaces = 5
      Properties.DisplayFormat = ',0.00000;-,0.00000'
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
    object cTipo0: TcxDBCurrencyEdit
      Left = 261
      Top = 124
      AutoSize = False
      DataBinding.DataField = 'tipo0_t'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Properties.DecimalPlaces = 5
      Properties.DisplayFormat = ',0.00000;-,0.00000'
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
    object cTipo1: TcxDBCurrencyEdit
      Left = 261
      Top = 158
      AutoSize = False
      DataBinding.DataField = 'tipo1_t'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Properties.DecimalPlaces = 5
      Properties.DisplayFormat = ',0.00000;-,0.00000'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TextStyle = []
      Style.IsFontAssigned = True
      TabOrder = 16
      Height = 24
      Width = 121
    end
    object cTipo2: TcxDBCurrencyEdit
      Left = 261
      Top = 189
      AutoSize = False
      DataBinding.DataField = 'tipo2_t'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Properties.DecimalPlaces = 5
      Properties.DisplayFormat = ',0.00000;-,0.00000'
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
    object cTipo3: TcxDBCurrencyEdit
      Left = 261
      Top = 221
      AutoSize = False
      DataBinding.DataField = 'tipo3_t'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Properties.DecimalPlaces = 5
      Properties.DisplayFormat = ',0.00000;-,0.00000'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TextStyle = []
      Style.IsFontAssigned = True
      TabOrder = 18
      Height = 24
      Width = 121
    end
    object cTipo4: TcxDBCurrencyEdit
      Left = 261
      Top = 254
      AutoSize = False
      DataBinding.DataField = 'tipo4_t'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Properties.DecimalPlaces = 5
      Properties.DisplayFormat = ',0.00000;-,0.00000'
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
    object cEurosHora1: TcxDBCurrencyEdit
      Left = 261
      Top = 287
      AutoSize = False
      DataBinding.DataField = 'precio_hora1_t'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Properties.DecimalPlaces = 5
      Properties.DisplayFormat = ',0.00000;-,0.00000'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TextStyle = []
      Style.IsFontAssigned = True
      TabOrder = 20
      Height = 24
      Width = 121
    end
    object cEurosHora2: TcxDBCurrencyEdit
      Left = 261
      Top = 317
      AutoSize = False
      DataBinding.DataField = 'precio_hora2_t'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Properties.DecimalPlaces = 5
      Properties.DisplayFormat = ',0.00000;-,0.00000'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TextStyle = []
      Style.IsFontAssigned = True
      TabOrder = 21
      Height = 24
      Width = 121
    end
    object cFrioPalet: TcxDBCurrencyEdit
      Left = 261
      Top = 349
      AutoSize = False
      DataBinding.DataField = 'frio_palet_t'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Properties.DecimalPlaces = 5
      Properties.DisplayFormat = ',0.00000;-,0.00000'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TextStyle = []
      Style.IsFontAssigned = True
      TabOrder = 22
      Height = 24
      Width = 121
    end
    object cManejoPalet: TcxDBCurrencyEdit
      Left = 261
      Top = 381
      AutoSize = False
      DataBinding.DataField = 'manejo_palet_t'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Properties.DecimalPlaces = 5
      Properties.DisplayFormat = ',0.00000;-,0.00000'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TextStyle = []
      Style.IsFontAssigned = True
      TabOrder = 23
      Height = 24
      Width = 121
    end
  end
  object PanelClaves: TPanel
    Left = 0
    Top = 38
    Width = 576
    Height = 92
    Align = alTop
    Color = 15592941
    ParentBackground = False
    TabOrder = 6
    object StaticText1: TStaticText
      Left = 50
      Top = 55
      Width = 47
      Height = 20
      Caption = 'C'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object StaticText12: TStaticText
      Left = 51
      Top = 21
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
      TabOrder = 2
    end
    object cEmpresa: TEdit
      Left = 125
      Top = 18
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
      TabOrder = 0
      OnChange = cEmpresaChange
      OnEnter = ColorEnter
      OnExit = ColorExitRellenarCeros
      OnKeyDown = cEmpresaKeyDown
    end
    object tNomEmpresa: TPanel
      Left = 182
      Top = 18
      Width = 230
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
    object cLupaEmpresas: TSimpleSearch
      Left = 157
      Top = 18
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
    object cCodigo: TEdit
      Left = 125
      Top = 51
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
      TabOrder = 5
      OnEnter = ColorEnter
      OnExit = ColorExit
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 416
    Top = 82
  end
  object QMaestro: TQuery
    AfterInsert = QMaestroAfterInsert
    DatabaseName = 'BDFrigo'
    RequestLive = True
    SQL.Strings = (
      'select * from tarifas')
    Left = 296
    Top = 81
    object QMaestroempresa_t: TStringField
      FieldName = 'empresa_t'
      Origin = 'BDFRIGO.tarifas.empresa_t'
      FixedChar = True
      Size = 3
    end
    object QMaestroprecio_congelacion_m3_t: TFloatField
      FieldName = 'precio_congelacion_m3_t'
      Origin = 'BDFRIGO.tarifas.precio_congelacion_m3_t'
      DisplayFormat = ',0.00000'
      EditFormat = '#.#####'
    end
    object QMaestroprecio_congelacion_kg_t: TFloatField
      FieldName = 'precio_congelacion_kg_t'
      Origin = 'BDFRIGO.tarifas.precio_congelacion_kg_t'
      DisplayFormat = ',0.00000'
      EditFormat = '#.#####'
    end
    object QMaestroprecio_refrigera_m3_t: TFloatField
      FieldName = 'precio_refrigera_m3_t'
      Origin = 'BDFRIGO.tarifas.precio_refrigera_m3_t'
      DisplayFormat = ',0.00000'
      EditFormat = '#.#####'
    end
    object QMaestrotipo0_t: TFloatField
      FieldName = 'tipo0_t'
      Origin = 'BDFRIGO.tarifas.tipo0_t'
      DisplayFormat = ',0.00000'
      EditFormat = '#.#####'
    end
    object QMaestrotipo1_t: TFloatField
      FieldName = 'tipo1_t'
      Origin = 'BDFRIGO.tarifas.tipo1_t'
      DisplayFormat = ',0.00000'
      EditFormat = '#.#####'
    end
    object QMaestrotipo2_t: TFloatField
      FieldName = 'tipo2_t'
      Origin = 'BDFRIGO.tarifas.tipo2_t'
      DisplayFormat = ',0.00000'
      EditFormat = '#.#####'
    end
    object QMaestrotipo3_t: TFloatField
      FieldName = 'tipo3_t'
      Origin = 'BDFRIGO.tarifas.tipo3_t'
      DisplayFormat = ',0.00000'
      EditFormat = '#.#####'
    end
    object QMaestrotipo4_t: TFloatField
      FieldName = 'tipo4_t'
      Origin = 'BDFRIGO.tarifas.tipo4_t'
      DisplayFormat = ',0.00000'
      EditFormat = '#.#####'
    end
    object QMaestroprecio_hora1_t: TFloatField
      FieldName = 'precio_hora1_t'
      Origin = 'BDFRIGO.tarifas.precio_hora1_t'
      DisplayFormat = ',0.00000'
      EditFormat = '#.#####'
    end
    object QMaestroprecio_hora2_t: TFloatField
      FieldName = 'precio_hora2_t'
      Origin = 'BDFRIGO.tarifas.precio_hora2_t'
      DisplayFormat = ',0.00000'
      EditFormat = '#.#####'
    end
    object QMaestrocodigo_t: TStringField
      FieldName = 'codigo_t'
      Origin = 'BDFRIGO.tarifas.codigo_t'
      FixedChar = True
      Size = 2
    end
    object QMaestrofrio_palet_t: TFloatField
      FieldName = 'frio_palet_t'
      Origin = 'BDFRIGO.tarifas.frio_palet_t'
      DisplayFormat = ',0.00000'
      EditFormat = '#.#####'
    end
    object QMaestromanejo_palet_t: TFloatField
      FieldName = 'manejo_palet_t'
      Origin = 'BDFRIGO.tarifas.manejo_palet_t'
      DisplayFormat = ',0.00000'
      EditFormat = '#.#####'
    end
  end
  object DSMaestro: TDataSource
    DataSet = QMaestro
    OnStateChange = DSMaestroStateChange
    Left = 328
    Top = 81
  end
  object QContar: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select count(*) from tarifas')
    Left = 376
    Top = 81
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
