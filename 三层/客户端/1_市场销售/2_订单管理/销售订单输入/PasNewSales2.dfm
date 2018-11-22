inherited frmNewSales2: TfrmNewSales2
  Caption = #38144#21806#23450#21333#36755#20837
  ClientHeight = 577
  ClientWidth = 724
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 732
  ExplicitHeight = 604
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 724
    Height = 577
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 724
    ExplicitHeight = 577
    inherited pnl1: TPanel
      Width = 722
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 722
      inherited btnSave: TBitBtn
        Enabled = False
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 722
      Height = 542
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 722
      ExplicitHeight = 542
      object StringGrid1: TStringGrid
        Left = 1
        Top = 429
        Width = 720
        Height = 112
        Align = alBottom
        ColCount = 30
        FixedCols = 0
        RowCount = 2
        PopupMenu = PopupMenu1
        ScrollBars = ssNone
        TabOrder = 1
        OnMouseDown = StringGrid1MouseDown
        ColWidths = (
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64)
      end
      object PageControl1: TPageControl
        Left = 1
        Top = 1
        Width = 720
        Height = 428
        ActivePage = TabSheet1
        Align = alClient
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = #19968#33324#20449#24687
          object Label13: TLabel
            Left = 43
            Top = 10
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = #24037#21378#20195#30721':'
          end
          object Label11: TLabel
            Left = 67
            Top = 33
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = #23458#25143':'
          end
          object Label68: TLabel
            Left = 31
            Top = 56
            Width = 64
            Height = 13
            Caption = #20851#32852#21407#23458#25143':'
          end
          object Label12: TLabel
            Left = 43
            Top = 79
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = #26412#21378#32534#21495':'
          end
          object Label14: TLabel
            Left = 14
            Top = 146
            Width = 81
            Height = 13
            Alignment = taRightJustify
            Caption = ' '#23458#25143#35746#21333#21495'PO:'
          end
          object Label15: TLabel
            Left = 29
            Top = 171
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'PO'#25910#21040#26085#26399':'
          end
          object Label23: TLabel
            Left = 55
            Top = 196
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = #21512#21516#21495':'
          end
          object Label16: TLabel
            Left = 31
            Top = 220
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = #23458#25143#32852#32476#20154':'
          end
          object Label17: TLabel
            Left = 67
            Top = 244
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = #36135#24065':'
          end
          object Label19: TLabel
            Left = 43
            Top = 269
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = #35013#36816#22320#28857':'
          end
          object Label21: TLabel
            Left = 43
            Top = 294
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = #35013#36816#26041#27861':'
          end
          object Label20: TLabel
            Left = 31
            Top = 320
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = #35013#36816#32852#32476#20154':'
          end
          object Label58: TLabel
            Left = 43
            Top = 348
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = #35746#21333#31867#22411':'
          end
          object Label54: TLabel
            Left = -5
            Top = 370
            Width = 100
            Height = 13
            Alignment = taRightJustify
            Caption = '    '#22806#21457#25351#23450#20379#24212#21830':'
          end
          object Label57: TLabel
            Left = 221
            Top = 346
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = #35746#21333#26032#26087':'
          end
          object Label22: TLabel
            Left = 254
            Top = 320
            Width = 88
            Height = 13
            Alignment = taRightJustify
            Caption = #35013#36816#32852#32476#20154#30005#35805':'
          end
          object Label56: TLabel
            Left = 365
            Top = 347
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = #21152#24037#24418#24335':'
          end
          object Label53: TLabel
            Left = 488
            Top = 317
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'SO'#36755#20837#26085#26399':'
          end
          object Label67: TLabel
            Left = 249
            Top = 171
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = #19994#21153#21592':'
          end
          object Label18: TLabel
            Left = 261
            Top = 244
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = #27719#29575':'
          end
          object Label55: TLabel
            Left = 241
            Top = 373
            Width = 12
            Height = 13
            Caption = '    '
          end
          object Label2: TLabel
            Left = 473
            Top = 374
            Width = 88
            Height = 13
            Caption = #20108#32500#30721#25171#21360#26684#24335':'
          end
          object Label4: TLabel
            Left = 212
            Top = 31
            Width = 75
            Height = 13
            Caption = '                         '
          end
          object CheckBox1: TCheckBox
            Left = 609
            Top = 346
            Width = 79
            Height = 17
            Caption = #36716#21378'('#20986#21475')'
            TabOrder = 26
          end
          object GroupBox4: TGroupBox
            Left = 477
            Top = 157
            Width = 207
            Height = 147
            Caption = #38468#21152#36164#35759
            TabOrder = 11
            object Label29: TLabel
              Left = 29
              Top = 19
              Width = 73
              Height = 13
              Alignment = taRightJustify
              Caption = '   '#29616#25345#26377#25968#37327':'
            end
            object Label30: TLabel
              Left = 26
              Top = 41
              Width = 76
              Height = 13
              Alignment = taRightJustify
              Caption = #24050#20998#37197#30340#25968#37327':'
            end
            object Label31: TLabel
              Left = 29
              Top = 64
              Width = 73
              Height = 13
              Alignment = taRightJustify
              Caption = '   '#21487#29992#30340#25968#37327':'
            end
            object Label32: TLabel
              Left = 50
              Top = 84
              Width = 52
              Height = 13
              Alignment = taRightJustify
              Caption = #27454#21040#21457#36135':'
            end
            object Label36: TLabel
              Left = 166
              Top = 84
              Width = 8
              Height = 13
              Alignment = taRightJustify
              Caption = 'Y'
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label38: TLabel
              Left = 111
              Top = 42
              Width = 6
              Height = 13
              Caption = '0'
            end
            object Label39: TLabel
              Left = 111
              Top = 64
              Width = 6
              Height = 13
              Caption = '0'
            end
            object Label7: TLabel
              Left = 26
              Top = 105
              Width = 76
              Height = 13
              Alignment = taRightJustify
              Caption = #35746#21333#38656#35201#35780#23457':'
            end
            object Label51: TLabel
              Left = 165
              Top = 105
              Width = 8
              Height = 13
              Caption = 'N'
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label65: TLabel
              Left = 50
              Top = 126
              Width = 52
              Height = 13
              Alignment = taRightJustify
              Caption = #20184#27454#26041#24335':'
            end
            object Label66: TLabel
              Left = 112
              Top = 125
              Width = 33
              Height = 13
              Caption = '           '
            end
            object Label3: TLabel
              Left = 111
              Top = 126
              Width = 33
              Height = 13
              Caption = '           '
            end
            object Edit14: TEdit
              Left = 111
              Top = 15
              Width = 84
              Height = 21
              TabStop = False
              Color = cl3DLight
              Enabled = False
              ReadOnly = True
              TabOrder = 0
            end
          end
          object GroupBox3: TGroupBox
            Left = 477
            Top = 4
            Width = 208
            Height = 145
            Caption = #20840#37096#21457#25918#21512#35745
            TabOrder = 1
            object Label24: TLabel
              Left = 24
              Top = 17
              Width = 71
              Height = 13
              Alignment = taRightJustify
              Caption = ' '#21333#20215#21512#35745'Pcs:'
            end
            object Label26: TLabel
              Left = 67
              Top = 52
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = #25240#25187':'
            end
            object Label27: TLabel
              Left = 43
              Top = 71
              Width = 52
              Height = 13
              Alignment = taRightJustify
              Caption = #29983#20135#24037#20855':'
            end
            object Label28: TLabel
              Left = 59
              Top = 108
              Width = 36
              Height = 13
              Alignment = taRightJustify
              Caption = #24635#35745':'
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label44: TLabel
              Left = 157
              Top = 17
              Width = 34
              Height = 13
              Alignment = taRightJustify
              Caption = '0.0000'
            end
            object Label46: TLabel
              Left = 163
              Top = 53
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = '0.000'
            end
            object Label47: TLabel
              Left = 157
              Top = 70
              Width = 34
              Height = 13
              Alignment = taRightJustify
              Caption = '0.0000'
            end
            object Label48: TLabel
              Left = 143
              Top = 106
              Width = 48
              Height = 13
              Alignment = taRightJustify
              Caption = '0.0000'
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label59: TLabel
              Left = 42
              Top = 127
              Width = 52
              Height = 13
              Alignment = taRightJustify
              Caption = #19979#21333#38754#31215':'
            end
            object Label60: TLabel
              Left = 157
              Top = 126
              Width = 34
              Height = 13
              Alignment = taRightJustify
              Caption = '0.0000'
            end
            object Label45: TLabel
              Left = 61
              Top = 34
              Width = 28
              Height = 13
              Caption = #31246#37329':'
            end
            object Label61: TLabel
              Left = 163
              Top = 34
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = '0.000'
            end
            object Label62: TLabel
              Left = 43
              Top = 89
              Width = 52
              Height = 13
              Alignment = taRightJustify
              Caption = #24037#20855#31246#37329':'
            end
            object Label63: TLabel
              Left = 157
              Top = 89
              Width = 34
              Height = 13
              Alignment = taRightJustify
              Caption = '0.0000'
            end
          end
          object RadioGroup1: TRadioGroup
            Left = 419
            Top = 336
            Width = 180
            Height = 32
            Columns = 3
            ItemIndex = 0
            Items.Strings = (
              #33258#21046
              #22806#21457
              #21322#21046#31243)
            TabOrder = 23
            OnClick = RadioGroup1Click
          end
          object ComboBox3: TComboBox
            Left = 278
            Top = 343
            Width = 68
            Height = 21
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 25
            Text = #26032#21333
            Items.Strings = (
              #26032#21333
              #36820#21333
              #26679#26495#36716#29983#20135
              #36820#21333#26377#25913)
          end
          object ComboBox2: TComboBox
            Left = 100
            Top = 342
            Width = 106
            Height = 21
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 24
            Text = #27491#24335#35746#21333
            Items.Strings = (
              #27491#24335#35746#21333
              #22791#21697#35746#21333)
          end
          object redt2: TRKeyRzBtnEdit
            Left = 100
            Top = 3
            Width = 106
            Height = 21
            Text = ''
            TabOrder = 0
            ButtonKind = bkFind
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'SHIP_REG_TAX_ID'
            DispalyTableName = 'data0015'
            DisplaytextField = 'WAREHOUSE_CODE'
            DisplayRetKeyField = 'Rkey'
            DisplayNoteField = 'WAREHOUSE_Name'
            DisplayPickID = '0'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit2: TRKeyRzBtnEdit
            Left = 100
            Top = 52
            Width = 298
            Height = 21
            Text = ''
            TabOrder = 4
            ButtonKind = bkFind
            AltBtnWidth = 15
            ButtonWidth = 15
            OnButtonClick = RKeyRzBtnEdit2ButtonClick
            DataSource = ds60
            DataSourceField = 'ORIG_CUSTOMER'
            DispalyTableName = 'data0010'
            DisplaytextField = 'ABBR_NAME'
            DisplayPickID = '2'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit3: TRKeyRzBtnEdit
            Left = 100
            Top = 75
            Width = 298
            Height = 21
            Text = ''
            TabOrder = 6
            OnExit = RKeyRzBtnEdit3Exit
            OnKeyPress = RKeyRzBtnEdit3KeyPress
            ButtonKind = bkFind
            AltBtnWidth = 15
            ButtonWidth = 15
            OnButtonClick = RKeyRzBtnEdit3ButtonClick
            DataSource = ds60
            DataSourceField = 'CUST_PART_PTR'
            DispalyTableName = 'data0025'
            DisplaytextField = 'manu_part_number'
            DisplayRetKeyField = 'rkey'
            DisplayPickID = '3'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit5: TRKeyRzBtnEdit
            Left = 101
            Top = 169
            Width = 106
            Height = 21
            Text = ''
            TabOrder = 12
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit6: TRKeyRzBtnEdit
            Left = 101
            Top = 192
            Width = 298
            Height = 21
            Text = ''
            TabOrder = 14
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'FOB'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit8: TRKeyRzBtnEdit
            Left = 101
            Top = 239
            Width = 76
            Height = 21
            Text = ''
            Color = clBtnFace
            Enabled = False
            TabOrder = 16
            ButtonKind = bkFind
            AltBtnWidth = 15
            ButtonWidth = 15
            OnButtonClick = RKeyRzBtnEdit8ButtonClick
            DataSource = ds60
            DataSourceField = 'CURRENCY_PTR'
            DispalyTableName = 'data0001'
            DisplaytextField = 'curr_code'
            DisplayRetKeyField = 'Rkey'
            DisplayNoteField = 'curr_name'
            DisplayPickID = '5'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit9: TRKeyRzBtnEdit
            Left = 295
            Top = 239
            Width = 106
            Height = 21
            Text = ''
            TabOrder = 17
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'EXCH_RATE'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit10: TRKeyRzBtnEdit
            Left = 101
            Top = 266
            Width = 298
            Height = 21
            Text = ''
            Color = clBtnFace
            Enabled = False
            TabOrder = 18
            ButtonKind = bkFind
            AltBtnWidth = 15
            ButtonWidth = 15
            OnButtonClick = RKeyRzBtnEdit10ButtonClick
            DataSource = ds60
            DataSourceField = 'CUST_SHIP_ADDR_PTR'
            DispalyTableName = 'data0012'
            DisplaytextField = 'location'
            DisplayRetKeyField = 'rkey'
            DisplayPickID = '6'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit11: TRKeyRzBtnEdit
            Left = 101
            Top = 291
            Width = 298
            Height = 21
            Text = ''
            Color = clBtnFace
            Enabled = False
            TabOrder = 19
            ButtonKind = bkFind
            AltBtnWidth = 15
            ButtonWidth = 15
            OnButtonClick = RKeyRzBtnEdit11ButtonClick
            DataSource = ds60
            DataSourceField = 'SHIPPING_METHOD'
            DispalyTableName = 'data0370'
            DisplaytextField = 'description'
            DisplayPickID = '7'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit12: TRKeyRzBtnEdit
            Left = 101
            Top = 316
            Width = 106
            Height = 21
            Text = ''
            TabOrder = 21
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'SHIPPING_CONTACT'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit13: TRKeyRzBtnEdit
            Left = 343
            Top = 316
            Width = 106
            Height = 21
            Text = ''
            TabOrder = 22
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'SHIP_CONTACT_PHONE'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit14: TRKeyRzBtnEdit
            Left = 560
            Top = 315
            Width = 124
            Height = 21
            Text = ''
            TabOrder = 20
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'ENT_DATE'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object BitBtn12: TBitBtn
            Left = 397
            Top = 73
            Width = 64
            Height = 25
            Caption = #39044#22788#29702
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
              333333777777777F33333330B00000003333337F7777777F3333333000000000
              333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
              333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
              03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
              03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
              3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
              333333333377F7F33333333333330F03333333333337F7F33333333333330B03
              3333333333373733333333333333303333333333333373333333}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            TabStop = False
            OnClick = BitBtn12Click
          end
          object RKeyRzBtnEdit15: TRKeyRzBtnEdit
            Left = 100
            Top = 368
            Width = 106
            Height = 21
            Text = ''
            Color = clBtnFace
            Enabled = False
            TabOrder = 27
            ButtonKind = bkFind
            AltBtnWidth = 15
            ButtonWidth = 15
            OnButtonClick = RKeyRzBtnEdit15ButtonClick
            DataSource = ds60
            DataSourceField = 'supplier_ptr'
            DispalyTableName = 'data0023'
            DisplaytextField = 'CODE'
            DisplayRetKeyField = 'Rkey'
            DisplayNoteField = 'SUPPLIER_NAME'
            DisplayPickID = '8'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit16: TRKeyRzBtnEdit
            Left = 560
            Top = 370
            Width = 124
            Height = 21
            Text = ''
            Color = clBtnFace
            Enabled = False
            TabOrder = 28
            ButtonKind = bkFind
            AltBtnWidth = 15
            ButtonWidth = 15
            OnButtonClick = RKeyRzBtnEdit16ButtonClick
            DataSource = ds60
            DataSourceField = 'Print2DKey'
            DisplayPickID = '9'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit17: TRKeyRzBtnEdit
            Left = 100
            Top = 95
            Width = 298
            Height = 21
            Text = ''
            Color = clBtnFace
            Ctl3D = True
            Enabled = False
            FrameStyle = fsNone
            FrameVisible = True
            ParentCtl3D = False
            ReadOnly = True
            ReadOnlyColor = clInactiveBorder
            TabOrder = 7
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'CUST_PART_PTR'
            DispalyTableName = 'data0025'
            DisplaytextField = 'MANU_PART_DESC'
            DisplayRetKeyField = 'rkey'
            DisplayPickID = '3'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit18: TRKeyRzBtnEdit
            Left = 100
            Top = 116
            Width = 298
            Height = 21
            Text = ''
            Color = clBtnFace
            Ctl3D = True
            Enabled = False
            FrameStyle = fsNone
            FrameVisible = True
            ParentCtl3D = False
            ReadOnly = True
            ReadOnlyColor = clInactiveCaption
            TabOrder = 8
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'CUST_PART_PTR'
            DispalyTableName = 'data0025'
            DisplaytextField = 'ANALYSIS_CODE_2'
            DisplayRetKeyField = 'rkey'
            DisplayPickID = '3'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit19: TRKeyRzBtnEdit
            Left = 292
            Top = 169
            Width = 106
            Height = 21
            Text = ''
            Color = clMenuBar
            ReadOnly = True
            ReadOnlyColor = clMenuBar
            TabOrder = 13
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DisplayModID = 72
            ForceOnFocus = True
          end
          object ComboBox1: TComboBox
            Left = 100
            Top = 215
            Width = 111
            Height = 21
            Style = csDropDownList
            TabOrder = 15
          end
          object BitBtn3: TBitBtn
            Tag = 1
            Left = 372
            Top = 140
            Width = 26
            Height = 25
            Enabled = False
            Glyph.Data = {
              EE000000424DEE000000000000007600000028000000100000000F0000000100
              04000000000078000000130B0000130B00001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              888800000888880000080F000888880F00080F000888880F0008000000080000
              000800F000000F00000800F000800F00000800F000800F000008800000000000
              0088880F00080F000888880000080000088888800088800088888880F08880F0
              888888800088800088888888888888888888}
            TabOrder = 9
            OnClick = BitBtn3Click
          end
          object Edit1: TEdit
            Left = 101
            Top = 143
            Width = 272
            Height = 21
            TabOrder = 10
            OnExit = Edit1Exit
          end
          object Edit2: TEdit
            Left = 100
            Top = 28
            Width = 80
            Height = 21
            TabOrder = 3
            OnExit = Edit2Exit
          end
          object BitBtn1: TBitBtn
            Tag = 1
            Left = 180
            Top = 25
            Width = 26
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
            TabOrder = 2
            OnClick = BitBtn1Click
          end
        end
        object TabSheet2: TTabSheet
          Caption = #21152#24037#25351#31034
          ImageIndex = 1
          object Label5: TLabel
            Left = 39
            Top = 13
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = #22686#20540#31246#20195#30721':'
          end
          object Label10: TLabel
            Left = 75
            Top = 36
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = #31246#29575':'
          end
          object Label52: TLabel
            Left = 48
            Top = 66
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = ' '#24037#31243#22791#27880':'
          end
          object Label37: TLabel
            Left = 48
            Top = 171
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = ' '#21152#24037#25351#31034':'
          end
          object Label1: TLabel
            Left = 12
            Top = 301
            Width = 91
            Height = 13
            Alignment = taRightJustify
            Caption = ' '#38144#21806#35746#21333#35760#20107#26412':'
          end
          object Edit18: TEdit
            Left = 109
            Top = 9
            Width = 81
            Height = 21
            Color = cl3DLight
            Enabled = False
            ReadOnly = True
            TabOrder = 1
          end
          object Edit19: TEdit
            Left = 109
            Top = 33
            Width = 81
            Height = 21
            Color = cl3DLight
            Enabled = False
            ReadOnly = True
            TabOrder = 2
          end
          object RadioGroup2: TRadioGroup
            Left = 204
            Top = 0
            Width = 185
            Height = 56
            Caption = #35746#21333#20215#26684#31867#21035#32422#23450#65306
            Enabled = False
            Items.Strings = (
              #19981#21547#31246#20215
              #21547#31246#20215)
            TabOrder = 0
          end
          object Memo2: TMemo
            Left = 109
            Top = 63
            Width = 521
            Height = 101
            ImeMode = imChinese
            MaxLength = 800
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 3
          end
          object Memo1: TMemo
            Left = 109
            Top = 170
            Width = 521
            Height = 122
            ImeMode = imChinese
            MaxLength = 800
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 4
          end
          object Memo3: TMemo
            Left = 109
            Top = 298
            Width = 521
            Height = 79
            ImeMode = imChinese
            MaxLength = 800
            ScrollBars = ssVertical
            TabOrder = 5
          end
        end
        object TabSheet3: TTabSheet
          Caption = #21512#21516#35780#23457#20869#23481
          ImageIndex = 2
          object DBGridEh1: TDBGridEh
            Left = 0
            Top = 0
            Width = 712
            Height = 400
            Align = alClient
            DataSource = ds89
            DynProps = <>
            ReadOnly = True
            TabOrder = 0
            Columns = <
              item
                Color = cl3DLight
                DynProps = <>
                EditButtons = <>
                FieldName = 'parameter_name'
                Footers = <>
                Title.Caption = #21442#25968#20195#30721
                Width = 155
              end
              item
                Color = cl3DLight
                DynProps = <>
                EditButtons = <>
                FieldName = 'parameter_desc'
                Footers = <>
                Title.Caption = #21442#25968#25551#36848
                Width = 214
              end
              item
                Color = cl3DLight
                DynProps = <>
                EditButtons = <>
                FieldName = 'unit_name'
                Footers = <>
                Title.Caption = #21333#20301
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'tvalue'
                Footers = <>
                Title.Caption = #21442#25968#20540
                Width = 249
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
        end
      end
    end
  end
  object cds192: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 496
    Top = 8
  end
  object cds60: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 8
  end
  object cds62: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    Left = 552
    Top = 8
  end
  object cds89: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 440
    Top = 8
  end
  object ds60: TDataSource
    DataSet = cds60
    Left = 320
    Top = 8
  end
  object ds89: TDataSource
    DataSet = cds89
    Left = 392
    Top = 8
  end
  object PopupMenu1: TPopupMenu
    Left = 80
    Top = 464
    object add_sin: TMenuItem
      Caption = #24314#31435#21333#26465'SO'
      OnClick = add_sinClick
    end
    object add_mul: TMenuItem
      Caption = #24314#31435#22810#26465'SO'
      OnClick = add_mulClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object edit_so: TMenuItem
      Caption = #32534#36753#38144#21806#23450#21333
      OnClick = edit_soClick
    end
    object del_so: TMenuItem
      Caption = #21024#38500#38144#21806#23450#21333
      OnClick = del_soClick
    end
  end
  object cds360: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 616
    Top = 8
  end
  object cds213: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 664
    Top = 8
  end
  object cds04: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 264
    Top = 64
  end
  object cds25: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 64
  end
  object cds97: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 360
    Top = 64
  end
  object cds10: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 408
    Top = 64
  end
end
