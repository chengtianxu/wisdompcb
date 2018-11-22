object FrmStepArrange: TFrmStepArrange
  Left = 213
  Top = 127
  Width = 1203
  Height = 693
  Caption = #26679#21697#22312#32447#27966#24037
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh2: TDBGridEh
    Left = 0
    Top = 31
    Width = 1187
    Height = 624
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    FooterRowCount = 1
    PopupMenu = PopupMenu2
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDrawColumnCell = DBGridEh2DrawColumnCell
    OnKeyDown = DBGridEh2KeyDown
    OnTitleClick = DBGridEh2TitleClick
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
        FieldName = 'MANU_PART_NUMBER'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #26412#21378#32534#21495
        Width = 80
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
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'dept_code1'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #29677#32452#20195#30721
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'dept_name1'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #29677#32452#21517#31216
        Width = 80
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
        FieldName = #35745#21010#23436#24037#26085#26399
        Footers = <>
        Title.Alignment = taCenter
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'NewDate'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #29702#35770#23436#24037#26102#38388
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
        FieldName = 'PRIORITY_name'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #32039#24613#31243#24230
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = #20132#36135#21608#26399'2'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #20132#36135#21608#26399
        Visible = False
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'WL'
        Footers = <>
        Title.Caption = #21097#20313#21487#35843#25511#26102#38271'('#23567#26102')'
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'LaveDate34'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #24037#24207#21097#20313#26102#38271
      end
      item
        EditButtons = <>
        FieldName = 'value1'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #24037#24207#29702#35770#23436#24037#23567#26102#25968
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'PARTS_ORDERED'
        Footer.Alignment = taCenter
        Footers = <>
        Title.Alignment = taCenter
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = #25237#20135#25968#37327
        Footer.Alignment = taCenter
        Footer.FieldName = #25237#20135#25968#37327
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Alignment = taCenter
        Width = 55
      end
      item
        EditButtons = <>
        FieldName = #22312#32447#25968#37327'PCS'
        Footer.Alignment = taCenter
        Footer.FieldName = #22312#32447#25968#37327'PCS'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Alignment = taCenter
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = #22312#32447#25968#37327'PANEL'
        Footer.Alignment = taCenter
        Footer.FieldName = #22312#32447#25968#37327'PANEL'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Alignment = taCenter
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'ModernDate34'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #24037#24207#29702#35770#23436#25104#26102#38388
        Width = 125
      end
      item
        EditButtons = <>
        FieldName = #25509#25910#26102#38388
        Footers = <>
        Title.Alignment = taCenter
        Width = 125
      end
      item
        EditButtons = <>
        FieldName = 'FLOW_NO'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #26242#20572#23567#26102#25968
        Width = 75
      end
      item
        EditButtons = <>
        FieldName = 'wip_area'
        Footer.Alignment = taCenter
        Footer.FieldName = 'wip_area'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #38754#31215
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'STEP_NUMBER'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #27493#39588
        Width = 25
      end
      item
        EditButtons = <>
        FieldName = 'pnl_size'
        Footers = <>
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
        FieldName = 'Code10'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #20851#32852#21407#23458#25143
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = #22312#32447#26102#38271
        Footers = <>
        ReadOnly = False
        Title.Alignment = taCenter
        Visible = False
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'so_oldnew'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #35746#21333#26032#26087
        Visible = False
        Width = 55
      end
      item
        EditButtons = <>
        FieldName = 'REFERENCE'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #22312#32447#22791#27880
        Visible = False
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'STATUS2'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #35746#21333#29366#24577
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'QUAN_PROD'
        Footer.Alignment = taCenter
        Footer.FieldName = 'QUAN_PROD'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #23436#24037#20837#24211#25968#37327
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'QUAN_REJ'
        Footer.Alignment = taCenter
        Footer.FieldName = 'QUAN_REJ'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Alignment = taCenter
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'TO_BE_STOCKED'
        Footer.FieldName = 'TO_BE_STOCKED'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #24453#20837#24211#25968#37327
        Width = 68
      end
      item
        EditButtons = <>
        FieldName = 'PO_NUMBER'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #23458#25143#35746#21333#21495
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'SALES_ORDER'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #38144#21806#35746#21333#21495
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'MyData0492TTYPE'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #25237#20135#31867#22411
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'WLDate'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #29702#35770#23436#24037#26102#38388'('#38745#24577')'
      end>
  end
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 1187
    Height = 31
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 638
      Top = 9
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #20316#19994#21333#21495
    end
    object BitBtn2: TBitBtn
      Left = 131
      Top = 1
      Width = 65
      Height = 28
      Caption = #23548#20986
      TabOrder = 0
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
    object BitBtn5: TBitBtn
      Left = 1
      Top = 1
      Width = 65
      Height = 28
      Caption = #36864#20986
      TabOrder = 1
      OnClick = BitBtn5Click
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
    object BitBtn4: TBitBtn
      Left = 422
      Top = 1
      Width = 68
      Height = 28
      Caption = #26242#20572
      TabOrder = 2
      OnClick = BitBtn4Click
    end
    object BitBtn3: TBitBtn
      Left = 66
      Top = 1
      Width = 65
      Height = 28
      Caption = #21047#26032
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
    object BitBtn6: TBitBtn
      Left = 340
      Top = 1
      Width = 82
      Height = 28
      Hint = #26032#22686#20135#32447#31867#22411
      Caption = #26032#22686#24037#24207#26102#38271
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BitBtn6Click
    end
    object BitBtn1: TBitBtn
      Left = 196
      Top = 1
      Width = 65
      Height = 28
      Caption = #26597#35810
      TabOrder = 5
      OnClick = BitBtn1Click
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
    object Button1: TButton
      Left = 846
      Top = 0
      Width = 84
      Height = 29
      Caption = #26356#25913#24037#24207#26102#38271
      TabOrder = 6
      Visible = False
      OnClick = Button1Click
    end
    object BitBtn7: TBitBtn
      Left = 261
      Top = 0
      Width = 79
      Height = 29
      Hint = #26174#31034#23383#27573#23450#20041
      Caption = #26174#31034#26639#30446#25511#21046
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = BitBtn7Click
    end
    object Edit1: TEdit
      Left = 692
      Top = 4
      Width = 115
      Height = 21
      TabOrder = 8
      OnChange = Edit1Change
    end
    object BitBtn8: TBitBtn
      Left = 490
      Top = 1
      Width = 68
      Height = 28
      Caption = #27719#24635
      TabOrder = 9
      OnClick = BitBtn8Click
    end
    object Button2: TButton
      Left = 558
      Top = 3
      Width = 34
      Height = 25
      Caption = #35828#26126
      TabOrder = 10
      Visible = False
      OnClick = Button2Click
    end
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    Left = 704
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = DM.Ado587
    Left = 416
    Top = 248
  end
  object PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 752
    Top = 296
    object N1: TMenuItem
      Caption = #26356#25913#20316#19994#21333#32039#24613#31243#24230
      ShortCut = 16449
      OnClick = N1Click
    end
    object N4: TMenuItem
      Caption = #26356#25913#22312#32447#22791#27880
      ShortCut = 16452
      OnClick = N4Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Caption = #20316#19994#21333#20449#24687
      ShortCut = 16467
      OnClick = N3Click
    end
    object WIP1: TMenuItem
      Caption = #22411#21495'WIP'
      ShortCut = 16471
      OnClick = WIP1Click
    end
    object N9: TMenuItem
      Caption = #21518#24037#24207#23436#25104#26102#38388#26126#32454
      OnClick = N9Click
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object N8: TMenuItem
      Caption = #21333#20010#24037#24207#26242#20572
      OnClick = N8Click
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 592
    Top = 8
    object N5: TMenuItem
      Caption = #25209#37327#24037#24207#26242#20572
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #20840#37096#26242#20572
      OnClick = N6Click
    end
  end
end
