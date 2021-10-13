object FTraspasoBD: TFTraspasoBD
  Left = 193
  Top = 171
  Width = 870
  Height = 640
  Caption = 'Traspaso BD'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object BCobros: TButton
    Left = 120
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Cobros'
    TabOrder = 0
    OnClick = BCobrosClick
  end
  object Button1: TButton
    Left = 32
    Top = 96
    Width = 249
    Height = 25
    Caption = 'Poner familia en las lineas de entrada'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 32
    Top = 136
    Width = 249
    Height = 25
    Caption = 'Poner familia en las lineas de salida'
    TabOrder = 2
    OnClick = Button2Click
  end
end
