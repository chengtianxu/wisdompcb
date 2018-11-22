inherited frm_Picking: Tfrm_Picking
  Left = 298
  Top = 172
  Width = 867
  Height = 610
  Caption = 'frm_Picking'
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 12
  inherited StatusBar1: TStatusBar
    Top = 557
    Width = 859
  end
  inherited RzToolbar1: TRzToolbar
    Width = 859
    ToolbarControls = (
      tblAdd
      tblEdit
      tblSave
      tblCancel
      tblDelete
      tblRefresh
      tblfind
      tblExport
      tblFilter
      tblCancelFilter
      tblPrint
      tblDesign
      tblFirst
      tblPrior
      tblNext
      tblLast)
    inherited tblPrint: TRzToolButton
      Visible = True
    end
  end
  inherited Panel_Left: TPanel
    Height = 516
  end
  inherited Panel_Main: TPanel
    Width = 847
    Height = 516
    inherited Splitter1: TSplitter
      Width = 847
    end
    inherited Panel_Below: TPanel
      Width = 847
      Height = 208
      inherited Panel_Bottom: TPanel
        Top = 173
        Width = 847
        Height = 35
        object BtFind: TSpeedButton
          Left = 602
          Top = 9
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
          Width = 283
          Height = 35
          Align = alLeft
          TabOrder = 0
          object Label12: TLabel
            Left = 8
            Top = 15
            Width = 48
            Height = 12
            Caption = #30003#35831#26085#26399
          end
          object Label13: TLabel
            Left = 162
            Top = 15
            Width = 12
            Height = 12
            Caption = #21040
          end
          object dteBegin: TDateTimePicker
            Left = 62
            Top = 10
            Width = 88
            Height = 21
            Date = 41449.389854236120000000
            Time = 41449.389854236120000000
            TabOrder = 0
            OnChange = dteEndChange
          end
          object dteEnd: TDateTimePicker
            Left = 189
            Top = 10
            Width = 89
            Height = 21
            Date = 41449.393683449070000000
            Time = 41449.393683449070000000
            TabOrder = 1
            OnChange = dteEndChange
          end
        end
        object GroupBox2: TGroupBox
          Left = 283
          Top = 0
          Width = 312
          Height = 35
          Align = alLeft
          Caption = #29366#24577
          TabOrder = 1
          object CheckBox1: TCheckBox
            Left = 7
            Top = 13
            Width = 56
            Height = 17
            Caption = #24453#25552#20132
            Checked = True
            State = cbChecked
            TabOrder = 0
            OnClick = CheckBox1Click
          end
          object CheckBox3: TCheckBox
            Left = 129
            Top = 13
            Width = 57
            Height = 17
            Caption = #24050#23457#26680
            Checked = True
            State = cbChecked
            TabOrder = 2
            OnClick = CheckBox1Click
          end
          object CheckBox5: TCheckBox
            Left = 252
            Top = 13
            Width = 57
            Height = 17
            Caption = #24050#21457#26009
            TabOrder = 4
            OnClick = CheckBox1Click
          end
          object CheckBox2: TCheckBox
            Left = 64
            Top = 13
            Width = 57
            Height = 17
            Caption = #24453#23457#26680
            Checked = True
            State = cbChecked
            TabOrder = 1
            OnClick = CheckBox1Click
          end
          object CheckBox4: TCheckBox
            Left = 190
            Top = 12
            Width = 56
            Height = 17
            Caption = #34987#36864#22238
            Checked = True
            State = cbChecked
            TabOrder = 3
            OnClick = CheckBox1Click
          end
        end
      end
      inherited Panel9: TPanel
        Width = 847
        Height = 168
        inherited Panel10: TPanel
          Left = 727
          Height = 168
          inherited RzToolbar_right_2: TRzToolbar
            Height = 168
            ToolbarControls = (
              Button1)
          end
          inherited Panel3: TPanel
            Height = 168
          end
        end
        inherited PageControl_D: TPageControl
          Width = 727
          Height = 168
          inherited TabSheet3: TTabSheet
            inherited dghChild: TDBGridEh
              Width = 719
              Height = 141
              Columns = <
                item
                  AlwaysShowEditButton = True
                  ButtonStyle = cbsDropDown
                  EditButtons = <>
                  FieldName = 'INV_PART_NUMBER'
                  Footers = <>
                  ReadOnly = True
                  Width = 156
                  OnEditButtonClick = dghChildColumns0EditButtonClick
                end
                item
                  EditButtons = <>
                  FieldName = 'INV_PART_DESCRIPTION'
                  Footers = <>
                  ReadOnly = True
                  Width = 296
                end
                item
                  EditButtons = <>
                  FieldName = 'unit_name'
                  Footers = <>
                  ReadOnly = True
                  Width = 56
                end
                item
                  EditButtons = <>
                  FieldName = 'QUAN_BOM'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'QUAN_ISSUED'
                  Footers = <>
                  ReadOnly = True
                end
                item
                  EditButtons = <>
                  FieldName = 'VENDOR'
                  Footers = <>
                  ReadOnly = True
                end
                item
                  EditButtons = <>
                  FieldName = 'PRINTIT'
                  Footers = <>
                  ReadOnly = True
                  Width = 51
                end>
            end
          end
        end
      end
      inherited Panel12: TPanel
        Width = 847
      end
    end
    inherited Panel_Above: TPanel
      Width = 847
      inherited Panel5: TPanel
        Width = 847
        inherited Panel7: TPanel
          Left = 727
          inherited RzToolbar_right_1: TRzToolbar
            ToolbarControls = (
              btn1
              bt_Expand
              bt_Reject
              Button5
              Button3)
            object bt_Expand: TButton
              Left = 4
              Top = 36
              Width = 112
              Height = 25
              Caption = #25552#20132
              TabOrder = 1
              OnClick = bt_ExpandClick
            end
            object bt_Reject: TButton
              Left = 4
              Top = 67
              Width = 112
              Height = 25
              Caption = #21462#28040#25552#20132
              TabOrder = 2
              OnClick = bt_RejectClick
            end
            object Button5: TButton
              Left = 4
              Top = 99
              Width = 111
              Height = 23
              Caption = #23457#26680#20449#24687
              TabOrder = 3
              OnClick = Button5Click
            end
            object Button3: TButton
              Left = 4
              Top = 130
              Width = 111
              Height = 23
              Caption = #25968#25454#20998#26512
              TabOrder = 4
              OnClick = Button3Click
            end
          end
        end
        inherited PageControl_M: TPageControl
          Width = 727
          inherited TabSheet1: TTabSheet
            inherited DghMain: TDBGridEh
              Width = 719
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'Prted'
                  Footers = <>
                  ReadOnly = True
                  Width = 43
                end
                item
                  EditButtons = <>
                  FieldName = 'number'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'abbr_name'
                  Footers = <>
                  ReadOnly = True
                  Width = 80
                end
                item
                  EditButtons = <>
                  FieldName = 'DATE'
                  Footers = <>
                  ReadOnly = True
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
                  Width = 105
                end
                item
                  EditButtons = <>
                  FieldName = 'ttype'
                  Footers = <>
                  ReadOnly = True
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'status_c'
                  Footers = <>
                  ReadOnly = True
                  Width = 60
                end
                item
                  EditButtons = <>
                  FieldName = 'Location'
                  Footers = <>
                  Width = 92
                end
                item
                  EditButtons = <>
                  FieldName = 'CODE'
                  Footers = <>
                  Width = 80
                end
                item
                  EditButtons = <>
                  FieldName = 'PURCHASE_APPROV_DESC'
                  Footers = <>
                  ReadOnly = True
                  Width = 103
                end
                item
                  EditButtons = <>
                  FieldName = 'auth_date'
                  Footers = <>
                  ReadOnly = True
                  Width = 94
                end
                item
                  EditButtons = <>
                  FieldName = 'Auditname'
                  Footers = <>
                  ReadOnly = True
                  Width = 97
                end
                item
                  EditButtons = <>
                  FieldName = 'fac_name'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'reference'
                  Footers = <>
                  Width = 200
                end>
            end
          end
          inherited TabSheet2: TTabSheet
            object Label4: TLabel
              Left = 628
              Top = 48
              Width = 6
              Height = 12
            end
            object Label6: TLabel
              Left = 579
              Top = 10
              Width = 6
              Height = 12
            end
            object Label1: TLabel
              Left = 18
              Top = 7
              Width = 48
              Height = 12
              Caption = #30003#39046#21333#21495
              FocusControl = edt_Number
            end
            object Label2: TLabel
              Left = 18
              Top = 44
              Width = 48
              Height = 12
              Caption = #30003#35831#26085#26399
              FocusControl = edt_DATE
            end
            object Label7: TLabel
              Left = 18
              Top = 81
              Width = 72
              Height = 12
              Caption = #30003#39046#21592#24037#21517#31216
              FocusControl = edt_abbr_name
            end
            object Label8: TLabel
              Left = 18
              Top = 157
              Width = 24
              Height = 12
              Caption = #29366#24577
              FocusControl = edt_status_c
            end
            object Label9: TLabel
              Left = 226
              Top = 7
              Width = 72
              Height = 12
              Caption = #23457#25209#27969#31243#20195#30721
            end
            object Label10: TLabel
              Left = 226
              Top = 44
              Width = 48
              Height = 12
              Caption = #23457#25209#27969#31243
              FocusControl = edt_PURCHASE_APPROV_DESC
            end
            object Label11: TLabel
              Left = 226
              Top = 81
              Width = 48
              Height = 12
              Caption = #23457#26680#26085#26399
              FocusControl = edt_auth_date
            end
            object Label14: TLabel
              Left = 226
              Top = 118
              Width = 24
              Height = 12
              Caption = #24037#21378
            end
            object Label15: TLabel
              Left = 682
              Top = 117
              Width = 24
              Height = 12
              Caption = #22791#27880
            end
            object Label16: TLabel
              Left = 683
              Top = 7
              Width = 72
              Height = 12
              Caption = #35774#22791#25152#22312#37096#38376
            end
            object Label17: TLabel
              Left = 683
              Top = 44
              Width = 48
              Height = 12
              Caption = #37096#38376#21517#31216
              FocusControl = edt_DEPT_NAME
            end
            object Label22: TLabel
              Left = 682
              Top = 80
              Width = 72
              Height = 12
              Caption = #35774#22791#36131#20219#23567#32452
            end
            object Label29: TLabel
              Left = 18
              Top = 118
              Width = 48
              Height = 12
              Caption = #30003#39046#37096#38376
              FocusControl = edt_EMPLOYEE_DEPT_NAME
            end
            object edt_Number: TDBEdit
              Tag = 1
              Left = 18
              Top = 22
              Width = 124
              Height = 20
              DataField = 'number'
              DataSource = dsMain
              TabOrder = 0
            end
            object edt_DATE: TDBEdit
              Left = 18
              Top = 59
              Width = 185
              Height = 20
              Color = clMenuBar
              DataField = 'DATE'
              DataSource = dsMain
              ReadOnly = True
              TabOrder = 1
            end
            object edt_abbr_name: TDBEdit
              Left = 18
              Top = 96
              Width = 94
              Height = 20
              Color = clMenuBar
              DataField = 'abbr_name'
              DataSource = dsMain
              ReadOnly = True
              TabOrder = 2
            end
            object edt_status_c: TDBEdit
              Left = 18
              Top = 172
              Width = 76
              Height = 20
              Color = clMenuBar
              DataField = 'status_c'
              DataSource = dsMain
              Font.Charset = GB2312_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object edt_PURCHASE_APPROV_DESC: TDBEdit
              Left = 226
              Top = 59
              Width = 185
              Height = 20
              Color = clMenuBar
              DataField = 'PURCHASE_APPROV_DESC'
              DataSource = dsMain
              ReadOnly = True
              TabOrder = 4
            end
            object edt_auth_date: TDBEdit
              Left = 226
              Top = 96
              Width = 185
              Height = 20
              Color = clMenuBar
              DataField = 'auth_date'
              DataSource = dsMain
              ReadOnly = True
              TabOrder = 5
            end
            object cbx_Prted: TDBCheckBox
              Tag = 1
              Left = 18
              Top = 210
              Width = 67
              Height = 15
              Caption = #25171#21360#21542
              DataField = 'Prted'
              DataSource = dsMain
              ReadOnly = True
              TabOrder = 6
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object edt_DEPT_NAME: TDBEdit
              Left = 683
              Top = 59
              Width = 185
              Height = 20
              Color = clMenuBar
              DataField = 'DEPT_NAME'
              DataSource = dsMain
              ReadOnly = True
              TabOrder = 7
            end
            object DBRadioGroup_ttype: TDBRadioGroup
              Tag = 1
              Left = 228
              Top = 155
              Width = 197
              Height = 34
              Caption = #31867#22411
              Columns = 4
              DataField = 'ttype'
              DataSource = dsMain
              Items.Strings = (
                #32500#20462
                #32500#25252
                #24037#31243
                #20844#29992)
              TabOrder = 8
              Values.Strings = (
                #32500#20462
                #32500#25252
                #24037#31243
                #20844#29992)
              OnChange = DBRadioGroup_ttypeClick
              OnEnter = DBRadioGroup_ttypeEnter
            end
            object PageControl1: TPageControl
              Left = 432
              Top = 6
              Width = 230
              Height = 246
              ActivePage = TabSheet7
              TabOrder = 9
              object TabSheet5: TTabSheet
                Caption = #32500#20462#21333
                object Panel_2: TPanel
                  Left = 0
                  Top = 0
                  Width = 222
                  Height = 219
                  Align = alClient
                  TabOrder = 0
                  object Label5: TLabel
                    Left = 6
                    Top = 4
                    Width = 60
                    Height = 12
                    Caption = #32500#20462#21333#21333#21495
                  end
                  object Label21: TLabel
                    Left = 6
                    Top = 78
                    Width = 48
                    Height = 12
                    Caption = #35774#22791#21517#31216
                  end
                  object Label19: TLabel
                    Left = 6
                    Top = 41
                    Width = 48
                    Height = 12
                    Caption = #35774#22791#32534#21495
                  end
                  object Label27: TLabel
                    Left = 6
                    Top = 114
                    Width = 72
                    Height = 12
                    Caption = #25925#38556#24773#20917#35828#26126
                  end
                  object Label28: TLabel
                    Left = 6
                    Top = 166
                    Width = 72
                    Height = 12
                    Caption = #32500#20462#35760#24405#35828#26126
                  end
                  object DBEdit1: TDBEdit
                    Tag = 1
                    Left = 6
                    Top = 55
                    Width = 138
                    Height = 20
                    DataField = 'FASSET_CODE'
                    DataSource = dsMain
                    ReadOnly = True
                    TabOrder = 1
                  end
                  object DBEdit3: TDBEdit
                    Tag = 1
                    Left = 6
                    Top = 92
                    Width = 138
                    Height = 20
                    DataField = 'FASSET_NAME'
                    DataSource = dsMain
                    ReadOnly = True
                    TabOrder = 2
                  end
                  object edt_RepairNUMBER: TDBButtonEdit
                    Tag = 1
                    Left = 7
                    Top = 18
                    Width = 112
                    Height = 20
                    Hint = #25353'F1'#24377#20986#19979#25289#21015#34920
                    DataSource = dsMain
                    DataField = 'RepairNUMBER'
                    ParentShowHint = False
                    ReadOnlyColor = clInactiveCaptionText
                    ShowHint = True
                    TabOrder = 0
                    AltBtnWidth = 16
                    ButtonWidth = 16
                    F_DownFormWidth = 0
                    F_DownListDataSet = cds0567
                    F_DownDataSetFilterField = 'NUMBER'
                    F_ResultFieldName = 'NUMBER'
                    F_GetFieldName = 'RepairNUMBER'
                    F_ColsInfo = 
                      'NUMBER/'#32500#20462#21333#21495'/80,V_stat/'#29366#24577'/40,FASSET_CODE/'#35774#22791#20195#30721'/100,FASSET_NAME/'#35774#22791#21517 +
                      #31216'/120,DEPT_NAME/'#37096#38376#21517#31216'/80,failure_circs/'#25925#38556#24773#20917#35828#26126'/120,maintain_text/'#32500 +
                      #20462#35760#24405#35828#26126'/120,Location/'#36131#20219#23567#32452'/100'
                    F_PressKey13AutoDrop = False
                  end
                  object DBMemo3: TDBMemo
                    Left = 5
                    Top = 131
                    Width = 210
                    Height = 32
                    DataField = 'failure_circs'
                    DataSource = dsMain
                    ReadOnly = True
                    TabOrder = 3
                  end
                  object DBMemo4: TDBMemo
                    Left = 5
                    Top = 183
                    Width = 210
                    Height = 32
                    DataField = 'maintain_text'
                    DataSource = dsMain
                    ReadOnly = True
                    TabOrder = 4
                  end
                end
              end
              object TabSheet6: TTabSheet
                Caption = #24037#31243#21333
                ImageIndex = 1
                object Panel_4: TPanel
                  Left = 0
                  Top = 0
                  Width = 222
                  Height = 219
                  Align = alClient
                  TabOrder = 0
                  object Label3: TLabel
                    Left = 5
                    Top = 6
                    Width = 108
                    Height = 12
                    Caption = #31354#35843#20107#19994#37096#24037#20316#21333#21495
                  end
                  object Label24: TLabel
                    Left = 5
                    Top = 44
                    Width = 48
                    Height = 12
                    Caption = #37096#38376#21517#31216
                  end
                  object Label25: TLabel
                    Left = 5
                    Top = 81
                    Width = 72
                    Height = 12
                    Caption = #24037#20316#20219#21153#21517#31216
                  end
                  object Label26: TLabel
                    Left = 5
                    Top = 118
                    Width = 72
                    Height = 12
                    Caption = #24037#20316#20219#21153#35828#26126
                  end
                  object DBEdit4: TDBEdit
                    Left = 5
                    Top = 59
                    Width = 138
                    Height = 20
                    DataField = 'DeptName'
                    DataSource = dsMain
                    ReadOnly = True
                    TabOrder = 1
                  end
                  object DBEdit10: TDBEdit
                    Left = 5
                    Top = 97
                    Width = 138
                    Height = 20
                    DataField = 'WorkName'
                    DataSource = dsMain
                    ReadOnly = True
                    TabOrder = 2
                  end
                  object edt_WorkOrder: TDBButtonEdit
                    Tag = 1
                    Left = 6
                    Top = 20
                    Width = 111
                    Height = 20
                    Hint = #25353'F1'#24377#20986#19979#25289#21015#34920
                    DataSource = dsMain
                    DataField = 'WorkOrder'
                    ParentShowHint = False
                    ReadOnlyColor = clInactiveCaptionText
                    ShowHint = True
                    TabOrder = 0
                    AltBtnWidth = 16
                    ButtonWidth = 16
                    F_DownFormWidth = 0
                    F_DownListDataSet = cds0835
                    F_ResultFieldName = 'WorkOrder'
                    F_ColsInfo = 
                      'WorkOrder/'#24037#20316#21333#21495'/60,DeptName/'#37096#38376#21517#31216'/80,WorkName/'#20219#21153#21517#31216'/60,WorkExpl/'#20219#21153#35828 +
                      #26126'/160'
                    F_PressKey13AutoDrop = False
                  end
                  object DBMemo2: TDBMemo
                    Left = 5
                    Top = 134
                    Width = 210
                    Height = 74
                    DataField = 'WorkExpl'
                    DataSource = dsMain
                    ReadOnly = True
                    TabOrder = 3
                  end
                end
              end
              object TabSheet7: TTabSheet
                Caption = #32500#25252#21333
                ImageIndex = 2
                object Label18: TLabel
                  Left = 6
                  Top = 3
                  Width = 48
                  Height = 12
                  Caption = #20445#20859#26085#26399
                end
                object Label20: TLabel
                  Left = 6
                  Top = 40
                  Width = 48
                  Height = 12
                  Caption = #35774#22791#32534#21495
                end
                object Label23: TLabel
                  Left = 6
                  Top = 78
                  Width = 48
                  Height = 12
                  Caption = #35774#22791#21517#31216
                end
                object DBEdit7: TDBEdit
                  Tag = 1
                  Left = 6
                  Top = 92
                  Width = 138
                  Height = 20
                  DataField = 'FASSET_NAME'
                  DataSource = dsMain
                  ReadOnly = True
                  TabOrder = 0
                end
                object edt_PlanMainDate: TDBButtonEdit
                  Tag = 1
                  Left = 6
                  Top = 17
                  Width = 112
                  Height = 20
                  Hint = #25353'F1'#24377#20986#19979#25289#21015#34920
                  DataSource = dsMain
                  DataField = 'PlanMainDate'
                  ParentShowHint = False
                  ReadOnlyColor = clInactiveCaptionText
                  ShowHint = True
                  TabOrder = 1
                  AltBtnWidth = 16
                  ButtonWidth = 16
                  F_DownFormWidth = 0
                  F_DownListDataSet = cds0831
                  F_DownDataSetFilterField = 'PlanMainDate'
                  F_ResultFieldName = 'rkey'
                  F_GetFieldName = 'D831_ptr'
                  F_PressKey13AutoDrop = False
                end
                object edt_FASSET_CODE: TDBButtonEdit
                  Tag = 1
                  Left = 7
                  Top = 54
                  Width = 112
                  Height = 20
                  Hint = #25353'F1'#24377#20986#19979#25289#21015#34920
                  DataSource = dsMain
                  DataField = 'FASSET_CODE'
                  ParentShowHint = False
                  ReadOnlyColor = clInactiveCaptionText
                  ShowHint = True
                  TabOrder = 2
                  AltBtnWidth = 16
                  ButtonWidth = 16
                  F_DownFormWidth = 0
                  F_DownListDataSet = cds0831
                  F_DownDataSetFilterField = 'DeviNumb'
                  F_ResultFieldName = 'rkey'
                  F_GetFieldName = 'D831_ptr'
                  F_PressKey13AutoDrop = False
                end
              end
            end
            object edt_reference: TDBMemo
              Tag = 1
              Left = 682
              Top = 133
              Width = 176
              Height = 65
              DataField = 'reference'
              DataSource = dsMain
              TabOrder = 10
            end
            object edt_fac_name: TDBButtonEdit
              Tag = 1
              Left = 228
              Top = 133
              Width = 112
              Height = 20
              Hint = #25353'F1'#24377#20986#19979#25289#21015#34920
              DataSource = dsMain
              DataField = 'fac_name'
              ParentShowHint = False
              ReadOnlyColor = clInactiveCaptionText
              ShowHint = True
              TabOrder = 11
              AltBtnWidth = 16
              ButtonWidth = 16
              F_DownFormWidth = 0
              F_DownListDataSet = cds0015
              F_DownDataSetFilterField = 'ABBR_NAME'
              F_ResultFieldName = 'ABBR_NAME'
              F_GetFieldName = 'fac_name'
              F_PressKey13AutoDrop = False
            end
            object edt_CODE: TDBButtonEdit
              Tag = 1
              Left = 226
              Top = 22
              Width = 112
              Height = 20
              Hint = #25353'F1'#24377#20986#19979#25289#21015#34920
              DataSource = dsMain
              DataField = 'CODE'
              ParentShowHint = False
              ReadOnlyColor = clInactiveCaptionText
              ShowHint = True
              TabOrder = 12
              AltBtnWidth = 16
              ButtonWidth = 16
              F_DownFormWidth = 0
              F_DownListDataSet = cds0094
              F_ResultFieldName = 'CODE'
              F_PressKey13AutoDrop = False
            end
            object edt_Location: TDBButtonEdit
              Tag = 1
              Left = 683
              Top = 97
              Width = 112
              Height = 20
              Hint = #25353'F1'#24377#20986#19979#25289#21015#34920
              DataSource = dsMain
              DataField = 'Location'
              ParentShowHint = False
              ReadOnlyColor = clInactiveCaptionText
              ShowHint = True
              TabOrder = 13
              AltBtnWidth = 16
              ButtonWidth = 16
              F_DownFormWidth = 0
              F_DownListDataSet = cds0840
              F_ResultFieldName = 'Location'
              F_PressKey13AutoDrop = False
            end
            object edt_DEPT_CODE: TDBButtonEdit
              Tag = 1
              Left = 684
              Top = 22
              Width = 112
              Height = 20
              Hint = #25353'F1'#24377#20986#19979#25289#21015#34920
              DataSource = dsMain
              DataField = 'DEPT_CODE'
              ParentShowHint = False
              ReadOnlyColor = clInactiveCaptionText
              ShowHint = True
              TabOrder = 14
              AltBtnWidth = 16
              ButtonWidth = 16
              F_DownFormWidth = 0
              F_DownListDataSet = cds0034
              F_ResultFieldName = 'DEPT_CODE'
              F_PressKey13AutoDrop = False
            end
            object edt_EMPLOYEE_DEPT_NAME: TDBEdit
              Left = 18
              Top = 133
              Width = 93
              Height = 20
              Color = clMenuBar
              DataField = 'EMPLOYEE_DEPT_NAME'
              DataSource = dsMain
              ReadOnly = True
              TabOrder = 15
            end
          end
        end
      end
      inherited Panel_Top: TPanel
        Width = 847
      end
      inherited Panel11: TPanel
        Width = 847
      end
    end
  end
  inherited Panel_right: TPanel
    Left = 853
    Height = 516
  end
  inherited MainGrid_PopupMenu: TPopupMenu
    Left = 189
    Top = 194
    object N_Reprint: TMenuItem
      Caption = #37325#26032#25171#21360
      OnClick = N_ReprintClick
    end
  end
  inherited pp_Report1: TppReport
    Left = 714
    Top = 164
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
  inherited pp_Designer1: TppDesigner
    Left = 709
    Top = 229
  end
  inherited DtForeignKeyFieldQty: TADODataSet
    Left = 776
    Top = 288
  end
  inherited cdsRead: TClientDataSet
    Top = 396
  end
  inherited dspRead: TDataSetProvider
    Top = 454
  end
  inherited dtRead: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'select dbo.data0831.rkey,PlanMainDate,DeviNumb,dbo.DATA0417.FASS' +
      'ET_NAME,MainCycl, '#13#10'Data0034.DEPT_CODE,Data0034.DEPT_NAME,DATA04' +
      '17.EquiType,data0840.Location'#13#10'from dbo.data0831'#13#10'join dbo.DATA0' +
      '417 on dbo.data0831.DeviNumb=dbo.DATA0417.FASSET_CODE'#13#10'join  dbo' +
      '.Data0034 on dbo.DATA0417.DEPT_PTR=dbo.Data0034.rkey'#13#10'join data0' +
      '840 on DATA0417.d840_ptr=data0840.rkey'#13#10'where RKEY832<>2'
    Top = 340
  end
  inherited cdsMain: Tcds
    CommandText = 
      'SELECT dbo.DATA0268.rkey, dbo.DATA0268.number, dbo.DATA0268.dept' +
      '_ptr, dbo.DATA0268.DATE,'#13#10'dbo.DATA0268.EMPL_PTR, dbo.DATA0268.st' +
      'atus,dbo.DATA0268.auth_emplptr, dbo.DATA0268.auth_date, '#13#10'dbo.DA' +
      'TA0268.reference, dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME' +
      ', dbo.Data0005.EMPL_CODE, '#13#10'dbo.Data0005.EMPLOYEE_NAME AS abbr_n' +
      'ame,d34.DEPT_NAME as EMPLOYEE_DEPT_NAME, Data0005_1.EMPL_CODE AS' +
      ' Auditcode,'#13#10'Data0005_1.EMPLOYEE_NAME AS Auditname,  '#13#10'CASE WHEN' +
      ' data0268.status = 0 THEN '#39#24453#25552#20132#39' WHEN data0268.status = 1 THEN '#39#24453 +
      #23457#26680#39'  '#13#10'WHEN data0268.status = 2 THEN '#39#24050#23457#26680#39' WHEN data0268.status ' +
      ' = 3 THEN '#39#34987#36864#22238#39'  '#13#10'WHEN data0268.status = 4 THEN '#39#24050#21457#26009#39' END AS st' +
      'atus_c, '#13#10'dbo.DATA0268.auth_ptr, dbo.Data0094.RKEY AS rkey94,dbo' +
      '.Data0094.CODE, '#13#10'dbo.Data0094.PURCHASE_APPROV_DESC, dbo.Data001' +
      '5.ABBR_NAME AS fac_name,'#13#10'dbo.DATA0268.warehouse_ptr,dbo.DATA026' +
      '8.Prted, dbo.DATA0268.allow_submit, '#13#10'CASE WHEN data0268.allow_s' +
      'ubmit = 0 THEN '#39#19981#30830#35748#39' WHEN data0268.allow_submit = 1 THEN '#39#24453#30830#35748#39'  ' +
      #13#10'WHEN data0268.allow_submit = 2 THEN '#39#24050#30830#35748#39'END AS allow_submit_c' +
      ','#13#10'Data0005_2.EMPL_CODE AS allow_submit_person_code, Data0005_2.' +
      'EMPLOYEE_NAME AS allow_submit_person_name,'#13#10'dbo.DATA0268.allow_s' +
      'ubmit_time, dbo.DATA0268.control_ptr,dbo.DATA0268.ttype,'#13#10'dbo.DA' +
      'TA0268.D831_ptr,dbo.DATA0268.D835_ptr,dbo.DATA0268.D567_ptr,'#13#10'db' +
      'o.data0835.WorkOrder/*'#31354#35843#20107#19994#37096#24037#20316#21333#21495'*/,dbo.data0567.NUMBER as RepairN' +
      'UMBER,'#13#10'dbo.data0567.failure_circs,dbo.data0567.maintain_text,'#13#10 +
      'dbo.data0831.PlanMainDate,dbo.data0831.DeviNumb ,dbo.data0831.Ma' +
      'inCycl,'#13#10'Case when dbo.DATA0268.TTYPE in(2,3,4) then(d17_2.FASSE' +
      'T_NAME) '#13#10'     when dbo.DATA0268.TTYPE=3 then(d17_1.FASSET_NAME)' +
      ' end as FASSET_NAME, '#13#10'Case when dbo.DATA0268.TTYPE in(2,3,4) th' +
      'en(d17_2.FASSET_CODE) '#13#10'     when dbo.DATA0268.TTYPE=3 then(data' +
      '0831.DeviNumb) end as FASSET_CODE, '#13#10'dbo.DATA0268.D840_ptr,data0' +
      '840.[Location],data0830.[DeptName], Data0836.[WorkName],data0835' +
      '.[WorkExpl]'#13#10'FROM dbo.DATA0268 INNER JOIN dbo.Data0034 ON dbo.DA' +
      'TA0268.dept_ptr = dbo.Data0034.RKEY'#13#10'and dbo.DATA0268.ttype in (' +
      '2,3,4,5) /*2'#32500#20462';3'#32500#25252';4'#24037#31243';5'#20844#29992'*/'#13#10'INNER JOIN dbo.Data0005 ON dbo.DAT' +
      'A0268.EMPL_PTR = dbo.Data0005.RKEY '#13#10'inner join data0034 as d34 ' +
      'on Data0005.EMPLOYEE_ID=d34.rkey'#13#10'LEFT JOIN dbo.Data0005 AS Data' +
      '0005_1 ON dbo.DATA0268.auth_emplptr = Data0005_1.RKEY'#13#10'INNER JOI' +
      'N dbo.Data0094 ON dbo.DATA0268.auth_ptr = dbo.Data0094.RKEY '#13#10'IN' +
      'NER JOIN dbo.Data0015 ON dbo.DATA0268.warehouse_ptr = dbo.Data00' +
      '15.RKEY '#13#10'LEFT JOIN dbo.Data0005 AS Data0005_2 ON dbo.DATA0268.a' +
      'llow_submit_person = Data0005_2.RKEY '#13#10'left join dbo.data0831 on' +
      ' DATA0268.[d831_ptr]=dbo.data0831.rkey '#13#10'left join data0417 d17_' +
      '1 on d17_1.FASSET_CODE=data0831.DeviNumb '#13#10'left join dbo.data056' +
      '7 on DATA0268.[d567_ptr]=dbo.data0567.rkey'#13#10'left join data0417 d' +
      '17_2 on d17_2.rkey=data0567.FASSET_PTR  '#13#10'left join dbo.data0835' +
      ' on DATA0268.[d835_ptr]=dbo.data0835.rkey '#13#10'left join data0840 o' +
      'n  DATA0268.[d840_ptr]=dbo.data0840.rkey '#13#10'left join dbo.data083' +
      '0 on data0835.[Dept_ptr]=data0830.rkey  '#13#10'left join dbo.Data0836' +
      ' on data0835.[Work_ptr]=data0836.rkey'
    F_AutoIncrField = 'rkey'
    F_AutoNumbField = 'number'
    F_TableName = 'data0268'
    F_SQLSelectFrom = 
      'SELECT dbo.DATA0268.rkey, dbo.DATA0268.number, dbo.DATA0268.dept' +
      '_ptr, dbo.DATA0268.DATE,'#13#10'dbo.DATA0268.EMPL_PTR, dbo.DATA0268.st' +
      'atus,dbo.DATA0268.auth_emplptr, dbo.DATA0268.auth_date, '#13#10'dbo.DA' +
      'TA0268.reference, dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME' +
      ', dbo.Data0005.EMPL_CODE, '#13#10'dbo.Data0005.EMPLOYEE_NAME AS abbr_n' +
      'ame,d34.DEPT_NAME as EMPLOYEE_DEPT_NAME, Data0005_1.EMPL_CODE AS' +
      ' Auditcode,'#13#10'Data0005_1.EMPLOYEE_NAME AS Auditname,  '#13#10'CASE WHEN' +
      ' data0268.status = 0 THEN '#39#24453#25552#20132#39' WHEN data0268.status = 1 THEN '#39#24453 +
      #23457#26680#39'  '#13#10'WHEN data0268.status = 2 THEN '#39#24050#23457#26680#39' WHEN data0268.status ' +
      ' = 3 THEN '#39#34987#36864#22238#39'  '#13#10'WHEN data0268.status = 4 THEN '#39#24050#21457#26009#39' END AS st' +
      'atus_c, '#13#10'dbo.DATA0268.auth_ptr, dbo.Data0094.RKEY AS rkey94,dbo' +
      '.Data0094.CODE, '#13#10'dbo.Data0094.PURCHASE_APPROV_DESC, dbo.Data001' +
      '5.ABBR_NAME AS fac_name,'#13#10'dbo.DATA0268.warehouse_ptr,dbo.DATA026' +
      '8.Prted, dbo.DATA0268.allow_submit, '#13#10'CASE WHEN data0268.allow_s' +
      'ubmit = 0 THEN '#39#19981#30830#35748#39' WHEN data0268.allow_submit = 1 THEN '#39#24453#30830#35748#39'  ' +
      #13#10'WHEN data0268.allow_submit = 2 THEN '#39#24050#30830#35748#39'END AS allow_submit_c' +
      ','#13#10'Data0005_2.EMPL_CODE AS allow_submit_person_code, Data0005_2.' +
      'EMPLOYEE_NAME AS allow_submit_person_name,'#13#10'dbo.DATA0268.allow_s' +
      'ubmit_time, dbo.DATA0268.control_ptr,dbo.DATA0268.ttype,'#13#10'dbo.DA' +
      'TA0268.D831_ptr,dbo.DATA0268.D835_ptr,dbo.DATA0268.D567_ptr,'#13#10'db' +
      'o.data0835.WorkOrder/*'#31354#35843#20107#19994#37096#24037#20316#21333#21495'*/,dbo.data0567.NUMBER as RepairN' +
      'UMBER,'#13#10'dbo.data0567.failure_circs,dbo.data0567.maintain_text,'#13#10 +
      'dbo.data0831.PlanMainDate,dbo.data0831.DeviNumb ,dbo.data0831.Ma' +
      'inCycl,'#13#10'Case when dbo.DATA0268.TTYPE in(2,3,4) then(d17_2.FASSE' +
      'T_NAME) '#13#10'     when dbo.DATA0268.TTYPE=3 then(d17_1.FASSET_NAME)' +
      ' end as FASSET_NAME, '#13#10'Case when dbo.DATA0268.TTYPE in(2,3,4) th' +
      'en(d17_2.FASSET_CODE) '#13#10'     when dbo.DATA0268.TTYPE=3 then(data' +
      '0831.DeviNumb) end as FASSET_CODE, '#13#10'dbo.DATA0268.D840_ptr,data0' +
      '840.[Location],data0830.[DeptName], Data0836.[WorkName],data0835' +
      '.[WorkExpl]'#13#10'FROM dbo.DATA0268 INNER JOIN dbo.Data0034 ON dbo.DA' +
      'TA0268.dept_ptr = dbo.Data0034.RKEY'#13#10'and dbo.DATA0268.ttype in (' +
      '2,3,4,5) /*2'#32500#20462';3'#32500#25252';4'#24037#31243';5'#20844#29992'*/'#13#10'INNER JOIN dbo.Data0005 ON dbo.DAT' +
      'A0268.EMPL_PTR = dbo.Data0005.RKEY '#13#10'inner join data0034 as d34 ' +
      'on Data0005.EMPLOYEE_ID=d34.rkey'#13#10'LEFT JOIN dbo.Data0005 AS Data' +
      '0005_1 ON dbo.DATA0268.auth_emplptr = Data0005_1.RKEY'#13#10'INNER JOI' +
      'N dbo.Data0094 ON dbo.DATA0268.auth_ptr = dbo.Data0094.RKEY '#13#10'IN' +
      'NER JOIN dbo.Data0015 ON dbo.DATA0268.warehouse_ptr = dbo.Data00' +
      '15.RKEY '#13#10'LEFT JOIN dbo.Data0005 AS Data0005_2 ON dbo.DATA0268.a' +
      'llow_submit_person = Data0005_2.RKEY '#13#10'left join dbo.data0831 on' +
      ' DATA0268.[d831_ptr]=dbo.data0831.rkey '#13#10'left join data0417 d17_' +
      '1 on d17_1.FASSET_CODE=data0831.DeviNumb '#13#10'left join dbo.data056' +
      '7 on DATA0268.[d567_ptr]=dbo.data0567.rkey'#13#10'left join data0417 d' +
      '17_2 on d17_2.rkey=data0567.FASSET_PTR  '#13#10'left join dbo.data0835' +
      ' on DATA0268.[d835_ptr]=dbo.data0835.rkey '#13#10'left join data0840 o' +
      'n  DATA0268.[d840_ptr]=dbo.data0840.rkey '#13#10'left join dbo.data083' +
      '0 on data0835.[Dept_ptr]=data0830.rkey  '#13#10'left join dbo.Data0836' +
      ' on data0835.[Work_ptr]=data0836.rkey'
    object cdsMainrkey: TAutoIncField
      AutoGenerateValue = arAutoInc
      FieldName = 'rkey'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object cdsMainnumber: TStringField
      DisplayLabel = #30003#39046#21333#21495
      FieldName = 'number'
      Size = 10
    end
    object cdsMaindept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object cdsMainDATE: TDateTimeField
      DisplayLabel = #30003#35831#26085#26399
      FieldName = 'DATE'
    end
    object cdsMainEMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object cdsMainstatus: TSmallintField
      FieldName = 'status'
      OnChange = cdsMainstatusChange
    end
    object cdsMainauth_emplptr: TIntegerField
      FieldName = 'auth_emplptr'
    end
    object cdsMainauth_date: TDateTimeField
      DisplayLabel = #23457#26680#26085#26399
      FieldName = 'auth_date'
    end
    object cdsMainttype: TSmallintField
      DisplayLabel = #31867#22411
      FieldName = 'ttype'
      OnGetText = cdsMainttypeGetText
      OnSetText = cdsMainttypeSetText
    end
    object cdsMainreference: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'reference'
      Size = 100
    end
    object cdsMainwarehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object cdsMainallow_submit_time: TDateTimeField
      DisplayLabel = #20801#35768#25552#20132#26102#38388
      FieldName = 'allow_submit_time'
    end
    object cdsMaincontrol_ptr: TIntegerField
      FieldName = 'control_ptr'
    end
    object cdsMainauth_ptr: TIntegerField
      FieldName = 'auth_ptr'
    end
    object cdsMainPrted: TBooleanField
      DisplayLabel = #25171#21360#21542
      FieldName = 'Prted'
    end
    object cdsMainallow_submit: TSmallintField
      FieldName = 'allow_submit'
    end
    object cdsMainDEPT_CODE: TStringField
      DisplayLabel = #35774#22791#25152#22312#37096#38376
      FieldName = 'DEPT_CODE'
      ProviderFlags = []
      OnChange = cdsMainDEPT_CODEChange
      Size = 10
    end
    object cdsMainDEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      ProviderFlags = []
      Size = 30
    end
    object cdsMainEMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      ProviderFlags = []
      Size = 10
    end
    object cdsMainabbr_name: TStringField
      DisplayLabel = #30003#39046#21592#24037#21517#31216
      FieldName = 'abbr_name'
      ProviderFlags = []
      Size = 16
    end
    object cdsMainAuditcode: TStringField
      FieldName = 'Auditcode'
      ProviderFlags = []
      Size = 10
    end
    object cdsMainAuditname: TStringField
      DisplayLabel = #23457#26680#21592#24037#21517#31216
      FieldName = 'Auditname'
      ProviderFlags = []
      Size = 16
    end
    object cdsMainstatus_c: TStringField
      DisplayLabel = #23457#26680#29366#24577
      FieldName = 'status_c'
      ProviderFlags = []
      Size = 6
    end
    object cdsMainrkey94: TAutoIncField
      FieldName = 'rkey94'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsMainPURCHASE_APPROV_DESC: TStringField
      DisplayLabel = #23457#25209#27969#31243
      FieldName = 'PURCHASE_APPROV_DESC'
      ProviderFlags = []
      Size = 40
    end
    object cdsMainfac_name: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'fac_name'
      ProviderFlags = []
      OnChange = cdsMainfac_nameChange
      Size = 10
    end
    object cdsMainallow_submit_c: TStringField
      DisplayLabel = #30830#35748#29366#24577
      FieldName = 'allow_submit_c'
      ProviderFlags = []
      Size = 6
    end
    object cdsMainallow_submit_person_code: TStringField
      FieldName = 'allow_submit_person_code'
      ProviderFlags = []
      Size = 10
    end
    object cdsNainallow_submit_person_name: TStringField
      DisplayLabel = #20801#35768#25552#20132#20154#21592
      FieldName = 'allow_submit_person_name'
      ProviderFlags = []
      Size = 16
    end
    object cdsMainRepairNUMBER: TStringField
      DisplayLabel = #32500#20462#21333#21333#21495
      FieldName = 'RepairNUMBER'
      ProviderFlags = []
      OnChange = cdsMainRepairNUMBERChange
      Size = 15
    end
    object cdsMainPlanMainDate: TDateTimeField
      DisplayLabel = #20445#20859#26085#26399
      FieldName = 'PlanMainDate'
      ProviderFlags = []
    end
    object cdsMainDeviNumb: TStringField
      DisplayLabel = #35774#22791#32534#21495
      FieldName = 'DeviNumb'
      ProviderFlags = []
    end
    object cdsMainMainCycl: TStringField
      DisplayLabel = #20445#20859#21608#26399
      FieldName = 'MainCycl'
      ProviderFlags = []
      Size = 10
    end
    object cdsMainWorkOrder: TStringField
      DisplayLabel = #31354#35843#20107#19994#37096#24037#20316#21333#21495
      FieldName = 'WorkOrder'
      ProviderFlags = []
      OnChange = cdsMainWorkOrderChange
      Size = 15
    end
    object cdsMainCODE: TStringField
      DisplayLabel = #23457#25209#27969#31243#20195#30721
      FieldName = 'CODE'
      ProviderFlags = []
      OnChange = cdsMainCODEChange
      Size = 15
    end
    object cdsMainD831_ptr: TIntegerField
      FieldName = 'D831_ptr'
      OnChange = cdsMainD831_ptrChange
    end
    object cdsMainD835_ptr: TIntegerField
      FieldName = 'D835_ptr'
      OnChange = cdsMainD835_ptrChange
    end
    object cdsMainD567_ptr: TIntegerField
      FieldName = 'D567_ptr'
      OnChange = cdsMainD567_ptrChange
    end
    object cdsMainFASSET_NAME: TStringField
      DisplayLabel = #35774#22791#21517#31216
      FieldName = 'FASSET_NAME'
      ProviderFlags = []
      Size = 30
    end
    object cdsMainD840_ptr: TIntegerField
      FieldName = 'D840_ptr'
    end
    object cdsMainLocation: TStringField
      DisplayLabel = #35774#22791#36131#20219#23567#32452
      FieldName = 'Location'
      ProviderFlags = []
      OnChange = cdsMainLocationChange
    end
    object cdsMainFASSET_CODE: TStringField
      FieldName = 'FASSET_CODE'
      ProviderFlags = []
    end
    object cdsMainDeptName: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DeptName'
      ProviderFlags = []
      Size = 50
    end
    object cdsMainWorkName: TStringField
      DisplayLabel = #24037#20316#20219#21153#21517#31216
      FieldName = 'WorkName'
      ProviderFlags = []
      Size = 50
    end
    object cdsMainWorkExpl: TStringField
      DisplayLabel = #24037#20316#20219#21153#35828#26126
      FieldName = 'WorkExpl'
      ProviderFlags = []
      Size = 200
    end
    object cdsMainfailure_circs: TStringField
      FieldName = 'failure_circs'
      ProviderFlags = []
      Size = 200
    end
    object cdsMainmaintain_text: TStringField
      FieldName = 'maintain_text'
      ProviderFlags = []
      Size = 200
    end
    object cdsMainEMPLOYEE_DEPT_NAME: TStringField
      DisplayLabel = #30003#39046#37096#38376
      FieldName = 'EMPLOYEE_DEPT_NAME'
      ProviderFlags = []
      Size = 30
    end
  end
  inherited cdsChild: Tcds
    CommandText = 
      'SELECT  dbo.Data0468.RKEY, dbo.Data0468.CUT_NO, dbo.Data0468.SO_' +
      'NO, dbo.Data0468.FLOW_NO, dbo.Data0468.STEP, '#13#10'dbo.Data0468.DEPT' +
      '_PTR, dbo.Data0468.INVENT_PTR, dbo.Data0468.QUAN_BOM, dbo.Data04' +
      '68.QUAN_ISSUED, '#13#10'dbo.Data0468.STATUS, dbo.Data0468.PRINTIT, dbo' +
      '.Data0468.VENDOR, dbo.Data0468.Invent_or,dbo.Data0468.quan_alloc' +
      ','#13#10'dbo.Data0468.overproof, dbo.Data0017.INV_PART_NUMBER, dbo.Dat' +
      'a0017.INV_PART_DESCRIPTION,data0002.unit_name'#13#10'FROM   dbo.Data04' +
      '68 INNER JOIN'#13#10'dbo.Data0017 ON dbo.Data0468.INVENT_PTR = dbo.Dat' +
      'a0017.RKEY'#13#10' inner join data0002 on data0017.STOCK_UNIT_PTR=data' +
      '0002.rkey'#13#10'where 1=2 and dbo.DATA0468.flow_no=:rkey268'#13#10
    Params = <
      item
        DataType = ftWideString
        Name = 'rkey268'
        ParamType = ptUnknown
        Value = '0'
      end>
    F_AutoIncrField = 'rkey'
    F_TableName = 'data0468'
    F_SQLSelectFrom = 
      'SELECT  dbo.Data0468.RKEY, dbo.Data0468.CUT_NO, dbo.Data0468.SO_' +
      'NO, dbo.Data0468.FLOW_NO, dbo.Data0468.STEP, '#13#10'dbo.Data0468.DEPT' +
      '_PTR, dbo.Data0468.INVENT_PTR, dbo.Data0468.QUAN_BOM, dbo.Data04' +
      '68.QUAN_ISSUED, '#13#10'dbo.Data0468.STATUS, dbo.Data0468.PRINTIT, dbo' +
      '.Data0468.VENDOR, dbo.Data0468.Invent_or,dbo.Data0468.quan_alloc' +
      ','#13#10'dbo.Data0468.overproof, dbo.Data0017.INV_PART_NUMBER, dbo.Dat' +
      'a0017.INV_PART_DESCRIPTION,data0002.unit_name'#13#10'FROM   dbo.Data04' +
      '68 INNER JOIN'#13#10'dbo.Data0017 ON dbo.Data0468.INVENT_PTR = dbo.Dat' +
      'a0017.RKEY'#13#10' inner join data0002 on data0017.STOCK_UNIT_PTR=data' +
      '0002.rkey'#13#10
    F_Primarykey = 'rkey'
    F_Foreignkey = 'FLOW_NO'
    object cdsChildRKEY: TAutoIncField
      FieldName = 'RKEY'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object cdsChildCUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object cdsChildSO_NO: TStringField
      FieldName = 'SO_NO'
      FixedChar = True
      Size = 12
    end
    object cdsChildFLOW_NO: TIntegerField
      FieldName = 'FLOW_NO'
    end
    object cdsChildSTEP: TSmallintField
      FieldName = 'STEP'
    end
    object cdsChildDEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object cdsChildINVENT_PTR: TIntegerField
      FieldName = 'INVENT_PTR'
    end
    object cdsChildQUAN_BOM: TFloatField
      DisplayLabel = #30003#39046#25968#37327
      FieldName = 'QUAN_BOM'
    end
    object cdsChildQUAN_ISSUED: TFloatField
      DisplayLabel = #24050#21457#25918#25968#37327
      FieldName = 'QUAN_ISSUED'
    end
    object cdsChildSTATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object cdsChildPRINTIT: TStringField
      DisplayLabel = #26159#21542'VMI'
      FieldName = 'PRINTIT'
      OnGetText = cdsChildPRINTITGetText
      FixedChar = True
      Size = 1
    end
    object cdsChildVENDOR: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'VENDOR'
      Size = 15
    end
    object cdsChildInvent_or: TSmallintField
      FieldName = 'Invent_or'
    end
    object cdsChildquan_alloc: TBCDField
      FieldName = 'quan_alloc'
      Precision = 9
      Size = 2
    end
    object cdsChildoverproof: TSmallintField
      FieldName = 'overproof'
    end
    object cdsChildINV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      ProviderFlags = []
      OnChange = cdsChildINV_PART_NUMBERChange
      Size = 25
    end
    object cdsChildINV_PART_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#21517#31216'/'#35268#26684
      FieldName = 'INV_PART_DESCRIPTION'
      ProviderFlags = []
      Size = 100
    end
    object cdsChildunit_name: TStringField
      DisplayLabel = #24211#23384#21333#20301
      FieldName = 'unit_name'
      ProviderFlags = []
    end
  end
  inherited dtChild: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'SELECT      dbo.Data0468.RKEY, dbo.Data0468.CUT_NO, dbo.Data0468' +
      '.SO_NO, dbo.Data0468.FLOW_NO, dbo.Data0468.STEP, '#13#10'dbo.Data0468.' +
      'DEPT_PTR, dbo.Data0468.INVENT_PTR, dbo.Data0468.QUAN_BOM, dbo.Da' +
      'ta0468.QUAN_ISSUED, '#13#10'dbo.Data0468.STATUS, dbo.Data0468.PRINTIT,' +
      ' dbo.Data0468.VENDOR, dbo.Data0468.Invent_or,dbo.Data0468.quan_a' +
      'lloc,'#13#10'dbo.Data0468.overproof, dbo.Data0017.INV_PART_NUMBER, dbo' +
      '.Data0017.INV_PART_DESCRIPTION,data0002.unit_name'#13#10'FROM         ' +
      'dbo.Data0468 INNER JOIN'#13#10'                      dbo.Data0017 ON d' +
      'bo.Data0468.INVENT_PTR = dbo.Data0017.RKEY'#13#10'    inner join data0' +
      '002 on data0017.STOCK_UNIT_PTR=data0002.rkey'#13#10'where 1=2 and dbo.' +
      'DATA0468.flow_no=:rkey268'#13#10
    IndexFieldNames = 'FLOW_NO'
    Parameters = <
      item
        Name = 'rkey268'
        DataType = ftWideString
        Size = 1
        Value = '0'
      end>
    object dtChildRKEY: TAutoIncField
      FieldName = 'RKEY'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object dtChildCUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object dtChildSO_NO: TStringField
      FieldName = 'SO_NO'
      FixedChar = True
      Size = 12
    end
    object dtChildFLOW_NO: TIntegerField
      FieldName = 'FLOW_NO'
    end
    object dtChildSTEP: TSmallintField
      FieldName = 'STEP'
    end
    object dtChildDEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object dtChildINVENT_PTR: TIntegerField
      FieldName = 'INVENT_PTR'
    end
    object dtChildQUAN_BOM: TFloatField
      FieldName = 'QUAN_BOM'
    end
    object dtChildQUAN_ISSUED: TFloatField
      FieldName = 'QUAN_ISSUED'
    end
    object dtChildSTATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object dtChildPRINTIT: TStringField
      FieldName = 'PRINTIT'
      FixedChar = True
      Size = 1
    end
    object dtChildVENDOR: TStringField
      FieldName = 'VENDOR'
      Size = 15
    end
    object dtChildInvent_or: TSmallintField
      FieldName = 'Invent_or'
    end
    object dtChildquan_alloc: TBCDField
      FieldName = 'quan_alloc'
      Precision = 9
      Size = 2
    end
    object dtChildoverproof: TWordField
      FieldName = 'overproof'
    end
    object dtChildINV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      ProviderFlags = []
      Size = 25
    end
    object dtChildINV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ProviderFlags = []
      Size = 100
    end
    object dtChildunit_name: TStringField
      FieldName = 'unit_name'
      ProviderFlags = []
    end
  end
  inherited dspMain: TDataSetProvider
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
  end
  inherited dtMain: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'SELECT dbo.DATA0268.rkey, dbo.DATA0268.number, dbo.DATA0268.dept' +
      '_ptr, dbo.DATA0268.DATE,'#13#10'dbo.DATA0268.EMPL_PTR, dbo.DATA0268.st' +
      'atus,dbo.DATA0268.auth_emplptr, dbo.DATA0268.auth_date, '#13#10'dbo.DA' +
      'TA0268.reference, dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME' +
      ', dbo.Data0005.EMPL_CODE, '#13#10'dbo.Data0005.EMPLOYEE_NAME AS abbr_n' +
      'ame,d34.DEPT_NAME as EMPLOYEE_DEPT_NAME, Data0005_1.EMPL_CODE AS' +
      ' Auditcode,'#13#10'Data0005_1.EMPLOYEE_NAME AS Auditname,  '#13#10'CASE WHEN' +
      ' data0268.status = 0 THEN '#39#24453#25552#20132#39' WHEN data0268.status = 1 THEN '#39#24453 +
      #23457#26680#39'  '#13#10'WHEN data0268.status = 2 THEN '#39#24050#23457#26680#39' WHEN data0268.status ' +
      ' = 3 THEN '#39#34987#36864#22238#39'  '#13#10'WHEN data0268.status = 4 THEN '#39#24050#21457#26009#39' END AS st' +
      'atus_c, '#13#10'dbo.DATA0268.auth_ptr, dbo.Data0094.RKEY AS rkey94,dbo' +
      '.Data0094.CODE, '#13#10'dbo.Data0094.PURCHASE_APPROV_DESC, dbo.Data001' +
      '5.ABBR_NAME AS fac_name,'#13#10'dbo.DATA0268.warehouse_ptr,dbo.DATA026' +
      '8.Prted, dbo.DATA0268.allow_submit, '#13#10'CASE WHEN data0268.allow_s' +
      'ubmit = 0 THEN '#39#19981#30830#35748#39' WHEN data0268.allow_submit = 1 THEN '#39#24453#30830#35748#39'  ' +
      #13#10'WHEN data0268.allow_submit = 2 THEN '#39#24050#30830#35748#39'END AS allow_submit_c' +
      ','#13#10'Data0005_2.EMPL_CODE AS allow_submit_person_code, Data0005_2.' +
      'EMPLOYEE_NAME AS allow_submit_person_name,'#13#10'dbo.DATA0268.allow_s' +
      'ubmit_time, dbo.DATA0268.control_ptr,dbo.DATA0268.ttype,'#13#10'dbo.DA' +
      'TA0268.D831_ptr,dbo.DATA0268.D835_ptr,dbo.DATA0268.D567_ptr,'#13#10'db' +
      'o.data0835.WorkOrder/*'#31354#35843#20107#19994#37096#24037#20316#21333#21495'*/,dbo.data0567.NUMBER as RepairN' +
      'UMBER,'#13#10'dbo.data0567.failure_circs,dbo.data0567.maintain_text,'#13#10 +
      'dbo.data0831.PlanMainDate,dbo.data0831.DeviNumb ,dbo.data0831.Ma' +
      'inCycl,'#13#10'Case when dbo.DATA0268.TTYPE in(2,3,4) then(d17_2.FASSE' +
      'T_NAME) '#13#10'     when dbo.DATA0268.TTYPE=3 then(d17_1.FASSET_NAME)' +
      ' end as FASSET_NAME, '#13#10'Case when dbo.DATA0268.TTYPE in(2,3,4) th' +
      'en(d17_2.FASSET_CODE) '#13#10'     when dbo.DATA0268.TTYPE=3 then(data' +
      '0831.DeviNumb) end as FASSET_CODE, '#13#10'dbo.DATA0268.D840_ptr,data0' +
      '840.[Location],data0830.[DeptName], Data0836.[WorkName],data0835' +
      '.[WorkExpl]'#13#10'FROM dbo.DATA0268 INNER JOIN dbo.Data0034 ON dbo.DA' +
      'TA0268.dept_ptr = dbo.Data0034.RKEY'#13#10'and dbo.DATA0268.ttype in (' +
      '2,3,4,5) /*2'#32500#20462';3'#32500#25252';4'#24037#31243';5'#20844#29992'*/'#13#10'INNER JOIN dbo.Data0005 ON dbo.DAT' +
      'A0268.EMPL_PTR = dbo.Data0005.RKEY '#13#10'inner join data0034 as d34 ' +
      'on Data0005.EMPLOYEE_ID=d34.rkey'#13#10'LEFT JOIN dbo.Data0005 AS Data' +
      '0005_1 ON dbo.DATA0268.auth_emplptr = Data0005_1.RKEY'#13#10'INNER JOI' +
      'N dbo.Data0094 ON dbo.DATA0268.auth_ptr = dbo.Data0094.RKEY '#13#10'IN' +
      'NER JOIN dbo.Data0015 ON dbo.DATA0268.warehouse_ptr = dbo.Data00' +
      '15.RKEY '#13#10'LEFT JOIN dbo.Data0005 AS Data0005_2 ON dbo.DATA0268.a' +
      'llow_submit_person = Data0005_2.RKEY '#13#10'left join dbo.data0831 on' +
      ' DATA0268.[d831_ptr]=dbo.data0831.rkey '#13#10'left join data0417 d17_' +
      '1 on d17_1.FASSET_CODE=data0831.DeviNumb '#13#10'left join dbo.data056' +
      '7 on DATA0268.[d567_ptr]=dbo.data0567.rkey'#13#10'left join data0417 d' +
      '17_2 on d17_2.rkey=data0567.FASSET_PTR  '#13#10'left join dbo.data0835' +
      ' on DATA0268.[d835_ptr]=dbo.data0835.rkey '#13#10'left join data0840 o' +
      'n  DATA0268.[d840_ptr]=dbo.data0840.rkey '#13#10'left join dbo.data083' +
      '0 on data0835.[Dept_ptr]=data0830.rkey  '#13#10'left join dbo.Data0836' +
      ' on data0835.[Work_ptr]=data0836.rkey'
    object dtMainrkey: TAutoIncField
      FieldName = 'rkey'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object dtMainnumber: TStringField
      FieldName = 'number'
      Size = 10
    end
    object dtMaindept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object dtMainDATE: TDateTimeField
      FieldName = 'DATE'
    end
    object dtMainEMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object dtMainstatus: TWordField
      FieldName = 'status'
    end
    object dtMainauth_emplptr: TIntegerField
      FieldName = 'auth_emplptr'
    end
    object dtMainauth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object dtMainttype: TWordField
      FieldName = 'ttype'
    end
    object dtMainreference: TStringField
      FieldName = 'reference'
      Size = 100
    end
    object dtMainwarehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object dtMainallow_submit_time: TDateTimeField
      FieldName = 'allow_submit_time'
    end
    object dtMaincontrol_ptr: TIntegerField
      FieldName = 'control_ptr'
    end
    object dtMainauth_ptr: TIntegerField
      FieldName = 'auth_ptr'
    end
    object dtMainPrted: TBooleanField
      FieldName = 'Prted'
    end
    object dtMainallow_submit: TWordField
      FieldName = 'allow_submit'
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
    object dtMainEMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      ProviderFlags = []
      Size = 10
    end
    object dtMainabbr_name: TStringField
      FieldName = 'abbr_name'
      ProviderFlags = []
      Size = 16
    end
    object dtMainAuditcode: TStringField
      FieldName = 'Auditcode'
      ProviderFlags = []
      Size = 10
    end
    object dtMainAuditname: TStringField
      FieldName = 'Auditname'
      ProviderFlags = []
      Size = 16
    end
    object dtMainstatus_c: TStringField
      FieldName = 'status_c'
      ProviderFlags = []
      Size = 6
    end
    object dtMainrkey94: TAutoIncField
      FieldName = 'rkey94'
      ProviderFlags = []
    end
    object dtMainPURCHASE_APPROV_DESC: TStringField
      FieldName = 'PURCHASE_APPROV_DESC'
      ProviderFlags = []
      Size = 40
    end
    object dtMainfac_name: TStringField
      FieldName = 'fac_name'
      ProviderFlags = []
      Size = 10
    end
    object dtMainallow_submit_c: TStringField
      FieldName = 'allow_submit_c'
      ProviderFlags = []
      Size = 6
    end
    object dtMainallow_submit_person_code: TStringField
      FieldName = 'allow_submit_person_code'
      ProviderFlags = []
      Size = 10
    end
    object dtMainallow_submit_person_name: TStringField
      FieldName = 'allow_submit_person_name'
      ProviderFlags = []
      Size = 16
    end
    object dtMainWorkOrder: TStringField
      FieldName = 'WorkOrder'
      ProviderFlags = []
      Size = 15
    end
    object dtMainPlanMainDate: TDateTimeField
      FieldName = 'PlanMainDate'
      ProviderFlags = []
    end
    object dtMainDeviNumb: TStringField
      FieldName = 'DeviNumb'
      ProviderFlags = []
    end
    object dtMainMainCycl: TStringField
      FieldName = 'MainCycl'
      ProviderFlags = []
      Size = 10
    end
    object dtMainRepairNUMBER: TStringField
      FieldName = 'RepairNUMBER'
      ProviderFlags = []
      Size = 15
    end
    object dtMainCODE: TStringField
      FieldName = 'CODE'
      ProviderFlags = []
      Size = 15
    end
    object dtMainD831_ptr: TIntegerField
      FieldName = 'D831_ptr'
    end
    object dtMainD835_ptr: TIntegerField
      FieldName = 'D835_ptr'
    end
    object dtMainD567_ptr: TIntegerField
      FieldName = 'D567_ptr'
    end
    object dtMainFASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      ProviderFlags = []
      Size = 30
    end
    object dtMainD840_ptr: TIntegerField
      FieldName = 'D840_ptr'
    end
    object dtMainLocation: TStringField
      FieldName = 'Location'
      ProviderFlags = []
    end
    object dtMainFASSET_CODE: TStringField
      FieldName = 'FASSET_CODE'
      ProviderFlags = []
    end
    object dtMainDeptName: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DeptName'
      ProviderFlags = []
      Size = 50
    end
    object dtMainWorkName: TStringField
      DisplayLabel = #24037#20316#20219#21153#21517#31216
      FieldName = 'WorkName'
      ProviderFlags = []
      Size = 50
    end
    object dtMainWorkExpl: TStringField
      DisplayLabel = #24037#20316#20219#21153#35828#26126
      FieldName = 'WorkExpl'
      ProviderFlags = []
      Size = 200
    end
    object dtMainfailure_circs: TStringField
      FieldName = 'failure_circs'
      ProviderFlags = []
      Size = 200
    end
    object dtMainmaintain_text: TStringField
      FieldName = 'maintain_text'
      ProviderFlags = []
      Size = 200
    end
    object dtMainEMPLOYEE_DEPT_NAME: TStringField
      FieldName = 'EMPLOYEE_DEPT_NAME'
      ProviderFlags = []
      Size = 30
    end
  end
  object cds0005: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select RKEY,EMPL_CODE,EMPLOYEE_NAME from DATA0005'#13#10'--where ACTIV' +
      'E_FLAG='#39'Y'#39
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 358
    Top = 379
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
  object cds0015: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select RKEY,WAREHOUSE_CODE,WAREHOUSE_NAME,ABBR_NAME from data001' +
      '5'
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 358
    Top = 324
    object cds0015RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object cds0015WAREHOUSE_CODE: TStringField
      DisplayLabel = #24037#21378#20195#30721
      DisplayWidth = 8
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object cds0015ABBR_NAME: TStringField
      DisplayLabel = #31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object cds0015WAREHOUSE_NAME: TStringField
      DisplayLabel = #24037#21378#21517#31216
      DisplayWidth = 30
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
  end
  object cds0094: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select data0094.RKEY,CODE,PURCHASE_APPROV_DESC from data0094'#13#10'jo' +
      'in data0034 on data0094.dept_ptr=data0034.rkey'#13#10'join data0005 on' +
      ' data0005.EMPLOYEE_ID=data0034.rkey'#13#10'where data0005.rkey=:vrkey ' +
      'and dbo.Data0094.type=2 and (data0034.ACTIVE_FLAG=0) '
    FilterOptions = [foCaseInsensitive]
    Params = <
      item
        DataType = ftUnknown
        Name = 'vrkey'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 358
    Top = 214
    object cds0094RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object cds0094CODE: TStringField
      DisplayLabel = #23457#25209#20195#30721
      FieldName = 'CODE'
      Size = 15
    end
    object cds0094PURCHASE_APPROV_DESC: TStringField
      DisplayLabel = #23457#25209#21517#31216
      FieldName = 'PURCHASE_APPROV_DESC'
      Size = 40
    end
  end
  object cds0840: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from data0840'#13#10'where active=1'
    IndexFieldNames = 'Location'
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    OnReconcileError = cds0840ReconcileError
    Left = 360
    Top = 488
    object cds0840rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object cds0840Location: TStringField
      DisplayLabel = #35774#22791#36131#20219#23567#32452
      FieldName = 'Location'
    end
  end
  object cds0034: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select RKEY,DEPT_CODE,DEPT_NAME from data0034 '#13#10'where (ttype in ' +
      '(4,5) or is_cost_dept=1)and (ACTIVE_FLAG=0)'#13#10'and RKEY in (select' +
      ' DEPT_PTR from data0417 )'#13#10#13#10'/*'#31867#22411'1'#24037#24207'4'#37096#38376'5'#29677#32452'*/'
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 358
    Top = 269
    object cds0034RKEY: TAutoIncField
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
      FieldName = 'DEPT_NAME'
      Size = 30
    end
  end
  object cds0835: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select dbo.data0835.rkey,WorkOrder,dbo.Data0830.DeptName, dbo.Da' +
      'ta0836.WorkName,WorkExpl'#13#10'from dbo.data0835'#13#10'join  dbo.Data0830 ' +
      'on dbo.data0835.DEPT_PTR=dbo.Data0830.rkey'#13#10'join dbo.Data0836 on' +
      ' dbo.data0835.Work_ptr=dbo.Data0836.rkey'#13#10'where Status <>2'#13#10'/*'#24050#39564 +
      #25910'*/'
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 358
    Top = 159
    object cds0835rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object cds0835WorkOrder: TStringField
      DisplayLabel = #24037#20316#21333#21495
      FieldName = 'WorkOrder'
      Size = 10
    end
    object cds0835DeptName: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DeptName'
      Size = 15
    end
    object cds0835WorkName: TStringField
      DisplayLabel = #20219#21153#21517#31216
      FieldName = 'WorkName'
      Size = 15
    end
    object cds0835WorkExpl: TStringField
      DisplayLabel = #20219#21153#35828#26126
      FieldName = 'WorkExpl'
      Size = 30
    end
  end
  object cds0831: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select dbo.data0831.rkey,PlanMainDate,DeviNumb,dbo.DATA0417.FASS' +
      'ET_NAME,MainCycl, '#13#10'Data0034.DEPT_CODE,Data0034.DEPT_NAME,DATA04' +
      '17.EquiType,data0840.Location'#13#10'from dbo.data0831'#13#10'join dbo.DATA0' +
      '417 on dbo.data0831.DeviNumb=dbo.DATA0417.FASSET_CODE'#13#10'join  dbo' +
      '.Data0034 on dbo.DATA0417.DEPT_PTR=dbo.Data0034.rkey'#13#10'join data0' +
      '840 on DATA0417.d840_ptr=data0840.rkey'#13#10'where RKEY832<>2'
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 358
    Top = 104
    object cds0831rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object cds0831DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      DisplayWidth = 8
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object cds0831PlanMainDate: TDateTimeField
      DisplayLabel = #20445#20859#26085#26399
      DisplayWidth = 10
      FieldName = 'PlanMainDate'
    end
    object cds0831DeviNumb: TStringField
      DisplayLabel = #35774#22791#32534#21495
      DisplayWidth = 15
      FieldName = 'DeviNumb'
    end
    object cds0831FASSET_NAME: TStringField
      DisplayLabel = #35774#22791#21517#31216
      DisplayWidth = 28
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object cds0831MainCycl: TStringField
      DisplayLabel = #20445#20859#21608#26399
      DisplayWidth = 6
      FieldName = 'MainCycl'
      Size = 10
    end
    object cds0831DEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object cds0831EquiType: TBooleanField
      FieldName = 'EquiType'
      Visible = False
    end
    object cds0831Location: TStringField
      DisplayLabel = #36131#20219#23567#32452
      DisplayWidth = 10
      FieldName = 'Location'
    end
  end
  object cds0017WM: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Declare @vWarehouse_ptr int '#13#10'set @vWarehouse_ptr= :vWarehouse_p' +
      'tr'#13#10#13#10'(SELECT     dbo.Data0017.RKEY, rtrim(dbo.Data0017.INV_PART' +
      '_NUMBER) INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCRIPTION,INV_' +
      'DESCRIPTION,GROUP_DESC, '#13#10'SUM(dbo.Data0022.QUAN_ON_HAND) AS Qty,' +
      ' dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME,  '#13#10'dbo.data0016' +
      '.LOCATION ,'#39#26222#36890#24211#23384#39' AS XY ,1 as PRINTIT'#13#10'FROM dbo.Data0017 INNER J' +
      'OIN  '#13#10'dbo.Data0022 ON dbo.Data0017.RKEY = dbo.Data0022.INVENTOR' +
      'Y_PTR INNER JOIN  '#13#10'dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PTR ' +
      '= dbo.Data0002.RKEY INNER JOIN '#13#10'dbo.Data0456 ON dbo.Data0022.GR' +
      'N_PTR = dbo.Data0456.RKEY INNER JOIN '#13#10'dbo.data0016 ON dbo.data0' +
      '022.LOCATION_PTR = dbo.data0016.RKEY INNER JOIN '#13#10'dbo.Data0023 O' +
      'N dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY INNER JOIN '#13#10'dbo.dat' +
      'a0496 ON dbo.Data0017.GROUP_PTR= dbo.data0496.Rkey '#13#10'WHERE   dbo' +
      '.Data0017.RKEY not in (0) AND (dbo.Data0022.QUAN_ON_HAND > 0)  '#13 +
      #10'and dbo.Data0456.warehouse_ptr =  @vWarehouse_ptr'#13#10'GROUP BY dbo' +
      '.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER,INV_DESCRIPTION,GRO' +
      'UP_DESC,  '#13#10'dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0002.UNIT' +
      '_NAME, dbo.Data0023.ABBR_NAME,dbo.data0016.LOCATION )   '#13#10'union ' +
      'all  '#13#10'(SELECT dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, ' +
      'dbo.Data0017.INV_PART_DESCRIPTION,INV_DESCRIPTION,GROUP_DESC,  '#13 +
      #10'SUM(dbo.Data0134.QUAN_ON_HAND) AS Qty, dbo.Data0002.UNIT_NAME,d' +
      'bo.Data0023.ABBR_NAME, '#13#10'dbo.Data0016.LOCATION , '#39'VMI'#24211#23384#39' AS XY_1' +
      ',0 '#13#10'FROM         dbo.DATA0134 INNER JOIN '#13#10'dbo.DATA0133 ON dbo.' +
      'DATA0134.GRN_PTR = dbo.DATA0133.RKEY INNER JOIN '#13#10'dbo.Data0017 O' +
      'N dbo.DATA0134.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN  '#13#10'd' +
      'bo.Data0016 ON dbo.DATA0134.LOCATION_PTR = dbo.Data0016.RKEY INN' +
      'ER JOIN '#13#10'dbo.Data0002 ON dbo.DATA0134.UNIT_PTR = dbo.Data0002.R' +
      'KEY INNER JOIN '#13#10'dbo.Data0023 ON dbo.DATA0133.SUPP_PTR = dbo.Dat' +
      'a0023.RKEY INNER JOIN  '#13#10'dbo.Data0001 ON dbo.DATA0133.currency_p' +
      'tr = dbo.Data0001.RKEY INNER JOIN    '#13#10'dbo.data0496 ON dbo.Data0' +
      '017.GROUP_PTR= dbo.data0496.Rkey '#13#10'WHERE   dbo.Data0017.RKEY not' +
      ' in (0) AND (dbo.Data0134.QUAN_ON_HAND > 0) '#13#10'AND dbo.Data0133.w' +
      'arehouse_ptr    =  @vWarehouse_ptr'#13#10'GROUP BY dbo.Data0017.RKEY, ' +
      'dbo.Data0017.INV_PART_NUMBER,INV_DESCRIPTION,GROUP_DESC,    '#13#10'db' +
      'o.Data0017.INV_PART_DESCRIPTION, dbo.Data0002.UNIT_NAME, dbo.Dat' +
      'a0023.ABBR_NAME,dbo.data0016.LOCATION )   '#13#10'ORDER BY  INV_PART_N' +
      'UMBER '
    FilterOptions = [foCaseInsensitive]
    Params = <
      item
        DataType = ftInteger
        Name = 'vWarehouse_ptr'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 701
    Top = 429
    object cds0017WMRKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object cds0017WMINV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      DisplayWidth = 21
      FieldName = 'INV_PART_NUMBER'
      ReadOnly = True
      Size = 25
    end
    object cds0017WMINV_PART_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#21517#31216
      DisplayWidth = 35
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object cds0017WMINV_DESCRIPTION: TStringField
      DisplayLabel = #35268#26684
      DisplayWidth = 25
      FieldName = 'INV_DESCRIPTION'
      ReadOnly = True
      Size = 70
    end
    object cds0017WMGROUP_DESC: TStringField
      DisplayLabel = #32452
      DisplayWidth = 10
      FieldName = 'GROUP_DESC'
      ReadOnly = True
      Size = 30
    end
    object cds0017WMQty: TBCDField
      DisplayLabel = #24211#23384#25968#37327
      DisplayWidth = 6
      FieldName = 'Qty'
      ReadOnly = True
      Precision = 32
    end
    object cds0017WMUNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      DisplayWidth = 10
      FieldName = 'UNIT_NAME'
      ReadOnly = True
    end
    object cds0017WMABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      DisplayWidth = 10
      FieldName = 'ABBR_NAME'
      ReadOnly = True
      Size = 16
    end
    object cds0017WMLOCATION: TStringField
      DisplayLabel = #20179#24211
      DisplayWidth = 10
      FieldName = 'LOCATION'
      ReadOnly = True
    end
    object cds0017WMXY: TStringField
      DisplayLabel = 'VMI'#24211#23384
      FieldName = 'XY'
      ReadOnly = True
      Size = 8
    end
    object cds0017WMPRINTIT: TIntegerField
      DisplayLabel = 'VMI'#24211#23384
      DisplayWidth = 8
      FieldName = 'PRINTIT'
      ReadOnly = True
      Visible = False
    end
  end
  object cds0567: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select complete_date,dbo.data0567.rkey,dbo.data0567.NUMBER,dbo.D' +
      'ATA0417.FASSET_CODE,'#13#10'dbo.DATA0417.FASSET_NAME,dbo.Data0034.DEPT' +
      '_NAME,failure_circs,maintain_text,'#13#10' case data0567.status when 0' +
      ' then '#39#26410#25552#20132#39' when 1 then '#39#24453#21463#29702#39' when 2 then '#39#24050#21463#29702#39#13#10'       when 3 t' +
      'hen '#39#24050#23436#24037#39' when 4 then '#39#24050#39564#25910#39' when 5 then '#39#34987#36864#22238#39' when 6 then '#39#24050#26242#20572#39' ' +
      #13#10'       when 8 then '#39#39564#25910#36864#22238#39'  end as V_stat, Data0034.DEPT_CODE,D' +
      'ATA0417.EquiType,data0840.Location'#13#10'from dbo.data0567'#13#10'join dbo.' +
      'DATA0417 on dbo.data0567.Fasset_ptr=dbo.DATA0417.rkey'#13#10'join  dbo' +
      '.Data0034 on dbo.DATA0417.DEPT_PTR=dbo.Data0034.rkey'#13#10'left join ' +
      'data0840 on data0567.d840_ptr=data0840.rkey'#13#10'where (STATUS in (1' +
      ',2,6))or('#13#10'(STATUS in (3,4))'#13#10'and(complete_date>=cast(cast(year ' +
      ' (getdate())as char(4))+'#39'-'#39'+cast(month(getdate())as char(2))+'#39'-1' +
      #39'as datetime))'#13#10'/*(STATUS in (3,4))and(DateAdd(day,1,complete_da' +
      'te)>=getdate())'#24352#20852#26106#26368#26089#25552#20986#25552#21069#19968#22825#65292#21518#21448#25552#20986#21482#33021#26159#24403#26376'*/'#13#10')'
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 358
    Top = 434
    object cds0567rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object cds0567NUMBER: TStringField
      DisplayLabel = #32500#20462#21333#21495
      FieldName = 'NUMBER'
      Size = 10
    end
    object cds0567V_stat: TStringField
      DisplayLabel = #29366#24577
      DisplayWidth = 6
      FieldName = 'V_stat'
      ReadOnly = True
      Size = 8
    end
    object cds0567FASSET_CODE: TStringField
      DisplayLabel = #35774#22791#20195#30721
      DisplayWidth = 12
      FieldName = 'FASSET_CODE'
    end
    object cds0567FASSET_NAME: TStringField
      DisplayLabel = #35774#22791#21517#31216
      DisplayWidth = 20
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object cds0567DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      DisplayWidth = 8
      FieldName = 'DEPT_NAME'
      Size = 12
    end
    object cds0567failure_circs: TStringField
      DisplayLabel = #25925#38556#24773#20917#35828#26126
      DisplayWidth = 25
      FieldName = 'failure_circs'
      Size = 200
    end
    object cds0567maintain_text: TStringField
      DisplayLabel = #32500#20462#35760#24405#35828#26126
      DisplayWidth = 25
      FieldName = 'maintain_text'
      Size = 200
    end
    object cds0567DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Visible = False
      Size = 10
    end
    object cds0567EquiType: TBooleanField
      DisplayWidth = 2
      FieldName = 'EquiType'
      Visible = False
    end
    object cds0567Location: TStringField
      DisplayLabel = #36131#20219#23567#32452
      DisplayWidth = 8
      FieldName = 'Location'
    end
  end
end
