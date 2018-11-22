inherited Form_details: TForm_details
  Caption = #38144#21806#23450#21333#32454#33410
  ClientHeight = 559
  ClientWidth = 709
  ExplicitWidth = 725
  ExplicitHeight = 597
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 709
    Height = 559
    ExplicitWidth = 709
    ExplicitHeight = 559
    inherited pnl1: TPanel
      Width = 707
      ExplicitWidth = 707
      inherited btnSave: TBitBtn
        Visible = False
      end
      inherited btnClose: TBitBtn
        Visible = False
      end
    end
    inherited pnl2: TPanel
      Width = 707
      Height = 524
      ExplicitWidth = 707
      ExplicitHeight = 524
      object PageControl1: TPageControl
        Left = 1
        Top = 1
        Width = 705
        Height = 522
        ActivePage = TabSheet1
        Align = alClient
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = #35746#21333#20449#24687
          object Label1: TLabel
            Left = 30
            Top = 6
            Width = 76
            Height = 13
            Alignment = taRightJustify
            Caption = #38144#21806#23450#21333#21495#30721':'
          end
          object Label2: TLabel
            Left = 54
            Top = 30
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = #36755#20837#26085#26399':'
          end
          object Label3: TLabel
            Left = 253
            Top = 77
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = #22238#22797#20132#26399':'
          end
          object Label5: TLabel
            Left = 78
            Top = 102
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = #23458#25143':'
          end
          object Label6: TLabel
            Left = 51
            Top = 126
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = ' '#26412#21378#32534#21495':'
          end
          object Label8: TLabel
            Left = 54
            Top = 152
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = #23458#25143#22411#21495':'
          end
          object Label9: TLabel
            Left = 262
            Top = 33
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = ' '#21512#21516#21495':'
          end
          object Label10: TLabel
            Left = 51
            Top = 200
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = ' '#21512#21516#26085#26399':'
          end
          object Label11: TLabel
            Left = 54
            Top = 224
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = #20135#21697#31867#22411':'
          end
          object Label12: TLabel
            Left = 78
            Top = 248
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = #36135#24065':'
          end
          object Label13: TLabel
            Left = 78
            Top = 272
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = #27719#29575':'
          end
          object Label14: TLabel
            Left = 54
            Top = 298
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = #23558#35201#30830#35748';'
          end
          object Bevel1: TBevel
            Left = 464
            Top = 128
            Width = 222
            Height = 216
            Shape = bsFrame
          end
          object Label15: TLabel
            Left = 520
            Top = 137
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = #25968#37327':'
          end
          object Label16: TLabel
            Left = 520
            Top = 160
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = #20215#26684':'
          end
          object Label17: TLabel
            Left = 497
            Top = 184
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = #22686#20540#31246'%:'
          end
          object Label18: TLabel
            Left = 520
            Top = 210
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = #25240#25187':'
          end
          object Label19: TLabel
            Left = 496
            Top = 233
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = #29983#20135#24037#20855':'
          end
          object Label20: TLabel
            Left = 512
            Top = 288
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = #21512#35745':'
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label21: TLabel
            Left = 473
            Top = 124
            Width = 24
            Height = 13
            Caption = #21512#35745
          end
          object Label22: TLabel
            Left = 54
            Top = 53
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = #23458#25143#20132#26399':'
          end
          object Label23: TLabel
            Left = 54
            Top = 77
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = #35745#21010#20132#26399':'
          end
          object Label24: TLabel
            Left = 41
            Top = 177
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = #23458#25143#35746#21333'PO:'
          end
          object Label25: TLabel
            Left = 468
            Top = 34
            Width = 49
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '  '#21442#32771':'
          end
          object DBText1: TDBText
            Left = 624
            Top = 104
            Width = 41
            Height = 13
            AutoSize = True
            DataField = 'SUPPLIER_NAME'
            DataSource = DataSource1
          end
          object Label4: TLabel
            Left = 468
            Top = 106
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = '  '#22806#21457#20379#24212#21830':'
          end
          object Label26: TLabel
            Left = 489
            Top = 261
            Width = 52
            Height = 13
            Caption = #24037#20855#31246#37329':'
          end
          object Label27: TLabel
            Left = 493
            Top = 311
            Width = 52
            Height = 13
            Caption = #19979#21333#38754#31215':'
          end
          object Label7: TLabel
            Left = 203
            Top = 273
            Width = 52
            Height = 13
            Caption = #24037#21378#31616#31216':'
          end
          object Label28: TLabel
            Left = 253
            Top = 7
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = #24037#21378#31616#31216':'
          end
          object Label29: TLabel
            Left = 241
            Top = 103
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = #20851#32852#21407#23458#25143':'
          end
          object Button1: TButton
            Left = 329
            Top = 466
            Width = 73
            Height = 25
            Caption = #20851#38381
            ModalResult = 2
            TabOrder = 0
          end
          object DBEdit1: TDBEdit
            Left = 114
            Top = 3
            Width = 107
            Height = 21
            Color = cl3DLight
            DataField = 'SALES_ORDER'
            DataSource = DataSource1
            TabOrder = 1
          end
          object DBEdit2: TDBEdit
            Left = 114
            Top = 27
            Width = 93
            Height = 21
            Color = cl3DLight
            DataField = 'ENT_DATE'
            DataSource = DataSource1
            TabOrder = 2
          end
          object DBEdit4: TDBEdit
            Left = 309
            Top = 74
            Width = 93
            Height = 21
            Color = cl3DLight
            DataField = 'SCH_DATE'
            DataSource = DataSource1
            TabOrder = 3
          end
          object DBEdit5: TDBEdit
            Left = 114
            Top = 99
            Width = 93
            Height = 21
            Color = cl3DLight
            DataField = 'ABBR_NAME'
            DataSource = DataSource1
            TabOrder = 4
          end
          object DBEdit6: TDBEdit
            Left = 114
            Top = 123
            Width = 121
            Height = 21
            Color = cl3DLight
            DataField = 'MANU_PART_NUMBER'
            DataSource = DataSource1
            TabOrder = 5
          end
          object DBEdit8: TDBEdit
            Left = 114
            Top = 149
            Width = 231
            Height = 21
            Color = cl3DLight
            DataField = 'MANU_PART_DESC'
            DataSource = DataSource1
            TabOrder = 6
          end
          object DBEdit9: TDBEdit
            Left = 114
            Top = 173
            Width = 121
            Height = 21
            Color = cl3DLight
            DataField = 'PO_NUMBER'
            DataSource = DataSource1
            TabOrder = 7
          end
          object DBEdit10: TDBEdit
            Left = 114
            Top = 197
            Width = 81
            Height = 21
            Color = cl3DLight
            DataField = 'PO_DATE'
            DataSource = DataSource1
            TabOrder = 8
          end
          object DBEdit11: TDBEdit
            Left = 114
            Top = 221
            Width = 230
            Height = 21
            Color = cl3DLight
            DataField = 'PRODUCT_NAME'
            DataSource = DataSource1
            TabOrder = 9
          end
          object DBEdit12: TDBEdit
            Left = 114
            Top = 245
            Width = 121
            Height = 21
            Color = cl3DLight
            DataField = 'CURR_NAME'
            DataSource = DataSource1
            TabOrder = 10
          end
          object DBEdit13: TDBEdit
            Left = 114
            Top = 269
            Width = 84
            Height = 21
            Color = cl3DLight
            DataField = 'EXCH_RATE'
            DataSource = DataSource1
            TabOrder = 11
          end
          object DBEdit14: TDBEdit
            Left = 114
            Top = 294
            Width = 84
            Height = 21
            Color = cl3DLight
            DataField = 'TO_BE_CONFIRMED'
            DataSource = DataSource1
            TabOrder = 12
          end
          object DBEdit15: TDBEdit
            Left = 558
            Top = 133
            Width = 91
            Height = 21
            Color = cl3DLight
            DataField = 'PARTS_ORDERED'
            DataSource = DataSource1
            TabOrder = 13
          end
          object DBEdit16: TDBEdit
            Left = 558
            Top = 158
            Width = 91
            Height = 21
            Color = cl3DLight
            DataField = 'PART_PRICE'
            DataSource = DataSource1
            TabOrder = 14
          end
          object DBEdit17: TDBEdit
            Left = 558
            Top = 180
            Width = 91
            Height = 21
            Color = cl3DLight
            DataField = 'RUSH_CHARGE'
            DataSource = DataSource1
            TabOrder = 15
          end
          object DBEdit18: TDBEdit
            Left = 558
            Top = 208
            Width = 91
            Height = 21
            Color = cl3DLight
            DataField = 'DISCOUNT'
            DataSource = DataSource1
            TabOrder = 16
          end
          object DBEdit19: TDBEdit
            Left = 558
            Top = 232
            Width = 91
            Height = 21
            Color = cl3DLight
            DataField = 'TOTAL_ADD_L_PRICE'
            DataSource = DataSource1
            TabOrder = 17
          end
          object BitBtn1: TBitBtn
            Left = 653
            Top = 227
            Width = 25
            Height = 25
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              04000000000080000000120B0000120B00001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DAD0D0D0D0DA
              DADAADADADADA00DADADDADADADAD000DADAADADADADA0B70DADDADADADAD0B8
              0ADA00000000AD0B70AD0FFFFFF0DA0B80DA0F7FF8F0ADA0B70D0FFF00000000
              B00A0F7F0FF0FFF001100FFF0FF0F7F0000A44444444FFF0ADAD44444444F7F0
              DADAADAD0FFFFFF0ADADDADA44444444DADAADAD44444444ADAD}
            TabOrder = 18
            OnClick = BitBtn1Click
          end
          object Edit1: TEdit
            Left = 558
            Top = 282
            Width = 120
            Height = 21
            Color = cl3DLight
            ReadOnly = True
            TabOrder = 19
          end
          object DBEdit20: TDBEdit
            Left = 114
            Top = 50
            Width = 93
            Height = 21
            Color = cl3DLight
            DataField = 'ORIG_REQUEST_DATE'
            DataSource = DataSource1
            TabOrder = 20
          end
          object DBEdit21: TDBEdit
            Left = 114
            Top = 74
            Width = 93
            Height = 21
            Color = cl3DLight
            DataField = 'ORIG_SCHED_SHIP_DATE'
            DataSource = DataSource1
            TabOrder = 21
          end
          object DBEdit22: TDBEdit
            Left = 309
            Top = 29
            Width = 152
            Height = 21
            Color = cl3DLight
            DataField = 'fob'
            DataSource = DataSource1
            ReadOnly = True
            TabOrder = 22
          end
          object DBEdit23: TDBEdit
            Left = 518
            Top = 29
            Width = 165
            Height = 21
            Color = cl3DLight
            DataField = 'REFERENCE_NUMBER'
            DataSource = DataSource1
            ReadOnly = True
            TabOrder = 23
          end
          object DBRadioGroup1: TDBRadioGroup
            Left = 464
            Top = 55
            Width = 219
            Height = 41
            Caption = #35746#21333#31867#21035
            Columns = 3
            DataField = 'so_tp'
            DataSource = DataSource1
            Items.Strings = (
              #33258#21046
              #22806#21457
              #21322#21046#31243)
            ReadOnly = True
            TabOrder = 24
            Values.Strings = (
              '0'
              '1'
              '2')
          end
          object DBEdit3: TDBEdit
            Left = 544
            Top = 101
            Width = 75
            Height = 21
            Color = cl3DLight
            DataField = 'CODE'
            DataSource = DataSource1
            ReadOnly = True
            TabOrder = 25
          end
          object DBCheckBox1: TDBCheckBox
            Left = 376
            Top = 217
            Width = 74
            Height = 17
            Caption = #20215#26684#21547#31246
            DataField = 'tax_in_price'
            DataSource = DataSource1
            ReadOnly = True
            TabOrder = 26
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
          end
          object Edit2: TEdit
            Left = 557
            Top = 256
            Width = 93
            Height = 21
            Color = cl3DLight
            ReadOnly = True
            TabOrder = 27
            Text = '0.0000'
          end
          object DBEdit24: TDBEdit
            Left = 558
            Top = 306
            Width = 120
            Height = 21
            Color = cl3DLight
            DataField = 'orders_sqft'
            DataSource = DataSource1
            ReadOnly = True
            TabOrder = 28
          end
          object DBEdit7: TDBEdit
            Left = 309
            Top = 3
            Width = 114
            Height = 21
            Color = cl3DLight
            DataField = 'ABBR_NAME15'
            DataSource = DataSource1
            ReadOnly = True
            TabOrder = 29
          end
          object DBEdit25: TDBEdit
            Left = 309
            Top = 100
            Width = 114
            Height = 21
            Color = cl3DLight
            DataField = 'ORIG_CUSTOMER'
            DataSource = DataSource1
            ReadOnly = True
            TabOrder = 30
          end
          object GroupBox1: TGroupBox
            Left = 15
            Top = 343
            Width = 668
            Height = 89
            Caption = #38144#21806#23450#21333#35760#20107#26412
            TabOrder = 31
            object DBMemo1: TDBMemo
              Left = 2
              Top = 15
              Width = 664
              Height = 72
              Align = alClient
              DataField = 'RemarkSO'
              DataSource = DataSource1
              TabOrder = 0
            end
          end
          object DBEdit26: TDBEdit
            Left = 261
            Top = 269
            Width = 121
            Height = 21
            DataField = 'ABBR_NAME15'
            DataSource = DataSource1
            TabOrder = 32
          end
        end
        object TabSheet2: TTabSheet
          Caption = #35780#23457#21442#25968#20449#24687
          ImageIndex = 1
          object Panel1: TPanel
            Left = 449
            Top = 0
            Width = 248
            Height = 494
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Memo1: TMemo
              Left = 0
              Top = 310
              Width = 248
              Height = 184
              Align = alBottom
              Color = cl3DLight
              ReadOnly = True
              TabOrder = 0
            end
            object DBGrid2: TDBGrid
              Left = 0
              Top = 0
              Width = 248
              Height = 310
              Align = alClient
              DataSource = Data360
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'sch_date'
                  Title.Caption = #23436#24037#26085#26399
                  Width = 72
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'quantity'
                  Title.Caption = #23436#24037#25968#37327
                  Width = 89
                  Visible = True
                end>
            end
          end
          object DBGrid1: TDBGrid
            Left = 0
            Top = 0
            Width = 449
            Height = 494
            Align = alLeft
            Color = cl3DLight
            DataSource = Data89
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'CATEGORY_DESC'
                Title.Caption = #21442#25968#31867#21035
                Width = 76
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'parameter_desc'
                Title.Caption = #35746#21333#35201#27714#39033#30446
                Width = 132
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'unit_name'
                Title.Caption = #21333#20301
                Width = 59
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'tvalue'
                Title.Caption = #20869#23481
                Width = 156
                Visible = True
              end>
          end
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 168
    Top = 368
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT dbo.Data0060.SALES_ORDER,dbo.Data0060.RemarkSO, dbo.Data0' +
      '060.ENT_DATE,'#13#10'      dbo.Data0060.DUE_DATE, dbo.Data0060.SCH_DAT' +
      'E, dbo.Data0060.EXCH_RATE,'#13#10'      dbo.Data0060.TO_BE_CONFIRMED, ' +
      'dbo.Data0060.RUSH_CHARGE,'#13#10'      dbo.Data0060.DISCOUNT, dbo.Data' +
      '0060.TOTAL_ADD_L_PRICE, dbo.Data0060.RKEY,'#13#10'      dbo.Data0060.P' +
      'ART_PRICE, dbo.Data0060.PARTS_ORDERED,'#13#10'      dbo.Data0060.tax_i' +
      'n_price, dbo.Data0060.set_ordered, dbo.Data0097.PO_NUMBER,'#13#10'    ' +
      '  dbo.Data0097.PO_DATE, dbo.Data0060.REFERENCE_NUMBER,'#13#10'      db' +
      'o.Data0008.PRODUCT_NAME, dbo.Data0001.CURR_NAME,'#13#10'      dbo.Data' +
      '0010.ABBR_NAME, dbo.Data0060.ORIG_REQUEST_DATE,'#13#10'      dbo.Data0' +
      '060.ORIG_SCHED_SHIP_DATE, dbo.Data0060.PARTS_SHIPPED,'#13#10'      dbo' +
      '.Data0060.PURCHASE_ORDER_PTR, dbo.Data0060.CUST_PART_PTR,'#13#10'     ' +
      ' dbo.Data0060.RUSH_CHARGE_PCT_USED, dbo.Data0060.FOB, dbo.Data00' +
      '60.so_tp,'#13#10'      dbo.Data0023.CODE, dbo.Data0023.SUPPLIER_NAME,'#13 +
      #10'      round(dbo.Data0060.PARTS_ORDERED * dbo.Data0025.unit_sq ,' +
      '5)  as orders_sqft,'#13#10'      dbo.Data0025.MANU_PART_NUMBER, dbo.Da' +
      'ta0025.MANU_PART_DESC,'#13#10'      dbo.Data0025.set_qty,Data0060.ISSU' +
      'ED_QTY,'#13#10'      CASE dbo.Data0060.STATUS'#13#10'       WHEN 1 THEN '#39#26377#25928#30340 +
      #39#13#10'       WHEN 2 THEN '#39#24050#26242#32531#39#13#10'       WHEN 3 THEN '#39#24050#20851#38381#39#13#10'       WH' +
      'EN 4 THEN '#39#24050#23436#25104#39#13#10'       WHEN 5 THEN '#39#24050#21462#28040#39#13#10'       WHEN 6 THEN '#39#26410 +
      #25552#20132#39#13#10'      END AS STATUS,dbo.data0025.ORIG_CUSTOMER,dbo.data0015' +
      '.ABBR_NAME as ABBR_NAME15'#13#10'FROM dbo.Data0023 RIGHT OUTER JOIN'#13#10' ' +
      '     dbo.Data0060 INNER JOIN'#13#10'      dbo.Data0010 ON dbo.Data0060' +
      '.CUSTOMER_PTR = dbo.Data0010.RKEY INNER JOIN'#13#10'      dbo.Data0097' +
      ' ON'#13#10'      dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY I' +
      'NNER JOIN'#13#10'      dbo.Data0001 ON dbo.Data0060.CURRENCY_PTR = dbo' +
      '.Data0001.RKEY INNER JOIN'#13#10'      dbo.Data0025 INNER JOIN'#13#10'      ' +
      'dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY O' +
      'N'#13#10'      dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY ON'#13#10'    ' +
      '  dbo.Data0023.RKEY = dbo.Data0060.supplier_ptr INNER JOIN'#13#10'    ' +
      '  dbo.Data0015 ON dbo.Data0060.SHIP_REG_TAX_ID = dbo.Data0015.RK' +
      'EY'#13#10
    Params = <>
    Left = 56
    Top = 368
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 368
  end
  object ClientDataSet3: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 344
    Top = 368
  end
  object ado89: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT Data0278.PARAMETER_NAME, dbo.Data0278.PARAMETER_DESC,'#13#10'  ' +
      '     Data0002.UNIT_NAME, dbo.data0089.tvalue,'#13#10'       Data0277.C' +
      'ATEGORY_DESC'#13#10'FROM   data0089 INNER JOIN'#13#10'       Data0278 ON'#13#10'  ' +
      '     data0089.parameter_ptr = dbo.Data0278.RKEY INNER JOIN'#13#10'    ' +
      '   Data0002 ON dbo.Data0278.UNIT_PTR = dbo.Data0002.RKEY INNER J' +
      'OIN'#13#10'       Data0277 ON dbo.Data0278.CATEGORY_PTR = dbo.Data0277' +
      '.RKEY'#13#10'where'
    Params = <>
    Left = 224
    Top = 128
  end
  object ads360: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select rkey,so_ptr,quantity,sch_date'#13#10'from data0360'#13#10'where so_pt' +
      'r='
    Params = <>
    Left = 528
    Top = 200
  end
  object Data89: TDataSource
    DataSet = ado89
    Left = 224
    Top = 192
  end
  object Data360: TDataSource
    DataSet = ads360
    Left = 536
    Top = 256
  end
end
