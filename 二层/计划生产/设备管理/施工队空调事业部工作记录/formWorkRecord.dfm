inherited frmWorkRecord: TfrmWorkRecord
  Left = 298
  Top = 187
  Caption = 'frmWorkRecord'
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 12
  inherited cxTabControl1: TcxTabControl
    inherited Panel2: TPanel
      inherited Panel4: TPanel
        inherited RzToolbar2: TRzToolbar
          RowHeight = 26
          ToolbarControls = (
            Button3
            btn1
            Button1
            Button6
            Button5
            Button11
            Button2
            Button4
            Button8)
          inherited btn1: TButton
            Top = 29
          end
          object Button3: TButton
            Left = 4
            Top = 4
            Width = 110
            Height = 23
            Caption = #21463#29702#20219#21153
            TabOrder = 1
            OnClick = Button3Click
          end
          object Button1: TButton
            Left = 4
            Top = 56
            Width = 111
            Height = 23
            Caption = #26242#20572#32467#26463
            TabOrder = 2
            Visible = False
            OnClick = Button1Click
          end
          object Button6: TButton
            Left = 4
            Top = 82
            Width = 110
            Height = 23
            Caption = #25552#20132#39564#25910
            TabOrder = 3
            OnClick = Button6Click
          end
          object Button5: TButton
            Left = 4
            Top = 108
            Width = 110
            Height = 23
            Caption = #39564#25910#36890#36807
            TabOrder = 4
            OnClick = Button5Click
          end
          object Button11: TButton
            Left = 4
            Top = 134
            Width = 110
            Height = 23
            Caption = #29366#24577#35760#24405
            TabOrder = 5
            OnClick = Button11Click
          end
          object Button2: TButton
            Left = 4
            Top = 160
            Width = 111
            Height = 23
            Caption = #26242#20572#35760#24405
            TabOrder = 6
            Visible = False
            OnClick = Button2Click
          end
          object Button4: TButton
            Left = 4
            Top = 185
            Width = 111
            Height = 24
            Caption = #25968#25454#20998#26512
            TabOrder = 7
            Visible = False
            OnClick = Button4Click
          end
          object Button8: TButton
            Left = 4
            Top = 212
            Width = 111
            Height = 23
            Caption = #39033#30446#32791#26102#20449#24687
            TabOrder = 8
            OnClick = Button8Click
          end
        end
      end
      inherited cxPageControl1: TcxPageControl
        inherited cxTabSheetMain1: TcxTabSheet
          inherited DghMain: TDBGridEh
            Columns = <
              item
                EditButtons = <>
                FieldName = 'WorkOrder'
                Footers = <>
                Visible = False
                Width = 82
              end
              item
                EditButtons = <>
                FieldName = 'DeptName'
                Footers = <>
                Width = 92
              end
              item
                EditButtons = <>
                FieldName = 'WorkName'
                Footers = <>
                Width = 102
              end
              item
                EditButtons = <>
                FieldName = 'WorkExpl'
                Footers = <>
                Width = 200
              end
              item
                EditButtons = <>
                FieldName = 'un_Applican'
                Footers = <>
                ReadOnly = True
                Width = 74
              end
              item
                EditButtons = <>
                FieldName = 'MainExecStat'
                Footers = <>
                ReadOnly = True
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'un_RespPeop'
                Footers = <>
                ReadOnly = True
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'AdmiTime'
                Footers = <>
                ReadOnly = True
                Width = 111
              end
              item
                EditButtons = <>
                FieldName = 'un_AdmiPeop'
                Footers = <>
                ReadOnly = True
                Width = 75
              end
              item
                EditButtons = <>
                FieldName = 'CompTime'
                Footers = <>
                ReadOnly = True
                Width = 115
              end
              item
                EditButtons = <>
                FieldName = 'ForeTime'
                Footers = <>
                Width = 60
              end
              item
                EditButtons = <>
                FieldName = 'ActuCons'
                Footers = <>
                ReadOnly = True
                Width = 60
              end
              item
                EditButtons = <>
                FieldName = 'Efficien'
                Footers = <>
                ReadOnly = True
                Width = 60
              end
              item
                EditButtons = <>
                FieldName = 'AcceTime'
                Footers = <>
                ReadOnly = True
                Width = 111
              end
              item
                EditButtons = <>
                FieldName = 'un_AccePeop'
                Footers = <>
                ReadOnly = True
                Width = 105
              end
              item
                EditButtons = <>
                FieldName = 'Remark'
                Footers = <>
                Width = 200
              end>
          end
        end
        inherited cxTabSheetMain2: TcxTabSheet
          object Label3: TLabel
            Left = 15
            Top = 7
            Width = 48
            Height = 12
            Caption = #24037#20316#21333#21495
            FocusControl = edt_WorkOrder
          end
          object Label4: TLabel
            Left = 15
            Top = 44
            Width = 48
            Height = 12
            Caption = #37096#38376#21517#31216
          end
          object Label5: TLabel
            Left = 15
            Top = 81
            Width = 24
            Height = 12
            Caption = #20219#21153
          end
          object Label6: TLabel
            Left = 15
            Top = 118
            Width = 72
            Height = 12
            Caption = #24037#20316#20219#21153#35828#26126
          end
          object Label7: TLabel
            Left = 15
            Top = 193
            Width = 36
            Height = 12
            Caption = #30003#35831#20154
            FocusControl = edt_un_Applican
          end
          object Label8: TLabel
            Left = 235
            Top = 8
            Width = 48
            Height = 24
            Caption = #21463#29702#26085#26399#13#10
            FocusControl = edt_AdmiTime
          end
          object Label9: TLabel
            Left = 235
            Top = 44
            Width = 48
            Height = 12
            Caption = #23436#25104#26085#26399
            FocusControl = edt_CompTime
          end
          object Label11: TLabel
            Left = 235
            Top = 82
            Width = 24
            Height = 12
            Caption = #29366#24577
            FocusControl = edt_MainExecStat
          end
          object Label12: TLabel
            Left = 235
            Top = 119
            Width = 48
            Height = 12
            Caption = #39564#25910#26102#38388
            FocusControl = edt_AcceTime
          end
          object Label14: TLabel
            Left = 235
            Top = 156
            Width = 36
            Height = 12
            Caption = #39564#25910#20154
            FocusControl = edt_un_AccePeop
          end
          object Label15: TLabel
            Left = 235
            Top = 193
            Width = 48
            Height = 12
            Caption = #39044#35745#32791#26102
            FocusControl = edt_ForeTime
          end
          object Label16: TLabel
            Left = 420
            Top = 7
            Width = 48
            Height = 12
            Caption = #23454#38469#32791#26102
            FocusControl = edt_ActuCons
          end
          object Label17: TLabel
            Left = 420
            Top = 44
            Width = 24
            Height = 12
            Caption = #25928#29575
            FocusControl = edt_Efficien
          end
          object Label18: TLabel
            Left = 420
            Top = 81
            Width = 24
            Height = 12
            Caption = #22791#27880
          end
          object edt_WorkOrder: TDBEdit
            Left = 15
            Top = 22
            Width = 166
            Height = 20
            DataField = 'WorkOrder'
            DataSource = dsMain
            ReadOnly = True
            TabOrder = 0
          end
          object edt_un_Applican: TDBEdit
            Left = 15
            Top = 208
            Width = 166
            Height = 20
            Color = clInactiveCaptionText
            DataField = 'un_Applican'
            DataSource = dsMain
            ReadOnly = True
            TabOrder = 1
          end
          object edt_AdmiTime: TDBEdit
            Left = 235
            Top = 22
            Width = 167
            Height = 20
            Color = clInactiveCaptionText
            DataField = 'AdmiTime'
            DataSource = dsMain
            ReadOnly = True
            TabOrder = 2
          end
          object edt_CompTime: TDBEdit
            Left = 235
            Top = 59
            Width = 167
            Height = 20
            Color = clInactiveCaptionText
            DataField = 'CompTime'
            DataSource = dsMain
            ReadOnly = True
            TabOrder = 3
          end
          object edt_MainExecStat: TDBEdit
            Left = 235
            Top = 97
            Width = 124
            Height = 20
            Color = clInactiveCaptionText
            DataField = 'MainExecStat'
            DataSource = dsMain
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlue
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object edt_AcceTime: TDBEdit
            Left = 235
            Top = 133
            Width = 167
            Height = 20
            Color = clInactiveCaptionText
            DataField = 'AcceTime'
            DataSource = dsMain
            ReadOnly = True
            TabOrder = 5
          end
          object edt_un_AccePeop: TDBEdit
            Left = 235
            Top = 171
            Width = 167
            Height = 20
            Color = clInactiveCaptionText
            DataField = 'un_AccePeop'
            DataSource = dsMain
            ReadOnly = True
            TabOrder = 6
          end
          object edt_ForeTime: TDBEdit
            Left = 235
            Top = 208
            Width = 112
            Height = 20
            Color = clInactiveCaptionText
            DataField = 'ForeTime'
            DataSource = dsMain
            ReadOnly = True
            TabOrder = 7
          end
          object edt_ActuCons: TDBEdit
            Left = 420
            Top = 22
            Width = 112
            Height = 20
            Color = clInactiveCaptionText
            DataField = 'ActuCons'
            DataSource = dsMain
            ReadOnly = True
            TabOrder = 8
          end
          object edt_Efficien: TDBEdit
            Left = 420
            Top = 59
            Width = 112
            Height = 20
            Color = clInactiveCaptionText
            DataField = 'Efficien'
            DataSource = dsMain
            ReadOnly = True
            TabOrder = 9
          end
          object mo_Remark: TDBMemo
            Left = 420
            Top = 96
            Width = 203
            Height = 93
            Color = clInactiveCaptionText
            DataField = 'Remark'
            DataSource = dsMain
            ReadOnly = True
            TabOrder = 10
          end
          object edt_DeptName: TDBButtonEdit
            Left = 15
            Top = 59
            Width = 166
            Height = 20
            Hint = #25353'F1'#24377#20986#19979#25289#21015#34920
            DataSource = dsMain
            DataField = 'DeptName'
            ReadOnly = True
            Color = clInactiveCaptionText
            ParentShowHint = False
            ReadOnlyColor = clInactiveCaptionText
            ShowHint = True
            TabOrder = 11
            AltBtnWidth = 16
            ButtonWidth = 16
            F_DownFormWidth = 0
            F_DownListDataSet = cds0830
            F_DownDataSetFilterField = 'DeptName'
            F_ResultFieldName = 'DeptName'
            F_GetFieldName = 'DeptName'
            F_PressKey13AutoDrop = False
          end
          object edt_WorkName: TDBButtonEdit
            Left = 15
            Top = 96
            Width = 166
            Height = 20
            Hint = #25353'F1'#24377#20986#19979#25289#21015#34920
            DataSource = dsMain
            DataField = 'WorkName'
            ReadOnly = True
            Color = clInactiveCaptionText
            ParentShowHint = False
            ReadOnlyColor = clInactiveCaptionText
            ShowHint = True
            TabOrder = 12
            AltBtnWidth = 16
            ButtonWidth = 16
            F_DownFormWidth = 0
            F_DownListDataSet = cds0836
            F_DownDataSetFilterField = 'WorkName'
            F_ResultFieldName = 'WorkName'
            F_GetFieldName = 'WorkName'
            F_PressKey13AutoDrop = False
          end
          object mo_WorkExpl: TDBMemo
            Left = 14
            Top = 132
            Width = 203
            Height = 56
            Color = clInactiveCaptionText
            DataField = 'WorkExpl'
            DataSource = dsMain
            ReadOnly = True
            TabOrder = 13
          end
        end
      end
    end
    inherited Panel3: TPanel
      inherited Panel5: TPanel
        Top = 186
        Height = 35
        object GroupBox1: TGroupBox
          Left = 0
          Top = 0
          Width = 245
          Height = 35
          Align = alLeft
          Caption = #21463#29702#26085#26399
          TabOrder = 0
          object Label13: TLabel
            Left = 124
            Top = 15
            Width = 12
            Height = 12
            Caption = #21040
          end
          object Label2: TLabel
            Left = 7
            Top = 15
            Width = 12
            Height = 12
            Caption = #20174
          end
          object dteEnd: TDateTimePicker
            Left = 139
            Top = 11
            Width = 102
            Height = 21
            Date = 41500.580699502320000000
            Time = 41500.580699502320000000
            TabOrder = 0
          end
          object dteBegin: TDateTimePicker
            Left = 21
            Top = 11
            Width = 102
            Height = 21
            Date = 41500.580699502320000000
            Time = 41500.580699502320000000
            TabOrder = 1
          end
        end
        object GroupBox2: TGroupBox
          Left = 245
          Top = 0
          Width = 332
          Height = 35
          Align = alLeft
          Caption = #31579#36873#29366#24577
          TabOrder = 1
          object BtFind: TSpeedButton
            Left = 304
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
          object CheckBox1: TCheckBox
            Left = 7
            Top = 13
            Width = 56
            Height = 17
            Caption = #24453#25191#34892
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object CheckBox3: TCheckBox
            Left = 66
            Top = 13
            Width = 58
            Height = 17
            Caption = #25191#34892#20013
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
          object CheckBox2: TCheckBox
            Left = 245
            Top = 13
            Width = 57
            Height = 17
            Caption = #24050#39564#25910
            TabOrder = 3
          end
          object CheckBox4: TCheckBox
            Left = 183
            Top = 13
            Width = 56
            Height = 17
            Caption = #24453#39564#25910
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
          object CheckBox6: TCheckBox
            Left = 122
            Top = 13
            Width = 56
            Height = 17
            Caption = #24050#26242#20572
            Checked = True
            State = cbChecked
            TabOrder = 4
          end
        end
        object GroupBox3: TGroupBox
          Left = 577
          Top = 0
          Width = 229
          Height = 35
          Align = alLeft
          Caption = #36807#28388
          TabOrder = 2
          object Label1: TLabel
            Left = 12
            Top = 16
            Width = 48
            Height = 12
            Caption = #24037#20316#21333#21495
          end
          object Edit1: TEdit
            Left = 65
            Top = 11
            Width = 111
            Height = 20
            TabOrder = 0
            OnChange = Edit1Change
          end
        end
      end
      inherited Panel7: TPanel
        Height = 186
        inherited Panel8: TPanel
          Height = 186
          inherited RzToolbar3: TRzToolbar
            Height = 186
            RowHeight = 26
            ToolbarControls = (
              Button12
              Button7
              Button13
              btn2)
            inherited btn2: TButton
              Top = 81
            end
            object Button12: TButton
              Left = 4
              Top = 4
              Width = 110
              Height = 23
              Caption = #20174#21382#21490#35760#24405#28155#21152
              TabOrder = 1
              OnClick = Button12Click
            end
            object Button7: TButton
              Left = 4
              Top = 30
              Width = 110
              Height = 23
              Caption = #37325#26032#35745#31639
              TabOrder = 2
              Visible = False
              OnClick = Button7Click
            end
            object Button13: TButton
              Left = 4
              Top = 56
              Width = 110
              Height = 23
              Caption = #20010#20154#32467#26463
              TabOrder = 3
              OnClick = Button13Click
            end
          end
        end
        inherited Panel9: TPanel
          Height = 186
          inherited Panel10: TPanel
            Top = 181
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
                Columns = <
                  item
                    EditButtons = <>
                    FieldName = 'WorkDate'
                    Footers = <>
                    ReadOnly = True
                    Width = 95
                  end
                  item
                    EditButtons = <>
                    FieldName = 'MainExecStat'
                    Footers = <>
                    ReadOnly = True
                  end
                  item
                    EditButtons = <>
                    FieldName = 'EMPL_CODE'
                    Footers = <>
                    ReadOnly = True
                    Width = 88
                  end
                  item
                    EditButtons = <>
                    FieldName = 'EMPLOYEE_NAME'
                    Footers = <>
                    ReadOnly = True
                  end
                  item
                    EditButtons = <>
                    FieldName = 'BeginTime'
                    Footers = <>
                    ReadOnly = True
                    Width = 143
                  end
                  item
                    EditButtons = <>
                    FieldName = 'EndTime'
                    Footers = <>
                    ReadOnly = True
                    Width = 143
                  end
                  item
                    EditButtons = <>
                    FieldName = 'TimeRest'
                    Footers = <>
                    ReadOnly = True
                    Width = 82
                  end
                  item
                    EditButtons = <>
                    FieldName = 'WorkTime'
                    Footers = <>
                    ReadOnly = True
                    Width = 81
                  end
                  item
                    EditButtons = <>
                    FieldName = 'Remark'
                    Footers = <>
                    ReadOnly = True
                    Width = 223
                  end>
              end
            end
            inherited cxTabSheetChild2: TcxTabSheet
              TabVisible = False
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
          Visible = True
          ItemName = 'tblDelete'
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
      'select data0830.DeptName,data0836.WorkName,data0073.USER_FULL_NA' +
      'ME un_Applican,'#13#10'd73_1.USER_FULL_NAME as un_RespPeop,data0832.Ma' +
      'inExecStat,d73_2.USER_FULL_NAME as un_AdmiPeop,'#13#10'd73_3.USER_FULL' +
      '_NAME as un_AccePeop,'#13#10'data0835.* '#13#10'from data0835 '#13#10'join data083' +
      '0 on data0835.Dept_ptr=data0830.rkey'#13#10'join data0836 on data0835.' +
      'Work_ptr=data0836.rkey'#13#10'join data0073 on data0835.Applican=data0' +
      '073.rkey'#13#10'left join data0073 d73_1 on data0835.RespPeop=d73_1.rk' +
      'ey '#13#10'left join data0832 on data0835.[Status]=data0832.rkey'#13#10'left' +
      ' join data0073 d73_2 on data0835.AdmiPeop=d73_2.rkey '#13#10'left join' +
      ' data0073 d73_3 on data0835.AccePeop=d73_3.rkey '
    object dtMainDeptName: TStringField
      FieldName = 'DeptName'
      ProviderFlags = []
      Size = 50
    end
    object dtMainWorkName: TStringField
      FieldName = 'WorkName'
      ProviderFlags = []
      Size = 50
    end
    object dtMainun_Applican: TStringField
      FieldName = 'un_Applican'
      ProviderFlags = []
      Size = 30
    end
    object dtMainun_RespPeop: TStringField
      FieldName = 'un_RespPeop'
      ProviderFlags = []
      Size = 30
    end
    object dtMainMainExecStat: TStringField
      FieldName = 'MainExecStat'
      ProviderFlags = []
      Size = 10
    end
    object dtMainun_AdmiPeop: TStringField
      FieldName = 'un_AdmiPeop'
      ProviderFlags = []
      Size = 30
    end
    object dtMainun_AccePeop: TStringField
      FieldName = 'un_AccePeop'
      ProviderFlags = []
      Size = 30
    end
    object dtMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object dtMainWorkOrder: TStringField
      FieldName = 'WorkOrder'
      Size = 15
    end
    object dtMainDept_ptr: TIntegerField
      FieldName = 'Dept_ptr'
    end
    object dtMainWork_ptr: TIntegerField
      FieldName = 'Work_ptr'
    end
    object dtMainWorkExpl: TStringField
      FieldName = 'WorkExpl'
      Size = 200
    end
    object dtMainForeTime: TBCDField
      FieldName = 'ForeTime'
      Precision = 8
      Size = 2
    end
    object dtMainApplican: TIntegerField
      FieldName = 'Applican'
    end
    object dtMainStatus: TIntegerField
      FieldName = 'Status'
    end
    object dtMainRespPeop: TIntegerField
      FieldName = 'RespPeop'
    end
    object dtMainAdmiTime: TDateTimeField
      FieldName = 'AdmiTime'
    end
    object dtMainAdmiPeop: TIntegerField
      FieldName = 'AdmiPeop'
    end
    object dtMainCompTime: TDateTimeField
      FieldName = 'CompTime'
    end
    object dtMainActuCons: TBCDField
      FieldName = 'ActuCons'
      Precision = 8
      Size = 2
    end
    object dtMainAcceTime: TDateTimeField
      FieldName = 'AcceTime'
    end
    object dtMainAccePeop: TIntegerField
      FieldName = 'AccePeop'
    end
    object dtMainRemark: TStringField
      FieldName = 'Remark'
      Size = 200
    end
  end
  inherited cdsMain: Tcds
    CommandText = 
      'select data0830.DeptName,data0836.WorkName,data0073.USER_FULL_NA' +
      'ME un_Applican,'#13#10'd73_1.USER_FULL_NAME as un_RespPeop,data0832.Ma' +
      'inExecStat,d73_2.USER_FULL_NAME as un_AdmiPeop,'#13#10'd73_3.USER_FULL' +
      '_NAME as un_AccePeop,'#13#10'data0835.* '#13#10'from data0835 '#13#10'join data083' +
      '0 on data0835.Dept_ptr=data0830.rkey'#13#10'join data0836 on data0835.' +
      'Work_ptr=data0836.rkey'#13#10'join data0073 on data0835.Applican=data0' +
      '073.rkey'#13#10'left join data0073 d73_1 on data0835.RespPeop=d73_1.rk' +
      'ey '#13#10'left join data0832 on data0835.[Status]=data0832.rkey'#13#10'left' +
      ' join data0073 d73_2 on data0835.AdmiPeop=d73_2.rkey '#13#10'left join' +
      ' data0073 d73_3 on data0835.AccePeop=d73_3.rkey '
    OnCalcFields = cdsMainCalcFields
    OnFilterRecord = cdsMainFilterRecord
    F_AutoIncrField = 'rkey'
    F_AutoNumb = True
    F_AutoNumbField = 'WorkOrder'
    F_TableName = 'data0835'
    F_SQLSelectFrom = 
      'select data0830.DeptName,data0836.WorkName,data0073.USER_FULL_NA' +
      'ME un_Applican,'#13#10'd73_1.USER_FULL_NAME as un_RespPeop,data0832.Ma' +
      'inExecStat,d73_2.USER_FULL_NAME as un_AdmiPeop,'#13#10'd73_3.USER_FULL' +
      '_NAME as un_AccePeop,'#13#10'data0835.* '#13#10'from data0835 '#13#10'join data083' +
      '0 on data0835.Dept_ptr=data0830.rkey'#13#10'join data0836 on data0835.' +
      'Work_ptr=data0836.rkey'#13#10'join data0073 on data0835.Applican=data0' +
      '073.rkey'#13#10'left join data0073 d73_1 on data0835.RespPeop=d73_1.rk' +
      'ey '#13#10'left join data0832 on data0835.[Status]=data0832.rkey'#13#10'left' +
      ' join data0073 d73_2 on data0835.AdmiPeop=d73_2.rkey '#13#10'left join' +
      ' data0073 d73_3 on data0835.AccePeop=d73_3.rkey '
    F_SQLOrderBy = 'order by data0835.WorkOrder'
    object cdsMainWorkOrder: TStringField
      DisplayLabel = #24037#20316#21333#21495
      DisplayWidth = 15
      FieldName = 'WorkOrder'
      Size = 15
    end
    object cdsMainDeptName: TStringField
      DisplayLabel = #37096#38376#21517#31216
      DisplayWidth = 16
      FieldName = 'DeptName'
      ProviderFlags = []
      OnChange = cdsMainDeptNameChange
      Size = 50
    end
    object cdsMainWorkName: TStringField
      DisplayLabel = #20219#21153
      DisplayWidth = 19
      FieldName = 'WorkName'
      ProviderFlags = []
      OnChange = cdsMainWorkNameChange
      Size = 50
    end
    object cdsMainWorkExpl: TStringField
      DisplayLabel = #24037#20316#20219#21153#35828#26126
      DisplayWidth = 200
      FieldName = 'WorkExpl'
      Size = 200
    end
    object cdsMainun_Applican: TStringField
      DisplayLabel = #30003#35831#20154
      DisplayWidth = 14
      FieldName = 'un_Applican'
      ProviderFlags = []
      Size = 30
    end
    object cdsMainAdmiTime: TDateTimeField
      DisplayLabel = #21463#29702#26085#26399#13#10
      DisplayWidth = 18
      FieldName = 'AdmiTime'
    end
    object cdsMainun_AdmiPeop: TStringField
      DisplayLabel = #21463#29702#20154
      DisplayWidth = 30
      FieldName = 'un_AdmiPeop'
      ProviderFlags = []
      Size = 30
    end
    object cdsMainCompTime: TDateTimeField
      DisplayLabel = #23436#25104#26085#26399
      DisplayWidth = 18
      FieldName = 'CompTime'
    end
    object cdsMainun_RespPeop: TStringField
      DisplayLabel = #36131#20219#20154
      DisplayWidth = 15
      FieldName = 'un_RespPeop'
      ProviderFlags = []
      Size = 30
    end
    object cdsMainMainExecStat: TStringField
      DisplayLabel = #29366#24577
      DisplayWidth = 10
      FieldName = 'MainExecStat'
      ProviderFlags = []
      Size = 10
    end
    object cdsMainAcceTime: TDateTimeField
      DisplayLabel = #39564#25910#26102#38388
      DisplayWidth = 18
      FieldName = 'AcceTime'
    end
    object cdsMainun_AccePeop: TStringField
      DisplayLabel = #39564#25910#20154
      DisplayWidth = 30
      FieldName = 'un_AccePeop'
      ProviderFlags = []
      Size = 30
    end
    object cdsMainForeTime: TBCDField
      DisplayLabel = #39044#35745#32791#26102
      DisplayWidth = 9
      FieldName = 'ForeTime'
      Precision = 8
      Size = 2
    end
    object cdsMainActuCons: TBCDField
      DisplayLabel = #23454#38469#32791#26102
      DisplayWidth = 9
      FieldName = 'ActuCons'
      Precision = 8
      Size = 2
    end
    object cdsMainEfficien: TBCDField
      DisplayLabel = #25928#29575
      DisplayWidth = 6
      FieldKind = fkCalculated
      FieldName = 'Efficien'
      OnGetText = cdsMainEfficienGetText
      Precision = 5
      Calculated = True
    end
    object cdsMainRemark: TStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 200
      FieldName = 'Remark'
      Size = 200
    end
    object cdsMainrkey: TAutoIncField
      DisplayWidth = 10
      FieldName = 'rkey'
      ReadOnly = True
    end
    object cdsMainDept_ptr: TIntegerField
      DisplayWidth = 10
      FieldName = 'Dept_ptr'
    end
    object cdsMainWork_ptr: TIntegerField
      DisplayWidth = 10
      FieldName = 'Work_ptr'
    end
    object cdsMainApplican: TIntegerField
      DisplayWidth = 10
      FieldName = 'Applican'
    end
    object cdsMainRespPeop: TIntegerField
      DisplayWidth = 10
      FieldName = 'RespPeop'
    end
    object cdsMainAdmiPeop: TIntegerField
      DisplayWidth = 10
      FieldName = 'AdmiPeop'
    end
    object cdsMainAccePeop: TIntegerField
      DisplayWidth = 10
      FieldName = 'AccePeop'
    end
    object cdsMainStatus: TIntegerField
      DisplayWidth = 10
      FieldName = 'Status'
      OnChange = cdsMainStatusChange
    end
  end
  inherited dtRead: TADODataSet
    CursorType = ctStatic
    CommandText = 'select * from [Data0830]'#13#10
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
  inherited cdsChild: Tcds
    CommandText = 
      'select data0005.EMPL_CODE,data0005.EMPLOYEE_NAME,data0832.MainEx' +
      'ecStat,data0837.* from data0837'#13#10'join data0005 on data0837.Empl_' +
      'ptr=data0005.rkey'#13#10'join data0832 on data0837.[Status]=data0832.r' +
      'key'
    BeforeInsert = cdsChildBeforeInsert
    BeforePost = cdsChildBeforePost
    F_AutoIncrField = 'rkey'
    F_TableName = 'data0837'
    F_SQLSelectFrom = 
      'select data0005.EMPL_CODE,data0005.EMPLOYEE_NAME,data0832.MainEx' +
      'ecStat,data0837.* from data0837'#13#10'join data0005 on data0837.Empl_' +
      'ptr=data0005.rkey'#13#10'join data0832 on data0837.[Status]=data0832.r' +
      'key'
    F_SQLOrderBy = 'order by data0837.WorkDate'
    F_Primarykey = 'rkey'
    F_Foreignkey = 'Work_ptr'
    object cdsChildrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object cdsChildWork_ptr: TIntegerField
      FieldName = 'Work_ptr'
    end
    object cdsChildWorkDate: TDateTimeField
      DisplayLabel = #24037#20316#26085#26399
      FieldName = 'WorkDate'
    end
    object cdsChildWorkTime: TBCDField
      DisplayLabel = #23454#38469#24037#20316#26102#38388
      FieldName = 'WorkTime'
      Precision = 5
      Size = 2
    end
    object cdsChildBeginTime: TDateTimeField
      DisplayLabel = #24320#22987#26102#38388
      FieldName = 'BeginTime'
      OnChange = cdsChildBeginTimeChange
    end
    object cdsChildEndTime: TDateTimeField
      DisplayLabel = #32467#26463#26102#38388
      FieldName = 'EndTime'
      OnChange = cdsChildBeginTimeChange
    end
    object cdsChildTimeCons: TBCDField
      DisplayLabel = #26242#20572#26102#38388
      FieldName = 'TimeCons'
      Visible = False
      Precision = 8
      Size = 2
    end
    object cdsChildTimeRest: TBCDField
      DisplayLabel = #20013#36884#20241#24687#26102#38388
      FieldName = 'TimeRest'
      OnChange = cdsChildTimeRestChange
      Precision = 8
      Size = 2
    end
    object cdsChildEmpl_ptr: TIntegerField
      FieldName = 'Empl_ptr'
    end
    object cdsChildEMPLOYEE_NAME: TStringField
      DisplayLabel = #38599#21592
      FieldName = 'EMPLOYEE_NAME'
      ProviderFlags = []
      Size = 16
    end
    object cdsChildStatus: TIntegerField
      FieldName = 'Status'
      Visible = False
      OnChange = cdsChildStatusChange
    end
    object cdsChildMainExecStat: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'MainExecStat'
      ProviderFlags = []
      Size = 10
    end
    object cdsChildRemark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Remark'
      Size = 200
    end
    object cdsChildEMPL_CODE: TStringField
      DisplayLabel = #38599#21592#20195#30721
      FieldName = 'EMPL_CODE'
      OnChange = cdsChildEMPL_CODEChange
      Size = 10
    end
  end
  inherited MainGrid_PopupMenu: TPopupMenu
    Left = 381
    Top = 168
    inherited N_Relogin: TMenuItem
      Visible = True
    end
  end
  inherited dtChild: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'select data0005.EMPL_CODE,data0005.EMPLOYEE_NAME,data0832.MainEx' +
      'ecStat,data0837.* from data0837'#13#10'join data0005 on data0837.Empl_' +
      'ptr=data0005.rkey'#13#10'join data0832 on data0837.[Status]=data0832.r' +
      'key'
    object dtChildEMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      ProviderFlags = []
      Size = 10
    end
    object dtChildEMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      ProviderFlags = []
      Size = 16
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
    object dtChildWork_ptr: TIntegerField
      FieldName = 'Work_ptr'
    end
    object dtChildWorkDate: TDateTimeField
      FieldName = 'WorkDate'
    end
    object dtChildBeginTime: TDateTimeField
      FieldName = 'BeginTime'
    end
    object dtChildEndTime: TDateTimeField
      FieldName = 'EndTime'
    end
    object dtChildTimeCons: TBCDField
      FieldName = 'TimeCons'
      Precision = 8
      Size = 2
    end
    object dtChildTimeRest: TBCDField
      FieldName = 'TimeRest'
      Precision = 8
      Size = 2
    end
    object dtChildEmpl_ptr: TIntegerField
      FieldName = 'Empl_ptr'
    end
    object dtChildStatus: TIntegerField
      FieldName = 'Status'
    end
    object dtChildWorkTime: TBCDField
      FieldName = 'WorkTime'
      Precision = 5
      Size = 2
    end
    object dtChildRemark: TStringField
      FieldName = 'Remark'
      Size = 200
    end
  end
  object cds0005: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select RKEY,EMPL_CODE,EMPLOYEE_NAME from data0005 where ACTIVE_F' +
      'LAG='#39'Y'#39#13#10'order by EMPL_CODE'
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 536
    Top = 224
    object cds0005RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object cds0005EMPL_CODE: TStringField
      DisplayLabel = #38599#21592#20195#30721
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object cds0005EMPLOYEE_NAME: TStringField
      DisplayLabel = #38599#21592#21517#31216
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object cds0836: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from Data0836'#13#10
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 472
    Top = 224
    object cds0836rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object cds0836WorkName: TStringField
      DisplayLabel = #20219#21153#21517#31216
      DisplayWidth = 30
      FieldName = 'WorkName'
      Size = 50
    end
  end
  object cds0830: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from [Data0830]'#13#10
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 400
    Top = 224
    object cds0830rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object cds0830DeptName: TStringField
      DisplayLabel = #37096#38376#21517#31216
      DisplayWidth = 30
      FieldName = 'DeptName'
      Size = 50
    end
  end
  object cds0832: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from data0832'#13#10
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 592
    Top = 224
    object cds0832RKEY: TIntegerField
      FieldName = 'RKEY'
    end
    object cds0832MainExecStat: TStringField
      FieldName = 'MainExecStat'
      Size = 10
    end
  end
  object QryResultTime: TADOQuery
    Connection = DM.ADOConnection1
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'vbeginTime'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'vEndTime'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      '/*'#21151#33021#35828#26126#65292#20256#20837#24320#22987#26102#38388#12289#32467#26463#26102#38388#65292#36820#22238#36825'2'#20010#26102#38388#27573#30340#20013#36884#20241#24687'*/'
      'declare @beginTime datetime,@EndTime datetime,@SumTime dec(9,2)'
      'set @beginTime=:vbeginTime'
      'set @EndTime=:vEndTime'
      'set @SumTime=0     '
      'if (convert(nvarchar(8),@beginTime,14))<'#39'12:00:00'#39
      
        '  if ((convert(nvarchar(8),@EndTime,14))>'#39'12:00:00'#39')or(datePart(' +
        'day,@EndTime)>datePart(day,@beginTime)) '
      
        '     if ((convert(nvarchar(8),@EndTime,14))>'#39'13:30:00'#39')or(datePa' +
        'rt(day,@EndTime)>datePart(day,@beginTime)) '
      '     set @SumTime=90'
      '     else'
      
        '     SELECT @SumTime=cast(datediff(minute,'#39'12:00:00'#39',(convert(nv' +
        'archar(8),@EndTime,14)))as dec(9,2))'
      '     print @SumTime'
      'if (convert(nvarchar(8),@beginTime,14))<'#39'17:30:00'#39
      
        '  if ((convert(nvarchar(8),@EndTime,14))>'#39'17:30:00'#39')or(datePart(' +
        'day,@EndTime)>datePart(day,@beginTime)) '
      
        '     if ((convert(nvarchar(8),@EndTime,14))>'#39'18:30:00'#39')or (dateP' +
        'art(day,@EndTime)>datePart(day,@beginTime))'
      '     set @SumTime=@SumTime+60'
      '     else'
      
        '     SELECT @SumTime=@SumTime+cast(datediff(minute,'#39'17:30:00'#39',(c' +
        'onvert(nvarchar(8),@EndTime,14)))as dec(9,2))'
      '     print @SumTime'
      'if (convert(nvarchar(8),@beginTime,14))<'#39'23:00:00'#39
      
        '  if ((convert(nvarchar(8),@EndTime,14))>'#39'23:00:00'#39')or(datePart(' +
        'day,@EndTime)>datePart(day,@beginTime))'
      
        '     if ((convert(nvarchar(8),@EndTime,14))>'#39'23:30:00'#39')or(datePa' +
        'rt(day,@EndTime)>datePart(day,@beginTime))--((convert(nvarchar(8' +
        '),@EndTime,14))>'#39'00:00:00'#39')'
      '     set @SumTime=@SumTime+30'
      '     else'
      
        '     SELECT @SumTime=@SumTime+cast(datediff(minute,'#39'23:00:00'#39',(c' +
        'onvert(nvarchar(8),@EndTime,14)))as dec(9,2))      '
      'SELECT @SumTime/60')
    Left = 400
    Top = 292
  end
end
