object DM: TDM
  OldCreateOrder = False
  Left = 622
  Top = 268
  Height = 300
  Width = 283
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 128
    Top = 24
  end
  object adotmp: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 216
    Top = 104
  end
  object adoDormitory: TADODataSet
    Connection = ADOConnection1
    LockType = ltReadOnly
    CommandText = 
      'select rkey, D_code, D_name, D_floor, remark, effective,case eff' +
      'ective when 0 then '#39#26080#39' when 1 then '#39#26377#39' end as eff from dormitory' +
      'msg'
    Parameters = <>
    Left = 48
    Top = 96
    object adoDormitoryrkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adoDormitoryD_code: TStringField
      DisplayLabel = #23487#33293#27004#32534#21495
      FieldName = 'D_code'
      Size = 50
    end
    object adoDormitoryD_name: TWideStringField
      DisplayLabel = #23487#33293#27004#21517#31216
      FieldName = 'D_name'
      Size = 50
    end
    object adoDormitoryD_floor: TIntegerField
      DisplayLabel = #27004#23618#24635#25968
      FieldName = 'D_floor'
    end
    object adoDormitoryremark: TWideStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 50
    end
    object adoDormitoryeffective: TBooleanField
      FieldName = 'effective'
    end
    object adoDormitoryeff: TStringField
      DisplayLabel = #26377#25928
      FieldName = 'eff'
      ReadOnly = True
      Size = 2
    end
  end
  object adoRoom: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select bedroommsg.rkey, dormitoryid,dormitorymsg.D_name, R_code,' +
      ' bedcount, floor, type, '#13#10'case type when 0 then '#39#22899#39' when 1 then ' +
      #39#30007#39' when 2 then '#39#23478#24237#39' end as roomtype,grade, monitor,'#13#10'employeems' +
      'g_extra.employeecode,employeemsg_extra.chinesename, equipment_re' +
      'mark,'#13#10'case bedroommsg.effective when 1 then '#39#26377#39' when 0 then '#39#26080#39 +
      ' end as eff,'#13#10' bedroommsg.remark, bedroommsg.effective, R_name, ' +
      'basic_rent, electricity_standard, water_standard'#13#10',IsCouple,case' +
      ' when IsCouple = 1 then '#39#26159#39' else '#39#21542#39' end as strCouple'#13#10'from bedr' +
      'oommsg inner join dormitorymsg on bedroommsg.dormitoryid=dormito' +
      'rymsg.rkey'#13#10'left join employeemsg_extra on bedroommsg.monitor=em' +
      'ployeemsg_extra.rkey'#13#10'where bedroommsg.dormitoryid=:dormitoryid '
    Parameters = <
      item
        Name = 'dormitoryid'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 48
    Top = 152
    object adoRoomrkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adoRoomdormitoryid: TIntegerField
      FieldName = 'dormitoryid'
    end
    object adoRoomD_name: TWideStringField
      DisplayLabel = #23487#33293#27004#21517#31216
      FieldName = 'D_name'
      Size = 50
    end
    object adoRoomR_code: TStringField
      DisplayLabel = #25151#38388#32534#21495
      FieldName = 'R_code'
      Size = 50
    end
    object adoRoombedcount: TIntegerField
      DisplayLabel = #24202#20301#25968
      FieldName = 'bedcount'
    end
    object adoRoomfloor: TIntegerField
      DisplayLabel = #25152#22312#27004#23618
      FieldName = 'floor'
    end
    object adoRoomtype: TIntegerField
      FieldName = 'type'
    end
    object adoRoomgrade: TWideStringField
      DisplayLabel = #23487#33293#32423#21035
      FieldName = 'grade'
      FixedChar = True
      Size = 10
    end
    object adoRoommonitor: TIntegerField
      DisplayLabel = #23487#33293#38271
      FieldName = 'monitor'
    end
    object adoRoomequipment_remark: TWideStringField
      DisplayLabel = #35774#22791#22791#27880
      FieldName = 'equipment_remark'
      Size = 50
    end
    object adoRoomremark: TWideStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 50
    end
    object adoRoomeffective: TIntegerField
      FieldName = 'effective'
    end
    object adoRoomR_name: TWideStringField
      DisplayLabel = #25151#38388#21517
      FieldName = 'R_name'
    end
    object adoRoombasic_rent: TBCDField
      DisplayLabel = #22522#26412#25151#31199
      FieldName = 'basic_rent'
      Precision = 19
    end
    object adoRoomelectricity_standard: TFloatField
      DisplayLabel = #29992#30005#26631#20934
      FieldName = 'electricity_standard'
    end
    object adoRoomwater_standard: TFloatField
      DisplayLabel = #29992#27700#26631#20934
      FieldName = 'water_standard'
    end
    object adoRoomeff: TStringField
      DisplayLabel = #26377#25928
      FieldName = 'eff'
      ReadOnly = True
      Size = 2
    end
    object adoRoomemployeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object adoRoomchinesename: TWideStringField
      DisplayLabel = #23487#33293#38271
      FieldName = 'chinesename'
    end
    object adoRoomroomtype: TStringField
      DisplayLabel = #23487#33293#31867#22411
      FieldName = 'roomtype'
      ReadOnly = True
      Size = 4
    end
    object adoRoomIsCouple: TBooleanField
      FieldName = 'IsCouple'
    end
    object adoRoomstrCouple: TStringField
      DisplayLabel = #22827#22971#25151
      FieldName = 'strCouple'
      ReadOnly = True
      Size = 2
    end
  end
  object adoBed: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select bedmsg.rkey,bedroomid,bedroommsg.R_code,bedroommsg.R_name' +
      ',B_code,employeeid,bedmsg.effective,'#13#10'case bedmsg.effective when' +
      ' 1 then '#39#26377#39' when 0 then '#39#26080#39' end as eff,'#13#10'bedmsg.remark,employeem' +
      'sg_extra.chinesename,employeemsg_extra.employeecode,'#13#10'employeems' +
      'g_extra.factoryarea'#9' /*'#24037#21378#21306#22495'*/,'#13#10'employeemsg_extra.departmentname' +
      ' /*'#37096#38376'*/,'#13#10'employeemsg_extra.position /*'#32844#20301'*/,'#13#10'employeemsg_extra.' +
      'ondutytime /*'#20837#32844#26085#26399'*/,'#13#10'employeemsg_extra.Province,  --'#31821#36143#13#10'employe' +
      'emsg_extra.birthday,--'#9#29983#26085#13#10'employeemsg_extra.phone--'#32852#31995#30005#35805#13#10'from b' +
      'edmsg inner join '#13#10#9#9#9'bedroommsg on bedmsg.bedroomid = bedroomms' +
      'g.rkey left join'#13#10#9#9#9'employeemsg_extra on bedmsg.employeeid=empl' +
      'oyeemsg_extra.rkey'#13#10'where bedroomid=:rkey'
    DataSource = DataSource2
    IndexFieldNames = 'rkey'
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
    Left = 48
    Top = 208
    object adoBedrkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adoBedbedroomid: TIntegerField
      FieldName = 'bedroomid'
    end
    object adoBedR_code: TStringField
      DisplayLabel = #25151#38388#32534#21495
      FieldName = 'R_code'
      Size = 50
    end
    object adoBedR_name: TWideStringField
      DisplayLabel = #25151#38388#21517
      FieldName = 'R_name'
    end
    object adoBedB_code: TStringField
      DisplayLabel = #24202#20301#21495
      FieldName = 'B_code'
      Size = 50
    end
    object adoBedemployeeid: TIntegerField
      FieldName = 'employeeid'
    end
    object adoBedeffective: TIntegerField
      FieldName = 'effective'
    end
    object adoBedeff: TStringField
      DisplayLabel = #26377#25928
      FieldName = 'eff'
      ReadOnly = True
      Size = 2
    end
    object adoBedremark: TWideStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 50
    end
    object adoBedchinesename: TWideStringField
      DisplayLabel = #21592#24037#22995#21517
      FieldName = 'chinesename'
    end
    object adoBedemployeecode: TWideStringField
      DisplayLabel = #21592#24037#20195#30721
      FieldName = 'employeecode'
    end
    object adoBedfactoryarea: TWideStringField
      DisplayLabel = #24037#21378
      FieldName = 'factoryarea'
    end
    object adoBeddepartmentname: TWideStringField
      DisplayLabel = #37096#38376
      FieldName = 'departmentname'
    end
    object adoBedposition: TWideStringField
      DisplayLabel = #32844#21153
      FieldName = 'position'
    end
    object adoBedondutytime: TWideStringField
      DisplayLabel = #20837#32844#26085#26399
      FieldName = 'ondutytime'
    end
    object adoBedProvince: TWideStringField
      DisplayLabel = #31821#36143
      FieldName = 'Province'
    end
    object adoBedbirthday: TWideStringField
      DisplayLabel = #20986#29983#26085#26399
      FieldName = 'birthday'
    end
    object adoBedphone: TWideStringField
      DisplayLabel = #30005#35805
      FieldName = 'phone'
      Size = 50
    end
  end
  object DataSource1: TDataSource
    DataSet = adoDormitory
    Left = 120
    Top = 96
  end
  object DataSource2: TDataSource
    DataSet = adoRoom
    Left = 120
    Top = 152
  end
  object DataSource3: TDataSource
    DataSet = adoBed
    Left = 120
    Top = 208
  end
end
