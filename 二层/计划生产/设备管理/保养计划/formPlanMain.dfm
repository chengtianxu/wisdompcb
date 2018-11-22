inherited frmPlanMain: TfrmPlanMain
  Left = 224
  Top = 150
  Width = 869
  Height = 673
  Caption = 'frmPlanMain'
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited dxStatusBar1: TdxStatusBar
    Top = 617
    Width = 861
  end
  inherited cxTabControl1: TcxTabControl
    Width = 861
    Height = 578
    ClientRectBottom = 578
    ClientRectRight = 861
    inherited Splitter1: TSplitter
      Top = 349
      Width = 861
      Align = alBottom
    end
    inherited Panel1: TPanel
      Width = 861
    end
    inherited Panel2: TPanel
      Width = 861
      Height = 344
      Align = alClient
      inherited Panel4: TPanel
        Left = 741
        Height = 344
        inherited RzToolbar2: TRzToolbar
          Height = 344
          RowHeight = 26
          ToolbarControls = (
            btn1
            Button1
            Button7
            Button8
            Button3
            Button9
            Button10
            Button2
            Button4
            Button5
            Button6
            Button13
            Button14
            Button15)
          inherited btn1: TButton
            Top = 3
          end
          object Button1: TButton
            Left = 4
            Top = 30
            Width = 111
            Height = 23
            Caption = #28155#21152#20219#21153
            TabOrder = 1
            OnClick = Button1Click
          end
          object Button7: TButton
            Left = 4
            Top = 56
            Width = 111
            Height = 23
            Hint = #36890#30693#37096#38376#36127#36131#20154#35813#35774#22791#35201#36827#34892#20363#34892#20445#20859
            Caption = #36890#30693#20445#20859
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = Button7Click
          end
          object Button8: TButton
            Left = 4
            Top = 82
            Width = 111
            Height = 23
            Caption = #21462#28040#36890#30693
            TabOrder = 3
            OnClick = Button8Click
          end
          object Button3: TButton
            Left = 4
            Top = 108
            Width = 111
            Height = 23
            Caption = #24320#22987#20445#20859
            TabOrder = 4
            OnMouseDown = Button3MouseDown
          end
          object Button9: TButton
            Left = 4
            Top = 134
            Width = 111
            Height = 23
            Caption = #26242#20572#20445#20859
            TabOrder = 5
            Visible = False
            OnClick = Button9Click
          end
          object Button10: TButton
            Left = 4
            Top = 160
            Width = 111
            Height = 23
            Caption = #26242#20572#32467#26463
            TabOrder = 6
            OnMouseDown = Button10MouseDown
          end
          object Button2: TButton
            Left = 4
            Top = 185
            Width = 111
            Height = 24
            Caption = #25552#20132#39564#25910
            TabOrder = 7
            OnClick = Button2Click
          end
          object Button4: TButton
            Left = 4
            Top = 212
            Width = 111
            Height = 23
            Caption = #39564#25910#36890#36807
            TabOrder = 8
            OnMouseDown = Button4MouseDown
          end
          object Button5: TButton
            Left = 4
            Top = 238
            Width = 111
            Height = 23
            Caption = #26242#20572#35760#24405
            TabOrder = 9
            OnClick = Button5Click
          end
          object Button6: TButton
            Left = 4
            Top = 264
            Width = 111
            Height = 23
            Caption = #21382#21490#20445#20859#35760#24405
            TabOrder = 10
            Visible = False
            OnClick = Button6Click
          end
          object Button13: TButton
            Left = 4
            Top = 290
            Width = 111
            Height = 23
            Caption = #21462#28040#25191#34892
            TabOrder = 11
            Visible = False
            OnClick = Button13Click
          end
          object Button14: TButton
            Left = 4
            Top = 316
            Width = 111
            Height = 23
            Caption = #25968#25454#20998#26512
            TabOrder = 12
            OnClick = Button14Click
          end
          object Button15: TButton
            Left = 4
            Top = 342
            Width = 111
            Height = 23
            Caption = #26631#20934#28040#32791#26102#38388#35774#32622
            TabOrder = 13
            OnClick = Button15Click
          end
        end
      end
      inherited cxPageControl1: TcxPageControl
        Width = 736
        Height = 344
        ClientRectBottom = 344
        ClientRectRight = 736
        inherited cxTabSheetMain1: TcxTabSheet
          inherited ToolBar2: TToolBar
            Height = 321
          end
          inherited DghMain: TDBGridEh
            Width = 736
            Height = 321
            FooterFont.Style = [fsBold, fsItalic]
            FrozenCols = 4
            ParentFont = False
            Columns = <
              item
                EditButtons = <>
                FieldName = 'PlanMainDate'
                Footers = <>
                ReadOnly = True
                Width = 79
              end
              item
                EditButtons = <>
                FieldName = 'DeviNumb'
                Footers = <>
                ReadOnly = True
                Width = 118
              end
              item
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
                ReadOnly = True
              end
              item
                EditButtons = <>
                FieldName = 'DEPT_NAME'
                Footers = <>
                ReadOnly = True
                Width = 98
              end
              item
                EditButtons = <>
                FieldName = 'FASSET_NAME'
                Footers = <>
                ReadOnly = True
              end
              item
                EditButtons = <>
                FieldName = 'MainExecStat'
                Footers = <>
                ReadOnly = True
                Width = 43
              end
              item
                EditButtons = <>
                FieldName = 'Impact'
                Footers = <>
                Visible = False
                Width = 55
              end
              item
                EditButtons = <>
                FieldName = 'equipment_grade'
                Footers = <>
                ReadOnly = True
                Width = 57
              end
              item
                EditButtons = <>
                FieldName = 'Location'
                Footers = <>
                ReadOnly = True
                Width = 85
              end
              item
                EditButtons = <>
                FieldName = 'DeviType'
                Footers = <>
                ReadOnly = True
              end
              item
                EditButtons = <>
                FieldName = 'MainCycl'
                Footers = <>
                ReadOnly = True
              end
              item
                EditButtons = <>
                FieldName = 'd40_Location'
                Footers = <>
                Width = 82
              end
              item
                EditButtons = <>
                FieldName = 'StarMainTime'
                Footers = <>
                ReadOnly = True
              end
              item
                EditButtons = <>
                FieldName = 'ActuCompTime'
                Footers = <>
                ReadOnly = True
              end
              item
                EditButtons = <>
                FieldName = 'TimeCons'
                Footers = <>
                ReadOnly = True
              end
              item
                EditButtons = <>
                FieldName = 'StdTimeCons'
                Footer.Value = '600'
                Footers = <>
                ReadOnly = True
                Width = 78
              end
              item
                EditButtons = <>
                FieldName = 'Accomplish'
                Footer.DisplayFormat = '0.00%'
                Footers = <>
                ReadOnly = True
              end
              item
                EditButtons = <>
                FieldName = 'MainImpl'
                Footers = <>
                ReadOnly = True
                Width = 94
              end
              item
                EditButtons = <>
                FieldName = 'User_Full_Name'
                Footers = <>
                ReadOnly = True
                Width = 84
              end
              item
                EditButtons = <>
                FieldName = 'Remarks'
                Footers = <>
                ReadOnly = True
                Width = 300
              end>
          end
        end
        inherited cxTabSheetMain2: TcxTabSheet
          object Label2: TLabel
            Left = 15
            Top = 7
            Width = 72
            Height = 12
            Caption = #35745#21010#20445#20859#26102#38388
            FocusControl = DBEdit1
          end
          object Label3: TLabel
            Left = 15
            Top = 44
            Width = 48
            Height = 12
            Caption = #35774#22791#32534#21495
            FocusControl = DBEdit2
          end
          object Label4: TLabel
            Left = 15
            Top = 81
            Width = 24
            Height = 12
            Caption = #37096#38376
            FocusControl = DBEdit3
          end
          object Label5: TLabel
            Left = 15
            Top = 118
            Width = 48
            Height = 12
            Caption = #35774#22791#21517#31216
            FocusControl = DBEdit4
          end
          object Label6: TLabel
            Left = 15
            Top = 155
            Width = 24
            Height = 12
            Caption = #24037#21378
            FocusControl = DBEdit5
          end
          object Label7: TLabel
            Left = 15
            Top = 192
            Width = 48
            Height = 12
            Caption = #24433#21709#31243#24230
            FocusControl = DBEdit6
          end
          object Label8: TLabel
            Left = 216
            Top = 7
            Width = 48
            Height = 12
            Caption = #35774#22791#31561#32423
            FocusControl = DBEdit7
          end
          object Label9: TLabel
            Left = 216
            Top = 44
            Width = 48
            Height = 12
            Caption = #20855#20307#20301#32622
            FocusControl = DBEdit8
          end
          object Label10: TLabel
            Left = 216
            Top = 81
            Width = 48
            Height = 12
            Caption = #20445#20859#31867#22411
            FocusControl = DBEdit9
          end
          object Label11: TLabel
            Left = 216
            Top = 118
            Width = 48
            Height = 12
            Caption = #20445#20859#21608#26399
            FocusControl = DBEdit10
          end
          object Label12: TLabel
            Left = 216
            Top = 155
            Width = 24
            Height = 12
            Caption = #29366#24577
            FocusControl = DBEdit11
          end
          object Label13: TLabel
            Left = 420
            Top = 7
            Width = 72
            Height = 12
            Caption = #24320#22987#20445#20859#26102#38388
            FocusControl = DBEdit12
          end
          object Label14: TLabel
            Left = 419
            Top = 44
            Width = 72
            Height = 12
            Caption = #23454#38469#23436#25104#26102#38388
            FocusControl = DBEdit13
          end
          object Label15: TLabel
            Left = 419
            Top = 81
            Width = 72
            Height = 12
            Caption = #20445#20859#28040#32791#26102#38388
            FocusControl = DBEdit14
          end
          object Label16: TLabel
            Left = 419
            Top = 118
            Width = 72
            Height = 12
            Caption = #26631#20934#28040#32791#26102#38388
            FocusControl = edt_StdTimeCons
          end
          object Label17: TLabel
            Left = 419
            Top = 192
            Width = 36
            Height = 12
            Caption = #20445#20859#20154
            FocusControl = edt_MainImpl
          end
          object Label18: TLabel
            Left = 626
            Top = 7
            Width = 36
            Height = 12
            Caption = #39564#25910#20154
            FocusControl = DBEdit17
          end
          object Label19: TLabel
            Left = 626
            Top = 44
            Width = 72
            Height = 12
            Caption = #20445#20859#35760#24405#25551#36848
          end
          object Label20: TLabel
            Left = 419
            Top = 155
            Width = 36
            Height = 12
            Caption = #36798#25104#29575
            FocusControl = DBEdit15
          end
          object Label21: TLabel
            Left = 216
            Top = 192
            Width = 48
            Height = 12
            Caption = #36131#20219#23567#32452
            FocusControl = DBEdit16
          end
          object DBEdit1: TDBEdit
            Left = 15
            Top = 22
            Width = 184
            Height = 20
            Color = clInactiveCaptionText
            DataField = 'PlanMainDate'
            DataSource = dsMain
            ReadOnly = True
            TabOrder = 0
          end
          object DBEdit2: TDBEdit
            Left = 15
            Top = 59
            Width = 184
            Height = 20
            Color = clInactiveCaptionText
            DataField = 'DeviNumb'
            DataSource = dsMain
            ReadOnly = True
            TabOrder = 1
          end
          object DBEdit3: TDBEdit
            Left = 15
            Top = 96
            Width = 184
            Height = 20
            Color = clInactiveCaptionText
            DataField = 'DEPT_NAME'
            DataSource = dsMain
            ReadOnly = True
            TabOrder = 2
          end
          object DBEdit4: TDBEdit
            Left = 15
            Top = 133
            Width = 184
            Height = 20
            Color = clInactiveCaptionText
            DataField = 'FASSET_NAME'
            DataSource = dsMain
            ReadOnly = True
            TabOrder = 3
          end
          object DBEdit5: TDBEdit
            Left = 15
            Top = 170
            Width = 123
            Height = 20
            Color = clInactiveCaptionText
            DataField = 'ABBR_NAME'
            DataSource = dsMain
            ReadOnly = True
            TabOrder = 4
          end
          object DBEdit6: TDBEdit
            Left = 15
            Top = 207
            Width = 99
            Height = 20
            Color = clInactiveCaptionText
            DataField = 'Impact'
            DataSource = dsMain
            ReadOnly = True
            TabOrder = 5
          end
          object DBEdit7: TDBEdit
            Left = 216
            Top = 22
            Width = 185
            Height = 20
            Color = clInactiveCaptionText
            DataField = 'equipment_grade'
            DataSource = dsMain
            ReadOnly = True
            TabOrder = 6
          end
          object DBEdit8: TDBEdit
            Left = 216
            Top = 59
            Width = 185
            Height = 20
            Color = clInactiveCaptionText
            DataField = 'LOCATION'
            DataSource = dsMain
            ReadOnly = True
            TabOrder = 7
          end
          object DBEdit9: TDBEdit
            Left = 216
            Top = 96
            Width = 124
            Height = 20
            Color = clInactiveCaptionText
            DataField = 'DeviType'
            DataSource = dsMain
            ReadOnly = True
            TabOrder = 8
          end
          object DBEdit10: TDBEdit
            Left = 216
            Top = 133
            Width = 124
            Height = 20
            Color = clInactiveCaptionText
            DataField = 'MainCycl'
            DataSource = dsMain
            ReadOnly = True
            TabOrder = 9
          end
          object DBEdit11: TDBEdit
            Left = 216
            Top = 170
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
            TabOrder = 10
          end
          object DBEdit12: TDBEdit
            Left = 420
            Top = 22
            Width = 185
            Height = 20
            Color = clInactiveCaptionText
            DataField = 'StarMainTime'
            DataSource = dsMain
            ReadOnly = True
            TabOrder = 11
          end
          object DBEdit13: TDBEdit
            Left = 419
            Top = 59
            Width = 185
            Height = 20
            Color = clInactiveCaptionText
            DataField = 'ActuCompTime'
            DataSource = dsMain
            ReadOnly = True
            TabOrder = 12
          end
          object DBEdit14: TDBEdit
            Left = 419
            Top = 96
            Width = 100
            Height = 20
            Color = clInactiveCaptionText
            DataField = 'TimeCons'
            DataSource = dsMain
            ReadOnly = True
            TabOrder = 13
          end
          object edt_StdTimeCons: TDBEdit
            Left = 419
            Top = 133
            Width = 100
            Height = 20
            Color = clInactiveCaptionText
            DataField = 'StdTimeCons'
            DataSource = dsMain
            ReadOnly = True
            TabOrder = 14
          end
          object edt_MainImpl: TDBEdit
            Left = 419
            Top = 207
            Width = 185
            Height = 20
            Color = clInactiveCaptionText
            DataField = 'MainImpl'
            DataSource = dsMain
            ReadOnly = True
            TabOrder = 15
          end
          object DBEdit17: TDBEdit
            Left = 626
            Top = 22
            Width = 184
            Height = 20
            Color = clInactiveCaptionText
            DataField = 'User_Full_Name'
            DataSource = dsMain
            ReadOnly = True
            TabOrder = 16
          end
          object mo_Remarks: TDBMemo
            Left = 626
            Top = 59
            Width = 184
            Height = 82
            Color = clInactiveCaptionText
            DataField = 'Remarks'
            DataSource = dsMain
            TabOrder = 17
          end
          object DBEdit15: TDBEdit
            Left = 419
            Top = 170
            Width = 125
            Height = 20
            Color = clInactiveCaptionText
            DataField = 'Accomplish'
            DataSource = dsMain
            ReadOnly = True
            TabOrder = 18
          end
          object DBEdit16: TDBEdit
            Left = 216
            Top = 207
            Width = 185
            Height = 20
            Color = clInactiveCaptionText
            DataField = 'd40_Location'
            DataSource = dsMain
            ReadOnly = True
            TabOrder = 19
          end
        end
      end
      inherited Panel6: TPanel
        Height = 344
      end
    end
    inherited Panel3: TPanel
      Top = 356
      Width = 861
      Height = 222
      Align = alBottom
      inherited Panel5: TPanel
        Top = 186
        Width = 861
        Height = 36
        object Label1: TLabel
          Left = 718
          Top = 13
          Width = 48
          Height = 12
          Caption = #35774#22791#32534#21495
        end
        object GroupBox2: TGroupBox
          Left = 0
          Top = 0
          Width = 171
          Height = 36
          Align = alLeft
          Caption = #31579#36873#24037#21378
          TabOrder = 0
          object ComboBox1: TComboBox
            Left = 30
            Top = 11
            Width = 134
            Height = 20
            Style = csDropDownList
            ItemHeight = 12
            TabOrder = 0
          end
        end
        object RadioGroup2: TRadioGroup
          Left = 171
          Top = 0
          Width = 180
          Height = 36
          Align = alLeft
          Caption = #31579#36873#26085#26399
          Columns = 4
          ItemIndex = 3
          Items.Strings = (
            #20170#22825
            #26126#22825
            #21518#22825
            #20840#37096)
          TabOrder = 1
          OnClick = RadioGroup2Click
        end
        object GroupBox1: TGroupBox
          Left = 351
          Top = 0
          Width = 367
          Height = 36
          Align = alLeft
          Caption = #31579#36873#29366#24577
          TabOrder = 2
          object SpeedButton1: TSpeedButton
            Left = 342
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
            OnClick = SpeedButton1Click
          end
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
        object edit1: TEdit
          Left = 768
          Top = 9
          Width = 126
          Height = 20
          TabOrder = 3
          OnChange = edit1Change
        end
      end
      inherited Panel7: TPanel
        Width = 861
        Height = 186
        inherited Panel8: TPanel
          Left = 741
          Height = 186
          inherited RzToolbar3: TRzToolbar
            Height = 186
            RowHeight = 26
            ToolbarControls = (
              btn2
              btn_New
              btn_Delete
              Button11
              Button12)
            inherited btn2: TButton
              Top = 3
            end
            object btn_New: TButton
              Left = 4
              Top = 30
              Width = 111
              Height = 23
              Caption = #26032#22686
              Enabled = False
              TabOrder = 1
              OnClick = btn_NewClick
            end
            object btn_Delete: TButton
              Left = 4
              Top = 56
              Width = 111
              Height = 23
              Caption = #21024#38500
              Enabled = False
              TabOrder = 2
              OnClick = btn_DeleteClick
            end
            object Button11: TButton
              Left = 4
              Top = 82
              Width = 111
              Height = 23
              Caption = #20010#20154#32467#26463
              Enabled = False
              TabOrder = 3
              OnClick = Button11Click
            end
            object Button12: TButton
              Left = 4
              Top = 108
              Width = 111
              Height = 23
              Caption = #26242#20572#35760#24405
              TabOrder = 4
              Visible = False
              OnClick = Button12Click
            end
          end
        end
        inherited Panel9: TPanel
          Width = 741
          Height = 186
          inherited Panel10: TPanel
            Top = 181
            Width = 741
          end
          inherited Panel11: TPanel
            Height = 181
          end
          inherited cxPageControl2: TcxPageControl
            Width = 736
            Height = 181
            ClientRectBottom = 181
            ClientRectRight = 736
            inherited cxTabSheetChild1: TcxTabSheet
              inherited ToolBar1: TToolBar
                Height = 158
              end
              inherited dghChild: TDBGridEh
                Width = 736
                Height = 158
                Columns = <
                  item
                    EditButtons = <>
                    FieldName = 'WorkDate'
                    Footers = <>
                    ReadOnly = True
                  end
                  item
                    EditButtons = <>
                    FieldName = 'MainexecStat'
                    Footers = <>
                    ReadOnly = True
                  end
                  item
                    EditButtons = <>
                    FieldName = 'EMPL_CODE'
                    Footers = <>
                    ReadOnly = True
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
                  end
                  item
                    EditButtons = <>
                    FieldName = 'EndTime'
                    Footers = <>
                    ReadOnly = True
                  end
                  item
                    EditButtons = <>
                    FieldName = 'TimeRest'
                    Footers = <>
                    ReadOnly = True
                    Width = 83
                  end
                  item
                    EditButtons = <>
                    FieldName = 'WorkTime'
                    Footers = <>
                    ReadOnly = True
                    Width = 72
                  end
                  item
                    EditButtons = <>
                    FieldName = 'DayShift'
                    Footers = <>
                  end
                  item
                    EditButtons = <>
                    FieldName = 'Remark'
                    Footers = <>
                    ReadOnly = True
                    Width = 200
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
      'select d17.FASSET_NAME,d32.MainExecStat,d73.User_Full_Name,'#39#23450#26399#20445#20859 +
      #39' as Impact,'#13#10'd34.DEPT_NAME,d15.ABBR_NAME,d17.equipment_grade,d1' +
      '7.LOCATION,d40.Location as d40_Location,'#13#10'd31.* '#13#10'from data0831 ' +
      'd31'#13#10'join data0417 d17 on d31.DeviNumb=d17.FASSET_CODE'#13#10'join dat' +
      'a0034 d34 on d17.DEPT_PTR=d34.rkey'#13#10'join data0015 d15 on d17.war' +
      'ehouse_ptr=d15.rkey'#13#10'join data0832 d32 on d31.RKEY832=d32.rkey'#13#10 +
      'left join data0073 d73 on d31.MainAcce_UserPtr=d73.rkey'#13#10'left jo' +
      'in data0840 d40 on d17.D840_ptr=d40.rkey'
    object dtMainFASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      ProviderFlags = []
      Size = 30
    end
    object dtMainMainExecStat: TStringField
      FieldName = 'MainExecStat'
      ProviderFlags = []
      Size = 10
    end
    object dtMainUser_Full_Name: TStringField
      FieldName = 'User_Full_Name'
      ProviderFlags = []
      Size = 30
    end
    object dtMainImpact: TStringField
      FieldName = 'Impact'
      ProviderFlags = []
      ReadOnly = True
      Size = 8
    end
    object dtMainDEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      ProviderFlags = []
      Size = 30
    end
    object dtMainABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      ProviderFlags = []
      Size = 10
    end
    object dtMainequipment_grade: TStringField
      FieldName = 'equipment_grade'
      ProviderFlags = []
      Size = 50
    end
    object dtMainLOCATION: TStringField
      FieldName = 'LOCATION'
      ProviderFlags = []
      Size = 40
    end
    object dtMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object dtMainPlanMainDate: TDateTimeField
      FieldName = 'PlanMainDate'
      ProviderFlags = [pfInUpdate]
    end
    object dtMainDeviNumb: TStringField
      FieldName = 'DeviNumb'
    end
    object dtMainDeviType: TStringField
      FieldName = 'DeviType'
      Size = 10
    end
    object dtMainMainCycl: TStringField
      FieldName = 'MainCycl'
      Size = 10
    end
    object dtMainRKEY832: TIntegerField
      FieldName = 'RKEY832'
    end
    object dtMainStarMainTime: TDateTimeField
      FieldName = 'StarMainTime'
      ProviderFlags = [pfInUpdate]
    end
    object dtMainActuCompTime: TDateTimeField
      FieldName = 'ActuCompTime'
      ProviderFlags = [pfInUpdate]
    end
    object dtMainMainImpl: TWideStringField
      FieldName = 'MainImpl'
      ProviderFlags = [pfInUpdate]
    end
    object dtMainRemarks: TStringField
      FieldName = 'Remarks'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object dtMainTimeCons: TBCDField
      FieldName = 'TimeCons'
      ProviderFlags = [pfInUpdate]
      Precision = 10
      Size = 2
    end
    object dtMainMainAcce_UserPtr: TIntegerField
      FieldName = 'MainAcce_UserPtr'
      ProviderFlags = [pfInUpdate]
    end
    object dtMainStdTimeCons: TBCDField
      FieldName = 'StdTimeCons'
      ProviderFlags = [pfInUpdate]
      Precision = 9
      Size = 2
    end
    object dtMaind40_Location: TStringField
      FieldName = 'd40_Location'
      ProviderFlags = []
    end
  end
  inherited cdsMain: Tcds
    CommandText = 
      'select d17.FASSET_NAME,d32.MainExecStat,d73.User_Full_Name,'#39#23450#26399#20445#20859 +
      #39' as Impact,'#13#10'd34.DEPT_NAME,d15.ABBR_NAME,d17.equipment_grade,d1' +
      '7.LOCATION,d40.Location as d40_Location,'#13#10'd31.* '#13#10'from data0831 ' +
      'd31'#13#10'join data0417 d17 on d31.DeviNumb=d17.FASSET_CODE'#13#10'join dat' +
      'a0034 d34 on d17.DEPT_PTR=d34.rkey'#13#10'join data0015 d15 on d17.war' +
      'ehouse_ptr=d15.rkey'#13#10'join data0832 d32 on d31.RKEY832=d32.rkey'#13#10 +
      'left join data0073 d73 on d31.MainAcce_UserPtr=d73.rkey'#13#10'left jo' +
      'in data0840 d40 on d17.D840_ptr=d40.rkey'
    FieldDefs = <
      item
        Name = 'FASSET_NAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'MainExecStat'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'User_Full_Name'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Impact'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 8
      end
      item
        Name = 'DEPT_NAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ABBR_NAME'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'equipment_grade'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'LOCATION'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'rkey'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'PlanMainDate'
        DataType = ftDateTime
      end
      item
        Name = 'DeviNumb'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DeviType'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'MainCycl'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RKEY832'
        DataType = ftInteger
      end
      item
        Name = 'StarMainTime'
        DataType = ftDateTime
      end
      item
        Name = 'ActuCompTime'
        DataType = ftDateTime
      end
      item
        Name = 'MainImpl'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'Remarks'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'TimeCons'
        DataType = ftBCD
        Precision = 10
        Size = 2
      end
      item
        Name = 'MainAcce_UserPtr'
        DataType = ftInteger
      end
      item
        Name = 'StdTimeCons'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'd40_Location'
        DataType = ftString
        Size = 20
      end>
    StoreDefs = True
    OnCalcFields = cdsMainCalcFields
    OnFilterRecord = cdsMainFilterRecord
    F_AutoIncrField = 'rkey'
    F_TableName = 'data0831'
    F_SQLSelectFrom = 
      'select d17.FASSET_NAME,d32.MainExecStat,d73.User_Full_Name,'#39#23450#26399#20445#20859 +
      #39' as Impact,'#13#10'd34.DEPT_NAME,d15.ABBR_NAME,d17.equipment_grade,d1' +
      '7.LOCATION,d40.Location as d40_Location,'#13#10'd31.* '#13#10'from data0831 ' +
      'd31'#13#10'join data0417 d17 on d31.DeviNumb=d17.FASSET_CODE'#13#10'join dat' +
      'a0034 d34 on d17.DEPT_PTR=d34.rkey'#13#10'join data0015 d15 on d17.war' +
      'ehouse_ptr=d15.rkey'#13#10'join data0832 d32 on d31.RKEY832=d32.rkey'#13#10 +
      'left join data0073 d73 on d31.MainAcce_UserPtr=d73.rkey'#13#10'left jo' +
      'in data0840 d40 on d17.D840_ptr=d40.rkey'
    F_SQLOrderBy = 'order by PlanMainDate,DeviNumb,MainCycl'
    object cdsMainPlanMainDate: TDateTimeField
      DisplayLabel = #35745#21010#20445#20859#26102#38388
      FieldName = 'PlanMainDate'
    end
    object cdsMainDeviNumb: TStringField
      DisplayLabel = #35774#22791#32534#21495
      FieldName = 'DeviNumb'
    end
    object cdsMainDEPT_NAME: TStringField
      DisplayLabel = #37096#38376
      FieldName = 'DEPT_NAME'
      ProviderFlags = []
      Size = 30
    end
    object cdsMainFASSET_NAME: TStringField
      DisplayLabel = #35774#22791#21517#31216
      FieldName = 'FASSET_NAME'
      ProviderFlags = []
      Size = 30
    end
    object cdsMainABBR_NAME: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'ABBR_NAME'
      ProviderFlags = []
      Size = 10
    end
    object cdsMainImpact: TStringField
      DisplayLabel = #24433#21709#31243#24230
      FieldName = 'Impact'
      ProviderFlags = []
      ReadOnly = True
      Size = 8
    end
    object cdsMainequipment_grade: TStringField
      DisplayLabel = #35774#22791#31561#32423
      FieldName = 'equipment_grade'
      ProviderFlags = []
      Size = 50
    end
    object cdsMainLOCATION: TStringField
      DisplayLabel = #20855#20307#20301#32622
      FieldName = 'Location'
      ProviderFlags = []
      Size = 40
    end
    object cdsMainDeviType: TStringField
      DisplayLabel = #20445#20859#31867#22411
      FieldName = 'DeviType'
      Size = 10
    end
    object cdsMainMainCycl: TStringField
      DisplayLabel = #20445#20859#21608#26399
      FieldName = 'MainCycl'
      Size = 10
    end
    object cdsMainMainExecStat: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'MainExecStat'
      ProviderFlags = []
      Size = 10
    end
    object cdsMainStarMainTime: TDateTimeField
      DisplayLabel = #24320#22987#20445#20859#26102#38388
      FieldName = 'StarMainTime'
    end
    object cdsMainActuCompTime: TDateTimeField
      DisplayLabel = #23454#38469#23436#25104#26102#38388
      FieldName = 'ActuCompTime'
    end
    object cdsMainTimeCons: TBCDField
      DisplayLabel = #20445#20859#28040#32791#26102#38388
      FieldName = 'TimeCons'
      Precision = 10
      Size = 2
    end
    object cdsMainStdTimeCons: TBCDField
      DisplayLabel = #26631#20934#28040#32791#26102#38388
      FieldName = 'StdTimeCons'
      Precision = 9
      Size = 2
    end
    object cdsMainMainImpl: TWideStringField
      DisplayLabel = #20445#20859#20154
      FieldName = 'MainImpl'
    end
    object cdsMainUser_Full_Name: TStringField
      DisplayLabel = #39564#25910#20154
      FieldName = 'User_Full_Name'
      ProviderFlags = []
      Size = 30
    end
    object cdsMainRemarks: TStringField
      DisplayLabel = #20445#20859#35760#24405#25551#36848
      FieldName = 'Remarks'
      Size = 500
    end
    object cdsMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object cdsMainRKEY832: TIntegerField
      DisplayLabel = #29366#24577
      FieldName = 'RKEY832'
      OnChange = cdsMainRKEY832Change
    end
    object cdsMainMainAcce_UserPtr: TIntegerField
      DisplayLabel = #39564#25910#20154#25351#38024
      FieldName = 'MainAcce_UserPtr'
      OnChange = cdsMainMainAcce_UserPtrChange
    end
    object cdsMainAccomplish: TFloatField
      DisplayLabel = #36798#25104#29575
      FieldKind = fkCalculated
      FieldName = 'Accomplish'
      OnGetText = cdsMainAccomplishGetText
      Calculated = True
    end
    object cdsMaind40_Location: TStringField
      DisplayLabel = #36131#20219#23567#32452
      FieldName = 'd40_Location'
    end
  end
  inherited dtRead: TADODataSet
    CursorType = ctStatic
    CommandText = 'select RKEY,DEPT_CODE,DEPT_NAME from data0034'
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
      'select Data0848.*,data0005.EMPL_CODE,data0005.EMPLOYEE_NAME,Main' +
      'execStat '#13#10'from Data0848'#13#10'left join data0005 on Data0848.[Empl_p' +
      'tr]=data0005.rkey'#13#10'join data0832 on Data0848.[Status]=data0832.r' +
      'key'
    F_AutoIncrField = 'RKEY'
    F_TableName = 'data0848'
    F_SQLSelectFrom = 
      'select Data0848.*,data0005.EMPL_CODE,data0005.EMPLOYEE_NAME,Main' +
      'execStat '#13#10'from Data0848'#13#10'left join data0005 on Data0848.[Empl_p' +
      'tr]=data0005.rkey'#13#10'join data0832 on Data0848.[Status]=data0832.r' +
      'key'
    F_Primarykey = 'rkey'
    F_Foreignkey = 'Work_ptr'
    object cdsChildrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object cdsChildWork_ptr: TIntegerField
      FieldName = 'Work_ptr'
      Visible = False
    end
    object cdsChildWorkDate: TDateTimeField
      DisplayLabel = #24037#20316#26085#26399
      FieldName = 'WorkDate'
    end
    object cdsChildBeginTime: TDateTimeField
      DisplayLabel = #24320#22987#26102#38388
      FieldName = 'BeginTime'
      OnChange = cdsChildEndTimeChange
    end
    object cdsChildEndTime: TDateTimeField
      DisplayLabel = #32467#26463#26102#38388
      FieldName = 'EndTime'
      OnChange = cdsChildEndTimeChange
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
      Visible = False
    end
    object cdsChildStatus: TIntegerField
      FieldName = 'Status'
      Visible = False
      OnChange = cdsChildStatusChange
    end
    object cdsChildWorkTime: TBCDField
      DisplayLabel = #38599#21592#24037#20316#26102#38388
      FieldName = 'WorkTime'
      Precision = 5
      Size = 2
    end
    object cdsChildRemark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Remark'
      Size = 200
    end
    object cdsChildEMPL_CODE: TStringField
      DisplayLabel = #38599#21592#20195#30721
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object cdsChildEMPLOYEE_NAME: TStringField
      DisplayLabel = #22995#21517
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object cdsChildMainexecStat: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'MainexecStat'
      Size = 10
    end
    object cdsChildDayShift: TSmallintField
      DisplayLabel = #29677#27425
      FieldName = 'DayShift'
    end
  end
  inherited MainGrid_PopupMenu: TPopupMenu
    inherited N_Relogin: TMenuItem
      Visible = True
    end
    inherited N_ResetColumns: TMenuItem
      Visible = True
    end
  end
  inherited dtChild: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'select Data0848.*,data0005.EMPL_CODE,data0005.EMPLOYEE_NAME,Main' +
      'execStat '#13#10'from Data0848'#13#10'left join data0005 on Data0848.[Empl_p' +
      'tr]=data0005.rkey'#13#10'join data0832 on Data0848.[Status]=data0832.r' +
      'key'
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
    object dtChildMainexecStat: TStringField
      FieldName = 'MainexecStat'
      ProviderFlags = []
      Size = 10
    end
    object dtChildDayShift: TWordField
      FieldName = 'DayShift'
    end
  end
  inherited dlgOpen1: TOpenDialog
    Left = 924
    Top = 100
  end
  object cds0015: TClientDataSet
    Aggregates = <>
    CommandText = 'select RKEY,WAREHOUSE_CODE,ABBR_NAME from data0015'#13#10
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 352
    Top = 280
    object cds0015RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object cds0015WAREHOUSE_CODE: TStringField
      DisplayLabel = #24037#21378#20195#30721
      DisplayWidth = 10
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object cds0015ABBR_NAME: TStringField
      DisplayLabel = #24037#21378
      DisplayWidth = 15
      FieldName = 'ABBR_NAME'
      Size = 10
    end
  end
  object PopupMenuInButton4: TPopupMenu
    Left = 704
    Top = 311
    object N_Acceptance: TMenuItem
      Caption = #39564#25910#36890#36807
      OnClick = N_AcceptanceClick
    end
    object N_OtherAcceptance: TMenuItem
      Caption = #20197#20854#20182#29992#25143#39564#25910
      OnClick = N_OtherAcceptanceClick
    end
  end
  object cmdUpdate: TADOCommand
    CommandText = 
      'declare @LastDate datetime  '#13#10'  select @LastDate=DateAdd(day,Cyc' +
      'l_Duration,:v1PlanMainDate)from DATA0816 WHERE MainCycl=:v2MainC' +
      'ycl                 '#13#10'    if not exists(select * from data0831 w' +
      'here [PlanMainDate]=@LastDate '#13#10'           and [DeviNumb]=:v3Dev' +
      'iNumb and [MainCycl]=:v4MainCycl)                         '#13#10'    ' +
      'insert into data0831 (PlanMainDate,DeviNumb,DeviType,MainCycl,RK' +
      'EY832,StdTimeCons) '#13#10'    select @LastDate,Fasset_Code,data0417.D' +
      'eviType,data0812.MainCycl,1,'#13#10'    StdTimeCons =(select top 1 Std' +
      'TimeCons from [data0847] where [D417_ptr]=data0417.rkey and data' +
      '0812.MainCycl= [data0847].MainCycl )'#13#10'        from data0417 join' +
      ' data0812 on data0417.DeviType=data0812.DeviType    '#13#10'        an' +
      'd Fasset_Code=:v5DeviNumb and data0812.MainCycl=:v7MainCycl'
    Connection = DM.ADOConnection1
    Parameters = <
      item
        Name = 'v1PlanMainDate'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'v2MainCycl'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'v3DeviNumb'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'v4MainCycl'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'v5DeviNumb'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'v7MainCycl'
        DataType = ftWideString
        Size = -1
        Value = Null
      end>
    Left = 278
    Top = 285
  end
  object cds832: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from data0832 order by rkey'
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 416
    Top = 280
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
  object cds0073: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select rkey,User_Full_Name,EMPLOYEE_PTR,USER_LOGIN_NAME  from da' +
      'ta0073'#13#10
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 480
    Top = 280
    object cds0073rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object cds0073User_Full_Name: TStringField
      FieldName = 'User_Full_Name'
      Size = 30
    end
    object cds0073EMPLOYEE_PTR: TIntegerField
      FieldName = 'EMPLOYEE_PTR'
      Visible = False
    end
    object cds0073USER_LOGIN_NAME: TStringField
      FieldName = 'USER_LOGIN_NAME'
      Visible = False
      Size = 15
    end
  end
  object cds0005: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select RKEY,EMPL_CODE,EMPLOYEE_NAME from data0005'#13#10'where ACTIVE_' +
      'FLAG='#39'Y'#39
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 544
    Top = 280
    object cds0005RKEY: TAutoIncField
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
  object cmdUpdate1: TADOCommand
    CommandText = 
      'declare @LastDate datetime  '#13#10'  select @LastDate=DateAdd(day,Cyc' +
      'l_Duration,:v1PlanMainDate)from DATA0816 WHERE MainCycl=:v2MainC' +
      'ycl                 '#13#10'    if not exists(select * from data0831 w' +
      'here [PlanMainDate]=@LastDate '#13#10'           and [DeviNumb]=:v3Dev' +
      'iNumb and [MainCycl]=:v4MainCycl)                         '#13#10'    ' +
      'insert into data0831 (PlanMainDate,DeviNumb,DeviType,MainCycl,RK' +
      'EY832,StdTimeCons) '#13#10'    select @LastDate,Fasset_Code,data0417.D' +
      'eviType,data0812.MainCycl,1,'#13#10'    StdTimeCons =(select StdTimeCo' +
      'ns from [data0847] where [D417_ptr]=data0417.rkey and data0812.M' +
      'ainCycl= [data0847].MainCycl )'#13#10'        from data0417 join data0' +
      '812 on data0417.DeviType=data0812.DeviType    '#13#10'        and Fass' +
      'et_Code=:v5DeviNumb and data0812.MainCycl=:v7MainCycl'
    Connection = DM.ADOConnection1
    Parameters = <
      item
        Name = 'v1PlanMainDate'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'v2MainCycl'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'v3DeviNumb'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'v4MainCycl'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'v5DeviNumb'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'v7MainCycl'
        DataType = ftWideString
        Size = -1
        Value = Null
      end>
    Left = 278
    Top = 357
  end
  object PopupMenuInButton3: TPopupMenu
    Left = 704
    Top = 159
    object N_StartMain: TMenuItem
      Caption = #24320#22987#20445#20859
      OnClick = N_StartMainClick
    end
    object N_OtherStartMain: TMenuItem
      Caption = #20197#20854#20182#29992#25143#20445#20859
      OnClick = N_OtherStartMainClick
    end
  end
  object PopupMenuInButton10: TPopupMenu
    Left = 704
    Top = 250
    object N_EndPause: TMenuItem
      Caption = #26242#20572#32467#26463
      OnClick = N_EndPauseClick
    end
    object N_OtherEndPause: TMenuItem
      Caption = #20197#20854#20182#29992#25143#32467#26463
      OnClick = N_OtherEndPauseClick
    end
  end
  object cds0417: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select data0417.rkey,rtrim(FASSET_CODE)FASSET_CODE,FASSET_NAME,F' +
      'ASSET_DESC,data0034.DEPT_CODE,data0034.DEPT_NAME'#13#10'from data0417 ' +
      'join data0034 on data0417.DEPT_PTR=data0034.rkey'#13#10'where data0417' +
      '.active_flag not in (5,6)'#13#10
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 600
    Top = 280
    object cds0417FASSET_CODE: TStringField
      DisplayLabel = #35774#22791#20195#30721
      DisplayWidth = 20
      FieldName = 'FASSET_CODE'
    end
    object cds0417FASSET_NAME: TStringField
      DisplayLabel = #35774#22791#21517#31216
      DisplayWidth = 30
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object cds0417FASSET_DESC: TStringField
      DisplayLabel = #35774#22791#25551#36848
      FieldName = 'FASSET_DESC'
      Visible = False
      Size = 40
    end
    object cds0417rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object cds0417DEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object cds0417DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      DisplayWidth = 20
      FieldName = 'DEPT_NAME'
      Size = 30
    end
  end
  object cds840: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from data0840'
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 664
    Top = 280
    object cds840rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object cds840Location: TStringField
      DisplayLabel = #36131#20219#23567#32452
      FieldName = 'Location'
    end
  end
  object cds0034: TClientDataSet
    Aggregates = <>
    CommandText = 'select RKEY,DEPT_CODE,DEPT_NAME from data0034'
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 448
    Top = 208
    object cds0034RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
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
    Left = 352
    Top = 348
  end
end
