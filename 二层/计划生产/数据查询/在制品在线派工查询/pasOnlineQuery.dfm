object FrmOnlineQuery: TFrmOnlineQuery
  Left = 150
  Top = 126
  Align = alClient
  AutoSize = True
  BorderStyle = bsNone
  Caption = #22312#21046#21697#22312#32447#27966#24037#26597#35810
  ClientHeight = 623
  ClientWidth = 1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 32
    Top = 152
    Width = 697
    Height = 313
    ScrollBars = ssVertical
    TabOrder = 1
    Visible = False
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 1080
    Height = 582
    Align = alClient
    DataSource = DM.DataSource1
    FooterColor = clSkyBlue
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    PopupMenu = PopupMenu2
    ReadOnly = True
    SumList.Active = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDrawColumnCell = DBGridEh1DrawColumnCell
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'WORK_ORDER_NUMBER'
        Footer.Alignment = taCenter
        Footer.Value = #21512#35745
        Footer.ValueType = fvtStaticText
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #20316#19994#21333#21495
        Width = 115
      end
      item
        EditButtons = <>
        FieldName = 'CUST_CODE'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #23458#25143#32534#21495
        Width = 55
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_NUMBER'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #26412#21378#32534#21495
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_DESC'
        Footers = <>
        ReadOnly = False
        Title.Alignment = taCenter
        Title.Caption = #23458#25143#22411#21495
        Visible = False
        Width = 130
      end
      item
        EditButtons = <>
        FieldName = 'ANALYSIS_CODE_2'
        Footers = <>
        ReadOnly = False
        Title.Alignment = taCenter
        Title.Caption = #23458#25143#29289#26009#21495
        Visible = False
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_CODE'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #24037#24207#20195#30721
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #24037#24207#21517#31216
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = #25237#20135#25968#37327
        Footer.FieldName = #25237#20135#25968#37327
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Alignment = taCenter
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = #22312#32447#25968#37327'PCS'
        Footer.FieldName = #22312#32447#25968#37327'PCS'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Alignment = taCenter
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = #22312#32447#25968#37327'PANEL'
        Footer.FieldName = #22312#32447#25968#37327'PANEL'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Alignment = taCenter
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'STEP'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #27493#39588
        Width = 25
      end
      item
        EditButtons = <>
        FieldName = 'wip_area'
        Footer.FieldName = 'wip_area'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #19981#21547#26495#36793#38754#31215
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'pl_area'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #21547#26495#36793#38754#31215
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'pnl_size'
        Footers = <>
        ReadOnly = False
        Title.Alignment = taCenter
        Title.Caption = #29983#20135#23610#23544
        Visible = False
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = #20316#19994#21333#29366#24577
        Footers = <>
        Title.Alignment = taCenter
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = #25209#27425#29366#24577
        Footers = <>
        ReadOnly = False
        Title.Alignment = taCenter
        Visible = False
        Width = 55
      end
      item
        EditButtons = <>
        FieldName = 'CUT_NO'
        Footers = <>
        ReadOnly = False
        Title.Alignment = taCenter
        Title.Caption = #37197#26009#21333#21495
        Visible = False
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = #25509#25910#26102#38388
        Footers = <>
        Title.Alignment = taCenter
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = #25237#20135#26102#38388
        Footers = <>
        Title.Alignment = taCenter
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = #35745#21010#23436#24037#26085#26399
        Footers = <>
        Title.Alignment = taCenter
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = #20132#36135#21608#26399'2'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #20132#36135#21608#26399
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = #22312#32447#26102#38271
        Footers = <>
        ReadOnly = False
        Title.Alignment = taCenter
        Visible = False
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = #20869#22806#23618
        Footers = <>
        ReadOnly = False
        Title.Alignment = taCenter
        Visible = False
        Width = 35
      end
      item
        EditButtons = <>
        FieldName = #36820#24037#20013
        Footers = <>
        ReadOnly = False
        Title.Alignment = taCenter
        Visible = False
        Width = 30
      end
      item
        EditButtons = <>
        FieldName = #27491#24120#37325#26816
        Footers = <>
        ReadOnly = False
        Title.Alignment = taCenter
        Visible = False
        Width = 55
      end
      item
        EditButtons = <>
        FieldName = #26159#21542#27966#24037
        Footers = <>
        ReadOnly = False
        Title.Alignment = taCenter
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'assign_date'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #31532#19968#27425#27966#24037#26102#38388
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'DateValue'
        Footers = <>
        ReadOnly = False
        Title.Alignment = taCenter
        Title.Caption = #27966#24037#23567#26102
        Width = 55
      end
      item
        EditButtons = <>
        FieldName = #22312#32447#20572#30041#26102#38388
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #22312#32447#20572#30041#22825#25968
        Visible = False
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = #27966#24037#35201#27714#23436#25104#26102#38388
        Footers = <>
        ReadOnly = False
        Title.Alignment = taCenter
        Width = 110
      end
      item
        EditButtons = <>
        FieldName = #27966#24037#21097#20313#23567#26102
        Footers = <>
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = #27966#24037#26159#21542#36229#26102
        Footers = <>
        ReadOnly = False
        Title.Alignment = taCenter
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'SALES_ORDER'
        Footers = <>
        ReadOnly = False
        Title.Alignment = taCenter
        Title.Caption = #38144#21806#35746#21333
        Visible = False
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'PO_NUMBER'
        Footers = <>
        ReadOnly = False
        Title.Alignment = taCenter
        Title.Caption = #23458#25143#35746#21333#21495
        Visible = False
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'so_oldnew'
        Footers = <>
        ReadOnly = False
        Title.Alignment = taCenter
        Title.Caption = #35746#21333#26032#26087
        Visible = False
        Width = 55
      end
      item
        EditButtons = <>
        FieldName = 'REFERENCE'
        Footers = <>
        ReadOnly = False
        Title.Alignment = taCenter
        Title.Caption = #22312#32447#22791#27880
        Visible = False
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'sotp'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #21152#24037#24418#24335
        Visible = False
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'ttype'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #20135#21697#23646#24615
        Visible = False
        Width = 56
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'FLOW_NO'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #26242#20572#23567#26102#25968
        Visible = False
        Width = 62
      end
      item
        EditButtons = <>
        FieldName = 'ABBR_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #24037#21378#31616#31216
        Visible = False
        Width = 65
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1080
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object Label1: TLabel
      Left = 554
      Top = 15
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #20316#19994#21333#21495
    end
    object Label2: TLabel
      Left = 731
      Top = 14
      Width = 111
      Height = 13
      Caption = #36229#21333#25968'/'#24635#36229#21333#25968#65306
    end
    object Label3: TLabel
      Left = 835
      Top = 15
      Width = 7
      Height = 13
    end
    object Label5: TLabel
      Left = 892
      Top = 15
      Width = 7
      Height = 13
    end
    object Label7: TLabel
      Left = 912
      Top = 15
      Width = 7
      Height = 13
    end
    object BitBtn1: TBitBtn
      Left = 1
      Top = 5
      Width = 56
      Height = 33
      Cursor = crHandPoint
      Hint = #36864#20986
      Caption = #36864#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = False
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
    object BitBtn3: TBitBtn
      Left = 57
      Top = 5
      Width = 56
      Height = 33
      Hint = #21047#26032#25968#25454
      Caption = #21047#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
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
      Left = 113
      Top = 5
      Width = 56
      Height = 33
      Hint = #26356#25913#26597#35810#26465#20214
      Caption = #26597#35810
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BitBtn2Click
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
    object BitBtn4: TBitBtn
      Left = 169
      Top = 5
      Width = 56
      Height = 33
      Hint = #23548#20986#25968#25454'Excel'
      Caption = #23548#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BitBtn4Click
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
    object BitBtn5: TBitBtn
      Left = 225
      Top = 5
      Width = 82
      Height = 33
      Hint = #26174#31034#23383#27573#23450#20041
      Caption = #26174#31034#26639#30446#25511#21046
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BitBtn5Click
    end
    object Edit1: TEdit
      Left = 608
      Top = 11
      Width = 115
      Height = 21
      TabOrder = 5
      OnChange = Edit1Change
    end
    object Button1: TButton
      Left = 307
      Top = 5
      Width = 67
      Height = 33
      Hint = #27966#24037#36229#26102#30701#20449#25509#25910#20154#21592#23450#20041
      Caption = #25509#25910#20154#23450#20041
      TabOrder = 6
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 374
      Top = 5
      Width = 57
      Height = 33
      Hint = #25209#37327#24037#24207#26242#20572
      Caption = #25209#37327#26242#20572
      TabOrder = 7
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 431
      Top = 5
      Width = 57
      Height = 33
      Caption = #20840#37096#26242#20572
      TabOrder = 8
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 488
      Top = 5
      Width = 56
      Height = 33
      Caption = #20010#25968#27719#24635
      TabOrder = 9
      OnClick = Button4Click
    end
  end
  object Timer1: TTimer
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 84
    Top = 136
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    Left = 832
    Top = 8
  end
  object PopupMenu2: TPopupMenu
    Left = 480
    Top = 152
    object N1: TMenuItem
      Caption = #21333#20010#24037#24207#26242#20572
      OnClick = N1Click
    end
  end
end
