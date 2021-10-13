object ChequeoLotes: TChequeoLotes
  Left = 277
  Top = 218
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Chequeo de Lotes de Importaci'#243'n'
  ClientHeight = 107
  ClientWidth = 384
  Color = 15128264
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  object BarraEstado: TStatusBar
    Left = 0
    Top = 84
    Width = 384
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
  object StaticText1: TStaticText
    Left = 23
    Top = 54
    Width = 59
    Height = 20
    Caption = 'Empresa'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object cEmpresa: TEdit
    Left = 98
    Top = 51
    Width = 32
    Height = 24
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 3
    ParentFont = False
    TabOrder = 0
    OnChange = cEmpresaChange
    OnEnter = ColorEnter
    OnExit = ColorExit
    OnKeyDown = cEmpresaKeyDown
  end
  object tNomEmpresa: TPanel
    Left = 156
    Top = 51
    Width = 185
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = True
    ParentFont = False
    TabOrder = 3
  end
  object cLupaEmpresas: TSimpleSearch
    Left = 131
    Top = 51
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
  object QCabecerasEnt: TQuery
    DatabaseName = 'BDFrigo'
    Left = 184
    Top = 8
  end
  object QLineasEnt: TQuery
    DatabaseName = 'BDFrigo'
    Left = 224
    Top = 8
  end
  object QAlmacenes: TQuery
    DatabaseName = 'BDFrigo'
    Left = 264
    Top = 8
  end
  object kbmMemTable1: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '5.51'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 144
    Top = 8
    object kbmMemTable1Albaran: TIntegerField
      FieldName = 'Albaran'
    end
    object kbmMemTable1Fecha: TStringField
      FieldName = 'Fecha'
      Size = 10
    end
    object kbmMemTable1Cliente: TStringField
      FieldName = 'Cliente'
      Size = 4
    end
    object kbmMemTable1Empresa: TStringField
      FieldName = 'Empresa'
      Size = 3
    end
    object kbmMemTable1Familia: TStringField
      FieldName = 'Familia'
      Size = 3
    end
    object kbmMemTable1Articulo: TStringField
      FieldName = 'Articulo'
      Size = 5
    end
    object kbmMemTable1NomArticulo: TStringField
      FieldName = 'NomArticulo'
      Size = 50
    end
    object kbmMemTable1NomCliente: TStringField
      FieldName = 'NomCliente'
      Size = 50
    end
    object kbmMemTable1Lote: TStringField
      FieldName = 'Lote'
      Size = 7
    end
  end
  object QAlmacenesUpdate: TQuery
    DatabaseName = 'BDFrigo'
    RequestLive = True
    Left = 304
    Top = 8
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
    Left = 320
    Top = 35
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
          ItemName = 'bAceptar'
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
    object bAceptar: TdxBarLargeButton
      Caption = 'Aceptar'
      Category = 0
      Hint = 'Aceptar (F5)'
      Visible = ivAlways
      LargeImageIndex = 6
      OnClick = Aceptar
      AutoGrayScale = False
    end
    object bSalir: TdxBarLargeButton
      Caption = 'Salir'
      Category = 0
      Hint = 'Salir'
      Visible = ivAlways
      LargeImageIndex = 10
      OnClick = BSalirClick
      AutoGrayScale = False
    end
  end
end
