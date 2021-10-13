object BusquedaFamilias: TBusquedaFamilias
  Left = 370
  Top = 280
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Busqueda de Familias'
  ClientHeight = 418
  ClientWidth = 408
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
    Top = 170
    Width = 408
    Height = 225
    Align = alClient
    Enabled = False
    TabOrder = 0
    object GridLineas: TDBGrid
      Left = 1
      Top = 1
      Width = 406
      Height = 223
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
      TitleFont.Color = clBlue
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = GridLineasDblClick
      OnTitleClick = GridLineasTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'empresa_f'
          Title.Caption = 'Empresa'
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'codigo_f'
          Title.Caption = 'C'#243'digo'
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descripcion_f'
          Title.Caption = 'Denominaci'#243'n'
          Width = 275
          Visible = True
        end>
    end
  end
  object BarraEstado: TStatusBar
    Left = 0
    Top = 395
    Width = 408
    Height = 23
    Color = 15395562
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object PanelClaves: TPanel
    Left = 0
    Top = 22
    Width = 408
    Height = 148
    Align = alTop
    BorderStyle = bsSingle
    Color = 15128264
    ParentBackground = False
    TabOrder = 6
    object nbLabel5: TLabel
      Left = 20
      Top = 62
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
    object Label3: TLabel
      Left = 383
      Top = 109
      Width = 10
      Height = 19
      Caption = '*'
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object cCodigoBus: TEdit
      Left = 95
      Top = 58
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
      OnEnter = ColorEnter
      OnExit = ColorExit
    end
    object StaticText1: TStaticText
      Left = 20
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
    object cEmpresaBus: TEdit
      Left = 95
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
      TabOrder = 0
      OnChange = cEmpresaBusChange
      OnEnter = ColorEnter
      OnExit = ColorExit
      OnKeyDown = cEmpresaKeyDown
    end
    object tNomEmpresa: TPanel
      Left = 154
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
    object StaticText2: TStaticText
      Left = 20
      Top = 98
      Width = 53
      Height = 20
      Caption = 'Nombre'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object cDenominacionBus: TEdit
      Left = 95
      Top = 96
      Width = 286
      Height = 24
      AutoSize = False
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object cLupaEmpresas: TSimpleSearch
      Left = 128
      Top = 22
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
  end
  object Query1: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select * from familias'
      'order by codigo_f')
    Left = 160
    Top = 88
  end
  object DS: TDataSource
    DataSet = ClientDataSet1
    Left = 248
    Top = 88
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 322
    Top = 88
  end
  object QContar: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select count(*) from fichero_tarifa')
    Left = 289
    Top = 89
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Query1
    Left = 189
    Top = 88
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    AfterScroll = ClientDataSet1AfterScroll
    Left = 219
    Top = 88
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
