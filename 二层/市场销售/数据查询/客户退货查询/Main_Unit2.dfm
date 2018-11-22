inherited MainTemForm2: TMainTemForm2
  Left = 226
  Top = 287
  Width = 928
  Height = 462
  Caption = #23458#25143#36864#36135#26597#35810
  Font.Height = -13
  Font.Name = #23435#20307
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 912
    object Label1: TLabel [0]
      Left = 402
      Top = 11
      Width = 52
      Height = 13
      Caption = #36864#36135#21333#21495
    end
    inherited BitBtn2: TBitBtn [1]
      Left = 196
      OnClick = BitBtn2Click
    end
    inherited BitBtn4: TBitBtn [2]
      Visible = False
      OnClick = BitBtn4Click
    end
    inherited BitBtn6: TBitBtn [3]
    end
    inherited BitBtn3: TBitBtn [4]
      Font.Height = -13
      Font.Name = #23435#20307
      ParentFont = False
      OnClick = BitBtn3Click
    end
    inherited BitBtn5: TBitBtn
      Left = 292
      OnClick = BitBtn5Click
    end
    object Edit1: TEdit
      Left = 470
      Top = 6
      Width = 121
      Height = 21
      TabOrder = 5
      OnChange = Edit1Change
    end
  end
  inherited Temp_DBGridEh1: TDBGridEh
    Width = 912
    Height = 391
    Hint = #21452#20987#26597#30475#22791#27880
    DataSource = DM.DataSource1
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterRowCount = 1
    ParentShowHint = False
    ShowHint = True
    SumList.Active = True
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    OnDblClick = Temp_DBGridEh1DblClick
    OnTitleBtnClick = Temp_DBGridEh1TitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'RMA_NUMBER'
        Footer.Value = #21512#35745
        Footer.ValueType = fvtStaticText
        Footers = <>
        Title.Color = clRed
        Title.SortIndex = 1
        Title.SortMarker = smUpEh
        Title.TitleButton = True
        Width = 92
      end
      item
        EditButtons = <>
        FieldName = 'MyRMA_STATUS'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'CUST_CODE'
        Footers = <>
        Title.TitleButton = True
        Width = 67
      end
      item
        EditButtons = <>
        FieldName = 'abbr_name'
        Footers = <>
        Title.TitleButton = True
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_NUMBER'
        Footers = <>
        Title.TitleButton = True
        Width = 91
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_DESC'
        Footers = <>
        Title.TitleButton = True
        Width = 112
      end
      item
        EditButtons = <>
        FieldName = 'PO_NUMBER'
        Footers = <>
        Title.Caption = #23458#25143#35746#21333#21495
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'PRODUCT_NAME'
        Footers = <>
        Title.TitleButton = True
        Width = 102
      end
      item
        EditButtons = <>
        FieldName = 'SALES_ORDER'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'RMA_DATE'
        Footers = <>
        Title.Caption = #36864#36135#26085#26399
        Title.TitleButton = True
        Width = 103
      end
      item
        EditButtons = <>
        FieldName = 'QTY_AUTH'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'QTY_RECD'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'to_be_ship'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'qty_ship'
        Footers = <>
        Title.Caption = #38656#34917#36135#25968
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOYEE_NAME'
        Footers = <>
        Title.TitleButton = True
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'ABBR_NAME1'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'price'
        Footers = <>
        Visible = False
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'part_price'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'CURR_NAME'
        Footers = <>
        Title.TitleButton = True
        Width = 56
      end
      item
        EditButtons = <>
        FieldName = 'value'
        Footers = <>
        Visible = False
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = 'ca'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 58
      end
      item
        EditButtons = <>
        FieldName = 'cw'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 81
      end
      item
        EditButtons = <>
        FieldName = 'WAREHOUSE_CODE'
        Footers = <>
        Title.Caption = #24037#21378#20195#30721
        Title.TitleButton = True
        Visible = False
        Width = 55
      end
      item
        EditButtons = <>
        FieldName = 'remark'
        Footers = <>
        Title.Caption = #22791#27880
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'ANALYSIS_CODE_1'
        Footers = <>
        Title.Caption = #24120#29992#22791#27880'1'
        Width = 145
      end
      item
        EditButtons = <>
        FieldName = 'ANALYSIS_CODE_2'
        Footers = <>
        Title.Caption = #24120#29992#22791#27880'2'
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'ANALYSIS_CODE_3'
        Footers = <>
        Title.Caption = #24120#29992#22791#27880'3'
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'ANALYSIS_CODE_4'
        Footers = <>
        Title.Caption = #24120#29992#22791#27880'4'
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'ANALYSIS_CODE_5'
        Footers = <>
        Title.Caption = #24120#29992#22791#27880'5'
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'rma_type'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'MEMO_NUMBER'
        Footers = <>
        Title.Caption = #36151#39033#22791#24536#32534#21495
        Width = 84
      end
      item
        EditButtons = <>
        FieldName = 'rma_amount'
        Footers = <>
        Title.Caption = #36864#36135#37329#39069'('#21407#24065#21547#31246')'
        Visible = False
        Width = 118
      end>
  end
  inherited PopupMenu2: TPopupMenu
    Left = 239
    Top = 297
  end
  object PopupMenu1: TPopupMenu
    Left = 354
    Top = 126
    object N1: TMenuItem
      Caption = #26126#32454#26597#35810
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #27719#24635#26597#35810
      OnClick = N2Click
    end
  end
end
