inherited frmPlanMain3: TfrmPlanMain3
  Caption = 'frmPlanMain3'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxTabControl1: TcxTabControl
    inherited Panel3: TPanel
      inherited Panel2: TPanel
        inherited RzToolbar1: TRzToolbar
          ToolbarControls = (
            Button1
            Button2
            Button3)
          object Button2: TButton
            Left = 4
            Top = 35
            Width = 121
            Height = 25
            Caption = #26242#20572#20445#20859
            TabOrder = 1
            Visible = False
            OnClick = Button2Click
          end
          object Button3: TButton
            Left = 4
            Top = 65
            Width = 121
            Height = 25
            Caption = #26242#20572#32467#26463
            Enabled = False
            TabOrder = 2
            Visible = False
            OnClick = Button3Click
          end
        end
      end
      inherited Panel4: TPanel
        inherited cxPageControl2: TcxPageControl
          inherited cxTabSheet1: TcxTabSheet
            inherited DghMain: TDBGridEh
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'Rkey'
                  Footers = <>
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'Work_ptr'
                  Footers = <>
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'stop_begin_date'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'stop_end_date'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'remark'
                  Footers = <>
                end>
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
      61
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
    CommandText = 'select * from data0849 '
    object dtMainRkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object dtMainWork_ptr: TIntegerField
      FieldName = 'Work_ptr'
    end
    object dtMainstop_begin_date: TDateTimeField
      FieldName = 'stop_begin_date'
    end
    object dtMainstop_end_date: TDateTimeField
      FieldName = 'stop_end_date'
    end
    object dtMainremark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
  end
  inherited cdsMain: Tcds
    CommandText = 'select * from data0849 where work_ptr=:vWork_ptr'
    Params = <
      item
        DataType = ftUnknown
        Name = 'vWork_ptr'
        ParamType = ptUnknown
      end>
    object cdsMainRkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object cdsMainWork_ptr: TIntegerField
      FieldName = 'Work_ptr'
    end
    object cdsMainstop_begin_date: TDateTimeField
      DisplayLabel = #24320#22987#26102#38388
      FieldName = 'stop_begin_date'
    end
    object cdsMainstop_end_date: TDateTimeField
      DisplayLabel = #32467#26463#26102#38388
      FieldName = 'stop_end_date'
    end
    object cdsMainremark: TWideStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 50
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
