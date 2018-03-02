object Form5: TForm5
  Left = 0
  Top = 0
  Caption = #1054#1073#1088#1072#1073#1086#1090#1082#1072' '#1089#1090#1088#1086#1082
  ClientHeight = 307
  ClientWidth = 467
  Color = clBtnFace
  Constraints.MinHeight = 346
  Constraints.MinWidth = 483
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Consolas'
  Font.Style = []
  OldCreateOrder = False
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 24
    Top = 244
    Width = 119
    Height = 14
    Caption = #1055#1086#1083#1091#1095#1077#1085#1085#1072#1103' '#1089#1090#1088#1086#1082#1072
  end
  object EditInputString: TLabeledEdit
    Left = 24
    Top = 32
    Width = 417
    Height = 22
    EditLabel.Width = 105
    EditLabel.Height = 15
    EditLabel.Caption = #1048#1089#1093#1086#1076#1085#1072#1103' '#1089#1090#1088#1086#1082#1072
    EditLabel.Font.Charset = ANSI_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -13
    EditLabel.Font.Name = 'Consolas'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    TabOrder = 0
    OnChange = EditInputStringChange
  end
  object EditInputSymbol: TLabeledEdit
    Left = 24
    Top = 80
    Width = 417
    Height = 22
    EditLabel.Width = 98
    EditLabel.Height = 15
    EditLabel.Caption = #1047#1072#1076#1072#1085#1085#1072#1103' '#1073#1091#1082#1074#1072
    EditLabel.Font.Charset = ANSI_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -13
    EditLabel.Font.Name = 'Consolas'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    MaxLength = 1
    TabOrder = 1
    OnChange = EditInputSymbolChange
  end
  object ButtonVariant13: TButton
    Left = 24
    Top = 120
    Width = 193
    Height = 33
    Caption = #1056#1077#1096#1080#1090#1100' '#1076#1083#1103' '#1074#1072#1088#1080#1072#1085#1090#1072' 13'
    Enabled = False
    TabOrder = 2
    OnClick = ButtonVariant13Click
  end
  object ButtonVariant26: TButton
    Left = 24
    Top = 159
    Width = 193
    Height = 33
    Caption = #1056#1077#1096#1080#1090#1100' '#1076#1083#1103' '#1074#1072#1088#1080#1072#1085#1090#1072' 26'
    Enabled = False
    TabOrder = 3
    OnClick = ButtonVariant26Click
  end
  object EditResult: TEdit
    Left = 24
    Top = 264
    Width = 417
    Height = 22
    Enabled = False
    TabOrder = 4
  end
  object ButtonSolve: TButton
    Left = 24
    Top = 197
    Width = 417
    Height = 33
    Caption = #1054#1073#1097#1077#1077' '#1088#1077#1096#1077#1085#1080#1077
    Enabled = False
    TabOrder = 5
    OnClick = ButtonSolveClick
  end
  object EditLength: TLabeledEdit
    Left = 240
    Top = 169
    Width = 201
    Height = 22
    EditLabel.Width = 189
    EditLabel.Height = 14
    EditLabel.Caption = #1044#1083#1080#1085#1072' '#1089#1083#1086#1074#1072' '#1076#1083#1103' '#1074#1072#1088#1080#1072#1085#1090#1072' 26'
    NumbersOnly = True
    TabOrder = 6
    OnChange = EditLengthChange
  end
end
