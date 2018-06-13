object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1058#1080#1087#1086#1074#1086#1081' '#1088#1072#1089#1095#1105#1090
  ClientHeight = 374
  ClientWidth = 411
  Color = clBtnFace
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
  object GroupBoxStack: TGroupBox
    Left = 8
    Top = 24
    Width = 377
    Height = 297
    Caption = #1057#1090#1077#1082
    TabOrder = 0
    object Label1: TLabel
      Left = 138
      Top = 32
      Width = 50
      Height = 16
      Caption = #1069#1083#1077#1084#1077#1085#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object ListBoxStack: TListBox
      Left = 3
      Top = 25
      Width = 118
      Height = 255
      ItemHeight = 13
      TabOrder = 0
    end
    object EditElemStack: TEdit
      Left = 194
      Top = 31
      Width = 121
      Height = 21
      MaxLength = 30
      TabOrder = 1
      OnChange = EditElemStackChange
    end
    object ButtonAddStack: TButton
      Left = 168
      Top = 96
      Width = 129
      Height = 33
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Enabled = False
      TabOrder = 2
      OnClick = ButtonAddStackClick
    end
    object ButtonDeleteElemStack: TButton
      Left = 168
      Top = 152
      Width = 129
      Height = 33
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 3
      OnClick = ButtonDeleteElemStackClick
    end
    object ButtonDeleteListStack: TButton
      Left = 168
      Top = 200
      Width = 129
      Height = 33
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      TabOrder = 4
      OnClick = ButtonDeleteListStackClick
    end
  end
  object GroupBoxDeck: TGroupBox
    Left = 8
    Top = 24
    Width = 379
    Height = 297
    Caption = #1044#1077#1082
    TabOrder = 1
    object Label3: TLabel
      Left = 152
      Top = 32
      Width = 50
      Height = 16
      Caption = #1069#1083#1077#1084#1077#1085#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object ListBoxDeck2: TListBox
      Left = 88
      Top = 25
      Width = 58
      Height = 255
      ItemHeight = 13
      TabOrder = 0
    end
    object EditElemDeck: TEdit
      Left = 208
      Top = 31
      Width = 105
      Height = 21
      TabOrder = 1
      OnChange = EditElemDeckChange
    end
    object ButtonAddBeginDeck: TButton
      Left = 168
      Top = 72
      Width = 113
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1085#1072#1095#1072#1083#1086
      Enabled = False
      TabOrder = 2
      OnClick = ButtonAddBeginDeckClick
    end
    object ButtonAddEndDeck: TButton
      Left = 168
      Top = 111
      Width = 113
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1082#1086#1085#1077#1094
      Enabled = False
      TabOrder = 3
      OnClick = ButtonAddEndDeckClick
    end
    object ButtonDeleteBeginDeck: TButton
      Left = 168
      Top = 156
      Width = 113
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089' '#1085#1072#1095#1072#1083#1072
      TabOrder = 4
      OnClick = ButtonDeleteBeginDeckClick
    end
    object ButtonDeleteEndDeck: TButton
      Left = 168
      Top = 204
      Width = 113
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089' '#1082#1086#1085#1094#1072
      TabOrder = 5
      OnClick = ButtonDeleteEndDeckClick
    end
    object ButtonDeleteListDeck: TButton
      Left = 168
      Top = 252
      Width = 113
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      TabOrder = 6
      OnClick = ButtonDeleteListDeckClick
    end
    object ListBoxDeck1: TListBox
      Left = 16
      Top = 25
      Width = 57
      Height = 256
      ItemHeight = 13
      TabOrder = 7
    end
  end
  object GroupBoxQueue: TGroupBox
    Left = 8
    Top = 24
    Width = 377
    Height = 297
    Caption = #1054#1095#1077#1088#1077#1076#1100
    TabOrder = 2
    object Label2: TLabel
      Left = 138
      Top = 32
      Width = 50
      Height = 16
      Caption = #1069#1083#1077#1084#1077#1085#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object ListBoxQueue: TListBox
      Left = 3
      Top = 25
      Width = 118
      Height = 255
      ItemHeight = 13
      TabOrder = 0
    end
    object EditElemQueue: TEdit
      Left = 194
      Top = 31
      Width = 121
      Height = 21
      MaxLength = 30
      TabOrder = 1
      OnChange = EditElemQueueChange
    end
    object ButtonAddQueue: TButton
      Left = 168
      Top = 96
      Width = 129
      Height = 33
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Enabled = False
      TabOrder = 2
      OnClick = ButtonAddQueueClick
    end
    object ButtonDeleteElemQueue: TButton
      Left = 168
      Top = 152
      Width = 129
      Height = 33
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 3
      OnClick = ButtonDeleteElemQueueClick
    end
    object ButtonDeleteListQueue: TButton
      Left = 168
      Top = 200
      Width = 129
      Height = 33
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      TabOrder = 4
      OnClick = ButtonDeleteListQueueClick
    end
  end
  object OpenDialog: TOpenDialog
    Left = 152
    Top = 312
  end
  object SaveDialog: TSaveDialog
    Left = 88
    Top = 312
  end
  object MainMenu: TMainMenu
    Left = 32
    Top = 312
    object MCondition: TMenuItem
      Caption = #1059#1089#1083#1086#1074#1080#1077
      OnClick = MConditionClick
    end
    object MChoose: TMenuItem
      Caption = #1057#1090#1088#1091#1082#1090#1091#1088#1072
      object MStack: TMenuItem
        Caption = #1057#1090#1077#1082
        OnClick = MStackClick
      end
      object MQueue: TMenuItem
        Caption = #1054#1095#1077#1088#1077#1076#1100
        OnClick = MQueueClick
      end
      object MDeck: TMenuItem
        Caption = #1044#1077#1082
        OnClick = MDeckClick
      end
    end
    object MSaveNLoad: TMenuItem
      Caption = #1044#1072#1085#1085#1099#1077
      object MSave: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        OnClick = MSaveClick
      end
      object MLoad: TMenuItem
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
        OnClick = MLoadClick
      end
    end
    object MQuest: TMenuItem
      Caption = #1056#1077#1096#1077#1085#1080#1077
      OnClick = MQuestClick
    end
    object MExit: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = MExitClick
    end
  end
end
