object BusquedaPeriodicos: TBusquedaPeriodicos
  Left = 331
  Top = 264
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Busqueda de Peri'#243'dicos de Facturaci'#243'n'
  ClientHeight = 300
  ClientWidth = 693
  Color = clBtnFace
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
    Top = 134
    Width = 693
    Height = 143
    Align = alClient
    Enabled = False
    TabOrder = 0
    object GridLineas: TDBGrid
      Left = 1
      Top = 1
      Width = 691
      Height = 141
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
          FieldName = 'empresa_pf'
          Title.Caption = 'Empresa'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cliente_pf'
          Title.Caption = 'Cliente'
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tarifa_pf'
          Title.Caption = 'Tarifa'
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'horas1_pf'
          Title.Caption = 'Horas1'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'horas2_pf'
          Title.Caption = 'Horas2'
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'importe_thermoking_pf'
          Title.Caption = 'Importe Thermoking'
          Width = 101
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kw_thermoking_pf'
          Title.Caption = 'Kw Thermoking'
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'importe_oficina_pf'
          Title.Caption = 'Importe Oficina'
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'gastos_administra_pf'
          Title.Caption = 'Gastos Admin.'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'status_factura_pf'
          Title.Caption = 'Facturado'
          Visible = True
        end>
    end
  end
  object BarraEstado: TStatusBar
    Left = 0
    Top = 277
    Width = 693
    Height = 23
    Color = 15395562
    Panels = <
      item
        Width = 530
      end
      item
        Width = 50
      end>
  end
  object PanelClaves: TPanel
    Left = 0
    Top = 22
    Width = 693
    Height = 112
    Align = alTop
    BorderStyle = bsSingle
    Color = 15128264
    ParentBackground = False
    TabOrder = 6
    object cEmpresaBus: TEdit
      Left = 225
      Top = 26
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
    object StaticText12: TStaticText
      Left = 151
      Top = 65
      Width = 48
      Height = 20
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object cClienteBus: TEdit
      Left = 225
      Top = 62
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
      TabOrder = 2
      OnChange = cClienteBusChange
      OnEnter = ColorEnter
      OnExit = ColorExit
      OnKeyDown = cClienteKeyDown
    end
    object StaticText1: TStaticText
      Left = 151
      Top = 29
      Width = 59
      Height = 20
      Caption = 'Empresa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object tNomEmpresa: TPanel
      Left = 284
      Top = 26
      Width = 235
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
      Left = 289
      Top = 62
      Width = 230
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
    object cLupaEmpresas: TSimpleSearch
      Left = 257
      Top = 26
      Width = 24
      Height = 24
      TabOrder = 6
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
      Left = 262
      Top = 62
      Width = 24
      Height = 24
      TabOrder = 7
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
      'select * from periodicos_facturacion')
    Left = 544
    Top = 48
  end
  object DS: TDataSource
    DataSet = ClientDataSet1
    Left = 632
    Top = 48
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 626
    Top = 96
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Query1
    Left = 573
    Top = 48
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    AfterScroll = ClientDataSet1AfterScroll
    Left = 603
    Top = 48
    object ClientDataSet1empresa_pf: TStringField
      FieldName = 'empresa_pf'
      FixedChar = True
      Size = 3
    end
    object ClientDataSet1cliente_pf: TStringField
      FieldName = 'cliente_pf'
      FixedChar = True
      Size = 4
    end
    object ClientDataSet1tarifa_pf: TStringField
      FieldName = 'tarifa_pf'
      FixedChar = True
      Size = 1
    end
    object ClientDataSet1horas1_pf: TFloatField
      FieldName = 'horas1_pf'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object ClientDataSet1horas2_pf: TFloatField
      FieldName = 'horas2_pf'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object ClientDataSet1importe_thermoking_pf: TFloatField
      FieldName = 'importe_thermoking_pf'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object ClientDataSet1kw_thermoking_pf: TIntegerField
      FieldName = 'kw_thermoking_pf'
    end
    object ClientDataSet1importe_oficina_pf: TFloatField
      FieldName = 'importe_oficina_pf'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object ClientDataSet1gastos_administra_pf: TFloatField
      FieldName = 'gastos_administra_pf'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object ClientDataSet1otros_servicios_pf: TFloatField
      FieldName = 'otros_servicios_pf'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object ClientDataSet1status_factura_pf: TStringField
      FieldName = 'status_factura_pf'
      FixedChar = True
      Size = 1
    end
    object ClientDataSet1texto1_pf: TStringField
      FieldName = 'texto1_pf'
      FixedChar = True
      Size = 25
    end
    object ClientDataSet1texto2_pf: TStringField
      FieldName = 'texto2_pf'
      FixedChar = True
      Size = 25
    end
    object ClientDataSet1concepto2a_pf: TStringField
      FieldName = 'concepto2a_pf'
      FixedChar = True
      Size = 25
    end
    object ClientDataSet1concepto2b_pf: TStringField
      FieldName = 'concepto2b_pf'
      FixedChar = True
      Size = 25
    end
    object ClientDataSet1importe_concepto2_pf: TFloatField
      FieldName = 'importe_concepto2_pf'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object ClientDataSet1concepto3a_pf: TStringField
      FieldName = 'concepto3a_pf'
      FixedChar = True
      Size = 25
    end
    object ClientDataSet1concepto3b_pf: TStringField
      FieldName = 'concepto3b_pf'
      FixedChar = True
      Size = 25
    end
    object ClientDataSet1importe_concepto3_pf: TFloatField
      FieldName = 'importe_concepto3_pf'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object ClientDataSet1horas_clima_pf: TFloatField
      FieldName = 'horas_clima_pf'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
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
