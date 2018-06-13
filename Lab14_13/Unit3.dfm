object FormDialogNodes: TFormDialogNodes
  Left = 624
  Top = 332
  Caption = #1042#1077#1088#1096#1080#1085#1099
  ClientHeight = 151
  ClientWidth = 282
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
    Left = 37
    Top = 27
    Width = 78
    Height = 13
    Caption = #1051#1077#1074#1072#1103' '#1074#1077#1088#1096#1080#1085#1072
  end
  object Label2: TLabel
    Left = 31
    Top = 54
    Width = 84
    Height = 13
    Caption = #1055#1088#1072#1074#1072#1103' '#1074#1077#1088#1096#1080#1085#1072
  end
  object EditLeft: TEdit
    Left = 121
    Top = 24
    Width = 129
    Height = 21
    TabOrder = 0
  end
  object EditRight: TEdit
    Left = 121
    Top = 51
    Width = 129
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 32
    Top = 96
    Width = 106
    Height = 33
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 144
    Top = 96
    Width = 106
    Height = 33
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 3
  end
end
