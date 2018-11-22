object Form5: TForm5
  Left = 453
  Top = 171
  Width = 738
  Height = 561
  Caption = #39046#26009#21333#26597#35810'/'#37325#21360'/'#36864#20179
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 345
    Width = 722
    Height = 6
    Cursor = crVSplit
    Align = alBottom
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 722
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 270
      Top = 14
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #20837#20179#21333#21495
    end
    object csi_ptr: TLabel
      Left = 91
      Top = 7
      Width = 7
      Height = 13
      Caption = '4'
      Visible = False
    end
    object vprev: TLabel
      Left = 107
      Top = 6
      Width = 7
      Height = 13
      Caption = '4'
      Visible = False
    end
    object db_ptr: TLabel
      Left = 96
      Top = 24
      Width = 7
      Height = 13
      Caption = '0'
      Visible = False
    end
    object BitBtn1: TBitBtn
      Left = 6
      Top = 5
      Width = 55
      Height = 29
      Cursor = crHandPoint
      Hint = #36864#20986
      Caption = #36864#20986
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = False
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
    object Edit1: TEdit
      Left = 325
      Top = 10
      Width = 121
      Height = 21
      TabOrder = 1
      OnChange = Edit1Change
    end
    object GroupBox2: TGroupBox
      Left = 452
      Top = 0
      Width = 259
      Height = 38
      Caption = #26085#26399#33539#22260
      TabOrder = 2
      object Label8: TLabel
        Left = 6
        Top = 17
        Width = 20
        Height = 13
        Alignment = taRightJustify
        Caption = #20174':'
      end
      object Label9: TLabel
        Left = 134
        Top = 17
        Width = 20
        Height = 13
        Alignment = taRightJustify
        Caption = #21040':'
      end
      object dtpk1: TDateTimePicker
        Left = 30
        Top = 13
        Width = 97
        Height = 21
        Date = 37600.000000000000000000
        Time = 37600.000000000000000000
        TabOrder = 0
        OnCloseUp = dtpk1CloseUp
        OnExit = dtpk1CloseUp
      end
      object DTPk2: TDateTimePicker
        Left = 156
        Top = 13
        Width = 97
        Height = 21
        Date = 37600.000000000000000000
        Time = 37600.000000000000000000
        TabOrder = 1
        OnCloseUp = dtpk1CloseUp
        OnExit = dtpk1CloseUp
      end
    end
    object BitBtn3: TBitBtn
      Left = 62
      Top = 5
      Width = 55
      Height = 29
      Hint = #21047#26032#25968#25454
      Caption = #21047#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BitBtn3Click
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
    object BitBtn2: TBitBtn
      Left = 118
      Top = 5
      Width = 55
      Height = 29
      Caption = #23450#20041
      PopupMenu = PopupMenu4
      TabOrder = 4
      OnClick = BitBtn2Click
      Glyph.Data = {
        5E060000424D5E06000000000000360400002800000017000000170000000100
        08000000000028020000C40E0000C40E0000000100000000000000000000A0E8
        F00048B0E8000028C8005068500000007800C0B8B0005060D00040402000B0B0
        900078707000F8F0D00098A8A0000878D8000060B8000000500008508000E0F0
        D800B8C0F80080A898001060A0000068D80098B8F8005050580050589000A0A0
        9000A8D0E80048A0E8003888D000E0B8E80020100000305858000040B0001048
        C000F0E0F80070B0B8006870900080B0F800C8F8C8000060D0004890F800A0D8
        E0003070C800D8F0F8009090800028507000706868000880F800E8E0F000A8C8
        D8005068B0005868A00038308000D0A09000D0B0D80090A8D800E0E0F0007090
        E0000000100098A0E8006888D800003880003030480080B0F0000028500060B0
        F800C0E0F80048405800B0D8C000C0E0E000C0E8E80038608800C0D0D0000850
        B8000068F8001858D0008080A000B0E0F000C8F0F8000050C8002090E80080B0
        E000B8D8E000A8D0B800F0F8F800F0F8D800003080007880E8000850B00040B0
        F80080A0A800D8D8F00050A0F800F8F0F8004098F00088E0F80000A0F8000008
        6000A0C8C000B0D0F000B8C8C800200828000070E8000878F0005060A0000038
        6800A8909800B0C0C8008040600068B0F000D8F8F80048C8F8000800080080C0
        D800D0D8F000001820004880D80070888800002870005860700078889000A0D0
        D0001858A8000078C00008104000E0F0F000083850000060E800C8F0F000B8E8
        F8000050A80050C0F800A8B0F000B0A0A00080C8F800E8D8E0009098A800C0F0
        F8000048D0004040400058587000383868007088A0002070F00060B0E8003888
        F00098B0B8004068A0004888F0000868E00068C8F8006098E800D8D0B000D0C0
        D000E0D8D80088807000C0A0C00090C0F800082080001090E0008090A000B8D8
        F800B0D8D80058B0F800D0E0F000708080002080F8000848A000F8F0F0001050
        D0004090E0001860B800705060000040D80010100000D0F0E80088B8F800C0C0
        E00088B8C0001018B80040586000080048001060E000A8B8B800A8D0F000A0A0
        B0003860A80070A8E000B0F0F800E0F8E80088A098006090F800E0F8F800A0B8
        B00060A0F80028181800C0D0F800C8F8F800E0F0F8000080D000E0E0E800F0F0
        E80050B0F80068A8F8006060F00080808000C0F8E8003850480020A0F8000000
        3800E8E8F0001058C0003868E000C8E0F0005888F800082068005098F0000040
        C800688890005880A000D0D0D8000010100090B8C800C8C8C800385098003840
        300098A09800D0E8E000080808001040800058586800C0E0C0000050E000D0D8
        E0000058D800687070001870F8000870D00050708800B0C8C80098C8F8002020
        080090B0B0006888E800B8F0F80050A8F000203888001870E00000186000A0F8
        F800D8E0E80070C0F800F8F8E000B0D8F800B0D8D000F8F8F800DF98FFFFFF0B
        22FFFF0B22FFC4DFFFFFFF0B22FFFF0B2200F1002EE2FFFFFFFFFFC5FFDFE21F
        04FFFFC5FFFFFFC5FF00D12E00F1A793FF0BFFFFDFE2220137F1240BFF0B22FF
        FF0026000493F02A9361DF7924C426C5C5C5E27EE2DFFFFFFF00222E37C43B79
        0737A76937E2C426C5C5C4FF931F8DFFFF00FF3CF0C5FFF0F0073C2710E2E2C4
        0BC5FFC5FFC4DF00C10022DF0726C4DFF0798F27031FE2C1F026C4C5F00BC4C1
        2E00FFFF93F0FFC4FFF01C27602793E2DF79C5F0FFC5791FFF00FFFF373CC4FF
        F05EC23C4AC7278D37797926C4E26CFF2200FFC5FF69F05E5E5E965E1C274A27
        93DADF79C12EFFC5FF0022FFDF7E57F9F0DFC23CC21C4A4A276937A56CFF22FF
        FF00FF79E2FF79C2FFF0F05EC25E3C275E271F2EFFC5FFFFFF00C4E22226FF79
        3B26C479C296C21CAD1C03E1FFFFFF0B2200E2C5C5C5FFC5793CC5C4F95E96C2
        1C275EA704FFFFC5FF0093DFC526C4FFFF79CC26C4795EC2C21CAD692404FFFF
        FF00FF379BDF0BC5FFC5793CFFF0C45EC2C21C93048D8DFFFF00FFFFFF2CDAC1
        FF26C5793B26C479C23CC2DFE17E052EFF00FFC5FFFF0B372E79FFC571C2C4F0
        F08F873735D12A61260022FFFF0B22FFFFE224DA37354C0BC49837DF4C1C4A69
        9C00FFFFFFC5FFFFFFFF0BE2FFFF981F0BC40BE22A601C69DF00FF0B22FFFF0B
        22FFFFFF22FFFF35612E2437C2C203DAFF00FFC5FFFFFFC5FFFFFFC5FFFFFFFF
        DF05275E2AA7E2FFFF0022FFFF0B22FFFF0B22FFFF0B22FFFFDF24D134DFFFFF
        FF00}
    end
    object BitBtn4: TBitBtn
      Left = 176
      Top = 5
      Width = 88
      Height = 28
      Caption = #21457#26009#26126#32454
      TabOrder = 5
      OnClick = BitBtn4Click
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 351
    Width = 722
    Height = 171
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object DBGrid3: TDBGrid
      Left = 0
      Top = 0
      Width = 722
      Height = 171
      Align = alClient
      DataSource = DataSource3
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = PopupMenu3
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'goods_name'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'goods_guige'
          Width = 179
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'goods_type'
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIT_NAME'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANTITY'
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RTN_QUANTITY'
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'rohs'
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REF_NUMBER'
          Width = 81
          Visible = True
        end>
    end
    object DBGrid2: TDBGrid
      Left = 0
      Top = 0
      Width = 722
      Height = 171
      Align = alClient
      DataSource = DataSource2
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = PopupMenu2
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'INV_PART_NUMBER'
          Title.Caption = #26448#26009#32534#30721
          Width = 123
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'INV_NAME'
          Title.Caption = #26448#26009#21517#31216
          Width = 108
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'INV_DESCRIPTION'
          Title.Caption = #26448#26009#35268#26684
          Width = 170
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANTITY'
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RTN_QUANTITY'
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIT_NAME'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'rohs'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUPPLIER2'
          Width = 56
          Visible = True
        end>
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 722
    Height = 304
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'GON_NUMBER'
        Title.Color = clRed
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REF_NUMBER'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CREATE_DATE'
        ReadOnly = False
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPT_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPT_NAME'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20986#20179#31867#22411
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29366#24577
        Width = 50
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = aq457
    OnDataChange = DataSource1DataChange
    Left = 56
    Top = 192
  end
  object DataSource2: TDataSource
    DataSet = ado207
    Left = 56
    Top = 248
  end
  object DataSource3: TDataSource
    DataSet = ado208
    Left = 56
    Top = 304
  end
  object aq457: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.Data0457.RKEY, dbo.Data0457.GON_NUMBER, '#13#10'     dbo.Da' +
      'ta0457.REF_NUMBER, '#13#10'      dbo.Data0457.CREATE_DATE, '#13#10'      dbo' +
      '.Data0015.ABBR_NAME, data0457.TTYPE,'#13#10'      dbo.Data0034.DEPT_CO' +
      'DE, dbo.Data0034.DEPT_NAME, '#13#10'      dbo.Data0005.EMPLOYEE_NAME,'#13 +
      #10'Data0005_1.EMPLOYEE_NAME as '#21457#26009#20154#21592','#13#10'case data0457.ttype when 1 t' +
      'hen '#39#25353#37197#26009#21333#39#13#10'when 2 then '#39#25353#37096#38376#39' when 3 then '#39#25353#39046#26009#21333#39#13#10'when 4 then '#39#29289 +
      #26009#36864#20179#39' when 5 then '#39#26434#39033#29289#21697#39#13#10'when 6 then '#39#26434#39033#36864#20179#39#13#10'end as '#20986#20179#31867#22411','#13#10'case ' +
      'data0457.status when 0 then '#39#26410#23457#35745#39#13#10'when 1 then '#39#24050#23457#35745#39#13#10'end as '#29366#24577',' +
      'Data0457.dept_ptr'#13#10'FROM dbo.Data0457 INNER JOIN'#13#10'      dbo.Data0' +
      '015 ON dbo.Data0457.warehouse_ptr = dbo.Data0015.RKEY INNER JOIN' +
      #13#10'      dbo.Data0034 ON dbo.Data0457.dept_ptr = dbo.Data0034.RKE' +
      'Y INNER JOIN'#13#10'      dbo.Data0005 ON dbo.Data0457.RECD_BY = dbo.D' +
      'ata0005.RKEY INNER JOIN'#13#10'      dbo.Data0005 Data0005_1 ON dbo.Da' +
      'ta0457.CREATE_BY = Data0005_1.RKEY'#13#10'where CREATE_DATE>=:dtpk1 an' +
      'd  CREATE_DATE<=:dtpk2'
    IndexFieldNames = 'GON_NUMBER'
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 38718d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 38930d
      end>
    Left = 128
    Top = 192
    object aq457RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aq457GON_NUMBER: TStringField
      DisplayLabel = #20986#20179#21333#21495
      FieldName = 'GON_NUMBER'
      Size = 10
    end
    object aq457REF_NUMBER: TStringField
      DisplayLabel = #39046#26009#21333#21495
      FieldName = 'REF_NUMBER'
      Size = 15
    end
    object aq457CREATE_DATE: TDateTimeField
      DisplayLabel = #39046#26009#26085#26399
      FieldName = 'CREATE_DATE'
    end
    object aq457ABBR_NAME: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object aq457DEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object aq457DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object aq457EMPLOYEE_NAME: TStringField
      DisplayLabel = #39046#26009#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object aq457DSDesigner: TStringField
      FieldName = #20986#20179#31867#22411
      ReadOnly = True
      Size = 10
    end
    object aq457DSDesigner2: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 6
    end
    object aq457TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object aq457DSDesigner3: TStringField
      FieldName = #21457#26009#20154#21592
      Size = 16
    end
    object aq457dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
  end
  object ado207: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT  dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, '#13#10' ' +
      '     dbo.Data0017.INV_DESCRIPTION, dbo.Data0207.QUANTITY, '#13#10'    ' +
      '  dbo.Data0207.RTN_QUANTITY, dbo.Data0002.UNIT_NAME, dbo.Data002' +
      '2.rohs, '#13#10'      dbo.Data0022.SUPPLIER2, dbo.Data0207.D0022_PTR, ' +
      #13#10'      dbo.Data0207.STANDARD_COST, dbo.Data0022.QUAN_ON_HAND, '#13 +
      #10'      dbo.Data0207.INVENTORY_PTR, dbo.Data0207.RKEY, '#13#10'      db' +
      'o.Data0017.QUAN_ON_HAND AS hand17, dbo.Data0207.TTYPE, '#13#10'      d' +
      'bo.Data0468.QUAN_ISSUED, data0468.STATUS,Data0207.D0468_PTR,wzcp' +
      '0492.Con_QTY,wzcp0492.QUAN_ASSIGN'#13#10'FROM dbo.Data0207 INNER JOIN'#13 +
      #10'      dbo.Data0017 ON dbo.Data0207.INVENTORY_PTR = dbo.Data0017' +
      '.RKEY INNER JOIN'#13#10'      dbo.Data0022 ON dbo.Data0207.D0022_PTR =' +
      ' dbo.Data0022.RKEY INNER JOIN'#13#10'      dbo.Data0002 ON '#13#10'      dbo' +
      '.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY LEFT OUTER JOIN'#13 +
      #10'      dbo.Data0468 ON dbo.Data0207.D0468_PTR = dbo.Data0468.RKE' +
      'Y'#13#10'      left join wzcp0492 on   wzcp0492.rkey=Data0468.wzcp0492' +
      '_ptr'#13#10'where gon_ptr=:rkey'
    DataSource = DataSource1
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 31797
      end>
    Left = 128
    Top = 256
    object ado207INV_PART_NUMBER: TStringField
      DisplayLabel = #29289#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ado207INV_NAME: TStringField
      DisplayLabel = #29289#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ado207INV_DESCRIPTION: TStringField
      DisplayLabel = #29289#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ado207QUANTITY: TBCDField
      DisplayLabel = #21457#25918#25968#37327
      FieldName = 'QUANTITY'
      Precision = 10
      Size = 3
    end
    object ado207RTN_QUANTITY: TBCDField
      DisplayLabel = #36864#20179#25968#37327
      FieldName = 'RTN_QUANTITY'
      Precision = 10
      Size = 3
    end
    object ado207UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ado207rohs: TStringField
      DisplayLabel = #29615#20445#26631#35782
      FieldName = 'rohs'
      Size = 10
    end
    object ado207SUPPLIER2: TStringField
      DisplayLabel = #21407#21046#36896#21830
      FieldName = 'SUPPLIER2'
      Size = 10
    end
    object ado207D0022_PTR: TIntegerField
      FieldName = 'D0022_PTR'
    end
    object ado207QUAN_ON_HAND: TBCDField
      FieldName = 'QUAN_ON_HAND'
      Precision = 19
    end
    object ado207INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ado207rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ado207hand17: TFloatField
      FieldName = 'hand17'
    end
    object ado207STANDARD_COST: TFloatField
      FieldName = 'STANDARD_COST'
    end
    object ado207ttype: TSmallintField
      FieldName = 'ttype'
    end
    object ado207QUAN_ISSUED: TFloatField
      FieldName = 'QUAN_ISSUED'
    end
    object ado207STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object ado207D0468_PTR: TIntegerField
      FieldName = 'D0468_PTR'
    end
    object ado207Con_QTY: TBCDField
      FieldName = 'Con_QTY'
      Precision = 12
    end
    object ado207QUAN_ASSIGN: TBCDField
      FieldName = 'QUAN_ASSIGN'
      Precision = 12
    end
  end
  object ado208: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT dbo.Data0235.goods_name, dbo.Data0235.goods_guige, '#13#10'    ' +
      '  dbo.Data0235.goods_type, dbo.Data0002.UNIT_NAME, dbo.Data0235.' +
      'rohs, '#13#10'      dbo.Data0235.REF_NUMBER, dbo.DATA0208.QUANTITY, '#13#10 +
      '      dbo.DATA0208.RTN_QUANTITY, dbo.DATA0208.SOURCE_PTR,'#13#10'data0' +
      '235.QUAN_ON_HAND,data0208.rkey, data0208.DEPT_PTR, data0208.GON_' +
      'PTR'#13#10'FROM dbo.DATA0208 INNER JOIN'#13#10'      dbo.Data0235 ON dbo.DAT' +
      'A0208.SOURCE_PTR = dbo.Data0235.RKEY INNER JOIN'#13#10'      dbo.Data0' +
      '002 ON dbo.Data0235.unit_ptr = dbo.Data0002.RKEY'#13#10'where data0208' +
      '.gon_ptr=:rkey'
    DataSource = DataSource1
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 31797
      end>
    Left = 125
    Top = 320
    object ado208goods_name: TStringField
      DisplayLabel = #29289#21697#21517#31216
      FieldName = 'goods_name'
      Size = 60
    end
    object ado208goods_guige: TStringField
      DisplayLabel = #29289#21697#35268#26684
      FieldName = 'goods_guige'
      Size = 200
    end
    object ado208goods_type: TStringField
      DisplayLabel = #31867#22411
      FieldName = 'goods_type'
    end
    object ado208UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ado208rohs: TStringField
      DisplayLabel = #29615#20445#26631#35782
      DisplayWidth = 8
      FieldName = 'rohs'
      Size = 10
    end
    object ado208REF_NUMBER: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REF_NUMBER'
      Size = 15
    end
    object ado208QUANTITY: TBCDField
      DisplayLabel = #21457#25918#25968#37327
      FieldName = 'QUANTITY'
      Precision = 10
      Size = 3
    end
    object ado208RTN_QUANTITY: TBCDField
      DisplayLabel = #36864#36135#25968#37327
      FieldName = 'RTN_QUANTITY'
      Precision = 10
      Size = 3
    end
    object ado208SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object ado208QUAN_ON_HAND: TBCDField
      FieldName = 'QUAN_ON_HAND'
      Precision = 10
      Size = 3
    end
    object ado208rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ado208DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ado208GON_PTR: TIntegerField
      FieldName = 'GON_PTR'
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 216
    Top = 192
    object N1: TMenuItem
      Caption = #20840#37096#36864#20179
      OnClick = N1Click
    end
    object N4: TMenuItem
      Caption = #25171#21360#20986#20179#21333
      OnClick = N4Click
    end
  end
  object PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 171
    Top = 404
    object N2: TMenuItem
      Caption = #21333#39033#36864#20179
      OnClick = N2Click
    end
  end
  object PopupMenu3: TPopupMenu
    OnPopup = PopupMenu3Popup
    Left = 232
    Top = 403
    object N3: TMenuItem
      Caption = #21333#39033#36864#20179
      OnClick = N3Click
    end
  end
  object PopupMenu4: TPopupMenu
    Left = 360
    Top = 64
    object N5: TMenuItem
      Caption = #23450#20041#32534#30721#29289#26009#39046#26009#21333
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #23450#20041#38750#32534#30721#29289#26009#39046#26009#21333
      OnClick = N6Click
    end
  end
end
