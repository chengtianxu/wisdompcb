object DM: TDM
  OldCreateOrder = False
  Left = 445
  Top = 101
  Height = 425
  Width = 643
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\Ole DB\Data Links' +
      '\'#19996#33694'WLG_172.18.12.2 .udl'
    LoginPrompt = False
    Provider = 
      'C:\Program Files\Common Files\System\Ole DB\Data Links\'#19996#33694'WLG_172' +
      '.18.12.2 .udl'
    Left = 72
  end
  object ADOTMP: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 160
  end
  object Q_salary: TADOQuery
    Connection = ADOConnection1
    Filtered = True
    LockType = ltBatchOptimistic
    AfterScroll = Q_salaryAfterScroll
    Parameters = <>
    Prepared = True
    Left = 152
    Top = 80
  end
  object DS_Q_salary: TDataSource
    DataSet = Q_salary
    Left = 72
    Top = 80
  end
  object qryModel: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select distinct model_name ,b.accountname, case when [type]=1 th' +
        'en '#39#23548#20837#39'else  '#39#23637#31034#39'end  as [rpt_type], '
      'datafield_name=convert(varchar(500),'
      
        'STUFF((SELECT '#39','#39' + datafield_name from  employeesalary_rpt_mode' +
        'l'
      'where model_name=a.model_name'
      'FOR XML PATH('#39#39')), 1, 1, '#39#39')) '
      'from employeesalary_rpt_model  a '
      'join salaryaccount b on a.accountid=b.rkey')
    Left = 80
    Top = 200
  end
  object dsModel: TDataSource
    DataSet = qryModel
    Left = 160
    Top = 200
  end
  object ADOTMP2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 224
  end
end
