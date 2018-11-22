object frmMultiSelectedItem: TfrmMultiSelectedItem
  Left = 325
  Top = 241
  Width = 821
  Height = 523
  Caption = 'frmMultiSelectedItem'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object pnl1: TPanel
    Left = 0
    Top = 448
    Width = 813
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnOK: TButton
      Left = 240
      Top = 7
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object btnCancel: TButton
      Left = 354
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object CheckBox1: TCheckBox
      Left = 17
      Top = 4
      Width = 97
      Height = 17
      Caption = #20840#36873
      TabOrder = 2
      OnClick = CheckBox1Click
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 813
    Height = 448
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnl2'
    TabOrder = 1
    object Dgh1: TDBGridEh
      Left = 0
      Top = 25
      Width = 813
      Height = 423
      Hint = #21452#20987#30830#23450#13#10#22238#36710#30830#23450#13#10#20851#38381#21462#28040
      Align = alClient
      DataSource = ds1
      FooterColor = clWindow
      FooterFont.Charset = GB2312_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -12
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      PopupMenu = PopupMenu1
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnColEnter = Dgh1ColEnter
      OnDblClick = Dgh1DblClick
      OnEnter = Dgh1Enter
      OnGetCellParams = Dgh1GetCellParams
      OnKeyDown = Dgh1KeyDown
      OnKeyPress = Dgh1KeyPress
      OnTitleClick = Dgh1TitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'selected'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'ABBR_NAME'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'Fasset_Code'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'FASSET_NAME'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'DEPT_Name'
          Footers = <>
          Width = 103
        end
        item
          EditButtons = <>
          FieldName = 'DeviType'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'MainCycl'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'StdTimeCons'
          Footers = <>
        end>
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 813
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object bt1: TSpeedButton
        Left = 219
        Top = 2
        Width = 23
        Height = 22
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF005656560056565600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005656
          560092DC00007AB9000026262600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003E3E
          3E007AB90000AAFF25007AB9000026262600FFFFFF00FFFFFF00FFFFFF000000
          0000000000000000000000000000000000000000000056565600FFFFFF00FFFF
          FF003E3E3E0062960000AAFF25006296000056565600FFFFFF00FFFFFF003E3E
          3E007AB900007AB90000629600006296000056565600FFFFFF00FFFFFF00FFFF
          FF00FFFFFF005656560092DC000092DC000056565600FFFFFF00FFFFFF003E3E
          3E00C6FF6B008FFF6B007AB900006E6E6E00B6B6B600FFFFFF00FFFFFF00FFFF
          FF00FFFFFF007A7A7A007AB90000AAFF250026262600FFFFFF00FFFFFF003E3E
          3E00D4FF8E00ABFF8E00B8FF48006296000056565600FFFFFF00FFFFFF00FFFF
          FF00FFFFFF007A7A7A007AB90000D4FF8E0026262600FFFFFF00FFFFFF003E3E
          3E00E2FFB100AAAAAA0092DC0000AAFF25006296000056565600FFFFFF00FFFF
          FF00FFFFFF00565656007AB90000AAFF250026262600FFFFFF00FFFFFF005656
          560056565600B6B6B6005656560092DC0000D4FF8E0062960000565656003E3E
          3E003E3E3E006296000092DC000092DC000056565600FFFFFF00FFFFFF005656
          5600FFFFFF00FFFFFF00FFFFFF00565656007AB90000D4FF8E007AB900007AB9
          00007AB900007AB9000092DC0000629600007A7A7A00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00565656007AB9000092DC0000AAFF
          2500AAFF2500AAFF25007AB9000056565600FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007A7A7A00565656005656
          560056565600565656007A7A7A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
        OnClick = bt1Click
      end
      object FieldLabel: TLabel
        Left = 24
        Top = 6
        Width = 60
        Height = 12
        Caption = 'FieldLabel'
      end
      object Edit1: TEdit
        Left = 95
        Top = 3
        Width = 121
        Height = 20
        TabOrder = 0
        OnChange = Edit1Change
      end
    end
  end
  object ds1: TDataSource
    DataSet = dt1
    Left = 120
    Top = 72
  end
  object Dt: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeInsert = DtBeforeInsert
    CommandText = 
      'select Cast(0 as Bit)  selected ,CONVERT(VARCHAR(10),getdate(),1' +
      '20) PlanMainDate,d15.ABBR_NAME,d17.Fasset_Code ,'#13'FASSET_NAME ,DE' +
      'PT_Name ,d17.DeviType ,d12.MainCycl,d16.rkey as d16rkey, d17.equ' +
      'ipment_grade,d17.LOCATION,'#13'[StdTimeCons]=(select [StdTimeCons] f' +
      'rom [data0847] where  [D417_ptr]=d17.rkey and d12.MainCycl  =[da' +
      'ta0847].MainCycl) '#13'from data0417 d17 '#13'join data0812 d12 on d17.D' +
      'eviType=d12.DeviType and active_flag in(3,4)/*3'#23433#35013#23436#25104',4'#39564#25910#21512#26684'*/ '#13'joi' +
      'n data0034 d34 on d34.rkey=d17.DEPT_PTR join data0015 d15 on d17' +
      '.warehouse_ptr=d15.rkey '#13'join data0816 d16 on d12.MainCycl=d16.M' +
      'ainCycl  '#10'where not exists(select * from data0831 d31  where d31' +
      '.DeviNumb=d17.Fasset_Code and d31.MainCycl=d12.MainCycl) '#10'UNION ' +
      #13#10'select * from '#13#10'('#13#10'select Cast(0 as Bit) selected ,'#13#10'case when' +
      ' d31.PlanMainDate+d16.cycl_duration<getDate() then CONVERT(VARCH' +
      'AR(10),getDate(),120)'#13#10'     else CONVERT(VARCHAR(10),d31.PlanMai' +
      'nDate+d16.cycl_duration,120) end PlanMainDate,d15.ABBR_NAME,d17.' +
      'Fasset_Code ,'#13#10'FASSET_NAME ,DEPT_Name ,d17.DeviType ,d12.MainCyc' +
      'l,d16.rkey as d16rkey, d17.equipment_grade,d17.LOCATION,'#13#10'[StdTi' +
      'meCons]=(select [StdTimeCons] from [data0847] where  [D417_ptr]=' +
      'd17.rkey and d12.MainCycl  =[data0847].MainCycl) '#13#10'from data0417' +
      ' d17 '#13#10'join data0812 d12 on d17.DeviType=d12.DeviType and active' +
      '_flag in(3,4)/*3'#23433#35013#23436#25104',4'#39564#25910#21512#26684'*/'#13#10'join data0034 d34 on d34.rkey=d17.' +
      'DEPT_PTR    '#13#10'join data0015 d15 on d17.warehouse_ptr=d15.rkey   ' +
      '                 '#13#10'join data0831 d31 on d31.DeviNumb=d17.Fasset_' +
      'Code and d31.MainCycl=d12.MainCycl '#13#10'join data0816 d16 on d31.Ma' +
      'inCycl=d16.MainCycl   '#13#10'where exists ('#13#10'    select * from '#13#10'    ' +
      '    (select max(PlanMainDate)PlanMainDate,DeviNumb,MainCycl from' +
      ' data0831 '#13#10'        where RKEY832 in (2,4)'#13#10'        and not exis' +
      'ts(select * from data0831 d31 where data0831.DeviNumb=d31.DeviNu' +
      'mb    '#13#10'               and data0831.MainCycl=d31.MainCycl and d3' +
      '1.RKEY832 in(1,3,5,6) )         '#13#10'        group by DeviNumb,Main' +
      'Cycl  )as t1  '#13#10'    where d31.PlanMainDate=t1.PlanMainDate'#13#10'    ' +
      'and d31.DeviNumb=t1.DeviNumb and d31.MainCycl=t1.MainCycl '#13#10'    ' +
      '          )      '#13#10#13#10') as temptemp'#13#10'order by FASSET_NAME,PlanMai' +
      'nDate,d16rkey'
    Parameters = <>
    Left = 168
    Top = 72
    object Dtselected: TBooleanField
      DisplayLabel = #36873#25321
      DisplayWidth = 5
      FieldName = 'selected'
    end
    object DtABBR_NAME: TStringField
      DisplayLabel = #24037#21378#21517#31216
      DisplayWidth = 12
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object DtFasset_Code: TStringField
      DisplayLabel = #35774#22791#32534#21495
      DisplayWidth = 21
      FieldName = 'Fasset_Code'
    end
    object DtFASSET_NAME: TStringField
      DisplayLabel = #35774#22791#21517#31216
      DisplayWidth = 30
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object DtDEPT_Name: TStringField
      DisplayLabel = #37096#38376#21517#31216
      DisplayWidth = 17
      FieldName = 'DEPT_Name'
      Size = 30
    end
    object DtDeviType: TStringField
      DisplayLabel = #20445#20859#31867#22411
      DisplayWidth = 10
      FieldName = 'DeviType'
      Size = 10
    end
    object DtMainCycl: TStringField
      DisplayLabel = #20445#20859#21608#26399
      DisplayWidth = 10
      FieldName = 'MainCycl'
      Size = 10
    end
    object DtStdTimeCons: TBCDField
      FieldName = 'StdTimeCons'
      Precision = 9
      Size = 2
    end
    object Dtd16rkey: TWordField
      FieldName = 'd16rkey'
      ReadOnly = True
    end
    object DtPlanMainDate: TStringField
      FieldName = 'PlanMainDate'
      ReadOnly = True
      Size = 10
    end
    object Dtequipment_grade: TStringField
      FieldName = 'equipment_grade'
      ReadOnly = True
      Size = 50
    end
    object DtLOCATION: TStringField
      FieldName = 'LOCATION'
      ReadOnly = True
      Size = 40
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 344
    Top = 200
    object mniNCanSelected: TMenuItem
      Caption = #21462#28040#36873#25321
      Visible = False
      OnClick = mniNCanSelectedClick
    end
  end
  object dt1: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select Cast(0 as Bit)  selected ,CONVERT(VARCHAR(10),getdate(),1' +
      '20) PlanMainDate,d15.ABBR_NAME,d17.Fasset_Code ,'#13#10'FASSET_NAME ,D' +
      'EPT_Name ,d17.DeviType ,d12.MainCycl,d16.rkey as d16rkey, d17.eq' +
      'uipment_grade,d17.LOCATION,'#13#10'[StdTimeCons]=(select [StdTimeCons]' +
      ' from [data0847] where  [D417_ptr]=d17.rkey and d12.MainCycl  =[' +
      'data0847].MainCycl) '#13#10'from data0417 d17 '#13#10'join data0812 d12 on d' +
      '17.DeviType=d12.DeviType and active_flag in(3,4,7)/*3'#23433#35013#23436#25104',4'#39564#25910#21512#26684',' +
      '7'#38386#32622'*/ '#13#10'join data0034 d34 on d34.rkey=d17.DEPT_PTR join data0015' +
      ' d15 on d17.warehouse_ptr=d15.rkey '#13#10'join data0816 d16 on d12.Ma' +
      'inCycl=d16.MainCycl  '#13#10'where not exists(select * from data0831 d' +
      '31  where d31.DeviNumb=d17.Fasset_Code and d31.MainCycl=d12.Main' +
      'Cycl) '#13#10'UNION '#13#10'select * from '#13#10'('#13#10'select Cast(0 as Bit) selecte' +
      'd ,'#13#10'case when d31.PlanMainDate+d16.cycl_duration<getDate() then' +
      ' CONVERT(VARCHAR(10),getDate(),120)'#13#10'     else CONVERT(VARCHAR(1' +
      '0),d31.PlanMainDate+d16.cycl_duration,120) end PlanMainDate,d15.' +
      'ABBR_NAME,d17.Fasset_Code ,'#13#10'FASSET_NAME ,DEPT_Name ,d17.DeviTyp' +
      'e ,d12.MainCycl,d16.rkey as d16rkey, d17.equipment_grade,d17.LOC' +
      'ATION,'#13#10'[StdTimeCons]=(select [StdTimeCons] from [data0847] wher' +
      'e  [D417_ptr]=d17.rkey and d12.MainCycl  =[data0847].MainCycl) '#13 +
      #10'from data0417 d17 '#13#10'join data0812 d12 on d17.DeviType=d12.DeviT' +
      'ype and active_flag in(3,4,7)/*3'#23433#35013#23436#25104',4'#39564#25910#21512#26684',7'#38386#32622'*/'#13#10'join data0034 ' +
      'd34 on d34.rkey=d17.DEPT_PTR    '#13#10'join data0015 d15 on d17.wareh' +
      'ouse_ptr=d15.rkey                    '#13#10'join data0831 d31 on d31.' +
      'DeviNumb=d17.Fasset_Code and d31.MainCycl=d12.MainCycl '#13#10'join da' +
      'ta0816 d16 on d31.MainCycl=d16.MainCycl   '#13#10'where exists ('#13#10'    ' +
      'select * from '#13#10'        (select max(PlanMainDate)PlanMainDate,De' +
      'viNumb,MainCycl from data0831 '#13#10'        where RKEY832 in (2,4)'#13#10 +
      '        and not exists(select * from data0831 d31 where data0831' +
      '.DeviNumb=d31.DeviNumb    '#13#10'               and data0831.MainCycl' +
      '=d31.MainCycl and d31.RKEY832 in(1,3,5,6) )         '#13#10'        gr' +
      'oup by DeviNumb,MainCycl  )as t1  '#13#10'    where d31.PlanMainDate=t' +
      '1.PlanMainDate'#13#10'    and d31.DeviNumb=t1.DeviNumb and d31.MainCyc' +
      'l=t1.MainCycl '#13#10'              )      '#13#10#13#10') as temptemp'#13#10'order by' +
      ' FASSET_NAME,PlanMainDate,d16rkey'
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 312
    Top = 80
    object dt1selected: TBooleanField
      DisplayLabel = #36873#25321
      FieldName = 'selected'
    end
    object dt1PlanMainDate: TStringField
      DisplayLabel = #35745#21010#20445#20859#26102#38388
      FieldName = 'PlanMainDate'
      ReadOnly = True
      Size = 10
    end
    object dt1ABBR_NAME: TStringField
      DisplayLabel = #24037#21378#21517#31216
      FieldName = 'ABBR_NAME'
      ReadOnly = True
      Size = 10
    end
    object dt1Fasset_Code: TStringField
      DisplayLabel = #35774#22791#32534#21495
      FieldName = 'Fasset_Code'
      ReadOnly = True
    end
    object dt1FASSET_NAME: TStringField
      DisplayLabel = #35774#22791#21517#31216
      FieldName = 'FASSET_NAME'
      ReadOnly = True
      Size = 30
    end
    object dt1DEPT_Name: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_Name'
      ReadOnly = True
      Size = 30
    end
    object dt1DeviType: TStringField
      DisplayLabel = #20445#20859#31867#22411
      FieldName = 'DeviType'
      ReadOnly = True
      Size = 10
    end
    object dt1MainCycl: TStringField
      DisplayLabel = #20445#20859#21608#26399
      FieldName = 'MainCycl'
      ReadOnly = True
      Size = 10
    end
    object dt1StdTimeCons: TBCDField
      DisplayLabel = #26631#20934#26102#38388
      FieldName = 'StdTimeCons'
      Precision = 9
      Size = 2
    end
    object dt1d16rkey: TSmallintField
      FieldName = 'd16rkey'
      ReadOnly = True
    end
    object dt1equipment_grade: TStringField
      FieldName = 'equipment_grade'
      ReadOnly = True
      Size = 50
    end
    object dt1LOCATION: TStringField
      FieldName = 'LOCATION'
      ReadOnly = True
      Size = 40
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Dt
    Options = [poAllowCommandText]
    Left = 232
    Top = 72
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    SQL.Strings = (
      '/*'#26597#35810#20174#26410#20445#20859#36807#30340#26032#36827#35774#22791'*/'
      
        'select Cast(0 as Bit)  selected ,CONVERT(VARCHAR(10),getdate(),1' +
        '20) PlanMainDate,d15.ABBR_NAME,d17.Fasset_Code ,'
      
        'FASSET_NAME ,DEPT_Name ,d17.DeviType ,d12.MainCycl,d16.rkey as d' +
        '16rkey, d17.equipment_grade,d17.LOCATION,'
      
        '[StdTimeCons]=(select [StdTimeCons] from [data0847] where  [D417' +
        '_ptr]=d17.rkey and d12.MainCycl  =[data0847].MainCycl) '
      'from data0417 d17 '
      
        'join data0812 d12 on d17.DeviType=d12.DeviType and active_flag i' +
        'n(3,4,7)/*3'#23433#35013#23436#25104',4'#39564#25910#21512#26684',7'#38386#32622'*/ '
      
        'join data0034 d34 on d34.rkey=d17.DEPT_PTR join data0015 d15 on ' +
        'd17.warehouse_ptr=d15.rkey '
      'join data0816 d16 on d12.MainCycl=d16.MainCycl  '
      
        'where not exists(select * from data0831 d31  where d31.DeviNumb=' +
        'd17.Fasset_Code and d31.MainCycl=d12.MainCycl) ')
    Left = 512
    Top = 128
  end
  object ADOQuery2: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'UNION '
      'select * from '
      '('
      'select Cast(0 as Bit) selected ,'
      
        'case when d31.PlanMainDate+d16.cycl_duration<getDate() then CONV' +
        'ERT(VARCHAR(10),getDate(),120)'
      
        '     else CONVERT(VARCHAR(10),d31.PlanMainDate+d16.cycl_duration' +
        ',120) end PlanMainDate,d15.ABBR_NAME,d17.Fasset_Code ,'
      
        'FASSET_NAME ,DEPT_Name ,d17.DeviType ,d12.MainCycl,d16.rkey as d' +
        '16rkey, d17.equipment_grade,d17.LOCATION,'
      
        '[StdTimeCons]=(select [StdTimeCons] from [data0847] where  [D417' +
        '_ptr]=d17.rkey and d12.MainCycl  =[data0847].MainCycl) '
      'from data0417 d17 '
      
        'join data0812 d12 on d17.DeviType=d12.DeviType and active_flag i' +
        'n(3,4,7)/*3'#23433#35013#23436#25104',4'#39564#25910#21512#26684',7'#38386#32622'*/'
      'join data0034 d34 on d34.rkey=d17.DEPT_PTR    '
      
        'join data0015 d15 on d17.warehouse_ptr=d15.rkey                 ' +
        '   '
      
        'join data0831 d31 on d31.DeviNumb=d17.Fasset_Code and d31.MainCy' +
        'cl=d12.MainCycl '
      'join data0816 d16 on d31.MainCycl=d16.MainCycl   '
      'where exists ('
      '    select * from   /*'#26597#35810#20445#20859#35745#21010#20013#26368#22823#20445#20859#26085#26399#65292#29366#24577#19988#27809#26377#24453#25191#34892'*/'
      
        '        (select max(PlanMainDate)PlanMainDate,DeviNumb,MainCycl ' +
        'from data0831 '
      '        where RKEY832 in (3,5,6,2,4)/*3'#25191#34892#20013',5'#24050#36890#30693',6'#24050#26242#20572';2'#24050#39564#25910';4'#24453#39564#25910'*/'
      
        '        and not exists(select * from data0831 d31 where data0831' +
        '.DeviNumb=d31.DeviNumb    '
      
        '               and data0831.MainCycl=d31.MainCycl and d31.RKEY83' +
        '2 in(1)/*'#26597#35810#20986#25152#26377'1'#24453#25191#34892'*/ )         '
      '        group by DeviNumb,MainCycl  )as t1  '
      '    where d31.PlanMainDate=t1.PlanMainDate'
      '    and d31.DeviNumb=t1.DeviNumb and d31.MainCycl=t1.MainCycl '
      '              )      '
      ''
      ') as temptemp')
    Left = 512
    Top = 184
  end
end
