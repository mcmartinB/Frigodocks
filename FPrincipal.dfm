object Principal: TPrincipal
  Left = 107
  Top = 127
  Caption = 'FRIGODOCKS, S.A.'
  ClientHeight = 671
  ClientWidth = 1008
  Color = 12028275
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDefault
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    Left = 12
    Top = 16
    object M_MANTENIMIENTOS: TMenuItem
      Caption = '&Mantenimientos'
      object M_EMPRESAS: TMenuItem
        Caption = 'Empresas'
        OnClick = M_EMPRESASClick
      end
      object M_CLIENTES: TMenuItem
        Caption = 'Clientes'
        OnClick = MenuClientes
      end
      object M_TARIFAS: TMenuItem
        Caption = 'Tarifas'
        OnClick = MenuTarifas
      end
      object M_PERIODICOS_FACT: TMenuItem
        Caption = 'Peri'#243'dicos de Facturaci'#243'n'
        OnClick = MenuPeridicosdeFacturacion
      end
      object M_FACTURAS: TMenuItem
        Caption = 'Facturas'
        OnClick = M_FACTURASClick
      end
      object M_COBROS: TMenuItem
        Caption = 'Cobros'
        OnClick = MenuCobros
      end
      object M_ALMACENES: TMenuItem
        Caption = 'Almacenes'
        OnClick = MenuAlmacen
      end
      object M_ARTICULOS: TMenuItem
        Caption = 'Art'#237'culos'
        OnClick = MenuArticulos
      end
      object M_ARTICULOS_CLIENTE: TMenuItem
        Caption = 'Ar'#237'culos de Clientes'
        OnClick = M_ARTICULOS_CLIENTEClick
      end
      object M_FAMILIAS: TMenuItem
        Caption = 'Familias'
        OnClick = MenuFamilias
      end
      object M_UNIDADES_MEDIDA: TMenuItem
        Caption = 'Unidades de Medida'
        OnClick = MenuUnidadesdeMedida
      end
      object M_CONCEPTOS: TMenuItem
        Caption = 'Conceptos'
        OnClick = M_CONCEPTOSClick
      end
    end
    object M_LISTADOS: TMenuItem
      Caption = '&Listados'
      object ML_EMPRESAS: TMenuItem
        Caption = 'Empresas'
        OnClick = MenuListadoEmpresas
      end
      object ML_CLIENTES: TMenuItem
        Caption = 'Clientes'
        OnClick = MenuListadoClientes
      end
      object ML_TARIFAS: TMenuItem
        Caption = 'Tarifas'
        OnClick = MenuListadoFicheroTarifas
      end
      object ML_PERIODICOS_FACT: TMenuItem
        Caption = 'Peri'#243'dicos de Facturaci'#243'n'
        OnClick = ML_PERIODICOS_FACTClick
      end
      object ML_ALMACENES: TMenuItem
        Caption = 'Almacenes'
        OnClick = ML_ALMACENESClick
      end
      object ML_FACTURAS: TMenuItem
        Caption = 'Facturas'
        OnClick = ML_FACTURASClick
      end
      object ML_COBROS: TMenuItem
        Caption = 'Cobros'
        OnClick = ML_COBROSClick
      end
      object ML_ENTRADAS: TMenuItem
        Caption = 'Entradas'
        OnClick = ML_ENTRADASClick
      end
      object ML_SALIDAS: TMenuItem
        Caption = 'Salidas'
        OnClick = ML_SALIDASClick
      end
      object ML_ARTICULOS: TMenuItem
        Caption = 'Art'#237'culos'
        OnClick = MenuListadoArticulos
      end
      object ML_ARTICULOS_CLIENTE: TMenuItem
        Caption = 'Art'#237'culos de Clientes'
        OnClick = MenuListadoArtculosdeClientes
      end
      object ML_UNIDADES_MEDIDA: TMenuItem
        Caption = 'Unidades de Medida'
        OnClick = MenuListadoUnidadesMedida
      end
      object ML_FAMILIAS: TMenuItem
        Caption = 'Familias'
        OnClick = MenuListadoFamilias
      end
      object ML_KILOS_CLIENTE: TMenuItem
        Caption = 'Kilos por Cliente'
        OnClick = ML_KILOS_CLIENTEClick
      end
      object ML_MOVIMIENTOS_LOTE: TMenuItem
        Caption = 'Movimientos del Lote'
        OnClick = ML_MOVIMIENTOS_LOTEClick
      end
      object ML_MOVIMIENTOS_LOTES: TMenuItem
        Caption = 'Movimientos de Lotes Terminados'
        OnClick = ML_MOVIMIENTOS_LOTESClick
      end
      object ML_MOVIMIENTOS_CLI: TMenuItem
        Caption = 'Movimiento de Clientes'
        OnClick = ML_MOVIMIENTOS_CLIClick
      end
    end
    object M_PROCESOS: TMenuItem
      Caption = '&Procesos'
      object M_ENTRADAS: TMenuItem
        Caption = 'Entradas'
        OnClick = MenuEntradas
      end
      object M_SALIDAS: TMenuItem
        Caption = 'Salidas'
        OnClick = MenuSalidas
      end
      object M_FACTURACION: TMenuItem
        Caption = 'Facturaci'#243'n'
        OnClick = MenuFacturacion
      end
      object M_REPETIR_FACTURA: TMenuItem
        Caption = 'Repetir Factura'
        OnClick = M_REPETIR_FACTURAClick
      end
      object M_CONTABILIZACION: TMenuItem
        Caption = 'Contabilizaci'#243'n'
        OnClick = M_CONTABILIZACIONClick
      end
    end
    object M_IMPORTACION: TMenuItem
      Caption = '&Importaci'#243'n'
      object M_PROCESO_AUTORIZ: TMenuItem
        Caption = 'Proceso de Autorizaci'#243'n'
        OnClick = M_PROCESO_AUTORIZClick
      end
      object M_PROCESO_CHEQUEO: TMenuItem
        Caption = 'Proceso de Chequeo'
        OnClick = M_PROCESO_CHEQUEOClick
      end
    end
    object M_ADMINISTRACION: TMenuItem
      Caption = '&Administraci'#243'n'
      object M_CAMBIO_ARTI_FAM: TMenuItem
        Caption = 'Cambio C'#243'digo Art'#237'culo / Familia'
        OnClick = M_CAMBIO_ARTI_FAMClick
      end
      object M_USUARIOS: TMenuItem
        Caption = 'Usuarios'
        OnClick = MenuUsuarios
      end
      object ML_USUARIOS: TMenuItem
        Caption = 'Listado de Usuarios'
        OnClick = ML_USUARIOSClick
      end
      object M_CONFIG_CORREO: TMenuItem
        Caption = 'Configuraci'#243'n Correo'
        OnClick = MenuConfiguracionCorrreo
      end
      object M_DESCARGA_DATOS: TMenuItem
        Caption = 'Descarga de Datos'
        Visible = False
        OnClick = M_DESCARGA_DATOSClick
      end
      object M_COPIA_SEGURIDAD: TMenuItem
        Caption = 'Copia de Seguridad'
        OnClick = M_COPIA_SEGURIDADClick
      end
    end
    object M_Salir: TMenuItem
      Caption = 'Salir'
      OnClick = M_SalirClick
    end
  end
end
