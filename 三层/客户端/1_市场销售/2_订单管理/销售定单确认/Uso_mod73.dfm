inherited Form1: TForm1
  Caption = #38144#21806#23450#21333#21453#30830#35748
  ClientHeight = 507
  ClientWidth = 714
  ExplicitWidth = 730
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl1: TPanel
    Width = 714
    ExplicitWidth = 714
  end
  inherited pnl2: TPanel
    Top = 466
    Width = 714
    ExplicitTop = 466
    ExplicitWidth = 714
  end
  inherited pnl3: TPanel
    Width = 714
    Height = 425
    ExplicitWidth = 714
    ExplicitHeight = 425
    inherited eh1: TDBGridEh
      Width = 712
      Height = 423
      Columns = <
        item
          DynProps = <>
          EditButtons = <>
          Footers = <>
        end>
    end
  end
  inherited cdsPick: TClientDataSet
    AutoCalcFields = False
    CommandText = 
      'SELECT Data0060.RKEY, Data0060.SALES_ORDER, Data0010.ABBR_NAME,'#13 +
      #10'      Data0097.PO_NUMBER, Data0025.MANU_PART_NUMBER,'#13#10'      Dat' +
      'a0025.MANU_PART_DESC, Data0060.STATUS, '#39#26377#25928#30340#39' AS spwang,'#13#10'      D' +
      'ata0060.PROD_REL'#13#10'FROM Data0060 INNER JOIN'#13#10'      Data0010 ON Da' +
      'ta0060.CUSTOMER_PTR = Data0010.RKEY INNER JOIN'#13#10'      Data0097 O' +
      'N'#13#10'      Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY INNER JOIN'#13 +
      #10'      Data0025 ON dbo.Data0060.CUST_PART_PTR = Data0025.RKEY'#13#10'W' +
      'HERE (dbo.Data0060.STATUS = 1) AND'#13#10'      (dbo.Data0060.PROD_REL' +
      ' = '#39'2'#39')  and (dbo.Data0060.ISSUED_QTY = 0)'#13#10' order by data0060.s' +
      'ales_order'#13#10#13#10
    Top = 384
  end
  inherited dsPick: TDataSource
    Top = 384
  end
end
