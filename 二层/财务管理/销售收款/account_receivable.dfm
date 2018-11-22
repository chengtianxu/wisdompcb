object Form_receivable: TForm_receivable
  Left = 289
  Top = 148
  Width = 696
  Height = 550
  Caption = #21040#26399#24212#25910#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 37
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 208
      Top = 12
      Width = 52
      Height = 13
      Caption = #21457#31080#32534#21495
    end
    object Button1: TButton
      Left = 8
      Top = 5
      Width = 57
      Height = 25
      Caption = #20851#38381
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 68
      Top = 5
      Width = 57
      Height = 25
      Caption = #23548#20986
      TabOrder = 1
      OnClick = Button2Click
    end
    object Edit1: TEdit
      Left = 264
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 2
      OnChange = Edit1Change
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 37
    Width = 688
    Height = 486
    Align = alClient
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'invoice_number'
        Title.Color = clRed
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'type'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_CODE'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INVOICE_TOTAL'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'yisou'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'yinsou'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXCHANGE_RATE'
        ReadOnly = False
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INVOICE_DATE'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'due_date'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INVOICE_NOTE_PAD_PTR'
        Visible = True
      end>
  end
  object AqD112: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.Data0112.invoice_number, dbo.Data0112.INVOICE_TOTAL, ' +
      #13#10'      dbo.Data0112.amount_paid + dbo.Data0112.CASH_DISC AS yis' +
      'ou, '#13#10'      dbo.Data0112.INVOICE_TOTAL - dbo.Data0112.amount_pai' +
      'd - dbo.Data0112.CASH_DISC'#13#10'       AS yinsou, dbo.Data0001.CURR_' +
      'NAME, dbo.Data0112.EXCHANGE_RATE, '#13#10'      dbo.Data0112.INVOICE_D' +
      'ATE, dbo.Data0112.due_date, dbo.Data0010.CUST_CODE, '#13#10'      dbo.' +
      'Data0010.ABBR_NAME, data0010.INVOICE_NOTE_PAD_PTR,'#13#10'case Data011' +
      '2.invoice_type when 1 then '#39#26631#20934#21457#31080#39' when 2 then '#39#24037#20855#21457#31080#39#13#10' when 3 th' +
      'en '#39#26434#39033#21457#31080#39' end as type'#13#10'FROM dbo.Data0112 INNER JOIN'#13#10'      dbo.D' +
      'ata0001 ON dbo.Data0112.CURRENCY_PTR = dbo.Data0001.RKEY INNER J' +
      'OIN'#13#10'      dbo.Data0010 ON dbo.Data0112.CUSTOMER_PTR = dbo.Data0' +
      '010.RKEY'#13#10'WHERE (dbo.Data0112.INVOICE_STATUS = 1) AND '#13#10'      (d' +
      'bo.Data0112.due_date <= CONVERT(datetime, CONVERT(varchar, GETDA' +
      'TE(), 101), '#13#10'      101))'
    IndexFieldNames = 'invoice_number'
    Parameters = <>
    Left = 176
    Top = 264
    object AqD112invoice_number: TStringField
      DisplayLabel = #21457#31080#32534#21495
      FieldName = 'invoice_number'
      FixedChar = True
      Size = 12
    end
    object AqD112INVOICE_TOTAL: TBCDField
      DisplayLabel = #21457#31080#37329#39069
      DisplayWidth = 10
      FieldName = 'INVOICE_TOTAL'
      Precision = 19
    end
    object AqD112yisou: TBCDField
      DisplayLabel = #24050#25910#37329#39069
      DisplayWidth = 10
      FieldName = 'yisou'
      ReadOnly = True
      Precision = 19
    end
    object AqD112yinsou: TBCDField
      DisplayLabel = #21040#26399#37329#39069
      DisplayWidth = 10
      FieldName = 'yinsou'
      ReadOnly = True
      Precision = 19
    end
    object AqD112CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      DisplayWidth = 10
      FieldName = 'CURR_NAME'
    end
    object AqD112EXCHANGE_RATE: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'EXCHANGE_RATE'
    end
    object AqD112INVOICE_DATE: TDateTimeField
      DisplayLabel = #21457#31080#26085#26399
      DisplayWidth = 10
      FieldName = 'INVOICE_DATE'
    end
    object AqD112due_date: TDateTimeField
      DisplayLabel = #21040#26399#26085#26399
      DisplayWidth = 10
      FieldName = 'due_date'
    end
    object AqD112CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object AqD112ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object AqD112type: TStringField
      DisplayLabel = #21457#31080#31867#22411
      FieldName = 'type'
      ReadOnly = True
      Size = 8
    end
    object AqD112INVOICE_NOTE_PAD_PTR: TIntegerField
      DisplayLabel = #20801#35768#24310#26399#22825#25968
      FieldName = 'INVOICE_NOTE_PAD_PTR'
    end
  end
  object DataSource1: TDataSource
    DataSet = AqD112
    Left = 136
    Top = 264
  end
end
