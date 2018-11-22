object FrmEdit: TFrmEdit
  Left = 356
  Top = 171
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25209#37327#35843#34218
  ClientHeight = 550
  ClientWidth = 880
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  DesignSize = (
    880
    550)
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 5
    Top = 426
    Width = 60
    Height = 12
    Anchors = [akLeft]
    Caption = #34218#36164#31185#30446#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object lb_5: TLabel
    Left = 471
    Top = 426
    Width = 60
    Height = 12
    Anchors = [akLeft]
    Caption = #25805#20316#20154#21592#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 685
    Top = 426
    Width = 60
    Height = 12
    Anchors = [akLeft]
    Caption = #25805#20316#26102#38388#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 253
    Top = 426
    Width = 60
    Height = 12
    Anchors = [akLeft]
    Caption = #35843#21518#37329#39069#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 5
    Top = 474
    Width = 60
    Height = 12
    Anchors = [akLeft]
    Caption = #29983#25928#26085#26399#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 157
    Top = 474
    Width = 33
    Height = 13
    Anchors = [akLeft]
    Caption = #26376'1'#26085
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton2: TSpeedButton
    Left = 6
    Top = 446
    Width = 22
    Height = 21
    Caption = '....'
    NumGlyphs = 2
    Visible = False
    OnClick = SpeedButton2Click
  end
  object lbldataField: TLabel
    Left = 197
    Top = 426
    Width = 32
    Height = 13
    Caption = 'lblField'
  end
  object Label8: TLabel
    Left = 253
    Top = 474
    Width = 60
    Height = 12
    Anchors = [akLeft]
    Caption = #22791#27880#35828#26126#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton3: TSpeedButton
    Left = 32
    Top = 448
    Width = 20
    Height = 19
    Caption = '....'
    NumGlyphs = 2
    Visible = False
    OnClick = SpeedButton3Click
  end
  object SpeedButton4: TSpeedButton
    Left = 54
    Top = 446
    Width = 22
    Height = 21
    Caption = '....'
    NumGlyphs = 2
    Visible = False
    OnClick = SpeedButton4Click
  end
  object Label10: TLabel
    Left = 480
    Top = 520
    Width = 91
    Height = 13
    Caption = #39564#35777#22833#36133#31508#25968#65306
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 401
    Top = 520
    Width = 9
    Height = 15
    Font.Charset = GB2312_CHARSET
    Font.Color = clGreen
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label12: TLabel
    Left = 576
    Top = 520
    Width = 9
    Height = 15
    Font.Charset = GB2312_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label13: TLabel
    Left = 8
    Top = 520
    Width = 390
    Height = 13
    Caption = #27880#65306#20445#23384#26102#65292#21482#20445#23384#39564#35777#36890#36807#30340#35843#34218#35760#24405#65292#24403#21069#39564#35777#36890#36807#35760#24405#31508#25968#65306
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object ComboBox2: TComboBox
    Left = 67
    Top = 422
    Width = 130
    Height = 21
    Anchors = [akLeft]
    Color = clSkyBlue
    ItemHeight = 13
    TabOrder = 1
    OnChange = ComboBox2Change
  end
  object edt_5: TEdit
    Left = 533
    Top = 422
    Width = 130
    Height = 21
    Anchors = [akLeft]
    Color = clSkyBlue
    ReadOnly = True
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 315
    Top = 422
    Width = 130
    Height = 21
    Anchors = [akLeft]
    Color = clWhite
    TabOrder = 2
    OnChange = Edit1Change
  end
  object Edit2: TEdit
    Left = 747
    Top = 422
    Width = 130
    Height = 21
    Anchors = [akLeft]
    Color = clSkyBlue
    ReadOnly = True
    TabOrder = 4
  end
  object DateTimePicker1: TDateTimePicker
    Left = 67
    Top = 470
    Width = 86
    Height = 21
    Anchors = [akLeft]
    Date = 41183.347047523150000000
    Format = 'yyyy-MM'
    Time = 41183.347047523150000000
    DateMode = dmUpDown
    TabOrder = 5
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 880
    Height = 57
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      880
      57)
    object Label1: TLabel
      Left = 209
      Top = 25
      Width = 60
      Height = 12
      Anchors = [akLeft]
      Caption = #24080#22871#31867#22411#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 390
      Top = 10
      Width = 480
      Height = 36
      Caption = 
        '1'#65306#25209#37327#35843#34218#25152#36873#21592#24037#24517#39035#20026#21516#19968#24080#22871#31867#22411'    2'#65306#24080#22871#31867#22411#25913#21464#23558#33258#21160#28165#31354#25152#36873#20154#21592#21517#21333#13#10#13#10'3'#65306#22521#35757#32534#21495#21482#38024#23545#32508#21512#24037#36164#26377#25928'  4' +
        #65306#34218#36164#31185#30446#21464#20026#38750#32508#21512#24037#36164#65292#25152#26377#22521#35757#32534#21495#23558#33258#21160#28165#31354
      Color = cl3DLight
      Font.Charset = GB2312_CHARSET
      Font.Color = clTeal
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object BitBtn7: TBitBtn
      Left = 4
      Top = 14
      Width = 65
      Height = 28
      Anchors = [akLeft, akBottom]
      Caption = '&C'#20851#38381
      TabOrder = 0
      OnClick = BitBtn7Click
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
    object ComboBox3: TComboBox
      Left = 266
      Top = 19
      Width = 110
      Height = 21
      Anchors = [akLeft]
      Color = clSkyBlue
      ItemHeight = 13
      TabOrder = 1
      OnChange = ComboBox3Change
    end
    object BitBtn3: TBitBtn
      Left = 136
      Top = 14
      Width = 65
      Height = 28
      Anchors = [akLeft, akBottom]
      Caption = #26032#22686
      TabOrder = 2
      OnClick = BitBtn3Click
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
    object BitBtn8: TBitBtn
      Left = 70
      Top = 14
      Width = 65
      Height = 28
      Anchors = [akLeft, akBottom]
      Caption = '&D'#28165#31354
      TabOrder = 3
      OnClick = BitBtn8Click
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
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE090909
        09EEEE09090909EEEEEEEEEEEE81818181EEEE81818181EEEEEEEEEEEE091010
        09EEEE09101009EEEEEEEEEEEE81ACAC81EEEE81ACAC81EEEEEEEEEEEE091010
        09EEEE09101009EEEEEEEEEEEE81ACAC81EEEE81ACAC81EEEEEEEEEEEE091010
        09EEEE09101009EEEEEEEEEEEE81ACAC81EEEE81ACAC81EEEEEEEEEEEE091010
        09EEEE09101009EEEEEEEEEEEE81ACAC81EEEE81ACAC81EEEEEEEEEEEE091010
        09EEEE09101009EEEEEEEEEEEE81ACAC81EEEE81ACAC81EEEEEEEEEEEE091010
        09EEEE09101009EEEEEEEEEEEE81ACAC81EEEE81ACAC81EEEEEEEEEEEE091010
        09EEEE09101009EEEEEEEEEEEE81ACAC81EEEE81ACAC81EEEEEEEEEEEE091010
        09EEEE09101009EEEEEEEEEEEE81ACAC81EEEE81ACAC81EEEEEEEEEEEE090909
        09EEEE09090909EEEEEEEEEEEE81818181EEEE81818181EEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE}
      NumGlyphs = 2
    end
  end
  object Memo1: TMemo
    Left = 315
    Top = 458
    Width = 560
    Height = 46
    TabOrder = 6
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 880
    Height = 352
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 7
    object StringGrid1: TStringGrid
      Left = 2
      Top = 2
      Width = 876
      Height = 348
      Align = alClient
      ColCount = 12
      DefaultRowHeight = 18
      FixedCols = 0
      RowCount = 2
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goTabs]
      ParentFont = False
      PopupMenu = PopupMenu1
      TabOrder = 0
      OnDrawCell = StringGrid1DrawCell
      OnSelectCell = StringGrid1SelectCell
      ColWidths = (
        57
        55
        77
        79
        50
        48
        92
        91
        2
        2
        2
        291)
    end
  end
  object BitBtn2: TBitBtn
    Left = 686
    Top = 512
    Width = 90
    Height = 30
    Anchors = [akLeft, akBottom]
    Caption = #39564#35777
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = BitBtn2Click
  end
  object BitBtn1: TBitBtn
    Left = 783
    Top = 512
    Width = 90
    Height = 30
    Anchors = [akLeft, akBottom]
    Caption = #20445#23384
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = BitBtn1Click
  end
  object PopupMenu1: TPopupMenu
    Left = 160
    Top = 136
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = N1Click
    end
  end
end
