object DM: TDM
  OldCreateOrder = False
  Left = 490
  Top = 278
  Height = 365
  Width = 533
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
      
        'SELECT dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DES' +
        'C,'
      
        '       dbo.DATA0538.curr_date,dbo.DATA0538.CUST_PART_PTR,dbo.DAT' +
        'A0538.STATUS,'
      'case DATA0538.STATUS when 0 then '#39#39044#23457#24453#20998#37197#39'when 1 then '#39#24453#39044#23457#39
      'when 2 then '#39#39044#23457#24320#22987#39'when 3 then '#39#39044#23457#32467#26463#39'when 4 then '#39'CAM'#24102#29702#39
      'when 5 then '#39'CAM'#24320#22987#39'when 6 then '#39'CAM'#32467#26463#39'when 7 then '#39'QAE'#24320#22987#39
      
        'when 8 then '#39'QAE'#32467#26463#39'when 9 then '#39'CAM'#36864#22238#39'when 10 then '#39'QAE'#36864#22238#39'end as' +
        ' str_status,'
      
        'case data0538.YS_EQ_STATUS when 0 then '#39#26080#39' when 1 then '#39#36827#34892#20013#39' whe' +
        'n 2 then '#39#24050#23436#25104#39' end as YS_EQ_STATUS2,'
      
        'case data0538.CAM_EQ_STATUS when 0 then '#39#26080#39' when 1 then '#39#36827#34892#20013#39' wh' +
        'en 2 then '#39#24050#23436#25104#39' end as CAM_EQ_STATUS2,'
      
        'dbo.DATA0538.order_qty,dbo.DATA0538.CONF_DATE,dbo.DATA0538.so_ol' +
        'dnew,'
      
        'dbo.DATA0538.YSZP_USER_PTR,dbo.DATA0538.YSZP_DATE,dbo.DATA0538.Y' +
        'S_USER_PTR,'
      
        'dbo.DATA0538.YS_STAR_DATE,dbo.DATA0538.YS_EDN_DATE,dbo.DATA0538.' +
        'YS_EQ_STATUS,'
      
        'dbo.DATA0538.YS_EQ_STAR,dbo.DATA0538.YS_EQ_END,dbo.DATA0538.CAMZ' +
        'P_USER_PTR,'
      
        'dbo.DATA0538.CAMZP_DATE,dbo.DATA0538.CAM_USER_PTR,dbo.DATA0538.C' +
        'AM_STAR_DATE,'
      
        'dbo.DATA0538.CAM_EDN_DATE,dbo.DATA0538.CAM_EQ_STATUS,dbo.DATA053' +
        '8.CAM_EQ_STAR,'
      
        'dbo.DATA0538.CAM_EQ_END,dbo.DATA0538.CAM_SENDBACK,dbo.DATA0538.Q' +
        'AE_USER_PTR,'
      
        'dbo.DATA0538.QAE_STAR_DATE,dbo.DATA0538.QAE_END_DATE,dbo.DATA053' +
        '8.QAE_SENDBACK, '
      #9#9'dbo.Data0005.EMPLOYEE_NAME AS E_NAME1, '
      
        '       Data0005_1.EMPLOYEE_NAME AS E_NAME2, Data0005_2.EMPLOYEE_' +
        'NAME AS E_NAME3, Data0005_4.EMPLOYEE_NAME AS E_NAME5, '
      
        '       Data0005_3.EMPLOYEE_NAME AS E_NAME4,data0008.PROD_CODE,da' +
        'ta0008.PRODUCT_NAME'
      'FROM  dbo.DATA0538 INNER JOIN'
      
        '      dbo.Data0025 ON dbo.DATA0538.CUST_PART_PTR = dbo.Data0025.' +
        'RKEY left JOIN'
      
        '      dbo.Data0005 ON dbo.DATA0538.YSZP_USER_PTR = dbo.Data0005.' +
        'RKEY left JOIN'
      
        '      dbo.Data0005 AS Data0005_1 ON dbo.DATA0538.YS_USER_PTR = D' +
        'ata0005_1.RKEY left JOIN'
      
        '      dbo.Data0005 AS Data0005_2 ON dbo.DATA0538.CAMZP_USER_PTR ' +
        '= Data0005_2.RKEY left JOIN'
      
        '      dbo.Data0005 AS Data0005_3 ON dbo.DATA0538.CAM_USER_PTR = ' +
        'Data0005_3.RKEY left JOIN'
      
        '      dbo.Data0005 AS Data0005_4 ON dbo.DATA0538.QAE_USER_PTR = ' +
        'Data0005_4.RKEY left join'
      
        '      dbo.data0008 on data0025.PROD_CODE_PTR=data0008.Rkey left ' +
        'join'
      
        '      dbo.data0010 on data0025.CUSTOMER_PTR=data0010.Rkey left j' +
        'oin'
      '      dbo.data0015 on data0025.PROD_ROUTE_PTR=data0015.Rkey'
      '')
    Left = 160
    Top = 32
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
    object Ado538STATUS: TWordField
      FieldName = 'STATUS'
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
    object Ado538YSZP_USER_PTR: TIntegerField
      FieldName = 'YSZP_USER_PTR'
    end
    object Ado538YSZP_DATE: TDateTimeField
      FieldName = 'YSZP_DATE'
    end
    object Ado538YS_USER_PTR: TIntegerField
      FieldName = 'YS_USER_PTR'
    end
    object Ado538YS_STAR_DATE: TDateTimeField
      FieldName = 'YS_STAR_DATE'
    end
    object Ado538YS_EDN_DATE: TDateTimeField
      FieldName = 'YS_EDN_DATE'
    end
    object Ado538YS_EQ_STATUS: TWordField
      FieldName = 'YS_EQ_STATUS'
    end
    object Ado538YS_EQ_STAR: TDateTimeField
      FieldName = 'YS_EQ_STAR'
    end
    object Ado538YS_EQ_END: TDateTimeField
      FieldName = 'YS_EQ_END'
    end
    object Ado538CAMZP_USER_PTR: TIntegerField
      FieldName = 'CAMZP_USER_PTR'
    end
    object Ado538CAMZP_DATE: TDateTimeField
      FieldName = 'CAMZP_DATE'
    end
    object Ado538CAM_USER_PTR: TIntegerField
      FieldName = 'CAM_USER_PTR'
    end
    object Ado538CAM_STAR_DATE: TDateTimeField
      FieldName = 'CAM_STAR_DATE'
    end
    object Ado538CAM_EDN_DATE: TDateTimeField
      FieldName = 'CAM_EDN_DATE'
    end
    object Ado538CAM_EQ_STATUS: TWordField
      FieldName = 'CAM_EQ_STATUS'
    end
    object Ado538CAM_EQ_STAR: TDateTimeField
      FieldName = 'CAM_EQ_STAR'
    end
    object Ado538CAM_EQ_END: TDateTimeField
      FieldName = 'CAM_EQ_END'
    end
    object Ado538CAM_SENDBACK: TDateTimeField
      FieldName = 'CAM_SENDBACK'
    end
    object Ado538QAE_USER_PTR: TIntegerField
      FieldName = 'QAE_USER_PTR'
    end
    object Ado538QAE_STAR_DATE: TDateTimeField
      FieldName = 'QAE_STAR_DATE'
    end
    object Ado538QAE_SENDBACK: TDateTimeField
      FieldName = 'QAE_SENDBACK'
    end
    object Ado538E_NAME1: TStringField
      FieldName = 'E_NAME1'
      Size = 16
    end
    object Ado538E_NAME2: TStringField
      FieldName = 'E_NAME2'
      Size = 16
    end
    object Ado538E_NAME3: TStringField
      FieldName = 'E_NAME3'
      Size = 16
    end
    object Ado538E_NAME5: TStringField
      FieldName = 'E_NAME5'
      Size = 16
    end
    object Ado538E_NAME4: TStringField
      FieldName = 'E_NAME4'
      Size = 16
    end
    object Ado538PROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object Ado538PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object Ado538str_status: TStringField
      FieldName = 'str_status'
      ReadOnly = True
      Size = 10
    end
    object Ado538QAE_END_DATE: TDateTimeField
      FieldName = 'QAE_END_DATE'
    end
    object Ado538YS_EQ_STATUS2: TStringField
      FieldName = 'YS_EQ_STATUS2'
      ReadOnly = True
      Size = 6
    end
    object Ado538CAM_EQ_STATUS2: TStringField
      FieldName = 'CAM_EQ_STATUS2'
      ReadOnly = True
      Size = 6
    end
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 56
    Top = 80
  end
  object DataSource1: TDataSource
    DataSet = Ado538
    Left = 216
    Top = 32
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
      'select  data0849.* from data0849 '
      'where D419_ptr=:D419_ptr and D073_ptr=:D073_ptr')
    Left = 192
    Top = 112
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
    Left = 248
    Top = 112
  end
  object CDS2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 120
  end
  object Ado849s: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0849 where RKey is Null')
    Left = 192
    Top = 184
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
