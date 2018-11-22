inherited frmOrderVerEdit_mod284: TfrmOrderVerEdit_mod284
  Caption = 'frmOrderVerEdit_mod284'
  ClientHeight = 498
  ClientWidth = 916
  OnShow = FormShow
  ExplicitWidth = 932
  ExplicitHeight = 537
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 916
    Height = 498
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 916
    ExplicitHeight = 498
    inherited pnl1: TPanel
      Width = 914
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 914
      object lblFilter: TLabel [0]
        Left = 369
        Top = 10
        Width = 72
        Height = 13
        Alignment = taRightJustify
        Caption = #36873#25321#23458#25143#37096#20214
      end
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnSaveAll: TBitBtn
        Left = 853
        Align = alRight
        ExplicitLeft = 853
      end
      inherited btnCheck: TBitBtn
        Left = 823
        Align = alRight
        ExplicitLeft = 823
      end
      inherited btnPrint: TBitBtn
        Left = 883
        Align = alRight
        ExplicitLeft = 883
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
      object edtFliter: TEdit
        Left = 447
        Top = 6
        Width = 181
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 5
      end
      object chk1: TCheckBox
        Left = 208
        Top = 8
        Width = 129
        Height = 17
        Caption = #21516#26102#21464#26356#37197#26009#21333
        Checked = True
        State = cbChecked
        TabOrder = 6
      end
    end
    inherited pnl2: TPanel
      Width = 914
      Height = 463
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 914
      ExplicitHeight = 463
      object pgc1: TPageControl
        Left = 1
        Top = 1
        Width = 912
        Height = 461
        ActivePage = ts3
        Align = alClient
        TabOrder = 0
        object ts1: TTabSheet
          Caption = #19968#33324#20449#24687
          object lbl1: TLabel
            Left = 79
            Top = 14
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = '   '#38144#21806#23450#21333
          end
          object lbl2: TLabel
            Left = 103
            Top = 41
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = '   '#23458#25143
          end
          object lbl3: TLabel
            Left = 79
            Top = 69
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = '   '#26412#21378#32534#21495
          end
          object lbl4: TLabel
            Left = 79
            Top = 95
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = '   '#23458#25143#22411#21495
          end
          object lbl5: TLabel
            Left = 88
            Top = 122
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = #35013#36816#22320#28857
          end
          object lbl6: TLabel
            Left = 88
            Top = 149
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = #20449#29992#31561#32423
          end
          object lbl7: TLabel
            Left = 87
            Top = 176
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = #20449#29992#38480#39069
          end
          object lbl8: TLabel
            Left = 87
            Top = 204
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = #25152#27424#37329#39069
          end
          object edt_SALES_ORDER: TRKeyRzBtnEdit
            Left = 142
            Top = 11
            Width = 175
            Height = 21
            Text = ''
            Color = clBtnFace
            Enabled = False
            FocusColor = clInfoBk
            TabOrder = 0
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'SALES_ORDER'
            DisplayModID = 0
            ForceOnFocus = True
          end
          object edt_custNo: TRKeyRzBtnEdit
            Left = 142
            Top = 38
            Width = 175
            Height = 21
            Text = ''
            Color = clBtnFace
            Enabled = False
            FocusColor = clInfoBk
            TabOrder = 1
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'CUST_CODE'
            DisplayModID = 0
            ForceOnFocus = True
          end
          object edt_ProdNO: TRKeyRzBtnEdit
            Left = 142
            Top = 65
            Width = 175
            Height = 21
            Text = ''
            Color = clBtnFace
            Enabled = False
            FocusColor = clInfoBk
            TabOrder = 2
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'MANU_PART_NUMBER'
            DisplayModID = 0
            ForceOnFocus = True
          end
          object edt_CustProdNo: TRKeyRzBtnEdit
            Left = 142
            Top = 92
            Width = 175
            Height = 21
            Text = ''
            Color = clBtnFace
            Enabled = False
            FocusColor = clInfoBk
            TabOrder = 3
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'MANU_PART_DESC'
            DisplayModID = 0
            ForceOnFocus = True
          end
          object edt_address: TRKeyRzBtnEdit
            Left = 142
            Top = 119
            Width = 371
            Height = 21
            Text = ''
            Color = clBtnFace
            FocusColor = clInfoBk
            TabOrder = 4
            ButtonKind = bkFind
            AltBtnWidth = 15
            ButtonWidth = 15
            OnButtonClick = edt_addressButtonClick
            DataSource = ds60
            DisplayModID = 0
            ForceOnFocus = True
          end
          object edt_creditGrade: TRKeyRzBtnEdit
            Left = 142
            Top = 146
            Width = 175
            Height = 21
            Text = ''
            Color = clBtnFace
            Enabled = False
            FocusColor = clInfoBk
            TabOrder = 5
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DisplayModID = 0
            ForceOnFocus = True
          end
          object edt_creditAmount: TRKeyRzBtnEdit
            Left = 141
            Top = 171
            Width = 175
            Height = 21
            Text = ''
            Color = clBtnFace
            Enabled = False
            FocusColor = clInfoBk
            TabOrder = 6
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'credit_limit'
            DisplayModID = 0
            ForceOnFocus = True
          end
          object edt_OweAmount: TRKeyRzBtnEdit
            Left = 141
            Top = 198
            Width = 175
            Height = 21
            Text = ''
            Color = clBtnFace
            Enabled = False
            FocusColor = clInfoBk
            TabOrder = 7
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DisplayModID = 0
            ForceOnFocus = True
          end
          object edt_CustName: TRKeyRzBtnEdit
            Left = 319
            Top = 38
            Width = 281
            Height = 21
            Text = ''
            Color = clBtnFace
            Enabled = False
            FocusColor = clInfoBk
            TabOrder = 8
            ButtonKind = bkFind
            ButtonVisible = False
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds60
            DataSourceField = 'customer_name'
            DisplayModID = 0
            ForceOnFocus = True
          end
        end
        object ts2: TTabSheet
          Caption = #32447#36335#23618#25968#23545
          ImageIndex = 1
          object pnl7: TPanel
            Left = 0
            Top = 0
            Width = 904
            Height = 433
            Align = alClient
            TabOrder = 0
            object pnl8: TPanel
              Left = 1
              Top = 281
              Width = 902
              Height = 151
              Align = alBottom
              TabOrder = 0
              object eh1: TDBGridEh
                Left = 1
                Top = 1
                Width = 900
                Height = 149
                Align = alClient
                DataSource = ds25
                DynProps = <>
                ReadOnly = True
                TabOrder = 0
                Columns = <
                  item
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'OProdNO'
                    Footers = <>
                    Title.Caption = #26367#25442#21069#29983#20135#32534#21495
                    Width = 138
                  end
                  item
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'OCustProdNo'
                    Footers = <>
                    Title.Caption = #26367#25442#21069#23458#25143#22411#21495
                    Width = 90
                  end
                  item
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'NProdNO'
                    Footers = <>
                    Title.Caption = #26367#25442#21518#29983#20135#32534#21495
                    Width = 92
                  end
                  item
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'NCustProdNo'
                    Footers = <>
                    Title.Caption = #26367#25442#21518#23458#25143#22411#21495
                    Width = 135
                  end
                  item
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'Orkey25'
                    Footers = <>
                    Title.Caption = '.'
                    Width = 42
                  end
                  item
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'Nrkey25'
                    Footers = <>
                    Title.Caption = '.'
                    Width = 43
                  end>
                object RowDetailData: TRowDetailPanelControlEh
                end
              end
            end
            object pnl10: TPanel
              Left = 1
              Top = 1
              Width = 902
              Height = 280
              Align = alClient
              TabOrder = 1
              object pnl11: TPanel
                Left = 1
                Top = 1
                Width = 900
                Height = 24
                Align = alTop
                TabOrder = 0
              end
              object pnl12: TPanel
                Left = 1
                Top = 25
                Width = 900
                Height = 254
                Align = alClient
                TabOrder = 1
                object pnl13: TPanel
                  Left = 1
                  Top = 1
                  Width = 360
                  Height = 252
                  Align = alLeft
                  TabOrder = 0
                  object tv1: TTreeView
                    Left = 1
                    Top = 1
                    Width = 358
                    Height = 250
                    Align = alClient
                    HideSelection = False
                    Images = il1
                    Indent = 19
                    ReadOnly = True
                    TabOrder = 0
                  end
                end
                object pnl14: TPanel
                  Left = 361
                  Top = 1
                  Width = 170
                  Height = 252
                  Align = alClient
                  TabOrder = 1
                  object btn_replace: TButton
                    Left = 23
                    Top = 114
                    Width = 69
                    Height = 25
                    Caption = #26367#25442
                    TabOrder = 0
                    OnClick = btn_replaceClick
                  end
                  object btn_CReplace: TButton
                    Left = 23
                    Top = 207
                    Width = 69
                    Height = 25
                    Caption = #21462#28040#26367#25442
                    TabOrder = 1
                    OnClick = btn_CReplaceClick
                  end
                end
                object pnl15: TPanel
                  Left = 531
                  Top = 1
                  Width = 368
                  Height = 252
                  Align = alRight
                  TabOrder = 2
                  object tv2: TTreeView
                    Left = 1
                    Top = 1
                    Width = 366
                    Height = 250
                    Align = alClient
                    HideSelection = False
                    Images = il1
                    Indent = 19
                    ReadOnly = True
                    TabOrder = 0
                  end
                end
              end
            end
          end
        end
        object ts3: TTabSheet
          Caption = #21464#26356#20316#19994#21333#29256#26412
          ImageIndex = 2
          object pnl3: TPanel
            Left = 0
            Top = 0
            Width = 904
            Height = 304
            Align = alClient
            TabOrder = 0
            object pnl6: TPanel
              Left = 1
              Top = 262
              Width = 902
              Height = 41
              Align = alBottom
              TabOrder = 0
              object btn_add: TBitBtn
                Left = 201
                Top = 6
                Width = 56
                Height = 32
                Hint = #36873#25321#21464#26356
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000C40E0000C40E00000001000000000000000000003300
                  00006600000099000000CC000000FF0000000033000033330000663300009933
                  0000CC330000FF33000000660000336600006666000099660000CC660000FF66
                  000000990000339900006699000099990000CC990000FF99000000CC000033CC
                  000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
                  0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
                  330000333300333333006633330099333300CC333300FF333300006633003366
                  33006666330099663300CC663300FF6633000099330033993300669933009999
                  3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
                  330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
                  66006600660099006600CC006600FF0066000033660033336600663366009933
                  6600CC336600FF33660000666600336666006666660099666600CC666600FF66
                  660000996600339966006699660099996600CC996600FF99660000CC660033CC
                  660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
                  6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
                  990000339900333399006633990099339900CC339900FF339900006699003366
                  99006666990099669900CC669900FF6699000099990033999900669999009999
                  9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
                  990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
                  CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
                  CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
                  CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
                  CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
                  CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
                  FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
                  FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
                  FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
                  FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
                  000000808000800000008000800080800000C0C0C00080808000191919004C4C
                  4C00B2B2B200E5E5E5005A1E1E00783C3C0096646400C8969600FFC8C800465F
                  82005591B9006EB9D7008CD2E600B4E6F000D8E9EC0099A8AC00646F7100E2EF
                  F100C56A31000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000EEEEEEEEEEEE
                  EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
                  EE0909EEEEEEEEEEEEEEEEEEEEEEEEEE09101009EEEEEEEEEEEEEEEEEEEEEE09
                  1010101009EEEEEEEEEEEEEEEEEE0910101010101009EEEEEEEEEEEEEE091010
                  10101010101009EEEEEEEEEE091010101009091010101009EEEEEEEE09101010
                  09EEEE0910101009EEEEEEEE09101009EEEEEEEE09101009EEEEEEEE091009EE
                  EEEEEEEEEE091009EEEEEEEE0909EEEEEEEEEEEEEEEE0909EEEEEEEEEEEEEEEE
                  EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
                  EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE}
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnClick = btn_addClick
              end
              object btn_allAdd: TBitBtn
                Left = 263
                Top = 5
                Width = 56
                Height = 32
                Hint = #20840#37096#21464#26356
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000C40E0000C40E00000001000000000000000000003300
                  00006600000099000000CC000000FF0000000033000033330000663300009933
                  0000CC330000FF33000000660000336600006666000099660000CC660000FF66
                  000000990000339900006699000099990000CC990000FF99000000CC000033CC
                  000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
                  0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
                  330000333300333333006633330099333300CC333300FF333300006633003366
                  33006666330099663300CC663300FF6633000099330033993300669933009999
                  3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
                  330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
                  66006600660099006600CC006600FF0066000033660033336600663366009933
                  6600CC336600FF33660000666600336666006666660099666600CC666600FF66
                  660000996600339966006699660099996600CC996600FF99660000CC660033CC
                  660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
                  6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
                  990000339900333399006633990099339900CC339900FF339900006699003366
                  99006666990099669900CC669900FF6699000099990033999900669999009999
                  9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
                  990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
                  CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
                  CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
                  CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
                  CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
                  CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
                  FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
                  FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
                  FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
                  FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
                  000000808000800000008000800080800000C0C0C00080808000191919004C4C
                  4C00B2B2B200E5E5E5005A1E1E00783C3C0096646400C8969600FFC8C800465F
                  82005591B9006EB9D7008CD2E600B4E6F000D8E9EC0099A8AC00646F7100E2EF
                  F100C56A31000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000EEEEEEEEEEEE
                  EE0909EEEEEEEEEEEEEEEEEEEEEEEEEE09101009EEEEEEEEEEEEEEEEEEEEEE09
                  1010101009EEEEEEEEEEEEEEEEEE0910101010101009EEEEEEEEEEEEEE091010
                  10090910101009EEEEEEEEEE0910101009EEEE0910101009EEEEEEEE09101009
                  EEEEEEEE09101009EEEEEEEE091009EEEE0909EEEE091009EEEEEEEE0909EEEE
                  09101009EEEE0909EEEEEEEEEEEEEE091010101009EEEEEEEEEEEEEEEEEE0910
                  101010101009EEEEEEEEEEEEEE09101010090910101009EEEEEEEEEE09101010
                  09EEEE0910101009EEEEEEEE09101009EEEEEEEE09101009EEEEEEEE091009EE
                  EEEEEEEEEE091009EEEEEEEE0909EEEEEEEEEEEEEEEE0909EEEE}
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnClick = btn_allAddClick
              end
              object btn_del: TBitBtn
                Left = 381
                Top = 6
                Width = 56
                Height = 32
                Hint = #36873#25321#21462#28040
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000C40E0000C40E00000001000000000000000000003300
                  00006600000099000000CC000000FF0000000033000033330000663300009933
                  0000CC330000FF33000000660000336600006666000099660000CC660000FF66
                  000000990000339900006699000099990000CC990000FF99000000CC000033CC
                  000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
                  0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
                  330000333300333333006633330099333300CC333300FF333300006633003366
                  33006666330099663300CC663300FF6633000099330033993300669933009999
                  3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
                  330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
                  66006600660099006600CC006600FF0066000033660033336600663366009933
                  6600CC336600FF33660000666600336666006666660099666600CC666600FF66
                  660000996600339966006699660099996600CC996600FF99660000CC660033CC
                  660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
                  6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
                  990000339900333399006633990099339900CC339900FF339900006699003366
                  99006666990099669900CC669900FF6699000099990033999900669999009999
                  9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
                  990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
                  CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
                  CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
                  CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
                  CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
                  CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
                  FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
                  FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
                  FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
                  FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
                  000000808000800000008000800080800000C0C0C00080808000191919004C4C
                  4C00B2B2B200E5E5E5005A1E1E00783C3C0096646400C8969600FFC8C800465F
                  82005591B9006EB9D7008CD2E600B4E6F000D8E9EC0099A8AC00646F7100E2EF
                  F100C56A31000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000EEEEEEEEEEEE
                  EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
                  EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE0909EEEE
                  EEEEEEEEEEEE0909EEEEEEEE091009EEEEEEEEEEEE091009EEEEEEEE09101009
                  EEEEEEEE09101009EEEEEEEE0910101009EEEE0910101009EEEEEEEE09101010
                  1009091010101009EEEEEEEEEE09101010101010101009EEEEEEEEEEEEEE0910
                  101010101009EEEEEEEEEEEEEEEEEE091010101009EEEEEEEEEEEEEEEEEEEEEE
                  09101009EEEEEEEEEEEEEEEEEEEEEEEEEE0909EEEEEEEEEEEEEEEEEEEEEEEEEE
                  EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE}
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                OnClick = btn_delClick
              end
              object btn_allDel: TBitBtn
                Left = 447
                Top = 6
                Width = 56
                Height = 32
                Hint = #20840#37096#21462#28040
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000C40E0000C40E00000001000000000000000000003300
                  00006600000099000000CC000000FF0000000033000033330000663300009933
                  0000CC330000FF33000000660000336600006666000099660000CC660000FF66
                  000000990000339900006699000099990000CC990000FF99000000CC000033CC
                  000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
                  0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
                  330000333300333333006633330099333300CC333300FF333300006633003366
                  33006666330099663300CC663300FF6633000099330033993300669933009999
                  3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
                  330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
                  66006600660099006600CC006600FF0066000033660033336600663366009933
                  6600CC336600FF33660000666600336666006666660099666600CC666600FF66
                  660000996600339966006699660099996600CC996600FF99660000CC660033CC
                  660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
                  6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
                  990000339900333399006633990099339900CC339900FF339900006699003366
                  99006666990099669900CC669900FF6699000099990033999900669999009999
                  9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
                  990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
                  CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
                  CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
                  CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
                  CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
                  CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
                  FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
                  FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
                  FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
                  FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
                  000000808000800000008000800080800000C0C0C00080808000191919004C4C
                  4C00B2B2B200E5E5E5005A1E1E00783C3C0096646400C8969600FFC8C800465F
                  82005591B9006EB9D7008CD2E600B4E6F000D8E9EC0099A8AC00646F7100E2EF
                  F100C56A31000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000EEEE0909EEEE
                  EEEEEEEEEEEE0909EEEEEEEE091009EEEEEEEEEEEE091009EEEEEEEE09101009
                  EEEEEEEE09101009EEEEEEEE0910101009EEEE0910101009EEEEEEEEEE091010
                  10090910101009EEEEEEEEEEEEEE0910101010101009EEEEEEEEEEEEEEEEEE09
                  1010101009EEEEEEEEEEEEEE0909EEEE09101009EEEE0909EEEEEEEE091009EE
                  EE0909EEEE091009EEEEEEEE09101009EEEEEEEE09101009EEEEEEEE09101010
                  09EEEE0910101009EEEEEEEEEE09101010090910101009EEEEEEEEEEEEEE0910
                  101010101009EEEEEEEEEEEEEEEEEE091010101009EEEEEEEEEEEEEEEEEEEEEE
                  09101009EEEEEEEEEEEEEEEEEEEEEEEEEE0909EEEEEEEEEEEEEE}
                ParentShowHint = False
                ShowHint = True
                TabOrder = 3
                OnClick = btn_allDelClick
              end
            end
            object eh2: TDBGridEh
              Left = 1
              Top = 1
              Width = 902
              Height = 261
              Align = alClient
              DataSource = ds06
              DynProps = <>
              ReadOnly = True
              TabOrder = 1
              OnKeyDown = eh2KeyDown
              Columns = <
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'WORK_ORDER_NUMBER'
                  Footers = <>
                  Title.Caption = #20316#19994#21333#21495
                  Width = 99
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'CUT_NO'
                  Footers = <>
                  Title.Caption = #37197#26009#21333#21495
                  Width = 110
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'MANU_PART_NUMBER'
                  Footers = <>
                  Title.Caption = #26412#21378#32534#21495
                  Width = 98
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'MANU_PART_DESC'
                  Footers = <>
                  Title.Caption = #23458#25143#22411#21495
                  Width = 101
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'QUAN_SCH'
                  Footers = <>
                  Title.Caption = #25237#20135#25968#37327
                  Width = 73
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'QUAN_REJ'
                  Footers = <>
                  Title.Caption = #25253#24223#25968#37327
                  Width = 74
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'QUAN_PROD'
                  Footers = <>
                  Title.Caption = #23436#24037#25968#37327
                  Width = 73
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'wip_qty'
                  Footers = <>
                  Title.Caption = #22312#32447#25968#37327
                  Width = 68
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'v_status'
                  Footers = <>
                  Title.Caption = #29366#24577
                  Width = 58
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'rkey06'
                  Footers = <>
                  Width = 32
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'BOM_PTR'
                  Footers = <>
                  Title.Caption = 'BOM_ptr'
                  Width = 29
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
          end
          object pnl5: TPanel
            Left = 0
            Top = 304
            Width = 904
            Height = 129
            Align = alBottom
            TabOrder = 1
            object eh3: TDBGridEh
              Left = 1
              Top = 1
              Width = 902
              Height = 127
              Align = alClient
              DataSource = ds06_2
              DynProps = <>
              ReadOnly = True
              TabOrder = 0
              Columns = <
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'WORK_ORDER_NUMBER'
                  Footers = <>
                  Title.Caption = #20316#19994' '#21333#21495
                  Width = 96
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'CUT_NO'
                  Footers = <>
                  Title.Caption = #37197#26009#21333#21495
                  Width = 109
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'MANU_PART_NUMBER'
                  Footers = <>
                  Title.Caption = #26412#21378#32534#21495
                  Width = 106
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'MANU_PART_DESC'
                  Footers = <>
                  Title.Caption = #23458#25143#22411#21495
                  Width = 98
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'QUAN_SCH'
                  Footers = <>
                  Title.Caption = #25237#20135#25968#37327
                  Width = 66
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'QUAN_REJ'
                  Footers = <>
                  Title.Caption = #25253#24223#25968#37327
                  Width = 67
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'QUAN_PROD'
                  Footers = <>
                  Title.Caption = #23436#24037#25968#37327
                  Width = 62
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'wip_qty'
                  Footers = <>
                  Title.Caption = #22312#32447#25968#37327
                  Width = 60
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'v_status'
                  Footers = <>
                  Title.Caption = #29366#24577
                  Width = 53
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'rkey06'
                  Footers = <>
                  Width = 34
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'BOM_PTR'
                  Footers = <>
                  Width = 28
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'Nrkey25'
                  Footers = <>
                  Width = 29
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
          end
        end
        object ts4: TTabSheet
          Caption = #38656#35201#21464#26356#30340#37197#26009#21333
          ImageIndex = 3
          object eh492: TDBGridEh
            Left = 0
            Top = 0
            Width = 904
            Height = 433
            Align = alClient
            DataSource = ds492
            DynProps = <>
            TabOrder = 0
            OnKeyDown = eh492KeyDown
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CUT_NO'
                Footers = <>
                Title.Caption = #37197#26009#21333#21495
                Width = 89
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'SO_NO'
                Footers = <>
                Title.Caption = #38144#21806#35746#21333
                Width = 96
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'MANU_PART_NUMBER'
                Footers = <>
                Title.Caption = #26412#21378#32534#21495
                Width = 114
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'MANU_PART_DESC'
                Footers = <>
                Title.Caption = #23458#25143#22411#21495
                Width = 86
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ISSUED_QTY'
                Footers = <>
                Title.Caption = #25237#20135#25968#37327
                Width = 57
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ISSUE_DATE'
                Footers = <>
                Title.Caption = #25237#20135#26085#26399
                Width = 71
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = #23457#26680#29366#24577
                Footers = <>
                Width = 56
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = #30830#35748#29366#24577
                Footers = <>
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = #25237#20135#24615#36136
                Footers = <>
                Width = 68
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = #20135#21697#23646#24615
                Footers = <>
                Width = 65
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PLANNED_QTY'
                Footers = <>
                Title.Caption = #35745#21010#25968#37327
                Width = 56
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'EMPLOYEE_NAME'
                Footers = <>
                Title.Caption = #35745#21010#20154#21592
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
    Params = <>
    Left = 728
    Top = 80
  end
  object cds06: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT dbo.Data0006.RKEY  as rkey06, dbo.Data0006.WORK_ORDER_NUM' +
      'BER,'#13#10'      dbo.data0492.CUT_NO, dbo.Data0025.MANU_PART_NUMBER, ' +
      #13#10'      dbo.Data0025.MANU_PART_DESC, dbo.Data0006.pnl_size, '#13#10'  ' +
      '    dbo.Data0006.PROD_STATUS, dbo.Data0006.QUAN_SCH, dbo.Data000' +
      '6.QUAN_REJ,'#13#10'      dbo.Data0006.QUAN_PROD, dbo.Data0006.BOM_PTR,' +
      'data0006.ENGG_STATUS,'#13#10'      dbo.Data0006.QUAN_SCH - dbo.Data000' +
      '6.QUAN_REJ - dbo.Data0006.QUAN_PROD AS wip_qty,'#13#10'      case when' +
      ' data0006.prod_status=2 then  '#39#31561#24453#29983#20135#39' '#13#10'           when data0006.' +
      'prod_status=3 then '#39#29983#20135#20013#39#13#10'           when data0006.prod_status=4' +
      ' then '#39#22806#21457#29983#20135#39' '#13#10'           when data0006.prod_status=5 then '#39#24453#20837#20179#39 +
      ' '#13#10'           when data0006.prod_status=6 then '#39#24453#20998#37197#39#13#10'          ' +
      ' when data0006.prod_status=9 then '#39#24050#23436#25104#39#13#10'           when data000' +
      '6.prod_status=102 then '#39#29983#20135#21069#26242#32531#39#13#10'           when data0006.prod_st' +
      'atus=103 then '#39#29983#20135#20013#26242#32531#39#13#10'           when data0006.prod_status=202 ' +
      'then '#39#34987#21462#28040#39' else '#39#39' end as v_status'#13#10'FROM dbo.Data0006 INNER JOIN' +
      #13#10'      dbo.data0492 ON dbo.Data0006.CUT_NO = dbo.data0492.CUT_N' +
      'O INNER JOIN'#13#10'      dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo.D' +
      'ata0025.RKEY'#13#10'WHERE  data0492.so_no='#39'-1'#39
    Params = <>
    Left = 728
    Top = 120
  end
  object cds492: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT dbo.data0492.rkey, data0492.CUT_NO, dbo.data0492.SO_NO,'#13#10 +
      'Data0005.EMPLOYEE_NAME,data0492.BOM_PTR,'#13#10'Data0025.MANU_PART_NUM' +
      'BER, Data0025.MANU_PART_DESC,'#13#10'data0492.PLANNED_QTY,data0492.ISS' +
      'UED_QTY,data0492.ISSUE_DATE,'#13#10'data0492.pnl1_size, data0492.PANEL' +
      '_1_QTY, data0492.UPANEL1,'#13#10'data0492.pnl2_size, data0492.PANEL_2_' +
      'QTY, data0492.UPANEL2,'#13#10'case data0492.Con_Flag when 0 then '#39#26410#30830#35748#39 +
      '  when 2 then '#39#24050#30830#35748#39' end as '#30830#35748#29366#24577','#13#10'case data0492.TTYPE when 0 the' +
      'n '#39#27491#24120#39'  WHEN 1 THEN '#39#34917#26009#39'  end AS '#25237#20135#24615#36136','#13#10'case  when Data0025.PARE' +
      'NT_PTR is null then '#39#22806#23618#39#13#10'else '#39#20869#23618#39' end as '#20135#21697#23646#24615','#13#10'case data0492.' +
      'tstatus when 0 then '#39#24050#23457#26680#39#13#10'when 1 then '#39#26410#23457#26680#39' when 2 then '#39#19981#23457#26680#39#13#10 +
      'when 3 then '#39#24050#21462#28040#39' end as '#23457#26680#29366#24577#13#10'FROM dbo.data0492 INNER JOIN  dbo' +
      '.Data0005 ON '#13#10'dbo.data0492.CREATED_BY_PTR = dbo.Data0005.RKEY I' +
      'NNER JOIN'#13#10'dbo.Data0025 ON dbo.data0492.BOM_PTR = dbo.Data0025.R' +
      'KEY'#13#10'where 1=1'
    Params = <>
    Left = 728
    Top = 216
  end
  object cds25: TClientDataSet
    Aggregates = <>
    CommandText = 
      'declare @Temp25 table('#13#10'OProdNO varchar(30),'#13#10'OCustProdNo varcha' +
      'r(30),'#13#10'NProdNO varchar(30),'#13#10'NCustProdNo varchar(30),'#13#10'Orkey25 ' +
      'int,'#13#10'Nrkey25 int'#13#10')    '#13#10' select * from   @Temp25'#13#10
    Params = <>
    Left = 152
    Top = 352
  end
  object ds25: TDataSource
    DataSet = cds25
    Left = 112
    Top = 352
  end
  object ds06: TDataSource
    DataSet = cds06
    Left = 688
    Top = 120
  end
  object ds60: TDataSource
    DataSet = cds60
    Left = 696
    Top = 80
  end
  object ds492: TDataSource
    DataSet = cds492
    Left = 688
    Top = 216
  end
  object ds06_2: TDataSource
    DataSet = cds06_2
    Left = 688
    Top = 168
  end
  object cds06_2: TClientDataSet
    Aggregates = <>
    CommandText = 
      'declare @Temp25 table('#13#10'Nrkey25 varchar(30))'#13#10#13#10'SELECT dbo.Data0' +
      '006.RKEY  as rkey06, dbo.Data0006.WORK_ORDER_NUMBER,'#13#10'      dbo.' +
      'data0492.CUT_NO, dbo.Data0025.MANU_PART_NUMBER, '#13#10'      dbo.Data' +
      '0025.MANU_PART_DESC, dbo.Data0006.pnl_size, '#13#10'      dbo.Data0006' +
      '.PROD_STATUS, dbo.Data0006.QUAN_SCH, dbo.Data0006.QUAN_REJ,'#13#10'   ' +
      '   dbo.Data0006.QUAN_PROD, dbo.Data0006.BOM_PTR,data0006.ENGG_ST' +
      'ATUS,'#13#10'      dbo.Data0006.QUAN_SCH - dbo.Data0006.QUAN_REJ - dbo' +
      '.Data0006.QUAN_PROD AS wip_qty,'#13#10'      case when data0006.prod_s' +
      'tatus=2 then  '#39#31561#24453#29983#20135#39' '#13#10'           when data0006.prod_status=3 th' +
      'en '#39#29983#20135#20013#39#13#10'           when data0006.prod_status=4 then '#39#22806#21457#29983#20135#39' '#13#10' ' +
      '          when data0006.prod_status=5 then '#39#24453#20837#20179#39' '#13#10'           wh' +
      'en data0006.prod_status=6 then '#39#24453#20998#37197#39#13#10'           when data0006.p' +
      'rod_status=9 then '#39#24050#23436#25104#39#13#10'           when data0006.prod_status=10' +
      '2 then '#39#29983#20135#21069#26242#32531#39#13#10'           when data0006.prod_status=103 then '#39#29983 +
      #20135#20013#26242#32531#39#13#10'           when data0006.prod_status=202 then '#39#34987#21462#28040#39' else ' +
      #39#39' end as v_status,b.Nrkey25'#13#10'FROM dbo.Data0006 INNER JOIN'#13#10'    ' +
      '  dbo.data0492 ON dbo.Data0006.CUT_NO = dbo.data0492.CUT_NO INNE' +
      'R JOIN'#13#10'      dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo.Data002' +
      '5.RKEY'#13#10' join @Temp25  b   on 1=1'#13#10'WHERE  data0492.so_no='#39'-1'#39
    Params = <>
    Left = 728
    Top = 168
  end
  object qrytemp: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdompcb1077;Persist Security Info' +
      '=True;User ID=sa;Initial Catalog=SJ_V20_LIVE;Data Source=192.168' +
      '.1.37;Use Procedure for Prepare=1;Auto Translate=True;Packet Siz' +
      'e=4096;Workstation ID=HOME;Use Encryption for Data=False;Tag wit' +
      'h column collation when possible=False'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT dbo.data0492.rkey, data0492.CUT_NO, dbo.data0492.SO_NO,'
      'Data0005.EMPLOYEE_NAME,data0492.BOM_PTR,'
      'Data0025.MANU_PART_NUMBER, Data0025.MANU_PART_DESC,'
      'data0492.PLANNED_QTY,data0492.ISSUED_QTY,data0492.ISSUE_DATE,'
      'data0492.pnl1_size, data0492.PANEL_1_QTY, data0492.UPANEL1,'
      'data0492.pnl2_size, data0492.PANEL_2_QTY, data0492.UPANEL2,'
      
        'case data0492.Con_Flag when 0 then '#39#26410#30830#35748#39'  when 2 then '#39#24050#30830#35748#39' end ' +
        'as '#30830#35748#29366#24577','
      
        'case data0492.TTYPE when 0 then '#39#27491#24120#39'  WHEN 1 THEN '#39#34917#26009#39'  end AS '#25237 +
        #20135#24615#36136','
      'case  when Data0025.PARENT_PTR is null then '#39#22806#23618#39
      'else '#39#20869#23618#39' end as '#20135#21697#23646#24615','
      'case data0492.tstatus when 0 then '#39#24050#23457#26680#39
      'when 1 then '#39#26410#23457#26680#39' when 2 then '#39#19981#23457#26680#39
      'when 3 then '#39#24050#21462#28040#39' end as '#23457#26680#29366#24577
      'FROM dbo.data0492 INNER JOIN  dbo.Data0005 ON '
      'dbo.data0492.CREATED_BY_PTR = dbo.Data0005.RKEY INNER JOIN'
      'dbo.Data0025 ON dbo.data0492.BOM_PTR = dbo.Data0025.RKEY'
      'where 1=2')
    Left = 640
    Top = 224
    object strngfldCUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object strngfldSO_NO: TStringField
      FieldName = 'SO_NO'
      FixedChar = True
      Size = 12
    end
    object strngfldMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object strngfldMANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object intgrfldISSUED_QTY: TIntegerField
      FieldName = 'ISSUED_QTY'
    end
    object dtmfldISSUE_DATE: TDateTimeField
      FieldName = 'ISSUE_DATE'
    end
    object strngfldqrytemp审核状态: TStringField
      FieldName = #23457#26680#29366#24577
      ReadOnly = True
      Size = 6
    end
    object strngfldqrytemp确认状态: TStringField
      FieldName = #30830#35748#29366#24577
      ReadOnly = True
      Size = 6
    end
    object strngfldqrytemp投产性质: TStringField
      FieldName = #25237#20135#24615#36136
      ReadOnly = True
      Size = 4
    end
    object strngfldqrytemp产品属性: TStringField
      FieldName = #20135#21697#23646#24615
      ReadOnly = True
      Size = 4
    end
    object intgrfldPLANNED_QTY: TIntegerField
      FieldName = 'PLANNED_QTY'
    end
    object strngfldEMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object cdsTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 816
    Top = 192
  end
  object il1: TImageList
    ShareImages = True
    Left = 32
    Top = 120
    Bitmap = {
      494C010105000900300010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000185200001852000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000185200D6E7FF00B5C6
      FF00001852000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000185200001852000021
      73008CADFF006B8CFF0000185200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000185200001852000021
      7300003194000039BD000052FF000039BD000018520000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000185200001852000021
      7300003194000039BD004A73FF008CADFF000031940000217300001852000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000185200001852000021
      7300003194000039BD004A73FF008CADFF00B5C6FF00B5C6FF00002173000018
      5200001852000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000185200001852000021
      7300003194000039BD004A73FF008CADFF00B5C6FF00B5C6FF00D6E7FF000018
      5200001852000018520000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000185200001852000021
      7300003194000039BD004A73FF008CADFF00B5C6FF0000319400002173000018
      5200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000185200001852000021
      7300003194000039BD004A73FF000039BD000031940000185200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000185200001852000021
      7300003194006B8CFF000052FF00001852000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000185200D6E7FF00B5C6
      FF008CADFF000018520000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000185200D6E7FF000018
      5200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000185200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009C9C9C008C8C8C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000094847B00E7B5B500B5948C00FFC6C600FFCECE00949494009C9C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF0000000000000000000000000000BDA5
      9C00EFBDB500FFC6C600E7B5AD00FFC6C600FFC6C6009C847B00FFC6C6008C73
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF00000000000000000000B59C8C00B58C
      8C00D6AD9C00FFBDBD00FFBDBD00FFBDBD00FFBDBD00FFBDBD00FFBDBD00E7AD
      AD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000000000C6ADA500FFB5B500FFB5
      B500FFB5B500FFB5B500FFB5B500F7B5AD00FFB5B500FFB5B500FFB5B500AD84
      84008C7B7B006363630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF00000000000000000000CEA59400FFAD
      AD00FFADAD00EFA5A500000000000000000000000000CEA59400FFADAD00FFAD
      AD00FFADAD00CE94940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF0000000000009C949400BD948C00FFA5
      A500FFADAD00A5A5A50000000000000000000000000000000000D6A59400FFAD
      AD00FFADAD00D69C9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6A59400FFA5A500FFA5
      A500FFA5A5000000000000000000000000000000000000000000CEAD9C00FFA5
      A500FFA5A5006363630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6A59400FF9C9C00FF9C
      9C00FF9C9C000000000000000000000000000000000000000000C6ADA500F79C
      9400FF9C9C00FF9C9C005A5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDA59C00F794
      9400FF9494006363630000000000000000000000000000000000C6A59C00F794
      9400FF949400FF94940084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EF948C00F78C
      8C00F78C8C00AD6B6B0094949400000000000000000000000000C6AD9C00F78C
      8C00F78C8C0094948C0000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6ADA500E78C8400EF84
      8400EF848400EF848400845A5A008484840000000000AD9C9400E78C8400EF84
      8400EF8484009C6B6B0000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CEAD9C00CEAD
      9C00CE9C8C00E77B7B00E77B7B00E7848400DE7B7B00E77B7B00E77B7B00E77B
      7B00E77B7B00DE7B7B0000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CEAD
      9C00D6847B00DE7B7B00DE737300DE7B7B00DE7B7B00DE737300DE7B7B00BD73
      7300D69C9C000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CEAD
      9C00CE8C8400DE6B7300CEAD9C00D6737300D66B6B00CEA58C00DE6B7300DE73
      7300000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6AD9C00CE6B6B00D6636300BDADAD00CE847B000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      9FFF00000000000087FF00000000000081FF000000000000807F000000000000
      801F00000000000080070000000000008003000000000000800F000000000000
      803F00000000000080FF00000000000083FF0000000000008FFF000000000000
      BFFF000000000000FFFF000000000000FFFFFFFFFFFFFE7FFFFF8301FFFFF01F
      0780BB01FF00E00F77BEBB01FF00C00F77BE8301F00080030780EFEFF700C383
      DFF7EFEFF70083C3DFF7E00FF7FF87C3C007FEFFF7FF87C1FEFFFEFFF7FFC3C1
      FEFFFEFFF7FFC1C3F01FF01F80FF8083F01FF7DFBEFFC003F01FF7DFBEFFE007
      F01FF7DFBEFFE00FF01FF01F80FFFC1F00000000000000000000000000000000
      000000000000}
  end
end
