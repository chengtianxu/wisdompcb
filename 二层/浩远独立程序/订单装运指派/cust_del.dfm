object Fcust_del: TFcust_del
  Left = 417
  Top = 294
  BorderStyle = bsDialog
  Caption = #20462#25913#25253#20851#21333#21495
  ClientHeight = 205
  ClientWidth = 344
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 3
    Top = 16
    Width = 76
    Height = 19
    Caption = #25253#20851#21333#21495
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 43
    Top = 56
    Width = 38
    Height = 19
    Caption = #22791#27880
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object DBEdit1: TDBEdit
    Left = 88
    Top = 16
    Width = 121
    Height = 21
    DataField = 'cust_decl'
    DataSource = dm.DS64
    TabOrder = 0
  end
  object DBMemo1: TDBMemo
    Left = 88
    Top = 50
    Width = 246
    Height = 89
    DataField = 'remark'
    DataSource = dm.DS64
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 59
    Top = 160
    Width = 84
    Height = 31
    TabOrder = 2
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 175
    Top = 159
    Width = 84
    Height = 31
    TabOrder = 3
    Kind = bkCancel
  end
end
