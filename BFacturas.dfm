object BusquedaFacturas: TBusquedaFacturas
  Left = 420
  Top = 208
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Busqueda Facturas'
  ClientHeight = 211
  ClientWidth = 574
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
    Top = 188
    Width = 574
    Height = 0
    Align = alClient
    Enabled = False
    TabOrder = 0
    object GridLineas: TDBGrid
      Left = 1
      Top = 1
      Width = 572
      Height = 0
      Align = alClient
      DataSource = DS
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
          FieldName = 'empresa_cf'
          Title.Caption = 'Empresa'
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cliente_cf'
          Title.Caption = 'Cliente'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'numero_factura_cf'
          Title.Caption = 'N'#186' Factura'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FechaFactura'
          Title.Caption = 'Fecha'
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'importe_bruto_cf'
          Title.Caption = 'Imp. Bruto'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'porcentaje_iva_cf'
          Title.Caption = 'IVA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'importe_iva_cf'
          Title.Caption = 'Imp. IVA'
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'importe_neto_cf'
          Title.Caption = 'Imp. Neto'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FechaVencimiento'
          Title.Caption = 'Vencimiento'
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Contabilizada'
          Width = 70
          Visible = True
        end>
    end
  end
  object BarraEstado: TStatusBar
    Left = 0
    Top = 188
    Width = 574
    Height = 23
    Color = 15395562
    Panels = <
      item
        Width = 580
      end
      item
        Width = 50
      end>
  end
  object PanelClaves: TPanel
    Left = 0
    Top = 22
    Width = 574
    Height = 166
    Align = alTop
    BorderStyle = bsSingle
    Color = 15128264
    ParentBackground = False
    TabOrder = 4
    object nbLabel5: TLabel
      Left = 77
      Top = 56
      Width = 44
      Height = 16
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Articulo: TLabel
      Left = 77
      Top = 117
      Width = 37
      Height = 16
      Caption = 'Fecha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object StaticText1: TStaticText
      Left = 77
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
      TabOrder = 3
    end
    object tNomEmpresa: TPanel
      Left = 219
      Top = 22
      Width = 260
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
    object cEmpresaBus: TEdit
      Left = 161
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
    object cClienteBus: TEdit
      Left = 161
      Top = 54
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
      OnChange = cClienteBusChange
      OnEnter = ColorEnter
      OnExit = ColorExit
      OnKeyDown = cClienteKeyDown
    end
    object tNomcliente: TPanel
      Left = 223
      Top = 54
      Width = 255
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
      Left = 77
      Top = 90
      Width = 76
      Height = 20
      AutoSize = False
      Caption = 'N'#186' Factura'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    object cNumFacturaBus: TEdit
      Left = 161
      Top = 86
      Width = 58
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      TabOrder = 2
      OnEnter = ColorEnter
      OnExit = ColorExit
    end
    object cFechaFacturaBus: TcxDateEdit
      Left = 161
      Top = 116
      AutoSize = False
      ParentFont = False
      Style.BorderStyle = ebsUltraFlat
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.ButtonStyle = btsOffice11
      Style.ButtonTransparency = ebtNone
      Style.IsFontAssigned = True
      TabOrder = 7
      Height = 21
      Width = 98
    end
    object cLupaEmpresas: TSimpleSearch
      Left = 193
      Top = 22
      Width = 24
      Height = 24
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
    object cLupaClilentes: TSimpleSearch
      Left = 197
      Top = 54
      Width = 24
      Height = 24
      TabOrder = 9
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
  end
  object Query1: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select * from cabecera_facturas')
    Left = 367
    Top = 122
  end
  object DS: TDataSource
    DataSet = ClientDataSet1
    Left = 367
    Top = 154
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 433
    Top = 154
  end
  object QContar: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select count(*) from tarifas')
    Left = 431
    Top = 123
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    AfterScroll = ClientDataSet1AfterScroll
    OnCalcFields = ClientDataSet1CalcFields
    Left = 399
    Top = 154
    object ClientDataSet1FechaFactura: TStringField
      Alignment = taRightJustify
      FieldKind = fkCalculated
      FieldName = 'FechaFactura'
      Size = 10
      Calculated = True
    end
    object ClientDataSet1FechaVencimiento: TStringField
      Alignment = taRightJustify
      FieldKind = fkCalculated
      FieldName = 'FechaVencimiento'
      Size = 10
      Calculated = True
    end
    object ClientDataSet1empresa_cf: TStringField
      FieldName = 'empresa_cf'
      FixedChar = True
      Size = 3
    end
    object ClientDataSet1cliente_cf: TStringField
      FieldName = 'cliente_cf'
      FixedChar = True
      Size = 4
    end
    object ClientDataSet1numero_factura_cf: TIntegerField
      FieldName = 'numero_factura_cf'
    end
    object ClientDataSet1fecha_factura_cf: TStringField
      FieldName = 'fecha_factura_cf'
      FixedChar = True
      Size = 10
    end
    object ClientDataSet1fecha_vencimiento_cf: TStringField
      FieldName = 'fecha_vencimiento_cf'
      FixedChar = True
      Size = 10
    end
    object ClientDataSet1fecha_desde_cf: TStringField
      FieldName = 'fecha_desde_cf'
      FixedChar = True
      Size = 10
    end
    object ClientDataSet1fecha_hasta_cf: TStringField
      FieldName = 'fecha_hasta_cf'
      FixedChar = True
      Size = 10
    end
    object ClientDataSet1importe_bruto_cf: TFloatField
      FieldName = 'importe_bruto_cf'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object ClientDataSet1porcentaje_iva_cf: TFloatField
      FieldName = 'porcentaje_iva_cf'
    end
    object ClientDataSet1importe_iva_cf: TFloatField
      FieldName = 'importe_iva_cf'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object ClientDataSet1importe_neto_cf: TFloatField
      FieldName = 'importe_neto_cf'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object ClientDataSet1tipo_cf: TStringField
      FieldName = 'tipo_cf'
      FixedChar = True
      Size = 1
    end
    object ClientDataSet1num_contabilizacion_cf: TIntegerField
      FieldName = 'num_contabilizacion_cf'
    end
    object ClientDataSet1ultimo_stock_cf: TFloatField
      FieldName = 'ultimo_stock_cf'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object ClientDataSet1fecha_contabilizacion_cf: TStringField
      FieldName = 'fecha_contabilizacion_cf'
      FixedChar = True
      Size = 10
    end
    object ClientDataSet1Contabilizada: TStringField
      FieldKind = fkCalculated
      FieldName = 'Contabilizada'
      KeyFields = 'Contabilizada'
      Size = 2
      Calculated = True
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Query1
    Left = 399
    Top = 122
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
