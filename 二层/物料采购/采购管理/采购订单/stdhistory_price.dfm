object Form_stdprice: TForm_stdprice
  Left = 294
  Top = 227
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #29983#20135#29289#26009#21382#21490#20215#26684
  ClientHeight = 358
  ClientWidth = 704
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 704
    Height = 297
    Align = alTop
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = FormKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_ORD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax_price'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax_2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REQ_DATE'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_RECD'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'reason'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'extra_req'
        Width = 70
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 325
    Top = 327
    Width = 74
    Height = 24
    Caption = #20851#38381
    ModalResult = 1
    TabOrder = 1
    OnKeyDown = FormKeyDown
  end
  object ADOstdprice: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
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
      'SELECT TOP 50 Data0071.QUAN_ORD, dbo.Data0071.PRICE,'
      '       Data0071.REQ_DATE, dbo.Data0002.UNIT_NAME,'
      '       Data0001.CURR_NAME, dbo.Data0023.ABBR_NAME,'
      
        '       Data0070.DISCOUNT2_DAYS,data0071.tax_price,data0071.tax_2' +
        ','
      'data0071.QUAN_RECD,data0071.reason,data0071.extra_req'
      'FROM   Data0071 INNER JOIN data0070'
      'on data0071.PO_PTR=data0070.rkey inner join'
      
        '       Data0023 ON dbo.Data0070.SUPPLIER_POINTER = dbo.Data0023.' +
        'RKEY INNER JOIN'
      '       Data0001 ON'
      '       Data0070.CURRENCY_PTR = dbo.Data0001.RKEY INNER JOIN'
      
        '       Data0002 ON dbo.Data0071.PURCHASE_UNIT_PTR = dbo.Data0002' +
        '.RKEY'
      'WHERE  (dbo.Data0071.INVT_PTR = :invt_ptr) and '
      'data0070.STATUS in(5,6,7)'
      'ORDER BY  dbo.Data0071.REQ_DATE DESC')
    Left = 360
    Top = 224
    object ADOstdpriceREQ_DATE: TDateTimeField
      DisplayLabel = #20132#36135#26085#26399
      FieldName = 'REQ_DATE'
    end
    object ADOstdpriceUNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ADOstdpriceCURR_NAME: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
    end
    object ADOstdpriceABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object ADOstdpricetax_price: TFloatField
      DisplayLabel = #21547#31246#20215#26684
      FieldName = 'tax_price'
    end
    object ADOstdpriceQUAN_ORD: TBCDField
      DisplayLabel = #25968#37327
      FieldName = 'QUAN_ORD'
      Precision = 13
    end
    object ADOstdpricePRICE: TBCDField
      FieldName = 'PRICE'
      Precision = 15
      Size = 6
    end
    object ADOstdpriceDISCOUNT2_DAYS: TSmallintField
      FieldName = 'DISCOUNT2_DAYS'
    end
    object ADOstdpricetax_2: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'tax_2'
      Precision = 4
      Size = 2
    end
    object ADOstdpriceQUAN_RECD: TBCDField
      DisplayLabel = #24050#20837#24211#25968
      FieldName = 'QUAN_RECD'
      Precision = 13
    end
    object ADOstdpricereason: TStringField
      DisplayLabel = #35831#36141#21407#22240
      FieldName = 'reason'
      Size = 60
    end
    object ADOstdpriceextra_req: TStringField
      DisplayLabel = #29305#21035#35201#27714
      FieldName = 'extra_req'
      Size = 50
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOstdprice
    Left = 320
    Top = 224
  end
end
