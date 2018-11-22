object Form_overdue: TForm_overdue
  Left = 207
  Top = 211
  Width = 696
  Height = 480
  Caption = #33258#21160#36807#26399#30340#25253#20215#21333
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 688
    Height = 412
    Align = alClient
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'TNUMBER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REF_PART_NO'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_PART_NO'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_NAME'
        Width = 163
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quote_taxprice'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_RATE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vatax'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MARKUP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTE_DATE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXPIRATION_DATE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = #31867#22411
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29366#24577
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALES_REP_NAME'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'product_name'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTE_APPROV_DESC'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ROW_NAME'
        Width = 91
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 412
    Width = 688
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TButton
      Left = 288
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object CheckBox1: TCheckBox
      Left = 32
      Top = 8
      Width = 169
      Height = 17
      Caption = #33258#21160#26356#26032#24050#36807#26399#30340#25253#20215#21333
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS85
    Left = 48
    Top = 260
  end
  object ADS85: TADODataSet
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT Data0085.TNUMBER, Data0085.REF_PART_NO, '#13#10'      Data0085.' +
      'CUST_PART_NO, Data0085.CUST_NAME, '#13#10'      Data0085.quote_taxpric' +
      'e, Data0001.CURR_NAME, data0001.curr_code,'#13#10'      Data0085.CURR_' +
      'RATE, Data0085.vatax, Data0085.MARKUP, '#13#10'      Data0085.QTE_DATE' +
      ', Data0085.EXPIRATION_DATE, '#13#10'      Data0005.EMPLOYEE_NAME, t5_1' +
      '.EMPL_CODE as REP_CODE,'#13#10'     t5_1.EMPLOYEE_NAME as SALES_REP_NA' +
      'ME,data0008.prod_code,'#13#10'     data0008.product_name,data0264.code' +
      ',data0264.QTE_APPROV_DESC,'#13#10'    data0346.ROW_NAME,data0085.QBY_E' +
      'MPL_PTR,'#13#10'case Data0085.ttype2 when 0 then '#39#26032#21333#39' when 1 then '#39#26356#25913#24037 +
      #33402#39' '#13#10'when 2 then '#39#26448#26009#35843#20215#39' when 3 then '#39#20854#23427#39' end as '#31867#22411','#13#10'case Data00' +
      '85.AUDITED_STATUS when 0 then '#39#26410#25552#20132#39#13#10'when 1 then '#39#24453#23457#25209#39' when 2 th' +
      'en '#39#24050#36807#26399#39' '#13#10'when 3 then '#39#24050#23457#25209#39' when 4 then '#39#34987#36864#22238#39' end as '#29366#24577#13#10#13#10'FROM' +
      ' dbo.Data0085 INNER JOIN'#13#10'      Data0005 ON dbo.Data0085.QBY_EMP' +
      'L_PTR = dbo.Data0005.RKEY INNER JOIN'#13#10'      Data0001 ON dbo.Data' +
      '0085.CURR_PTR = dbo.Data0001.RKEY inner join'#13#10'      data0005 t5_' +
      '1 on data0085.srep_ptr = t5_1.rkey inner join '#13#10'      data0008 o' +
      'n data0085.PROD_CODE_PTR=data0008.rkey inner join '#13#10'      data02' +
      '64 on data0085.PROD_ROUTE_PTR=data0264.rkey inner join '#13#10'      d' +
      'ata0346 on data0085.ENGR_ROUTE_PTR=data0346.rkey'#13#10'where data0085' +
      '.ttype=0 and'#13#10'          data0085.AUDITED_STATUS=3 and'#13#10'         ' +
      ' data0085.expiration_date < :taday_date'
    IndexFieldNames = 'TNUMBER'
    Parameters = <
      item
        Name = 'taday_date'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 39142d
      end>
    Left = 80
    Top = 260
    object ADS85TNUMBER: TStringField
      DisplayLabel = #25253#20215#21333#21495
      DisplayWidth = 10
      FieldName = 'TNUMBER'
      Size = 10
    end
    object ADS85REF_PART_NO: TStringField
      DisplayLabel = #26412#21378#32534#21495
      DisplayWidth = 12
      FieldName = 'REF_PART_NO'
    end
    object ADS85CUST_PART_NO: TStringField
      DisplayLabel = #23458#25143#22411#21495
      DisplayWidth = 14
      FieldName = 'CUST_PART_NO'
      Size = 40
    end
    object ADS85CUST_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      DisplayWidth = 25
      FieldName = 'CUST_NAME'
      Size = 100
    end
    object ADS85quote_taxprice: TFloatField
      DisplayLabel = #21333#20215'('#21547#31246')'
      DisplayWidth = 8
      FieldName = 'quote_taxprice'
    end
    object ADS85curr_code: TStringField
      FieldName = 'curr_code'
      Size = 5
    end
    object ADS85CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      DisplayWidth = 8
      FieldName = 'CURR_NAME'
    end
    object ADS85CURR_RATE: TFloatField
      DisplayLabel = #27719#29575
      DisplayWidth = 6
      FieldName = 'CURR_RATE'
    end
    object ADS85vatax: TBCDField
      DisplayLabel = #22686#20540#31246'%'
      DisplayWidth = 7
      FieldName = 'vatax'
      Precision = 5
      Size = 2
    end
    object ADS85MARKUP: TFloatField
      DisplayLabel = #25240#35753#29575'%'
      DisplayWidth = 10
      FieldName = 'MARKUP'
    end
    object ADS85QTE_DATE: TDateTimeField
      DisplayLabel = #25253#20215#26085#26399
      DisplayWidth = 10
      FieldName = 'QTE_DATE'
    end
    object ADS85EXPIRATION_DATE: TDateTimeField
      DisplayLabel = #26377#25928#26399
      DisplayWidth = 12
      FieldName = 'EXPIRATION_DATE'
    end
    object ADS85EMPLOYEE_NAME: TStringField
      DisplayLabel = #25253#20215#20154#21592
      DisplayWidth = 10
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS85DSDesigner: TStringField
      DisplayWidth = 8
      FieldName = #31867#22411
      ReadOnly = True
      Size = 8
    end
    object ADS85DSDesigner2: TStringField
      DisplayWidth = 6
      FieldName = #29366#24577
      ReadOnly = True
      Size = 6
    end
    object ADS85REP_CODE: TStringField
      FieldName = 'REP_CODE'
      Size = 5
    end
    object ADS85SALES_REP_NAME: TStringField
      DisplayLabel = #19994#21153#21592
      FieldName = 'SALES_REP_NAME'
    end
    object ADS85prod_code: TStringField
      FieldName = 'prod_code'
      Size = 10
    end
    object ADS85product_name: TStringField
      DisplayLabel = #20135#21697#31867#22411
      FieldName = 'product_name'
      Size = 30
    end
    object ADS85code: TStringField
      DisplayLabel = #23457#25209#27969#31243#20195#30721
      FieldName = 'code'
      Size = 10
    end
    object ADS85QTE_APPROV_DESC: TStringField
      DisplayLabel = #23457#25209#27969#31243#25551#36848
      FieldName = 'QTE_APPROV_DESC'
      Size = 40
    end
    object ADS85ROW_NAME: TStringField
      DisplayLabel = #22522#20215#21517#31216
      FieldName = 'ROW_NAME'
      Size = 30
    end
    object ADS85QBY_EMPL_PTR: TIntegerField
      FieldName = 'QBY_EMPL_PTR'
    end
  end
end
