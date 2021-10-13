object BusquedaTarifas: TBusquedaTarifas
  Left = 53
  Top = 264
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Busqueda de Tarifas'
  ClientHeight = 284
  ClientWidth = 1051
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
    Top = 122
    Width = 1051
    Height = 139
    Align = alClient
    Enabled = False
    TabOrder = 0
    object GridLineas: TDBGrid
      Left = 1
      Top = 1
      Width = 1049
      Height = 137
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
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'empresa_t'
          Title.Caption = 'Empresa'
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'codigo_t'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'precio_congelacion_m3_t'
          Title.Caption = 'Precio Congelacion M3'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'precio_congelacion_kg_t'
          Title.Caption = 'Precio Congelaci'#243'n Kg'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'precio_refrigera_m3_t'
          Title.Caption = 'Precio Refrigera M3'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tipo0_t'
          Title.Caption = 'Manejo 0'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tipo1_t'
          Title.Caption = 'Manejo 1'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tipo2_t'
          Title.Caption = 'Manejo 2'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tipo3_t'
          Title.Caption = 'Manejo 3'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tipo4_t'
          Title.Caption = 'Manejo 4'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'precio_hora1_t'
          Title.Caption = 'Precio hora 1'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'precio_hora2_t'
          Title.Caption = 'Precio Hora 2'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'frio_palet_t'
          Title.Caption = 'Frio / Palet'
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'manejo_palet_t'
          Title.Caption = 'Manejo / Palet'
          Width = 76
          Visible = True
        end>
    end
  end
  object BarraEstado: TStatusBar
    Left = 0
    Top = 261
    Width = 1051
    Height = 23
    Color = 15395562
    Panels = <
      item
        Width = 790
      end
      item
        Width = 50
      end>
  end
  object PanelClaves: TPanel
    Left = 0
    Top = 22
    Width = 1051
    Height = 100
    Align = alTop
    BorderStyle = bsSingle
    Color = 15128264
    ParentBackground = False
    TabOrder = 6
    object nbLabel5: TLabel
      Left = 77
      Top = 56
      Width = 43
      Height = 16
      Caption = 'C'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object StaticText1: TStaticText
      Left = 77
      Top = 25
      Width = 59
      Height = 20
      Caption = 'Empresa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object tNomEmpresa: TPanel
      Left = 210
      Top = 22
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
    object cCodigoBus: TEdit
      Left = 151
      Top = 56
      Width = 32
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 1
      OnEnter = ColorEnter
      OnExit = ColorExit
    end
    object cEmpresaBus: TEdit
      Left = 150
      Top = 22
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
      OnChange = cEmpresaBusChange
      OnEnter = ColorEnter
      OnExit = ColorExit
      OnKeyDown = cEmpresaKeyDown
    end
    object cLupaEmpresas: TSimpleSearch
      Left = 188
      Top = 26
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
  end
  object Query1: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select * from tarifas')
    Left = 448
    Top = 48
  end
  object DS: TDataSource
    DataSet = ClientDataSet1
    Left = 448
    Top = 80
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 514
    Top = 80
  end
  object QContar: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select count(*) from tarifas')
    Left = 512
    Top = 49
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    AfterScroll = ClientDataSet1AfterScroll
    Left = 480
    Top = 80
    object ClientDataSet1empresa_t: TStringField
      FieldName = 'empresa_t'
      FixedChar = True
      Size = 3
    end
    object ClientDataSet1codigo_t: TStringField
      FieldName = 'codigo_t'
      FixedChar = True
      Size = 1
    end
    object ClientDataSet1precio_congelacion_m3_t: TFloatField
      FieldName = 'precio_congelacion_m3_t'
      DisplayFormat = ',0.00000'
      EditFormat = '#.#####'
    end
    object ClientDataSet1precio_congelacion_kg_t: TFloatField
      FieldName = 'precio_congelacion_kg_t'
      DisplayFormat = ',0.00000'
      EditFormat = '#.#####'
    end
    object ClientDataSet1precio_refrigera_m3_t: TFloatField
      FieldName = 'precio_refrigera_m3_t'
      DisplayFormat = ',0.00000'
      EditFormat = '#.#####'
    end
    object ClientDataSet1tipo0_t: TFloatField
      FieldName = 'tipo0_t'
      DisplayFormat = ',0.00000'
      EditFormat = '#.#####'
    end
    object ClientDataSet1tipo1_t: TFloatField
      FieldName = 'tipo1_t'
      DisplayFormat = ',0.00000'
      EditFormat = '#.#####'
    end
    object ClientDataSet1tipo2_t: TFloatField
      FieldName = 'tipo2_t'
      DisplayFormat = ',0.00000'
      EditFormat = '#.#####'
    end
    object ClientDataSet1tipo3_t: TFloatField
      FieldName = 'tipo3_t'
      DisplayFormat = ',0.00000'
      EditFormat = '#.#####'
    end
    object ClientDataSet1tipo4_t: TFloatField
      FieldName = 'tipo4_t'
      DisplayFormat = ',0.00000'
      EditFormat = '#.#####'
    end
    object ClientDataSet1precio_hora1_t: TFloatField
      FieldName = 'precio_hora1_t'
      DisplayFormat = ',0.00000'
      EditFormat = '#.#####'
    end
    object ClientDataSet1precio_hora2_t: TFloatField
      FieldName = 'precio_hora2_t'
      DisplayFormat = ',0.00000'
      EditFormat = '#.#####'
    end
    object ClientDataSet1frio_palet_t: TFloatField
      FieldName = 'frio_palet_t'
      DisplayFormat = ',0.00000'
      EditFormat = '#.#####'
    end
    object ClientDataSet1manejo_palet_t: TFloatField
      FieldName = 'manejo_palet_t'
      DisplayFormat = ',0.00000'
      EditFormat = '#.#####'
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Query1
    Left = 480
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
