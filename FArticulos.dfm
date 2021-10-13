object Articulos: TArticulos
  Left = 365
  Top = 231
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Mantenimiento de Art'#237'culos'
  ClientHeight = 302
  ClientWidth = 618
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
  object PanelDatos: TPanel
    Left = 0
    Top = 161
    Width = 618
    Height = 118
    Align = alClient
    Color = 15128264
    ParentBackground = False
    TabOrder = 0
    OnEnter = PanelDatosEnter
    object StaticText3: TStaticText
      Left = 61
      Top = 54
      Width = 88
      Height = 20
      Caption = 'Unidad Medida'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object StaticText4: TStaticText
      Left = 61
      Top = 85
      Width = 75
      Height = 20
      Caption = 'Valor por Kg'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object cUnidadMedida: TcxDBTextEdit
      Left = 178
      Top = 50
      DataBinding.DataField = 'unidad_medida_a'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.OnChange = cUnidadMedidaChange
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 2
      OnKeyDown = cUnidadMedidaKeyDown
      Width = 22
    end
    object StaticText2: TStaticText
      Left = 61
      Top = 22
      Width = 49
      Height = 20
      Caption = 'Nombre'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object cDenominacion: TcxDBTextEdit
      Left = 178
      Top = 18
      DataBinding.DataField = 'denominacion_a'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 4
      Width = 398
    end
    object cLupaUnidades: TSimpleSearch
      Left = 200
      Top = 50
      Width = 24
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      TabStop = False
      OnClick = cLupaUnidadesClick
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'MoneyTwins'
      OptionsImage.ImageIndex = 2
      OptionsImage.Images = FDM.ilxImagenes
      Titulo = 'Busqueda de Familia'
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
    object tNomUnidad: TPanel
      Left = 226
      Top = 50
      Width = 231
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 6
    end
    object cValorKg: TcxDBCurrencyEdit
      Left = 178
      Top = 80
      AutoSize = False
      DataBinding.DataField = 'valor_por_kg_a'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Properties.DecimalPlaces = 4
      Properties.DisplayFormat = ',0.0000;-,0.0000'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TextStyle = []
      Style.IsFontAssigned = True
      TabOrder = 7
      Height = 24
      Width = 67
    end
  end
  object BarraEstado: TStatusBar
    Left = 0
    Top = 279
    Width = 618
    Height = 23
    Color = 15395562
    Panels = <
      item
        Width = 450
      end
      item
        Width = 50
      end>
  end
  object PanelClaves: TPanel
    Left = 0
    Top = 38
    Width = 618
    Height = 123
    Align = alTop
    Color = 15395562
    ParentBackground = False
    TabOrder = 2
    object StaticText1: TStaticText
      Left = 138
      Top = 83
      Width = 47
      Height = 20
      Caption = 'C'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object cCodigo: TEdit
      Left = 212
      Top = 80
      Width = 44
      Height = 24
      AutoSize = False
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 5
      ParentFont = False
      TabOrder = 2
      OnEnter = ColorEnter
      OnExit = ColorExit
    end
    object StaticText12: TStaticText
      Left = 138
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
      TabOrder = 4
    end
    object cEmpresa: TEdit
      Left = 212
      Top = 18
      Width = 30
      Height = 24
      AutoSize = False
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
      OnExit = ColorExit
      OnKeyDown = cEmpresaKeyDown
    end
    object tNomEmpresa: TPanel
      Left = 268
      Top = 18
      Width = 231
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
    object StaticText13: TStaticText
      Left = 138
      Top = 52
      Width = 66
      Height = 20
      AutoSize = False
      Caption = 'Familia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    object tNomFamilia: TPanel
      Left = 268
      Top = 49
      Width = 231
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 7
    end
    object cFamilia: TEdit
      Left = 212
      Top = 49
      Width = 30
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      TabOrder = 1
      OnChange = cFamiliaChange
      OnEnter = ColorEnter
      OnExit = ColorExit
      OnKeyDown = cFamiliaKeyDown
    end
    object cLupaEmpresas: TSimpleSearch
      Left = 242
      Top = 18
      Width = 24
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
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
    object cLupaFamilias: TSimpleSearch
      Left = 242
      Top = 49
      Width = 24
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      TabStop = False
      OnClick = cLupaFamiliasClick
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'MoneyTwins'
      OptionsImage.ImageIndex = 2
      OptionsImage.Images = FDM.ilxImagenes
      Titulo = 'Busqueda de Familia'
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
  object Panel1: TPanel
    Left = 100
    Top = 139
    Width = 449
    Height = 50
    BorderStyle = bsSingle
    Caption = 'ACTUALIZANDO CLIENTES'
    Color = clSilver
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 7
    Visible = False
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 576
    Top = 74
  end
  object QMaestro: TQuery
    AfterInsert = QMaestroAfterInsert
    BeforeEdit = QMaestroBeforeEdit
    AfterPost = QMaestroAfterPost
    AutoRefresh = True
    DatabaseName = 'BDFrigo'
    RequestLive = True
    SQL.Strings = (
      'select * from articulos')
    Left = 544
    Top = 41
    object QMaestroempresa_a: TStringField
      FieldName = 'empresa_a'
      Origin = 'BDFRIGO.articulos.empresa_a'
      FixedChar = True
      Size = 3
    end
    object QMaestrofamilia_a: TStringField
      FieldName = 'familia_a'
      Origin = 'BDFRIGO.articulos.familia_a'
      FixedChar = True
      Size = 3
    end
    object QMaestrocodigo_a: TStringField
      FieldName = 'codigo_a'
      Origin = 'BDFRIGO.articulos.codigo_a'
      FixedChar = True
      Size = 5
    end
    object QMaestrodenominacion_a: TStringField
      FieldName = 'denominacion_a'
      Origin = 'BDFRIGO.articulos.denominacion_a'
      FixedChar = True
      Size = 30
    end
    object QMaestrounidad_medida_a: TStringField
      FieldName = 'unidad_medida_a'
      Origin = 'BDFRIGO.articulos.unidad_medida_a'
      FixedChar = True
      Size = 1
    end
    object QMaestrovalor_por_kg_a: TFloatField
      FieldName = 'valor_por_kg_a'
      Origin = 'BDFRIGO.articulos.valor_por_kg_a'
      DisplayFormat = ',0.0000'
      EditFormat = '#.####'
    end
  end
  object DSMaestro: TDataSource
    DataSet = QMaestro
    OnStateChange = DSMaestroStateChange
    Left = 576
    Top = 41
  end
  object QContar: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select count(*) from articulos')
    Left = 544
    Top = 73
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
