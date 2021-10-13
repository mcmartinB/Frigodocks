object BusquedaPeirodicos: TBusquedaPeirodicos
  Left = 123
  Top = 273
  Width = 903
  Height = 319
  BorderIcons = [biSystemMenu]
  Caption = 'Busqueda de Peri'#243'dicos de Facturaci'#243'n'
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
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 895
    Height = 29
    BorderWidth = 1
    ButtonWidth = 24
    Color = clBtnFace
    EdgeBorders = [ebTop, ebBottom]
    Flat = True
    Images = DMBaseDatos.Imagenes
    ParentColor = False
    TabOrder = 0
    object BNuevaBusqueda: TToolButton
      Left = 0
      Top = 0
      Hint = 'Nueva B'#250'queda'
      Caption = 'BNuevaBusqueda'
      ImageIndex = 42
      OnClick = NuevaBusqueda
    end
    object BAceptar: TToolButton
      Left = 24
      Top = 0
      Hint = 'Aceptar (F5)'
      ImageIndex = 4
      ParentShowHint = False
      ShowHint = True
      OnClick = Aceptar
    end
    object BCancelar: TToolButton
      Left = 48
      Top = 0
      Hint = 'Cancelar (Esc)'
      ImageIndex = 12
      ParentShowHint = False
      ShowHint = True
      OnClick = Cancelar
    end
  end
  object BarraEstado: TStatusBar
    Left = 0
    Top = 262
    Width = 895
    Height = 23
    Panels = <>
    SimplePanel = True
  end
  object PanelClaves: TPanel
    Left = 0
    Top = 29
    Width = 895
    Height = 100
    Align = alTop
    BorderStyle = bsSingle
    TabOrder = 2
    object nbLabel5: TLabel
      Left = 18
      Top = 42
      Width = 44
      Height = 16
      Caption = 'C'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object cCodigoBus: TstlEdit
      Left = 77
      Top = 38
      Width = 22
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 1
      ParentFont = False
      TabOrder = 0
      ColorEnter = clMoneyGreen
      ColorExit = clWindow
      ColorAlta = clYellow
      Estado = ecConsulta
    end
  end
  object PanelDatos: TPanel
    Left = 0
    Top = 129
    Width = 895
    Height = 133
    Align = alClient
    TabOrder = 3
    object GridLineas: TDBGrid
      Left = 1
      Top = 1
      Width = 895
      Height = 131
      TabStop = False
      Align = alLeft
      DataSource = DS
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = GridLineasDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'clave'
          Title.Caption = 'C'#243'digo'
          Width = 39
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'congelacion_pts_m3'
          Title.Caption = 'Congelaci'#243'n Eur/m3'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'congelacion_pts_kg'
          Title.Caption = 'Congelaci'#243'n Eur/Kg'
          Width = 103
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'refrigera_pts_m3'
          Title.Caption = 'Refrigeraci'#243'n Eur/m3'
          Width = 106
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tipo_0'
          Title.Caption = 'Manejo Tipo 0'
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tipo_1'
          Title.Caption = 'Manejo Tipo 1'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tipo_2'
          Title.Caption = 'Manejo Tipo 2'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tipo_3'
          Title.Caption = 'Manejo Tipo 3'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tipo_4'
          Title.Caption = 'Manejo Tipo 4'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ptas_hora1'
          Title.Caption = 'Euros Hora1'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ptas_hora2'
          Title.Caption = 'Eurros Hora2'
          Width = 69
          Visible = True
        end>
    end
  end
  object Query1: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select * from fichero_tarifa')
    Left = 136
    Top = 48
  end
  object DS: TDataSource
    DataSet = Query1
    Left = 136
    Top = 80
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 178
    Top = 48
  end
end
