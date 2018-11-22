inherited frmPackReportFrm_SanDiHOTYI: TfrmPackReportFrm_SanDiHOTYI
  Caption = 'frmPackReportFrm_SanDiHOTYI'
  ClientHeight = 655
  ClientWidth = 995
  ExplicitWidth = 1011
  ExplicitHeight = 693
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDisplay: TPanel
    Width = 995
    Height = 655
    ExplicitWidth = 995
    ExplicitHeight = 655
    inherited pnl2: TPanel
      Width = 601
      Height = 653
      ExplicitWidth = 601
      ExplicitHeight = 653
      inherited pnl4: TPanel
        Width = 599
        ExplicitWidth = 599
      end
    end
    inherited pnl1: TPanel
      Height = 653
      ExplicitHeight = 653
      inherited vePackInfo: TValueListEditor
        Height = 556
        OnValidate = vePackInfoValidate
        ExplicitHeight = 556
      end
    end
  end
  object mmoSql: TMemo [1]
    Left = 440
    Top = 152
    Width = 513
    Height = 377
    Lines.Strings = (
      'SELECT d25.MANU_PART_NUMBER as '#26412#21378#32534#21495', '
      #9#9'd25.MANU_PART_DESC as '#23458#25143#22411#21495','
      #9#9'd25.ANALYSIS_CODE_2 as '#23458#25143#29289#26009#21495','
      #9#9'd10.CUSTOMER_NAME as '#23458#25143#21517#31216','
      #9#9'd10.ABBR_NAME as '#23458#25143#31616#31216','
      #9#9'd15.ABBR_NAME as '#29983#20135#24037#21378','
      #9#9'd60.SALES_ORDER as '#38144#21806#35746#21333#21495','
      #9#9'd97.PO_NUMBER as '#23458#25143#35746#21333#21495','
      
        #9#9'(select RIGHT(datepart(year,getdate()),2) + right('#39'00'#39'+cast(da' +
        'tepart(week,getdate()) AS VARCHAR(2)),2)) as '#21608#26399#24180#26376','
      #9#9'0 as PCS'#25968#37327','
      #9#9'd06.WORK_ORDER_NUMBER as '#20316#19994#21333#21495','
      #9#9'd492.CUT_NO as '#37197#26009#21333#21495','
      #9#9'd06.RKEY as rkey06,'
      #9#9'd10.CUST_CODE as '#23458#25143#20195#30721','
      'd60.RemarkSO as PartName,'
      'd25.SAMPLE_NR as '#27979#35797#25104#22411#22791#27880
      'FROM Data0006 d06'
      'INNER JOIN data0492 d492 ON d06.CUT_NO = d492.CUT_NO'
      'INNER JOIN Data0060 d60 ON d60.SALES_ORDER = d492.SO_NO'
      'INNER JOIN Data0025 d25 ON d25.RKEY = d06.BOM_PTR'
      'INNER JOIN Data0010 d10 ON d10.RKEY = d60.CUSTOMER_PTR'
      'INNER JOIN Data0015 d15 ON d06.WHOUSE_PTR = d15.RKEY'
      
        'INNER JOIN data0097 d97 ON d60.PURCHASE_ORDER_PTR = d97.RKEY whe' +
        're d06.WORK_ORDER_NUMBER =:p1')
    TabOrder = 1
    Visible = False
    WantReturns = False
    WordWrap = False
  end
  inherited frxReport1: TfrxReport
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
  end
end
