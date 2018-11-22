inherited BOM_frm: TBOM_frm
  Left = 280
  Top = 171
  Width = 843
  Height = 596
  Caption = 'BOM'#35774#32622
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 12
  inherited StatusBar1: TStatusBar
    Top = 543
    Width = 835
  end
  inherited RzToolbar1: TRzToolbar
    Width = 835
    ToolbarControls = (
      tblAdd
      tblEdit
      tblSave
      tblCancel
      tblDelete
      RzSpacer1
      tblRefresh
      tblfind
      tblExport
      tblFilter
      tblCancelFilter
      tblPrint
      tblDesign
      RzSpacer2
      tblFirst
      tblPrior
      tblNext
      tblLast)
    inherited tblRefresh: TRzToolButton
      Left = 207
    end
    inherited tblfind: TRzToolButton
      Left = 246
    end
    inherited tblExport: TRzToolButton
      Left = 285
    end
    inherited tblFilter: TRzToolButton
      Left = 324
    end
    inherited tblCancelFilter: TRzToolButton
      Left = 363
    end
    inherited tblPrint: TRzToolButton
      Left = 419
    end
    inherited tblDesign: TRzToolButton
      Left = 458
    end
    inherited tblFirst: TRzToolButton
      Left = 522
    end
    inherited tblPrior: TRzToolButton
      Left = 561
    end
    inherited tblNext: TRzToolButton
      Left = 600
    end
    inherited tblLast: TRzToolButton
      Left = 639
    end
  end
  inherited Panel_Left: TPanel
    Height = 502
  end
  inherited Panel_Main: TPanel
    Width = 823
    Height = 502
    inherited Splitter1: TSplitter
      Width = 823
    end
    inherited Panel_Below: TPanel
      Width = 823
      Height = 194
      inherited Panel_Bottom: TPanel
        Top = 166
        Width = 823
        Height = 28
      end
      inherited Panel9: TPanel
        Width = 823
        Height = 161
        inherited Panel10: TPanel
          Left = 703
          Height = 161
          inherited RzToolbar_right_2: TRzToolbar
            Height = 161
            ToolbarControls = (
              Button1
              bt_Replace
              bt_Batch
              Button5)
            object bt_Replace: TButton
              Left = 4
              Top = 36
              Width = 112
              Height = 25
              Caption = #26367#20195#26009
              Enabled = False
              TabOrder = 1
              OnClick = bt_ReplaceClick
            end
            object bt_Batch: TButton
              Left = 4
              Top = 67
              Width = 112
              Height = 25
              Hint = #25209#37327#26356#26032#23376#28165#21333#32534#21495
              Caption = #25209#26356#26032
              Enabled = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              OnClick = bt_BatchClick
            end
            object Button5: TButton
              Left = 4
              Top = 98
              Width = 112
              Height = 25
              Caption = 'BOM'#34892#22797#21046
              Enabled = False
              TabOrder = 3
              Visible = False
            end
          end
          inherited Panel3: TPanel
            Height = 161
          end
        end
        inherited PageControl_D: TPageControl
          Width = 703
          Height = 161
          inherited TabSheet3: TTabSheet
            inherited dghChild: TDBGridEh
              Width = 695
              Height = 134
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'ListNumber'
                  Footers = <>
                  Width = 63
                end
                item
                  EditButtons = <>
                  FieldName = 'Type'
                  Footers = <>
                  Width = 40
                end
                item
                  EditButtons = <>
                  FieldName = 'INV_PART_NUMBER'
                  Footers = <>
                  Width = 161
                end
                item
                  EditButtons = <>
                  FieldName = 'INV_NAME'
                  Footers = <>
                  Width = 168
                end
                item
                  EditButtons = <>
                  FieldName = 'INV_DESCRIPTION'
                  Footers = <>
                  Width = 193
                end
                item
                  EditButtons = <>
                  FieldName = 'ANALYSIS_CODE5'
                  Footers = <>
                  Width = 128
                end
                item
                  EditButtons = <>
                  FieldName = 'ANALYSIS_CODE1'
                  Footers = <>
                  Width = 122
                end
                item
                  EditButtons = <>
                  FieldName = 'Qty'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'Param'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'Position'
                  Footers = <>
                  Width = 69
                end
                item
                  EditButtons = <>
                  FieldName = 'FAILURE_RATE'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'Remark'
                  Footers = <>
                  Width = 183
                end>
            end
          end
          inherited TabSheet4: TTabSheet
            object Label15: TLabel
              Left = 16
              Top = 8
              Width = 48
              Height = 12
              Caption = #26448#26009#32534#30721
            end
            object Label16: TLabel
              Left = 16
              Top = 48
              Width = 48
              Height = 12
              Caption = #23454#29289#25551#36848
            end
            object Label17: TLabel
              Left = 16
              Top = 88
              Width = 48
              Height = 12
              Caption = #26448#26009#25551#36848
            end
            object Label18: TLabel
              Left = 16
              Top = 128
              Width = 48
              Height = 12
              Caption = #29289#20214#22411#21495
            end
            object Label19: TLabel
              Left = 16
              Top = 168
              Width = 48
              Height = 12
              Caption = #29983#20135#21378#23478
            end
            object Label20: TLabel
              Left = 214
              Top = 8
              Width = 60
              Height = 12
              Caption = #23376#28165#21333#32534#21495
            end
            object Label21: TLabel
              Left = 214
              Top = 48
              Width = 24
              Height = 12
              Caption = #31867#22411
            end
            object Label23: TLabel
              Left = 214
              Top = 88
              Width = 24
              Height = 12
              Caption = #29992#37327
            end
            object Label24: TLabel
              Left = 214
              Top = 128
              Width = 24
              Height = 12
              Caption = #25968#20540
            end
            object Label25: TLabel
              Left = 213
              Top = 169
              Width = 24
              Height = 12
              Caption = #20301#21495
            end
            object Label26: TLabel
              Left = 356
              Top = 48
              Width = 24
              Height = 12
              Caption = #22791#27880
            end
            object Label22: TLabel
              Left = 357
              Top = 7
              Width = 36
              Height = 12
              Caption = #25439#32791#29575
            end
            object edt_INV_PART_NUMBER: TDBButtonEdit
              Left = 16
              Top = 24
              Width = 180
              Height = 20
              Hint = #25353'F1'#24377#20986#19979#25289#21015#34920
              DataSource = dsChild
              DataField = 'INV_PART_NUMBER'
              ParentShowHint = False
              ReadOnlyColor = clInactiveCaptionText
              ShowHint = True
              TabOrder = 0
              F_DownFormWidth = 0
              F_PressKey13AutoDrop = False
            end
            object edt_INV_NAME: TDBEdit
              Left = 16
              Top = 64
              Width = 180
              Height = 20
              DataField = 'INV_NAME'
              DataSource = dsChild
              Font.Charset = GB2312_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object edt_INV_DESCRIPTION: TDBEdit
              Left = 16
              Top = 104
              Width = 180
              Height = 20
              DataField = 'INV_DESCRIPTION'
              DataSource = dsChild
              TabOrder = 2
            end
            object edt_ANALYSIS_CODE5: TDBEdit
              Left = 16
              Top = 144
              Width = 180
              Height = 20
              DataField = 'ANALYSIS_CODE5'
              DataSource = dsChild
              TabOrder = 3
            end
            object edt_ANALYSIS_CODE1: TDBEdit
              Left = 16
              Top = 184
              Width = 180
              Height = 20
              DataField = 'ANALYSIS_CODE1'
              DataSource = dsChild
              TabOrder = 4
            end
            object edt_cld_Remark: TDBMemo
              Left = 356
              Top = 64
              Width = 185
              Height = 89
              DataField = 'Remark'
              DataSource = dsChild
              TabOrder = 5
            end
            object edt_cld_ListNumber: TDBEdit
              Left = 214
              Top = 24
              Width = 121
              Height = 20
              DataField = 'ListNumber'
              DataSource = dsChild
              TabOrder = 6
            end
            object edt_Type: TDBEdit
              Left = 214
              Top = 64
              Width = 121
              Height = 20
              DataField = 'Type'
              DataSource = dsChild
              TabOrder = 7
            end
            object edt_Qty: TDBEdit
              Left = 214
              Top = 104
              Width = 121
              Height = 20
              DataField = 'Qty'
              DataSource = dsChild
              TabOrder = 8
            end
            object edt_Param: TDBEdit
              Left = 214
              Top = 144
              Width = 121
              Height = 20
              DataField = 'Param'
              DataSource = dsChild
              TabOrder = 9
            end
            object edt_Position: TDBEdit
              Left = 213
              Top = 185
              Width = 121
              Height = 20
              DataField = 'Position'
              DataSource = dsChild
              TabOrder = 10
            end
            object edt_FAILURE_RATE: TDBEdit
              Left = 356
              Top = 23
              Width = 121
              Height = 20
              DataField = 'FAILURE_RATE'
              DataSource = dsChild
              TabOrder = 11
            end
          end
        end
      end
      inherited Panel12: TPanel
        Width = 823
      end
    end
    inherited Panel_Above: TPanel
      Width = 823
      inherited Panel5: TPanel
        Width = 823
        inherited Panel7: TPanel
          Left = 703
          inherited RzToolbar_right_1: TRzToolbar
            ToolbarControls = (
              btn1
              bt_Submit
              bt_Audit
              bt_Return
              bt_Copy)
            object bt_Submit: TButton
              Left = 4
              Top = 36
              Width = 112
              Height = 25
              Caption = #25552#20132#23457#26680
              Enabled = False
              TabOrder = 1
              OnClick = bt_SubmitClick
            end
            object bt_Audit: TButton
              Left = 4
              Top = 67
              Width = 112
              Height = 25
              Caption = 'BOM'#23457#26680
              Enabled = False
              TabOrder = 2
              OnClick = bt_AuditClick
            end
            object bt_Return: TButton
              Left = 4
              Top = 98
              Width = 112
              Height = 25
              Caption = 'BOM'#36864#22238
              Enabled = False
              TabOrder = 3
              OnClick = bt_ReturnClick
            end
            object bt_Copy: TButton
              Left = 4
              Top = 129
              Width = 112
              Height = 25
              Caption = 'BOM'#22797#21046
              Enabled = False
              TabOrder = 4
              OnClick = bt_CopyClick
            end
          end
        end
        inherited PageControl_M: TPageControl
          Width = 703
          inherited TabSheet1: TTabSheet
            inherited DghMain: TDBGridEh
              Width = 695
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'MANU_PART_NUMBER'
                  Footers = <>
                  Width = 97
                end
                item
                  EditButtons = <>
                  FieldName = 'MANU_PART_DESC'
                  Footers = <>
                  Width = 204
                end
                item
                  EditButtons = <>
                  FieldName = 'ListNumber'
                  Footers = <>
                  Title.TitleButton = True
                  Width = 63
                end
                item
                  EditButtons = <>
                  FieldName = 'Lin_EMPL_CODE'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'Lin_EMPLOYEE_NAME'
                  Footers = <>
                  Width = 50
                end
                item
                  EditButtons = <>
                  FieldName = 'Version'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'Status'
                  Footers = <>
                  Width = 40
                end
                item
                  EditButtons = <>
                  FieldName = 'EMPL_CODE'
                  Footers = <>
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'EMPLOYEE_NAME'
                  Footers = <>
                  Width = 50
                end
                item
                  EditButtons = <>
                  FieldName = 'CreateDate'
                  Footers = <>
                  Width = 105
                end
                item
                  EditButtons = <>
                  FieldName = 'Audit_EMPL_CODE'
                  Footers = <>
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'Audit_EMPLOYEE_NAME'
                  Footers = <>
                  Width = 50
                end
                item
                  EditButtons = <>
                  FieldName = 'AuditDate'
                  Footers = <>
                  Width = 105
                end
                item
                  EditButtons = <>
                  FieldName = 'Remark'
                  Footers = <>
                end>
            end
          end
          inherited TabSheet2: TTabSheet
            object Label1: TLabel
              Left = 16
              Top = 8
              Width = 60
              Height = 12
              Caption = #29238#28165#21333#32534#21495
            end
            object Label2: TLabel
              Left = 16
              Top = 48
              Width = 48
              Height = 12
              Caption = #20135#21697#32534#30721
            end
            object Label3: TLabel
              Left = 16
              Top = 88
              Width = 48
              Height = 12
              Caption = #20135#21697#21517#31216
            end
            object Label4: TLabel
              Left = 16
              Top = 128
              Width = 60
              Height = 12
              Caption = #32852#31995#20154#20195#30721
            end
            object Label5: TLabel
              Left = 16
              Top = 168
              Width = 36
              Height = 12
              Caption = #32852#31995#20154
            end
            object Label6: TLabel
              Left = 16
              Top = 208
              Width = 42
              Height = 12
              Caption = 'BOM'#29256#26412
            end
            object Label7: TLabel
              Left = 212
              Top = 8
              Width = 60
              Height = 12
              Caption = #21019#24314#20154#20195#30721
            end
            object Label8: TLabel
              Left = 212
              Top = 48
              Width = 36
              Height = 12
              Caption = #21019#24314#20154
            end
            object Label9: TLabel
              Left = 212
              Top = 88
              Width = 48
              Height = 12
              Caption = #21019#24314#26085#26399
            end
            object Label10: TLabel
              Left = 212
              Top = 128
              Width = 60
              Height = 12
              Caption = #23457#26680#20154#20195#30721
            end
            object Label11: TLabel
              Left = 212
              Top = 168
              Width = 36
              Height = 12
              Caption = #23457#26680#20154
            end
            object Label12: TLabel
              Left = 212
              Top = 208
              Width = 48
              Height = 12
              Caption = #23457#26680#26085#26399
            end
            object Label13: TLabel
              Left = 352
              Top = 8
              Width = 24
              Height = 12
              Caption = #29366#24577
            end
            object Label14: TLabel
              Left = 352
              Top = 48
              Width = 24
              Height = 12
              Caption = #22791#27880
            end
            object edt_ListNumber: TDBEdit
              Left = 15
              Top = 24
              Width = 121
              Height = 20
              DataField = 'ListNumber'
              DataSource = dsMain
              TabOrder = 0
            end
            object edt_Version: TDBEdit
              Left = 15
              Top = 224
              Width = 121
              Height = 20
              DataField = 'Version'
              DataSource = dsMain
              TabOrder = 1
            end
            object edt_EMPL_CODE: TDBEdit
              Left = 213
              Top = 24
              Width = 121
              Height = 20
              DataField = 'EMPL_CODE'
              DataSource = dsMain
              TabOrder = 2
            end
            object edt_EMPLOYEE_NAME: TDBEdit
              Left = 213
              Top = 64
              Width = 121
              Height = 20
              DataField = 'EMPLOYEE_NAME'
              DataSource = dsMain
              TabOrder = 3
            end
            object edt_CreateDate: TDBEdit
              Left = 213
              Top = 104
              Width = 121
              Height = 20
              DataField = 'CreateDate'
              DataSource = dsMain
              TabOrder = 4
            end
            object edt_Audit_EMPL_CODE: TDBEdit
              Left = 213
              Top = 144
              Width = 121
              Height = 20
              DataField = 'Audit_EMPL_CODE'
              DataSource = dsMain
              TabOrder = 5
            end
            object edt_Audit_EMPLOYEE_NAME: TDBEdit
              Left = 213
              Top = 184
              Width = 121
              Height = 20
              DataField = 'Audit_EMPLOYEE_NAME'
              DataSource = dsMain
              TabOrder = 6
            end
            object edt_AuditDate: TDBEdit
              Left = 213
              Top = 224
              Width = 121
              Height = 20
              DataField = 'AuditDate'
              DataSource = dsMain
              TabOrder = 7
            end
            object edt_Status: TDBEdit
              Left = 353
              Top = 24
              Width = 121
              Height = 20
              DataField = 'Status'
              DataSource = dsMain
              TabOrder = 8
            end
            object edt_Remark: TDBMemo
              Left = 353
              Top = 64
              Width = 185
              Height = 89
              DataField = 'Remark'
              DataSource = dsMain
              TabOrder = 9
            end
            object edt_MANU_PART_NUMBER: TDBButtonEdit
              Left = 15
              Top = 64
              Width = 121
              Height = 20
              Hint = #25353'F1'#24377#20986#19979#25289#21015#34920
              DataSource = dsMain
              DataField = 'MANU_PART_NUMBER'
              ParentShowHint = False
              ReadOnlyColor = clInactiveCaptionText
              ShowHint = True
              TabOrder = 10
              F_DownFormWidth = 0
              F_PressKey13AutoDrop = False
            end
            object edt_Lin_EMPL_CODE: TDBButtonEdit
              Left = 15
              Top = 144
              Width = 121
              Height = 20
              Hint = #25353'F1'#24377#20986#19979#25289#21015#34920
              DataSource = dsMain
              DataField = 'Lin_EMPL_CODE'
              ParentShowHint = False
              ReadOnlyColor = clInactiveCaptionText
              ShowHint = True
              TabOrder = 11
              F_DownFormWidth = 0
              F_PressKey13AutoDrop = False
            end
            object edt_MANU_PART_DESC: TDBEdit
              Left = 15
              Top = 104
              Width = 180
              Height = 20
              DataField = 'MANU_PART_DESC'
              DataSource = dsMain
              TabOrder = 12
            end
            object edt_Lin_EMPLOYEE_NAME: TDBEdit
              Left = 15
              Top = 184
              Width = 121
              Height = 20
              DataField = 'Lin_EMPLOYEE_NAME'
              DataSource = dsMain
              TabOrder = 13
            end
          end
        end
      end
      inherited Panel_Top: TPanel
        Width = 823
      end
      inherited Panel11: TPanel
        Width = 823
      end
    end
  end
  inherited Panel_right: TPanel
    Left = 829
    Height = 502
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
  inherited DtForeignKeyFieldQty: TADODataSet
    Left = 744
  end
  inherited dspRead: TDataSetProvider
    Top = 398
  end
  inherited dtRead: TADODataSet
    Top = 452
  end
  inherited cdsMain: Tcds
    CommandText = 
      'select data0025.MANU_PART_NUMBER,data0025.MANU_PART_DESC,data000' +
      '5.EMPL_CODE,data0005.EMPLOYEE_NAME,'#13#10'Audit_05.EMPL_CODE Audit_EM' +
      'PL_CODE,Audit_05.EMPLOYEE_NAME Audit_EMPLOYEE_NAME,'#13#10'Lin_05.EMPL' +
      '_CODE Lin_EMPL_CODE,Lin_05.EMPLOYEE_NAME Lin_EMPLOYEE_NAME,data0' +
      '800.* from data0800'#13#10'join data0025 on data0800.rkey25=data0025.r' +
      'key'#13#10'join data0005 on data0800.createBy_PTR=data0005.rkey'#13#10'left ' +
      'join data0005 Audit_05 on data0800.AuditBy_PTR=Audit_05.rkey'#13#10'le' +
      'ft join data0005 Lin_05 on data0800.HardwareLinkman_PTR=Lin_05.r' +
      'key'#13#10'order by data0025.MANU_PART_NUMBER'
    F_AutoIncrField = 'rkey'
    F_TableName = 'Data0800'
    F_SQLSelectFrom = 
      'select data0025.MANU_PART_NUMBER,data0025.MANU_PART_DESC,data000' +
      '5.EMPL_CODE,data0005.EMPLOYEE_NAME,'#13#10'Audit_05.EMPL_CODE Audit_EM' +
      'PL_CODE,Audit_05.EMPLOYEE_NAME Audit_EMPLOYEE_NAME,'#13#10'Lin_05.EMPL' +
      '_CODE Lin_EMPL_CODE,Lin_05.EMPLOYEE_NAME Lin_EMPLOYEE_NAME,data0' +
      '800.* from data0800'#13#10'join data0025 on data0800.rkey25=data0025.r' +
      'key'#13#10'join data0005 on data0800.createBy_PTR=data0005.rkey'#13#10'left ' +
      'join data0005 Audit_05 on data0800.AuditBy_PTR=Audit_05.rkey'#13#10'le' +
      'ft join data0005 Lin_05 on data0800.HardwareLinkman_PTR=Lin_05.r' +
      'key'
    F_SQLOrderBy = 'order by data0025.MANU_PART_NUMBER'
    object cdsMainListNumber: TStringField
      DisplayLabel = #29238#28165#21333#32534#21495
      FieldName = 'ListNumber'
      Size = 5
    end
    object cdsMainMANU_PART_NUMBER: TStringField
      DisplayLabel = #20135#21697#32534#30721
      FieldName = 'MANU_PART_NUMBER'
      ProviderFlags = []
      OnChange = cdsMainMANU_PART_NUMBERChange
    end
    object cdsMainMANU_PART_DESC: TStringField
      DisplayLabel = #20135#21697#21517#31216
      FieldName = 'MANU_PART_DESC'
      ProviderFlags = []
      Size = 80
    end
    object cdsMainLin_EMPL_CODE: TStringField
      DisplayLabel = #32852#31995#20154#20195#30721
      FieldName = 'Lin_EMPL_CODE'
      ProviderFlags = []
      OnChange = cdsMainLin_EMPL_CODEChange
      Size = 10
    end
    object cdsMainLin_EMPLOYEE_NAME: TStringField
      DisplayLabel = #32852#31995#20154
      FieldName = 'Lin_EMPLOYEE_NAME'
      ProviderFlags = []
      Size = 16
    end
    object cdsMainVersion: TStringField
      DisplayLabel = 'BOM'#29256#26412
      FieldName = 'Version'
      Size = 10
    end
    object cdsMainStatus: TSmallintField
      DisplayLabel = #29366#24577
      FieldName = 'Status'
      OnGetText = cdsMainStatusGetText
    end
    object cdsMainEMPL_CODE: TStringField
      DisplayLabel = #21019#24314#20154#20195#30721
      FieldName = 'EMPL_CODE'
      ProviderFlags = []
      Size = 10
    end
    object cdsMainEMPLOYEE_NAME: TStringField
      DisplayLabel = #21019#24314#20154
      FieldName = 'EMPLOYEE_NAME'
      ProviderFlags = []
      Size = 16
    end
    object cdsMainCreateDate: TDateTimeField
      DisplayLabel = #21019#24314#26085#26399
      FieldName = 'CreateDate'
    end
    object cdsMainAudit_EMPL_CODE: TStringField
      DisplayLabel = #23457#26680#20154#20195#30721
      FieldName = 'Audit_EMPL_CODE'
      ProviderFlags = []
      Size = 10
    end
    object cdsMainAudit_EMPLOYEE_NAME: TStringField
      DisplayLabel = #23457#26680#20154
      FieldName = 'Audit_EMPLOYEE_NAME'
      ProviderFlags = []
      Size = 16
    end
    object cdsMainAuditDate: TDateTimeField
      DisplayLabel = #23457#26680#26085#26399
      FieldName = 'AuditDate'
    end
    object cdsMainRemark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Remark'
      Size = 50
    end
    object cdsMainRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object cdsMainRKEY25: TIntegerField
      FieldName = 'RKEY25'
    end
    object cdsMainHardwareLinkman_PTR: TIntegerField
      FieldName = 'HardwareLinkman_PTR'
    end
    object cdsMainCreateBy_PTR: TIntegerField
      FieldName = 'CreateBy_PTR'
    end
    object cdsMainAuditBy_PTR: TIntegerField
      FieldName = 'AuditBy_PTR'
    end
  end
  inherited cdsChild: Tcds
    CommandText = 
      'select data0017.INV_PART_NUMBER,data0017.INV_NAME,'#13#10'data0017.INV' +
      '_DESCRIPTION+data0017.ANALYSIS_CODE4 INV_DESCRIPTION,'#13#10'data0017.' +
      'ANALYSIS_CODE5,data0017.ANALYSIS_CODE1,data0801.* '#13#10'from data080' +
      '1 join data0017 on data0801.rkey17 = data0017.rkey'
    AfterOpen = cdsChildAfterOpen
    BeforeInsert = cdsChildBeforeInsert
    F_AutoIncrField = 'rkey'
    F_TableName = 'Data0801'
    F_Primarykey = 'rkey'
    F_Foreignkey = 'RKEY800'
    object cdsChildINV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      ProviderFlags = []
      OnChange = cdsChildINV_PART_NUMBERChange
      Size = 25
    end
    object cdsChildINV_NAME: TStringField
      DisplayLabel = #23454#29289#25551#36848
      FieldName = 'INV_NAME'
      ProviderFlags = []
      Size = 30
    end
    object cdsChildINV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#25551#36848
      FieldName = 'INV_DESCRIPTION'
      ProviderFlags = []
      Size = 170
    end
    object cdsChildANALYSIS_CODE5: TStringField
      DisplayLabel = #29289#20214#22411#21495
      FieldName = 'ANALYSIS_CODE5'
      ProviderFlags = []
      Size = 100
    end
    object cdsChildANALYSIS_CODE1: TStringField
      DisplayLabel = #29983#20135#21378#23478
      FieldName = 'ANALYSIS_CODE1'
      ProviderFlags = []
      Size = 100
    end
    object cdsChildRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object cdsChildRKEY800: TIntegerField
      FieldName = 'RKEY800'
    end
    object cdsChildListNumber: TStringField
      DisplayLabel = #23376#28165#21333#32534#21495
      FieldName = 'ListNumber'
      OnChange = cdsChildListNumberChange
      Size = 8
    end
    object cdsChildType: TSmallintField
      DisplayLabel = #31867#22411
      FieldName = 'Type'
      OnGetText = cdsChildTypeGetText
    end
    object cdsChildRKEY17: TIntegerField
      FieldName = 'RKEY17'
      OnChange = cdsChildRKEY17Change
    end
    object cdsChildQty: TIntegerField
      DisplayLabel = #29992#37327
      FieldName = 'Qty'
    end
    object cdsChildParam: TStringField
      DisplayLabel = #25968#20540
      FieldName = 'Param'
      Size = 12
    end
    object cdsChildPosition: TStringField
      DisplayLabel = #20301#21495
      FieldName = 'Position'
      Size = 100
    end
    object cdsChildFAILURE_RATE: TBCDField
      DisplayLabel = #25439#32791#29575
      FieldName = 'FAILURE_RATE'
      Precision = 9
    end
    object cdsChildRemark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Remark'
      Size = 50
    end
  end
  inherited dtChild: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'select data0017.INV_PART_NUMBER,data0017.INV_NAME,'#13#10'data0017.INV' +
      '_DESCRIPTION+data0017.ANALYSIS_CODE4 INV_DESCRIPTION,'#13#10'data0017.' +
      'ANALYSIS_CODE5,data0017.ANALYSIS_CODE1,data0801.* '#13#10'from data080' +
      '1 join data0017 on data0801.rkey17 = data0017.rkey'
    object dtChildINV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      ProviderFlags = []
      Size = 25
    end
    object dtChildINV_NAME: TStringField
      FieldName = 'INV_NAME'
      ProviderFlags = []
      Size = 30
    end
    object dtChildINV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      ProviderFlags = []
      Size = 170
    end
    object dtChildANALYSIS_CODE5: TStringField
      FieldName = 'ANALYSIS_CODE5'
      ProviderFlags = []
      Size = 100
    end
    object dtChildANALYSIS_CODE1: TStringField
      FieldName = 'ANALYSIS_CODE1'
      ProviderFlags = []
      Size = 100
    end
    object dtChildRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object dtChildRKEY800: TIntegerField
      FieldName = 'RKEY800'
    end
    object dtChildListNumber: TStringField
      FieldName = 'ListNumber'
      Size = 8
    end
    object dtChildType: TWordField
      FieldName = 'Type'
    end
    object dtChildRKEY17: TIntegerField
      FieldName = 'RKEY17'
    end
    object dtChildQty: TIntegerField
      FieldName = 'Qty'
    end
    object dtChildParam: TStringField
      FieldName = 'Param'
      Size = 12
    end
    object dtChildPosition: TStringField
      FieldName = 'Position'
      Size = 100
    end
    object dtChildFAILURE_RATE: TBCDField
      FieldName = 'FAILURE_RATE'
      Precision = 9
    end
    object dtChildRemark: TStringField
      FieldName = 'Remark'
      Size = 50
    end
  end
  object dtRead_025: TADODataSet [20]
    Connection = DM_frm.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select rkey,MANU_PART_NUMBER,MANU_PART_DESC'#13#10'from data0025 order' +
      ' by MANU_PART_NUMBER'
    Parameters = <>
    Left = 138
    Top = 153
    object dtRead_025rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object dtRead_025MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object dtRead_025MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
  end
  object dtRead_017: TADODataSet [21]
    Connection = DM_frm.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select rkey,INV_PART_NUMBER,INV_NAME,INV_DESCRIPTION+ANALYSIS_CO' +
      'DE4 INV_DESCRIPTION,'#13#10'ANALYSIS_CODE5,ANALYSIS_CODE1,'#13#10'case when ' +
      'FAILURE_RATE>0 then 1/FAILURE_RATE else 0 end FAILURE_RATE'#13#10'from' +
      ' data0017'#13#10'order by INV_PART_NUMBER'
    Parameters = <>
    Left = 138
    Top = 213
    object dtRead_017rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object dtRead_017INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object dtRead_017INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object dtRead_017INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      ReadOnly = True
      Size = 170
    end
    object dtRead_017ANALYSIS_CODE5: TStringField
      FieldName = 'ANALYSIS_CODE5'
      Size = 100
    end
    object dtRead_017ANALYSIS_CODE1: TStringField
      FieldName = 'ANALYSIS_CODE1'
      Size = 100
    end
    object dtRead_017FAILURE_RATE: TFloatField
      FieldName = 'FAILURE_RATE'
    end
  end
  object dtRead_005: TADODataSet [22]
    Connection = DM_frm.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'select RKEY,EMPL_CODE,EMPLOYEE_NAME from data0005'#13#10
    Parameters = <>
    Left = 138
    Top = 277
    object dtRead_005RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object dtRead_005EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object dtRead_005EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object dtRead_005_1: TADODataSet [23]
    Connection = DM_frm.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select RKEY,EMPL_CODE,EMPLOYEE_NAME from data0005'#13#10'where ACTIVE_' +
      'FLAG='#39'Y'#39
    Parameters = <>
    Left = 138
    Top = 389
    object IntegerField1: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object StringField1: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object StringField2: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  inherited dtMain: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'select data0025.MANU_PART_NUMBER,data0025.MANU_PART_DESC,data000' +
      '5.EMPL_CODE,data0005.EMPLOYEE_NAME,'#13#10'Audit_05.EMPL_CODE Audit_EM' +
      'PL_CODE,Audit_05.EMPLOYEE_NAME Audit_EMPLOYEE_NAME,'#13#10'Lin_05.EMPL' +
      '_CODE Lin_EMPL_CODE,Lin_05.EMPLOYEE_NAME Lin_EMPLOYEE_NAME,data0' +
      '800.* from data0800'#13#10'join data0025 on data0800.rkey25=data0025.r' +
      'key'#13#10'join data0005 on data0800.createBy_PTR=data0005.rkey'#13#10'left ' +
      'join data0005 Audit_05 on data0800.AuditBy_PTR=Audit_05.rkey'#13#10'le' +
      'ft join data0005 Lin_05 on data0800.HardwareLinkman_PTR=Lin_05.r' +
      'key'#13#10'order by data0025.MANU_PART_NUMBER'
    object dtMainMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
      ProviderFlags = []
    end
    object dtMainMANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      ProviderFlags = []
      Size = 80
    end
    object dtMainLin_EMPL_CODE: TStringField
      FieldName = 'Lin_EMPL_CODE'
      ProviderFlags = []
      Size = 10
    end
    object dtMainLin_EMPLOYEE_NAME: TStringField
      FieldName = 'Lin_EMPLOYEE_NAME'
      ProviderFlags = []
      Size = 16
    end
    object dtMainEMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      ProviderFlags = []
      Size = 10
    end
    object dtMainEMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      ProviderFlags = []
      Size = 16
    end
    object dtMainAudit_EMPL_CODE: TStringField
      FieldName = 'Audit_EMPL_CODE'
      ProviderFlags = []
      Size = 10
    end
    object dtMainAudit_EMPLOYEE_NAME: TStringField
      FieldName = 'Audit_EMPLOYEE_NAME'
      ProviderFlags = []
      Size = 16
    end
    object dtMainRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object dtMainListNumber: TStringField
      FieldName = 'ListNumber'
      Size = 5
    end
    object dtMainRKEY25: TIntegerField
      FieldName = 'RKEY25'
    end
    object dtMainHardwareLinkman_PTR: TIntegerField
      FieldName = 'HardwareLinkman_PTR'
    end
    object dtMainVersion: TStringField
      FieldName = 'Version'
      Size = 10
    end
    object dtMainStatus: TWordField
      FieldName = 'Status'
    end
    object dtMainCreateBy_PTR: TIntegerField
      FieldName = 'CreateBy_PTR'
    end
    object dtMainCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object dtMainAuditBy_PTR: TIntegerField
      FieldName = 'AuditBy_PTR'
    end
    object dtMainAuditDate: TDateTimeField
      FieldName = 'AuditDate'
    end
    object dtMainRemark: TStringField
      FieldName = 'Remark'
      Size = 50
    end
  end
  object dtRead_018: TADODataSet
    Connection = DM_frm.ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select data0017.INV_PART_NUMBER,data0017.INV_NAME,'#13#10'data0017.INV' +
      '_DESCRIPTION+data0017.ANALYSIS_CODE4 INV_DESCRIPTION,'#13#10'data0017.' +
      'ANALYSIS_CODE5,data0017.ANALYSIS_CODE1,data0018.* '#13#10'from data001' +
      '8 join data0017 on data0018.alterINVENT_PTR_PTR=data0017.rkey'#13#10'w' +
      'here INVENT_PTR= :INVENT_PTR'
    Parameters = <
      item
        Name = 'INVENT_PTR'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 140
    Top = 456
  end
end
