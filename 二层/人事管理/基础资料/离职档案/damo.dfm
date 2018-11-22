object DM: TDM
  OldCreateOrder = False
  Left = 278
  Top = 112
  Height = 578
  Width = 581
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 32
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <
      item
        Name = 'dpk3'
        Size = -1
        Value = Null
      end
      item
        Name = 'dpk4'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select '
      
        'employee_1.employeeid,employee_1.orginal_departmentid,d.departme' +
        'ntname,employee_1.orginal_employeecode,e.chinesename,'
      
        'e.Languages,convert(char(10),employee_1.orginal_ondutytime,20) a' +
        's ondutytime,convert(char(10),employee_1.orginal_outdutytime,120' +
        ') as outdutytime,'
      
        'CASE e.sex WHEN 0 THEN '#39#22899#39' WHEN 1 THEN '#39#30007#39' END AS sextext, e.add' +
        'r,e.province, e.IDCard, e.Cardno, e.phone,e.roomcode, '
      
        'e.nation,convert(char(10),e.birthday,120) as birthday,e.blood_ty' +
        'pe,e.Height,  e.graduatedschool, e.majorsubject, e.iDCardtime,e.' +
        'sicardno, '
      
        'e.Residencepermit, e.bankaccount, e.bankname, e.contactpersonnam' +
        'e, e.contactpersontel,e.contactpersonaddr, e.recommendpersonname' +
        ', '
      
        'e.recommendpersontel, e.recommendaddr, e.recommendworkplace, e.G' +
        'raduateTime,d1.item  AS Positionitem,d2.item AS Rankitem,'
      
        'd3.item AS educationitem,d4.item AS Politics_faceitem,d5.item as' +
        ' employ_typeitem,d11.item AS marriageitem,d16.item as station, '
      
        'd17.item as source,e.status,accountname,case when attendance=0 t' +
        'hen '#39#21542#39'  when attendance=1 then '#39#26159#39' end attendancename,'
      
        'd9.item as leavetype,d10.item as leavereason,employee_1.remark a' +
        's remark'
      ' from '
      
        '( select *from dbo.employee_alteration where type in (select rke' +
        'y from datadetail where dictid=9) and active=1) as employee_1 '
      
        'left join datadepartment  d on employee_1.orginal_departmentid=d' +
        '.rkey'
      'left join employeemsg     e on employee_1.employeeid=e.rkey'
      
        'left join (select * from datadetail where dictid=1) d1 on employ' +
        'ee_1.orginal_position=d1.rkey'
      
        'left join (select * from datadetail where dictid=2) d2 on employ' +
        'ee_1.orginal_rank=d2.rkey '
      
        'left join (select * from datadetail where dictid=3) d3 on e.educ' +
        'ation=d3.rkey'
      
        'left join (select * from datadetail where dictid=4) d4 on e.poli' +
        'tics_face=d4.rkey'
      
        'left join (select * from datadetail where dictid=5)  d5 on e.emp' +
        'loy_type=d5.rkey'
      
        'left join (select * from datadetail where dictid=9)  d9 on emplo' +
        'yee_1.[type]=d9.rkey'
      
        'left join (select * from datadetail where dictid=10) d10 on empl' +
        'oyee_1.reason=d10.rkey'
      
        'left join (select * from datadetail where dictid=11) d11 on orgi' +
        'nal_marriage=d11.rkey  '
      
        'left join (select * from datadetail where dictid=16) d16 on e.st' +
        'ation=d16.rkey'
      
        'left join (select * from datadetail where dictid=17) d17 on e.so' +
        'urce=d17.rkey'
      'left join salaryaccount k  on orginal_accountid=k.rkey'
      'where employee_1.alterdate between :dpk3 and :dpk4')
    Left = 107
    Top = 32
    object ADOQuery1employeeid: TIntegerField
      FieldName = 'employeeid'
    end
    object ADOQuery1orginal_departmentid: TIntegerField
      FieldName = 'orginal_departmentid'
    end
    object ADOQuery1departmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object ADOQuery1orginal_employeecode: TWideStringField
      FieldName = 'orginal_employeecode'
    end
    object ADOQuery1chinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object ADOQuery1Languages: TWideStringField
      FieldName = 'Languages'
      Size = 10
    end
    object ADOQuery1ondutytime: TStringField
      FieldName = 'ondutytime'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object ADOQuery1outdutytime: TStringField
      FieldName = 'outdutytime'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object ADOQuery1sextext: TStringField
      FieldName = 'sextext'
      ReadOnly = True
      Size = 2
    end
    object ADOQuery1addr: TWideStringField
      FieldName = 'addr'
      Size = 80
    end
    object ADOQuery1province: TWideStringField
      FieldName = 'province'
    end
    object ADOQuery1IDCard: TWideStringField
      FieldName = 'IDCard'
    end
    object ADOQuery1Cardno: TStringField
      FieldName = 'Cardno'
    end
    object ADOQuery1phone: TWideStringField
      FieldName = 'phone'
    end
    object ADOQuery1roomcode: TWideStringField
      FieldName = 'roomcode'
    end
    object ADOQuery1nation: TWideStringField
      FieldName = 'nation'
    end
    object ADOQuery1birthday: TStringField
      FieldName = 'birthday'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object ADOQuery1blood_type: TWideStringField
      FieldName = 'blood_type'
      FixedChar = True
      Size = 10
    end
    object ADOQuery1Height: TIntegerField
      FieldName = 'Height'
    end
    object ADOQuery1graduatedschool: TWideStringField
      FieldName = 'graduatedschool'
    end
    object ADOQuery1majorsubject: TWideStringField
      FieldName = 'majorsubject'
    end
    object ADOQuery1iDCardtime: TDateTimeField
      FieldName = 'iDCardtime'
    end
    object ADOQuery1sicardno: TStringField
      FieldName = 'sicardno'
    end
    object ADOQuery1Residencepermit: TStringField
      FieldName = 'Residencepermit'
    end
    object ADOQuery1bankaccount: TStringField
      FieldName = 'bankaccount'
    end
    object ADOQuery1bankname: TWideStringField
      FieldName = 'bankname'
    end
    object ADOQuery1contactpersonname: TWideStringField
      FieldName = 'contactpersonname'
    end
    object ADOQuery1contactpersontel: TWideStringField
      FieldName = 'contactpersontel'
    end
    object ADOQuery1contactpersonaddr: TWideStringField
      FieldName = 'contactpersonaddr'
    end
    object ADOQuery1recommendpersonname: TWideStringField
      FieldName = 'recommendpersonname'
    end
    object ADOQuery1recommendpersontel: TWideStringField
      FieldName = 'recommendpersontel'
    end
    object ADOQuery1recommendaddr: TWideStringField
      FieldName = 'recommendaddr'
    end
    object ADOQuery1recommendworkplace: TWideStringField
      FieldName = 'recommendworkplace'
    end
    object ADOQuery1GraduateTime: TWideStringField
      FieldName = 'GraduateTime'
    end
    object ADOQuery1Positionitem: TWideStringField
      FieldName = 'Positionitem'
    end
    object ADOQuery1Rankitem: TWideStringField
      FieldName = 'Rankitem'
    end
    object ADOQuery1educationitem: TWideStringField
      FieldName = 'educationitem'
    end
    object ADOQuery1Politics_faceitem: TWideStringField
      FieldName = 'Politics_faceitem'
    end
    object ADOQuery1employ_typeitem: TWideStringField
      FieldName = 'employ_typeitem'
    end
    object ADOQuery1marriageitem: TWideStringField
      FieldName = 'marriageitem'
    end
    object ADOQuery1source: TWideStringField
      FieldName = 'source'
    end
    object ADOQuery1station: TWideStringField
      FieldName = 'station'
    end
    object ADOQuery1status: TWordField
      FieldName = 'status'
    end
    object ADOQuery1accountname: TWideStringField
      FieldName = 'accountname'
      Size = 50
    end
    object ADOQuery1attendancename: TStringField
      FieldName = 'attendancename'
      ReadOnly = True
      Size = 2
    end
    object ADOQuery1leavetype: TWideStringField
      FieldName = 'leavetype'
    end
    object ADOQuery1leavereason: TWideStringField
      FieldName = 'leavereason'
    end
    object ADOQuery1remark: TWideStringField
      FieldName = 'remark'
      Size = 80
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 174
    Top = 32
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 107
    Top = 86
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 174
    Top = 86
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 107
    Top = 143
  end
  object DataSource3: TDataSource
    DataSet = ADOQuery3
    Left = 174
    Top = 143
  end
  object ADOTMP: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 32
    Top = 104
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 99
    Top = 200
  end
  object qry_info: TADOQuery
    AutoCalcFields = False
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    EnableBCD = False
    Parameters = <
      item
        Name = 'dpk1'
        Size = -1
        Value = Null
      end
      item
        Name = 'dpk2'
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      
        'SELECT     top 1000 alt.rkey, alt.employeeid, alt.type, alt.reas' +
        'on, alt.alterdate, alt.orginal_employeecode, alt.orginal_departm' +
        'entid, '
      
        'alt.orginal_position,alt.orginal_employ_type, alt.orginal_politi' +
        'cs_face, alt.orginal_education, alt.orginal_outdutytime,'
      
        'alt.orginal_marriage, alt.orginal_rank, alt.new_employeecode, al' +
        't.new_departmentid, '
      
        'alt.new_position,alt.new_employ_type, alt.new_politics_face, alt' +
        '.new_education, '
      
        'alt.new_marriage, alt.new_rank, alt.oper_date, alt.oper_person,a' +
        'lt.active, '
      
        'Data0005.EMPLOYEE_NAME, msg.chinesename, alt.orginal_employeecod' +
        'e as employeecode, '
      'convert(char(10),alt.orginal_ondutytime,120) as ondutytime,'
      'convert(char(10),alt.alterdate,120) as outdutytime,'
      
        'msg.employ_type, msg.sex,mdet.item AS rank, rdet.item AS rreason' +
        ', tdet.item AS ttype, '
      
        'opdet.item AS pposition, tdet.dictid, npdet.item AS nposition, o' +
        'pdet.item AS oposition, '
      
        'nhdet.item AS nhtype, ohdet.item AS ohtype, hdet.item AS phtype,' +
        ' '
      
        'npdetr.item AS nrank, opdetr.item AS orank, odept.departmentname' +
        ', '
      
        'ndept.departmentname AS ndepartmentname, odept.departmentname AS' +
        ' odepartmentname, '
      
        '(CASE msg.sex WHEN 0 THEN '#39#22899#39' WHEN 1 THEN '#39#30007#39' ELSE '#39#20854#23427#39' END) AS ' +
        'sexy, '
      'case when len(cardno)>0 then '#39#23578#25345#26377#39' else '#39#26080#39' end as hascard,'
      'case when len(roomcode)>0 then 1 else 0 end as hasroom,'
      'case when  EXISTS'
      '(select  *  from dbo.Employee_Train   where feels_payed=0 '
      'and train_feels>0  and effective_date>=getdate() '
      'and Employee_Train.employeeid =alt.employeeid )'
      ' then 1 else 0 end as hastrain,'
      'alt.remark'
      'FROM employee_alteration AS alt LEFT OUTER JOIN'
      'Data0005 ON Data0005.RKEY = alt.oper_person LEFT OUTER JOIN'
      'employeemsg AS msg ON msg.rkey = alt.employeeid LEFT OUTER JOIN'
      'datadetail AS mdet ON mdet.rkey = msg.Rank LEFT OUTER JOIN'
      'datadetail AS rdet ON rdet.rkey = alt.reason LEFT OUTER JOIN'
      'datadetail AS tdet ON tdet.rkey = alt.type LEFT OUTER JOIN'
      'datadetail AS pdet ON pdet.rkey = msg.Position LEFT OUTER JOIN'
      
        'datadetail AS npdet ON npdet.rkey = alt.new_position LEFT OUTER ' +
        'JOIN'
      
        'datadetail AS opdet ON opdet.rkey = alt.orginal_position LEFT OU' +
        'TER JOIN'
      
        'datadetail AS npdetr ON npdetr.rkey = alt.new_rank LEFT OUTER JO' +
        'IN'
      
        'datadetail AS opdetr ON opdetr.rkey = alt.orginal_rank LEFT OUTE' +
        'R JOIN'
      
        'datadetail AS hdet ON hdet.rkey = msg.employ_type LEFT OUTER JOI' +
        'N'
      
        'datadetail AS nhdet ON nhdet.rkey = alt.new_employ_type LEFT OUT' +
        'ER JOIN'
      
        'datadetail AS ohdet ON ohdet.rkey = alt.orginal_employ_type LEFT' +
        ' OUTER JOIN'
      
        'datadepartment AS dept ON dept.rkey = msg.departmentid LEFT OUTE' +
        'R JOIN'
      
        'datadepartment AS ndept ON ndept.rkey = alt.new_departmentid LEF' +
        'T OUTER JOIN'
      'datadepartment AS odept ON odept.rkey = alt.orginal_departmentid'
      
        'where active<>2  and type in (select rkey from datadetail where ' +
        'dictid=9)'
      'and alt.alterdate between :dpk1 and :dpk2 ')
    Left = 288
    Top = 32
    object qry_inforkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qry_infoemployeeid: TIntegerField
      FieldName = 'employeeid'
    end
    object qry_infotype: TIntegerField
      FieldName = 'type'
    end
    object qry_inforeason: TIntegerField
      FieldName = 'reason'
    end
    object qry_infoalterdate: TDateTimeField
      FieldName = 'alterdate'
    end
    object qry_infoorginal_employeecode: TWideStringField
      FieldName = 'orginal_employeecode'
    end
    object qry_infoorginal_departmentid: TIntegerField
      FieldName = 'orginal_departmentid'
    end
    object qry_infoorginal_position: TIntegerField
      FieldName = 'orginal_position'
    end
    object qry_infoorginal_employ_type: TIntegerField
      FieldName = 'orginal_employ_type'
    end
    object qry_infoorginal_politics_face: TIntegerField
      FieldName = 'orginal_politics_face'
    end
    object qry_infoorginal_education: TIntegerField
      FieldName = 'orginal_education'
    end
    object qry_infoorginal_outdutytime: TWideStringField
      FieldName = 'orginal_outdutytime'
    end
    object qry_infoorginal_marriage: TIntegerField
      FieldName = 'orginal_marriage'
    end
    object qry_infoorginal_rank: TIntegerField
      FieldName = 'orginal_rank'
    end
    object qry_infonew_employeecode: TWideStringField
      FieldName = 'new_employeecode'
    end
    object qry_infonew_departmentid: TIntegerField
      FieldName = 'new_departmentid'
    end
    object qry_infonew_position: TIntegerField
      FieldName = 'new_position'
    end
    object qry_infonew_employ_type: TIntegerField
      FieldName = 'new_employ_type'
    end
    object qry_infonew_politics_face: TIntegerField
      FieldName = 'new_politics_face'
    end
    object qry_infonew_education: TIntegerField
      FieldName = 'new_education'
    end
    object qry_infonew_marriage: TIntegerField
      FieldName = 'new_marriage'
    end
    object qry_infonew_rank: TIntegerField
      FieldName = 'new_rank'
    end
    object qry_infooper_date: TDateTimeField
      FieldName = 'oper_date'
    end
    object qry_infooper_person: TIntegerField
      FieldName = 'oper_person'
    end
    object qry_infoactive: TIntegerField
      FieldName = 'active'
    end
    object qry_infoEMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object qry_infochinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object qry_infoemployeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object qry_infoondutytime: TStringField
      FieldName = 'ondutytime'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object qry_infooutdutytime: TStringField
      FieldName = 'outdutytime'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object qry_infoemploy_type: TIntegerField
      FieldName = 'employ_type'
    end
    object qry_infosex: TIntegerField
      FieldName = 'sex'
    end
    object qry_inforank: TWideStringField
      FieldName = 'rank'
    end
    object qry_inforreason: TWideStringField
      FieldName = 'rreason'
    end
    object qry_infottype: TWideStringField
      FieldName = 'ttype'
    end
    object qry_infopposition: TWideStringField
      FieldName = 'pposition'
    end
    object qry_infodictid: TIntegerField
      FieldName = 'dictid'
    end
    object qry_infonposition: TWideStringField
      FieldName = 'nposition'
    end
    object qry_infooposition: TWideStringField
      FieldName = 'oposition'
    end
    object qry_infonhtype: TWideStringField
      FieldName = 'nhtype'
    end
    object qry_infoohtype: TWideStringField
      FieldName = 'ohtype'
    end
    object qry_infophtype: TWideStringField
      FieldName = 'phtype'
    end
    object qry_infonrank: TWideStringField
      FieldName = 'nrank'
    end
    object qry_infoorank: TWideStringField
      FieldName = 'orank'
    end
    object qry_infodepartmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object qry_infondepartmentname: TWideStringField
      FieldName = 'ndepartmentname'
    end
    object qry_infoodepartmentname: TWideStringField
      FieldName = 'odepartmentname'
    end
    object qry_infosexy: TStringField
      FieldName = 'sexy'
      ReadOnly = True
      Size = 4
    end
    object qry_infohascard: TStringField
      FieldName = 'hascard'
      ReadOnly = True
      Size = 6
    end
    object qry_infohasroom: TIntegerField
      FieldName = 'hasroom'
      ReadOnly = True
    end
    object qry_inforemark: TWideStringField
      FieldName = 'remark'
      Size = 80
    end
    object qry_infohastrain: TIntegerField
      FieldName = 'hastrain'
      ReadOnly = True
    end
  end
  object ds_info: TDataSource
    DataSet = qry_info
    Left = 347
    Top = 32
  end
  object qry_msg: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'select msg.rkey,employeecode,chinesename,departmentname,status,d' +
        'atadetail.item rankname,[rank],'
      
        '(case sex when 0 then '#39#22899#39' when 1 then '#39#30007#39' else '#39#20854#23427#39'  end) as sex' +
        'y ,isnull(msg.wagetype,9) as wagetype,'
      
        'cast (substring(convert(nvarchar(20),ondutytime,120),1,10) as da' +
        'tetime) as ondutytime,'
      
        'cast (substring(convert(nvarchar(20),outdutytime,120),1,10) as d' +
        'atetime) as outdutytime,'
      
        'province,IDCard,departmentid,pdet.item as pposition,mdet.item as' +
        ' employ_type,'
      'dept.departmentname,position,employ_type as employ_type_rkey,'
      '(select top 1 bb.rkey from '
      
        'dbo.employee_alteration  aa join datadetail bb on aa.reason=bb.r' +
        'key '
      'where employeeid=msg.rkey '
      'and type in (select rkey from datadetail where dictid=9) '
      'order by alterdate desc )  as old_reason, '
      '(select top 1 bb.item from '
      
        'dbo.employee_alteration  aa join datadetail bb on aa.reason=bb.r' +
        'key '
      'where employeeid=msg.rkey and type in '
      '(select rkey from datadetail where dictid=9) '
      'order by alterdate desc ) as oold_reason'
      ' from employeemsg msg'
      ' left join datadetail pdet on pdet.rkey=msg.position'
      ' left join datadetail mdet on mdet.rkey=msg.employ_type'
      ' left join datadetail on datadetail.rkey=msg.Rank'
      ' left join datadepartment dept on dept.rkey=msg.departmentid')
    Left = 291
    Top = 88
  end
  object ds_msg: TDataSource
    DataSet = qry_msg
    Left = 347
    Top = 88
  end
  object qry_alt: TADOQuery
    CacheSize = 500
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'alterrkey'
        DataType = ftInteger
        Size = -1
        Value = 0
      end>
    SQL.Strings = (
      'select  * from employee_alteration'
      'where rkey=:alterrkey')
    Left = 445
    Top = 33
  end
  object qry_dept: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from datadepartment')
    Left = 445
    Top = 89
  end
  object qryTemp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 291
    Top = 200
  end
  object qry_detail: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from datadetail')
    Left = 293
    Top = 144
  end
  object ds_detail: TDataSource
    DataSet = qry_detail
    Left = 347
    Top = 144
  end
  object qrySchEmpID: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 509
    Top = 89
  end
  object qrySchEmpCode: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 509
    Top = 33
  end
  object qryCheckLZ: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 509
    Top = 145
  end
  object qryUpdateLZ: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 509
    Top = 201
  end
  object qryDelteDL: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 509
    Top = 265
  end
  object qryUpdateBD: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 445
    Top = 145
  end
  object qry_info_bd: TADOQuery
    AutoCalcFields = False
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    EnableBCD = False
    Parameters = <
      item
        Name = 'dpk5'
        Size = -1
        Value = Null
      end
      item
        Name = 'dpk6'
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      
        'SELECT     alt.rkey, alt.employeeid, alt.type, alt.reason, alt.a' +
        'lterdate, alt.orginal_employeecode, alt.orginal_departmentid, '
      
        'alt.orginal_position,alt.orginal_employ_type, alt.orginal_politi' +
        'cs_face, alt.orginal_education, '
      
        'alt.orginal_outdutytime,alt.orginal_ondutytime,alt.orginal_marri' +
        'age, alt.orginal_rank, alt.new_employeecode, alt.new_departmenti' +
        'd, '
      
        'alt.new_position,alt.new_employ_type, alt.new_politics_face, alt' +
        '.new_education, '
      'alt.new_marriage, alt.new_rank, alt.oper_date, alt.active, '
      
        'Data0005.EMPLOYEE_NAME, msg.chinesename, alt.orginal_employeecod' +
        'e as employeecode, '
      
        'msg.employ_type, msg.sex,mdet.item AS rank, rdet.item AS rreason' +
        ', tdet.item AS ttype, '
      
        'opdet.item AS pposition, tdet.dictid, npdet.item AS nposition, o' +
        'pdet.item AS oposition, '
      
        'nhdet.item AS nhtype, ohdet.item AS ohtype, hdet.item AS phtype,' +
        ' '
      
        'npdetr.item AS nrank, opdetr.item AS orank, odept.departmentname' +
        ', '
      
        'ndept.departmentname AS ndepartmentname, odept.departmentname AS' +
        ' odepartmentname, '
      
        '(CASE msg.sex WHEN 0 THEN '#39#22899#39' WHEN 1 THEN '#39#30007#39' ELSE '#39#20854#23427#39' END) AS ' +
        'sexy, '
      'alt.remark'
      'FROM employee_alteration AS alt LEFT OUTER JOIN'
      'Data0005 ON Data0005.RKEY = alt.oper_person LEFT OUTER JOIN'
      'employeemsg AS msg ON msg.rkey = alt.employeeid LEFT OUTER JOIN'
      'datadetail AS mdet ON mdet.rkey = msg.Rank LEFT OUTER JOIN'
      'datadetail AS rdet ON rdet.rkey = alt.reason LEFT OUTER JOIN'
      'datadetail AS tdet ON tdet.rkey = alt.type LEFT OUTER JOIN'
      'datadetail AS pdet ON pdet.rkey = msg.Position LEFT OUTER JOIN'
      
        'datadetail AS npdet ON npdet.rkey = alt.new_position LEFT OUTER ' +
        'JOIN'
      
        'datadetail AS opdet ON opdet.rkey = alt.orginal_position LEFT OU' +
        'TER JOIN'
      
        'datadetail AS npdetr ON npdetr.rkey = alt.new_rank LEFT OUTER JO' +
        'IN'
      
        'datadetail AS opdetr ON opdetr.rkey = alt.orginal_rank LEFT OUTE' +
        'R JOIN'
      
        'datadetail AS hdet ON hdet.rkey = msg.employ_type LEFT OUTER JOI' +
        'N'
      
        'datadetail AS nhdet ON nhdet.rkey = alt.new_employ_type LEFT OUT' +
        'ER JOIN'
      
        'datadetail AS ohdet ON ohdet.rkey = alt.orginal_employ_type LEFT' +
        ' OUTER JOIN'
      
        'datadepartment AS dept ON dept.rkey = msg.departmentid LEFT OUTE' +
        'R JOIN'
      
        'datadepartment AS ndept ON ndept.rkey = alt.new_departmentid LEF' +
        'T OUTER JOIN'
      'datadepartment AS odept ON odept.rkey = alt.orginal_departmentid'
      
        'where active<>2  and type in (select rkey from datadetail where ' +
        'dictid=7  and item='#39#22797#32844#39')'
      'and alt.alterdate between :dpk5 and :dpk6')
    Left = 296
    Top = 264
    object qry_info_bdrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qry_info_bdemployeeid: TIntegerField
      FieldName = 'employeeid'
    end
    object qry_info_bdtype: TIntegerField
      FieldName = 'type'
    end
    object qry_info_bdreason: TIntegerField
      FieldName = 'reason'
    end
    object qry_info_bdalterdate: TDateTimeField
      FieldName = 'alterdate'
    end
    object qry_info_bdorginal_employeecode: TWideStringField
      FieldName = 'orginal_employeecode'
    end
    object qry_info_bdorginal_departmentid: TIntegerField
      FieldName = 'orginal_departmentid'
    end
    object qry_info_bdorginal_position: TIntegerField
      FieldName = 'orginal_position'
    end
    object qry_info_bdorginal_employ_type: TIntegerField
      FieldName = 'orginal_employ_type'
    end
    object qry_info_bdorginal_politics_face: TIntegerField
      FieldName = 'orginal_politics_face'
    end
    object qry_info_bdorginal_education: TIntegerField
      FieldName = 'orginal_education'
    end
    object qry_info_bdorginal_outdutytime: TWideStringField
      FieldName = 'orginal_outdutytime'
    end
    object qry_info_bdorginal_ondutytime: TWideStringField
      FieldName = 'orginal_ondutytime'
    end
    object qry_info_bdorginal_marriage: TIntegerField
      FieldName = 'orginal_marriage'
    end
    object qry_info_bdorginal_rank: TIntegerField
      FieldName = 'orginal_rank'
    end
    object qry_info_bdnew_employeecode: TWideStringField
      FieldName = 'new_employeecode'
    end
    object qry_info_bdnew_departmentid: TIntegerField
      FieldName = 'new_departmentid'
    end
    object qry_info_bdnew_position: TIntegerField
      FieldName = 'new_position'
    end
    object qry_info_bdnew_employ_type: TIntegerField
      FieldName = 'new_employ_type'
    end
    object qry_info_bdnew_politics_face: TIntegerField
      FieldName = 'new_politics_face'
    end
    object qry_info_bdnew_education: TIntegerField
      FieldName = 'new_education'
    end
    object qry_info_bdnew_marriage: TIntegerField
      FieldName = 'new_marriage'
    end
    object qry_info_bdnew_rank: TIntegerField
      FieldName = 'new_rank'
    end
    object qry_info_bdoper_date: TDateTimeField
      FieldName = 'oper_date'
    end
    object qry_info_bdactive: TIntegerField
      FieldName = 'active'
    end
    object qry_info_bdEMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object qry_info_bdchinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object qry_info_bdemployeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object qry_info_bdemploy_type: TIntegerField
      FieldName = 'employ_type'
    end
    object qry_info_bdsex: TIntegerField
      FieldName = 'sex'
    end
    object qry_info_bdrank: TWideStringField
      FieldName = 'rank'
    end
    object qry_info_bdrreason: TWideStringField
      FieldName = 'rreason'
    end
    object qry_info_bdttype: TWideStringField
      FieldName = 'ttype'
    end
    object qry_info_bdpposition: TWideStringField
      FieldName = 'pposition'
    end
    object qry_info_bddictid: TIntegerField
      FieldName = 'dictid'
    end
    object qry_info_bdnposition: TWideStringField
      FieldName = 'nposition'
    end
    object qry_info_bdoposition: TWideStringField
      FieldName = 'oposition'
    end
    object qry_info_bdnhtype: TWideStringField
      FieldName = 'nhtype'
    end
    object qry_info_bdohtype: TWideStringField
      FieldName = 'ohtype'
    end
    object qry_info_bdphtype: TWideStringField
      FieldName = 'phtype'
    end
    object qry_info_bdnrank: TWideStringField
      FieldName = 'nrank'
    end
    object qry_info_bdorank: TWideStringField
      FieldName = 'orank'
    end
    object qry_info_bddepartmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object qry_info_bdndepartmentname: TWideStringField
      FieldName = 'ndepartmentname'
    end
    object qry_info_bdodepartmentname: TWideStringField
      FieldName = 'odepartmentname'
    end
    object qry_info_bdsexy: TStringField
      FieldName = 'sexy'
      ReadOnly = True
      Size = 4
    end
    object qry_info_bdremark: TWideStringField
      FieldName = 'remark'
      Size = 80
    end
  end
  object qry_info_db: TDataSource
    DataSet = qry_info_bd
    Left = 376
    Top = 264
  end
  object tmp1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 147
    Top = 200
  end
  object tmp2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 195
    Top = 200
  end
  object det_updata: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'exec dbo.hrsp_update_datadepartment_empcount')
    Left = 96
    Top = 264
  end
  object qry_infosend: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'reky7314'
        DataType = ftString
        Size = 4
        Value = '2552'
      end
      item
        Name = 'rkey73'
        DataType = ftString
        Size = 4
        Value = '2141'
      end
      item
        Name = 'rkey419'
        DataType = ftString
        Size = 3
        Value = '577'
      end>
    SQL.Strings = (
      'select  cast ( 0 as bit) as selected,'
      'cast (orginal_employeecode as varchar(20)) as employeecode,'
      'cast(b.chinesename as varchar(20)) as chinesename,'
      'cast (b.phone as varchar(20)) as phone,'
      'convert(varchar(20),b.outdutytime,23) as outdutytime'
      '  from employee_alteration a '
      'join employeemsg b on a.employeeid=b.rkey'
      'where active=1 and type=(select rkey from datadetail'
      'where item='#39#33258#31163#39' and dictid=9)'
      'and alterdate >= dateadd(day,-30,getdate())'
      'and orginal_employeecode not in '
      '(select message from data0014 where whosend=:reky7314 ) '
      'and orginal_departmentid in '
      
        '      (select departmentid from hr_permission where operator_ptr' +
        '=:rkey73'
      '       and program_ptr =:rkey419)'
      'and len(isnull(b.phone,'#39#39'))=11')
    Left = 96
    Top = 384
    object qry_infosendselected: TBooleanField
      FieldName = 'selected'
    end
    object qry_infosendemployeecode: TStringField
      FieldName = 'employeecode'
      ReadOnly = True
    end
    object qry_infosendchinesename: TStringField
      FieldName = 'chinesename'
      ReadOnly = True
    end
    object qry_infosendphone: TStringField
      FieldName = 'phone'
      ReadOnly = True
    end
    object qry_infosendoutdutytime: TStringField
      FieldName = 'outdutytime'
      ReadOnly = True
    end
  end
  object ds_infosend: TDataSource
    DataSet = cds_infosend
    Left = 392
    Top = 392
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = qry_infosend
    Options = [poAllowCommandText]
    Left = 184
    Top = 392
  end
  object cds_infosend: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select  cast ( 0 as bit) as selected,'#13#10'cast (orginal_employeecod' +
      'e as varchar(20)) as employeecode,'#13#10'cast(b.chinesename as varcha' +
      'r(20)) as chinesename,'#13#10'cast (b.phone as varchar(20)) as phone,'#13 +
      #10'convert(varchar(20),b.outdutytime,23) as outdutytime'#13#10'  from em' +
      'ployee_alteration a '#13#10'join employeemsg b on a.employeeid=b.rkey'#13 +
      #10'where active=1 and type=(select rkey from datadetail'#13#10'where ite' +
      'm='#39#33258#31163#39' and dictid=9)'#13#10'and alterdate >= dateadd(day,-30,getdate()' +
      ')'#13#10'and orginal_employeecode not in '#13#10'(select message from data00' +
      '14 where whosend=:reky7314 ) '#13#10'and orginal_departmentid in '#13#10'   ' +
      '   (select departmentid from hr_permission where operator_ptr=:r' +
      'key73'#13#10'       and program_ptr =:rkey419)'#13#10'and len(isnull(b.phone' +
      ','#39#39'))=11'
    Params = <
      item
        DataType = ftString
        Name = 'reky7314'
        ParamType = ptUnknown
        Value = '2552'
      end
      item
        DataType = ftString
        Name = 'rkey73'
        ParamType = ptUnknown
        Value = '2141'
      end
      item
        DataType = ftString
        Name = 'rkey419'
        ParamType = ptUnknown
        Value = '577'
      end>
    ProviderName = 'DataSetProvider1'
    Left = 280
    Top = 392
    object cds_infosendselected: TBooleanField
      FieldName = 'selected'
    end
    object cds_infosendemployeecode: TStringField
      FieldName = 'employeecode'
    end
    object cds_infosendchinesename: TStringField
      FieldName = 'chinesename'
    end
    object cds_infosendphone: TStringField
      FieldName = 'phone'
    end
    object cds_infosendoutdutytime: TStringField
      FieldName = 'outdutytime'
    end
  end
  object ADOQuery4: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      
        'select b.orginal_employeecode,c.chinesename,b.orginal_ondutytime' +
        ',b.alterdate  from data0014  '
      'a join employee_alteration b'
      '  join employeemsg c on b.employeeid=c.rkey'
      'on a.message=b.orginal_employeecode'
      
        'where whosend=(select top 1 rkey from data0073 where user_full_n' +
        'ame='#39#20154#21147#36164#28304#37096#39')  and b.type = '
      '(select rkey from datadetail where dictid=9 and item ='#39#33258#31163#39')'
      'order by alterdate desc')
    Left = 104
    Top = 464
    object ADOQuery4orginal_employeecode: TWideStringField
      FieldName = 'orginal_employeecode'
    end
    object ADOQuery4chinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object ADOQuery4orginal_ondutytime: TWideStringField
      FieldName = 'orginal_ondutytime'
    end
    object ADOQuery4alterdate: TDateTimeField
      FieldName = 'alterdate'
    end
  end
  object DataSource4: TDataSource
    DataSet = ADOQuery4
    Left = 224
    Top = 464
  end
end
