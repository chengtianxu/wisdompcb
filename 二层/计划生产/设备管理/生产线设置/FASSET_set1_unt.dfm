inherited FASSET_set_frm: TFASSET_set_frm
  Left = 317
  Top = 161
  Width = 828
  Height = 594
  Caption = 'FASSET_set1_frm'
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 12
  inherited StatusBar1: TStatusBar
    Top = 537
    Width = 812
  end
  inherited RzToolbar1: TRzToolbar
    Width = 812
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
    Height = 496
  end
  inherited Panel_right: TPanel
    Left = 806
    Height = 496
  end
  inherited Panel_Main: TPanel
    Width = 800
    Height = 496
    inherited Panel5: TPanel
      Width = 800
      Height = 458
      inherited Panel7: TPanel
        Left = 680
        Height = 458
        inherited RzToolbar2: TRzToolbar
          Height = 458
          ToolbarControls = (
            btn1)
        end
        inherited Panel2: TPanel
          Height = 458
        end
      end
      inherited PageControl_M: TPageControl
        Width = 680
        Height = 458
        inherited TabSheet1: TTabSheet
          inherited DghMain: TDBGridEh
            Width = 672
            Height = 431
            Columns = <
              item
                EditButtons = <>
                FieldName = 'FASSET_CODE'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'FASSET_NAME'
                Footers = <>
                Width = 115
              end
              item
                EditButtons = <>
                FieldName = 'FASSET_DESC'
                Footers = <>
                Width = 199
              end
              item
                EditButtons = <>
                FieldName = 'WAREHOUSE_CODE'
                Footers = <>
                Width = 60
              end
              item
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
                Visible = False
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
                Visible = False
                Width = 124
              end
              item
                EditButtons = <>
                FieldName = 'LOCATION'
                Footers = <>
                Width = 119
              end
              item
                EditButtons = <>
                FieldName = 'active_flag'
                Footers = <>
                Width = 42
              end
              item
                EditButtons = <>
                FieldName = 'equipment_grade'
                Footers = <>
                Width = 97
              end
              item
                EditButtons = <>
                FieldName = 'Capacity'
                Footers = <>
                Width = 93
              end
              item
                EditButtons = <>
                FieldName = 'Capa_UNIT'
                Footers = <>
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'RateProd'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'Rate_UNIT'
                Footers = <>
                Width = 52
              end
              item
                EditButtons = <>
                FieldName = 'Scan_QTY'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'REMARK'
                Footers = <>
                Width = 251
              end
              item
                EditButtons = <>
                FieldName = 'USER_DATE'
                Footers = <>
                ReadOnly = True
              end
              item
                EditButtons = <>
                FieldName = 'USER_LOGIN_NAME'
                Footers = <>
                ReadOnly = True
              end
              item
                EditButtons = <>
                FieldName = 'USER_FULL_NAME'
                Footers = <>
                ReadOnly = True
              end>
          end
        end
        inherited TabSheet2: TTabSheet
          inherited dghChild: TDBGridEh
            Top = 337
            Width = 672
            Height = 94
            Align = alClient
            Columns = <
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
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 672
            Height = 337
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            OnEnter = Panel1Enter
            OnMouseDown = Panel1MouseDown
            object Label1: TLabel
              Left = 9
              Top = 168
              Width = 48
              Height = 12
              Caption = #24037#21378#20195#30721
            end
            object Label2: TLabel
              Left = 9
              Top = 208
              Width = 24
              Height = 12
              Caption = #24037#21378
              FocusControl = edt_ABBR_NAME
            end
            object Label3: TLabel
              Left = 9
              Top = 248
              Width = 48
              Height = 12
              Caption = #37096#38376#20195#30721
            end
            object Label4: TLabel
              Left = 9
              Top = 288
              Width = 48
              Height = 12
              Caption = #37096#38376#21517#31216
              FocusControl = edt_DEPT_NAME
            end
            object Label5: TLabel
              Left = 8
              Top = 7
              Width = 60
              Height = 12
              Caption = #29983#20135#32447#20195#30721
              FocusControl = edt_FASSET_CODE
            end
            object Label6: TLabel
              Left = 8
              Top = 47
              Width = 60
              Height = 12
              Caption = #29983#20135#32447#21517#31216
              FocusControl = edt_FASSET_NAME
            end
            object Label7: TLabel
              Left = 8
              Top = 87
              Width = 60
              Height = 12
              Caption = #29983#20135#32447#25551#36848
            end
            object Label8: TLabel
              Left = 215
              Top = 47
              Width = 24
              Height = 12
              Caption = #20301#32622
              FocusControl = edt_LOCATION
            end
            object Label9: TLabel
              Left = 216
              Top = 8
              Width = 24
              Height = 12
              Caption = #29366#24577
              FocusControl = edt_active_flag
            end
            object Label10: TLabel
              Left = 216
              Top = 87
              Width = 48
              Height = 12
              Caption = #35774#22791#31561#32423
              FocusControl = edt_equipment_grade
            end
            object Label11: TLabel
              Left = 216
              Top = 127
              Width = 48
              Height = 12
              Caption = #35774#22791#33021#21147
              FocusControl = edt_Capacity
            end
            object Label12: TLabel
              Left = 216
              Top = 208
              Width = 48
              Height = 12
              Caption = #29983#20135#20135#33021
              FocusControl = edt_RateProd
            end
            object Label13: TLabel
              Left = 216
              Top = 288
              Width = 60
              Height = 12
              Caption = #25195#25551#22120#25968#37327
              FocusControl = edt_Scan_QTY
            end
            object Label14: TLabel
              Left = 424
              Top = 7
              Width = 24
              Height = 12
              Caption = #22791#27880
            end
            object Label15: TLabel
              Left = 424
              Top = 128
              Width = 48
              Height = 12
              Caption = #24405#20837#26085#26399
              FocusControl = edt_USER_DATE
            end
            object Label16: TLabel
              Left = 425
              Top = 207
              Width = 36
              Height = 12
              Caption = #24405#20837#20154
              FocusControl = edt_USER_FULL_NAME
            end
            object Label17: TLabel
              Left = 424
              Top = 167
              Width = 60
              Height = 12
              Caption = #24405#20837#20154#20195#30721
              FocusControl = edt_USER_LOGIN_NAME
            end
            object Label18: TLabel
              Left = 216
              Top = 247
              Width = 48
              Height = 12
              Caption = #20135#33021#21333#20301
            end
            object Label19: TLabel
              Left = 216
              Top = 167
              Width = 48
              Height = 12
              Caption = #33021#21147#21333#20301
            end
            object edt_ABBR_NAME: TDBEdit
              Left = 9
              Top = 224
              Width = 121
              Height = 20
              DataField = 'ABBR_NAME'
              DataSource = dsMain
              TabOrder = 4
            end
            object edt_DEPT_NAME: TDBEdit
              Left = 9
              Top = 304
              Width = 121
              Height = 20
              DataField = 'DEPT_NAME'
              DataSource = dsMain
              TabOrder = 6
            end
            object edt_FASSET_CODE: TDBEdit
              Left = 8
              Top = 23
              Width = 185
              Height = 20
              DataField = 'FASSET_CODE'
              DataSource = dsMain
              TabOrder = 0
            end
            object edt_FASSET_NAME: TDBEdit
              Left = 8
              Top = 63
              Width = 185
              Height = 20
              DataField = 'FASSET_NAME'
              DataSource = dsMain
              TabOrder = 1
            end
            object edt_LOCATION: TDBEdit
              Left = 215
              Top = 63
              Width = 185
              Height = 20
              DataField = 'LOCATION'
              DataSource = dsMain
              TabOrder = 8
            end
            object edt_active_flag: TDBEdit
              Left = 216
              Top = 24
              Width = 121
              Height = 20
              DataField = 'active_flag'
              DataSource = dsMain
              TabOrder = 7
            end
            object edt_equipment_grade: TDBEdit
              Left = 216
              Top = 103
              Width = 185
              Height = 20
              DataField = 'equipment_grade'
              DataSource = dsMain
              TabOrder = 9
            end
            object edt_Capacity: TDBEdit
              Left = 216
              Top = 143
              Width = 124
              Height = 20
              DataField = 'Capacity'
              DataSource = dsMain
              TabOrder = 10
            end
            object edt_RateProd: TDBEdit
              Left = 216
              Top = 224
              Width = 121
              Height = 20
              DataField = 'RateProd'
              DataSource = dsMain
              TabOrder = 12
            end
            object edt_Scan_QTY: TDBEdit
              Left = 216
              Top = 304
              Width = 121
              Height = 20
              DataField = 'Scan_QTY'
              DataSource = dsMain
              TabOrder = 14
            end
            object edt_REMARK: TDBMemo
              Left = 424
              Top = 23
              Width = 185
              Height = 97
              DataField = 'REMARK'
              DataSource = dsMain
              TabOrder = 15
            end
            object edt_USER_DATE: TDBEdit
              Left = 424
              Top = 144
              Width = 121
              Height = 20
              DataField = 'USER_DATE'
              DataSource = dsMain
              TabOrder = 16
            end
            object edt_USER_FULL_NAME: TDBEdit
              Left = 425
              Top = 223
              Width = 121
              Height = 20
              DataField = 'USER_FULL_NAME'
              DataSource = dsMain
              TabOrder = 18
            end
            object edt_USER_LOGIN_NAME: TDBEdit
              Left = 424
              Top = 183
              Width = 121
              Height = 20
              DataField = 'USER_LOGIN_NAME'
              DataSource = dsMain
              TabOrder = 17
            end
            object edt_FASSET_DESC: TDBMemo
              Left = 10
              Top = 103
              Width = 185
              Height = 57
              DataField = 'FASSET_DESC'
              DataSource = dsMain
              TabOrder = 2
            end
            object edt_WAREHOUSE_CODE: TDBButtonEdit
              Tag = 1
              Left = 9
              Top = 184
              Width = 121
              Height = 20
              Hint = #25353'F1'#24377#20986#19979#25289#21015#34920
              DataSource = dsMain
              DataField = 'WAREHOUSE_CODE'
              ParentShowHint = False
              ReadOnlyColor = clInactiveCaptionText
              ShowHint = True
              TabOrder = 3
              F_DownFormWidth = 0
              F_DownListDataSet = dtRead_015
              F_PressKey13AutoDrop = False
            end
            object edt_DEPT_CODE: TDBButtonEdit
              Tag = 1
              Left = 10
              Top = 264
              Width = 121
              Height = 20
              Hint = #25353'F1'#24377#20986#19979#25289#21015#34920
              DataSource = dsMain
              DataField = 'DEPT_CODE'
              ParentShowHint = False
              ReadOnlyColor = clInactiveCaptionText
              ShowHint = True
              TabOrder = 5
              F_DownFormWidth = 0
              F_DownListDataSet = dtRead_034
              F_PressKey13AutoDrop = False
            end
            object edt_Rate_UNIT: TDBButtonEdit
              Left = 217
              Top = 263
              Width = 121
              Height = 20
              Hint = #25353'F1'#24377#20986#19979#25289#21015#34920
              DataSource = dsMain
              DataField = 'Rate_UNIT'
              ParentShowHint = False
              ReadOnlyColor = clInactiveCaptionText
              ShowHint = True
              TabOrder = 13
              F_DownFormWidth = 0
              F_DownListDataSet = dtRead_002
              F_PressKey13AutoDrop = False
            end
            object edt_Capa_UNIT: TDBButtonEdit
              Left = 217
              Top = 183
              Width = 121
              Height = 20
              Hint = #25353'F1'#24377#20986#19979#25289#21015#34920
              DataSource = dsMain
              DataField = 'Capa_UNIT'
              ParentShowHint = False
              ReadOnlyColor = clInactiveCaptionText
              ShowHint = True
              TabOrder = 11
              F_DownFormWidth = 0
              F_DownListDataSet = dtRead_002
              F_PressKey13AutoDrop = False
            end
          end
        end
      end
    end
    inherited Panel6: TPanel
      Width = 800
    end
    inherited Panel_Bottom: TPanel
      Top = 466
      Width = 800
      Height = 30
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
  inherited cdsMain: Tcds
    CommandText = 
      'select Data0015.WAREHOUSE_CODE,Data0015.ABBR_NAME,Data0034.DEPT_' +
      'CODE,Data0034.DEPT_NAME,'#13#10'Data0073.USER_LOGIN_NAME,Data0073.USER' +
      '_FULL_NAME,Data0002.UNIT_CODE Capa_UNIT,d02.UNIT_CODE Rate_UNIT,' +
      '[Y1417].* '#13#10'from [Y1417]'#13#10'join dbo.Data0015 on Data0015.rkey = [' +
      'Y1417].[warehouse_ptr]'#13#10'join dbo.Data0034 on Data0034.rkey = [Y1' +
      '417].[DEPT_PTR]'#13#10'join dbo.Data0073 on Data0073.rkey = [Y1417].[U' +
      'SER_PTR]'#13#10'left join dbo.Data0002 on Data0002.rkey = [Y1417].[Cap' +
      'a_UNIT_PTR]'#13#10'left join dbo.Data0002 d02  on d02.rkey = [Y1417].[' +
      'Rate_UNIT_PTR]'
    F_AutoIncrField = 'rkey'
    F_AutoNumb = True
    F_AutoNumbField = 'FASSET_CODE'
    F_TableName = 'Y1417'
    F_SQLSelectFrom = 
      'select Data0015.WAREHOUSE_CODE,Data0015.ABBR_NAME,Data0034.DEPT_' +
      'CODE,Data0034.DEPT_NAME,'#13#10'Data0073.USER_LOGIN_NAME,Data0073.USER' +
      '_FULL_NAME,Data0002.UNIT_CODE Capa_UNIT,d02.UNIT_CODE Rate_UNIT,' +
      '[Y1417].* '#13#10'from [Y1417]'#13#10'join dbo.Data0015 on Data0015.rkey = [' +
      'Y1417].[warehouse_ptr]'#13#10'join dbo.Data0034 on Data0034.rkey = [Y1' +
      '417].[DEPT_PTR]'#13#10'join dbo.Data0073 on Data0073.rkey = [Y1417].[U' +
      'SER_PTR]'#13#10'left join dbo.Data0002 on Data0002.rkey = [Y1417].[Cap' +
      'a_UNIT_PTR]'#13#10'left join dbo.Data0002 d02  on d02.rkey = [Y1417].[' +
      'Rate_UNIT_PTR]'
    object cdsMainWAREHOUSE_CODE: TStringField
      DisplayLabel = #24037#21378#20195#30721
      FieldName = 'WAREHOUSE_CODE'
      ProviderFlags = []
      OnChange = cdsMainWAREHOUSE_CODEChange
      Size = 5
    end
    object cdsMainABBR_NAME: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'ABBR_NAME'
      ProviderFlags = []
      Size = 10
    end
    object cdsMainDEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
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
    object cdsMainRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object cdsMainFASSET_CODE: TStringField
      DisplayLabel = #29983#20135#32447#20195#30721
      FieldName = 'FASSET_CODE'
    end
    object cdsMainFASSET_NAME: TStringField
      DisplayLabel = #29983#20135#32447#21517#31216
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object cdsMainFASSET_DESC: TStringField
      DisplayLabel = #29983#20135#32447#25551#36848
      FieldName = 'FASSET_DESC'
      Size = 40
    end
    object cdsMainDEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object cdsMainLOCATION: TStringField
      DisplayLabel = #20301#32622
      FieldName = 'LOCATION'
      Size = 40
    end
    object cdsMainactive_flag: TSmallintField
      DisplayLabel = #29366#24577
      FieldName = 'active_flag'
      OnGetText = cdsMainactive_flagGetText
    end
    object cdsMainUSER_PTR: TIntegerField
      FieldName = 'USER_PTR'
    end
    object cdsMainwarehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object cdsMainequipment_grade: TStringField
      DisplayLabel = #35774#22791#31561#32423
      FieldName = 'equipment_grade'
      Size = 50
    end
    object cdsMainRateProd: TBCDField
      DisplayLabel = #29983#20135#36895#29575
      FieldName = 'RateProd'
      Precision = 9
      Size = 2
    end
    object cdsMainScan_QTY: TIntegerField
      DisplayLabel = #25195#25551#22120#25968#37327
      FieldName = 'Scan_QTY'
    end
    object cdsMainREMARK: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REMARK'
      Size = 100
    end
    object cdsMainUSER_DATE: TDateTimeField
      DisplayLabel = #24405#20837#26085#26399
      FieldName = 'USER_DATE'
    end
    object cdsMainEMPL_CODE: TStringField
      DisplayLabel = #24405#20837#20154#20195#30721
      FieldName = 'USER_LOGIN_NAME'
      ProviderFlags = []
      Size = 10
    end
    object cdsMainEMPLOYEE_NAME: TStringField
      DisplayLabel = #24405#20837#20154
      FieldName = 'USER_FULL_NAME'
      ProviderFlags = []
      Size = 16
    end
    object cdsMainCapacity: TStringField
      DisplayLabel = #35774#22791#33021#21147
      FieldName = 'Capacity'
      Size = 60
    end
    object cdsMainUNIT_CODE: TStringField
      DisplayLabel = #33021#21147#21333#20301
      FieldName = 'Capa_UNIT'
      ProviderFlags = []
      OnChange = cdsMainUNIT_CODEChange
      Size = 5
    end
    object cdsMainCapa_UNIT_PTR: TIntegerField
      FieldName = 'Capa_UNIT_PTR'
    end
    object cdsMainRate_UNIT_PTR: TIntegerField
      FieldName = 'Rate_UNIT_PTR'
    end
    object cdsMainRate_UNIT: TStringField
      DisplayLabel = #36895#29575#21333#20301
      FieldName = 'Rate_UNIT'
      ProviderFlags = []
      OnChange = cdsMainRate_UNITChange
      Size = 5
    end
  end
  inherited cdsChild: Tcds
    CommandText = 
      'select data0034.DEPT_CODE,data0034.DEPT_NAME,Y1418.*  '#13#10'from [Y1' +
      '418] '#13#10'join data0034 on Y1418.[DEPT_PTR]= data0034.rkey'
    F_AutoIncrField = 'rkey'
    F_TableName = 'Y1418'
    F_SQLSelectFrom = 
      'select data0034.DEPT_CODE,data0034.DEPT_NAME,Y1418.*  '#13#10'from [Y1' +
      '418] '#13#10'join data0034 on Y1418.[DEPT_PTR]= data0034.rkey'
    F_Primarykey = 'rkey'
    F_Foreignkey = 'FASS_PTR'
    object cdsChildDEPT_CODE: TStringField
      DisplayLabel = #24037#24207#20195#30721
      FieldName = 'DEPT_CODE'
      OnChange = cdsChildDEPT_CODEChange
      Size = 10
    end
    object cdsChildDEPT_NAME: TStringField
      DisplayLabel = #24037#24207#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object cdsChildRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object cdsChildFASS_PTR: TIntegerField
      FieldName = 'FASS_PTR'
    end
    object cdsChildDEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
  end
  inherited dtChild: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'select data0034.DEPT_CODE,data0034.DEPT_NAME,Y1418.*  '#13#10'from [Y1' +
      '418] '#13#10'join data0034 on Y1418.[DEPT_PTR]= data0034.rkey'
    object dtChildDEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      ProviderFlags = []
      Size = 10
    end
    object dtChildDEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      ProviderFlags = []
      Size = 30
    end
    object dtChildRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object dtChildFASS_PTR: TIntegerField
      FieldName = 'FASS_PTR'
    end
    object dtChildDEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
  end
  inherited dtMain: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'select Data0015.WAREHOUSE_CODE,Data0015.ABBR_NAME,Data0034.DEPT_' +
      'CODE,Data0034.DEPT_NAME,'#13#10'Data0073.USER_LOGIN_NAME,Data0073.USER' +
      '_FULL_NAME,Data0002.UNIT_CODE Capa_UNIT,d02.UNIT_CODE Rate_UNIT,' +
      '[Y1417].* '#13#10'from [Y1417]'#13#10'join dbo.Data0015 on Data0015.rkey = [' +
      'Y1417].[warehouse_ptr]'#13#10'join dbo.Data0034 on Data0034.rkey = [Y1' +
      '417].[DEPT_PTR]'#13#10'join dbo.Data0073 on Data0073.rkey = [Y1417].[U' +
      'SER_PTR]'#13#10'left join dbo.Data0002 on Data0002.rkey = [Y1417].[Cap' +
      'a_UNIT_PTR]'#13#10'left join dbo.Data0002 d02  on d02.rkey = [Y1417].[' +
      'Rate_UNIT_PTR]'
    object dtMainWAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      ProviderFlags = []
      Size = 5
    end
    object dtMainABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      ProviderFlags = []
      Size = 10
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
      FieldName = 'USER_LOGIN_NAME'
      ProviderFlags = []
      Size = 10
    end
    object dtMainEMPLOYEE_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      ProviderFlags = []
      Size = 16
    end
    object dtMainRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object dtMainFASSET_CODE: TStringField
      FieldName = 'FASSET_CODE'
    end
    object dtMainFASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object dtMainFASSET_DESC: TStringField
      FieldName = 'FASSET_DESC'
      Size = 40
    end
    object dtMainDEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object dtMainLOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 40
    end
    object dtMainREMARK: TStringField
      FieldName = 'REMARK'
      Size = 100
    end
    object dtMainactive_flag: TWordField
      FieldName = 'active_flag'
    end
    object dtMainUSER_DATE: TDateTimeField
      FieldName = 'USER_DATE'
    end
    object dtMainUSER_PTR: TIntegerField
      FieldName = 'USER_PTR'
    end
    object dtMainwarehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object dtMainequipment_grade: TStringField
      FieldName = 'equipment_grade'
      Size = 50
    end
    object dtMainRateProd: TBCDField
      FieldName = 'RateProd'
      Precision = 9
      Size = 2
    end
    object dtMainScan_QTY: TIntegerField
      FieldName = 'Scan_QTY'
    end
    object dtMainCapacity: TStringField
      FieldName = 'Capacity'
      Size = 60
    end
    object dtMainCapa_UNIT_PTR: TIntegerField
      FieldName = 'Capa_UNIT_PTR'
    end
    object dtMainRate_UNIT_PTR: TIntegerField
      FieldName = 'Rate_UNIT_PTR'
    end
    object dtMainCapa_UNIT: TStringField
      FieldName = 'Capa_UNIT'
      ProviderFlags = []
      Size = 5
    end
    object dtMainRate_UNIT: TStringField
      FieldName = 'Rate_UNIT'
      ProviderFlags = []
      Size = 5
    end
  end
  object dtRead_015: TADODataSet
    Connection = DM_frm.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'select RKEY,WAREHOUSE_CODE,ABBR_NAME from Data0015'
    Parameters = <>
    Left = 506
    Top = 397
    object dtRead_015RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object dtRead_015WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object dtRead_015ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
  end
  object dtRead_034: TADODataSet
    Connection = DM_frm.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select RKEY,DEPT_CODE,DEPT_NAME  from dbo.Data0034'#13#10'where ttype ' +
      'in (4,5)'
    Parameters = <>
    Left = 580
    Top = 400
    object dtRead_034RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object dtRead_034DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object dtRead_034DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
  end
  object dtRead_002: TADODataSet
    Connection = DM_frm.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'select RKEY,UNIT_CODE from Data0002'#13#10'order by UNIT_CODE'
    Parameters = <>
    Left = 644
    Top = 400
    object dtRead_002RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object dtRead_002UNIT_CODE: TStringField
      FieldName = 'UNIT_CODE'
      Size = 5
    end
  end
  object dtRead_034_1: TADODataSet
    Connection = DM_frm.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select RKEY,DEPT_CODE,DEPT_NAME  from dbo.Data0034'#13#10'where ttype ' +
      'in (1)'
    Parameters = <>
    Left = 580
    Top = 456
    object AutoIncField1: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object StringField1: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object StringField2: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
  end
  object dtRead_073: TADODataSet
    Connection = DM_frm.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'select RKEY,USER_LOGIN_NAME,USER_FULL_NAME from Data0073'
    Parameters = <>
    Left = 508
    Top = 456
    object dtRead_073RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object dtRead_073USER_LOGIN_NAME: TStringField
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object dtRead_073USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
  end
end
