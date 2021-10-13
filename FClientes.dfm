object Clientes: TClientes
  Left = 162
  Top = 140
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Mantenimiento de Clientes'
  ClientHeight = 690
  ClientWidth = 1018
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
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
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object BarraEstado: TStatusBar
    Left = 0
    Top = 667
    Width = 1018
    Height = 23
    Color = 15395562
    Panels = <
      item
        Width = 860
      end
      item
        Width = 50
      end>
    ParentFont = True
    UseSystemFont = False
  end
  object PanelDatos: TPanel
    Left = 0
    Top = 101
    Width = 1018
    Height = 566
    Align = alClient
    Color = 15128264
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    OnEnter = PanelDatosEnter
    object Paginas: TPageControl
      Left = 1
      Top = 1
      Width = 1016
      Height = 564
      ActivePage = TabSheet2
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Datos Personales'
        object GroupBox2: TGroupBox
          Left = 88
          Top = 247
          Width = 814
          Height = 110
          Caption = 'Direcci'#243'n Correo'
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          object StaticText7: TStaticText
            Left = 96
            Top = 22
            Width = 55
            Height = 20
            Caption = 'Domicilio'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object StaticText8: TStaticText
            Left = 96
            Top = 75
            Width = 58
            Height = 20
            Caption = 'Poblaci'#243'n'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object cPoblacionCorreo: TcxDBTextEdit
            Left = 240
            Top = 73
            AutoSize = False
            DataBinding.DataField = 'poblacion_correo_c'
            DataBinding.DataSource = DSMaestro
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 2
            Height = 24
            Width = 337
          end
          object cDomicilioCorreo: TcxDBTextEdit
            Left = 240
            Top = 19
            AutoSize = False
            DataBinding.DataField = 'domicilio_correo_c'
            DataBinding.DataSource = DSMaestro
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 0
            Height = 24
            Width = 403
          end
          object StaticText33: TStaticText
            Left = 96
            Top = 49
            Width = 81
            Height = 20
            Caption = 'C'#243'digo Postal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
          object cCpCorreo: TcxDBTextEdit
            Left = 240
            Top = 46
            DataBinding.DataField = 'cp_correo_c'
            DataBinding.DataSource = DSMaestro
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Properties.OnChange = cCpCorreoChange
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 1
            OnExit = cCpCorreoExit
            Width = 62
          end
          object tNomProvinciaCorreo: TPanel
            Left = 303
            Top = 45
            Width = 340
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = True
            ParentFont = False
            TabOrder = 6
            OnClick = tNomProvinciaCorreoClick
          end
        end
        object Panel1: TPanel
          Left = 88
          Top = 13
          Width = 814
          Height = 118
          Ctl3D = False
          ParentColor = True
          ParentCtl3D = False
          TabOrder = 0
          object StaticText2: TStaticText
            Left = 96
            Top = 9
            Width = 96
            Height = 20
            Caption = 'Nombre Jur'#237'dico'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object StaticText3: TStaticText
            Left = 96
            Top = 36
            Width = 110
            Height = 20
            Caption = 'Nombre Comercial'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
          object StaticText27: TStaticText
            Left = 96
            Top = 63
            Width = 71
            Height = 20
            Caption = 'C.I.F./N.I.F.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
          end
          object StaticText29: TStaticText
            Left = 96
            Top = 86
            Width = 70
            Height = 20
            Caption = 'Comentario'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
          end
          object cComentario: TcxDBTextEdit
            Left = 240
            Top = 85
            AutoSize = False
            DataBinding.DataField = 'comentario_c'
            DataBinding.DataSource = DSMaestro
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 3
            Height = 24
            Width = 527
          end
          object cNombreComercial: TcxDBTextEdit
            Left = 240
            Top = 33
            AutoSize = False
            DataBinding.DataField = 'nombre_comercial_c'
            DataBinding.DataSource = DSMaestro
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 1
            Height = 24
            Width = 398
          end
          object cNombreJuridico: TcxDBTextEdit
            Left = 240
            Top = 7
            AutoSize = False
            DataBinding.DataField = 'nombre_juridico_c'
            DataBinding.DataSource = DSMaestro
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 0
            Height = 24
            Width = 398
          end
          object StaticText30: TStaticText
            Left = 513
            Top = 62
            Width = 89
            Height = 20
            Caption = 'Origen (N/C/E)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
          end
          object cOrigen: TDBLookupComboBox
            Left = 624
            Top = 59
            Width = 145
            Height = 24
            Ctl3D = True
            DataField = 'origen_c'
            DataSource = DSMaestro
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            KeyField = 'codigo_o'
            ListField = 'des'
            ListSource = DSOrigenes
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 2
            OnKeyPress = cOrigenKeyPress
          end
          object dbcbActivo: TDBCheckBox
            Left = 643
            Top = 10
            Width = 97
            Height = 17
            TabStop = False
            Caption = 'Activo'
            DataField = 'activo_c'
            DataSource = DSMaestro
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object cNif: TcxDBTextEdit
            Left = 240
            Top = 59
            AutoSize = False
            DataBinding.DataField = 'cif_dni_c'
            DataBinding.DataSource = DSMaestro
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 10
            Height = 24
            Width = 121
          end
        end
        object Panel3: TPanel
          Left = 88
          Top = 371
          Width = 814
          Height = 113
          ParentColor = True
          TabOrder = 3
          object StaticText25: TStaticText
            Left = 96
            Top = 62
            Width = 39
            Height = 20
            Caption = 'E-Mail'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
          end
          object cEmail: TcxDBTextEdit
            Left = 240
            Top = 59
            AutoSize = False
            DataBinding.DataField = 'email_c'
            DataBinding.DataSource = DSMaestro
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 4
            Height = 21
            Width = 529
          end
          object cPaginaWeb: TcxDBTextEdit
            Left = 240
            Top = 83
            AutoSize = False
            DataBinding.DataField = 'web_c'
            DataBinding.DataSource = DSMaestro
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 5
            Height = 21
            Width = 529
          end
          object StaticText26: TStaticText
            Left = 96
            Top = 86
            Width = 72
            Height = 20
            Caption = 'P'#225'gina Web'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
          end
          object StaticText10: TStaticText
            Left = 96
            Top = 9
            Width = 65
            Height = 20
            Caption = 'Tel'#233'fono 1'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
          end
          object cTlf1: TcxDBTextEdit
            Left = 240
            Top = 6
            AutoSize = False
            DataBinding.DataField = 'telefono1_c'
            DataBinding.DataSource = DSMaestro
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 0
            Height = 24
            Width = 113
          end
          object cTlfMovil: TcxDBTextEdit
            Left = 240
            Top = 32
            DataBinding.DataField = 'tlfmovil_c'
            DataBinding.DataSource = DSMaestro
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 2
            Width = 113
          end
          object StaticText24: TStaticText
            Left = 96
            Top = 35
            Width = 56
            Height = 20
            Caption = 'Tlf. M'#243'vil'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
          end
          object StaticText23: TStaticText
            Left = 567
            Top = 35
            Width = 42
            Height = 20
            Caption = 'N'#186' Fax'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 10
          end
          object StaticText11: TStaticText
            Left = 566
            Top = 9
            Width = 65
            Height = 20
            Caption = 'Tel'#233'fono 2'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 11
          end
          object cTlf2: TcxDBTextEdit
            Left = 655
            Top = 32
            AutoSize = False
            DataBinding.DataField = 'telefono2_c'
            DataBinding.DataSource = DSMaestro
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 1
            Height = 24
            Width = 113
          end
          object cFax: TcxDBTextEdit
            Left = 655
            Top = 6
            DataBinding.DataField = 'fax_c'
            DataBinding.DataSource = DSMaestro
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 3
            Width = 113
          end
        end
        object GroupBox1: TGroupBox
          Left = 88
          Top = 137
          Width = 814
          Height = 105
          BiDiMode = bdLeftToRight
          Caption = 'Direcci'#243'n Cliente'
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          object StaticText4: TStaticText
            Left = 96
            Top = 21
            Width = 55
            Height = 20
            Caption = 'Domicilio'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object cDomicilio: TcxDBTextEdit
            Left = 240
            Top = 19
            AutoSize = False
            DataBinding.DataField = 'domicilio_c'
            DataBinding.DataSource = DSMaestro
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 0
            Height = 24
            Width = 403
          end
          object StaticText32: TStaticText
            Left = 96
            Top = 50
            Width = 81
            Height = 20
            Caption = 'C'#243'digo Postal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object cPoblacion: TcxDBTextEdit
            Left = 240
            Top = 73
            AutoSize = False
            DataBinding.DataField = 'poblacion_c'
            DataBinding.DataSource = DSMaestro
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 2
            Height = 24
            Width = 337
          end
          object StaticText5: TStaticText
            Left = 96
            Top = 77
            Width = 58
            Height = 20
            Caption = 'Poblaci'#243'n'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
          object cCpCliente: TcxDBTextEdit
            Left = 240
            Top = 46
            DataBinding.DataField = 'cp_c'
            DataBinding.DataSource = DSMaestro
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Properties.OnChange = cCpClienteChange
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 1
            OnExit = cCpClienteExit
            Width = 62
          end
          object tNomProvinciaCli: TPanel
            Left = 303
            Top = 46
            Width = 340
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
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Datos de Facturaci'#243'n'
        ImageIndex = 1
        object GroupBox8: TGroupBox
          Left = 41
          Top = 268
          Width = 575
          Height = 152
          Caption = 'Domiciliaci'#243'n Bancaria'
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
          object StaticText20: TStaticText
            Left = 15
            Top = 127
            Width = 87
            Height = 20
            Caption = 'Cuenta Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
          object StaticText21: TStaticText
            Left = 15
            Top = 20
            Width = 87
            Height = 20
            Caption = 'Nombre Banco'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
          end
          object StaticText22: TStaticText
            Left = 15
            Top = 46
            Width = 93
            Height = 20
            Caption = 'Domicilio Banco'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
          end
          object StaticText48: TStaticText
            Left = 15
            Top = 73
            Width = 65
            Height = 20
            Caption = 'C.P. Banco'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
          end
          object StaticText31: TStaticText
            Left = 15
            Top = 99
            Width = 96
            Height = 20
            Caption = 'Poblaci'#243'n Banco'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
          end
          object cNomBanco: TcxDBTextEdit
            Left = 141
            Top = 18
            DataBinding.DataField = 'nombre_banco_c'
            DataBinding.DataSource = DSMaestro
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 0
            Width = 412
          end
          object cDomicilioBanco: TcxDBTextEdit
            Left = 141
            Top = 44
            DataBinding.DataField = 'domicilio_banco_c'
            DataBinding.DataSource = DSMaestro
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 1
            Width = 412
          end
          object cPoblacionBanco: TcxDBTextEdit
            Left = 141
            Top = 97
            DataBinding.DataField = 'poblacion_banco_c'
            DataBinding.DataSource = DSMaestro
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 3
            Width = 336
          end
          object cCPBanco: TcxDBTextEdit
            Left = 141
            Top = 70
            DataBinding.DataField = 'cp_banco_c'
            DataBinding.DataSource = DSMaestro
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 2
            OnExit = cCPBancoExit
            Width = 62
          end
          object cCtaBanco: TcxDBTextEdit
            Left = 141
            Top = 124
            DataBinding.DataField = 'cuenta_cliente_c'
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
            Width = 146
          end
          object tNomProvinciaBanco: TPanel
            Left = 204
            Top = 70
            Width = 349
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = True
            ParentFont = False
            TabOrder = 10
          end
        end
        object GroupBox9: TGroupBox
          Left = 635
          Top = 268
          Width = 323
          Height = 101
          Caption = 'Forma de Pago'
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 4
          object StaticText45: TStaticText
            Left = 17
            Top = 71
            Width = 78
            Height = 20
            Caption = 'D'#237'as de Pago'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object StaticText46: TStaticText
            Left = 17
            Top = 18
            Width = 43
            Height = 20
            Caption = 'C'#243'digo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object StaticText47: TStaticText
            Left = 17
            Top = 44
            Width = 69
            Height = 20
            Caption = 'Descripci'#243'n'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
          object cCodigoPago: TcxDBTextEdit
            Left = 120
            Top = 16
            DataBinding.DataField = 'codigo_pago_c'
            DataBinding.DataSource = DSMaestro
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 0
            Width = 25
          end
          object cFormaPago: TcxDBTextEdit
            Left = 120
            Top = 42
            DataBinding.DataField = 'forma_pago_c'
            DataBinding.DataSource = DSMaestro
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 1
            Width = 184
          end
          object cDiasPago: TcxDBTextEdit
            Left = 120
            Top = 69
            DataBinding.DataField = 'dias_pago_c'
            DataBinding.DataSource = DSMaestro
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 2
            Width = 35
          end
        end
        object GroupBox10: TGroupBox
          Left = 41
          Top = 49
          Width = 917
          Height = 125
          Caption = 'Precios e Importes'
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 1
          object StaticText17: TStaticText
            Left = 18
            Top = 19
            Width = 117
            Height = 20
            Caption = 'Periodo Facturaci'#243'n'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object StaticText18: TStaticText
            Left = 18
            Top = 45
            Width = 91
            Height = 20
            Caption = 'Clave de Tarifa'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object StaticText13: TStaticText
            Left = 18
            Top = 71
            Width = 92
            Height = 20
            Caption = 'Servicio Oficina'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
          object StaticText14: TStaticText
            Left = 18
            Top = 97
            Width = 101
            Height = 20
            Caption = 'Imp. Thermokink'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
          end
          object StaticText15: TStaticText
            Left = 322
            Top = 19
            Width = 132
            Height = 20
            Caption = 'Precio Kw Thermoking'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
          end
          object StaticText16: TStaticText
            Left = 322
            Top = 45
            Width = 168
            Height = 20
            Caption = 'Precio Mvto. Lote Terminado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
          end
          object StaticText42: TStaticText
            Left = 324
            Top = 71
            Width = 115
            Height = 20
            Caption = 'Precio Hora Ent/Sal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
          end
          object StaticText19: TStaticText
            Left = 324
            Top = 97
            Width = 94
            Height = 20
            Caption = 'M3 Congelaci'#243'n'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 10
          end
          object StaticText44: TStaticText
            Left = 649
            Top = 19
            Width = 101
            Height = 20
            Caption = 'M3 Refrigeraci'#243'n'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 11
          end
          object StaticText41: TStaticText
            Left = 649
            Top = 45
            Width = 63
            Height = 20
            Caption = 'Cargo Fijo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 12
          end
          object StaticText43: TStaticText
            Left = 649
            Top = 71
            Width = 97
            Height = 20
            Caption = 'M'#237'nimo Facturar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 13
          end
          object cM3Congelacion: TcxDBTextEdit
            Left = 508
            Top = 93
            DataBinding.DataField = 'm3_facturacion_c'
            DataBinding.DataSource = DSMaestro
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 1
            Width = 75
          end
          object cM3Refrigeracion: TcxDBTextEdit
            Left = 776
            Top = 15
            DataBinding.DataField = 'm3_refrigeracion_c'
            DataBinding.DataSource = DSMaestro
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 2
            Width = 75
          end
          object cPeriodoFact: TDBLookupComboBox
            Left = 164
            Top = 15
            Width = 145
            Height = 24
            DataField = 'periodo_factura_c'
            DataSource = DSMaestro
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            KeyField = 'codigo_pf'
            ListField = 'des'
            ListSource = DSTiposPeriodoFact
            ParentFont = False
            TabOrder = 0
            OnKeyPress = cPeriodoFactKeyPress
          end
          object cTarifa: TDBLookupComboBox
            Left = 164
            Top = 41
            Width = 63
            Height = 24
            DataField = 'tarifa_c'
            DataSource = DSMaestro
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            KeyField = 'codigo_t'
            ListField = 'codigo_t'
            ListFieldIndex = 1
            ListSource = DSTarifas
            ParentFont = False
            TabOrder = 14
          end
          object StaticText9: TStaticText
            Left = 649
            Top = 97
            Width = 60
            Height = 20
            Caption = 'Retencion'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 15
          end
          object cServicioOficina: TcxDBCurrencyEdit
            Left = 164
            Top = 67
            DataBinding.DataField = 'imp_alquiler_oficina_c'
            DataBinding.DataSource = DSMaestro
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.TextStyle = []
            Style.IsFontAssigned = True
            TabOrder = 16
            Width = 121
          end
          object cImporteTermoking: TcxDBCurrencyEdit
            Left = 164
            Top = 93
            DataBinding.DataField = 'imp_thermoking_c'
            DataBinding.DataSource = DSMaestro
            Style.TextStyle = []
            TabOrder = 17
            Width = 121
          end
          object cPrecioKwTermoking: TcxDBCurrencyEdit
            Left = 508
            Top = 15
            DataBinding.DataField = 'precio_kw_thermo_c'
            DataBinding.DataSource = DSMaestro
            Style.TextStyle = []
            TabOrder = 18
            Width = 121
          end
          object cPrecioMvtoLoteTerminado: TcxDBCurrencyEdit
            Left = 508
            Top = 41
            DataBinding.DataField = 'precio_mvto_lote_c'
            DataBinding.DataSource = DSMaestro
            Style.TextStyle = []
            TabOrder = 19
            Width = 121
          end
          object cPrecioHoraEntSal: TcxDBCurrencyEdit
            Left = 508
            Top = 67
            DataBinding.DataField = 'precio_horas_ent_sal_c'
            DataBinding.DataSource = DSMaestro
            Style.TextStyle = []
            TabOrder = 20
            Width = 121
          end
          object cCargoFijo: TcxDBCurrencyEdit
            Left = 776
            Top = 41
            DataBinding.DataField = 'imp_cargo_fijo_c'
            DataBinding.DataSource = DSMaestro
            Style.TextStyle = []
            TabOrder = 21
            Width = 121
          end
          object cMinFacturar: TcxDBCurrencyEdit
            Left = 776
            Top = 67
            DataBinding.DataField = 'imp_minimo_facturacion_c'
            DataBinding.DataSource = DSMaestro
            Style.TextStyle = []
            TabOrder = 22
            Width = 121
          end
          object cRetencion: TcxDBCurrencyEdit
            Left = 776
            Top = 93
            DataBinding.DataField = 'retencion_c'
            DataBinding.DataSource = DSMaestro
            Style.TextStyle = []
            TabOrder = 23
            Width = 121
          end
        end
        object GroupBox11: TGroupBox
          Left = 41
          Top = 426
          Width = 918
          Height = 92
          Caption = 'Estado'
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 5
          object StaticText34: TStaticText
            Left = 15
            Top = 27
            Width = 87
            Height = 20
            Caption = #218'lt.Stock Unid.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object StaticText51: TStaticText
            Left = 473
            Top = 27
            Width = 92
            Height = 20
            Caption = 'Pendiente Pago'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object StaticText40: TStaticText
            Left = 715
            Top = 27
            Width = 116
            Height = 20
            Caption = 'Mercanc'#237'a Retenida'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object StaticText39: TStaticText
            Left = 237
            Top = 27
            Width = 90
            Height = 20
            Caption = 'Valor del Stock'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object cMercanciaRetenida: TDBComboBox
            Left = 859
            Top = 24
            Width = 40
            Height = 24
            CharCase = ecUpperCase
            DataField = 'mercancia_retenida_c'
            DataSource = DSMaestro
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemHeight = 16
            Items.Strings = (
              'S'
              'N')
            ParentFont = False
            TabOrder = 4
            OnEnter = NoModificar
          end
          object StaticText6: TStaticText
            Left = 15
            Top = 54
            Width = 79
            Height = 20
            Caption = #218'lt.Stock Pal.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
          object cUltimoStock: TcxDBCurrencyEdit
            Left = 122
            Top = 23
            DataBinding.DataField = 'ultimo_stock_c'
            DataBinding.DataSource = DSMaestro
            Style.TextStyle = []
            TabOrder = 6
            OnEnter = NoModificar
            Width = 100
          end
          object cUltimoStockPal: TcxDBCurrencyEdit
            Left = 122
            Top = 50
            DataBinding.DataField = 'ultimo_stock_pal_c'
            DataBinding.DataSource = DSMaestro
            Style.TextStyle = []
            TabOrder = 7
            OnEnter = NoModificar
            Width = 100
          end
          object cValorStock: TcxDBCurrencyEdit
            Left = 347
            Top = 23
            DataBinding.DataField = 'valor_stock_c'
            DataBinding.DataSource = DSMaestro
            Style.TextStyle = []
            TabOrder = 8
            OnEnter = NoModificar
            OnExit = VerMercaciaRetenida
            Width = 110
          end
          object cPendientePago: TcxDBCurrencyEdit
            Left = 588
            Top = 23
            DataBinding.DataField = 'imp_pendiente_pago_c'
            DataBinding.DataSource = DSMaestro
            Style.TextStyle = []
            TabOrder = 9
            OnEnter = NoModificar
            OnExit = VerMercaciaRetenida
            Width = 110
          end
        end
        object GroupBox12: TGroupBox
          Left = 40
          Top = 0
          Width = 493
          Height = 43
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 0
          object StaticText49: TStaticText
            Left = 18
            Top = 16
            Width = 98
            Height = 20
            Caption = 'Cuenta Contable'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object StaticText35: TStaticText
            Left = 264
            Top = 16
            Width = 102
            Height = 20
            Caption = 'Numerador Lotes'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object cCtaContable: TcxDBTextEdit
            Left = 138
            Top = 12
            DataBinding.DataField = 'cuenta_contable_c'
            DataBinding.DataSource = DSMaestro
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 0
            Width = 119
          end
          object cNumLotes: TcxDBTextEdit
            Left = 391
            Top = 12
            DataBinding.DataField = 'numerador_lotes_c'
            DataBinding.DataSource = DSMaestro
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 1
            Width = 75
          end
        end
        object GroupBox4: TGroupBox
          Left = 41
          Top = 186
          Width = 916
          Height = 72
          Caption = 'Autorizados'
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          object StaticText36: TStaticText
            Left = 15
            Top = 19
            Width = 76
            Height = 20
            Caption = 'Autorizado 1'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object StaticText37: TStaticText
            Left = 525
            Top = 19
            Width = 72
            Height = 20
            Caption = 'C.I.F./D.N.I.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object StaticText38: TStaticText
            Left = 747
            Top = 19
            Width = 38
            Height = 20
            Caption = 'Fecha'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object cNomAutorizado1: TcxDBTextEdit
            Left = 108
            Top = 15
            DataBinding.DataField = 'nom_autorizado1_c'
            DataBinding.DataSource = DSMaestro
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 0
            Width = 403
          end
          object StaticText50: TStaticText
            Left = 15
            Top = 45
            Width = 76
            Height = 20
            Caption = 'Autorizado 2'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
          object cNomAutorizado2: TcxDBTextEdit
            Left = 108
            Top = 41
            DataBinding.DataField = 'nom_autorizado2_c'
            DataBinding.DataSource = DSMaestro
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 6
            Width = 403
          end
          object StaticText52: TStaticText
            Left = 525
            Top = 46
            Width = 72
            Height = 20
            Caption = 'C.I.F./D.N.I.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
          end
          object StaticText53: TStaticText
            Left = 747
            Top = 45
            Width = 38
            Height = 20
            Caption = 'Fecha'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
          end
          object cFechaAutoriz1: TcxDateEdit
            Left = 799
            Top = 15
            ParentFont = False
            Properties.OnChange = cFechaAutorizChange
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 1
            OnExit = ComprobarFechaExit
            Width = 100
          end
          object cFechaAutoriz2: TcxDateEdit
            Left = 799
            Top = 42
            ParentFont = False
            Properties.OnChange = cFechaAutorizChange
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 9
            OnExit = ComprobarFechaExit
            Width = 100
          end
          object cNifAutorizado1: TcxDBTextEdit
            Left = 613
            Top = 15
            AutoSize = False
            DataBinding.DataField = 'cif_autorizado1_c'
            DataBinding.DataSource = DSMaestro
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 10
            Height = 24
            Width = 121
          end
          object cNifAutorizado2: TcxDBTextEdit
            Left = 613
            Top = 45
            AutoSize = False
            DataBinding.DataField = 'cif_autorizado2_c'
            DataBinding.DataSource = DSMaestro
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 11
            Height = 24
            Width = 121
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Notas'
        ImageIndex = 2
        object GroupBox3: TGroupBox
          Left = 40
          Top = 48
          Width = 905
          Height = 425
          TabOrder = 0
          object DBMemo1: TDBMemo
            Left = 38
            Top = 40
            Width = 833
            Height = 362
            DataField = 'notas_c'
            DataSource = DSMaestro
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
      end
    end
  end
  object PanelClaves: TPanel
    Left = 0
    Top = 38
    Width = 1018
    Height = 63
    Align = alTop
    Color = 15395562
    ParentBackground = False
    TabOrder = 6
    object StaticText1: TStaticText
      Left = 260
      Top = 35
      Width = 47
      Height = 20
      Caption = 'C'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object cCodigo: TEdit
      Left = 335
      Top = 32
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
      OnEnter = ColorEnter
      OnExit = ColorExit
      OnKeyDown = cCodigoKeyDown
    end
    object StaticText12: TStaticText
      Left = 261
      Top = 8
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
      Left = 335
      Top = 5
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
      Left = 391
      Top = 5
      Width = 408
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
    object cLupaEmpresas: TSimpleSearch
      Left = 365
      Top = 5
      Width = 24
      Height = 24
      TabOrder = 5
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
      Left = 371
      Top = 32
      Width = 24
      Height = 24
      TabOrder = 6
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
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 712
    Top = 98
  end
  object QMaestro: TQuery
    AfterInsert = QMaestroAfterInsert
    BeforeEdit = QMaestroBeforeEdit
    BeforePost = QMaestroBeforePost
    AfterPost = QMaestroAfterPost
    DatabaseName = 'BDFrigo'
    RequestLive = True
    SQL.Strings = (
      'select * from clientes')
    Left = 680
    Top = 65
    object QMaestroempresa_c: TStringField
      FieldName = 'empresa_c'
      Origin = 'BDFRIGO.clientes.empresa_c'
      FixedChar = True
      Size = 3
    end
    object QMaestrocodigo_c: TStringField
      FieldName = 'codigo_c'
      Origin = 'BDFRIGO.clientes.codigo_c'
      FixedChar = True
      Size = 4
    end
    object QMaestronombre_juridico_c: TStringField
      FieldName = 'nombre_juridico_c'
      Origin = 'BDFRIGO.clientes.nombre_juridico_c'
      FixedChar = True
      Size = 30
    end
    object QMaestronombre_comercial_c: TStringField
      FieldName = 'nombre_comercial_c'
      Origin = 'BDFRIGO.clientes.nombre_comercial_c'
      FixedChar = True
      Size = 30
    end
    object QMaestrodomicilio_c: TStringField
      FieldName = 'domicilio_c'
      Origin = 'BDFRIGO.clientes.domicilio_c'
      FixedChar = True
      Size = 30
    end
    object QMaestrocp_c: TStringField
      DisplayWidth = 10
      FieldName = 'cp_c'
      Origin = 'BDFRIGO.clientes.cp_c'
      FixedChar = True
      Size = 10
    end
    object QMaestropoblacion_c: TStringField
      FieldName = 'poblacion_c'
      Origin = 'BDFRIGO.clientes.poblacion_c'
      FixedChar = True
      Size = 25
    end
    object nota: TStringField
      FieldName = 'domicilio_correo_c'
      Origin = 'BDFRIGO.clientes.domicilio_correo_c'
      FixedChar = True
      Size = 30
    end
    object QMaestrocp_correo_c: TStringField
      DisplayWidth = 10
      FieldName = 'cp_correo_c'
      Origin = 'BDFRIGO.clientes.cp_correo_c'
      FixedChar = True
      Size = 10
    end
    object QMaestropoblacion_correo_c: TStringField
      FieldName = 'poblacion_correo_c'
      Origin = 'BDFRIGO.clientes.poblacion_correo_c'
      FixedChar = True
      Size = 25
    end
    object QMaestrotelefono1_c: TStringField
      FieldName = 'telefono1_c'
      Origin = 'BDFRIGO.clientes.telefono1_c'
      FixedChar = True
      Size = 15
    end
    object QMaestrotelefono2_c: TStringField
      FieldName = 'telefono2_c'
      Origin = 'BDFRIGO.clientes.telefono2_c'
      FixedChar = True
      Size = 15
    end
    object QMaestrofax_c: TStringField
      FieldName = 'fax_c'
      Origin = 'BDFRIGO.clientes.fax_c'
      FixedChar = True
      Size = 15
    end
    object QMaestrocif_dni_c: TStringField
      FieldName = 'cif_dni_c'
      Origin = 'BDFRIGO.clientes.cif_dni_c'
      FixedChar = True
      Size = 15
    end
    object QMaestroorigen_c: TStringField
      FieldName = 'origen_c'
      Origin = 'BDFRIGO.clientes.origen_c'
      FixedChar = True
      Size = 1
    end
    object QMaestroimp_alquiler_oficina_c: TFloatField
      FieldName = 'imp_alquiler_oficina_c'
      Origin = 'BDFRIGO.clientes.imp_alquiler_oficina_c'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object QMaestroimp_thermoking_c: TFloatField
      FieldName = 'imp_thermoking_c'
      Origin = 'BDFRIGO.clientes.imp_thermoking_c'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object QMaestroprecio_kw_thermo_c: TFloatField
      FieldName = 'precio_kw_thermo_c'
      Origin = 'BDFRIGO.clientes.precio_kw_thermo_c'
      DisplayFormat = ',0.0000'
      EditFormat = '#.####'
    end
    object QMaestroimp_cargo_fijo_c: TFloatField
      FieldName = 'imp_cargo_fijo_c'
      Origin = 'BDFRIGO.clientes.imp_cargo_fijo_c'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object QMaestroprecio_horas_ent_sal_c: TFloatField
      FieldName = 'precio_horas_ent_sal_c'
      Origin = 'BDFRIGO.clientes.precio_horas_ent_sal_c'
      DisplayFormat = ',0.0000'
      EditFormat = '#.####'
    end
    object QMaestroimp_minimo_facturacion_c: TFloatField
      FieldName = 'imp_minimo_facturacion_c'
      Origin = 'BDFRIGO.clientes.imp_minimo_facturacion_c'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object QMaestroperiodo_factura_c: TStringField
      FieldName = 'periodo_factura_c'
      Origin = 'BDFRIGO.clientes.periodo_factura_c'
      FixedChar = True
      Size = 1
    end
    object QMaestrotarifa_c: TStringField
      FieldName = 'tarifa_c'
      Origin = 'BDFRIGO.clientes.tarifa_c'
      FixedChar = True
      Size = 2
    end
    object QMaestrodias_pago_c: TSmallintField
      FieldName = 'dias_pago_c'
      Origin = 'BDFRIGO.clientes.dias_pago_c'
    end
    object QMaestroforma_pago_c: TStringField
      FieldName = 'forma_pago_c'
      Origin = 'BDFRIGO.clientes.forma_pago_c'
      FixedChar = True
      Size = 25
    end
    object QMaestrocuenta_cliente_c: TStringField
      FieldName = 'cuenta_cliente_c'
      Origin = 'BDFRIGO.clientes.cuenta_cliente_c'
      FixedChar = True
    end
    object QMaestronombre_banco_c: TStringField
      FieldName = 'nombre_banco_c'
      Origin = 'BDFRIGO.clientes.nombre_banco_c'
      FixedChar = True
      Size = 30
    end
    object QMaestrodomicilio_banco_c: TStringField
      FieldName = 'domicilio_banco_c'
      Origin = 'BDFRIGO.clientes.domicilio_banco_c'
      FixedChar = True
      Size = 30
    end
    object QMaestrocp_banco_c: TStringField
      DisplayWidth = 10
      FieldName = 'cp_banco_c'
      Origin = 'BDFRIGO.clientes.cp_banco_c'
      FixedChar = True
      Size = 10
    end
    object QMaestropoblacion_banco_c: TStringField
      FieldName = 'poblacion_banco_c'
      Origin = 'BDFRIGO.clientes.poblacion_banco_c'
      FixedChar = True
      Size = 25
    end
    object QMaestroultimo_stock_c: TFloatField
      FieldName = 'ultimo_stock_c'
      Origin = 'BDFRIGO.clientes.ultimo_stock_c'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object QMaestroultimo_stock_pal_c: TCurrencyField
      FieldName = 'ultimo_stock_pal_c'
      Origin = 'BDFRIGO.clientes.ultimo_stock_pal_c'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
      currency = False
    end
    object QMaestronumerador_lotes_c: TIntegerField
      FieldName = 'numerador_lotes_c'
      Origin = 'BDFRIGO.clientes.numerador_lotes_c'
    end
    object QMaestronom_autorizado1_c: TStringField
      FieldName = 'nom_autorizado1_c'
      Origin = 'BDFRIGO.clientes.nom_autorizado1_c'
      FixedChar = True
      Size = 30
    end
    object QMaestrocif_autorizado1_c: TStringField
      FieldName = 'cif_autorizado1_c'
      Origin = 'BDFRIGO.clientes.cif_autorizado1_c'
      FixedChar = True
      Size = 15
    end
    object QMaestronom_autorizado2_c: TStringField
      FieldName = 'nom_autorizado2_c'
      Origin = 'BDFRIGO.clientes.nom_autorizado2_c'
      FixedChar = True
      Size = 30
    end
    object QMaestrocif_autorizado2_c: TStringField
      FieldName = 'cif_autorizado2_c'
      Origin = 'BDFRIGO.clientes.cif_autorizado2_c'
      FixedChar = True
      Size = 15
    end
    object QMaestrocomentario_c: TStringField
      FieldName = 'comentario_c'
      Origin = 'BDFRIGO.clientes.comentario_c'
      FixedChar = True
      Size = 40
    end
    object QMaestroimp_valor_stock_c: TFloatField
      FieldName = 'valor_stock_c'
      Origin = 'BDFRIGO.clientes.imp_valor_stock_c'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object QMaestroimp_pendiente_pago_c: TFloatField
      FieldName = 'imp_pendiente_pago_c'
      Origin = 'BDFRIGO.clientes.imp_pendiente_pago_c'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
    object QMaestromercancia_retenida_c: TStringField
      FieldName = 'mercancia_retenida_c'
      Origin = 'BDFRIGO.clientes.mercancia_retenida_c'
      FixedChar = True
      Size = 1
    end
    object QMaestrotlfmovil_c: TStringField
      FieldName = 'tlfmovil_c'
      Origin = 'BDFRIGO.clientes.tlfmovil_c'
      FixedChar = True
      Size = 15
    end
    object QMaestroemail_c: TStringField
      FieldName = 'email_c'
      Origin = 'BDFRIGO.clientes.email_c'
      FixedChar = True
      Size = 40
    end
    object QMaestroweb_c: TStringField
      FieldName = 'web_c'
      Origin = 'BDFRIGO.clientes.web_c'
      FixedChar = True
      Size = 40
    end
    object QMaestroprecio_hor_clima_c: TFloatField
      FieldName = 'precio_hor_clima_c'
      Origin = 'BDFRIGO.clientes.precio_hor_clima_c'
      DisplayFormat = ',0.0000'
      EditFormat = '#.####'
    end
    object QMaestrocuenta_contable_c: TStringField
      FieldName = 'cuenta_contable_c'
      Origin = 'BDFRIGO.clientes.cuenta_contable_c'
      FixedChar = True
      Size = 10
    end
    object QMaestrocodigo_pago_c: TStringField
      FieldName = 'codigo_pago_c'
      Origin = 'BDFRIGO.clientes.codigo_pago_c'
      FixedChar = True
      Size = 2
    end
    object QMaestrom3_facturacion_c: TIntegerField
      FieldName = 'm3_facturacion_c'
      Origin = 'BDFRIGO.clientes.m3_facturacion_c'
    end
    object QMaestrom3_refrigeracion_c: TIntegerField
      FieldName = 'm3_refrigeracion_c'
      Origin = 'BDFRIGO.clientes.m3_refrigeracion_c'
    end
    object QMaestrofecha_autorizado1_c: TStringField
      FieldName = 'fecha_autorizado1_c'
      Origin = 'BDFRIGO.clientes.fecha_autorizado1_c'
      FixedChar = True
      Size = 10
    end
    object QMaestrofecha_autorizado2_c: TStringField
      FieldName = 'fecha_autorizado2_c'
      Origin = 'BDFRIGO.clientes.fecha_autorizado2_c'
      FixedChar = True
      Size = 10
    end
    object QMaestronotas_c: TMemoField
      FieldName = 'notas_c'
      Origin = 'BDFRIGO.clientes.notas_c'
      BlobType = ftMemo
      Size = 1
    end
    object QMaestroretencion_c: TFloatField
      FieldName = 'retencion_c'
      Origin = 'BDFRIGO.clientes.retencion_c'
    end
    object QMaestroactivo_c: TIntegerField
      FieldName = 'activo_c'
      Origin = 'BDFRIGO.clientes.activo_c'
    end
    object QMaestroprecio_mvto_lote_c: TCurrencyField
      FieldName = 'precio_mvto_lote_c'
      Origin = 'BDFRIGO.clientes.precio_mvto_lote_c'
      DisplayFormat = ',0.00'
      EditFormat = '#.##'
    end
  end
  object DSMaestro: TDataSource
    DataSet = QMaestro
    OnStateChange = DSMaestroStateChange
    Left = 680
    Top = 97
  end
  object QContar: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select count(*) from fichero_tarifa')
    Left = 712
    Top = 65
  end
  object QTiposPeriodoFact: TQuery
    OnCalcFields = QTiposPeriodoFactCalcFields
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select *'
      'from tipos_periodo_fact')
    Left = 744
    Top = 64
    object QTiposPeriodoFactcodigo_pf: TStringField
      FieldName = 'codigo_pf'
      Origin = 'BDFRIGO."dbo.tipos_periodo_fact".codigo_pf'
      FixedChar = True
      Size = 1
    end
    object QTiposPeriodoFactdescripcion_pf: TStringField
      FieldName = 'descripcion_pf'
      Origin = 'BDFRIGO."dbo.tipos_periodo_fact".descripcion_pf'
      FixedChar = True
      Size = 40
    end
    object QTiposPeriodoFactdes: TStringField
      DisplayWidth = 50
      FieldKind = fkCalculated
      FieldName = 'des'
      Calculated = True
    end
  end
  object DSTiposPeriodoFact: TDataSource
    DataSet = QTiposPeriodoFact
    Left = 744
    Top = 96
  end
  object QOrigenes: TQuery
    OnCalcFields = QOrigenesCalcFields
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select *'
      'from origenes')
    Left = 774
    Top = 64
    object QOrigenescodigo_o: TStringField
      FieldName = 'codigo_o'
      Origin = 'BDFRIGO.origenes.codigo_o'
      FixedChar = True
      Size = 1
    end
    object QOrigenesdescripcion_o: TStringField
      FieldName = 'descripcion_o'
      Origin = 'BDFRIGO."dbo.origenes".descripcion_o'
      FixedChar = True
      Size = 15
    end
    object QOrigenesdes: TStringField
      FieldKind = fkCalculated
      FieldName = 'des'
      Size = 50
      Calculated = True
    end
  end
  object DSOrigenes: TDataSource
    DataSet = QOrigenes
    Left = 776
    Top = 96
  end
  object QTarifas: TQuery
    DatabaseName = 'BDFrigo'
    SQL.Strings = (
      'select codigo_t'
      'from tarifas'
      'where empresa_t=:empresa'
      'order by codigo_t')
    Left = 808
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'empresa'
        ParamType = ptUnknown
      end>
  end
  object DSTarifas: TDataSource
    DataSet = QTarifas
    Left = 808
    Top = 96
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
