object FormTwoDirectionsList: TFormTwoDirectionsList
  Left = 0
  Top = 0
  Caption = #1044#1074#1091#1085#1072#1087#1088#1072#1074#1083#1077#1085#1085#1099#1081' '#1089#1087#1080#1089#1086#1082
  ClientHeight = 291
  ClientWidth = 454
  Color = clBtnFace
  Constraints.MaxHeight = 350
  Constraints.MaxWidth = 470
  Constraints.MinHeight = 350
  Constraints.MinWidth = 470
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenuForm
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object ListBoxList: TListBox
    Left = 9
    Top = 34
    Width = 121
    Height = 241
    ItemHeight = 13
    TabOrder = 0
  end
  object EditElement: TEdit
    Left = 316
    Top = 7
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object StaticText1: TStaticText
    Left = 263
    Top = 11
    Width = 47
    Height = 17
    Caption = #1069#1083#1077#1084#1077#1085#1090
    TabOrder = 2
  end
  object Button1: TButton
    Left = 263
    Top = 34
    Width = 174
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1085#1072#1095#1072#1083#1086
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 263
    Top = 65
    Width = 174
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1082#1086#1085#1077#1094
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 263
    Top = 96
    Width = 174
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086' '#1091#1089#1083#1086#1074#1080#1102
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 263
    Top = 127
    Width = 174
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1101#1083#1077#1084#1077#1085#1090
    TabOrder = 6
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 263
    Top = 158
    Width = 174
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
    TabOrder = 7
    OnClick = Button5Click
  end
  object EditFirst: TEdit
    Left = 316
    Top = 206
    Width = 121
    Height = 21
    TabOrder = 8
  end
  object StaticText2: TStaticText
    Left = 297
    Top = 189
    Width = 140
    Height = 17
    Caption = #1055#1077#1088#1074#1099#1081' '#1085#1077#1095#1077#1090#1085#1099#1081' '#1101#1083#1077#1084#1077#1085#1090
    TabOrder = 9
  end
  object ListBoxList2: TListBox
    Left = 136
    Top = 34
    Width = 121
    Height = 241
    ItemHeight = 13
    TabOrder = 10
  end
  object StaticText4: TStaticText
    Left = 8
    Top = 11
    Width = 95
    Height = 17
    Caption = #1042' '#1087#1088#1103#1084#1086#1084' '#1087#1086#1088#1103#1076#1082#1077
    TabOrder = 11
  end
  object StaticText5: TStaticText
    Left = 136
    Top = 11
    Width = 107
    Height = 17
    Caption = #1042' '#1086#1073#1088#1072#1090#1085#1086#1084' '#1087#1086#1088#1103#1076#1082#1077
    TabOrder = 12
  end
  object MainMenuForm: TMainMenu
    Left = 96
    Top = 232
    object N1: TMenuItem
      Caption = #1059#1089#1083#1086#1074#1080#1077' '
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1044#1072#1085#1085#1099#1077
      object N3: TMenuItem
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        OnClick = N4Click
      end
    end
    object N5: TMenuItem
      Caption = #1056#1077#1096#1077#1085#1080#1077
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = N6Click
    end
  end
  object SaveDialog: TSaveDialog
    Left = 16
    Top = 232
  end
  object OpenDialog: TOpenDialog
    Left = 56
    Top = 232
  end
end
