object BusquedaUsuarios: TBusquedaUsuarios
  Left = 601
  Top = 229
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Busqueda de Usuarios'
  ClientHeight = 343
  ClientWidth = 377
  Color = 15128264
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PanelClaves: TPanel
    Left = 0
    Top = 22
    Width = 377
    Height = 148
    Align = alTop
    BorderStyle = bsSingle
    ParentColor = True
    TabOrder = 0
    object StaticText1: TStaticText
      Left = 37
      Top = 25
      Width = 52
      Height = 20
      Caption = 'Usuario'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object cCodigoBus: TEdit
      Left = 125
      Top = 22
      Width = 164
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 12
      ParentFont = False
      TabOrder = 0
      OnEnter = ColorEnter
      OnExit = ColorExit
    end
    object StaticText3: TStaticText
      Left = 37
      Top = 104
      Width = 63
      Height = 20
      Caption = 'Tipo Lote'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object cTipoUsuarioBus: TComboBox
      Left = 125
      Top = 101
      Width = 196
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
      TabOrder = 1
      OnEnter = ColorEnter
      OnExit = ColorExit
      Items.Strings = (
        'A - ADMINISTRADOR'
        'U - USUARIO')
    end
    object StaticText2: TStaticText
      Left = 37
      Top = 65
      Width = 79
      Height = 20
      Caption = 'Contrase'#241'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object cPasswordBus: TEdit
      Left = 125
      Top = 62
      Width = 164
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 12
      ParentFont = False
      TabOrder = 5
      OnEnter = ColorEnter
      OnExit = ColorExit
    end
  end
  object PanelDatos: TPanel
    Left = 0
    Top = 170
    Width = 377
    Height = 150
    Align = alClient
    Enabled = False
    TabOrder = 1
    object GridLineas: TDBGrid
      Left = 1
      Top = 1
      Width = 375
      Height = 148
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
          FieldName = 'codigo_u'
          Title.Caption = 'Usuario'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'password_u'
          Title.Caption = 'Contrase'#241'a'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tipo_u'
          Title.Caption = 'Tipo Usuario'
          Visible = True
        end>
    end
  end
  object BarraEstado: TStatusBar
    Left = 0
    Top = 320
    Width = 377
    Height = 23
    Color = 15592941
    Panels = <
      item
        Width = 390
      end
      item
        Width = 50
      end>
  end
  object Query1: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select * from usuarios')
    Left = 256
    Top = 48
  end
  object DS: TDataSource
    DataSet = ClientDataSet1
    Left = 256
    Top = 80
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 322
    Top = 80
  end
  object QContar: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select count(*) from usuarios')
    Left = 320
    Top = 49
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    AfterScroll = ClientDataSet1AfterScroll
    Left = 288
    Top = 80
    object ClientDataSet1codigo_u: TStringField
      FieldName = 'codigo_u'
      FixedChar = True
      Size = 12
    end
    object ClientDataSet1password_u: TStringField
      FieldName = 'password_u'
      FixedChar = True
      Size = 12
    end
    object ClientDataSet1tipo_u: TStringField
      FieldName = 'tipo_u'
      FixedChar = True
      Size = 1
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Query1
    Left = 288
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
    Left = 224
    Top = 48
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
