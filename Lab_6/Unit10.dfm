object Form10: TForm10
  Left = 0
  Top = 0
  Caption = #1044#1074#1091#1084#1077#1088#1085#1099#1081' '#1076#1080#1085#1072#1084#1080#1095#1077#1089#1082#1080#1081' '#1084#1072#1089#1089#1080#1074
  ClientHeight = 421
  ClientWidth = 821
  Color = clBtnFace
  Constraints.MinHeight = 480
  Constraints.MinWidth = 837
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Consolas'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnResize = FormResize
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
    Width = 28
    Height = 15
    Caption = 'K = '
  end
  object StringGridMatrix: TStringGrid
    Left = 24
    Top = 81
    Width = 537
    Height = 279
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 0
  end
  object StringGridResult: TStringGrid
    Left = 567
    Top = 81
    Width = 246
    Height = 279
    ColCount = 2
    RowCount = 1
    FixedRows = 0
    TabOrder = 1
  end
  object EditK: TEdit
    Left = 58
    Top = 380
    Width = 121
    Height = 23
    Enabled = False
    TabOrder = 2
  end
  object EditN: TEdit
    Left = 227
    Top = 50
    Width = 121
    Height = 23
    NumbersOnly = True
    TabOrder = 3
    Text = '1'
    OnChange = EditNChange
  end
  object EditM: TEdit
    Left = 227
    Top = 21
    Width = 121
    Height = 23
    NumbersOnly = True
    TabOrder = 4
    Text = '10'
    OnChange = EditMChange
  end
  object UpDownN: TUpDown
    Left = 348
    Top = 50
    Width = 16
    Height = 23
    Associate = EditN
    Min = 1
    Position = 1
    TabOrder = 5
  end
  object UpDownM: TUpDown
    Left = 348
    Top = 21
    Width = 16
    Height = 23
    Associate = EditM
    Min = 10
    Position = 10
    TabOrder = 6
  end
  object LabeledEditD: TLabeledEdit
    Left = 392
    Top = 50
    Width = 121
    Height = 23
    EditLabel.Width = 98
    EditLabel.Height = 15
    EditLabel.Caption = #1047#1072#1076#1072#1085#1085#1086#1077' '#1095#1080#1089#1083#1086
    NumbersOnly = True
    TabOrder = 7
    OnChange = LabeledEditDChange
  end
  object MainMenu1: TMainMenu
    Left = 648
    Top = 16
    object N1: TMenuItem
      Caption = #1059#1089#1083#1086#1074#1080#1077
      object N13: TMenuItem
        Caption = #1042#1072#1088#1080#1072#1085#1090' 13'
        OnClick = N13Click
      end
      object N26: TMenuItem
        Caption = #1042#1072#1088#1080#1072#1085#1090' 26'
        OnClick = N26Click
      end
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
      object N131: TMenuItem
        Caption = #1042#1072#1088#1080#1072#1085#1090' 13'
        object N11: TMenuItem
          Caption = #1047#1072#1076#1072#1085#1080#1077' 1'
          ShortCut = 112
          OnClick = Task1_13
        end
        object N21: TMenuItem
          Caption = #1047#1072#1076#1072#1085#1080#1077' 2'
          Enabled = False
          Hint = ' '#1042#1074#1077#1076#1080#1090#1077' "'#1047#1072#1076#1072#1085#1085#1086#1077' '#1095#1080#1089#1083#1086'"'
          ShortCut = 113
          OnClick = Task2_13
        end
      end
      object N261: TMenuItem
        Caption = #1042#1072#1088#1080#1072#1085#1090' 26'
        object N12: TMenuItem
          Caption = #1047#1072#1076#1072#1085#1080#1077' 1'
          ShortCut = 114
          OnClick = Task1_26
        end
        object N22: TMenuItem
          Caption = #1047#1072#1076#1072#1085#1080#1077' 2'
          Enabled = False
          ShortCut = 115
          OnClick = Task2_26
        end
      end
    end
    object N4: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = N4Click
    end
  end
  object OpenDialog1: TOpenDialog
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Left = 712
    Top = 16
  end
  object SaveDialog1: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 776
    Top = 16
  end
end
