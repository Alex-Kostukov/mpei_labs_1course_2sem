object FormDialogRoot: TFormDialogRoot
  Left = 672
  Top = 332
  Caption = #1050#1086#1088#1077#1085#1100
  ClientHeight = 132
  ClientWidth = 242
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 35
    Width = 77
    Height = 13
    Caption = #1050#1086#1088#1077#1085#1100' '#1076#1077#1088#1077#1074#1072
  end
  object Button1: TButton
    Left = 16
    Top = 72
    Width = 106
    Height = 33
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 0
    OnClick = Button1Click
  end
  object EditRoot: TEdit
    Left = 128
    Top = 32
    Width = 106
    Height = 21
    TabOrder = 1
  end
  object Button2: TButton
    Left = 128
    Top = 72
    Width = 106
    Height = 33
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
  end
end
