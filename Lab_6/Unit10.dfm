object Form10: TForm10
  Left = 0
  Top = 0
  Caption = #1044#1074#1091#1084#1077#1088#1085#1099#1081' '#1076#1080#1085#1072#1084#1080#1095#1077#1089#1082#1080#1081' '#1084#1072#1089#1089#1080#1074
  ClientHeight = 421
  ClientWidth = 791
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Consolas'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 24
    Top = 22
    Width = 168
    Height = 15
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1088#1086#1082' '#1084#1072#1090#1088#1080#1094#1099
  end
  object Label2: TLabel
    Left = 24
    Top = 53
    Width = 189
    Height = 15
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1086#1083#1073#1094#1086#1074' '#1084#1072#1090#1088#1080#1094#1099
  end
  object Label3: TLabel
    Left = 24
    Top = 383
    Width = 427
    Height = 15
    Caption = #1053#1086#1084#1077#1088' '#1087#1077#1088#1074#1086#1081' '#1089#1090#1088#1086#1082#1080', '#1089#1086#1076#1077#1088#1078#1072#1097#1077#1081' '#1090#1086#1083#1100#1082#1086' '#1087#1086#1083#1086#1078#1080#1090#1077#1083#1100#1085#1099#1077' '#1101#1083#1077#1084#1077#1085#1090#1099
  end
  object StringGridMatrix: TStringGrid
    Left = 24
    Top = 81
    Width = 537
    Height = 279
    TabOrder = 0
  end
  object StringGridResult: TStringGrid
    Left = 581
    Top = 81
    Width = 202
    Height = 279
    TabOrder = 1
  end
  object EditK: TEdit
    Left = 472
    Top = 380
    Width = 121
    Height = 23
    TabOrder = 2
  end
  object EditN: TEdit
    Left = 232
    Top = 19
    Width = 121
    Height = 23
    TabOrder = 3
    Text = '0'
    OnChange = EditNChange
  end
  object EditM: TEdit
    Left = 232
    Top = 50
    Width = 121
    Height = 23
    TabOrder = 4
    Text = '0'
    OnChange = EditMChange
  end
  object UpDownN: TUpDown
    Left = 353
    Top = 19
    Width = 16
    Height = 23
    Associate = EditN
    TabOrder = 5
  end
  object UpDownM: TUpDown
    Left = 353
    Top = 50
    Width = 16
    Height = 23
    Associate = EditM
    TabOrder = 6
  end
  object MainMenu1: TMainMenu
    Left = 488
    Top = 24
    object N1: TMenuItem
      Caption = #1059#1089#1083#1086#1074#1080#1077
    end
    object N2: TMenuItem
      Caption = #1044#1072#1085#1085#1099#1077
      object N5: TMenuItem
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
        ShortCut = 16463
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        ShortCut = 16467
        OnClick = N6Click
      end
    end
    object N3: TMenuItem
      Caption = #1056#1077#1096#1077#1085#1080#1077
    end
    object N4: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = N4Click
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 552
    Top = 24
  end
  object SaveDialog1: TSaveDialog
    Left = 616
    Top = 24
  end
end
