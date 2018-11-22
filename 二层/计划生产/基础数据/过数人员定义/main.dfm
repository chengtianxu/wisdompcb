object frmMain: TfrmMain
  Left = 235
  Top = 113
  Width = 696
  Height = 526
  Caption = #36807#25968#20154#21592#26435#38480#31649#29702
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 688
    Height = 439
    Align = alClient
    DataSource = dmcon.dsWorkerList
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    TitleHeight = 18
    OnCellClick = DBGridEh1CellClick
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'LOGIN_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #30331#24405#21517#31216
        Width = 69
      end
      item
        EditButtons = <>
        FieldName = 'empl_code'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #21592#24037#20195#30721
        Width = 81
      end
      item
        EditButtons = <>
        FieldName = 'employee_name'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #21592#24037#22995#21517
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'ABBR_NAME'
        Footers = <>
        Title.Caption = #24037#21378
        Width = 84
      end
      item
        EditButtons = <>
        FieldName = 'dept_code'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #37096#38376#20195#21495
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'dept_name'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #37096#38376#21517#31216
        Width = 117
      end
      item
        EditButtons = <>
        FieldName = 'tpostion'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #32844#20301
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'Emp_Status'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #22312#32844#24773#20917
        Width = 61
      end
      item
        EditButtons = <>
        FieldName = 'Pswd_Decode'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #23494#30721
        Visible = False
        Width = 78
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 528
      Top = 13
      Width = 13
      Height = 13
      Caption = #21040
      Visible = False
    end
    object labelKey: TLabel
      Left = 401
      Top = 10
      Width = 7
      Height = 13
      Alignment = taRightJustify
    end
    object edtKey: TEdit
      Left = 412
      Top = 6
      Width = 109
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 6
      Visible = False
      OnChange = edtKeyChange
      OnKeyPress = edtKeyKeyPress
    end
    object BitBtn1: TBitBtn
      Left = 0
      Top = 2
      Width = 57
      Height = 30
      Hint = #36864#20986#31995#32479
      Caption = #36864#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000710B0000710B00000001000000000000000000003300
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
        F1EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEF1EEEEEEEEEEEEEEEEEEEEEEEEF1E3AC
        E3F1EEEEEEEEEEEEEEEEEEEEEEF1EEACE3F1EEEEEEEEEEEEEEEEEEF1E3E28257
        57E2ACE3F1EEEEEEEEEEEEF1EEE2818181E2ACEEF1EEEEEEEEEEE382578282D7
        578181E2E3EEEEEEEEEEEE81818181D7818181E2EEEEEEEEEEEE57828989ADD7
        57797979F1EEEEEEEEEE8181DEDEACD781818181F1EEEEEEEEEE57898989ADD7
        57AAAAA2D7ADEEEEEEEE81DEDEDEACD781DEDE81D7ACEEEEEEEE57898989ADD7
        57AACEA3AD10EEEEEEEE81DEDEDEACD781DEAC81AC81EEEEEEEE5789825EADD7
        57ABCFE21110EEEEEEEE81DE8181ACD781ACACE28181EEEEEEEE578957D7ADD7
        57ABDE101010101010EE81DE56D7ACD781ACDE818181818181EE57898257ADD7
        57EE10101010101010EE81DE8156ACD781E381818181818181EE57898989ADD7
        57EE82101010101010EE81DEDEDEACD781E381818181818181EE57898989ADD7
        57ACF1821110EEEEEEEE81DEDEDEACD781ACF1818181EEEEEEEE57898989ADD7
        57ABEEAB8910EEEEEEEE81DEDEDEACD781ACE3ACDE81EEEEEEEE57828989ADD7
        57ACEEA3EE89EEEEEEEE8181DEDEACD781ACE381EEDEEEEEEEEEEEDE5E8288D7
        57A2A2A2EEEEEEEEEEEEEEDE8181DED781818181EEEEEEEEEEEEEEEEEEAC8257
        57EEEEEEEEEEEEEEEEEEEEEEEEAC818181EEEEEEEEEEEEEEEEEE}
      NumGlyphs = 2
    end
    object BitBtn3: TBitBtn
      Left = 57
      Top = 2
      Width = 57
      Height = 30
      Hint = #21047#26032#24403#21069#25968#25454
      Caption = #21047#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BitBtn3Click
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000610B0000610B00000001000000000000000000003300
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
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE5E09
        095EEEEEEEEEEEEEEEEEEEEEEEEEE28181E2EEEEEEEEEEEEEEEEEEEEEE090910
        1009EEEEEEEEEEEEEEEEEEEEEE8181ACAC81EEEEEEEEEEEEEEEEEEEE09101009
        095EEEEEEEEEEEEEEEEEEEEE81ACAC8181E2EEEEEEEEEEEEEEEEEE5E0910095E
        EEEE09090909090909EEEEE281AC81E2EEEE81818181818181EEEE0910095EEE
        EEEE09101010101009EEEE81AC81E2EEEEEE81ACACACACAC81EEEE091009EEEE
        EEEEEE091010101009EEEE81AC81EEEEEEEEEE81ACACACAC81EEEE0910095EEE
        EEEEEE5E0910101009EEEE81AC81E2EEEEEEEEE281ACACAC81EEEE5E0910095E
        EE5E09091009101009EEEEE281AC81E2EEE28181AC81ACAC81EEEEEE09101009
        09091010095E091009EEEEEE81ACAC818181ACAC81E281AC81EEEEEEEE090910
        10100909EEEEEE0909EEEEEEEE8181ACACAC8181EEEEEE8181EEEEEEEEEE5E09
        09095EEEEEEEEEEEEEEEEEEEEEEEE2818181E2EEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 114
      Top = 2
      Width = 57
      Height = 30
      Hint = #23548#20986#25968#25454#21040'Excel'
      Caption = #23548#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BitBtn2Click
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
    object BitBtn4: TBitBtn
      Left = 228
      Top = 2
      Width = 57
      Height = 30
      Hint = #37325#26032#23450#20041#26597#35810#26465#20214
      Caption = #26597#35810
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Visible = False
      Glyph.Data = {
        C6050000424DC605000000000000360400002800000014000000140000000100
        08000000000090010000C40E0000C40E0000000100000000000000000000E8E0
        0000D0A000006060600038383800F0700000B8B8C00020202000A8B0B000F0F0
        F800B8400000C0600800A0A0A000E0E0E800D8D8E000B8100000D0D8D800C0A0
        8800B8300000F8F8080098989800B0504000B0908800B8706000E0A86000E0D8
        C000F070380088888800F0D8B0005858580008101000E0D0B000B8504000E8C8
        A000F0B85000E8D8A800C8C8C800D8982000D8C0B00050505000C8803800F0C8
        8800F8500800D8A040007078780008080800E8C0880028283000F8980000E8F0
        F00040404000B0B8B800B8A0A000C0682800E0A87800F0800000C8D0D000C898
        8000E0A88000D8904800E0E0E000F0A0000070707000E0783000B0888800E8D0
        6800C8B8A800C8700800D8885000B850180028282000B8887800F0F0D8001818
        1800F070180090909000D8C05800E8B09800F8F0E000F8F0F00048484800B8C0
        C800F0C06000F8F8F800F8805800F8F0C80080808000B8906000B0B0B000D090
        5000F8600000D8D0C800E0A05800B8585800B8B00000B8481000D0D0B000D078
        3000C0702000F0A86800C0602000E8E8E800A8A8A800F0C0B800B0201000F0A8
        4000E0B89000B8B8B80068686800F0F0E800F0982000D8D0A800E8C88000F0E0
        C000B8380800F0800800D8E0E000C0C0C000F0680800B0B0B800C0601800E0B8
        7800F0981000C8781800C0C8C80010101800C8A09000E0B8600030303000F0F0
        F000C0B8B80028282800E8E0E000F0F8F8003838400078787800F0D8B800D8C8
        B800F0C89000E0E8E800B8601000D0883800F8680800D8D0B800E8D08800C8C8
        D000D0D0D000B8B0B00058586000D8D8D8002820200010101000E8E8F000F8F8
        F000D8D0D000B8786000B8480000F0780000F0880000E0B08000B8C0C000B818
        0000C0A88800B8300800B0504800F0E0B000E8D0B000F0D08800F8501000F880
        0800ECFD7F0002000000000000001300E8000100000001000A0000884000F877
        78004B1B00000100000000998400E6775400F71200000101010001D8F8001200
        450090FB7700801FF80077FFFF00FFFF6000F8120000AD84E6007760F8001200
        D80084E677000000000000FFFF0000003800A8F8000038A8F800001800000000
        00000000000044F8120000400000000000000000000028F81200000000000000
        00000000000000000000000C000000000200000000000101120000872B00F877
        0000ECFD7F00000000000002000000006C00001A0200804B1B00007FFF00FFFF
        000000000000804B1B00000500000000870031E6770084F8120000218600E677
        9800F81200006713000010FFFF00000020000100000038A8F800000000000000
        7000F8120000ACF8120000D8F8001200100030001000F8400000105F5400E677
        200001000000D0F8120000D8F80012000800000000000E0000005331B2861D86
        1D861D861D861DF81DC57431F62C9824801414572C572C6C2C6C6C1D6C6C77B2
        6CB2B26C2CDF1232DF6C6CF86CF86C861D1B006C1D0E94530E8A6E8A24240E24
        24240E6F6CB294800E531D31550E4C245524242424515551B26C322453318655
        248A0E557780000086576C002CB20E5398536C31305A55F8CC1424511486B2F3
        1D802453535386534C229457536F066F06242CB2806C065353551D5353511D53
        638C12152477248680F8245353318653531D7755358D35121B57066FF66C2453
        98536C535380240EAA6F631557123551B26C24535353945353B2065398554D35
        776F0624C56C065353551D53536C6F53535355246F152451806C245353319453
        532480535353246F7E8D531D946C245398536C53535314F85353AA2453531480
        576C245353532C5353555314C557776F14002C246C5706535355575353315353
        551B6CF857146E146C2C24535331866C775353555353535353225A35C5B20653
        9853570E57535353535353535353AA08143153315353986C866C2C6C6C1D941D
        861D8680775398535355}
    end
    object dtpStartDate: TDateTimePicker
      Left = 413
      Top = 6
      Width = 108
      Height = 21
      Date = 39226.661515115740000000
      Time = 39226.661515115740000000
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 4
      Visible = False
      OnChange = dtpStartDateChange
    end
    object dtpEndDate: TDateTimePicker
      Left = 544
      Top = 6
      Width = 108
      Height = 21
      Date = 39226.661631215280000000
      Time = 39226.661631215280000000
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 5
      Visible = False
      OnChange = dtpStartDateChange
    end
    object Button1: TButton
      Left = 288
      Top = 6
      Width = 113
      Height = 25
      Caption = #35299#23494#24182#20445#23384#23494#30721
      TabOrder = 7
      Visible = False
      OnClick = Button1Click
    end
    object BitBtn5: TBitBtn
      Left = 171
      Top = 2
      Width = 57
      Height = 30
      Hint = #25171#21360
      Caption = #25171#21360
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = BitBtn5Click
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000850E0000850E00000001000000000000000000003300
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
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE09090909
        09090909090909EEEEEEEEEE8181818181818181818181EEEEEEEE5E89898989
        89898989895E5E09EEEEEEE2ACACACACACACACACACE2E281EEEE5E5E5E5E5E5E
        5E5E5E5E5E5E095E09EEE2E2E2E2E2E2E2E2E2E2E2E281E281EE5ED789898989
        8989898989895E0909EEE2D7ACACACACACACACACACACE28181EE5ED789898989
        181289B490895E5E09EEE2D7ACACACACE281ACE281ACE2E281EE5ED7D7D7D7D7
        D7D7D7D7D7D75E5E5E09E2D7D7D7D7D7D7D7D7D7D7D7E2E2E2815ED789898989
        8989898989895E5E5E09E2D7ACACACACACACACACACACE2E2E281EE5E5E5E5E5E
        5E5E5E5E5E89895E5E09EEE2E2E2E2E2E2E2E2E2E2ACACE2E281EEEE5ED7D7D7
        D7D7D7D7D75E89895E09EEEEE2D7D7D7D7D7D7D7D7E2ACACE281EEEEEE5ED7E3
        E3E3E3E3D75E5E5E09EEEEEEEEE2D7ACACACACACD7E2E2E281EEEEEEEE5ED7D7
        D7D7D7D7D7D75EEEEEEEEEEEEEE2D7D7D7D7D7D7D7D7E2EEEEEEEEEEEEEE5ED7
        E3E3E3E3E3D75EEEEEEEEEEEEEEEE2D7ACACACACACD7E2EEEEEEEEEEEEEE5ED7
        D7D7D7D7D7D7D75EEEEEEEEEEEEEE2D7D7D7D7D7D7D7D7E2EEEEEEEEEEEEEE5E
        5E5E5E5E5E5E5E5EEEEEEEEEEEEEEEE2E2E2E2E2E2E2E2E2EEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE}
      NumGlyphs = 2
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 480
    Width = 688
    Height = 19
    Panels = <
      item
        Text = #35760#24405#25968#65306
        Width = 50
      end
      item
        Width = 50
      end>
  end
  object PopupMenu1: TPopupMenu
    Left = 232
    Top = 192
    object N1: TMenuItem
      Caption = #26032#22686
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #32534#36753
      OnClick = N2Click
    end
    object N6: TMenuItem
      Caption = #26597#30475
      OnClick = N6Click
    end
    object N3: TMenuItem
      Caption = #21024#38500
      OnClick = N3Click
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = dmcon.dsWorkerList
    UserName = 'DBPipeline1'
    Left = 336
    Top = 168
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'R:\NIERP\Report\Dept_Worker_BarCode1.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 399
    Top = 189
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      Visible = False
      mmBottomOffset = 0
      mmHeight = 11906
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 61913
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 47096
        mmLeft = 1058
        mmTop = 5292
        mmWidth = 200290
        BandType = 4
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 46038
        mmLeft = 1588
        mmTop = 5821
        mmWidth = 49477
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'employee_name'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 5027
        mmLeft = 22754
        mmTop = 18521
        mmWidth = 17198
        BandType = 4
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #24207#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 3440
        mmTop = 7408
        mmWidth = 9525
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 1588
        mmTop = 15346
        mmWidth = 49477
        BandType = 4
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 1588
        mmTop = 26458
        mmWidth = 49477
        BandType = 4
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #29992#25143#31614#25910
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 3175
        mmTop = 18521
        mmWidth = 16933
        BandType = 4
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 22490
        mmTop = 44186
        mmWidth = 21696
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #25171#21360#26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 3440
        mmTop = 44186
        mmWidth = 17992
        BandType = 4
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        mmHeight = 46038
        mmLeft = 51329
        mmTop = 5821
        mmWidth = 57415
        BandType = 4
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        mmHeight = 46038
        mmLeft = 111654
        mmTop = 5821
        mmWidth = 89165
        BandType = 4
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #30331#24405#21517':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 53975
        mmTop = 7938
        mmWidth = 13758
        BandType = 4
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #22995#21517':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 53711
        mmTop = 14552
        mmWidth = 9525
        BandType = 4
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #24037#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 83608
        mmTop = 14552
        mmWidth = 9525
        BandType = 4
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #37096#38376':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 53711
        mmTop = 20902
        mmWidth = 9525
        BandType = 4
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #25551#36848':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 53446
        mmTop = 27781
        mmWidth = 9525
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'LOGIN_NAME'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 5027
        mmLeft = 69586
        mmTop = 7673
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'employee_name'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 5027
        mmLeft = 66146
        mmTop = 14552
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'empl_code'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 5027
        mmLeft = 94986
        mmTop = 14552
        mmWidth = 11642
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'dept_name'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 5027
        mmLeft = 66146
        mmTop = 21167
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'employee_name'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 5027
        mmLeft = 127000
        mmTop = 7938
        mmWidth = 17198
        BandType = 4
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #24037#24207#36807#25968#19987#29992
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 163248
        mmTop = 8202
        mmWidth = 25400
        BandType = 4
      end
      object ppLabel11: TppLabel
        UserName = 'Label101'
        Caption = #36807#25968#21592#24080#21495#26465#30721#21345
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 136790
        mmTop = 36248
        mmWidth = 33867
        BandType = 4
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = #35831#22949#21892#20445#23384#36807#25968#24080#21495#21345'!'#26377#38382#39064#32852#31995'MIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 126471
        mmTop = 44979
        mmWidth = 71173
        BandType = 4
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Pen.Style = psDash
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 1323
        mmTop = 2646
        mmWidth = 199761
        BandType = 4
      end
      object ppDBText7: TppLabel
        UserName = 'DBText7'
        Caption = 'DBText7'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 22754
        mmTop = 7408
        mmWidth = 16140
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Label2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 16404
        mmLeft = 53711
        mmTop = 34131
        mmWidth = 51858
        BandType = 4
      end
      object ppDBBarCode2: TppDBBarCode
        UserName = 'DBBarCode2'
        AutoEncode = True
        BarCodeType = bcCode128
        BarColor = clWindowText
        CalcCheckDigit = False
        DataField = 'LOGIN_PASS'
        DataPipeline = ppDBPipeline1
        PrintHumanReadable = False
        Alignment = taCenter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 11642
        mmLeft = 129382
        mmTop = 19050
        mmWidth = 47096
        BandType = 4
        mmBarWidth = 203
        mmWideBarRatio = 25400
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 2910
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'Line4'
        Pen.Style = psDash
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 794
        mmTop = 1058
        mmWidth = 199761
        BandType = 8
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {00}
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 208
    Top = 80
    object N4: TMenuItem
      Caption = #25171#21360#21333#26465#30721
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #25171#21360#21452#26465#30721
      Visible = False
      OnClick = N5Click
    end
  end
end
