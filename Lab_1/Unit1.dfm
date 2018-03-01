object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1052#1085#1086#1078#1077#1089#1090#1074#1072
  ClientHeight = 327
  ClientWidth = 655
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Consolas'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 23
    Top = 28
    Width = 91
    Height = 15
    Caption = #1052#1085#1086#1078#1077#1089#1090#1074#1086' A: '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 23
    Top = 80
    Width = 91
    Height = 15
    Caption = #1052#1085#1086#1078#1077#1089#1090#1074#1086' B: '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 23
    Top = 131
    Width = 91
    Height = 15
    Caption = #1052#1085#1086#1078#1077#1089#1090#1074#1086' C: '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 23
    Top = 276
    Width = 77
    Height = 15
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090': '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
  end
  object EditSetA: TEdit
    Left = 128
    Top = 27
    Width = 273
    Height = 23
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object ButtonUnion: TButton
    Left = 424
    Top = 20
    Width = 193
    Height = 34
    Caption = #1054#1073#1098#1077#1076#1080#1085#1077#1085#1080#1077
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = ButtonUnionClick
  end
  object EditSetB: TEdit
    Left = 128
    Top = 77
    Width = 273
    Height = 23
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object ButtonIntersection: TButton
    Left = 424
    Top = 72
    Width = 193
    Height = 34
    Caption = #1055#1077#1088#1077#1089#1077#1095#1077#1085#1080#1077
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = ButtonIntersectionClick
  end
  object EditSetC: TEdit
    Left = 128
    Top = 128
    Width = 273
    Height = 23
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object ButtonDifference: TButton
    Left = 424
    Top = 123
    Width = 193
    Height = 34
    Caption = #1056#1072#1079#1085#1086#1089#1090#1100
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = ButtonDifferenceClick
  end
  object EditResult: TEdit
    Left = 128
    Top = 273
    Width = 273
    Height = 23
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object ButtonExpression13: TButton
    Left = 424
    Top = 174
    Width = 193
    Height = 34
    Caption = #1042#1099#1088#1072#1078#1077#1085#1080#1077' '#1076#1083#1103' '#1074#1072#1088#1080#1072#1085#1090#1072' 13'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = ButtonExpression13Click
  end
  object ButtonExpression26: TButton
    Left = 424
    Top = 214
    Width = 193
    Height = 34
    Caption = #1042#1099#1088#1072#1078#1077#1085#1080#1077' '#1076#1083#1103' '#1074#1072#1088#1080#1072#1085#1090#1072' 26'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = ButtonExpression26Click
  end
  object ButtonExit: TButton
    Left = 424
    Top = 265
    Width = 193
    Height = 40
    Cancel = True
    Caption = #1042#1099#1093#1086#1076
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = ButtonExitClick
  end
end
