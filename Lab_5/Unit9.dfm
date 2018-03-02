object Form9: TForm9
  Left = 0
  Top = 0
  Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1087#1086#1080#1089#1082
  ClientHeight = 265
  ClientWidth = 455
  Color = clBtnFace
  Constraints.MaxHeight = 304
  Constraints.MinHeight = 304
  Constraints.MinWidth = 471
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Consolas'
  Font.Style = []
  OldCreateOrder = False
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 205
    Width = 63
    Height = 15
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
  end
  object EditString: TLabeledEdit
    Left = 16
    Top = 32
    Width = 417
    Height = 23
    EditLabel.Width = 42
    EditLabel.Height = 15
    EditLabel.Caption = #1057#1090#1088#1086#1082#1072
    TabOrder = 0
    OnChange = EditStringChange
  end
  object EditSubString: TLabeledEdit
    Left = 16
    Top = 88
    Width = 417
    Height = 23
    EditLabel.Width = 63
    EditLabel.Height = 15
    EditLabel.Caption = #1055#1086#1076#1089#1090#1088#1086#1082#1072
    MaxLength = 32
    TabOrder = 1
    OnChange = EditSubStringChange
  end
  object CheckBoxRegister: TCheckBox
    Left = 16
    Top = 128
    Width = 209
    Height = 17
    Caption = #1056#1077#1075#1080#1089#1090#1088#1086'-'#1085#1077#1079#1072#1074#1080#1089#1080#1084#1099#1081' '#1087#1086#1080#1089#1082
    TabOrder = 2
  end
  object ButtonSearch: TButton
    Left = 16
    Top = 160
    Width = 417
    Height = 33
    Caption = #1053#1072#1081#1090#1080
    Enabled = False
    TabOrder = 3
    OnClick = ButtonSearchClick
  end
  object EditResult: TEdit
    Left = 16
    Top = 226
    Width = 417
    Height = 23
    Enabled = False
    TabOrder = 4
  end
end
