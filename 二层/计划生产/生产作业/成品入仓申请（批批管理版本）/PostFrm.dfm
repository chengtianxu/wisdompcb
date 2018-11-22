object frmPost: TfrmPost
  Left = 151
  Top = 126
  Width = 857
  Height = 647
  Caption = #25552#20132#20837#20179
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 841
    Height = 113
    Align = alTop
    TabOrder = 0
    object lbl4: TLabel
      Left = 145
      Top = 11
      Width = 80
      Height = 21
      Align = alCustom
      Caption = #26412#21378#32534#21495#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
    end
    object lbl1: TLabel
      Left = 145
      Top = 46
      Width = 80
      Height = 21
      Align = alCustom
      Caption = #25552#20132#25968#37327#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
    end
    object lbl5: TLabel
      Left = 334
      Top = 45
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
    object lbl6: TLabel
      Left = 478
      Top = 45
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
      Visible = False
    end
    object lbl8: TLabel
      Left = 145
      Top = 78
      Width = 80
      Height = 21
      Align = alCustom
      Caption = #22791#27880#20869#23481#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
    end
    object lbl7: TLabel
      Left = 521
      Top = 78
      Width = 48
      Height = 21
      Align = alCustom
      Caption = #37325#37327#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
    end
    object lblErrNote: TLabel
      Left = 518
      Top = 0
      Width = 299
      Height = 81
      Align = alCustom
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -29
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object lblWS: TLabel
      Left = 6
      Top = 8
      Width = 131
      Height = 81
      Align = alCustom
      AutoSize = False
      Caption = #23614#25968
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -29
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      WordWrap = True
    end
    object lbl11: TLabel
      Left = 529
      Top = 13
      Width = 36
      Height = 13
      Caption = #21608#26399#65306
    end
    object edtmanupart: TEdit
      Left = 240
      Top = 9
      Width = 265
      Height = 21
      TabStop = False
      ParentColor = True
      ReadOnly = True
      TabOrder = 4
    end
    object edtpcs: TEdit
      Left = 240
      Top = 38
      Width = 89
      Height = 33
      Color = 16777088
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '0'
      OnExit = edtpcsExit
      OnKeyPress = edtpcsKeyPress
    end
    object edtpnl: TEdit
      Left = 384
      Top = 38
      Width = 89
      Height = 33
      Color = clAqua
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0'
      Visible = False
      OnKeyPress = edtpcsKeyPress
    end
    object edtbaknote: TEdit
      Left = 240
      Top = 78
      Width = 265
      Height = 21
      TabOrder = 2
    end
    object edtwight: TEdit
      Left = 577
      Top = 78
      Width = 65
      Height = 21
      TabOrder = 3
      OnExit = edtwightExit
      OnKeyPress = edtwightKeyPress
    end
    object rg1: TRadioGroup
      Left = 528
      Top = 32
      Width = 129
      Height = 41
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #22909#26495
        #21449#26495)
      TabOrder = 5
    end
    object edtZQ: TEdit
      Left = 568
      Top = 8
      Width = 89
      Height = 21
      TabOrder = 6
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 113
    Width = 401
    Height = 438
    Align = alLeft
    TabOrder = 1
    object lbl2: TLabel
      Left = 1
      Top = 1
      Width = 399
      Height = 21
      Align = alTop
      Caption = #21487#29992#35746#21333
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lvPO: TListView
      Left = 1
      Top = 22
      Width = 399
      Height = 393
      Align = alClient
      Columns = <
        item
          Width = 10
        end
        item
          Caption = #35746#21333#21495
          Width = 90
        end
        item
          Caption = #22238#22797#20132#26399
          Width = 80
        end
        item
          Caption = #24635#38656
          Width = 70
        end
        item
          Caption = #21487#25552#20132
          Width = 70
        end
        item
          Caption = #26412#27425#25552#20132
          Width = 70
        end>
      ColumnClick = False
      GridLines = True
      ReadOnly = True
      RowSelect = True
      ParentColor = True
      TabOrder = 0
      TabStop = False
      ViewStyle = vsReport
      OnCustomDrawItem = lvPOCustomDrawItem
    end
    object pnl5: TPanel
      Left = 1
      Top = 415
      Width = 399
      Height = 22
      Align = alBottom
      TabOrder = 1
      object lbl9: TLabel
        Left = 270
        Top = 4
        Width = 16
        Height = 13
        Caption = 'lbl9'
        Color = clMoneyGreen
        ParentColor = False
      end
      object lbl10: TLabel
        Left = 195
        Top = 4
        Width = 22
        Height = 13
        Caption = 'lbl10'
        Color = clMoneyGreen
        ParentColor = False
      end
    end
  end
  object pnl3: TPanel
    Left = 401
    Top = 113
    Width = 440
    Height = 438
    Align = alClient
    TabOrder = 2
    object lbl3: TLabel
      Left = 1
      Top = 1
      Width = 438
      Height = 21
      Align = alTop
      Caption = #21487#29992#20316#19994#21333
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lvWO: TListView
      Left = 1
      Top = 22
      Width = 438
      Height = 393
      Align = alClient
      Columns = <
        item
          Width = 10
        end
        item
          Caption = #20316#19994#21333#21495
          Width = 130
        end
        item
          Caption = #22312#32447'PCS'
          Width = 70
        end
        item
          Caption = #22312#32447'PNL'
          Width = 70
        end
        item
          Caption = #25552#20132'PCS'
          Width = 70
        end
        item
          Caption = #25552#20132'PNL'
          Width = 80
        end>
      ColumnClick = False
      GridLines = True
      ReadOnly = True
      RowSelect = True
      ParentColor = True
      TabOrder = 0
      TabStop = False
      ViewStyle = vsReport
      OnCustomDrawItem = lvWOCustomDrawItem
    end
    object pnl6: TPanel
      Left = 1
      Top = 415
      Width = 438
      Height = 22
      Align = alBottom
      TabOrder = 1
      object lbl12: TLabel
        Left = 226
        Top = 4
        Width = 22
        Height = 13
        Caption = 'lbl12'
        Color = clMoneyGreen
        ParentColor = False
      end
      object lbl13: TLabel
        Left = 162
        Top = 4
        Width = 22
        Height = 13
        Caption = 'lbl13'
        Color = clMoneyGreen
        ParentColor = False
      end
    end
  end
  object pnl4: TPanel
    Left = 0
    Top = 551
    Width = 841
    Height = 57
    Align = alBottom
    TabOrder = 3
    object btn1: TButton
      Left = 368
      Top = 16
      Width = 75
      Height = 25
      Caption = #25552#20132
      TabOrder = 0
      OnClick = btn1Click
    end
  end
  object adsWO: TADODataSet
    Connection = dm1.con1
    CommandText = 
      'SELECT d06.WORK_ORDER_NUMBER,d56.QTY_BACKLOG,d56.PANELS,d06.RKEY' +
      ' as rkey06,d56.RKEY as rkey56,d06.PARTS_PER_PANEL  FROM Data0006' +
      ' d06'#13#10'INNER JOIN Data0056 d56 ON d06.RKEY = d56.WO_PTR'#13#10'INNER JO' +
      'IN Data0025 d25 ON d06.BOM_PTR = d25.RKEY'#13#10'WHERE (d06.PROD_STATU' +
      'S = 5) and (d06.wtype not in (2,4)) and (d56.QTY_BACKLOG - isnul' +
      'l(d06.QUAN_ALLREJ,0) > 0)'#13#10'and not exists (select 1 from data000' +
      '6 where wtype in(2,4) and from_wo_ptr = d06.rkey)'#13#10'and left(d06.' +
      'WORK_ORDER_NUMBER,1) <> '#39'W'#39#13#10'and d25.MANU_PART_NUMBER LIKE :p1'#13#10 +
      'order by d06.WORK_ORDER_NUMBER asc'
    Parameters = <
      item
        Name = 'p1'
        Size = -1
        Value = Null
      end>
    Left = 568
    Top = 257
    object adsWOWORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object adsWOQTY_BACKLOG: TFloatField
      FieldName = 'QTY_BACKLOG'
    end
    object adsWOPANELS: TIntegerField
      FieldName = 'PANELS'
    end
    object adsWOrkey06: TAutoIncField
      FieldName = 'rkey06'
      ReadOnly = True
    end
    object adsWOrkey56: TAutoIncField
      FieldName = 'rkey56'
      ReadOnly = True
    end
    object adsWOPARTS_PER_PANEL: TFloatField
      FieldName = 'PARTS_PER_PANEL'
    end
  end
  object adsPO: TADODataSet
    Connection = dm1.con1
    CommandText = 
      #13#10'SELECT d60.SCH_DATE,d60.SALES_ORDER,d60.PARTS_ORDERED + d60.PA' +
      'RTS_RETURNED AS AlsoNeed,d60.COMMISION_ON_TOOLING,'#13#10'd60.PARTS_OR' +
      'DERED + d60.PARTS_RETURNED - ISNULL(d60.REPUT_APPR_BY, 0) AS Can' +
      'Post,REPUT_APPR_BY, '#13#10'd60.RKEY AS rkey60'#13#10'FROM data0060 d60'#13#10'inn' +
      'er join data0025 d25 on d60.CUST_PART_PTR = d25.rkey '#13#10'where (d6' +
      '0.so_tp <> 1) and (d60.status in (1,4)) and (ISNULL(d60.REPUT_AP' +
      'PR_BY, 0) < (d60.PARTS_ORDERED + d60.PARTS_RETURNED))'#13#10'AND d25.M' +
      'ANU_PART_NUMBER LIKE :p1'#13#10'order by d60.SCH_DATE asc,d60.SALES_OR' +
      'DER asc'
    Parameters = <
      item
        Name = 'p1'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    Left = 160
    Top = 257
    object adsPOSCH_DATE: TDateTimeField
      FieldName = 'SCH_DATE'
    end
    object adsPOSALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object adsPOAlsoNeed: TFloatField
      FieldName = 'AlsoNeed'
      ReadOnly = True
    end
    object adsPOCanPost: TFloatField
      FieldName = 'CanPost'
      ReadOnly = True
    end
    object adsPOREPUT_APPR_BY: TIntegerField
      FieldName = 'REPUT_APPR_BY'
    end
    object adsPOrkey60: TAutoIncField
      FieldName = 'rkey60'
      ReadOnly = True
    end
    object adsPOCOMMISION_ON_TOOLING: TStringField
      FieldName = 'COMMISION_ON_TOOLING'
      FixedChar = True
      Size = 1
    end
  end
end
