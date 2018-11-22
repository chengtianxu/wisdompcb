object DM: TDM
  OldCreateOrder = False
  Left = 682
  Top = 291
  Height = 375
  Width = 336
  object ADOCon: TADOConnection
    Connected = True
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\Ole DB\Data Links' +
      '\68.udl'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 32
  end
  object tmp: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 240
    Top = 280
  end
  object DS1: TDataSource
    DataSet = ADO122
    Left = 8
    Top = 88
  end
  object DS2: TDataSource
    DataSet = ADO122_1
    Left = 8
    Top = 147
  end
  object ADO122: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     dbo.DATA0122.*, dbo.Data0010.CUST_CODE, dbo.Data0010.' +
        'CUSTOMER_NAME, dbo.Data0009.REP_CODE, dbo.Data0009.SALES_REP_NAM' +
        'E, '
      
        '                    dbo.Data0005.EMPL_CODE, dbo.Data0005.EMPLOYE' +
        'E_NAME, Data0005_1.EMPL_CODE EMPL_CODE_a , Data0005_1.EMPLOYEE_N' +
        'AME EMPLOYEE_NAME_a,'
      '                   dbo.Data0009.EMPLOYEE_PTR'
      'FROM         dbo.DATA0122 INNER JOIN'
      
        '                      dbo.Data0010 ON dbo.DATA0122.customer_ptr ' +
        '= dbo.Data0010.RKEY INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.DATA0122.create_empl_p' +
        'tr = dbo.Data0005.RKEY INNER JOIN'
      
        '                      dbo.Data0009 ON dbo.DATA0122.SALES_REP_PTR' +
        ' = dbo.Data0009.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0005 AS Data0005_1 ON dbo.DATA0122' +
        '.auth_empl_ptr = Data0005_1.RKEY')
    Left = 56
    Top = 88
    object ADO122rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO122comm_code: TStringField
      DisplayLabel = #25552#25104#20195#30721
      FieldName = 'comm_code'
      Size = 50
    end
    object ADO122customer_ptr: TIntegerField
      FieldName = 'customer_ptr'
    end
    object ADO122SALES_REP_PTR: TIntegerField
      FieldName = 'SALES_REP_PTR'
    end
    object ADO122create_empl_ptr: TIntegerField
      FieldName = 'create_empl_ptr'
    end
    object ADO122create_date: TDateTimeField
      DisplayLabel = #35745#31639#26085#26399
      FieldName = 'create_date'
    end
    object ADO122auth_empl_ptr: TIntegerField
      FieldName = 'auth_empl_ptr'
    end
    object ADO122auth_date: TDateTimeField
      DisplayLabel = #23457#26680#26085#26399
      FieldName = 'auth_date'
    end
    object ADO122coll_startdate: TDateTimeField
      DisplayLabel = #25910#27454#24320#22987#26085
      FieldName = 'coll_startdate'
    end
    object ADO122coll_enddate: TDateTimeField
      DisplayLabel = #25910#27454#32467#26463#26085
      FieldName = 'coll_enddate'
    end
    object ADO122commission: TBCDField
      DisplayLabel = #25552#25104#37329#39069
      FieldName = 'commission'
      Precision = 10
      Size = 2
    end
    object ADO122CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADO122CUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADO122REP_CODE: TStringField
      DisplayLabel = #19994#21153#21592#20195#30721
      FieldName = 'REP_CODE'
      Size = 5
    end
    object ADO122SALES_REP_NAME: TStringField
      DisplayLabel = #19994#21153#21592#21517#31216
      FieldName = 'SALES_REP_NAME'
    end
    object ADO122EMPL_CODE: TStringField
      DisplayLabel = #35745#31639#20154#21592#20195#30721
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object ADO122EMPLOYEE_NAME: TStringField
      DisplayLabel = #35745#31639#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADO122EMPL_CODE_a: TStringField
      DisplayLabel = #23457#26680#20154#21592#20195#30721
      FieldName = 'EMPL_CODE_a'
      Size = 10
    end
    object ADO122EMPLOYEE_NAME_a: TStringField
      DisplayLabel = #23457#26680#20154#21592
      FieldName = 'EMPLOYEE_NAME_a'
      Size = 16
    end
    object ADO122remark: TStringField
      FieldName = 'remark'
      Size = 200
    end
    object ADO122EMPLOYEE_PTR: TIntegerField
      FieldName = 'EMPLOYEE_PTR'
    end
  end
  object ADO123_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey122'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0123 where comm_ptr=:rkey122')
    Left = 120
    Top = 144
  end
  object ADO122_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterOpen = ADO122_1AfterOpen
    Parameters = <
      item
        Name = 'rkey122'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select  * from data0122 where rkey=:rkey122')
    Left = 56
    Top = 144
  end
  object DS4: TDataSource
    DataSet = ADO124
    Left = 8
    Top = 219
  end
  object ADO124: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterOpen = ADO124AfterOpen
    BeforeInsert = ADO124BeforeDelete
    BeforeEdit = ADO124BeforeEdit
    BeforeDelete = ADO124BeforeDelete
    Parameters = <
      item
        Name = 'rkey122'
        DataType = ftInteger
        Size = -1
        Value = 0
      end>
    SQL.Strings = (
      'SELECT     dbo.DATA0121.*, dbo.DATA0124.*,'
      
        '                  case when dbo.DATA0124.SHARE_scale is null the' +
        'n dbo.DATA0121.SHARE_scale else dbo.DATA0124.SHARE_scale end '
      '                 shareScale'
      'FROM         dbo.DATA0121 LEFT OUTER JOIN'
      
        '                      dbo.DATA0124 ON dbo.DATA0121.rkey = dbo.DA' +
        'TA0124.CATEGORY_ptr and'
      '               dbo.DATA0124.comm_ptr=:rkey122')
    Left = 56
    Top = 216
    object ADO124CATEGORY: TStringField
      DisplayLabel = #31867#21035
      FieldName = 'CATEGORY'
    end
    object ADO124shareScale: TBCDField
      DisplayLabel = #25187#27454#27604#20363'%'
      FieldName = 'shareScale'
      ReadOnly = True
      Precision = 5
      Size = 2
    end
    object ADO124SHARE_base: TBCDField
      DisplayLabel = #25187#27454#22522#25968
      FieldName = 'SHARE_base'
      OnValidate = ADO124SHARE_baseValidate
      Precision = 12
      Size = 2
    end
    object ADO124SHARE_amount: TBCDField
      DisplayLabel = #25187#27454#37329#39069
      FieldName = 'SHARE_amount'
      Precision = 12
      Size = 2
    end
    object ADO124SHARE_scale_1: TBCDField
      DisplayLabel = #25187#27454#27604#20363
      FieldName = 'SHARE_scale_1'
      Precision = 5
      Size = 2
    end
    object ADO124SHARE_scale: TBCDField
      DisplayLabel = #25187#27454#27604#20363
      FieldName = 'SHARE_scale'
      Precision = 5
      Size = 2
    end
    object ADO124CATEGORY_ptr: TIntegerField
      FieldName = 'CATEGORY_ptr'
    end
    object ADO124comm_ptr: TIntegerField
      FieldName = 'comm_ptr'
    end
    object ADO124rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object ADO123: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'D1'
        Size = -1
        Value = Null
      end
      item
        Name = 'D2'
        Size = -1
        Value = Null
      end
      item
        Name = 'rkey10'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'D3'
        Size = -1
        Value = Null
      end
      item
        Name = 'D4'
        Size = -1
        Value = Null
      end
      item
        Name = 'rkey10_1'
        Size = -1
        Value = Null
      end
      item
        Name = 'rkey122'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select A.*,A.AMOUNT+isnull(B.amount115,0)  Amount_a from'
      
        '(SELECT     dbo.Data0114.*, dbo.Data0001.CURR_CODE,dbo.Data0001.' +
        'rkey rkey01'
      'FROM         dbo.Data0114 INNER JOIN'
      
        '                      dbo.Data0001 ON dbo.Data0114.CURRECY_PTR =' +
        ' dbo.Data0001.RKEY'
      
        'where dbo.Data0114.TDATE>=:D1 and dbo.Data0114.TDATE-1<:D2 and  ' +
        'dbo.Data0114.SRCE_PTR=:rkey10 and dbo.Data0114.ttype in (1,5)  '
      'and dbo.Data0114.status<>3) A'
      ''
      'left join '
      ''
      
        '(SELECT  dbo.Data0114.RKEY , sum(dbo.Data0115.AMOUNT) AS amount1' +
        '15                   '
      'FROM        '
      '                      dbo.Data0114 INNER JOIN'
      
        '                      dbo.Data0115 ON dbo.Data0114.RKEY = dbo.Da' +
        'ta0115.SRCE_PTR INNER JOIN                   '
      
        '                      dbo.Data0116 ON dbo.Data0115.CRE_MEMO_PTR ' +
        '= dbo.Data0116.RKEY'
      
        'WHERE  dbo.Data0114.TDATE>=:D3 and dbo.Data0114.TDATE-1<:D4 and ' +
        '  dbo.Data0114.SRCE_PTR=:rkey10_1 and dbo.Data0116.MEMO_TP = 1  ' +
        'AND dbo.Data0114.TTYPE IN (1, 5)'
      'and dbo.Data0114.status<>3 group by dbo.Data0114.RKEY) B'
      'on A.rkey=B.rkey'
      ''
      
        'where A.rkey not in (select distinct invoce_ptr from data0123 wh' +
        'ere comm_ptr<>:rkey122) order by A.REFERENCE_NO')
    Left = 240
    Top = 224
  end
  object ADO126: TADOQuery
    Connection = ADOCon
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select * from data0126 where 1=0')
    Left = 120
    Top = 216
  end
end
