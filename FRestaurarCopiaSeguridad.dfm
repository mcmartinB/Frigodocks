object RestaurarCopiaSeguridad: TRestaurarCopiaSeguridad
  Left = 382
  Top = 244
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Restaurar Copia de Seguridad'
  ClientHeight = 194
  ClientWidth = 411
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
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 411
    Height = 29
    BorderWidth = 1
    ButtonHeight = 24
    ButtonWidth = 24
    Color = clBtnFace
    EdgeBorders = [ebTop, ebBottom]
    Flat = True
    Images = DMBaseDatos.Imagenes
    ParentColor = False
    TabOrder = 0
    object BAceptar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Aceptar (F5)'
      Caption = 'BAceptar'
      ImageIndex = 4
      ParentShowHint = False
      ShowHint = True
      OnClick = Aceptar
    end
    object ToolButton5: TToolButton
      Left = 24
      Top = 0
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object BSalir: TToolButton
      Left = 32
      Top = 0
      Hint = 'Salir'
      Caption = 'BSalir'
      ImageIndex = 9
      ParentShowHint = False
      ShowHint = True
      OnClick = Salir
    end
  end
  object BarraEstado: TStatusBar
    Left = 0
    Top = 171
    Width = 411
    Height = 23
    Color = 16776176
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object PanelClaves: TPanel
    Left = 0
    Top = 29
    Width = 411
    Height = 142
    Align = alClient
    Color = 16776176
    TabOrder = 2
  end
end
