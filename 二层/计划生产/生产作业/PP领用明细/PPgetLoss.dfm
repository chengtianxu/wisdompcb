object frmgetLoss: TfrmgetLoss
  Left = 95
  Top = 142
  BorderStyle = bsSingle
  Caption = 'PP'#25439#32791#39046#26009
  ClientHeight = 649
  ClientWidth = 1192
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 217
    Width = 1192
    Height = 5
    Cursor = crVSplit
    Align = alTop
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1192
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 352
      Top = 15
      Width = 65
      Height = 13
      Caption = #20316#19994#21333#21495#65306
    end
    object Label2: TLabel
      Left = 157
      Top = 15
      Width = 65
      Height = 13
      Caption = #39046#26009#20154#21592#65306
    end
    object Label3: TLabel
      Left = 851
      Top = 15
      Width = 65
      Height = 13
      Caption = #21457#25918#26085#26399#65306
    end
    object Label6: TLabel
      Left = 606
      Top = 16
      Width = 105
      Height = 13
      Caption = 'PP'#25439#32791#39046#29992#24352#25968#65306
    end
    object btnExit: TBitBtn
      Left = 8
      Top = 6
      Width = 66
      Height = 29
      Caption = #36864#20986
      TabOrder = 0
      OnClick = btnExitClick
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        0400000000007800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
        FFFFFFFF00FFFFFFFFFFFFF030FFFFFFFFFFFF0330FFFFFFFFFF003330000000
        0FFFF03330FF0FFFFFFFF03300FF0FFFF4FFF03330FF0FFF44FFF03330FF0FF4
        4444F03330FF0F444444F03330FF0FF44444F0330FFF0FFF44FFF030FFFF0FFF
        F4FFF00FFFFF0FFFFFFFF00000000FFFFFFF}
    end
    object btnQuery: TBitBtn
      Left = 74
      Top = 6
      Width = 68
      Height = 29
      Caption = #20445#23384
      TabOrder = 1
      OnClick = btnQueryClick
      Glyph.Data = {
        C6050000424DC605000000000000360400002800000014000000140000000100
        08000000000090010000C40E0000C40E0000000100000000000000000000E8E0
        18008868080048484800D8D8E000C8C8C8001078F00070500000B0900800F8F8
        F800A8880800D0D8D800B8A81000A0800800C8D0D000E8E8E80068686800B0A0
        100098700800A8900800D0D0D000D8D8D80090700800B0981000C0A81000E0E0
        E0009878080090680800A0880800D8E0D800B8A01000B0901000000000000000
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
        0000000000000000000000000000000000000000000000000000000100000000
        000000130000301A1600000000000000E400F712000035A6FC00770000001300
        0700A7FC7700080613000083A600FC7700000000000035A5FC0077FFFF000000
        6800010000000000000000000000000000000000000000000000000000000000
        31000000000000E2EC0000640000660000004716000078011300000047001600
        780001130000F8461600000000000000C000F7120000C8F3EB007770F5001200
        0000ECFD7F0002000000000000001300AF000000000001000A0000884000F877
        30001A1600000100000000998400E6775400F71200000101010001D8F8001200
        450090FB7700801FF80077FFFF00FFFF6000F8120000AD84E6007760F8001200
        D80084E677000000000000FFFF000000C800E2EC0000C8E2EC00001800000000
        00000000000044F8120000400000000000000000000028F81200000000000000
        00000000000000000000000C000000000200000000000101120000872B00F877
        0000ECFD7F00000000000002000000006C00001A0200381A1600007FFF00FFFF
        000000000000381A1600000500000000870031E6770084F8120000218600E677
        9800F81200006713000010FFFF000000680001000000C8E2EC00000000000000
        7000F8120000ACF8120000D8F8001200100030001000F8400000105F5400E677
        680001000000D0F8120000D8F80012000800000000000E0000000F0505BF05BF
        05BF05BF05BF05BF05BF05BF05C7BF0000000000000000000000000000000000
        00050500E1138CE0E0E0E0E0E0E0E0E0E006BD1B00BFBF00031305050505BF05
        050505050505181B00050500C60705050F050FC70F050FC70FBF011B00BFBF00
        011B05A7C7090383BF0503030305011300050500010705091003050503031003
        0305011B00BFBF00011BBF031005BF03101010101005181300050500010705C7
        0FC709C70FC70FC70F05011300BFBF00011B03171017101710171017101B1B18
        00050500011318131813181B181318131813181300BFBF0001181BC601C618C6
        01C601C60101181800050500E11713000003C210050505050510C61800BFBF00
        01181B000010C705C705BF0FC71718C600050500E113180000100F0505000005
        A717C61800BFBF0001C61B000010C70505000005C71718C600050500E1171300
        00100F05050000050F10C60100BFBF00BD0101000010090F0510100FC7170101
        00E90500000000000300000000000000000000000005C705BF05BF0509E9BF05
        BF05BF05BF05BF05BF09}
    end
    object edtBarCode: TEdit
      Left = 412
      Top = 10
      Width = 169
      Height = 21
      Hint = #20351#29992#26465#30721#26538#26102#35831#23558#40736#26631#28966#28857#31227#33267#27492#22788
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnChange = edtBarCodeChange
      OnKeyDown = edtBarCodeKeyDown
      OnKeyPress = edtBarCodeKeyPress
    end
    object Edit1: TEdit
      Left = 217
      Top = 11
      Width = 88
      Height = 21
      ReadOnly = True
      TabOrder = 3
    end
    object DateTimePicker1: TDateTimePicker
      Left = 910
      Top = 11
      Width = 95
      Height = 21
      Date = 41905.484242615740000000
      Format = 'yyyy-MM-dd'
      Time = 41905.484242615740000000
      Enabled = False
      TabOrder = 4
    end
    object BitBtn7: TBitBtn
      Left = 306
      Top = 9
      Width = 25
      Height = 25
      TabOrder = 5
      OnClick = BitBtn7Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        333333777777777F33333330B00000003333337F7777777F3333333000000000
        333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
        333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
        03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
        03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
        3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
        333333333377F7F33333333333330F03333333333337F7F33333333333330B03
        3333333333373733333333333333303333333333333373333333}
      NumGlyphs = 2
    end
    object Edit2: TEdit
      Left = 706
      Top = 11
      Width = 121
      Height = 21
      TabOrder = 6
      OnKeyPress = Edit2KeyPress
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 1192
    Height = 176
    Align = alTop
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnCellClick = DBGridEh1CellClick
    Columns = <
      item
        Checkboxes = True
        EditButtons = <>
        FieldName = 'IsSelected'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
        Title.Alignment = taCenter
        Title.Caption = #36873#20013
        Width = 40
      end
      item
        EditButtons = <>
        FieldName = 'WORK_ORDER_NUMBER'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #20316#19994#21333#21495
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_NUMBER'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #26412#21378#32534#21495
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_DESC'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #23458#25143#22411#21495
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'INV_PART_NUMBER'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #26448#26009#32534#21495
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'INV_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #26448#26009#21517#31216
        Width = 110
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_CODE'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #24037#24207#20195#30721
        Width = 60
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
        FieldName = 'TTYPE731'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #31867#22411
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'manuf_qty731'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #29983#20135#24635#25968#37327
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'panel_qty731'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'PP'#37197#26009#24635#24352#25968
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'pp_quota_len731'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'PP'#37197#39069#24635#38271
      end
      item
        EditButtons = <>
        FieldName = 'lam2'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #26448#26009#21378#21830
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'lam_ty_gp'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #26448#26009#22411#21495
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'TSTATUS'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #29366#24577
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 222
    Width = 1192
    Height = 427
    Align = alClient
    TabOrder = 2
    object Splitter2: TSplitter
      Left = 361
      Top = 1
      Width = 2
      Height = 425
    end
    object Splitter3: TSplitter
      Left = 795
      Top = 1
      Width = 2
      Height = 425
      Align = alRight
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 360
      Height = 425
      Align = alLeft
      TabOrder = 0
      object DBMemo1: TDBMemo
        Left = 1
        Top = 23
        Width = 358
        Height = 401
        Align = alClient
        DataField = 'layers_info'
        DataSource = DataSource1
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object Panel7: TPanel
        Left = 1
        Top = 1
        Width = 358
        Height = 22
        Align = alTop
        Caption = #21387#23618#32467#26500
        TabOrder = 1
      end
    end
    object Panel4: TPanel
      Left = 797
      Top = 1
      Width = 394
      Height = 425
      Align = alRight
      TabOrder = 1
      object Panel9: TPanel
        Left = 1
        Top = 1
        Width = 392
        Height = 24
        Align = alTop
        Caption = #39046#29992#26126#32454
        TabOrder = 0
      end
      object Panel10: TPanel
        Left = 1
        Top = 25
        Width = 392
        Height = 399
        Align = alClient
        TabOrder = 1
        object Label4: TLabel
          Left = 53
          Top = 24
          Width = 65
          Height = 13
          Caption = #29983#20135#25968#37327#65306
        end
        object Label5: TLabel
          Left = 39
          Top = 57
          Width = 79
          Height = 13
          Caption = 'PP'#37197#39069#27604#20363#65306
        end
        object Label7: TLabel
          Left = 44
          Top = 90
          Width = 74
          Height = 13
          Caption = 'panel'#38271#24230#65306
        end
        object Label8: TLabel
          Left = 44
          Top = 125
          Width = 74
          Height = 13
          Caption = 'panel'#23485#24230#65306
        end
        object Label9: TLabel
          Left = 65
          Top = 157
          Width = 53
          Height = 13
          Caption = 'PP'#22411#21495#65306
        end
        object Label10: TLabel
          Left = 53
          Top = 189
          Width = 65
          Height = 13
          Caption = #26641#33026#21547#37327#65306
        end
        object Label11: TLabel
          Left = 78
          Top = 219
          Width = 40
          Height = 13
          Caption = 'tg'#20540#65306
        end
        object Label12: TLabel
          Left = 26
          Top = 251
          Width = 92
          Height = 13
          Caption = 'PP'#37197#39069#24635#38271#24230#65306
        end
        object Label13: TLabel
          Left = 26
          Top = 282
          Width = 92
          Height = 13
          Caption = 'PP'#37197#39069#24635#21367#25968#65306
        end
        object Label14: TLabel
          Left = 32
          Top = 315
          Width = 65
          Height = 13
          Caption = #20999#21106#26631#24535#65306
        end
        object Label15: TLabel
          Left = 208
          Top = 314
          Width = 65
          Height = 13
          Caption = #26159#21542#39046#26009#65306
        end
        object DBEdit1: TDBEdit
          Left = 120
          Top = 21
          Width = 228
          Height = 21
          DataField = 'manuf_qty732'
          DataSource = DataSource1
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 120
          Top = 53
          Width = 228
          Height = 21
          DataField = 'pp_quota'
          DataSource = DataSource1
          TabOrder = 1
        end
        object DBEdit4: TDBEdit
          Left = 120
          Top = 86
          Width = 228
          Height = 21
          DataField = 'panel_ln'
          DataSource = DataSource1
          TabOrder = 2
        end
        object DBEdit5: TDBEdit
          Left = 120
          Top = 118
          Width = 228
          Height = 21
          DataField = 'panel_wd'
          DataSource = DataSource1
          TabOrder = 3
        end
        object DBEdit6: TDBEdit
          Left = 120
          Top = 150
          Width = 228
          Height = 21
          DataField = 'PP_TYP'
          DataSource = DataSource1
          TabOrder = 4
        end
        object DBEdit7: TDBEdit
          Left = 120
          Top = 182
          Width = 228
          Height = 21
          DataField = 'pp_rc'
          DataSource = DataSource1
          TabOrder = 5
        end
        object DBEdit8: TDBEdit
          Left = 120
          Top = 214
          Width = 228
          Height = 21
          DataField = 'pp_tg'
          DataSource = DataSource1
          TabOrder = 6
        end
        object DBEdit9: TDBEdit
          Left = 120
          Top = 246
          Width = 228
          Height = 21
          DataField = 'pp_quota_len732'
          DataSource = DataSource1
          TabOrder = 7
        end
        object DBEdit10: TDBEdit
          Left = 120
          Top = 278
          Width = 228
          Height = 21
          DataField = 'pp_quota_roll'
          DataSource = DataSource1
          TabOrder = 8
        end
        object DBEdit11: TDBEdit
          Left = 94
          Top = 310
          Width = 83
          Height = 21
          DataField = 'qg_flag'
          DataSource = DataSource1
          TabOrder = 9
        end
        object DBEdit12: TDBEdit
          Left = 270
          Top = 309
          Width = 83
          Height = 21
          DataField = 'matrece_flag'
          DataSource = DataSource1
          TabOrder = 10
        end
      end
    end
    object Panel5: TPanel
      Left = 363
      Top = 1
      Width = 432
      Height = 425
      Align = alClient
      TabOrder = 2
      object imgCY: TImage
        Left = 1
        Top = 25
        Width = 430
        Height = 399
        Align = alClient
      end
      object Panel8: TPanel
        Left = 1
        Top = 1
        Width = 430
        Height = 24
        Align = alTop
        Caption = #22270#29255#32467#26500
        TabOrder = 0
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = DM.cds732hao
    Left = 648
    Top = 120
  end
end
