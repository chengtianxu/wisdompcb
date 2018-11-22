inherited PpCutting5_frm: TPpCutting5_frm
  Left = 235
  Top = 133
  Width = 947
  Caption = #26448#26009#28040#32791#35760#24405
  PixelsPerInch = 96
  TextHeight = 12
  inherited dxStatusBar1: TdxStatusBar
    Width = 939
  end
  inherited cxTabControl1: TcxTabControl
    Width = 939
    ClientRectRight = 939
    inherited Panel3: TPanel
      Width = 939
      inherited Panel2: TPanel
        Left = 819
        inherited RzToolbar1: TRzToolbar
          ToolbarControls = (
            Button1)
        end
      end
      inherited Panel4: TPanel
        Width = 819
        inherited Panel5: TPanel
          Width = 819
        end
        inherited cxPageControl2: TcxPageControl
          Width = 814
          ClientRectRight = 814
          inherited cxTabSheet0: TcxTabSheet
            inherited DghMain: TDBGridEh
              Width = 814
              FrozenCols = 3
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'ABBR_NAME'
                  Footers = <>
                  Width = 71
                end
                item
                  EditButtons = <>
                  FieldName = 'INV_PART_NUMBER'
                  Footers = <>
                  Width = 103
                end
                item
                  EditButtons = <>
                  FieldName = 'INV_NAME'
                  Footers = <>
                  Width = 143
                end
                item
                  EditButtons = <>
                  FieldName = 'INV_DESCRIPTION'
                  Footers = <>
                  Width = 110
                end
                item
                  EditButtons = <>
                  FieldName = 'UNIT_CODE'
                  Footers = <>
                  Width = 43
                end
                item
                  EditButtons = <>
                  FieldName = 'IES_PARAMETER_VALUE3'
                  Footers = <>
                  Width = 50
                end
                item
                  EditButtons = <>
                  FieldName = 'pp_quota_len'
                  Footers = <>
                  Width = 50
                end
                item
                  EditButtons = <>
                  FieldName = 'pp_quota_roll'
                  Footers = <>
                  Width = 50
                end
                item
                  EditButtons = <>
                  FieldName = 'SUPPLIER2'
                  Footers = <>
                  Width = 107
                end
                item
                  EditButtons = <>
                  FieldName = 'BARCODE_ID'
                  Footers = <>
                  Width = 109
                end
                item
                  EditButtons = <>
                  FieldName = 'GRN_NUMBER'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'DELIVER_NUMBER'
                  Footers = <>
                  Width = 65
                end>
            end
          end
          inherited cxTabSheet1: TcxTabSheet
            ParentShowHint = False
            TabVisible = False
          end
        end
      end
      inherited Panel7: TPanel
        Width = 939
      end
    end
    inherited Panel1: TPanel
      Width = 939
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
      'select data0017.INV_PART_NUMBER,data0017.INV_NAME,data0017.INV_D' +
      'ESCRIPTION,data0017.IES_PARAMETER_VALUE3,data0002.UNIT_CODE,'#13#10'Da' +
      'ta0022.SUPPLIER2,Data0022.BARCODE_ID,data0023.ABBR_NAME,GRN_NUMB' +
      'ER,DELIVER_NUMBER,'#13#10'data0735.* from data0735'#13#10'join data0730 on d' +
      'ata0735.rkey730=data0730.rkey'#13#10'join data0207 on data0730.D207_pt' +
      'r=data0207.rkey'#13#10'join Data0022 on data0207.D0022_PTR=Data0022.rk' +
      'ey'#13#10'join data0017 on data0730.[D017_PTR]=data0017.rkey'#13#10'join dat' +
      'a0002 on data0730.[D002_PTR]=data0002.rkey'#13#10'left join data0456 o' +
      'n Data0022.GRN_PTR=data0456.rkey'#13#10'left join data0023 on data0456' +
      '.SUPP_PTR=data0023.rkey'
  end
  inherited cdsMain: Tcds
    CommandText = 
      'select data0017.INV_PART_NUMBER,data0017.INV_NAME,data0017.INV_D' +
      'ESCRIPTION,data0017.IES_PARAMETER_VALUE3,data0002.UNIT_CODE,'#13#10'Da' +
      'ta0022.SUPPLIER2,Data0022.BARCODE_ID,data0023.ABBR_NAME,GRN_NUMB' +
      'ER,DELIVER_NUMBER,'#13#10'data0735.* from data0735'#13#10'join data0730 on d' +
      'ata0735.rkey730=data0730.rkey'#13#10'join data0207 on data0730.D207_pt' +
      'r=data0207.rkey'#13#10'join Data0022 on data0207.D0022_PTR=Data0022.rk' +
      'ey'#13#10'join data0017 on data0730.[D017_PTR]=data0017.rkey'#13#10'join dat' +
      'a0002 on data0730.[D002_PTR]=data0002.rkey'#13#10'left join data0456 o' +
      'n Data0022.GRN_PTR=data0456.rkey'#13#10'left join data0023 on data0456' +
      '.SUPP_PTR=data0023.rkey'
    F_SQLSelectFrom = 
      'select data0017.INV_PART_NUMBER,data0017.INV_NAME,data0017.INV_D' +
      'ESCRIPTION,data0017.IES_PARAMETER_VALUE3,data0002.UNIT_CODE,'#13#10'Da' +
      'ta0022.SUPPLIER2,Data0022.BARCODE_ID,data0023.ABBR_NAME,GRN_NUMB' +
      'ER,DELIVER_NUMBER,'#13#10'data0735.* from data0735'#13#10'join data0730 on d' +
      'ata0735.rkey730=data0730.rkey'#13#10'join data0207 on data0730.D207_pt' +
      'r=data0207.rkey'#13#10'join Data0022 on data0207.D0022_PTR=Data0022.rk' +
      'ey'#13#10'join data0017 on data0730.[D017_PTR]=data0017.rkey'#13#10'join dat' +
      'a0002 on data0730.[D002_PTR]=data0002.rkey'#13#10'left join data0456 o' +
      'n Data0022.GRN_PTR=data0456.rkey'#13#10'left join data0023 on data0456' +
      '.SUPP_PTR=data0023.rkey'
    object cdsMainABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object cdsMainINV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object cdsMainINV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object cdsMainINV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object cdsMainIES_PARAMETER_VALUE3: TStringField
      DisplayLabel = #21333#20301#38271#24230
      FieldName = 'IES_PARAMETER_VALUE3'
      Size = 30
    end
    object cdsMainUNIT_CODE: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object cdsMainSUPPLIER2: TStringField
      DisplayLabel = #29983#20135#25209#21495#25110#21407#20379#24212#21830
      FieldName = 'SUPPLIER2'
      Size = 30
    end
    object cdsMainBARCODE_ID: TStringField
      DisplayLabel = #22791#27880'('#20379#24212#21830#22411#21495')'
      FieldName = 'BARCODE_ID'
      Size = 50
    end
    object cdsMainGRN_NUMBER: TStringField
      DisplayLabel = #20837#24211#21333#21495
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object cdsMainDELIVER_NUMBER: TStringField
      DisplayLabel = #36865#36135#21333#21495
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object cdsMainrkey733: TIntegerField
      FieldName = 'rkey733'
    end
    object cdsMainrkey730: TIntegerField
      FieldName = 'rkey730'
    end
    object cdsMainpp_quota_len: TBCDField
      DisplayLabel = #28040#32791#38271#24230
      FieldName = 'pp_quota_len'
      Precision = 10
      Size = 5
    end
    object cdsMainpp_quota_roll: TBCDField
      DisplayLabel = #28040#32791#21367#25968
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
