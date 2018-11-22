inherited frm_Cycle: Tfrm_Cycle
  Left = 349
  Top = 228
  Width = 701
  Height = 515
  Caption = #21608#26399#35774#32622
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  inherited StatusBar1: TStatusBar
    Top = 462
    Width = 693
  end
  inherited RzToolbar1: TRzToolbar
    Width = 693
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
    inherited tblfind: TRzToolButton
      Visible = False
    end
  end
  inherited Panel_right: TPanel
    Left = 687
    Height = 421
  end
  inherited Panel_Left: TPanel
    Height = 421
  end
  inherited Panel_Main: TPanel
    Width = 681
    Height = 421
    inherited Panel5: TPanel
      Width = 681
      Height = 408
      inherited Panel7: TPanel
        Left = 561
        Height = 408
        inherited RzToolbar2: TRzToolbar
          Height = 408
          ToolbarControls = (
            btn1)
        end
        inherited Panel2: TPanel
          Height = 408
        end
      end
      inherited PageControl_M: TPageControl
        Width = 561
        Height = 408
        inherited TabSheet1: TTabSheet
          inherited DghMain: TDBGridEh
            Width = 553
            Height = 381
            Columns = <
              item
                EditButtons = <>
                FieldName = 'Description'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'MinValue'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'MaxValue'
                Footers = <>
              end>
          end
        end
      end
    end
    inherited Panel6: TPanel
      Width = 681
    end
    inherited Panel_Bottom: TPanel
      Top = 416
      Width = 681
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
    CommandText = 'select * from data0051'
    F_AutoIncrField = 'rkey'
    F_UniqueKey = 'Description'
    F_TableName = 'data0051'
    F_SQLSelectFrom = 'select * from data0051'
    object cdsMainrkey: TAutoIncField
      DisplayWidth = 10
      FieldName = 'rkey'
      ReadOnly = True
    end
    object cdsMainDescription: TStringField
      DisplayLabel = #21608#26399#25551#36848
      DisplayWidth = 21
      FieldName = 'Description'
      Size = 40
    end
    object cdsMainMinValue: TBCDField
      DisplayLabel = #26368#23567#20540'>'
      DisplayWidth = 10
      FieldName = 'MinValue'
      Precision = 9
      Size = 2
    end
    object cdsMainMaxValue: TBCDField
      DisplayLabel = #26368#22823#20540'<='
      DisplayWidth = 10
      FieldName = 'MaxValue'
      Precision = 9
      Size = 2
    end
  end
  inherited dtMain: TADODataSet
    CursorType = ctStatic
    CommandText = 'select * from data0051'
    object dtMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object dtMainDescription: TStringField
      DisplayLabel = #21608#26399#25551#36848
      FieldName = 'Description'
      Size = 40
    end
    object dtMainMinValue: TBCDField
      DisplayLabel = #22823#20110
      FieldName = 'MinValue'
      Precision = 9
      Size = 2
    end
    object dtMainMaxValue: TBCDField
      DisplayLabel = #23567#20110#25110#31561#20110
      FieldName = 'MaxValue'
      Precision = 9
      Size = 2
    end
  end
end
