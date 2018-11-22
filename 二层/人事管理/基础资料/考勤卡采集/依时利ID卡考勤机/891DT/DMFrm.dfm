object DM1: TDM1
  OldCreateOrder = False
  Left = 911
  Top = 317
  Height = 375
  Width = 420
  object con1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 16
    Top = 8
  end
  object adsDevList: TADODataSet
    Connection = con1
    CursorType = ctStatic
    CommandText = 
      'declare @Isselect bit,@devip varchar(20),@devid varchar(10)'#13#10'dec' +
      'lare @devtime datetime, @constatus varchar(20),@todbnote varchar' +
      '(40), @note varchar(40)'#13#10'set @Isselect = 0'#13#10'select @isselect as ' +
      'selected,dev_ip as devip, devid , '#13#10'@devtime as devtime, @consta' +
      'tus as constatue, @todbnote as todbnote,@note as note'#13#10'fROM dev_' +
      'detail WHERE devaddr = '#39'local'#39' and purpose not like '#39'%facekq%'#39'  ' +
      'and purpose not like '#39'%Train%'#39
    Parameters = <>
    Left = 16
    Top = 64
    object adsDevListselected: TBooleanField
      FieldName = 'selected'
    end
    object adsDevListdevip: TWideStringField
      FieldName = 'devip'
      Size = 50
    end
    object adsDevListdevid: TWideStringField
      FieldName = 'devid'
      FixedChar = True
      Size = 10
    end
    object adsDevListdevtime: TDateTimeField
      FieldName = 'devtime'
    end
    object adsDevListconstatue: TStringField
      FieldName = 'constatue'
    end
    object adsDevListnote: TStringField
      FieldName = 'note'
      Size = 40
    end
    object adsDevListtodbnote: TStringField
      FieldName = 'todbnote'
      Size = 40
    end
  end
  object dsDevList: TDataSource
    DataSet = cdsDevList
    Left = 136
    Top = 64
  end
  object cdsDevList: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDevList'
    Left = 96
    Top = 64
    object cdsDevListselected: TBooleanField
      FieldName = 'selected'
    end
    object cdsDevListdevip: TWideStringField
      FieldName = 'devip'
      Size = 50
    end
    object cdsDevListdevid: TWideStringField
      FieldName = 'devid'
      Size = 10
    end
    object cdsDevListdevtime: TDateTimeField
      FieldName = 'devtime'
    end
    object cdsDevListconstatue: TStringField
      FieldName = 'constatue'
    end
    object cdsDevListnote: TStringField
      FieldName = 'note'
      Size = 40
    end
    object cdsDevListtodbnote: TStringField
      FieldName = 'todbnote'
      Size = 40
    end
  end
  object dspDevList: TDataSetProvider
    DataSet = adsDevList
    Left = 56
    Top = 64
  end
  object qrytmp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 16
    Top = 208
  end
  object sp1: TADOStoredProc
    Connection = con1
    ProcedureName = 'hrsp_card_analysis;1'
    Parameters = <>
    Prepared = True
    Left = 16
    Top = 160
  end
  object adsMD: TADODataSet
    Connection = con1
    CommandText = 
      'SELECT employeecode AS '#39#24037#21495#39', chinesename as '#39#22995#21517#39',  cardno AS '#39#21345#21495 +
      #39', departmentname AS '#39#37096#38376#39' '#13#10'FROM employeemsg left join datadepar' +
      'tment ON employeemsg.departmentid = datadepartment.RKey  '#13#10'WHERE' +
      ' status = 1 and len(cardno)=10 and '#13#10'employeemsg.departmentid IN' +
      ' :DepartID '#13#10'union all  select employeecode,chinesename,cardno, ' +
      'departmentname from employeemsg_extra  where flag=1 and len(card' +
      'no)=10 '
    Parameters = <
      item
        Name = 'DepartID'
        Size = -1
        Value = Null
      end>
    Left = 16
    Top = 116
  end
  object dsMD: TDataSource
    DataSet = adsMD
    Left = 56
    Top = 120
  end
  object adoQuickUpload: TADOQuery
    Connection = con1
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     dbo.employeemsg.rkey, dbo.employeemsg.employeecode, d' +
        'bo.employeemsg.chinesename, dbo.datadepartment.departmentname,db' +
        'o.employeemsg.ondutytime,dbo.employeemsg.Cardno'
      
        'FROM         dbo.employeemsg INNER JOIN dbo.datadepartment ON db' +
        'o.employeemsg.departmentid = dbo.datadepartment.rkey'
      'WHERE dbo.employeemsg.status=1')
    Left = 16
    Top = 264
    object adoQuickUploadrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adoQuickUploademployeecode: TWideStringField
      DisplayLabel = #24037#21495
      FieldName = 'employeecode'
    end
    object adoQuickUploadchinesename: TWideStringField
      DisplayLabel = #22995#21517
      FieldName = 'chinesename'
    end
    object adoQuickUploaddepartmentname: TWideStringField
      DisplayLabel = #37096#38376
      FieldName = 'departmentname'
    end
    object adoQuickUploadondutytime: TDateTimeField
      DisplayLabel = #20837#32844#26085#26399
      FieldName = 'ondutytime'
    end
    object adoQuickUploadCardno: TStringField
      DisplayLabel = 'ID'#21345#21495
      FieldName = 'Cardno'
    end
  end
  object DataSource1: TDataSource
    DataSet = adoQuickUpload
    Left = 80
    Top = 264
  end
end
