object DM: TDM
  OldCreateOrder = False
  Left = 546
  Top = 286
  Height = 375
  Width = 375
  object ADOConnection1: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 144
    Top = 32
  end
  object adoMain: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.data0391.rkey, dbo.data0391.rkey71,dbo.data0391.i' +
      'qc_number, dbo.Data0070.PO_NUMBER,dbo.data0002.unit_name,dbo.dat' +
      'a0071.reason,D05_req.employee_name as req_name,dbo.data0391.rkey' +
      '17 ,'#13#10'                   dbo.Data0017.INV_PART_NUMBER,dbo.Data00' +
      '17.INV_NAME, dbo.Data0017.INV_DESCRIPTION, purchase.employee_nam' +
      'e as purchase_name,data0017.GROUP_PTR,'#13#10'                      db' +
      'o.Data0017.IES_PARAMETER_VALUE2, dbo.Data0017.IES_PARAMETER_VALU' +
      'E3, dbo.Data0017.IES_PARAMETER_VALUE4, '#13#10'                      d' +
      'bo.Data0017.IES_PARAMETER_VALUE8, dbo.Data0023.CODE, dbo.Data002' +
      '3.ABBR_NAME,dbo.data0391.supplier_model, dbo.data0391.sgs_no, '#13#10 +
      '                      dbo.data0391.sgs_date, dbo.data0391.rece_q' +
      'ty, dbo.data0391.iqc_qty, dbo.data0391.barch_no, data0496.GROUP_' +
      'DESC,'#13#10'                       dbo.data0391.appl_user_ptr,dbo.dat' +
      'a0005.employee_name, dbo.data0391.appl_date,dbo.data0391.manufac' +
      'ture_TDATE,'#13#10#9#9#9#9#9'  dbo.data0391.package_qualified,case dbo.data' +
      '0391.package_qualified when 1 then '#39#21512#26684#39' when 0 then  '#39#19981#21512#26684#39' end a' +
      's package,'#13#10#9#9#9#9#9'dbo.data0391.qty_qualified,case dbo.data0391.qt' +
      'y_qualified when 1 then '#39#21512#26684#39' when 0 then '#39#19981#21512#26684#39' end as qty,'#13#10#9#9#9#9 +
      #9'dbo.data0391.hasheepreport,case dbo.data0391.hasheepreport when' +
      ' 1 then '#39#26377#39' when 0 then '#39#26080#39' end as haReport,'#13#10'                  ' +
      '    dbo.data0391.appr_user_ptr,D05_appr.employee_name as user_ap' +
      'pr, dbo.data0391.appr_date, data0071.extra_req,'#13#10'               ' +
      '       dbo.data0391.auth_user_ptr,D05_auth.employee_name as user' +
      '_auth, dbo.data0391.auth_date, dbo.data0391.if_halogen,'#13#10'       ' +
      '               case data0391.if_halogen when 1 then '#39#26159#39' else '#39#21542#39 +
      ' end as halogen,dbo.data0391.appearance, dbo.data0023.SUPPLIER_N' +
      'AME,dbo.Data0070.SUPPLIER_POINTER,'#13#10'                      dbo.da' +
      'ta0391.part_size, dbo.data0391.part_thickness, dbo.data0391.tong' +
      '_thickness, dbo.data0391.thick_tolerance, dbo.data0391.ht_remark' +
      ', '#13#10'                      dbo.data0391.if_standard, dbo.data0391' +
      '.extrl_date, dbo.data0391.judge_result, dbo.data0391.remark, dbo' +
      '.data0391.status,DATA0073.USER_FULL_NAME AS AUDIUSER,'#13#10'         ' +
      '            case dbo.data0391.status when 1 then '#39#24453#23457#26680#39' when 2 th' +
      'en '#39#23457#26680#21512#26684#39' when 3 then '#39#23457#26680#19981#21512#26684#39' end as strStatus,dbo.Data0071.IF_C' +
      'AF,dbo.data0017.INV_PART_DESCRIPTION,'#13#10'                     case' +
      ' when data0391.stock_over = 1 then '#39#24050#20837#24211#39' else '#39#26410#20837#24211#39' end as strst' +
      'ock,data0391.stock_over'#13#10'FROM         dbo.data0391 INNER JOIN'#13#10' ' +
      '                     dbo.Data0017 ON dbo.data0391.rkey17 = dbo.D' +
      'ata0017.RKEY INNER JOIN'#13#10'                      dbo.Data0071 ON d' +
      'bo.data0391.rkey71 = dbo.Data0071.RKEY INNER JOIN'#9#9#9#9#9'  '#13#10#9#9' dbo' +
      '.Data0002 ON dbo.data0071.purchase_unit_ptr = dbo.Data0002.RKEY ' +
      'INNER JOIN'#13#10'                      dbo.Data0070 ON dbo.Data0071.P' +
      'O_PTR = dbo.Data0070.RKEY INNER JOIN'#13#10#9#9'dbo.Data0005 as purchase' +
      ' ON dbo.Data0070.employee_pointer = purchase.RKEY INNER JOIN'#13#10'  ' +
      '                    dbo.Data0023 ON dbo.Data0070.SUPPLIER_POINTE' +
      'R = dbo.Data0023.RKEY inner join '#13#10'                     dbo.data' +
      '0496 ON dbo.data0017.group_ptr=dbo.data0496.rkey inner join'#13#10#9#9#9 +
      #9#9' dbo.data0005 ON dbo.data0391.appl_user_ptr = dbo.Data0005.rke' +
      'y left join '#13#10#9#9#9#9#9'dbo.data0005 as D05_appr ON dbo.data0391.appr' +
      '_user_ptr = D05_appr.rkey left join'#13#10#9#9#9#9#9'dbo.data0005 as D05_au' +
      'th ON dbo.data0391.auth_user_ptr = D05_auth.rkey left join'#13#10#9#9#9#9 +
      #9'dbo.data0069 ON dbo.Data0069.RKEY = dbo.Data0071.rkey69 left JO' +
      'IN'#13#10#9#9#9#9#9'dbo.data0068 ON dbo.Data0068.RKEY = dbo.Data0069.PURCH_' +
      'REQ_PTR left JOIN'#13#10#9#9#9#9#9'dbo.data0005 as D05_req ON dbo.Data0068.' +
      'REQ_BY = D05_req.RKEY  LEFT OUTER JOIN'#13#10'                      db' +
      'o.Data0028 ON dbo.Data0071.INVT_PTR = dbo.Data0028.INVENTORY_PTR' +
      ' AND '#13#10'                      dbo.Data0070.SUPPLIER_POINTER = dbo' +
      '.Data0028.SUPPLIER_PTR LEFT OUTER JOIN'#13#10'                      db' +
      'o.data0805 ON dbo.Data0028.prot_report_ptr = dbo.data0805.rkey L' +
      'EFT JOIN'#13#10'                      DBO.DATA0073 ON DBO.DATA0805.AUD' +
      'I_PTR =  DBO.DATA0073.RKEY'#13#10'where appl_date>=:dtpk1 and appl_dat' +
      'e<=:dtpk2'
    IndexFieldNames = 'iqc_number'
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
    Left = 40
    Top = 96
    object adoMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adoMainiqc_number: TStringField
      DisplayLabel = 'IQC'#25253#21578#32534#21495
      FieldName = 'iqc_number'
      Size = 10
    end
    object adoMainPO_NUMBER: TStringField
      DisplayLabel = #35746#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object adoMainINV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object adoMainINV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object adoMainINV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object adoMainIES_PARAMETER_VALUE2: TStringField
      FieldName = 'IES_PARAMETER_VALUE2'
      Size = 30
    end
    object adoMainIES_PARAMETER_VALUE3: TStringField
      FieldName = 'IES_PARAMETER_VALUE3'
      Size = 30
    end
    object adoMainIES_PARAMETER_VALUE4: TStringField
      FieldName = 'IES_PARAMETER_VALUE4'
      Size = 30
    end
    object adoMainIES_PARAMETER_VALUE8: TStringField
      FieldName = 'IES_PARAMETER_VALUE8'
      Size = 30
    end
    object adoMainCODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object adoMainABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object adoMainsupplier_model: TStringField
      DisplayLabel = #22411#21495
      FieldName = 'supplier_model'
    end
    object adoMainsgs_no: TStringField
      DisplayLabel = 'SGS'#32534#21495
      FieldName = 'sgs_no'
      Size = 25
    end
    object adoMainsgs_date: TDateTimeField
      DisplayLabel = 'SGS'#27979#35797#26085#26399
      FieldName = 'sgs_date'
    end
    object adoMainrece_qty: TBCDField
      DisplayLabel = #26469#26009#25968#37327
      FieldName = 'rece_qty'
      Precision = 13
    end
    object adoMainiqc_qty: TBCDField
      DisplayLabel = #25277#26816#25968#37327
      FieldName = 'iqc_qty'
      Precision = 13
    end
    object adoMainbarch_no: TStringField
      DisplayLabel = #25209#21495
      FieldName = 'barch_no'
      Size = 100
    end
    object adoMainappl_user_ptr: TIntegerField
      FieldName = 'appl_user_ptr'
    end
    object adoMainappl_date: TDateTimeField
      DisplayLabel = #30003#35831#26085#26399
      FieldName = 'appl_date'
    end
    object adoMainappr_user_ptr: TIntegerField
      DisplayLabel = #26816#26597#20154
      FieldName = 'appr_user_ptr'
    end
    object adoMainappr_date: TDateTimeField
      DisplayLabel = #26816#26597#26085#26399
      FieldName = 'appr_date'
    end
    object adoMainauth_user_ptr: TIntegerField
      DisplayLabel = #23457#26680#20154
      FieldName = 'auth_user_ptr'
    end
    object adoMainauth_date: TDateTimeField
      DisplayLabel = #23457#26680#26085#26399
      FieldName = 'auth_date'
    end
    object adoMainif_halogen: TStringField
      FieldName = 'if_halogen'
      Size = 16
    end
    object adoMainappearance: TStringField
      DisplayLabel = #22806#35266#24773#20917
      FieldName = 'appearance'
      Size = 100
    end
    object adoMainpart_size: TStringField
      DisplayLabel = #20135#21697#23610#23544
      FieldName = 'part_size'
      Size = 16
    end
    object adoMainpart_thickness: TStringField
      DisplayLabel = #26495#26009#21402#24230
      FieldName = 'part_thickness'
      Size = 50
    end
    object adoMaintong_thickness: TBCDField
      DisplayLabel = #38108#31636#21402#24230
      FieldName = 'tong_thickness'
      Precision = 5
      Size = 2
    end
    object adoMainthick_tolerance: TStringField
      DisplayLabel = #21402#24230#20844#24046
      FieldName = 'thick_tolerance'
      Size = 15
    end
    object adoMainht_remark: TStringField
      DisplayLabel = #26159#21542#21547#38108
      FieldName = 'ht_remark'
    end
    object adoMainif_standard: TWideStringField
      DisplayLabel = #26159#21542#31526#21512#35268#33539
      FieldName = 'if_standard'
      Size = 4
    end
    object adoMainextrl_date: TDateTimeField
      DisplayLabel = #26377#25928#26399#33267
      FieldName = 'extrl_date'
    end
    object adoMainjudge_result: TStringField
      DisplayLabel = #21028#23450#32467#26524
      FieldName = 'judge_result'
      Size = 8
    end
    object adoMainremark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 100
    end
    object adoMainstatus: TIntegerField
      FieldName = 'status'
    end
    object adoMainhalogen: TStringField
      DisplayLabel = #26159#21542#21547#21348#32032
      FieldName = 'halogen'
      ReadOnly = True
      Size = 2
    end
    object adoMainemployee_name: TStringField
      DisplayLabel = #30003#35831#20154
      FieldName = 'employee_name'
      Size = 16
    end
    object adoMainuser_appr: TStringField
      DisplayLabel = #26816#26597#20154
      FieldName = 'user_appr'
      Size = 16
    end
    object adoMainuser_auth: TStringField
      DisplayLabel = #23457#26680#20154
      FieldName = 'user_auth'
      Size = 16
    end
    object adoMainrkey71: TIntegerField
      FieldName = 'rkey71'
    end
    object adoMainGROUP_PTR: TIntegerField
      FieldName = 'GROUP_PTR'
    end
    object adoMainunit_name: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'unit_name'
    end
    object adoMainpurchase_name: TStringField
      DisplayLabel = #37319#36141#21592
      FieldName = 'purchase_name'
      Size = 16
    end
    object adoMainmanufacture_TDATE: TDateTimeField
      DisplayLabel = #21046#36896#26085#26399
      FieldName = 'manufacture_TDATE'
    end
    object adoMainpackage_qualified: TBooleanField
      FieldName = 'package_qualified'
    end
    object adoMainpackage: TStringField
      DisplayLabel = #21253#35013#21512#26684
      FieldName = 'package'
      ReadOnly = True
      Size = 6
    end
    object adoMainqty_qualified: TBooleanField
      FieldName = 'qty_qualified'
    end
    object adoMainqty: TStringField
      DisplayLabel = #25968#37327#21512#26684
      FieldName = 'qty'
      ReadOnly = True
      Size = 6
    end
    object adoMainhasheepreport: TBooleanField
      FieldName = 'hasheepreport'
    end
    object adoMainhaReport: TStringField
      DisplayLabel = #26377#20986#36135#25253#21578
      FieldName = 'haReport'
      ReadOnly = True
      Size = 6
    end
    object adoMainGROUP_DESC: TStringField
      DisplayLabel = #26448#26009#31867#22411
      FieldName = 'GROUP_DESC'
      Size = 30
    end
    object adoMainreason: TStringField
      DisplayLabel = #35831#36141#21407#22240
      FieldName = 'reason'
      Size = 60
    end
    object adoMainreq_name: TStringField
      DisplayLabel = #35831#36141#20154
      FieldName = 'req_name'
      Size = 16
    end
    object adoMainextra_req: TStringField
      DisplayLabel = #29305#21035#35201#27714
      FieldName = 'extra_req'
    end
    object adoMainAUDIUSER: TStringField
      DisplayLabel = 'SGS'#23457#26680#20154
      FieldName = 'AUDIUSER'
      Size = 30
    end
    object adoMainIF_CAF: TWideStringField
      DisplayLabel = #26159#21542'CAF'
      FieldName = 'IF_CAF'
      FixedChar = True
      Size = 2
    end
    object adoMainstrStatus: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'strStatus'
      ReadOnly = True
      Size = 10
    end
    object adoMainrkey17: TIntegerField
      FieldName = 'rkey17'
    end
    object adoMainINV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object adoMainSUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object adoMainSUPPLIER_POINTER: TIntegerField
      FieldName = 'SUPPLIER_POINTER'
    end
    object adoMainstrstock: TStringField
      DisplayLabel = #26159#21542#20837#24211
      FieldName = 'strstock'
      ReadOnly = True
      Size = 6
    end
    object adoMainstock_over: TBooleanField
      FieldName = 'stock_over'
    end
  end
  object adoTime: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    Left = 312
    Top = 192
  end
  object DataSource1: TDataSource
    DataSet = adoMain
    Left = 112
    Top = 96
  end
  object adoAux: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select rkey,rkey391,quantity,quan_on_hang,batchno,manufacture_TD' +
      'ATE,extrl_date '#13#10'from data0396'#13#10'where rkey391=:rkey'#13#10'order by rk' +
      'ey'
    DataSource = DataSource1
    IndexFieldNames = 'rkey391'
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    Left = 40
    Top = 152
    object adoAuxrkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adoAuxquantity: TBCDField
      DisplayLabel = #26469#26009#25968#37327
      FieldName = 'quantity'
      Precision = 12
    end
    object adoAuxquan_on_hang: TBCDField
      DisplayLabel = #29616#26377#25968#37327
      FieldName = 'quan_on_hang'
      Precision = 12
    end
    object adoAuxbatchno: TStringField
      DisplayLabel = #25209#21495
      FieldName = 'batchno'
      Size = 30
    end
    object adoAuxmanufacture_TDATE: TDateTimeField
      DisplayLabel = #21046#36896#26085#26399
      FieldName = 'manufacture_TDATE'
    end
    object adoAuxextrl_date: TDateTimeField
      DisplayLabel = #26377#25928#26399
      FieldName = 'extrl_date'
    end
    object adoAuxrkey391: TIntegerField
      FieldName = 'rkey391'
    end
  end
  object DataSource2: TDataSource
    DataSet = adoAux
    Left = 112
    Top = 152
  end
  object DataSource3: TDataSource
    DataSet = adoField
    Left = 112
    Top = 208
  end
  object adoField: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    BeforeInsert = adoFieldBeforeInsert
    Parameters = <
      item
        Name = 'key419'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey73'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select Rkey, D419_ptr, D073_ptr, FieldName, FieldCaption, FieldO' +
        'rder, FieldWidth, IsDisplay'
      ' from data0849 '
      'where D419_ptr= :key419  and D073_ptr=:rkey73')
    Left = 40
    Top = 208
  end
  object adoTmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 312
    Top = 120
  end
  object adoPO: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT         dbo.Data0017.GROUP_PTR, dbo.Data0071.RKEY, dbo.Da' +
      'ta0071.INVT_PTR, dbo.Data0070.PO_NUMBER, dbo.Data0017.INV_PART_N' +
      'UMBER, dbo.Data0023.CODE, '#13#10'                      dbo.Data0023.A' +
      'BBR_NAME, dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION, d' +
      'bo.Data0071.QUAN_ORD,purchase.employee_name as purchase_name, '#13#10 +
      '                      cast( dbo.Data0071.QUAN_ORD - dbo.Data0071' +
      '.QUAN_REJD as decimal(13, 4))  AS NotCheck, dbo.Data0071.REQ_DAT' +
      'E, dbo.Data0071.extra_req, dbo.Data0071.IF_CAF AS CAP, '#13#10'       ' +
      '               dbo.Data0071.rohs, dbo.Data0002.UNIT_NAME, dbo.da' +
      'ta0805.SGS_NO, dbo.data0805.TestDate, '#13#10'                     CAS' +
      'E DATA0028.qte_price2 WHEN 0 THEN DATA0017.SHELF_LIFE ELSE DATA0' +
      '028.qte_price2 END AS eff_Date,'#13#10'                      CASE WHEN' +
      ' (Data0017.INV_NAME LIKE '#39'%'#26080#21348'%'#39') or (Data0017.INV_DESCRIPTION LI' +
      'KE '#39'%'#26080#21348'%'#39') THEN 1 ELSE 0 END AS halogen, '#13#10'                     ' +
      ' CASE WHEN Data0017.INV_NAME LIKE '#39'%'#26080#21348'%'#39' or (Data0017.INV_DESCRI' +
      'PTION LIKE '#39'%'#26080#21348'%'#39') THEN '#39#26159#39' ELSE '#39#21542#39' END AS halogen_cn, '#13#10'      ' +
      '                 ISNULL(dbo.Data0017.IES_PARAMETER_VALUE8,dbo.Da' +
      'ta0017.IES_PARAMETER_VALUE6)  AS HaTong, '#13#10'                     ' +
      ' CASE data0017.CRITICAL_MATL_FLAG WHEN 0 THEN '#39#21542#39' WHEN 1 THEN '#39#26159 +
      #39' END AS imp, dbo.Data0071.IF_urgency AS murgency, '#13#10'           ' +
      '           dbo.Data0015.ABBR_NAME AS hourwork, dbo.Data0017.IES_' +
      'PARAMETER_VALUE2, dbo.Data0017.IES_PARAMETER_VALUE3, '#13#10'         ' +
      '             dbo.Data0017.IES_PARAMETER_VALUE4'#13#10'FROM         dbo' +
      '.Data0071 INNER JOIN'#13#10'                      dbo.Data0017 ON dbo.' +
      'Data0071.INVT_PTR = dbo.Data0017.RKEY INNER JOIN'#13#10'              ' +
      '        dbo.Data0002 ON dbo.Data0071.PURCHASE_UNIT_PTR = dbo.Dat' +
      'a0002.RKEY INNER JOIN'#13#10'                      dbo.Data0070 ON dbo' +
      '.Data0071.PO_PTR = dbo.Data0070.RKEY INNER JOIN'#13#10#9#9#9#9#9'  dbo.Data' +
      '0005 as purchase ON dbo.Data0070.employee_pointer = purchase.RKE' +
      'Y INNER JOIN'#13#10'                      dbo.Data0023 ON dbo.Data0070' +
      '.SUPPLIER_POINTER = dbo.Data0023.RKEY INNER JOIN'#13#10'              ' +
      '        dbo.Data0015 ON dbo.Data0070.WAREHOUSE_POINTER = dbo.Dat' +
      'a0015.RKEY LEFT OUTER JOIN'#13#10'                      dbo.Data0028 O' +
      'N dbo.Data0071.INVT_PTR = dbo.Data0028.INVENTORY_PTR AND '#13#10'     ' +
      '                 dbo.Data0070.SUPPLIER_POINTER = dbo.Data0028.SU' +
      'PPLIER_PTR LEFT OUTER JOIN'#13#10'                      dbo.data0805 O' +
      'N dbo.Data0028.prot_report_ptr = dbo.data0805.rkey'#13#10'WHERE     (d' +
      'bo.Data0071.avl_flag = '#39'Y'#39') AND (dbo.Data0071.QUAN_ORD - dbo.Dat' +
      'a0071.QUAN_REJD > 0) AND (dbo.Data0070.STATUS = 5)'
    Parameters = <>
    Left = 40
    Top = 256
    object adoPORKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object adoPOINVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
    object adoPOPO_NUMBER: TStringField
      DisplayLabel = #35746#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object adoPOINV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object adoPOCODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object adoPOABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object adoPOINV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object adoPOINV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object adoPOQUAN_ORD: TFloatField
      DisplayLabel = #37319#36141#25968#37327
      FieldName = 'QUAN_ORD'
    end
    object adoPONotCheck: TFloatField
      DisplayLabel = #24453#26816#26597#25968#37327
      FieldName = 'NotCheck'
      ReadOnly = True
    end
    object adoPOREQ_DATE: TDateTimeField
      DisplayLabel = #21040#36135#26085#26399
      FieldName = 'REQ_DATE'
    end
    object adoPOextra_req: TStringField
      DisplayLabel = #22411#21495
      FieldName = 'extra_req'
    end
    object adoPOCAP: TStringField
      DisplayLabel = #32784'CAF'
      FieldName = 'CAP'
      Size = 2
    end
    object adoPOrohs: TStringField
      DisplayLabel = #29615#20445#31561#32423
      FieldName = 'rohs'
      Size = 10
    end
    object adoPOUNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object adoPOSGS_NO: TStringField
      DisplayLabel = 'SGS'#32534#21495
      FieldName = 'SGS_NO'
      Size = 25
    end
    object adoPOTestDate: TDateTimeField
      DisplayLabel = 'SGS'#27979#35797#26085#26399
      FieldName = 'TestDate'
    end
    object adoPOhalogen: TIntegerField
      DisplayLabel = #26159#21542#21348#32032
      FieldName = 'halogen'
      ReadOnly = True
    end
    object adoPOHaTong: TStringField
      DisplayLabel = #26159#21542#21547#38108
      FieldName = 'HaTong'
      Size = 30
    end
    object adoPOimp: TStringField
      DisplayLabel = #37325#35201
      FieldName = 'imp'
      ReadOnly = True
      Size = 2
    end
    object adoPOmurgency: TBooleanField
      DisplayLabel = #32039#24613
      FieldName = 'murgency'
    end
    object adoPOhourwork: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'hourwork'
      Size = 10
    end
    object adoPOGroup_ptr: TIntegerField
      FieldName = 'Group_ptr'
    end
    object adoPOIES_PARAMETER_VALUE2: TStringField
      DisplayLabel = #26495#26009#21402#24230
      FieldName = 'IES_PARAMETER_VALUE2'
      Size = 30
    end
    object adoPOIES_PARAMETER_VALUE3: TStringField
      DisplayLabel = #38108#31636#21402#24230
      FieldName = 'IES_PARAMETER_VALUE3'
      Size = 30
    end
    object adoPOIES_PARAMETER_VALUE4: TStringField
      DisplayLabel = #26495#26009#23610#23544
      FieldName = 'IES_PARAMETER_VALUE4'
      Size = 30
    end
    object adoPOhalogen_cn: TStringField
      DisplayLabel = #26080#21348#32032
      FieldName = 'halogen_cn'
      ReadOnly = True
      Size = 2
    end
    object adoPOeff_Date: TIntegerField
      FieldName = 'eff_Date'
      ReadOnly = True
    end
    object adoPOpurchase_name: TStringField
      DisplayLabel = #37319#36141#21592
      FieldName = 'purchase_name'
      Size = 16
    end
  end
  object DataSource4: TDataSource
    DataSet = adoPO
    Left = 112
    Top = 256
  end
  object adoBadRecord: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select QC_IQCBadRecord.rkey, QC_IQCBadRecord.rkey23, QC_IQCBadRe' +
      'cord.rkey17, QC_IQCBadRecord.DiscoverDate'#13#10#9#9', QC_IQCBadRecord.B' +
      'atchNO, QC_IQCBadRecord.BadQuantity, QC_IQCBadRecord.BadRemark, ' +
      'QC_IQCBadRecord.Result'#13#10#9#9', IsReport, QC_IQCBadRecord.IsClose, Q' +
      'C_IQCBadRecord.Status, QC_IQCBadRecord.TrancertMen, QC_IQCBadRec' +
      'ord.ModiDate'#13#10#9#9', data0023.SUPPLIER_NAME,data0023.CODE,data0017.' +
      'INV_PART_NUMBER,data0017.INV_PART_DESCRIPTION'#13#10#9#9', DATA0073.USER' +
      '_FULL_NAME,DATA0073.USER_LOGIN_NAME,data0023.abbr_name'#13#10'        ' +
      '                        , case QC_IQCBadRecord.Status when  0 th' +
      'en '#39#24453#30830#35748#39' when 1 then '#39#24050#23436#25104#39' end as str_status'#13#10'from QC_IQCBadReco' +
      'rd inner join '#13#10#9#9'data0023 on QC_IQCBadRecord.rkey23=data0023.rk' +
      'ey inner join'#13#10#9#9'data0017 on QC_IQCBadRecord.rkey17=data0017.rke' +
      'y left join '#13#10#9#9'data0073 on QC_IQCBadRecord.trancertmen=data0073' +
      '.rkey'
    IndexFieldNames = 'code'
    Parameters = <>
    Left = 224
    Top = 272
    object adoBadRecordrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adoBadRecordrkey23: TIntegerField
      FieldName = 'rkey23'
    end
    object adoBadRecordrkey17: TIntegerField
      FieldName = 'rkey17'
    end
    object adoBadRecordDiscoverDate: TDateTimeField
      DisplayLabel = #21457#29983#26085#26399
      FieldName = 'DiscoverDate'
    end
    object adoBadRecordBatchNO: TStringField
      DisplayLabel = #19981#33391#25209#21495
      FieldName = 'BatchNO'
      Size = 40
    end
    object adoBadRecordBadQuantity: TBCDField
      DisplayLabel = #19981#33391#25968#37327'/'#19981#33391#29575'%'
      FieldName = 'BadQuantity'
      Precision = 10
      Size = 2
    end
    object adoBadRecordBadRemark: TStringField
      DisplayLabel = #19981#33391#38382#39064#28857
      FieldName = 'BadRemark'
      Size = 200
    end
    object adoBadRecordResult: TStringField
      DisplayLabel = #22788#29702#32467#26524
      FieldName = 'Result'
      Size = 200
    end
    object adoBadRecordIsReport: TBooleanField
      DisplayLabel = #21457#36865'8D'#25253#21578
      FieldName = 'IsReport'
    end
    object adoBadRecordIsClose: TBooleanField
      DisplayLabel = #36319#36827#20851#38381
      FieldName = 'IsClose'
    end
    object adoBadRecordStatus: TWordField
      FieldName = 'Status'
    end
    object adoBadRecordTrancertMen: TIntegerField
      DisplayLabel = #36319#36827#20154
      FieldName = 'TrancertMen'
    end
    object adoBadRecordModiDate: TDateTimeField
      DisplayLabel = #26368#21518#20462#25913#26102#38388
      FieldName = 'ModiDate'
    end
    object adoBadRecordSUPPLIER_NAME: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object adoBadRecordCODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object adoBadRecordINV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object adoBadRecordINV_PART_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object adoBadRecordUSER_FULL_NAME: TStringField
      DisplayLabel = #36319#36827#20154
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object adoBadRecordUSER_LOGIN_NAME: TStringField
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object adoBadRecordstr_status: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'str_status'
      ReadOnly = True
      Size = 6
    end
    object adoBadRecordabbr_name: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'abbr_name'
      Size = 16
    end
  end
  object dsBadRecord: TDataSource
    DataSet = adoBadRecord
    Left = 288
    Top = 272
  end
end
