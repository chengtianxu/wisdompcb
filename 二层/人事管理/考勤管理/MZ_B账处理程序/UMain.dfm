object Form1: TForm1
  Left = 256
  Top = 251
  Width = 1088
  Height = 563
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 1080
    Height = 532
    Align = alClient
    TabOrder = 0
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 1078
      Height = 504
      Align = alClient
      TabOrder = 0
      object pgc1: TPageControl
        Left = 1
        Top = 1
        Width = 1076
        Height = 502
        ActivePage = ts3
        Align = alClient
        TabOrder = 0
        object ts3: TTabSheet
          Caption = #35774#32622
          ImageIndex = 3
          object lbl10: TLabel
            Left = 223
            Top = 102
            Width = 345
            Height = 13
            Caption = 
              '----------------------------------------------------------------' +
              '------------------------------------------------->'
          end
          object lbl11: TLabel
            Left = 226
            Top = 93
            Width = 359
            Height = 13
            Caption = #21483#36164#35759#22791#20221#26368#26032#30340#25968#25454#21040'hr'#24211','#37325#26032#23548#20837#21069#27492#31383#21475#26368#22909#19981#20851#38381#65281
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object lbl12: TLabel
            Left = 144
            Top = 61
            Width = 24
            Height = 13
            Caption = #26376#20221
          end
          object btn2: TButton
            Left = 299
            Top = 226
            Width = 75
            Height = 25
            Caption = '3.'#29983#25104#32771#21220
            TabOrder = 0
            OnClick = btn2Click
          end
          object btn_BakData: TButton
            Left = 80
            Top = 91
            Width = 140
            Height = 25
            Caption = '1.'#22791#20221#24050#22788#29702#22909#30340#25968#25454
            TabOrder = 1
            OnClick = btn_BakDataClick
          end
          object btn_ReInsert: TButton
            Left = 571
            Top = 89
            Width = 75
            Height = 25
            Caption = '2.'#37325#26032#23548#20837
            TabOrder = 2
            OnClick = btn_ReInsertClick
          end
          object BDate: TDateTimePicker
            Left = 176
            Top = 57
            Width = 78
            Height = 21
            Date = 42491.678189849540000000
            Format = 'yyyy-MM'
            Time = 42491.678189849540000000
            TabOrder = 3
          end
          object EDate: TDateTimePicker
            Left = 256
            Top = 57
            Width = 77
            Height = 21
            Date = 43009.678189849540000000
            Format = 'yyyy-MM'
            Time = 43009.678189849540000000
            TabOrder = 4
          end
          object dtp1: TDateTimePicker
            Left = 208
            Top = 229
            Width = 78
            Height = 21
            Date = 42491.678189849540000000
            Format = 'yyyy-MM'
            Time = 42491.678189849540000000
            TabOrder = 5
          end
        end
      end
    end
    object pnl17: TPanel
      Left = 1
      Top = 505
      Width = 1078
      Height = 26
      Align = alBottom
      TabOrder = 1
      object pb1: TProgressBar
        Left = 1
        Top = 1
        Width = 1076
        Height = 24
        Align = alClient
        TabOrder = 0
      end
    end
  end
  object dlgOpen1: TOpenDialog
    Left = 672
  end
  object ds1: TDataSource
    DataSet = qry_class
    Left = 598
    Top = 155
  end
  object qry_class: TADOQuery
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'YM'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 7
        Value = Null
      end>
    SQL.Strings = (
      
        'select   a.rkey, c.chinesename, c.employeecode, a.checkdate, b.c' +
        'lassname,a.classid'
      'from  onoffdutydata a '
      'left  join class b on a.classid=b.rkey'
      'inner join  employeemsg c on a.employeeid=c.rkey'
      'where  convert(varchar(7),checkdate,120)=:YM'
      '')
    Left = 638
    Top = 147
    object qry_classchinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object qry_classemployeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object qry_classcheckdate: TDateTimeField
      FieldName = 'checkdate'
    end
    object qry_classclassname: TWideStringField
      FieldName = 'classname'
    end
    object qry_classrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qry_classclassid: TIntegerField
      FieldName = 'classid'
    end
  end
  object ds2: TDataSource
    DataSet = qry_Lclass
    Left = 598
    Top = 187
  end
  object qry_Lclass: TADOQuery
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'YM'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 7
        Value = Null
      end>
    SQL.Strings = (
      
        'select   a.rkey,  c.chinesename, c.employeecode, a.checkdate, a.' +
        'resttype,a.classid'
      'from  onoffdutydata a '
      'inner join  employeemsg c on a.employeeid=c.rkey'
      'where  convert(varchar(7),checkdate,120)=:YM')
    Left = 638
    Top = 187
    object qry_Lclasschinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object qry_Lclassemployeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object qry_Lclasscheckdate: TDateTimeField
      FieldName = 'checkdate'
    end
    object qry_Lclassresttype: TIntegerField
      FieldName = 'resttype'
    end
    object qry_Lclassrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qry_Lclassclassid: TIntegerField
      FieldName = 'classid'
    end
  end
  object ds3: TDataSource
    DataSet = qry_Holiday
    Left = 598
    Top = 227
  end
  object qry_Holiday: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select   c.chinesename, c.employeecode, a.checkdate, b.classname'
      'from  onoffdutydata a '
      'inner join class b on a.classid=b.rkey'
      'inner join  employeemsg c on a.employeeid=c.rkey'
      'where  convert(varchar(7),checkdate,120)='#39'-1'#39)
    Left = 718
    Top = 291
    object WideStringField4: TWideStringField
      FieldName = 'chinesename'
    end
    object WideStringField5: TWideStringField
      FieldName = 'employeecode'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'checkdate'
    end
    object WideStringField6: TWideStringField
      FieldName = 'classname'
    end
  end
  object pm1: TPopupMenu
    Left = 710
    Top = 139
    object mniN1: TMenuItem
      Caption = #20462#25913
    end
  end
  object pm2: TPopupMenu
    Left = 726
    Top = 219
    object mniedit2: TMenuItem
      Caption = #20462#25913
    end
  end
  object qrytemp: TADOQuery
    CommandTimeout = 0
    Parameters = <>
    Left = 661
    Top = 313
  end
  object qry_UpdateView: TADOQuery
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      'alter         VIEW [dbo].[v_onoffduty_report]    '
      ' AS    '
      'SELECT TOP 100 PERCENT      '
      '     case when datepart(weekday,checkdate) in (1,7) then '#39'*'#39'    '
      '     when  resttype in (2) then '#39#20241#39'    '
      '  when isnull(resttype,0) in (3) then '#39#33410#39'    '
      '  else '#39#39' end     '
      '  as flag, ----'#26174#31034#26631#35782'    '
      ' DAY(CheckDate)AS dy,      '
      ' YEAR(CheckDate) AS '#24180',     '
      ' MONTH(CheckDate) AS '#26376',     '
      ' DAY(CheckDate) as '#26085',    '
      ' ChineseName,--------'#22995#21517'    '
      ' employeeid,    '
      ' position,-----'#32844#21153'ID    '
      'position_item,----'#32844#21153#21517#31216'     '
      
        ' SUBSTRING(CONVERT(nvarchar(20), OffDutyTime1, 120), 12, 5) AS o' +
        'ut1,-----------    '
      
        ' SUBSTRING(CONVERT(nvarchar(20), ondutytime1, 120), 12, 5) AS in' +
        '1,-------------    '
      
        ' SUBSTRING(CONVERT(nvarchar(20), ondutytime2, 120), 12, 5) AS in' +
        '2,-------------    '
      
        ' SUBSTRING(CONVERT(nvarchar(20), OffDutyTime2, 120), 12, 5) AS o' +
        'ut2,------------    '
      
        ' SUBSTRING(CONVERT(nvarchar(20), ondutytime3, 120), 12, 5) AS in' +
        '3,--------------    '
      
        ' SUBSTRING(CONVERT(nvarchar(20), OffDutyTime3, 120), 12, 5) AS o' +
        'ut3,-------------    '
      
        ' SUBSTRING(CONVERT(nvarchar(20), OnDutyTime4, 120), 12, 5) AS in' +
        '4,    '
      
        ' SUBSTRING(CONVERT(nvarchar(20), OffDutyTime4, 120), 12, 5) AS o' +
        'ut4,    '
      'DepartmentName, ----'#37096#38376#21517#31216'    '
      'EmployeeCode,-----'#24037#21495'    '
      'ondutytime,    '
      'outdutytime,------'#31163#32844#26085#26399'    '
      
        'case when outdutytime is not null then 1 else 0 end as outduty_f' +
        'lag,    '
      'ClassName,------'#29677#27425#21517#31216'    '
      'CheckDate,------'#32771#21220#26085#26399'    '
      'd.accountname,    '
      'SumCN,     '
      'SumCT, ----'#36831#21040#20998#38047'    '
      'SumZN,    '
      'SumZT,----'#26089#36864#20998#38047'    '
      'SumKN,     '
      'isnull(SumKT,0)/15/4.0/8.0 as sumkt,----- '#26103#24037#22825'     '
      'SumWN,    '
      'SumWT, -----    '
      'SumJN,     '
      'SumJT,-----     '
      'SumEN,     '
      'SumET, -----    '
      'SumLN,    '
      ' case when ln1 not in (9)     '
      ' and ln2 not in (9) then     '
      
        ' round(isnull(SumLT,0)/10.00,0)*10/30/2.0 else 0 end as SumLT ,-' +
        '-----'#35831#20551#23567#26102'    '
      ' YTnote,     '
      ' ClassGroupID,    '
      ' RestType,------'#20551#26085#31867#22411',0 '#26159#24037#20316#26085'    '
      ' OWT,    '
      ' SWT,    '
      ' NCN,    '
      '---select * from resttypemsg    '
      
        ' (case when isnull(resttype,0)<>4 then  isnull(RWT,0)  else 0 en' +
        'd )  as RWT ,-----'#24403#22825#20027#24037#26102'    '
      
        ' (case when isnull(resttype,0)<>4  then  isnull(ROT,0)  else 0 e' +
        'nd ) as ROT, -----'#24403#22825#38468#24037#26102'    '
      '    '
      
        ' case when isnull(resttype,0)<>4  then ( round((isnull(RWT,0)+is' +
        'null(ROT,0)),2)) else 0 end as RWTROT,----'#24403#22825#24635#24037#26102'    '
      '    '
      
        'case when isnull(resttype,0)=0  then round(isnull(rwt,0),2) else' +
        ' 0 end    '
      ' as work1,--'#27491#29677'('#21608#19968#33267#21608#20116#26080#33394')    '
      '    '
      
        'case when isnull(resttype,0)=0 and c.isoverzero=0 and isnull(rwt' +
        ',0)>=4 then     '
      ' round(isnull(rwt,0)/8.0,2) else 0 end    '
      '    '
      'as work1_day, --'#27491#29677#30333#29677'    '
      
        'case when isnull(resttype,0)=0 and c.isoverzero=1 and isnull(rwt' +
        ',0)>=4 then     '
      ' round(isnull(rwt,0)/8.0,2) else 0 end    '
      '    '
      'as work1_night,---'#27491#29677#22812#29677'    '
      'case when isnull(resttype,0)=0 then round(isnull(rot,0),2)     '
      
        '  when isnull(resttype,0)=1 then round((isnull(rot,0)+isnull(rwt' +
        ',0)),2)    '
      
        '  when isnull(resttype,0)=3 then round((isnull(rot,0)+isnull(rwt' +
        ',0)),2) else 0 end    '
      ' as work2,--'#21152#29677',    '
      '    '
      
        'case when isnull(resttype,0)=0  then round(isnull(rot,0),2) else' +
        ' 0 end     '
      ' as work3,--'#24179#26102#21152#29677#65288#28784#33394#21152#29677#65289'    '
      '    '
      
        '  case   when isnull(resttype,0)=1     then      round((isnull(r' +
        'ot,0)+isnull(rwt,0)),2)    --- else 0 end     '
      ' else  0 end  as work4,--'#21608#20845#26085#21152#29677#65288#32511#33394#21152#29677#65289'      '
      '     '
      
        'case    when isnull(resttype,0)=1   and owtflag=0   then round((' +
        'isnull(rot,0)+isnull(rwt,0)),2)    '
      
        '        when isnull(resttype,0)=1   and owtflag=1  and isnull(nr' +
        'wt,0)>0    then      round(isnull(rot,0)+isnull(nrwt,0),2)    --' +
        '- else 0 end     '
      'else  0 end  as work44,--'#21608#20845#26085#27809#26377#30003#35831#30340#21152#29677'      '
      '    '
      '    '
      
        '  case   when isnull(resttype,0)=3    then      round((isnull(ro' +
        't,0)+isnull(rwt,0)),2)    --- else 0 end     '
      ' else  0 end  as work10,--'#33410#20551#21152#29677#65288#32511#33394#21152#29677#65289'    '
      '  '
      
        'case    when isnull(resttype,0)=3   and owtflag=0   then round((' +
        'isnull(rot,0)+isnull(rwt,0)),2)    '
      
        '        when isnull(resttype,0)=3   and owtflag=1  and isnull(nr' +
        'wt,0)>0    then      round(isnull(rot,0)+isnull(nrwt,0),2)    --' +
        '- else 0 end     '
      'else  0 end  as work40,--'#33410#20551#27809#26377#30003#35831#30340#21152#29677'     '
      '  '
      '  '
      '    '
      '(case when a.locked=1 and isnull(rwt,0)=4.0      '
      '      then 0.50      ---'#24050#38145'    '
      
        '   when a.locked=1 and isnull(rot,0)>0 and isnull(rwt,0)<=8.0   ' +
        '   '
      '      then (8.0-isnull(rwt,0))/8.0 ---'#24050#38145'    '
      
        '   when isnull(resttype,0) in (0,2,4) and isnull(rwt,0)=0 then 1' +
        '.00  -----'#28145#22323#21306#22495#29305#23450'rkey    '
      '   when isnull(resttype,0)=0 and rwt=4.0 and    '
      '  (isnull(ln1,0)=3 or isnull(ln2,0)=3 or isnull(ln3,0)=3)     '
      '      then 0.50    '
      
        '      when isnull(resttype,0)=0 and  (swt=4) and (rwt between 0 ' +
        'and 4) then 0.50    '
      
        '   when isnull(resttype,0)=0 and  (swt=6) and (rwt between 4 and' +
        ' 6) then 0.25       '
      ' else 0 end )     '
      'as restday,--'#35843#20241#22825#25968', '#20248#20808#21028#26029#31532#19968#20010#26465#20214'    '
      '    '
      
        'case when isnull(resttype,0)=0  then round(isnull(rwt,0)/8.0,2) ' +
        '    '
      '  else 0 end    '
      'as workday,--'#27491#29677#20986#21220#22825'('#21608#19968#33267#21608#20116#26080#33394')    '
      '    '
      
        'case when  isnull(resttype,0) in (0,1) and  isnull(rwt,0)>7.0 th' +
        'en 1     '
      
        'else (case when  isnull(resttype,0) in (0,1) and  isnull(rwt,0)>' +
        '=3.5 then 0.5 else 0 end ) end    '
      '      '
      'as orginal_workday,--'#21407#20986#21220#22825'    '
      '    '
      '    '
      '    '
      '    '
      
        'case when   isnull(resttype,0)=1     and isnull(rwt,0)>7.0 then ' +
        '1     '
      
        'else (case when isnull(resttype,0)=1 and isnull(rwt,0)>=3.5 then' +
        ' 0.5 else 0 end )    '
      'end      '
      'as week_workday,--'#26631#35782#21608#26411#20986#21220#22825'    '
      '    '
      '    '
      'case when isnull(resttype,0)=3 then 1.0     '
      '  else 0 end    '
      'as festival ,--'#27861#23450#20551#22825'('#22825#34013#33394')    '
      '    '
      '    '
      '    '
      'case when     '
      '(    '
      '(case when isnull(resttype,0)=0 and (isnull(ln1,0)=6 )     '
      'then   round(isnull(lt1,0)/10,0)*10 else 0 end    '
      '+case when isnull(resttype,0)=0 and (isnull(ln2,0)=6 )    '
      ' then  round(isnull(lt2,0)/10,0)*10  else 0 end    '
      '+ case when isnull(resttype,0)=0 and (isnull(ln3,0)=6 )     '
      'then  round(isnull(lt3,0)/10,0)*10 else 0 end    '
      ')/15/4    '
      ')>8 then 8     '
      'else (    '
      '(case when isnull(resttype,0)=0 and (isnull(ln1,0)=6 )     '
      'then  round(isnull(lt1,0)/10,0)*10 else 0 end    '
      '+case when isnull(resttype,0)=0 and (isnull(ln2,0)=6 )     '
      'then  round(isnull(lt2,0)/10,0)*10 else 0 end    '
      '+ case when isnull(resttype,0)=0 and (isnull(ln3,0)=6 )    '
      ' then  round(isnull(lt3,0)/10,0)*10 else 0 end    '
      ')/15/4    '
      ') end  as qj, ---'#35831#20551#23567#26102'    '
      '    '
      'round(    '
      '    '
      '(case when     '
      '(    '
      '(case when isnull(resttype,0)=0 and (isnull(ln1,0)=11 )     '
      ' then   round(isnull(lt1,0)/10,0)*10 else 0 end    '
      '+case when isnull(resttype,0)=0 and (isnull(ln2,0)=11 )     '
      ' then  round(isnull(lt2,0)/10,0)*10  else 0 end    '
      '+ case when isnull(resttype,0)=0 and (isnull(ln3,0)=11 )     '
      'then  round(isnull(lt3,0)/10,0)*10 else 0 end    '
      ')/15/4 )>8 then 8    '
      'else     '
      '(    '
      '(case when isnull(resttype,0)=0 and (isnull(ln1,0)=11 )     '
      'then  round(isnull(lt1,0)/10,0)*10 else 0 end    '
      '+case when isnull(resttype,0)=0 and (isnull(ln2,0)=11 )    '
      ' then  round(isnull(lt2,0)/10,0)*10 else 0 end    '
      '+ case when isnull(resttype,0)=0 and (isnull(ln3,0)=11 )    '
      ' then  round(isnull(lt3,0)/10,0)*10 else 0 end    '
      ')/15/4) end     '
      '),2)  as yearj ---'#24180#20551#23567#26102'    '
      ' FROM dbo.onoffdutydata a    '
      'left join v_employeemsg b on a.employeeid=b.rkey     '
      'left join class c on a.classid=c.rkey     '
      'left join salaryaccount d on d.rkey=a.editmode     '
      '    '
      'order by employeecode,checkdate     ')
    Left = 629
    Top = 425
  end
end
