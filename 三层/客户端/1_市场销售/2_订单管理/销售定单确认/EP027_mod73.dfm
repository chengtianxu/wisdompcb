inherited Form_mod73: TForm_mod73
  Caption = 'Form_mod73'
  ClientHeight = 670
  ClientWidth = 721
  Position = poDesigned
  ExplicitWidth = 737
  ExplicitHeight = 708
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 721
    Height = 670
    ExplicitWidth = 721
    ExplicitHeight = 670
    inherited pnlDisplayMain: TPanel
      Width = 721
      Height = 334
      Align = alTop
      ExplicitWidth = 721
      ExplicitHeight = 334
      inherited pnlChildMain: TPanel
        Width = 719
        Height = 332
        ExplicitWidth = 719
        ExplicitHeight = 332
        inherited pnlEhMainDisplay: TPanel
          Width = 717
          Height = 301
          ExplicitWidth = 717
          ExplicitHeight = 301
          inherited ehMain: TDBGridEh
            Width = 715
            Height = 299
            DataSource = nil
          end
          object StringGrid1: TStringGrid
            Left = 1
            Top = 1
            Width = 715
            Height = 299
            Align = alClient
            ColCount = 17
            DefaultColWidth = 82
            FixedCols = 0
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
            PopupMenu = pmMain
            TabOrder = 1
            OnClick = StringGrid1Click
            OnDblClick = StringGrid1DblClick
            OnKeyDown = StringGrid1KeyDown
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 717
          ExplicitWidth = 717
          inherited lblFilter: TLabel
            Visible = False
          end
          inherited btnRefresh: TBitBtn
            Hint = #21462#28040#24050#30830#35748#30340#23450#21333
            Caption = #21453#30830#35748
            Glyph.Data = {00000000}
          end
          inherited btnExportToExcel: TBitBtn
            Hint = #36864#22238#30003#35831#30830#35748#30340#23450#21333
            Caption = #24212#26399#36864#22238
            Glyph.Data = {00000000}
          end
          inherited btnQry: TBitBtn
            Left = 379
            Align = alCustom
            Visible = False
            ExplicitLeft = 379
          end
          inherited btnZD: TBitBtn
            Left = 195
            Width = 85
            Hint = #26435#38480#35828#26126
            Caption = #26435#38480#35828#26126
            Visible = False
            ExplicitLeft = 195
            ExplicitWidth = 85
          end
          inherited edtFliter: TEdit
            Visible = False
          end
          inherited btnDY: TBitBtn
            Align = alCustom
          end
          inherited btnAuthDispatch: TBitBtn
            Align = alCustom
            Visible = False
          end
        end
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 334
      Width = 721
      Height = 27
      Align = alTop
      TabOrder = 1
      object bit: TBitBtn
        Left = 3
        Top = 1
        Width = 122
        Height = 24
        Caption = #25552#20132#30830#35748#28165#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
          333333333337F33333333333333033333333333333373F333333333333090333
          33333333337F7F33333333333309033333333333337373F33333333330999033
          3333333337F337F33333333330999033333333333733373F3333333309999903
          333333337F33337F33333333099999033333333373333373F333333099999990
          33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
          33333333337F7F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333300033333333333337773333333}
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 0
        OnClick = bitClick
      end
    end
    object DBGridEh1: TDBGridEh
      Left = 0
      Top = 361
      Width = 721
      Height = 309
      Align = alClient
      DynProps = <>
      PopupMenu = pmZD
      TabOrder = 2
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object StringGrid2: TStringGrid
      Left = 0
      Top = 361
      Width = 721
      Height = 309
      Align = alClient
      ColCount = 17
      DefaultColWidth = 82
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
      PopupMenu = pmZD
      TabOrder = 3
      OnClick = StringGrid2Click
      OnDblClick = StringGrid2DblClick
      RowHeights = (
        24
        24)
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'select data0060.rkey,data0060.sales_order,data0060.sch_date,'#13#10'Da' +
      'ta0097.po_number,Data0025.manu_part_number,'#13#10'data0010.abbr_name ' +
      'as cust_code,data0010.cust_code as cust_code1,data0060.quote_pri' +
      'ce,'#13#10'data0060.PURCHASE_ORDER_PTR,ORIG_SCHED_SHIP_DATE,'#13#10'data0060' +
      '.ENT_DATE,DATA0060.PARTS_ORDERED,DATA0025.MANU_PART_DESC,'#13#10'data0' +
      '060.ORIG_REQUEST_DATE,data0060.DUE_DATE,data0060.ORIG_CUSTOMER,d' +
      'ata0015.ABBR_NAME,case data0060.so_tp when 0 then '#39#33258#21046#39' when 1 th' +
      'en '#39#22806#21457#39' when 2 then '#39#21322#21046#31243#39' end as sotp'#13#10'from data0060,data0010,da' +
      'ta0097,data0025,data0015'#13#10'where (data0060.customer_ptr=data0010.' +
      'rkey) and'#13#10'(data0060.purchase_order_ptr=data0097.rkey) and'#13#10'(dat' +
      'a0060.cust_part_ptr=data0025.rkey) and'#13#10'(data0060.SHIP_REG_TAX_I' +
      'D=data0015.rkey) and'#13#10'(data0060.prod_rel='#39'1'#39') and (data0060.stat' +
      'us=1)'#13#10'and (data0060.quote_price in(1,3))'#13#10'order by data0060.sal' +
      'es_order'#13#10
    Left = 384
    Top = 208
  end
  inherited dsMain: TDataSource
    DataSet = ClientDataSet1
    Left = 672
    Top = 152
  end
  inherited pmZD: TPopupMenu
    AutoHotkeys = maAutomatic
    AutoLineReduction = maAutomatic
    OnPopup = pmZDPopup
    Left = 112
    Top = 464
    object N5: TMenuItem
      Caption = #31227#38500#30830#35748#28165#21333
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #26597#30475#35814#24773
      OnClick = N6Click
    end
    object N8: TMenuItem
      Caption = #35780#23457#20449#24687#35760#20107#26412
      OnClick = N8Click
    end
  end
  inherited xpmnfst1: TXPManifest
    Left = 672
    Top = 96
  end
  inherited pmMain: TPopupMenu
    OnPopup = pmMainPopup
    Left = 112
    Top = 184
    object N1: TMenuItem
      Caption = #28155#21152#21040#30830#35748#28165#21333
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #26597#30475#35814#24773
      OnClick = N2Click
    end
    object N4: TMenuItem
      Caption = #35780#23457#20449#24687#35760#20107#26412
      OnClick = N4Click
    end
  end
  inherited cdsMainWhereInit: TClientDataSet
    CommandText = 
      'select sales_order,conf_by_empl_ptr,prod_rel,conf_date,to_be_con' +
      'firmed,data0060.status,RemarkAudit'#13#10'from data0060'#13#10
    Left = 368
    Top = 496
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select sales_order,conf_by_empl_ptr,prod_rel,conf_date,to_be_con' +
      'firmed,status,RemarkAudit FROM Data0060 '
    Params = <>
    Left = 368
    Top = 424
  end
end
