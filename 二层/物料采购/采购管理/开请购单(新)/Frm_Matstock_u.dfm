object Frm_Matstock: TFrm_Matstock
  Left = 295
  Top = 241
  Width = 866
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
    Width = 858
    Height = 405
    Align = alClient
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
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
        Width = 67
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
        FieldName = 'LOCATION'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'type'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_CODE'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BARCODE_ID'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'reason'
        Width = 100
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 405
    Width = 858
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TButton
      Left = 320
      Top = 8
      Width = 75
      Height = 25
      Caption = #20851#38381
      ModalResult = 2
      TabOrder = 0
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOCon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'INVT_PTR'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end
      item
        Name = 'rkey17'
        DataType = ftString
        Size = 1
        Value = '0'
      end>
    Prepared = True
    SQL.Strings = (
      
        'SELECT  dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo' +
        '.Data0017.INV_DESCRIPTION, dbo.Data0016.LOCATION,'
      
        '        dbo.Data0017.REPORT_VALUE2,dbo.Data0017.CONSIGN_ONHAND_Q' +
        'TY,  '
      
        '        dbo.Data0496.GROUP_NAME, SUM(dbo.Data0022.QUAN_ON_HAND-d' +
        'ata0022.QUAN_TO_BE_STOCKED) AS quan_total,'
      
        '        dbo.Data0002.UNIT_CODE,dbo.Data0071.reason, dbo.Data0022' +
        '.BARCODE_ID, dbo.Data0023.ABBR_NAME,'#39#36890#29992#24211#23384#39' AS type'
      'FROM         dbo.Data0022 INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR' +
        ' = dbo.Data0017.RKEY INNER JOIN'
      
        '                      dbo.Data0496 ON dbo.Data0017.GROUP_PTR = d' +
        'bo.Data0496.RKEY INNER JOIN'
      
        '                      dbo.Data0002 ON dbo.Data0022.LOCATION_PTR_' +
        'FROM = dbo.Data0002.RKEY INNER JOIN'
      
        '                      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo' +
        '.Data0456.RKEY INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.Data0456.warehouse_ptr' +
        ' = dbo.Data0015.RKEY INNER JOIN'
      
        '                      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = db' +
        'o.Data0023.RKEY INNER JOIN'
      
        '                      dbo.Data0016 ON dbo.Data0022.LOCATION_PTR ' +
        '= dbo.Data0016.RKEY left join'
      
        '                      dbo.Data0071 ON dbo.Data0022.SOURCE_PTR = ' +
        'dbo.Data0071.RKEY'
      
        'WHERE     (dbo.Data0022.QUAN_ON_HAND > 0) AND (Data0022.INVENTOR' +
        'Y_PTR=:INVT_PTR)'
      
        'GROUP BY dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, db' +
        'o.Data0017.INV_DESCRIPTION, dbo.Data0496.GROUP_NAME, dbo.Data000' +
        '2.UNIT_CODE, '
      
        '                      dbo.Data0017.REPORT_VALUE2,dbo.Data0017.CO' +
        'NSIGN_ONHAND_QTY,dbo.Data0071.reason, dbo.Data0022.BARCODE_ID,db' +
        'o.Data0023.ABBR_NAME, dbo.Data0016.LOCATION'
      ''
      'union all'
      ''
      
        'SELECT     dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, ' +
        'dbo.Data0017.INV_DESCRIPTION, dbo.Data0016.LOCATION, '
      
        '                 dbo.Data0017.REPORT_VALUE2,dbo.Data0017.CONSIGN' +
        '_ONHAND_QTY,'
      
        '                      dbo.Data0496.GROUP_NAME, SUM(dbo.DATA0134.' +
        'QUAN_ON_HAND) AS quan_total, '
      
        '           dbo.Data0002.UNIT_CODE,dbo.Data0071.reason, dbo.Data0' +
        '134.BARCODE_ID, dbo.Data0023.ABBR_NAME,'#39'VMI'#24211#23384#39' AS type'
      'FROM         dbo.Data0017 INNER JOIN'
      
        '                      dbo.Data0496 ON dbo.Data0017.GROUP_PTR = d' +
        'bo.Data0496.RKEY INNER JOIN'
      
        '                      dbo.DATA0134 ON dbo.Data0017.RKEY = dbo.DA' +
        'TA0134.INVENTORY_PTR INNER JOIN'
      
        '                      dbo.Data0002 ON dbo.DATA0134.UNIT_PTR = db' +
        'o.Data0002.RKEY INNER JOIN'
      '                      dbo.DATA0133 INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.DATA0133.warehouse_ptr' +
        ' = dbo.Data0015.RKEY INNER JOIN'
      
        '                      dbo.Data0023 ON dbo.DATA0133.SUPP_PTR = db' +
        'o.Data0023.RKEY ON dbo.DATA0134.GRN_PTR = dbo.DATA0133.RKEY INNE' +
        'R JOIN'
      
        '                      dbo.Data0016 ON dbo.DATA0134.LOCATION_PTR ' +
        '= dbo.Data0016.RKEY LEFT JOIN'
      
        '                      dbo.Data0071 ON dbo.DATA0134.SOURCE_PTR = ' +
        'dbo.Data0071.RKEY'
      
        'WHERE   (data0134.quan_on_hand>0)  and  (dbo.DATA0134.INVENTORY_' +
        'ptr = :rkey17)'
      
        'GROUP BY dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, db' +
        'o.Data0017.INV_DESCRIPTION, dbo.Data0496.GROUP_NAME, dbo.Data000' +
        '2.UNIT_CODE, '
      
        '                     dbo.Data0017.REPORT_VALUE2,dbo.Data0017.CON' +
        'SIGN_ONHAND_QTY, dbo.Data0071.reason, dbo.Data0134.BARCODE_ID,db' +
        'o.Data0023.ABBR_NAME, dbo.Data0016.LOCATION')
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
    object ADOQuery1GROUP_NAME: TStringField
      DisplayLabel = #26448#26009#31867#21035
      FieldName = 'GROUP_NAME'
      Size = 10
    end
    object ADOQuery1quan_total: TFloatField
      DisplayLabel = #24211#23384#25968#37327
      FieldName = 'quan_total'
    end
    object ADOQuery1UNIT_CODE: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object ADOQuery1ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOQuery1LOCATION: TStringField
      DisplayLabel = #20179#24211
      FieldName = 'LOCATION'
    end
    object ADOQuery1type: TStringField
      DisplayLabel = #24211#23384#31867#22411
      FieldName = 'type'
      ReadOnly = True
      Size = 8
    end
    object ADOQuery1BARCODE_ID: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BARCODE_ID'
      ReadOnly = True
      Size = 50
    end
    object ADOQuery1reason: TStringField
      DisplayLabel = #35831#36141#21407#22240
      FieldName = 'reason'
      ReadOnly = True
      Size = 60
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 552
    Top = 120
  end
end
