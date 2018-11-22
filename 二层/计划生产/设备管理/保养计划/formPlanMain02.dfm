inherited frmPlanMain02: TfrmPlanMain02
  Caption = #26242#20572#35760#24405
  PixelsPerInch = 96
  TextHeight = 12
  inherited cxTabControl1: TcxTabControl
    inherited Panel3: TPanel
      inherited Panel2: TPanel
        inherited RzToolbar1: TRzToolbar
          RowHeight = 26
          ToolbarControls = (
            Button1
            Button2
            Button3)
          inherited Button1: TButton
            Top = 3
          end
          object Button2: TButton
            Left = 4
            Top = 30
            Width = 111
            Height = 23
            Caption = #26242#20572#20445#20859
            TabOrder = 1
            Visible = False
            OnClick = Button2Click
          end
          object Button3: TButton
            Left = 4
            Top = 56
            Width = 111
            Height = 23
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
          inherited cxTabSheet0: TcxTabSheet
            inherited DghMain: TDBGridEh
              ReadOnly = True
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'Rkey'
                  Footers = <>
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'rkey831'
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
                  Width = 265
                end>
            end
          end
          inherited cxTabSheet1: TcxTabSheet
            TabVisible = False
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
      39
      0)
    inherited dxBarManagerBar2: TdxBar
      ItemLinks = <
        item
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
    CommandText = 'select * from data0833 '
    object dtMainRkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object dtMainrkey831: TIntegerField
      FieldName = 'rkey831'
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
    CommandText = 'select * from data0833 where rkey831 =:vRkey831'
    Params = <
      item
        DataType = ftUnknown
        Name = 'vRkey831'
        ParamType = ptUnknown
      end>
    ReadOnly = True
    F_AutoIncrField = 'rkey'
    F_SQLSelectFrom = 'select * from data0833 '
    object cdsMainRkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object cdsMainrkey831: TIntegerField
      FieldName = 'rkey831'
    end
    object cdsMainstop_begin_date: TDateTimeField
      DisplayLabel = #26242#20572#24320#22987#26102#38388
      FieldName = 'stop_begin_date'
    end
    object cdsMainstop_end_date: TDateTimeField
      DisplayLabel = #26242#20572#32467#26463#26102#38388
      FieldName = 'stop_end_date'
    end
    object cdsMainremark: TWideStringField
      DisplayLabel = #26242#20572#21407#22240#35828#26126
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
