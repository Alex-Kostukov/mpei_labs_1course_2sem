object DialogForm: TDialogForm
  Left = 640
  Top = 349
  Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1101#1083#1077#1084#1077#1085#1090#1086#1074' '#1076#1083#1103' '#1079#1072#1087#1080#1089#1080' '#1074' '#1092#1072#1081#1083
  ClientHeight = 81
  ClientWidth = 269
  Color = clBtnFace
  Constraints.MinHeight = 120
  Constraints.MinWidth = 285
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object EditCount: TEdit
    Left = 8
    Top = 16
    Width = 253
    Height = 21
    NumbersOnly = True
    TabOrder = 0
    OnChange = EditCountChange
  end
  object ButtonOK: TButton
    Left = 8
    Top = 43
    Width = 121
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    TabOrder = 1
  end
  object ButtonCancel: TButton
    Left = 140
    Top = 43
    Width = 121
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
  end
end
