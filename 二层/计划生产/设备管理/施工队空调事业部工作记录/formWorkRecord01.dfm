inherited frmWorkRecord01: TfrmWorkRecord01
  Caption = 'frmWorkRecord01'
  PixelsPerInch = 96
  TextHeight = 12
  inherited cxTabControl1: TcxTabControl
    inherited Panel3: TPanel
      inherited Panel2: TPanel
        inherited RzToolbar1: TRzToolbar
          RowHeight = 26
          ToolbarControls = (
            Button1)
          inherited Button1: TButton
            Top = 3
          end
        end
      end
      inherited Panel4: TPanel
        inherited cxPageControl2: TcxPageControl
          inherited cxTabSheet0: TcxTabSheet
            inherited DghMain: TDBGridEh
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'USER_FULL_NAME'
                  Footers = <>
                  Width = 124
                end
                item
                  EditButtons = <>
                  FieldName = 'MainExecStat'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'Record_date'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'remark'
                  Footers = <>
                  Width = 196
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
      'select USER_FULL_NAME,MainExecStat,Record_date,remark from data0' +
      '839'#13#10'join data0832 on data0839.Status_ptr=data0832.RKEY'#13#10'join da' +
      'ta0073 on data0839.User_ptr=data0073.rkey'#13#10'where TableName=:vTab' +
      'leName and Record_rkey=:vRecord_rkey'#13#10
    Parameters = <
      item
        Name = 'vTableName'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 8
        Value = Null
      end
      item
        Name = 'vRecord_rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
  end
  inherited cdsMain: Tcds
    CommandText = 
      'select USER_FULL_NAME,MainExecStat,Record_date,remark from data0' +
      '839'#13#10'join data0832 on data0839.Status_ptr=data0832.RKEY'#13#10'join da' +
      'ta0073 on data0839.User_ptr=data0073.rkey'#13#10'where TableName=:vTab' +
      'leName and Record_rkey=:vRecord_rkey'#13#10
    Params = <
      item
        DataType = ftUnknown
        Name = 'vTableName'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vRecord_rkey'
        ParamType = ptUnknown
      end>
    object cdsMainUSER_FULL_NAME: TStringField
      DisplayLabel = #22995#21517
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object cdsMainMainExecStat: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'MainExecStat'
      Size = 10
    end
    object cdsMainRecord_date: TDateTimeField
      DisplayLabel = #26085#26399
      FieldName = 'Record_date'
    end
    object cdsMainremark: TWideStringField
      DisplayLabel = #25551#36848
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
