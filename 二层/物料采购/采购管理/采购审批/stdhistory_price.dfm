object Form_stdprice: TForm_stdprice
  Left = 233
  Top = 207
  BorderStyle = bsSingle
  Caption = #21382#21490#20215#26684
  ClientHeight = 421
  ClientWidth = 828
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 380
    Width = 828
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Button1: TButton
      Left = 320
      Top = 8
      Width = 75
      Height = 25
      Caption = #20851#38381
      ModalResult = 1
      TabOrder = 0
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 828
    Height = 380
    Align = alClient
    DataSource = DSstdhistory_price
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXCHANGE_RATE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_DATE'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax_price'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_2'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_ORD'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRINT_DATE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATE_CHS'
        Visible = True
      end>
  end
  object ADOstdprice: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'invt_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT TOP 50 dbo.Data0023.ABBR_NAME, dbo.Data0001.CURR_NAME, db' +
        'o.Data0070.PO_NUMBER, dbo.Data0070.PO_DATE, dbo.Data0071.tax_pri' +
        'ce,'
      
        '              dbo.Data0071.PRICE, dbo.Data0071.TAX_2, dbo.Data00' +
        '71.QUAN_ORD, dbo.Data0002.UNIT_NAME,Data0070.PRINT_DATE, '
      'data0070.EXCHANGE_RATE,'
      '              CASE data0070.STATUS WHEN 1 THEN '#39#24453#23457#26680#39
      '                                   WHEN 2 THEN '#39#34987#36864#22238#39
      '                                   WHEN 3 THEN '#39#24050#20445#30041#39
      '                                   WHEN 4 THEN '#39#24050#26242#32531#39
      '                                   WHEN 5 THEN '#39#24050#23457#26680#39
      '                                   WHEN 6 THEN '#39#24050#25910#36135#39
      '                                   WHEN 7 THEN '#39#24050#23436#25104#39
      
        '                                   WHEN 8 THEN '#39#26410#25552#20132#39' END AS STAT' +
        'E_CHS'
      'FROM      dbo.Data0070 INNER JOIN'
      
        '          dbo.Data0023 ON dbo.Data0070.SUPPLIER_POINTER = dbo.Da' +
        'ta0023.RKEY INNER JOIN'
      
        '          dbo.Data0001 ON dbo.Data0070.CURRENCY_PTR = dbo.Data00' +
        '01.RKEY INNER JOIN'
      '          dbo.Data0071 INNER JOIN'
      
        '          dbo.Data0002 ON dbo.Data0071.PURCHASE_UNIT_PTR = dbo.D' +
        'ata0002.RKEY ON dbo.Data0070.RKEY = dbo.Data0071.PO_PTR'
      'WHERE     (Data0071.INVT_PTR = :invt_ptr) AND'
      
        '          ((dbo.Data0070.STATUS = 5) OR (dbo.Data0070.STATUS = 6' +
        ') OR (dbo.Data0070.STATUS = 7))          '
      'ORDER BY dbo.Data0070.PO_DATE DESC'
      ' '
      ' ')
    Left = 408
    Top = 280
    object ADOstdpriceABBR_NAME: TStringField
      DisplayLabel = #20379#21830#21830
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOstdpriceCURR_NAME: TStringField
      DisplayLabel = #24065#31181
      FieldName = 'CURR_NAME'
    end
    object ADOstdpricePO_NUMBER: TStringField
      DisplayLabel = #35746#21333#21495#30721
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object ADOstdpricePO_DATE: TDateTimeField
      DisplayLabel = #35746#21333#26085#26399
      FieldName = 'PO_DATE'
    end
    object ADOstdpricetax_price: TFloatField
      DisplayLabel = #21547#31246#20215
      FieldName = 'tax_price'
    end
    object ADOstdpricePRICE: TFloatField
      DisplayLabel = #19981#21547#31246#20215
      FieldName = 'PRICE'
    end
    object ADOstdpriceTAX_2: TBCDField
      DisplayLabel = #31246#29575'(%)'
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ADOstdpriceQUAN_ORD: TFloatField
      DisplayLabel = #37319#36141#25968#37327
      FieldName = 'QUAN_ORD'
    end
    object ADOstdpriceUNIT_NAME: TStringField
      DisplayLabel = #37319#36141#21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ADOstdpriceSTATE_CHS: TStringField
      DisplayLabel = #35746#21333#29366#24577
      FieldName = 'STATE_CHS'
      ReadOnly = True
      Size = 6
    end
    object ADOstdpricePRINT_DATE: TDateTimeField
      DisplayLabel = #25171#21360#26085#26399
      FieldName = 'PRINT_DATE'
    end
    object ADOstdpriceEXCHANGE_RATE: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'EXCHANGE_RATE'
    end
  end
  object DSstdhistory_price: TDataSource
    DataSet = ADOstdprice
    Left = 436
    Top = 280
  end
end
