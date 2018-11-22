object frmMain: TfrmMain
  Left = 288
  Top = 262
  Width = 831
  Height = 560
  Caption = #23487#33293#36153#29992#35745#31639
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 815
    Height = 41
    Align = alTop
    TabOrder = 0
    object lbFilter: TLabel
      Left = 374
      Top = 15
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #25151#38388#21517#65306
    end
    object Label2: TLabel
      Left = 580
      Top = 16
      Width = 65
      Height = 13
      Caption = #35745#31639#26376#20221#65306
    end
    object btnExit: TBitBtn
      Left = 1
      Top = 2
      Width = 72
      Height = 36
      Caption = #36864#20986
      TabOrder = 0
      OnClick = btnExitClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
    object btnRefresh: TBitBtn
      Left = 73
      Top = 2
      Width = 72
      Height = 36
      Caption = #21047#26032
      TabOrder = 1
      OnClick = btnRefreshClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADABFBFBDADADADADADDADADBFADADADADAADADAD000DADADADDADAD0FBF0DA
        DADAADAD0F7FBF0DADADDAD0F7F87BF0DADAAD0F7F87BFB70DADD0F7F87BFB78
        80DA000F87BFB78880ADDAD00BFB78880ADAADADA0B7888740ADDADADA088804
        440AADADADA000A04440DADADADADADA0440ADADADADADADA00D}
    end
    object btnExport: TBitBtn
      Left = 145
      Top = 2
      Width = 72
      Height = 36
      Caption = #23548#20986
      TabOrder = 2
      OnClick = btnExportClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
        EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
        DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
        70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
    end
    object btnInit: TBitBtn
      Left = 217
      Top = 2
      Width = 72
      Height = 36
      Caption = #21021#22987#21270
      TabOrder = 3
      OnClick = btnInitClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADA000000000000ADAD0FFFFFFFFFF0DADA0F00F00000F0ADAD0FFFFFFFFFF0
        DADA0F00F00000F0ADAD0FFFFFFFFFF0DADA0FFFFFFF0FF0ADAD0FF0FFF080F0
        DAD40F080F0808000D440FF08080808880440000080808888844DADAD0808888
        8844ADADAD0888888044DADADAD000000A44ADADADADADADADAD}
    end
    object btnCalc: TBitBtn
      Left = 289
      Top = 2
      Width = 72
      Height = 36
      Caption = #35745#31639
      TabOrder = 4
      OnClick = btnCalcClick
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
        0000000000000000000000000000000000000000000000000000EEEEEEEEEEAA
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEE81EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEAA
        A2EEEEEEEEEEEEEEEEEEEEEEEEEEEE8181EEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        AAA2EEEEEEEEEEEEEEEEEEEEEEEEEEEE8181EEEEEEEEEEEEEEEEEEEEEEEEEEEE
        AAD5A2EEEEEEEEEEEEEEEEEEEEEEEEEE81E381EEEEEEEEEEEEEEEEEEEEEEAAA2
        A2A2D4A2EEEEEEEEEEEEEEEEEEEE81818181AC81EEEEEEEEEEEEEEEEEEEEAAD5
        D4D4D4D4A2EEEEEEEEEEEEEEEEEE81E3ACACACAC81EEEEEEEEEEEEEEEEEEEEAA
        D5D4A2AAAAAAEEEEEEEEEEEEEEEEEE81E3AC81818181EEEEEEEEEEEEEEEEEEAA
        D5D4D4A2EEEEEEEEEEEEEEEEEEEEEE81E3ACAC81EEEEEEEEEEEEEEEEAAA2A2A2
        A2D5D4D4A2EEEEEEEEEEEEEE8181818181E3ACAC81EEEEEEEEEEEEEEAAD5D5D4
        D4D4D4D4D4A2EEEEEEEEEEEE81E3E3ACACACACACAC81EEEEEEEEEEEEEEAAD5D5
        D4D4A2AAAAAAEEEEEEEEEEEEEE81E3E3ACAC81818181EEEEEEEEEEEEEEAAD5D5
        D5D4D4A2EEEEEEEEEEEEEEEEEE81E3E3E3ACAC81EEEEEEEEEEEEEEEEEEEEAAD5
        D5D5D4D4A2EEEEEEEEEEEEEEEEEE81E3E3E3ACAC81EEEEEEEEEEEEEEEEEEAAD5
        D5D5D4D4D4A2EEEEEEEEEEEEEEEE81E3E3E3ACACAC81EEEEEEEEEEEEEEEEEEAA
        D5D5D5D4D4D4A2EEEEEEEEEEEEEEEE81E3E3E3ACACAC81EEEEEEEEEEEEEEEEAA
        AAAAAAAAAAAAAAAAEEEEEEEEEEEEEE818181818181818181EEEE}
      NumGlyphs = 2
    end
    object edtFilter: TEdit
      Left = 429
      Top = 11
      Width = 121
      Height = 21
      TabOrder = 5
      OnChange = edtFilterChange
    end
    object cbbyearmonth: TComboBox
      Left = 644
      Top = 12
      Width = 97
      Height = 21
      ItemHeight = 13
      TabOrder = 6
      OnChange = cbbyearmonthChange
    end
    object pnl1: TPanel
      Left = 768
      Top = 1
      Width = 46
      Height = 39
      Align = alRight
      TabOrder = 7
      object lbl1: TLabel
        Left = 12
        Top = 14
        Width = 26
        Height = 13
        Align = alCustom
        Caption = #24110#21161
        OnClick = lbl1Click
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 815
    Height = 480
    Align = alClient
    TabOrder = 1
    object pcMain: TPageControl
      Left = 1
      Top = 1
      Width = 813
      Height = 478
      ActivePage = tsEmp
      Align = alClient
      TabOrder = 0
      OnChange = pcMainChange
      object tsBedroom: TTabSheet
        Caption = #23487#33293#36153#29992
        object Panel3: TPanel
          Left = 0
          Top = 304
          Width = 805
          Height = 147
          Align = alBottom
          TabOrder = 0
          object dbAux: TDBGridEh
            Left = 1
            Top = 1
            Width = 803
            Height = 145
            Align = alClient
            DataSource = DM.DataSource2
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -13
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            TabOrder = 0
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            Columns = <
              item
                EditButtons = <>
                FieldName = 'employeecode'
                Footers = <>
                Width = 55
              end
              item
                EditButtons = <>
                FieldName = 'chinesename'
                Footers = <>
                Width = 61
              end
              item
                EditButtons = <>
                FieldName = 'B_code'
                Footers = <>
                Width = 72
              end
              item
                EditButtons = <>
                FieldName = 'startdate'
                Footers = <>
                Width = 78
              end
              item
                EditButtons = <>
                FieldName = 'enddate'
                Footers = <>
                Width = 77
              end
              item
                EditButtons = <>
                FieldName = 'stay_days'
                Footers = <>
                Width = 58
              end
              item
                EditButtons = <>
                FieldName = 'subfees'
                Footers = <>
              end>
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 805
          Height = 304
          Align = alClient
          TabOrder = 1
          object dbBedroom: TDBGridEh
            Left = 1
            Top = 1
            Width = 803
            Height = 302
            Align = alClient
            DataSource = DM.DataSource1
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -13
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
            TabOrder = 0
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            OnKeyDown = dbBedroomKeyDown
            OnTitleClick = dbBedroomTitleClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'D_name'
                Footers = <>
                Width = 81
              end
              item
                EditButtons = <>
                FieldName = 'r_code'
                Footers = <>
                Width = 83
              end
              item
                EditButtons = <>
                FieldName = 'r_name'
                Footers = <>
                Title.Color = clRed
                Width = 68
              end
              item
                EditButtons = <>
                FieldName = 'yearmonth'
                Footers = <>
                Width = 62
              end
              item
                EditButtons = <>
                FieldName = 'last_fees'
                Footers = <>
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'electic_f'
                Footers = <>
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'water_f'
                Footers = <>
                Width = 49
              end
              item
                EditButtons = <>
                FieldName = 'R_decrease_e'
                Footers = <>
                Width = 71
              end
              item
                EditButtons = <>
                FieldName = 'R_decrease_w'
                Footers = <>
                Width = 70
              end
              item
                EditButtons = <>
                FieldName = 'person_freque'
                Footers = <>
                Width = 59
              end
              item
                EditButtons = <>
                FieldName = 'sould_pay'
                Footers = <>
                Width = 67
              end>
          end
        end
      end
      object tsEmp: TTabSheet
        Caption = #21592#24037#36153#29992
        ImageIndex = 1
        object dbEmp: TDBGridEh
          Left = 0
          Top = 0
          Width = 805
          Height = 450
          Align = alClient
          DataSource = DM.DataSource3
          FooterColor = clWindow
          FooterFont.Charset = GB2312_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -13
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
          TabOrder = 0
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnKeyDown = dbEmpKeyDown
          OnTitleClick = dbEmpTitleClick
          Columns = <
            item
              EditButtons = <>
              FieldName = 'D_name'
              Footers = <>
              Width = 80
            end
            item
              EditButtons = <>
              FieldName = 'r_name'
              Footers = <>
              Title.Color = clRed
              Width = 53
            end
            item
              EditButtons = <>
              FieldName = 'grade'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'B_code'
              Footers = <>
              Width = 68
            end
            item
              EditButtons = <>
              FieldName = 'employeecode'
              Footers = <>
              Width = 57
            end
            item
              EditButtons = <>
              FieldName = 'chinesename'
              Footers = <>
              Width = 58
            end
            item
              EditButtons = <>
              FieldName = 'position'
              Footers = <>
              Width = 63
            end
            item
              EditButtons = <>
              FieldName = 'StayGrade'
              Footers = <>
              Title.Caption = #20303#23487#31561#32423
              Width = 61
            end
            item
              EditButtons = <>
              FieldName = 'strcouple'
              Footers = <>
              Width = 42
            end
            item
              EditButtons = <>
              FieldName = 'departmentname'
              Footers = <>
              Width = 105
            end
            item
              EditButtons = <>
              FieldName = 'factoryarea'
              Footers = <>
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'startdate'
              Footers = <>
              Width = 76
            end
            item
              EditButtons = <>
              FieldName = 'enddate'
              Footers = <>
              Width = 76
            end
            item
              EditButtons = <>
              FieldName = 'stay_days'
              Footers = <>
              Width = 63
            end
            item
              EditButtons = <>
              FieldName = 'subefees'
              Footers = <>
              Width = 53
            end
            item
              EditButtons = <>
              FieldName = 'subwfees'
              Footers = <>
              Width = 47
            end
            item
              EditButtons = <>
              FieldName = 'subrfees'
              Footers = <>
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'totalfees'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'buzhu'
              Footers = <>
              Width = 71
            end
            item
              EditButtons = <>
              FieldName = 'subfees'
              Footers = <>
              Width = 85
            end>
        end
      end
    end
  end
end
