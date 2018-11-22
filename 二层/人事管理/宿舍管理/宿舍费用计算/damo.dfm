object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 555
  Top = 213
  Height = 411
  Width = 441
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\Ole DB\Data Links' +
      '\08demo.udl'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select'
      'Dormitorymsg.D_name,'
      'Bedroommsg.R_code,'
      'Bedroommsg.R_name, '
      'Bedroomfees.rkey,'
      'Bedroomfees.roomid,'
      'Bedroomfees.yearmonth,'
      'Bedroomfees.startdate,'
      'Bedroomfees.enddate,'
      'Bedroomfees.room_fees,'
      'Bedroomfees.R_decrease_e,'
      'Bedroomfees.R_decrease_w,'
      'Bedroomfees.electic_f,'
      'Bedroomfees.water_f,'
      'Bedroomfees.person_freque,'
      'Bedroomfees.sould_pay,'
      'Bedroomfees.need_pay,'
      'Bedroomfees.real_pay,'
      'Bedroomfees.new_lastfees'
      'from Bedroomfees join '
      'Bedroommsg on Bedroomfees.roomid=Bedroommsg.rkey'
      'join Dormitorymsg on Bedroommsg.dormitoryid=Dormitorymsg.rkey'
      'where 2=2')
    Left = 108
    Top = 80
    object ADOQuery1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1roomid: TIntegerField
      FieldName = 'roomid'
    end
    object ADOQuery1yearmonth: TStringField
      FieldName = 'yearmonth'
      Size = 50
    end
    object ADOQuery1startdate: TDateTimeField
      FieldName = 'startdate'
    end
    object ADOQuery1enddate: TDateTimeField
      FieldName = 'enddate'
    end
    object ADOQuery1R_decrease_e: TFloatField
      FieldName = 'R_decrease_e'
      DisplayFormat = '0.00'
    end
    object ADOQuery1R_decrease_w: TFloatField
      FieldName = 'R_decrease_w'
      DisplayFormat = '0.00'
    end
    object ADOQuery1electic_f: TFloatField
      FieldName = 'electic_f'
    end
    object ADOQuery1water_f: TFloatField
      FieldName = 'water_f'
    end
    object ADOQuery1person_freque: TIntegerField
      FieldName = 'person_freque'
    end
    object ADOQuery1sould_pay: TFloatField
      FieldName = 'sould_pay'
    end
    object ADOQuery1need_pay: TFloatField
      FieldName = 'need_pay'
    end
    object ADOQuery1real_pay: TFloatField
      FieldName = 'real_pay'
    end
    object ADOQuery1new_lastfees: TFloatField
      FieldName = 'new_lastfees'
    end
    object ADOQuery1D_name: TWideStringField
      FieldName = 'D_name'
      Size = 50
    end
    object ADOQuery1R_code: TStringField
      FieldName = 'R_code'
      Size = 50
    end
    object ADOQuery1R_name: TWideStringField
      FieldName = 'R_name'
    end
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = 449
      end>
    SQL.Strings = (
      'select a.rkey,'
      'a.bedroomfeesid,'
      'a.employeeid,'
      'stay_days,'
      'subfees,'
      'ischecked,'
      'b.employeecode,'
      'b.chinesename,'
      'c.startdate,'
      'c.enddate,'
      'd.B_code '
      'from dbo.Bedroomfees_detail'
      'a'
      'join employeemsg_extra b'
      'on a.employeeid=b.rkey'
      'join Bedroomusemsg c'
      'on a.beduseid=c.rkey'
      'join bedmsg d'
      'on d.rkey=c.bedid'
      'where bedroomfeesid=:rkey'
      '')
    Left = 113
    Top = 160
    object ADOQuery2rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery2bedroomfeesid: TIntegerField
      FieldName = 'bedroomfeesid'
    end
    object ADOQuery2employeeid: TIntegerField
      FieldName = 'employeeid'
    end
    object ADOQuery2stay_days: TIntegerField
      FieldName = 'stay_days'
    end
    object ADOQuery2subfees: TFloatField
      FieldName = 'subfees'
    end
    object ADOQuery2ischecked: TBooleanField
      FieldName = 'ischecked'
    end
    object ADOQuery2employeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object ADOQuery2chinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object ADOQuery2startdate: TDateTimeField
      FieldName = 'startdate'
    end
    object ADOQuery2enddate: TDateTimeField
      FieldName = 'enddate'
    end
    object ADOQuery2B_code: TStringField
      FieldName = 'B_code'
      Size = 50
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 32
    Top = 80
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 32
    Top = 160
  end
  object ADOTMP: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 316
    Top = 81
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select b.factoryarea,'
      'b.departmentname,'
      'b.employeecode,'
      'b.chinesename,'
      'a.stay_days,'
      'a.subfees,'
      'b.idcard,'
      'g.D_name,'
      'e.R_name,'
      'f.B_code,'
      'c.yearmonth,'
      'd.startdate,'
      'd.enddate ,'
      'ischecked'
      ' from dbo.Bedroomfees_detail a'
      'join employeemsg_extra b on a.employeeid=b.rkey'
      'join dbo.Bedroomfees c on a.bedroomfeesid=c.rkey'
      'join dbo.Bedroomusemsg d on a.beduseid=d.rkey'
      'join dbo.Bedroommsg e on c.roomid=e.rkey'
      'join dbo.Bedmsg f on d.bedid=f.rkey '
      'join dbo.Dormitorymsg g on e.dormitoryid=g.rkey '#9
      'where 2=2')
    Left = 112
    Top = 224
    object ADOQuery3factoryarea: TWideStringField
      FieldName = 'factoryarea'
    end
    object ADOQuery3departmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object ADOQuery3employeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object ADOQuery3chinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object ADOQuery3stay_days: TIntegerField
      FieldName = 'stay_days'
    end
    object ADOQuery3subfees: TFloatField
      FieldName = 'subfees'
    end
    object ADOQuery3idcard: TWideStringField
      FieldName = 'idcard'
    end
    object ADOQuery3B_code: TStringField
      FieldName = 'B_code'
      Size = 50
    end
    object ADOQuery3yearmonth: TStringField
      FieldName = 'yearmonth'
      Size = 50
    end
    object ADOQuery3startdate: TDateTimeField
      FieldName = 'startdate'
    end
    object ADOQuery3enddate: TDateTimeField
      FieldName = 'enddate'
    end
    object ADOQuery3ischecked: TBooleanField
      FieldName = 'ischecked'
    end
    object ADOQuery3D_name: TWideStringField
      FieldName = 'D_name'
      Size = 50
    end
    object ADOQuery3R_name: TWideStringField
      FieldName = 'R_name'
    end
  end
  object DataSource3: TDataSource
    DataSet = ADOQuery3
    Left = 40
    Top = 224
  end
  object ADOQuery4: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from Bedroomfees'
      'where yearmonth='#39'2012-01'#39)
    Left = 112
    Top = 296
    object ADOQuery4rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery4roomid: TIntegerField
      FieldName = 'roomid'
    end
    object ADOQuery4yearmonth: TStringField
      FieldName = 'yearmonth'
      Size = 50
    end
    object ADOQuery4startdate: TDateTimeField
      FieldName = 'startdate'
    end
    object ADOQuery4enddate: TDateTimeField
      FieldName = 'enddate'
    end
    object ADOQuery4R_decrease_e: TFloatField
      FieldName = 'R_decrease_e'
    end
    object ADOQuery4R_decrease_w: TFloatField
      FieldName = 'R_decrease_w'
    end
    object ADOQuery4electic_f: TFloatField
      FieldName = 'electic_f'
    end
    object ADOQuery4water_f: TFloatField
      FieldName = 'water_f'
    end
    object ADOQuery4person_freque: TIntegerField
      FieldName = 'person_freque'
    end
    object ADOQuery4sould_pay: TFloatField
      FieldName = 'sould_pay'
    end
    object ADOQuery4need_pay: TFloatField
      FieldName = 'need_pay'
    end
    object ADOQuery4real_pay: TFloatField
      FieldName = 'real_pay'
    end
    object ADOQuery4new_lastfees: TFloatField
      FieldName = 'new_lastfees'
    end
    object ADOQuery4room_fees: TFloatField
      FieldName = 'room_fees'
    end
  end
  object ADOQuery_compute: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 200
    Top = 296
  end
end
