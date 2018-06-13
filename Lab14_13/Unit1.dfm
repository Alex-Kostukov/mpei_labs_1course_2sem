object Form1: TForm1
  Left = 448
  Top = 216
  Caption = 'Form1'
  ClientHeight = 344
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 319
    Width = 169
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1085#1077#1095#1077#1090#1085#1099#1093' '#1101#1083#1077#1084#1077#1085#1090#1086#1074
  end
  object Tree: TTreeView
    Left = 8
    Top = 32
    Width = 601
    Height = 281
    Indent = 19
    PopupMenu = PopupMenu
    TabOrder = 0
  end
  object EditCount: TEdit
    Left = 194
    Top = 315
    Width = 41
    Height = 21
    TabOrder = 1
  end
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 624
    Height = 17
    ButtonWidth = 33
    Caption = 'ToolBar'
    Images = ImageList1
    TabOrder = 2
    object ToolButton2: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object ToolButtonOpen: TToolButton
      Left = 8
      Top = 0
      Action = FileOpen1
      OnClick = NLoadClick
    end
    object ToolButtonSave: TToolButton
      Left = 41
      Top = 0
      Action = FileSaveAs1
      OnClick = NSaveClick
    end
    object ToolButton3: TToolButton
      Left = 74
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object ToolButtonSolve: TToolButton
      Left = 82
      Top = 0
      Action = Action1
      ImageIndex = 2
    end
  end
  object PopupMenu: TPopupMenu
    OnPopup = PopupMenuPopup
    Left = 512
    Top = 16
    object NInsert: TMenuItem
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100
      OnClick = NInsertClick
    end
    object NDelete: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = NDeleteClick
    end
  end
  object MainMenu: TMainMenu
    Images = ImageList1
    Left = 440
    Top = 16
    object NTask: TMenuItem
      Caption = #1059#1089#1083#1086#1074#1080#1077
      OnClick = NTaskClick
    end
    object N4: TMenuItem
      Caption = #1044#1072#1085#1085#1099#1077
      object NLoad: TMenuItem
        Action = FileOpen1
        OnClick = NLoadClick
      end
      object NSave: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        ImageIndex = 1
        ShortCut = 16467
        OnClick = NSaveClick
      end
    end
    object NSolve: TMenuItem
      Caption = #1056#1077#1096#1077#1085#1080#1077
      OnClick = NSolveClick
    end
    object NClose: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      ImageIndex = 2
      OnClick = NCloseClick
    end
  end
  object ActionList1: TActionList
    Images = ImageList1
    Left = 448
    Top = 288
    object FileOpen1: TFileOpen
      Category = 'File'
      Caption = '&Open...'
      Hint = 'Open|Opens an existing file'
      ImageIndex = 0
      ShortCut = 16463
    end
    object FileSaveAs1: TFileSaveAs
      Category = 'File'
      Caption = 'Save &As...'
      Hint = 'Save As|Saves the active file with a new name'
      ImageIndex = 1
    end
    object Action1: TAction
      Caption = 'Solve'
      OnExecute = NSolveClick
    end
  end
  object ImageList1: TImageList
    Left = 392
    Top = 304
    Bitmap = {
      494C010103000800240010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008080000080800000000000000000000000000000000000C0C0C0000000
      000000808000000000000000000000000000FFFFFFFFFFFFFFFF241CF1FF761C
      EDFF241CF1FF241CEDFF241CEDFF501CEDFFFFFFFFFFFFFFFFFF241CF3FF241C
      EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000008080000080800000000000000000000000000000000000C0C0C0000000
      000000808000000000000000000000000000FFFFFFFFFFFFFFFF241CF1FF241C
      EDFF764AEDFFFFFFFFFF241CF1FF241CEDFFFFBBF3FFFFFFFFFF241CF3FF241C
      EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF000000
      0000008080000080800000808000008080000080800000808000008080000080
      8000008080000000000000000000000000000000000000000000000000000000
      0000008080000080800000000000000000000000000000000000000000000000
      000000808000000000000000000000000000FFFFFFFFFFFFFFFF241CF1FF241C
      EDFFFFFFFCFFFFFFFFFF76BBFFFF241CEDFFBD72EDFFFFFFFFFF241CF3FF241C
      EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000080800000808000008080000080800000808000008080000080
      8000008080000080800000000000000000000000000000000000000000000000
      0000008080000080800000808000008080000080800000808000008080000080
      800000808000000000000000000000000000FFFFFFFFFFFFFFFF241CF1FF241C
      EDFFFFFFFFFFFFFFFFFFDEFFFFFF241CEDFF761CEDFFFFFFFFFF241CF3FF241C
      EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008080000080800000000000000000000000000000000000000000000080
      800000808000000000000000000000000000FFFFFFFFFFFFFFFF241CF1FF241C
      EDFFFFFFFFFFFFFFFFFFBDFFFFFF241CEDFF9B4AEDFFFFFFFFFF241CF3FF241C
      EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000080800000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      000000808000000000000000000000000000FFFFFFFFFFFFFFFF241CF1FF241C
      EDFF764AEDFFFFFFFFFF241CF3FF241CEDFFDE98F1FFFFFFFFFF241CF3FF241C
      EDFF241CEDFF241CEDFFFFBBF3FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000080800000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      000000808000000000000000000000000000FFFFFFFFFFFFFFFF241CF1FF241C
      EDFF241CF1FF241CEDFF241CEDFF241CEDFFFFFFFFFFFFFFFFFF241CF3FF501C
      EDFF241CF1FF241CEDFFFFBBF3FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000080800000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF241CF1FF241C
      EDFFDEFFFFFF241CF1FF241CEDFFFFDDF9FFFFFFFFFFFFFFFFFF241CF3FF761C
      EDFF9BDDFFFF241CEDFFFFDDF7FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000080800000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000C0C0C000000000000000000000000000FFFFFFFFFFFFFFFF241CF1FF241C
      EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF241CF1FF241C
      EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF241CF3FF241C
      EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFF7E00000000FFFFBFFF00000000
      001FF00300000000000FE003000000000007E003000000000003E00300000000
      0001E003000000000000200300000000001FE00200000000001FE00300000000
      001FE003000000008FF1E00300000000FFF9E00300000000FF75FFFF00000000
      FF8FBF7D00000000FFFF7F7E0000000000000000000000000000000000000000
      000000000000}
  end
  object OpenDialog: TOpenDialog
    Left = 368
    Top = 64
  end
  object SaveDialog: TSaveDialog
    Left = 432
    Top = 136
  end
end
