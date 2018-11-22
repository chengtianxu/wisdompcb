inherited frmPlanMain04: TfrmPlanMain04
  Left = 378
  Top = 260
  Caption = #25968#25454#20998#26512
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 12
  inherited cxTabControl1: TcxTabControl
    inherited Panel3: TPanel
      inherited Panel2: TPanel
        inherited RzToolbar1: TRzToolbar
          RowHeight = 26
          ToolbarControls = (
            Button1)
          inherited Button1: TButton
            Top = 3
          end
        end
      end
      inherited Panel4: TPanel
        inherited Panel5: TPanel
          Top = 399
          Height = 35
          object BtFind: TSpeedButton
            Left = 491
            Top = 7
            Width = 25
            Height = 25
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
          object GroupBox1: TGroupBox
            Left = 0
            Top = 0
            Width = 348
            Height = 35
            Align = alLeft
            Caption = #35745#21010#20445#20859#26102#38388#25110#23454#38469#23436#25104#26102#38388
            TabOrder = 0
            object Label13: TLabel
              Left = 176
              Top = 17
              Width = 12
              Height = 12
              Caption = #21040
            end
            object Label2: TLabel
              Left = 7
              Top = 17
              Width = 12
              Height = 12
              Caption = #20174
            end
            object dteEnd: TDateTimePicker
              Left = 190
              Top = 13
              Width = 92
              Height = 21
              Date = 41500.000000000000000000
              Format = 'yyyy-MM-dd '
              Time = 41500.000000000000000000
              TabOrder = 0
              OnChange = dteEndChange
            end
            object dteBegin: TDateTimePicker
              Left = 21
              Top = 13
              Width = 93
              Height = 21
              Date = 41500.580699502320000000
              Format = 'yyyy-MM-dd'
              Time = 41500.580699502320000000
              DateFormat = dfLong
              TabOrder = 1
              OnChange = dteBeginChange
            end
            object dteBeginTime: TDateTimePicker
              Left = 114
              Top = 13
              Width = 60
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
              Left = 282
              Top = 13
              Width = 60
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
          object GroupBox2: TGroupBox
            Left = 348
            Top = 0
            Width = 140
            Height = 35
            Align = alLeft
            Caption = #36798#25104#29575
            TabOrder = 1
            object Label1: TLabel
              Left = 126
              Top = 16
              Width = 6
              Height = 12
              Caption = '%'
            end
            object Edit1: TEdit
              Left = 86
              Top = 13
              Width = 40
              Height = 20
              TabOrder = 0
              OnChange = Edit1Change
              OnKeyPress = Edit1KeyPress
            end
            object ComboBox1: TComboBox
              Left = 4
              Top = 13
              Width = 83
              Height = 20
              Style = csDropDownList
              ItemHeight = 12
              ItemIndex = 3
              TabOrder = 1
              Text = #23567#20110#25110#31561#20110
              OnChange = Edit1Change
              Items.Strings = (
                #22823#20110
                #22823#20110#25110#31561#20110
                #23567#20110
                #23567#20110#25110#31561#20110)
            end
          end
        end
        inherited Panel6: TPanel
          Height = 399
        end
        inherited cxPageControl2: TcxPageControl
          Height = 399
          ClientRectBottom = 399
          inherited cxTabSheet0: TcxTabSheet
            inherited ToolBar2: TToolBar
              Height = 376
            end
            inherited DghMain: TDBGridEh
              Height = 376
              FooterFont.Color = clBlue
              FooterRowCount = 1
              ParentFont = False
              Columns = <
                item
                  EditButtons = <>
                  FieldName = #35745#21010#20445#20859#26102#38388
                  Footers = <>
                  Width = 96
                end
                item
                  EditButtons = <>
                  FieldName = #24037#21378
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #37096#38376
                  Footers = <>
                  Width = 92
                end
                item
                  EditButtons = <>
                  FieldName = #35774#22791#21517#31216
                  Footers = <>
                  Width = 190
                end
                item
                  EditButtons = <>
                  FieldName = #35774#22791#32534#21495
                  Footers = <>
                  Width = 131
                end
                item
                  EditButtons = <>
                  FieldName = #29366#24577
                  Footers = <>
                  Width = 53
                end
                item
                  EditButtons = <>
                  FieldName = #35774#22791#31561#32423
                  Footers = <>
                  Width = 105
                end
                item
                  EditButtons = <>
                  FieldName = #20855#20307#20301#32622
                  Footers = <>
                  Width = 92
                end
                item
                  EditButtons = <>
                  FieldName = #20445#20859#31867#22411
                  Footers = <>
                  Width = 56
                end
                item
                  EditButtons = <>
                  FieldName = #20445#20859#21608#26399
                  Footers = <>
                  Width = 57
                end
                item
                  EditButtons = <>
                  FieldName = #24320#22987#20445#20859#26102#38388
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #23454#38469#23436#25104#26102#38388
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #20445#20859#28040#32791#26102#38388
                  Footer.ValueType = fvtStaticText
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #26631#20934#28040#32791#26102#38388
                  Footer.ValueType = fvtStaticText
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #36798#25104#29575
                  Footer.ValueType = fvtStaticText
                  Footers = <>
                  Width = 83
                end
                item
                  EditButtons = <>
                  FieldName = #20445#20859#20154
                  Footers = <>
                  Width = 86
                end
                item
                  EditButtons = <>
                  FieldName = #39564#25910#20154
                  Footers = <>
                  Width = 98
                end
                item
                  EditButtons = <>
                  FieldName = #36131#20219#23567#32452
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #38599#21592
                  Footers = <>
                  Width = 83
                end
                item
                  EditButtons = <>
                  FieldName = #24037#20316#26085#26399
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #24320#22987#26102#38388
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #32467#26463#26102#38388
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #20013#36884#20241#24687#26102#38388
                  Footers = <>
                  Width = 76
                end
                item
                  EditButtons = <>
                  FieldName = #38599#21592#24037#20316#26102#38388
                  Footers = <>
                  Width = 86
                end
                item
                  EditButtons = <>
                  FieldName = #20445#20859#35760#24405#25551#36848
                  Footers = <>
                  Width = 300
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
      39
      0)
    inherited dxBarManagerBar2: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'tblRefresh'
        end
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
      'select *from '#13#10'(select d31.PlanMainDate'#9#35745#21010#20445#20859#26102#38388',d15.ABBR_NAME '#24037#21378',' +
      'd34.DEPT_NAME '#37096#38376','#13#10'd17.FASSET_NAME '#35774#22791#21517#31216',d31.DeviNumb'#9#35774#22791#32534#21495',d32.Ma' +
      'inExecStat '#29366#24577','#13#10'd17.equipment_grade'#9#35774#22791#31561#32423',d17.LOCATION '#20855#20307#20301#32622','#13#10'd31' +
      '.DeviType'#9#20445#20859#31867#22411',d31.MainCycl'#9#20445#20859#21608#26399','#13#10'd31.StarMainTime'#9#24320#22987#20445#20859#26102#38388','#13#10'd31' +
      '.ActuCompTime'#9#23454#38469#23436#25104#26102#38388',d31.MainImpl'#9#20445#20859#20154','#13#10'd31.TimeCons'#9#20445#20859#28040#32791#26102#38388','#13#10'd3' +
      '1.StdTimeCons'#9#26631#20934#28040#32791#26102#38388','#13#10'TimeCons/StdTimeCons '#36798#25104#29575','#13#10'd73.User_Full_' +
      'Name '#39564#25910#20154','#13#10'd40.Location as ['#36131#20219#23567#32452'],'#13#10'd05.EMPLOYEE_NAME '#38599#21592',d48.Wor' +
      'kDate '#24037#20316#26085#26399','#13#10'd48.BeginTime '#24320#22987#26102#38388',d48.EndTime '#32467#26463#26102#38388','#13#10'd48.TimeRest ' +
      #20013#36884#20241#24687#26102#38388',d48.WorkTime '#38599#21592#24037#20316#26102#38388','#13#10'd31.Remarks'#9#20445#20859#35760#24405#25551#36848#13#10'from data0831 d' +
      '31'#13#10'join data0417 d17 on d31.DeviNumb=d17.FASSET_CODE'#13#10'join data' +
      '0034 d34 on d17.DEPT_PTR=d34.rkey'#13#10'join data0015 d15 on d17.ware' +
      'house_ptr=d15.rkey'#13#10'join data0832 d32 on d31.RKEY832=d32.rkey'#13#10'l' +
      'eft join data0073 d73 on d31.MainAcce_UserPtr=d73.rkey'#13#10'join Dat' +
      'a0848 d48 on d31.rkey=d48.Work_ptr'#13'join data0005  d05 on d48.[Em' +
      'pl_ptr]=d05.rkey'#13'left join data0840 d40 on d17.D840_ptr=d40.rkey' +
      #13')as t1'#13#10'where 1=2'
  end
  inherited cdsMain: Tcds
    CommandText = 
      'select *from '#13#10'(select d31.PlanMainDate  ['#35745#21010#20445#20859#26102#38388'],'#13#10'd15.ABBR_NAM' +
      'E                ['#24037#21378'],'#13#10'd34.DEPT_NAME                ['#37096#38376'],'#13#10'd17.' +
      'FASSET_NAME            ['#35774#22791#21517#31216'],'#13#10'd31.DeviNumb'#9'           ['#35774#22791#32534#21495'],'#13 +
      #10'd32.MainExecStat              ['#29366#24577'],'#13#10'd17.equipment_grade       ' +
      '['#35774#22791#31561#32423'],'#13#10'd17.LOCATION                 ['#20855#20307#20301#32622'],'#13#10'd31.DeviType'#9'    ' +
      '      ['#20445#20859#31867#22411'],'#13#10'd31.MainCycl'#9'          ['#20445#20859#21608#26399'],'#13#10'd31.StarMainTime ' +
      '            ['#24320#22987#20445#20859#26102#38388'],'#13#10'd31.ActuCompTime'#9'          ['#23454#38469#23436#25104#26102#38388'],'#13#10'd31' +
      '.MainImpl'#9'          ['#20445#20859#20154'],'#13#10'd31.TimeCons'#9'          ['#20445#20859#28040#32791#26102#38388'],'#13#10'd3' +
      '1.StdTimeCons'#9'          ['#26631#20934#28040#32791#26102#38388'],'#13#10'TimeCons/StdTimeCons    ['#36798#25104#29575']' +
      ','#13#10'd73.User_Full_Name        ['#39564#25910#20154'],'#13#10'd40.Location as            ' +
      '   ['#36131#20219#23567#32452'],'#13#10'd05.EMPLOYEE_NAME     ['#38599#21592'],'#13#10'd48.WorkDate           ' +
      '      ['#24037#20316#26085#26399'],'#13#10'd48.BeginTime                 ['#24320#22987#26102#38388'],'#13#10'd48.EndTim' +
      'e                   ['#32467#26463#26102#38388'],'#13#10'd48.TimeRest                  ['#20013#36884#20241#24687 +
      #26102#38388'],'#13#10'd48.WorkTime                 ['#38599#21592#24037#20316#26102#38388'],'#13#10'd31.Remarks'#9'      ' +
      '  ['#20445#20859#35760#24405#25551#36848']'#13#10'from data0831 d31'#13#10'join data0417 d17 on d31.DeviNumb' +
      '=d17.FASSET_CODE'#13#10'join data0034 d34 on d17.DEPT_PTR=d34.rkey'#13#10'jo' +
      'in data0015 d15 on d17.warehouse_ptr=d15.rkey'#13#10'join data0832 d32' +
      ' on d31.RKEY832=d32.rkey'#13#10'left join data0073 d73 on d31.MainAcce' +
      '_UserPtr=d73.rkey'#13#10'left join Data0848 d48 on d31.rkey=d48.Work_p' +
      'tr'#13#10'left join data0005  d05 on d48.[Empl_ptr]=d05.rkey'#13#10'left joi' +
      'n data0840 d40 on d17.D840_ptr=d40.rkey'#13#10')as t1'#13#10'where 1=2'
    ReadOnly = True
    AfterOpen = cdsMainAfterOpen
    F_SQLSelectFrom = 
      'select *from '#13#10'(select d31.PlanMainDate  ['#35745#21010#20445#20859#26102#38388'],'#13#10'd15.ABBR_NAM' +
      'E                ['#24037#21378'],'#13#10'd34.DEPT_NAME                ['#37096#38376'],'#13#10'd17.' +
      'FASSET_NAME            ['#35774#22791#21517#31216'],'#13#10'd31.DeviNumb'#9'           ['#35774#22791#32534#21495'],'#13 +
      #10'd32.MainExecStat              ['#29366#24577'],'#13#10'd17.equipment_grade       ' +
      '['#35774#22791#31561#32423'],'#13#10'd17.LOCATION                 ['#20855#20307#20301#32622'],'#13#10'd31.DeviType'#9'    ' +
      '      ['#20445#20859#31867#22411'],'#13#10'd31.MainCycl'#9'          ['#20445#20859#21608#26399'],'#13#10'd31.StarMainTime ' +
      '            ['#24320#22987#20445#20859#26102#38388'],'#13#10'd31.ActuCompTime'#9'          ['#23454#38469#23436#25104#26102#38388'],'#13#10'd31' +
      '.MainImpl'#9'          ['#20445#20859#20154'],'#13#10'd31.TimeCons'#9'          ['#20445#20859#28040#32791#26102#38388'],'#13#10'd3' +
      '1.StdTimeCons'#9'          ['#26631#20934#28040#32791#26102#38388'],'#13#10'TimeCons/StdTimeCons    ['#36798#25104#29575']' +
      ','#13#10'd73.User_Full_Name        ['#39564#25910#20154'],'#13#10'd40.Location as            ' +
      '   ['#36131#20219#23567#32452'],'#13#10'd05.EMPLOYEE_NAME     ['#38599#21592'],'#13#10'd48.WorkDate           ' +
      '      ['#24037#20316#26085#26399'],'#13#10'd48.BeginTime                 ['#24320#22987#26102#38388'],'#13#10'd48.EndTim' +
      'e                   ['#32467#26463#26102#38388'],'#13#10'd48.TimeRest                  ['#20013#36884#20241#24687 +
      #26102#38388'],'#13#10'd48.WorkTime                 ['#38599#21592#24037#20316#26102#38388'],'#13#10'd31.Remarks'#9'      ' +
      '  ['#20445#20859#35760#24405#25551#36848']'#13#10'from data0831 d31'#13#10'join data0417 d17 on d31.DeviNumb' +
      '=d17.FASSET_CODE'#13#10'join data0034 d34 on d17.DEPT_PTR=d34.rkey'#13#10'jo' +
      'in data0015 d15 on d17.warehouse_ptr=d15.rkey'#13#10'join data0832 d32' +
      ' on d31.RKEY832=d32.rkey'#13#10'left join data0073 d73 on d31.MainAcce' +
      '_UserPtr=d73.rkey'#13#10'left join Data0848 d48 on d31.rkey=d48.Work_p' +
      'tr'#13#10'left join data0005  d05 on d48.[Empl_ptr]=d05.rkey'#13#10'left joi' +
      'n data0840 d40 on d17.D840_ptr=d40.rkey'#13#10')as t1'
    F_SQLOrderBy = 'order by '#35745#21010#20445#20859#26102#38388','#35774#22791#32534#21495','#20445#20859#21608#26399
    object cdsMainCDSDesigner: TDateTimeField
      FieldName = #35745#21010#20445#20859#26102#38388
    end
    object cdsMainCDSDesigner2: TStringField
      FieldName = #35774#22791#32534#21495
    end
    object cdsMainCDSDesigner3: TStringField
      FieldName = #35774#22791#21517#31216
      Size = 30
    end
    object cdsMainCDSDesigner4: TStringField
      FieldName = #37096#38376
      Size = 30
    end
    object cdsMainCDSDesigner5: TStringField
      FieldName = #24037#21378
      Size = 10
    end
    object cdsMainCDSDesigner6: TStringField
      FieldName = #35774#22791#31561#32423
      Size = 50
    end
    object cdsMainCDSDesigner7: TStringField
      FieldName = #20855#20307#20301#32622
      Size = 40
    end
    object cdsMainCDSDesigner8: TStringField
      FieldName = #20445#20859#31867#22411
      Size = 10
    end
    object cdsMainCDSDesigner9: TStringField
      FieldName = #20445#20859#21608#26399
      Size = 10
    end
    object cdsMainCDSDesigner10: TStringField
      FieldName = #29366#24577
      Size = 10
    end
    object cdsMainCDSDesigner11: TDateTimeField
      FieldName = #24320#22987#20445#20859#26102#38388
    end
    object cdsMainCDSDesigner12: TDateTimeField
      FieldName = #23454#38469#23436#25104#26102#38388
    end
    object cdsMainCDSDesigner14: TBCDField
      FieldName = #20445#20859#28040#32791#26102#38388
      Precision = 10
      Size = 2
    end
    object cdsMainCDSDesigner16: TBCDField
      FieldName = #26631#20934#28040#32791#26102#38388
      Precision = 9
      Size = 2
    end
    object cdsMainCDSDesigner24: TBCDField
      FieldName = #36798#25104#29575
      ReadOnly = True
      OnGetText = cdsMainCDSDesigner24GetText
      Precision = 22
      Size = 12
    end
    object cdsMainCDSDesigner13: TWideStringField
      FieldName = #20445#20859#20154
    end
    object cdsMainCDSDesigner15: TStringField
      FieldName = #39564#25910#20154
      Size = 30
    end
    object cdsMainCDSDesigner25: TStringField
      FieldName = #36131#20219#23567#32452
    end
    object cdsMainCDSDesigner17: TStringField
      FieldName = #38599#21592
      Size = 16
    end
    object cdsMainCDSDesigner18: TDateTimeField
      FieldName = #24037#20316#26085#26399
    end
    object cdsMainCDSDesigner19: TDateTimeField
      FieldName = #24320#22987#26102#38388
    end
    object cdsMainCDSDesigner20: TDateTimeField
      FieldName = #32467#26463#26102#38388
    end
    object cdsMainCDSDesigner21: TBCDField
      FieldName = #20013#36884#20241#24687#26102#38388
      Precision = 8
      Size = 2
    end
    object cdsMainCDSDesigner22: TBCDField
      FieldName = #38599#21592#24037#20316#26102#38388
      Precision = 5
      Size = 2
    end
    object cdsMainCDSDesigner23: TStringField
      FieldName = #20445#20859#35760#24405#25551#36848
      Size = 500
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
