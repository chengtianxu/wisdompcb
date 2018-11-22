inherited frm_FaultName: Tfrm_FaultName
  Left = 269
  Top = 195
  Caption = 'frm_FaultName'
  Visible = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited RzToolbar1: TRzToolbar
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
  inherited Panel_Main: TPanel
    inherited Panel_Below: TPanel
      inherited Panel9: TPanel
        inherited Panel10: TPanel
          inherited RzToolbar_right_2: TRzToolbar
            ToolbarControls = (
              Button1)
          end
        end
        inherited PageControl_D: TPageControl
          inherited TabSheet3: TTabSheet
            inherited dghChild: TDBGridEh
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'rkey'
                  Footers = <>
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'D845_ptr'
                  Footers = <>
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'FaultName'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'stdDate'
                  Footers = <>
                end>
            end
          end
          inherited TabSheet4: TTabSheet
            TabVisible = False
          end
        end
      end
    end
    inherited Panel_Above: TPanel
      inherited Panel5: TPanel
        inherited Panel7: TPanel
          inherited RzToolbar_right_1: TRzToolbar
            ToolbarControls = (
              btn1)
          end
        end
        inherited PageControl_M: TPageControl
          inherited TabSheet1: TTabSheet
            inherited DghMain: TDBGridEh
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'FaultDesc'
                  Footers = <>
                end>
            end
          end
          inherited TabSheet2: TTabSheet
            TabVisible = False
          end
        end
      end
    end
  end
  inherited dtMain: TADODataSet
    CursorType = ctStatic
    CommandText = 'select * from data0845'
  end
  inherited cdsMain: Tcds
    CommandText = 'select * from data0845'
    F_AutoIncrField = 'rkey'
    F_UniqueKey = 'FaultDesc'
    F_TableName = 'data0845'
    F_SQLSelectFrom = 'select * from data0845'
    object cdsMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object cdsMainFaultDesc: TStringField
      DisplayLabel = #25925#38556#31867#21035
      FieldName = 'FaultDesc'
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
  inherited cdsChild: Tcds
    CommandText = 'select * from data0846 '#13#10'where D845_ptr=:vD845_ptr'
    Params = <
      item
        DataType = ftUnknown
        Name = 'vD845_ptr'
        ParamType = ptUnknown
      end>
    F_AutoIncrField = 'rkey'
    F_TableName = 'Data0846'
    F_SQLSelectFrom = 'select * from data0846 '
    F_Primarykey = 'rkey'
    F_Foreignkey = 'D845_ptr'
    object cdsChildrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object cdsChildD845_ptr: TIntegerField
      FieldName = 'D845_ptr'
      Visible = False
    end
    object cdsChildFaultName: TStringField
      DisplayLabel = #25925#38556#21517#31216
      FieldName = 'FaultName'
      Size = 50
    end
    object cdsChildstdDate: TBCDField
      DisplayLabel = #26631#20934#26102#38388
      FieldName = 'stdDate'
      Precision = 9
      Size = 2
    end
  end
  inherited dtChild: TADODataSet
    CursorType = ctStatic
    CommandText = 'select * from data0846 '#13#10'where D845_ptr=:vD845_ptr'
    Parameters = <
      item
        Name = 'vD845_ptr'
        Size = -1
        Value = Null
      end>
  end
end
