object DM: TDM
  OldCreateOrder = False
  Left = 376
  Top = 227
  Height = 406
  Width = 467
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 16
  end
  object employee_department: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     rkey, departmentname, departmentcode, superior, charg' +
        'ename, departmentration, departmentcount, scarcity'
      
        'FROM   dbo.datadepartment where isnull(invalid,0)=0 order by dep' +
        'artmentcode')
    Left = 344
    Top = 24
    object employee_departmentrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object employee_departmentdepartmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object employee_departmentdepartmentcode: TWideStringField
      FieldName = 'departmentcode'
    end
    object employee_departmentsuperior: TIntegerField
      FieldName = 'superior'
    end
    object employee_departmentchargename: TWideStringField
      FieldName = 'chargename'
    end
    object employee_departmentdepartmentration: TIntegerField
      FieldName = 'departmentration'
    end
    object employee_departmentdepartmentcount: TIntegerField
      FieldName = 'departmentcount'
    end
    object employee_departmentscarcity: TIntegerField
      FieldName = 'scarcity'
    end
  end
  object tmp1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 104
    Top = 216
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 152
    Top = 216
  end
  object DataSource1: TDataSource
    DataSet = employee_msg
    Left = 32
    Top = 112
  end
  object tmp2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 200
    Top = 216
  end
  object employee_msg: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      ''
      'SELECT dbo.employeemsg.rkey,dbo.employeemsg.chinesename, '
      'dbo.employeemsg.employeecode, dbo.employeemsg.departmentid,'
      
        'employeemsg.Languages,convert(char(10),dbo.employeemsg.ondutytim' +
        'e,20) as ondutytime, convert(char(10),'
      
        #9'dbo.employeemsg.outdutytime,20) as outdutytime, dbo.employeemsg' +
        '.employ_type, dbo.employeemsg.Position, '
      
        #9'dbo.employeemsg.Rank,dbo.employeemsg.Politics_face, dbo.employe' +
        'emsg.education, dbo.employeemsg.marriage, dbo.employeemsg.sex,'
      
        'cast ( ((datediff(month,birthday,getdate())-case when day(birthd' +
        'ay)>day(getdate()) then 1 else 0 end)/12) as nvarchar(10))+'#39'.'#39
      
        '+case when ( (datediff(month,birthday,getdate())-case when day(b' +
        'irthday)>day(getdate()) then 1 else 0 end)%12)<10  then '#39'0'#39' else' +
        ' '#39#39' end '
      
        '+cast( ( (datediff(month,birthday,getdate())-case when day(birth' +
        'day)>day(getdate()) then 1 else 0 end)%12) as nvarchar(10))   as' +
        ' age,'
      
        'cast ( ((datediff(month,ondutytime,getdate())-case when day(ondu' +
        'tytime)>day(getdate()) then 1 else 0 end)/12) as nvarchar(10))+'#39 +
        '.'#39
      
        '+case when ( (datediff(month,ondutytime,getdate())-case when day' +
        '(ondutytime)>day(getdate()) then 1 else 0 end)%12)<10  then '#39'0'#39' ' +
        'else '#39#39' end '
      
        '+cast( ( (datediff(month,ondutytime,getdate())-case when day(ond' +
        'utytime)>day(getdate()) then 1 else 0 end)%12) as nvarchar(10)) ' +
        '  as workage,'
      
        #9'CASE employeemsg.sex WHEN 0 THEN '#39#22899#39' WHEN 1 THEN '#39#30007#39' END AS sex' +
        'text, dbo.employeemsg.addr,'
      
        #9'dbo.employeemsg.province, dbo.employeemsg.IDCard, dbo.employeem' +
        'sg.Cardno, dbo.employeemsg.phone, dbo.employeemsg.attendance,'
      
        #9'dbo.employeemsg.wagetype, dbo.employeemsg.roomcode, dbo.employe' +
        'emsg.nation, convert(char(10),dbo.employeemsg.birthday,20) as bi' +
        'rthday,'
      
        #9'blood_type,Height,graduatedschool, majorsubject, iDCardtime, si' +
        'cardno, Residencepermit, bankaccount, bankname, contactpersonnam' +
        'e, contactpersontel,'
      
        #9'contactpersonaddr, recommendpersonname, recommendpersontel, rec' +
        'ommendaddr, recommendworkplace, GraduateTime,'
      
        #9'dbo.datadepartment.departmentcode, dbo.datadepartment.departmen' +
        'tname, dbo.datadepartment.superior, dbo.datadepartment.rkey AS r' +
        'keydep, '
      
        #9'dbo.datadetail.item AS employ_typeitem, datadetail_1.item AS Ra' +
        'nkitem,'
      
        #9'datadetail_2.item AS Politics_faceitem, datadetail_3.item AS ed' +
        'ucationitem, datadetail_4.item AS marriageitem, datadetail_5.ite' +
        'm AS Positionitem,dbo.employeemsg.status,'
      '                salaryaccount.accountname as wagetypename,'
      
        #9'case when attendance=0 then '#39#21542#39' when attendance=1 then '#39#26159#39' end ' +
        'attendancename,'
      #9'datadetail_6.item as source, '
      'datadetail_7.item as station,'
      'employeemsg.recognizor,'
      'employeemsg.recognizor_Phone,'
      'employeemsg.E_people_relation,'
      'employeemsg.starlevel,employeemsg.remark,province_ptr,'
      'datadetail_8.memo as prinvicename,'
      'employeemsg.public_accumulation_funds,'
      'employeemsg.siaccountno,'
      'employeemsg.serious_mistake,'
      'employeemsg.multi_ability,'
      'datadetail_5.user_defined2,'
      'emp_contract2.contractcount2 as contractcount,'
      
        '    case  when isnull(isnull(emp_contract2.contractcount2,0)-dat' +
        'adetail_5.user_defined2,0)>0'
      ' then '#39#21512#21516#25968#36229#38480#39
      '  when  isnull(emp_contract.contractcount,0)>0 then '#39#27491#24120#39
      'else '#39#26242#26080#39' end as emp_contract_flag'
      'FROM dbo.employeemsg LEFT JOIN'
      
        #9'dbo.datadetail AS datadetail_4 ON dbo.employeemsg.marriage = da' +
        'tadetail_4.rkey LEFT JOIN'
      
        #9'dbo.datadetail AS datadetail_3 ON dbo.employeemsg.education = d' +
        'atadetail_3.rkey LEFT  JOIN'
      
        #9'dbo.datadetail AS datadetail_5 ON dbo.employeemsg.Position = da' +
        'tadetail_5.rkey LEFT JOIN'
      
        #9'dbo.datadetail AS datadetail_2 ON dbo.employeemsg.Politics_face' +
        ' = datadetail_2.rkey LEFT  JOIN'
      
        #9'dbo.datadetail AS datadetail_6 ON dbo.employeemsg.source = data' +
        'detail_6.rkey LEFT  JOIN'
      
        #9'dbo.datadetail AS datadetail_7 ON dbo.employeemsg.station = dat' +
        'adetail_7.rkey LEFT  JOIN'
      
        #9'dbo.datadetail AS datadetail_1 ON dbo.employeemsg.Rank = datade' +
        'tail_1.rkey LEFT  JOIN'
      
        #9'dbo.datadetail AS datadetail_8 ON dbo.employeemsg.province_ptr ' +
        '= datadetail_8.rkey LEFT  JOIN'
      
        #9'dbo.datadetail ON dbo.employeemsg.employ_type = dbo.datadetail.' +
        'rkey '
      
        '   LEFT  JOIN'#9'dbo.datadepartment ON dbo.employeemsg.departmentid' +
        ' = dbo.datadepartment.rkey '
      
        '  left join salaryaccount on employeemsg.wagetype= salaryaccount' +
        '.rkey'
      
        '  left join ( select  employeeid,count(employeeid)as contractcou' +
        'nt from dbo.employee_contract '
      
        'where status=1 and getdate() between dateadd(day,-2,startdate) a' +
        'nd enddate'
      '  group by employeeid) as emp_contract on '
      #9'employeemsg.rkey=emp_contract.employeeid'
      
        '  left join ( select  employeeid,count(employeeid)as contractcou' +
        'nt2 from dbo.employee_contract '
      'where status=1 and getdate()<= enddate'
      '  group by employeeid) as emp_contract2 on '
      #9'employeemsg.rkey=emp_contract2.employeeid'
      
        'WHERE   employeemsg.departmentid not in (select rkey from datade' +
        'partment where invalid=1)'
      ''
      ''
      '')
    Left = 104
    Top = 112
    object employee_msgID: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ID'
      OnGetText = employee_msgIDGetText
      Calculated = True
    end
    object employee_msgrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object employee_msgchinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object employee_msgdepartmentid: TIntegerField
      FieldName = 'departmentid'
    end
    object employee_msgemploy_type: TIntegerField
      FieldName = 'employ_type'
    end
    object employee_msgPosition: TIntegerField
      FieldName = 'Position'
    end
    object employee_msgRank: TIntegerField
      FieldName = 'Rank'
    end
    object employee_msgPolitics_face: TIntegerField
      FieldName = 'Politics_face'
    end
    object employee_msgeducation: TIntegerField
      FieldName = 'education'
    end
    object employee_msgmarriage: TIntegerField
      FieldName = 'marriage'
    end
    object employee_msgsex: TIntegerField
      FieldName = 'sex'
    end
    object employee_msgaddr: TWideStringField
      FieldName = 'addr'
      Size = 50
    end
    object employee_msgprovince: TWideStringField
      FieldName = 'province'
    end
    object employee_msgIDCard: TWideStringField
      FieldName = 'IDCard'
    end
    object employee_msgCardno: TWideStringField
      FieldName = 'Cardno'
      FixedChar = True
      Size = 10
    end
    object employee_msgphone: TWideStringField
      FieldName = 'phone'
    end
    object employee_msgattendance: TIntegerField
      FieldName = 'attendance'
    end
    object employee_msgwagetype: TIntegerField
      FieldName = 'wagetype'
    end
    object employee_msgroomcode: TWideStringField
      FieldName = 'roomcode'
    end
    object employee_msgnation: TWideStringField
      FieldName = 'nation'
    end
    object employee_msgdepartmentcode: TWideStringField
      FieldName = 'departmentcode'
    end
    object employee_msgdepartmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object employee_msgsuperior: TIntegerField
      FieldName = 'superior'
    end
    object employee_msgrkeydep: TAutoIncField
      FieldName = 'rkeydep'
      ReadOnly = True
    end
    object employee_msgemploy_typeitem: TWideStringField
      FieldName = 'employ_typeitem'
    end
    object employee_msgRankitem: TWideStringField
      FieldName = 'Rankitem'
    end
    object employee_msgPolitics_faceitem: TWideStringField
      FieldName = 'Politics_faceitem'
    end
    object employee_msgeducationitem: TWideStringField
      FieldName = 'educationitem'
    end
    object employee_msgmarriageitem: TWideStringField
      FieldName = 'marriageitem'
    end
    object employee_msgPositionitem: TWideStringField
      FieldName = 'Positionitem'
    end
    object employee_msgsextext: TStringField
      FieldName = 'sextext'
      ReadOnly = True
      Size = 2
    end
    object employee_msgondutytime: TStringField
      FieldName = 'ondutytime'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object employee_msgoutdutytime: TStringField
      FieldName = 'outdutytime'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object employee_msgbirthday: TStringField
      FieldName = 'birthday'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object employee_msgblood_type: TWideStringField
      FieldName = 'blood_type'
      FixedChar = True
      Size = 10
    end
    object employee_msgHeight: TIntegerField
      FieldName = 'Height'
    end
    object employee_msggraduatedschool: TWideStringField
      FieldName = 'graduatedschool'
    end
    object employee_msgmajorsubject: TWideStringField
      FieldName = 'majorsubject'
    end
    object employee_msgiDCardtime: TDateTimeField
      FieldName = 'iDCardtime'
    end
    object employee_msgsicardno: TStringField
      FieldName = 'sicardno'
    end
    object employee_msgResidencepermit: TStringField
      FieldName = 'Residencepermit'
    end
    object employee_msgbankaccount: TStringField
      FieldName = 'bankaccount'
    end
    object employee_msgbankname: TWideStringField
      FieldName = 'bankname'
    end
    object employee_msgcontactpersonname: TWideStringField
      FieldName = 'contactpersonname'
    end
    object employee_msgcontactpersontel: TWideStringField
      FieldName = 'contactpersontel'
    end
    object employee_msgcontactpersonaddr: TWideStringField
      FieldName = 'contactpersonaddr'
    end
    object employee_msgrecommendpersonname: TWideStringField
      FieldName = 'recommendpersonname'
    end
    object employee_msgrecommendpersontel: TWideStringField
      FieldName = 'recommendpersontel'
    end
    object employee_msgrecommendaddr: TWideStringField
      FieldName = 'recommendaddr'
    end
    object employee_msgrecommendworkplace: TWideStringField
      FieldName = 'recommendworkplace'
    end
    object employee_msgGraduateTime: TWideStringField
      FieldName = 'GraduateTime'
    end
    object employee_msgLanguages: TWideStringField
      FieldName = 'Languages'
      Size = 10
    end
    object employee_msgstatus: TWordField
      FieldName = 'status'
    end
    object employee_msgwagetypename: TStringField
      FieldName = 'wagetypename'
      ReadOnly = True
      Size = 7
    end
    object employee_msgattendancename: TStringField
      FieldName = 'attendancename'
      ReadOnly = True
      Size = 8
    end
    object employee_msgsource: TWideStringField
      FieldName = 'source'
    end
    object employee_msgstation: TWideStringField
      FieldName = 'station'
    end
    object employee_msgrecognizor: TWideStringField
      FieldName = 'recognizor'
    end
    object employee_msgrecognizor_Phone: TWideStringField
      FieldName = 'recognizor_Phone'
    end
    object employee_msgE_people_relation: TWideStringField
      FieldName = 'E_people_relation'
    end
    object employee_msgstarlevel: TIntegerField
      FieldName = 'starlevel'
    end
    object employee_msgemployeecode: TStringField
      FieldName = 'employeecode'
    end
    object employee_msgremark: TWideStringField
      FieldName = 'remark'
      Size = 200
    end
    object employee_msgprinvicename: TWideStringField
      FieldName = 'prinvicename'
      Size = 200
    end
    object employee_msgprovince_ptr: TIntegerField
      FieldName = 'province_ptr'
    end
    object employee_msgage: TWideStringField
      FieldName = 'age'
      ReadOnly = True
      Size = 26
    end
    object employee_msgpublic_accumulation_funds: TWideStringField
      FieldName = 'public_accumulation_funds'
    end
    object employee_msgsiaccountno: TWideStringField
      FieldName = 'siaccountno'
    end
    object employee_msgserious_mistake: TIntegerField
      FieldName = 'serious_mistake'
    end
    object employee_msgworkage: TWideStringField
      FieldName = 'workage'
      ReadOnly = True
      Size = 22
    end
    object employee_msgmulti_ability: TWideStringField
      FieldName = 'multi_ability'
      Size = 50
    end
    object employee_msguser_defined2: TIntegerField
      FieldName = 'user_defined2'
    end
    object employee_msgcontractcount: TIntegerField
      FieldName = 'contractcount'
      ReadOnly = True
    end
    object employee_msgemp_contract_flag: TStringField
      FieldName = 'emp_contract_flag'
      ReadOnly = True
      Size = 10
    end
  end
  object employee_msg_1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkeymsg'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     rkey, chinesename, employeecode, departmentid, onduty' +
        'time, outdutytime, employ_type, Position, Rank, Politics_face, e' +
        'ducation, marriage, sex, addr, '
      
        '                      province, IDCard, Cardno, phone, attendanc' +
        'e, wagetype, roomcode, nation, photo, resume, others_contacts, b' +
        'irthday, status, classgroupid, blood_type, '
      
        '                      Height, graduatedschool, majorsubject, iDC' +
        'ardtime, sicardno, Residencepermit, bankaccount, bankname, conta' +
        'ctpersonname, contactpersontel, '
      
        '                      contactpersonaddr, recommendpersonname, re' +
        'commendpersontel, recommendaddr, recommendworkplace, GraduateTim' +
        'e,Languages,station,source,  '
      
        'case when wagetype=9 then '#39#26085#34218#24080#39'  when wagetype=10 then '#39#26376#34218'5.5'#39' w' +
        'hen wagetype=11 then '#39#26376#34218'6'#39'  end wagetypename,'
      
        'case when attendance=0 then '#39#21542#39' when attendance=1 then '#39#26159#39' end a' +
        'ttendancename ,employeemsg.recognizor,employeemsg.recognizor_Pho' +
        'ne,'
      
        'employeemsg.E_people_relation,employeemsg.starlevel,employeemsg.' +
        'remark,province_ptr,employeemsg.public_accumulation_funds,'
      
        'employeemsg.siaccountno,employeemsg.serious_mistake,employeemsg.' +
        'multi_ability,frist_RKEY'
      'FROM   dbo.employeemsg'
      'Where rkey=:rkeymsg')
    Left = 184
    Top = 112
    object employee_msg_1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object employee_msg_1chinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object employee_msg_1departmentid: TIntegerField
      FieldName = 'departmentid'
    end
    object employee_msg_1ondutytime: TDateTimeField
      FieldName = 'ondutytime'
    end
    object employee_msg_1outdutytime: TDateTimeField
      FieldName = 'outdutytime'
    end
    object employee_msg_1employ_type: TIntegerField
      FieldName = 'employ_type'
    end
    object employee_msg_1Position: TIntegerField
      FieldName = 'Position'
    end
    object employee_msg_1Rank: TIntegerField
      FieldName = 'Rank'
    end
    object employee_msg_1Politics_face: TIntegerField
      FieldName = 'Politics_face'
    end
    object employee_msg_1education: TIntegerField
      FieldName = 'education'
    end
    object employee_msg_1marriage: TIntegerField
      FieldName = 'marriage'
    end
    object employee_msg_1sex: TIntegerField
      FieldName = 'sex'
    end
    object employee_msg_1addr: TWideStringField
      FieldName = 'addr'
      Size = 50
    end
    object employee_msg_1province: TWideStringField
      FieldName = 'province'
    end
    object employee_msg_1IDCard: TWideStringField
      FieldName = 'IDCard'
    end
    object employee_msg_1Cardno: TWideStringField
      FieldName = 'Cardno'
      FixedChar = True
      Size = 10
    end
    object employee_msg_1phone: TWideStringField
      FieldName = 'phone'
    end
    object employee_msg_1attendance: TIntegerField
      FieldName = 'attendance'
    end
    object employee_msg_1wagetype: TIntegerField
      FieldName = 'wagetype'
    end
    object employee_msg_1roomcode: TWideStringField
      FieldName = 'roomcode'
    end
    object employee_msg_1nation: TWideStringField
      FieldName = 'nation'
    end
    object employee_msg_1photo: TBlobField
      FieldName = 'photo'
    end
    object employee_msg_1resume: TMemoField
      FieldName = 'resume'
      BlobType = ftMemo
    end
    object employee_msg_1others_contacts: TWideStringField
      FieldName = 'others_contacts'
    end
    object employee_msg_1birthday: TDateTimeField
      FieldName = 'birthday'
    end
    object employee_msg_1status: TWordField
      FieldName = 'status'
    end
    object employee_msg_1classgroupid: TIntegerField
      FieldName = 'classgroupid'
    end
    object employee_msg_1blood_type: TWideStringField
      FieldName = 'blood_type'
      FixedChar = True
      Size = 10
    end
    object employee_msg_1Height: TIntegerField
      FieldName = 'Height'
    end
    object employee_msg_1graduatedschool: TWideStringField
      FieldName = 'graduatedschool'
    end
    object employee_msg_1majorsubject: TWideStringField
      FieldName = 'majorsubject'
    end
    object employee_msg_1iDCardtime: TDateTimeField
      FieldName = 'iDCardtime'
    end
    object employee_msg_1sicardno: TStringField
      FieldName = 'sicardno'
    end
    object employee_msg_1Residencepermit: TStringField
      FieldName = 'Residencepermit'
    end
    object employee_msg_1bankaccount: TStringField
      FieldName = 'bankaccount'
      Size = 30
    end
    object employee_msg_1bankname: TWideStringField
      FieldName = 'bankname'
    end
    object employee_msg_1contactpersonname: TWideStringField
      FieldName = 'contactpersonname'
    end
    object employee_msg_1contactpersontel: TWideStringField
      FieldName = 'contactpersontel'
    end
    object employee_msg_1contactpersonaddr: TWideStringField
      FieldName = 'contactpersonaddr'
    end
    object employee_msg_1recommendpersonname: TWideStringField
      FieldName = 'recommendpersonname'
    end
    object employee_msg_1recommendpersontel: TWideStringField
      FieldName = 'recommendpersontel'
    end
    object employee_msg_1recommendaddr: TWideStringField
      FieldName = 'recommendaddr'
    end
    object employee_msg_1recommendworkplace: TWideStringField
      FieldName = 'recommendworkplace'
    end
    object employee_msg_1GraduateTime: TWideStringField
      FieldName = 'GraduateTime'
      FixedChar = True
      Size = 10
    end
    object employee_msg_1Languages: TWideStringField
      FieldName = 'Languages'
      Size = 10
    end
    object employee_msg_1wagetypename: TStringField
      FieldName = 'wagetypename'
      ReadOnly = True
      Size = 7
    end
    object employee_msg_1attendancename: TStringField
      FieldName = 'attendancename'
      ReadOnly = True
      Size = 8
    end
    object employee_msg_1station: TIntegerField
      FieldName = 'station'
    end
    object employee_msg_1source: TIntegerField
      FieldName = 'source'
    end
    object employee_msg_1recognizor: TWideStringField
      FieldName = 'recognizor'
    end
    object employee_msg_1recognizor_Phone: TWideStringField
      FieldName = 'recognizor_Phone'
    end
    object employee_msg_1E_people_relation: TWideStringField
      FieldName = 'E_people_relation'
    end
    object employee_msg_1starlevel: TIntegerField
      FieldName = 'starlevel'
    end
    object employee_msg_1employeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object employee_msg_1remark: TWideStringField
      FieldName = 'remark'
      Size = 200
    end
    object employee_msg_1province_ptr: TIntegerField
      FieldName = 'province_ptr'
    end
    object employee_msg_1public_accumulation_funds: TWideStringField
      FieldName = 'public_accumulation_funds'
    end
    object employee_msg_1siaccountno: TWideStringField
      FieldName = 'siaccountno'
    end
    object employee_msg_1serious_mistake: TIntegerField
      FieldName = 'serious_mistake'
    end
    object employee_msg_1frist_RKEY: TIntegerField
      FieldName = 'frist_RKEY'
    end
    object employee_msg_1multi_ability: TWideStringField
      FieldName = 'multi_ability'
      Size = 50
    end
  end
  object DataSource2: TDataSource
    DataSet = employee_department
    Left = 256
    Top = 24
  end
  object ADOEFR: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkeymsg'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     rkey, employeeid, relationship, chinesename, birth, a' +
        'ddr, workplace, remark, inputdate, opration_person'
      'FROM         dbo.employeeFamilyrelationship'
      'Where employeeid= :rkeymsg')
    Left = 104
    Top = 168
    object ADOEFRrkey: TIntegerField
      FieldName = 'rkey'
    end
    object ADOEFRemployeeid: TIntegerField
      FieldName = 'employeeid'
    end
    object ADOEFRrelationship: TWideStringField
      FieldName = 'relationship'
      FixedChar = True
      Size = 10
    end
    object ADOEFRchinesename: TWideStringField
      FieldName = 'chinesename'
      FixedChar = True
      Size = 10
    end
    object ADOEFRbirth: TWideStringField
      FieldName = 'birth'
      FixedChar = True
      Size = 10
    end
    object ADOEFRaddr: TWideStringField
      FieldName = 'addr'
      FixedChar = True
      Size = 10
    end
    object ADOEFRworkplace: TWideStringField
      FieldName = 'workplace'
      FixedChar = True
      Size = 10
    end
    object ADOEFRremark: TWideStringField
      FieldName = 'remark'
      FixedChar = True
      Size = 50
    end
    object ADOEFRinputdate: TWideStringField
      FieldName = 'inputdate'
      FixedChar = True
      Size = 10
    end
    object ADOEFRopration_person: TWideStringField
      FieldName = 'opration_person'
      FixedChar = True
      Size = 10
    end
  end
  object dsModel: TDataSource
    DataSet = qryModel
    Left = 169
    Top = 304
  end
  object qryModel: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select distinct model_name ,'
      
        'datafield_name=convert(varchar(500),STUFF((SELECT '#39','#39' + datafiel' +
        'd_name from employeemsg_rpt_model'
      ' where model_name=a.model_name'
      'FOR XML PATH('#39#39')), 1, 1, '#39#39'))'
      'from employeemsg_rpt_model  a')
    Left = 104
    Top = 304
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'with a as (select rkey, parent_ptr from data0025  ),  '
      
        'b as ( select * from a where rkey=11 union all select a.* from b' +
        ' inner join a  on b.rkey=a.parent_ptr)  '
      'select * from b ')
    Left = 352
    Top = 136
  end
end
