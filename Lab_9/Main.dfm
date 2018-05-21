object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1047#1072#1087#1080#1089#1080
  ClientHeight = 415
  ClientWidth = 824
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 14
    Top = 11
    Width = 103
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1087#1080#1089#1077#1081
  end
  object Label2: TLabel
    Left = 368
    Top = 197
    Width = 59
    Height = 16
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object StringGrid: TStringGrid
    Left = 8
    Top = 40
    Width = 781
    Height = 145
    DefaultColWidth = 85
    GridLineWidth = 3
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs, goAlwaysShowEditor]
    TabOrder = 0
    ColWidths = (
      85
      85
      85
      85
      85)
    RowHeights = (
      24
      24
      24
      24
      24)
  end
  object StringGridResult: TStringGrid
    Left = 8
    Top = 216
    Width = 781
    Height = 145
    GridLineWidth = 3
    TabOrder = 1
    ColWidths = (
      64
      64
      64
      64
      64)
    RowHeights = (
      24
      24
      24
      24
      24)
  end
  object EditRowCount: TEdit
    Left = 123
    Top = 8
    Width = 30
    Height = 21
    NumbersOnly = True
    TabOrder = 2
    Text = '1'
    OnChange = EditRowCountChange
  end
  object UpDown1: TUpDown
    Left = 153
    Top = 8
    Width = 16
    Height = 21
    Associate = EditRowCount
    Min = 1
    Position = 1
    TabOrder = 3
  end
  object MainMenu1: TMainMenu
    Left = 632
    Top = 368
    object N1: TMenuItem
      Caption = #1059#1089#1083#1086#1074#1080#1077
      object NCondition13: TMenuItem
        Caption = #1042#1072#1088#1080#1072#1085#1090' 13'
      end
      object NCondition26: TMenuItem
        Caption = #1042#1072#1088#1080#1072#1085#1090' 26'
      end
    end
    object N2: TMenuItem
      Caption = #1044#1072#1085#1085#1099#1077
      object NLoad: TMenuItem
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
        OnClick = NLoadClick
      end
      object NSave: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        OnClick = NSaveClick
      end
    end
    object N5: TMenuItem
      Caption = #1056#1077#1096#1077#1085#1080#1077
      object NSolve13: TMenuItem
        Caption = #1042#1072#1088#1080#1072#1085#1090' 13'
        OnClick = NSolve13Click
      end
      object NSolve26: TMenuItem
        Caption = #1042#1072#1088#1080#1072#1085#1090' 26'
        OnClick = NSolve26Click
      end
    end
    object N6: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = N6Click
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = '*.Coffee|*.Coffee'
    Left = 688
    Top = 368
  end
  object SaveDialog1: TSaveDialog
    Filter = '*.Coffee|*.Coffee'
    Left = 744
    Top = 368
  end
end
