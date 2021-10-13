object BusquedaConsumos: TBusquedaConsumos
  Left = 216
  Top = 246
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Busqueda Consumos El'#233'ctricos'
  ClientHeight = 596
  ClientWidth = 494
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
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
  object PanelClaves: TPanel
    Left = 0
    Top = 22
    Width = 494
    Height = 307
    Align = alTop
    BorderStyle = bsSingle
    Color = 15128264
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 506
    object nbLabel5: TLabel
      Left = 30
      Top = 58
      Width = 49
      Height = 16
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 30
      Top = 90
      Width = 32
      Height = 16
      Caption = ' A'#241'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 30
      Top = 122
      Width = 30
      Height = 16
      Caption = 'Mes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object StaticText1: TStaticText
      Left = 30
      Top = 25
      Width = 66
      Height = 20
      Caption = 'Empresa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object tNomEmpresa: TPanel
      Left = 171
      Top = 21
      Width = 257
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 3
    end
    object cEmpresaBus: TEdit
      Left = 114
      Top = 21
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
      OnChange = cEmpresaBusChange
      OnEnter = ColorEnter
      OnExit = ColorExit
      OnKeyDown = cEmpresaKeyDown
    end
    object cClienteBus: TEdit
      Left = 114
      Top = 54
      Width = 36
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
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
      Left = 177
      Top = 54
      Width = 251
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 4
    end
    object cLupaEmpresas: TSimpleSearch
      Left = 145
      Top = 21
      Width = 24
      Height = 24
      TabOrder = 5
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
      Left = 151
      Top = 54
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
    object GroupBox1: TGroupBox
      Left = 30
      Top = 216
      Width = 409
      Height = 68
      Caption = 'Facturas'
      Color = 15128264
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 7
      object Label2: TLabel
        Left = 38
        Top = 30
        Width = 47
        Height = 16
        Caption = 'Desde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 222
        Top = 30
        Width = 42
        Height = 16
        Caption = 'Hasta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object cAnyoBus: TEdit
      Left = 114
      Top = 87
      Width = 61
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 4
      ParentFont = False
      TabOrder = 8
      OnChange = cClienteBusChange
      OnEnter = ColorEnter
      OnExit = ColorExit
      OnKeyDown = cClienteKeyDown
    end
    object cMesBus: TEdit
      Left = 114
      Top = 119
      Width = 61
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 9
      OnChange = cClienteBusChange
      OnEnter = ColorEnter
      OnExit = ColorExit
      OnKeyDown = cClienteKeyDown
    end
  end
  object PanelDatos: TPanel
    Left = 0
    Top = 329
    Width = 494
    Height = 244
    Align = alClient
    Enabled = False
    TabOrder = 1
    ExplicitWidth = 506
    object GridLineas: TDBGrid
      Left = 1
      Top = 1
      Width = 492
      Height = 242
      Align = alClient
      DataSource = DS
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnDblClick = GridLineasDblClick
      OnTitleClick = GridLineasTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'empresa_cc'
          Title.Caption = 'Empresa'
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cliente_cc'
          Title.Caption = 'Cliente'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'anyo_cc'
          Title.Caption = 'A'#241'o'
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'mes_cc'
          Title.Caption = 'Mes'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'numero_factura_cc'
          Title.Caption = 'Num. Factura'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fecha_factura_cc'
          Title.Caption = 'Fecha Factura'
          Width = 90
          Visible = True
        end>
    end
  end
  object BarraEstado: TStatusBar
    Left = 0
    Top = 573
    Width = 494
    Height = 23
    Color = 15395562
    Panels = <
      item
        Width = 320
      end
      item
        Width = 50
      end>
    ExplicitWidth = 583
  end
  object Query1: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select * from cabecera_consumos')
    Left = 271
    Top = 82
  end
  object DS: TDataSource
    DataSet = ClientDataSet1
    Left = 271
    Top = 114
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 337
    Top = 114
  end
  object QContar: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select count(*) from cabecera_consumos')
    Left = 335
    Top = 83
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    AfterScroll = ClientDataSet1AfterScroll
    OnCalcFields = ClientDataSet1CalcFields
    Left = 303
    Top = 114
    object ClientDataSet1empresa_cc: TStringField
      FieldName = 'empresa_cc'
      FixedChar = True
      Size = 3
    end
    object ClientDataSet1cliente_cc: TStringField
      FieldName = 'cliente_cc'
      FixedChar = True
      Size = 4
    end
    object ClientDataSet1anyo_cc: TIntegerField
      FieldName = 'anyo_cc'
    end
    object ClientDataSet1mes_cc: TIntegerField
      FieldName = 'mes_cc'
    end
    object ClientDataSet1status_factura_cc: TStringField
      FieldName = 'status_factura_cc'
      FixedChar = True
      Size = 1
    end
    object ClientDataSet1numero_factura_cc: TIntegerField
      FieldName = 'numero_factura_cc'
    end
    object ClientDataSet1fecha_factura_cc: TStringField
      FieldName = 'fecha_factura_cc'
      FixedChar = True
      Size = 10
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Query1
    Left = 303
    Top = 82
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
