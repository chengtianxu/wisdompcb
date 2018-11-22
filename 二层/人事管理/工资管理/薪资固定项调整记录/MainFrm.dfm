object FrmMain: TFrmMain
  Left = 260
  Top = 244
  BorderStyle = bsSingle
  Caption = #35843#34218#35760#24405
  ClientHeight = 550
  ClientWidth = 880
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 136
    Top = 144
    Width = 24
    Height = 13
    Caption = '------>'
  end
  object lbl_to: TLabel
    Left = 136
    Top = 144
    Width = 21
    Height = 13
    Caption = '----->'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 880
    Height = 50
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      880
      50)
    object Label1: TLabel
      Left = 299
      Top = 26
      Width = 59
      Height = 13
      Caption = ' '#21592#24037#24037#21495
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 461
      Top = 25
      Width = 6
      Height = 12
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label2: TLabel
      Left = 565
      Top = 23
      Width = 300
      Height = 12
      Anchors = [akTop, akRight]
      Caption = '1.'#32511#33394#34892#20195#34920#31163#32844#20154#21592#35760#24405'  2.'#32418#33394#23383#20307#20195#34920#26410#29983#25928#35760#24405
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object BitBtn1: TBitBtn
      Left = 8
      Top = 10
      Width = 70
      Height = 30
      Caption = #36864#20986
      TabOrder = 0
      OnClick = BitBtn1Click
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
    object BitBtn2: TBitBtn
      Left = 78
      Top = 10
      Width = 70
      Height = 30
      Caption = #21047#26032
      TabOrder = 1
      OnClick = BitBtn2Click
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
    object BitBtn3: TBitBtn
      Left = 218
      Top = 10
      Width = 70
      Height = 30
      Caption = #23548#20986
      TabOrder = 3
      OnClick = BitBtn3Click
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
    object edt_1: TEdit
      Left = 360
      Top = 19
      Width = 97
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ImeMode = imDisable
      ParentFont = False
      TabOrder = 4
      OnChange = edt_1Change
    end
    object BitBtn4: TBitBtn
      Left = 148
      Top = 10
      Width = 70
      Height = 30
      Caption = #26597#35810
      TabOrder = 2
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
  object TComboBox
    Left = 752
    Top = 520
    Width = 105
    Height = 21
    ItemHeight = 13
    TabOrder = 1
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 50
    Width = 880
    Height = 500
    ActivePage = TabSheet1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 4
    object TabSheet1: TTabSheet
      Caption = #35843#34218#35760#24405
      DesignSize = (
        872
        469)
      object lblto: TLabel
        Left = 112
        Top = 112
        Width = 24
        Height = 13
        Caption = '------>'
      end
      object Label7: TLabel
        Left = 488
        Top = 16
        Width = 32
        Height = 13
        Caption = 'Label7'
      end
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 872
        Height = 423
        Align = alClient
        DataSource = DM.ds1
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        FooterColor = clBtnFace
        FooterFont.Charset = ANSI_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -12
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        PopupMenu = PopupMenu1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleHeight = 15
        OnDrawColumnCell = DBGridEh1DrawColumnCell
        OnKeyDown = DBGridEh1KeyDown
        OnTitleClick = DBGridEh1TitleClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'employeecode'
            Footers = <>
            Title.Caption = #21592#24037#24037#21495
            Title.Font.Charset = GB2312_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = #23435#20307
            Title.Font.Style = []
            Width = 56
          end
          item
            EditButtons = <>
            FieldName = 'IsSelected'
            Footers = <>
            Title.Caption = ' '#36873#25321
            Width = 39
          end
          item
            EditButtons = <>
            FieldName = 'chinesename'
            Footers = <>
            Title.Caption = #21592#24037#22995#21517
            Title.Font.Charset = GB2312_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = #23435#20307
            Title.Font.Style = []
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'departmentname'
            Footers = <>
            Title.Caption = #37096#38376#21517#31216
            Title.Font.Charset = GB2312_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = #23435#20307
            Title.Font.Style = []
            Width = 75
          end
          item
            EditButtons = <>
            FieldName = 'Pitem'
            Footers = <>
            Title.Caption = #32844#21153
            Width = 46
          end
          item
            EditButtons = <>
            FieldName = 'employee_train_flag'
            Footers = <>
            Title.Caption = #22521#35757#21542
            Width = 41
          end
          item
            EditButtons = <>
            FieldName = 'Train_NO'
            Footers = <>
            Title.Caption = #22521#35757#32534#21495
            Title.Font.Charset = GB2312_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = #23435#20307
            Title.Font.Style = []
            Width = 74
          end
          item
            EditButtons = <>
            FieldName = 'accountName'
            Footers = <>
            Title.Caption = #24080#22871#31867#22411
            Title.Font.Charset = GB2312_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = #23435#20307
            Title.Font.Style = []
            Title.TitleButton = True
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'itemname'
            Footers = <>
            Title.Caption = #39033#30446#21517#31216
            Title.Font.Charset = GB2312_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = #23435#20307
            Title.Font.Style = []
            Width = 69
          end
          item
            EditButtons = <>
            FieldName = 'originaldata'
            Footers = <>
            Title.Caption = #21407#37329#39069
            Title.Font.Charset = GB2312_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = #23435#20307
            Title.Font.Style = []
            Width = 58
          end
          item
            EditButtons = <>
            FieldName = 'newdata'
            Footers = <>
            Title.Caption = #29616#37329#39069
            Title.Font.Charset = GB2312_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = #23435#20307
            Title.Font.Style = []
            Width = 58
          end
          item
            EditButtons = <>
            FieldName = 'EMPLOYEE_NAME'
            Footers = <>
            Title.Caption = #25805#20316#20154
            Title.Font.Charset = GB2312_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = #23435#20307
            Title.Font.Style = []
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'effect_flag'
            Footers = <>
            Title.Caption = #26159#21542#29983#25928
            Title.Font.Charset = GB2312_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = #23435#20307
            Title.Font.Style = []
            Width = 56
          end
          item
            EditButtons = <>
            FieldName = 'operate_date'
            Footers = <>
            Title.Caption = #25805#20316#26102#38388
            Title.Font.Charset = GB2312_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = #23435#20307
            Title.Font.Style = []
            Width = 74
          end
          item
            EditButtons = <>
            FieldName = 'effect_date'
            Footers = <>
            Title.Caption = #29983#25928#26085#26399
            Title.Font.Charset = GB2312_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = #23435#20307
            Title.Font.Style = []
            Width = 55
          end
          item
            EditButtons = <>
            FieldName = 'TrainRkey'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'datafield'
            Footers = <>
            Title.Caption = #39033#30446#20195#30721
            Title.Font.Charset = GB2312_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = #23435#20307
            Title.Font.Style = []
            Width = 54
          end
          item
            EditButtons = <>
            FieldName = 'train_flag'
            Footers = <>
            Title.Caption = #32844#21153#20851#32852#22521#35757
            Title.Font.Charset = GB2312_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = #23435#20307
            Title.Font.Style = []
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'statusName'
            Footers = <>
            Title.Caption = #26159#21542#22312#32844
            Title.Font.Charset = GB2312_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = #23435#20307
            Title.Font.Style = []
            Width = 61
          end
          item
            EditButtons = <>
            FieldName = 'remark'
            Footers = <>
            Title.Caption = #22791#27880
            Title.Font.Charset = GB2312_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = #23435#20307
            Title.Font.Style = []
            Width = 250
          end
          item
            EditButtons = <>
            FieldName = 'item'
            Footers = <>
            Title.Caption = #35843#34218#21407#22240
          end>
      end
      object RadioGroup1: TRadioGroup
        Left = 0
        Top = 423
        Width = 872
        Height = 46
        Align = alBottom
        Columns = 3
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          #20840#37096#35760#24405
          #24050#29983#25928#35760#24405
          #26410#29983#25928#35760#24405)
        ParentFont = False
        TabOrder = 1
        OnClick = RadioGroup1Click
      end
      object ComboBox1: TComboBox
        Left = 720
        Top = 440
        Width = 145
        Height = 21
        Anchors = [akRight, akBottom]
        ItemHeight = 13
        TabOrder = 2
        Text = 'ComboBox1'
        Visible = False
      end
    end
    object TabSheet2: TTabSheet
      Caption = #34218#36164#25552#37266#20154#21592#20449#24687#65288#23436#21892#20013'......'#65289
      ImageIndex = 1
      TabVisible = False
      object DBGridEh2: TDBGridEh
        Left = 0
        Top = 0
        Width = 872
        Height = 469
        Align = alClient
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Visible = False
        Columns = <
          item
            EditButtons = <>
            Footers = <>
            Title.Caption = #24037#21495
          end
          item
            EditButtons = <>
            Footers = <>
            Title.Caption = #22995#21517
          end
          item
            EditButtons = <>
            Footers = <>
            Title.Caption = #37096#38376
          end
          item
            EditButtons = <>
            Footers = <>
            Title.Caption = #19978#27425#35843#34218#26085#26399
            Width = 96
          end
          item
            EditButtons = <>
            Footers = <>
            Title.Caption = #20837#32844#26085#26399
          end
          item
            EditButtons = <>
            Footers = <>
            Title.Caption = #24403#21069#26085#26399
          end
          item
            EditButtons = <>
            Footers = <>
            Title.Caption = #24037#40836
          end
          item
            EditButtons = <>
            Footers = <>
            Title.Caption = #22791#27880#35828#26126
            Width = 222
          end>
      end
    end
  end
  object Button1: TButton
    Left = 80
    Top = 50
    Width = 41
    Height = 25
    Caption = #20840#36873
    TabOrder = 2
    OnClick = Button1Click
  end
  object btn_Audit: TButton
    Left = 152
    Top = 51
    Width = 75
    Height = 25
    Caption = #25209#37327#29983#25928
    TabOrder = 3
    OnClick = btn_AuditClick
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 432
    Top = 168
    object N6: TMenuItem
      Caption = #26032#22686
      OnClick = N6Click
    end
    object N8: TMenuItem
      Caption = #25209#37327#23548#20837
      OnClick = N8Click
    end
    object N1: TMenuItem
      Caption = #26032#22686#65288#21333#39033#65289
      Visible = False
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21024#38500
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #20462#25913
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #29983#25928
      OnClick = N4Click
    end
    object N7: TMenuItem
      Caption = #20316#24223
      OnClick = N7Click
    end
    object N5: TMenuItem
      Caption = #26681#25454#32508#21512#24037#36164#26631#20934#33258#21160#29983#25104#32844#21153#21644#23703#20301#24037#36164#26631#20934#35760#24405
      OnClick = N5Click
    end
  end
end
