inherited PpCutting_2_frm: TPpCutting_2_frm
  Left = 317
  Top = 165
  Width = 842
  Height = 520
  Caption = #25439#32791#20999#21106#35760#24405
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  inherited dxStatusBar1: TdxStatusBar
    Top = 471
    Width = 834
  end
  inherited cxTabControl1: TcxTabControl
    Width = 834
    Height = 412
    ClientRectBottom = 412
    ClientRectRight = 834
    inherited Panel3: TPanel
      Width = 834
      Height = 407
      inherited Panel2: TPanel
        Left = 714
        Height = 403
        inherited RzToolbar1: TRzToolbar
          Height = 403
          ToolbarControls = (
            Button1)
        end
      end
      inherited Panel4: TPanel
        Width = 714
        Height = 403
        inherited Panel5: TPanel
          Top = 397
          Width = 714
        end
        inherited Panel6: TPanel
          Height = 397
        end
        inherited cxPageControl2: TcxPageControl
          Width = 709
          Height = 397
          ClientRectBottom = 397
          ClientRectRight = 709
          inherited cxTabSheet0: TcxTabSheet
            inherited ToolBar2: TToolBar
              Height = 374
            end
            inherited DghMain: TDBGridEh
              Width = 709
              Height = 374
              Columns = <
                item
                  EditButtons = <>
                  FieldName = #20999#21106#20154#20195#30721
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #20999#21106#20154
                  Footers = <>
                  Width = 67
                end
                item
                  EditButtons = <>
                  FieldName = #21019#24314#20154
                  Footers = <>
                  Width = 68
                end
                item
                  EditButtons = <>
                  FieldName = 'panel'#38271#24230
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'panel'#23485#24230
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #29983#20135#24635#25968#37327
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'PP'#20999#21106#24352#25968
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'PP'#20999#21106#38271#24230
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'PP'#20999#21106#21367#25968
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #22791#27880
                  Footers = <>
                  Width = 209
                end>
            end
          end
          inherited cxTabSheet1: TcxTabSheet
            TabVisible = False
          end
        end
      end
      inherited Panel7: TPanel
        Top = 403
        Width = 834
      end
    end
    inherited Panel1: TPanel
      Width = 834
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
      'select data0005.EMPL_CODE '#20999#21106#20154#20195#30721',data0005.EMPLOYEE_NAME '#20999#21106#20154',d5.EM' +
      'PLOYEE_NAME '#21019#24314#20154','#13#10'panel_ln'#9'panel'#38271#24230','#13#10'panel_wd'#9'panel'#23485#24230','#13#10'manuf_qt' +
      'y'#9#29983#20135#24635#25968#37327','#13#10'panel_qty'#9'PP'#20999#21106#24352#25968','#13#10'pp_quota_len'#9'PP'#20999#21106#38271#24230','#13#10'pp_quota_roll' +
      #9'PP'#20999#21106#21367#25968','#13#10'data0733.remark'#9#22791#27880' '#13#10'from data0733 '#13#10'join data0005 on ' +
      'data0733.[empl_ptr]=data0005.rkey'#13#10'join data0005 as d5 on data07' +
      '33.[create_empl_ptr]=d5.rkey'
  end
  inherited cdsMain: Tcds
    CommandText = 
      'select data0005.EMPL_CODE '#20999#21106#20154#20195#30721',data0005.EMPLOYEE_NAME '#20999#21106#20154',d5.EM' +
      'PLOYEE_NAME '#21019#24314#20154','#13#10'panel_ln'#9'panel'#38271#24230','#13#10'panel_wd'#9'panel'#23485#24230','#13#10'manuf_qt' +
      'y'#9#29983#20135#24635#25968#37327','#13#10'panel_qty'#9'PP'#20999#21106#24352#25968','#13#10'pp_quota_len'#9'PP'#20999#21106#38271#24230','#13#10'pp_quota_roll' +
      #9'PP'#20999#21106#21367#25968','#13#10'data0733.remark'#9#22791#27880' '#13#10'from data0733 '#13#10'join data0005 on ' +
      'data0733.[empl_ptr]=data0005.rkey'#13#10'join data0005 as d5 on data07' +
      '33.[create_empl_ptr]=d5.rkey'
    ReadOnly = True
    F_SQLSelectFrom = 
      'select data0005.EMPL_CODE '#20999#21106#20154#20195#30721',data0005.EMPLOYEE_NAME '#20999#21106#20154',d5.EM' +
      'PLOYEE_NAME '#21019#24314#20154','#13#10'panel_ln'#9'panel'#38271#24230','#13#10'panel_wd'#9'panel'#23485#24230','#13#10'manuf_qt' +
      'y'#9#29983#20135#24635#25968#37327','#13#10'panel_qty'#9'PP'#20999#21106#24352#25968','#13#10'pp_quota_len'#9'PP'#20999#21106#38271#24230','#13#10'pp_quota_roll' +
      #9'PP'#20999#21106#21367#25968','#13#10'data0733.remark'#9#22791#27880' '#13#10'from data0733 '#13#10'join data0005 on ' +
      'data0733.[empl_ptr]=data0005.rkey'#13#10'join data0005 as d5 on data07' +
      '33.[create_empl_ptr]=d5.rkey'
    object cdsMainCDSDesigner: TStringField
      FieldName = #20999#21106#20154#20195#30721
      Size = 10
    end
    object cdsMainCDSDesigner2: TStringField
      FieldName = #20999#21106#20154
      Size = 16
    end
    object cdsMainCDSDesigner3: TStringField
      FieldName = #21019#24314#20154
      Size = 16
    end
    object cdsMainpanel: TBCDField
      FieldName = 'panel'#38271#24230
      Precision = 7
      Size = 2
    end
    object cdsMainpanel2: TBCDField
      FieldName = 'panel'#23485#24230
      Precision = 7
      Size = 2
    end
    object cdsMainCDSDesigner4: TIntegerField
      FieldName = #29983#20135#24635#25968#37327
    end
    object cdsMainPP: TIntegerField
      FieldName = 'PP'#20999#21106#24352#25968
    end
    object cdsMainPP2: TBCDField
      FieldName = 'PP'#20999#21106#38271#24230
      Precision = 10
      Size = 5
    end
    object cdsMainPP3: TBCDField
      FieldName = 'PP'#20999#21106#21367#25968
      Precision = 10
      Size = 5
    end
    object cdsMainCDSDesigner5: TWideStringField
      FieldName = #22791#27880
      Size = 100
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
