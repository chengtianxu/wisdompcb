object frmMain: TfrmMain
  Left = 279
  Top = 131
  Width = 850
  Height = 723
  Caption = 'frmMain'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 834
    Height = 41
    Align = alTop
    TabOrder = 0
    object lbFilter: TLabel
      Left = 300
      Top = 15
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'lbFilter'
    end
    object Label1: TLabel
      Left = 532
      Top = 17
      Width = 65
      Height = 13
      Caption = #21464#21160#26085#26399#65306
    end
    object Label2: TLabel
      Left = 698
      Top = 16
      Width = 13
      Height = 13
      Caption = #33267
    end
    object btnClose: TBitBtn
      Left = 3
      Top = 4
      Width = 65
      Height = 33
      Caption = #36864#20986
      TabOrder = 0
      OnClick = btnCloseClick
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
      Left = 68
      Top = 4
      Width = 65
      Height = 33
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
      Left = 133
      Top = 4
      Width = 65
      Height = 33
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
    object btnQuery: TBitBtn
      Left = 198
      Top = 4
      Width = 65
      Height = 33
      Caption = #26597#35810
      TabOrder = 3
      OnClick = btnQueryClick
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
    object edtFilter: TEdit
      Left = 360
      Top = 11
      Width = 121
      Height = 21
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 4
      OnChange = edtFilterChange
    end
    object dtpkstart: TDateTimePicker
      Left = 594
      Top = 13
      Width = 97
      Height = 21
      Date = 42534.000000000000000000
      Time = 42534.000000000000000000
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 5
      OnChange = dtpkstartChange
    end
    object dtpkend: TDateTimePicker
      Left = 720
      Top = 12
      Width = 97
      Height = 21
      Date = 42534.000000000000000000
      Time = 42534.000000000000000000
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 6
      OnChange = dtpkstartChange
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 834
    Height = 445
    Align = alClient
    TabOrder = 1
    object dbMain: TDBGridEh
      Left = 1
      Top = 1
      Width = 832
      Height = 443
      Align = alClient
      DataSource = DM.DataSource1
      FooterColor = clWindow
      FooterFont.Charset = ANSI_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
      PopupMenu = PopupMenu1
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnKeyDown = dbMainKeyDown
      OnTitleClick = dbMainTitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'fasset_code'
          Footers = <>
          Title.Color = clRed
        end
        item
          EditButtons = <>
          FieldName = 'id_code'
          Footers = <>
          Width = 84
        end
        item
          EditButtons = <>
          FieldName = 'fasset_name'
          Footers = <>
          Width = 121
        end
        item
          EditButtons = <>
          FieldName = 'fasset_desc'
          Footers = <>
          Width = 125
        end
        item
          EditButtons = <>
          FieldName = 'book_date'
          Footers = <>
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'alter_date'
          Footers = <>
          Title.SortIndex = 1
          Title.SortMarker = smUpEh
          Width = 75
        end
        item
          EditButtons = <>
          FieldName = 'typename'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'F_DEPT_VALUE'
          Footers = <>
          Width = 103
        end
        item
          EditButtons = <>
          FieldName = 'B_DEPT_VALUE'
          Footers = <>
          Width = 99
        end
        item
          EditButtons = <>
          FieldName = 'Reason'
          Footers = <>
          Width = 162
        end
        item
          EditButtons = <>
          FieldName = 'employee_name'
          Footers = <>
          Width = 69
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 486
    Width = 834
    Height = 199
    Align = alBottom
    TabOrder = 2
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 832
      Height = 197
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #24403#21069#20449#24687
        object Label3: TLabel
          Left = -1
          Top = 8
          Width = 65
          Height = 13
          Caption = #20837#24080#26085#26399#65306
        end
        object Label4: TLabel
          Left = 216
          Top = 9
          Width = 65
          Height = 13
          Caption = #22686#20943#26041#24335#65306
        end
        object Label5: TLabel
          Left = 24
          Top = 31
          Width = 39
          Height = 13
          Caption = #31867#21035#65306
        end
        object Label6: TLabel
          Left = 242
          Top = 33
          Width = 39
          Height = 13
          Caption = #29366#24577#65306
        end
        object Label7: TLabel
          Left = -3
          Top = 57
          Width = 65
          Height = 13
          Caption = #36164#20135#32534#21495#65306
        end
        object Label8: TLabel
          Left = 241
          Top = 57
          Width = 39
          Height = 13
          Caption = #24037#21378#65306
        end
        object Label9: TLabel
          Left = -3
          Top = 81
          Width = 65
          Height = 13
          Caption = #20837#24080#21407#20540#65306
        end
        object Label10: TLabel
          Left = 215
          Top = 80
          Width = 65
          Height = 13
          Caption = #36141#20837#26085#26399#65306
        end
        object Label11: TLabel
          Left = 23
          Top = 104
          Width = 39
          Height = 13
          Caption = #20301#32622#65306
        end
        object Label12: TLabel
          Left = 22
          Top = 125
          Width = 39
          Height = 13
          Caption = #22791#27880#65306
        end
        object Label13: TLabel
          Left = 448
          Top = 6
          Width = 65
          Height = 13
          Caption = #24403#21069#21407#20540#65306
        end
        object Label14: TLabel
          Left = 632
          Top = 8
          Width = 65
          Height = 13
          Caption = #25240#26087#26041#27861#65306
        end
        object Label15: TLabel
          Left = 422
          Top = 30
          Width = 91
          Height = 13
          Caption = #39044#35745#20351#29992#26376#20221#65306
        end
        object Label16: TLabel
          Left = 645
          Top = 32
          Width = 52
          Height = 13
          Caption = #27531#20540#29575#65306
        end
        object Label17: TLabel
          Left = 441
          Top = 54
          Width = 72
          Height = 13
          Caption = #26376#25240#26087#29575'%'#65306
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 632
          Top = 56
          Width = 65
          Height = 13
          Caption = #24050#25552#26376#20221#65306
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label19: TLabel
          Left = 448
          Top = 78
          Width = 65
          Height = 13
          Caption = #26376#25240#26087#39069#65306
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label20: TLabel
          Left = 632
          Top = 80
          Width = 65
          Height = 13
          Caption = #32047#35745#25240#26087#65306
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label21: TLabel
          Left = 461
          Top = 102
          Width = 52
          Height = 13
          Caption = #20928#27531#20540#65306
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label22: TLabel
          Left = 632
          Top = 104
          Width = 65
          Height = 13
          Caption = #24403#21069#20928#20540#65306
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label23: TLabel
          Left = 422
          Top = 126
          Width = 91
          Height = 13
          Caption = #22266#23450#36164#20135#31185#30446#65306
        end
        object Label24: TLabel
          Left = 422
          Top = 150
          Width = 91
          Height = 13
          Caption = #32047#35745#25240#26087#31185#30446#65306
        end
        object DBEdit1: TDBEdit
          Left = 64
          Top = 4
          Width = 113
          Height = 21
          DataField = 'book_date'
          DataSource = DM.DataSource1
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 64
          Top = 28
          Width = 113
          Height = 21
          DataField = 'FASSET_TYPE'
          DataSource = DM.DataSource1
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 64
          Top = 52
          Width = 113
          Height = 21
          DataField = 'id_code'
          DataSource = DM.DataSource1
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 64
          Top = 76
          Width = 113
          Height = 21
          DataField = 'orig_original_value'
          DataSource = DM.DataSource1
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit5: TDBEdit
          Left = 64
          Top = 101
          Width = 329
          Height = 21
          DataField = 'LOCATION'
          DataSource = DM.DataSource1
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit6: TDBEdit
          Left = 285
          Top = 4
          Width = 108
          Height = 21
          DataField = 'FASSET_ALT_TYPE'
          DataSource = DM.DataSource1
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit7: TDBEdit
          Left = 285
          Top = 28
          Width = 108
          Height = 21
          DataField = 'FASSET_STATUS'
          DataSource = DM.DataSource1
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit8: TDBEdit
          Left = 285
          Top = 52
          Width = 108
          Height = 21
          DataField = 'abbr_NAME'
          DataSource = DM.DataSource1
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 7
        end
        object DBEdit9: TDBEdit
          Left = 285
          Top = 76
          Width = 108
          Height = 21
          DataField = 'USER_DATE'
          DataSource = DM.DataSource1
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 8
        end
        object DBMemo1: TDBMemo
          Left = 64
          Top = 126
          Width = 329
          Height = 43
          DataField = 'REMARK'
          DataSource = DM.DataSource1
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 9
        end
        object DBEdit10: TDBEdit
          Left = 517
          Top = 4
          Width = 108
          Height = 21
          DataField = 'ORIGINAL_VALUE'
          DataSource = DM.DataSource1
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 10
        end
        object DBEdit11: TDBEdit
          Left = 517
          Top = 28
          Width = 108
          Height = 21
          DataField = 'EXPECTED_LIFE_MONTHS'
          DataSource = DM.DataSource1
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 11
        end
        object DBEdit12: TDBEdit
          Left = 517
          Top = 52
          Width = 108
          Height = 21
          DataField = 'MONTH_DEPRE_RATE'
          DataSource = DM.DataSource1
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ParentFont = False
          ReadOnly = True
          TabOrder = 12
        end
        object DBEdit13: TDBEdit
          Left = 517
          Top = 76
          Width = 108
          Height = 21
          DataField = 'MONTH_DEPRE_AMT'
          DataSource = DM.DataSource1
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ParentFont = False
          ReadOnly = True
          TabOrder = 13
        end
        object DBEdit14: TDBEdit
          Left = 517
          Top = 100
          Width = 108
          Height = 21
          DataField = 'SURPLUS'
          DataSource = DM.DataSource1
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ParentFont = False
          ReadOnly = True
          TabOrder = 14
        end
        object DBEdit15: TDBEdit
          Left = 517
          Top = 124
          Width = 108
          Height = 21
          DataField = 'GL_ACC_NUMBER'
          DataSource = DM.DataSource1
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 15
        end
        object DBEdit16: TDBEdit
          Left = 517
          Top = 148
          Width = 108
          Height = 21
          DataField = 'Depre_GL_ACC_NUMBER'
          DataSource = DM.DataSource1
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 16
        end
        object DBEdit17: TDBEdit
          Left = 693
          Top = 4
          Width = 108
          Height = 21
          DataField = 'MONTH'
          DataSource = DM.DataSource1
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 17
        end
        object DBEdit18: TDBEdit
          Left = 693
          Top = 28
          Width = 108
          Height = 21
          DataField = 'SURPLUS_RATE'
          DataSource = DM.DataSource1
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 18
        end
        object DBEdit19: TDBEdit
          Left = 693
          Top = 52
          Width = 108
          Height = 21
          DataField = 'DEPRED_MONTHS'
          DataSource = DM.DataSource1
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ParentFont = False
          ReadOnly = True
          TabOrder = 19
        end
        object DBEdit20: TDBEdit
          Left = 693
          Top = 76
          Width = 108
          Height = 21
          DataField = 'SUMMED_DEPRE'
          DataSource = DM.DataSource1
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ParentFont = False
          ReadOnly = True
          TabOrder = 20
        end
        object DBEdit21: TDBEdit
          Left = 693
          Top = 100
          Width = 108
          Height = 21
          DataField = 'NET_VALUE'
          DataSource = DM.DataSource1
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ParentFont = False
          ReadOnly = True
          TabOrder = 21
        end
        object DBEdit22: TDBEdit
          Left = 629
          Top = 124
          Width = 108
          Height = 21
          DataField = 'GL_DESCRIPTION'
          DataSource = DM.DataSource1
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 22
        end
        object DBEdit23: TDBEdit
          Left = 629
          Top = 148
          Width = 108
          Height = 21
          DataField = 'depre_GL_DESCRIPTION'
          DataSource = DM.DataSource1
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 23
        end
      end
      object TabSheet2: TTabSheet
        Caption = #21407#20540#20449#24687
        ImageIndex = 1
        object DBGridEh1: TDBGridEh
          Left = 0
          Top = 0
          Width = 824
          Height = 169
          Align = alClient
          DataSource = DM.DataSource2
          FooterColor = clWindow
          FooterFont.Charset = ANSI_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -13
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'CURR_CODE'
              Footers = <>
              Width = 61
            end
            item
              EditButtons = <>
              FieldName = 'ex_rate'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'orig_curr_orig_value'
              Footers = <>
              Width = 111
            end
            item
              EditButtons = <>
              FieldName = 'curr_value'
              Footers = <>
              Width = 104
            end>
        end
      end
      object TabSheet3: TTabSheet
        Caption = #20351#29992#37096#38376
        ImageIndex = 2
        object DBGridEh2: TDBGridEh
          Left = 0
          Top = 0
          Width = 824
          Height = 169
          Align = alClient
          DataSource = DM.DataSource3
          FooterColor = clWindow
          FooterFont.Charset = ANSI_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -13
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'DEPT_CODE'
              Footers = <>
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'DEPT_NAME'
              Footers = <>
              Width = 108
            end
            item
              EditButtons = <>
              FieldName = 'PERCENTS'
              Footers = <>
              Width = 56
            end
            item
              EditButtons = <>
              FieldName = 'GL_ACC_NUMBER'
              Footers = <>
              Width = 142
            end
            item
              EditButtons = <>
              FieldName = 'GL_DESCRIPTION'
              Footers = <>
              Width = 199
            end>
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 296
    Top = 145
    object N1: TMenuItem
      Caption = #26032#22686
      object NOrignal: TMenuItem
        Tag = 1
        Caption = #21407#20540#21464#21160
        OnClick = NOrignalClick
      end
      object NDepart: TMenuItem
        Tag = 2
        Caption = #37096#38376#21464#21160
        OnClick = NOrignalClick
      end
      object NOther: TMenuItem
        Tag = 3
        Caption = #20854#23427#21464#21160
        OnClick = NOrignalClick
      end
    end
    object NEdit: TMenuItem
      Tag = 4
      Caption = #32534#36753
      OnClick = NEditClick
    end
    object NDelete: TMenuItem
      Caption = #21024#38500
      OnClick = NDeleteClick
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object NCheck: TMenuItem
      Tag = 5
      Caption = #26597#30475
      OnClick = NOrignalClick
    end
  end
end
