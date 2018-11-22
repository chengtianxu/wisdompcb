inherited frmDeptPhone: TfrmDeptPhone
  Left = 252
  Top = 199
  Width = 891
  Height = 577
  Caption = 'frmDeptPhone'
  PixelsPerInch = 96
  TextHeight = 12
  inherited StatusBar1: TStatusBar
    Top = 524
    Width = 883
  end
  inherited RzToolbar1: TRzToolbar
    Width = 883
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
    inherited tblPrint: TRzToolButton
      Visible = False
    end
    inherited tblDesign: TRzToolButton
      Visible = False
    end
  end
  inherited Panel_right: TPanel
    Left = 877
    Height = 483
  end
  inherited Panel_Left: TPanel
    Height = 483
  end
  inherited Panel_Main: TPanel
    Width = 871
    Height = 483
    inherited Panel5: TPanel
      Width = 871
      Height = 470
      inherited Panel7: TPanel
        Left = 751
        Height = 470
        inherited RzToolbar2: TRzToolbar
          Height = 470
          ToolbarControls = (
            btn1
            Button2)
          object Button2: TButton
            Left = 4
            Top = 37
            Width = 110
            Height = 23
            Caption = #26356#26032#30005#35805
            TabOrder = 1
            OnClick = Button2Click
          end
        end
        inherited Panel2: TPanel
          Height = 470
        end
      end
      inherited PageControl_M: TPageControl
        Width = 751
        Height = 470
        inherited TabSheet1: TTabSheet
          inherited DghMain: TDBGridEh
            Width = 743
            Height = 443
            Columns = <
              item
                EditButtons = <>
                FieldName = 'USER_LOGIN_NAME'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'USER_FULL_NAME'
                Footers = <>
                Width = 115
              end
              item
                EditButtons = <>
                FieldName = 'DeptCode'
                Footers = <>
                Width = 84
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
                FieldName = 'WAREHOUSE_CODE'
                Footers = <>
                Width = 79
              end
              item
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'Phone'
                Footers = <>
                Width = 107
              end>
          end
        end
        inherited TabSheet2: TTabSheet
          TabVisible = False
        end
      end
    end
    inherited Panel6: TPanel
      Width = 871
    end
    inherited Panel_Bottom: TPanel
      Top = 478
      Width = 871
    end
  end
  inherited dtMain: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'select data0073.USER_LOGIN_NAME,data0073.USER_FULL_NAME,data0034' +
      '.DEPT_NAME,'#13#10'data0015.WAREHOUSE_CODE,data0015.ABBR_NAME,data0834' +
      '.* '#13#10'from data0834'#13#10'join data0073 on data0834.User_ptr=data0073.' +
      'rkey'#13#10'join data0034 on data0834.DeptCode=data0034.Dept_Code'#13#10'joi' +
      'n data0015 on data0834.warehouse_ptr=data0015.rkey'
    object dtMainUSER_LOGIN_NAME: TStringField
      FieldName = 'USER_LOGIN_NAME'
      ProviderFlags = []
      Size = 15
    end
    object dtMainUSER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      ProviderFlags = []
      Size = 30
    end
    object dtMainDEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      ProviderFlags = []
      Size = 30
    end
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
    object dtMainUser_ptr: TIntegerField
      FieldName = 'User_ptr'
    end
    object dtMainDeptCode: TStringField
      FieldName = 'DeptCode'
      Size = 10
    end
    object dtMainPhone: TStringField
      FieldName = 'Phone'
      Size = 14
    end
    object dtMainwarehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
  end
  inherited cdsMain: Tcds
    CommandText = 
      'select data0073.USER_LOGIN_NAME,data0073.USER_FULL_NAME,data0034' +
      '.DEPT_NAME,'#13#10'data0015.WAREHOUSE_CODE,data0015.ABBR_NAME,data0834' +
      '.* '#13#10'from data0834'#13#10'join data0073 on data0834.User_ptr=data0073.' +
      'rkey'#13#10'join data0034 on data0834.DeptCode=data0034.Dept_Code'#13#10'joi' +
      'n data0015 on data0834.warehouse_ptr=data0015.rkey'
    F_TableName = 'data0834'
    F_SQLSelectFrom = 
      'select data0073.USER_LOGIN_NAME,data0073.USER_FULL_NAME,data0034' +
      '.DEPT_NAME,'#13#10'data0015.WAREHOUSE_CODE,data0015.ABBR_NAME,data0834' +
      '.* '#13#10'from data0834'#13#10'join data0073 on data0834.User_ptr=data0073.' +
      'rkey'#13#10'join data0034 on data0834.DeptCode=data0034.Dept_Code'#13#10'joi' +
      'n data0015 on data0834.warehouse_ptr=data0015.rkey'
    F_SQLOrderBy = 
      'order by data0834.User_ptr,data0834.DeptCode,data0834.warehouse_' +
      'ptr'
    object cdsMainUSER_LOGIN_NAME: TStringField
      DisplayLabel = #29992#25143#30331#38470#21517
      FieldName = 'USER_LOGIN_NAME'
      ProviderFlags = []
      OnChange = cdsMainUSER_LOGIN_NAMEChange
      Size = 15
    end
    object cdsMainUSER_FULL_NAME: TStringField
      DisplayLabel = #29992#25143#21517
      FieldName = 'USER_FULL_NAME'
      ProviderFlags = []
      Size = 30
    end
    object cdsMainDEPT_NAME: TStringField
      DisplayLabel = #37096#38376
      FieldName = 'DEPT_NAME'
      ProviderFlags = []
      Size = 30
    end
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
    object cdsMainUser_ptr: TIntegerField
      FieldName = 'User_ptr'
      Visible = False
      OnChange = cdsMainUser_ptrChange
    end
    object cdsMainDeptCode: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'DeptCode'
      OnChange = cdsMainDeptCodeChange
      Size = 10
    end
    object cdsMainPhone: TStringField
      DisplayLabel = #30005#35805#21495#30721
      FieldName = 'Phone'
      Size = 14
    end
    object cdsMainwarehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
      Visible = False
    end
  end
  inherited dtRead: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'select DEPT_CODE,DEPT_NAME,RKEY from data0034'#13#10'where ttype in (1' +
      ',4,5)'#13#10
  end
  object cds0034: TClientDataSet [14]
    Aggregates = <>
    CommandText = 
      'select DEPT_CODE,DEPT_NAME,RKEY from data0034'#13#10'where ttype in (1' +
      ',4,5)'#13#10
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 528
    Top = 384
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
    object cds0034RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
  end
  object cds0073: TClientDataSet [15]
    Aggregates = <>
    CommandText = 
      'select RKEY,USER_LOGIN_NAME,USER_FULL_NAME '#13#10'from data0073'#13#10'wher' +
      'e user_group_flag=1 and active_flag=0'#13#10
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 576
    Top = 384
    object cds0073RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object cds0073USER_LOGIN_NAME: TStringField
      DisplayLabel = #29992#25143#30331#38470#21517
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object cds0073USER_FULL_NAME: TStringField
      DisplayLabel = #29992#25143#21517
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
  end
  object cds0015: TClientDataSet [16]
    Aggregates = <>
    CommandText = 'select WAREHOUSE_CODE,ABBR_NAME,RKEY from data0015'
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 632
    Top = 384
    object cds0015WAREHOUSE_CODE: TStringField
      DisplayLabel = #24037#21378#20195#30721
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object cds0015ABBR_NAME: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object cds0015RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
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
