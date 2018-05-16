object Form1: TForm1
  Left = 505
  Top = 290
  Caption = #1058#1080#1087#1080#1079#1080#1088#1086#1074#1072#1085#1085#1099#1081' '#1092#1072#1081#1083
  ClientHeight = 311
  ClientWidth = 564
  Color = clBtnFace
  Constraints.MinHeight = 370
  Constraints.MinWidth = 580
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDesigned
  DesignSize = (
    564
    311)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 19
    Width = 54
    Height = 13
    Caption = #1048#1084#1103' '#1092#1072#1081#1083#1072
  end
  object Label2: TLabel
    Left = 144
    Top = 67
    Width = 116
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1101#1083#1077#1084#1077#1085#1090#1086#1074
  end
  object Label3: TLabel
    Left = 28
    Top = 115
    Width = 200
    Height = 13
    Caption = #1055#1077#1088#1074#1099#1081' '#1101#1083#1077#1084#1077#1085#1090' '#1074' '#1076#1080#1072#1087#1072#1079#1086#1085#1077' -10...+30'
  end
  object Label4: TLabel
    Left = 141
    Top = 163
    Width = 119
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1087#1086#1079#1080#1094#1080#1080' '#1074' '#1092#1072#1081#1083#1077
  end
  object Label5: TLabel
    Left = 28
    Top = 203
    Width = 232
    Height = 13
    Caption = #1069#1083#1077#1084#1077#1085#1090', '#1087#1086#1089#1083#1077' '#1082#1086#1090#1086#1088#1086#1075#1086' '#1085#1091#1078#1085#1086' '#1087#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100
  end
  object EditName: TEdit
    Left = 72
    Top = 16
    Width = 473
    Height = 21
    Enabled = False
    TabOrder = 0
    OnChange = EditNameChange
  end
  object EditCount: TEdit
    Left = 280
    Top = 64
    Width = 113
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object EditElem: TEdit
    Left = 280
    Top = 112
    Width = 113
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object EditPos: TEdit
    Left = 280
    Top = 160
    Width = 113
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object ListBox: TListBox
    Left = 416
    Top = 56
    Width = 129
    Height = 241
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 4
  end
  object EditK: TEdit
    Left = 280
    Top = 200
    Width = 113
    Height = 21
    NumbersOnly = True
    TabOrder = 5
  end
  object MainMenu: TMainMenu
    Left = 32
    Top = 248
    object NTask: TMenuItem
      Caption = #1059#1089#1083#1086#1074#1080#1077
      object N131: TMenuItem
        Caption = #1042#1072#1088#1080#1072#1085#1090' 13'
        OnClick = NTask13Click
      end
      object N261: TMenuItem
        Caption = #1042#1072#1088#1080#1072#1085#1090' 26'
        OnClick = NTask26Click
      end
    end
    object N2: TMenuItem
      Caption = #1058#1080#1087#1080#1079#1080#1088#1086#1074#1072#1085#1085#1099#1081' '#1092#1072#1081#1083
      object NFileName: TMenuItem
        Caption = #1047#1072#1076#1072#1090#1100' '#1080#1084#1103
        OnClick = NFileNameClick
      end
      object NRandom: TMenuItem
        Caption = #1057#1086#1079#1076#1072#1090#1100' '#1089#1083#1091#1095#1072#1081#1085#1099#1084' '#1086#1073#1088#1072#1079#1086#1084
        Enabled = False
        object NRandom13: TMenuItem
          Caption = #1042#1072#1088#1080#1072#1085#1090' 13'
          OnClick = NRandom13Click
        end
        object NRandom26: TMenuItem
          Caption = #1042#1072#1088#1080#1072#1085#1090' 26'
          OnClick = NRandom26Click
        end
      end
      object NTextFile: TMenuItem
        Caption = #1057#1086#1079#1076#1072#1090#1100' '#1080#1079' '#1090#1077#1082#1089#1090#1086#1074#1086#1075#1086' '#1092#1072#1081#1083#1072
        Enabled = False
        object N133: TMenuItem
          Caption = 'File of Integer'
          OnClick = NTextIntFileClick
        end
        object N263: TMenuItem
          Caption = 'File of Real'
          OnClick = NTextRealFileClick
        end
      end
      object NFile: TMenuItem
        Caption = #1057#1086#1076#1077#1088#1078#1080#1084#1086#1077
        Enabled = False
        object NFileContent13: TMenuItem
          Caption = 'File of Integer'
          OnClick = NFileContent13Click
        end
        object NFileContent26: TMenuItem
          Caption = 'File of Real'
          OnClick = NFileContent26Click
        end
      end
    end
    object N3: TMenuItem
      Caption = #1056#1077#1096#1077#1085#1080#1077
      object NFound: TMenuItem
        Caption = #1055#1086#1080#1089#1082' '#1101#1083#1077#1084#1077#1085#1090#1072
        object NSearch13: TMenuItem
          Caption = #1042#1072#1088#1080#1072#1085#1090' 13'
          OnClick = NSearch13Click
        end
        object NSearch26: TMenuItem
          Caption = #1042#1072#1088#1080#1072#1085#1090' 26'
          OnClick = NSearch26Click
        end
      end
      object NPerestanovka: TMenuItem
        Caption = #1055#1077#1088#1077#1089#1090#1072#1085#1086#1074#1082#1072' '#1101#1083#1077#1084#1077#1085#1090#1072
        object NSwap13: TMenuItem
          Caption = #1042#1072#1088#1080#1072#1085#1090' 13'
          OnClick = NSwap13Click
        end
        object NSwap26: TMenuItem
          Caption = #1042#1072#1088#1080#1072#1085#1090' 26'
          OnClick = NSwap26Click
        end
      end
    end
    object NExit: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = NExitClick
    end
  end
  object OpenDialogType: TOpenDialog
    DefaultExt = '.dat'
    Filter = #1058#1080#1087#1080#1079#1080#1088#1086#1074#1072#1085#1085#1099#1077' '#1092#1072#1081#1083#1099'|*.dat|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    Options = [ofHideReadOnly, ofCreatePrompt, ofEnableSizing]
    Title = #1042#1099#1073#1086#1088' '#1092#1072#1081#1083#1072
    Left = 176
    Top = 248
  end
  object OpenDialogText: TOpenDialog
    DefaultExt = '.txt'
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099'|*.txt|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Title = #1042#1099#1073#1086#1088' '#1092#1072#1081#1083#1072
    Left = 312
    Top = 248
  end
end
