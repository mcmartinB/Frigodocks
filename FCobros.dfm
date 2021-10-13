object Cobros: TCobros
  Left = 423
  Top = 305
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Mantenimiento de Cobros'
  ClientHeight = 322
  ClientWidth = 584
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
  object BarraEstado: TStatusBar
    Left = 0
    Top = 299
    Width = 584
    Height = 23
    Color = 15395562
    Panels = <
      item
        Width = 420
      end
      item
        Width = 50
      end>
  end
  object PanelDatos: TPanel
    Left = 0
    Top = 216
    Width = 584
    Height = 83
    Align = alClient
    Color = 15128264
    ParentBackground = False
    TabOrder = 1
    OnEnter = PanelDatosEnter
    object StaticText2: TStaticText
      Left = 158
      Top = 51
      Width = 49
      Height = 20
      Caption = 'Importe'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object StaticText4: TStaticText
      Left = 158
      Top = 25
      Width = 67
      Height = 20
      Caption = 'Tipo Cobro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object cTipoDocumento: TDBLookupComboBox
      Left = 251
      Top = 17
      Width = 174
      Height = 24
      DataField = 'tipo_cobro_co'
      DataSource = DSMaestro
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'codigo_tc'
      ListField = 'des'
      ListSource = DSTipoCobros
      ParentFont = False
      TabOrder = 2
      OnKeyPress = cTipoDocumentoKeyPress
    end
    object cImporte: TcxDBCurrencyEdit
      Left = 251
      Top = 47
      AutoSize = False
      DataBinding.DataField = 'importe_co'
      DataBinding.DataSource = DSMaestro
      ParentFont = False
      Properties.DisplayFormat = ',0.00;-,0.00'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TextStyle = []
      Style.IsFontAssigned = True
      TabOrder = 3
      Height = 24
      Width = 121
    end
  end
  object PanelClaves: TPanel
    Left = 0
    Top = 38
    Width = 584
    Height = 178
    Align = alTop
    Color = 15395562
    ParentBackground = False
    TabOrder = 6
    object StaticText12: TStaticText
      Left = 65
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
      TabOrder = 2
    end
    object cEmpresa: TEdit
      Left = 172
      Top = 18
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
      Left = 228
      Top = 18
      Width = 239
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
    object StaticText1: TStaticText
      Left = 65
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
      TabOrder = 6
    end
    object cCliente: TEdit
      Left = 172
      Top = 47
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
    object tNomcliente: TPanel
      Left = 234
      Top = 47
      Width = 233
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 8
    end
    object StaticText3: TStaticText
      Left = 65
      Top = 79
      Width = 76
      Height = 20
      Caption = 'N'#186' Factura '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object StaticText38: TStaticText
      Left = 65
      Top = 109
      Width = 94
      Height = 20
      Caption = 'Fecha Factura'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object StaticText53: TStaticText
      Left = 65
      Top = 137
      Width = 77
      Height = 20
      Caption = 'Fecha Pago'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
    object cFactura: TEdit
      Left = 172
      Top = 77
      Width = 65
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 4
      ParentFont = False
      TabOrder = 9
      OnChange = cClienteChange
      OnEnter = ColorEnter
      OnExit = ColorExit
      OnKeyDown = cClienteKeyDown
    end
    object cFechaFactura: TcxDateEdit
      Left = 172
      Top = 107
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 10
      Height = 23
      Width = 121
    end
    object cFechaPago: TcxDateEdit
      Left = 172
      Top = 136
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 11
      Height = 23
      Width = 121
    end
    object cLupaEmpresas: TSimpleSearch
      Left = 202
      Top = 18
      Width = 24
      Height = 24
      TabOrder = 12
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
    object cLupaClientes: TSimpleSearch
      Left = 208
      Top = 47
      Width = 24
      Height = 24
      TabOrder = 13
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
    object cLupaFacturas: TSimpleSearch
      Left = 237
      Top = 77
      Width = 24
      Height = 24
      TabOrder = 14
      TabStop = False
      OnClick = cLupaFacturasClick
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
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 8
    Top = 138
  end
  object QMaestro: TQuery
    AfterInsert = QMaestroAfterInsert
    BeforeEdit = QMaestroBeforeEdit
    BeforePost = QMaestroBeforePost
    DatabaseName = 'BDFrigo'
    RequestLive = True
    SQL.Strings = (
      'select * from cobros')
    Left = 8
    Top = 33
    object QMaestroempresa_co: TStringField
      FieldName = 'empresa_co'
      Origin = 'BDFRIGO.cobros.empresa_co'
      FixedChar = True
      Size = 3
    end
    object QMaestrocliente_co: TStringField
      FieldName = 'cliente_co'
      Origin = 'BDFRIGO.cobros.cliente_co'
      FixedChar = True
      Size = 4
    end
    object QMaestrofactura_co: TIntegerField
      FieldName = 'factura_co'
      Origin = 'BDFRIGO.cobros.factura_co'
    end
    object QMaestrotipo_cobro_co: TStringField
      FieldName = 'tipo_cobro_co'
      Origin = 'BDFRIGO.cobros.tipo_cobro_co'
      FixedChar = True
      Size = 1
    end
    object QMaestroimporte_co: TFloatField
      FieldName = 'importe_co'
      Origin = 'BDFRIGO.cobros.importe_co'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object QMaestrofecha_factura_co: TStringField
      FieldName = 'fecha_factura_co'
      Origin = 'BDFRIGO.cobros.fecha_factura_co'
      FixedChar = True
      Size = 10
    end
    object QMaestrofecha_pago_co: TStringField
      FieldName = 'fecha_pago_co'
      Origin = 'BDFRIGO.cobros.fecha_pago_co'
      FixedChar = True
      Size = 10
    end
    object QMaestroserial_co: TIntegerField
      FieldName = 'serial_co'
      Origin = 'BDFRIGO.cobros.serial_co'
    end
  end
  object DSMaestro: TDataSource
    DataSet = QMaestro
    OnStateChange = DSMaestroStateChange
    Left = 8
    Top = 65
  end
  object QContar: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select count(*) from cobros')
    Left = 8
    Top = 105
  end
  object QTipoCobros: TQuery
    OnCalcFields = QTipoCobrosCalcFields
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select *'
      'from tipo_cobros')
    Left = 488
    Top = 40
    object QTipoCobroscodigo_tc: TStringField
      FieldName = 'codigo_tc'
      Origin = 'BDFRIGO."dbo.tipo_cobros".codigo_tc'
      FixedChar = True
      Size = 1
    end
    object QTipoCobrosdescripcion_tc: TStringField
      FieldName = 'descripcion_tc'
      Origin = 'BDFRIGO."dbo.tipo_cobros".descripcion_tc'
      FixedChar = True
    end
    object QTipoCobrosdes: TStringField
      FieldKind = fkCalculated
      FieldName = 'des'
      Size = 50
      Calculated = True
    end
  end
  object DSTipoCobros: TDataSource
    DataSet = QTipoCobros
    Left = 488
    Top = 72
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
