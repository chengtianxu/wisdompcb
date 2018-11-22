inherited FileGroup_f: TFileGroup_f
  Left = 514
  Top = 163
  Width = 887
  Height = 674
  Caption = #20379#24212#21830#29615#20445#27979#35797#25253#21578
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 12
  inherited StatusBar1: TStatusBar
    Top = 621
    Width = 879
  end
  inherited RzToolbar1: TRzToolbar
    Width = 879
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
  end
  inherited Panel_Left: TPanel
    Height = 580
  end
  inherited Panel_Main: TPanel
    Width = 867
    Height = 580
    inherited Splitter1: TSplitter
      Width = 867
    end
    inherited Panel_Below: TPanel
      Width = 867
      Height = 272
      inherited Panel_Bottom: TPanel
        Top = 242
        Width = 867
        Height = 30
        object BtFind: TSpeedButton
          Left = 910
          Top = 5
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
          Left = 623
          Top = 0
          Width = 284
          Height = 30
          Align = alLeft
          Caption = #25253#21578#26377#25928#24615#29366#24577
          TabOrder = 0
          object CheckBox1: TCheckBox
            Left = 16
            Top = 12
            Width = 80
            Height = 17
            Caption = #26377#25928#26399#20869
            TabOrder = 0
          end
          object CheckBox2: TCheckBox
            Left = 107
            Top = 12
            Width = 80
            Height = 17
            Caption = #38656#35201#26356#26032
            TabOrder = 1
          end
          object CheckBox3: TCheckBox
            Left = 199
            Top = 12
            Width = 80
            Height = 17
            Caption = #24050#36807#26399
            TabOrder = 2
          end
        end
        object GroupBox2: TGroupBox
          Left = 0
          Top = 0
          Width = 193
          Height = 30
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
        object GroupBox3: TGroupBox
          Left = 193
          Top = 0
          Width = 430
          Height = 30
          Align = alLeft
          Caption = #29366#24577
          TabOrder = 2
          object CheckBox_Status1: TCheckBox
            Left = 8
            Top = 12
            Width = 60
            Height = 17
            Caption = #26410#25552#20132
            Checked = True
            State = cbChecked
            TabOrder = 0
            OnClick = CheckBox_Status1Click
          end
          object CheckBox_Status2: TCheckBox
            Left = 82
            Top = 12
            Width = 60
            Height = 17
            Caption = #24050#25552#20132
            Checked = True
            State = cbChecked
            TabOrder = 1
            OnClick = CheckBox_Status1Click
          end
          object CheckBox_Status3: TCheckBox
            Left = 157
            Top = 12
            Width = 60
            Height = 17
            Caption = #24050#23457#26680
            Checked = True
            State = cbChecked
            TabOrder = 2
            OnClick = CheckBox_Status1Click
          end
          object CheckBox_Status4: TCheckBox
            Left = 232
            Top = 12
            Width = 60
            Height = 17
            Caption = #24453#37325#20570
            Checked = True
            State = cbChecked
            TabOrder = 3
            OnClick = CheckBox_Status1Click
          end
          object CheckBox_Status5: TCheckBox
            Left = 302
            Top = 11
            Width = 60
            Height = 17
            Caption = #24050#36864#22238
            Checked = True
            State = cbChecked
            TabOrder = 4
            OnClick = CheckBox_Status1Click
          end
          object CheckBox_Status6: TCheckBox
            Left = 370
            Top = 10
            Width = 60
            Height = 17
            Caption = #24050#22833#25928
            TabOrder = 5
            OnClick = CheckBox_Status1Click
          end
        end
      end
      inherited Panel9: TPanel
        Width = 867
        Height = 237
        inherited Panel10: TPanel
          Left = 747
          Height = 237
          inherited RzToolbar_right_2: TRzToolbar
            Height = 237
            ToolbarControls = (
              Button1
              btn_Open
              btn_Upload)
            object btn_Open: TButton
              Left = 4
              Top = 37
              Width = 111
              Height = 23
              Caption = #25171#24320#25991#20214
              TabOrder = 1
              OnClick = btn_OpenClick
            end
            object btn_Upload: TButton
              Left = 4
              Top = 67
              Width = 111
              Height = 25
              Caption = #19978#20256#25991#20214
              TabOrder = 2
              OnClick = btn_UploadClick
            end
          end
          inherited Panel3: TPanel
            Height = 237
          end
        end
        inherited PageControl_D: TPageControl
          Width = 747
          Height = 237
          inherited TabSheet3: TTabSheet
            inherited dghChild: TDBGridEh
              Width = 739
              Height = 210
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'FileType'
                  Footers = <>
                  PickList.Strings = (
                    'SGS'
                    'MSDS'
                    #29615#20445#21327#35758
                    #29289#26009#35797#29992#25253#21578)
                end
                item
                  EditButtons = <>
                  FieldName = 'FileName'
                  Footers = <>
                  Width = 553
                end
                item
                  EditButtons = <>
                  FieldName = 'Remarks'
                  Footers = <>
                  Width = 340
                end>
            end
          end
          inherited TabSheet4: TTabSheet
            object Label13: TLabel
              Left = 16
              Top = 8
              Width = 48
              Height = 12
              Caption = #25991#20214#31867#22411
            end
            object Label14: TLabel
              Left = 16
              Top = 48
              Width = 36
              Height = 12
              Caption = #25991#20214#21517
            end
            object Label15: TLabel
              Left = 16
              Top = 88
              Width = 24
              Height = 12
              Caption = #22791#27880
            end
            object edt_FileName: TDBEdit
              Left = 17
              Top = 64
              Width = 400
              Height = 20
              Color = clInactiveCaption
              DataField = 'FileName'
              DataSource = dsChild
              ReadOnly = True
              TabOrder = 0
            end
            object DBMemo2_Remarks: TDBMemo
              Left = 17
              Top = 102
              Width = 185
              Height = 89
              DataField = 'Remarks'
              DataSource = dsChild
              TabOrder = 1
            end
            object DBComboBox_FileType: TDBComboBox
              Left = 17
              Top = 24
              Width = 112
              Height = 20
              DataField = 'FileType'
              DataSource = dsChild
              ItemHeight = 12
              Items.Strings = (
                'SGS'
                'MSDS'
                #29615#20445#21327#35758
                #29289#26009#35797#29992#25253#21578)
              TabOrder = 2
            end
          end
        end
      end
      inherited Panel12: TPanel
        Width = 867
      end
    end
    inherited Panel_Above: TPanel
      Width = 867
      inherited Panel5: TPanel
        Width = 867
        inherited Panel7: TPanel
          Left = 747
          inherited RzToolbar_right_1: TRzToolbar
            ToolbarControls = (
              btn1
              bt_Expand
              bt_Confirm
              bt_Return
              bt_UConfirm
              btn_TemporarilyBy
              btn_ToCancel
              Button2
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
            object bt_Confirm: TButton
              Left = 4
              Top = 67
              Width = 112
              Height = 25
              Caption = #23457#26680
              TabOrder = 2
              OnClick = bt_ConfirmClick
            end
            object bt_Return: TButton
              Left = 4
              Top = 98
              Width = 112
              Height = 25
              Caption = #36864#22238
              TabOrder = 3
              OnClick = bt_ReturnClick
            end
            object bt_UConfirm: TButton
              Left = 4
              Top = 129
              Width = 112
              Height = 25
              Caption = #37325#20570
              TabOrder = 4
              OnClick = bt_UConfirmClick
            end
            object btn_TemporarilyBy: TButton
              Left = 4
              Top = 160
              Width = 111
              Height = 25
              Caption = #26242#26102#36890#36807
              TabOrder = 5
              OnClick = btn_TemporarilyByClick
            end
            object btn_ToCancel: TButton
              Left = 4
              Top = 191
              Width = 111
              Height = 25
              Caption = #21462#28040#36890#36807
              TabOrder = 6
              OnClick = btn_ToCancelClick
            end
            object Button2: TButton
              Left = 4
              Top = 222
              Width = 112
              Height = 25
              Caption = #22833#25928
              TabOrder = 7
              OnClick = Button2Click
            end
            object Button3: TButton
              Left = 4
              Top = 253
              Width = 112
              Height = 25
              Caption = #37325#26032#21551#29992
              TabOrder = 8
              OnClick = Button3Click
            end
          end
        end
        inherited PageControl_M: TPageControl
          Width = 747
          inherited TabSheet1: TTabSheet
            inherited DghMain: TDBGridEh
              Width = 739
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'CODE'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'ABBR_NAME'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'INV_Type'
                  Footers = <>
                  Width = 56
                end
                item
                  EditButtons = <>
                  FieldName = 'INV_Name'
                  Footers = <>
                  Width = 87
                end
                item
                  EditButtons = <>
                  FieldName = 'Model'
                  Footers = <>
                  Width = 75
                end
                item
                  EditButtons = <>
                  FieldName = 'RoHsFree'
                  Footers = <>
                  KeyList.Strings = (
                    #19968#32423'(RoHS)'
                    #20108#32423'('#26080#21348')')
                  PickList.Strings = (
                    #19968#32423'(RoHS)'
                    #20108#32423'('#26080#21348')')
                  Width = 67
                end
                item
                  EditButtons = <>
                  FieldName = 'SGS_NO'
                  Footers = <>
                  Title.Caption = 'SGS'#32534#21495
                  Width = 159
                end
                item
                  EditButtons = <>
                  FieldName = 'TestDate'
                  Footers = <>
                  Width = 66
                end
                item
                  EditButtons = <>
                  FieldName = 'EffeDate'
                  Footers = <>
                  Width = 68
                end
                item
                  EditButtons = <>
                  FieldName = 'RepoVali'
                  Footers = <>
                  Width = 65
                end
                item
                  EditButtons = <>
                  FieldName = 'v_Status'
                  Footers = <>
                  Width = 44
                end
                item
                  EditButtons = <>
                  FieldName = 'TemporBy'
                  Footers = <>
                  Width = 47
                end
                item
                  EditButtons = <>
                  FieldName = 'TemporTo'
                  Footers = <>
                  Width = 69
                end
                item
                  EditButtons = <>
                  FieldName = 'USER_FULL_NAME'
                  Footers = <>
                  Width = 63
                end
                item
                  EditButtons = <>
                  FieldName = 'EntrTime'
                  Footers = <>
                  Width = 99
                end
                item
                  EditButtons = <>
                  FieldName = 'Remarks'
                  Footers = <>
                  Width = 260
                end>
            end
          end
          inherited TabSheet2: TTabSheet
            object Label1: TLabel
              Left = 16
              Top = 8
              Width = 60
              Height = 12
              Caption = #20379#24212#21830#20195#30721
            end
            object Label2: TLabel
              Left = 16
              Top = 48
              Width = 60
              Height = 12
              Caption = #20379#24212#21830#21517#31216
            end
            object Label3: TLabel
              Left = 16
              Top = 88
              Width = 24
              Height = 12
              Caption = #31867#21035
            end
            object Label4: TLabel
              Left = 16
              Top = 128
              Width = 24
              Height = 12
              Caption = #22411#21495
            end
            object Label5: TLabel
              Left = 16
              Top = 168
              Width = 48
              Height = 12
              Caption = #27979#35797#26085#26399
            end
            object Label6: TLabel
              Left = 192
              Top = 7
              Width = 48
              Height = 12
              Caption = #26377#25928#26085#26399
            end
            object Label7: TLabel
              Left = 192
              Top = 47
              Width = 84
              Height = 12
              Caption = #25253#21578#26377#25928#24615#30830#35748
            end
            object Label8: TLabel
              Left = 192
              Top = 87
              Width = 24
              Height = 12
              Caption = #29366#24577
            end
            object Label9: TLabel
              Left = 192
              Top = 151
              Width = 36
              Height = 12
              Caption = #26242#26102#33267
            end
            object Label10: TLabel
              Left = 360
              Top = 7
              Width = 36
              Height = 12
              Caption = #24405#20837#20154
            end
            object Label11: TLabel
              Left = 360
              Top = 47
              Width = 48
              Height = 12
              Caption = #24405#20837#26102#38388
            end
            object Label12: TLabel
              Left = 360
              Top = 87
              Width = 24
              Height = 12
              Caption = #22791#27880
            end
            object edt_ABBR_NAME: TDBEdit
              Left = 16
              Top = 64
              Width = 121
              Height = 20
              Color = clInactiveCaption
              DataField = 'ABBR_NAME'
              DataSource = dsMain
              ReadOnly = True
              TabOrder = 0
            end
            object edt_Model: TDBEdit
              Left = 16
              Top = 144
              Width = 121
              Height = 20
              DataField = 'Model'
              DataSource = dsMain
              TabOrder = 1
            end
            object edt_RepoVali: TDBEdit
              Left = 192
              Top = 63
              Width = 121
              Height = 20
              Color = clInactiveCaption
              DataField = 'RepoVali'
              DataSource = dsMain
              ReadOnly = True
              TabOrder = 2
            end
            object edt_Status: TDBEdit
              Left = 192
              Top = 103
              Width = 121
              Height = 20
              Color = clInactiveCaption
              DataField = 'v_Status'
              DataSource = dsMain
              ReadOnly = True
              TabOrder = 3
            end
            object edt_TemporTo: TDBEdit
              Left = 192
              Top = 167
              Width = 121
              Height = 20
              Color = clInactiveCaption
              DataField = 'TemporTo'
              DataSource = dsMain
              ReadOnly = True
              TabOrder = 4
            end
            object edt_USER_FULL_NAME: TDBEdit
              Left = 359
              Top = 23
              Width = 121
              Height = 20
              Color = clInactiveCaption
              DataField = 'USER_FULL_NAME'
              DataSource = dsMain
              ReadOnly = True
              TabOrder = 5
            end
            object edt_EntrTime: TDBEdit
              Left = 359
              Top = 63
              Width = 121
              Height = 20
              Color = clInactiveCaption
              DataField = 'EntrTime'
              DataSource = dsMain
              ReadOnly = True
              TabOrder = 6
            end
            object DBMemo_Remarks: TDBMemo
              Left = 359
              Top = 103
              Width = 185
              Height = 89
              DataField = 'Remarks'
              DataSource = dsMain
              TabOrder = 7
            end
            object dbDate_TestDate: TDBDateTimeEditEh
              Left = 16
              Top = 184
              Width = 113
              Height = 20
              DataField = 'TestDate'
              DataSource = dsMain
              EditButtons = <>
              TabOrder = 8
              Visible = True
              EditFormat = 'YYYY-MM-DD'
            end
            object dbDate_EffeDate: TDBDateTimeEditEh
              Left = 192
              Top = 23
              Width = 113
              Height = 20
              DataField = 'EffeDate'
              DataSource = dsMain
              EditButtons = <>
              TabOrder = 9
              Visible = True
              EditFormat = 'YYYY-MM-DD'
            end
            object DBCheckBox_TemporBy: TDBCheckBox
              Left = 192
              Top = 128
              Width = 97
              Height = 17
              Caption = #26242#26102#36890#36807
              Color = clActiveBorder
              DataField = 'TemporBy'
              DataSource = dsMain
              ParentColor = False
              ReadOnly = True
              TabOrder = 10
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object edt_CODE: TDBButtonEdit
              Tag = 1
              Left = 16
              Top = 23
              Width = 121
              Height = 20
              Hint = #25353'F1'#24377#20986#19979#25289#21015#34920
              DataSource = dsMain
              DataField = 'CODE'
              ParentShowHint = False
              ReadOnlyColor = clInactiveCaptionText
              ShowHint = True
              TabOrder = 11
              F_DownFormWidth = 0
              F_DownListDataSet = dt0023
              F_DownDataSetFilterField = 'Code'
              F_ResultFieldName = 'Code'
              F_GetFieldName = 'Code'
              F_PressKey13AutoDrop = False
            end
            object edt_INV_Type: TDBButtonEdit
              Tag = 1
              Left = 17
              Top = 104
              Width = 121
              Height = 20
              Hint = #25353'F1'#24377#20986#19979#25289#21015#34920
              DataSource = dsMain
              DataField = 'INV_Type'
              ParentShowHint = False
              ReadOnlyColor = clInactiveCaptionText
              ShowHint = True
              TabOrder = 12
              F_DownFormWidth = 0
              F_DownListDataSet = dt_INV_Type
              F_DownDataSetFilterField = 'INV_Type'
              F_ResultFieldName = 'INV_Type'
              F_GetFieldName = 'INV_Type'
              F_PressKey13AutoDrop = False
            end
          end
        end
      end
      inherited Panel_Top: TPanel
        Width = 867
      end
      inherited Panel11: TPanel
        Width = 867
      end
    end
  end
  inherited Panel_right: TPanel
    Left = 873
    Height = 580
  end
  inherited MainGrid_PopupMenu: TPopupMenu
    Left = 677
    Top = 130
    inherited N_SeeLog: TMenuItem
      OnClick = N_SeeLogClick
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
  inherited dtRead: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'select DISTINCT(INV_Type) from'#13#10'(select top 1000 INV_Type from  ' +
      'data0805 order by rkey)as t1'
  end
  inherited cdsMain: Tcds
    CommandText = 
      'select * from (select '#13#10'Case when datediff(day,getdate(),effedat' +
      'e) >=30 then 1 '#13#10'     when datediff(day,getdate(),effedate) >=1 ' +
      'and datediff(day,getdate(),effedate)<30 then 2'#13#10'     when datedi' +
      'ff(day,getdate(),effedate) <1 then 3 '#13#10'end as [Vali],'#13#10'data0023.' +
      'CODE,data0023.ABBR_NAME,data0073.USER_FULL_NAME,'#13#10'data0805.* fro' +
      'm data0805'#13#10'join data0023 on data0805.D023_ptr=data0023.rkey'#13#10'jo' +
      'in data0073 on data0805.D073_ptr=data0073.rkey)as data0805'
    AfterEdit = cdsMainAfterEdit
    OnCalcFields = cdsMainCurrentDateCalcFields
    F_AutoIncrField = 'rkey'
    F_TableName = 'Data0805'
    F_SQLSelectFrom = 
      'select * from (select '#13#10'Case when datediff(day,getdate(),effedat' +
      'e) >=30 then 1 '#13#10'     when datediff(day,getdate(),effedate) >=1 ' +
      'and datediff(day,getdate(),effedate)<30 then 2'#13#10'     when datedi' +
      'ff(day,getdate(),effedate) <1 then 3 '#13#10'end as [Vali],'#13#10'data0023.' +
      'CODE,data0023.ABBR_NAME,data0073.USER_FULL_NAME,'#13#10'data0805.* fro' +
      'm data0805'#13#10'join data0023 on data0805.D023_ptr=data0023.rkey'#13#10'jo' +
      'in data0073 on data0805.D073_ptr=data0073.rkey)as data0805'
    F_SQLOrderBy = 'order by CODE,Model'
    object cdsMainCODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      ProviderFlags = []
      OnChange = cdsMainCODEChange
      Size = 10
    end
    object cdsMainABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'ABBR_NAME'
      ProviderFlags = []
      Size = 16
    end
    object cdsMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object cdsMainD023_ptr: TIntegerField
      FieldName = 'D023_ptr'
    end
    object cdsMainINV_Type: TStringField
      DisplayLabel = #31867#21035
      FieldName = 'INV_Type'
    end
    object cdsMainINV_Name: TStringField
      DisplayLabel = #29289#26009#21517#31216
      FieldName = 'INV_Name'
    end
    object cdsMainModel: TStringField
      DisplayLabel = #22411#21495
      FieldName = 'Model'
    end
    object cdsMainTestDate: TDateTimeField
      DisplayLabel = #27979#35797#26085#26399
      FieldName = 'TestDate'
      OnChange = cdsMainTestDateChange
      DisplayFormat = 'YYYY-MM-DD'
    end
    object cdsMainEffeDate: TDateTimeField
      DisplayLabel = #26377#25928#26085#26399
      FieldName = 'EffeDate'
      DisplayFormat = 'YYYY-MM-DD'
    end
    object cdsMainRepoVali: TStringField
      DisplayLabel = #25253#21578#26377#25928#24615
      FieldKind = fkCalculated
      FieldName = 'RepoVali'
      OnGetText = cdsMainRepoValiGetText
      Calculated = True
    end
    object cdsMainStatus: TSmallintField
      DisplayLabel = #29366#24577
      FieldName = 'Status'
    end
    object cdsMainv_Status: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkCalculated
      FieldName = 'v_Status'
      Size = 10
      Calculated = True
    end
    object cdsMainTemporBy: TBooleanField
      DisplayLabel = #26242#26102#36890#36807
      FieldName = 'TemporBy'
    end
    object cdsMainTemporTo: TDateTimeField
      DisplayLabel = #26242#26102#33267
      FieldName = 'TemporTo'
    end
    object cdsMainD073_ptr: TIntegerField
      FieldName = 'D073_ptr'
    end
    object cdsMainUSER_FULL_NAME: TStringField
      DisplayLabel = #24405#20837#20154
      FieldName = 'USER_FULL_NAME'
      ProviderFlags = []
      Size = 30
    end
    object cdsMainEntrTime: TDateTimeField
      DisplayLabel = #24405#20837#26102#38388
      FieldName = 'EntrTime'
      DisplayFormat = 'YYYY-MM-DD HH:mm'
    end
    object cdsMainRemarks: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Remarks'
      Size = 200
    end
    object cdsMainRoHsFree: TStringField
      DisplayLabel = 'RoHS/'#26080#21348
      FieldName = 'RoHsFree'
    end
    object cdsMainSGS_NO: TStringField
      FieldName = 'SGS_NO'
      Size = 25
    end
  end
  inherited cdsChild: Tcds
    CommandText = 'select rkey,D805_ptr,FileType,[FileName],Remarks from data0806'
    AfterEdit = cdsChildAfterEdit
    AfterDelete = cdsChildAfterDelete
    F_AutoIncrField = 'rkey'
    F_UniqueKey = 'FileType'
    F_TableName = 'Data0806'
    F_SQLSelectFrom = 'select rkey,D805_ptr,FileType,[FileName],Remarks from data0806'
    F_Primarykey = 'rkey'
    F_Foreignkey = 'D805_ptr'
    object cdsChildrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object cdsChildD805_ptr: TIntegerField
      FieldName = 'D805_ptr'
    end
    object cdsChildFileType: TSmallintField
      DisplayLabel = #25991#20214#31867#22411
      FieldName = 'FileType'
      OnGetText = cdsChildFileTypeGetText
      OnSetText = cdsChildFileTypeSetText
    end
    object cdsChildFileName: TStringField
      DisplayLabel = #25991#20214#21517
      FieldName = 'FileName'
      Size = 100
    end
    object cdsChildRemarks: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Remarks'
      Size = 200
    end
  end
  inherited dtChild: TADODataSet
    CursorType = ctStatic
    CommandText = 'select rkey,D805_ptr,FileType,[FileName],Remarks from data0806'
  end
  inherited dspMain: TDataSetProvider
    OnGetTableName = dspMainGetTableName
  end
  inherited dtMain: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'select * from (select '#13#10'Case when datediff(day,getdate(),effedat' +
      'e) >=30 then 1 '#13#10'     when datediff(day,getdate(),effedate) >=1 ' +
      'and datediff(day,getdate(),effedate)<30 then 2'#13#10'     when datedi' +
      'ff(day,getdate(),effedate) <1 then 3 '#13#10'end as [Vali],'#13#10'data0023.' +
      'CODE,data0023.ABBR_NAME,data0073.USER_FULL_NAME,'#13#10'data0805.* fro' +
      'm data0805'#13#10'join data0023 on data0805.D023_ptr=data0023.rkey'#13#10'jo' +
      'in data0073 on data0805.D073_ptr=data0073.rkey)as data0805'
    object dtMainCODE: TStringField
      FieldName = 'CODE'
      ProviderFlags = []
      Size = 10
    end
    object dtMainABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      ProviderFlags = []
      Size = 16
    end
    object dtMainUSER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      ProviderFlags = []
      Size = 30
    end
    object dtMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object dtMainD023_ptr: TIntegerField
      FieldName = 'D023_ptr'
    end
    object dtMainINV_Type: TStringField
      FieldName = 'INV_Type'
    end
    object dtMainModel: TStringField
      FieldName = 'Model'
    end
    object dtMainTestDate: TDateTimeField
      FieldName = 'TestDate'
    end
    object dtMainEffeDate: TDateTimeField
      FieldName = 'EffeDate'
    end
    object dtMainStatus: TWordField
      FieldName = 'Status'
    end
    object dtMainTemporBy: TBooleanField
      FieldName = 'TemporBy'
    end
    object dtMainTemporTo: TDateTimeField
      FieldName = 'TemporTo'
    end
    object dtMainD073_ptr: TIntegerField
      FieldName = 'D073_ptr'
    end
    object dtMainEntrTime: TDateTimeField
      FieldName = 'EntrTime'
    end
    object dtMainRemarks: TStringField
      FieldName = 'Remarks'
      Size = 200
    end
    object dtMainINV_Name: TStringField
      FieldName = 'INV_Name'
    end
    object dtMainRoHsFree: TStringField
      FieldName = 'RoHsFree'
    end
    object dtMainSGS_NO: TStringField
      FieldName = 'SGS_NO'
      Size = 25
    end
  end
  object cds0023: TClientDataSet
    Aggregates = <>
    CommandText = 'select RKEY,CODE,ABBR_NAME from data0023'#13#10'where status=0'
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 528
    Top = 512
    object cds0023RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object cds0023CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object cds0023ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'ABBR_NAME'
      Size = 16
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 642
    Top = 352
  end
  object SaveDialog1: TSaveDialog
    Left = 706
    Top = 352
  end
  object qryTemp: TADOQuery
    Connection = DM_frm.ADOConnection1
    Parameters = <>
    Left = 605
    Top = 519
  end
  object cds_INV_Type: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select DISTINCT(INV_Type) from'#13#10'(select top 1000 INV_Type from  ' +
      'data0805 order by rkey)as t1'
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 448
    Top = 520
    object cds_INV_TypeINV_Type: TStringField
      DisplayLabel = #31867#22411
      FieldName = 'INV_Type'
    end
  end
  object dt0023: TADODataSet
    Connection = DM_frm.ADOConnection1
    CursorType = ctStatic
    CommandText = 'select RKEY,CODE,ABBR_NAME from data0023'#13#10'where status=0'
    Parameters = <>
    Left = 524
    Top = 456
    object dt0023RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object dt0023CODE: TStringField
      FieldName = 'CODE'
      ReadOnly = True
      Size = 10
    end
    object dt0023ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      ReadOnly = True
      Size = 16
    end
  end
  object dt_INV_Type: TADODataSet
    Connection = DM_frm.ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select DISTINCT(INV_Type) from'#13#10'(select top 1000 INV_Type from  ' +
      'data0805 order by rkey)as t1'
    Parameters = <>
    Left = 444
    Top = 456
    object dt_INV_TypeINV_Type: TStringField
      FieldName = 'INV_Type'
    end
  end
end
