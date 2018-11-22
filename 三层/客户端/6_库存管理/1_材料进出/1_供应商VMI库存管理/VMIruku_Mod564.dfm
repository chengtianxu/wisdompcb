inherited frmVMIruku_Mod564: TfrmVMIruku_Mod564
  Caption = 'VMI'#26448#26009#20837#24211#31649#29702
  ClientHeight = 482
  ClientWidth = 914
  Font.Charset = ANSI_CHARSET
  Font.Height = -13
  Font.Name = #23435#20307
  ExplicitWidth = 922
  ExplicitHeight = 509
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 914
    Height = 482
    ExplicitWidth = 914
    ExplicitHeight = 482
    inherited pnlDisplayMain: TPanel
      Width = 914
      Height = 482
      ExplicitWidth = 914
      ExplicitHeight = 482
      inherited pnlChildMain: TPanel
        Width = 912
        Height = 480
        ExplicitWidth = 912
        ExplicitHeight = 480
        inherited pnlEhMainDisplay: TPanel
          Top = 31
          Width = 910
          Height = 448
          ExplicitTop = 31
          ExplicitWidth = 910
          ExplicitHeight = 448
          object Splitter1: TSplitter [0]
            Left = 1
            Top = 224
            Width = 908
            Height = 3
            Cursor = crVSplit
            Align = alBottom
            ExplicitTop = 410
            ExplicitWidth = 835
          end
          object DBGridEh1: TDBGridEh [1]
            Left = 1
            Top = 227
            Width = 908
            Height = 220
            Align = alBottom
            DataSource = dsDetail
            DynProps = <>
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            FooterParams.Font.Charset = ANSI_CHARSET
            FooterParams.Font.Color = clWindowText
            FooterParams.Font.Height = -11
            FooterParams.Font.Name = 'Tahoma'
            FooterParams.Font.Style = []
            FooterParams.ParentFont = False
            ParentFont = False
            PopupMenu = PopupMenu2
            TabOrder = 1
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'inv_part_number'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26448#26009#32534#30721
                Width = 82
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'inv_name'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26448#26009#21517#31216
                Width = 113
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_DESCRIPTION'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26448#26009#35268#26684
                Width = 113
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUANTITY'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #24050#25509#25910#25968#37327
                Width = 74
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUAN_ON_HAND'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #29616#25345#26377#25968#37327
                Width = 75
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUAN_RETURNED'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #36864#22238#25968#37327
                Width = 63
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'tax_price'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20215#26684#21547#31246
                Width = 59
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PRICE'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20215#26684#19981#21547#31246
                Width = 76
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'TAX_2'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #31246#29575
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'location'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20179#24211
                Width = 49
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'EXPIRE_DATE'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26377#25928#26399
                Width = 75
              end
              item
                Alignment = taCenter
                DynProps = <>
                EditButtons = <>
                FieldName = 'MANU_DATE'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #21046#36896#26085#26399
                Width = 104
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'unit_name'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #21333#20301
                Width = 43
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'rohs'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #29615#20445
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'BARCODE_ID'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #22791#27880'('#29305#21035#35201#27714')'
                Width = 119
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'SUPPLIER2'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #35814#32454#20301#32622
                Width = 107
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
          inherited ehMain: TDBGridEh
            Width = 908
            Height = 223
            Font.Charset = ANSI_CHARSET
            Font.Height = -13
            Font.Name = #23435#20307
            ParentFont = False
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'GRN_NUMBER'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20837#20179#21333#21495
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'stype'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #31867#22411
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'strstatus'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #29366#24577
                Width = 85
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'abbr_name'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20379#24212#21830
                Width = 75
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DELIVER_NUMBER'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #36865#36135#21333#21495
                Width = 89
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'po_number'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #37319#36141#35746#21333
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'exch_rate'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #27719#29575
                Width = 54
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ship_DATE'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #36865#36135#26085#26399
                Width = 84
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'warehouse_name'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #24037#21378
                Width = 56
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'curr_name'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #36135#24065
                Width = 52
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'employee_name'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #21019#24314#20154#21592
                Width = 86
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PRINTED'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26159#21542#25171#21360
                Width = 57
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'REF_NUMBER'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #22791#27880
                Width = 124
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 910
          Height = 30
          ExplicitWidth = 910
          ExplicitHeight = 30
          inherited lblFilter: TLabel
            Left = 463
            Width = 52
            Caption = #20837#20179#21333#21495
            ExplicitLeft = 463
            ExplicitWidth = 52
          end
          inherited btnExit: TBitBtn
            Height = 30
            ExplicitHeight = 30
          end
          inherited btnRefresh: TBitBtn
            Height = 30
            ExplicitHeight = 30
          end
          inherited btnExportToExcel: TBitBtn
            Height = 30
            ExplicitHeight = 30
          end
          inherited btnQry: TBitBtn
            Height = 30
            ExplicitHeight = 30
          end
          inherited btnZD: TBitBtn
            Height = 30
            ExplicitHeight = 30
          end
          inherited btnDY: TBitBtn
            Height = 30
            Visible = True
            OnClick = btnDYClick
            ExplicitHeight = 30
          end
          inherited btnAuthDispatch: TBitBtn
            Height = 30
            ExplicitHeight = 30
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'select data0133.*,data0015.warehouse_code,data0015.warehouse_nam' +
      'e,data0023.code,data0023.supplier_name,data0023.abbr_name,'#13#10'data' +
      '0001.curr_code,data0001.curr_name,data0005.employee_name,data007' +
      '0.po_number,'#13#10'case'#13#10'when data0133.ttype=1 then '#39#25353'PO'#20837#24211#39#13#10'when dat' +
      'a0133.ttype=3 then '#39#30452#25509#20837#24211#39'  end as stype,'#13#10'case data0133.tstatus ' +
      'when 0 then '#39#26410#25552#20132#39' when 1 then '#39#24453#23457#26680#39' when 2 then '#39#24050#23457#26680#39' end as str' +
      'status'#13#10'from data0133 inner join '#13#10'data0023 on data0133.supp_ptr' +
      '=data0023.rkey inner join'#13#10'data0015 on data0133.warehouse_ptr=da' +
      'ta0015.rkey inner join'#13#10'data0001 on data0133.currency_ptr=data00' +
      '01.rkey inner join'#13#10'data0005 on data0133.create_by=data0005.rkey' +
      ' left outer join'#13#10'data0070 on data0133.po_ptr=data0070.rkey'#13#10'whe' +
      're 1=1'
    AfterScroll = cdsMainAfterScroll
  end
  inherited pmMain: TPopupMenu
    OnPopup = pmMainPopup
    Left = 256
    Top = 120
    object PO1: TMenuItem
      Caption = #26032#22686
      object PO2: TMenuItem
        Caption = #25353'PO'#20837#24211
        OnClick = PO2Click
      end
      object N6: TMenuItem
        Tag = 1
        Caption = #30452#25509#20837#24211
        OnClick = N6Click
      end
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Caption = #32534#36753
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #26816#26597
      OnClick = N4Click
    end
    object N2: TMenuItem
      Tag = 2
      Caption = '-'
    end
    object N1: TMenuItem
      Tag = 1
      Caption = #21024#38500
      OnClick = N1Click
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object N8: TMenuItem
      Caption = #21333#39033#21015#21360
      OnClick = N8Click
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object N11: TMenuItem
      Caption = #25552#20132
      OnClick = N11Click
    end
    object N12: TMenuItem
      Caption = #21462#28040#25552#20132
      OnClick = N12Click
    end
    object N13: TMenuItem
      Caption = #23457#26680
      OnClick = N13Click
    end
    object N14: TMenuItem
      Caption = #21462#28040#23457#26680
      OnClick = N14Click
    end
  end
  object cdsDetail: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 352
  end
  object dsDetail: TDataSource
    DataSet = cdsDetail
    Left = 280
    Top = 352
  end
  object cds133: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 480
    Top = 328
  end
  object cds70: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 592
    Top = 328
  end
  object cds391: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 648
    Top = 328
  end
  object cds71: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    Left = 704
    Top = 328
  end
  object cds134: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 536
    Top = 328
  end
  object PopupMenu1: TPopupMenu
    Left = 480
    Top = 88
    object VMI1: TMenuItem
      Caption = #23450#20041'VMI'#20837#20179#25171#21360#26684#24335
      OnClick = VMI1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 368
    Top = 328
    object N9: TMenuItem
      Caption = #20462#25913#22791#27880
      OnClick = N9Click
    end
    object N15: TMenuItem
      Caption = #25171#21360#29289#26009#26631#35782#21345
      OnClick = N15Click
    end
  end
end
