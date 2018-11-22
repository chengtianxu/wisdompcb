object DM: TDM
  OldCreateOrder = False
  Left = 445
  Top = 197
  Height = 259
  Width = 358
  object ADOConnection1: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 24
  end
  object Ado10: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     dbo.Data0010.CUST_CODE,  dbo.Data0010.ABBR_NAME, dbo.' +
        'Data0005.EMPLOYEE_NAME, '
      
        '                      dbo.Data0010.FED_TAX_ID_NO, dbo.Data0001.C' +
        'URR_NAME, dbo.Data0010.RKEY,Data0125.Proportion,'
      
        'case Data0125.iStatus when 0 then '#39#26410#23457#39' when 1 then '#39#24050#23457#39' end as s' +
        'tatus_s,Data0125.Remark,data0125.brokerage,Data0125.iStatus'
      'FROM         dbo.Data0010 INNER JOIN'
      
        '          dbo.Data0005 ON dbo.Data0010.SALES_REP_PTR = dbo.Data0' +
        '005.RKEY INNER JOIN'
      
        '          dbo.Data0001 ON dbo.Data0010.CURRENCY_PTR = dbo.Data00' +
        '01.RKEY left join'
      '          Data0125 on Data0010.RKEY=Data0125.Rkey10')
    Left = 120
    Top = 32
    object Ado10CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object Ado10ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object Ado10EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object Ado10FED_TAX_ID_NO: TStringField
      FieldName = 'FED_TAX_ID_NO'
      Size = 50
    end
    object Ado10CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object Ado10RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object Ado10Proportion: TFloatField
      FieldName = 'Proportion'
    end
    object Ado10status_s: TStringField
      FieldName = 'status_s'
      ReadOnly = True
      Size = 4
    end
    object Ado10Remark: TStringField
      FieldName = 'Remark'
    end
    object Ado10brokerage: TFloatField
      FieldName = 'brokerage'
    end
    object Ado10iStatus: TSmallintField
      FieldName = 'iStatus'
    end
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    Left = 40
    Top = 96
  end
  object DataSource1: TDataSource
    DataSet = aqd114
    Left = 44
    Top = 152
  end
  object aqd114: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = aqd114CalcFields
    CommandText = 
      'SELECT Data0114.REFERENCE_NO,Data0105.VOUCHER,Data0105.STATUS, '#13 +
      #10'       Data0114.RKEY,Data0114.TDATE,data0114.remark,Data0114.ST' +
      'ATUS AS status114, '#13#10'       Data0005.EMPLOYEE_NAME,Data0001.CURR' +
      '_CODE, '#13#10'       Data0001.CURR_NAME,Data0114.EXCHANGE_RATE, '#13#10'   ' +
      '    Data0128.BANK_NAME,Data0010.CUST_CODE, '#13#10'       Data0010.CUS' +
      'TOMER_NAME,Data0010.ABBR_NAME,Data0010.FED_TAX_ID_NO,'#13#10'       Da' +
      'ta0114.TTYPE,Data0114.AMOUNT,data0128.bal_amount,'#13#10'       Data01' +
      '14.AMOUNT-data0114.DEBIT_AMOUNT as dz_amount,'#13#10'       data0015.w' +
      'arehouse_code,data0015.ABBR_NAME as abbrname15,'#13#10'       case dat' +
      'a0114.ttype '#13#10'       when 1 then '#39#29616#38134#25910#27454#39'  when 2 then '#39#39044#25910#24080#27454#39'   wh' +
      'en 5 then '#39#36716#24080#25910#27454#39#13#10'       end as v_ttype,   case data0105.status'#13 +
      #10'       when 0 then '#39#26410#23457#26680#39'  when 1  then '#39#20250#35745#24050#23457#39' when 2  then '#39#20027#31649#24050 +
      #23457#39#13#10'       when 3  then '#39#24050#30331#24080#39'  when 4  then '#39#20986#32435#24050#23457#39' when 5 then '#39 +
      #34987#20316#24223#39' '#13#10'       end as v_status, case data0114.status  when 1  the' +
      'n '#39#26377#25928#30340#39'  when 2 then '#39#24050#28165#31639#39' '#13#10'       when 3 then '#39#24050#21462#28040#39' end as v_s' +
      'tatus114,data0114.empl_ptr,data0114.DEBIT_AMOUNT,'#13#10'       round(' +
      'Data0114.AMOUNT*Data0114.EXCHANGE_RATE,2) as stand_amount,'#13#10'    ' +
      '   data0114.PO_NUMBER,Data0114.MANU_PART_NUMBER,Data0114.all_shi' +
      'pqty,d05_2.employee_name as sales_rep_name'#13#10'       ,data0125.Pro' +
      'portion,data0125.Remark as Remark125,d12.MIN_STATE_TAX,Data0125.' +
      'brokerage'#13#10'       ,case d12.MIN_STATE_TAX when 0 then round((Dat' +
      'a0114.AMOUNT-data0114.DEBIT_AMOUNT)*Data0114.EXCHANGE_RATE,2) el' +
      'se round((Data0114.AMOUNT-data0114.DEBIT_AMOUNT)*Data0114.EXCHAN' +
      'GE_RATE/(1+ISNULL(d12.MIN_STATE_TAX,1)*0.01),2) end as NotAMOUNT' +
      ' '#13#10'       ,case d12.MIN_STATE_TAX when 0 then round((Data0114.AM' +
      'OUNT-data0114.DEBIT_AMOUNT)*Data0114.EXCHANGE_RATE*(isNUll(data0' +
      '125.Proportion,0)*0.01),2) else round((Data0114.AMOUNT-data0114.' +
      'DEBIT_AMOUNT)*Data0114.EXCHANGE_RATE/(1+ISNULL(d12.MIN_STATE_TAX' +
      ',1)*0.01)*(isNUll(data0125.Proportion,0)*0.01),2) end as pAMOUNT' +
      ' '#13#10'       ,case d12.MIN_STATE_TAX when 0 then round((Data0114.AM' +
      'OUNT-data0114.DEBIT_AMOUNT)*Data0114.EXCHANGE_RATE*(isNUll(data0' +
      '125.Proportion,0)*0.01)*0.1,2) else round((Data0114.AMOUNT-data0' +
      '114.DEBIT_AMOUNT)*Data0114.EXCHANGE_RATE/(1+ISNULL(d12.MIN_STATE' +
      '_TAX,1)*0.01)*(isNUll(data0125.Proportion,0)*0.01)*0.1,2) end as' +
      ' psAMOUNT '#13#10'       ,case d12.MIN_STATE_TAX when 0 then round((Da' +
      'ta0114.AMOUNT-data0114.DEBIT_AMOUNT)*Data0114.EXCHANGE_RATE*(isN' +
      'Ull(data0125.brokerage,0)*0.01),2) else round((Data0114.AMOUNT-d' +
      'ata0114.DEBIT_AMOUNT)*Data0114.EXCHANGE_RATE/(1+ISNULL(d12.MIN_S' +
      'TATE_TAX,1)*0.01)*(isNUll(data0125.brokerage,0)*0.01),2) end as ' +
      'pbAMOUNT '#13#10'FROM   Data0005 INNER JOIN'#13#10'       Data0114 ON Data00' +
      '05.RKEY = Data0114.EMPL_PTR INNER JOIN'#13#10'       Data0001 ON Data0' +
      '114.CURRECY_PTR = Data0001.RKEY INNER JOIN'#13#10'       Data0010 ON D' +
      'ata0114.SRCE_PTR = Data0010.RKEY INNER JOIN'#13#10'       Data0005 as ' +
      'd05_2 ON Data0010.SALES_REP_PTR = d05_2.RKEY LEFT OUTER JOIN'#13#10'  ' +
      '     Data0105 ON Data0114.RKEY = Data0105.SOURCE_PTR AND '#13#10'     ' +
      '  Data0105.TRANS_TYPE = 6 LEFT OUTER JOIN'#13#10'       Data0128 ON Da' +
      'ta0114.BANK_PTR = Data0128.RKEY left outer join '#13#10'       data001' +
      '5 on data0114.warehouse_ptr=data0015.rkey  left  join'#13#10'       da' +
      'ta0125 on data0010.Rkey=data0125.Rkey10 left join'#13#10'       (SELEC' +
      'T     TT.CUSTOMER_PTR, Data0189_1.STATE_TAX AS MIN_STATE_TAX'#13#10'FR' +
      'OM         dbo.Data0012 AS Data0012_1 INNER JOIN'#13#10'          dbo.' +
      'Data0189 AS Data0189_1 ON Data0012_1.SHIP_CTAX_PTR = Data0189_1.' +
      'RKEY INNER JOIN'#13#10'              (SELECT     dbo.Data0012.CUSTOMER' +
      '_PTR, MIN(dbo.Data0012.RKEY) AS RKEY'#13#10'                FROM      ' +
      '    dbo.Data0012 INNER JOIN'#13#10'                                   ' +
      '    dbo.Data0189 ON dbo.Data0012.SHIP_CTAX_PTR = dbo.Data0189.RK' +
      'EY'#13#10'                GROUP BY dbo.Data0012.CUSTOMER_PTR) AS TT ON' +
      ' Data0012_1.RKEY = TT.RKEY) d12 on Data0010.RKEY=d12.CUSTOMER_PT' +
      'R'#13#10'WHERE data0114.ttype in (1,2,5) and'#13#10'      (Data0114.TDATE>= ' +
      ':dtpk1)  and'#13#10'      (Data0114.TDATE<= :dtpk2) '#13#10
    IndexFieldNames = 'REFERENCE_NO'
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 38718d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 38861d
      end>
    Prepared = True
    Left = 120
    Top = 152
    object aqd114REFERENCE_NO: TStringField
      DisplayLabel = #31080#25454#32534#21495
      FieldName = 'REFERENCE_NO'
      FixedChar = True
      Size = 10
    end
    object aqd114VOUCHER: TStringField
      DisplayLabel = #20973#35777#32534#21495
      FieldName = 'VOUCHER'
      FixedChar = True
      Size = 12
    end
    object aqd114STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object aqd114RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aqd114TDATE: TDateTimeField
      DisplayLabel = #31080#25454#26085#26399
      FieldName = 'TDATE'
    end
    object aqd114status114: TWordField
      FieldName = 'status114'
    end
    object aqd114EMPLOYEE_NAME: TStringField
      DisplayLabel = #25805#20316#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object aqd114CURR_CODE: TStringField
      DisplayLabel = #36135#24065#20195#30721
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object aqd114CURR_NAME: TStringField
      DisplayLabel = #36135#24065#21517#31216
      DisplayWidth = 10
      FieldName = 'CURR_NAME'
    end
    object aqd114EXCHANGE_RATE: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'EXCHANGE_RATE'
    end
    object aqd114BANK_NAME: TStringField
      DisplayLabel = #29616#37329#38134#34892
      FieldName = 'BANK_NAME'
      Size = 30
    end
    object aqd114CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object aqd114CUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      DisplayWidth = 50
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object aqd114ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object aqd114TTYPE: TWordField
      FieldName = 'TTYPE'
    end
    object aqd114AMOUNT: TFloatField
      DisplayLabel = #31080#25454#37329#39069
      FieldName = 'AMOUNT'
    end
    object aqd114v_ttype: TStringField
      DisplayLabel = #31080#25454#31867#22411
      FieldName = 'v_ttype'
      ReadOnly = True
      Size = 8
    end
    object aqd114v_status: TStringField
      DisplayLabel = #20973#35777#29366#24577
      FieldName = 'v_status'
      ReadOnly = True
      Size = 8
    end
    object aqd114v_status114: TStringField
      DisplayLabel = #31080#25454#29366#24577
      FieldName = 'v_status114'
      ReadOnly = True
      Size = 6
    end
    object aqd114bal_amount: TFloatField
      FieldName = 'bal_amount'
    end
    object aqd114stand_amount: TFloatField
      FieldName = 'stand_amount'
      ReadOnly = True
    end
    object aqd114empl_ptr: TIntegerField
      FieldName = 'empl_ptr'
    end
    object aqd114PO_NUMBER: TStringField
      DisplayLabel = #23458#25143#35746#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object aqd114MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object aqd114all_shipqty: TIntegerField
      DisplayLabel = #20801#35768#20986#36135#25968
      FieldName = 'all_shipqty'
    end
    object aqd114remark: TStringField
      FieldName = 'remark'
      Size = 60
    end
    object aqd114DEBIT_AMOUNT: TFloatField
      DisplayLabel = #25163#32493#36153
      FieldName = 'DEBIT_AMOUNT'
    end
    object aqd114dz_amount: TFloatField
      DisplayLabel = #21040#24080#37329#39069
      FieldName = 'dz_amount'
      ReadOnly = True
    end
    object aqd114warehouse_code: TStringField
      FieldName = 'warehouse_code'
      Size = 5
    end
    object aqd114abbrname15: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'abbrname15'
      Size = 10
    end
    object aqd114Proportion: TFloatField
      FieldName = 'Proportion'
    end
    object aqd114MIN_STATE_TAX: TBCDField
      FieldName = 'MIN_STATE_TAX'
      Precision = 4
      Size = 2
    end
    object aqd114NotAMOUNT: TFloatField
      FieldName = 'NotAMOUNT'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object aqd114pAMOUNT: TFloatField
      FieldName = 'pAMOUNT'
      DisplayFormat = '0.00'
    end
    object aqd114psAMOUNT: TFloatField
      FieldName = 'psAMOUNT'
      DisplayFormat = '0.00'
    end
    object aqd114FED_TAX_ID_NO: TStringField
      FieldName = 'FED_TAX_ID_NO'
      Size = 50
    end
    object aqd114sales_rep_name: TStringField
      FieldName = 'sales_rep_name'
      Size = 16
    end
    object aqd114Remark125: TStringField
      FieldName = 'Remark125'
      Size = 100
    end
    object aqd114brokerage: TFloatField
      FieldName = 'brokerage'
    end
    object aqd114pbAMOUNT: TFloatField
      FieldName = 'pbAMOUNT'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object aqd114jMomey: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'jMomey'
      DisplayFormat = '0.00'
      Calculated = True
    end
  end
end
