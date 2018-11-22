inherited frmDetail_Mod291: TfrmDetail_Mod291
  Caption = #35780#23457#39033#30446#21450#37096#38376
  ClientHeight = 534
  ClientWidth = 908
  OnResize = FormResize
  ExplicitTop = -70
  ExplicitWidth = 924
  ExplicitHeight = 572
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 320
    Width = 908
    Height = 214
    Align = alBottom
    TabOrder = 0
    object pnl5: TPanel
      Left = 1
      Top = 160
      Width = 906
      Height = 53
      Align = alBottom
      TabOrder = 0
      object btnCommit: TBitBtn
        Left = 294
        Top = 8
        Width = 75
        Height = 33
        Caption = #36890#36807#35780#23457
        TabOrder = 0
        OnClick = btnCommitClick
      end
      object btnBack: TBitBtn
        Left = 410
        Top = 8
        Width = 75
        Height = 33
        Caption = #36864#22238#24066#22330#37096
        TabOrder = 1
        OnClick = btnBackClick
      end
      object btnClose: TBitBtn
        Left = 524
        Top = 8
        Width = 75
        Height = 33
        Caption = #20851#38381
        ModalResult = 2
        TabOrder = 2
      end
      object btnCancel: TBitBtn
        Left = 364
        Top = 7
        Width = 75
        Height = 33
        Caption = #21462#28040#35780#23457
        TabOrder = 3
        OnClick = btnCancelClick
      end
    end
    object pnl6: TPanel
      Left = 1
      Top = 1
      Width = 906
      Height = 159
      Align = alClient
      TabOrder = 1
      object lbl1: TLabel
        Left = 678
        Top = 4
        Width = 36
        Height = 13
        Caption = #24037#21378#65306
        Visible = False
      end
      object lbl2: TLabel
        Left = 306
        Top = 8
        Width = 36
        Height = 13
        Caption = #23458#25143#65306
      end
      object lbl3: TLabel
        Left = 476
        Top = 8
        Width = 72
        Height = 13
        Caption = #20851#32852#21407#23458#25143#65306
      end
      object lbl4: TLabel
        Left = 282
        Top = 32
        Width = 60
        Height = 13
        Caption = #26412#21378#32534#21495#65306
      end
      object lbl5: TLabel
        Left = 488
        Top = 32
        Width = 60
        Height = 13
        Caption = #23458#25143#22411#21495#65306
      end
      object lbl6: TLabel
        Left = 282
        Top = 59
        Width = 60
        Height = 13
        Caption = #22238#22797#20132#26399#65306
        Visible = False
      end
      object lbl7: TLabel
        Left = 500
        Top = 59
        Width = 48
        Height = 13
        Caption = #21442#32771#21495#65306
      end
      object lbl8: TLabel
        Left = 30
        Top = 80
        Width = 60
        Height = 13
        Caption = #22791#27880#20449#24687#65306
      end
      object lblOnTime: TLabel
        Left = 306
        Top = 82
        Width = 120
        Height = 16
        Caption = #32477#23545#20445#35777#25353#26399#20132#36135
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object cbbFactory: TComboBox
        Left = 718
        Top = 3
        Width = 137
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        Visible = False
        OnChange = cbbFactoryChange
      end
      object rgFactory: TRadioGroup
        Left = 678
        Top = 30
        Width = 177
        Height = 31
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          #20840#37096
          'HDI'
          #38750'HDI')
        TabOrder = 1
        Visible = False
        OnClick = cbbFactoryChange
      end
      object rgType: TRadioGroup
        Left = 678
        Top = 67
        Width = 177
        Height = 31
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          #20840#37096
          #37327#20135
          #26679#21697)
        TabOrder = 2
        Visible = False
        OnClick = cbbFactoryChange
      end
      object dbchk1: TDBCheckBox
        Left = 26
        Top = 8
        Width = 97
        Height = 17
        Caption = #25237#20135#26242#32531
        DataField = 'ONHOLD_PLANNING_FLAG'
        DataSource = ds60
        ReadOnly = True
        TabOrder = 3
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object dbchk2: TDBCheckBox
        Left = 26
        Top = 31
        Width = 97
        Height = 17
        Caption = #20462#35746#26242#32531
        DataField = 'ALLOW_EDIT_FLAG'
        DataSource = ds60
        ReadOnly = True
        TabOrder = 4
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
      end
      object dbchk3: TDBCheckBox
        Left = 26
        Top = 54
        Width = 97
        Height = 17
        Caption = #31649#25511#20135#21697#26631#35782
        DataField = 'barcode_flag'
        DataSource = ds60
        ReadOnly = True
        TabOrder = 5
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object dbchk4: TDBCheckBox
        Left = 157
        Top = 5
        Width = 97
        Height = 17
        Caption = #24037#21333#21457#20986#26242#32531
        DataField = 'ONHOLD_RELEASE_FLAG'
        DataSource = ds60
        ReadOnly = True
        TabOrder = 6
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object dbchk5: TDBCheckBox
        Left = 157
        Top = 28
        Width = 97
        Height = 17
        Caption = #20572#27490#25509#21333
        DataField = 'ONHOLD_SALES_FLAG'
        DataSource = ds60
        ReadOnly = True
        TabOrder = 7
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object dbedtCustmer: TDBEdit
        Left = 348
        Top = 5
        Width = 95
        Height = 21
        DataField = 'ABBR_NAME'
        DataSource = ds60
        ReadOnly = True
        TabOrder = 8
      end
      object dbedtOrigCustmer: TDBEdit
        Left = 554
        Top = 5
        Width = 85
        Height = 21
        DataField = 'ORIG_CUSTOMER'
        DataSource = ds60
        ReadOnly = True
        TabOrder = 9
      end
      object dbedtPart: TDBEdit
        Left = 348
        Top = 32
        Width = 95
        Height = 21
        DataField = 'MANU_PART_NUMBER'
        DataSource = ds60
        ReadOnly = True
        TabOrder = 10
      end
      object dbedtDESC: TDBEdit
        Left = 554
        Top = 32
        Width = 85
        Height = 21
        DataField = 'MANU_PART_DESC'
        DataSource = ds60
        ReadOnly = True
        TabOrder = 11
      end
      object dtpDate: TDateTimePicker
        Left = 346
        Top = 56
        Width = 97
        Height = 21
        Date = 43071.000000000000000000
        Time = 43071.000000000000000000
        TabOrder = 12
        Visible = False
        OnChange = dtpDateChange
      end
      object dbedtRef: TDBEdit
        Left = 554
        Top = 59
        Width = 85
        Height = 21
        DataField = 'reference_number'
        DataSource = ds60
        ReadOnly = True
        TabOrder = 13
      end
      object btnRemar: TBitBtn
        Left = 89
        Top = 76
        Width = 27
        Height = 25
        Glyph.Data = {
          EE000000424DEE000000000000007600000028000000100000000F0000000100
          04000000000078000000130B0000130B00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888800000888880000080F000888880F00080F000888880F0008000000080000
          000800F000000F00000800F000800F00000800F000800F000008800000000000
          0088880F00080F000888880000080000088888800088800088888880F08880F0
          888888800088800088888888888888888888}
        TabOrder = 14
        OnClick = btnRemarClick
      end
      object mmo1: TDBMemo
        Left = 26
        Top = 107
        Width = 829
        Height = 47
        DataField = 'RemarkAudit'
        DataSource = ds60
        ScrollBars = ssVertical
        TabOrder = 15
      end
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 908
    Height = 320
    Align = alClient
    TabOrder = 1
    object pnl3: TPanel
      Left = 554
      Top = 1
      Width = 353
      Height = 318
      Align = alRight
      TabOrder = 0
      object pnl7: TPanel
        Left = 1
        Top = 120
        Width = 351
        Height = 197
        Align = alBottom
        TabOrder = 0
        object ehTool: TDBGridEh
          Left = 1
          Top = 1
          Width = 349
          Height = 195
          Align = alClient
          DataSource = ds62
          DynProps = <>
          ReadOnly = True
          TabOrder = 0
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'CATEGORY'
              Footers = <>
              Title.Caption = #24037#20855#36153#29992#31867#21035
              Width = 112
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'AMOUNT'
              Footers = <>
              Title.Caption = #37329#39069
              Width = 68
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'free_amount'
              Footers = <>
              Title.Caption = #25346#24080#37329#39069
              Width = 62
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'costfree_amount'
              Footers = <>
              Title.Caption = #20813#25910#37329#39069
              Width = 67
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object pnl8: TPanel
        Left = 1
        Top = 1
        Width = 351
        Height = 119
        Align = alClient
        TabOrder = 1
        object ehDept: TDBGridEh
          Left = 1
          Top = 1
          Width = 349
          Height = 117
          Align = alClient
          DataSource = ds90
          DynProps = <>
          ReadOnly = True
          TabOrder = 0
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'DEPT_NAME'
              Footers = <>
              Title.Caption = #35780#23457#37096#38376
              Width = 67
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'auth_flag'
              Footers = <>
              Title.Caption = #35780#23457#29366#24577
              Width = 61
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'EMPLOYEE_NAME'
              Footers = <>
              Title.Caption = #35780#23457#20154
              Width = 66
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'auth_date'
              Footers = <>
              Title.Caption = #35780#23457#26085#26399
              Width = 92
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
    object pnl4: TPanel
      Left = 1
      Top = 1
      Width = 553
      Height = 318
      Align = alClient
      TabOrder = 1
      object RzPageControl1: TRzPageControl
        Left = 1
        Top = 1
        Width = 551
        Height = 316
        Hint = ''
        ActivePage = ts2
        Align = alClient
        TabIndex = 1
        TabOrder = 0
        OnChange = RzPageControl1Change
        FixedDimension = 19
        object ts1: TRzTabSheet
          Caption = #35780#23457#21442#25968
          object ehParams: TDBGridEh
            Left = 0
            Top = 0
            Width = 547
            Height = 293
            Align = alClient
            DataSource = ds89
            DynProps = <>
            ReadOnly = True
            TabOrder = 0
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CATEGORY_DESC'
                Footers = <>
                Title.Caption = #21442#25968#31867#21035
                Width = 156
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'parameter_desc'
                Footers = <>
                Title.Caption = #35746#21333#35201#27714#39033#30446
                Width = 145
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'unit_name'
                Footers = <>
                Title.Caption = #21333#20301
                Width = 73
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'tvalue'
                Footers = <>
                Title.Caption = #20869#23481
                Width = 112
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
        end
        object ts2: TRzTabSheet
          Caption = #29289#26009#28165#21333
          object ehBom: TDBGridEh
            Left = 0
            Top = 0
            Width = 547
            Height = 293
            Align = alClient
            DataSource = ds26
            DynProps = <>
            ReadOnly = True
            TabOrder = 0
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_PART_NUMBER'
                Footers = <>
                Title.Caption = #26448#26009#32534#30721
                Width = 113
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_NAME'
                Footers = <>
                Title.Caption = #26448#26009#21517#31216
                Width = 78
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_DESCRIPTION'
                Footers = <>
                Title.Caption = #26448#26009#35268#26684
                Width = 147
              end
              item
                DisplayFormat = '#0.000000'
                DynProps = <>
                EditButtons = <>
                FieldName = 'stand_qty'
                Footers = <>
                Title.Caption = #35746#21333#29992#37327
                Width = 52
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'UNIT_NAME'
                Footers = <>
                Title.Caption = #21333#20301
                Width = 43
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUAN_ON_HAND'
                Footers = <>
                Title.Caption = #24403#21069#24211#23384
                Width = 59
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
        end
        object ts3: TRzTabSheet
          Caption = #21152#24037#25351#31034
          object Label8: TLabel
            Left = 16
            Top = 11
            Width = 60
            Height = 13
            Caption = #24037#31243#22791#27880#65306
          end
          object Label10: TLabel
            Left = 16
            Top = 100
            Width = 60
            Height = 13
            Caption = #21152#24037#25351#31034#65306
          end
          object Label11: TLabel
            Left = 16
            Top = 193
            Width = 96
            Height = 13
            Caption = #38144#21806#35746#21333#35760#20107#26412#65306
          end
          object mmo2: TDBMemo
            Left = 16
            Top = 212
            Width = 521
            Height = 74
            DataField = 'RemarkSO'
            DataSource = ds60
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object mmo4: TDBMemo
            Left = 16
            Top = 29
            Width = 521
            Height = 68
            DataField = 'eng_note'
            DataSource = ds60
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 1
          end
          object mmo3: TDBMemo
            Left = 16
            Top = 119
            Width = 521
            Height = 71
            DataField = 'remark'
            DataSource = ds60
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 2
          end
        end
        object ts4: TRzTabSheet
          Caption = #24037#33402#27969#31243
          object eh38: TDBGridEh
            Left = 0
            Top = 0
            Width = 547
            Height = 293
            Align = alClient
            DataSource = ds38
            DynProps = <>
            ReadOnly = True
            TabOrder = 0
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'STEP_NUMBER'
                Footers = <>
                Title.Caption = #27493#39588#21495
                Width = 54
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DEPT_CODE'
                Footers = <>
                Title.Caption = #24037#24207#20195#30721
                Width = 74
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DEPT_NAME'
                Footers = <>
                Title.Caption = #24037#24207#21517#31216
                Width = 134
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
        end
        object ts5: TRzTabSheet
          Caption = #23436#24037#35745#21010
          object eh360: TDBGridEh
            Left = 0
            Top = 0
            Width = 547
            Height = 216
            Align = alClient
            DataSource = ds360
            DynProps = <>
            PopupMenu = pm360
            ReadOnly = True
            TabOrder = 0
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'sch_date'
                Footers = <>
                Title.Caption = #23436#24037#26085#26399
                Width = 133
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'quantity'
                Footers = <>
                Title.Caption = #23436#24037#25968#37327
                Width = 137
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
          object Panel1: TPanel
            Left = 0
            Top = 216
            Width = 547
            Height = 77
            Align = alBottom
            TabOrder = 1
            object Label1: TLabel
              Left = 11
              Top = 9
              Width = 86
              Height = 13
              Caption = #35746#21333#25968#37327'(SET)'#65306
            end
            object Label2: TLabel
              Left = 10
              Top = 35
              Width = 87
              Height = 13
              Caption = #35746#21333#25968#37327'(PCS)'#65306
            end
            object Label3: TLabel
              Left = 37
              Top = 58
              Width = 60
              Height = 13
              Caption = #35746#21333#38754#31215#65306
            end
            object Label4: TLabel
              Left = 240
              Top = 8
              Width = 60
              Height = 13
              Caption = #20135#21697#31867#22411#65306
            end
            object Label5: TLabel
              Left = 240
              Top = 35
              Width = 60
              Height = 13
              Caption = #29983#20135#21608#26399#65306
            end
            object Label6: TLabel
              Left = 208
              Top = 58
              Width = 84
              Height = 13
              Caption = #31163#35745#21010#20132#26399#36824#26377
            end
            object lblCycle: TLabel
              Left = 305
              Top = 58
              Width = 6
              Height = 13
              Caption = '0'
            end
            object Label7: TLabel
              Left = 344
              Top = 58
              Width = 60
              Height = 13
              Caption = #20010#29983#20135#21608#26399
            end
            object DBQtySet: TDBText
              Left = 98
              Top = 8
              Width = 65
              Height = 17
              DataField = 'set_ordered'
              DataSource = ds60
            end
            object DBQtyPCS: TDBText
              Left = 97
              Top = 35
              Width = 65
              Height = 17
              DataField = 'PARTS_ORDERED'
              DataSource = ds60
            end
            object DBArea: TDBText
              Left = 98
              Top = 58
              Width = 65
              Height = 17
              DataField = 'parts_mianji'
              DataSource = ds60
            end
            object DBProType: TDBText
              Left = 303
              Top = 9
              Width = 121
              Height = 17
              DataField = 'PRODUCT_NAME'
              DataSource = ds60
            end
            object DBCycle: TDBText
              Left = 305
              Top = 35
              Width = 28
              Height = 17
              DataField = 'LEAD_TIME'
              DataSource = ds60
            end
            object Label9: TLabel
              Left = 343
              Top = 35
              Width = 12
              Height = 13
              Caption = #22825
            end
            object DBOrdType: TDBText
              Left = 432
              Top = 58
              Width = 65
              Height = 17
              DataField = 'so_oldnew'
              DataSource = ds60
            end
            object btnUpdate: TBitBtn
              Left = 430
              Top = 6
              Width = 89
              Height = 33
              Caption = #26356#26032#35745#21010#27719#24635
              TabOrder = 0
              OnClick = btnUpdateClick
            end
          end
        end
        object ts6: TRzTabSheet
          Caption = #23436#24037#35745#21010#27719#24635
          object ehTotal360: TDBGridEh
            Left = 0
            Top = 0
            Width = 547
            Height = 293
            Align = alClient
            DataSource = dsTotal360
            DynProps = <>
            ReadOnly = True
            TabOrder = 0
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'sch_date'
                Footers = <>
                Title.Caption = #35745#21010#20837#24211#26085#26399
                Width = 94
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
                Title.Caption = #24037#21378#31616#31216
                Width = 84
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ttypetext'
                Footers = <>
                Title.Caption = #31867#22411
                Width = 52
              end
              item
                DisplayFormat = '#0.0000'
                DynProps = <>
                EditButtons = <>
                FieldName = 'qty_mianji'
                Footers = <>
                Title.Caption = #20837#24211#38754#31215
                Width = 73
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'number'
                Footers = <>
                Title.Caption = #20132#36135#27454#25968
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'qty_total'
                Footers = <>
                Title.Caption = #20837#24211#25968#37327'pcs'
                Width = 93
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
        end
      end
    end
  end
  object cds60: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT dbo.data0090.IF_PUTHDATE,dbo.data0090.rkey as rkey90,dbo.' +
      'data0090.dept_ptr'#13#10'      , dbo.Data0060.RKEY AS rkey60, data0060' +
      '.reference_number'#13#10'      , dbo.Data0060.SCH_DATE,data0060.ORIG_C' +
      'USTOMER,data0060.rma_ptr'#13#10'      , Data0060.ORIG_SCHED_SHIP_DATE,' +
      ' Data0060.so_oldnew,data0060.SALES_ORDER'#13#10'      , Data0060.Remar' +
      'kSO,Data0060.RemarkAudit, Data0060.SHIP_REG_TAX_ID'#13#10'      , ROUN' +
      'D(dbo.Data0060.PARTS_ORDERED * dbo.Data0025.unit_sq, 4) AS parts' +
      '_mianji'#13#10'      , dbo.Data0060.PARTS_ORDERED, data0060.set_ordere' +
      'd,data0060.QUOTE_PRICE'#13#10'      , dbo.Data0010.CUSTOMER_NAME , dbo' +
      '.Data0010.ABBR_NAME'#13#10'      , dbo.Data0010.CUST_CODE, data0010.CO' +
      'NSUME_FORECASTS'#13#10'      , Data0025.MANU_PART_NUMBER, Data0025.MAN' +
      'U_PART_DESC'#13#10'      , Data0025.ALLOW_EDIT_FLAG, Data0025.ONHOLD_S' +
      'ALES_FLAG'#13#10'      , Data0025.ONHOLD_RELEASE_FLAG,Data0025.ONHOLD_' +
      'PLANNING_FLAG'#13#10'      , data0025.CUSTPART_ENT_DATE, data0025.barc' +
      'ode_flag'#13#10'      , data0025.remark,data0025.eng_note'#13#10'      , Dat' +
      'a0008.PRODUCT_NAME, Data0008.LEAD_TIME'#13#10'      ,  Data0097.PO_NUM' +
      'BER'#13#10'FROM dbo.Data0060 '#13#10#9#9'INNER JOIN dbo.Data0010 ON dbo.Data00' +
      '60.CUSTOMER_PTR = dbo.Data0010.RKEY '#13#10#9#9'INNER JOIN dbo.data0090 ' +
      'ON dbo.Data0060.RKEY = dbo.data0090.pact_ptr '#13#10#9#9'INNER JOIN dbo.' +
      'Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY '#13#10#9#9'I' +
      'NNER JOIN dbo.Data0008 ON dbo.Data0008.RKEY = dbo.Data0025.PROD_' +
      'CODE_PTR'#13#10'                                INNER JOIN dbo.Data009' +
      '7 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY'#13#10
    Params = <>
    Left = 112
    Top = 144
  end
  object ds60: TDataSource
    DataSet = cds60
    Left = 112
    Top = 192
  end
  object cds90: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT Data0034.DEPT_NAME,Data0005.EMPLOYEE_NAME'#13#10'      , data00' +
      '90.auth_date,data0090.dept_ptr'#13#10'      , case when data0090.auth_' +
      'date is null then '#39#24453#35780#23457#39' else '#39#24050#35780#23457#39' end as auth_flag'#13#10'FROM Data00' +
      '34 '#13#10#9'INNER JOIN data0090 ON Data0034.RKEY = data0090.dept_ptr '#13 +
      #10#9'LEFT JOIN Data0005 ON data0090.user_ptr = Data0005.RKEY'#13#10
    Params = <>
    ReadOnly = True
    Left = 616
    Top = 40
  end
  object ds90: TDataSource
    DataSet = cds90
    Left = 664
    Top = 40
  end
  object cds62: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT Data0061.CATEGORY,Data0062.AMOUNT'#13#10'       ,data0062.free_' +
      'amount,costfree_amount'#13#10'FROM dbo.Data0062 '#13#10#9'INNER JOIN dbo.Data' +
      '0061 ON dbo.Data0062.ADDL_CAT_PTR = dbo.Data0061.RKEY'#13#10
    Params = <>
    ReadOnly = True
    Left = 616
    Top = 160
  end
  object ds62: TDataSource
    DataSet = cds62
    Left = 656
    Top = 160
  end
  object cds89: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT Data0278.PARAMETER_NAME, dbo.Data0278.PARAMETER_DESC'#13#10'   ' +
      '    ,Data0002.UNIT_NAME, dbo.data0089.tvalue'#13#10'       ,Data0277.C' +
      'ATEGORY_DESC'#13#10'FROM   data0089 '#13#10#9#9'INNER JOIN Data0278 ON data008' +
      '9.parameter_ptr = dbo.Data0278.RKEY '#13#10#9#9'INNER JOIN Data0002 ON d' +
      'bo.Data0278.UNIT_PTR = dbo.Data0002.RKEY '#13#10#9#9'INNER JOIN Data0277' +
      ' ON dbo.Data0278.CATEGORY_PTR = dbo.Data0277.RKEY'#13#10
    Params = <>
    ReadOnly = True
    Left = 168
    Top = 144
  end
  object ds89: TDataSource
    DataSet = cds89
    Left = 168
    Top = 192
  end
  object cds26: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo.' +
      'Data0017.INV_DESCRIPTION  '#13#10'      , ROUND(dbo.Data0026.QTY_BOM *' +
      ' dbo.Data0060.PARTS_ORDERED, 6) AS stand_qty'#13#10'      , dbo.Data00' +
      '02.UNIT_NAME, dbo.Data0017.QUAN_ON_HAND'#13#10'FROM dbo.Data0025 '#13#10#9#9'I' +
      'NNER JOIN dbo.Data0026 ON dbo.Data0025.RKEY = dbo.Data0026.MANU_' +
      'BOM_PTR '#13#10#9#9'INNER JOIN dbo.Data0017 ON dbo.Data0026.INVENTORY_PT' +
      'R = dbo.Data0017.RKEY '#13#10#9#9'INNER JOIN dbo.Data0002 ON dbo.Data001' +
      '7.STOCK_UNIT_PTR = dbo.Data0002.RKEY '#13#10#9#9'INNER JOIN dbo.Data0060' +
      ' ON dbo.Data0025.RKEY = dbo.Data0060.CUST_PART_PTR'#13#10
    Params = <>
    ReadOnly = True
    Left = 224
    Top = 144
  end
  object ds26: TDataSource
    DataSet = cds26
    Left = 224
    Top = 192
  end
  object cds360: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT * FROM data0360'
    IndexFieldNames = 'sch_date'
    Params = <>
    Left = 336
    Top = 144
  end
  object ds360: TDataSource
    DataSet = cds360
    Left = 336
    Top = 192
  end
  object cds38: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT TOP 100 PERCENT dbo.Data0038.STEP_NUMBER, dbo.Data0034.DE' +
      'PT_CODE, dbo.Data0034.DEPT_NAME'#13#10'FROM dbo.Data0034 '#13#10#9#9'INNER JOI' +
      'N dbo.Data0038 ON dbo.Data0034.RKEY = dbo.Data0038.DEPT_PTR '#13#10#9#9 +
      'INNER JOIN dbo.Data0025 ON dbo.Data0038.SOURCE_PTR = dbo.Data002' +
      '5.RKEY'#13#10
    Params = <>
    ReadOnly = True
    Left = 280
    Top = 144
  end
  object ds38: TDataSource
    DataSet = cds38
    Left = 280
    Top = 192
  end
  object cdsTotal360: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 392
    Top = 144
  end
  object dsTotal360: TDataSource
    DataSet = cdsTotal360
    Left = 392
    Top = 192
  end
  object pm360: TPopupMenu
    OnPopup = pm360Popup
    Left = 456
    Top = 56
    object NAdd: TMenuItem
      Caption = #22686#21152
      OnClick = NAddClick
    end
    object NEdit: TMenuItem
      Caption = #32534#36753
      OnClick = NEditClick
    end
    object NDel: TMenuItem
      Caption = #21024#38500
      OnClick = NDelClick
    end
  end
  object cds360_2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 456
    Top = 144
  end
end
