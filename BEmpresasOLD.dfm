object BusquedaEmpresas: TBusquedaEmpresas
  Left = 700
  Top = 154
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Busqueda de Empresas'
  ClientHeight = 152
  ClientWidth = 446
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
  object PanelDatos: TPanel
    Left = 0
    Top = 22
    Width = 446
    Height = 107
    Align = alClient
    Enabled = False
    TabOrder = 0
    ExplicitTop = 129
    ExplicitHeight = 0
    object GridLineas: TDBGrid
      Left = 1
      Top = 1
      Width = 444
      Height = 105
      Align = alClient
      DataSource = DS
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = GridLineasDblClick
    end
  end
  object BarraEstado: TStatusBar
    Left = 0
    Top = 129
    Width = 446
    Height = 23
    Color = 16250871
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object Query1: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select * from empresas')
    Left = 256
    Top = 32
  end
  object DS: TDataSource
    DataSet = ClientDataSet1
    Left = 256
    Top = 64
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 322
    Top = 64
  end
  object QContar: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select count(*) from empresas')
    Left = 320
    Top = 33
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    AfterScroll = ClientDataSet1AfterScroll
    Left = 288
    Top = 64
    object ClientDataSet1codigo_e: TStringField
      FieldName = 'codigo_e'
      FixedChar = True
      Size = 3
    end
    object ClientDataSet1nombre_e: TStringField
      FieldName = 'nombre_e'
      FixedChar = True
      Size = 30
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Query1
    Left = 288
    Top = 32
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
      Hint = 'Primer Registro'
      Visible = ivAlways
      ImageIndex = 2
      OnClick = Primero
    end
    object bAnterior: TdxBarButton
      Caption = 'Anterior Registro'
      Category = 0
      Hint = 'Anterior Registro'
      Visible = ivAlways
      ImageIndex = 3
      OnClick = Anterior
    end
    object bSiguiente: TdxBarButton
      Caption = 'Siguiente Registro'
      Category = 0
      Hint = 'Siguiente Registro'
      Visible = ivAlways
      ImageIndex = 4
      OnClick = Siguiente
    end
    object bUltimo: TdxBarButton
      Caption = 'Ultimo Registro'
      Category = 0
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
