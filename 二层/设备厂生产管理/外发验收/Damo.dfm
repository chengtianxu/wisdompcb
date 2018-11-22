object DM: TDM
  OldCreateOrder = False
  Left = 518
  Top = 215
  Height = 406
  Width = 405
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 64
  end
  object dsMain: TDataSource
    DataSet = qryMain
    Left = 296
    Top = 144
  end
  object qryMain: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select wzcp0088.*, case wzcp0088.Status '
      'when 0 then '#39#26410#25552#20132#39' '
      'when 1 then '#39#24453#23457#26680#39' '
      'when 2 then '#39#24050#23457#26680#39' '
      'when 3 then '#39#24050#39564#25910#39' '
      'end StatusName, data0023.SUPPLIER_NAME,'
      'data0015.WAREHOUSE_NAME, data0034.Dept_Name,'
      'data0492.Cut_no,data0010.CUSTOMER_NAME,'
      'data0008.PROD_CODE, data0008.PRODUCT_NAME,'
      'Ent05.EMPLOYEE_NAME as '#39#25552#20132#20154#21592#39','
      'Author05.EMPLOYEE_NAME as '#39#23457#26680#20154#21592#39
      'from WZCP0088'
      'inner join data0015 on wzcp0088.FacRkey=data0015.rkey'
      'inner join data0034 on wzcp0088.DeptRkey=data0034.rkey'
      'inner join data0023 on wzcp0088.SupplierRkey=data0023.rkey'
      'inner join data0005 as Ent05 on wzcp0088.Ent_UserRkey=Ent05.rkey'
      'left  join data0005 as Author05 on wzcp0088.Author=Author05.rkey'
      'inner join data0492 on wzcp0088.PutIntoRkey=data0492.rkey'
      'left join wzcp0070 on data0492.so_no=wzcp0070.sales_order'
      'left join data0010 on wzcp0070.customer_ptr=data0010.rkey'
      'left join data0008 on data0492.bom_ptr=data0008.rkey'
      'where WZCP0088.status=2 ')
    Left = 224
    Top = 144
    object qryMainrkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qryMainExTernal_No: TStringField
      FieldName = 'ExTernal_No'
      Size = 50
    end
    object wdstrngfldMainExTernal_Desc: TWideStringField
      FieldName = 'ExTernal_Desc'
      Size = 500
    end
    object qryMainEnt_Date: TDateTimeField
      FieldName = 'Ent_Date'
    end
    object qryMainEnt_UserRkey: TIntegerField
      FieldName = 'Ent_UserRkey'
    end
    object qryMainAuthor: TIntegerField
      FieldName = 'Author'
    end
    object qryMainAuthor_Date: TDateTimeField
      FieldName = 'Author_Date'
    end
    object qryMainFacRkey: TIntegerField
      FieldName = 'FacRkey'
    end
    object qryMainDeptRkey: TIntegerField
      FieldName = 'DeptRkey'
    end
    object qryMainSupplierRkey: TIntegerField
      FieldName = 'SupplierRkey'
    end
    object wdstrngfldMainRelPerson: TWideStringField
      FieldName = 'RelPerson'
      Size = 50
    end
    object wdstrngfldMainRelPhone: TWideStringField
      FieldName = 'RelPhone'
    end
    object wdstrngfldMainBillKind: TWideStringField
      FieldName = 'BillKind'
      Size = 100
    end
    object wdstrngfldMainPayKindDesc: TWideStringField
      FieldName = 'PayKindDesc'
      Size = 500
    end
    object wdstrngfldMainRecAddress: TWideStringField
      FieldName = 'RecAddress'
      Size = 100
    end
    object qryMainFinishDate: TDateTimeField
      FieldName = 'FinishDate'
    end
    object wdstrngfldMainRemark: TWideStringField
      FieldName = 'Remark'
      Size = 200
    end
    object qryMainStatus: TIntegerField
      FieldName = 'Status'
    end
    object qryMainPutIntoRkey: TIntegerField
      FieldName = 'PutIntoRkey'
    end
    object qryMainStatusName: TStringField
      FieldName = 'StatusName'
      ReadOnly = True
      Size = 6
    end
    object qryMainSUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object qryMainWAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object qryMainDept_Name: TStringField
      FieldName = 'Dept_Name'
      Size = 30
    end
    object qryMainCut_no: TStringField
      FieldName = 'Cut_no'
      FixedChar = True
      Size = 12
    end
    object qryMainCUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object qryMainPROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 15
    end
    object qryMainPRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object qryMainDSDesigner: TStringField
      FieldName = #25552#20132#20154#21592
      Size = 16
    end
    object qryMainDSDesigner2: TStringField
      FieldName = #23457#26680#20154#21592
      Size = 16
    end
    object qryMainPrice: TFloatField
      FieldName = 'Price'
    end
  end
  object qryTemp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 144
    Top = 144
  end
  object qryWZCP89: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'select WZCP0089.Rec_No, WZCP0089.External_Rkey, WZCP0089.Price a' +
        's Rec_Price, '
      
        'WZCP0089.Check_Date, WZCP0089.Check_Person, WZCP0089.Remark as R' +
        'ec_Remark,'
      'wzcp0088.*, case wzcp0088.Status '
      'when 0 then '#39#26410#25552#20132#39' '
      'when 1 then '#39#24453#23457#26680#39' '
      'when 2 then '#39#24050#23457#26680#39' '
      'when 3 then '#39#24050#39564#25910#39' '
      'end StatusName, data0023.SUPPLIER_NAME,'
      'data0015.WAREHOUSE_NAME, data0034.Dept_Name,'
      'data0492.Cut_no,data0010.CUSTOMER_NAME,'
      'data0008.PROD_CODE, data0008.PRODUCT_NAME,'
      'Ent05.EMPLOYEE_NAME as '#39#25552#20132#20154#21592#39','
      'data0005.EMPLOYEE_NAME '#39#39564#25910#20154#21592#39','
      'Author05.EMPLOYEE_NAME as '#39#23457#26680#20154#21592#39
      'from WZCP0089'
      'inner join wzcp0088 on WZCP0089.External_Rkey=wzcp0088.rkey'
      'inner join data0005 on WZCP0089.Check_Person=data0005.rkey'
      'inner join data0015 on wzcp0088.FacRkey=data0015.rkey'
      'inner join data0034 on wzcp0088.DeptRkey=data0034.rkey'
      'inner join data0023 on wzcp0088.SupplierRkey=data0023.rkey'
      'inner join data0005 as Ent05 on wzcp0088.Ent_UserRkey=Ent05.rkey'
      'left  join data0005 as Author05 on wzcp0088.Author=Author05.rkey'
      'inner join data0492 on wzcp0088.PutIntoRkey=data0492.rkey'
      'left join wzcp0070 on data0492.so_no=wzcp0070.sales_order'
      'left join data0010 on wzcp0070.customer_ptr=data0010.rkey'
      'left join data0008 on data0492.bom_ptr=data0008.rkey')
    Left = 224
    Top = 64
    object wdstrngfldWZCP89Rec_No: TWideStringField
      FieldName = 'Rec_No'
    end
    object qryWZCP89External_Rkey: TIntegerField
      FieldName = 'External_Rkey'
    end
    object qryWZCP89Check_Date: TDateTimeField
      FieldName = 'Check_Date'
    end
    object qryWZCP89Check_Person: TIntegerField
      FieldName = 'Check_Person'
    end
    object wdstrngfldWZCP89Rec_Remark: TWideStringField
      FieldName = 'Rec_Remark'
      Size = 200
    end
    object qryWZCP89rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qryWZCP89ExTernal_No: TStringField
      FieldName = 'ExTernal_No'
      Size = 50
    end
    object wdstrngfldWZCP89ExTernal_Desc: TWideStringField
      FieldName = 'ExTernal_Desc'
      Size = 500
    end
    object qryWZCP89Ent_Date: TDateTimeField
      FieldName = 'Ent_Date'
    end
    object qryWZCP89Ent_UserRkey: TIntegerField
      FieldName = 'Ent_UserRkey'
    end
    object qryWZCP89Author: TIntegerField
      FieldName = 'Author'
    end
    object qryWZCP89Author_Date: TDateTimeField
      FieldName = 'Author_Date'
    end
    object qryWZCP89FacRkey: TIntegerField
      FieldName = 'FacRkey'
    end
    object qryWZCP89DeptRkey: TIntegerField
      FieldName = 'DeptRkey'
    end
    object qryWZCP89SupplierRkey: TIntegerField
      FieldName = 'SupplierRkey'
    end
    object wdstrngfldWZCP89RelPerson: TWideStringField
      FieldName = 'RelPerson'
      Size = 50
    end
    object wdstrngfldWZCP89RelPhone: TWideStringField
      FieldName = 'RelPhone'
    end
    object wdstrngfldWZCP89BillKind: TWideStringField
      FieldName = 'BillKind'
      Size = 100
    end
    object wdstrngfldWZCP89PayKindDesc: TWideStringField
      FieldName = 'PayKindDesc'
      Size = 500
    end
    object wdstrngfldWZCP89RecAddress: TWideStringField
      FieldName = 'RecAddress'
      Size = 100
    end
    object qryWZCP89FinishDate: TDateTimeField
      FieldName = 'FinishDate'
    end
    object wdstrngfldWZCP89Remark: TWideStringField
      FieldName = 'Remark'
      Size = 200
    end
    object qryWZCP89Status: TIntegerField
      FieldName = 'Status'
    end
    object qryWZCP89PutIntoRkey: TIntegerField
      FieldName = 'PutIntoRkey'
    end
    object qryWZCP89StatusName: TStringField
      FieldName = 'StatusName'
      ReadOnly = True
      Size = 6
    end
    object qryWZCP89SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object qryWZCP89WAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object qryWZCP89Dept_Name: TStringField
      FieldName = 'Dept_Name'
      Size = 30
    end
    object qryWZCP89Cut_no: TStringField
      FieldName = 'Cut_no'
      FixedChar = True
      Size = 12
    end
    object qryWZCP89CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object qryWZCP89PROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 15
    end
    object qryWZCP89PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object qryWZCP89DSDesigner: TStringField
      FieldName = #25552#20132#20154#21592
      Size = 16
    end
    object qryWZCP89DSDesigner2: TStringField
      FieldName = #39564#25910#20154#21592
      Size = 16
    end
    object qryWZCP89DSDesigner3: TStringField
      FieldName = #23457#26680#20154#21592
      Size = 16
    end
    object qryWZCP89Rec_Price: TFloatField
      FieldName = 'Rec_Price'
    end
    object qryWZCP89Price: TFloatField
      FieldName = 'Price'
    end
  end
  object dsWZCP89: TDataSource
    DataSet = qryWZCP89
    Left = 296
    Top = 64
  end
end
