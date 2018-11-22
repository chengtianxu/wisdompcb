inherited frmPlanMain05: TfrmPlanMain05
  Left = 303
  Top = 206
  Width = 905
  Height = 652
  Caption = #26631#20934#28040#32791#26102#38388#35774#32622
  PixelsPerInch = 96
  TextHeight = 12
  inherited dxStatusBar1: TdxStatusBar
    Top = 596
    Width = 897
  end
  inherited cxTabControl1: TcxTabControl
    Width = 897
    Height = 557
    ClientRectBottom = 557
    ClientRectRight = 897
    inherited Panel3: TPanel
      Width = 897
      Height = 552
      inherited Panel2: TPanel
        Left = 777
        Height = 548
        inherited RzToolbar1: TRzToolbar
          Height = 548
          RowHeight = 26
          ToolbarControls = (
            Button1)
          inherited Button1: TButton
            Top = 3
          end
        end
      end
      inherited Panel4: TPanel
        Width = 777
        Height = 548
        inherited Panel5: TPanel
          Top = 542
          Width = 777
        end
        inherited Panel6: TPanel
          Height = 542
        end
        inherited cxPageControl2: TcxPageControl
          Width = 772
          Height = 542
          ClientRectBottom = 542
          ClientRectRight = 772
          inherited cxTabSheet0: TcxTabSheet
            inherited ToolBar2: TToolBar
              Height = 519
            end
            inherited DghMain: TDBGridEh
              Width = 772
              Height = 519
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'FASSET_CODE'
                  Footers = <>
                  Width = 174
                end
                item
                  EditButtons = <>
                  FieldName = 'FASSET_NAME'
                  Footers = <>
                  ReadOnly = True
                end
                item
                  EditButtons = <>
                  FieldName = 'DEPT_CODE'
                  Footers = <>
                  ReadOnly = True
                end
                item
                  EditButtons = <>
                  FieldName = 'DEPT_NAME'
                  Footers = <>
                  ReadOnly = True
                  Width = 109
                end
                item
                  EditButtons = <>
                  FieldName = 'MainCycl'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'StdTimeCons'
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
        Top = 548
        Width = 897
      end
    end
    inherited Panel1: TPanel
      Width = 897
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
          ItemName = 'tblAdd'
        end
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
    CommandText = 
      'select data0034.DEPT_CODE,data0034.DEPT_NAME,rtrim(d17.FASSET_CO' +
      'DE) as FASSET_CODE,d17.FASSET_NAME,Data0847.* from dbo.Data0847 ' +
      #13#10'join data0417 d17 on Data0847.D417_ptr=d17.rkey'#13#10'join data0816' +
      ' on Data0847.MainCycl=data0816.MainCycl'#13#10'join data0034 on d17.DE' +
      'PT_PTR=data0034.rkey'
    object dtMainFASSET_CODE: TStringField
      FieldName = 'FASSET_CODE'
      ProviderFlags = []
    end
    object dtMainFASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      ProviderFlags = []
      Size = 30
    end
    object dtMainRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object dtMainD417_ptr: TIntegerField
      FieldName = 'D417_ptr'
    end
    object dtMainMainCycl: TStringField
      FieldName = 'MainCycl'
      Size = 10
    end
    object dtMainStdTimeCons: TBCDField
      FieldName = 'StdTimeCons'
      Precision = 9
      Size = 2
    end
    object dtMainDEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      ProviderFlags = []
      Size = 10
    end
    object dtMainDEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      ProviderFlags = []
      Size = 30
    end
  end
  inherited cdsMain: Tcds
    CommandText = 
      'select data0034.DEPT_CODE,data0034.DEPT_NAME,rtrim(d17.FASSET_CO' +
      'DE) as FASSET_CODE,d17.FASSET_NAME,Data0847.* from dbo.Data0847 ' +
      #13#10'join data0417 d17 on Data0847.D417_ptr=d17.rkey'#13#10'join data0816' +
      ' on Data0847.MainCycl=data0816.MainCycl'#13#10'join data0034 on d17.DE' +
      'PT_PTR=data0034.rkey'
    F_AutoIncrField = 'rkey'
    F_TableName = 'Data0847'
    F_SQLSelectFrom = 
      'select data0034.DEPT_CODE,data0034.DEPT_NAME,rtrim(d17.FASSET_CO' +
      'DE) as FASSET_CODE,d17.FASSET_NAME,Data0847.* from dbo.Data0847 ' +
      #13#10'join data0417 d17 on Data0847.D417_ptr=d17.rkey'#13#10'join data0816' +
      ' on Data0847.MainCycl=data0816.MainCycl'#13#10'join data0034 on d17.DE' +
      'PT_PTR=data0034.rkey'
    F_SQLOrderBy = 'order by d17.FASSET_CODE,data0816.rkey'
    object cdsMainDEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object cdsMainDEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object cdsMainFASSET_CODE: TStringField
      DisplayLabel = #35774#22791#20195#30721
      FieldName = 'FASSET_CODE'
      OnChange = cdsMainFASSET_CODEChange
    end
    object cdsMainFASSET_NAME: TStringField
      DisplayLabel = #35774#22791#21517#31216
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object cdsMainRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object cdsMainD417_ptr: TIntegerField
      FieldName = 'D417_ptr'
      Visible = False
    end
    object cdsMainMainCycl: TStringField
      DisplayLabel = #21608#26399
      FieldName = 'MainCycl'
      Size = 10
    end
    object cdsMainStdTimeCons: TBCDField
      DisplayLabel = #26631#20934#26102#38388
      FieldName = 'StdTimeCons'
      Precision = 9
      Size = 2
    end
  end
  inherited dtRead: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'select data0417.rkey,rtrim(FASSET_CODE)FASSET_CODE,FASSET_NAME,F' +
      'ASSET_DESC,data0034.DEPT_CODE,data0034.DEPT_NAME'#13#10'from data0417 ' +
      'join data0034 on data0417.DEPT_PTR=data0034.rkey'#13#10'where IsGroup=' +
      '0'
  end
  inherited cdsRead: TClientDataSet
    Left = 568
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
  inherited PopupMenu1: TPopupMenu
    Left = 325
  end
  object cds0417L: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select data0417.rkey,rtrim(FASSET_CODE)FASSET_CODE,FASSET_NAME,F' +
      'ASSET_DESC,data0034.DEPT_CODE,data0034.DEPT_NAME'#13#10'from data0417 ' +
      'join data0034 on data0417.DEPT_PTR=data0034.rkey'#13#10'where IsGroup=' +
      '0'
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 256
    Top = 192
    object cds0417Lrkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object cds0417LFASSET_CODE: TStringField
      FieldName = 'FASSET_CODE'
    end
    object cds0417LFASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object cds0417LFASSET_DESC: TStringField
      FieldName = 'FASSET_DESC'
      Size = 40
    end
    object cds0417LDEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object cds0417LDEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
  end
end
