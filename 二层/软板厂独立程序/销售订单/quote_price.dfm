object Form12: TForm12
  Left = 428
  Top = 150
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25253#20215#21333#26597#35810
  ClientHeight = 508
  ClientWidth = 893
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 71
    Top = 18
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = #25253#20215#21333#21495
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 59
    Width = 893
    Height = 408
    Align = alBottom
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = Button1Click
    Columns = <
      item
        Expanded = False
        FieldName = 'TNUMBER'
        Title.Caption = #25253#20215#21333#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ttype'
        Title.Caption = #38144#21806#26041#24335
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_NAME'
        Title.Caption = #23458#25143#21517#31216
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ref_part_no'
        Title.Caption = #26412#21378#32534#21495
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_PART_NO'
        Title.Caption = #23458#20135#21697#22411#21495
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Title.Caption = #36135#24065
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qte_unit'
        Title.Caption = #25253#20215#21333#20803
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quote_price'
        Title.Caption = #19981#21547#31246#20215#26684
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quote_taxprice'
        Title.Caption = #21547#31246#20215
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vatax'
        Title.Caption = #22686#20540#31246'%'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cost'
        Title.Caption = #26448#26009#36153#29992#21512#35745
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'V_tax'
        Title.Caption = #25253#20215#21333#20215
        Width = 100
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 127
    Top = 15
    Width = 121
    Height = 21
    TabOrder = 1
    OnChange = Edit1Change
    OnKeyDown = Edit1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 253
    Top = 11
    Width = 28
    Height = 28
    Hint = #21047#26032
    TabOrder = 2
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
  object RadioGroup1: TRadioGroup
    Left = 288
    Top = 0
    Width = 185
    Height = 47
    Caption = #26597#25214#23383#27573
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #25253#20215#21333#21495
      #20135#21697#22411#21495)
    TabOrder = 3
    OnClick = RadioGroup1Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 467
    Width = 893
    Height = 41
    Align = alBottom
    TabOrder = 4
    object Button1: TButton
      Left = 194
      Top = 10
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 353
      Top = 10
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = aq85
    Left = 328
    Top = 368
  end
  object aq85s: TADOStoredProc
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = aq85sCalcFields
    ProcedureName = 'ep032;2'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@part_number'
        Attributes = [paNullable]
        DataType = ftString
        Size = 40
        Value = Null
      end>
    Left = 360
    Top = 368
    object aq85sRKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aq85sTNUMBER: TStringField
      DisplayLabel = #25253#20215#21333#21495
      FieldName = 'TNUMBER'
      FixedChar = True
      Size = 10
    end
    object aq85sCUST_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'CUST_NAME'
      FixedChar = True
      Size = 30
    end
    object aq85sCUST_PART_NO: TStringField
      DisplayLabel = #20135#21697#22411#21495
      DisplayWidth = 40
      FieldName = 'CUST_PART_NO'
      Size = 80
    end
    object aq85sQuote_type: TSmallintField
      FieldName = 'Quote_type'
    end
    object aq85sttype: TStringField
      DisplayLabel = #38144#21806#26041#24335
      FieldKind = fkCalculated
      FieldName = 'ttype'
      Size = 8
      Calculated = True
    end
    object aq85squote_price: TFloatField
      DisplayLabel = #19981#21547#31246#20215
      FieldName = 'quote_price'
    end
    object aq85squote_taxprice: TFloatField
      DisplayLabel = #21547#31246#20215
      FieldName = 'quote_taxprice'
    end
    object aq85sCURR_RATE: TFloatField
      FieldName = 'CURR_RATE'
    end
    object aq85sCURR_NAME: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
    end
    object aq85sEMPLOYEE_NAME: TStringField
      DisplayLabel = #25253#20215#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object aq85sQTE_UNIT_PTR: TIntegerField
      FieldName = 'QTE_UNIT_PTR'
    end
    object aq85sTUNITS: TIntegerField
      FieldName = 'TUNITS'
    end
    object aq85svatax: TBCDField
      DisplayLabel = #22686#20540#31246'%'
      FieldName = 'vatax'
      Precision = 5
      Size = 2
    end
    object aq85sqte_unit: TStringField
      DisplayLabel = #25253#20215#21333#20803
      FieldKind = fkCalculated
      FieldName = 'qte_unit'
      Size = 6
      Calculated = True
    end
    object aq85sCURR_PTR: TIntegerField
      FieldName = 'CURR_PTR'
    end
    object aq85sref_part_no: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'ref_part_no'
    end
  end
  object aq85: TADOQuery
    Connection = dm.ADOConnection1
    OnCalcFields = aq85CalcFields
    Parameters = <
      item
        Name = 'part_number'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 40
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT dbo.Data0085.RKEY, dbo.Data0085.TNUMBER, dbo.Data0085.CUS' +
        'T_NAME, '
      '      dbo.Data0085.CUST_PART_NO, dbo.Data0085.QUOTE_TYPE, '
      
        '      dbo.Data0085.quote_price, dbo.Data0085.quote_taxprice, dbo' +
        '.Data0085.vatax, '
      '      dbo.Data0085.CURR_RATE, dbo.Data0001.CURR_NAME, '
      '      dbo.Data0005.EMPLOYEE_NAME, dbo.Data0085.QTE_UNIT_PTR, '
      '      dbo.Data0085.TUNITS, dbo.Data0085.TTYPE,Data0085.CURR_PTR,'
      
        '      data0085.ref_part_no,IsNull(d8501.cost,0) as cost,Data0010' +
        '.EDI_FLAG_FOR_INVOICE,'
      
        '      Round(case Data0010.EDI_FLAG_FOR_INVOICE when 0 then (case' +
        ' Data0085.QTE_UNIT_PTR when 1 then ((Data0085.quote_taxprice+d85' +
        '01.cost)/((100+Data0085.vatax)/100)) '
      
        '      else (((Data0085.quote_taxprice+d8501.cost)/((100+Data0085' +
        '.vatax)/100))/Data0085.TUNITS) end ) '
      
        '      else (case Data0085.QTE_UNIT_PTR when 1 then (Data0085.quo' +
        'te_taxprice+d8501.cost) else ((Data0085.quote_taxprice+d8501.cos' +
        't)/Data0085.TUNITS) end) end,7) as V_tax'
      'FROM dbo.Data0085 INNER JOIN'
      
        '      dbo.Data0001 ON dbo.Data0085.CURR_PTR = dbo.Data0001.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0005 ON dbo.Data0085.QBY_EMPL_PTR = dbo.Data0005.R' +
        'KEY inner join'
      '      data0010 on data0085.CUST_PTR=data0010.rkey left join '
      '      ('
      '        select Data0085.TNUMBER,SUM(cost) as cost '
      '        from Data008501 inner join '
      '        Data0085 on Data008501.D0085_Ptr=Data0085.RKEY '
      '        group by Data0085.TNUMBER'
      '       ) d8501 on d8501.TNUMBER=Data0085.TNUMBER'
      'where data0085.audited_status=3 and'
      
        '      data0085.expiration_date >= convert(datetime,convert(varch' +
        'ar,getdate(),101),101) and'
      'Data0085.CUST_PART_NO=:part_number')
    Left = 424
    Top = 368
    object aq85RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aq85TNUMBER: TStringField
      FieldName = 'TNUMBER'
      Size = 10
    end
    object aq85CUST_NAME: TStringField
      FieldName = 'CUST_NAME'
      Size = 100
    end
    object aq85CUST_PART_NO: TStringField
      FieldName = 'CUST_PART_NO'
      Size = 40
    end
    object aq85QUOTE_TYPE: TSmallintField
      FieldName = 'QUOTE_TYPE'
    end
    object aq85vatax: TBCDField
      FieldName = 'vatax'
      Precision = 5
      Size = 2
    end
    object aq85CURR_RATE: TFloatField
      FieldName = 'CURR_RATE'
    end
    object aq85CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object aq85EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object aq85QTE_UNIT_PTR: TIntegerField
      FieldName = 'QTE_UNIT_PTR'
    end
    object aq85TUNITS: TIntegerField
      FieldName = 'TUNITS'
    end
    object aq85CURR_PTR: TIntegerField
      FieldName = 'CURR_PTR'
    end
    object aq85ref_part_no: TStringField
      FieldName = 'ref_part_no'
    end
    object aq85cost: TFloatField
      FieldName = 'cost'
      ReadOnly = True
    end
    object aq85EDI_FLAG_FOR_INVOICE: TSmallintField
      FieldName = 'EDI_FLAG_FOR_INVOICE'
    end
    object aq85V_tax: TFloatField
      FieldName = 'V_tax'
      ReadOnly = True
    end
    object aq85ttype: TStringField
      FieldKind = fkCalculated
      FieldName = 'ttype'
      Calculated = True
    end
    object aq85qte_unit: TStringField
      FieldKind = fkCalculated
      FieldName = 'qte_unit'
      Calculated = True
    end
    object aq85quote_price: TFloatField
      FieldName = 'quote_price'
      DisplayFormat = '#0.000000'
    end
    object aq85quote_taxprice: TFloatField
      FieldName = 'quote_taxprice'
    end
  end
end
