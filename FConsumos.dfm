object Consumos: TConsumos
  Left = 386
  Top = 245
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Mantenimiento de Consumos'
  ClientHeight = 459
  ClientWidth = 809
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clRed
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BarraEstado: TStatusBar
    Left = 0
    Top = 436
    Width = 809
    Height = 23
    Color = 15395562
    Panels = <
      item
        Width = 600
      end
      item
        Width = 50
      end>
    ParentFont = True
    UseSystemFont = False
  end
  object PanelDatos: TPanel
    Left = 0
    Top = 138
    Width = 809
    Height = 230
    Align = alClient
    TabOrder = 1
    OnEnter = PanelDatosEnter
    object GridLineas: TDBGrid
      Left = 1
      Top = 33
      Width = 807
      Height = 196
      Align = alClient
      DataSource = DSMaestro
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
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
      TitleFont.Style = [fsBold]
      OnDblClick = GridLineasDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'concepto_cs'
          Title.Caption = 'Concepto'
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NombreConcepto'
          Title.Caption = 'Nombre Concepto'
          Width = 299
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lectura_actual_cs'
          Title.Alignment = taCenter
          Title.Caption = 'Lectura Actual'
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lectura_anterior_cs'
          Title.Alignment = taCenter
          Title.Caption = 'Lectura Anterior'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'consumo_cs'
          Title.Alignment = taCenter
          Title.Caption = 'Consumo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'precio_cs'
          Title.Alignment = taCenter
          Title.Caption = 'Precio'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'total_cs'
          Title.Alignment = taCenter
          Title.Caption = 'Total'
          Width = 91
          Visible = True
        end>
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 807
      Height = 32
      Align = alTop
      Enabled = False
      TabOrder = 1
      object StaticText10: TStaticText
        Left = 589
        Top = 7
        Width = 104
        Height = 17
        Caption = 'TOTAL IMPORTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object cTotalConsumo: TcxCurrencyEdit
        Left = 694
        Top = 3
        TabStop = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = ',0.00'
        Properties.ReadOnly = True
        Properties.UseDisplayFormatWhenEditing = True
        Style.Color = 15395562
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 1
        Width = 94
      end
    end
  end
  object PanelEntrada: TPanel
    Left = 0
    Top = 368
    Width = 809
    Height = 68
    Align = alBottom
    Color = 15128264
    ParentBackground = False
    TabOrder = 2
    Visible = False
    object cConcepto: TcxDBTextEdit
      Left = 19
      Top = 32
      DataBinding.DataField = 'concepto_cs'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Properties.OnChange = cConceptoPropertiesChange
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 0
      OnExit = cConceptoExit
      OnKeyDown = cConceptoKeyDown
      Width = 44
    end
    object tNomConcepto: TPanel
      Left = 88
      Top = 32
      Width = 283
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 1
    end
    object cLupaConceptos: TSimpleSearch
      Left = 62
      Top = 32
      Width = 24
      Height = 24
      TabOrder = 2
      TabStop = False
      OnClick = cLupaConceptosClick
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'MoneyTwins'
      OptionsImage.ImageIndex = 2
      OptionsImage.Images = FDM.ilxImagenes
      Titulo = 'Busqueda de Conceptos'
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
    object StaticText14: TStaticText
      Left = 19
      Top = 14
      Width = 352
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Concepto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object StaticText2: TStaticText
      Left = 370
      Top = 14
      Width = 100
      Height = 19
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Lectura Actual'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object StaticText3: TStaticText
      Left = 469
      Top = 14
      Width = 100
      Height = 19
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Lectura Anterior'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object StaticText4: TStaticText
      Left = 568
      Top = 14
      Width = 64
      Height = 19
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Consumo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    object StaticText7: TStaticText
      Left = 631
      Top = 14
      Width = 65
      Height = 19
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Precio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
    object StaticText8: TStaticText
      Left = 695
      Top = 14
      Width = 94
      Height = 19
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
    end
    object cLecturaActual: TcxDBTextEdit
      Left = 370
      Top = 32
      DataBinding.DataField = 'lectura_actual_cs'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 9
      OnExit = Calculo
      OnKeyDown = cConceptoKeyDown
      Width = 100
    end
    object cLecturaAnterior: TcxDBTextEdit
      Left = 469
      Top = 32
      DataBinding.DataField = 'lectura_anterior_cs'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 10
      OnExit = Calculo
      OnKeyDown = cConceptoKeyDown
      Width = 100
    end
    object cConsumo: TcxDBTextEdit
      Left = 568
      Top = 32
      TabStop = False
      DataBinding.DataField = 'consumo_cs'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 11
      OnExit = Calculo
      OnKeyDown = cConceptoKeyDown
      Width = 64
    end
    object cPrecio: TcxDBTextEdit
      Left = 631
      Top = 32
      TabStop = False
      DataBinding.DataField = 'precio_cs'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 12
      OnExit = Calculo
      OnKeyDown = cConceptoKeyDown
      Width = 65
    end
    object cTotal: TcxDBTextEdit
      Left = 695
      Top = 32
      TabStop = False
      DataBinding.DataField = 'total_cs'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 13
      OnExit = Calculo
      OnKeyDown = cConceptoKeyDown
      Width = 94
    end
  end
  object PanelClaves: TPanel
    Left = 0
    Top = 38
    Width = 809
    Height = 100
    Align = alTop
    Color = 15128264
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 7
    object StaticText1: TStaticText
      Left = 71
      Top = 50
      Width = 48
      Height = 20
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object cCliente: TEdit
      Left = 145
      Top = 53
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
    object StaticText12: TStaticText
      Left = 71
      Top = 24
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
      TabOrder = 3
    end
    object cEmpresa: TEdit
      Left = 145
      Top = 21
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
      Left = 177
      Top = 21
      Width = 279
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 4
    end
    object tNomCliente: TPanel
      Left = 183
      Top = 53
      Width = 273
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
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 688
    Top = 73
  end
  object QMaestro: TQuery
    AfterInsert = QMaestroAfterInsert
    AfterScroll = QMaestroAfterScroll
    OnCalcFields = QMaestroCalcFields
    DatabaseName = 'BDFrigo'
    RequestLive = True
    SQL.Strings = (
      'select * from consumos')
    Left = 656
    Top = 41
    object QMaestroempresa_cs: TStringField
      FieldName = 'empresa_cs'
      Origin = 'BDFRIGO.consumos.empresa_cs'
      Size = 3
    end
    object QMaestrocliente_cs: TStringField
      FieldName = 'cliente_cs'
      Origin = 'BDFRIGO.consumos.cliente_cs'
      Size = 4
    end
    object QMaestroconcepto_cs: TStringField
      FieldName = 'concepto_cs'
      Origin = 'BDFRIGO.consumos.concepto_cs'
      Size = 3
    end
    object QMaestrolectura_actual_cs: TIntegerField
      FieldName = 'lectura_actual_cs'
      Origin = 'BDFRIGO.consumos.lectura_actual_cs'
    end
    object QMaestrolectura_anterior_cs: TIntegerField
      FieldName = 'lectura_anterior_cs'
      Origin = 'BDFRIGO.consumos.lectura_anterior_cs'
    end
    object QMaestroconsumos_cs: TIntegerField
      FieldName = 'consumo_cs'
      Origin = 'BDFRIGO.consumos.consumo_cs'
    end
    object QMaestroprecio_cs: TFloatField
      FieldName = 'precio_cs'
      Origin = 'BDFRIGO.consumos.precio_cs'
      currency = True
    end
    object QMaestrototalo_cs: TFloatField
      FieldName = 'total_cs'
      Origin = 'BDFRIGO.consumos.total_cs'
      DisplayFormat = '0.00'
      currency = True
    end
    object QMaestrofacturado_cs: TStringField
      FieldName = 'facturado_cs'
      Origin = 'BDFRIGO.consumos.facturado_cs'
      Size = 1
    end
    object QMaestroNombreConcepto: TStringField
      FieldKind = fkCalculated
      FieldName = 'NombreConcepto'
      Size = 200
      Calculated = True
    end
  end
  object DSMaestro: TDataSource
    DataSet = QMaestro
    OnStateChange = DSMaestroStateChange
    Left = 656
    Top = 73
  end
  object QContar: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select count(*) from consumos')
    Left = 688
    Top = 41
  end
  object QConceptos: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select * from conceptos')
    Left = 720
    Top = 40
  end
  object DSConceptos: TDataSource
    DataSet = QConceptos
    Left = 720
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
    Left = 760
    Top = 56
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
