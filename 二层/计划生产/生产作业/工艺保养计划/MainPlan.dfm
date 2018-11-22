inherited MainPlan_f: TMainPlan_f
  Left = 342
  Top = 222
  Width = 803
  Height = 548
  Caption = 'MainPlan_f'
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 12
  inherited dxStatusBar1: TdxStatusBar
    Top = 492
    Width = 795
  end
  inherited cxTabControl1: TcxTabControl
    Width = 795
    Height = 453
    ClientRectBottom = 453
    ClientRectRight = 795
    inherited Panel3: TPanel
      Width = 795
      Height = 448
      inherited Panel2: TPanel
        Left = 675
        Height = 444
        inherited RzToolbar1: TRzToolbar
          Height = 444
          ToolbarControls = (
            Button1
            Button2
            Button4
            Button5
            Button9
            Button3
            Button6
            Button7
            Button8)
          object Button2: TButton
            Left = 4
            Top = 32
            Width = 111
            Height = 25
            Caption = #28155#21152#20445#20859#35745#21010
            TabOrder = 1
            OnClick = Button2Click
          end
          object Button4: TButton
            Left = 4
            Top = 60
            Width = 111
            Height = 25
            Caption = #28155#21152#26376#35745#21010
            TabOrder = 2
            OnClick = Button4Click
          end
          object Button5: TButton
            Left = 4
            Top = 88
            Width = 111
            Height = 25
            Caption = #36890#30693#20445#20859
            TabOrder = 3
            Visible = False
            OnClick = Button5Click
          end
          object Button9: TButton
            Left = 4
            Top = 117
            Width = 111
            Height = 23
            Caption = #24320#22987#20445#20859
            TabOrder = 4
            Visible = False
            OnClick = Button9Click
          end
          object Button3: TButton
            Left = 4
            Top = 144
            Width = 111
            Height = 25
            Caption = #25552#20132#39564#25910
            TabOrder = 5
            Visible = False
            OnClick = Button3Click
          end
          object Button6: TButton
            Left = 4
            Top = 172
            Width = 111
            Height = 25
            Caption = #30830#35748#39564#25910
            TabOrder = 6
            Visible = False
          end
          object Button7: TButton
            Left = 4
            Top = 200
            Width = 111
            Height = 25
            Caption = #26356#25913#20445#20859#20154
            TabOrder = 7
            Visible = False
          end
          object Button8: TButton
            Left = 4
            Top = 228
            Width = 110
            Height = 25
            Caption = #25805#20316#30028#38754
            TabOrder = 8
            OnClick = Button8Click
          end
        end
      end
      inherited Panel4: TPanel
        Width = 675
        Height = 444
        inherited Panel5: TPanel
          Top = 409
          Width = 675
          Height = 35
          object GroupBox2: TGroupBox
            Left = 0
            Top = 0
            Width = 260
            Height = 35
            Align = alLeft
            Caption = #24320#22987#26102#38388
            TabOrder = 0
            object Label17: TLabel
              Left = 7
              Top = 15
              Width = 12
              Height = 12
              Caption = #20174
            end
            object Label18: TLabel
              Left = 120
              Top = 15
              Width = 12
              Height = 12
              Caption = #21040
            end
            object bt_Find: TSpeedButton
              Left = 232
              Top = 8
              Width = 24
              Height = 23
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
              OnClick = bt_FindClick
            end
            object DateTimePicker1: TDateTimePicker
              Left = 24
              Top = 10
              Width = 90
              Height = 21
              Date = 41778.693501689810000000
              Time = 41778.693501689810000000
              TabOrder = 0
            end
            object DateTimePicker2: TDateTimePicker
              Left = 138
              Top = 10
              Width = 90
              Height = 21
              Date = 41778.693501689810000000
              Time = 41778.693501689810000000
              TabOrder = 1
            end
          end
          object GroupBox3: TGroupBox
            Left = 609
            Top = 0
            Width = 193
            Height = 35
            Align = alLeft
            Caption = #36807#28388
            TabOrder = 1
            object Filter_Label: TLabel
              Left = 10
              Top = 14
              Width = 48
              Height = 12
              Caption = #23457#25209#31867#22411
            end
            object Filter_Edit: TEdit
              Left = 64
              Top = 10
              Width = 121
              Height = 20
              TabOrder = 0
              Text = 'Filter_Edit'
              OnChange = Filter_EditChange
            end
          end
          object GroupBox1: TGroupBox
            Left = 260
            Top = 0
            Width = 349
            Height = 35
            Align = alLeft
            Caption = #31579#36873#29366#24577
            TabOrder = 2
            object CheckBox1: TCheckBox
              Left = 6
              Top = 12
              Width = 52
              Height = 16
              Caption = #24453#25191#34892
              Checked = True
              State = cbChecked
              TabOrder = 0
              OnClick = CheckBox1Click
            end
            object CheckBox2: TCheckBox
              Left = 119
              Top = 12
              Width = 53
              Height = 16
              Caption = #25191#34892#20013
              Checked = True
              State = cbChecked
              TabOrder = 1
              OnClick = CheckBox1Click
            end
            object CheckBox3: TCheckBox
              Left = 233
              Top = 12
              Width = 52
              Height = 16
              Caption = #24453#39564#25910
              Checked = True
              State = cbChecked
              TabOrder = 2
              OnClick = CheckBox1Click
            end
            object CheckBox4: TCheckBox
              Left = 286
              Top = 12
              Width = 53
              Height = 16
              Caption = #24050#39564#25910
              TabOrder = 3
              OnClick = CheckBox1Click
            end
            object CheckBox5: TCheckBox
              Left = 59
              Top = 12
              Width = 53
              Height = 16
              Caption = #24050#36890#30693
              Checked = True
              State = cbChecked
              TabOrder = 4
              OnClick = CheckBox1Click
            end
            object CheckBox6: TCheckBox
              Left = 176
              Top = 12
              Width = 52
              Height = 16
              Caption = #24050#26242#20572
              Checked = True
              State = cbChecked
              TabOrder = 5
              OnClick = CheckBox1Click
            end
          end
        end
        inherited Panel6: TPanel
          Height = 409
        end
        inherited cxPageControl2: TcxPageControl
          Width = 670
          Height = 409
          ClientRectBottom = 409
          ClientRectRight = 670
          inherited cxTabSheet0: TcxTabSheet
            inherited ToolBar2: TToolBar
              Height = 386
            end
            inherited DghMain: TDBGridEh
              Width = 670
              Height = 386
              RowSizingAllowed = True
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'FASSET_CODE'
                  Footers = <>
                  ReadOnly = True
                  Width = 85
                end
                item
                  EditButtons = <>
                  FieldName = 'FASSET_NAME'
                  Footers = <>
                  ReadOnly = True
                end
                item
                  EditButtons = <>
                  FieldName = 'LOCATION'
                  Footers = <>
                  ReadOnly = True
                  Visible = False
                  Width = 104
                end
                item
                  EditButtons = <>
                  FieldName = 'DEPT_CODE'
                  Footers = <>
                  ReadOnly = True
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'DEPT_NAME'
                  Footers = <>
                  ReadOnly = True
                  Width = 53
                end
                item
                  EditButtons = <>
                  FieldName = 'MainExecStat'
                  Footers = <>
                  ReadOnly = True
                  Width = 53
                end
                item
                  EditButtons = <>
                  FieldName = 'PlanMainDate'
                  Footers = <>
                  ReadOnly = True
                  Width = 94
                end
                item
                  EditButtons = <>
                  FieldName = 'BeginMainDate'
                  Footers = <>
                  Width = 94
                end
                item
                  EditButtons = <>
                  FieldName = 'EndMainDate'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'MainTime'
                  Footers = <>
                  Width = 74
                end
                item
                  EditButtons = <>
                  FieldName = 'MainCycl'
                  Footers = <>
                  ReadOnly = True
                  Width = 52
                end
                item
                  EditButtons = <>
                  FieldName = 'Item'
                  Footers = <>
                  ReadOnly = True
                  Width = 150
                end
                item
                  EditButtons = <>
                  FieldName = 'MainMeth'
                  Footers = <>
                  ReadOnly = True
                  Width = 250
                end
                item
                  EditButtons = <>
                  FieldName = 'ChecAcce'
                  Footers = <>
                  ReadOnly = True
                  Visible = False
                  Width = 250
                end
                item
                  EditButtons = <>
                  FieldName = 'MaintMan'
                  Footers = <>
                  Width = 87
                end
                item
                  EditButtons = <>
                  FieldName = 'AcceCode'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'Acceptan'
                  Footers = <>
                  ReadOnly = True
                  Visible = False
                  Width = 56
                end
                item
                  EditButtons = <>
                  FieldName = 'ttype'
                  Footers = <>
                  Visible = False
                  Width = 54
                end
                item
                  EditButtons = <>
                  FieldName = 'AcceEval'
                  Footers = <>
                  Visible = False
                  Width = 250
                end>
            end
          end
          inherited cxTabSheet1: TcxTabSheet
            object Label1: TLabel
              Left = 16
              Top = 11
              Width = 48
              Height = 12
              Caption = #35774#22791#20195#30721
            end
            object Label2: TLabel
              Left = 16
              Top = 51
              Width = 48
              Height = 12
              Caption = #35774#22791#21517#31216
            end
            object Label3: TLabel
              Left = 16
              Top = 112
              Width = 24
              Height = 12
              Caption = #20301#32622
            end
            object Label4: TLabel
              Left = 18
              Top = 152
              Width = 48
              Height = 12
              Caption = #37096#38376#20195#30721
            end
            object Label5: TLabel
              Left = 16
              Top = 192
              Width = 48
              Height = 12
              Caption = #37096#38376#21517#31216
            end
            object Label6: TLabel
              Left = 16
              Top = 232
              Width = 48
              Height = 12
              Caption = #20445#20859#21608#26399
            end
            object Label7: TLabel
              Left = 18
              Top = 275
              Width = 72
              Height = 12
              Caption = #35745#21010#20445#20859#26085#26399
            end
            object Label8: TLabel
              Left = 231
              Top = 51
              Width = 72
              Height = 12
              Caption = #32467#26463#20445#20859#26102#38388
            end
            object Label9: TLabel
              Left = 231
              Top = 132
              Width = 48
              Height = 12
              Caption = #20445#20859#39033#30446
            end
            object Label10: TLabel
              Left = 231
              Top = 190
              Width = 48
              Height = 12
              Caption = #20445#20859#26041#27861
            end
            object Label11: TLabel
              Left = 231
              Top = 268
              Width = 48
              Height = 12
              Caption = #39564#25910#26631#20934
            end
            object Label12: TLabel
              Left = 477
              Top = 11
              Width = 24
              Height = 12
              Caption = #29366#24577
            end
            object Label13: TLabel
              Left = 477
              Top = 51
              Width = 36
              Height = 12
              Caption = #20445#20859#20154
            end
            object Label14: TLabel
              Left = 477
              Top = 133
              Width = 36
              Height = 12
              Caption = #39564#25910#20154
            end
            object Label15: TLabel
              Left = 477
              Top = 173
              Width = 48
              Height = 12
              Caption = #39564#25910#32467#26524
            end
            object Label16: TLabel
              Left = 480
              Top = 213
              Width = 48
              Height = 12
              Caption = #39564#25910#35780#20215
            end
            object Label19: TLabel
              Left = 231
              Top = 8
              Width = 72
              Height = 12
              Caption = #24320#22987#20445#20859#26102#38388
            end
            object Label20: TLabel
              Left = 477
              Top = 91
              Width = 60
              Height = 12
              Caption = #39564#25910#20154#20195#30721
            end
            object Label21: TLabel
              Left = 232
              Top = 92
              Width = 72
              Height = 12
              Caption = #20445#20859#28040#32791#26102#38388
            end
            object edt_FASSET_CODE: TDBEdit
              Left = 18
              Top = 27
              Width = 121
              Height = 20
              DataField = 'FASSET_CODE'
              DataSource = dsMain
              TabOrder = 0
            end
            object edt_LOCATION: TDBEdit
              Left = 18
              Top = 128
              Width = 121
              Height = 20
              DataField = 'LOCATION'
              DataSource = dsMain
              TabOrder = 1
            end
            object edt_DEPT_CODE: TDBEdit
              Left = 18
              Top = 168
              Width = 121
              Height = 20
              DataField = 'DEPT_CODE'
              DataSource = dsMain
              TabOrder = 2
            end
            object edt_DEPT_NAME: TDBEdit
              Left = 18
              Top = 208
              Width = 121
              Height = 20
              DataField = 'DEPT_NAME'
              DataSource = dsMain
              TabOrder = 3
            end
            object edt_MainCycl: TDBEdit
              Left = 18
              Top = 248
              Width = 121
              Height = 20
              DataField = 'MainCycl'
              DataSource = dsMain
              TabOrder = 4
            end
            object edt_Status: TDBEdit
              Left = 478
              Top = 27
              Width = 121
              Height = 20
              DataField = 'MainExecStat'
              DataSource = dsMain
              Font.Charset = GB2312_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
            object edt_MaintMan: TDBEdit
              Left = 478
              Top = 67
              Width = 121
              Height = 20
              DataField = 'MaintMan'
              DataSource = dsMain
              TabOrder = 6
            end
            object edt_Acceptan: TDBEdit
              Left = 478
              Top = 148
              Width = 121
              Height = 20
              DataField = 'Acceptan'
              DataSource = dsMain
              TabOrder = 7
            end
            object edt_MainMeth: TDBMemo
              Left = 232
              Top = 206
              Width = 200
              Height = 57
              DataField = 'MainMeth'
              DataSource = dsMain
              TabOrder = 8
            end
            object dtedt_PlanMainDate: TDBDateTimeEditEh
              Left = 19
              Top = 291
              Width = 120
              Height = 20
              DataField = 'PlanMainDate'
              DataSource = dsMain
              EditButtons = <>
              Kind = dtkDateEh
              TabOrder = 9
              Visible = True
            end
            object dtedt_EndMainDate: TDBDateTimeEditEh
              Left = 232
              Top = 67
              Width = 118
              Height = 20
              DataField = 'EndMainDate'
              DataSource = dsMain
              EditButtons = <>
              Kind = dtkDateTimeEh
              TabOrder = 10
              Visible = True
            end
            object edt_ChecAcce: TDBMemo
              Left = 232
              Top = 284
              Width = 200
              Height = 57
              DataField = 'ChecAcce'
              DataSource = dsMain
              TabOrder = 11
            end
            object edt_Item: TDBMemo
              Left = 232
              Top = 146
              Width = 200
              Height = 38
              DataField = 'Item'
              DataSource = dsMain
              TabOrder = 12
            end
            object edt_AcceEval: TDBMemo
              Left = 478
              Top = 228
              Width = 200
              Height = 57
              DataField = 'AcceEval'
              DataSource = dsMain
              TabOrder = 13
            end
            object edt_ttype: TDBComboBox
              Left = 479
              Top = 188
              Width = 121
              Height = 20
              DataField = 'ttype'
              DataSource = dsMain
              ItemHeight = 12
              Items.Strings = (
                #20248
                #33391
                #19968#33324
                #24046)
              TabOrder = 14
            end
            object edt_FASSET_NAME: TDBMemo
              Left = 17
              Top = 66
              Width = 170
              Height = 38
              DataField = 'FASSET_NAME'
              DataSource = dsMain
              TabOrder = 15
            end
            object dtedt_BeginMainDate: TDBDateTimeEditEh
              Left = 232
              Top = 24
              Width = 118
              Height = 20
              DataField = 'BeginMainDate'
              DataSource = dsMain
              EditButtons = <>
              Kind = dtkDateTimeEh
              TabOrder = 16
              Visible = True
            end
            object edt_AcceCode: TDBButtonEdit
              Left = 478
              Top = 107
              Width = 121
              Height = 20
              Hint = #25353'F1'#24377#20986#19979#25289#21015#34920
              DataSource = dsMain
              DataField = 'AcceCode'
              ParentShowHint = False
              ReadOnlyColor = clInactiveCaptionText
              ShowHint = True
              TabOrder = 17
              F_DownFormWidth = 0
              F_DownListDataSet = cds005
              F_DownDataSetFilterField = 'AcceCode'
              F_ResultFieldName = 'AcceCode'
              F_GetFieldName = 'AcceCode'
              F_PressKey13AutoDrop = False
            end
            object edt_MainTime: TDBEdit
              Left = 232
              Top = 107
              Width = 121
              Height = 20
              DataField = 'MainTime'
              DataSource = dsMain
              TabOrder = 18
            end
          end
        end
      end
      inherited Panel7: TPanel
        Top = 444
        Width = 795
      end
    end
    inherited Panel1: TPanel
      Width = 795
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
          ItemName = 'tblAdd'
        end
        item
          Visible = True
          ItemName = 'tblEdit'
        end
        item
          Visible = True
          ItemName = 'tblSave'
        end
        item
          Visible = True
          ItemName = 'tblCancel'
        end
        item
          BeginGroup = True
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
      'select data0417.FASSET_CODE,data0417.FASSET_NAME,data0417.LOCATI' +
      'ON,data0034.DEPT_CODE,data0034.DEPT_NAME,'#13#10'data0804.MainCycl,dat' +
      'a0804.Item,data0804.MainMeth,data0804.ChecAcce,data0804.[D417_pt' +
      'r],'#13#10'data0832.MainExecStat,data0005.EMPLOYEE_NAME Acceptan ,data' +
      '0005.EMPL_CODE AcceCode,'#13#10'data0810.* '#13#10'from data0810'#13#10'join data0' +
      '804 on data0810.[D804_ptr]=data0804.rkey'#13#10'join data0417 on data0' +
      '804.D417_ptr=data0417.rkey'#13#10'join data0034 on data0417.DEPT_PTR=d' +
      'ata0034.rkey'#13#10'join data0832 on data0810.status=data0832.rkey'#13#10'le' +
      'ft join data0005 on data0810.Acceptan_ptr=data0005.rkey'
    object dtMainFASSET_CODE: TStringField
      FieldName = 'FASSET_CODE'
      ProviderFlags = []
    end
    object dtMainFASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      ProviderFlags = []
      Size = 30
    end
    object dtMainLOCATION: TStringField
      FieldName = 'LOCATION'
      ProviderFlags = []
      Size = 40
    end
    object dtMainDEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      ProviderFlags = []
      Size = 10
    end
    object dtMainDEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      ProviderFlags = []
      Size = 30
    end
    object dtMainMainCycl: TStringField
      FieldName = 'MainCycl'
      ProviderFlags = []
      Size = 10
    end
    object dtMainItem: TStringField
      FieldName = 'Item'
      ProviderFlags = []
      Size = 100
    end
    object dtMainMainMeth: TStringField
      FieldName = 'MainMeth'
      ProviderFlags = []
      Size = 400
    end
    object dtMainChecAcce: TStringField
      FieldName = 'ChecAcce'
      ProviderFlags = []
      Size = 400
    end
    object dtMainD417_ptr: TIntegerField
      FieldName = 'D417_ptr'
      ProviderFlags = []
    end
    object dtMainMainExecStat: TStringField
      FieldName = 'MainExecStat'
      ProviderFlags = []
      Size = 10
    end
    object dtMainAcceptan: TStringField
      FieldName = 'Acceptan'
      ProviderFlags = []
      Size = 16
    end
    object dtMainAcceCode: TStringField
      FieldName = 'AcceCode'
      ProviderFlags = []
      Size = 10
    end
    object dtMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object dtMainD804_ptr: TIntegerField
      FieldName = 'D804_ptr'
    end
    object dtMainPlanMainDate: TDateTimeField
      FieldName = 'PlanMainDate'
    end
    object dtMainbeginMainDate: TDateTimeField
      FieldName = 'beginMainDate'
    end
    object dtMainEndMainDate: TDateTimeField
      FieldName = 'EndMainDate'
    end
    object dtMainStatus: TWordField
      FieldName = 'Status'
    end
    object dtMainMaintMan: TWideStringField
      FieldName = 'MaintMan'
      Size = 100
    end
    object dtMainAcceptan_ptr: TIntegerField
      FieldName = 'Acceptan_ptr'
    end
    object dtMainttype: TWordField
      FieldName = 'ttype'
    end
    object dtMainAcceEval: TWideStringField
      FieldName = 'AcceEval'
      Size = 200
    end
    object dtMainRemark: TWideStringField
      FieldName = 'Remark'
      Size = 200
    end
  end
  inherited cdsMain: Tcds
    CommandText = 
      'select data0417.FASSET_CODE,data0417.FASSET_NAME,data0417.LOCATI' +
      'ON,data0034.DEPT_CODE,data0034.DEPT_NAME,'#13#10'data0804.MainCycl,dat' +
      'a0804.Item,data0804.MainMeth,data0804.ChecAcce,data0804.[D417_pt' +
      'r],'#13#10'data0832.MainExecStat,data0005.EMPLOYEE_NAME Acceptan ,data' +
      '0005.EMPL_CODE AcceCode,'#13#10'data0810.* '#13#10'from data0810'#13#10'join data0' +
      '804 on data0810.[D804_ptr]=data0804.rkey'#13#10'join data0417 on data0' +
      '804.D417_ptr=data0417.rkey'#13#10'join data0034 on data0417.DEPT_PTR=d' +
      'ata0034.rkey'#13#10'join data0832 on data0810.status=data0832.rkey'#13#10'le' +
      'ft join data0005 on data0810.Acceptan_ptr=data0005.rkey'
    OnCalcFields = cdsMainCalcFields
    OnFilterRecord = cdsMainFilterRecord
    F_TableName = 'data0810'
    F_SQLSelectFrom = 
      'select data0417.FASSET_CODE,data0417.FASSET_NAME,data0417.LOCATI' +
      'ON,data0034.DEPT_CODE,data0034.DEPT_NAME,'#13#10'data0804.MainCycl,dat' +
      'a0804.Item,data0804.MainMeth,data0804.ChecAcce,data0804.[D417_pt' +
      'r],'#13#10'data0832.MainExecStat,data0005.EMPLOYEE_NAME Acceptan ,data' +
      '0005.EMPL_CODE AcceCode,'#13#10'data0810.* '#13#10'from data0810'#13#10'join data0' +
      '804 on data0810.[D804_ptr]=data0804.rkey'#13#10'join data0417 on data0' +
      '804.D417_ptr=data0417.rkey'#13#10'join data0034 on data0417.DEPT_PTR=d' +
      'ata0034.rkey'#13#10'join data0832 on data0810.status=data0832.rkey'#13#10'le' +
      'ft join data0005 on data0810.Acceptan_ptr=data0005.rkey'
    F_SQLOrderBy = 
      'order by data0810.[PlanMainDate],data0804.[D417_ptr],data0804.nu' +
      'mber'
    object cdsMainFASSET_CODE: TStringField
      DisplayLabel = #35774#22791#20195#30721
      FieldName = 'FASSET_CODE'
      ProviderFlags = []
    end
    object cdsMainFASSET_NAME: TStringField
      DisplayLabel = #35774#22791#21517#31216
      FieldName = 'FASSET_NAME'
      ProviderFlags = []
      Size = 30
    end
    object cdsMainLOCATION: TStringField
      DisplayLabel = #20301#32622
      FieldName = 'LOCATION'
      ProviderFlags = []
      Size = 40
    end
    object cdsMainDEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'DEPT_CODE'
      ProviderFlags = []
      Size = 10
    end
    object cdsMainDEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      ProviderFlags = []
      Size = 30
    end
    object cdsMainMainCycl: TStringField
      DisplayLabel = #20445#20859#21608#26399
      FieldName = 'MainCycl'
      ProviderFlags = []
      Size = 10
    end
    object cdsMainPlanMainDate: TDateTimeField
      DisplayLabel = #35745#21010#20445#20859#26085#26399
      FieldName = 'PlanMainDate'
    end
    object cdsMainMainDate: TDateTimeField
      DisplayLabel = #24320#22987#20445#20859#26102#38388
      FieldName = 'BeginMainDate'
    end
    object cdsMainEndMainDate: TDateTimeField
      DisplayLabel = #32467#26463#20445#20859#26102#38388
      FieldName = 'EndMainDate'
    end
    object cdsMainStatus: TSmallintField
      DisplayLabel = #29366#24577
      FieldName = 'Status'
      OnChange = cdsMainStatusChange
      OnGetText = cdsMainStatusGetText
    end
    object cdsMainMaintMan: TWideStringField
      DisplayLabel = #20445#20859#20154
      FieldName = 'MaintMan'
      Size = 100
    end
    object cdsMainAcceCode: TStringField
      DisplayLabel = #39564#25910#20154#20195#30721
      FieldName = 'AcceCode'
      ProviderFlags = []
      OnChange = cdsMainAcceCodeChange
      Size = 10
    end
    object cdsMainAcceptan: TStringField
      DisplayLabel = #39564#25910#20154
      FieldName = 'Acceptan'
      ProviderFlags = []
      Size = 16
    end
    object cdsMainttype: TSmallintField
      DisplayLabel = #39564#25910#32467#26524
      FieldName = 'ttype'
      OnGetText = cdsMainttypeGetText
      OnSetText = cdsMainttypeSetText
    end
    object cdsMainD417_ptr: TIntegerField
      FieldName = 'D417_ptr'
      ProviderFlags = []
    end
    object cdsMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object cdsMainD804_ptr: TIntegerField
      FieldName = 'D804_ptr'
    end
    object cdsMainMainExecStat: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'MainExecStat'
      ProviderFlags = []
      Size = 10
    end
    object cdsMainAcceptan_ptr: TIntegerField
      FieldName = 'Acceptan_ptr'
    end
    object cdsMainRemark: TWideStringField
      FieldName = 'Remark'
      Size = 200
    end
    object cdsMainItem: TStringField
      DisplayLabel = #20445#20859#39033#30446
      FieldName = 'Item'
      ProviderFlags = []
      Size = 100
    end
    object cdsMainMainMeth: TStringField
      DisplayLabel = #20445#20859#26041#27861
      FieldName = 'MainMeth'
      ProviderFlags = []
      Size = 400
    end
    object cdsMainChecAcce: TStringField
      DisplayLabel = #39564#25910#26631#20934
      FieldName = 'ChecAcce'
      ProviderFlags = []
      Size = 400
    end
    object cdsMainAcceEval: TWideStringField
      DisplayLabel = #39564#25910#35780#20215
      FieldName = 'AcceEval'
      Size = 200
    end
    object cdsMainMainTime: TBCDField
      DisplayLabel = #20445#20859#28040#32791#26102#38388
      FieldKind = fkCalculated
      FieldName = 'MainTime'
      Calculated = True
    end
  end
  inherited dtRead: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'declare @TempTable Table (selected bit )'#13#10'insert into @TempTable' +
      ' values(0)'#13#10'select Cast(0 as Bit) selected ,'#13#10'case when ((PlanMa' +
      'inDate is null)/*or(PlanMainDate<getdate())*/)and(cycl_duration>' +
      '0)then CONVERT(VARCHAR(10),getdate(),120)'#13#10'     when ((PlanMainD' +
      'ate is null)/*or(PlanMainDate<getdate())*/)and(cycl_duration=0)t' +
      'hen CONVERT(VARCHAR(10),getdate(),120)+'#39' 8:00'#39#13#10'else PlanMainDat' +
      'e end PlanMainDate,data0804.*, '#13#10'data0005.EMPLOYEE_NAME Acceptan' +
      ' ,data0417.Acceptan_ptr,'#13#10'data0417.rkey d417_ptr,data0417.FASSET' +
      '_CODE,data0417.FASSET_NAME,'#13#10'data0417.LOCATION,data0034.DEPT_COD' +
      'E,data0034.DEPT_NAME'#13#10'from data0804'#13#10'join @TempTable t1 on 1=1'#13#10 +
      'join data0816 on data0804.MainCycl=data0816.MainCycl'#13#10'join data0' +
      '417 on data0804.D417_ptr=data0417.rkey'#13#10'join data0034 on data041' +
      '7.DEPT_PTR=data0034.rkey'#13#10'left join data0005 on data0417.Accepta' +
      'n_ptr=data0005.rkey'#13#10'left join ('#13#10'select top 100 percent '#13#10'case ' +
      'when (InteTime is null)and(cycl_duration>0) then MainDate+cycl_d' +
      'uration'#13#10'     else  DateAdd(hh,InteTime,MainDate) end PlanMainDa' +
      'te,'#13#10'D804_ptr--,MainDate,MainDate+cycl_duration PlanMainDate '#13#10'f' +
      'rom '#13#10'data0804'#13#10'join data0816 on data0804.MainCycl=data0816.Main' +
      'Cycl-- and data0816.cycl_duration>0'#13#10'join (select top 100 percen' +
      't D804_ptr,max(PlanMainDate)MainDate from data0810'#13#10'group by D80' +
      '4_ptr order by D804_ptr)as t1 on t1.d804_ptr=data0804.rkey'#13#10'orde' +
      'r by D804_ptr)as t2 on t2.d804_ptr=data0804.rkey'
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
  inherited dlgOpen1: TOpenDialog
    Left = 108
    Top = 85
  end
  inherited PopupMenu1: TPopupMenu
    Left = 373
    Top = 96
  end
  object cds832: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from data0832 order by rkey'
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 536
    Top = 240
    object cds832RKEY: TIntegerField
      FieldName = 'RKEY'
      Visible = False
    end
    object cds832MainExecStat: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'MainExecStat'
      Size = 10
    end
  end
  object cds0034: TClientDataSet
    Aggregates = <>
    CommandText = 'select data0034.DEPT_CODE,data0034.DEPT_NAME  from data0034'
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 536
    Top = 320
    object cds0034DEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object cds0034DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      DisplayWidth = 20
      FieldName = 'DEPT_NAME'
      Size = 30
    end
  end
  object cdsAddMonthPlan: TClientDataSet
    Aggregates = <>
    CommandText = 
      '/*'#29983#25104#29616#20445#20859#35745#21010#65292#28982#21518#25554#20837#21040#20020#26102#34920'2'#65292#28982#21518#26681#25454#20020#26102#34920'2'#30340#35760#24405#29983#20135#19979#19968#27425#30340#20445#20859#35745#21010#65292#13#10#20889#20837#21040#20020#26102#34920'3'#20013#65292#28982#21518#23558#20020#26102#34920'2'#20013#30340#35760#24405 +
      #36716#21040'Data0810'#20445#20859#35745#21010#34920#20013','#20020#26102#34920'3'#30340#35760#24405#36716#31227#21040#20020#26102#34920'2;'#13#10#22914#26524#20020#26102#34920'2'#30340#35760#24405#19981#20026#31354#65292#24490#29615'*/'#13#10'declare @Ad' +
      'dMonth int '#13#10'set @AddMonth=:AddMonth'#13#10'declare @table1 table( '#13#10'[' +
      'D804_ptr] int               null,'#13#10'[PlanMainDate] smalldatetime ' +
      'null,'#13#10'[Status]   tinyint           null,'#13#10'[MaintMan] Nvarchar(1' +
      '00)     null,'#13#10'[Acceptan] nvarchar(20)      null)'#13#10'declare @tabl' +
      'e2 table( '#13#10'[D804_ptr] int               null,'#13#10'[PlanMainDate] s' +
      'malldatetime null,'#13#10'[Status]   tinyint           null,'#13#10'[MaintMa' +
      'n] Nvarchar(100)     null,'#13#10'[Acceptan] nvarchar(20)      null)'#13#10 +
      'declare @table3 table( '#13#10'[D804_ptr] int               null,'#13#10'[Pl' +
      'anMainDate] smalldatetime null,'#13#10'[Status]   tinyint           nu' +
      'll,'#13#10'[MaintMan] Nvarchar(100)     null,'#13#10'[Acceptan] nvarchar(20)' +
      '      null)'#13#10#13#10'insert into @table2'#13#10'select *  from ('#13#10#9'select da' +
      'ta0804.[rkey] [D804_ptr],'#13#10#9'case when ((PlanMainDate is null))an' +
      'd(cycl_duration>0)then CONVERT(VARCHAR(10),getdate(),120)'#13#10#9#9' wh' +
      'en ((PlanMainDate is null))and(cycl_duration=0)then CONVERT(VARC' +
      'HAR(10),getdate(),120)+'#39' 8:00'#39#13#10#9'else PlanMainDate end PlanMainD' +
      'ate,1 [Status],data0804.[defauMan],data0417.[Acceptan_ptr] '#13#10#9'fr' +
      'om data0804'#13#10#9'join data0816 on data0804.MainCycl=data0816.MainCy' +
      'cl'#13#10#9'join data0417 on data0804.D417_ptr=data0417.rkey'#13#10#9'join dat' +
      'a0034 on data0417.DEPT_PTR=data0034.rkey'#13#10#9'left join ('#13#10#9'select ' +
      'top 100 percent '#13#10#9'case when (InteTime is null)and(cycl_duration' +
      '>0) then MainDate+cycl_duration'#13#10#9#9' else  DateAdd(hh,InteTime,Ma' +
      'inDate) end PlanMainDate,'#13#10#9'D804_ptr'#13#10#9'from '#13#10#9'data0804'#13#10#9'join d' +
      'ata0816 on data0804.MainCycl=data0816.MainCycl'#13#10#9'join (select to' +
      'p 100 percent D804_ptr,max(PlanMainDate)MainDate from data0810'#13#10 +
      #9'group by D804_ptr order by D804_ptr)as t1 on t1.d804_ptr=data08' +
      '04.rkey'#13#10#9'order by D804_ptr)as t2 on t2.d804_ptr=data0804.rkey)a' +
      's t2'#13#10'where DATEPART(month,PlanMainDate)= @AddMonth'#13#10#13#10'while exi' +
      'sts(select * from @table2)'#13#10'begin'#13#10#9'insert into @table3 '#13#10'    se' +
      'lect *'#13#10'    from ('#13#10#9#9'select data0804.[rkey] [D804_ptr],'#13#10#9#9'case' +
      ' when cycl_duration>0 then dateAdd(day,data0816.cycl_duration,t1' +
      '.[PlanMainDate])'#13#10'                          else dateAdd(hh,data' +
      '0816.InteTime,t1.[PlanMainDate])end [PlanMainDate],'#13#10'        1 [' +
      'Status],data0804.[defauMan],data0417.[Acceptan_ptr] '#13#10#9#9'from @ta' +
      'ble2 t1'#13#10#9#9'join data0804 on t1.[D804_ptr]=data0804.rkey'#13#10#9#9'join ' +
      'data0816 on data0804.MainCycl=data0816.MainCycl'#13#10#9#9'join data0417' +
      ' on data0804.D417_ptr=data0417.rkey)as t1'#13#10'    where DATEPART(mo' +
      'nth,PlanMainDate)= @AddMonth '#13#10'   '#13#10'    --insert into data0810([' +
      'D804_ptr],[PlanMainDate],[Status],[MaintMan],[Acceptan])'#13#10'    in' +
      'sert into @table1'#13#10'    select *  from @table2'#13#10'    delete @table' +
      '2'#13#10#13#10'    insert into @table2'#13#10'    select *'#13#10'    from @table3'#13#10'  ' +
      '  delete @table3'#13#10'end'#13#10'insert into data0810([D804_ptr],[PlanMain' +
      'Date],[Status],[MaintMan],[Acceptan_ptr])'#13#10'select *  from @table' +
      '1'#13#10'order by [PlanMainDate],[D804_ptr]'#13#10'select count(*)  from @ta' +
      'ble1'
    FetchOnDemand = False
    Params = <
      item
        DataType = ftInteger
        Name = 'AddMonth'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 384
    Top = 176
  end
  object cds005: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select data0005.rkey,data0005.EMPL_CODE [AcceCode],data0005.EMPL' +
      'OYEE_NAME [AcceName],data0005.PHONE,data0034.DEPT_NAME '#13#10'from da' +
      'ta0005 '#13#10'join data0034 on data0005.EMPLOYEE_ID=data0034.rkey'#13#10'wh' +
      'ere data0005.ACTIVE_FLAG='#39'Y'#39
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 536
    Top = 392
    object cds005AcceCode: TStringField
      DisplayLabel = #38599#21592#20195#30721
      FieldName = 'AcceCode'
      Size = 10
    end
    object cds005AcceName: TStringField
      DisplayLabel = #38599#21592#22995#21517
      FieldName = 'AcceName'
      Size = 16
    end
    object cds005DEPT_NAME: TStringField
      DisplayLabel = #37096#38376
      DisplayWidth = 20
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object cds005PHONE: TStringField
      DisplayLabel = #30005#35805
      FieldName = 'PHONE'
      Size = 14
    end
    object cds005rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
  end
  object cdsAddMainPlan: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select Cast(0 as Bit) selected ,'#13#10'case when ((PlanMainDate is nu' +
      'll)/*or(PlanMainDate<getdate())*/)and(cycl_duration>0)then CONVE' +
      'RT(VARCHAR(10),getdate(),120)'#13#10'     when ((PlanMainDate is null)' +
      '/*or(PlanMainDate<getdate())*/)and(cycl_duration=0)then CONVERT(' +
      'VARCHAR(10),getdate(),120)+'#39' 8:00'#39#13#10'else PlanMainDate end PlanMa' +
      'inDate,data0804.*, '#13#10'data0005.EMPLOYEE_NAME Acceptan ,data0417.A' +
      'cceptan_ptr,'#13#10'data0417.rkey d417_ptr,data0417.FASSET_CODE,data04' +
      '17.FASSET_NAME,'#13#10'data0417.LOCATION,data0034.DEPT_CODE,data0034.D' +
      'EPT_NAME'#13#10'from data0804'#13#10'join data0816 on data0804.MainCycl=data' +
      '0816.MainCycl'#13#10'join data0417 on data0804.D417_ptr=data0417.rkey'#13 +
      #10'join data0034 on data0417.DEPT_PTR=data0034.rkey'#13#10'left join dat' +
      'a0005 on data0417.Acceptan_ptr=data0005.rkey'#13#10'left join ('#13#10'selec' +
      't top 100 percent '#13#10'case when (InteTime is null)and(cycl_duratio' +
      'n>0) then MainDate+cycl_duration'#13#10'     else  DateAdd(hh,InteTime' +
      ',MainDate) end PlanMainDate,'#13#10'D804_ptr--,MainDate,MainDate+cycl_' +
      'duration PlanMainDate '#13#10'from '#13#10'data0804'#13#10'join data0816 on data08' +
      '04.MainCycl=data0816.MainCycl-- and data0816.cycl_duration>0'#13#10'jo' +
      'in (select top 100 percent D804_ptr,max(PlanMainDate)MainDate fr' +
      'om data0810'#13#10'group by D804_ptr order by D804_ptr)as t1 on t1.d80' +
      '4_ptr=data0804.rkey'#13#10'order by D804_ptr)as t2 on t2.d804_ptr=data' +
      '0804.rkey'
    Params = <>
    ProviderName = 'dspAddMainPlan'
    Left = 392
    Top = 240
    object cdsAddMainPlanselected: TBooleanField
      DisplayLabel = #36873#25321
      FieldName = 'selected'
      ProviderFlags = []
    end
    object cdsAddMainPlanPlanMainDate: TDateTimeField
      DisplayLabel = #35745#21010#20445#20859#26085#26399
      FieldName = 'PlanMainDate'
      ReadOnly = True
    end
    object cdsAddMainPlanrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object cdsAddMainPlanD417_ptr: TIntegerField
      FieldName = 'D417_ptr'
      ReadOnly = True
      Visible = False
    end
    object cdsAddMainPlannumber: TSmallintField
      FieldName = 'number'
      ReadOnly = True
      Visible = False
    end
    object cdsAddMainPlanMainCycl: TStringField
      DisplayLabel = #21608#26399
      FieldName = 'MainCycl'
      ReadOnly = True
      Size = 10
    end
    object cdsAddMainPland417_ptr_1: TAutoIncField
      FieldName = 'd417_ptr_1'
      ReadOnly = True
      Visible = False
    end
    object cdsAddMainPlanFASSET_CODE: TStringField
      DisplayLabel = #35774#22791#20195#30721
      FieldName = 'FASSET_CODE'
      ReadOnly = True
    end
    object cdsAddMainPlanFASSET_NAME: TStringField
      DisplayLabel = #35774#22791#21517#31216
      FieldName = 'FASSET_NAME'
      ReadOnly = True
      Size = 30
    end
    object cdsAddMainPlanLOCATION: TStringField
      DisplayLabel = #20445#20859#26041#27861
      FieldName = 'LOCATION'
      ReadOnly = True
      Size = 40
    end
    object cdsAddMainPlanDEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'DEPT_CODE'
      ReadOnly = True
      Size = 10
    end
    object cdsAddMainPlanDEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      ReadOnly = True
      Size = 30
    end
    object cdsAddMainPlanMainPhone: TStringField
      DisplayLabel = #20445#20859#20154#30005#35805
      FieldName = 'MainPhone'
      ReadOnly = True
      Size = 12
    end
    object cdsAddMainPlanAcceptan: TStringField
      DisplayLabel = #39564#25910#20154
      FieldName = 'Acceptan'
      ReadOnly = True
      Size = 16
    end
    object cdsAddMainPlanAcceptan_ptr: TIntegerField
      FieldName = 'Acceptan_ptr'
      ReadOnly = True
      Visible = False
    end
    object cdsAddMainPlanItem: TStringField
      DisplayLabel = #20445#20859#39033#30446
      FieldName = 'Item'
      ReadOnly = True
      Size = 100
    end
    object cdsAddMainPlanMainMeth: TStringField
      DisplayLabel = #20445#20859#26041#27861
      FieldName = 'MainMeth'
      ReadOnly = True
      Size = 400
    end
    object cdsAddMainPlanChecAcce: TStringField
      DisplayLabel = #39564#25910#26631#20934
      FieldName = 'ChecAcce'
      ReadOnly = True
      Size = 400
    end
    object cdsAddMainPlandefauMan: TStringField
      DisplayLabel = #40664#35748#20445#20859#20154
      FieldName = 'defauMan'
      ReadOnly = True
      Size = 100
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsAddMainPlan
    Left = 621
    Top = 119
  end
  object dspAddMainPlan: TDataSetProvider
    DataSet = dtAddMainPlan
    Options = [poAllowCommandText]
    Left = 301
    Top = 239
  end
  object dtAddMainPlan: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'declare @TempTable Table (selected bit )'#13#10'insert into @TempTable' +
      ' values(0)'#13#10'select Cast(0 as Bit) selected ,'#13#10'case when ((PlanMa' +
      'inDate is null)/*or(PlanMainDate<getdate())*/)and(cycl_duration>' +
      '0)then CONVERT(VARCHAR(10),getdate(),120)'#13#10'     when ((PlanMainD' +
      'ate is null)/*or(PlanMainDate<getdate())*/)and(cycl_duration=0)t' +
      'hen CONVERT(VARCHAR(10),getdate(),120)+'#39' 8:00'#39#13#10'else PlanMainDat' +
      'e end PlanMainDate,data0804.*, '#13#10'data0005.EMPLOYEE_NAME Acceptan' +
      ' ,data0417.Acceptan_ptr,'#13#10'data0417.rkey d417_ptr,data0417.FASSET' +
      '_CODE,data0417.FASSET_NAME,'#13#10'data0417.LOCATION,data0034.DEPT_COD' +
      'E,data0034.DEPT_NAME'#13#10'from data0804'#13#10'join @TempTable t1 on 1=1'#13#10 +
      'join data0816 on data0804.MainCycl=data0816.MainCycl'#13#10'join data0' +
      '417 on data0804.D417_ptr=data0417.rkey'#13#10'join data0034 on data041' +
      '7.DEPT_PTR=data0034.rkey'#13#10'left join data0005 on data0417.Accepta' +
      'n_ptr=data0005.rkey'#13#10'left join ('#13#10'select top 100 percent '#13#10'case ' +
      'when (InteTime is null)and(cycl_duration>0) then MainDate+cycl_d' +
      'uration'#13#10'     else  DateAdd(hh,InteTime,MainDate) end PlanMainDa' +
      'te,'#13#10'D804_ptr--,MainDate,MainDate+cycl_duration PlanMainDate '#13#10'f' +
      'rom '#13#10'data0804'#13#10'join data0816 on data0804.MainCycl=data0816.Main' +
      'Cycl-- and data0816.cycl_duration>0'#13#10'join (select top 100 percen' +
      't D804_ptr,max(PlanMainDate)MainDate from data0810'#13#10'group by D80' +
      '4_ptr order by D804_ptr)as t1 on t1.d804_ptr=data0804.rkey'#13#10'orde' +
      'r by D804_ptr)as t2 on t2.d804_ptr=data0804.rkey'
    Parameters = <>
    Left = 216
    Top = 240
    object dtAddMainPlanselected: TBooleanField
      FieldName = 'selected'
    end
    object dtAddMainPlanPlanMainDate: TDateTimeField
      FieldName = 'PlanMainDate'
      ReadOnly = True
    end
    object dtAddMainPlanrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object dtAddMainPlanD417_ptr: TIntegerField
      FieldName = 'D417_ptr'
    end
    object dtAddMainPlannumber: TWordField
      FieldName = 'number'
    end
    object dtAddMainPlanMainCycl: TStringField
      FieldName = 'MainCycl'
      Size = 10
    end
    object dtAddMainPlanItem: TStringField
      FieldName = 'Item'
      Size = 100
    end
    object dtAddMainPlanMainMeth: TStringField
      FieldName = 'MainMeth'
      Size = 400
    end
    object dtAddMainPlanChecAcce: TStringField
      FieldName = 'ChecAcce'
      Size = 400
    end
    object dtAddMainPlandefauMan: TStringField
      FieldName = 'defauMan'
      Size = 100
    end
    object dtAddMainPlanMainPhone: TStringField
      FieldName = 'MainPhone'
      Size = 12
    end
    object dtAddMainPlanAcceptan: TStringField
      FieldName = 'Acceptan'
      Size = 16
    end
    object dtAddMainPlanAcceptan_ptr: TIntegerField
      FieldName = 'Acceptan_ptr'
    end
    object dtAddMainPland417_ptr_1: TAutoIncField
      FieldName = 'd417_ptr_1'
      ReadOnly = True
    end
    object dtAddMainPlanFASSET_CODE: TStringField
      FieldName = 'FASSET_CODE'
    end
    object dtAddMainPlanFASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object dtAddMainPlanLOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 40
    end
    object dtAddMainPlanDEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object dtAddMainPlanDEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
  end
  object cdsAddMonthPlan1: TClientDataSet
    Aggregates = <>
    CommandText = 
      '/*'#21462#26368#21518#20445#20859#35745#21010#65292#28982#21518#25554#20837#21040#20020#26102#34920'2'#65292#28982#21518#26681#25454#20020#26102#34920'2'#30340#35760#24405#29983#20135#19979#19968#27425#30340#20445#20859#35745#21010#65292#13#10#20889#20837#21040#20020#26102#34920'3'#20013#65292#28982#21518#23558#20020#26102#34920'2'#20013#30340#35760#24405 +
      #36716#21040'Data0810'#20445#20859#35745#21010#34920#20013','#20020#26102#34920'3'#30340#35760#24405#36716#31227#21040#20020#26102#34920'2;'#13#10#22914#26524#20020#26102#34920'2'#30340#35760#24405#19981#20026#31354#65292#24490#29615'*/'#13#10'declare @Ad' +
      'dMonth int '#13#10'set @AddMonth=:AddMonth'#13#10'declare @table1 table( '#13#10'[' +
      'D804_ptr] int               null,'#13#10'[PlanMainDate] smalldatetime ' +
      'null,'#13#10'[Status]   tinyint           null,'#13#10'[MaintMan] Nvarchar(1' +
      '00)     null,'#13#10'[Acceptan] nvarchar(20)      null)'#13#10'declare @tabl' +
      'e2 table( '#13#10'[D804_ptr] int               null,'#13#10'[PlanMainDate] s' +
      'malldatetime null,'#13#10'[Status]   tinyint           null,'#13#10'[MaintMa' +
      'n] Nvarchar(100)     null,'#13#10'[Acceptan] nvarchar(20)      null)'#13#10 +
      'declare @table3 table( '#13#10'[D804_ptr] int               null,'#13#10'[Pl' +
      'anMainDate] smalldatetime null,'#13#10'[Status]   tinyint           nu' +
      'll,'#13#10'[MaintMan] Nvarchar(100)     null,'#13#10'[Acceptan] nvarchar(20)' +
      '      null)'#13#10#13#10'insert into @table2'#13#10'select t1.D804_ptr,'#13#10'case wh' +
      'en (cycl_duration>0)then DateAdd(day,cycl_duration,PlanMainDate)' +
      #13#10#9' when (cycl_duration=0)then DateAdd(hh,InteTime,PlanMainDate)' +
      ' end PlanMainDate,'#13#10'1 [Status],data0804.[defauMan],data0417.[Acc' +
      'eptan_ptr] '#13#10' from ('#13#10'    select top 100 percent D804_ptr,max(Pl' +
      'anMainDate)PlanMainDate'#13#10#9'from data0810'#13#10#9'group by D804_ptr orde' +
      'r by D804_ptr) as t1 '#13#10'join data0804 on t1.d804_ptr=data0804.rke' +
      'y'#13#10'join data0816 on data0804.MainCycl=data0816.MainCycl'#13#10'join da' +
      'ta0417 on data0804.D417_ptr=data0417.rkey'#13#10#13#10'while exists(select' +
      ' * from @table2)'#13#10'begin'#13#10#9'insert into @table3 '#13#10'    select *'#13#10'  ' +
      '  from ('#13#10#9#9'select data0804.[rkey] [D804_ptr],'#13#10#9#9'case when cycl' +
      '_duration>0 then dateAdd(day,data0816.cycl_duration,t1.[PlanMain' +
      'Date])'#13#10'                          else dateAdd(hh,data0816.InteT' +
      'ime,t1.[PlanMainDate])end [PlanMainDate],'#13#10'        1 [Status],da' +
      'ta0804.[defauMan],data0417.[Acceptan_ptr] '#13#10#9#9'from @table2 t1'#13#10#9 +
      #9'join data0804 on t1.[D804_ptr]=data0804.rkey'#13#10#9#9'join data0816 o' +
      'n data0804.MainCycl=data0816.MainCycl'#13#10#9#9'join data0417 on data08' +
      '04.D417_ptr=data0417.rkey)as t1'#13#10'    where DATEPART(month,PlanMa' +
      'inDate)= @AddMonth '#13#10#13#10'    insert into @table1'#13#10'    select *  fr' +
      'om @table2'#13#10'    where DATEPART(month,PlanMainDate)= @AddMonth '#13#10 +
      '    delete @table2'#13#10#13#10'    insert into @table2'#13#10'    select *'#13#10'   ' +
      ' from @table3'#13#10'    delete @table3'#13#10'end'#13#10'insert into data0810([D8' +
      '04_ptr],[PlanMainDate],[Status],[MaintMan],[Acceptan_ptr])'#13#10'sele' +
      'ct *  from @table1'#13#10'order by [PlanMainDate],[D804_ptr]'#13#10'select c' +
      'ount(*)  from @table1'
    FetchOnDemand = False
    Params = <
      item
        DataType = ftInteger
        Name = 'AddMonth'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 384
    Top = 320
  end
end
