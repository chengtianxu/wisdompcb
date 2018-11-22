object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 281
  Top = 227
  Height = 369
  Width = 339
  object qry_ruler: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'select * from class order by classname')
    Left = 88
    Top = 24
    object qry_rulerrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qry_rulerclassname: TWideStringField
      FieldName = 'classname'
    end
    object qry_rulerontime1: TDateTimeField
      FieldName = 'ontime1'
    end
    object qry_rulerouttime1: TDateTimeField
      FieldName = 'outtime1'
    end
    object qry_rulerontime2: TDateTimeField
      FieldName = 'ontime2'
    end
    object qry_rulerouttime2: TDateTimeField
      FieldName = 'outtime2'
    end
    object qry_rulerontime3: TDateTimeField
      FieldName = 'ontime3'
    end
    object qry_rulerouttime3: TDateTimeField
      FieldName = 'outtime3'
    end
    object qry_rulerisextra1: TBooleanField
      FieldName = 'isextra1'
    end
    object qry_rulerisextra2: TBooleanField
      FieldName = 'isextra2'
    end
    object qry_rulerisextra3: TBooleanField
      FieldName = 'isextra3'
    end
    object qry_ruleraheadduty: TIntegerField
      FieldName = 'aheadduty'
    end
    object qry_rulerdelayduty: TIntegerField
      FieldName = 'delayduty'
    end
    object qry_rulerisoverzero: TBooleanField
      FieldName = 'isoverzero'
    end
    object qry_rulercardGap: TIntegerField
      FieldName = 'cardGap'
    end
    object qry_rulerpasssegment: TIntegerField
      FieldName = 'passsegment'
    end
    object qry_rulerauto_overtime: TIntegerField
      FieldName = 'auto_overtime'
    end
    object qry_rulerworktimesum: TFloatField
      FieldName = 'worktimesum'
    end
    object qry_rulerwork_rest: TFloatField
      FieldName = 'work_rest'
    end
    object qry_rulerclassdesc: TWideStringField
      FieldName = 'classdesc'
      Size = 50
    end
    object qry_ruleroverworktime: TFloatField
      FieldName = 'overworktime'
    end
    object qry_ruleroverwork_rest: TFloatField
      FieldName = 'overwork_rest'
    end
    object qry_rulerovertimetype: TIntegerField
      FieldName = 'overtimetype'
    end
    object qry_rulercreatedate: TDateTimeField
      FieldName = 'createdate'
    end
    object qry_rulerusername: TWideStringField
      FieldName = 'username'
      Size = 50
    end
    object qry_rulerclassstatus: TIntegerField
      FieldName = 'classstatus'
    end
    object qry_rulerlocked: TIntegerField
      FieldName = 'locked'
    end
    object qry_ruleredit_1: TFloatField
      FieldName = 'edit_1'
    end
    object qry_ruleredit_2: TFloatField
      FieldName = 'edit_2'
    end
    object qry_ruleredit_3: TFloatField
      FieldName = 'edit_3'
    end
    object qry_ruleredit_4: TFloatField
      FieldName = 'edit_4'
    end
    object qry_ruleredit_5: TFloatField
      FieldName = 'edit_5'
    end
    object qry_ruleredit_6: TFloatField
      FieldName = 'edit_6'
    end
    object qry_ruleredit_7: TFloatField
      FieldName = 'edit_7'
    end
    object qry_ruleredit_8: TFloatField
      FieldName = 'edit_8'
    end
    object qry_ruleredit_9: TFloatField
      FieldName = 'edit_9'
    end
    object qry_ruleredit_10: TFloatField
      FieldName = 'edit_10'
    end
    object qry_ruleredit_11: TFloatField
      FieldName = 'edit_11'
    end
    object qry_ruleredit_12: TFloatField
      FieldName = 'edit_12'
    end
    object qry_ruleredit_13: TFloatField
      FieldName = 'edit_13'
    end
    object qry_ruleredit_14: TFloatField
      FieldName = 'edit_14'
    end
    object qry_ruleredit_15: TFloatField
      FieldName = 'edit_15'
    end
    object qry_ruleredit_16: TFloatField
      FieldName = 'edit_16'
    end
    object qry_ruleredit_17: TBooleanField
      FieldName = 'edit_17'
    end
    object qry_ruleredit_18: TBooleanField
      FieldName = 'edit_18'
    end
    object qry_ruleredit_19: TBooleanField
      FieldName = 'edit_19'
    end
    object qry_ruleredit_20: TBooleanField
      FieldName = 'edit_20'
    end
    object qry_ruleredit_21: TBooleanField
      FieldName = 'edit_21'
    end
    object qry_ruleredit_22: TBooleanField
      FieldName = 'edit_22'
    end
    object qry_ruleredit_23: TBooleanField
      FieldName = 'edit_23'
    end
    object qry_ruleredit_24: TBooleanField
      FieldName = 'edit_24'
    end
    object qry_ruleredit_25: TBooleanField
      FieldName = 'edit_25'
    end
    object qry_ruleredit_26: TBooleanField
      FieldName = 'edit_26'
    end
    object qry_ruleredit_27: TBooleanField
      FieldName = 'edit_27'
    end
    object qry_ruleredit_28: TBooleanField
      FieldName = 'edit_28'
    end
    object qry_ruleredit_29: TBooleanField
      FieldName = 'edit_29'
    end
    object qry_ruleredit_30: TBooleanField
      FieldName = 'edit_30'
    end
    object qry_ruleredit_31: TBooleanField
      FieldName = 'edit_31'
    end
    object qry_ruleredit_32: TBooleanField
      FieldName = 'edit_32'
    end
    object qry_ruleredit_33: TBooleanField
      FieldName = 'edit_33'
    end
  end
  object ds_ruler: TDataSource
    DataSet = qry_ruler
    Left = 152
    Top = 24
  end
  object qry1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select item from datadetail where dictid=14')
    Left = 88
    Top = 80
    object wdstrngfldqry1item: TWideStringField
      FieldName = 'item'
    end
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 160
    Top = 80
  end
  object ADOSpecial: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     rkey,isoverzero,edit_1, edit_2, edit_3, edit_4, edit_' +
        '5, edit_6, edit_7, edit_8, edit_9, edit_10, edit_11, edit_12, ed' +
        'it_13, edit_14, edit_15, edit_16, edit_17, edit_18, edit_19, '
      
        '                      edit_20, edit_21, edit_22, edit_23, edit_2' +
        '4, edit_25, edit_26, edit_27, edit_28, edit_29, edit_30, edit_31' +
        ', edit_32, edit_33'
      'FROM         dbo.class')
    Left = 88
    Top = 136
    object ADOSpecialrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOSpecialisoverzero: TBooleanField
      FieldName = 'isoverzero'
    end
    object ADOSpecialedit_1: TFloatField
      FieldName = 'edit_1'
    end
    object ADOSpecialedit_2: TFloatField
      FieldName = 'edit_2'
    end
    object ADOSpecialedit_3: TFloatField
      FieldName = 'edit_3'
    end
    object ADOSpecialedit_4: TFloatField
      FieldName = 'edit_4'
    end
    object ADOSpecialedit_5: TFloatField
      FieldName = 'edit_5'
    end
    object ADOSpecialedit_6: TFloatField
      FieldName = 'edit_6'
    end
    object ADOSpecialedit_7: TFloatField
      FieldName = 'edit_7'
    end
    object ADOSpecialedit_8: TFloatField
      FieldName = 'edit_8'
    end
    object ADOSpecialedit_9: TFloatField
      FieldName = 'edit_9'
    end
    object ADOSpecialedit_10: TFloatField
      FieldName = 'edit_10'
    end
    object ADOSpecialedit_11: TFloatField
      FieldName = 'edit_11'
    end
    object ADOSpecialedit_12: TFloatField
      FieldName = 'edit_12'
    end
    object ADOSpecialedit_13: TFloatField
      FieldName = 'edit_13'
    end
    object ADOSpecialedit_14: TFloatField
      FieldName = 'edit_14'
    end
    object ADOSpecialedit_15: TFloatField
      FieldName = 'edit_15'
    end
    object ADOSpecialedit_16: TFloatField
      FieldName = 'edit_16'
    end
    object ADOSpecialedit_17: TBooleanField
      FieldName = 'edit_17'
    end
    object ADOSpecialedit_18: TBooleanField
      FieldName = 'edit_18'
    end
    object ADOSpecialedit_19: TBooleanField
      FieldName = 'edit_19'
    end
    object ADOSpecialedit_20: TBooleanField
      FieldName = 'edit_20'
    end
    object ADOSpecialedit_21: TBooleanField
      FieldName = 'edit_21'
    end
    object ADOSpecialedit_22: TBooleanField
      FieldName = 'edit_22'
    end
    object ADOSpecialedit_23: TBooleanField
      FieldName = 'edit_23'
    end
    object ADOSpecialedit_24: TBooleanField
      FieldName = 'edit_24'
    end
    object ADOSpecialedit_25: TBooleanField
      FieldName = 'edit_25'
    end
    object ADOSpecialedit_26: TBooleanField
      FieldName = 'edit_26'
    end
    object ADOSpecialedit_27: TBooleanField
      FieldName = 'edit_27'
    end
    object ADOSpecialedit_28: TBooleanField
      FieldName = 'edit_28'
    end
    object ADOSpecialedit_29: TBooleanField
      FieldName = 'edit_29'
    end
    object ADOSpecialedit_30: TBooleanField
      FieldName = 'edit_30'
    end
    object ADOSpecialedit_31: TBooleanField
      FieldName = 'edit_31'
    end
    object ADOSpecialedit_32: TBooleanField
      FieldName = 'edit_32'
    end
    object ADOSpecialedit_33: TBooleanField
      FieldName = 'edit_33'
    end
  end
  object qryClass: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 160
    Top = 136
  end
  object qry2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 88
    Top = 192
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 24
  end
  object ds2: TDataSource
    DataSet = qry3
    Left = 152
    Top = 240
  end
  object qry3: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      ''
      'select  classname as '#29677#27425#21517#31216' ,'
      'substring(convert(nvarchar(20),ontime1,120),12,5) as '#25171#21345'1,'
      'substring(convert(nvarchar(20),outtime1,120),12,5)as '#25171#21345'2,'
      'substring(convert(nvarchar(20),ontime2,120),12,5)as '#25171#21345'3,'
      'substring(convert(nvarchar(20),outtime2,120),12,5)as '#25171#21345'4,'
      'substring(convert(nvarchar(20),ontime3,120),12,5)as '#25171#21345'5,'
      'substring(convert(nvarchar(20),outtime3,120),12,5)as '#25171#21345'6,'
      'classdesc as '#29677#27425#35828#26126','
      'isoverzero as '#26159#21542#22812#29677','
      #39#21069#39'+cast (aheadduty as nvarchar(10))+'#39#20998#38047#25171#21345#26377#25928','#21518#39
      '+cast (aheadduty as nvarchar(10))+'#39#20998#38047#25171#21345#26377#25928#39' as '#25171#21345#26377#25928#21306#38388','
      'case  when passsegment=1 then '#39#27573'1-2'#36830#29677#39
      #9'  when passsegment=2 then '#39#27573'2-3'#36830#29677#39
      #9'  when passsegment=3 then '#39#27573'1-2'#36830#29677','#27573'2-3'#36830#29677#39
      #9'  else '#39#19981#36830#29677#39' end  as '#36830#29677#24773#20917','
      'case when passsegment in (0,2) then '#39#39' else'
      #39'1-2'#26102#27573#20241#24687#23569#20110#39'+cast (edit_9 as nvarchar(10))+'#39#34917#20986#21220#39
      '+cast(edit_15 as nvarchar(10))+'#39#20998#38047#39' end as [1-2'#36830#29677'],'
      'case when passsegment in (0,1) then '#39#39' else '
      #39'2-3'#26102#27573#20241#24687#23569#20110#39'+cast (edit_10 as nvarchar(10))+'#39#34917#20986#21220#39
      '+cast(edit_16 as nvarchar(10))+'#39#20998#38047#39' end as [2-3'#36830#29677']'
      ' from class'
      'order by classname')
    Left = 88
    Top = 240
  end
end
