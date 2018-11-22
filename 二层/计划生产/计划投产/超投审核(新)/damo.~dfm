object dm: Tdm
  OldCreateOrder = False
  Left = 487
  Top = 248
  Height = 374
  Width = 367
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 80
    Top = 112
  end
  object ads491: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT  data0491.RKEY as rkey491,data0492.rkey as rkey492,  dbo.' +
      'data0492.CUT_NO, dbo.data0492.SO_NO, dbo.data0492.ORD_REQ_QTY, d' +
      'bo.data0492.ISSUED_QTY, dbo.data0492.ISSUE_DATE, dbo.data0492.TS' +
      'TATUS, '#13#10'                      dbo.Data0025.MANU_PART_NUMBER, db' +
      'o.Data0025.MANU_PART_DESC, dbo.data0492.analysis_code_3, dbo.Dat' +
      'a0491.remark, dbo.data0492.remark AS remark492, '#13#10'              ' +
      '        CASE Data0492.ttype WHEN 0 THEN '#39#35746#21333#25237#20135#39' WHEN 1 THEN '#39#34917#26009#25237#20135 +
      #39' '#13#10'WHEN 2 THEN '#39'MRB'#37325#25237#39' WHEN 3 THEN '#39'MRB'#36820#20462#39' WHEN 4 THEN '#39#26495#21495#25237#20135#39' E' +
      'ND AS ct_type,data0025.EST_SCRAP,'#13#10'                       dbo.da' +
      'ta0492.SCH_COMPL_DATE, dbo.Data0005.EMPLOYEE_NAME, '#13#10'Data0025.un' +
      'it_sq * data0492.ORD_REQ_QTY AS area3, '#13#10' Data0025.unit_sq * dat' +
      'a0492.ISSUED_QTY AS area1, '#13#10' Data0025.unit_sq * (data0492.ISSUE' +
      'D_QTY - data0492.ORD_REQ_QTY) AS area2, '#13#10' Data0025.unit_sq*Data' +
      '0060.PARTS_ORDERED AS area_4,'#13#10'case when data0492.upanel1 >0 the' +
      'n data0492.ORD_REQ_QTY*'#13#10'cast(substring(pnl1_size,1,CHARINDEX('#39'*' +
      #39',pnl1_size)-4) as money)*'#13#10'cast(substring(pnl1_size,CHARINDEX('#39 +
      '*'#39',pnl1_size)+2,len(pnl1_size)-'#13#10'(CHARINDEX('#39'*'#39',pnl1_size)+3)) a' +
      's money)*0.000001/data0492.upanel1'#13#10'else Data0025.unit_sq * data' +
      '0492.ORD_REQ_QTY end as area3_1,'#13#10#13#10'case when data0492.upanel1 >' +
      '0 then data0492.ISSUED_QTY*'#13#10'cast(substring(pnl1_size,1,CHARINDE' +
      'X('#39'*'#39',pnl1_size)-4) as money)*'#13#10'cast(substring(pnl1_size,CHARIND' +
      'EX('#39'*'#39',pnl1_size)+2,len(pnl1_size)-'#13#10'(CHARINDEX('#39'*'#39',pnl1_size)+3' +
      ')) as money)*0.000001/data0492.upanel1'#13#10'else Data0025.unit_sq * ' +
      'data0492.ISSUED_QTY end as area1_1,'#13#10#13#10'case when data0492.upanel' +
      '1 >0 then (data0492.ISSUED_QTY - data0492.ORD_REQ_QTY)*'#13#10'cast(su' +
      'bstring(pnl1_size,1,CHARINDEX('#39'*'#39',pnl1_size)-4) as money)*'#13#10'cast' +
      '(substring(pnl1_size,CHARINDEX('#39'*'#39',pnl1_size)+2,len(pnl1_size)-'#13 +
      #10'(CHARINDEX('#39'*'#39',pnl1_size)+3)) as money)*0.000001/data0492.upane' +
      'l1'#13#10'else Data0025.unit_sq * (data0492.ISSUED_QTY - data0492.ORD_' +
      'REQ_QTY) end as area2_1,'#13#10#13#10'case when data0492.upanel1 >0 then'#13#10 +
      'cast(substring(pnl1_size,1,CHARINDEX('#39'*'#39',pnl1_size)-4) as money)' +
      '*'#13#10'cast(substring(pnl1_size,CHARINDEX('#39'*'#39',pnl1_size)+2,len(pnl1_' +
      'size)-'#13#10'(CHARINDEX('#39'*'#39',pnl1_size)+3)) as money)*0.000001/data049' +
      '2.upanel1'#13#10'else Data0025.unit_sq end as unit_sq_1,'#13#10#13#10'          ' +
      '            CASE WHEN Data0492.ORD_REQ_QTY > 0 THEN round(CAST(D' +
      'ata0491.APP_QUAN * 100 AS float) / CAST(data0492.ORD_REQ_QTY AS ' +
      'float), 2) '#13#10'                      ELSE 0 END AS ct_rate, dbo.Da' +
      'ta0491.APP_QUAN, dbo.Data0491.APP_BY_PTR, dbo.Data0010.CUST_CODE' +
      ', dbo.Data0491.APP_DATE, '#13#10'                      CASE WHEN data0' +
      '025.PARENT_PTR IS NULL THEN '#39#22806#23618#39' ELSE '#39#20869#23618#39' END AS part_type, dbo' +
      '.data0492.Con_Flag, dbo.Data0060.PARTS_ORDERED, '#13#10'              ' +
      '        dbo.Data0025.unit_sq, ROUND(dbo.data0492.ISSUED_QTY * db' +
      'o.Data0025.unit_sq, 3) AS iss_sqft, '#13#10'                      CASE' +
      ' data0492.tstatus WHEN 0 THEN '#39#24050#23457#26680#39' WHEN 1 THEN '#39#26410#23457#26680#39' END AS app' +
      '_status, Data0005_1.EMPLOYEE_NAME AS app_by_empl,'#13#10'round(data049' +
      '2.PLANNED_QTY/(1+data0025.EST_SCRAP*0.01),0,1)-data0492.ORD_REQ_' +
      'QTY as rw_caotou,data0492.PLANNED_QTY,'#13#10'round((round(data0492.PL' +
      'ANNED_QTY/(1+data0025.EST_SCRAP*0.01),0,1)-data0492.ORD_REQ_QTY)' +
      '*dbo.Data0025.unit_sq,3) as rw_caotou_mianji'#13#10',d73.USER_FULL_NAM' +
      'E,data0491.csi_ptr,data0491.ranking,case when Data0491.auth_flag' +
      '=1  then '#39#26159#24403#21069#23457#26680#20154#39' else '#39#19981#26159#24403#21069#23457#26680#20154#39' end as  '#39#24403#21069#20154#21592#23457#26680#39' ,Data0491.auth' +
      '_flag'#13#10'FROM         dbo.Data0491 INNER JOIN'#13#10'                   ' +
      '   dbo.data0492 ON dbo.Data0491.MO_PTR = dbo.data0492.rkey INNER' +
      ' JOIN'#13#10'                      dbo.Data0025 ON dbo.data0492.BOM_PT' +
      'R = dbo.Data0025.RKEY INNER JOIN'#13#10'                      dbo.Data' +
      '0005 ON dbo.data0492.CREATED_BY_PTR = dbo.Data0005.RKEY LEFT OUT' +
      'ER JOIN'#13#10'                      dbo.Data0060 ON dbo.data0492.SO_N' +
      'O = dbo.Data0060.SALES_ORDER INNER JOIN'#13#10'                      d' +
      'bo.Data0010 ON dbo.data0492.COMPLETED = dbo.Data0010.RKEY LEFT O' +
      'UTER JOIN'#13#10'                      dbo.Data0005 AS Data0005_1 ON d' +
      'bo.Data0491.APP_BY_PTR = Data0005_1.RKEY'#13#10'                      ' +
      'left  join  Data0073  d73  on Data0491.csi_ptr=d73.rkey'#13#10'where d' +
      'ata0492.TSTATUS<>2 and'#13#10'      data0492.TSTATUS<>3 and'#13#10' data0492' +
      '.TSTATUS<>4 and'#13#10'      data0492.ISSUE_DATE >=:dtpk1  and  '#13#10'    ' +
      '  data0492.ISSUE_DATE <=:dtpk2'#13#10
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 39448d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 39814d
      end>
    Left = 160
    Top = 80
    object ads491CUT_NO: TStringField
      DisplayLabel = #37197#26009#21333#21495
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ads491SO_NO: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'SO_NO'
      FixedChar = True
      Size = 12
    end
    object ads491ORD_REQ_QTY: TIntegerField
      DisplayLabel = #24453#35745#21010#25968
      FieldName = 'ORD_REQ_QTY'
    end
    object ads491ISSUED_QTY: TIntegerField
      DisplayLabel = #25237#20135#25968#37327
      FieldName = 'ISSUED_QTY'
    end
    object ads491ISSUE_DATE: TDateTimeField
      DisplayLabel = #25237#20135#26085#26399
      FieldName = 'ISSUE_DATE'
    end
    object ads491MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ads491MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ads491analysis_code_3: TStringField
      DisplayLabel = #22823#26009#35268#26684
      FieldName = 'analysis_code_3'
      Size = 50
    end
    object ads491remark: TStringField
      DisplayLabel = #36229#25237#21407#22240
      FieldName = 'remark'
      Size = 300
    end
    object ads491remark492: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark492'
      Size = 100
    end
    object ads491ct_type: TStringField
      DisplayLabel = #25237#20135#31867#22411
      FieldName = 'ct_type'
      ReadOnly = True
      Size = 8
    end
    object ads491SCH_COMPL_DATE: TDateTimeField
      DisplayLabel = #23436#24037#26085#26399
      FieldName = 'SCH_COMPL_DATE'
    end
    object ads491EMPLOYEE_NAME: TStringField
      DisplayLabel = #25237#20135#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ads491APP_QUAN: TIntegerField
      DisplayLabel = #36229#25237#25968#37327
      FieldName = 'APP_QUAN'
    end
    object ads491ct_rate: TFloatField
      DisplayLabel = #36229#25237#29575'%'
      FieldName = 'ct_rate'
      ReadOnly = True
    end
    object ads491part_type: TStringField
      DisplayLabel = #20869'/'#22806#23618
      FieldName = 'part_type'
      ReadOnly = True
      Size = 4
    end
    object ads491TSTATUS: TWordField
      FieldName = 'TSTATUS'
    end
    object ads491APP_BY_PTR: TIntegerField
      FieldName = 'APP_BY_PTR'
    end
    object ads491APP_DATE: TDateTimeField
      DisplayLabel = #23457#26680#26085#26399
      FieldName = 'APP_DATE'
    end
    object ads491Con_Flag: TSmallintField
      FieldName = 'Con_Flag'
    end
    object ads491PARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
    end
    object ads491unit_sq: TFloatField
      FieldName = 'unit_sq'
    end
    object ads491iss_sqft: TFloatField
      FieldName = 'iss_sqft'
      ReadOnly = True
    end
    object ads491CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ads491app_status: TStringField
      DisplayLabel = #23457#26680#29366#24577
      FieldName = 'app_status'
      ReadOnly = True
      Size = 6
    end
    object ads491app_by_empl: TStringField
      DisplayLabel = #23457#26680#20154
      FieldName = 'app_by_empl'
      Size = 16
    end
    object ads491rw_caotou: TFloatField
      DisplayLabel = #20154#20026#36229#25237#25968
      FieldName = 'rw_caotou'
      ReadOnly = True
    end
    object ads491PLANNED_QTY: TIntegerField
      DisplayLabel = #35745#21010#25968
      FieldName = 'PLANNED_QTY'
    end
    object ads491EST_SCRAP: TFloatField
      DisplayLabel = #25253#24223#29575'%'
      FieldName = 'EST_SCRAP'
    end
    object ads491rw_caotou_mianji: TFloatField
      DisplayLabel = #20154#20026#36229#25237#38754#31215
      FieldName = 'rw_caotou_mianji'
      ReadOnly = True
    end
    object ads491area3: TFloatField
      FieldName = 'area3'
      ReadOnly = True
    end
    object ads491area1: TFloatField
      DisplayWidth = 10
      FieldName = 'area1'
      ReadOnly = True
    end
    object ads491area2: TFloatField
      DisplayWidth = 10
      FieldName = 'area2'
      ReadOnly = True
    end
    object ads491area_4: TFloatField
      FieldName = 'area_4'
      ReadOnly = True
    end
    object ads491area3_1: TFloatField
      FieldName = 'area3_1'
      ReadOnly = True
    end
    object ads491area1_1: TFloatField
      FieldName = 'area1_1'
      ReadOnly = True
    end
    object ads491area2_1: TFloatField
      FieldName = 'area2_1'
      ReadOnly = True
    end
    object ads491unit_sq_1: TFloatField
      FieldName = 'unit_sq_1'
      ReadOnly = True
    end
    object strngfldads491USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object intgrfldads491csi_ptr: TIntegerField
      FieldName = 'csi_ptr'
    end
    object wrdfldads491ranking: TWordField
      FieldName = 'ranking'
    end
    object strngfldads491DSDesigner: TStringField
      FieldName = #24403#21069#20154#21592#23457#26680
      ReadOnly = True
      Size = 14
    end
    object ads491auth_flag: TBooleanField
      FieldName = 'auth_flag'
    end
    object atncfldads491rkey491: TAutoIncField
      FieldName = 'rkey491'
      ReadOnly = True
    end
    object atncfldads491rkey492: TAutoIncField
      FieldName = 'rkey492'
      ReadOnly = True
    end
  end
  object DataSource1: TDataSource
    DataSet = ads491
    Left = 240
    Top = 80
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 160
    Top = 152
  end
  object qrytemp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 128
    Top = 264
  end
end
