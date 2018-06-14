object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
  ClientHeight = 548
  ClientWidth = 692
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 159
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1101#1083#1077#1084#1077#1085#1090#1086#1074' '#1084#1072#1089#1089#1080#1074#1072
  end
  object Label2: TLabel
    Left = 24
    Top = 64
    Width = 93
    Height = 13
    Caption = #1048#1089#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
  end
  object Label3: TLabel
    Left = 24
    Top = 163
    Width = 112
    Height = 13
    Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1086#1073#1084#1077#1085#1072#1084#1080
  end
  object Label4: TLabel
    Left = 24
    Top = 257
    Width = 108
    Height = 13
    Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1074#1099#1073#1086#1088#1086#1084
  end
  object Label5: TLabel
    Left = 24
    Top = 351
    Width = 127
    Height = 13
    Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1074#1082#1083#1102#1095#1077#1085#1080#1077#1084
  end
  object Label6: TLabel
    Left = 24
    Top = 445
    Width = 105
    Height = 13
    Caption = #1041#1099#1089#1090#1088#1072#1103' '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1072
  end
  object LabelTimeOfChanging: TLabel
    Left = 189
    Top = 163
    Width = 3
    Height = 13
  end
  object LabelTimeOfChoosing: TLabel
    Left = 189
    Top = 257
    Width = 3
    Height = 13
  end
  object LabelTimeOfIncluding: TLabel
    Left = 189
    Top = 351
    Width = 3
    Height = 13
  end
  object LabelTimeOfQuickSort: TLabel
    Left = 189
    Top = 445
    Width = 3
    Height = 13
  end
  object EditNumber_of_elements: TEdit
    Left = 189
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '10'
    OnChange = EditNumber_of_elementsChange
  end
  object UpDown: TUpDown
    Left = 310
    Top = 16
    Width = 16
    Height = 21
    Associate = EditNumber_of_elements
    Min = 1
    Max = 100000
    Position = 10
    TabOrder = 1
  end
  object StringGridData: TStringGrid
    Left = 24
    Top = 88
    Width = 653
    Height = 69
    ColCount = 10
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 2
    ColWidths = (
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64)
    RowHeights = (
      24
      24)
  end
  object StringGridChange: TStringGrid
    Left = 24
    Top = 182
    Width = 653
    Height = 69
    ColCount = 10
    FixedCols = 0
    RowCount = 2
    TabOrder = 3
    ColWidths = (
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64)
    RowHeights = (
      24
      24)
  end
  object StringGridChoose: TStringGrid
    Left = 24
    Top = 276
    Width = 653
    Height = 69
    ColCount = 10
    FixedCols = 0
    RowCount = 2
    TabOrder = 4
    ColWidths = (
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64)
    RowHeights = (
      24
      26)
  end
  object StringGridInclude: TStringGrid
    Left = 24
    Top = 370
    Width = 653
    Height = 69
    ColCount = 10
    FixedCols = 0
    RowCount = 2
    TabOrder = 5
    ColWidths = (
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64)
    RowHeights = (
      24
      26)
  end
  object StringGridQuickSort: TStringGrid
    Left = 24
    Top = 464
    Width = 653
    Height = 69
    ColCount = 10
    FixedCols = 0
    RowCount = 2
    TabOrder = 6
    ColWidths = (
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64)
    RowHeights = (
      24
      26)
  end
  object RadioGroupType: TRadioGroup
    Left = 332
    Top = 16
    Width = 185
    Height = 61
    Caption = #1058#1080#1087' '#1101#1083#1077#1084#1077#1085#1090#1086#1074' '#1084#1072#1089#1089#1080#1074#1072
    Columns = 2
    Items.Strings = (
      #1062#1077#1083#1086#1077' '#1095#1080#1089#1083#1086
      #1057#1090#1088#1086#1082#1072)
    TabOrder = 7
  end
  object OpenDialog: TOpenDialog
    Left = 600
    Top = 8
  end
  object SaveDialog: TSaveDialog
    Left = 648
    Top = 8
  end
  object MainMenu: TMainMenu
    Left = 552
    Top = 8
    object NData: TMenuItem
      Caption = #1044#1072#1085#1085#1099#1077
      object NLoadData: TMenuItem
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
        ShortCut = 16463
        OnClick = NLoadDataClick
      end
      object NSaveData: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        ShortCut = 16467
        OnClick = NSaveDataClick
      end
    end
    object NSort: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
      OnClick = NSortClick
    end
    object NExit: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = NExitClick
    end
  end
end
