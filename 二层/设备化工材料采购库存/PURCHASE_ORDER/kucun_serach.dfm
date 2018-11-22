object Form20: TForm20
  Left = 228
  Top = 185
  Width = 696
  Height = 480
  Caption = #24211#23384#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 680
    Height = 401
    Align = alClient
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inv_name'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Width = 152
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inv_group_name'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GROUP_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quan_total'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'avl_price'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'amount'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_CODE'
        Width = 72
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 401
    Width = 680
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TButton
      Left = 296
      Top = 8
      Width = 75
      Height = 25
      Caption = #20851#38381
      ModalResult = 2
      TabOrder = 0
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'INVT_PTR'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Data0017.INV_PART_NUMBER, Data0017.INV_NAME,'
      
        '      Data0017.INV_DESCRIPTION, Data0016.LOCATION, Data0496.GROU' +
        'P_NAME,'
      '      SUM(Data0022.QUAN_ON_HAND) AS quan_total,'
      '      CASE SUM(dbo.Data0022.QUANTITY) WHEN 0 THEN NULL'
      
        '      ELSE ROUND(SUM(dbo.Data0022.QUANTITY * dbo.Data0022.PRICE ' +
        '* dbo.Data0456.exch_rate)'
      '       / SUM(dbo.Data0022.QUANTITY), 4) END AS avl_price,'
      
        '      ROUND(SUM(Data0022.QUAN_ON_HAND * Data0022.PRICE * Data045' +
        '6.exch_rate), 3)'
      '      AS amount, Data0002.UNIT_CODE, Data0023.ABBR_NAME,'
      '      Data0019.inv_group_name'
      'FROM Data0022 INNER JOIN'
      
        '      Data0017 ON Data0022.INVENTORY_PTR = Data0017.RKEY INNER J' +
        'OIN'
      '      Data0496 ON Data0017.GROUP_PTR = Data0496.RKEY INNER JOIN'
      '      Data0019 ON Data0496.group_ptr = Data0019.rkey INNER JOIN'
      
        '      Data0002 ON Data0022.LOCATION_PTR_FROM = Data0002.RKEY INN' +
        'ER JOIN'
      '      Data0456 ON Data0022.GRN_PTR = Data0456.RKEY INNER JOIN'
      
        '      Data0015 ON Data0456.warehouse_ptr = Data0015.RKEY INNER J' +
        'OIN'
      
        '      Data0023 ON Data0456.SUPP_PTR = Data0023.RKEY LEFT OUTER J' +
        'OIN'
      '      Data0016 ON Data0022.LOCATION_PTR = Data0016.RKEY'
      'WHERE (Data0022.QUAN_ON_HAND <> 0) and'
      '      (data0017.rkey=:INVT_PTR)'
      'GROUP BY Data0017.INV_PART_NUMBER, Data0017.INV_NAME,'
      
        '      Data0017.INV_DESCRIPTION, Data0496.GROUP_NAME, Data0002.UN' +
        'IT_CODE,'
      
        '      Data0023.ABBR_NAME, Data0019.inv_group_name, Data0016.LOCA' +
        'TION'
      'ORDER BY Data0017.INV_PART_NUMBER, Data0017.INV_DESCRIPTION  ')
    Left = 520
    Top = 120
    object ADOQuery1INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADOQuery1inv_name: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'inv_name'
      Size = 30
    end
    object ADOQuery1INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADOQuery1inv_group_name: TStringField
      DisplayLabel = #26448#26009#32452#21035
      FieldName = 'inv_group_name'
    end
    object ADOQuery1GROUP_NAME: TStringField
      DisplayLabel = #26448#26009#31867#21035
      FieldName = 'GROUP_NAME'
      Size = 10
    end
    object ADOQuery1quan_total: TFloatField
      DisplayLabel = #24211#23384#25968#37327
      FieldName = 'quan_total'
    end
    object ADOQuery1avl_price: TFloatField
      DisplayLabel = #24179#22343#20215#26684'('#26412#20301#24065')'
      FieldName = 'avl_price'
      ReadOnly = True
    end
    object ADOQuery1amount: TFloatField
      DisplayLabel = #37329#39069'('#26412#20301#24065')'
      FieldName = 'amount'
    end
    object ADOQuery1UNIT_CODE: TStringField
      DisplayLabel = #23384#36135#21333#20301
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object ADOQuery1ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'ABBR_NAME'
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 552
    Top = 120
  end
end
