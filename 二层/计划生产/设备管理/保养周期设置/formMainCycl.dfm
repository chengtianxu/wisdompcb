inherited frmMainCycl: TfrmMainCycl
  Left = 283
  Top = 207
  Caption = 'frmMainCycl'
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
                  FieldName = 'MainCycl'
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
                  FieldName = 'DeviType'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'TypeName'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'TypeDesc'
                  Footers = <>
                  Width = 189
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
    CommandText = 'select * from data0811'
    F_TableName = 'data0811'
    F_SQLSelectFrom = 'select *from data0811'
    object cdsMainDeviType: TStringField
      DisplayLabel = #20445#20859#31867#22411
      FieldName = 'DeviType'
      Size = 10
    end
    object cdsMainTypeName: TStringField
      DisplayLabel = #31867#22411#21517#31216
      FieldName = 'TypeName'
    end
    object cdsMainTypeDesc: TStringField
      DisplayLabel = #31867#22411#25551#36848
      FieldName = 'TypeDesc'
      Size = 100
    end
  end
  inherited cdsChild: Tcds
    CommandText = 'select *'#13#10'from data0812 '#13#10
    F_TableName = 'data0812'
    F_SQLSelectFrom = 'select *'#13#10'from data0812 '#13#10
    F_SQLOrderBy = 
      'order by  (select rkey from data0816 where data0816.MainCycl=dat' +
      'a0812.MainCycl)'
    F_Primarykey = 'DeviType'
    F_Foreignkey = 'DeviType'
    object cdsChildDeviType: TStringField
      FieldName = 'DeviType'
      Size = 10
    end
    object cdsChildMainCycl: TStringField
      DisplayLabel = #20445#20859#21608#26399
      FieldName = 'MainCycl'
      Size = 10
    end
  end
  inherited dtChild: TADODataSet
    CursorType = ctStatic
    CommandText = 'select *'#13#10'from data0812 '#13#10
    object dtChildDeviType: TStringField
      FieldName = 'DeviType'
      Size = 10
    end
    object dtChildMainCycl: TStringField
      FieldName = 'MainCycl'
      Size = 10
    end
  end
  inherited dtMain: TADODataSet
    CursorType = ctStatic
    CommandText = 'select *from data0811'
    object dtMainDeviType: TStringField
      FieldName = 'DeviType'
      Size = 10
    end
    object dtMainTypeName: TStringField
      FieldName = 'TypeName'
    end
    object dtMainTypeDesc: TStringField
      FieldName = 'TypeDesc'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
  end
end
