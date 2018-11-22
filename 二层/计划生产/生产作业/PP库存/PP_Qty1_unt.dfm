inherited PP_Qty1_frm: TPP_Qty1_frm
  Left = 263
  Top = 207
  Width = 800
  Caption = #32791#29992#35760#24405#34892
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  inherited dxStatusBar1: TdxStatusBar
    Width = 792
  end
  inherited cxTabControl1: TcxTabControl
    Width = 792
    ClientRectRight = 792
    inherited Panel3: TPanel
      Width = 792
      inherited Panel2: TPanel
        Left = 672
        inherited RzToolbar1: TRzToolbar
          ToolbarControls = (
            Button1)
        end
      end
      inherited Panel4: TPanel
        Width = 672
        inherited Panel5: TPanel
          Width = 672
        end
        inherited cxPageControl2: TcxPageControl
          Width = 667
          ClientRectRight = 667
          inherited cxTabSheet0: TcxTabSheet
            inherited DghMain: TDBGridEh
              Width = 667
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'rkey'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'rkey733'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'TYPE'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'MANU_PART_NUMBER'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'pp_quota_len'
                  Footers = <>
                  Width = 93
                end
                item
                  EditButtons = <>
                  FieldName = 'pp_quota_roll'
                  Footers = <>
                  Width = 81
                end
                item
                  EditButtons = <>
                  FieldName = 'panel_ln'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'panel_wd'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'manuf_qty'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'panel_qty'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'EMPL_CODE'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'EMPLOYEE_NAME'
                  Footers = <>
                end>
            end
          end
          inherited cxTabSheet1: TcxTabSheet
            TabVisible = False
          end
        end
      end
      inherited Panel7: TPanel
        Width = 792
      end
    end
    inherited Panel1: TPanel
      Width = 792
    end
  end
  inherited dxBarManager: TdxBarManager
    DockControlHeights = (
      0
      0
      59
      0)
    inherited dxBarManagerBar2: TdxBar
      ItemLinks = <
        item
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
      'select data0005.EMPL_CODE,data0005.EMPLOYEE_NAME,data0025.MANU_P' +
      'ART_NUMBER,'#13#10'Case data0733.[TYPE] when 0 then '#39#27491#24120#20999#21106#39' when 1 then' +
      ' '#39#25439#32791#20999#21106#39' end [TYPE],'#13#10'data0733.rkey,data0733.rkey733,data0733.pan' +
      'el_ln,data0733.panel_wd,data0733.manuf_qty,'#13#10'data0733.panel_qty,' +
      'data0733.pp_quota_len,data0733.pp_quota_roll'#13#10'from data0735'#13#10'joi' +
      'n data0733 on data0735.rkey733=data0733.rkey'#13#10'join data0005 on d' +
      'ata0733.[empl_ptr]=data0005.rkey'#13#10'join data0025 on data0733.[rke' +
      'y25]=data0025.rkey'
  end
  inherited cdsMain: Tcds
    CommandText = 
      'select data0005.EMPL_CODE,data0005.EMPLOYEE_NAME,data0025.MANU_P' +
      'ART_NUMBER,'#13#10'Case data0733.[TYPE] when 0 then '#39#27491#24120#20999#21106#39' when 1 then' +
      ' '#39#25439#32791#20999#21106#39' end [TYPE],'#13#10'data0733.rkey,data0733.rkey733,data0733.pan' +
      'el_ln,data0733.panel_wd,data0733.manuf_qty,'#13#10'data0733.panel_qty,' +
      'data0733.pp_quota_len,data0733.pp_quota_roll'#13#10'from data0735'#13#10'joi' +
      'n data0733 on data0735.rkey733=data0733.rkey'#13#10'join data0005 on d' +
      'ata0733.[empl_ptr]=data0005.rkey'#13#10'join data0025 on data0733.[rke' +
      'y25]=data0025.rkey'
    F_SQLSelectFrom = 
      'select data0005.EMPL_CODE,data0005.EMPLOYEE_NAME,data0025.MANU_P' +
      'ART_NUMBER,'#13#10'Case data0733.[TYPE] when 0 then '#39#27491#24120#20999#21106#39' when 1 then' +
      ' '#39#25439#32791#20999#21106#39' end [TYPE],'#13#10'data0733.rkey,data0733.rkey733,data0733.pan' +
      'el_ln,data0733.panel_wd,data0733.manuf_qty,'#13#10'data0733.panel_qty,' +
      'data0733.pp_quota_len,data0733.pp_quota_roll'#13#10'from data0735'#13#10'joi' +
      'n data0733 on data0735.rkey733=data0733.rkey'#13#10'join data0005 on d' +
      'ata0733.[empl_ptr]=data0005.rkey'#13#10'join data0025 on data0733.[rke' +
      'y25]=data0025.rkey'
    object cdsMainrkey: TAutoIncField
      DisplayLabel = #20999#21106#32534#21495
      FieldName = 'rkey'
      ReadOnly = True
    end
    object cdsMainrkey733: TIntegerField
      DisplayLabel = #20851#32852#32534#21495
      FieldName = 'rkey733'
    end
    object cdsMainTYPE: TStringField
      DisplayLabel = #31867#22411
      FieldName = 'TYPE'
      ReadOnly = True
      Size = 8
    end
    object cdsMainMANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object cdsMainEMPL_CODE: TStringField
      DisplayLabel = #20999#21106#20154#20195#30721
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object cdsMainEMPLOYEE_NAME: TStringField
      DisplayLabel = #20999#21106#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object cdsMainpanel_ln: TBCDField
      DisplayLabel = #38271#24230'('#32428#21521')'
      FieldName = 'panel_ln'
      Precision = 7
      Size = 2
    end
    object cdsMainpanel_wd: TBCDField
      DisplayLabel = #23485#24230'('#32463#21521')'
      FieldName = 'panel_wd'
      Precision = 7
      Size = 2
    end
    object cdsMainmanuf_qty: TIntegerField
      DisplayLabel = #29983#20135#24635#25968#37327'(panel)'
      FieldName = 'manuf_qty'
    end
    object cdsMainpanel_qty: TIntegerField
      DisplayLabel = #20999#21106#24352#25968
      FieldName = 'panel_qty'
    end
    object cdsMainpp_quota_len: TBCDField
      DisplayLabel = #37197#39069#20999#21106#38271#24230'('#31859')'
      FieldName = 'pp_quota_len'
      Precision = 10
      Size = 5
    end
    object cdsMainpp_quota_roll: TBCDField
      DisplayLabel = #37197#39069#20999#21106#21367#25968
      FieldName = 'pp_quota_roll'
      Precision = 10
      Size = 5
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
