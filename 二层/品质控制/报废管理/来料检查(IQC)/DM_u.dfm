object DM: TDM
  OldCreateOrder = False
  Left = 583
  Top = 242
  Height = 375
  Width = 336
  object ADOCon: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 32
  end
  object tmp: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 144
    Top = 136
  end
  object AQ70: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      
        'SELECT     dbo.Data0070.RKEY, dbo.Data0070.PO_NUMBER, dbo.Data00' +
        '70.EMPLOYEE_POINTER, dbo.Data0070.SUPPLIER_POINTER, '
      
        '                  dbo.Data0070.SUPP_FAC_ADD_PTR, dbo.Data0070.WA' +
        'REHOUSE_POINTER, dbo.Data0070.PO_DATE, dbo.Data0070.SUPPIER_CONT' +
        'ACT, '
      
        '                  dbo.Data0070.CONTACT_PHONE, dbo.Data0070.FOB, ' +
        'dbo.Data0070.PO_REV_NO,'
      
        '                  dbo.Data0005.employee_name, dbo.Data0023.ABBR_' +
        'NAME AS supName, '
      
        '                  dbo.Data0023.CODE, dbo.Data0015.ABBR_NAME AS f' +
        'acName'
      'FROM        dbo.Data0070 INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.Data0070.EMPLOYEE_POIN' +
        'TER = dbo.Data0005.RKEY INNER JOIN'
      
        '                      dbo.Data0023 ON dbo.Data0070.SUPPLIER_POIN' +
        'TER = dbo.Data0023.RKEY INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.Data0070.WAREHOUSE_POI' +
        'NTER = dbo.Data0015.RKEY'
      'where (data0070.po_type='#39'S'#39') and (data0070.status=5) and  '
      '           data0070.rkey in'
      
        ' (select  po_ptr from data0071 where   (dbo.Data0071.avl_flag = ' +
        #39'Y'#39')  OR   ((dbo.Data0071.IQCEMPL_PTR IS NOT NULL) AND (dbo.Data' +
        '0071.QUAN_ORD - dbo.Data0071.QUAN_IN_INSP > 0))'
      '                                      group by po_ptr)'
      'order by Data0070.PO_NUMBER')
    Left = 51
    Top = 106
    object AQ70PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object AQ70PO_DATE: TDateTimeField
      DisplayLabel = #37319#36141#26085#26399
      FieldName = 'PO_DATE'
    end
    object AQ70CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object AQ70supName: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'supName'
      Size = 10
    end
    object AQ70SUPPIER_CONTACT: TStringField
      DisplayLabel = #32852#32476#20154
      FieldName = 'SUPPIER_CONTACT'
      FixedChar = True
    end
    object AQ70CONTACT_PHONE: TStringField
      DisplayLabel = #32852#32476#20154#30005#35805
      FieldName = 'CONTACT_PHONE'
      Size = 40
    end
    object AQ70FOB: TStringField
      DisplayLabel = #37319#36141#35831#27714#32534#21495
      FieldName = 'FOB'
      Size = 15
    end
    object AQ70PO_REV_NO: TStringField
      DisplayLabel = #35831#36141#37096#38376
      FieldName = 'PO_REV_NO'
      Size = 10
    end
    object AQ70facName: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'facName'
      Size = 10
    end
    object AQ70employee_name: TStringField
      DisplayLabel = #37319#36141#24405#20837#21592
      FieldName = 'employee_name'
      Size = 16
    end
    object AQ70WAREHOUSE_POINTER: TIntegerField
      FieldName = 'WAREHOUSE_POINTER'
    end
    object AQ70SUPP_FAC_ADD_PTR: TIntegerField
      FieldName = 'SUPP_FAC_ADD_PTR'
    end
    object AQ70SUPPLIER_POINTER: TIntegerField
      FieldName = 'SUPPLIER_POINTER'
    end
    object AQ70EMPLOYEE_POINTER: TIntegerField
      FieldName = 'EMPLOYEE_POINTER'
    end
    object AQ70RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
  end
  object AQ71: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    DataSource = DS1
    Parameters = <
      item
        Name = 'RKEY'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      
        'SELECT     dbo.Data0071.RKEY, dbo.Data0071.PO_PTR, dbo.Data0071.' +
        'INVT_PTR, dbo.Data0017.INV_PART_NUMBER,'
      
        '                      dbo.Data0017.INV_NAME, data0017.INV_DESCRI' +
        'PTION,'
      
        ' dbo.Data0071.QUAN_ORD,  data0071.QUAN_IN_INSP,data0071.QUAN_REC' +
        'D,'
      
        'dbo.Data0071.REQ_DATE, dbo.Data0071.extra_req, dbo.Data0071.avl_' +
        'flag, Data0071.IF_CAF,'
      
        '                      dbo.Data0071.rohs, dbo.Data0002.UNIT_NAME,' +
        ' dbo.Data0005.EMPLOYEE_NAME, dbo.Data0071.PRINTED_DATE, '
      
        '                      CASE data0017.CRITICAL_MATL_FLAG WHEN 0 TH' +
        'EN '#39#21542#39' WHEN 1 THEN '#39#26159#39' END AS CRITICAL_MATL'
      'FROM         dbo.Data0071 INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.Data0071.INVT_PTR = db' +
        'o.Data0017.RKEY INNER JOIN'
      
        '                      dbo.Data0002 ON dbo.Data0071.PURCHASE_UNIT' +
        '_PTR = dbo.Data0002.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0005 ON dbo.Data0071.IQCEMPL_PTR =' +
        ' dbo.Data0005.RKEY'
      'WHERE    ( (dbo.Data0071.avl_flag = '#39'Y'#39') OR'
      
        '                  ( (dbo.Data0071.IQCEMPL_PTR IS NOT NULL) AND (' +
        'dbo.Data0071.QUAN_ORD - dbo.Data0071.QUAN_IN_INSP > 0))) and'
      '(data0071.po_ptr=:RKEY)')
    Left = 53
    Top = 166
    object AQ71INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object AQ71INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object AQ71UNIT_NAME: TStringField
      DisplayLabel = #37319#36141#21333#20301
      FieldName = 'UNIT_NAME'
    end
    object AQ71QUAN_ORD: TFloatField
      DisplayLabel = #37319#36141#25968#37327
      FieldName = 'QUAN_ORD'
    end
    object AQ71REQ_DATE: TDateTimeField
      DisplayLabel = #35201#27714#21040#36135#26085#26399
      FieldName = 'REQ_DATE'
    end
    object AQ71rohs: TStringField
      DisplayLabel = #29615#20445#26631#31034
      FieldName = 'rohs'
      Size = 10
    end
    object AQ71extra_req: TStringField
      DisplayLabel = #29305#21035#35201#27714
      FieldName = 'extra_req'
    end
    object AQ71INVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
    object AQ71PO_PTR: TIntegerField
      FieldName = 'PO_PTR'
    end
    object AQ71RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQ71avl_flag: TStringField
      FieldName = 'avl_flag'
      FixedChar = True
      Size = 1
    end
    object AQ71employee_name: TStringField
      DisplayLabel = #26816#26597#20154#21592
      FieldName = 'employee_name'
      Size = 16
    end
    object AQ71printed_date: TDateTimeField
      DisplayLabel = #26816#26597#26085#26399
      FieldName = 'printed_date'
    end
    object AQ71CRITICAL_MATL: TStringField
      DisplayLabel = #37325#35201#29289#26009
      FieldName = 'CRITICAL_MATL'
      ReadOnly = True
      Size = 2
    end
    object AQ71INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object AQ71QUAN_IN_INSP: TFloatField
      DisplayLabel = #24050#36890#36807#25968#37327
      FieldName = 'QUAN_IN_INSP'
    end
    object AQ71QUAN_RECD: TFloatField
      DisplayLabel = #20837#24211#25968#37327
      FieldName = 'QUAN_RECD'
    end
    object AQ71IF_CAF: TWideStringField
      FieldName = 'IF_CAF'
      FixedChar = True
      Size = 2
    end
  end
  object DS2: TDataSource
    DataSet = AQ71
    Left = 8
    Top = 163
  end
  object DS1: TDataSource
    DataSet = AQ70
    Left = 8
    Top = 104
  end
end
