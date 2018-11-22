object searchso_Form: Tsearchso_Form
  Left = 262
  Top = 187
  Width = 787
  Height = 541
  Caption = #38144#21806#35746#21333#26597#25214
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 457
    Width = 771
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      771
      46)
    object Label2: TLabel
      Left = 16
      Top = 5
      Width = 72
      Height = 13
      Caption = #19979#21333#26085#26399#20174':'
    end
    object Label3: TLabel
      Left = 66
      Top = 29
      Width = 20
      Height = 13
      Caption = #21040':'
    end
    object Button1: TButton
      Left = 279
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 383
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akTop]
      Cancel = True
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
    object CheckBox6: TCheckBox
      Left = 501
      Top = 7
      Width = 62
      Height = 17
      Anchors = [akTop]
      Caption = #26410#25552#20132
      TabOrder = 2
      OnClick = CheckBox1Click
    end
    object CheckBox1: TCheckBox
      Left = 576
      Top = 6
      Width = 65
      Height = 17
      Anchors = [akTop]
      Caption = #26377#25928#30340
      Checked = True
      State = cbChecked
      TabOrder = 3
      OnClick = CheckBox1Click
    end
    object CheckBox2: TCheckBox
      Left = 645
      Top = 6
      Width = 51
      Height = 17
      Anchors = [akTop]
      Caption = #26242#32531
      TabOrder = 4
      OnClick = CheckBox1Click
    end
    object CheckBox3: TCheckBox
      Left = 501
      Top = 25
      Width = 62
      Height = 17
      Anchors = [akTop]
      Caption = #24050#20851#38381
      TabOrder = 5
      OnClick = CheckBox1Click
    end
    object CheckBox4: TCheckBox
      Left = 576
      Top = 24
      Width = 65
      Height = 17
      Anchors = [akTop]
      Caption = #24050#23436#25104
      TabOrder = 6
      OnClick = CheckBox1Click
    end
    object CheckBox5: TCheckBox
      Left = 645
      Top = 25
      Width = 62
      Height = 17
      Anchors = [akTop]
      Caption = #24050#21462#28040
      TabOrder = 7
      OnClick = CheckBox1Click
    end
    object dtpk1: TDateTimePicker
      Left = 88
      Top = 1
      Width = 109
      Height = 21
      Date = 39301.000000000000000000
      Time = 39301.000000000000000000
      TabOrder = 8
      OnCloseUp = dtpk1Exit
      OnExit = dtpk1Exit
    end
    object dtpk2: TDateTimePicker
      Left = 88
      Top = 25
      Width = 110
      Height = 21
      Date = 39301.000000000000000000
      Time = 39301.000000000000000000
      TabOrder = 9
      OnCloseUp = dtpk1Exit
      OnExit = dtpk1Exit
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 771
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 176
      Top = 17
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = #23458#25143#35746#21333#21495
    end
    object Edit1: TEdit
      Left = 250
      Top = 13
      Width = 197
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
      OnKeyDown = DBGrid1KeyDown
    end
    object BitBtn1: TBitBtn
      Left = 452
      Top = 11
      Width = 25
      Height = 25
      Hint = #21047#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = False
      OnClick = BitBtn1Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADABFBFBDADADADADADDADADBFADADADADAADADAD000DADADADDADAD0FBF0DA
        DADAADAD0F7FBF0DADADDAD0F7F87BF0DADAAD0F7F87BFB70DADD0F7F87BFB78
        80DA000F87BFB78880ADDAD00BFB78880ADAADADA0B7888740ADDADADA088804
        440AADADADA000A04440DADADADADADA0440ADADADADADADA00D}
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 40
    Width = 771
    Height = 417
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'SALES_ORDER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_CODE'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Title.Color = clRed
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Width = 149
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANALYSIS_CODE_2'
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PARTS_ORDERED'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'weijao_qty'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCE_NUMBER'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SCH_DATE'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_status'
        Visible = True
      end>
  end
  object ADS60: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.Data0060.RKEY, dbo.Data0060.SALES_ORDER, dbo.Data' +
      '0060.PARTS_ORDERED, '#13#10'                      CASE dbo.Data0060.ST' +
      'ATUS WHEN 1 THEN '#39#26377#25928#30340#39' WHEN 2 THEN '#39#26242#32531#39' '#13#10'WHEN 3 THEN '#39#24050#20851#38381#39' WHEN' +
      ' 4 THEN '#39#24050#23436#25104#39' WHEN 5 THEN '#39#24050#21462#28040#39' WHEN 6 THEN '#39#26410#25552#20132#39#13#10'             ' +
      '          END AS v_status, dbo.Data0060.SCH_DATE, dbo.Data0097.P' +
      'O_NUMBER,'#13#10' dbo.Data0010.ABBR_NAME, dbo.Data0010.CUST_CODE, '#13#10'  ' +
      '                    dbo.Data0025.MANU_PART_DESC, dbo.Data0025.MA' +
      'NU_PART_NUMBER,'#13#10' dbo.Data0060.REFERENCE_NUMBER, dbo.Data0025.AN' +
      'ALYSIS_CODE_2,'#13#10'data0060.PARTS_ORDERED-data0060.parts_shipped+da' +
      'ta0060.PARTS_RETURNED-'#13#10'                            data0060.RET' +
      'URNED_SHIP as weijao_qty'#13#10'FROM         dbo.Data0060 INNER JOIN'#13#10 +
      '                      dbo.Data0010 ON dbo.Data0060.CUSTOMER_PTR ' +
      '= dbo.Data0010.RKEY INNER JOIN'#13#10'                      dbo.Data00' +
      '97 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY INNER ' +
      'JOIN'#13#10'                      dbo.Data0025 ON dbo.Data0060.CUST_PA' +
      'RT_PTR = dbo.Data0025.RKEY'#13#10'WHERE     (dbo.Data0060.PROD_REL <> ' +
      #39'1'#39') AND'#13#10' (dbo.Data0060.ENT_DATE >= :dtpk1) AND'#13#10' (dbo.Data0060' +
      '.ENT_DATE <= :dtpk2) and'#13#10' (Data0060.STATUS <> :v1) AND (Data006' +
      '0.STATUS <> :v2) and'#13#10' (Data0060.STATUS <> :v3) AND (Data0060.ST' +
      'ATUS <> :v4) and'#13#10' (Data0060.STATUS <> :v5) AND (Data0060.STATUS' +
      ' <> :v6)'
    IndexFieldNames = 'PO_NUMBER'
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 39814d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 39845d
      end
      item
        Name = 'v1'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 0
      end
      item
        Name = 'v2'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 2
      end
      item
        Name = 'v3'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 3
      end
      item
        Name = 'v4'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 4
      end
      item
        Name = 'v5'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 5
      end
      item
        Name = 'v6'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 6
      end>
    Left = 160
    Top = 176
    object ADS60RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS60SALES_ORDER: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADS60PARTS_ORDERED: TFloatField
      DisplayLabel = #35746#21333#25968#37327
      FieldName = 'PARTS_ORDERED'
    end
    object ADS60v_status: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'v_status'
      ReadOnly = True
      Size = 6
    end
    object ADS60SCH_DATE: TDateTimeField
      DisplayLabel = #22238#22797#20132#26399
      FieldName = 'SCH_DATE'
    end
    object ADS60PO_NUMBER: TStringField
      DisplayLabel = #23458#25143#35746#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADS60ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADS60CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADS60MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADS60MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADS60REFERENCE_NUMBER: TStringField
      DisplayLabel = #35746#21333#21442#25968
      FieldName = 'REFERENCE_NUMBER'
      Size = 30
    end
    object ADS60ANALYSIS_CODE_2: TStringField
      DisplayLabel = #23458#25143#29289#26009#21495
      DisplayWidth = 20
      FieldName = 'ANALYSIS_CODE_2'
      Size = 50
    end
    object ADS60weijao_qty: TFloatField
      DisplayLabel = #27424#36135#25968#37327
      FieldName = 'weijao_qty'
      ReadOnly = True
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS60
    OnDataChange = DataSource1DataChange
    Left = 120
    Top = 176
  end
end
