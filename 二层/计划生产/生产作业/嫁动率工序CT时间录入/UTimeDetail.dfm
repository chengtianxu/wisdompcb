object FrmTimeDetail: TFrmTimeDetail
  Left = 145
  Top = 123
  Width = 1338
  Height = 584
  Caption = #24037#24207'CT'#26102#38388#24405#20837
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 1322
    Height = 546
    Align = alClient
    TabOrder = 0
    object pnl2: TPanel
      Left = 1
      Top = 1
      Width = 1320
      Height = 48
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object lbl_field: TLabel
        Left = 504
        Top = 22
        Width = 52
        Height = 13
        Caption = #26412#21378#32534#21495
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lbl5: TLabel
        Left = 850
        Top = 27
        Width = 6
        Height = 12
        Color = cl3DLight
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbl7: TLabel
        Left = 768
        Top = 16
        Width = 39
        Height = 13
        Caption = #24037#33402#65306
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lbl2: TLabel
        Left = 1104
        Top = 16
        Width = 180
        Height = 13
        Caption = #20004#32773#20026#31354#26102#25165#20174#20135#21697'MI'#22788#26356#26032#36807#26469
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object btn1: TBitBtn
        Left = 8
        Top = 10
        Width = 70
        Height = 30
        Caption = #36864#20986
        TabOrder = 0
        OnClick = btn1Click
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
      object btn_refresh: TBitBtn
        Left = 78
        Top = 10
        Width = 70
        Height = 30
        Caption = #21047#26032
        TabOrder = 1
        OnClick = btn_refreshClick
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
      object btn3: TBitBtn
        Left = 210
        Top = 10
        Width = 70
        Height = 30
        Caption = #23548#20986
        TabOrder = 2
        OnClick = btn3Click
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
      object edt_value: TEdit
        Left = 581
        Top = 17
        Width = 121
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ImeMode = imDisable
        ParentFont = False
        TabOrder = 3
        OnChange = edt_valueChange
      end
      object btn4: TBitBtn
        Left = 276
        Top = 10
        Width = 70
        Height = 30
        Caption = #26597#35810
        TabOrder = 4
        OnClick = btn4Click
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
      object btn_import: TBitBtn
        Left = 148
        Top = 10
        Width = 63
        Height = 30
        Caption = #23548#20837
        TabOrder = 5
        OnClick = btn_importClick
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000B40E0000B40E00000001000000000000000000003300
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
          EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE09
          EEEEEEEEEEEEEEEEEEEEEEEEEEEEEE81EEEEEEEEEEEEEEEEEEEEEEEEEEEE0909
          EEEEEEEEEEEEEEEEEEEEEEEEEEEE8181EEEEEEEEEEEEEEEEEEEEEEEEEE090909
          09090909090909EEEEEEEEEEEE81818181818181818181EEEEEEEEEEEEEE0909
          EEEEEEEEEEEEEEEEEEEEEEEEEEEE8181EEEEEEEEEEEEEEEEEEEEEEEEEEEEEE09
          EEEEEEEEEEEEEEEEEEEEEEEEEEEEEE81EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
          EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEA37878787878
          78EEEE5E5E5E5E5E5E5E81818181818181EEEE81818181818181A3D5D5D5D5D5
          78EEEE5ED7D7D7D7D75E81ACACACACAC81EEEE81D7D7D7D7D781A3D5D5D5D5D5
          78EEEE5ED7D7D7D7D75E81ACACACACAC81EEEE81D7D7D7D7D781A3D5D5D5D5D5
          78EEEE5ED7D7D7D7D75E81ACACACACAC81EEEE81D7D7D7D7D781A3D5D5D5D5D5
          78EEEE5ED7D7D7D7D75E81ACACACACAC81EEEE81D7D7D7D7D781A3D5D5A3A3A3
          A3EEEE5ED7D75E5E5E5E81ACAC81818181EEEE81D7D781818181A3D5D5A3D678
          EEEEEE5ED7D75EE35EEE81ACAC81AC81EEEEEE81D7D781E381EEA3D5D5A378EE
          EEEEEE5ED7D75E5EEEEE81ACAC8181EEEEEEEE81D7D78181EEEEA3A3A3A3EEEE
          EEEEEE5E5E5E5EEEEEEE81818181EEEEEEEEEE81818181EEEEEE}
        NumGlyphs = 2
      end
      object cbb_craft: TComboBox
        Left = 808
        Top = 13
        Width = 113
        Height = 21
        ItemHeight = 13
        TabOrder = 6
        OnChange = cbb_craftChange
      end
      object btn2: TButton
        Left = 936
        Top = 12
        Width = 161
        Height = 26
        Caption = #26356#26032#21472#26495#25968#21644#29702#35770'CT'#26102#38388
        TabOrder = 7
        OnClick = btn2Click
      end
    end
    object pnl3: TPanel
      Left = 1
      Top = 504
      Width = 1320
      Height = 41
      Align = alBottom
      TabOrder = 1
      object lbl1: TLabel
        Left = 16
        Top = 8
        Width = 367
        Height = 16
        Caption = #27492#30028#38754#21482#33021#20462#25913#19977#20010'CT'#26102#38388#65292' '#22312#21491#38190#33756#21333#37324#20462#25913
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object pnl4: TPanel
      Left = 1
      Top = 49
      Width = 1320
      Height = 455
      Align = alClient
      TabOrder = 2
      object dbgrdh1: TDBGridEh
        Left = 1
        Top = 1
        Width = 1318
        Height = 453
        Align = alClient
        DataSource = ds_main
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        PopupMenu = pm_main
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnTitleClick = dbgrdh1TitleClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'rkey'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'CID'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'ProdNo'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'manu_part_number'
            Footers = <>
            Title.Caption = #26412#21378#32534#21495
          end
          item
            EditButtons = <>
            FieldName = 'layer'
            Footers = <>
            Title.Caption = #23618#25968
          end
          item
            EditButtons = <>
            FieldName = 'Machine'
            Footers = <>
            Title.Caption = #26426#21488
            Width = 65
          end
          item
            EditButtons = <>
            FieldName = 'PID'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'dept_code'
            Footers = <>
            Title.Caption = #24037#24207#32534#21495' '
          end
          item
            EditButtons = <>
            FieldName = 'dept_name'
            Footers = <>
            Title.Caption = #24037#24207#21517#31216
            Width = 152
          end
          item
            EditButtons = <>
            FieldName = 'StackNum'
            Footers = <>
            Title.Caption = #21472#26495#25968
            Width = 52
          end
          item
            EditButtons = <>
            FieldName = 'TCTTIme1'
            Footers = <>
            Title.Caption = #29702#35770'CT'#26102#38388
            Width = 69
          end
          item
            EditButtons = <>
            FieldName = 'CTTime1'
            Footers = <>
            Title.Caption = #23454#38469'CT'#26102#38388#65288#38253#23556'S'#38754'CT'#26102#38388#65289
            Width = 167
          end
          item
            EditButtons = <>
            FieldName = 'CTTime2'
            Footers = <>
            Title.Caption = #38253#23556'C'#38754'CT'#26102#38388
            Width = 94
          end
          item
            EditButtons = <>
            FieldName = 'AMan'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'user_full_name'
            Footers = <>
            Title.Caption = #32500#25252#20154
            Width = 75
          end
          item
            EditButtons = <>
            FieldName = 'Adate'
            Footers = <>
            Title.Caption = #32500#25252#26102#38388
            Width = 161
          end
          item
            EditButtons = <>
            FieldName = 'Cname'
            Footers = <>
            Title.Caption = #23233#21160#29575#31867#22411
          end>
      end
    end
  end
  object pm_main: TPopupMenu
    Left = 420
    Top = 168
    object N1: TMenuItem
      Caption = #26032#22686
      OnClick = N1Click
    end
    object CT2: TMenuItem
      Caption = #20462#25913#29702#35770'CT'#26102#38388
      OnClick = CT2Click
    end
    object SCT2: TMenuItem
      Caption = #20462#25913#23454#38469#25110#32773'S'#38754'CT'#26102#38388
      OnClick = SCT2Click
    end
    object CCT2: TMenuItem
      Caption = #20462#25913#38253#23556'C'#38754'CT'#26102#38388
      OnClick = CCT2Click
    end
    object N2: TMenuItem
      Caption = #21024#38500
      OnClick = N2Click
    end
  end
  object qry_main: TADOQuery
    Connection = DM.con1
    Parameters = <>
    SQL.Strings = (
      
        'select  a.* ,b.manu_part_number,c.dept_code, c.dept_name,d.user_' +
        'full_name,d578.Cname '
      'from  data0581 a  '
      'inner join data0025 b on a.prodno=b.rkey'
      'inner join data0034 c on a.pid=c.rkey'
      'left join  data0073 d on a.aman=d.rkey'
      'inner join data0578 d578 on a.cid=d578.rkey'
      'where 1=1')
    Left = 209
    Top = 185
    object atncfld_mainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object intgrfld_mainCID: TIntegerField
      FieldName = 'CID'
    end
    object intgrfld_mainProdNo: TIntegerField
      FieldName = 'ProdNo'
    end
    object strngfld_mainlayer: TStringField
      FieldName = 'layer'
      Size = 10
    end
    object strngfld_mainMachine: TStringField
      FieldName = 'Machine'
    end
    object intgrfld_mainPID: TIntegerField
      FieldName = 'PID'
    end
    object intgrfld_mainStackNum: TIntegerField
      FieldName = 'StackNum'
    end
    object intgrfld_mainAMan: TIntegerField
      FieldName = 'AMan'
    end
    object dtmfld_mainAdate: TDateTimeField
      FieldName = 'Adate'
    end
    object strngfld_mainmanu_part_number: TStringField
      FieldName = 'manu_part_number'
    end
    object strngfld_maindept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object strngfld_mainuser_full_name: TStringField
      FieldName = 'user_full_name'
      Size = 30
    end
    object strngfld_maindept_code: TStringField
      FieldName = 'dept_code'
      Size = 10
    end
    object strngfld_mainCname: TStringField
      FieldName = 'Cname'
    end
    object intgrfld_mainTCTTIme1: TIntegerField
      FieldName = 'TCTTIme1'
    end
    object fltfld_mainCTTime1: TFloatField
      FieldName = 'CTTime1'
    end
    object fltfld_mainCTTime2: TFloatField
      FieldName = 'CTTime2'
    end
  end
  object ds_main: TDataSource
    DataSet = qry_main
    Left = 257
    Top = 185
  end
  object qry_value: TADOQuery
    Connection = DM.con1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey2'
        Size = -1
        Value = Null
      end
      item
        Name = 'pName'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    SQL.Strings = (
      'SELECT     data0494.parameter_value'
      'FROM         dbo.Data0025 INNER JOIN'
      
        '                      dbo.Data0038 ON dbo.Data0025.RKEY = dbo.Da' +
        'ta0038.SOURCE_PTR INNER JOIN'
      
        '                      dbo.Data0034 ON dbo.Data0038.DEPT_PTR = db' +
        'o.Data0034.RKEY INNER JOIN'
      
        '                      dbo.Data0494 ON dbo.Data0038.SOURCE_PTR = ' +
        'dbo.Data0494.custpart_ptr AND dbo.Data0038.STEP_NUMBER = dbo.Dat' +
        'a0494.step_number INNER JOIN'
      
        '                      dbo.Data0278 ON dbo.Data0494.PARAMETER_PTR' +
        ' = dbo.Data0278.RKEY'
      'where  data0025.rkey=:rkey'
      'and  data0034.rkey=:rkey2'
      'and data0278.parameter_desc=:pName')
    Left = 321
    Top = 290
  end
  object qry_temp: TADOQuery
    Connection = DM.con1
    Parameters = <>
    Left = 641
    Top = 345
  end
end
