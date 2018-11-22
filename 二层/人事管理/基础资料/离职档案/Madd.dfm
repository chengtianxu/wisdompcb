object fm_madd: Tfm_madd
  Left = 193
  Top = 94
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22686#21152#35760#24405
  ClientHeight = 496
  ClientWidth = 806
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sg_mtadd: TStringGrid
    Left = 0
    Top = 41
    Width = 806
    Height = 205
    Align = alTop
    BiDiMode = bdLeftToRight
    ColCount = 11
    DefaultRowHeight = 20
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    ParentBiDiMode = False
    PopupMenu = pm_madd
    TabOrder = 0
    OnDrawCell = sg_mtaddDrawCell
    OnSelectCell = sg_mtaddSelectCell
    ColWidths = (
      12
      77
      60
      59
      43
      97
      90
      71
      68
      69
      142)
  end
  object bbt_cnl: TBitBtn
    Left = 704
    Top = 465
    Width = 89
    Height = 25
    Caption = #21462#28040
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TabStop = False
    OnClick = bbt_cnlClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333FFFFF333333000033333388888833333333333F888888FFF333
      000033338811111188333333338833FFF388FF33000033381119999111833333
      38F338888F338FF30000339119933331111833338F388333383338F300003391
      13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
      33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
      33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
      000039183811193333918338F8F833F83333838F000039118111933339118338
      F3833F83333833830000339111193333391833338F33F8333FF838F300003391
      11833338111833338F338FFFF883F83300003339111888811183333338FF3888
      83FF83330000333399111111993333333388FFFFFF8833330000333333999999
      3333333333338888883333330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 806
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lb_1: TLabel
      Left = 336
      Top = 19
      Width = 288
      Height = 12
      Caption = '('#27880#24847#65306#22797#32844#25110#26356#26032#24037#21495#26102#65292#19968#27425#24615#21482#33021#26356#26032#19968#20010#21592#24037')'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object bbt_reslt: TBitBtn
      Left = 157
      Top = 8
      Width = 80
      Height = 25
      Caption = #28165#31354#25968#25454
      TabOrder = 0
      OnClick = bbt_resltClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000420B0000420B00000001000000000000000000003300
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
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE5E095EEEEE
        EEEEEEEEEEEEEEEEEEEEEEAC81ACEEEEEEEEEEEEEEEEEEEEEEEEEE090909EEEE
        0000000000000000EEEEEE818181EEEE8181818181818181EEEEEE5E095EEEEE
        EEEEEEEEEEEEEEEEEEEEEEAC81ACEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE5E095EEEEE
        EEEEEEEEEEEEEEEEEEEEEEAC81ACEEEEEEEEEEEEEEEEEEEEEEEEEE090909EEEE
        0000000000000000EEEEEE818181EEEE8181818181818181EEEEEE5E095EEEEE
        EEEEEEEEEEEEEEEEEEEEEEAC81ACEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE5E095EEEEE
        EEEEEEEEEEEEEEEEEEEEEEAC81ACEEEEEEEEEEEEEEEEEEEEEEEEEE090909EEEE
        0000000000000000EEEEEE818181EEEE8181818181818181EEEEEE5E095EEEEE
        EEEEEEEEEEEEEEEEEEEEEEAC81ACEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE}
      NumGlyphs = 2
    end
    object bbt_1: TBitBtn
      Left = 237
      Top = 8
      Width = 80
      Height = 25
      Caption = #28155#21152#20154#21592
      TabOrder = 1
      OnClick = N1Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000D80E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777707777777777777777777777777700007007777777777777777777
        7777770000700000000077777777777777777747777000000777774477700000
        0777444447777777777777447770000000007747777000000000777777777777
        7777770000700000000077777777777777777777777077777777}
    end
    object bbt_2: TBitBtn
      Left = 77
      Top = 8
      Width = 80
      Height = 25
      Caption = #21024#38500
      TabOrder = 2
      OnClick = N2Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000D80E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777770F77770F7777777777777000F777777
        0F7777000F777770F777777000F77700F7777777000F700F77777777700000F7
        7777777777000F7777777777700000F777777777000F70F77777770000F77700
        F77770000F7777700F77700F7777777700F77777777777777777}
    end
    object bbt_3: TBitBtn
      Left = 1
      Top = 7
      Width = 75
      Height = 25
      Caption = #20851#38381
      TabOrder = 3
      OnClick = bbt_3Click
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        0400000000007800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
        FFFFFFFF00FFFFFFFFFFFFF030FFFFFFFFFFFF0330FFFFFFFFFF003330000000
        0FFFF03330FF0FFFFFFFF03300FF0FFFF4FFF03330FF0FFF44FFF03330FF0FF4
        4444F03330FF0F444444F03330FF0FF44444F0330FFF0FFF44FFF030FFFF0FFF
        F4FFF00FFFFF0FFFFFFFF00000000FFFFFFF}
      NumGlyphs = 2
    end
  end
  object btn_mtlv1: TBitBtn
    Left = 603
    Top = 465
    Width = 90
    Height = 25
    Caption = #30830#35748#31163#32844
    TabOrder = 3
    OnClick = btn_mtlv1Click
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
  object btn_alt1: TBitBtn
    Left = 507
    Top = 465
    Width = 90
    Height = 25
    Caption = #30830#35748#21464#21160
    TabOrder = 4
    OnClick = btn_alt1Click
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
  object grb_1: TGroupBox
    Left = 0
    Top = 246
    Width = 806
    Height = 217
    Align = alTop
    Caption = #21592#24037#22797#24037
    Color = cl3DLight
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 5
    object grb_2: TGroupBox
      Left = 2
      Top = 17
      Width = 802
      Height = 70
      Align = alTop
      Caption = #21592#24037#24403#21069#20449#24687
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label12: TLabel
        Left = 489
        Top = 20
        Width = 47
        Height = 13
        AutoSize = False
        Caption = #21512#21516#31867#22411
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 240
        Top = 21
        Width = 43
        Height = 13
        AutoSize = False
        Caption = #21407#32844#21153
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lb_pvalue: TLabel
        Left = 2
        Top = 21
        Width = 48
        Height = 13
        AutoSize = False
        Caption = #21407#24037#21495
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 104
        Top = 21
        Width = 44
        Height = 13
        AutoSize = False
        Caption = #21407#37096#38376
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lb_13: TLabel
        Left = 370
        Top = 20
        Width = 50
        Height = 13
        AutoSize = False
        Caption = #21407#32844#32423
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 629
        Top = 18
        Width = 56
        Height = 13
        AutoSize = False
        Caption = #31163#32844#21407#22240
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object dbt_dept: TDBEdit
        Left = 144
        Top = 17
        Width = 94
        Height = 21
        Color = clSkyBlue
        DataField = 'departmentname'
        DataSource = DM.ds_msg
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object dbt_posit: TDBEdit
        Left = 280
        Top = 17
        Width = 85
        Height = 21
        Color = clSkyBlue
        DataField = 'pposition'
        DataSource = DM.ds_msg
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object dbt_emp: TDBEdit
        Left = 540
        Top = 14
        Width = 85
        Height = 21
        Color = clSkyBlue
        DataField = 'employ_type'
        DataSource = DM.ds_msg
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object dbt_pvalue: TDBEdit
        Left = 41
        Top = 17
        Width = 62
        Height = 21
        Color = clSkyBlue
        DataField = 'employeecode'
        DataSource = DM.ds_msg
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object dbt_rank: TDBEdit
        Left = 408
        Top = 16
        Width = 75
        Height = 21
        Color = clSkyBlue
        DataField = 'rankname'
        DataSource = DM.ds_msg
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit1: TDBEdit
        Left = 678
        Top = 13
        Width = 122
        Height = 21
        Color = clSkyBlue
        DataField = 'oold_reason'
        DataSource = DM.ds_msg
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
    end
    object grb_3: TGroupBox
      Left = 2
      Top = 87
      Width = 802
      Height = 128
      Align = alClient
      Caption = #21464#21160#20449#24687
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object lb_cvalue: TLabel
        Left = 26
        Top = 21
        Width = 37
        Height = 17
        AutoSize = False
        Caption = #26032#24037#21495
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object btn1: TSpeedButton
        Left = 269
        Top = 12
        Width = 25
        Height = 24
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        Glyph.Data = {
          EE000000424DEE000000000000007600000028000000100000000F0000000100
          04000000000078000000130B0000130B00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888800000888880000080F000888880F00080F000888880F0008000000080000
          000800F000000F00000800F000800F00000800F000800F000008800000000000
          0088880F00080F000888880000080000088888800088800088888880F08880F0
          888888800088800088888888888888888888}
        ParentFont = False
        OnClick = btn1Click
      end
      object Label11: TLabel
        Left = 626
        Top = 18
        Width = 59
        Height = 17
        AutoSize = False
        Caption = #26032#21512#21516#31867#22411
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lb_type: TLabel
        Left = 15
        Top = 45
        Width = 50
        Height = 17
        AutoSize = False
        Caption = #21464#26356#31867#22411
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lb_alterdate: TLabel
        Left = 314
        Top = 46
        Width = 49
        Height = 13
        AutoSize = False
        Caption = #21464#26356#26085#26399
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lb_operdate: TLabel
        Left = 488
        Top = 47
        Width = 51
        Height = 13
        AutoSize = False
        Caption = #25805#20316#26085#26399
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lb_deptname: TLabel
        Left = 408
        Top = 32
        Width = 7
        Height = 13
        Visible = False
      end
      object lb_position: TLabel
        Left = 616
        Top = 24
        Width = 7
        Height = 13
        Visible = False
      end
      object btn2: TSpeedButton
        Left = 418
        Top = 12
        Width = 28
        Height = 25
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        Glyph.Data = {
          EE000000424DEE000000000000007600000028000000100000000F0000000100
          04000000000078000000130B0000130B00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888800000888880000080F000888880F00080F000888880F0008000000080000
          000800F000000F00000800F000800F00000800F000800F000008800000000000
          0088880F00080F000888880000080000088888800088800088888880F08880F0
          888888800088800088888888888888888888}
        ParentFont = False
        OnClick = btn2Click
      end
      object lb_6: TLabel
        Left = 155
        Top = 21
        Width = 36
        Height = 12
        Caption = #26032#37096#38376
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lb_7: TLabel
        Left = 307
        Top = 21
        Width = 36
        Height = 12
        Caption = #26032#32844#21153
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lb_12: TLabel
        Left = 650
        Top = 47
        Width = 37
        Height = 17
        AutoSize = False
        Caption = #25805#20316#20154
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lb_14: TLabel
        Left = 469
        Top = 18
        Width = 37
        Height = 17
        AutoSize = False
        Caption = #26032#32844#32423
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object btn3: TSpeedButton
        Left = 582
        Top = 12
        Width = 28
        Height = 25
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        Glyph.Data = {
          EE000000424DEE000000000000007600000028000000100000000F0000000100
          04000000000078000000130B0000130B00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888800000888880000080F000888880F00080F000888880F0008000000080000
          000800F000000F00000800F000800F00000800F000800F000008800000000000
          0088880F00080F000888880000080000088888800088800088888880F08880F0
          888888800088800088888888888888888888}
        ParentFont = False
        OnClick = btn3Click
      end
      object lb_8: TLabel
        Left = 784
        Top = 8
        Width = 7
        Height = 13
        Visible = False
      end
      object Label2: TLabel
        Left = 36
        Top = 70
        Width = 26
        Height = 13
        Caption = #22791#27880
      end
      object Label5: TLabel
        Left = 163
        Top = 45
        Width = 36
        Height = 12
        Caption = #26032#24080#22871
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object btn4: TSpeedButton
        Left = 278
        Top = 36
        Width = 29
        Height = 25
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        Glyph.Data = {
          EE000000424DEE000000000000007600000028000000100000000F0000000100
          04000000000078000000130B0000130B00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888800000888880000080F000888880F00080F000888880F0008000000080000
          000800F000000F00000800F000800F00000800F000800F000008800000000000
          0088880F00080F000888880000080000088888800088800088888880F08880F0
          888888800088800088888888888888888888}
        ParentFont = False
        OnClick = btn4Click
      end
      object lb_9: TLabel
        Left = 312
        Top = 32
        Width = 7
        Height = 13
        Caption = '0'
        Visible = False
      end
      object cbb_emp: TComboBox
        Left = 687
        Top = 14
        Width = 105
        Height = 20
        Style = csDropDownList
        Color = clSkyBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ItemHeight = 12
        ParentFont = False
        TabOrder = 0
      end
      object edt_code: TEdit
        Left = 64
        Top = 14
        Width = 75
        Height = 20
        Color = clSkyBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object edt_1: TEdit
        Left = 193
        Top = 14
        Width = 75
        Height = 20
        Color = clSkyBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object cbb_type: TComboBox
        Left = 64
        Top = 41
        Width = 97
        Height = 20
        Style = csDropDownList
        Color = clSkyBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ItemHeight = 12
        ParentFont = False
        TabOrder = 3
      end
      object dtp_alterdate: TDateTimePicker
        Left = 364
        Top = 41
        Width = 120
        Height = 20
        Date = 40831.694511168980000000
        Time = 40831.694511168980000000
        Color = clSkyBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object dtp_operdate: TDateTimePicker
        Left = 538
        Top = 42
        Width = 105
        Height = 20
        Date = 40809.694511168980000000
        Time = 40809.694511168980000000
        Color = clSkyBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object edt_2: TEdit
        Left = 345
        Top = 15
        Width = 75
        Height = 20
        Color = clSkyBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object edt_12: TEdit
        Left = 689
        Top = 41
        Width = 105
        Height = 20
        Color = clSkyBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
      object edt_13: TEdit
        Left = 508
        Top = 14
        Width = 75
        Height = 20
        Color = clSkyBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
      end
      object Memo2: TMemo
        Left = 64
        Top = 70
        Width = 729
        Height = 53
        TabOrder = 9
      end
      object edt_4: TEdit
        Left = 201
        Top = 38
        Width = 75
        Height = 20
        Color = clSkyBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
      end
    end
  end
  object grb_LZ: TGroupBox
    Left = 5
    Top = 131
    Width = 802
    Height = 114
    Caption = #21592#24037#31163#32844
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Visible = False
    object lb_2: TLabel
      Left = 197
      Top = 28
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #31163#32844#26085#26399
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object lb_3: TLabel
      Left = 21
      Top = 28
      Width = 57
      Height = 17
      AutoSize = False
      Caption = #31163#32844#31867#22411
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object lb_4: TLabel
      Left = 357
      Top = 28
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #31163#32844#21407#22240
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object lb_5: TLabel
      Left = 533
      Top = 28
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #25805#20316#26085#26399
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object lb_11: TLabel
      Left = 689
      Top = 29
      Width = 37
      Height = 12
      AutoSize = False
      Caption = #25805#20316#20154
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 17
      Top = 59
      Width = 26
      Height = 13
      Caption = #22791#27880
    end
    object dtpLZdate: TDateTimePicker
      Left = 247
      Top = 23
      Width = 90
      Height = 20
      Date = 40831.694511168980000000
      Time = 40831.694511168980000000
      Color = clSkyBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object cbb_LZtype: TComboBox
      Left = 72
      Top = 23
      Width = 105
      Height = 20
      Style = csDropDownList
      Color = clSkyBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ItemHeight = 12
      ParentFont = False
      TabOrder = 1
    end
    object cbb_LZrs: TComboBox
      Left = 408
      Top = 23
      Width = 105
      Height = 20
      Style = csDropDownList
      Color = clSkyBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ItemHeight = 12
      ParentFont = False
      TabOrder = 2
    end
    object dtpOperDate: TDateTimePicker
      Left = 583
      Top = 23
      Width = 90
      Height = 20
      Date = 40809.694511168980000000
      Time = 40809.694511168980000000
      Color = clSkyBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object edt_11: TEdit
      Left = 725
      Top = 23
      Width = 60
      Height = 20
      Color = clSkyBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object Memo1: TMemo
      Left = 48
      Top = 59
      Width = 737
      Height = 45
      TabOrder = 5
    end
  end
  object pm_madd: TPopupMenu
    Left = 136
    Top = 272
    object N1: TMenuItem
      Caption = #28155#21152
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21024#38500
      OnClick = N2Click
    end
  end
end
