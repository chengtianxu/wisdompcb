object frmPost06: TfrmPost06
  Left = 329
  Top = 186
  Width = 688
  Height = 464
  Caption = #25353#20316#19994#21333#25552#20132#20837#24211
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 96
    Top = 264
    Width = 76
    Height = 19
    Caption = #25552#20132#25968#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 120
    Top = 304
    Width = 39
    Height = 13
    Caption = #22791#27880#65306
  end
  object lbl6: TLabel
    Left = 422
    Top = 261
    Width = 31
    Height = 21
    Align = alCustom
    Caption = 'PNL'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ParentFont = False
  end
  object lbl5: TLabel
    Left = 278
    Top = 261
    Width = 30
    Height = 21
    Align = alCustom
    Caption = 'PCS'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ParentFont = False
  end
  object lbl4: TLabel
    Left = 424
    Top = 304
    Width = 39
    Height = 13
    Caption = #21608#26399#65306
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 672
    Height = 121
    Align = alTop
    TabOrder = 0
    object eh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 670
      Height = 119
      Align = alClient
      DataSource = ds06
      FooterColor = clWindow
      FooterFont.Charset = ANSI_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'WORK_ORDER_NUMBER'
          Footers = <>
          Title.Caption = #20316#19994#21333#21495
          Width = 200
        end
        item
          EditButtons = <>
          FieldName = 'QTY_BACKLOG'
          Footers = <>
          Title.Caption = #22312#32447#25968#37327
        end>
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 121
    Width = 672
    Height = 128
    Align = alTop
    TabOrder = 1
    object eh2: TDBGridEh
      Left = 1
      Top = 33
      Width = 670
      Height = 94
      Align = alClient
      DataSource = ds60
      FooterColor = clWindow
      FooterFont.Charset = ANSI_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDblClick = eh2DblClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'SALES_ORDER'
          Footers = <>
          Title.Caption = #38144#21806#35746#21333#21495
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'SCH_DATE'
          Footers = <>
          Title.Caption = #35745#21010#22238#22797#20132#26399
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'MANU_PART_NUMBER'
          Footers = <>
          Title.Caption = #26412#21378#32534#21495
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'MANU_PART_DESC'
          Footers = <>
          Title.Caption = #23458#25143#22411#21495
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'allqty'
          Footers = <>
          Title.Caption = #35746#21333#25968
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'REPUT_APPR_BY'
          Footers = <>
          Title.Caption = #24050#25552#20132
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'CanPost'
          Footers = <>
          Title.Caption = #21487#25552#20132
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'PO_NUMBER'
          Footers = <>
          Title.Caption = #23458#25143#35746#21333#21495
          Width = 100
        end>
    end
    object pnl3: TPanel
      Left = 1
      Top = 1
      Width = 670
      Height = 32
      Align = alTop
      TabOrder = 1
      object lbl2: TLabel
        Left = 8
        Top = 8
        Width = 52
        Height = 13
        Caption = #38144#21806#35746#21333
      end
      object lbl7: TLabel
        Left = 296
        Top = 8
        Width = 52
        Height = 13
        Caption = #35299#38145#30721#65306
      end
      object btn1: TButton
        Left = 142
        Top = 2
        Width = 75
        Height = 25
        Caption = #37325#36873#35746#21333
        TabOrder = 0
        OnClick = btn1Click
      end
      object edt2: TEdit
        Left = 350
        Top = 3
        Width = 121
        Height = 21
        TabOrder = 1
      end
    end
  end
  object edt1: TEdit
    Left = 182
    Top = 259
    Width = 91
    Height = 28
    Color = clAqua
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = '0'
    OnExit = edt1Exit
    OnKeyPress = edt1KeyPress
  end
  object cbxweishu: TCheckBox
    Left = 480
    Top = 262
    Width = 57
    Height = 17
    Caption = #23614#25968
    TabOrder = 3
  end
  object btn2: TButton
    Left = 240
    Top = 376
    Width = 75
    Height = 25
    Caption = #25552#20132
    TabOrder = 4
    OnClick = btn2Click
  end
  object edtBakNote: TEdit
    Left = 182
    Top = 298
    Width = 209
    Height = 21
    TabOrder = 5
  end
  object edtPnl: TEdit
    Left = 326
    Top = 259
    Width = 91
    Height = 28
    Color = clAqua
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Text = '0'
    OnExit = edtPnlExit
    OnKeyPress = edtPnlKeyPress
  end
  object rg1: TRadioGroup
    Left = 183
    Top = 320
    Width = 209
    Height = 41
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #22909#26495
      #21449#26495)
    TabOrder = 7
  end
  object edtzhouqi: TEdit
    Left = 464
    Top = 299
    Width = 81
    Height = 21
    TabOrder = 8
  end
  object ads06: TADODataSet
    Connection = dm1.con1
    LockType = ltReadOnly
    CommandText = 
      'SELECT d25.MANU_PART_NUMBER,d25.MANU_PART_DESC,d06.WORK_ORDER_NU' +
      'MBER,'#13#10'd56.QTY_BACKLOG,d56.PANELS,d06.RKEY as rkey06,d56.RKEY as' +
      ' rkey56,d06.PARTS_PER_PANEL'#13#10'FROM Data0006 d06'#13#10'INNER JOIN Data0' +
      '056 d56 ON d06.RKEY = d56.WO_PTR'#13#10'INNER JOIN Data0025 d25 ON d06' +
      '.BOM_PTR = d25.RKEY'#13#10'where d06.rkey = :p1'
    Parameters = <
      item
        Name = 'p1'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 288
    Top = 56
    object ads06MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ads06MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ads06WORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ads06QTY_BACKLOG: TFloatField
      FieldName = 'QTY_BACKLOG'
    end
    object ads06PANELS: TIntegerField
      FieldName = 'PANELS'
    end
    object ads06rkey06: TAutoIncField
      FieldName = 'rkey06'
      ReadOnly = True
    end
    object ads06rkey56: TAutoIncField
      FieldName = 'rkey56'
      ReadOnly = True
    end
    object ads06PARTS_PER_PANEL: TFloatField
      FieldName = 'PARTS_PER_PANEL'
    end
  end
  object ds06: TDataSource
    DataSet = ads06
    Left = 328
    Top = 56
  end
  object ads60: TADODataSet
    Connection = dm1.con1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT d25.MANU_PART_NUMBER,d25.MANU_PART_DESC,d60.SALES_ORDER,d' +
      '60.PARTS_ORDERED+d60.PARTS_RETURNED as allqty, '#13#10'd60.SCH_DATE,d6' +
      '0.REPUT_APPR_BY ,d60.PARTS_ORDERED + d60.PARTS_RETURNED - ISNULL' +
      '(d60.REPUT_APPR_BY, 0) AS CanPost,'#13#10'd97.PO_NUMBER'#13#10'FROM data0060' +
      ' d60'#13#10'INNER JOIN data0025 d25 ON d25.RKEY = d60.CUST_PART_PTR'#13#10'l' +
      'eft join data0097 d97 on d97.RKEY = d60.PURCHASE_ORDER_PTR'#13#10'WHER' +
      'E d60.STATUS in (1,4) AND d60.so_tp <> 1 and'#13#10'(isnull(d60.REPUT_' +
      'APPR_BY,0) < d60.PARTS_ORDERED + d60.PARTS_RETURNED) AND d60.RKE' +
      'Y = :P1'#13#10'ORDER by SALES_ORDER ASC ,SCH_DATE asc'
    Parameters = <
      item
        Name = 'P1'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 288
    Top = 185
    object ads60MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ads60SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ads60allqty: TFloatField
      FieldName = 'allqty'
      ReadOnly = True
    end
    object ads60SCH_DATE: TDateTimeField
      FieldName = 'SCH_DATE'
    end
    object ads60REPUT_APPR_BY: TIntegerField
      FieldName = 'REPUT_APPR_BY'
    end
    object ads60MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ads60CanPost: TFloatField
      FieldName = 'CanPost'
      ReadOnly = True
    end
    object strngfldads60PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 32
    end
  end
  object ds60: TDataSource
    DataSet = ads60
    Left = 336
    Top = 185
  end
end
