inherited frmPlanMain01: TfrmPlanMain01
  Caption = #21382#21490#20445#20859#35760#24405
  WindowState = wsMaximized
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
      'select d17.FASSET_NAME,d32.MainExecStat,d73.User_Full_Name,'#39#23450#26399#20445#20859 +
      #39' as Impact,'#13#10'd34.DEPT_NAME,d15.ABBR_NAME,d17.equipment_grade,d1' +
      '7.LOCATION,'#13#10'd31.* '#13#10'from data0831 d31'#13#10'join data0417 d17 on d31' +
      '.DeviNumb=d17.FASSET_CODE'#13#10'join data0034 d34 on d17.DEPT_PTR=d34' +
      '.rkey'#13#10'join data0015 d15 on d17.warehouse_ptr=d15.rkey'#13#10'join dat' +
      'a0832 d32 on d31.RKEY832=d32.rkey'#13#10'left join data0073 d73 on d31' +
      '.MainAcce_UserPtr=d73.rkey'#13#10
  end
  inherited cdsMain: Tcds
    CommandText = 
      'select d17.FASSET_NAME,d32.MainExecStat,d73.User_Full_Name,'#39#23450#26399#20445#20859 +
      #39' as Impact,'#13#10'd34.DEPT_NAME,d15.ABBR_NAME,d17.equipment_grade,d1' +
      '7.LOCATION,'#13#10'd31.* '#13#10'from data0831 d31'#13#10'join data0417 d17 on d31' +
      '.DeviNumb=d17.FASSET_CODE'#13#10'join data0034 d34 on d17.DEPT_PTR=d34' +
      '.rkey'#13#10'join data0015 d15 on d17.warehouse_ptr=d15.rkey'#13#10'join dat' +
      'a0832 d32 on d31.RKEY832=d32.rkey'#13#10'left join data0073 d73 on d31' +
      '.MainAcce_UserPtr=d73.rkey'#13#10
    ReadOnly = True
    F_SQLSelectFrom = 
      'select d17.FASSET_NAME,d32.MainExecStat,d73.User_Full_Name,'#39#23450#26399#20445#20859 +
      #39' as Impact,'#13#10'd34.DEPT_NAME,d15.ABBR_NAME,d17.equipment_grade,d1' +
      '7.LOCATION,'#13#10'd31.* '#13#10'from data0831 d31'#13#10'join data0417 d17 on d31' +
      '.DeviNumb=d17.FASSET_CODE'#13#10'join data0034 d34 on d17.DEPT_PTR=d34' +
      '.rkey'#13#10'join data0015 d15 on d17.warehouse_ptr=d15.rkey'#13#10'join dat' +
      'a0832 d32 on d31.RKEY832=d32.rkey'#13#10'left join data0073 d73 on d31' +
      '.MainAcce_UserPtr=d73.rkey'
    object cdsMainFASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object cdsMainMainExecStat: TStringField
      FieldName = 'MainExecStat'
      Size = 10
    end
    object cdsMainUser_Full_Name: TStringField
      FieldName = 'User_Full_Name'
      Size = 30
    end
    object cdsMainImpact: TStringField
      FieldName = 'Impact'
      ReadOnly = True
      Size = 8
    end
    object cdsMainDEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object cdsMainABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object cdsMainequipment_grade: TStringField
      FieldName = 'equipment_grade'
      Size = 50
    end
    object cdsMainLOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 40
    end
    object cdsMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object cdsMainPlanMainDate: TDateTimeField
      FieldName = 'PlanMainDate'
    end
    object cdsMainDeviNumb: TStringField
      FieldName = 'DeviNumb'
    end
    object cdsMainDeviType: TStringField
      FieldName = 'DeviType'
      Size = 10
    end
    object cdsMainMainCycl: TStringField
      FieldName = 'MainCycl'
      Size = 10
    end
    object cdsMainRKEY832: TIntegerField
      FieldName = 'RKEY832'
    end
    object cdsMainStarMainTime: TDateTimeField
      FieldName = 'StarMainTime'
    end
    object cdsMainActuCompTime: TDateTimeField
      FieldName = 'ActuCompTime'
    end
    object cdsMainMainImpl: TWideStringField
      FieldName = 'MainImpl'
    end
    object cdsMainRemarks: TStringField
      FieldName = 'Remarks'
      Size = 500
    end
    object cdsMainTimeCons: TBCDField
      FieldName = 'TimeCons'
      Precision = 10
      Size = 2
    end
    object cdsMainMainAcce_UserPtr: TIntegerField
      FieldName = 'MainAcce_UserPtr'
    end
    object cdsMainStdTimeCons: TBCDField
      FieldName = 'StdTimeCons'
      Precision = 9
      Size = 2
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
