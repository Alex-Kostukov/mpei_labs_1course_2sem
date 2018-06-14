object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1042#1085#1077#1096#1085#1103#1103' '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1072
  ClientHeight = 207
  ClientWidth = 784
  Color = clBtnFace
  Constraints.MaxHeight = 265
  Constraints.MaxWidth = 800
  Constraints.MinHeight = 265
  Constraints.MinWidth = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 72
    Height = 13
    Caption = #1042#1093#1086#1076#1085#1086#1081' '#1092#1072#1081#1083
  end
  object Label2: TLabel
    Left = 16
    Top = 48
    Width = 80
    Height = 13
    Caption = #1042#1099#1093#1086#1076#1085#1086#1081' '#1092#1072#1081#1083
  end
  object EditInputTextFile: TEdit
    Left = 120
    Top = 5
    Width = 654
    Height = 21
    Enabled = False
    ReadOnly = True
    TabOrder = 0
  end
  object EditOutputTextFile: TEdit
    Left = 120
    Top = 45
    Width = 654
    Height = 21
    Enabled = False
    ReadOnly = True
    TabOrder = 1
  end
  object GroupBox: TGroupBox
    Left = 0
    Top = 72
    Width = 774
    Height = 122
    Caption = #1042#1088#1077#1084#1103' '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1080
    TabOrder = 2
    object StringGridResults: TStringGrid
      Left = 16
      Top = 16
      Width = 758
      Height = 106
      ColCount = 3
      DefaultColWidth = 250
      FixedCols = 0
      RowCount = 2
      TabOrder = 0
      ColWidths = (
        250
        250
        250)
      RowHeights = (
        24
        24)
    end
  end
  object OpenDialog: TOpenDialog
    Left = 600
    Top = 152
  end
  object MainMenu: TMainMenu
    Left = 656
    Top = 152
    object NCondition: TMenuItem
      Caption = #1059#1089#1083#1086#1074#1080#1077
      OnClick = NConditionClick
    end
    object NFile: TMenuItem
      Caption = #1060#1072#1081#1083
      object NChooseInputFile: TMenuItem
        Caption = #1042#1099#1073#1088#1072#1090#1100' '#1074#1093#1086#1076#1085#1086#1081' '#1092#1072#1081#1083
        OnClick = NChooseInputFileClick
      end
      object NOutputTextFileClick: TMenuItem
        Caption = #1042#1099#1073#1088#1072#1090#1100' '#1074#1099#1093#1086#1076#1085#1086#1081' '#1092#1072#1081#1083
        OnClick = NOutputTextFileClickClick
      end
    end
    object NSort: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
      object NSortDirect: TMenuItem
        Caption = #1055#1088#1103#1084#1099#1084' '#1089#1083#1080#1103#1085#1080#1077#1084
        OnClick = NSortDirectClick
      end
      object NSortNatural: TMenuItem
        Caption = #1045#1089#1090#1077#1089#1090#1074#1077#1085#1085#1099#1084' '#1089#1083#1080#1103#1085#1080#1077#1084
        OnClick = NSortNaturalClick
      end
    end
    object NExit: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = NExitClick
    end
  end
end
