object DM: TDM
  OldCreateOrder = False
  Left = 192
  Top = 114
  Height = 327
  Width = 392
  object ADO98: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
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
    SQL.Strings = (
      'select data0098.RMA_NUMBER,data0098.QTY_AUTH,'
      'case data0098.RMA_STATUS when 1 then '#39#26410#25552#20132#39' when 2  then '#39#24453#20837#20179#39
      'when 3 then '#39#24050#20837#20179#39' when 4 then '#39#24050#20805#24080#39' end as RMA_STATUS,'
      
        'case data0098.rma_type when 0 then '#39#23458#25143#36864#36135#39' when 1 then '#39#20027#21160#21484#22238#39' end' +
        ' as srma_type,'
      
        'data0098.RMA_DATE,data0010.cust_code,data0010.abbr_name,data0060' +
        '.sales_order,data0097.po_number,'
      
        'data0416.number,data0416.sys_date,data0415.number as number415,d' +
        'ata0415.sys_date as date415,'
      'case data0415.status when 1 then '#39#24453#25552#20132#39' when 2 then '#39#24453#20986#20179#39
      
        'when 3 then '#39#24050#20986#20179#39' when 4 then '#39#24050#26816#35270#39' when 5 then '#39#34987#36864#22238#39' end as sta' +
        'tus415,'
      
        'data0414.number as number414,data0414.sys_date as date414,data04' +
        '14.qty_rece,'
      'case data0414.status when 1 then '#39#26410#25552#20132#39' when 2 then '#39#24453#22788#29702#39
      'when 3 then '#39#24050#23436#25104#39' end as status414,'
      
        'data0492.CUT_NO,data0492.ISSUE_DATE,data0492.ISSUED_QTY,data0492' +
        '.rkey as rkey492,'
      
        'data0492.confirm_time,case data0492.confirm_pack when 0 then '#39#26410#30830 +
        #35748#39
      'when 1 then '#39#24050#30830#35748#39' end as confirm_pack,data0005.employee_name,'
      'data0025.MANU_PART_NUMBER,data0025.MANU_PART_DESC'
      ' from data0098'
      ' inner join data0010 on data0098.CUSTOMER_PTR=data0010.rkey'
      ' inner join data0025 on data0098.CUSTOMER_PART_PTR=data0025.rkey'
      ' left join data0060 on data0098.SO_PTR=data0060.rkey'
      ' left join data0097 on data0060.PURCHASE_ORDER_PTR=data0097.rkey'
      ' left join data0416 on data0416.rma_ptr=data0098.rkey'
      ' left join data0415 on data0098.rkey=data0415.rma_ptr'
      ' left join data0414 on data0414.d415_ptr=data0415.rkey'
      ' left join data0492 on data0492.mrb_ptr=data0414.rkey'
      ' left join data0005 on data0492.confirm_ptr=data0005.rkey'
      'where data0098.RMA_DATE>=:dtpk1 and data0098.RMA_DATE<=:dtpk2')
    Left = 176
    Top = 64
    object ADO98RMA_NUMBER: TStringField
      FieldName = 'RMA_NUMBER'
      Size = 10
    end
    object ADO98QTY_AUTH: TIntegerField
      FieldName = 'QTY_AUTH'
    end
    object ADO98RMA_STATUS: TStringField
      FieldName = 'RMA_STATUS'
      ReadOnly = True
      Size = 6
    end
    object ADO98srma_type: TStringField
      FieldName = 'srma_type'
      ReadOnly = True
      Size = 8
    end
    object ADO98RMA_DATE: TDateTimeField
      FieldName = 'RMA_DATE'
    end
    object ADO98cust_code: TStringField
      FieldName = 'cust_code'
      Size = 10
    end
    object ADO98abbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADO98sales_order: TStringField
      FieldName = 'sales_order'
      FixedChar = True
      Size = 12
    end
    object ADO98po_number: TStringField
      FieldName = 'po_number'
      Size = 32
    end
    object ADO98number: TStringField
      FieldName = 'number'
      Size = 15
    end
    object ADO98sys_date: TDateTimeField
      FieldName = 'sys_date'
    end
    object ADO98number415: TStringField
      FieldName = 'number415'
      Size = 15
    end
    object ADO98date415: TDateTimeField
      FieldName = 'date415'
    end
    object ADO98status415: TStringField
      FieldName = 'status415'
      ReadOnly = True
      Size = 6
    end
    object ADO98number414: TStringField
      FieldName = 'number414'
      Size = 15
    end
    object ADO98date414: TDateTimeField
      FieldName = 'date414'
    end
    object ADO98qty_rece: TIntegerField
      FieldName = 'qty_rece'
    end
    object ADO98status414: TStringField
      FieldName = 'status414'
      ReadOnly = True
      Size = 6
    end
    object ADO98CUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ADO98ISSUE_DATE: TDateTimeField
      FieldName = 'ISSUE_DATE'
    end
    object ADO98ISSUED_QTY: TIntegerField
      FieldName = 'ISSUED_QTY'
    end
    object ADO98confirm_time: TDateTimeField
      FieldName = 'confirm_time'
    end
    object ADO98employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ADO98rkey492: TAutoIncField
      FieldName = 'rkey492'
      ReadOnly = True
    end
    object ADO98MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADO98MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADO98confirm_pack: TStringField
      FieldName = 'confirm_pack'
      ReadOnly = True
      Size = 6
    end
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = ADO98
    Left = 248
    Top = 64
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 204
    Top = 146
  end
end
