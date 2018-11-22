inherited frm_MainMod72: Tfrm_MainMod72
  Caption = #38144#21806#35746#21333
  ClientHeight = 594
  ClientWidth = 1058
  OnShow = FormShow
  ExplicitWidth = 1066
  ExplicitHeight = 621
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 1058
    Height = 594
    ExplicitWidth = 1058
    ExplicitHeight = 594
    inherited pnlDisplayMain: TPanel
      Width = 1058
      Height = 594
      ExplicitWidth = 1058
      ExplicitHeight = 594
      inherited pnlChildMain: TPanel
        Width = 1056
        Height = 592
        ExplicitWidth = 1056
        ExplicitHeight = 592
        inherited pnlEhMainDisplay: TPanel
          Width = 1054
          Height = 529
          ExplicitWidth = 1054
          ExplicitHeight = 529
          inherited ehMain: TDBGridEh
            Width = 1052
            Height = 527
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
            OnDblClick = ehMainDblClick
            OnDrawColumnCell = ehMainDrawColumnCell
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'D60SALES_ORDER'
                Footers = <>
                Title.Caption = #38144#21806#35746#21333
                Title.Color = clRed
                Width = 91
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'MANU_PART_NUMBER'
                Footers = <>
                Title.Caption = #26412#21378#32534#21495
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'MANU_PART_DESC'
                Footers = <>
                Title.Caption = #23458#25143#22411#21495
                Width = 130
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ANALYSIS_CODE_2'
                Footers = <>
                Title.Caption = #23458#25143#29289#26009#21495
                Width = 80
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CUST_CODE'
                Footers = <>
                Title.Caption = #23458#25143#20195#30721
                Width = 57
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'D10CUSTOMER_NAME'
                Footers = <>
                Title.Caption = #23458#25143#31616#31216
                Width = 64
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'D97PO_NUMBER'
                Footers = <>
                Title.Caption = #23458#25143#35746#21333#21495
                Width = 77
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'fob'
                Footers = <>
                Title.Caption = #21512#21516#21495
                Visible = False
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PARTS_ORDERED'
                Footers = <>
                ReadOnly = False
                Title.Caption = #35746#21333#25968#37327
                Width = 62
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'order_sq'
                Footers = <>
                Title.Caption = #35746#21333#38754#31215
                Width = 64
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PART_PRICE'
                Footers = <>
                Title.Caption = 'pcs'#20215#26684
                Visible = False
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'sCURRName'
                Footers = <>
                Title.Caption = #36135#24065
                Visible = False
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'maolilv_add'
                Footers = <>
                Title.Caption = #27611#21033#29575
                Visible = False
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QTY_PLANNNED'
                Footers = <>
                ReadOnly = False
                Title.Caption = #25237#20135#25968#37327
                Width = 68
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PARTS_SHIPPED'
                Footers = <>
                ReadOnly = False
                Title.Caption = #36865#36135#25968#37327
                Width = 68
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PARTS_RETURNED'
                Footers = <>
                Title.Caption = #36864#36135#25968#37327
                Visible = False
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'parts_margin'
                Footers = <>
                ReadOnly = False
                Title.Caption = #27424#36135#25968#37327
                Width = 64
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ENT_DATE'
                Footers = <>
                ReadOnly = False
                Title.Caption = #36755#20837#26085#26399
                Width = 70
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CONF_DATE'
                Footers = <>
                ReadOnly = False
                Title.Caption = #30830#35748#26085#26399
                Visible = False
              end
              item
                DisplayFormat = 'yyyy-MM-dd'
                DynProps = <>
                EditButtons = <>
                FieldName = 'ORIG_SCHED_SHIP_DATE'
                Footers = <>
                ReadOnly = False
                Title.Caption = #35745#21010#20132#26399
                Width = 71
              end
              item
                DisplayFormat = 'yyyy-MM-dd'
                DynProps = <>
                EditButtons = <>
                FieldName = 'D60SCH_DATE'
                Footers = <>
                ReadOnly = False
                Title.Caption = #22238#22797#20132#26399
                Width = 75
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'status'
                Footers = <>
                ReadOnly = False
                Title.Caption = #29366#24577
                Width = 64
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'sOldNew'
                Footers = <>
                Title.Caption = #35746#21333#26032#26087
                Width = 62
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CPJS'
                Footers = <>
                Title.Caption = #20135#21697#38454#25968
                Visible = False
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'quote_auth'
                Footers = <>
                ReadOnly = False
                Title.Caption = #35780#23457#26631#35760
                Width = 64
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'Prod_rel'
                Footers = <>
                ReadOnly = False
                Title.Caption = #29983#20135#26631#35760
                Width = 61
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'sotp'
                Footers = <>
                Title.Caption = #21152#24037#24418#24335
                Width = 64
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'code'
                Footers = <>
                Title.Caption = #20379#24212#21830#20195#30721
                Visible = False
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'TNUMBERs'
                Footers = <>
                Title.Caption = #25253#20215#32534#21495
                Width = 95
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'rkey213'
                Footers = <>
                Title.Caption = #39044#22788#29702#32534#21495
                Width = 68
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'REFERENCE_NUMBER'
                Footers = <>
                Title.Caption = #21442#32771#38468#27880
                Width = 84
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ORIG_CUSTOMER'
                Footers = <>
                Title.Caption = #20851#32852#21407#23458#25143
                Visible = False
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 1054
          ExplicitWidth = 1054
          inherited lblFilter: TLabel
            Left = 736
            Top = 7
            ExplicitLeft = 736
            ExplicitTop = 7
          end
          inherited edtFliter: TEdit
            Left = 793
            Top = 3
            ExplicitLeft = 793
            ExplicitTop = 3
          end
          inherited btnAuthDispatch: TBitBtn
            Visible = False
          end
          object BitBtn6: TBitBtn
            Left = 455
            Top = 0
            Width = 106
            Height = 29
            Hint = #37325#26032#23450#20041#26597#35810#26465#20214
            Align = alLeft
            Caption = #20449#29992#39069#24230#26597#35810
            Glyph.Data = {
              C6050000424DC605000000000000360400002800000014000000140000000100
              08000000000090010000C40E0000C40E0000000100000000000000000000E8E0
              0000D0A000006060600038383800F0700000B8B8C00020202000A8B0B000F0F0
              F800B8400000C0600800A0A0A000E0E0E800D8D8E000B8100000D0D8D800C0A0
              8800B8300000F8F8080098989800B0504000B0908800B8706000E0A86000E0D8
              C000F070380088888800F0D8B0005858580008101000E0D0B000B8504000E8C8
              A000F0B85000E8D8A800C8C8C800D8982000D8C0B00050505000C8803800F0C8
              8800F8500800D8A040007078780008080800E8C0880028283000F8980000E8F0
              F00040404000B0B8B800B8A0A000C0682800E0A87800F0800000C8D0D000C898
              8000E0A88000D8904800E0E0E000F0A0000070707000E0783000B0888800E8D0
              6800C8B8A800C8700800D8885000B850180028282000B8887800F0F0D8001818
              1800F070180090909000D8C05800E8B09800F8F0E000F8F0F00048484800B8C0
              C800F0C06000F8F8F800F8805800F8F0C80080808000B8906000B0B0B000D090
              5000F8600000D8D0C800E0A05800B8585800B8B00000B8481000D0D0B000D078
              3000C0702000F0A86800C0602000E8E8E800A8A8A800F0C0B800B0201000F0A8
              4000E0B89000B8B8B80068686800F0F0E800F0982000D8D0A800E8C88000F0E0
              C000B8380800F0800800D8E0E000C0C0C000F0680800B0B0B800C0601800E0B8
              7800F0981000C8781800C0C8C80010101800C8A09000E0B8600030303000F0F0
              F000C0B8B80028282800E8E0E000F0F8F8003838400078787800F0D8B800D8C8
              B800F0C89000E0E8E800B8601000D0883800F8680800D8D0B800E8D08800C8C8
              D000D0D0D000B8B0B00058586000D8D8D8002820200010101000E8E8F000F8F8
              F000D8D0D000B8786000B8480000F0780000F0880000E0B08000B8C0C000B818
              0000C0A88800B8300800B0504800F0E0B000E8D0B000F0D08800F8501000F880
              0800ECFD7F0002000000000000001300E8000100000001000A0000884000F877
              78004B1B00000100000000998400E6775400F71200000101010001D8F8001200
              450090FB7700801FF80077FFFF00FFFF6000F8120000AD84E6007760F8001200
              D80084E677000000000000FFFF0000003800A8F8000038A8F800001800000000
              00000000000044F8120000400000000000000000000028F81200000000000000
              00000000000000000000000C000000000200000000000101120000872B00F877
              0000ECFD7F00000000000002000000006C00001A0200804B1B00007FFF00FFFF
              000000000000804B1B00000500000000870031E6770084F8120000218600E677
              9800F81200006713000010FFFF00000020000100000038A8F800000000000000
              7000F8120000ACF8120000D8F8001200100030001000F8400000105F5400E677
              200001000000D0F8120000D8F80012000800000000000E0000005331B2861D86
              1D861D861D861DF81DC57431F62C9824801414572C572C6C2C6C6C1D6C6C77B2
              6CB2B26C2CDF1232DF6C6CF86CF86C861D1B006C1D0E94530E8A6E8A24240E24
              24240E6F6CB294800E531D31550E4C245524242424515551B26C322453318655
              248A0E557780000086576C002CB20E5398536C31305A55F8CC1424511486B2F3
              1D802453535386534C229457536F066F06242CB2806C065353551D5353511D53
              638C12152477248680F8245353318653531D7755358D35121B57066FF66C2453
              98536C535380240EAA6F631557123551B26C24535353945353B2065398554D35
              776F0624C56C065353551D53536C6F53535355246F152451806C245353319453
              532480535353246F7E8D531D946C245398536C53535314F85353AA2453531480
              576C245353532C5353555314C557776F14002C246C5706535355575353315353
              551B6CF857146E146C2C24535331866C775353555353535353225A35C5B20653
              9853570E57535353535353535353AA08143153315353986C866C2C6C6C1D941D
              861D8680775398535355}
            ParentShowHint = False
            ShowHint = True
            TabOrder = 8
            OnClick = BitBtn6Click
          end
          object BitBtn7: TBitBtn
            Left = 561
            Top = 0
            Width = 72
            Height = 29
            Hint = #22806#21457#23548#20986'EXCEL'#26684#24335
            Align = alLeft
            Caption = #22806#21457#23548#20986
            ParentShowHint = False
            ShowHint = True
            TabOrder = 9
            OnClick = BitBtn7Click
          end
          object BitBtn8: TBitBtn
            Left = 633
            Top = 0
            Width = 74
            Height = 29
            Hint = #23548#20837#22806#21457'EXCEL'#26684#24335
            Align = alLeft
            Caption = #22806#21457#23548#20837
            ParentShowHint = False
            ShowHint = True
            TabOrder = 10
            OnClick = BitBtn8Click
          end
        end
        object GroupBox1: TGroupBox
          Left = 1
          Top = 559
          Width = 1054
          Height = 32
          Align = alBottom
          Caption = #35746#21333#29366#24577
          TabOrder = 2
          object CheckBox1: TCheckBox
            Left = 124
            Top = 9
            Width = 61
            Height = 17
            Caption = #26377#25928#30340
            Checked = True
            State = cbChecked
            TabOrder = 0
            OnClick = CheckBox6Click
          end
          object CheckBox2: TCheckBox
            Left = 190
            Top = 10
            Width = 49
            Height = 16
            Caption = #26242#32531
            Checked = True
            State = cbChecked
            TabOrder = 1
            OnClick = CheckBox6Click
          end
          object CheckBox3: TCheckBox
            Left = 245
            Top = 9
            Width = 65
            Height = 17
            Caption = #24050#20851#38381
            Checked = True
            State = cbChecked
            TabOrder = 2
            OnClick = CheckBox6Click
          end
          object CheckBox4: TCheckBox
            Left = 310
            Top = 9
            Width = 62
            Height = 17
            Caption = #24050#23436#25104
            Checked = True
            State = cbChecked
            TabOrder = 3
            OnClick = CheckBox6Click
          end
          object CheckBox6: TCheckBox
            Left = 62
            Top = 10
            Width = 61
            Height = 16
            Caption = #26410#25552#20132
            Checked = True
            State = cbChecked
            TabOrder = 4
            OnClick = CheckBox6Click
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'SELECT dbo.Data0060.RKEY AS D60RKEY, dbo.Data0060.CUST_PART_PTR,' +
      ' isnull(dbo.Data0060.rkey213,0) as rkey213,'#13#10'      dbo.Data0060.' +
      'SALES_ORDER AS D60SALES_ORDER, dbo.Data0010.CUST_CODE, '#13#10'      d' +
      'bo.Data0010.ABBR_NAME AS D10CUSTOMER_NAME, data0060.fob,'#13#10'      ' +
      'dbo.Data0010.CUSTOMER_NAME, dbo.Data0060.PARTS_ORDERED, '#13#10'      ' +
      'dbo.Data0097.PO_NUMBER AS D97PO_NUMBER, data0060.so_oldnew as sO' +
      'ldNew,'#13#10'      dbo.Data0060.PURCHASE_ORDER_PTR, dbo.Data0060.STAT' +
      'US AS D60STATUS, '#13#10'      dbo.Data0060.RMA_PTR, dbo.Data0060.ORIG' +
      '_SCHED_SHIP_DATE,data0001.CURR_NAME as sCURRName, '#13#10'      dbo.Da' +
      'ta0060.CONF_DATE, dbo.Data0060.PROD_REL AS D60PROD_REL, '#13#10'      ' +
      'dbo.Data0060.MFG_ORDER_DATE, Data0060.so_style, Data0060.CUST_SH' +
      'IP_ADDR_PTR, '#13#10'      dbo.Data0005.EMPLOYEE_NAME AS D5EMPLOYEE_NA' +
      'ME, data0023.code,data0023.ABBR_NAME, '#13#10'      dbo.Data0060.REFER' +
      'ENCE_NUMBER, dbo.Data0060.ORIG_REQUEST_DATE, BOMPrice06.maolilv_' +
      'add ,'#13#10'      dbo.Data0060.DUE_DATE AS D60DUE_DATE, dbo.Data0060.' +
      'QUOTE_PRICE, data0060.PART_PRICE ,'#13#10'      dbo.Data0060.SCH_DATE ' +
      'AS D60SCH_DATE, dbo.Data0097.PO_DATE, BOMPrice06.BPNO, '#13#10'      d' +
      'bo.Data0060.ENT_DATE, Data0060.issued_qty as QTY_PLANNNED, data0' +
      '085.TNUMBER,'#13#10'      Data0060.PARTS_SHIPPED+data0060.returned_shi' +
      'p as PARTS_SHIPPED, Data0060.PARTS_RETURNED, '#13#10'      Data0005_1.' +
      'EMPLOYEE_NAME, dbo.Data0060.SHIPPING_METHOD, '#13#10'      Data0060.PA' +
      'RTS_ORDERED +Data0060.PARTS_RETURNED- '#13#10'      Data0060.PARTS_SHI' +
      'PPED - data0060.returned_ship AS parts_margin, '#13#10'      Data0025.' +
      'MANU_PART_NUMBER, Data0025.MANU_PART_DESC,data0025.ANALYSIS_CODE' +
      '_2,data0025.ONHOLD_SALES_FLAG,'#13#10'     case data0060.so_tp when 0 ' +
      'then '#39#33258#21046#39' when 1 then '#39#22806#21457#39' when 2 then '#39#21322#21046#31243#39' end as sotp,Data006' +
      '0.ORIG_CUSTOMER,Data0025.ttype,'#13#10'     case when data0085.TNUMBER' +
      ' is NULL then BOMPrice06.BPNO else data0085.TNUMBER end as TNUMB' +
      'ERs,Data0025.CPJS'#13#10'     ,round(Data0060.PARTS_ORDERED * Data0025' +
      '.unit_sq,4) as order_sq,dbo.Data0010.INTERNAL_ECN_COUNT, dbo.Dat' +
      'a0010.EXTERNAL_ECN_COUNT'#13#10'     ,case Data0060.STATUS when 1 then' +
      ' '#39#26377#25928#30340#39' when 2 then '#39#26242#32531#39' when 3 then '#39#24050#20851#38381#39' when 4 then '#39#24050#23436#25104#39' when' +
      ' 5 then '#39#24050#21462#28040#39' when 6 then '#39#26410#25552#20132#39' end as STATUS'#13#10'     ,case Data00' +
      '60.prod_rel when 1 then '#39#26410#30830#35748#39' when 2 then '#39#24050#30830#35748#39' when 3 then '#39#24050#25237#20135 +
      #39' when 4 then '#39#24050#21462#28040#39' end as prod_rel'#13#10'     ,case Data0060.quote_p' +
      'rice when 0 then '#39#26410#35780#23457#39' when 1 then '#39#24050#35780#23457#39' when 2 then '#39#34987#36864#22238#39' when ' +
      '3 then '#39#19981#35780#23457#39' end as quote_auth'#13#10'     ,case Data0060.so_style whe' +
      'n 0 then '#39#27491#24335#35746#21333#39' else '#39#22791#21697#35746#21333#39' end as sostyle,data0060.CSI_USER_PTR' +
      ',data0060.RemarkSO'#13#10'FROM dbo.Data0005 INNER JOIN'#13#10'      dbo.Data' +
      '0097 INNER JOIN'#13#10'      dbo.Data0060 INNER JOIN'#13#10'      dbo.Data00' +
      '10 ON dbo.Data0060.CUSTOMER_PTR = dbo.Data0010.RKEY ON '#13#10'      d' +
      'bo.Data0097.RKEY = dbo.Data0060.PURCHASE_ORDER_PTR ON '#13#10'      db' +
      'o.Data0005.RKEY = dbo.Data0060.ENTERED_BY_EMPL_PTR INNER JOIN'#13#10' ' +
      '     dbo.Data0025 ON '#13#10'      dbo.Data0060.CUST_PART_PTR = dbo.Da' +
      'ta0025.RKEY INNER JOIN'#13#10'      dbo.Data0001 ON dbo.Data0060.CURRE' +
      'NCY_PTR = dbo.Data0001.RKEY  LEFT OUTER JOIN'#13#10'      dbo.Data0005' +
      ' Data0005_1 ON '#13#10'      dbo.Data0060.CONF_BY_EMPL_PTR = Data0005_' +
      '1.RKEY left outer join'#13#10'     data0023 on Data0060.supplier_ptr =' +
      ' data0023.RKEY left outer join'#13#10'     data0085 on data0060.QTE_PT' +
      'R = data0085.rkey left outer join'#13#10'     BOMPrice06 on Data0060.B' +
      'P06_ptr=BOMPrice06.IDKey'#13#10'WHERE 1=1'
  end
  inherited pmMain: TPopupMenu
    OnPopup = pmMainPopup
    Left = 392
    Top = 120
    object N5: TMenuItem
      Caption = #26032#24314
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #32534#36753
      OnClick = N6Click
    end
    object N7: TMenuItem
      Caption = #26816#26597
      OnClick = N7Click
    end
    object N16: TMenuItem
      Caption = #25552#20132#35780#23457
      OnClick = N16Click
    end
    object N27: TMenuItem
      Caption = #21462#28040#25552#20132
      OnClick = N27Click
    end
    object N18: TMenuItem
      Caption = #35780#23457#20449#24687
      OnClick = N18Click
    end
    object N23: TMenuItem
      Caption = #21024#38500
      OnClick = N23Click
    end
    object N17: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Caption = #32622#20110#26242#32531
      OnClick = N3Click
    end
    object N8: TMenuItem
      Caption = #20174#26242#32531#20013#37322#25918
      OnClick = N8Click
    end
    object N13: TMenuItem
      Caption = #25163#24037#20851#38381
      OnClick = N13Click
    end
    object N14: TMenuItem
      Caption = #20174#20851#38381#20013#37325#26032#36215#21160
      OnClick = N14Click
    end
    object N20: TMenuItem
      Caption = '-'
    end
    object N22: TMenuItem
      Caption = #38144#21806#35746#21333#21464#26356#35760#24405
      OnClick = N22Click
    end
    object N15: TMenuItem
      Caption = #25171#21360#35746#21333
      OnClick = N15Click
    end
    object N24: TMenuItem
      Caption = #36830#32493#32534#21495#25171#21360
      OnClick = N24Click
    end
    object N25: TMenuItem
      Caption = #22806#21457#37319#36141#35746#21333#36830#32493#25171#21360
      OnClick = N25Click
    end
    object N26: TMenuItem
      Caption = #23458#25143#35746#21333#20851#32852#25991#26723
      OnClick = N26Click
    end
  end
  object cds192: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 456
    Top = 120
  end
  object cds60: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 520
    Top = 120
  end
  object cds90: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 576
    Top = 120
  end
  object cds213: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 632
    Top = 120
  end
  object cds318: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 696
    Top = 120
  end
  object cds117: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 760
    Top = 120
  end
  object cds06: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 832
    Top = 120
  end
  object OpenDialog1: TOpenDialog
    Left = 552
    Top = 192
  end
  object cds04: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 896
    Top = 120
  end
end
