object Consumos: TConsumos
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Mantenimiento de Consumos El'#233'ctricos'
  ClientHeight = 530
  ClientWidth = 1084
  Color = 15395562
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PanelClaves: TPanel
    Left = 0
    Top = 38
    Width = 1084
    Height = 83
    Align = alTop
    Color = 15395562
    ParentBackground = False
    TabOrder = 0
    OnExit = PanelClavesExit
    object StaticText12: TStaticText
      Left = 21
      Top = 19
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
      Left = 99
      Top = 16
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
      OnChange = cEmpresaChange
      OnEnter = ColorEnter
      OnExit = ColorExit
      OnKeyDown = cEmpresaKeyDown
    end
    object tNomEmpresa: TPanel
      Left = 155
      Top = 16
      Width = 267
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
      Left = 129
      Top = 16
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
    object StaticText13: TStaticText
      Left = 21
      Top = 48
      Width = 48
      Height = 20
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
    object cCliente: TEdit
      Left = 99
      Top = 45
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
      TabOrder = 1
      OnChange = cClienteChange
      OnEnter = ColorEnter
      OnExit = ColorExit
      OnKeyDown = cClienteKeyDown
    end
    object cLupaClientes: TSimpleSearch
      Left = 135
      Top = 45
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
    object tNomcliente: TPanel
      Left = 161
      Top = 45
      Width = 261
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 9
    end
    object StaticText1: TStaticText
      Left = 471
      Top = 19
      Width = 99
      Height = 20
      Caption = 'A'#241'o Consumo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
    end
    object cAnyoConsumo: TEdit
      Left = 597
      Top = 15
      Width = 58
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 4
      ParentFont = False
      TabOrder = 2
      OnEnter = ColorEnter
    end
    object StaticText2: TStaticText
      Left = 471
      Top = 48
      Width = 101
      Height = 20
      Caption = 'Mes Consumo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
    end
    object cMesConsumo: TEdit
      Left = 597
      Top = 45
      Width = 58
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 3
      OnEnter = ColorEnter
      OnExit = cMesConsumoExit
    end
    object PanelCabecera: TPanel
      Left = 680
      Top = 10
      Width = 363
      Height = 56
      Color = 15395562
      ParentBackground = False
      TabOrder = 12
      object cFactura: TcxDBTextEdit
        Left = 69
        Top = 17
        TabStop = False
        DataBinding.DataField = 'numero_factura_cc'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.ReadOnly = True
        Properties.OnChange = cConceptoPropertiesChange
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 0
        OnEnter = cConceptoEnter
        OnExit = cConceptoExit
        OnKeyDown = cConceptoKeyDown
        Width = 76
      end
      object StaticText8: TStaticText
        Left = 12
        Top = 20
        Width = 56
        Height = 20
        Caption = 'Factura'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object StaticText9: TStaticText
        Left = 180
        Top = 20
        Width = 51
        Height = 20
        Caption = 'Fecha '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object cFechaFactura: TcxDBDateEdit
        Left = 232
        Top = 16
        TabStop = False
        DataBinding.DataField = 'fecha_factura_cc'
        DataBinding.DataSource = DSMaestro
        ParentFont = False
        Properties.ReadOnly = True
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 3
        Width = 121
      end
    end
  end
  object PanelLineas: TPanel
    Left = 0
    Top = 121
    Width = 1084
    Height = 308
    Align = alClient
    Caption = 'PanelLineas'
    Color = 15395562
    ParentBackground = False
    TabOrder = 2
    OnEnter = PanelLineasEnter
    object GridLineas: TDBGrid
      Left = 1
      Top = 33
      Width = 1082
      Height = 274
      Align = alClient
      DataSource = DSLineas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      OnDblClick = GridLineasDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'concepto_lc'
          Title.Alignment = taCenter
          Title.Caption = 'Concepto'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NombreConcepto'
          Title.Caption = 'Descripci'#243'n'
          Width = 289
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lectura_actual_lc'
          Title.Alignment = taCenter
          Title.Caption = 'Lectura Actual'
          Width = 116
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lectura_anterior_lc'
          Title.Alignment = taCenter
          Title.Caption = 'Lectura Anterior'
          Width = 125
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'consumo_lc'
          Title.Alignment = taCenter
          Title.Caption = 'Consumo'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'precio_lc'
          Title.Alignment = taCenter
          Title.Caption = 'Precio'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'total_lc'
          Title.Alignment = taCenter
          Title.Caption = 'Total'
          Width = 110
          Visible = True
        end>
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 1082
      Height = 32
      Align = alTop
      Enabled = False
      TabOrder = 1
      object StaticText10: TStaticText
        Left = 691
        Top = 6
        Width = 125
        Height = 20
        Caption = 'TOTAL IMPORTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object cTotalConsumo: TcxCurrencyEdit
        Left = 822
        Top = 2
        TabStop = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.ReadOnly = True
        Properties.UseDisplayFormatWhenEditing = True
        Style.Color = 15395562
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 1
        Width = 108
      end
      object cxCurrencyEdit1: TcxCurrencyEdit
        Left = 480
        Top = 8
        TabOrder = 2
        Width = 121
      end
    end
  end
  object BarraEstado: TStatusBar
    Left = 0
    Top = 507
    Width = 1084
    Height = 23
    Color = 15395562
    Panels = <
      item
        Width = 850
      end
      item
        Width = 50
      end>
  end
  object PanelInsertarLinea: TPanel
    Left = 0
    Top = 429
    Width = 1084
    Height = 78
    Align = alBottom
    Color = 15128264
    ParentBackground = False
    TabOrder = 7
    Visible = False
    ExplicitLeft = -1
    ExplicitTop = 434
    object StaticText14: TStaticText
      Left = 21
      Top = 19
      Width = 352
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Concepto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    object cConcepto: TcxDBTextEdit
      Left = 21
      Top = 37
      DataBinding.DataField = 'concepto_lc'
      DataBinding.DataSource = DSLineas
      ParentFont = False
      Properties.OnChange = cConceptoPropertiesChange
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 0
      OnEnter = cConceptoEnter
      OnExit = cConceptoExit
      OnKeyDown = cConceptoKeyDown
      Width = 30
    end
    object LupaConcepto: TSimpleSearch
      Left = 50
      Top = 37
      Width = 16
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      TabStop = False
      OnClick = LupaConceptoClick
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
    object tNomConcepto: TPanel
      Left = 66
      Top = 38
      Width = 307
      Height = 23
      Alignment = taLeftJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 8
    end
    object StaticText3: TStaticText
      Left = 372
      Top = 19
      Width = 122
      Height = 19
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Lectura Actual'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
    end
    object cLecturaActual: TcxDBCurrencyEdit
      Left = 372
      Top = 37
      DataBinding.DataField = 'lectura_actual_lc'
      DataBinding.DataSource = DSLineas
      ParentFont = False
      Properties.AssignedValues.DisplayFormat = True
      Properties.DecimalPlaces = 0
      Properties.Nullable = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 1
      OnExit = Calculo
      OnKeyPress = SinSignos
      Width = 123
    end
    object StaticText4: TStaticText
      Left = 493
      Top = 19
      Width = 122
      Height = 19
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Lectura Anterior'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
    end
    object cLecturaAnterior: TcxDBCurrencyEdit
      Left = 493
      Top = 37
      DataBinding.DataField = 'lectura_anterior_lc'
      DataBinding.DataSource = DSLineas
      ParentFont = False
      Properties.AssignedValues.DisplayFormat = True
      Properties.DecimalPlaces = 0
      Properties.Nullable = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 2
      OnExit = Calculo
      OnKeyPress = SinSignos
      Width = 122
    end
    object StaticText5: TStaticText
      Left = 614
      Top = 19
      Width = 103
      Height = 19
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Consumo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
    end
    object cConsumo: TcxDBCurrencyEdit
      Left = 614
      Top = 37
      TabStop = False
      DataBinding.DataField = 'consumo_lc'
      DataBinding.DataSource = DSLineas
      ParentFont = False
      Properties.AssignedValues.DisplayFormat = True
      Properties.DecimalPlaces = 0
      Properties.Nullable = False
      Properties.ReadOnly = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 3
      Width = 104
    end
    object StaticText6: TStaticText
      Left = 716
      Top = 19
      Width = 100
      Height = 19
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Precio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 12
    end
    object cPrecio: TcxDBCurrencyEdit
      Left = 716
      Top = 37
      TabStop = False
      DataBinding.DataField = 'precio_lc'
      DataBinding.DataSource = DSLineas
      ParentFont = False
      Properties.DisplayFormat = ',0.00;-,0.00'
      Properties.Nullable = False
      Properties.ReadOnly = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 4
      OnEnter = cPrecioEnter
      OnExit = cPrecioExit
      OnKeyPress = SinSignos
      Width = 100
    end
    object StaticText7: TStaticText
      Left = 815
      Top = 19
      Width = 115
      Height = 19
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 13
    end
    object cTotal: TcxDBCurrencyEdit
      Left = 815
      Top = 37
      TabStop = False
      DataBinding.DataField = 'total_lc'
      DataBinding.DataSource = DSLineas
      ParentFont = False
      Properties.DisplayFormat = ',0.00;-,0.00'
      Properties.ReadOnly = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 5
      Width = 115
    end
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
    Left = 16
    Top = 176
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
          ItemName = 'bImprimir'
        end
        item
          Visible = True
          ItemName = 'bBusqueda'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bAltaL'
        end
        item
          Visible = True
          ItemName = 'bBorrarL'
        end
        item
          Visible = True
          ItemName = 'bPrimeroL'
        end
        item
          Visible = True
          ItemName = 'bAnteriorL'
        end
        item
          Visible = True
          ItemName = 'bSiguienteL'
        end
        item
          Visible = True
          ItemName = 'bUltimoL'
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
          ItemName = 'bSalir'
        end>
      OneOnRow = True
      RotateWhenVertical = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
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
    object bImprimir: TdxBarLargeButton
      Caption = 'Imprimir'
      Category = 0
      Enabled = False
      Hint = 'Imprimir'
      Visible = ivAlways
      LargeImageIndex = 12
      OnClick = bImprimirClick
      AutoGrayScale = False
    end
    object bAlta: TdxBarLargeButton
      Caption = 'Alta'
      Category = 0
      Hint = 'Alta Registro'
      Visible = ivAlways
      LargeImageIndex = 0
      OnClick = bAltaClick
      AutoGrayScale = False
    end
    object bBorrar: TdxBarLargeButton
      Caption = 'Borrar'
      Category = 0
      Enabled = False
      Hint = 'Borrar Registro'
      Visible = ivAlways
      LargeImageIndex = 1
      OnClick = Borrar
      AutoGrayScale = False
    end
    object bAltaL: TdxBarLargeButton
      Caption = 'Alta L'#237'nea'
      Category = 0
      Enabled = False
      Hint = 'Alta L'#237'nea'
      Visible = ivAlways
      LargeImageIndex = 13
      OnClick = bAltaLinea
      AutoGrayScale = False
    end
    object bBorrarL: TdxBarLargeButton
      Caption = 'Borrar Linea'
      Category = 0
      Enabled = False
      Hint = 'Borrar Linea'
      Visible = ivAlways
      LargeImageIndex = 14
      OnClick = bBorrarLinea
      AutoGrayScale = False
    end
    object bUltimoL: TdxBarLargeButton
      Caption = 'Ult. L'#237'nea'
      Category = 0
      Enabled = False
      Hint = #218'ltima Linea'
      Visible = ivAlways
      LargeImageIndex = 17
      OnClick = bUltimoLClick
      AutoGrayScale = False
    end
    object bSiguienteL: TdxBarLargeButton
      Caption = 'Sig. L'#237'nea'
      Category = 0
      Enabled = False
      Hint = 'Siguiente L'#237'nea'
      Visible = ivAlways
      LargeImageIndex = 18
      OnClick = bSiguienteLClick
      AutoGrayScale = False
    end
    object bPrimeroL: TdxBarLargeButton
      Caption = 'Prim. L'#237'nea'
      Category = 0
      Enabled = False
      Hint = 'Primera Linea'
      Visible = ivAlways
      LargeImageIndex = 19
      OnClick = bPrimeroLClick
      AutoGrayScale = False
    end
    object bAnteriorL: TdxBarLargeButton
      Caption = 'Ant. L'#237'nea'
      Category = 0
      Enabled = False
      Hint = 'Anterior L'#237'nea'
      Visible = ivAlways
      LargeImageIndex = 20
      OnClick = bAnteriorLClick
      AutoGrayScale = False
    end
  end
  object QMaestro: TQuery
    AfterOpen = QMaestroAfterOpen
    BeforeClose = QMaestroBeforeClose
    AfterInsert = QMaestroAfterInsert
    BeforeEdit = QMaestroBeforeEdit
    AfterEdit = QMaestroAfterEdit
    BeforePost = QMaestroBeforePost
    DatabaseName = 'BDFrigo'
    RequestLive = True
    SQL.Strings = (
      'select * from cabecera_consumos')
    Left = 45
    Top = 177
    object QMaestroempresa_cc: TStringField
      FieldName = 'empresa_cc'
      Origin = 'BDFRIGO.cabecera_consumos.empresa_cc'
      FixedChar = True
      Size = 3
    end
    object QMaestrocliente_cc: TStringField
      FieldName = 'cliente_cc'
      Origin = 'BDFRIGO.cabecera_consumos.cliente_cc'
      FixedChar = True
      Size = 4
    end
    object QMaestroanyo_cc: TIntegerField
      FieldName = 'anyo_cc'
      Origin = 'BDFRIGO.cabecera_consumos.anyo_cc'
    end
    object QMaestromes_cc: TIntegerField
      FieldName = 'mes_cc'
      Origin = 'BDFRIGO.cabecera_consumos.mes_cc'
    end
    object QMaestrostatus_factura_cc: TStringField
      FieldName = 'status_factura_cc'
      Origin = 'BDFRIGO.cabecera_consumos.status_factura_cc'
      FixedChar = True
      Size = 1
    end
    object QMaestronumero_factura_cc: TIntegerField
      FieldName = 'numero_factura_cc'
      Origin = 'BDFRIGO.cabecera_consumos.numero_factura_cc'
    end
    object QMaestrofecha_factura_cc: TStringField
      FieldName = 'fecha_factura_cc'
      Origin = 'BDFRIGO.cabecera_consumos.fecha_factura_cc'
      FixedChar = True
      Size = 10
    end
  end
  object DSMaestro: TDataSource
    DataSet = QMaestro
    OnStateChange = DSMaestroStateChange
    OnDataChange = DSMaestroDataChange
    Left = 77
    Top = 177
  end
  object QLineas: TQuery
    BeforeInsert = QLineasBeforeInsert
    BeforeEdit = QLineasBeforeEdit
    AfterScroll = QLineasAfterScroll
    OnCalcFields = QLineasCalcFields
    DatabaseName = 'BDFrigo'
    DataSource = DSMaestro
    RequestLive = True
    SQL.Strings = (
      'select * from linea_consumos'
      'where empresa_lc=:empresa_cc'
      'and cliente_lc=:cliente_cc'
      'and anyo_lc=:anyo_cc'
      'and mes_lc=:mes_cc'
      'order by empresa_lc, cliente_lc,anyo_lc,mes_lc')
    Left = 46
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'empresa_cc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cliente_cc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anyo_cc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mes_cc'
        ParamType = ptUnknown
      end>
    object strngfldQLineasempresa_lc: TStringField
      FieldName = 'empresa_lc'
      Origin = 'BDFRIGO.linea_consumos.empresa_lc'
      FixedChar = True
      Size = 3
    end
    object strngfldQLineascliente_lc: TStringField
      FieldName = 'cliente_lc'
      Origin = 'BDFRIGO.linea_consumos.cliente_lc'
      FixedChar = True
      Size = 4
    end
    object QLineasanyo_lc: TIntegerField
      FieldName = 'anyo_lc'
      Origin = 'BDFRIGO.linea_consumos.anyo_lc'
    end
    object QLineasmes_lc: TIntegerField
      FieldName = 'mes_lc'
      Origin = 'BDFRIGO.linea_consumos.mes_lc'
    end
    object QLineasconcepto_lc: TStringField
      FieldName = 'concepto_lc'
      Origin = 'BDFRIGO.linea_consumos.concepto_lc'
      Size = 3
    end
    object QLineaslectura_actual_lc: TIntegerField
      FieldName = 'lectura_actual_lc'
      Origin = 'BDFRIGO.linea_consumos.lectura_actual_lc'
    end
    object QLineaslectura_anterior_lc: TIntegerField
      FieldName = 'lectura_anterior_lc'
      Origin = 'BDFRIGO.linea_consumos.lectura_anterior_lc'
    end
    object QLineasconsumo_lc: TIntegerField
      FieldName = 'consumo_lc'
      Origin = 'BDFRIGO.linea_consumos.consumo_lc'
    end
    object QLineasprecio_lc: TCurrencyField
      FieldName = 'precio_lc'
      Origin = 'BDFRIGO.linea_consumos.precio_lc'
    end
    object QLineastotal_lc: TCurrencyField
      FieldName = 'total_lc'
      Origin = 'BDFRIGO.linea_consumos.total_lc'
    end
    object QLineasNombreConcepto: TStringField
      FieldKind = fkCalculated
      FieldName = 'NombreConcepto'
      Size = 30
      Calculated = True
    end
  end
  object DSLineas: TDataSource
    DataSet = QLineas
    Left = 79
    Top = 208
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    Left = 110
    Top = 177
  end
  object QContar: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select count(*) from cabecera_entradas')
    Left = 45
    Top = 241
  end
  object QConceptos: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select * from conceptos')
    Left = 76
    Top = 240
  end
end
