object FrmQry: TFrmQry
  Left = 457
  Top = 234
  Width = 657
  Height = 358
  Caption = #26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 641
    Height = 320
    Align = alClient
    TabOrder = 0
    object pnl2: TPanel
      Left = 1
      Top = 1
      Width = 639
      Height = 318
      Align = alClient
      TabOrder = 0
      object btn15: TBitBtn
        Left = 321
        Top = 240
        Width = 75
        Height = 25
        Caption = #26597#25214
        Default = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ModalResult = 1
        ParentFont = False
        TabOrder = 1
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
      object btn_reset: TBitBtn
        Left = 545
        Top = 232
        Width = 75
        Height = 25
        Caption = #37325#32622
        TabOrder = 2
        OnClick = btn_resetClick
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
      object btn_qry: TBitBtn
        Left = 545
        Top = 264
        Width = 75
        Height = 25
        Caption = #20851#38381
        TabOrder = 3
        OnClick = btn_qryClick
        Kind = bkClose
      end
      object strngrdSGrid1: TStringGrid
        Left = 291
        Top = 32
        Width = 518
        Height = 188
        ColCount = 3
        DefaultRowHeight = 19
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        ScrollBars = ssVertical
        TabOrder = 4
        ColWidths = (
          76
          263
          250)
      end
      object txt8: TStaticText
        Left = 291
        Top = 16
        Width = 342
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
        TabOrder = 5
      end
      object grp1: TGroupBox
        Left = 4
        Top = 12
        Width = 281
        Height = 269
        Caption = #26448#26009#25509#25910#27719#24635
        TabOrder = 0
        object lbl_field: TLabel
          Left = 95
          Top = 34
          Width = 57
          Height = 13
          AutoSize = False
          Caption = #37319#36141#35746#21333
        end
        object lbl2: TLabel
          Left = 97
          Top = 50
          Width = 48
          Height = 13
          Alignment = taRightJustify
          Caption = #36215#22987#26085#26399
          Visible = False
        end
        object txt1: TStaticText
          Left = 7
          Top = 17
          Width = 81
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
          TabOrder = 0
        end
        object lst1: TListBox
          Left = 7
          Top = 35
          Width = 81
          Height = 207
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ItemHeight = 13
          Items.Strings = (
            #20837#24211#21333#21495
            #26448#26009#32534#30721
            #26448#26009#21517#31216
            #26448#26009#35268#26684
            #20837#24211#26085#26399
            #20379' '#24212' '#21830
            #20837#24211#24037#21378
            #26448#26009#32452#21035
            #26448#26009#31867#21035
            #20837#24211#20179#24211
            #26377#25928#26085#26399)
          TabOrder = 1
          OnClick = lst1Click
        end
        object edt_value: TEdit
          Left = 93
          Top = 65
          Width = 153
          Height = 21
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 2
        end
        object dtp11: TDateTimePicker
          Left = 188
          Top = 66
          Width = 82
          Height = 21
          Date = 38974.000000000000000000
          Time = 38974.000000000000000000
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          Kind = dtkTime
          TabOrder = 3
          Visible = False
        end
        object btn_qryy: TBitBtn
          Left = 248
          Top = 65
          Width = 25
          Height = 25
          TabOrder = 4
          Visible = False
          OnClick = btn_qryyClick
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
        object rg1: TRadioGroup
          Left = 92
          Top = 99
          Width = 177
          Height = 39
          Caption = #26465#20214
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            #31561#20110' ='
            #30456#20284' Like')
          TabOrder = 5
        end
        object DTP22: TDateTimePicker
          Left = 188
          Top = 108
          Width = 82
          Height = 21
          Date = 38974.999305555550000000
          Time = 38974.999305555550000000
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          Kind = dtkTime
          TabOrder = 6
          Visible = False
        end
        object btn_add: TButton
          Left = 131
          Top = 151
          Width = 75
          Height = 25
          Caption = #22686#21152
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          OnClick = btn_addClick
        end
        object dtp1: TDateTimePicker
          Left = 93
          Top = 66
          Width = 94
          Height = 21
          Date = 42459.597108171300000000
          Time = 42459.597108171300000000
          TabOrder = 8
        end
        object dtp2: TDateTimePicker
          Left = 95
          Top = 108
          Width = 94
          Height = 22
          Date = 42459.598172627320000000
          Time = 42459.598172627320000000
          TabOrder = 9
        end
      end
    end
  end
end
