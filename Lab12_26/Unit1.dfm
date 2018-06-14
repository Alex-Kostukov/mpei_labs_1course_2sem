object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1057#1087#1080#1089#1082#1080
  ClientHeight = 151
  ClientWidth = 214
  Color = clBtnFace
  Constraints.MaxHeight = 190
  Constraints.MaxWidth = 230
  Constraints.MinHeight = 190
  Constraints.MinWidth = 230
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RadioGroupType: TRadioGroup
    Left = 8
    Top = 8
    Width = 198
    Height = 105
    Caption = #1058#1080#1087' '#1089#1087#1080#1089#1082#1072
    Items.Strings = (
      #1086#1076#1085#1086#1085#1072#1087#1088#1072#1074#1083#1077#1085#1085#1099#1081' '#1089#1087#1080#1089#1086#1082
      #1076#1074#1091#1085#1072#1087#1088#1072#1074#1083#1077#1085#1085#1099#1081' '#1089#1087#1080#1089#1086#1082)
    TabOrder = 0
    OnClick = RadioGroupTypeClick
  end
  object ButtonOK: TButton
    Left = 8
    Top = 119
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 1
    OnClick = ButtonOKClick
  end
  object ButtonExit: TButton
    Left = 131
    Top = 119
    Width = 75
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 2
    OnClick = ButtonExitClick
  end
end
