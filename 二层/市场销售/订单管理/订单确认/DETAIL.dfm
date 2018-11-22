object Form8: TForm8
  Left = 226
  Top = 216
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #38144#21806#23450#21333#32454#33410
  ClientHeight = 375
  ClientWidth = 699
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 699
    Height = 375
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #35746#21333#20449#24687
      object Label1: TLabel
        Left = 21
        Top = 6
        Width = 85
        Height = 13
        Alignment = taRightJustify
        Caption = #38144#21806#23450#21333#21495#30721':'
      end
      object Label2: TLabel
        Left = 47
        Top = 30
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #36755#20837#26085#26399':'
      end
      object Label3: TLabel
        Left = 246
        Top = 77
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #22238#22797#20132#26399':'
      end
      object Label5: TLabel
        Left = 73
        Top = 102
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = #23458#25143':'
      end
      object Label6: TLabel
        Left = 40
        Top = 126
        Width = 66
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#26412#21378#32534#21495':'
      end
      object Label8: TLabel
        Left = 47
        Top = 152
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #23458#25143#22411#21495':'
      end
      object Label9: TLabel
        Left = 252
        Top = 33
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#21512#21516#21495':'
      end
      object Label10: TLabel
        Left = 40
        Top = 200
        Width = 66
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#21512#21516#26085#26399':'
      end
      object Label11: TLabel
        Left = 47
        Top = 224
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #20135#21697#31867#22411':'
      end
      object Label12: TLabel
        Left = 73
        Top = 248
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = #36135#24065':'
      end
      object Label13: TLabel
        Left = 73
        Top = 272
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = #27719#29575':'
      end
      object Label14: TLabel
        Left = 47
        Top = 298
        Width = 59
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
        Left = 515
        Top = 137
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = #25968#37327':'
      end
      object Label16: TLabel
        Left = 515
        Top = 160
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = #20215#26684':'
      end
      object Label17: TLabel
        Left = 495
        Top = 184
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = #22686#20540#31246'%:'
      end
      object Label18: TLabel
        Left = 515
        Top = 210
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = #25240#25187':'
      end
      object Label19: TLabel
        Left = 489
        Top = 233
        Width = 59
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
        Width = 26
        Height = 13
        Caption = #21512#35745
      end
      object Label22: TLabel
        Left = 47
        Top = 53
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #23458#25143#20132#26399':'
      end
      object Label23: TLabel
        Left = 47
        Top = 77
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #35745#21010#20132#26399':'
      end
      object Label24: TLabel
        Left = 34
        Top = 177
        Width = 73
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
        Width = 49
        Height = 13
        AutoSize = True
        DataField = 'SUPPLIER_NAME'
        DataSource = DM.DataSource1
      end
      object Label4: TLabel
        Left = 452
        Top = 106
        Width = 86
        Height = 13
        Alignment = taRightJustify
        Caption = '  '#22806#21457#20379#24212#21830':'
      end
      object Label26: TLabel
        Left = 489
        Top = 261
        Width = 59
        Height = 13
        Caption = #24037#20855#31246#37329':'
      end
      object Label27: TLabel
        Left = 493
        Top = 311
        Width = 59
        Height = 13
        Caption = #19979#21333#38754#31215':'
      end
      object Label7: TLabel
        Left = 203
        Top = 273
        Width = 59
        Height = 13
        Caption = #24037#21378#31616#31216':'
      end
      object Label28: TLabel
        Left = 246
        Top = 7
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #24037#21378#31616#31216':'
      end
      object Label29: TLabel
        Left = 233
        Top = 103
        Width = 72
        Height = 13
        Alignment = taRightJustify
        Caption = #20851#32852#21407#23458#25143':'
      end
      object Button1: TButton
        Left = 332
        Top = 311
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
        DataSource = DM.DataSource1
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 114
        Top = 27
        Width = 93
        Height = 21
        Color = cl3DLight
        DataField = 'ENT_DATE'
        DataSource = DM.DataSource1
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 309
        Top = 74
        Width = 93
        Height = 21
        Color = cl3DLight
        DataField = 'SCH_DATE'
        DataSource = DM.DataSource1
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 114
        Top = 99
        Width = 93
        Height = 21
        Color = cl3DLight
        DataField = 'ABBR_NAME'
        DataSource = DM.DataSource1
        TabOrder = 4
      end
      object DBEdit6: TDBEdit
        Left = 114
        Top = 123
        Width = 121
        Height = 21
        Color = cl3DLight
        DataField = 'MANU_PART_NUMBER'
        DataSource = DM.DataSource1
        TabOrder = 5
      end
      object DBEdit8: TDBEdit
        Left = 114
        Top = 149
        Width = 231
        Height = 21
        Color = cl3DLight
        DataField = 'MANU_PART_DESC'
        DataSource = DM.DataSource1
        TabOrder = 6
      end
      object DBEdit9: TDBEdit
        Left = 114
        Top = 173
        Width = 121
        Height = 21
        Color = cl3DLight
        DataField = 'PO_NUMBER'
        DataSource = DM.DataSource1
        TabOrder = 7
      end
      object DBEdit10: TDBEdit
        Left = 114
        Top = 197
        Width = 81
        Height = 21
        Color = cl3DLight
        DataField = 'PO_DATE'
        DataSource = DM.DataSource1
        TabOrder = 8
      end
      object DBEdit11: TDBEdit
        Left = 114
        Top = 221
        Width = 230
        Height = 21
        Color = cl3DLight
        DataField = 'PRODUCT_NAME'
        DataSource = DM.DataSource1
        TabOrder = 9
      end
      object DBEdit12: TDBEdit
        Left = 114
        Top = 245
        Width = 121
        Height = 21
        Color = cl3DLight
        DataField = 'CURR_NAME'
        DataSource = DM.DataSource1
        TabOrder = 10
      end
      object DBEdit13: TDBEdit
        Left = 114
        Top = 269
        Width = 84
        Height = 21
        Color = cl3DLight
        DataField = 'EXCH_RATE'
        DataSource = DM.DataSource1
        TabOrder = 11
      end
      object DBEdit14: TDBEdit
        Left = 114
        Top = 294
        Width = 84
        Height = 21
        Color = cl3DLight
        DataField = 'TO_BE_CONFIRMED'
        DataSource = DM.DataSource1
        TabOrder = 12
      end
      object DBEdit15: TDBEdit
        Left = 558
        Top = 133
        Width = 91
        Height = 21
        Color = cl3DLight
        DataField = 'PARTS_ORDERED'
        DataSource = DM.DataSource1
        TabOrder = 13
      end
      object DBEdit16: TDBEdit
        Left = 558
        Top = 158
        Width = 91
        Height = 21
        Color = cl3DLight
        DataField = 'PART_PRICE'
        DataSource = DM.DataSource1
        TabOrder = 14
      end
      object DBEdit17: TDBEdit
        Left = 558
        Top = 180
        Width = 91
        Height = 21
        Color = cl3DLight
        DataField = 'RUSH_CHARGE'
        DataSource = DM.DataSource1
        TabOrder = 15
      end
      object DBEdit18: TDBEdit
        Left = 558
        Top = 208
        Width = 91
        Height = 21
        Color = cl3DLight
        DataField = 'DISCOUNT'
        DataSource = DM.DataSource1
        TabOrder = 16
      end
      object DBEdit19: TDBEdit
        Left = 558
        Top = 232
        Width = 91
        Height = 21
        Color = cl3DLight
        DataField = 'TOTAL_ADD_L_PRICE'
        DataSource = DM.DataSource1
        TabOrder = 17
      end
      object BitBtn1: TBitBtn
        Left = 653
        Top = 227
        Width = 25
        Height = 25
        TabOrder = 18
        OnClick = BitBtn1Click
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000120B0000120B00001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DAD0D0D0D0DA
          DADAADADADADA00DADADDADADADAD000DADAADADADADA0B70DADDADADADAD0B8
          0ADA00000000AD0B70AD0FFFFFF0DA0B80DA0F7FF8F0ADA0B70D0FFF00000000
          B00A0F7F0FF0FFF001100FFF0FF0F7F0000A44444444FFF0ADAD44444444F7F0
          DADAADAD0FFFFFF0ADADDADA44444444DADAADAD44444444ADAD}
      end
      object Edit1: TEdit
        Left = 558
        Top = 282
        Width = 92
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
        DataSource = DM.DataSource1
        TabOrder = 20
      end
      object DBEdit21: TDBEdit
        Left = 114
        Top = 74
        Width = 93
        Height = 21
        Color = cl3DLight
        DataField = 'ORIG_SCHED_SHIP_DATE'
        DataSource = DM.DataSource1
        TabOrder = 21
      end
      object DBEdit22: TDBEdit
        Left = 309
        Top = 29
        Width = 152
        Height = 21
        Color = cl3DLight
        DataField = 'fob'
        DataSource = DM.DataSource1
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
        DataSource = DM.DataSource1
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
        DataSource = DM.DataSource1
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
        DataSource = DM.DataSource1
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
        DataSource = DM.DataSource1
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
        Width = 93
        Height = 21
        Color = cl3DLight
        DataField = 'orders_sqft'
        DataSource = DM.DataSource1
        ReadOnly = True
        TabOrder = 28
      end
      object Edit3: TEdit
        Left = 264
        Top = 269
        Width = 121
        Height = 21
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 29
      end
      object DBEdit7: TDBEdit
        Left = 309
        Top = 3
        Width = 114
        Height = 21
        Color = cl3DLight
        DataField = 'ABBR_NAME15'
        DataSource = DM.DataSource1
        ReadOnly = True
        TabOrder = 30
      end
      object DBEdit25: TDBEdit
        Left = 309
        Top = 100
        Width = 114
        Height = 21
        Color = cl3DLight
        DataField = 'ORIG_CUSTOMER'
        DataSource = DM.DataSource1
        ReadOnly = True
        TabOrder = 31
      end
    end
    object TabSheet2: TTabSheet
      Caption = #35780#23457#21442#25968#20449#24687
      ImageIndex = 1
      object Panel1: TPanel
        Left = 449
        Top = 0
        Width = 242
        Height = 347
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Memo1: TMemo
          Left = 0
          Top = 163
          Width = 242
          Height = 184
          Align = alBottom
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 0
        end
        object DBGrid2: TDBGrid
          Left = 0
          Top = 0
          Width = 242
          Height = 163
          Align = alClient
          DataSource = DM.DataSource4
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'sch_date'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'quantity'
              Width = 89
              Visible = True
            end>
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 449
        Height = 347
        Align = alLeft
        Color = cl3DLight
        DataSource = DM.DataSource2
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CATEGORY_DESC'
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
            Width = 59
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tvalue'
            Width = 156
            Visible = True
          end>
      end
    end
  end
end
