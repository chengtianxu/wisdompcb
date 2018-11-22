inherited MainPlan1_f: TMainPlan1_f
  Left = 299
  Top = 219
  Caption = 'MainPlan1_f'
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited cxTabControl1: TcxTabControl
    inherited Panel2: TPanel
      inherited Panel4: TPanel
        inherited RzToolbar2: TRzToolbar
          ToolbarControls = (
            btn1
            Button1
            Button4
            btn_NoticeMain
            Button9)
          object Button1: TButton
            Left = 4
            Top = 32
            Width = 111
            Height = 25
            Caption = #28155#21152#20445#20859#35745#21010
            TabOrder = 1
            Visible = False
          end
          object Button4: TButton
            Left = 4
            Top = 60
            Width = 111
            Height = 25
            Caption = #28155#21152#26376#35745#21010
            TabOrder = 2
            Visible = False
          end
          object btn_NoticeMain: TButton
            Left = 4
            Top = 88
            Width = 111
            Height = 25
            Caption = #36890#30693#20445#20859
            TabOrder = 3
            OnClick = btn_NoticeMainClick
          end
          object Button9: TButton
            Left = 4
            Top = 117
            Width = 111
            Height = 23
            Caption = #26242#20572#20445#20859
            TabOrder = 4
            Visible = False
            OnClick = Button9Click
          end
        end
      end
      inherited cxPageControl1: TcxPageControl
        inherited cxTabSheetMain1: TcxTabSheet
          inherited DghMain: TDBGridEh
            ReadOnly = True
            Columns = <
              item
                EditButtons = <>
                FieldName = 'PlanMainDate'
                Footers = <>
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'FASSET_CODE'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'FASSET_NAME'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'LOCATION'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'DEPT_CODE'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'DEPT_NAME'
                Footers = <>
              end>
          end
        end
        inherited cxTabSheetMain2: TcxTabSheet
          TabVisible = False
        end
      end
    end
    inherited Panel3: TPanel
      inherited Panel7: TPanel
        inherited Panel8: TPanel
          inherited RzToolbar3: TRzToolbar
            ToolbarControls = (
              btn2
              btn_StartMain
              btn_SubmAppr
              btn_ConfAcce
              btn_ChangeMan)
            object btn_StartMain: TButton
              Left = 4
              Top = 33
              Width = 111
              Height = 23
              Caption = #24320#22987#20445#20859
              TabOrder = 1
              OnClick = btn_StartMainClick
            end
            object btn_SubmAppr: TButton
              Left = 4
              Top = 60
              Width = 111
              Height = 25
              Caption = #25552#20132#39564#25910
              TabOrder = 2
              OnClick = btn_SubmApprClick
            end
            object btn_ConfAcce: TButton
              Left = 4
              Top = 88
              Width = 111
              Height = 25
              Caption = #30830#35748#39564#25910
              TabOrder = 3
              OnClick = btn_ConfAcceClick
            end
            object btn_ChangeMan: TButton
              Left = 4
              Top = 116
              Width = 111
              Height = 25
              Caption = #26356#25913#20445#20859#20154#30005#35805
              TabOrder = 4
              Visible = False
              OnClick = btn_ChangeManClick
            end
          end
        end
        inherited Panel9: TPanel
          inherited Panel10: TPanel
            Top = 181
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
              object DateTimePicker3: TDateTimePicker
                Left = 24
                Top = 10
                Width = 90
                Height = 21
                Date = 41778.693501689810000000
                Time = 41778.693501689810000000
                TabOrder = 0
              end
              object DateTimePicker4: TDateTimePicker
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
              Left = 260
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
          end
          inherited Panel11: TPanel
            Height = 181
          end
          inherited cxPageControl2: TcxPageControl
            Height = 181
            ClientRectBottom = 181
            inherited cxTabSheetChild1: TcxTabSheet
              inherited ToolBar1: TToolBar
                Height = 158
              end
              inherited dghChild: TDBGridEh
                Height = 158
                RowSizingAllowed = True
                Columns = <
                  item
                    EditButtons = <>
                    FieldName = 'Item'
                    Footers = <>
                    ReadOnly = True
                    Width = 122
                  end
                  item
                    EditButtons = <>
                    FieldName = 'MainMeth'
                    Footers = <>
                    ReadOnly = True
                    Width = 239
                  end
                  item
                    EditButtons = <>
                    FieldName = 'ChecAcce'
                    Footers = <>
                    ReadOnly = True
                    Width = 246
                  end
                  item
                    EditButtons = <>
                    FieldName = 'MainCycl'
                    Footers = <>
                    ReadOnly = True
                    Width = 54
                  end
                  item
                    EditButtons = <>
                    FieldName = 'PlanMainDate'
                    Footers = <>
                    ReadOnly = True
                    Width = 97
                  end
                  item
                    EditButtons = <>
                    FieldName = 'BeginMainDate'
                    Footers = <>
                    Width = 100
                  end
                  item
                    EditButtons = <>
                    FieldName = 'EndMainDate'
                    Footers = <>
                    Width = 100
                  end
                  item
                    EditButtons = <>
                    FieldName = 'MainTime'
                    Footers = <>
                    Width = 100
                  end
                  item
                    EditButtons = <>
                    FieldName = 'MainExecStat'
                    Footers = <>
                    ReadOnly = True
                    Width = 45
                  end
                  item
                    EditButtons = <>
                    FieldName = 'MaintMan'
                    Footers = <>
                    Width = 80
                  end
                  item
                    EditButtons = <>
                    FieldName = 'Acceptan'
                    Footers = <>
                    ReadOnly = True
                    Width = 73
                  end
                  item
                    EditButtons = <>
                    FieldName = 'ttype'
                    Footers = <>
                    PickList.Strings = (
                      #20248
                      #33391
                      #19968#33324
                      #24046)
                    Width = 32
                  end
                  item
                    EditButtons = <>
                    FieldName = 'AcceEval'
                    Footers = <>
                    Width = 200
                  end
                  item
                    EditButtons = <>
                    FieldName = 'Remark'
                    Footers = <>
                    Width = 300
                  end>
              end
            end
            inherited cxTabSheetChild2: TcxTabSheet
              object Label6: TLabel
                Left = 16
                Top = 8
                Width = 48
                Height = 12
                Caption = #20445#20859#21608#26399
              end
              object Label7: TLabel
                Left = 18
                Top = 51
                Width = 72
                Height = 12
                Caption = #35745#21010#20445#20859#26085#26399
              end
              object Label8: TLabel
                Left = 17
                Top = 137
                Width = 72
                Height = 12
                Caption = #32467#26463#20445#20859#26102#38388
              end
              object Label9: TLabel
                Left = 206
                Top = 10
                Width = 48
                Height = 12
                Caption = #20445#20859#39033#30446
              end
              object Label10: TLabel
                Left = 206
                Top = 68
                Width = 48
                Height = 12
                Caption = #20445#20859#26041#27861
              end
              object Label11: TLabel
                Left = 206
                Top = 146
                Width = 48
                Height = 12
                Caption = #39564#25910#26631#20934
              end
              object Label12: TLabel
                Left = 477
                Top = 9
                Width = 24
                Height = 12
                Caption = #29366#24577
              end
              object Label13: TLabel
                Left = 477
                Top = 49
                Width = 36
                Height = 12
                Caption = #20445#20859#20154
              end
              object Label14: TLabel
                Left = 477
                Top = 131
                Width = 36
                Height = 12
                Caption = #39564#25910#20154
              end
              object Label15: TLabel
                Left = 477
                Top = 171
                Width = 48
                Height = 12
                Caption = #39564#25910#32467#26524
              end
              object Label16: TLabel
                Left = 480
                Top = 211
                Width = 48
                Height = 12
                Caption = #39564#25910#35780#20215
              end
              object Label19: TLabel
                Left = 17
                Top = 94
                Width = 72
                Height = 12
                Caption = #24320#22987#20445#20859#26102#38388
              end
              object Label20: TLabel
                Left = 477
                Top = 89
                Width = 60
                Height = 12
                Caption = #39564#25910#20154#20195#30721
              end
              object Label21: TLabel
                Left = 18
                Top = 178
                Width = 72
                Height = 12
                Caption = #20445#20859#28040#32791#26102#38388
              end
              object edt_MainCycl: TDBEdit
                Left = 18
                Top = 24
                Width = 119
                Height = 20
                DataField = 'MainCycl'
                DataSource = dsChild
                TabOrder = 0
              end
              object edt_Status: TDBEdit
                Left = 478
                Top = 25
                Width = 119
                Height = 20
                DataField = 'Status'
                DataSource = dsChild
                Font.Charset = GB2312_CHARSET
                Font.Color = clBlue
                Font.Height = -12
                Font.Name = #23435#20307
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
              object edt_MaintMan: TDBEdit
                Left = 478
                Top = 65
                Width = 119
                Height = 20
                DataField = 'MaintMan'
                DataSource = dsChild
                TabOrder = 2
              end
              object edt_Acceptan: TDBEdit
                Left = 478
                Top = 146
                Width = 119
                Height = 20
                DataField = 'Acceptan'
                DataSource = dsChild
                TabOrder = 3
              end
              object edt_MainMeth: TDBMemo
                Left = 207
                Top = 84
                Width = 198
                Height = 57
                DataField = 'MainMeth'
                DataSource = dsChild
                TabOrder = 4
              end
              object dtedt_PlanMainDate: TDBDateTimeEditEh
                Left = 19
                Top = 67
                Width = 118
                Height = 20
                DataField = 'PlanMainDate'
                DataSource = dsChild
                EditButtons = <>
                Kind = dtkDateEh
                TabOrder = 5
                Visible = True
              end
              object dtedt_EndMainDate: TDBDateTimeEditEh
                Left = 18
                Top = 153
                Width = 117
                Height = 20
                DataField = 'EndMainDate'
                DataSource = dsChild
                EditButtons = <>
                Kind = dtkDateTimeEh
                TabOrder = 6
                Visible = True
              end
              object edt_ChecAcce: TDBMemo
                Left = 207
                Top = 162
                Width = 199
                Height = 57
                DataField = 'ChecAcce'
                DataSource = dsChild
                TabOrder = 7
              end
              object edt_Item: TDBMemo
                Left = 207
                Top = 24
                Width = 199
                Height = 38
                DataField = 'Item'
                DataSource = dsChild
                TabOrder = 8
              end
              object edt_AcceEval: TDBMemo
                Left = 478
                Top = 226
                Width = 199
                Height = 57
                DataField = 'AcceEval'
                DataSource = dsChild
                TabOrder = 9
              end
              object edt_ttype: TDBComboBox
                Left = 479
                Top = 186
                Width = 120
                Height = 20
                DataField = 'ttype'
                DataSource = dsChild
                ItemHeight = 12
                Items.Strings = (
                  #20248
                  #33391
                  #19968#33324
                  #24046)
                TabOrder = 10
              end
              object dtedt_BeginMainDate: TDBDateTimeEditEh
                Left = 18
                Top = 110
                Width = 118
                Height = 20
                DataField = 'BeginMainDate'
                DataSource = dsChild
                EditButtons = <>
                Kind = dtkDateTimeEh
                TabOrder = 11
                Visible = True
              end
              object edt_AcceCode: TDBButtonEdit
                Left = 478
                Top = 105
                Width = 121
                Height = 20
                Hint = #25353'F1'#24377#20986#19979#25289#21015#34920
                DataSource = dsChild
                DataField = 'AcceCode'
                ParentShowHint = False
                ReadOnlyColor = clInactiveCaptionText
                ShowHint = True
                TabOrder = 12
                F_DownFormWidth = 0
                F_DownDataSetFilterField = 'AcceCode'
                F_ResultFieldName = 'AcceCode'
                F_GetFieldName = 'EMPL_CODE'
                F_PressKey13AutoDrop = False
              end
              object edt_MainTime: TDBEdit
                Left = 18
                Top = 193
                Width = 121
                Height = 20
                DataField = 'MainTime'
                DataSource = dsChild
                TabOrder = 13
              end
            end
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
    Left = 230
    DockControlHeights = (
      0
      0
      39
      0)
    inherited dxBarManagerBar2: TdxBar
      ItemLinks = <
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
      'select * from ('#13#10'select Cast(convert(varchar(10),data0810.[PlanM' +
      'ainDate],120)as smalldatetime) [PlanMainDate],data0417.rkey d417' +
      '_ptr,'#13#10'data0417.FASSET_CODE,data0417.FASSET_NAME,data0417.LOCATI' +
      'ON,data0034.DEPT_CODE,'#13#10'data0034.DEPT_NAME,data0005.EMPL_CODE Ac' +
      'ceCode,data0005.EMPLOYEE_NAME Acceptan'#13#10'from data0810'#13#10'join data' +
      '0804 on data0810.[D804_ptr]=data0804.rkey'#13#10'join data0417 on data' +
      '0804.[D417_ptr]=data0417.rkey'#13#10'join data0034 on data0417.[DEPT_P' +
      'TR]=data0034.rkey'#13#10'left join data0005 on data0417.Acceptan_ptr=d' +
      'ata0005.rkey'#13#10'where data0810.[PlanMainDate]>=getdate()-1)as t1'
  end
  inherited cdsMain: Tcds
    CommandText = 
      'select T1.*,data0417.FASSET_CODE,data0417.FASSET_NAME,data0417.L' +
      'OCATION,data0034.DEPT_CODE,'#13#10'data0034.DEPT_NAME,data0005.EMPL_CO' +
      'DE AcceCode,data0005.EMPLOYEE_NAME Acceptan from ('#13#10'select Cast(' +
      'convert(varchar(10),data0810.[PlanMainDate],120)as smalldatetime' +
      ') [PlanMainDate],data0804.d417_ptr'#13#10'from data0810'#13#10'join data0804' +
      ' on data0810.[D804_ptr]=data0804.rkey'#13#10'join data0417 on data0804' +
      '.[D417_ptr]=data0417.rkey'#13#10'join data0034 on data0417.[DEPT_PTR]=' +
      'data0034.rkey'#13#10'left join data0005 on data0417.Acceptan_ptr=data0' +
      '005.rkey'
    ReadOnly = True
    OnFilterRecord = cdsMainFilterRecord
    F_SQLSelectFrom = 
      'select T1.*,data0417.FASSET_CODE,data0417.FASSET_NAME,data0417.L' +
      'OCATION,data0034.DEPT_CODE,'#13#10'data0034.DEPT_NAME,data0005.EMPL_CO' +
      'DE AcceCode,data0005.EMPLOYEE_NAME Acceptan from ('#13#10'select Cast(' +
      'convert(varchar(10),data0810.[PlanMainDate],120)as smalldatetime' +
      ') [PlanMainDate],data0804.d417_ptr'#13#10'from data0810'#13#10'join data0804' +
      ' on data0810.[D804_ptr]=data0804.rkey'#13#10'join data0417 on data0804' +
      '.[D417_ptr]=data0417.rkey'#13#10'join data0034 on data0417.[DEPT_PTR]=' +
      'data0034.rkey'#13#10'left join data0005 on data0417.Acceptan_ptr=data0' +
      '005.rkey'
    F_SQLOrderBy = 
      'group by [PlanMainDate],d417_ptr)as t1 '#13'join data0417 on t1.[D41' +
      '7_ptr]=data0417.rkey'#13#10'join data0034 on data0417.[DEPT_PTR]=data0' +
      '034.rkey'#13#10'left join data0005 on data0417.Acceptan_ptr=data0005.r' +
      'key'
    object cdsMainPlanMainDate: TDateTimeField
      DisplayLabel = #20445#20859#26085#26399
      FieldName = 'PlanMainDate'
      ReadOnly = True
    end
    object cdsMainFASSET_CODE: TStringField
      DisplayLabel = #35774#22791#20195#30721
      DisplayWidth = 18
      FieldName = 'FASSET_CODE'
    end
    object cdsMainFASSET_NAME: TStringField
      DisplayLabel = #35774#22791#21517#31216
      DisplayWidth = 21
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object cdsMainLOCATION: TStringField
      DisplayLabel = #20301#32622
      DisplayWidth = 40
      FieldName = 'LOCATION'
      Size = 40
    end
    object cdsMainDEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      DisplayWidth = 12
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object cdsMainDEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      DisplayWidth = 30
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object cdsMaind417_ptr: TAutoIncField
      DisplayWidth = 10
      FieldName = 'd417_ptr'
      ReadOnly = True
    end
    object cdsMainAcceCode: TStringField
      FieldName = 'AcceCode'
      Size = 10
    end
    object cdsMainAcceptan: TStringField
      FieldName = 'Acceptan'
      Size = 16
    end
  end
  inherited dtRead: TADODataSet
    CursorType = ctStatic
    CommandText = 'select data0034.DEPT_CODE,data0034.DEPT_NAME  from data0034'
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
  inherited dspChild: TDataSetProvider
    OnGetTableName = dspChildGetTableName
  end
  inherited cdsChild: Tcds
    CommandText = 
      'select data0804.MainCycl,data0804.Item,data0804.MainMeth,'#13#10'data0' +
      '804.ChecAcce,data0804.[D417_ptr],data0005.EMPL_CODE AcceCode,dat' +
      'a0005.EMPLOYEE_NAME Acceptan ,data0832.MainExecStat,'#13#10'data0810.*' +
      #13#10'from data0810'#13#10'join data0804 on data0810.[D804_ptr]=data0804.r' +
      'key'#13#10'left join data0005 on data0810.Acceptan_ptr=data0005.rkey'#13#10 +
      'join data0832 on data0810.Status=data0832.rkey'
    OnCalcFields = cdsChildCalcFields
    F_AutoIncrField = 'rkey'
    F_TableName = 'Data0810'
    F_SQLSelectFrom = 
      'select data0804.MainCycl,data0804.Item,data0804.MainMeth,'#13#10'data0' +
      '804.ChecAcce,data0804.[D417_ptr],data0005.EMPL_CODE AcceCode,dat' +
      'a0005.EMPLOYEE_NAME Acceptan ,data0832.MainExecStat,'#13#10'data0810.*' +
      #13#10'from data0810'#13#10'join data0804 on data0810.[D804_ptr]=data0804.r' +
      'key'#13#10'left join data0005 on data0810.Acceptan_ptr=data0005.rkey'#13#10 +
      'join data0832 on data0810.Status=data0832.rkey'
    F_SQLOrderBy = 'order by data0810.[PlanMainDate],data0804.number'
    object cdsChildMainCycl: TStringField
      DisplayLabel = #20445#20859#21608#26399
      FieldName = 'MainCycl'
      ProviderFlags = []
      Size = 10
    end
    object cdsChildItem: TWideStringField
      DisplayLabel = #20445#20859#39033#30446
      FieldName = 'Item'
      ProviderFlags = []
      Size = 100
    end
    object cdsChildMainMeth: TWideStringField
      DisplayLabel = #20445#20859#26041#27861
      FieldName = 'MainMeth'
      ProviderFlags = []
      Size = 400
    end
    object cdsChildChecAcce: TWideStringField
      DisplayLabel = #39564#25910#26631#20934
      FieldName = 'ChecAcce'
      ProviderFlags = []
      Size = 400
    end
    object cdsChildD804_ptr: TIntegerField
      FieldName = 'D804_ptr'
      ProviderFlags = []
    end
    object cdsChildMainExecStat: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'MainExecStat'
      ProviderFlags = []
      Size = 10
    end
    object cdsChildrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object cdsChildPlanMainDate: TDateTimeField
      DisplayLabel = #35745#21010#20445#20859#26102#38388
      FieldName = 'PlanMainDate'
    end
    object cdsChildMainDate: TDateTimeField
      DisplayLabel = #24320#22987#20445#20859#26102#38388
      FieldName = 'BeginMainDate'
    end
    object cdsChildEndMainDate: TDateTimeField
      DisplayLabel = #32467#26463#20445#20859#26102#38388
      FieldName = 'EndMainDate'
    end
    object cdsChildStatus: TSmallintField
      DisplayLabel = #29366#24577
      FieldName = 'Status'
      OnChange = cdsChildStatusChange
      OnGetText = cdsChildStatusGetText
    end
    object cdsChildMaintMan: TWideStringField
      DisplayLabel = #20445#20859#20154
      FieldName = 'MaintMan'
      Size = 100
    end
    object cdsChildAcceptan_ptr: TIntegerField
      FieldName = 'Acceptan_ptr'
    end
    object cdsChildAcceCode: TStringField
      DisplayLabel = #39564#25910#20154#20195#30721
      FieldName = 'AcceCode'
      Size = 10
    end
    object cdsChildAcceptan: TWideStringField
      DisplayLabel = #39564#25910#20154
      FieldName = 'Acceptan'
      ProviderFlags = []
    end
    object cdsChildttype: TSmallintField
      DisplayLabel = #32467#26524
      FieldName = 'ttype'
      OnGetText = cdsChildttypeGetText
      OnSetText = cdsChildttypeSetText
    end
    object cdsChildAcceEval: TWideStringField
      DisplayLabel = #39564#25910#35780#20215
      FieldName = 'AcceEval'
      Size = 200
    end
    object cdsChildD417_ptr: TIntegerField
      FieldName = 'D417_ptr'
      ProviderFlags = []
    end
    object cdsChildRemark: TWideStringField
      DisplayLabel = #22791#27880
      FieldName = 'Remark'
      Size = 200
    end
    object cdsChildMainTime: TBCDField
      DisplayLabel = #20445#20859#28040#32791#26102#38388
      FieldKind = fkCalculated
      FieldName = 'MainTime'
      Calculated = True
    end
  end
  inherited dtChild: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'select data0804.MainCycl,data0804.Item,data0804.MainMeth,'#13#10'data0' +
      '804.ChecAcce,data0804.[D417_ptr],data0005.EMPL_CODE AcceCode,dat' +
      'a0005.EMPLOYEE_NAME Acceptan ,data0832.MainExecStat,'#13#10'data0810.*' +
      #13#10'from data0810'#13#10'join data0804 on data0810.[D804_ptr]=data0804.r' +
      'key'#13#10'left join data0005 on data0810.Acceptan_ptr=data0005.rkey'#13#10 +
      'join data0832 on data0810.Status=data0832.rkey'
    object dtChildMainCycl: TStringField
      FieldName = 'MainCycl'
      ProviderFlags = []
      Size = 10
    end
    object dtChildItem: TWideStringField
      FieldName = 'Item'
      ProviderFlags = []
      Size = 100
    end
    object dtChildMainMeth: TWideStringField
      FieldName = 'MainMeth'
      ProviderFlags = []
      Size = 400
    end
    object dtChildChecAcce: TWideStringField
      FieldName = 'ChecAcce'
      ProviderFlags = []
      Size = 400
    end
    object dtChildD417_ptr: TIntegerField
      FieldName = 'D417_ptr'
      ProviderFlags = []
    end
    object dtChildMainExecStat: TStringField
      FieldName = 'MainExecStat'
      ProviderFlags = []
      Size = 10
    end
    object dtChildrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object dtChildD804_ptr: TIntegerField
      FieldName = 'D804_ptr'
    end
    object dtChildPlanMainDate: TDateTimeField
      FieldName = 'PlanMainDate'
    end
    object dtChildMainDate: TDateTimeField
      FieldName = 'BeginMainDate'
    end
    object dtChildEndMainDate: TDateTimeField
      FieldName = 'EndMainDate'
    end
    object dtChildStatus: TWordField
      FieldName = 'Status'
    end
    object dtChildMaintMan: TWideStringField
      FieldName = 'MaintMan'
      Size = 100
    end
    object dtChildAcceptan_ptr: TIntegerField
      FieldName = 'Acceptan_ptr'
    end
    object dtChildAcceCode: TStringField
      FieldName = 'AcceCode'
      ProviderFlags = []
      Size = 10
    end
    object dtChildAcceptan: TWideStringField
      FieldName = 'Acceptan'
      ProviderFlags = []
    end
    object dtChildttype: TWordField
      FieldName = 'ttype'
    end
    object dtChildAcceEval: TWideStringField
      FieldName = 'AcceEval'
      Size = 200
    end
    object dtChildRemark: TWideStringField
      FieldName = 'Remark'
      Size = 200
    end
  end
  object cds804: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select Cast(0 as Bit) selected ,CONVERT(VARCHAR(10),getdate(),12' +
      '0)PlanMainDate,data0417.rkey d417_ptr,data0417.FASSET_CODE,data0' +
      '417.FASSET_NAME,'#13#10'data0417.LOCATION,data0034.DEPT_CODE,data0034.' +
      'DEPT_NAME,data0816.cycl_duration,'#13#10'data0816.InteTime,'#13#10'data0804.' +
      '* from data0804'#13#10'join data0417 on data0804.[D417_ptr]=data0417.r' +
      'key'#13#10'join data0034 on data0417.[DEPT_PTR]=data0034.rkey'#13#10'join da' +
      'ta0816 on data0804.MainCycl=data0816.MainCycl and data0816.cycl_' +
      'duration>0'#13#10'--left join data0816 d816_1 on data0804.MainCycl=d81' +
      '6_1.MainCycl and d816_1.cycl_duration=0'#13#10'union all'#13#10'select Cast(' +
      '0 as Bit) selected ,CONVERT(VARCHAR(10),getdate(),120)+'#39' 8:00'#39' P' +
      'lanMainDate,data0417.rkey d417_ptr,data0417.FASSET_CODE,data0417' +
      '.FASSET_NAME,'#13#10'data0417.LOCATION,data0034.DEPT_CODE,data0034.DEP' +
      'T_NAME,data0816.InteTime,'#13#10'data0816.InteTime,'#13#10'data0804.* from d' +
      'ata0804'#13#10'join data0417 on data0804.[D417_ptr]=data0417.rkey'#13#10'joi' +
      'n data0034 on data0417.[DEPT_PTR]=data0034.rkey'#13#10'join data0816 o' +
      'n data0804.MainCycl=data0816.MainCycl and data0816.cycl_duration' +
      '=0'#13#10'--left join data0816 d816_1 on data0804.MainCycl=d816_1.Main' +
      'Cycl and d816_1.cycl_duration=0'#13#10'order by data0804.number'
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 536
    Top = 208
    object cds804selected: TBooleanField
      FieldName = 'selected'
      ReadOnly = True
    end
    object cds804PlanMainDate: TStringField
      FieldName = 'PlanMainDate'
      ReadOnly = True
      Size = 15
    end
    object cds804d417_ptr: TIntegerField
      FieldName = 'd417_ptr'
      ReadOnly = True
    end
    object cds804FASSET_CODE: TStringField
      FieldName = 'FASSET_CODE'
      ReadOnly = True
    end
    object cds804FASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      ReadOnly = True
      Size = 30
    end
    object cds804LOCATION: TStringField
      FieldName = 'LOCATION'
      ReadOnly = True
      Size = 40
    end
    object cds804DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      ReadOnly = True
      Size = 10
    end
    object cds804DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      ReadOnly = True
      Size = 30
    end
    object cds804cycl_duration: TIntegerField
      FieldName = 'cycl_duration'
      ReadOnly = True
    end
    object cds804InteTime: TIntegerField
      FieldName = 'InteTime'
      ReadOnly = True
    end
    object cds804rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object cds804D417_ptr_1: TIntegerField
      FieldName = 'D417_ptr_1'
      ReadOnly = True
    end
    object cds804number: TSmallintField
      FieldName = 'number'
      ReadOnly = True
    end
    object cds804MainCycl: TStringField
      FieldName = 'MainCycl'
      ReadOnly = True
      Size = 10
    end
    object cds804Item: TWideStringField
      FieldName = 'Item'
      ReadOnly = True
      Size = 100
    end
    object cds804MainMeth: TWideStringField
      FieldName = 'MainMeth'
      ReadOnly = True
      Size = 400
    end
    object cds804ChecAcce: TWideStringField
      FieldName = 'ChecAcce'
      ReadOnly = True
      Size = 400
    end
    object cds804defauMan: TWideStringField
      FieldName = 'defauMan'
      ReadOnly = True
      Size = 100
    end
  end
  object cds417: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select data0417.FASSET_CODE,data0417.FASSET_NAME,data0417.LOCATI' +
      'ON,data0034.DEPT_CODE,data0034.DEPT_NAME '#13#10'from data0417 '#13#10'join ' +
      'data0034 on data0417.[DEPT_PTR]=data0034.rkey'
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 632
    Top = 192
    object cds417FASSET_CODE: TStringField
      DisplayLabel = #35774#22791#20195#30721
      DisplayWidth = 15
      FieldName = 'FASSET_CODE'
    end
    object cds417FASSET_NAME: TStringField
      DisplayLabel = #35774#22791#21517#31216
      DisplayWidth = 25
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object cds417LOCATION: TStringField
      DisplayLabel = #20301#32622
      DisplayWidth = 15
      FieldName = 'LOCATION'
      Size = 40
    end
    object cds417DEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object cds417DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      DisplayWidth = 15
      FieldName = 'DEPT_NAME'
      Size = 30
    end
  end
  object cdsAddPlan: TClientDataSet
    Aggregates = <>
    CommandText = 
      'insert into data0810([D804_ptr],[PlanMainDate],[Status],[MaintMa' +
      'n],[Acceptan])'#13#10'select data0810.[D804_ptr],'#13#10'case when cycl_dura' +
      'tion>0 then dateAdd(day,data0816.cycl_duration,data0810.[PlanMai' +
      'nDate])'#13#10'                          else dateAdd(hh,data0816.Inte' +
      'Time,data0810.[PlanMainDate])end,'#13#10'1,data0804.defauMan,data0417.' +
      'Acceptan '#13#10'from data0810'#13#10'join data0804 on data0804.rkey=data081' +
      '0.[D804_ptr]'#13#10'join data0816 on data0816.MainCycl=data0804.MainCy' +
      'cl'#13#10'join data0417 on data0804.[D417_ptr]=data0417.rkey'#13#10'where CO' +
      'NVERT(VARCHAR(10),data0810.[PlanMainDate],120)=:PlanMainDate and' +
      ' data0804.[D417_ptr]=:D417_ptr'
    FetchOnDemand = False
    Params = <
      item
        DataType = ftDateTime
        Name = 'PlanMainDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'D417_ptr'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 536
    Top = 272
  end
end
