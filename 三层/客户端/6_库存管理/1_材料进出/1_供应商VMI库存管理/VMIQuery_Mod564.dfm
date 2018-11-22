inherited frmVMIQuery_Mod564: TfrmVMIQuery_Mod564
  Caption = #26448#26009'VMI'#20837#24211#26597#35810
  ClientHeight = 373
  ClientWidth = 563
  ExplicitWidth = 571
  ExplicitHeight = 400
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 563
    Height = 373
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 563
    ExplicitHeight = 373
    inherited pnl1: TPanel
      Width = 561
      Visible = False
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 561
      inherited btnSave: TBitBtn
        Visible = False
      end
      inherited btnClose: TBitBtn
        Visible = False
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 561
      Height = 338
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 561
      ExplicitHeight = 338
      object GroupBox1: TGroupBox
        Left = 1
        Top = 60
        Width = 288
        Height = 227
        Caption = #26448#26009#20837#24211#26597#35810
        TabOrder = 1
        object Label4: TLabel
          Left = 100
          Top = 92
          Width = 60
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #32456#27490#26085#26399
          Visible = False
        end
        object Label3: TLabel
          Left = 97
          Top = 50
          Width = 60
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #36215#22987#26085#26399
          Visible = False
        end
        object Label2: TLabel
          Left = 95
          Top = 32
          Width = 57
          Height = 13
          AutoSize = False
          Caption = #37319#36141#35746#21333
        end
        object DTTm1: TDateTimePicker
          Left = 188
          Top = 67
          Width = 82
          Height = 21
          Date = 38974.000000000000000000
          Time = 38974.000000000000000000
          Kind = dtkTime
          TabOrder = 7
          Visible = False
        end
        object DTPk2: TDateTimePicker
          Left = 92
          Top = 108
          Width = 95
          Height = 21
          Date = 37575.000000000000000000
          Time = 37575.000000000000000000
          ImeMode = imDisable
          TabOrder = 0
          Visible = False
        end
        object DTPk1: TDateTimePicker
          Left = 92
          Top = 66
          Width = 95
          Height = 21
          Date = 37257.000000000000000000
          Time = 37257.000000000000000000
          TabOrder = 1
          Visible = False
        end
        object Button1: TButton
          Left = 107
          Top = 143
          Width = 75
          Height = 25
          Caption = #22686#21152
          TabOrder = 3
          OnClick = Button1Click
        end
        object BitBtn4: TBitBtn
          Left = 240
          Top = 65
          Width = 25
          Height = 25
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
          TabOrder = 4
          Visible = False
          OnClick = BitBtn4Click
        end
        object ListBox1: TListBox
          Left = 7
          Top = 35
          Width = 81
          Height = 184
          ImeMode = imDisable
          ItemHeight = 13
          TabOrder = 5
          OnClick = ListBox1Click
        end
        object StaticText1: TStaticText
          Left = 7
          Top = 18
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
          TabOrder = 6
        end
        object Edit1: TEdit
          Left = 103
          Top = 67
          Width = 139
          Height = 21
          ImeMode = imDisable
          TabOrder = 2
        end
        object DTTm2: TDateTimePicker
          Left = 188
          Top = 108
          Width = 82
          Height = 21
          Date = 38974.999305555550000000
          Time = 38974.999305555550000000
          Kind = dtkTime
          TabOrder = 8
          Visible = False
        end
      end
      object GroupBox2: TGroupBox
        Left = 1
        Top = 61
        Width = 288
        Height = 226
        Caption = #26448#26009#20986#24211#26597#35810
        TabOrder = 2
        Visible = False
        object Label1: TLabel
          Left = 98
          Top = 96
          Width = 60
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #32456#27490#26085#26399
          Visible = False
        end
        object Label6: TLabel
          Left = 94
          Top = 39
          Width = 60
          Height = 13
          AutoSize = False
          Caption = #20986#20179#21333#21495
        end
        object Label5: TLabel
          Left = 98
          Top = 54
          Width = 60
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #36215#22987#26085#26399
          Visible = False
        end
        object dttm3: TDateTimePicker
          Left = 186
          Top = 70
          Width = 86
          Height = 21
          Date = 38974.000000000000000000
          Time = 38974.000000000000000000
          Kind = dtkTime
          TabOrder = 7
          Visible = False
        end
        object ListBox2: TListBox
          Left = 8
          Top = 33
          Width = 81
          Height = 190
          ImeMode = imDisable
          ItemHeight = 13
          TabOrder = 0
          OnClick = ListBox2Click
        end
        object StaticText3: TStaticText
          Left = 8
          Top = 17
          Width = 81
          Height = 16
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
          TabOrder = 1
        end
        object DtPk4: TDateTimePicker
          Left = 92
          Top = 111
          Width = 95
          Height = 21
          Date = 37575.906419108790000000
          Time = 37575.906419108790000000
          TabOrder = 2
          Visible = False
        end
        object DtPk3: TDateTimePicker
          Left = 92
          Top = 70
          Width = 95
          Height = 21
          Date = 37257.000000000000000000
          Time = 37257.000000000000000000
          TabOrder = 3
          Visible = False
        end
        object Button2: TButton
          Left = 107
          Top = 143
          Width = 75
          Height = 25
          Caption = #22686#21152
          TabOrder = 5
          OnClick = Button2Click
        end
        object BitBtn5: TBitBtn
          Left = 238
          Top = 81
          Width = 25
          Height = 25
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
          TabOrder = 6
          Visible = False
          OnClick = BitBtn5Click
        end
        object Edit2: TEdit
          Left = 98
          Top = 84
          Width = 139
          Height = 21
          ImeMode = imDisable
          TabOrder = 4
        end
        object dttm4: TDateTimePicker
          Left = 188
          Top = 111
          Width = 86
          Height = 21
          Date = 38974.999305555550000000
          Time = 38974.999305555550000000
          ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
          Kind = dtkTime
          TabOrder = 8
          Visible = False
        end
      end
      object GroupBox3: TGroupBox
        Left = 2
        Top = 62
        Width = 286
        Height = 224
        Caption = #26448#26009#24211#23384#26597#35810
        TabOrder = 3
        Visible = False
        object Label21: TLabel
          Left = 101
          Top = 42
          Width = 57
          Height = 13
          AutoSize = False
          Caption = #26448#26009#32534#30721
        end
        object Button7: TButton
          Left = 107
          Top = 143
          Width = 75
          Height = 25
          Caption = #22686#21152
          TabOrder = 1
          OnClick = Button7Click
        end
        object BitBtn11: TBitBtn
          Left = 242
          Top = 63
          Width = 25
          Height = 25
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
          TabOrder = 2
          OnClick = BitBtn11Click
        end
        object ListBox3: TListBox
          Left = 7
          Top = 36
          Width = 81
          Height = 172
          ImeMode = imDisable
          ItemHeight = 13
          TabOrder = 3
          OnClick = ListBox3Click
        end
        object StaticText8: TStaticText
          Left = 7
          Top = 19
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
          TabOrder = 4
        end
        object Edit7: TEdit
          Left = 105
          Top = 65
          Width = 139
          Height = 21
          ImeMode = imDisable
          ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
          TabOrder = 0
        end
      end
      object RadioGroup1: TRadioGroup
        Left = 9
        Top = 5
        Width = 534
        Height = 49
        Caption = #26597#25214#20869#23481
        Columns = 3
        Enabled = False
        Items.Strings = (
          #26448#26009#20837#24211
          #26448#26009#20986#24211
          #26448#26009#24211#23384)
        TabOrder = 0
        OnClick = RadioGroup1Click
      end
      object StaticText2: TStaticText
        Left = 295
        Top = 60
        Width = 248
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
      object SGrid1: TStringGrid
        Left = 296
        Top = 76
        Width = 249
        Height = 211
        ColCount = 3
        DefaultRowHeight = 19
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        PopupMenu = PopupMenu1
        ScrollBars = ssVertical
        TabOrder = 5
        ColWidths = (
          76
          167
          250)
      end
      object BitBtn1: TBitBtn
        Left = 178
        Top = 298
        Width = 75
        Height = 30
        Caption = #26597#25214
        Default = True
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
        ModalResult = 1
        NumGlyphs = 2
        TabOrder = 6
      end
      object BitBtn3: TBitBtn
        Left = 291
        Top = 299
        Width = 75
        Height = 29
        Caption = #20851#38381
        Default = True
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000520B0000520B00000001000000000000000000003300
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
          EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEA5D8
          D8D8D8D8A5EEEEEEEEEEEEEEEEEEAC8181818181ACEEEEEEEEEEEEEEEED890B4
          B4B4B4B490D8EEEEEEEEEEEEEE81E2ACACACACACE281EEEEEEEEEEEED8B4B4B4
          B4B4B4B4B4B4D8EEEEEEEEEE81ACACACACACACACACAC81EEEEEEEED8B4B4B4B4
          B4B4B4B4B4B4B4D8EEEEEE81ACACACACACACACACACACAC81EEEEA590B4B4D7D7
          B4B4B4D7D7B4B490A5EEACE2ACACD7D7ACACACD7D7ACACE2ACEED8B4B4B4D7D7
          D7B4D7D7D7B4B4B4D8EE81ACACACD7D7D7ACD7D7D7ACACAC81EED8B4B4B4B4D7
          D7D7D7D7B4B4B4B4D8EE81ACACACACD7D7D7D7D7ACACACAC81EED8B4B4B4B4B4
          D7D7D7B4B4B4B4B4D8EE81ACACACACACD7D7D7ACACACACAC81EED8B4B4B4B4D7
          D7D7D7D7B4B4B4B4D8EE81ACACACACD7D7D7D7D7ACACACAC81EED8B4B4B4D7D7
          D7B4D7D7D7B4B4B4D8EE81ACACACD7D7D7ACD7D7D7ACACAC81EEA590B4B4D7D7
          B4B4B4D7D7B4B490A5EEACE2ACACD7D7ACACACD7D7ACACE2ACEEEED8B4B4B4B4
          B4B4B4B4B4B4B4D8EEEEEE81ACACACACACACACACACACAC81EEEEEEEED8B4B4B4
          B4B4B4B4B4B4D8EEEEEEEEEE81ACACACACACACACACAC81EEEEEEEEEEEED890B4
          B4B4B4B490D8EEEEEEEEEEEEEE81E2ACACACACACE281EEEEEEEEEEEEEEEEA5D8
          D8D8D8D8A5EEEEEEEEEEEEEEEEEEAC8181818181ACEEEEEEEEEE}
        ModalResult = 2
        NumGlyphs = 2
        TabOrder = 7
      end
      object RGp4: TRadioGroup
        Left = 295
        Top = 262
        Width = 255
        Height = 31
        Caption = #26597#35810#32467#26524
        Columns = 2
        Enabled = False
        ItemIndex = 0
        Items.Strings = (
          #26126#32454
          #27719#24635)
        TabOrder = 8
        Visible = False
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 424
    Top = 168
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = N1Click
    end
  end
end
