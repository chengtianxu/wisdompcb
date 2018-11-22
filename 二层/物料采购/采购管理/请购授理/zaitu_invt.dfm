object Form_zaitu: TForm_zaitu
  Left = 354
  Top = 296
  Width = 813
  Height = 463
  Caption = #22312#36884#29289#26009
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 805
    Height = 398
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
        FieldName = 'PO_NUMBER'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANALYSIS_CODE_1'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax_price'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'zaitu'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REQ_DATE'
        Title.Caption = #20132#36135#26085#26399
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'reason'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rohs'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'reply_date'
        Title.Caption = #35201#27714#21040#36135#26085#26399
        Width = 83
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 398
    Width = 805
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TButton
      Left = 344
      Top = 8
      Width = 75
      Height = 25
      Caption = #20851#38381
      ModalResult = 2
      TabOrder = 0
    end
  end
  object ADODataSet1: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.Data0023.CODE, dbo.Data0071.QUAN_ORD - dbo.Data00' +
      '71.QUAN_RECD + dbo.Data0071.QUAN_RETN AS zaitu, dbo.Data0023.ABB' +
      'R_NAME, '#13#10'                      dbo.Data0071.tax_price, dbo.Data' +
      '0071.TAX_2, dbo.Data0071.REQ_DATE, dbo.Data0070.PO_NUMBER, dbo.D' +
      'ata0071.reason, dbo.Data0071.rohs, '#13#10'                      dbo.D' +
      'ata0002.UNIT_NAME, ISNULL(dbo.Data0005.EMPLOYEE_NAME, dbo.Data00' +
      '70.ANALYSIS_CODE_1)  AS ANALYSIS_CODE_1, dbo.Data0069.reply_date' +
      #13#10'FROM         dbo.Data0068 LEFT OUTER JOIN'#13#10'                   ' +
      '   dbo.Data0005 ON dbo.Data0068.REQ_BY = dbo.Data0005.RKEY LEFT ' +
      'OUTER JOIN'#13#10'                      dbo.Data0069 ON dbo.Data0068.R' +
      'KEY = dbo.Data0069.PURCH_REQ_PTR RIGHT OUTER JOIN'#13#10'             ' +
      '         dbo.Data0071 INNER JOIN'#13#10'                      dbo.Data' +
      '0070 ON dbo.Data0071.PO_PTR = dbo.Data0070.RKEY INNER JOIN'#13#10'    ' +
      '                  dbo.Data0023 ON dbo.Data0070.SUPPLIER_POINTER ' +
      '= dbo.Data0023.RKEY INNER JOIN'#13#10'                      dbo.Data00' +
      '02 ON dbo.Data0071.PURCHASE_UNIT_PTR = dbo.Data0002.RKEY ON dbo.' +
      'Data0069.RKEY = dbo.Data0071.rkey69'#13#10'WHERE     (dbo.Data0070.STA' +
      'TUS = 5) AND (dbo.Data0071.QUAN_ORD - dbo.Data0071.QUAN_RECD + d' +
      'bo.Data0071.QUAN_RETN > 0)and '#13#10'     (dbo.Data0071.INVT_PTR = :r' +
      'key)'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 128
    Top = 56
    object ADODataSet1zaitu: TFloatField
      DisplayLabel = #22312#36884#25968#37327
      FieldName = 'zaitu'
      ReadOnly = True
    end
    object ADODataSet1ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object ADODataSet1tax_price: TFloatField
      DisplayLabel = #21547#31246#20215
      FieldName = 'tax_price'
    end
    object ADODataSet1TAX_2: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ADODataSet1REQ_DATE: TDateTimeField
      DisplayLabel = #21040#36135#26085#26399
      FieldName = 'REQ_DATE'
    end
    object ADODataSet1PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object ADODataSet1reason: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'reason'
      Size = 60
    end
    object ADODataSet1rohs: TStringField
      DisplayLabel = 'ROHS'
      FieldName = 'rohs'
      Size = 10
    end
    object ADODataSet1UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ADODataSet1CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object ADODataSet1ANALYSIS_CODE_1: TStringField
      DisplayLabel = #35831#36141#20154#21592
      FieldName = 'ANALYSIS_CODE_1'
    end
    object ADODataSet1reply_date: TDateTimeField
      FieldName = 'reply_date'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 88
    Top = 56
  end
end
