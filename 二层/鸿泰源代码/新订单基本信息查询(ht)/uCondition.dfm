object frmCondition: TfrmCondition
  Left = 264
  Top = 186
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26597#35810#26465#20214
  ClientHeight = 407
  ClientWidth = 650
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 650
    Height = 407
    ActivePage = TabSheet1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #35746#21333#22522#26412#20449#24687#26597#35810
      object GroupBox3: TGroupBox
        Left = 3
        Top = 111
        Width = 281
        Height = 264
        Caption = #23450#20041#26597#35810#26465#20214
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 0
        object Label8: TLabel
          Left = 101
          Top = 42
          Width = 84
          Height = 13
          AutoSize = False
          Caption = #23458#25143#20195#30721
        end
        object Edit3: TEdit
          Left = 101
          Top = 64
          Width = 139
          Height = 21
          TabOrder = 1
          OnExit = Edit3Exit
          OnKeyPress = Edit3KeyPress
          OnKeyUp = Edit3KeyUp
        end
        object ListBox3: TListBox
          Left = 9
          Top = 40
          Width = 81
          Height = 217
          ItemHeight = 13
          Items.Strings = (
            #23458#25143#20195#30721
            #23458#25143#22411#21495
            #26412#21378#32534#21495
            #38144#21806#35746#21333
            #23458#35746#21333#21495
            #38144#21806#20195#34920
            #35746#21333#31867#22411
            #24037#21378#20195#30721
            #35746#21333#26032#26087
            #20135#21697#23646#24615
            #21152#24037#24418#24335
            #35746#21333#29366#24577
            #29983#20135#26631#35760
            #20135#21697#23618#25968
            #23458#29289#26009#21495
            #20851#32852#21407#23458#25143
            #20135#21697#38454#25968)
          TabOrder = 0
          OnClick = ListBox3Click
        end
        object StaticText4: TStaticText
          Left = 9
          Top = 23
          Width = 81
          Height = 17
          Alignment = taCenter
          AutoSize = False
          BevelInner = bvNone
          BevelKind = bkSoft
          BevelOuter = bvRaised
          Caption = #26465#20214#39033#30446
          Color = clGray
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindow
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 4
        end
        object Button3: TButton
          Left = 125
          Top = 220
          Width = 75
          Height = 25
          Caption = #22686#21152
          Enabled = False
          TabOrder = 3
          OnClick = Button3Click
        end
        object BitBtn6: TBitBtn
          Left = 240
          Top = 63
          Width = 25
          Height = 25
          TabOrder = 2
          OnClick = BitBtn6Click
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
        end
        object ComboBox1: TComboBox
          Left = 100
          Top = 64
          Width = 141
          Height = 22
          Style = csOwnerDrawFixed
          ItemHeight = 16
          ItemIndex = 0
          TabOrder = 5
          Text = #26032#21333
          Visible = False
          Items.Strings = (
            #26032#21333
            #36820#21333)
        end
        object GroupBox1: TGroupBox
          Left = 100
          Top = 94
          Width = 171
          Height = 79
          TabOrder = 6
          Visible = False
          object CheckBox1: TCheckBox
            Tag = 1
            Left = 8
            Top = 8
            Width = 57
            Height = 17
            Caption = '1.'#26377#25928
            TabOrder = 0
          end
          object CheckBox2: TCheckBox
            Tag = 2
            Left = 80
            Top = 8
            Width = 57
            Height = 17
            Caption = '2.'#26242#32531
            TabOrder = 1
          end
          object CheckBox3: TCheckBox
            Tag = 3
            Left = 8
            Top = 32
            Width = 57
            Height = 17
            Caption = '3.'#20851#38381
            TabOrder = 2
          end
          object CheckBox4: TCheckBox
            Tag = 4
            Left = 80
            Top = 32
            Width = 57
            Height = 17
            Caption = '4.'#23436#25104
            TabOrder = 3
          end
          object CheckBox5: TCheckBox
            Tag = 5
            Left = 8
            Top = 56
            Width = 57
            Height = 17
            Caption = '5.'#21462#28040
            TabOrder = 4
          end
          object CheckBox6: TCheckBox
            Tag = 6
            Left = 80
            Top = 56
            Width = 81
            Height = 17
            Caption = '6.'#26410#25552#20132
            TabOrder = 5
          end
        end
        object RadioGroup1: TRadioGroup
          Left = 100
          Top = 98
          Width = 171
          Height = 75
          ItemIndex = 0
          Items.Strings = (
            #31561#20110'='
            #22823#20110'>'
            #23567#20110'<')
          TabOrder = 7
          Visible = False
        end
      end
      object BitBtn3: TBitBtn
        Left = 561
        Top = 290
        Width = 70
        Height = 25
        Caption = #20851#38381
        TabOrder = 1
        Kind = bkClose
      end
      object StaticText2: TStaticText
        Left = 296
        Top = 118
        Width = 246
        Height = 18
        Alignment = taCenter
        AutoSize = False
        BevelInner = bvNone
        BevelKind = bkSoft
        BevelOuter = bvRaised
        Caption = #24050#23450#20041#30340#26465#20214
        Color = clGray
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindow
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 2
      end
      object BitBtn1: TBitBtn
        Left = 561
        Top = 194
        Width = 70
        Height = 25
        Caption = #26597#25214
        Default = True
        ModalResult = 1
        TabOrder = 3
        OnClick = BitBtn1Click
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object BitBtn2: TBitBtn
        Left = 561
        Top = 242
        Width = 70
        Height = 25
        Caption = #37325#32622
        TabOrder = 4
        OnClick = BitBtn2Click
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
          33333333333F8888883F33330000324334222222443333388F3833333388F333
          000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
          F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
          223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
          3338888300003AAAAAAA33333333333888888833333333330000333333333333
          333333333333333333FFFFFF000033333333333344444433FFFF333333888888
          00003A444333333A22222438888F333338F3333800003A2243333333A2222438
          F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
          22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
          33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
          3333333333338888883333330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object Panel1: TPanel
        Left = 4
        Top = 8
        Width = 596
        Height = 37
        BevelInner = bvLowered
        BevelOuter = bvSpace
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        TabOrder = 5
        object Label9: TLabel
          Left = 92
          Top = 12
          Width = 65
          Height = 13
          Alignment = taRightJustify
          Caption = #36215#22987#26085#26399#65306
        end
        object Label7: TLabel
          Left = 347
          Top = 12
          Width = 65
          Height = 13
          Alignment = taRightJustify
          Caption = #32456#27490#26085#26399#65306
        end
        object DTPk5: TDateTimePicker
          Left = 155
          Top = 8
          Width = 100
          Height = 21
          Date = 39651.000000000000000000
          Time = 39651.000000000000000000
          TabOrder = 0
        end
        object DTPk6: TDateTimePicker
          Left = 407
          Top = 8
          Width = 100
          Height = 21
          Date = 39651.000000000000000000
          Time = 39651.000000000000000000
          TabOrder = 1
        end
        object ComboBox2: TComboBox
          Left = 6
          Top = 8
          Width = 84
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 2
          Text = #19979#21333#26085#26399
          Items.Strings = (
            #19979#21333#26085#26399
            #35745#21010#20132#26399
            #22238#22797#20132#26399)
        end
        object dp1: TDateTimePicker
          Left = 258
          Top = 8
          Width = 82
          Height = 21
          Date = 39651.000000000000000000
          Time = 39651.000000000000000000
          Kind = dtkTime
          TabOrder = 3
        end
        object dp2: TDateTimePicker
          Left = 507
          Top = 8
          Width = 82
          Height = 21
          Date = 39651.999988425930000000
          Time = 39651.999988425930000000
          Kind = dtkTime
          TabOrder = 4
        end
      end
      object RadioGroup5: TRadioGroup
        Left = 4
        Top = 50
        Width = 121
        Height = 55
        Caption = #25490#24207'1'
        ItemIndex = 0
        Items.Strings = (
          #25353#23618#25968#25490#24207
          #19981#25353#23618#25968#25490#24207)
        TabOrder = 6
      end
      object RadioGroup6: TRadioGroup
        Left = 128
        Top = 50
        Width = 416
        Height = 55
        Caption = #25490#24207'2'
        Columns = 3
        ItemIndex = 5
        Items.Strings = (
          #38144#21806#21333#21495
          #23458#25143'+'#26412#21378#32534#21495
          #23458#25143#21333#21495
          #20135#21697#31867#21035'+'#23458#25143'+'#26412#21378#32534#21495
          #23458#25143#20132#26399
          #26412#21378#32534#21495)
        TabOrder = 7
      end
      object SGrid1: TStringGrid
        Left = 296
        Top = 135
        Width = 246
        Height = 242
        ColCount = 3
        DefaultRowHeight = 19
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
        PopupMenu = PopupMenu1
        ScrollBars = ssHorizontal
        TabOrder = 8
        OnMouseDown = SGrid1MouseDown
        ColWidths = (
          67
          174
          2)
      end
    end
    object TabSheet2: TTabSheet
      Caption = #35746#21333#27719#24635#26597#35810'('#34917#25237#27424#25968')'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 4
        Top = 8
        Width = 596
        Height = 37
        BevelInner = bvLowered
        BevelOuter = bvSpace
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        TabOrder = 0
        object Label1: TLabel
          Left = 13
          Top = 12
          Width = 91
          Height = 13
          Alignment = taRightJustify
          Caption = #19979#21333#36215#22987#26085#26399#65306
        end
        object Label2: TLabel
          Left = 321
          Top = 12
          Width = 91
          Height = 13
          Alignment = taRightJustify
          Caption = #19979#21333#32456#27490#26085#26399#65306
        end
        object DateTimePicker1: TDateTimePicker
          Left = 102
          Top = 8
          Width = 100
          Height = 21
          Date = 39651.000000000000000000
          Time = 39651.000000000000000000
          TabOrder = 0
        end
        object DateTimePicker2: TDateTimePicker
          Left = 407
          Top = 8
          Width = 100
          Height = 21
          Date = 39651.000000000000000000
          Time = 39651.000000000000000000
          TabOrder = 1
        end
        object DateTimePicker3: TDateTimePicker
          Left = 205
          Top = 8
          Width = 82
          Height = 21
          Date = 39651.000000000000000000
          Time = 39651.000000000000000000
          Kind = dtkTime
          TabOrder = 2
        end
        object DateTimePicker4: TDateTimePicker
          Left = 507
          Top = 8
          Width = 82
          Height = 21
          Date = 39651.999988425930000000
          Time = 39651.999988425930000000
          Kind = dtkTime
          TabOrder = 3
        end
      end
      object BitBtn4: TBitBtn
        Left = 561
        Top = 242
        Width = 70
        Height = 25
        Caption = #37325#32622
        TabOrder = 1
        OnClick = BitBtn4Click
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
          33333333333F8888883F33330000324334222222443333388F3833333388F333
          000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
          F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
          223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
          3338888300003AAAAAAA33333333333888888833333333330000333333333333
          333333333333333333FFFFFF000033333333333344444433FFFF333333888888
          00003A444333333A22222438888F333338F3333800003A2243333333A2222438
          F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
          22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
          33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
          3333333333338888883333330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object BitBtn5: TBitBtn
        Left = 561
        Top = 290
        Width = 70
        Height = 25
        Caption = #20851#38381
        TabOrder = 2
        Kind = bkClose
      end
      object BitBtn7: TBitBtn
        Left = 561
        Top = 194
        Width = 70
        Height = 25
        Caption = #26597#25214
        Default = True
        ModalResult = 6
        TabOrder = 3
        OnClick = BitBtn7Click
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object StaticText1: TStaticText
        Left = 324
        Top = 54
        Width = 231
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = #24050#23450#20041#30340#26465#20214
        Color = clGrayText
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindow
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 4
      end
      object StringGrid1: TStringGrid
        Left = 335
        Top = 71
        Width = 220
        Height = 303
        ColCount = 3
        DefaultRowHeight = 19
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        PopupMenu = PopupMenu2
        ScrollBars = ssHorizontal
        TabOrder = 5
        ColWidths = (
          67
          174
          2)
      end
      object GroupBox6: TGroupBox
        Left = 4
        Top = 51
        Width = 330
        Height = 323
        Caption = #26597#35810#26465#20214#23450#20041
        TabOrder = 6
        object Label3: TLabel
          Left = 141
          Top = 26
          Width = 52
          Height = 13
          Caption = #26412#21378#32534#21495
        end
        object Label4: TLabel
          Left = 144
          Top = 73
          Width = 167
          Height = 13
          Caption = #26597#35810#22810#20010#20179#24211#31034#20363': D07,D09'
          Visible = False
        end
        object edtValue: TEdit
          Left = 144
          Top = 48
          Width = 134
          Height = 21
          TabOrder = 0
        end
        object Button1: TButton
          Left = 144
          Top = 103
          Width = 62
          Height = 25
          Caption = #22686#21152
          TabOrder = 1
          OnClick = Button1Click
        end
        object BitBtn8: TBitBtn
          Left = 285
          Top = 46
          Width = 25
          Height = 25
          TabOrder = 2
          Visible = False
          OnClick = BitBtn6Click
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
        end
        object ListBox1: TListBox
          Left = 10
          Top = 40
          Width = 119
          Height = 273
          ItemHeight = 13
          Items.Strings = (
            #26412#21378#32534#21495
            #25104#21697#20179
            #23614#25968#20179)
          TabOrder = 3
          OnClick = ListBox1Click
        end
        object StaticText7: TStaticText
          Left = 10
          Top = 23
          Width = 119
          Height = 17
          Alignment = taCenter
          AutoSize = False
          BevelInner = bvLowered
          BevelOuter = bvNone
          Caption = #26465#20214#39033#30446
          Color = clGrayText
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindow
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 4
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 400
    Top = 197
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = N1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 384
    Top = 149
    object MenuItem1: TMenuItem
      Caption = #21024#38500
      OnClick = MenuItem1Click
    end
  end
end
