inherited frmEdit_so: TfrmEdit_so
  Caption = #32534#36753#38144#21806#35746#21333
  ClientHeight = 429
  ClientWidth = 715
  OnClose = FormClose
  ExplicitWidth = 723
  ExplicitHeight = 456
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 715
    Height = 429
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 715
    ExplicitHeight = 429
    inherited pnl1: TPanel
      Width = 713
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 713
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 713
      Height = 394
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 713
      ExplicitHeight = 394
      object PageControl1: TPageControl
        Left = 1
        Top = 1
        Width = 711
        Height = 392
        ActivePage = TabSheet1
        Align = alClient
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = #19968#33324#20449#24687
          object Label1: TLabel
            Left = 73
            Top = 7
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = #38144#21806#23450#21333':'
          end
          object Label11: TLabel
            Left = 97
            Top = 55
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = #23458#25143':'
          end
          object Label12: TLabel
            Left = 73
            Top = 106
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = #26412#21378#32534#21495':'
          end
          object Label14: TLabel
            Left = 47
            Top = 169
            Width = 78
            Height = 13
            Alignment = taRightJustify
            Caption = #23458#25143#35746#21333#21495'PO:'
          end
          object Label15: TLabel
            Left = 488
            Top = 178
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'PO'#25910#21040#26085#26399':'
          end
          object Label16: TLabel
            Left = 60
            Top = 224
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = #23458#25143#32852#32476#20154':'
          end
          object Label17: TLabel
            Left = 97
            Top = 250
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = #36135#24065':'
          end
          object Label18: TLabel
            Left = 301
            Top = 250
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = #27719#29575':'
          end
          object Label2: TLabel
            Left = 73
            Top = 276
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = #27454#21040#21457#36135':'
          end
          object Label29: TLabel
            Left = 490
            Top = 79
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = #29616#25345#26377#25968#37327':'
          end
          object Label30: TLabel
            Left = 478
            Top = 106
            Width = 76
            Height = 13
            Alignment = taRightJustify
            Caption = #24050#20998#37197#30340#25968#37327':'
          end
          object Label31: TLabel
            Left = 490
            Top = 129
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = #21487#29992#30340#25968#37327':'
          end
          object Label80: TLabel
            Left = 488
            Top = 307
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'SO'#36755#20837#26085#26399':'
          end
          object Label3: TLabel
            Left = 37
            Top = 337
            Width = 88
            Height = 13
            Alignment = taRightJustify
            Caption = #22806#21457#25351#23450#20379#24212#21830':'
          end
          object Label85: TLabel
            Left = 576
            Top = 100
            Width = 3
            Height = 13
            Alignment = taRightJustify
          end
          object Label86: TLabel
            Left = 502
            Top = 253
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = #36755#20837#20154#21592':'
          end
          object Label87: TLabel
            Left = 502
            Top = 279
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = #30830#35748#20154#21592':'
          end
          object Label91: TLabel
            Left = 529
            Top = 53
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = #35746#21333#26032#26087':'
          end
          object Label13: TLabel
            Left = 73
            Top = 30
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = #24037#21378#20195#30721':'
          end
          object Label75: TLabel
            Left = 277
            Top = 276
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = #20184#27454#26041#24335':'
          end
          object Label93: TLabel
            Left = 490
            Top = 154
            Width = 64
            Height = 13
            Caption = #21487#20986#36135#25968#37327':'
          end
          object Label101: TLabel
            Left = 513
            Top = 229
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = #19994#21153#21592':'
          end
          object Label102: TLabel
            Left = 61
            Top = 80
            Width = 64
            Height = 13
            Caption = #20851#32852#21407#23458#25143':'
          end
          object Label103: TLabel
            Left = 73
            Top = 198
            Width = 52
            Height = 13
            Caption = #20135#21697#38454#25968':'
          end
          object Label105: TLabel
            Left = 465
            Top = 203
            Width = 88
            Height = 13
            Caption = #20108#32500#30721#25171#21360#26684#24335':'
          end
          object DBRadioGroup1: TDBRadioGroup
            Left = 48
            Top = 295
            Width = 183
            Height = 36
            Caption = #21152#24037#24418#24335
            Columns = 3
            DataField = 'so_tp'
            DataSource = ds60
            Items.Strings = (
              #33258#21046
              #22806#21457
              #21322#21046#31243)
            TabOrder = 0
            Values.Strings = (
              '0'
              '1'
              '2')
            OnClick = DBRadioGroup1Click
          end
          object DBRadioGroup2: TDBRadioGroup
            Left = 556
            Top = 9
            Width = 118
            Height = 35
            Caption = #35746#21333#31867#22411
            Columns = 2
            DataField = 'so_style'
            DataSource = ds60
            Items.Strings = (
              #27491#24335
              #22791#21697)
            TabOrder = 1
            Values.Strings = (
              '0'
              '1')
          end
          object DBComboBox2: TDBComboBox
            Left = 584
            Top = 50
            Width = 90
            Height = 21
            Style = csDropDownList
            DataField = 'SO_OLDNEW'
            DataSource = ds60
            Items.Strings = (
              #26032#21333
              #36820#21333
              #26679#26495#36716#29983#20135
              #36820#21333#26377#25913)
            TabOrder = 2
          end
          object DBCheckBox1: TDBCheckBox
            Left = 339
            Top = 304
            Width = 82
            Height = 17
            Caption = #36716#21378'('#20986#21475')'
            DataField = 'COMMISION_ON_TOOLING'
            DataSource = ds60
            Enabled = False
            TabOrder = 3
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
          end
          object RKeyRzBtnEdit1: TRKeyRzBtnEdit
            Left = 125
            Top = 27
            Width = 106
            Height = 21
            Text = ''
            TabOrder = 4
            ButtonKind = bkFind
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'SHIP_REG_TAX_ID'
            DispalyTableName = 'data0015'
            DisplaytextField = 'WAREHOUSE_CODE'
            DisplayRetKeyField = 'Rkey'
            DisplayNoteField = 'WAREHOUSE_NAME'
            DisplayPickID = '0'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit2: TRKeyRzBtnEdit
            Left = 125
            Top = 52
            Width = 106
            Height = 21
            Text = ''
            Color = clBtnFace
            Enabled = False
            TabOrder = 5
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'CUSTOMER_PTR'
            DispalyTableName = 'data0010'
            DisplaytextField = 'CUST_CODE'
            DisplayRetKeyField = 'Rkey'
            DisplayNoteField = 'CUSTOMER_NAME'
            DisplayPickID = '1'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit4: TRKeyRzBtnEdit
            Left = 125
            Top = 77
            Width = 298
            Height = 21
            Text = ''
            TabOrder = 6
            ButtonKind = bkFind
            AltBtnWidth = 15
            ButtonWidth = 15
            OnButtonClick = RKeyRzBtnEdit4ButtonClick
            DataSource = ds60
            DataSourceField = 'ORIG_CUSTOMER'
            DisplayPickID = '2'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object Edit1: TEdit
            Left = 124
            Top = 168
            Width = 272
            Height = 21
            TabOrder = 7
            OnExit = Edit1Exit
          end
          object BitBtn3: TBitBtn
            Tag = 1
            Left = 396
            Top = 167
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
            TabOrder = 8
          end
          object RKeyRzBtnEdit5: TRKeyRzBtnEdit
            Left = 125
            Top = 3
            Width = 106
            Height = 21
            Text = ''
            TabOrder = 9
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'SALES_ORDER'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit6: TRKeyRzBtnEdit
            Left = 124
            Top = 195
            Width = 298
            Height = 21
            Text = ''
            Color = clBtnFace
            Enabled = False
            TabOrder = 10
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'CPJS'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object ComboBox1: TComboBox
            Left = 124
            Top = 221
            Width = 106
            Height = 21
            Style = csDropDownList
            TabOrder = 11
          end
          object RKeyRzBtnEdit7: TRKeyRzBtnEdit
            Left = 125
            Top = 247
            Width = 60
            Height = 21
            Text = ''
            Color = clBtnFace
            Enabled = False
            TabOrder = 12
            ButtonKind = bkFind
            AltBtnWidth = 15
            ButtonWidth = 15
            OnButtonClick = RKeyRzBtnEdit7ButtonClick
            DataSource = ds60
            DataSourceField = 'CURRENCY_PTR'
            DispalyTableName = 'data0001'
            DisplaytextField = 'curr_code'
            DisplayRetKeyField = 'rkey'
            DisplayNoteField = 'curr_name'
            DisplayPickID = '5'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit8: TRKeyRzBtnEdit
            Left = 329
            Top = 247
            Width = 94
            Height = 21
            Text = ''
            Color = clBtnFace
            Enabled = False
            TabOrder = 13
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'EXCH_RATE'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit9: TRKeyRzBtnEdit
            Left = 125
            Top = 273
            Width = 60
            Height = 21
            Text = ''
            Color = clBtnFace
            Enabled = False
            TabOrder = 14
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'COD_FLAG'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit10: TRKeyRzBtnEdit
            Left = 329
            Top = 274
            Width = 94
            Height = 21
            Text = ''
            Color = clBtnFace
            Enabled = False
            TabOrder = 15
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'FED_TAX_ID_NO'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit11: TRKeyRzBtnEdit
            Left = 553
            Top = 76
            Width = 121
            Height = 21
            Text = ''
            Color = clBtnFace
            Enabled = False
            FocusColor = clInactiveCaption
            TabOrder = 16
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            FlatButtonColor = clBtnShadow
            DataSource = ds60
            DataSourceField = 'qty_on_hand'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit12: TRKeyRzBtnEdit
            Left = 553
            Top = 151
            Width = 72
            Height = 21
            Text = ''
            Color = clBtnFace
            Enabled = False
            FocusColor = clInactiveCaption
            TabOrder = 17
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            FlatButtonColor = clBtnShadow
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit13: TRKeyRzBtnEdit
            Left = 553
            Top = 101
            Width = 121
            Height = 21
            Text = ''
            Color = clBtnFace
            Enabled = False
            FocusColor = clInactiveCaption
            TabOrder = 18
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            FlatButtonColor = clBtnShadow
            DataSource = ds60
            DataSourceField = 'qty_alloc'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit14: TRKeyRzBtnEdit
            Left = 125
            Top = 335
            Width = 106
            Height = 21
            Text = ''
            Color = clBtnFace
            Enabled = False
            TabOrder = 19
            ButtonKind = bkFind
            AltBtnWidth = 15
            ButtonWidth = 15
            OnButtonClick = RKeyRzBtnEdit14ButtonClick
            DataSource = ds60
            DataSourceField = 'supplier_ptr'
            DispalyTableName = 'data0023'
            DisplaytextField = 'CODE'
            DisplayRetKeyField = 'rkey'
            DisplayNoteField = 'SUPPLIER_NAME'
            DisplayPickID = '8'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit15: TRKeyRzBtnEdit
            Left = 553
            Top = 126
            Width = 121
            Height = 21
            Text = ''
            Color = clBtnFace
            Enabled = False
            FocusColor = clInactiveCaption
            TabOrder = 20
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            FlatButtonColor = clBtnShadow
            DataSource = ds60
            DataSourceField = 'CanSL'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit16: TRKeyRzBtnEdit
            Left = 554
            Top = 176
            Width = 121
            Height = 21
            Text = ''
            TabOrder = 21
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'po_date'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit19: TRKeyRzBtnEdit
            Left = 553
            Top = 201
            Width = 121
            Height = 21
            Text = ''
            TabOrder = 22
            ButtonKind = bkFind
            AltBtnWidth = 15
            ButtonWidth = 15
            OnButtonClick = RKeyRzBtnEdit19ButtonClick
            DataSource = ds60
            DataSourceField = 'Print2DKey'
            DisplayPickID = '9'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit20: TRKeyRzBtnEdit
            Left = 553
            Top = 226
            Width = 121
            Height = 21
            Text = ''
            Color = clBtnFace
            Enabled = False
            FocusColor = clInactiveCaption
            TabOrder = 23
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            FlatButtonColor = clBtnShadow
            DataSource = ds60
            DataSourceField = 'D05_1EMPLOYEE_NAME'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit21: TRKeyRzBtnEdit
            Left = 553
            Top = 305
            Width = 123
            Height = 21
            Text = ''
            TabOrder = 24
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'ENT_DATE'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit22: TRKeyRzBtnEdit
            Left = 554
            Top = 251
            Width = 121
            Height = 21
            Text = ''
            Color = clBtnFace
            Enabled = False
            FocusColor = clInactiveCaption
            TabOrder = 25
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            FlatButtonColor = clBtnShadow
            DataSource = ds60
            DataSourceField = #36755#20837#20154#21592
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit23: TRKeyRzBtnEdit
            Left = 554
            Top = 278
            Width = 121
            Height = 21
            Text = ''
            Color = clBtnFace
            Enabled = False
            FocusColor = clInactiveCaption
            TabOrder = 26
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            FlatButtonColor = clBtnShadow
            DataSource = ds60
            DataSourceField = #36755#20837#20154#21592
            DisplayModID = 72
            ForceOnFocus = True
          end
          object BitBtn12: TBitBtn
            Left = 625
            Top = 149
            Width = 56
            Height = 24
            Caption = #39044#25910#26597#35810
            TabOrder = 27
            OnClick = BitBtn12Click
          end
          object Edit2: TEdit
            Left = 124
            Top = 101
            Width = 297
            Height = 21
            TabOrder = 28
            OnExit = Edit2Exit
          end
          object Edit3: TEdit
            Left = 124
            Top = 123
            Width = 297
            Height = 21
            Color = clScrollBar
            Enabled = False
            TabOrder = 29
            OnExit = Edit1Exit
          end
          object Edit4: TEdit
            Left = 124
            Top = 145
            Width = 297
            Height = 21
            Color = clScrollBar
            Enabled = False
            TabOrder = 30
            OnExit = Edit1Exit
          end
        end
        object TabSheet2: TTabSheet
          Caption = #35013#36816'/'#35780#23457#20449#24687
          ImageIndex = 1
          object Label19: TLabel
            Left = 110
            Top = 15
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = '    '#35013#36816#22320#28857':'
          end
          object Label20: TLabel
            Left = 98
            Top = 43
            Width = 76
            Height = 13
            Alignment = taRightJustify
            Caption = '    '#35013#36816#32852#32476#20154':'
          end
          object Label21: TLabel
            Left = 113
            Top = 101
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = '   '#35013#36816#26041#27861':'
          end
          object Label22: TLabel
            Left = 71
            Top = 71
            Width = 103
            Height = 13
            Alignment = taRightJustify
            Caption = '     '#35013#36816#32852#32476#20154#30005#35805':'
          end
          object Label23: TLabel
            Left = 131
            Top = 129
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = ' '#21512#21516#21495':'
          end
          object Label6: TLabel
            Left = 86
            Top = 188
            Width = 88
            Height = 13
            Alignment = taRightJustify
            Caption = #35780#23457#20449#24687#35760#20107#26412':'
          end
          object RKeyRzBtnEdit29: TRKeyRzBtnEdit
            Left = 174
            Top = 11
            Width = 298
            Height = 21
            Text = ''
            TabOrder = 0
            ButtonKind = bkFind
            AltBtnWidth = 15
            ButtonWidth = 15
            OnButtonClick = RKeyRzBtnEdit29ButtonClick
            DataSource = ds60
            DataSourceField = 'CUST_SHIP_ADDR_PTR'
            DispalyTableName = 'data0012'
            DisplaytextField = 'location'
            DisplayRetKeyField = 'rkey'
            DisplayPickID = '6'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit30: TRKeyRzBtnEdit
            Left = 174
            Top = 40
            Width = 298
            Height = 21
            Text = ''
            TabOrder = 1
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'SHIPPING_CONTACT'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit31: TRKeyRzBtnEdit
            Left = 174
            Top = 69
            Width = 298
            Height = 21
            Text = ''
            TabOrder = 2
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'SHIP_CONTACT_PHONE'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit32: TRKeyRzBtnEdit
            Left = 174
            Top = 98
            Width = 298
            Height = 21
            Text = ''
            TabOrder = 3
            ButtonKind = bkFind
            AltBtnWidth = 15
            ButtonWidth = 15
            OnButtonClick = RKeyRzBtnEdit32ButtonClick
            DataSource = ds60
            DataSourceField = 'SHIPPING_METHOD'
            DispalyTableName = 'data0370'
            DisplaytextField = 'description'
            DisplayPickID = '7'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit33: TRKeyRzBtnEdit
            Left = 175
            Top = 126
            Width = 298
            Height = 21
            Text = ''
            TabOrder = 4
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'FOB'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object DBMemo1: TDBMemo
            Left = 174
            Top = 185
            Width = 467
            Height = 160
            DataField = 'RemarkAudit'
            DataSource = ds60
            TabOrder = 5
          end
        end
        object TabSheet3: TTabSheet
          Caption = #21152#24037#25351#31034
          ImageIndex = 2
          object Label4: TLabel
            Left = 56
            Top = 63
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = ' '#24037#31243#22791#27880':'
          end
          object Label79: TLabel
            Left = 57
            Top = 166
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = ' '#21152#24037#25351#31034':'
          end
          object SpeedButton1: TSpeedButton
            Left = 570
            Top = 163
            Width = 48
            Height = 22
            Caption = #22797#21046
            Flat = True
          end
          object Label84: TLabel
            Left = 21
            Top = 270
            Width = 91
            Height = 13
            Alignment = taRightJustify
            Caption = ' '#38144#21806#35746#21333#35760#20107#26412':'
          end
          object Label5: TLabel
            Left = 47
            Top = 13
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = #22686#20540#31246#20195#30721':'
          end
          object Label10: TLabel
            Left = 83
            Top = 36
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = #31246#29575':'
          end
          object Memo1: TMemo
            Left = 117
            Top = 161
            Width = 449
            Height = 99
            ImeMode = imChinese
            MaxLength = 800
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object Memo2: TMemo
            Left = 117
            Top = 60
            Width = 449
            Height = 99
            ImeMode = imChinese
            MaxLength = 800
            ScrollBars = ssVertical
            TabOrder = 1
          end
          object RKeyRzBtnEdit41: TRKeyRzBtnEdit
            Left = 117
            Top = 8
            Width = 78
            Height = 21
            Text = ''
            Color = clBtnFace
            Enabled = False
            TabOrder = 2
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'state_id'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit42: TRKeyRzBtnEdit
            Left = 117
            Top = 33
            Width = 78
            Height = 21
            Text = ''
            Color = clBtnFace
            Enabled = False
            TabOrder = 3
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'RUSH_CHARGE'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object DBMemo2: TDBMemo
            Left = 117
            Top = 266
            Width = 449
            Height = 89
            DataField = 'RemarkSO'
            DataSource = ds60
            TabOrder = 4
          end
          object DBRadioGroup3: TDBRadioGroup
            Left = 215
            Top = 2
            Width = 143
            Height = 53
            Caption = #35746#21333#20215#26684#31867#21035#32422#23450
            DataField = 'TAX_IN_PRICE'
            DataSource = ds60
            Enabled = False
            Items.Strings = (
              #19981#21547#31246#20215
              #21547#31246#20215)
            TabOrder = 5
            Values.Strings = (
              'N'
              'Y')
          end
        end
        object TabSheet4: TTabSheet
          Caption = #35746#21333#20449#24687
          ImageIndex = 3
          object Bevel1: TBevel
            Left = 428
            Top = 27
            Width = 239
            Height = 45
            Shape = bsFrame
          end
          object Label26: TLabel
            Left = 83
            Top = 34
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = ' '#25968#37327'(Set):'
            Visible = False
          end
          object Label27: TLabel
            Left = 86
            Top = 34
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = ' '#25968#37327'(Pcs):'
          end
          object Label28: TLabel
            Left = 83
            Top = 94
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = ' '#20215#26684'(Pcs):'
          end
          object Label33: TLabel
            Left = 104
            Top = 122
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = '  '#25240#25187':'
          end
          object Label34: TLabel
            Left = 80
            Top = 150
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = '  '#20248#20808#39034#24207':'
          end
          object Label35: TLabel
            Left = 83
            Top = 199
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = ' '#23458#25143#20132#26399':'
          end
          object Label36: TLabel
            Left = 83
            Top = 228
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = ' '#35745#21010#20132#26399':'
          end
          object Label37: TLabel
            Left = 98
            Top = 259
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = '   '#21442#32771':'
          end
          object Bevel2: TBevel
            Left = 428
            Top = 76
            Width = 239
            Height = 135
            Shape = bsFrame
          end
          object Label38: TLabel
            Left = 447
            Top = 72
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = #21512#35745
          end
          object Label39: TLabel
            Left = 495
            Top = 87
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = '   '#20215#26684#24635#35745':'
          end
          object Label41: TLabel
            Left = 519
            Top = 121
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = '   '#25240#25187':'
          end
          object Label42: TLabel
            Left = 495
            Top = 141
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = '   '#29983#20135#24037#20855':'
          end
          object Label43: TLabel
            Left = 496
            Top = 174
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = '   '#21512#35745':'
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label44: TLabel
            Left = 597
            Top = 174
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
          object Label45: TLabel
            Left = 611
            Top = 139
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = '0.0000'
          end
          object Label46: TLabel
            Left = 617
            Top = 120
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = '0.000'
          end
          object Label48: TLabel
            Left = 611
            Top = 87
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = '0.0000'
          end
          object Label69: TLabel
            Left = 211
            Top = 123
            Width = 11
            Height = 13
            Caption = '%'
          end
          object Label76: TLabel
            Left = 504
            Top = 48
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = #25968#37327#21512#35745':'
          end
          object Label77: TLabel
            Left = 633
            Top = 47
            Width = 6
            Height = 13
            Alignment = taRightJustify
            Caption = '0'
          end
          object Label78: TLabel
            Left = 469
            Top = 21
            Width = 156
            Height = 13
            Alignment = taRightJustify
            Caption = #26412#20135#21697#22411#21495#37319#36141#35746#21333#25968#37327#21512#35745
          end
          object Label81: TLabel
            Left = 83
            Top = 64
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = ' '#20215#26684'(Set):'
            Visible = False
          end
          object Label82: TLabel
            Left = 67
            Top = 323
            Width = 67
            Height = 13
            Alignment = taRightJustify
            Caption = ' '#20986#36135#26495#26041#24335':'
          end
          object Label83: TLabel
            Left = 139
            Top = 323
            Width = 21
            Height = 13
            Caption = '       '
          end
          object Label9: TLabel
            Left = 240
            Top = 228
            Width = 58
            Height = 13
            Caption = '  '#22238#22797#20132#26399':'
          end
          object Label_qteptr: TLabel
            Left = 332
            Top = 92
            Width = 6
            Height = 13
            Caption = '0'
            Visible = False
          end
          object Label89: TLabel
            Left = 521
            Top = 193
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = '  '#38754#31215':'
          end
          object Label90: TLabel
            Left = 611
            Top = 193
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = '0.0000'
          end
          object Label40: TLabel
            Left = 523
            Top = 104
            Width = 28
            Height = 13
            Caption = #31246#37329':'
          end
          object Label47: TLabel
            Left = 617
            Top = 104
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = '0.000'
          end
          object Label68: TLabel
            Left = 504
            Top = 158
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = #24037#20855#31246#37329':'
          end
          object Label74: TLabel
            Left = 611
            Top = 156
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = '0.0000'
          end
          object Label94: TLabel
            Left = 61
            Top = 175
            Width = 76
            Height = 13
            Alignment = taRightJustify
            Caption = #21407#22987#23458#25143#20132#26399':'
          end
          object Label49: TLabel
            Left = 243
            Top = 40
            Width = 3
            Height = 13
          end
          object Label7: TLabel
            Left = 245
            Top = 123
            Width = 62
            Height = 13
            Caption = 'BOM'#25253#20215#21333':'
          end
          object GroupBox3: TGroupBox
            Left = 428
            Top = 213
            Width = 239
            Height = 98
            Hint = '* '#26410#32467#31639#24635#39069#26410#21253#21547#26412#38144#21806#35746#21333
            Caption = ' '#23458#25143#20449#29992#39069#24230#20449#24687
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            object Label95: TLabel
              Left = 35
              Top = 23
              Width = 52
              Height = 13
              Alignment = taRightJustify
              Caption = #20449#29992#31561#32423':'
            end
            object Label96: TLabel
              Left = 35
              Top = 47
              Width = 52
              Height = 13
              Alignment = taRightJustify
              Caption = #20449#29992#38480#39069':'
            end
            object Label97: TLabel
              Left = 23
              Top = 71
              Width = 64
              Height = 13
              Alignment = taRightJustify
              Caption = #26410#32467#31639#24635#39069':'
            end
            object Label98: TLabel
              Left = 203
              Top = 23
              Width = 12
              Height = 13
              Alignment = taRightJustify
              Caption = #26080
            end
            object Label99: TLabel
              Left = 181
              Top = 47
              Width = 34
              Height = 13
              Alignment = taRightJustify
              Caption = '0.0000'
            end
            object Label100: TLabel
              Left = 181
              Top = 71
              Width = 34
              Height = 13
              Alignment = taRightJustify
              Caption = '0.0000'
            end
          end
          object MaskEdit1: TMaskEdit
            Left = 140
            Top = 196
            Width = 84
            Height = 21
            EditMask = '!0000-!90-90;1;_'
            MaxLength = 10
            TabOrder = 1
            Text = '    -  -  '
          end
          object MaskEdit2: TMaskEdit
            Left = 140
            Top = 225
            Width = 84
            Height = 21
            EditMask = '!0000-!90-90;1;_'
            MaxLength = 10
            TabOrder = 2
            Text = '    -  -  '
          end
          object BitBtn5: TBitBtn
            Left = 245
            Top = 92
            Width = 74
            Height = 25
            Caption = #21382#21490#20215#26684
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
            TabOrder = 3
            TabStop = False
            OnClick = BitBtn5Click
          end
          object Edit10: TEdit
            Left = 245
            Top = 142
            Width = 146
            Height = 21
            Color = cl3DLight
            ReadOnly = True
            TabOrder = 4
          end
          object MaskEdit4: TMaskEdit
            Left = 140
            Top = 172
            Width = 84
            Height = 21
            EditMask = '!0000-!90-90;1;_'
            MaxLength = 10
            TabOrder = 0
            Text = '    -  -  '
          end
          object BitBtn13: TBitBtn
            Left = 322
            Top = 92
            Width = 69
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
            TabOrder = 6
            TabStop = False
            OnClick = BitBtn13Click
          end
          object ComboBox3: TComboBox
            Left = 140
            Top = 146
            Width = 84
            Height = 21
            Style = csDropDownList
            TabOrder = 7
          end
          object RKeyRzBtnEdit34: TRKeyRzBtnEdit
            Left = 140
            Top = 30
            Width = 84
            Height = 21
            Text = ''
            TabOrder = 8
            OnExit = RKeyRzBtnEdit34Exit
            OnKeyPress = RKeyRzBtnEdit34KeyPress
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'SET_ORDERED'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit35: TRKeyRzBtnEdit
            Left = 140
            Top = 30
            Width = 84
            Height = 21
            Text = ''
            TabOrder = 9
            OnExit = RKeyRzBtnEdit35Exit
            OnKeyPress = RKeyRzBtnEdit34KeyPress
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'PARTS_ORDERED'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit36: TRKeyRzBtnEdit
            Left = 140
            Top = 61
            Width = 84
            Height = 21
            Text = ''
            TabOrder = 10
            Visible = False
            OnExit = RKeyRzBtnEdit36Exit
            OnKeyPress = RKeyRzBtnEdit37KeyPress
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'SET_PRICE'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit37: TRKeyRzBtnEdit
            Left = 140
            Top = 92
            Width = 84
            Height = 21
            Text = ''
            TabOrder = 11
            OnExit = RKeyRzBtnEdit35Exit
            OnKeyPress = RKeyRzBtnEdit37KeyPress
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'PART_PRICE'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit38: TRKeyRzBtnEdit
            Left = 140
            Top = 119
            Width = 66
            Height = 21
            Text = ''
            TabOrder = 12
            OnExit = RKeyRzBtnEdit38Exit
            OnKeyPress = RKeyRzBtnEdit37KeyPress
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'DISCOUNT'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit39: TRKeyRzBtnEdit
            Left = 299
            Top = 225
            Width = 92
            Height = 21
            Text = ''
            Color = clBtnFace
            Enabled = False
            TabOrder = 13
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'SCH_DATE'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit40: TRKeyRzBtnEdit
            Left = 136
            Top = 257
            Width = 259
            Height = 21
            Text = ''
            TabOrder = 14
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'REFERENCE_NUMBER'
            DisplayModID = 72
            ForceOnFocus = True
          end
        end
        object TabSheet5: TTabSheet
          Caption = #29983#20135#24037#20855#36153#29992
          ImageIndex = 4
          OnExit = TabSheet5Exit
          object StringGrid1: TStringGrid
            Left = 0
            Top = 0
            Width = 703
            Height = 297
            Align = alTop
            ColCount = 6
            Ctl3D = False
            DefaultRowHeight = 20
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
            ParentCtl3D = False
            TabOrder = 1
            OnDrawCell = StringGrid1DrawCell
            OnExit = StringGrid1Exit
            OnKeyPress = StringGrid1KeyPress
            OnSelectCell = StringGrid1SelectCell
            ColWidths = (
              306
              104
              93
              89
              64
              64)
            RowHeights = (
              20
              20)
          end
          object ComboBox2: TComboBox
            Left = 595
            Top = 22
            Width = 67
            Height = 21
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 0
            Text = 'Y'
            OnChange = ComboBox2Change
            Items.Strings = (
              'Y'
              'N')
          end
        end
        object TabSheet6: TTabSheet
          Caption = #20998#26512#20195#30721
          ImageIndex = 5
          object Label53: TLabel
            Left = 166
            Top = 191
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = '   '#20998#26512#20195#30721'1'
          end
          object Label54: TLabel
            Left = 165
            Top = 221
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = '   '#20998#26512#20195#30721'2'
          end
          object Label55: TLabel
            Left = 165
            Top = 252
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = '   '#20998#26512#20195#30721'3'
          end
          object Label56: TLabel
            Left = 165
            Top = 282
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = '   '#20998#26512#20195#30721'4'
          end
          object Label57: TLabel
            Left = 165
            Top = 313
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = '   '#20998#26512#20195#30721'5'
          end
          object StringGrid2: TStringGrid
            Left = 3
            Top = 13
            Width = 673
            Height = 159
            DefaultRowHeight = 20
            FixedCols = 0
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goRowSelect]
            ScrollBars = ssNone
            TabOrder = 0
            Visible = False
            ColWidths = (
              64
              430
              87
              84
              64)
          end
          object DBGrid6: TDBGrid
            Left = 3
            Top = 13
            Width = 673
            Height = 159
            Align = alCustom
            DataSource = ds360
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
                Width = 149
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'quantity'
                Title.Caption = #23436#24037#25968#37327
                Width = 154
                Visible = True
              end>
          end
          object RKeyRzBtnEdit24: TRKeyRzBtnEdit
            Left = 232
            Top = 187
            Width = 242
            Height = 21
            Text = ''
            TabOrder = 2
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'ANALYSIS_CODE_1'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit25: TRKeyRzBtnEdit
            Left = 232
            Top = 218
            Width = 242
            Height = 21
            Text = ''
            TabOrder = 3
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'ANALYSIS_CODE_2'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit26: TRKeyRzBtnEdit
            Left = 232
            Top = 249
            Width = 242
            Height = 21
            Text = ''
            TabOrder = 4
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'ANALYSIS_CODE_3'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit27: TRKeyRzBtnEdit
            Left = 232
            Top = 281
            Width = 242
            Height = 21
            Text = ''
            TabOrder = 5
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'ANALYSIS_CODE_4'
            DisplayModID = 72
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit28: TRKeyRzBtnEdit
            Left = 232
            Top = 311
            Width = 242
            Height = 21
            Text = ''
            TabOrder = 6
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'ANALYSIS_CODE_5'
            DisplayModID = 72
            ForceOnFocus = True
          end
        end
        object TabSheet7: TTabSheet
          Caption = 'ECN '#36164#35759
          ImageIndex = 6
          object Label88: TLabel
            Left = 7
            Top = 100
            Width = 81
            Height = 13
            Alignment = taRightJustify
            Caption = '   '#35746#21333#20462#35746#35760#24405
          end
          object GroupBox1: TGroupBox
            Left = 56
            Top = 12
            Width = 185
            Height = 70
            Caption = #23458#25143' ECN'
            TabOrder = 0
            object Label58: TLabel
              Left = 28
              Top = 20
              Width = 40
              Height = 13
              Alignment = taRightJustify
              Caption = #20869#37096#30340':'
            end
            object Label59: TLabel
              Left = 28
              Top = 41
              Width = 40
              Height = 13
              Alignment = taRightJustify
              Caption = #22806#37096#30340':'
            end
            object Label60: TLabel
              Left = 80
              Top = 21
              Width = 15
              Height = 13
              Alignment = taRightJustify
              Caption = '     '
            end
            object Label61: TLabel
              Left = 80
              Top = 42
              Width = 15
              Height = 13
              Alignment = taRightJustify
              Caption = '     '
            end
          end
          object GroupBox2: TGroupBox
            Left = 272
            Top = 12
            Width = 185
            Height = 70
            Caption = #23458#25143#37096#21697' ECN'
            TabOrder = 1
            object Label62: TLabel
              Left = 28
              Top = 20
              Width = 40
              Height = 13
              Alignment = taRightJustify
              Caption = #20869#37096#30340':'
            end
            object Label63: TLabel
              Left = 28
              Top = 41
              Width = 40
              Height = 13
              Alignment = taRightJustify
              Caption = #22806#37096#30340':'
            end
            object Label64: TLabel
              Left = 140
              Top = 21
              Width = 15
              Height = 13
              Alignment = taRightJustify
              Caption = '     '
            end
            object Label65: TLabel
              Left = 140
              Top = 42
              Width = 15
              Height = 13
              Alignment = taRightJustify
              Caption = '     '
            end
          end
          object Memo4: TMemo
            Left = 0
            Top = 119
            Width = 703
            Height = 245
            Align = alBottom
            Color = cl3DLight
            ReadOnly = True
            TabOrder = 2
          end
        end
        object TabSheet8: TTabSheet
          Caption = #21512#21516#35780#23457#20869#23481
          ImageIndex = 7
          object DBGridEh1: TDBGridEh
            Left = 0
            Top = 0
            Width = 703
            Height = 364
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
  object cds60: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT    Data0060.*, dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTO' +
      'MER_NAME, dbo.Data0010.CONTACT_NAME_1, dbo.Data0025.ttype, '#13#10'   ' +
      '                   dbo.Data0010.CONTACT_NAME_2, dbo.Data0010.CON' +
      'TACT_NAME_3, dbo.Data0010.CONTACT_NAME_4, dbo.Data0010.CONTACT_N' +
      'AME_5, '#13#10'                      dbo.Data0010.CONTACT_NAME_6, dbo.' +
      'Data0010.INTERNAL_ECN_COUNT, dbo.Data0010.EXTERNAL_ECN_COUNT, '#13#10 +
      '                      dbo.Data0025.MANU_PART_NUMBER, dbo.Data002' +
      '5.MANU_PART_DESC, dbo.Data0010.FED_TAX_ID_NO,'#13#10'                 ' +
      '     dbo.Data0025.QTY_ON_HAND, dbo.Data0025.QTY_ALLOC, dbo.Data0' +
      '097.RKEY, dbo.Data0097.PO_NUMBER, dbo.Data0097.PO_DATE, '#13#10'      ' +
      '                dbo.Data0025.set_qty, dbo.Data0001.CURR_CODE, db' +
      'o.Data0001.CURR_NAME, dbo.Data0025.SHELF_LIFE, dbo.Data0025.unit' +
      '_sq, '#13#10'                      dbo.Data0010.quote_flag, dbo.Data00' +
      '10.CREDIT_RATING, dbo.Data0010.CREDIT_LIMIT, dbo.Data0008.LEAD_T' +
      'IME, '#13#10'                      dbo.Data0025.ANALYSIS_CODE_2 as ANA' +
      'LYSIS_CODE_2_25 ,D05_1.RKEY as D05_1Rkey,D05_1.EMPLOYEE_NAME as ' +
      'D05_1EMPLOYEE_NAME,'#13#10'                      Data0025.RKEY as rkey' +
      '25,Data0025.remark as Remark25,Data0025.eng_note as eng_note25,D' +
      'ata0025.CPJS,'#13#10'                      Data0023.code as code23,Dat' +
      'a0023.supplier_name as supplier_name23,data0008.batch_flag,data0' +
      '008.former_flag,'#13#10'                      D05_2.EMPLOYEE_NAME AS '#36755 +
      #20837#20154#21592',D05_3.EMPLOYEE_NAME AS '#30830#35748#20154#21592',Data0015.WAREHOUSE_CODE, dbo.Dat' +
      'a0015.WAREHOUSE_NAME,'#13#10'                      Data0012.location,D' +
      'ata0012.SHIP_CTAX_PTR,Data0012.ship_lead_time,data0189.state_id,' +
      'data0189.state_tax,data0010.rkey as rkey10'#13#10'                    ' +
      '   ,Data0025.QTY_ON_HAND-dbo.Data0025.QTY_ALLOC as CanSL,data002' +
      '5.set_lngth,data0025.set_width'#13#10'FROM         dbo.Data0060 INNER ' +
      'JOIN'#13#10'                      dbo.Data0010 ON dbo.Data0060.CUSTOME' +
      'R_PTR = dbo.Data0010.RKEY INNER JOIN'#13#10'                      dbo.' +
      'Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY INNER' +
      ' JOIN'#13#10'                      dbo.Data0097 ON dbo.Data0060.PURCHA' +
      'SE_ORDER_PTR = dbo.Data0097.RKEY INNER JOIN'#13#10'                   ' +
      '   dbo.Data0001 ON dbo.Data0060.CURRENCY_PTR = dbo.Data0001.RKEY' +
      ' INNER JOIN'#13#10'                      dbo.Data0008 ON dbo.Data0025.' +
      'PROD_CODE_PTR = dbo.Data0008.RKEY INNER JOIN'#13#10'                  ' +
      '    Data0012 on data0060.CUST_SHIP_ADDR_PTR=Data0012.RKEY inner ' +
      'join'#13#10'                      data0189 on data0012.SHIP_CTAX_PTR=d' +
      'ata0189.rkey inner join'#13#10'                      Data0005 as D05_2' +
      ' on data0060.ENTERED_BY_EMPL_PTR=D05_2.RKEY left join'#13#10'         ' +
      '             Data0005 as D05_3 on data0060.CONF_BY_EMPL_PTR=D05_' +
      '3.RKEY left join'#13#10'                      Data0005 as D05_1 on dat' +
      'a0060.COMM_ASSIGNED_BY_E_P=D05_1.RKEY left join'#13#10'               ' +
      '       Data0023 on Data0060.supplier_ptr=Data0023.RKEY left join' +
      #13#10'                      Data0015 on data0060.SHIP_REG_TAX_ID=Dat' +
      'a0015.RKEY'#13#10'where 1=1'
    Params = <>
    Left = 328
    Top = 72
  end
  object ds60: TDataSource
    DataSet = cds60
    Left = 376
    Top = 72
  end
  object ds89: TDataSource
    DataSet = cds89
    Left = 512
  end
  object cds89: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 544
  end
  object cds192: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 592
  end
  object cds62: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    Left = 640
  end
  object ds360: TDataSource
    DataSet = cds360
    Left = 320
    Top = 128
  end
  object cds360: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 128
  end
  object cds61: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 72
  end
  object cds97: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 456
    Top = 72
  end
  object cds25: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 488
    Top = 72
  end
  object cds213: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 520
    Top = 72
  end
  object cds318: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 656
    Top = 64
  end
  object cds97_ole: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 456
    Top = 128
  end
  object cds62_Save: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 440
    Top = 184
  end
  object cds213_New: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 576
    Top = 72
  end
  object cds60_ole: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 456
  end
  object cds360_Save: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 456
    Top = 272
  end
end
