inherited frmWorkRecord05: TfrmWorkRecord05
  Left = 512
  Top = 204
  Caption = #39033#30446#32791#26102#20449#24687
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxTabControl1: TcxTabControl
    inherited Panel3: TPanel
      inherited Panel2: TPanel
        inherited RzToolbar1: TRzToolbar
          ToolbarControls = (
            Button1)
        end
      end
      inherited Panel4: TPanel
        inherited Panel5: TPanel
          Top = 371
          Height = 38
          object GroupBox1: TGroupBox
            Left = 0
            Top = 0
            Width = 377
            Height = 38
            Align = alLeft
            Caption = #21463#29702#26102#38388
            TabOrder = 0
            object Label13: TLabel
              Left = 191
              Top = 18
              Width = 13
              Height = 13
              Caption = #21040
            end
            object Label2: TLabel
              Left = 8
              Top = 18
              Width = 13
              Height = 13
              Caption = #20174
            end
            object dteEnd: TDateTimePicker
              Left = 206
              Top = 14
              Width = 100
              Height = 21
              Date = 41500.000000000000000000
              Format = 'yyyy-MM-dd '
              Time = 41500.000000000000000000
              TabOrder = 0
              OnChange = dteEndChange
            end
            object dteBegin: TDateTimePicker
              Left = 23
              Top = 14
              Width = 100
              Height = 21
              Date = 41500.580699502320000000
              Format = 'yyyy-MM-dd'
              Time = 41500.580699502320000000
              DateFormat = dfLong
              TabOrder = 1
              OnChange = dteBeginChange
            end
            object dteBeginTime: TDateTimePicker
              Left = 123
              Top = 14
              Width = 65
              Height = 21
              Date = 41500.333333333340000000
              Format = 'HH:mm'
              Time = 41500.333333333340000000
              DateMode = dmUpDown
              Kind = dtkTime
              TabOrder = 2
              OnChange = dteBeginChange
            end
            object dteEndTime: TDateTimePicker
              Left = 306
              Top = 14
              Width = 65
              Height = 21
              Date = 41500.333333333340000000
              Format = 'HH:mm'
              Time = 41500.333333333340000000
              DateMode = dmUpDown
              Kind = dtkTime
              TabOrder = 3
              OnChange = dteEndChange
            end
          end
          object GroupBox3: TGroupBox
            Left = 377
            Top = 0
            Width = 80
            Height = 38
            Align = alLeft
            Caption = #38388#38548#26102#38388
            TabOrder = 1
            object Label4: TLabel
              Left = 49
              Top = 16
              Width = 13
              Height = 13
              Caption = #22825
            end
            object Edit2: TEdit
              Left = 6
              Top = 14
              Width = 40
              Height = 21
              TabOrder = 0
              Text = '7'
              OnChange = Edit2Change
              OnKeyPress = Edit2KeyPress
            end
          end
          object Panel8: TPanel
            Left = 457
            Top = 0
            Width = 40
            Height = 38
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 2
            object BtFind: TSpeedButton
              Left = 10
              Top = 9
              Width = 27
              Height = 27
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
                00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FF0000CE0094FF0000CE000000FF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000CE0094FF0000
                FF0000CE000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FF0000CE0094FF0000FF0000CE000000FF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF0000000000000000000000000000000094FF0000FF0000CE0000
                00FF00FFFF00FFFF00FFFF00FFFF00FF848484000000CE9400CE9400CE940094
                63299463290000000000CE000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                ADB5ADFFCE29FFCE29FFCE29FFCE29CE9400CE9400946329000000FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FF848484FFFF94FFFF94FFFF94FFCE94FFCE29FF
                CE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484FFCE94
                FFFF94FFFF94FFFF94FFFF94FFFF94FFCE29FFCE29CE9400946329000000FF00
                FFFF00FFFF00FFFF00FF848484FFCE94FFFFCEFFFFCEFFFFCEFFFF94FFFF94FF
                FF94FFCE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FF848484FFCE94
                FFFFFFFFFFFFFFFFCEFFFFCEFFFF94FFFF94FFCE94FFCE29CE9400000000FF00
                FFFF00FFFF00FFFF00FF848484ADB5ADFFFFFFFFFFFFFFFFFFFFFFCEFFFFCEFF
                FF94FFFF94FFCE29CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                FFCE94FFFFFFFFFFFFFFFFFFFFFFCEFFFF94FFFF94FFCE29000000FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FF848484ADB5ADFFCE94FFFFFFFFFFFFFFFFCEFF
                FF94FFCE94CE9429000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                848484848484ADB5ADFFCE94FFCE94FFCE94848484848484FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848484848484848484
                8484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              OnClick = BtFindClick
            end
          end
        end
        inherited Panel6: TPanel
          Height = 371
        end
        inherited cxPageControl2: TcxPageControl
          Height = 371
          ClientRectBottom = 371
          inherited cxTabSheet0: TcxTabSheet
            inherited ToolBar2: TToolBar
              Height = 347
            end
            inherited DghMain: TDBGridEh
              Height = 347
              Columns = <
                item
                  EditButtons = <>
                  FieldName = #24037#20316#21333#21495
                  Footers = <>
                  Width = 80
                end
                item
                  EditButtons = <>
                  FieldName = #37096#38376#21517#31216
                  Footers = <>
                  Width = 100
                end
                item
                  EditButtons = <>
                  FieldName = #20219#21153
                  Footers = <>
                  Width = 150
                end
                item
                  EditButtons = <>
                  FieldName = #24037#20316#20219#21153#35828#26126
                  Footers = <>
                  Width = 200
                end
                item
                  EditButtons = <>
                  FieldName = #30003#35831#20154
                  Footers = <>
                  Width = 72
                end
                item
                  EditButtons = <>
                  FieldName = #29366#24577
                  Footers = <>
                  Width = 46
                end
                item
                  EditButtons = <>
                  FieldName = #36131#20219#20154
                  Footers = <>
                  Width = 74
                end
                item
                  EditButtons = <>
                  FieldName = #21463#29702#26102#38388
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #21463#29702#20154
                  Footers = <>
                  Width = 74
                end
                item
                  EditButtons = <>
                  FieldName = #23436#25104#26102#38388
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #38388#38548#22825#25968
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #39044#35745#32791#26102
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #23454#38469#32791#26102
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #25928#29575
                  Footers = <>
                  Width = 71
                end
                item
                  EditButtons = <>
                  FieldName = #39564#25910#26102#38388
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #39564#25910#20154
                  Footers = <>
                  Width = 78
                end
                item
                  EditButtons = <>
                  FieldName = #38599#21592
                  Footers = <>
                  Width = 294
                end
                item
                  EditButtons = <>
                  FieldName = #22791#27880
                  Footers = <>
                  Width = 204
                end>
            end
          end
          inherited cxTabSheet1: TcxTabSheet
            TabVisible = False
          end
        end
      end
    end
  end
  inherited dxBarManager: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockControlHeights = (
      0
      0
      61
      0)
    inherited dxBarManagerBar2: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'tblFind'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'tblExport'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'tblFirst'
        end
        item
          Visible = True
          ItemName = 'tblPrior'
        end
        item
          Visible = True
          ItemName = 'tblNext'
        end
        item
          Visible = True
          ItemName = 'tblLast'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'tblHelp'
        end
        item
          Visible = True
          ItemName = 'tblExit'
        end>
    end
    inherited tblAdd: TdxBarLargeButton
      ImageIndex = 3
    end
    inherited tblEdit: TdxBarLargeButton
      ImageIndex = 4
    end
    inherited tblReject: TdxBarLargeButton
      ImageIndex = 130
    end
    inherited tblCancelFilter: TdxBarLargeButton
      ImageIndex = 129
    end
    inherited tblFilter: TdxBarLargeButton
      ImageIndex = 128
    end
    inherited tblExpand: TdxBarLargeButton
      ImageIndex = 131
    end
  end
  inherited dtMain: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'select * from ('#13#10'select data0835.WorkOrder'#9'['#24037#20316#21333#21495'],'#13#10'data0830.Dep' +
      'tName '#9#9#9'['#37096#38376#21517#31216'],'#13#10'data0836.WorkName '#9#9#9'['#20219#21153'],'#13#10'data0835.WorkExpl'#9 +
      #9#9'['#24037#20316#20219#21153#35828#26126'],'#13#10'data0073.USER_FULL_NAME '#9'['#30003#35831#20154'],'#13#10'data0832.MainExecS' +
      'tat '#9#9'['#29366#24577'],'#13#10'd73_1.USER_FULL_NAME as '#9'['#36131#20219#20154'],'#13#10'data0835.AdmiTime'#9 +
      #9#9'['#21463#29702#26102#38388'],'#13#10'd73_2.USER_FULL_NAME as'#9#9'['#21463#29702#20154'],'#13#10'data0835.CompTime'#9#9#9 +
      '['#23436#25104#26102#38388'],'#13#10'DateDiff(day,data0835.AdmiTime'#9',data0835.CompTime)['#38388#38548#22825#25968 +
      '] ,'#13#10'data0835.ForeTime'#9#9#9'['#39044#35745#32791#26102'],'#13#10'data0835.ActuCons'#9#9#9'['#23454#38469#32791#26102'],'#13#10'c' +
      'ase  when data0835.ActuCons>0 then data0835.ForeTime/data0835.Ac' +
      'tuCons end ['#25928#29575'],'#13#10'data0835.AcceTime'#9#9#9'['#39564#25910#26102#38388'],'#13#10'd73_3.USER_FULL_N' +
      'AME as '#9'['#39564#25910#20154'],'#13#10#39#38599#21592#39'=convert(varchar(500),STUFF((SELECT '#39#65307#39' + da' +
      'ta0005.EMPLOYEE_NAME from data0837'#13#10'       join data0005 on data' +
      '0837.Empl_ptr=data0005.rkey'#13#10'       where data0837.Work_ptr=data' +
      '0835.rkey '#13#10'       FOR XML PATH('#39#39')), 1, 1, '#39#39')),'#13#10'data0835.Rema' +
      'rk'#9#9#9#9'['#22791#27880']'#13#10'from data0835 join data0830 on data0835.Dept_ptr=dat' +
      'a0830.rkey'#13#10'join data0836 on data0835.Work_ptr=data0836.rkey'#13#10'jo' +
      'in data0073 on data0835.Applican=data0073.rkey'#13#10'left join data00' +
      '73 d73_1 on data0835.RespPeop=d73_1.rkey '#13#10'join data0832 on data' +
      '0835.[Status]=data0832.rkey'#13#10'left join data0073 d73_2 on data083' +
      '5.AdmiPeop=d73_2.rkey '#13#10'left join data0073 d73_3 on data0835.Acc' +
      'ePeop=d73_3.rkey'#13#10'where (Data0835.AdmiTime>='#39'2013-06-08'#39' and Dat' +
      'a0835.AdmiTime<='#39'2013-09-17'#39')'#13'and DateDiff(day,data0835.AdmiTime' +
      #9',data0835.CompTime)>=7'#9' '#13#10') as t1'#13#10#13#13#10#13#10
  end
  inherited cdsMain: Tcds
    CommandText = 
      'select * from ('#13#10'select data0835.WorkOrder'#9'['#24037#20316#21333#21495'],'#13#10'data0830.Dep' +
      'tName '#9#9#9'['#37096#38376#21517#31216'],'#13#10'data0836.WorkName '#9#9#9'['#20219#21153'],'#13#10'data0835.WorkExpl'#9 +
      #9#9'['#24037#20316#20219#21153#35828#26126'],'#13#10'data0073.USER_FULL_NAME '#9'['#30003#35831#20154'],'#13#10'data0832.MainExecS' +
      'tat '#9#9'['#29366#24577'],'#13#10'd73_1.USER_FULL_NAME as '#9'['#36131#20219#20154'],'#13#10'data0835.AdmiTime'#9 +
      #9#9'['#21463#29702#26102#38388'],'#13#10'd73_2.USER_FULL_NAME as'#9#9'['#21463#29702#20154'],'#13#10'data0835.CompTime'#9#9#9 +
      '['#23436#25104#26102#38388'],'#13#10'DateDiff(day,data0835.AdmiTime'#9',data0835.CompTime)['#38388#38548#22825#25968 +
      '] ,'#13#10'data0835.ForeTime'#9#9#9'['#39044#35745#32791#26102'],'#13#10'data0835.ActuCons'#9#9#9'['#23454#38469#32791#26102'],'#13#10'c' +
      'ase  when data0835.ActuCons>0 then data0835.ForeTime/data0835.Ac' +
      'tuCons end ['#25928#29575'],'#13#10'data0835.AcceTime'#9#9#9'['#39564#25910#26102#38388'],'#13#10'd73_3.USER_FULL_N' +
      'AME as '#9'['#39564#25910#20154'],'#13#10'convert(varchar(500),STUFF((SELECT '#39#65307#39' + data000' +
      '5.EMPLOYEE_NAME from data0837'#13#10'join data0005 on data0837.Empl_pt' +
      'r=data0005.rkey'#13#10'where data0837.Work_ptr=data0835.rkey '#13#10'FOR XML' +
      ' PATH('#39#39')), 1, 1, '#39#39'))as['#38599#21592'],'#13#10'data0835.Remark'#9#9#9#9'['#22791#27880']'#13#10'from dat' +
      'a0835 join data0830 on data0835.Dept_ptr=data0830.rkey'#13#10'join dat' +
      'a0836 on data0835.Work_ptr=data0836.rkey'#13#10'join data0073 on data0' +
      '835.Applican=data0073.rkey'#13#10'left join data0073 d73_1 on data0835' +
      '.RespPeop=d73_1.rkey '#13#10'join data0832 on data0835.[Status]=data08' +
      '32.rkey'#13#10'left join data0073 d73_2 on data0835.AdmiPeop=d73_2.rke' +
      'y '#13#10'left join data0073 d73_3 on data0835.AccePeop=d73_3.rkey'#13#10'wh' +
      'ere (Data0835.AdmiTime>=:SD and Data0835.AdmiTime<:ED)'#13#10#13'and Dat' +
      'eDiff(day,data0835.AdmiTime'#9',data0835.CompTime)>=:IntervalDay'#13#10')' +
      ' as t1'
    Params = <
      item
        DataType = ftDateTime
        Name = 'SD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'ED'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IntervalDay'
        ParamType = ptUnknown
      end>
    F_SQLSelectFrom = 
      'select * from ('#13#10'select data0835.WorkOrder'#9'['#24037#20316#21333#21495'],'#13#10'data0830.Dep' +
      'tName '#9#9#9'['#37096#38376#21517#31216'],'#13#10'data0836.WorkName '#9#9#9'['#20219#21153'],'#13#10'data0835.WorkExpl'#9 +
      #9#9'['#24037#20316#20219#21153#35828#26126'],'#13#10'data0073.USER_FULL_NAME '#9'['#30003#35831#20154'],'#13#10'data0832.MainExecS' +
      'tat '#9#9'['#29366#24577'],'#13#10'd73_1.USER_FULL_NAME as '#9'['#36131#20219#20154'],'#13#10'data0835.AdmiTime'#9 +
      #9#9'['#21463#29702#26102#38388'],'#13#10'd73_2.USER_FULL_NAME as'#9#9'['#21463#29702#20154'],'#13#10'data0835.CompTime'#9#9#9 +
      '['#23436#25104#26102#38388'],'#13#10'DateDiff(day,data0835.AdmiTime'#9',data0835.CompTime)['#38388#38548#22825#25968 +
      '] ,'#13#10'data0835.ForeTime'#9#9#9'['#39044#35745#32791#26102'],'#13#10'data0835.ActuCons'#9#9#9'['#23454#38469#32791#26102'],'#13#10'c' +
      'ase  when data0835.ActuCons>0 then data0835.ForeTime/data0835.Ac' +
      'tuCons end ['#25928#29575'],'#13#10'data0835.AcceTime'#9#9#9'['#39564#25910#26102#38388'],'#13#10'd73_3.USER_FULL_N' +
      'AME as '#9'['#39564#25910#20154'],'#13#10'convert(varchar(500),STUFF((SELECT '#39#65307#39' + data000' +
      '5.EMPLOYEE_NAME from data0837'#13#10'join data0005 on data0837.Empl_pt' +
      'r=data0005.rkey'#13#10'where data0837.Work_ptr=data0835.rkey '#13#10'FOR XML' +
      ' PATH('#39#39')), 1, 1, '#39#39'))as['#38599#21592'],'#13#10'data0835.Remark'#9#9#9#9'['#22791#27880']'#13#10'from dat' +
      'a0835 join data0830 on data0835.Dept_ptr=data0830.rkey'#13#10'join dat' +
      'a0836 on data0835.Work_ptr=data0836.rkey'#13#10'join data0073 on data0' +
      '835.Applican=data0073.rkey'#13#10'left join data0073 d73_1 on data0835' +
      '.RespPeop=d73_1.rkey '#13#10'join data0832 on data0835.[Status]=data08' +
      '32.rkey'#13#10'left join data0073 d73_2 on data0835.AdmiPeop=d73_2.rke' +
      'y '#13#10'left join data0073 d73_3 on data0835.AccePeop=d73_3.rkey'#13#10'wh' +
      'ere (Data0835.AdmiTime>=:SD and Data0835.AdmiTime<:ED)'#13#10#13'and Dat' +
      'eDiff(day,data0835.AdmiTime'#9',data0835.CompTime)>=:IntervalDay'#13#10')' +
      ' as t1'
    object cdsMainCDSDesigner: TStringField
      FieldName = #24037#20316#21333#21495
      Size = 15
    end
    object cdsMainCDSDesigner2: TStringField
      FieldName = #37096#38376#21517#31216
      Size = 50
    end
    object cdsMainCDSDesigner3: TStringField
      FieldName = #20219#21153
      Size = 50
    end
    object cdsMainCDSDesigner4: TStringField
      FieldName = #24037#20316#20219#21153#35828#26126
      Size = 200
    end
    object cdsMainCDSDesigner5: TStringField
      FieldName = #30003#35831#20154
      Size = 30
    end
    object cdsMainCDSDesigner6: TStringField
      FieldName = #29366#24577
      Size = 10
    end
    object cdsMainCDSDesigner7: TStringField
      FieldName = #36131#20219#20154
      Size = 30
    end
    object cdsMainCDSDesigner8: TDateTimeField
      FieldName = #21463#29702#26102#38388
    end
    object cdsMainCDSDesigner9: TStringField
      FieldName = #21463#29702#20154
      Size = 30
    end
    object cdsMainCDSDesigner10: TDateTimeField
      FieldName = #23436#25104#26102#38388
    end
    object cdsMainCDSDesigner11: TIntegerField
      FieldName = #38388#38548#22825#25968
      ReadOnly = True
    end
    object cdsMainCDSDesigner12: TBCDField
      FieldName = #39044#35745#32791#26102
      Precision = 8
      Size = 2
    end
    object cdsMainCDSDesigner13: TBCDField
      FieldName = #23454#38469#32791#26102
      Precision = 8
      Size = 2
    end
    object cdsMainCDSDesigner14: TBCDField
      FieldName = #25928#29575
      ReadOnly = True
      Precision = 19
      Size = 11
    end
    object cdsMainCDSDesigner15: TDateTimeField
      FieldName = #39564#25910#26102#38388
    end
    object cdsMainCDSDesigner16: TStringField
      FieldName = #39564#25910#20154
      Size = 30
    end
    object cdsMainCDSDesigner17: TStringField
      FieldName = #38599#21592
      ReadOnly = True
      Size = 500
    end
    object cdsMainCDSDesigner18: TStringField
      FieldName = #22791#27880
      Size = 200
    end
  end
  inherited pp_Report1: TppReport
    DataPipelineName = 'pp_DBPipeline1'
    inherited ppDetailBand1: TppDetailBand
      inherited ppDBText1: TppDBText
        DataPipelineName = 'pp_DBPipeline1'
      end
      inherited ppDBText2: TppDBText
        DataPipelineName = 'pp_DBPipeline1'
      end
    end
  end
end
