object Form_PoIn: TForm_PoIn
  Left = 367
  Top = 195
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25353'PO'#20837#24211
  ClientHeight = 439
  ClientWidth = 837
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 837
    Height = 33
    Align = alTop
    TabOrder = 0
    object BitBtn9: TBitBtn
      Left = 62
      Top = 3
      Width = 59
      Height = 28
      Cursor = crHandPoint
      Hint = #20851#38381
      Caption = #20851#38381
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn9Click
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
    object BtnSave: TBitBtn
      Left = 3
      Top = 3
      Width = 59
      Height = 28
      Cursor = crHandPoint
      Hint = #20445#23384
      Caption = #20445#23384
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BtnSaveClick
      OnEnter = BtnSaveEnter
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 33
    Width = 837
    Height = 129
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 60
      Height = 13
      AutoSize = False
      Caption = #20837#24211#21333#21495
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 576
      Top = 70
      Width = 60
      Height = 13
      AutoSize = False
      Caption = #36865#36135#26085#26399
    end
    object Label7: TLabel
      Left = 28
      Top = 101
      Width = 30
      Height = 13
      AutoSize = False
      Caption = #22791#27880
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 291
      Top = 12
      Width = 40
      Height = 13
      AutoSize = False
      Caption = #20379#24212#21830
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 306
      Top = 40
      Width = 30
      Height = 13
      AutoSize = False
      Caption = #36135#24065
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 31
      Top = 70
      Width = 30
      Height = 13
      AutoSize = False
      Caption = #24037#21378
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 534
      Top = 40
      Width = 100
      Height = 13
      AutoSize = False
      Caption = #20379#24212#21830#36865#36135#21333#21495
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 306
      Top = 70
      Width = 30
      Height = 13
      AutoSize = False
      Caption = #27719#29575
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 576
      Top = 12
      Width = 60
      Height = 13
      AutoSize = False
      Caption = #36865#36135#20154#21592
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object LBSale: TLabel
      Left = 633
      Top = 139
      Width = 7
      Height = 13
    end
    object Label5: TLabel
      Left = 8
      Top = 40
      Width = 60
      Height = 13
      AutoSize = False
      Caption = #37319#36141#21333#21495
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 397
      Top = 39
      Width = 7
      Height = 13
    end
    object Label6: TLabel
      Left = 125
      Top = 68
      Width = 7
      Height = 13
    end
    object Label8: TLabel
      Left = 397
      Top = 15
      Width = 7
      Height = 13
    end
    object MaskEdit1: TMaskEdit
      Left = 65
      Top = 8
      Width = 111
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 2
    end
    object EdtCurr: TEdit
      Left = 339
      Top = 36
      Width = 53
      Height = 21
      Color = clInfoBk
      Enabled = False
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 1
    end
    object EdtPO: TEdit
      Left = 65
      Top = 36
      Width = 98
      Height = 21
      Color = clInfoBk
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      ReadOnly = True
      TabOrder = 0
    end
    object EdtFac: TEdit
      Left = 65
      Top = 65
      Width = 55
      Height = 21
      Color = clInfoBk
      Enabled = False
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 3
    end
    object EdtVend: TEdit
      Left = 339
      Top = 8
      Width = 53
      Height = 21
      Color = clInfoBk
      Enabled = False
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 4
    end
    object Button1: TButton
      Left = 652
      Top = 96
      Width = 75
      Height = 25
      Caption = #20840#37096#25509#25910
      TabOrder = 5
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 640
      Top = 8
      Width = 100
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 6
    end
    object Edit2: TEdit
      Left = 640
      Top = 36
      Width = 100
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 7
    end
    object Edit3: TEdit
      Left = 72
      Top = 96
      Width = 361
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 8
    end
    object EdtRate: TEdit
      Left = 339
      Top = 64
      Width = 53
      Height = 21
      Color = clInfoBk
      Enabled = False
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 9
    end
    object Edit4: TEdit
      Left = 640
      Top = 64
      Width = 100
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 10
      OnExit = Edit4Exit
    end
    object CheckBox3: TCheckBox
      Left = 505
      Top = 104
      Width = 145
      Height = 17
      Caption = #23384#20179#20301#32622#25353#24037#21378#36807#28388
      Checked = True
      State = cbChecked
      TabOrder = 11
      OnClick = CheckBox3Click
    end
    object Button2: TButton
      Left = 729
      Top = 96
      Width = 75
      Height = 25
      Caption = #20840#37096'IQC'#25509#25910
      TabOrder = 12
      OnClick = Button2Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 162
    Width = 837
    Height = 277
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object StrGrid1: TStringGrid
      Left = 0
      Top = 0
      Width = 837
      Height = 277
      Align = alClient
      ColCount = 19
      Ctl3D = False
      DefaultRowHeight = 21
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
      ParentCtl3D = False
      PopupMenu = PopupMenu1
      TabOrder = 0
      OnDrawCell = StrGrid1DrawCell
      OnKeyDown = StrGrid1KeyDown
      OnKeyPress = StrGrid1KeyPress
      OnKeyUp = StrGrid1KeyUp
      OnSelectCell = StrGrid1SelectCell
      ColWidths = (
        88
        93
        112
        58
        47
        50
        58
        59
        85
        67
        60
        90
        64
        98
        64
        64
        64
        64
        64)
    end
    object CBloc: TComboBox
      Left = 576
      Top = 23
      Width = 84
      Height = 21
      Style = csDropDownList
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      ItemHeight = 13
      TabOrder = 1
      OnChange = CBLocChange
      OnKeyDown = CBLocKeyDown
    end
    object dtpk1: TDateTimePicker
      Left = 662
      Top = 24
      Width = 97
      Height = 21
      Date = 40015.000000000000000000
      Time = 40015.000000000000000000
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 2
      OnChange = dtpk1Change
      OnKeyDown = dtpk1KeyDown
    end
    object StrGrid2: TStringGrid
      Left = 193
      Top = 119
      Width = 552
      Height = 93
      ColCount = 8
      DefaultRowHeight = 19
      FixedCols = 0
      RowCount = 2
      TabOrder = 3
      Visible = False
      ColWidths = (
        64
        64
        64
        64
        64
        64
        64
        64)
    end
  end
  object DataSource1: TDataSource
    Left = 752
    Top = 49
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 432
    Top = 224
    object IQC1: TMenuItem
      Caption = #21333#20010#36873#25321'IQC'#25509#25910
      OnClick = IQC1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Caption = #19981#25509#25910
      OnClick = N2Click
    end
  end
end
