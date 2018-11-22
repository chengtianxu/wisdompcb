object DM: TDM
  OldCreateOrder = False
  Left = 507
  Top = 225
  Height = 322
  Width = 318
  object ADOConn: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 96
  end
  object ADO127A: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    CommandText = 
      'SELECT rkey,invoice_number,invoice_no,supp_ptr,invoice_date,acco' +
      'unt_date,matl_year,matl_month,MATL_amount,tax_amount,'#13#10'       ta' +
      'x,INV_TOTAL,remark,GL_HEADER_PTR,GLPTR_STATUS,user_ptr,ent_date,' +
      'warehouse_ptr,goods_name,tax_number,'#13#10'       total_matl_amount,t' +
      'otal_tax_amount,pause_matl_amount,pause_tax_amount     '#13#10'FROM   ' +
      'DATA0127 where rkey=:rkey127'
    Parameters = <
      item
        Name = 'rkey127'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 128
    Top = 16
    object ADO127Arkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO127Ainvoice_number: TStringField
      FieldName = 'invoice_number'
    end
    object ADO127Ainvoice_no: TStringField
      FieldName = 'invoice_no'
      Size = 10
    end
    object ADO127Asupp_ptr: TIntegerField
      FieldName = 'supp_ptr'
    end
    object ADO127Ainvoice_date: TDateTimeField
      FieldName = 'invoice_date'
    end
    object ADO127Aaccount_date: TDateTimeField
      FieldName = 'account_date'
    end
    object ADO127Amatl_year: TSmallintField
      FieldName = 'matl_year'
    end
    object ADO127Amatl_month: TSmallintField
      FieldName = 'matl_month'
    end
    object ADO127AMATL_amount: TBCDField
      FieldName = 'MATL_amount'
      Precision = 11
      Size = 2
    end
    object ADO127Atax_amount: TBCDField
      FieldName = 'tax_amount'
      Precision = 10
      Size = 2
    end
    object ADO127Atax: TBCDField
      FieldName = 'tax'
      Precision = 10
      Size = 2
    end
    object ADO127AINV_TOTAL: TBCDField
      FieldName = 'INV_TOTAL'
      Precision = 11
      Size = 2
    end
    object ADO127Aremark: TStringField
      FieldName = 'remark'
      Size = 100
    end
    object ADO127AGL_HEADER_PTR: TIntegerField
      FieldName = 'GL_HEADER_PTR'
    end
    object ADO127AGLPTR_STATUS: TBooleanField
      FieldName = 'GLPTR_STATUS'
    end
    object ADO127Auser_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ADO127Aent_date: TDateTimeField
      FieldName = 'ent_date'
    end
    object ADO127Awarehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object ADO127Agoods_name: TStringField
      FieldName = 'goods_name'
      Size = 50
    end
    object ADO127Atax_number: TStringField
      FieldName = 'tax_number'
    end
    object ADO127Atotal_matl_amount: TBCDField
      FieldName = 'total_matl_amount'
      Precision = 11
      Size = 2
    end
    object ADO127Atotal_tax_amount: TBCDField
      FieldName = 'total_tax_amount'
      Precision = 11
      Size = 2
    end
    object ADO127Apause_matl_amount: TBCDField
      FieldName = 'pause_matl_amount'
      Precision = 11
      Size = 2
    end
    object ADO127Apause_tax_amount: TBCDField
      FieldName = 'pause_tax_amount'
      Precision = 11
      Size = 2
    end
  end
  object ADO127: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT Data0127.rkey,DATA0127.invoice_number,DATA0127.invoice_no' +
      ',DATA0127.supp_ptr,Data0023.CODE,Data0023.SUPPLIER_NAME,'#13#10'      ' +
      ' Data0023.ANALYSIS_CODE1,DATA0127.invoice_date,DATA0127.account_' +
      'date,DATA0127.matl_year,DATA0127.matl_month,'#13#10'       DATA0127.MA' +
      'TL_amount,DATA0127.tax_amount,DATA0127.tax,DATA0127.INV_TOTAL,DA' +
      'TA0127.remark,'#13#10'       DATA0127.GL_HEADER_PTR,Data0105.VOUCHER,D' +
      'ATA0127.GLPTR_STATUS,Data0127.user_ptr,Data0005.employee_name,'#13#10 +
      '       CASE DATA0127.GLPTR_STATUS WHEN 0 THEN '#39#21542#39' WHEN 1 THEN '#39#26159 +
      #39' END AS GLPTR_STATUS1,Data0015.warehouse_code,'#13#10'       Data0015' +
      '.warehouse_name,Data0015.abbr_name,Data0127.ent_date,Data0127.wa' +
      'rehouse_ptr,Data0127.goods_name,Data0127.tax_number,'#13#10'       Dat' +
      'a0127.total_matl_amount,Data0127.total_tax_amount,Data0127.pause' +
      '_matl_amount,Data0127.pause_tax_amount     '#13#10'FROM   DATA0127 INN' +
      'ER JOIN'#13#10'       Data0005 ON Data0127.user_ptr=Data0005.rkey INNE' +
      'R JOIN'#13#10'       Data0023 ON DATA0127.supp_ptr = Data0023.RKEY LEF' +
      'T JOIN'#13#10'       Data0105 ON DATA0127.GL_HEADER_PTR = Data0105.RKE' +
      'Y LEFT JOIN'#13#10'       Data0015 ON Data0127.warehouse_ptr=Data0015.' +
      'RKEY '#13#10'WHERE 1=1 and DATA0127.invoice_date between :dtpk1 and :d' +
      'tpk2'
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    Left = 128
    Top = 80
    object ADO127rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO127invoice_number: TStringField
      FieldName = 'invoice_number'
    end
    object ADO127invoice_no: TStringField
      FieldName = 'invoice_no'
      Size = 10
    end
    object ADO127supp_ptr: TIntegerField
      FieldName = 'supp_ptr'
    end
    object ADO127CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object ADO127SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object ADO127ANALYSIS_CODE1: TStringField
      FieldName = 'ANALYSIS_CODE1'
    end
    object ADO127invoice_date: TDateTimeField
      FieldName = 'invoice_date'
    end
    object ADO127account_date: TDateTimeField
      FieldName = 'account_date'
    end
    object ADO127matl_year: TSmallintField
      FieldName = 'matl_year'
    end
    object ADO127matl_month: TSmallintField
      FieldName = 'matl_month'
    end
    object ADO127MATL_amount: TBCDField
      FieldName = 'MATL_amount'
      Precision = 11
      Size = 2
    end
    object ADO127tax_amount: TBCDField
      FieldName = 'tax_amount'
      Precision = 10
      Size = 2
    end
    object ADO127tax: TBCDField
      FieldName = 'tax'
      Precision = 10
      Size = 2
    end
    object ADO127INV_TOTAL: TBCDField
      FieldName = 'INV_TOTAL'
      Precision = 11
      Size = 2
    end
    object ADO127remark: TStringField
      FieldName = 'remark'
      Size = 100
    end
    object ADO127GL_HEADER_PTR: TIntegerField
      FieldName = 'GL_HEADER_PTR'
    end
    object ADO127VOUCHER: TStringField
      FieldName = 'VOUCHER'
      Size = 12
    end
    object ADO127GLPTR_STATUS: TBooleanField
      FieldName = 'GLPTR_STATUS'
    end
    object ADO127user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ADO127employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ADO127GLPTR_STATUS1: TStringField
      FieldName = 'GLPTR_STATUS1'
      ReadOnly = True
      Size = 2
    end
    object ADO127warehouse_code: TStringField
      FieldName = 'warehouse_code'
      Size = 5
    end
    object ADO127warehouse_name: TStringField
      FieldName = 'warehouse_name'
      Size = 70
    end
    object ADO127abbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADO127ent_date: TDateTimeField
      FieldName = 'ent_date'
    end
    object ADO127warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object ADO127goods_name: TStringField
      FieldName = 'goods_name'
      Size = 50
    end
    object ADO127tax_number: TStringField
      FieldName = 'tax_number'
    end
    object ADO127total_matl_amount: TBCDField
      FieldName = 'total_matl_amount'
      Precision = 11
      Size = 2
    end
    object ADO127total_tax_amount: TBCDField
      FieldName = 'total_tax_amount'
      Precision = 11
      Size = 2
    end
    object ADO127pause_matl_amount: TBCDField
      FieldName = 'pause_matl_amount'
      Precision = 11
      Size = 2
    end
    object ADO127pause_tax_amount: TBCDField
      FieldName = 'pause_tax_amount'
      Precision = 11
      Size = 2
    end
  end
  object ADO73: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    CommandText = 'select employee_ptr from data0073 where rkey=:rkey'
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
    Top = 136
    object ADO73employee_ptr: TIntegerField
      FieldName = 'employee_ptr'
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 128
    Top = 192
  end
  object DataSource1: TDataSource
    DataSet = ADO127
    Left = 200
    Top = 80
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 128
    Top = 248
  end
  object qryTmp: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 200
    Top = 192
  end
end
