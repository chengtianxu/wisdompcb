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
    Top = 64
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
      'end StatusName,data0023.SUPPLIER_NAME,'
      'data0015.WAREHOUSE_NAME, data0034.Dept_Name,'
      'data0492.Cut_no,data0010.CUSTOMER_NAME,'
      'data0008.PROD_CODE, data0008.PRODUCT_NAME,'
      
        'Ent05.EMPLOYEE_NAME as EName, Author05.EMPLOYEE_NAME as AName,Co' +
        'mmit05.EMPLOYEE_NAME as CName'
      'from wzcp0088'
      'inner join data0015 on wzcp0088.FacRkey=data0015.rkey'
      'inner join data0034 on wzcp0088.DeptRkey=data0034.rkey'
      'inner join data0023 on wzcp0088.SupplierRkey=data0023.rkey'
      'inner join data0005 as Ent05 on wzcp0088.Ent_UserRkey=Ent05.rkey'
      'left join data0005 as Author05 on wzcp0088.Author=Author05.rkey'
      
        'left join data0005 as Commit05 on wzcp0088.CommitUserRkey=Commit' +
        '05 .rkey'
      'inner join data0492 on wzcp0088.PutIntoRkey=data0492.rkey'
      'left join wzcp0070 on data0492.so_no=wzcp0070.sales_order'
      'left join data0010 on wzcp0070.customer_ptr=data0010.rkey'
      'left join data0008 on data0492.bom_ptr=data0008.rkey'
      'where (1=1)')
    Left = 224
    Top = 64
    object qryMainrkey: TAutoIncField
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
    object qryMainPrice: TBCDField
      FieldName = 'Price'
      Precision = 19
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
    object qryMainWAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object qryMainDept_Name: TStringField
      FieldName = 'Dept_Name'
      Size = 30
    end
    object qryMainEName: TStringField
      FieldName = 'EName'
      Size = 16
    end
    object qryMainAName: TStringField
      FieldName = 'AName'
      Size = 16
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
    object qryMainSUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object intgrfldMainCommitUserRkey: TIntegerField
      FieldName = 'CommitUserRkey'
    end
    object qryMainCName: TStringField
      FieldName = 'CName'
      Size = 16
    end
  end
  object qryTemp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 224
    Top = 128
  end
  object qryWZCP0088: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'Rkey88'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select   * from WZCP0088 where Rkey= :Rkey88')
    Left = 144
    Top = 64
    object qryWZCP0088rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qryWZCP0088ExTernal_No: TStringField
      FieldName = 'ExTernal_No'
      Size = 50
    end
    object wdstrngfldWZCP0088ExTernal_Desc: TWideStringField
      FieldName = 'ExTernal_Desc'
      Size = 500
    end
    object qryWZCP0088Price: TBCDField
      FieldName = 'Price'
      Precision = 19
    end
    object qryWZCP0088Ent_Date: TDateTimeField
      FieldName = 'Ent_Date'
    end
    object qryWZCP0088Ent_UserRkey: TIntegerField
      FieldName = 'Ent_UserRkey'
    end
    object qryWZCP0088Author: TIntegerField
      FieldName = 'Author'
    end
    object qryWZCP0088Author_Date: TDateTimeField
      FieldName = 'Author_Date'
    end
    object qryWZCP0088FacRkey: TIntegerField
      FieldName = 'FacRkey'
    end
    object qryWZCP0088DeptRkey: TIntegerField
      FieldName = 'DeptRkey'
    end
    object qryWZCP0088SupplierRkey: TIntegerField
      FieldName = 'SupplierRkey'
    end
    object wdstrngfldWZCP0088RelPerson: TWideStringField
      FieldName = 'RelPerson'
      Size = 50
    end
    object wdstrngfldWZCP0088RelPhone: TWideStringField
      FieldName = 'RelPhone'
    end
    object wdstrngfldWZCP0088BillKind: TWideStringField
      FieldName = 'BillKind'
      Size = 100
    end
    object wdstrngfldWZCP0088PayKindDesc: TWideStringField
      FieldName = 'PayKindDesc'
      Size = 500
    end
    object wdstrngfldWZCP0088RecAddress: TWideStringField
      FieldName = 'RecAddress'
      Size = 100
    end
    object qryWZCP0088FinishDate: TDateTimeField
      FieldName = 'FinishDate'
    end
    object wdstrngfldWZCP0088Remark: TWideStringField
      FieldName = 'Remark'
      Size = 200
    end
    object qryWZCP0088Status: TIntegerField
      FieldName = 'Status'
    end
    object qryWZCP0088PutIntoRkey: TIntegerField
      FieldName = 'PutIntoRkey'
    end
    object intgrfldWZCP0088CommitUserRkey: TIntegerField
      FieldName = 'CommitUserRkey'
    end
  end
end
