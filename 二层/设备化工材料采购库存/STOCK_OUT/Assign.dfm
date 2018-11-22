object FrmAssign: TFrmAssign
  Left = 239
  Top = 318
  Width = 652
  Height = 375
  Caption = #26448#26009#21457#25918
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 301
    Width = 644
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object BitBtn2: TBitBtn
      Left = 232
      Top = 12
      Width = 75
      Height = 25
      TabOrder = 0
      Kind = bkOK
    end
    object BitBtn3: TBitBtn
      Left = 336
      Top = 12
      Width = 75
      Height = 25
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 0
    Width = 644
    Height = 301
    Align = alClient
    ColCount = 7
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goRowSelect]
    PopupMenu = PopupMenu1
    TabOrder = 1
    ColWidths = (
      193
      49
      74
      73
      71
      71
      73)
  end
  object PopupMenu1: TPopupMenu
    Left = 424
    Top = 200
    object Inspect1: TMenuItem
      Caption = #21457#25918#39044#23450#26448#26009
    end
    object PASS1: TMenuItem
      Caption = #21457#25918#26367#20195#26448#26009
    end
    object N5: TMenuItem
      Caption = #32467#26463#37197#26009
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Caption = #26448#26009#36864#22238
    end
  end
end
