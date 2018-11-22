object DM: TDM
  OldCreateOrder = False
  Left = 378
  Top = 125
  Height = 445
  Width = 524
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 16
  end
  object DS1: TDataSource
    DataSet = ADO213
    Left = 232
    Top = 24
  end
  object ADO213: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <
      item
        Name = 'v1'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'v2'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'v3'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'v4'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'dtpk1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT  ROW_NUMBER() OVER (ORDER BY data0213.RKEY ASC) AS XUHAO,' +
        'data0213.RKEY,data0213.MANU_PART_NUMBER,data0213. PO_NUMBER,data' +
        '0213. ANALYSIS_CODE_2,'
      
        '              data0213.MANU_PART_DESC, data0213.ORIG_SCHED_SHIP_' +
        'DATE,data0213. ORIG_REQUEST_DATE,data0213.orig_customer, '
      
        '              data0213.PARTS_ORDERED, data0213.PART_PRICE,data02' +
        '13. CURR_CODE, data0213.PO_DATE,data0213.cust_code,'
      
        '              data0213. status,data0213. user_ptr, data0213.subm' +
        'it_date,data0213.Parts_ordered*data0213.part_price as total_case' +
        ','
      
        '              data0213.audit_ptr,data0213.audit_date,data0213.so' +
        '_oldnew,data0213.is_alter,data0213.lis_num,data0213.WAREHOUSE_CO' +
        'DE,'
      
        '              data0213.Parts_ordered*data0025.unit_sq as parts_a' +
        'rea,D5_1.employee_name,D5_2.employee_name as audit_name,'
      
        '               case data0213.status when 0 then '#39#26410#25552#20132#39' when 1 the' +
        'n '#39#24050#25552#20132#39' when 2 then '#39#24050#19979#21333' '#39' when 3 then '#39#24050#23457#26680#39'  end as sstatus,'
      
        '              data0010.rkey as rkey10,Data0010.abbr_name as name' +
        '10,Data0010.customer_name,data0015.abbr_name,'
      
        '              data0213.REFERENCE_NUMBER,data0213.UsedQuantity,da' +
        'ta0213.Remark,data0213.PARTS_ORDERED-Isnull(data0213.UsedQuantit' +
        'y,0) as SL'
      
        '              ,data0213.EDI_FLAG_FOR_INVOICE,case data0213.EDI_F' +
        'LAG_FOR_INVOICE when 0 then '#39#21547#31246#39' when 1 then '#39#19981#21547#31246#39' end as EDI_FL' +
        'AG,'
      
        '              CASE WHEN Data0025.unit_sq<>0 then round(data0213.' +
        'part_price / Data0025.unit_sq,2) end as '#24179#31859#25253#20215',data0213.so_style,D' +
        '10.CUST_CODE as CUST_CODE2,'
      
        '              data0008.PROD_CODE,data0008.PRODUCT_NAME,data0213.' +
        'operateType,data0213.lineLocationId,'
      
        '              case data0213.operateType when 0 then '#39#26410#31614#36820#39' when 1' +
        ' then '#39#24050#31614#36820#39' end as stroperateType,data0213.Print2DKey'
      
        '              FROM      DATA0213 inner join data0025 on data0213' +
        '.manu_part_number=data0025.manu_part_number'
      
        '                inner join data0010 on data0213.cust_code=data00' +
        '10.cust_code'
      
        '                inner join data0015 on data0025.PROD_ROUTE_PTR=d' +
        'ata0015.rkey'
      
        '                inner join data0008 on data0025.PROD_CODE_PTR=da' +
        'ta0008.rkey'
      
        '                left outer join data0005 D5_1 on data0213.user_p' +
        'tr=D5_1.rkey'
      
        '                left outer join data0005 D5_2 on data0213.audit_' +
        'ptr=D5_2.rkey'
      
        '                left outer join Data0010 D10 on DATA0213.orig_cu' +
        'stomer=D10.ABBR_NAME'
      
        'WHERE   data0213.status<>:v1 AND data0213.status<>:v2 AND data02' +
        '13.status<>:v3  AND data0213.status<>:v4'
      
        '               and data0213.submit_date>=:dtpk1 and data0213.sub' +
        'mit_date<=:dtpk2')
    Left = 128
    Top = 104
    object ADO213RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO213MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADO213PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 32
    end
    object ADO213ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 80
    end
    object ADO213MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADO213cust_code: TStringField
      FieldName = 'cust_code'
      Size = 10
    end
    object ADO213ORIG_SCHED_SHIP_DATE: TDateTimeField
      FieldName = 'ORIG_SCHED_SHIP_DATE'
    end
    object ADO213ORIG_REQUEST_DATE: TDateTimeField
      FieldName = 'ORIG_REQUEST_DATE'
    end
    object ADO213PARTS_ORDERED: TIntegerField
      FieldName = 'PARTS_ORDERED'
    end
    object ADO213PART_PRICE: TFloatField
      FieldName = 'PART_PRICE'
    end
    object ADO213CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADO213PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object ADO213REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
      Size = 50
    end
    object ADO213WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
    end
    object ADO213orig_customer: TStringField
      FieldName = 'orig_customer'
      Size = 10
    end
    object ADO213EDI_FLAG_FOR_INVOICE: TSmallintField
      FieldName = 'EDI_FLAG_FOR_INVOICE'
    end
    object ADO213status: TWordField
      FieldName = 'status'
    end
    object ADO213user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ADO213submit_date: TDateTimeField
      FieldName = 'submit_date'
    end
    object ADO213total_case: TFloatField
      FieldName = 'total_case'
      ReadOnly = True
    end
    object ADO213sstatus: TStringField
      FieldName = 'sstatus'
      ReadOnly = True
      Size = 7
    end
    object ADO213audit_ptr: TIntegerField
      FieldName = 'audit_ptr'
    end
    object ADO213audit_date: TDateTimeField
      FieldName = 'audit_date'
    end
    object ADO213so_oldnew: TStringField
      FieldName = 'so_oldnew'
      Size = 50
    end
    object ADO213is_alter: TWordField
      FieldName = 'is_alter'
    end
    object ADO213lis_num: TStringField
      FieldName = 'lis_num'
      Size = 50
    end
    object ADO213parts_area: TFloatField
      FieldName = 'parts_area'
      ReadOnly = True
    end
    object ADO213audit_name: TStringField
      FieldName = 'audit_name'
      Size = 10
    end
    object ADO213employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ADO213rkey10: TAutoIncField
      FieldName = 'rkey10'
      ReadOnly = True
    end
    object ADO213name10: TStringField
      FieldName = 'name10'
      Size = 10
    end
    object ADO213customer_name: TStringField
      FieldName = 'customer_name'
      Size = 100
    end
    object ADO213abbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADO213Remark: TStringField
      FieldName = 'Remark'
      Size = 100
    end
    object ADO213UsedQuantity: TIntegerField
      FieldName = 'UsedQuantity'
    end
    object ADO213SL: TIntegerField
      FieldName = 'SL'
      ReadOnly = True
    end
    object ADO213EDI_FLAG: TStringField
      FieldName = 'EDI_FLAG'
      ReadOnly = True
      Size = 6
    end
    object ADO213DSDesigner: TFloatField
      FieldName = #24179#31859#25253#20215
      ReadOnly = True
    end
    object ADO213so_style: TWordField
      FieldName = 'so_style'
    end
    object ADO213CUST_CODE2: TStringField
      FieldName = 'CUST_CODE2'
      Size = 10
    end
    object ADO213PROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADO213PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADO213operateType: TWordField
      FieldName = 'operateType'
    end
    object ADO213lineLocationId: TStringField
      FieldName = 'lineLocationId'
      Size = 50
    end
    object ADO213stroperateType: TStringField
      FieldName = 'stroperateType'
      ReadOnly = True
      Size = 6
    end
    object ADO213XUHAO: TLargeintField
      FieldName = 'XUHAO'
      ReadOnly = True
    end
    object ADO213Print2DKey: TIntegerField
      FieldName = 'Print2DKey'
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 352
    Top = 288
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 280
    Top = 288
  end
  object AQ0493: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 59
    Top = 115
    object AQ0493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object AQ0493ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object AQ0493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object AQ0493SITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object AQ0493SITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object AQ0493SITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object AQ0493SITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
    object AQ0493Company_name2: TStringField
      FieldName = 'Company_name2'
      Size = 50
    end
    object AQ0493Company_name3: TStringField
      FieldName = 'Company_name3'
      Size = 50
    end
  end
  object aq192: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select artaxontax,aptaxontax,QTE_control2,ppc_control15,'
      
        '       custcitool,custciprod,suplcimat,custciship,CUSTCOPROD,cus' +
        'tcoTool'
      'from data0192')
    Left = 132
    Top = 236
    object aq192aptaxontax: TStringField
      DisplayLabel = #37327#26495#26159#21542#35780#23457
      FieldName = 'aptaxontax'
      FixedChar = True
      Size = 1
    end
    object aq192artaxontax: TStringField
      DisplayLabel = #26679#26495#26159#21542#35780#23457
      FieldName = 'artaxontax'
      FixedChar = True
      Size = 1
    end
    object aq192QTE_control2: TWordField
      DisplayLabel = #26159#21542#19968#23450#25253#20215
      FieldName = 'QTE_control2'
    end
    object aq192ppc_control15: TWordField
      DisplayLabel = #35780#23457#21069#26159#21542#36716#20135#30830#35748
      FieldName = 'ppc_control15'
    end
    object aq192custcitool: TStringField
      DisplayLabel = #26159#21542#21487#20197#36755#20837'set'
      FieldName = 'custcitool'
      FixedChar = True
      Size = 1
    end
    object aq192custciprod: TStringField
      DisplayLabel = #26159#21542#38145#23450#26087#26495#21495
      FieldName = 'custciprod'
      FixedChar = True
      Size = 1
    end
    object aq192suplcimat: TStringField
      DisplayLabel = #38500#22791#21697#21450#26679#26495#20197#22806#30340'so'#21333#20215#21487#20197#20026#38646
      FieldName = 'suplcimat'
      FixedChar = True
      Size = 1
    end
    object aq192custciship: TStringField
      DisplayLabel = #35746#21333#36755#20837#26102#19981#20801#35768#26356#25913#36135#24065
      FieldName = 'custciship'
      FixedChar = True
      Size = 1
    end
    object aq192CUSTCOPROD: TStringField
      FieldName = 'CUSTCOPROD'
      FixedChar = True
      Size = 1
    end
    object aq192custcoTool: TStringField
      FieldName = 'custcoTool'
      FixedChar = True
      Size = 1
    end
  end
  object adoB2B_Response: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'Rkey'
        DataType = ftGuid
        NumericScale = 255
        Precision = 255
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'select seqno,'
      
        'MAX(case ParamName when '#39'poNumber'#39' then ParamValue end) as '#39'POCo' +
        'de'#39','
      
        'MAX(case ParamName when '#39'itemRevision'#39' then ParamValue end) as '#39 +
        'ANALYSIS_CODE_2'#39','
      
        'MAX(case ParamName when '#39'itemCode'#39' then ParamValue end) as '#39'MANU' +
        '_PART_DESC'#39','
      
        'MAX(case ParamName when '#39'quantity'#39' then ParamValue end) as '#39'Qry'#39 +
        ','
      
        'MAX(case ParamName when '#39'shipToLocation'#39' then ParamValue end) as' +
        ' '#39'sAddress'#39','
      
        'MAX(case ParamName when '#39'lineLocationId'#39' then ParamValue end) as' +
        ' '#39'lineLocationId'#39
      'from dbo.B2B_Call_Response '
      'where CallIDKey=:Rkey'
      'group by seqno'
      'order by SeqNo')
    Left = 232
    Top = 104
    object adoB2B_Responseseqno: TIntegerField
      FieldName = 'seqno'
    end
    object adoB2B_ResponsePOCode: TStringField
      FieldName = 'POCode'
      ReadOnly = True
      Size = 250
    end
    object adoB2B_ResponseANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      ReadOnly = True
      Size = 250
    end
    object adoB2B_ResponseMANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      ReadOnly = True
      Size = 250
    end
    object adoB2B_ResponseQry: TStringField
      FieldName = 'Qry'
      ReadOnly = True
      Size = 250
    end
    object adoB2B_ResponsesAddress: TStringField
      FieldName = 'sAddress'
      ReadOnly = True
      Size = 250
    end
    object adoB2B_ResponselineLocationId: TStringField
      FieldName = 'lineLocationId'
      ReadOnly = True
      Size = 250
    end
  end
  object B2B_Call_Request: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from dbo.B2B_Call_Request')
    Left = 368
    Top = 104
    object B2B_Call_RequestIDKey: TGuidField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
    object B2B_Call_RequestCallIDkey: TGuidField
      FieldName = 'CallIDkey'
      FixedChar = True
      Size = 38
    end
    object B2B_Call_RequestParamIDkey: TGuidField
      FieldName = 'ParamIDkey'
      FixedChar = True
      Size = 38
    end
    object B2B_Call_RequestParamName: TStringField
      FieldName = 'ParamName'
      Size = 200
    end
    object B2B_Call_RequestParamValue: TStringField
      FieldName = 'ParamValue'
      Size = 500
    end
  end
  object Adotmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 424
    Top = 288
  end
  object Adotmp2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 424
    Top = 344
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'Rkey'
        DataType = ftGuid
        NumericScale = 255
        Precision = 255
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'select * from tangtmp')
    Left = 232
    Top = 168
    object IntegerField1: TIntegerField
      FieldName = 'seqno'
    end
    object StringField1: TStringField
      FieldName = 'POCode'
      ReadOnly = True
      Size = 250
    end
    object StringField2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      ReadOnly = True
      Size = 250
    end
    object StringField3: TStringField
      FieldName = 'MANU_PART_DESC'
      ReadOnly = True
      Size = 250
    end
    object StringField4: TStringField
      FieldName = 'Qry'
      ReadOnly = True
      Size = 250
    end
    object StringField5: TStringField
      FieldName = 'sAddress'
      ReadOnly = True
      Size = 250
    end
    object StringField6: TStringField
      FieldName = 'lineLocationId'
      ReadOnly = True
      Size = 250
    end
  end
end
