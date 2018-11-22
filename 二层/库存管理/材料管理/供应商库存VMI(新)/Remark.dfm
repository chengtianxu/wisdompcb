object Form_Remark: TForm_Remark
  Left = 318
  Top = 161
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20462#25913#22791#27880
  ClientHeight = 276
  ClientWidth = 520
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 13
    Top = 48
    Width = 96
    Height = 38
    Caption = '   '#22791#27880#13#10'('#35814#32454#20301#32622')'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 25
    Top = 8
    Width = 76
    Height = 19
    Caption = #29615#20445#26631#35782
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 12
    Top = 121
    Width = 96
    Height = 38
    Caption = '   '#22791#27880#13#10'('#29305#21035#35201#27714')'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 260
    Top = 11
    Width = 64
    Height = 16
    Caption = #25253#20851#21333#21495
    Font.Charset = ANSI_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 31
    Top = 187
    Width = 76
    Height = 19
    Caption = #29983#20135#25209#21495
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 138
    Top = 240
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 0
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 250
    Top = 240
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 1
    Kind = bkCancel
  end
  object DBEdit1: TDBEdit
    Left = 115
    Top = 8
    Width = 129
    Height = 21
    DataField = 'rohs'
    DataSource = dm.DS134
    TabOrder = 2
  end
  object DBMemo1: TDBMemo
    Left = 115
    Top = 109
    Width = 339
    Height = 60
    DataField = 'BARCODE_ID'
    DataSource = dm.DS134
    TabOrder = 3
  end
  object DBMemo2: TDBMemo
    Left = 115
    Top = 37
    Width = 339
    Height = 60
    DataField = 'SUPPLIER2'
    DataSource = dm.DS134
    TabOrder = 4
  end
  object DBEdit3: TDBEdit
    Left = 324
    Top = 8
    Width = 129
    Height = 21
    DataField = 'cust_decl'
    DataSource = dm.DS134
    TabOrder = 5
  end
  object DBEdit2: TDBEdit
    Left = 112
    Top = 182
    Width = 345
    Height = 23
    DataField = 'SUPPLIER3'
    DataSource = dm.DS134
    TabOrder = 6
  end
end
