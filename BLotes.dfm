object BusquedaLotes: TBusquedaLotes
  Left = 81
  Top = 276
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Busqueda de Lotes'
  ClientHeight = 454
  ClientWidth = 977
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PanelDatos: TPanel
    Left = 0
    Top = 22
    Width = 977
    Height = 409
    Align = alClient
    TabOrder = 2
    object GridLineas: TDBGrid
      Left = 1
      Top = 1
      Width = 975
      Height = 407
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
          FieldName = 'FAMILIA_AL'
          Title.Caption = 'Familia'
          Width = 37
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION_F'
          Title.Caption = 'Nombre Familia'
          Width = 128
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ARTICULO_AL'
          Title.Caption = 'Art'#237'culo'
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DENOMINACION_A'
          Title.Caption = 'Nombre Art'#237'culo'
          Width = 219
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BultosStock'
          Title.Caption = 'Stock Bultos'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTUCHES_SUELTOS_AL'
          Title.Caption = 'Estuches Sueltos'
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UnidadesStock'
          Title.Caption = 'Stock Unidades'
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'LOTE_AL'
          Title.Caption = 'Lote'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LOTE_ORIGEN_AL'
          Title.Caption = 'Lote Origen'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUMERO_CAMARA_AL'
          Title.Caption = 'Camara'
          Width = 47
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'ZONA_AL'
          Title.Caption = 'Zona'
          Width = 42
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'TIPO_LOTE_AL'
          Title.Caption = 'Tipo'
          Width = 27
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'STATUS_RETENIDO_AL'
          Title.Caption = 'Retenido'
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTUCHES_BULTO_AL'
          Title.Caption = 'Est. x Bulto'
          Width = 58
          Visible = True
        end>
    end
  end
  object BarraEstado: TStatusBar
    Left = 0
    Top = 431
    Width = 977
    Height = 23
    Color = 15395562
    Panels = <
      item
        Width = 1000
      end
      item
        Width = 50
      end>
  end
  object Query1: TQuery
    OnCalcFields = Query1CalcFields
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'SELECT LOTE_AL, '
      '              TIPO_LOTE_AL, '
      '              FAMILIA_AL,'
      '              DESCRIPCION_F,'
      '              ARTICULO_AL, '
      '              DENOMINACION_A, '
      '              STATUS_RETENIDO_AL, '
      '              NUMERO_CAMARA_AL, '
      '              ZONA_AL, '
      '              ESTUCHES_BULTO_AL, '
      '              BULTOS_ENTRADOS_AL,'
      '              BULTOS_SALIDOS_AL,'
      '              UNIDADES_ENTRADAS_AL,'
      '              UNIDADES_SALIDAS_AL, '
      '              UNIDADES_MERMAS_AL,'
      '              UNIDADES_DESTRUIDAS_AL,'
      '               ESTUCHES_SUELTOS_AL,'
      '              LOTE_ORIGEN_AL '
      'FROM ALMACENES, ARTICULOS, FAMILIAS'
      'WHERE EMPRESA_AL=EMPRESA_A '
      'AND FAMILIA_AL=FAMILIA_A '
      'AND ARTICULO_AL=CODIGO_A '
      'AND EMPRESA_A=EMPRESA_F'
      'AND FAMILIA_A=CODIGO_F ')
    Left = 752
    Top = 112
    object Query1UnidadesStock: TFloatField
      FieldKind = fkCalculated
      FieldName = 'UnidadesStock'
      DisplayFormat = ',0.00'
      Calculated = True
    end
    object Query1BultosStock: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'BultosStock'
      Calculated = True
    end
    object Query1LOTE_AL: TStringField
      DisplayWidth = 8
      FieldName = 'LOTE_AL'
      FixedChar = True
      Size = 7
    end
    object Query1TIPO_LOTE_AL: TStringField
      FieldName = 'TIPO_LOTE_AL'
      FixedChar = True
      Size = 1
    end
    object Query1FAMILIA_AL: TStringField
      FieldName = 'FAMILIA_AL'
      FixedChar = True
      Size = 3
    end
    object Query1DESCRIPCION_F: TStringField
      FieldName = 'DESCRIPCION_F'
      FixedChar = True
      Size = 30
    end
    object Query1ARTICULO_AL: TStringField
      FieldName = 'ARTICULO_AL'
      FixedChar = True
      Size = 5
    end
    object Query1DENOMINACION_A: TStringField
      FieldName = 'DENOMINACION_A'
      FixedChar = True
      Size = 30
    end
    object Query1STATUS_RETENIDO_AL: TStringField
      FieldName = 'STATUS_RETENIDO_AL'
      FixedChar = True
      Size = 1
    end
    object Query1NUMERO_CAMARA_AL: TSmallintField
      FieldName = 'NUMERO_CAMARA_AL'
    end
    object Query1ZONA_AL: TStringField
      FieldName = 'ZONA_AL'
      FixedChar = True
      Size = 6
    end
    object Query1ESTUCHES_BULTO_AL: TIntegerField
      FieldName = 'ESTUCHES_BULTO_AL'
    end
    object Query1BULTOS_ENTRADOS_AL: TIntegerField
      FieldName = 'BULTOS_ENTRADOS_AL'
    end
    object Query1BULTOS_SALIDOS_AL: TIntegerField
      FieldName = 'BULTOS_SALIDOS_AL'
    end
    object Query1UNIDADES_ENTRADAS_AL: TFloatField
      FieldName = 'UNIDADES_ENTRADAS_AL'
    end
    object Query1UNIDADES_SALIDAS_AL: TFloatField
      FieldName = 'UNIDADES_SALIDAS_AL'
    end
    object Query1UNIDADES_MERMAS_AL: TFloatField
      FieldName = 'UNIDADES_MERMAS_AL'
    end
    object Query1UNIDADES_DESTRUIDAS_AL: TFloatField
      FieldName = 'UNIDADES_DESTRUIDAS_AL'
    end
    object Query1ESTUCHES_SUELTOS_AL: TIntegerField
      FieldName = 'ESTUCHES_SUELTOS_AL'
    end
    object strngfldQuery1LOTE_ORIGEN_AL: TStringField
      FieldName = 'LOTE_ORIGEN_AL'
      Size = 10
    end
  end
  object DS: TDataSource
    DataSet = Query1
    Left = 752
    Top = 144
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
