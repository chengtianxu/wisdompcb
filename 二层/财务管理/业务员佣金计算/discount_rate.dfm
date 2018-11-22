object Form_discountrate: TForm_discountrate
  Left = 223
  Top = 178
  Width = 870
  Height = 557
  Caption = #21152#26435#24179#22343#25240#29575#35745#31639
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
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 48
    Width = 854
    Height = 430
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    Columns = <
      item
        Checkboxes = True
        EditButtons = <>
        FieldName = 'isSel'
        Footers = <>
        Title.Caption = #36873#25321
        Width = 44
        OnUpdateData = DBGridEh1Columns0UpdateData
      end
      item
        EditButtons = <>
        FieldName = 'delivery_no'
        Footers = <>
        ReadOnly = True
        Title.Caption = #35013#31665#21333#21495
        Width = 75
      end
      item
        EditButtons = <>
        FieldName = 'invoice_number'
        Footers = <>
        ReadOnly = True
        Title.Caption = #21457#31080#21495
      end
      item
        EditButtons = <>
        FieldName = 'SALES_ORDER'
        Footers = <>
        ReadOnly = True
        Title.Caption = #38144#21806#35746#21333
        Width = 87
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_NUMBER'
        Footers = <>
        ReadOnly = True
        Title.Caption = #26412#21378#32534#21495
        Width = 83
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_DESC'
        Footers = <>
        ReadOnly = True
        Title.Caption = #23458#25143#22411#21495
        Width = 132
      end
      item
        EditButtons = <>
        FieldName = 'LAYERS'
        Footers = <>
        Title.Caption = #23618#25968
        Width = 43
      end
      item
        EditButtons = <>
        FieldName = 'PO_NUMBER'
        Footers = <>
        ReadOnly = True
        Title.Caption = #23458#25143#35746#21333#21495
        Width = 85
      end
      item
        EditButtons = <>
        FieldName = 'DATE_SHIPPED'
        Footers = <>
        ReadOnly = True
        Title.Caption = #20986#36135#26085#26399
        Width = 79
      end
      item
        EditButtons = <>
        FieldName = 'QUAN_SHIPPED'
        Footers = <>
        ReadOnly = True
        Title.Caption = #35013#36816#25968#37327
        Width = 62
      end
      item
        DisplayFormat = '0.00'
        EditButtons = <>
        FieldName = 'MARKUP'
        Footers = <>
        ReadOnly = True
        Title.Caption = #25240#29575'%'
        Width = 48
      end
      item
        EditButtons = <>
        FieldName = 'TNUMBER'
        Footers = <>
        ReadOnly = True
        Title.Caption = #25253#20215#21333#21495
      end
      item
        EditButtons = <>
        FieldName = 'part_price'
        Footers = <>
        ReadOnly = True
        Title.Caption = #20215#26684
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'CURR_NAME'
        Footers = <>
        ReadOnly = True
        Title.Caption = #36135#24065
        Width = 49
      end
      item
        EditButtons = <>
        FieldName = 'EXCH_RATE'
        Footers = <>
        ReadOnly = True
        Title.Caption = #27719#29575
        Width = 44
      end
      item
        DisplayFormat = '0.00'
        EditButtons = <>
        FieldName = 'amount'
        Footers = <>
        Title.Caption = #37329#39069
        Width = 76
      end
      item
        EditButtons = <>
        FieldName = 'PRODUCT_NAME'
        Footers = <>
        Title.Caption = #20135#21697#31867#22411
        Width = 115
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 854
    Height = 48
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object RadioGroup1: TRadioGroup
      Left = 0
      Top = 0
      Width = 254
      Height = 48
      Align = alLeft
      Caption = #25240#29575#35745#31639#26041#27861
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #25353#21457#31080#21152#26435#35745#31639
        #25353#20986#36135#21152#26435#35745#31639)
      TabOrder = 0
      OnClick = RadioGroup1Click
    end
    object Panel2: TPanel
      Left = 254
      Top = 0
      Width = 201
      Height = 48
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      Visible = False
      object Label2: TLabel
        Left = 8
        Top = 27
        Width = 20
        Height = 13
        Caption = #21040':'
      end
      object Label1: TLabel
        Left = 8
        Top = 7
        Width = 20
        Height = 13
        Caption = #20174':'
      end
      object dtpk1: TDateTimePicker
        Left = 29
        Top = 3
        Width = 112
        Height = 21
        Date = 40353.000000000000000000
        Time = 40353.000000000000000000
        TabOrder = 0
      end
      object dtpk2: TDateTimePicker
        Left = 29
        Top = 24
        Width = 112
        Height = 21
        Date = 40353.000000000000000000
        Time = 40353.000000000000000000
        TabOrder = 1
      end
      object BitBtn1: TBitBtn
        Left = 152
        Top = 16
        Width = 27
        Height = 27
        TabOrder = 2
        OnClick = BitBtn1Click
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000A40E0000A40E00000001000000000000000000003300
          00006600000099000000CC000000FF0000000033000033330000663300009933
          0000CC330000FF33000000660000336600006666000099660000CC660000FF66
          000000990000339900006699000099990000CC990000FF99000000CC000033CC
          000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
          0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
          330000333300333333006633330099333300CC333300FF333300006633003366
          33006666330099663300CC663300FF6633000099330033993300669933009999
          3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
          330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
          66006600660099006600CC006600FF0066000033660033336600663366009933
          6600CC336600FF33660000666600336666006666660099666600CC666600FF66
          660000996600339966006699660099996600CC996600FF99660000CC660033CC
          660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
          6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
          990000339900333399006633990099339900CC339900FF339900006699003366
          99006666990099669900CC669900FF6699000099990033999900669999009999
          9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
          990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
          CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
          CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
          CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
          CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
          CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
          FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
          FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
          FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
          FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
          000000808000800000008000800080800000C0C0C00080808000191919004C4C
          4C00B2B2B200E5E5E5005A1E1E00783C3C0096646400C8969600FFC8C800465F
          82005591B9006EB9D7008CD2E600B4E6F000D8E9EC0099A8AC00646F7100E2EF
          F100C56A31000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000EEEEEEEEEEEE
          EEEEEEEEEEEEEE820982EEEEEEEEEEEEEEEEEEEEEEEEEEAC81ACEE5E5E5E5E5E
          5E5E5E5E5E5E82090909EE8181818181818181818181AC818181EE5ED7D7D7D7
          D7D7D7D7D7DF09090982EE81D7D7D7D7D7D7D7D7D7DF818181ACEE5ED7E3E3E3
          E3E35E5E5E09090982EEEE81D7E3E3E3E3E3DFDFDF818181ACEEEE5ED7D7D7D7
          E35EB3B3D7880982EEEEEE81D7D7D7D7E381E3E3D7E381ACEEEEEE5ED7E3E3E3
          89B3B3B3B3D75EEEEEEEEE81D7E3E3E381E3E3E3E3D756EEEEEEEE5ED7D7D7D7
          89B3D7B3B3B35EEEEEEEEE81D7D7D7D781E3D7E3E3E356EEEEEEEE5ED7E3E3E3
          89B3D7D7B3B35EEEEEEEEE81D7E3E3E381E3D7D7E3E356EEEEEEEE5ED7D7D7D7
          D789B3B3B35E5EEEEEEEEE81D7D7D7D7D781E3E3E381DFEEEEEEEE5ED7E3E3E3
          E3E3898989E35EEEEEEEEE81D7E3E3E3E3E3818181E381EEEEEEEE5ED7D7D7D7
          D7D7D7D7D7D75EEEEEEEEE81D7D7D7D7D7D7D7D7D7D781EEEEEEEE5ED7E3E3E3
          E3E3D75E5E5E5EEEEEEEEE81D7E3E3E3E3E3D781818181EEEEEEEE5ED7D7D7D7
          D7D7D75EE35EEEEEEEEEEE81D7D7D7D7D7D7D781E381EEEEEEEEEE5ED7D7D7D7
          D7D7D75E5EEEEEEEEEEEEE81D7D7D7D7D7D7D78181EEEEEEEEEEEE5E5E5E5E5E
          5E5E5E5EEEEEEEEEEEEEEE818181818181818181EEEEEEEEEEEEEEEEEEEEEEEE
          EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE}
        NumGlyphs = 2
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 478
    Width = 854
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      854
      41)
    object Label3: TLabel
      Left = 81
      Top = 14
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = #21152#26435#25240#29575'%'
    end
    object CheckBox1: TCheckBox
      Left = 16
      Top = 13
      Width = 52
      Height = 17
      Caption = #20840#36873
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object BitBtn2: TBitBtn
      Left = 320
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 1
    end
    object BitBtn3: TBitBtn
      Left = 424
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Cancel = True
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 2
    end
    object Edit1: TEdit
      Left = 142
      Top = 10
      Width = 71
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 3
    end
    object BitBtn4: TBitBtn
      Left = 224
      Top = 8
      Width = 75
      Height = 25
      Caption = #23548#20986
      TabOrder = 4
      OnClick = BitBtn4Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
        EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
        DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
        70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
    end
  end
  object DataSource1: TDataSource
    DataSet = cds114
    Left = 716
    Top = 1
  end
  object ads114: TADODataSet
    Connection = DM.ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterOpen = ads114AfterOpen
    CommandText = 
      'SELECT     CAST(1 AS bit) AS isSel, dbo.data0439.delivery_no, db' +
      'o.Data0112.invoice_number,'#13#10'  dbo.Data0060.SALES_ORDER, dbo.Data' +
      '0025.MANU_PART_NUMBER, '#13#10'  dbo.Data0025.MANU_PART_DESC, dbo.Data' +
      '0097.PO_NUMBER, '#13#10'  dbo.Data0064.DATE_SHIPPED, dbo.Data0064.QUAN' +
      '_SHIPPED, dbo.Data0064.part_price, '#13#10'  dbo.Data0001.CURR_NAME, d' +
      'bo.Data0060.EXCH_RATE, '#13#10'  dbo.Data0064.QUAN_SHIPPED * dbo.Data0' +
      '064.part_price / dbo.Data0060.EXCH_RATE AS amount, '#13#10'  dbo.Data0' +
      '085.MARKUP, dbo.Data0085.TNUMBER, dbo.Data0025.LAYERS, dbo.Data0' +
      '008.PRODUCT_NAME'#13#10'FROM         dbo.Data0115 INNER JOIN'#13#10'        ' +
      '              dbo.Data0112 ON dbo.Data0115.INV_PTR = dbo.Data011' +
      '2.RKEY INNER JOIN'#13#10'                      dbo.data0439 ON dbo.Dat' +
      'a0112.RKEY = dbo.data0439.invoice_ptr INNER JOIN'#13#10'              ' +
      '        dbo.Data0064 ON dbo.data0439.rkey = dbo.Data0064.packing' +
      '_list_ptr INNER JOIN'#13#10'                      dbo.Data0060 ON dbo.' +
      'Data0064.SO_PTR = dbo.Data0060.RKEY INNER JOIN'#13#10'                ' +
      '      dbo.Data0085 ON dbo.Data0060.QTE_PTR = dbo.Data0085.RKEY I' +
      'NNER JOIN'#13#10'                      dbo.Data0025 ON dbo.Data0060.CU' +
      'ST_PART_PTR = dbo.Data0025.RKEY INNER JOIN'#13#10'                    ' +
      '  dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097' +
      '.RKEY INNER JOIN'#13#10'                      dbo.Data0001 ON dbo.Data' +
      '0060.CURRENCY_PTR = dbo.Data0001.RKEY INNER JOIN'#13#10'              ' +
      '        dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data000' +
      '8.RKEY'#13#10'WHERE    (dbo.Data0115.SRCE_PTR = :rkey114)'#13#10#13#10'union all' +
      #13#10#13#10'SELECT     CAST(1 AS bit) AS isSel, '#39#39' AS delivery_no, dbo.D' +
      'ata0112.invoice_number, '#13#10'dbo.Data0060.SALES_ORDER, dbo.Data0025' +
      '.MANU_PART_NUMBER, '#13#10'                      dbo.Data0025.MANU_PAR' +
      'T_DESC, dbo.Data0097.PO_NUMBER,'#13#10' dbo.Data0112.POSTED_DATE AS DA' +
      'TE_SHIPPED, cast(dbo.Data0060.PARTS_ORDERED as int) AS QUAN_SHIP' +
      'PED, dbo.Data0060.PART_PRICE,'#13#10' dbo.Data0001.CURR_NAME, dbo.Data' +
      '0060.EXCH_RATE, '#13#10'                      dbo.Data0112.INVOICE_TOT' +
      'AL * dbo.Data0112.EXCHANGE_RATE AS amount,'#13#10' dbo.Data0085.MARKUP' +
      ', dbo.Data0085.TNUMBER, dbo.Data0025.LAYERS, dbo.Data0008.PRODUC' +
      'T_NAME'#13#10'FROM         dbo.Data0060 INNER JOIN'#13#10'                  ' +
      '    dbo.Data0085 ON dbo.Data0060.QTE_PTR = dbo.Data0085.RKEY INN' +
      'ER JOIN'#13#10'                      dbo.Data0025 ON dbo.Data0060.CUST' +
      '_PART_PTR = dbo.Data0025.RKEY INNER JOIN'#13#10'                      ' +
      'dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.R' +
      'KEY INNER JOIN'#13#10'                      dbo.Data0001 ON dbo.Data00' +
      '60.CURRENCY_PTR = dbo.Data0001.RKEY INNER JOIN'#13#10'                ' +
      '      dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.' +
      'RKEY INNER JOIN'#13#10'                      dbo.Data0115 INNER JOIN'#13#10 +
      '                      dbo.Data0112 ON dbo.Data0115.INV_PTR = dbo' +
      '.Data0112.RKEY ON dbo.Data0060.RKEY = dbo.Data0112.sales_order_p' +
      'tr'#13#10'WHERE   (dbo.Data0115.SRCE_PTR = :rkey114_1)'#13#10
    Parameters = <
      item
        Name = 'rkey114'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 5311
      end
      item
        Name = 'rkey114_1'
        DataType = ftString
        Size = 4
        Value = '5311'
      end>
    Left = 816
    Top = 1
    object ads114delivery_no: TStringField
      FieldName = 'delivery_no'
      Size = 10
    end
    object ads114invoice_number: TStringField
      DisplayWidth = 10
      FieldName = 'invoice_number'
      FixedChar = True
      Size = 12
    end
    object ads114SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ads114MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ads114MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ads114PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ads114DATE_SHIPPED: TDateTimeField
      FieldName = 'DATE_SHIPPED'
    end
    object ads114QUAN_SHIPPED: TIntegerField
      FieldName = 'QUAN_SHIPPED'
    end
    object ads114part_price: TFloatField
      FieldName = 'part_price'
    end
    object ads114CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object ads114EXCH_RATE: TFloatField
      FieldName = 'EXCH_RATE'
    end
    object ads114amount: TFloatField
      FieldName = 'amount'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object ads114MARKUP: TFloatField
      FieldName = 'MARKUP'
    end
    object ads114TNUMBER: TStringField
      FieldName = 'TNUMBER'
      Size = 10
    end
    object ads114isSel: TBooleanField
      FieldName = 'isSel'
    end
    object ads114LAYERS: TWordField
      FieldName = 'LAYERS'
    end
    object ads114PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
  end
  object ads64: TADODataSet
    Connection = DM.ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterOpen = ads64AfterOpen
    CommandText = 
      'SELECT     CAST(1 AS bit) AS isSel, dbo.data0439.delivery_no, db' +
      'o.Data0112.invoice_number, dbo.Data0060.SALES_ORDER, dbo.Data002' +
      '5.MANU_PART_NUMBER, '#13#10'                      dbo.Data0025.MANU_PA' +
      'RT_DESC, dbo.Data0097.PO_NUMBER, dbo.Data0064.DATE_SHIPPED, dbo.' +
      'Data0064.QUAN_SHIPPED, dbo.Data0064.part_price, '#13#10'              ' +
      '        dbo.Data0001.CURR_NAME, dbo.Data0060.EXCH_RATE, dbo.Data' +
      '0064.QUAN_SHIPPED * dbo.Data0064.part_price / dbo.Data0060.EXCH_' +
      'RATE AS amount, '#13#10'                      dbo.Data0085.MARKUP, dbo' +
      '.Data0085.TNUMBER, dbo.Data0025.LAYERS, dbo.Data0008.PRODUCT_NAM' +
      'E'#13#10'FROM         dbo.Data0112 INNER JOIN'#13#10'                      d' +
      'bo.data0439 ON dbo.Data0112.RKEY = dbo.data0439.invoice_ptr INNE' +
      'R JOIN'#13#10'                      dbo.Data0064 ON dbo.data0439.rkey ' +
      '= dbo.Data0064.packing_list_ptr INNER JOIN'#13#10'                    ' +
      '  dbo.Data0060 ON dbo.Data0064.SO_PTR = dbo.Data0060.RKEY INNER ' +
      'JOIN'#13#10'                      dbo.Data0085 ON dbo.Data0060.QTE_PTR' +
      ' = dbo.Data0085.RKEY INNER JOIN'#13#10'                      dbo.Data0' +
      '025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY INNER JOIN' +
      #13#10'                      dbo.Data0097 ON dbo.Data0060.PURCHASE_OR' +
      'DER_PTR = dbo.Data0097.RKEY INNER JOIN'#13#10'                      db' +
      'o.Data0001 ON dbo.Data0060.CURRENCY_PTR = dbo.Data0001.RKEY INNE' +
      'R JOIN'#13#10'                      dbo.Data0008 ON dbo.Data0025.PROD_' +
      'CODE_PTR = dbo.Data0008.RKEY'#13#10'WHERE    '#13#10' (dbo.Data0064.DATE_SHI' +
      'PPED >= :dtpk1) AND '#13#10'(dbo.Data0064.DATE_SHIPPED <= :dtpk2) AND'#13 +
      #10' (dbo.Data0060.CUSTOMER_PTR = :rkey10)'
    Parameters = <
      item
        Name = 'dtpk1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 39814d
      end
      item
        Name = 'dtpk2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 39841d
      end
      item
        Name = 'rkey10'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 427
      end>
    Left = 816
    Top = 30
    object ads64delivery_no: TStringField
      FieldName = 'delivery_no'
      Size = 10
    end
    object ads64invoice_number: TStringField
      DisplayWidth = 10
      FieldName = 'invoice_number'
      FixedChar = True
      Size = 12
    end
    object ads64SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ads64MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ads64MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ads64PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ads64DATE_SHIPPED: TDateTimeField
      FieldName = 'DATE_SHIPPED'
    end
    object ads64QUAN_SHIPPED: TIntegerField
      FieldName = 'QUAN_SHIPPED'
    end
    object ads64part_price: TFloatField
      FieldName = 'part_price'
    end
    object ads64CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object ads64EXCH_RATE: TFloatField
      FieldName = 'EXCH_RATE'
    end
    object ads64amount: TFloatField
      FieldName = 'amount'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object ads64MARKUP: TFloatField
      FieldName = 'MARKUP'
    end
    object ads64TNUMBER: TStringField
      FieldName = 'TNUMBER'
      Size = 10
    end
    object ads64isSel: TBooleanField
      FieldName = 'isSel'
    end
    object ads64LAYERS: TWordField
      FieldName = 'LAYERS'
    end
    object ads64PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
  end
  object cds114: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    Left = 756
    Top = 1
  end
  object dsp114: TDataSetProvider
    DataSet = ads114
    Left = 785
    Top = 1
  end
  object dsp64: TDataSetProvider
    DataSet = ads64
    Left = 785
    Top = 30
  end
  object cds64: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    Left = 756
    Top = 30
  end
end
