object Form11: TForm11
  Left = 0
  Top = 0
  Caption = #1056#1077#1082#1091#1088#1089#1080#1103
  ClientHeight = 260
  ClientWidth = 637
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Consolas'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 19
    Width = 196
    Height = 15
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1101#1083#1077#1084#1077#1085#1090#1086#1074' '#1084#1072#1089#1089#1080#1074#1072
  end
  object Label2: TLabel
    Left = 16
    Top = 184
    Width = 217
    Height = 15
    Caption = #1053#1072#1083#1080#1095#1080#1077' '#1086#1090#1088#1080#1094#1072#1090#1077#1083#1100#1085#1099#1093' '#1101#1083#1077#1084#1077#1085#1090#1086#1074
  end
  object Label3: TLabel
    Left = 16
    Top = 224
    Width = 252
    Height = 15
    Caption = #1055#1088#1086#1080#1079#1074#1077#1076#1077#1085#1080#1077' '#1087#1086#1083#1086#1078#1080#1090#1077#1083#1100#1085#1099#1093' '#1101#1083#1077#1084#1077#1085#1090#1086#1074
  end
  object StringGrid1: TStringGrid
    Left = 16
    Top = 64
    Width = 593
    Height = 105
    TabOrder = 0
  end
  object EditN: TEdit
    Left = 234
    Top = 16
    Width = 121
    Height = 23
    TabOrder = 1
    Text = '0'
  end
  object UpDown1: TUpDown
    Left = 355
    Top = 16
    Width = 16
    Height = 23
    Associate = EditN
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 288
    Top = 181
    Width = 121
    Height = 23
    TabOrder = 3
    Text = '0'
  end
  object Edit2: TEdit
    Left = 288
    Top = 221
    Width = 121
    Height = 23
    TabOrder = 4
    Text = '0'
  end
  object OpenDialog1: TOpenDialog
    Left = 448
    Top = 8
  end
  object SaveDialog1: TSaveDialog
    Left = 512
    Top = 8
  end
  object MainMenu1: TMainMenu
    Left = 576
    Top = 8
    object N1: TMenuItem
      Caption = #1059#1089#1083#1086#1074#1080#1077
    end
    object N2: TMenuItem
      Caption = #1044#1072#1085#1085#1099#1077
      object N3: TMenuItem
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
        ShortCut = 16463
      end
      object N4: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        ShortCut = 16467
      end
    end
    object N5: TMenuItem
      Caption = #1056#1077#1096#1077#1085#1080#1077
    end
    object N6: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = N6Click
    end
  end
end
