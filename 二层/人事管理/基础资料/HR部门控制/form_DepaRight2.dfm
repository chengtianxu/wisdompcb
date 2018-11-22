inherited frm_DepaRight2: Tfrm_DepaRight2
  Left = 290
  Top = 180
  Width = 926
  Height = 642
  Caption = #26597#35810#21024#38500
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 12
  inherited dxStatusBar1: TdxStatusBar
    Top = 586
    Width = 918
  end
  inherited cxTabControl1: TcxTabControl
    Width = 918
    Height = 547
    ClientRectBottom = 547
    ClientRectRight = 918
    inherited Panel3: TPanel
      Width = 918
      Height = 542
      inherited Panel2: TPanel
        Left = 798
        Height = 538
        inherited RzToolbar1: TRzToolbar
          Height = 538
          RowHeight = 26
          ToolbarControls = (
            Button1)
          inherited Button1: TButton
            Top = 3
          end
        end
      end
      inherited Panel4: TPanel
        Width = 798
        Height = 538
        inherited Panel5: TPanel
          Top = 532
          Width = 798
        end
        inherited Panel6: TPanel
          Height = 532
        end
        inherited cxPageControl2: TcxPageControl
          Width = 793
          Height = 532
          ClientRectBottom = 532
          ClientRectRight = 793
          inherited cxTabSheet0: TcxTabSheet
            inherited ToolBar2: TToolBar
              Height = 509
            end
            inherited DghMain: TDBGridEh
              Width = 793
              Height = 509
              ReadOnly = True
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
                  Width = 134
                end
                item
                  EditButtons = <>
                  FieldName = 'departmentname'
                  Footers = <>
                  Width = 132
                end
                item
                  EditButtons = <>
                  FieldName = 'departmentcode'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'DESCRIPTION'
                  Footers = <>
                  Width = 161
                end
                item
                  EditButtons = <>
                  FieldName = 'PROGRAME'
                  Footers = <>
                  Width = 154
                end>
            end
          end
          inherited cxTabSheet1: TcxTabSheet
            ParentShowHint = False
            TabVisible = False
          end
        end
      end
      inherited Panel7: TPanel
        Top = 538
        Width = 918
      end
    end
    inherited Panel1: TPanel
      Width = 918
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
      'select data0073.USER_LOGIN_NAME,data0073.USER_FULL_NAME,departme' +
      'ntname,'#13#10'departmentcode,DESCRIPTION,PROGRAME,hr_permission.*'#13#10'fr' +
      'om dbo.hr_permission'#13#10'join data0073 on hr_permission.operator_pt' +
      'r=data0073.rkey'#13#10'join datadepartment on hr_permission.department' +
      'id=datadepartment.rkey'#13#10'join data0419 on hr_permission.program_p' +
      'tr=data0419.rkey'#13#10'where operator_ptr =:vOperator_ptr '
    Parameters = <
      item
        Name = 'vOperator_ptr'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
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
    object dtMaindepartmentname: TWideStringField
      FieldName = 'departmentname'
      ProviderFlags = []
    end
    object dtMaindepartmentcode: TWideStringField
      FieldName = 'departmentcode'
      ProviderFlags = []
    end
    object dtMainDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      ProviderFlags = []
      Size = 50
    end
    object dtMainPROGRAME: TStringField
      FieldName = 'PROGRAME'
      ProviderFlags = []
      Size = 50
    end
    object dtMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object dtMainoperator_ptr: TIntegerField
      FieldName = 'operator_ptr'
    end
    object dtMaindepartmentid: TIntegerField
      FieldName = 'departmentid'
    end
    object dtMainprogram_ptr: TIntegerField
      FieldName = 'program_ptr'
    end
  end
  inherited cdsMain: Tcds
    CommandText = 
      'select data0073.USER_LOGIN_NAME,data0073.USER_FULL_NAME,departme' +
      'ntname,'#13#10'departmentcode,DESCRIPTION,PROGRAME,hr_permission.*'#13#10'fr' +
      'om dbo.hr_permission'#13#10'join data0073 on hr_permission.operator_pt' +
      'r=data0073.rkey'#13#10'join datadepartment on hr_permission.department' +
      'id=datadepartment.rkey'#13#10'join data0419 on hr_permission.program_p' +
      'tr=data0419.rkey'#13#10'where operator_ptr =:vOperator_ptr '
    Params = <
      item
        DataType = ftInteger
        Name = 'vOperator_ptr'
        ParamType = ptUnknown
      end>
    F_AutoSave = False
    F_SQLSelectFrom = 
      'select data0073.USER_LOGIN_NAME,data0073.USER_FULL_NAME,departme' +
      'ntname,'#13#10'departmentcode,DESCRIPTION,PROGRAME,hr_permission.*'#13#10'fr' +
      'om dbo.hr_permission'#13#10'join data0073 on hr_permission.operator_pt' +
      'r=data0073.rkey'#13#10'join datadepartment on hr_permission.department' +
      'id=datadepartment.rkey'#13#10'join data0419 on hr_permission.program_p' +
      'tr=data0419.rkey'
    F_SQLWhere = 'where operator_ptr =:vOperator_ptr '
    object cdsMainUSER_LOGIN_NAME: TStringField
      DisplayLabel = #29992#25143#20195#30721
      FieldName = 'USER_LOGIN_NAME'
      ProviderFlags = []
      Size = 15
    end
    object cdsMainUSER_FULL_NAME: TStringField
      DisplayLabel = #29992#25143#21517
      FieldName = 'USER_FULL_NAME'
      ProviderFlags = []
      Size = 30
    end
    object cdsMaindepartmentname: TWideStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'departmentname'
      ProviderFlags = []
    end
    object cdsMaindepartmentcode: TWideStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'departmentcode'
      ProviderFlags = []
    end
    object cdsMainDESCRIPTION: TStringField
      DisplayLabel = #33756#21333#21517
      FieldName = 'DESCRIPTION'
      ProviderFlags = []
      Size = 50
    end
    object cdsMainPROGRAME: TStringField
      DisplayLabel = #31243#24207#21517
      FieldName = 'PROGRAME'
      ProviderFlags = []
      Size = 50
    end
    object cdsMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object cdsMainoperator_ptr: TIntegerField
      FieldName = 'operator_ptr'
    end
    object cdsMaindepartmentid: TIntegerField
      FieldName = 'departmentid'
    end
    object cdsMainprogram_ptr: TIntegerField
      FieldName = 'program_ptr'
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
