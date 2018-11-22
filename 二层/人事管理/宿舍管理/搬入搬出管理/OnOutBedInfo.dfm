object FrmOnOutBedInfo: TFrmOnOutBedInfo
  Left = 359
  Top = 195
  Width = 818
  Height = 569
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'FrmOnOutBedInfo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 810
    Height = 41
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object bbt_1: TBitBtn
      Left = 5
      Top = 6
      Width = 76
      Height = 30
      Caption = #36864#20986
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = bbt_1Click
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
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 810
    Height = 240
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 145
      Top = 11
      Width = 52
      Height = 13
      Caption = #21592#24037#24037#21495
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object lb_1: TLabel
      Left = 289
      Top = 13
      Width = 48
      Height = 12
      Caption = #25805#20316#26085#26399
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object lb_11: TLabel
      Left = 432
      Top = 14
      Width = 36
      Height = 12
      Caption = #25805#20316#20154
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 568
      Top = 15
      Width = 48
      Height = 12
      Caption = #25644#31163#26085#26399
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object dgh_grd1: TDBGridEh
      Left = 0
      Top = 40
      Width = 810
      Height = 200
      Align = alBottom
      AllowedOperations = []
      DataSource = damo.ds3
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = ANSI_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      PopupMenu = PopupMenu1
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnColEnter = dgh_grd1ColEnter
      OnColExit = dgh_grd1ColEnter
      OnTitleClick = dgh_grd1TitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'employeecode'
          Footers = <>
          Title.Caption = #21592#24037#24037#21495
          Width = 69
        end
        item
          EditButtons = <>
          FieldName = 'chinesename'
          Footers = <>
          Title.Caption = #21592#24037#22995#21517
          Width = 69
        end
        item
          EditButtons = <>
          FieldName = 'sex'
          Footers = <>
          Title.Caption = #24615#21035
          Width = 42
        end
        item
          EditButtons = <>
          FieldName = 'departmentname'
          Footers = <>
          Title.Caption = #37096#38376
        end
        item
          EditButtons = <>
          FieldName = 'position'
          Footers = <>
          Title.Caption = #32844#21153
          Width = 55
        end
        item
          EditButtons = <>
          FieldName = 'idcard'
          Footers = <>
          Title.Caption = #36523#20221#35777#21495#30721
          Width = 128
        end
        item
          EditButtons = <>
          FieldName = 'D_name'
          Footers = <>
          Title.Caption = #23487#33293#27004#21517#31216
          Width = 82
        end
        item
          EditButtons = <>
          FieldName = 'R_name'
          Footers = <>
          Title.Caption = #25151#38388#21517#31216
          Width = 71
        end
        item
          EditButtons = <>
          FieldName = 'B_code'
          Footers = <>
          Title.Caption = #24202#20301#32534#21495
          Width = 71
        end
        item
          EditButtons = <>
          FieldName = 'startdate'
          Footers = <>
          Title.Caption = #20837#20303#26085#26399
          Width = 91
        end
        item
          EditButtons = <>
          FieldName = 'oper_time_in'
          Footers = <>
          Title.Caption = #20837#20303#25805#20316#26085#26399
          Width = 101
        end
        item
          EditButtons = <>
          FieldName = 'in_name'
          Footers = <>
          Title.Caption = #20837#20303#25805#20316#20154
          Width = 85
        end
        item
          EditButtons = <>
          FieldName = 'remark'
          Footers = <>
          Title.Caption = #22791#27880
          Width = 114
        end
        item
          EditButtons = <>
          FieldName = 'D_code'
          Footers = <>
          Title.Caption = #23487#33293#27004#32534#21495
          Width = 85
        end
        item
          EditButtons = <>
          FieldName = 'R_code'
          Footers = <>
          Title.Caption = #25151#38388#32534#21495
          Width = 69
        end>
    end
    object bbt_2: TBitBtn
      Left = 5
      Top = 4
      Width = 132
      Height = 25
      Caption = #23548#20986#24050#20837#20303#35760#24405
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = bbt_2Click
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
      Left = 200
      Top = 6
      Width = 81
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnChange = edt_1Change
    end
    object edt_OperateDate: TEdit
      Left = 340
      Top = 7
      Width = 85
      Height = 21
      Color = clSkyBlue
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object edt_Operator: TEdit
      Left = 470
      Top = 8
      Width = 85
      Height = 21
      Color = clSkyBlue
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object dtpDate: TDateTimePicker
      Left = 619
      Top = 9
      Width = 81
      Height = 21
      Date = 41000.610166909720000000
      Time = 41000.610166909720000000
      TabOrder = 5
    end
    object bbt_3: TBitBtn
      Left = 704
      Top = 7
      Width = 97
      Height = 25
      Caption = #25644#31163#35813#21592#24037
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = mniN1Click
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000610D0000610D00000001000000000000000000003300
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
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE0909EE
        EE0909EEEEEEEEEEEEEEEEEEEE8181EEEE8181EEEEEEEEEEEEEEEEEEEE091009
        EE091009EEEEEEEEEEEEEEEEEE81AC81EE81AC81EEEEEEEEEEEEEEEEEE091010
        0909101009EEEEEEEEEEEEEEEE81ACAC8181ACAC81EEEEEEEEEEEE0909091010
        100910101009EEEEEEEEEE818181ACACAC81ACACAC81EEEEEEEEEE0910101010
        10100910101009EEEEEEEE81ACACACACACAC81ACACAC81EEEEEEEE0910101010
        1010100910101009EEEEEE81ACACACACACACAC81ACACAC81EEEEEE0910101010
        101010100910101009EEEE81ACACACACACACACAC81ACACAC81EEEE0910101010
        1010100910101009EEEEEE81ACACACACACACAC81ACACAC81EEEEEE0910101010
        10100910101009EEEEEEEE81ACACACACACAC81ACACAC81EEEEEEEE0909091010
        100910101009EEEEEEEEEE818181ACACAC81ACACAC81EEEEEEEEEEEEEE091010
        0909101009EEEEEEEEEEEEEEEE81ACAC8181ACAC81EEEEEEEEEEEEEEEE091009
        EE091009EEEEEEEEEEEEEEEEEE81AC81EE81AC81EEEEEEEEEEEEEEEEEE0909EE
        EE0909EEEEEEEEEEEEEEEEEEEE8181EEEE8181EEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE}
      NumGlyphs = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 281
    Width = 810
    Height = 255
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 2
    object Label3: TLabel
      Left = 153
      Top = 12
      Width = 52
      Height = 13
      Caption = #21592#24037#24037#21495
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object DBGridEh1: TDBGridEh
      Left = 0
      Top = 32
      Width = 810
      Height = 223
      Align = alBottom
      AllowedOperations = []
      BiDiMode = bdRightToLeftReadingOnly
      DataSource = damo.ds4
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = ANSI_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentBiDiMode = False
      ParentFont = False
      PopupMenu = PopupMenu2
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnColEnter = dgh_grd1ColEnter
      OnColExit = dgh_grd1ColEnter
      OnTitleClick = DBGridEh1TitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'employeecode'
          Footers = <>
          Title.Caption = #21592#24037#24037#21495
          Width = 69
        end
        item
          EditButtons = <>
          FieldName = 'chinesename'
          Footers = <>
          Title.Caption = #21592#24037#22995#21517
          Width = 69
        end
        item
          EditButtons = <>
          FieldName = 'sex'
          Footers = <>
          Title.Caption = #24615#21035
          Width = 42
        end
        item
          EditButtons = <>
          FieldName = 'departmentname'
          Footers = <>
          Title.Caption = #37096#38376
        end
        item
          EditButtons = <>
          FieldName = 'position'
          Footers = <>
          Title.Caption = #32844#21153
          Width = 56
        end
        item
          EditButtons = <>
          FieldName = 'idcard'
          Footers = <>
          Title.Caption = #36523#20221#35777#21495#30721
          Width = 124
        end
        item
          EditButtons = <>
          FieldName = 'D_name'
          Footers = <>
          Title.Caption = #23487#33293#27004#21517#31216
          Width = 85
        end
        item
          EditButtons = <>
          FieldName = 'R_name'
          Footers = <>
          Title.Caption = #25151#38388#21517#31216
          Width = 68
        end
        item
          EditButtons = <>
          FieldName = 'B_code'
          Footers = <>
          Title.Caption = #24202#20301#32534#21495
          Width = 71
        end
        item
          EditButtons = <>
          FieldName = 'startdate'
          Footers = <>
          Title.Caption = #20837#20303#26085#26399
          Width = 91
        end
        item
          EditButtons = <>
          FieldName = 'oper_time_in'
          Footers = <>
          Title.Caption = #20837#20303#25805#20316#26085#26399
          Width = 101
        end
        item
          EditButtons = <>
          FieldName = 'in_name'
          Footers = <>
          Title.Caption = #20837#20303#25805#20316#20154
          Width = 85
        end
        item
          EditButtons = <>
          FieldName = 'enddate'
          Footers = <>
          Title.Caption = #25644#31163#26085#26399
          Width = 99
        end
        item
          EditButtons = <>
          FieldName = 'oper_time_out'
          Footers = <>
          Title.Caption = #25644#31163#25805#20316#26085#26399
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'out_name'
          Footers = <>
          Title.Caption = #25644#31163#25805#20316#20154
          Width = 82
        end
        item
          EditButtons = <>
          FieldName = 'remark'
          Footers = <>
          Title.Caption = #22791#27880
          Width = 123
        end
        item
          EditButtons = <>
          FieldName = 'D_code'
          Footers = <>
          Title.Caption = #23487#33293#27004#32534#21495
          Width = 85
        end
        item
          EditButtons = <>
          FieldName = 'R_code'
          Footers = <>
          Title.Caption = #25151#38388#32534#21495
          Width = 69
        end>
    end
    object BitBtn1: TBitBtn
      Left = 6
      Top = 3
      Width = 139
      Height = 25
      Caption = #23548#20986#24050#26377#25644#31163#35760#24405
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn1Click
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
    object Edit1: TEdit
      Left = 208
      Top = 5
      Width = 81
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnChange = Edit1Change
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 416
    Top = 169
    object N1: TMenuItem
      Caption = #25644#31163#35813#21592#24037
      OnClick = mniN1Click
    end
    object N3: TMenuItem
      Caption = #20462#25913#25644#20837#26085#26399
      OnClick = N3Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 256
    Top = 377
    object N2: TMenuItem
      Caption = #20462#25913#25644#20986#26085#26399
      OnClick = N2Click
    end
  end
end
