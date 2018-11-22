inherited frmShowStock: TfrmShowStock
  Caption = #24211#23384#26126#32454#26597#30475
  ClientHeight = 439
  ClientWidth = 981
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 392
    Width = 981
    Height = 47
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 440
      Top = 6
      Width = 76
      Height = 30
      Caption = #20851' '#38381
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 981
    Height = 392
    Align = alClient
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 979
      Height = 425
      Align = alTop
      DataSource = ds60_53
      DynProps = <>
      FooterParams.Color = clWindow
      TabOrder = 0
      Columns = <
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'MANU_PART_NUMBER'
          Footers = <>
          Title.Caption = #26412#21378#32534#21495
          Width = 100
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'MANU_PART_DESC'
          Footers = <>
          Title.Caption = #23458#25143#22411#21495
          Width = 120
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'PRODUCT_NAME'
          Footers = <>
          Title.Caption = #20135#21697#31867#21035#21517#31216
          Width = 120
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'ABBR_NAME'
          Footers = <>
          Title.Caption = #23458#25143#31616#31216
          Width = 60
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'SALES_ORDER'
          Footers = <>
          Title.Caption = #38144#21806#35746#21333#21495
          Width = 80
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'LOCATION'
          Footers = <>
          Title.Caption = #20179#24211
          Width = 100
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'QTY_ON_HAND'
          Footers = <>
          Title.Caption = #24211#23384#25968#37327
          Width = 60
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'so_mianji'
          Footers = <>
          Title.Caption = #24211#23384#38754#31215
          Width = 70
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'MFG_DATE'
          Footers = <>
          Title.Caption = #20837#20179#26102#38388
          Width = 110
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'SCH_DATE'
          Footers = <>
          Title.Caption = #22238#22797#20132#26399
          Width = 110
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object ds60_53: TDataSource
    DataSet = cds60_53
    Left = 368
    Top = 168
  end
  object cds60_53: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select t25.MANU_PART_NUMBER, t25.MANU_PART_DESC,t60.SALES_ORDER,' +
      'data0010.ABBR_NAME,Data0008.PRODUCT_NAME, Data0008.PROD_CODE, '#13#10 +
      'CASE t53.rma_ptr WHEN 0 THEN '#39#27491#24120#36807#25968#20837#20179#39' WHEN 1 THEN '#39#36864#36135#37325#26816#20837#20179#39' WHEN ' +
      '2 THEN '#39#36820#20462#37325#26816#20837#20179#39' WHEN 3 THEN '#39#30452#25509#20837#20179#39' WHEN 4 THEN '#39#22996#22806#21152#24037#20837#20179#39#13#10'WHEN 5 ' +
      'THEN '#39#22996#22806#21152#24037#36864#36135#20837#20179#39' WHEN 6 THEN '#39#38144#21806#36864#36135#20837#20179#39' WHEN 7 THEN '#39#36716#25442#20837#20179#39' WHEN 8 T' +
      'HEN '#39#29305#27530#20837#20179#39' END AS c_type,'#13#10'CASE t25.TTYPE WHEN 0 THEN '#39#37327#20135#39' WHEN ' +
      '1 THEN '#39#26679#26495#39' ELSE '#39#26410#23450#20041#39' END AS TTYPE,t53.QTY_ON_HAND,'#13#10'ROUND(t53.' +
      'QTY_ON_HAND * t25.unit_sq, 4)AS so_mianji,t53.MFG_DATE,Data0016.' +
      'LOCATION,t60.SCH_DATE,'#13#10'CASE t60.COMMISION_ON_TOOLING WHEN '#39'Y'#39' T' +
      'HEN '#39#36716#21378#39' WHEN '#39'N'#39' THEN '#39#20869#38144#39' END AS COMMISION_ON_TOOLING60'#13#10'from ' +
      'data0053 t53'#13#10'left join data0060 t60 on t53.barcode_ptr = t60.RK' +
      'EY'#13#10'inner join data0025 t25 on t53.CUST_PART_PTR = t25.RKEY'#13#10'inn' +
      'er join Data0010 on t60.CUSTOMER_PTR=Data0010.RKEY'#13#10'inner join D' +
      'ata0016 on t53.LOC_PTR=Data0016.RKEY'#13#10'inner join Data0008 on t25' +
      '.PROD_CODE_PTR=Data0008.RKEY'#13#10'where t60.SCH_DATE<=getdate()'#13#10'and' +
      ' t53.QTY_ON_HAND>0 '#13#10'and t53.barcode_ptr<>'#39#39
    Params = <>
    Left = 432
    Top = 168
  end
end
