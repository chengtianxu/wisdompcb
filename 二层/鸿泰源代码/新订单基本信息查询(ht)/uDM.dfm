object DM: TDM
  OldCreateOrder = False
  Left = 566
  Top = 177
  Height = 474
  Width = 624
  object Conn: TADOConnection
    CommandTimeout = 60
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security In' +
      'fo=True;User ID=sa;Initial Catalog=wisdompcb;Data Source=192.168' +
      '.1.252'
    ConnectionTimeout = 60
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 8
    Top = 8
  end
  object DS60: TADODataSet
    Connection = Conn
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = DS60CalcFields
    CommandText = 
      'SELECT     data0010.cust_code,data0010.customer_name,data0025.AN' +
      'ALYSIS_CODE_2, '#13#10'       data0025.MANU_PART_NUMBER,data0025.MANU_' +
      'PART_DESC, data0025.AUDITED_DATE,data0025.ANALYSIS_CODE_1, data0' +
      '025.ANALYSIS_CODE_5,data0025.set_qty,'#13#10'       data0060.to_be_pla' +
      'nned,data0008.product_name,data0097.po_number, Data0060.SHIPPING' +
      '_CONTACT,Data0060.FOB,Data0060.SHIPPING_METHOD,Data0060.SHIP_CON' +
      'TACT_PHONE,'#13#10'       data0060.sales_order,data0060.orig_request_d' +
      'ate,data0023.ABBR_NAME,'#13#10'       data0025.layers,data0060.orig_sc' +
      'hed_ship_date,data0060.ISSUED_QTY, '#13#10'       data0060.qty_plannne' +
      'd,data0060.prod_rel,data0060.rkey,data0008.prod_code,'#13#10'       da' +
      'ta0025.qty_on_hand,data0060.so_tp,data0005.EMPLOYEE_NAME as SALE' +
      'S_REP_NAME,'#13#10'       data0001.curr_code,data0060.part_price,data0' +
      '060.exch_rate,data0060.ent_date, '#13#10'       data0060.status,data00' +
      '60.REFERENCE_NUMBER,data0060.parts_ordered, data0060.ANALYSIS_CO' +
      'DE_1 as '#20998#26512#20195#30721','#13#10'       data0060.parts_shipped,data0060.parts_retu' +
      'rned,data0060.parts_invoiced,data0060.conf_date,'#13#10'       CASE WH' +
      'EN data0060.parts_ordered - data0060.parts_shipped > 0 THEN data' +
      '0060.parts_ordered - data0060.parts_shipped ELSE 0 END AS parts_' +
      'needed,'#13#10'      (SELECT SUM(free_amount) FROM data0062 WHERE so_p' +
      'tr = data0060.rkey GROUP BY so_ptr) AS free_amount, '#13#10'      (SEL' +
      'ECT SUM(costfree_amount) FROM data0062 WHERE so_ptr = data0060.r' +
      'key GROUP BY so_ptr) AS freeamount, '#13#10#9'  (SELECT SUM(QTY_ON_HAND' +
      ' - QTY_ALLOC) FROM Data0053 WHERE barcode_ptr = data0060.rkey) A' +
      'S DXKC,'#13#10'       data0060.sch_date,data0060.total_add_l_price,dat' +
      'a0060.returned_ship,data0025.unit_sq AS parameter_value, '#13#10'     ' +
      '  data0060.parts_ordered * data0025.unit_sq AS sq_parts, isnull(' +
      'data0060.REPUT_APPR_BY,0) as REPUT_APPR_BY,'#13#10'      (data0060.par' +
      'ts_returned - data0060.returned_ship)  AS sq_needed1,'#13#10'     data' +
      '0060.PARTS_ORDERED+data0060.PARTS_RETURNED-isnull(data0060.REPUT' +
      '_APPR_BY,0) as pack_qianshu,'#13#10'      CASE WHEN data0060.parts_ord' +
      'ered - data0060.parts_shipped > 0 THEN (data0060.parts_ordered -' +
      ' data0060.parts_shipped) * data0025.unit_sq ELSE 0 END AS sq_nee' +
      'ded,'#13#10'      data0015.warehouse_code,data0060.so_oldnew,data0060.' +
      'RUSH_CHARGE,data0010.fed_tax_id_no,data0012.LOCATION,data0060.OR' +
      'IG_CUSTOMER,'#13#10'     case when (Data0060.PARTS_ALLOC>0) and '#13#10'    ' +
      ' (isnull(dbo.Data0025.tot_accu_matl_per_sqft,0) + isnull(dbo.Dat' +
      'a0025.tot_accu_OVHD_per_sqft,0)>0) then'#13#10'     round(( dbo.Data00' +
      '60.PARTS_ALLOC / dbo.Data0060.EXCH_RATE - '#13#10'     (isnull(dbo.Dat' +
      'a0025.tot_accu_matl_per_sqft,0) + isnull(dbo.Data0025.tot_accu_O' +
      'VHD_per_sqft,0)) * dbo.Data0025.unit_sq) /'#13#10'(dbo.Data0060.PARTS_' +
      'ALLOC / dbo.Data0060.EXCH_RATE)*100,2)else 0 end AS stand_rate'#13#10 +
      ',round((data0060.parts_ordered*Data0060.PARTS_ALLOC*((100+data00' +
      '60.RUSH_CHARGE)*0.01))/data0060.EXCH_RATE,2) as TaxAmount'#13#10', ISN' +
      'ULL(SampleCnv.SampleYN, '#39'N'#39') AS SampleYN,data0346.ROW_NAME,round' +
      '((data0060.PARTS_ALLOC *data0060.parts_ordered)/ISNull(data0060.' +
      'EXCH_RATE,1),2) as NoTaxAmount,data0025.CPJS,'#13#10'case when data008' +
      '5.TNUMBER is NULL then BOMPrice06.BPNO else data0085.TNUMBER end' +
      ' as TNUMBER,'#13#10'case when Data0085.rate_margin is NULL then BOMPri' +
      'ce06.maolilv_add else Data0085.rate_margin end as rate_margin,d5' +
      '.EMPLOYEE_NAME as poname,  cast (data0060.RemarkSO  as varchar(5' +
      '00) ) as RemarkSO ,'#13#10'd89.t144+'#39'/'#39'+d89.t68 as T68  ,d89.T56, d89.' +
      't61,'#13#10'd89.t26+'#39' '#39'+ case when  d89.T8 Is null then   '#39#39'else d89.T' +
      '8 end  +'#39' '#39'+ d89.t29+'#39'mm '#39'+d89.t93 as t93, data0010.ABBR_NAME as' +
      ' cust_a,dbo.GetSOFees2(data0060.rkey) as ofree'#13#10'FROM  Data0060 I' +
      'NNER JOIN'#13#10'      Data0010 ON Data0060.CUSTOMER_PTR = Data0010.RK' +
      'EY INNER JOIN'#13#10'      Data0025 ON Data0060.CUST_PART_PTR = Data00' +
      '25.RKEY '#13#10'              left join (select data0089.cust_part_ptr' +
      ',  data0089.tvalue as T56,d89_2.tvalue as T68,'#13#10'd89_3.tvalue as ' +
      'T29,d89_4.tvalue as T26, d89_7.tvalue as T93, d89_1.tvalue as T6' +
      '1,'#13#10'd89_10.tvalue as T144,d89_11.tvalue as T8 from data0089 --'#38459#28938 +
      '  56        '#13#10'left join data0089 d89_2 on d89_2.cust_part_ptr=da' +
      'ta0089.cust_part_ptr and d89_2.parameter_ptr=68 --'#27979#35797'  68'#13#10'left j' +
      'oin data0089 d89_1 on d89_1.cust_part_ptr=data0089.cust_part_ptr' +
      ' and d89_1.parameter_ptr=61 --'#23383#31526' 61'#13#10'left join data0089 d89_3 on' +
      ' d89_3.cust_part_ptr=data0089.cust_part_ptr and d89_3.parameter_' +
      'ptr=29 --'#26495#21402'  29'#13#10'left join data0089 d89_4 on d89_4.cust_part_ptr' +
      '=data0089.cust_part_ptr and d89_4.parameter_ptr=26 --'#22522#26448#31867#22411' 26'#13#10'le' +
      'ft join data0089 d89_7 on d89_7.cust_part_ptr=data0089.cust_part' +
      '_ptr and d89_7.parameter_ptr=93 --'#25104#21697#38108#21402'  93'#13#10'left join data0089 d' +
      '89_10 on d89_10.cust_part_ptr=data0089.cust_part_ptr and d89_10.' +
      'parameter_ptr=144 --'#25104#22411#26041#27861'  144  '#13#10'left join data0089 d89_11 on d8' +
      '9_11.cust_part_ptr=data0089.cust_part_ptr and d89_11.parameter_p' +
      'tr=8 --'#25104#21697#26495#21402'              '#13#10'where data0089.parameter_ptr=56)d89 o' +
      'n d89.cust_part_ptr=Data0060.CUST_PART_PTR    '#13#10'      INNER JOIN' +
      #13#10'      Data0097 ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY ' +
      'INNER JOIN'#13#10'      Data0008 ON Data0025.PROD_CODE_PTR = Data0008.' +
      'RKEY INNER JOIN'#13#10'      Data0001 ON Data0060.CURRENCY_PTR = Data0' +
      '001.RKEY INNER JOIN'#13#10'      Data0005 ON Data0060.COMM_ASSIGNED_BY' +
      '_E_P = Data0005.RKEY left outer join '#13#10'      data0023 on data006' +
      '0.supplier_ptr=data0023.rkey  INNER JOIN '#13#10'      data0015 on dat' +
      'a0060.ship_reg_tax_id=data0015.rkey inner join '#13#10'      data0012 ' +
      'on data0060.CUST_SHIP_ADDR_PTR=data0012.rkey left outer join'#13#10'  ' +
      '    data0085 on data0060.QTE_PTR=data0085.rkey LEFT OUTER JOIN'#13#10 +
      '      data0346 on data0085.ENGR_ROUTE_PTR=data0346.rkey LEFT OUT' +
      'ER JOIN'#13#10'      (SELECT     COPYFROMCUST_PTR, '#39'Y'#39' AS SampleYN'#13#10'  ' +
      '      FROM          dbo.Data0273'#13#10'        WHERE      (Tooling_cl' +
      'ose = 4)) AS SampleCnv ON dbo.Data0025.RKEY = SampleCnv.COPYFROM' +
      'CUST_PTR '#13#10'        left outer join  BOMPrice06 on Data0060.BP06_' +
      'ptr=BOMPrice06.IDKey'#13#10'        left join Data0005 d5 on d5.RKEY =' +
      'data0060.ENTERED_BY_EMPL_PTR'
    Parameters = <>
    Prepared = True
    Left = 112
    Top = 64
    object DS60audited: TStringField
      DisplayLabel = #29983#20135#26631#35760
      FieldKind = fkCalculated
      FieldName = 'audited'
      Calculated = True
    end
    object DS60cstatus: TStringField
      DisplayLabel = #35746#21333#29366#24577
      FieldKind = fkCalculated
      FieldName = 'cstatus'
      Calculated = True
    end
    object DS60cust_code: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'cust_code'
      Size = 10
    end
    object DS60customer_name: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'customer_name'
      Size = 100
    end
    object DS60ANALYSIS_CODE_2: TStringField
      DisplayLabel = #23458#25143#29289#26009#21495
      DisplayWidth = 30
      FieldName = 'ANALYSIS_CODE_2'
      Size = 100
    end
    object DS60MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object DS60MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      DisplayWidth = 30
      FieldName = 'MANU_PART_DESC'
      Size = 100
    end
    object DS60to_be_planned: TIntegerField
      DisplayLabel = #24453#35745#21010#25968#37327
      FieldName = 'to_be_planned'
    end
    object DS60product_name: TStringField
      DisplayLabel = #31867#22411#21517#31216
      FieldName = 'product_name'
      Size = 30
    end
    object DS60po_number: TStringField
      DisplayLabel = #23458#25143#35746#21333#21495
      FieldName = 'po_number'
      Size = 100
    end
    object DS60sales_order: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'sales_order'
      FixedChar = True
      Size = 12
    end
    object DS60layers: TWordField
      DisplayLabel = #23618#25968
      FieldName = 'layers'
    end
    object DS60qty_plannned: TIntegerField
      DisplayLabel = #35745#21010#25968#37327
      FieldName = 'qty_plannned'
    end
    object DS60prod_rel: TStringField
      FieldName = 'prod_rel'
      FixedChar = True
      Size = 1
    end
    object DS60rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object DS60prod_code: TStringField
      DisplayLabel = #31867#22411#20195#30721
      FieldName = 'prod_code'
      Size = 10
    end
    object DS60so_tp: TWordField
      FieldName = 'so_tp'
    end
    object DS60curr_code: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'curr_code'
      Size = 5
    end
    object DS60part_price: TFloatField
      DisplayLabel = #20215#26684
      FieldName = 'part_price'
    end
    object DS60exch_rate: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'exch_rate'
    end
    object DS60ent_date: TDateTimeField
      DisplayLabel = #36827#21333#26085#26399
      FieldName = 'ent_date'
    end
    object DS60status: TWordField
      FieldName = 'status'
      Visible = False
    end
    object DS60REFERENCE_NUMBER: TStringField
      DisplayLabel = #35746#21333#21442#32771
      DisplayWidth = 30
      FieldName = 'REFERENCE_NUMBER'
      Size = 50
    end
    object DS60parts_ordered: TFloatField
      DisplayLabel = #35746#36135#25968#37327
      FieldName = 'parts_ordered'
    end
    object DS60parts_shipped: TFloatField
      DisplayLabel = #24050#20132#25968#37327
      FieldName = 'parts_shipped'
    end
    object DS60parts_returned: TFloatField
      DisplayLabel = #36864#36135#25968#37327
      FieldName = 'parts_returned'
    end
    object DS60parts_invoiced: TFloatField
      DisplayLabel = #24320#31080#25968#37327
      FieldName = 'parts_invoiced'
    end
    object DS60issued_qty: TIntegerField
      DisplayLabel = #25237#20135#25968#37327
      FieldName = 'issued_qty'
      ReadOnly = True
    end
    object DS60parts_needed: TFloatField
      DisplayLabel = #27424#36135#25968#37327
      FieldName = 'parts_needed'
      ReadOnly = True
    end
    object DS60free_amount: TFloatField
      DisplayLabel = #25346#24080#37329#39069
      FieldName = 'free_amount'
      ReadOnly = True
    end
    object DS60freeamount: TFloatField
      DisplayLabel = #20813#25910#37329#39069
      FieldName = 'freeamount'
      ReadOnly = True
    end
    object DS60total_add_l_price: TFloatField
      DisplayLabel = #39069#22806#36153#29992
      FieldName = 'total_add_l_price'
    end
    object DS60returned_ship: TIntegerField
      DisplayLabel = #36864#36135#20986#36135
      FieldName = 'returned_ship'
    end
    object DS60parameter_value: TFloatField
      DisplayLabel = #21333#20803#38754#31215
      FieldName = 'parameter_value'
      ReadOnly = True
    end
    object DS60sq_needed: TFloatField
      DisplayLabel = #27424#36135#38754#31215
      FieldName = 'sq_needed'
      ReadOnly = True
    end
    object DS60sq_needed1: TFloatField
      DisplayLabel = #36864#36135#27424#36135
      FieldName = 'sq_needed1'
      ReadOnly = True
    end
    object DS60sq_parts: TFloatField
      DisplayLabel = #35746#21333#38754#31215
      FieldName = 'sq_parts'
      ReadOnly = True
    end
    object DS60qty_on_hand: TIntegerField
      DisplayLabel = #25104#21697#20179#23384
      FieldName = 'qty_on_hand'
    end
    object DS60SALES_REP_NAME: TStringField
      DisplayLabel = #19994#21153#21592
      FieldName = 'SALES_REP_NAME'
    end
    object DS60orig_request_date: TDateTimeField
      DisplayLabel = #23458#25143#20132#26399
      FieldName = 'orig_request_date'
    end
    object DS60orig_sched_ship_date: TDateTimeField
      DisplayLabel = #35745#21010#20132#26399
      FieldName = 'orig_sched_ship_date'
    end
    object DS60sch_date: TDateTimeField
      DisplayLabel = #22238#22797#25928#26399
      FieldName = 'sch_date'
    end
    object DS60ABBR_NAME: TStringField
      DisplayLabel = #22806#21457#20379#24212#21830
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object DS60warehouse_code: TStringField
      DisplayLabel = #24037#21378#20195#30721
      FieldName = 'warehouse_code'
      Size = 5
    end
    object DS60so_oldnew: TStringField
      DisplayLabel = #35746#21333#26032#26087
      FieldName = 'so_oldnew'
      FixedChar = True
      Size = 10
    end
    object DS60RUSH_CHARGE: TBCDField
      DisplayLabel = #31246#29575'(%)'
      FieldName = 'RUSH_CHARGE'
      Precision = 5
      Size = 2
    end
    object DS60fed_tax_id_no: TStringField
      DisplayLabel = #20184#27454#26041#24335
      FieldName = 'fed_tax_id_no'
      Size = 50
    end
    object DS60conf_date: TDateTimeField
      DisplayLabel = #30830#35748#26085#26399
      DisplayWidth = 10
      FieldName = 'conf_date'
    end
    object DS60LOCATION: TStringField
      DisplayLabel = #36865#36135#22320#28857
      FieldName = 'LOCATION'
      Size = 80
    end
    object dtmfldDS60AUDITED_DATE: TDateTimeField
      DisplayLabel = #23457#26680#26085#26399
      FieldName = 'AUDITED_DATE'
    end
    object DS60DXKC: TFloatField
      DisplayLabel = #35746#21333#24211#23384
      FieldName = 'DXKC'
      ReadOnly = True
    end
    object DS60REPUT_APPR_BY: TIntegerField
      DisplayLabel = #25552#20132#20837#24211#25968
      FieldName = 'REPUT_APPR_BY'
    end
    object DS60pack_qianshu: TFloatField
      DisplayLabel = #21253#35013#27424#25968
      FieldName = 'pack_qianshu'
      ReadOnly = True
    end
    object DS60TNUMBER: TStringField
      DisplayLabel = #23458#25143#35746#21333#21495
      FieldName = 'TNUMBER'
      ReadOnly = True
      Size = 50
    end
    object DS60rate_margin: TBCDField
      DisplayLabel = #27611#21033#29575'%'
      FieldName = 'rate_margin'
      ReadOnly = True
      Precision = 18
      Size = 5
    end
    object DS60ANALYSIS_CODE_1: TStringField
      DisplayLabel = #20132#36135#23610#23544
      FieldName = 'ANALYSIS_CODE_1'
      Size = 30
    end
    object DS60ANALYSIS_CODE_5: TStringField
      DisplayLabel = #21333#21482#23610#23544
      FieldName = 'ANALYSIS_CODE_5'
      Size = 30
    end
    object DS60set_qty: TIntegerField
      DisplayLabel = #20132#36135#21333#20803#25968
      FieldName = 'set_qty'
    end
    object DS60ORIG_CUSTOMER: TStringField
      DisplayLabel = #20851#32852#21407#23458#25143
      FieldName = 'ORIG_CUSTOMER'
      Size = 30
    end
    object DS60FOB: TStringField
      DisplayLabel = #21512#21516#21495
      FieldName = 'FOB'
      Size = 50
    end
    object DS60SHIPPING_CONTACT: TStringField
      DisplayLabel = #35013#36816#32852#32476#20154
      FieldName = 'SHIPPING_CONTACT'
    end
    object DS60SHIPPING_METHOD: TStringField
      DisplayLabel = #35013#36816#26041#27861
      FieldName = 'SHIPPING_METHOD'
    end
    object DS60SHIP_CONTACT_PHONE: TStringField
      DisplayLabel = #35013#36816#32852#32476#20154#30005#35805
      FieldName = 'SHIP_CONTACT_PHONE'
      Size = 14
    end
    object DS60stand_rate: TFloatField
      DisplayLabel = #26631#20934#25104#26412#27611#21033#29575'%'
      FieldName = 'stand_rate'
      ReadOnly = True
    end
    object DS60DSDesigner: TStringField
      FieldName = #20998#26512#20195#30721
    end
    object DS60TaxAmount: TFloatField
      DisplayLabel = #21547#31246#37329#39069'(RMB)'
      FieldName = 'TaxAmount'
    end
    object DS60SampleYN: TStringField
      DisplayLabel = #26159#21542#36716#37327
      FieldName = 'SampleYN'
    end
    object DS60ROW_NAME: TStringField
      DisplayLabel = #22522#20215#21517#31216
      FieldName = 'ROW_NAME'
    end
    object DS60NoTaxAmount: TFloatField
      DisplayLabel = #19981#21547#31246#26412#24065
      FieldName = 'NoTaxAmount'
      ReadOnly = True
    end
    object DS60CPJS: TStringField
      DisplayLabel = #20135#21697#38454#25968
      FieldName = 'CPJS'
      ReadOnly = True
      Size = 30
    end
    object DS60poname: TStringField
      FieldName = 'poname'
      Size = 10
    end
    object DS60t68: TStringField
      FieldName = 't68'
      Size = 30
    end
    object DS60t56: TStringField
      FieldName = 't56'
      Size = 25
    end
    object DS60T61: TStringField
      FieldName = 'T61'
    end
    object strngfldDS60t93: TStringField
      FieldName = 't93'
      Size = 35
    end
    object DS60cust_a: TStringField
      FieldName = 'cust_a'
      Size = 35
    end
    object DS60RemarkSO: TStringField
      FieldName = 'RemarkSO'
      Size = 500
    end
    object DS60ofree: TStringField
      FieldName = 'ofree'
      Size = 50
    end
  end
  object DS62: TADODataSet
    Connection = Conn
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'Select data0062.amount,data0061.category,data0062.free_amount,so' +
      '_ptr, costfree_amount'#13#10'from data0061,data0062  '#13#10'where data0062.' +
      'addl_cat_ptr=data0061.rkey'#13#10'and data0062.so_ptr=:rkey'
    DataSource = DataSource1
    IndexFieldNames = 'so_ptr'
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 112
    Top = 120
    object DS62amount: TFloatField
      FieldName = 'amount'
    end
    object DS62category: TStringField
      FieldName = 'category'
    end
    object DS62free_amount: TFloatField
      DisplayLabel = #25346#24080#37329#39069
      FieldName = 'free_amount'
    end
    object DS62so_ptr: TIntegerField
      FieldName = 'so_ptr'
    end
    object DS62costfree_amount: TFloatField
      DisplayLabel = #20813#25910#37329#39069
      FieldName = 'costfree_amount'
    end
  end
  object DataSource1: TDataSource
    DataSet = DS60
    Left = 64
    Top = 64
  end
  object DataSource2: TDataSource
    DataSet = DS62
    Left = 64
    Top = 120
  end
  object AQrySOTP: TADOQuery
    Connection = Conn
    OnCalcFields = AQrySOTPCalcFields
    Parameters = <>
    SQL.Strings = (
      
        'SELECT SUM(Data0060.PARTS_ORDERED) AS sumNumber, Data0060.so_tp,' +
        ' '
      '      SUM(Data0025.unit_sq * Data0060.PARTS_ORDERED) AS SQ'
      'FROM Data0060 INNER JOIN'
      '      Data0025 ON Data0060.CUST_PART_PTR = Data0025.RKEY'
      '')
    Left = 112
    Top = 176
    object AQrySOTPCType: TStringField
      FieldKind = fkCalculated
      FieldName = 'CType'
      Calculated = True
    end
    object AQrySOTPsumNumber: TCurrencyField
      FieldName = 'sumNumber'
    end
    object AQrySOTPso_tp: TIntegerField
      FieldName = 'so_tp'
    end
    object AQrySOTPSQ: TCurrencyField
      FieldName = 'SQ'
    end
  end
  object AQryTTYP: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security In' +
      'fo=True;User ID=sa;Initial Catalog=wisdompcb;Data Source=192.168' +
      '.1.252'
    OnCalcFields = AQryTTYPCalcFields
    Parameters = <>
    SQL.Strings = (
      'SELECT SUM(Data0060.PARTS_ORDERED) AS sumNumber, '
      
        '      SUM(Data0025.unit_sq * Data0060.PARTS_ORDERED) AS SQ, Data' +
        '0025.TTYPE'
      'FROM Data0060 INNER JOIN'
      '      Data0025 ON Data0060.CUST_PART_PTR = Data0025.RKEY'
      '')
    Left = 112
    Top = 232
    object AQryTTYPsumNumber: TFloatField
      FieldName = 'sumNumber'
      ReadOnly = True
    end
    object AQryTTYPSQ: TFloatField
      FieldName = 'SQ'
      ReadOnly = True
    end
    object AQryTTYPTTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object AQryTTYPCType: TStringField
      FieldKind = fkCalculated
      FieldName = 'CType'
      Calculated = True
    end
  end
  object AQryDD: TADOQuery
    Connection = Conn
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT TOP 100 PERCENT dbo.Data0060.SALES_ORDER, dbo.Data0060.SC' +
        'H_DATE, '
      
        '      dbo.Data0060.PARTS_ORDERED, SUM(dbo.Data0064.QUAN_SHIPPED)' +
        ' '
      
        '      AS total_shipped, cast(case when SUM(dbo.Data0064.QUAN_SHI' +
        'PPED) '
      '      * 100 / dbo.Data0060.PARTS_ORDERED is null then 0 else'
      '  SUM(dbo.Data0064.QUAN_SHIPPED) '
      
        '      * 100 / dbo.Data0060.PARTS_ORDERED end as varchar)+'#39'%'#39'  AS' +
        ' dcy'
      'FROM dbo.Data0064 RIGHT OUTER JOIN'
      
        '      dbo.Data0060 ON dbo.Data0064.SO_PTR = dbo.Data0060.RKEY AN' +
        'D '
      
        '      CONVERT(datetime, CONVERT(varchar, dbo.Data0064.DATE_ASSIG' +
        'N, 101), 101) '
      '      <= dbo.Data0060.SCH_DATE'
      '')
    Left = 112
    Top = 288
    object AQryDDSALES_ORDER: TStringField
      DisplayLabel = #38144#21806#21333#21495
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object AQryDDSCH_DATE: TDateTimeField
      DisplayLabel = #20132#26399
      FieldName = 'SCH_DATE'
    end
    object AQryDDPARTS_ORDERED: TFloatField
      DisplayLabel = #35746#21333#25968#37327
      FieldName = 'PARTS_ORDERED'
    end
    object AQryDDtotal_shipped: TIntegerField
      DisplayLabel = #35013#36816#25968#37327
      FieldName = 'total_shipped'
      ReadOnly = True
    end
    object AQryDDdcy: TStringField
      DisplayLabel = #36798#25104#29575
      FieldName = 'dcy'
      ReadOnly = True
      Size = 25
    end
  end
  object DataSource3: TDataSource
    DataSet = AQryDD
    Left = 56
    Top = 288
  end
  object AQryKH: TADOQuery
    Connection = Conn
    Parameters = <>
    SQL.Strings = (
      'SELECT SUM(d2.Sumship)*100 AS dcy, Data0010.CUSTOMER_NAME'
      'FROM Data0060 INNER JOIN'
      
        '      Data0010 ON Data0060.CUSTOMER_PTR = Data0010.RKEY LEFT OUT' +
        'ER JOIN'
      '          (SELECT Data0060.CUSTOMER_PTR, '
      
        '               d1.total_ship / SUM(Data0060.PARTS_ORDERED) AS Su' +
        'mship, '
      '               d1.total_ship'
      '         FROM Data0060 LEFT OUTER JOIN'
      '                   (SELECT SUM(Data0064.QUAN_SHIPPED) '
      
        '                        / Data0060.PARTS_ORDERED * SUM(Data0064.' +
        'QUAN_SHIPPED) '
      '                        AS total_ship, Data0060.SALES_ORDER, '
      
        '                        Data0060.PARTS_ORDERED, Data0060.CUSTOME' +
        'R_PTR'
      '                  FROM Data0064 INNER JOIN'
      
        '                        Data0060 ON Data0064.SO_PTR = Data0060.R' +
        'KEY AND '
      
        '                        CONVERT(datetime, CONVERT(varchar, Data0' +
        '064.DATE_ASSIGN, '
      '                        101), 101) <= Data0060.SCH_DATE'
      '                  WHERE (Data0060.ENT_DATE > CONVERT(DATETIME, '
      '                        '#39'2007-02-04 00:00:00'#39', 102)) AND '
      
        '                        (Data0060.ENT_DATE < CONVERT(DATETIME, '#39 +
        '2007-02-15 00:00:00'#39', '
      '                        102))'
      
        '                  GROUP BY Data0060.SALES_ORDER, Data0060.PARTS_' +
        'ORDERED, '
      '                        Data0060.CUSTOMER_PTR) d1 ON '
      '               Data0060.CUSTOMER_PTR = d1.CUSTOMER_PTR'
      '         GROUP BY Data0060.CUSTOMER_PTR, d1.total_ship) d2 ON '
      '      Data0060.CUSTOMER_PTR = d2.CUSTOMER_PTR'
      
        'WHERE (Data0060.ENT_DATE > CONVERT(DATETIME, '#39'2007-02-04 00:00:0' +
        '0'#39', 102)) AND '
      
        '      (Data0060.ENT_DATE < CONVERT(DATETIME, '#39'2007-02-15 00:00:0' +
        '0'#39', 102))'
      'GROUP BY Data0010.CUSTOMER_NAME')
    Left = 112
    Top = 344
  end
  object aqtmp: TADOQuery
    Connection = Conn
    LockType = ltReadOnly
    Parameters = <>
    Left = 160
    Top = 344
  end
  object cds0849: TClientDataSet
    Aggregates = <>
    CommandText = 
      ' select data0849.* from data0849 '#13#10' join data0419 on data0849.[D' +
      '419_ptr]=data0419.[rkey]'#13#10' where data0419.programe=:vPrograme an' +
      'd data0849.[D073_ptr]=:vD073_ptr '#13#10#13#10'order by data0849 .[FieldOr' +
      'der]'
    FilterOptions = [foCaseInsensitive]
    IndexFieldNames = 'FieldOrder'
    FetchOnDemand = False
    Params = <
      item
        DataType = ftFloat
        Name = 'vPrograme'
        ParamType = ptUnknown
        Value = 0.000000000000000000
      end
      item
        DataType = ftInteger
        Name = 'vD073_ptr'
        ParamType = ptUnknown
        Value = 0
      end>
    ProviderName = 'dsp0849'
    Left = 408
    Top = 188
    object cds0849D419_ptr: TIntegerField
      FieldName = 'D419_ptr'
    end
    object cds0849D073_ptr: TIntegerField
      FieldName = 'D073_ptr'
    end
    object cds0849FormName: TStringField
      DisplayLabel = #31383#20307#21517
      FieldName = 'FormName'
      Size = 50
    end
    object cds0849GridName: TStringField
      FieldName = 'GridName'
      Size = 50
    end
    object cds0849FieldName: TStringField
      FieldName = 'FieldName'
      Size = 50
    end
    object cds0849FieldCaption: TStringField
      DisplayLabel = #23383#27573#21517
      FieldName = 'FieldCaption'
      Size = 100
    end
    object cds0849FieldOrder: TIntegerField
      DisplayLabel = #39034#24207
      FieldName = 'FieldOrder'
    end
    object cds0849FieldWidth: TIntegerField
      DisplayLabel = #23485#24230
      FieldName = 'FieldWidth'
    end
    object cds0849IsDisplay: TBooleanField
      DisplayLabel = #26159#21542#26174#31034
      FieldName = 'IsDisplay'
    end
  end
  object dsp0849: TDataSetProvider
    DataSet = dt0849
    Options = [poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 346
    Top = 188
  end
  object dt0849: TADODataSet
    Connection = Conn
    CursorType = ctStatic
    CommandText = 
      ' select data0849.* from data0849 '#13#10' join data0419 on data0849.[D' +
      '419_ptr]=data0419.[rkey]'#13#10' where data0419.programe=:vPrograme an' +
      'd data0849.[D073_ptr]=:vD073_ptr '#13#10#13#10'order by data0849 .[FieldOr' +
      'der]'
    Parameters = <
      item
        Name = 'vPrograme'
        DataType = ftFloat
        Value = 0.000000000000000000
      end
      item
        Name = 'vD073_ptr'
        DataType = ftSmallint
        Value = 0
      end>
    Left = 292
    Top = 188
    object dt0849D419_ptr: TIntegerField
      FieldName = 'D419_ptr'
    end
    object dt0849D073_ptr: TIntegerField
      FieldName = 'D073_ptr'
    end
    object dt0849GridName: TStringField
      FieldName = 'GridName'
      Size = 50
    end
    object dt0849FieldName: TStringField
      FieldName = 'FieldName'
      Size = 50
    end
    object dt0849FieldCaption: TStringField
      FieldName = 'FieldCaption'
      Size = 100
    end
    object dt0849FieldOrder: TIntegerField
      FieldName = 'FieldOrder'
    end
    object dt0849FieldWidth: TIntegerField
      FieldName = 'FieldWidth'
    end
    object dt0849IsDisplay: TBooleanField
      FieldName = 'IsDisplay'
    end
    object dt0849FormName: TStringField
      FieldName = 'FormName'
      Size = 50
    end
  end
  object cdsRead: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 416
    Top = 104
  end
  object dspRead: TDataSetProvider
    DataSet = dtRead
    Options = [poAllowCommandText]
    Left = 352
    Top = 108
  end
  object dtRead: TADODataSet
    Connection = Conn
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      ' select data0849.* from data0849 '#13#10' join data0419 on data0849.[D' +
      '419_ptr]=data0419.[rkey]'#13#10' where data0419.programe=:vPrograme an' +
      'd data0849.[D073_ptr]=:vD073_ptr'#13#10'order by data0849 .[FieldOrder' +
      ']'
    Parameters = <
      item
        Name = 'vPrograme'
        DataType = ftFloat
        Value = 0.000000000000000000
      end
      item
        Name = 'vD073_ptr'
        DataType = ftSmallint
        Value = 0
      end>
    Left = 286
    Top = 108
  end
  object dsTotal: TDataSource
    DataSet = aqTotal
    Left = 344
    Top = 328
  end
  object aqTotal: TADOQuery
    Connection = Conn
    CursorType = ctStatic
    OnCalcFields = aqTotalCalcFields
    Parameters = <
      item
        Name = 'BPODate'
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = 'EPODate'
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = 'MANU_PART_NUMBER'
        DataType = ftString
        Size = 20
        Value = Null
      end
      item
        Name = 'WAREHOUSE1'
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = 'WAREHOUSE2'
        DataType = ftString
        Size = 50
        Value = Null
      end>
    SQL.Strings = (
      
        'Exec sp_POTotalInfo :BPODate, :EPODate, :MANU_PART_NUMBER, :WARE' +
        'HOUSE1, :WAREHOUSE2')
    Left = 424
    Top = 328
    object aqTotalMANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object aqTotalDSDesigner: TFloatField
      FieldName = #35746#21333#25968#37327
    end
    object aqTotalDSDesigner2: TFloatField
      FieldName = #25237#20135#25968#37327
    end
    object aqTotalField: TFloatField
      FieldKind = fkCalculated
      FieldName = #24453#25237#20135#25968#37327
      Calculated = True
    end
    object aqTotalDSDesigner3: TFloatField
      FieldName = #20132#36135#25968#37327
    end
    object aqTotalDSDesigner4: TFloatField
      FieldName = #36864#36135#25968#37327
    end
    object aqTotalDSDesigner13: TFloatField
      FieldName = #36864#36135#20986#36135#25968#37327
    end
    object aqTotalDSDesigner5: TFloatField
      FieldName = #27424#36135#25968#37327
    end
    object aqTotalDSDesigner6: TFloatField
      FieldName = #25253#24223#25968#37327
    end
    object aqTotalDSDesigner7: TFloatField
      FieldName = #24453#21457#25918#25968#37327
    end
    object aqTotalDSDesigner8: TFloatField
      FieldName = #23436#24037#20837#24211#25968#37327
    end
    object aqTotalDSDesigner9: TFloatField
      FieldName = #22312#21046#25968#37327
    end
    object aqTotalDSDesigner10: TFloatField
      FieldName = #25104#21697#24211#23384
    end
    object aqTotalDSDesigner11: TFloatField
      FieldName = #23614#25968#24211#23384
    end
    object aqTotalDSDesigner12: TFloatField
      FieldName = #24046#24322#25968
    end
  end
end
