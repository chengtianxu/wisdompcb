inherited frm_RespGroup: Tfrm_RespGroup
  Left = 264
  Top = 161
  Width = 737
  Height = 655
  Caption = 'frm_RespGroup'
  Font.Height = -13
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar1: TStatusBar
    Top = 602
    Width = 729
  end
  inherited RzToolbar1: TRzToolbar
    Width = 729
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
    inherited tblfind: TRzToolButton
      Visible = False
    end
    inherited tblCancelFilter: TRzToolButton
      Width = 60
    end
    inherited tblPrint: TRzToolButton
      Left = 415
    end
    inherited tblDesign: TRzToolButton
      Left = 454
      Width = 60
    end
    inherited tblFirst: TRzToolButton
      Left = 514
    end
    inherited tblPrior: TRzToolButton
      Left = 553
    end
    inherited tblNext: TRzToolButton
      Left = 592
    end
    inherited tblLast: TRzToolButton
      Left = 631
    end
  end
  inherited Panel_Left: TPanel
    Height = 561
  end
  inherited Panel_Main: TPanel
    Width = 717
    Height = 561
    inherited Splitter1: TSplitter
      Width = 717
    end
    inherited Panel_Below: TPanel
      Width = 717
      Height = 253
      inherited Panel_Bottom: TPanel
        Top = 248
        Width = 717
      end
      inherited Panel9: TPanel
        Width = 717
        Height = 243
        inherited Panel10: TPanel
          Left = 597
          Height = 243
          inherited RzToolbar_right_2: TRzToolbar
            Height = 243
            ToolbarControls = (
              Button1)
          end
          inherited Panel3: TPanel
            Height = 243
          end
        end
        inherited PageControl_D: TPageControl
          Width = 597
          Height = 243
          inherited TabSheet3: TTabSheet
            inherited dghChild: TDBGridEh
              Width = 589
              Height = 215
              FooterFont.Height = -13
              TitleFont.Height = -13
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'EMPL_CODE'
                  Footers = <>
                  Width = 80
                end
                item
                  EditButtons = <>
                  FieldName = 'EMPLOYEE_NAME'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'TTYPE'
                  Footers = <>
                  Width = 58
                end
                item
                  EditButtons = <>
                  FieldName = 'EntrDate'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'DepaDate'
                  Footers = <>
                end>
            end
          end
          inherited TabSheet4: TTabSheet
            object Label3: TLabel
              Left = 8
              Top = 8
              Width = 52
              Height = 13
              Caption = #38599#21592#20195#30721
            end
            object Label4: TLabel
              Left = 8
              Top = 48
              Width = 52
              Height = 13
              Caption = #38599#21592#22995#21517
              FocusControl = edt_EMPLOYEE_NAME
            end
            object Label5: TLabel
              Left = 8
              Top = 112
              Width = 52
              Height = 13
              Caption = #20837#32844#26085#26399
              FocusControl = DBEdit5
            end
            object Label6: TLabel
              Left = 8
              Top = 152
              Width = 52
              Height = 13
              Caption = #31163#32844#26085#26399
              FocusControl = DBEdit6
            end
            object edt_EMPLOYEE_NAME: TDBEdit
              Left = 8
              Top = 64
              Width = 212
              Height = 21
              DataField = 'EMPLOYEE_NAME'
              DataSource = dsChild
              TabOrder = 0
            end
            object DBCheckBox3: TDBCheckBox
              Left = 8
              Top = 88
              Width = 97
              Height = 17
              Caption = #26159#36127#36131#20154
              DataField = 'TTYPE'
              DataSource = dsChild
              TabOrder = 1
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object DBEdit5: TDBEdit
              Left = 8
              Top = 128
              Width = 238
              Height = 21
              DataField = 'EntrDate'
              DataSource = dsChild
              TabOrder = 2
            end
            object DBEdit6: TDBEdit
              Left = 8
              Top = 168
              Width = 238
              Height = 21
              DataField = 'DepaDate'
              DataSource = dsChild
              TabOrder = 3
            end
            object edt_EMPL_CODE: TDBButtonEdit
              Left = 9
              Top = 24
              Width = 121
              Height = 21
              Hint = #25353'F1'#24377#20986#19979#25289#21015#34920
              DataSource = dsChild
              DataField = 'EMPL_CODE'
              ParentShowHint = False
              ReadOnlyColor = clInactiveCaptionText
              ShowHint = True
              TabOrder = 4
              F_DownFormWidth = 0
              F_PressKey13AutoDrop = False
            end
          end
        end
      end
      inherited Panel12: TPanel
        Width = 717
      end
    end
    inherited Panel_Above: TPanel
      Width = 717
      inherited Panel5: TPanel
        Width = 717
        inherited Panel7: TPanel
          Left = 597
          inherited RzToolbar_right_1: TRzToolbar
            ToolbarControls = (
              btn1)
          end
        end
        inherited PageControl_M: TPageControl
          Width = 597
          inherited TabSheet1: TTabSheet
            inherited DghMain: TDBGridEh
              Width = 589
              Height = 259
              FooterFont.Height = -13
              TitleFont.Height = -13
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'ABBR_NAME'
                  Footers = <>
                  Width = 78
                end
                item
                  EditButtons = <>
                  FieldName = 'Location'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'OutsPrep'
                  Footers = <>
                  Width = 56
                end
                item
                  EditButtons = <>
                  FieldName = 'active'
                  Footers = <>
                  Width = 53
                end>
            end
          end
          inherited TabSheet2: TTabSheet
            object Label1: TLabel
              Left = 16
              Top = 8
              Width = 26
              Height = 13
              Caption = #24037#21378
            end
            object Label2: TLabel
              Left = 16
              Top = 48
              Width = 52
              Height = 13
              Caption = #36131#20219#23567#32452
              FocusControl = DBEdit2
            end
            object DBEdit2: TDBEdit
              Left = 16
              Top = 64
              Width = 264
              Height = 21
              DataField = 'Location'
              DataSource = dsMain
              TabOrder = 0
            end
            object DBCheckBox1: TDBCheckBox
              Left = 16
              Top = 88
              Width = 97
              Height = 17
              Caption = #32534#22806
              DataField = 'OutsPrep'
              DataSource = dsMain
              TabOrder = 1
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object DBCheckBox2: TDBCheckBox
              Left = 16
              Top = 112
              Width = 97
              Height = 17
              Caption = #26377#25928
              DataField = 'active'
              DataSource = dsMain
              TabOrder = 2
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object edt_ABBR_NAME: TDBButtonEdit
              Left = 16
              Top = 24
              Width = 121
              Height = 21
              Hint = #25353'F1'#24377#20986#19979#25289#21015#34920
              DataSource = dsMain
              DataField = 'ABBR_NAME'
              ParentShowHint = False
              ReadOnlyColor = clInactiveCaptionText
              ShowHint = True
              TabOrder = 3
              F_DownFormWidth = 0
              F_PressKey13AutoDrop = False
            end
          end
        end
      end
      inherited Panel_Top: TPanel
        Width = 717
      end
      inherited Panel11: TPanel
        Width = 717
      end
    end
  end
  inherited Panel_right: TPanel
    Left = 723
    Height = 561
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
  object dtRead_0005: TADODataSet [15]
    Connection = DM_frm.ADOConnection1
    CursorType = ctStatic
    CommandText = 
      ' SELECT  Data0034.DEPT_NAME,Data0005.EMPL_CODE,Data0005.EMPLOYEE' +
      '_NAME,data0005.rkey from data0005'#13#10' left join Data0034 on data00' +
      '05.EMPLOYEE_ID=Data0034.RKEY'#13#10
    Parameters = <>
    Left = 436
    Top = 472
    object dtRead_0005DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object dtRead_0005EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object dtRead_0005EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object dtRead_0005rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object dtRead_0015: TADODataSet [16]
    Connection = DM_frm.ADOConnection1
    CursorType = ctStatic
    CommandText = 'select RKEY,WAREHOUSE_CODE,ABBR_NAME from data0015'
    Parameters = <>
    Left = 508
    Top = 472
    object dtRead_0015RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object dtRead_0015WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object dtRead_0015ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
  end
  inherited cdsMain: Tcds
    CommandText = 
      ' SELECT data0015.ABBR_NAME,data0840.* FROM data0840'#13#10' left join ' +
      'data0015 on data0840.D015_ptr=data0015.rkey'
    F_AutoIncrField = 'rkey'
    F_TableName = 'data0840'
    F_SQLSelectFrom = 
      ' SELECT data0015.ABBR_NAME,data0840.* FROM data0840'#13#10' left join ' +
      'data0015 on data0840.D015_ptr=data0015.rkey'
    object cdsMainABBR_NAME: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'ABBR_NAME'
      OnChange = cdsMainABBR_NAMEChange
      Size = 10
    end
    object cdsMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object cdsMainLocation: TStringField
      DisplayLabel = #36131#20219#23567#32452
      FieldName = 'Location'
    end
    object cdsMainOutsPrep: TBooleanField
      DisplayLabel = #32534#22806
      FieldName = 'OutsPrep'
    end
    object cdsMainD015_ptr: TIntegerField
      FieldName = 'D015_ptr'
    end
    object cdsMainactive: TBooleanField
      DisplayLabel = #26377#25928
      FieldName = 'active'
    end
  end
  inherited cdsChild: Tcds
    CommandText = 
      ' SELECT Data0005.EMPL_CODE,Data0005.EMPLOYEE_NAME,[Data0855].* F' +
      'ROM [dbo].[Data0855]'#13#10' join Data0005 on [Data0855].[D005_ptr]=Da' +
      'ta0005.RKEY'
    AfterOpen = cdsChildAfterOpen
    F_AutoIncrField = 'rkey'
    F_UniqueKey = 'D005_ptr'
    F_TableName = 'data0855'
    F_SQLSelectFrom = 
      ' SELECT Data0005.EMPL_CODE,Data0005.EMPLOYEE_NAME,[Data0855].* F' +
      'ROM [dbo].[Data0855]'#13#10' join Data0005 on [Data0855].[D005_ptr]=Da' +
      'ta0005.RKEY'
    F_Primarykey = 'rkey'
    F_Foreignkey = 'D840_ptr'
    object cdsChildEMPL_CODE: TStringField
      DisplayLabel = #38599#21592#20195#30721
      FieldName = 'EMPL_CODE'
      ProviderFlags = []
      OnChange = cdsChildEMPL_CODEChange
      Size = 10
    end
    object cdsChildEMPLOYEE_NAME: TStringField
      DisplayLabel = #38599#21592#22995#21517
      FieldName = 'EMPLOYEE_NAME'
      ProviderFlags = []
      Size = 16
    end
    object cdsChildRkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object cdsChildD840_ptr: TIntegerField
      FieldName = 'D840_ptr'
    end
    object cdsChildD005_ptr: TIntegerField
      FieldName = 'D005_ptr'
    end
    object cdsChildTTYPE: TBooleanField
      DisplayLabel = #26159#36127#36131#20154
      FieldName = 'TTYPE'
    end
    object cdsChildEntrDate: TDateTimeField
      DisplayLabel = #20837#32844#26085#26399
      FieldName = 'EntrDate'
    end
    object cdsChildDepaDate: TDateTimeField
      DisplayLabel = #31163#32844#26085#26399
      FieldName = 'DepaDate'
    end
  end
  inherited dtChild: TADODataSet
    CursorType = ctStatic
    CommandText = 
      ' SELECT Data0005.EMPL_CODE,Data0005.EMPLOYEE_NAME,[Data0855].* F' +
      'ROM [dbo].[Data0855]'#13#10' join Data0005 on [Data0855].[D005_ptr]=Da' +
      'ta0005.RKEY'
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
    object dtChildRkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object dtChildD840_ptr: TIntegerField
      FieldName = 'D840_ptr'
    end
    object dtChildD005_ptr: TIntegerField
      FieldName = 'D005_ptr'
    end
    object dtChildTTYPE: TBooleanField
      FieldName = 'TTYPE'
    end
    object dtChildEntrDate: TDateTimeField
      FieldName = 'EntrDate'
    end
    object dtChildDepaDate: TDateTimeField
      FieldName = 'DepaDate'
    end
  end
  inherited dtMain: TADODataSet
    CursorType = ctStatic
    CommandText = 
      ' SELECT data0015.ABBR_NAME,data0840.* FROM data0840'#13#10' left join ' +
      'data0015 on data0840.D015_ptr=data0015.rkey'
    object dtMainABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      ProviderFlags = []
      Size = 10
    end
    object dtMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object dtMainLocation: TStringField
      FieldName = 'Location'
    end
    object dtMainOutsPrep: TBooleanField
      FieldName = 'OutsPrep'
    end
    object dtMainD015_ptr: TIntegerField
      FieldName = 'D015_ptr'
    end
    object dtMainactive: TBooleanField
      FieldName = 'active'
    end
  end
end
