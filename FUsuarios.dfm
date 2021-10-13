object Usuarios: TUsuarios
  Left = 361
  Top = 258
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Mantenimiento de Usuarios'
  ClientHeight = 295
  ClientWidth = 590
  Color = 15128264
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
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object BarraEstado: TStatusBar
    Left = 0
    Top = 272
    Width = 590
    Height = 23
    Color = 15592941
    Panels = <
      item
        Width = 400
      end
      item
        Width = 50
      end>
    ExplicitWidth = 379
  end
  object PanelClaves: TPanel
    Left = 0
    Top = 38
    Width = 590
    Height = 66
    Align = alTop
    ParentColor = True
    TabOrder = 1
    ExplicitLeft = -8
    ExplicitTop = 80
    ExplicitWidth = 379
    object StaticText1: TStaticText
      Left = 109
      Top = 23
      Width = 52
      Height = 20
      Caption = 'Usuario'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object cCodigo: TEdit
      Left = 193
      Top = 20
      Width = 115
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 12
      ParentFont = False
      TabOrder = 1
      OnEnter = ColorEnter
    end
  end
  object PanelDatos: TPanel
    Left = 0
    Top = 104
    Width = 590
    Height = 168
    Align = alClient
    ParentColor = True
    TabOrder = 2
    OnEnter = PanelDatosEnter
    ExplicitLeft = 1
    object cPassword: TDBEdit
      Left = 193
      Top = 20
      Width = 115
      Height = 24
      AutoSize = False
      CharCase = ecUpperCase
      DataField = 'password_u'
      DataSource = DSMaestro
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object StaticText2: TStaticText
      Left = 109
      Top = 22
      Width = 79
      Height = 20
      Caption = 'Contrase'#241'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object GroupBox1: TGroupBox
      Left = 99
      Top = 64
      Width = 232
      Height = 89
      Caption = 'Tipo Usuario'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object cTipoUsuario: TDBLookupComboBox
        Left = 26
        Top = 38
        Width = 183
        Height = 24
        DataField = 'tipo_u'
        DataSource = DSMaestro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'codigo_tu'
        ListField = 'des'
        ListSource = DSTiposLote
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 496
    Top = 74
  end
  object QMaestro: TQuery
    AfterInsert = QMaestroAfterInsert
    DatabaseName = 'BDFrigo'
    RequestLive = True
    SQL.Strings = (
      'select * from usuarios')
    Left = 464
    Top = 41
    object QMaestrocodigo_u: TStringField
      FieldName = 'codigo_u'
      Origin = 'BDFRIGO.usuarios.codigo_u'
      FixedChar = True
      Size = 12
    end
    object QMaestropassword_u: TStringField
      FieldName = 'password_u'
      Origin = 'BDFRIGO.usuarios.password_u'
      FixedChar = True
      Size = 12
    end
    object QMaestrotipo_u: TStringField
      FieldName = 'tipo_u'
      Origin = 'BDFRIGO.usuarios.tipo_u'
      FixedChar = True
      Size = 1
    end
  end
  object DSMaestro: TDataSource
    DataSet = QMaestro
    OnStateChange = DSMaestroStateChange
    Left = 496
    Top = 41
  end
  object QContar: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select count(*) from usuarios')
    Left = 464
    Top = 73
  end
  object QTiposUsuario: TQuery
    OnCalcFields = QTiposUsuarioCalcFields
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select *'
      'from tipos_usuario'
      ''
      '')
    Left = 464
    Top = 104
    object QTiposUsuariocodigo_tu: TStringField
      FieldName = 'codigo_tu'
      Origin = 'BDFRIGO."dbo.tipos_usuario".codigo_tu'
      FixedChar = True
      Size = 1
    end
    object QTiposUsuariodescripcion_tu: TStringField
      FieldName = 'descripcion_tu'
      Origin = 'BDFRIGO."dbo.tipos_usuario".descripcion_tu'
      FixedChar = True
      Size = 30
    end
    object QTiposUsuariodes: TStringField
      FieldKind = fkCalculated
      FieldName = 'des'
      Size = 50
      Calculated = True
    end
  end
  object DSTiposLote: TDataSource
    DataSet = QTiposUsuario
    Left = 496
    Top = 104
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
