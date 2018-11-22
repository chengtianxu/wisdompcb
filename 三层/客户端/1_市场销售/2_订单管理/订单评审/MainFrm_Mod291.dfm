inherited frmMain_Mod291: TfrmMain_Mod291
  Caption = #35746#21333#35780#23457
  ClientHeight = 489
  ClientWidth = 838
  ExplicitWidth = 854
  ExplicitHeight = 527
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 838
    Height = 489
    ExplicitWidth = 838
    ExplicitHeight = 489
    inherited pnlDisplayMain: TPanel
      Width = 838
      Height = 489
      ExplicitWidth = 838
      ExplicitHeight = 489
      inherited pnlChildMain: TPanel
        Width = 836
        Height = 487
        ExplicitWidth = 836
        ExplicitHeight = 487
        inherited pnlEhMainDisplay: TPanel
          Width = 834
          Height = 456
          TabOrder = 1
          ExplicitWidth = 834
          ExplicitHeight = 456
          inherited ehMain: TDBGridEh
            Width = 832
            Height = 407
            Hint = #32418#33394#20026#26032#21333
            OnDrawColumnCell = ehMainDrawColumnCell
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'SALES_ORDER'
                Footers = <>
                Title.Caption = #35746#21333#21495
                Width = 90
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'MANU_PART_NUMBER'
                Footers = <>
                Title.Caption = #26412#21378#32534#21495
                Width = 78
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CUSTPART_ENT_DATE'
                Footers = <>
                Title.Caption = #21019#24314#26085#26399
                Width = 100
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'MANU_PART_DESC'
                Footers = <>
                Title.Caption = #23458#25143#22411#21495
                Width = 108
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'cust_code'
                Footers = <>
                Title.Caption = #23458#25143#20195#30721
                Width = 59
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PO_NUMBER'
                Footers = <>
                Title.Caption = #23458#25143#35746#21333#21495
                Width = 95
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PARTS_ORDERED'
                Footers = <>
                Title.Caption = #35746#21333#25968#37327
                Width = 72
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'parts_mianji'
                Footers = <>
                Title.Caption = #35746#21333#38754#31215
                Width = 67
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ent_date'
                Footers = <>
                Title.Caption = #19979#21333#26085#26399
                Width = 131
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ORIG_SCHED_SHIP_DATE'
                Footers = <>
                Title.Caption = #35745#21010#20132#26399
                Width = 76
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'sch_date'
                Footers = <>
                Title.Caption = #22238#22797#20132#26399
                Width = 76
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'flag'
                Footers = <>
                Title.Caption = #29366#24577
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'SAMPLE_NR'
                Footers = <>
                Title.Caption = #27979#35797#25104#22411#22791#27880
                Width = 83
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ORIG_CUSTOMER'
                Footers = <>
                Title.Caption = #20851#32852#21407#23458#25143
                Width = 64
              end>
          end
          object pnl1: TPanel
            Left = 1
            Top = 408
            Width = 832
            Height = 47
            Align = alBottom
            TabOrder = 1
            object grpStatus: TGroupBox
              Left = 6
              Top = 1
              Width = 235
              Height = 40
              Caption = #29366#24577
              TabOrder = 0
              object chk1: TCheckBox
                Left = 30
                Top = 15
                Width = 65
                Height = 17
                Caption = #26410#35780#23457
                Checked = True
                State = cbChecked
                TabOrder = 0
                OnClick = chk1Click
              end
              object chk2: TCheckBox
                Left = 133
                Top = 15
                Width = 65
                Height = 17
                Caption = #24050#35780#23457
                TabOrder = 1
                OnClick = chk1Click
              end
            end
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 834
          TabOrder = 0
          ExplicitWidth = 834
          inherited edtFliter: TEdit
            TabOrder = 7
          end
          inherited btnDY: TBitBtn
            TabOrder = 5
          end
          inherited btnAuthDispatch: TBitBtn
            TabOrder = 6
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'SELECT dbo.Data0097.PO_NUMBER, dbo.Data0097.PO_DATE'#13#10'      , dbo' +
      '.Data0090.rkey AS rkey90,dbo.Data0090.dept_ptr'#13#10'      , dbo.data' +
      '0090.auth_date, dbo.data0090.user_ptr'#13#10'      , dbo.data0090.IF_P' +
      'UTHDATE, dbo.data0090.PUTH_INFO'#13#10'      , dbo.Data0060.SALES_ORDE' +
      'R, dbo.Data0060.RKEY AS rkey60'#13#10'      , dbo.Data0060.PARTS_ORDER' +
      'ED, data0060.ORIG_CUSTOMER'#13#10'      , dbo.Data0060.QUOTE_PRICE, db' +
      'o.Data0060.DUE_DATE '#13#10'      , dbo.Data0060.SCH_DATE,data0060.ENT' +
      'ERED_BY_EMPL_PTR'#13#10'      , ROUND(dbo.Data0060.PARTS_ORDERED * dbo' +
      '.Data0025.unit_sq, 4) AS parts_mianji'#13#10'      , Data0060.ORIG_SCH' +
      'ED_SHIP_DATE , Data0060.so_oldnew,data0060.ent_date'#13#10'      , dbo' +
      '.Data0010.CUST_CODE , data0010.CONSUME_FORECASTS'#13#10'      , Data00' +
      '25.MANU_PART_NUMBER, Data0025.MANU_PART_DESC'#13#10'      , Data0025.C' +
      'USTPART_ENT_DATE,data0025.SAMPLE_NR '#13#10'      , dbo.Data0005.EMPLO' +
      'YEE_NAME ,Data0025.RKEY as rkey25'#13#10'      , case when data0090.au' +
      'th_date is null then '#39#24453#35780#23457#39' else '#39#24050#35780#23457#39' end as flag'#13#10'      , Data0' +
      '015.WAREHOUSE_CODE'#13#10'FROM dbo.Data0060 '#13#10#9#9'INNER JOIN dbo.Data009' +
      '7 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY '#13#10#9#9'INN' +
      'ER JOIN dbo.Data0010 ON dbo.Data0060.CUSTOMER_PTR = dbo.Data0010' +
      '.RKEY '#13#10#9#9'INNER JOIN dbo.data0090 ON dbo.Data0060.RKEY = dbo.dat' +
      'a0090.pact_ptr '#13#10#9#9'INNER JOIN dbo.Data0025 ON dbo.Data0060.CUST_' +
      'PART_PTR = dbo.Data0025.RKEY '#13#10#9#9'LEFT JOIN  dbo.Data0005 ON dbo.' +
      'data0090.user_ptr = dbo.Data0005.RKEY'#13#10'                         ' +
      '       LEFT JOIN dbo.Data0015 ON Data0060.SHIP_REG_TAX_ID = Data' +
      '0015.RKEY'#13#10'WHERE Data0060.status=1'
  end
  inherited pmMain: TPopupMenu
    OnPopup = pmMainPopup
    object NAuth: TMenuItem
      Caption = #35746#21333#35780#23457'/'#36864#22238
      OnClick = NAuthClick
    end
    object NUnAuth: TMenuItem
      Caption = #21462#28040#35780#23457
      OnClick = NUnAuthClick
    end
  end
end
