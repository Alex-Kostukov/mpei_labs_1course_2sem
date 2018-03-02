object Form6: TForm6
  Left = 0
  Top = 0
  Caption = #1061#1077#1096#1080#1088#1086#1074#1072#1085#1080#1077
  ClientHeight = 319
  ClientWidth = 657
  Color = clBtnFace
  Constraints.MinHeight = 378
  Constraints.MinWidth = 673
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Consolas'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 182
    Height = 15
    Caption = #1052#1086#1097#1085#1086#1089#1090#1100' '#1085#1072#1073#1086#1088#1072' '#1084#1085#1086#1078#1077#1089#1090#1074': '
  end
  object StringGridSets: TStringGrid
    Left = 8
    Top = 49
    Width = 641
    Height = 265
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs, goAlwaysShowEditor]
    TabOrder = 0
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
  object EditN: TEdit
    Left = 194
    Top = 13
    Width = 45
    Height = 23
    NumbersOnly = True
    TabOrder = 1
    Text = '1'
    OnChange = EditNChange
  end
  object UpDownN: TUpDown
    Left = 239
    Top = 13
    Width = 16
    Height = 23
    Associate = EditN
    Position = 1
    TabOrder = 2
  end
  object OpenDialog1: TOpenDialog
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099'|*.txt|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Left = 368
    Top = 8
  end
  object SaveDialog1: TSaveDialog
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099'|*.txt|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 432
    Top = 8
  end
  object MainMenu1: TMainMenu
    Left = 504
    Top = 8
    object dfwed1: TMenuItem
      Caption = #1059#1089#1083#1086#1074#1080#1077
      OnClick = dfwed1Click
    end
    object N1: TMenuItem
      Caption = #1044#1072#1085#1085#1099#1077
      object N2: TMenuItem
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '
        ShortCut = 16463
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        ShortCut = 16467
        OnClick = N3Click
      end
    end
    object N4: TMenuItem
      Caption = #1056#1077#1096#1077#1085#1080#1077
      object SolveHash1: TMenuItem
        Caption = ' '#1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1087#1077#1088#1074#1091#1102' '#1093#1077#1096'-'#1092#1091#1085#1082#1094#1080#1102
        ShortCut = 112
        OnClick = SolveHash1Click
      end
      object SolveHash2: TMenuItem
        Caption = ' '#1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1074#1090#1086#1088#1091#1102' '#1093#1077#1096'-'#1092#1091#1085#1082#1094#1080#1102
        ShortCut = 113
        OnClick = SolveHash2Click
      end
      object SolveHash3: TMenuItem
        Caption = ' '#1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1090#1088#1077#1090#1100#1102' '#1093#1077#1096'-'#1092#1091#1085#1082#1094#1080#1102
        ShortCut = 114
        OnClick = SolveHash3Click
      end
    end
    object N5: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = N5Click
    end
  end
end
