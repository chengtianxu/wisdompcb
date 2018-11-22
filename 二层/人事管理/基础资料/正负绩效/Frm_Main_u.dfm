object FrmMain: TFrmMain
  Left = 292
  Top = 255
  Width = 832
  Height = 540
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #21592#24037#22870#24809
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 824
    Height = 513
    ActivePage = ts2
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    OnChange = pgc1Change
    object ts1: TTabSheet
      Caption = #21592#24037#22870#24809#26126#32454
      object bvl1: TBevel
        Left = 0
        Top = 0
        Width = 816
        Height = 73
        Align = alTop
      end
      object lb_1: TLabel
        Left = 24
        Top = 17
        Width = 48
        Height = 12
        Caption = #21592#24037#24037#21495
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object btn1: TSpeedButton
        Left = 17
        Top = 43
        Width = 60
        Height = 22
        Caption = #37096#38376#20195#30721
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        OnClick = btn1Click
      end
      object lb_14: TLabel
        Left = 152
        Top = 18
        Width = 90
        Height = 12
        Caption = '*'#20026#26597#35810#20840#37096#35760#24405
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lb_5: TLabel
        Left = 451
        Top = 16
        Width = 12
        Height = 13
        Caption = #33267
      end
      object dbgrd1: TDBGrid
        Left = 0
        Top = 73
        Width = 816
        Height = 409
        Align = alClient
        DataSource = DM.dsSorceJC
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        PopupMenu = pm_1
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnDrawColumnCell = dbgrd1DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'employeecode'
            Title.Caption = #21592#24037#24037#21495
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'chinesename'
            Title.Caption = #21592#24037#22995#21517
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'departmentname'
            Title.Caption = #25152#23646#37096#38376
            Width = 115
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'item'
            Title.Caption = #22870#24809#31867#22411
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'money'
            Title.Caption = #37329#39069'('#65509')'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'effectdate'
            Title.Caption = #29983#25928#26102#38388
            Width = 127
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'remark'
            Title.Caption = #22791#27880
            Width = 258
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'flag'
            Visible = False
          end>
      end
      object bbt_1: TBitBtn
        Left = 581
        Top = 8
        Width = 75
        Height = 30
        Caption = #26597#35810
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = bbt_1Click
        Glyph.Data = {
          F2060000424DF206000000000000360400002800000019000000190000000100
          080000000000BC0200001217000012170000000100000000000000000000F8F8
          0000B0B0B00080808000F8600000F0F8F80060606000C8F8C80048484800D0E0
          E00098300000F8C89800F8F8980060000000F898000098989800F86060003030
          3000F8F83000F8F8C800F8E8C800C8C8C800F8F8F8001818180070707000C0C0
          C000E8E8E8005050500000000000000000000000000000000000000000000000
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
          00000013000088331700000000000000E400F712000035A6FC00770000001300
          0700A7FC7700080613000083A600FC7700000000000035A5FC0077FFFF000000
          7C00010000000000000000000000000000000000000000000000000000000000
          4300000000000039F000008800008A0098006317000078011300009863001700
          78000113000090631700000000000000C000F7120000C8F3EB007770F5001200
          0000ECFD7F0002000000000000001300F2000100000001000A0000884000F877
          8800331700000100000000998400E6775400F71200000101010001D8F8001200
          450090FB7700801FF80077FFFF00FFFF6000F8120000AD84E6007760F8001200
          D80084E677000000000000FFFF000000E40039F00000E439F000001800000000
          00000000000044F8120000400000000000000000000028F81200000000000000
          00000000000000000000000C000000000200000000000101120000872B00F877
          0000ECFD7F00000000000002000000009000001A020090331700007FFF00FFFF
          00000000000090331700000500000000870031E6770084F8120000218600E677
          9800F81200006713000010FFFF0000007C0001000000E439F000000000000000
          7000F8120000ACF8120000D8F8001200100030001000F8400000105F5400E677
          7C0001000000D0F8120000D8F80012000800000000000E000000161616161616
          1616161616161616161616161616161616161600000016161616161616161616
          1616161616161616161616161616160000001616161616161616161616161616
          16161616161616161616160000001616161616161616161616161616161616F9
          0F161616161616000000161616161616161616161616161616160A0E040D1616
          1616160000001616161616161616181B1B1B1B1B1B0A0E0ED90D1B0816161600
          00001616161616161616181515151515B50E010E0D030F181616160000001616
          16161616161618050505050F0EFB048302151A0F051616000000161616161616
          1616180909090A0E0E040D0F090505031616160000001616161616161616180F
          150600010E0D03150505050F051616000000161616161602020318A318030211
          E30F19191905050316161600000016161616180B0C1513070B181706030F0F0F
          0F05050F05161600000016161616180C0715130FE90B18171909090909050503
          161616000000161616020B1A14151312120B0B170F0F0F0F0F05050F05161600
          00001616160213131A0907AA0F12191702190219020509031616160000001616
          160213050515140F0F0F0B1802090909A709191816161600000016161602131A
          0515071212121818191A050509190F06161616000000161616090F0C14091319
          0B0F18190219051903061B08161616000000161616161618180B0B0B0F18091A
          0505051505091902051616000000161616161616031818180F14050505050515
          09191B05161616000000161616161616161603091A05050505050515191B1616
          1616160000001616161616161616031902191902190219020F16161616161600
          0000161616161616161616161605161616160505161616161616160000001616
          1616161616161616161616161616161616161616161616000000161616161616
          16161616161616161616161616161616161616000000}
      end
      object edt_2: TEdit
        Left = 80
        Top = 44
        Width = 65
        Height = 20
        Color = cl3DLight
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
        ParentFont = False
        TabOrder = 2
      end
      object edt_1: TEdit
        Left = 80
        Top = 13
        Width = 65
        Height = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
        ParentFont = False
        TabOrder = 3
        Text = '*'
        OnKeyPress = edt_1KeyPress
      end
      object edt_6: TEdit
        Left = 144
        Top = 44
        Width = 105
        Height = 21
        Color = cl3DLight
        Enabled = False
        ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
        TabOrder = 4
      end
      object chk_1: TCheckBox
        Left = 285
        Top = 46
        Width = 72
        Height = 17
        Caption = #36733#20837#31508#25968
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 5
      end
      object chk_2: TCheckBox
        Left = 285
        Top = 16
        Width = 73
        Height = 17
        Caption = #29983#25928#26085#26399
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 6
      end
      object dtp1: TDateTimePicker
        Left = 357
        Top = 13
        Width = 89
        Height = 20
        Date = 40865.594900706020000000
        Time = 40865.594900706020000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
        ParentFont = False
        TabOrder = 7
      end
      object edt_3: TEdit
        Left = 357
        Top = 43
        Width = 41
        Height = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
        ParentFont = False
        TabOrder = 8
        Text = '100'
        OnKeyPress = edt_3KeyPress
      end
      object dtp2: TDateTimePicker
        Left = 469
        Top = 13
        Width = 89
        Height = 20
        Date = 40865.595766053240000000
        Time = 40865.595766053240000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
        ParentFont = False
        TabOrder = 9
      end
      object bbt_2: TBitBtn
        Left = 660
        Top = 8
        Width = 75
        Height = 30
        Caption = '&C'#20851#38381
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        OnClick = bbt_2Click
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
    end
    object ts2: TTabSheet
      Caption = #20010#20154#26376#22870#24809#27719#24635
      ImageIndex = 1
      object grb_2: TGroupBox
        Left = 0
        Top = 0
        Width = 816
        Height = 482
        Align = alClient
        Caption = #27719#24635#20449#24687
        TabOrder = 0
        object lb_2: TLabel
          Left = 15
          Top = 22
          Width = 156
          Height = 12
          Caption = #35831#36755#20837#24744#35201#26597#35810#30340#26376#20221#21644#24180#20221
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object bbt_4: TBitBtn
          Left = 262
          Top = 14
          Width = 91
          Height = 25
          Caption = '&S'#27719#24635
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = bbt_4Click
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
            000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000FF
            FF00000000000000000000000000FF00FF000000000000000000000000000000
            000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
            000000000000FFFF0000000000000000000000FFFF00FFFFFF0000FFFF00FFFF
            FF0000FFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00000000000000
            000000000000FFFF00000000000000FFFF00FFFFFF0000FFFF00FFFFFF000000
            00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00000000000000
            000000000000FFFF000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
            FF0000FFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00000000000000
            000000000000FFFF00000000000000FFFF00FFFFFF0000FFFF00FFFFFF000000
            00000000000000000000000000000000000000000000FF00FF00000000000000
            000000000000FFFF000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
            FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000000000000000
            000000000000FFFF00000000000000FFFF00FFFFFF0000000000000000000000
            00000000000000000000000000000000000000000000FF00FF00000000000000
            00000000000000000000000000000000000000FFFF00FFFFFF0000FFFF000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
        object dtp4: TDateTimePicker
          Left = 176
          Top = 16
          Width = 81
          Height = 20
          Date = 40868.767828587970000000
          Format = 'yyyy-MM'
          Time = 40868.767828587970000000
          DateMode = dmUpDown
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
          ParentFont = False
          TabOrder = 1
        end
        object dbgrd2: TDBGrid
          Left = 2
          Top = 48
          Width = 812
          Height = 432
          Align = alBottom
          DataSource = DM.dataSourceJC
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
          ParentFont = False
          TabOrder = 2
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'employeecode'
              Title.Caption = #21592#24037#24037#21495
              Width = 67
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'chinesename'
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              Title.Caption = #21592#24037#22995#21517
              Width = 68
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'departmentname'
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              Title.Caption = #25152#23646#37096#38376
              Title.Font.Charset = GB2312_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = #23435#20307
              Title.Font.Style = []
              Width = 146
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZJL'
              Title.Caption = #26412#26376#24635#22870#21169#37329#39069
              Width = 93
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZCF'
              Title.Caption = #26412#26376#24635#24809#32602#37329#39069
              Title.Font.Charset = GB2312_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = #23435#20307
              Title.Font.Style = []
              Width = 93
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZG'
              Title.Caption = #26412#26376#22870#24809#23454#24471#37329#39069
              Width = 107
              Visible = True
            end>
        end
        object bbt_3: TBitBtn
          Left = 355
          Top = 14
          Width = 105
          Height = 25
          Caption = #23548#20986#21040'EXCEL'
          TabOrder = 3
          OnClick = bbt_3Click
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
      end
    end
  end
  object pm_1: TPopupMenu
    Left = 592
    Top = 200
    object N1: TMenuItem
      Caption = #22686#21152#20010#20154#22870#24809#35760#24405
      OnClick = bbt_5Click
    end
    object N4: TMenuItem
      Caption = #25209#37327#22686#21152#22870#24809#35760#24405
      OnClick = N4Click
    end
    object N2: TMenuItem
      Tag = 1
      Caption = #20462#25913#22870#24809#35760#24405
      OnClick = N2Click
    end
    object N3: TMenuItem
      Tag = 2
      Caption = #21024#38500#22870#24809#35760#24405
      OnClick = N3Click
    end
    object EXCEL1: TMenuItem
      Caption = #23548#20986#21040'EXCEL'
      OnClick = EXCEL1Click
    end
  end
end
