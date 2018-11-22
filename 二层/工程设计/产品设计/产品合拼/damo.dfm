object dm: Tdm
  OldCreateOrder = False
  Left = 407
  Top = 324
  Height = 343
  Width = 359
  object con1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdompcb1077;Persist Security Info' +
      '=True;User ID=sa;Initial Catalog=sj_v20_live;Data Source=172.16.' +
      '68.8'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 232
    Top = 144
  end
  object tblSpellCondition: TADOTable
    Connection = con1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    OnNewRecord = tblSpellConditionNewRecord
    TableName = 'SpellCondition'
    Left = 40
    Top = 8
    object tblSpellConditionLevelMore: TWordField
      DisplayLabel = #22810#23618
      FieldName = 'LevelMore'
    end
    object tblSpellConditionParam_PTR: TIntegerField
      FieldName = 'Param_PTR'
      Visible = False
    end
    object tblSpellConditionParam_Name: TStringField
      DisplayLabel = #21442#25968#21517
      DisplayWidth = 12
      FieldKind = fkLookup
      FieldName = 'Param_Name'
      LookupDataSet = qry278
      LookupKeyFields = 'RKEY'
      LookupResultField = 'PARAMETER_DESC'
      KeyFields = 'Param_PTR'
      LookupCache = True
      Lookup = True
    end
    object tblSpellConditionIsDifferent: TWordField
      DisplayLabel = #21442#25968#19981#21516
      FieldName = 'IsDifferent'
    end
    object tblSpellConditionPARAMETER_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'PARAMETER_NAME'
      LookupDataSet = qry278
      LookupKeyFields = 'RKEY'
      LookupResultField = 'PARAMETER_NAME'
      KeyFields = 'Param_PTR'
      LookupCache = True
      Size = 10
      Lookup = True
    end
  end
  object qry278: TADOQuery
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select RKEY,PARAMETER_NAME,PARAMETER_DESC from data0278(NOLOCK)')
    Left = 240
    Top = 8
    object qry278RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qry278PARAMETER_NAME: TStringField
      FieldName = 'PARAMETER_NAME'
      Size = 10
    end
    object qry278PARAMETER_DESC: TStringField
      FieldName = 'PARAMETER_DESC'
    end
  end
  object dsSpellCondition: TDataSource
    DataSet = tblSpellCondition
    Left = 40
    Top = 64
  end
  object dsPOFrom: TDataSource
    DataSet = qryPOFrom
    Left = 40
    Top = 160
  end
  object qryPOFrom: TADOQuery
    Connection = con1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    DataSource = dsSpellCondition
    Parameters = <>
    SQL.Strings = (
      'Exec sp_FindSpell')
    Left = 40
    Top = 112
    object qryPOFromRKEY25: TIntegerField
      DisplayWidth = 50
      FieldName = 'RKEY25'
    end
    object qryPOFromRKEY60: TIntegerField
      DisplayWidth = 50
      FieldName = 'RKEY60'
    end
    object qryPOFromDSDesigner: TStringField
      DisplayWidth = 80
      FieldName = #38144#21806#35746#21333
      FixedChar = True
      Size = 12
    end
    object qryPOFromDSDesigner2: TStringField
      DisplayWidth = 80
      FieldName = #26412#21378#32534#21495
    end
    object qryPOFromDSDesigner3: TStringField
      DisplayWidth = 120
      FieldName = #23458#25143#22411#21495
      Size = 80
    end
    object qryPOFromDSDesigner4: TFloatField
      DisplayWidth = 60
      FieldName = #35746#21333#25968#37327
    end
    object qryPOFromset: TStringField
      DisplayWidth = 150
      FieldName = #20132#36135#23610#23544'set'
      Size = 30
    end
    object qryPOFromDSDesigner17: TDateTimeField
      DisplayWidth = 100
      FieldName = #19979#21333#26085#26399
    end
    object qryPOFromDSDesigner18: TDateTimeField
      DisplayWidth = 100
      FieldName = #35745#21010#20132#26399
    end
    object qryPOFromPP: TStringField
      FieldName = 'PP'#22411#21495
      Size = 100
    end
    object qryPOFromDSDesigner5: TStringField
      FieldName = #26495#26009#31867#22411
      Size = 100
    end
    object qryPOFromDSDesigner6: TStringField
      FieldName = #34920#38754#22788#29702#26041#24335
      Size = 100
    end
    object qryPOFromDSDesigner7: TStringField
      FieldName = #23618#25968
      Size = 100
    end
    object qryPOFromDSDesigner8: TStringField
      FieldName = #35746#21333#20132#36135#38754#31215
      Size = 100
    end
    object qryPOFromDSDesigner9: TStringField
      FieldName = #20132#36135#21608#26399
      Size = 100
    end
    object qryPOFromDSDesigner10: TStringField
      FieldName = #20869#23618#25104#21697#38108#21402
      Size = 100
    end
    object qryPOFromDSDesigner11: TStringField
      FieldName = #20869#23618#33455#26495#21402'('#21547#38108')'
      Size = 100
    end
    object qryPOFromDSDesigner12: TStringField
      FieldName = #22806#23618#25104#21697#38108#21402
      Size = 100
    end
    object qryPOFromDSDesigner13: TStringField
      FieldName = #23436#25104#26495#21402
      Size = 100
    end
    object qryPOFromDSDesigner14: TStringField
      FieldName = #23383#31526#39068#33394
      Size = 100
    end
    object qryPOFromDSDesigner15: TStringField
      FieldName = #38459#28938#39068#33394
      Size = 100
    end
    object qryPOFromDSDesigner16: TStringField
      FieldName = #38459#25239#27979#35797
      Size = 100
    end
  end
  object qryTmp: TADOQuery
    Connection = con1
    Parameters = <
      item
        Name = 'RKEY60'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'Update Data0060 Set SpellTogether=-1'
      'Where RKEY= :RKEY60')
    Left = 152
    Top = 112
  end
  object tblSpellDifferentCondition: TADOTable
    Connection = con1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    TableName = 'SpellDifferentCondition'
    Left = 152
    Top = 8
    object tblSpellDifferentConditionParam_PTR: TIntegerField
      FieldName = 'Param_PTR'
      Visible = False
    end
    object tblSpellDifferentConditionParam_Name: TStringField
      DisplayLabel = #21442#25968#21517
      FieldKind = fkLookup
      FieldName = 'Param_Name'
      LookupDataSet = qry278
      LookupKeyFields = 'RKEY'
      LookupResultField = 'PARAMETER_DESC'
      KeyFields = 'Param_PTR'
      LookupCache = True
      Lookup = True
    end
    object tblSpellDifferentConditionFormula: TStringField
      DisplayLabel = #20844#24335
      FieldName = 'Formula'
      Size = 100
    end
    object tblSpellDifferentConditionOperator: TStringField
      DisplayLabel = #36816#31639#31526
      FieldName = 'Operator'
      Size = 5
    end
    object tblSpellDifferentConditionFormulaValue: TStringField
      DisplayLabel = #20540
      FieldName = 'FormulaValue'
    end
    object tblSpellDifferentConditionParam_Code: TStringField
      DisplayLabel = #21442#25968#20195#30721
      FieldKind = fkLookup
      FieldName = 'Param_Code'
      LookupDataSet = qry278
      LookupKeyFields = 'RKEY'
      LookupResultField = 'PARAMETER_NAME'
      KeyFields = 'Param_PTR'
      LookupCache = True
      Size = 10
      Lookup = True
    end
  end
  object dsSpellDifferentCondition: TDataSource
    DataSet = tblSpellDifferentCondition
    Left = 152
    Top = 64
  end
end
