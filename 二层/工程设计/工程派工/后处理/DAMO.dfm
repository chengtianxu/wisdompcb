object DM: TDM
  OldCreateOrder = False
  Left = 385
  Top = 313
  Height = 335
  Width = 470
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 16
  end
  object Ado538: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      ''
      
        'SELECT dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DES' +
        'C,'
      
        ' dbo.DATA0538.curr_date,dbo.DATA0538.CUST_PART_PTR, case dbo.DAT' +
        'A0538.STATUS  when 8 then '#39'QAE'#32467#26463#39' end  as STATUS ,'
      'case DATA0538.HCL_STATUS when 0 then '#39#24453#22788#29702#39'when 1 then '#39#24320#22987#22788#29702#39
      
        'when 2 then '#39#24050#22788#29702#39'end as SHCL_STATUS,DATA0538.HCL_STATUS,data0060' +
        '.SCH_DATE,dbo.DATA0538.QAE_END_DATE,'
      
        'case data0538.IF_HCL when 0 then '#39#21542#39' when 1 then '#39#26159#39'  end as IF_' +
        'HCL,dbo.DATA0538.HCL_USER_PTR,'
      
        'dbo.DATA0538.order_qty,dbo.DATA0538.CONF_DATE,dbo.DATA0538.so_ol' +
        'dnew,'
      
        'dbo.Data0005.EMPLOYEE_NAME as au_name ,data0538.HCL_DATE,data000' +
        '8.PROD_CODE,data0008.PRODUCT_NAME '
      'FROM  dbo.DATA0538 INNER JOIN'
      
        '      dbo.Data0025 ON dbo.DATA0538.CUST_PART_PTR = dbo.Data0025.' +
        'RKEY left JOIN'
      
        '      dbo.Data0005  ON dbo.DATA0538.HCL_USER_PTR = Data0005.RKEY' +
        ' left JOIN'
      
        '      dbo.data0010 on data0025.CUSTOMER_PTR=data0010.Rkey left j' +
        'oin'
      
        '     dbo.data0008 on data0025.PROD_CODE_PTR=data0008.Rkey left j' +
        'oin'
      
        '     dbo.data0060 on data0538.CUST_PART_PTR=data0060.CUST_PART_P' +
        'TR and data0538.CONF_DATE=data0060.CONF_DATE left join'
      '      dbo.data0015 on data0025.PROD_ROUTE_PTR=data0015.Rkey')
    Left = 32
    Top = 80
    object Ado538MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object Ado538MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object Ado538curr_date: TDateTimeField
      FieldName = 'curr_date'
    end
    object Ado538CUST_PART_PTR: TIntegerField
      FieldName = 'CUST_PART_PTR'
    end
    object Ado538order_qty: TIntegerField
      FieldName = 'order_qty'
    end
    object Ado538CONF_DATE: TDateTimeField
      FieldName = 'CONF_DATE'
    end
    object Ado538so_oldnew: TStringField
      FieldName = 'so_oldnew'
      Size = 50
    end
    object Ado538HCL_DATE: TDateTimeField
      FieldName = 'HCL_DATE'
    end
    object Ado538IF_HCL: TStringField
      FieldName = 'IF_HCL'
      ReadOnly = True
      Size = 2
    end
    object Ado538STATUS: TStringField
      FieldName = 'STATUS'
      ReadOnly = True
      Size = 7
    end
    object Ado538HCL_STATUS: TWordField
      FieldName = 'HCL_STATUS'
    end
    object Ado538SHCL_STATUS: TStringField
      FieldName = 'SHCL_STATUS'
      ReadOnly = True
      Size = 8
    end
    object Ado538au_name: TStringField
      FieldName = 'au_name'
      Size = 16
    end
    object Ado538HCL_USER_PTR: TIntegerField
      FieldName = 'HCL_USER_PTR'
    end
    object Ado538SCH_DATE: TDateTimeField
      FieldName = 'SCH_DATE'
    end
    object Ado538PROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object Ado538PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object Ado538QAE_END_DATE: TDateTimeField
      FieldName = 'QAE_END_DATE'
    end
  end
  object DataSource1: TDataSource
    DataSet = Ado538
    Left = 96
    Top = 88
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 24
    Top = 240
  end
  object Ado0849: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'D419_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'D073_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select CAST(0 AS bit) AS Sel, data0849.* from data0849 '
      'where D419_ptr=:D419_ptr and D073_ptr=:D073_ptr')
    Left = 24
    Top = 168
    object Ado0849Sel: TBooleanField
      FieldName = 'Sel'
    end
    object Ado0849Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object Ado0849D419_ptr: TIntegerField
      FieldName = 'D419_ptr'
    end
    object Ado0849D073_ptr: TIntegerField
      FieldName = 'D073_ptr'
    end
    object Ado0849FormName: TStringField
      FieldName = 'FormName'
      Size = 50
    end
    object Ado0849GridName: TStringField
      FieldName = 'GridName'
      Size = 50
    end
    object Ado0849FieldName: TStringField
      FieldName = 'FieldName'
      Size = 50
    end
    object Ado0849FieldCaption: TStringField
      FieldName = 'FieldCaption'
      Size = 100
    end
    object Ado0849FieldOrder: TIntegerField
      FieldName = 'FieldOrder'
    end
    object Ado0849FieldWidth: TIntegerField
      FieldName = 'FieldWidth'
    end
    object Ado0849IsDisplay: TBooleanField
      FieldName = 'IsDisplay'
    end
  end
  object DSP2: TDataSetProvider
    DataSet = Ado0849
    Left = 88
    Top = 168
  end
  object CDS2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 168
  end
  object Ado849s: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0849 where RKey is Null')
    Left = 96
    Top = 248
    object Ado849sRkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object Ado849sD419_ptr: TIntegerField
      FieldName = 'D419_ptr'
    end
    object Ado849sD073_ptr: TIntegerField
      FieldName = 'D073_ptr'
    end
    object Ado849sFormName: TStringField
      FieldName = 'FormName'
      Size = 50
    end
    object Ado849sGridName: TStringField
      FieldName = 'GridName'
      Size = 50
    end
    object Ado849sFieldName: TStringField
      FieldName = 'FieldName'
      Size = 50
    end
    object Ado849sFieldCaption: TStringField
      FieldName = 'FieldCaption'
      Size = 100
    end
    object Ado849sFieldOrder: TIntegerField
      FieldName = 'FieldOrder'
    end
    object Ado849sFieldWidth: TIntegerField
      FieldName = 'FieldWidth'
    end
    object Ado849sIsDisplay: TBooleanField
      FieldName = 'IsDisplay'
    end
  end
end
