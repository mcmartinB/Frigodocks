object BusquedaSalidas: TBusquedaSalidas
  Left = 515
  Top = 273
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Busqueda Albaranes Salida'
  ClientHeight = 501
  ClientWidth = 462
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
  object PanelClaves: TPanel
    Left = 0
    Top = 22
    Width = 462
    Height = 222
    Align = alTop
    BorderStyle = bsSingle
    Color = 15128264
    ParentBackground = False
    TabOrder = 0
    object nbLabel5: TLabel
      Left = 30
      Top = 58
      Width = 49
      Height = 16
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object StaticText1: TStaticText
      Left = 30
      Top = 25
      Width = 66
      Height = 20
      Caption = 'Empresa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object tNomEmpresa: TPanel
      Left = 168
      Top = 22
      Width = 257
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 5
    end
    object cEmpresaBus: TEdit
      Left = 114
      Top = 22
      Width = 30
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
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
      Left = 114
      Top = 55
      Width = 36
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
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
      Left = 172
      Top = 55
      Width = 254
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 6
    end
    object StaticText13: TStaticText
      Left = 30
      Top = 92
      Width = 76
      Height = 20
      AutoSize = False
      Caption = 'Albar'#225'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
    object cAlbaranBus: TEdit
      Left = 114
      Top = 88
      Width = 58
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnEnter = ColorEnter
      OnExit = ColorExit
    end
    object GrupoFecha: TGroupBox
      Left = 24
      Top = 125
      Width = 409
      Height = 68
      Caption = 'Fecha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object Articulo: TLabel
        Left = 38
        Top = 30
        Width = 47
        Height = 16
        Caption = 'Desde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 222
        Top = 30
        Width = 42
        Height = 16
        Caption = 'Hasta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cFechaDesdeBus: TcxDateEdit
        Left = 92
        Top = 27
        ParentFont = False
        TabOrder = 0
        Width = 101
      end
      object cFechaHastaBus: TcxDateEdit
        Left = 276
        Top = 27
        ParentFont = False
        TabOrder = 1
        Width = 101
      end
    end
    object cLupaEmpresas: TSimpleSearch
      Left = 145
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
      Left = 151
      Top = 55
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
  object PanelDatos: TPanel
    Left = 0
    Top = 244
    Width = 462
    Height = 234
    Align = alClient
    Enabled = False
    TabOrder = 1
    object GridLineas: TDBGrid
      Left = 1
      Top = 1
      Width = 460
      Height = 232
      Align = alClient
      DataSource = DS
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = GridLineasDblClick
      OnTitleClick = GridLineasTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'empresa_cs'
          Title.Caption = 'Empresa'
          Width = 51
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'albaran_cs'
          Title.Caption = 'Albar'#225'n'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cliente_cs'
          Title.Caption = 'Cliente'
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FechaAlbaran'
          Title.Caption = 'Fecha Albar'#225'n'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'numero_factura_cs'
          Title.Caption = 'N'#250'mero Factura'
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FechaFactura'
          Title.Caption = 'Fecha Factura'
          Width = 80
          Visible = True
        end>
    end
  end
  object BarraEstado: TStatusBar
    Left = 0
    Top = 478
    Width = 462
    Height = 23
    Color = 15395562
    Panels = <
      item
        Width = 320
      end
      item
        Width = 50
      end>
  end
  object Query1: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select * from cabecera_salidas')
    Left = 271
    Top = 82
  end
  object DS: TDataSource
    DataSet = ClientDataSet1
    Left = 271
    Top = 114
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 337
    Top = 114
  end
  object QContar: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select count(*) from cabecera_entradas')
    Left = 335
    Top = 83
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    AfterScroll = ClientDataSet1AfterScroll
    OnCalcFields = ClientDataSet1CalcFields
    Left = 303
    Top = 114
    object ClientDataSet1empresa_cs: TStringField
      FieldName = 'empresa_cs'
      FixedChar = True
      Size = 3
    end
    object ClientDataSet1albaran_cs: TIntegerField
      FieldName = 'albaran_cs'
    end
    object ClientDataSet1cliente_cs: TStringField
      FieldName = 'cliente_cs'
      FixedChar = True
      Size = 4
    end
    object ClientDataSet1tipo_salida_cs: TStringField
      FieldName = 'tipo_salida_cs'
      FixedChar = True
      Size = 1
    end
    object ClientDataSet1importe_salida_cs: TFloatField
      FieldName = 'importe_salida_cs'
    end
    object ClientDataSet1horas_salida_cs: TFloatField
      FieldName = 'horas_salida_cs'
    end
    object ClientDataSet1numero_factura_cs: TIntegerField
      FieldName = 'numero_factura_cs'
    end
    object ClientDataSet1orden_numero_cs: TStringField
      FieldName = 'orden_numero_cs'
      FixedChar = True
      Size = 12
    end
    object ClientDataSet1concepto_cs: TStringField
      FieldName = 'concepto_cs'
      FixedChar = True
      Size = 60
    end
    object ClientDataSet1matricula_cs: TStringField
      FieldName = 'matricula_cs'
      FixedChar = True
      Size = 30
    end
    object ClientDataSet1observaciones_cs: TStringField
      FieldName = 'observaciones_cs'
      FixedChar = True
      Size = 30
    end
    object ClientDataSet1retira_cs: TStringField
      FieldName = 'retira_cs'
      FixedChar = True
      Size = 40
    end
    object ClientDataSet1nif_retira_cs: TStringField
      FieldName = 'nif_retira_cs'
      FixedChar = True
      Size = 15
    end
    object ClientDataSet1hora_cs: TStringField
      FieldName = 'hora_cs'
      FixedChar = True
      Size = 8
    end
    object ClientDataSet1FechaAlbaran: TStringField
      Alignment = taRightJustify
      FieldKind = fkCalculated
      FieldName = 'FechaAlbaran'
      Size = 10
      Calculated = True
    end
    object ClientDataSet1FechaFactura: TStringField
      Alignment = taRightJustify
      FieldKind = fkCalculated
      FieldName = 'FechaFactura'
      Size = 10
      Calculated = True
    end
    object ClientDataSet1fecha_albaran_cs: TStringField
      FieldName = 'fecha_albaran_cs'
      FixedChar = True
      Size = 10
    end
    object ClientDataSet1fecha_factura_cs: TStringField
      FieldName = 'fecha_factura_cs'
      FixedChar = True
      Size = 10
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Query1
    Left = 303
    Top = 82
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
