inherited frmVMIchukushen_Mod564: TfrmVMIchukushen_Mod564
  Caption = #20379#24212#21830#36864#36135#20986#20179#23457#26680
  ClientHeight = 498
  ClientWidth = 921
  ExplicitWidth = 929
  ExplicitHeight = 525
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 921
    Height = 498
    ExplicitWidth = 921
    ExplicitHeight = 498
    inherited pnlDisplayMain: TPanel
      Width = 921
      Height = 498
      ExplicitWidth = 921
      ExplicitHeight = 498
      inherited pnlChildMain: TPanel
        Width = 919
        Height = 496
        ExplicitWidth = 919
        ExplicitHeight = 496
        inherited pnlEhMainDisplay: TPanel
          Width = 917
          Height = 465
          ExplicitWidth = 917
          ExplicitHeight = 465
          object Splitter1: TSplitter [0]
            Left = 1
            Top = 308
            Width = 915
            Height = 4
            Cursor = crVSplit
            Align = alBottom
            ExplicitTop = 402
            ExplicitWidth = 708
          end
          inherited ehMain: TDBGridEh
            Width = 915
            Height = 307
            OnDrawColumnCell = ehMainDrawColumnCell
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'gon_number'
                Footers = <>
                Title.Caption = #20986#20179#21333#21495
                Width = 85
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'stype'
                Footers = <>
                Title.Caption = #20986#20179#31867#22411
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'sstatus'
                Footers = <>
                Title.Caption = #29366#24577
                Width = 46
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'create_date'
                Footers = <>
                Title.Caption = #21019#24314#26085#26399
                Width = 130
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ref_number'
                Footers = <>
                Title.Caption = #22791#27880
                Width = 116
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'warehouse_code'
                Footers = <>
                Title.Caption = #24037#21378#20195#30721
                Width = 52
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'warehouse_name'
                Footers = <>
                Title.Caption = #24037#21378#21517#31216
                Width = 85
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'employee_name'
                Footers = <>
                Title.Caption = #21019#24314#20154#21592
                Width = 70
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'employee_name_1'
                Footers = <>
                Title.Caption = #39046#26009#20154#21592
                Width = 70
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'code'
                Footers = <>
                Title.Caption = #20379#24212#21830#20195#30721
                Width = 75
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'supplier_name'
                Footers = <>
                Title.Caption = #20379#24212#21830#21517#31216
                Width = 150
              end>
          end
          object DBGridEh1: TDBGridEh
            Left = 1
            Top = 312
            Width = 915
            Height = 152
            Align = alBottom
            DataSource = dsDetail
            DynProps = <>
            PopupMenu = PopupMenu2
            TabOrder = 1
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'inv_part_number'
                Footers = <>
                Title.Caption = #26448#26009#32534#30721
                Width = 150
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'inv_name'
                Footers = <>
                Title.Caption = #26448#26009#21517#31216
                Width = 200
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_DESCRIPTION'
                Footers = <>
                Title.Caption = #29289#26009#35268#26684
                Width = 220
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'quantity'
                Footers = <>
                Title.Caption = #21457#25918#25968#37327
                Width = 70
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'rtn_quantity'
                Footers = <>
                Title.Caption = #36864#22238#25968#37327
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'tax_price'
                Footers = <>
                Title.Caption = #21547#31246#20215#26684
                Width = 68
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'tax_2'
                Footers = <>
                Title.Caption = #31246#29575
                Width = 40
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'quan_on_hand'
                Footers = <>
                Title.Caption = #24211#23384#25968#37327
                Width = 65
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 917
          ExplicitWidth = 917
          inherited lblFilter: TLabel
            Caption = #20986#20179#21333#21495
          end
          inherited btnDY: TBitBtn
            Visible = True
            OnClick = btnDYClick
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'select data0724.rkey,data0724.gon_number,data0724.ttype,data0724' +
      '.status,'#13#10'case data0724.ttype'#13#10'when 0 then '#39#36864#36135#20986#20179#39#13#10'when 1 then '#39 +
      #39046#26009#20986#20179#39' end as stype,'#13#10'case data0724.status'#13#10'when 0 then '#39#26410#20986#24211#39#13#10'wh' +
      'en 1 then '#39#24050#20986#24211#39' end as sstatus,'#13#10'data0724.create_date,data0724.r' +
      'ef_number,'#13#10'data0015.warehouse_code,data0015.warehouse_name,'#13#10'da' +
      'ta0005.employee_name ,data0005_1.employee_name employee_name_1,'#13 +
      #10'data0023.code,data0023.supplier_name'#13#10'from data0724 inner join'#13 +
      #10'data0015 on data0724.warehouse_ptr=data0015.rkey inner join'#13#10'da' +
      'ta0023 on data0724.supplier_ptr=data0023.rkey inner join'#13#10'data00' +
      '05 on data0724.create_by=data0005.rkey inner join'#13#10'data0005 as d' +
      'ata0005_1 on data0724.recd_by=data0005_1.rkey'#13#10'where  data0724.t' +
      'type=0'
    AfterScroll = cdsMainAfterScroll
  end
  inherited pmMain: TPopupMenu
    OnPopup = pmMainPopup
    Left = 240
    Top = 168
    object N1: TMenuItem
      Caption = #23457#26680#20986#24211
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #36864#20179#25171#21360
      OnClick = N2Click
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
  object PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 368
    Top = 396
    object N3: TMenuItem
      Caption = #20462#25913#25968#37327
      OnClick = N3Click
    end
  end
  object cds724: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 392
    Top = 120
  end
  object PopupMenu1: TPopupMenu
    Left = 736
    Top = 8
    object N4: TMenuItem
      Caption = #33258#23450#20041#20986#20179#25171#21360#26684#24335
      OnClick = N4Click
    end
  end
end
