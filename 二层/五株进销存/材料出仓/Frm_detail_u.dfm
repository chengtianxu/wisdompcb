object Frm_detail: TFrm_detail
  Left = 413
  Top = 155
  BorderStyle = bsSingle
  Caption = 'Frm_detail'
  ClientHeight = 359
  ClientWidth = 613
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 3
    Top = 48
    Width = 48
    Height = 12
    Caption = #20986#24211#21333#21495
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 8
    Top = 96
    Width = 48
    Height = 12
    Caption = #20986#24211#26085#26399
  end
  object Label3: TLabel
    Left = 354
    Top = 143
    Width = 48
    Height = 12
    Caption = #39046#26009#20154#21592
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 7
    Top = 120
    Width = 48
    Height = 12
    Caption = #37319#36141#21333#21495
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 8
    Top = 164
    Width = 48
    Height = 12
    Caption = #26448#26009#31867#22411
    FocusControl = DBEdit2
  end
  object Label6: TLabel
    Left = 8
    Top = 190
    Width = 48
    Height = 12
    Caption = #26448#26009#32534#30721
    FocusControl = DBEdit5
  end
  object Label7: TLabel
    Left = 8
    Top = 216
    Width = 48
    Height = 12
    Caption = #26448#26009#21517#31216
    FocusControl = DBEdit6
  end
  object Label8: TLabel
    Left = 8
    Top = 240
    Width = 48
    Height = 12
    Caption = #26448#26009#35268#26684
    FocusControl = DBEdit7
  end
  object Label9: TLabel
    Left = 33
    Top = 264
    Width = 24
    Height = 12
    Caption = #21333#20301
    FocusControl = DBEdit8
  end
  object Label10: TLabel
    Left = 360
    Top = 272
    Width = 48
    Height = 12
    Caption = #20986#24211#25968#37327
    FocusControl = DBEdit9
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 344
    Top = 96
    Width = 60
    Height = 12
    Caption = #20379#24212#21830#32534#30721
    FocusControl = DBEdit10
  end
  object Label12: TLabel
    Left = 344
    Top = 119
    Width = 60
    Height = 12
    Caption = #20379#24212#21830#31616#31216
    FocusControl = DBEdit11
  end
  object Label13: TLabel
    Left = 354
    Top = 170
    Width = 48
    Height = 12
    Caption = #21457#26009#20154#21592
    FocusControl = DBEdit12
  end
  object Label14: TLabel
    Left = 378
    Top = 214
    Width = 24
    Height = 12
    Caption = #20179#24211
    FocusControl = DBEdit13
  end
  object Label15: TLabel
    Left = 354
    Top = 236
    Width = 48
    Height = 12
    Caption = #25910#26009#24037#21378
    FocusControl = DBEdit14
  end
  object Label16: TLabel
    Left = 358
    Top = 297
    Width = 48
    Height = 12
    Caption = #20986#24211#38754#31215
    FocusControl = DBEdit15
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label17: TLabel
    Left = 358
    Top = 323
    Width = 48
    Height = 12
    Caption = #20986#24211#37325#37327
    FocusControl = DBEdit16
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label18: TLabel
    Left = 11
    Top = 293
    Width = 48
    Height = 12
    Caption = #21333#20301#38754#31215
    FocusControl = DBEdit9
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label19: TLabel
    Left = 11
    Top = 321
    Width = 48
    Height = 12
    Caption = #21333#20301#37325#37327
    FocusControl = DBEdit9
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label20: TLabel
    Left = 354
    Top = 192
    Width = 48
    Height = 12
    Caption = #21457#25918#37096#38376
    FocusControl = DBEdit10
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 613
    Height = 33
    Align = alTop
    TabOrder = 17
    object BitBtn9: TBitBtn
      Left = 2
      Top = 3
      Width = 59
      Height = 28
      Cursor = crHandPoint
      Hint = #20851#38381
      Caption = #20851#38381
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Kind = bkClose
    end
    object BtnSave: TBitBtn
      Left = 63
      Top = 3
      Width = 59
      Height = 28
      Cursor = crHandPoint
      Hint = #20445#23384
      Caption = #20445#23384
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BtnSaveClick
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
  object DBEdit1: TDBEdit
    Left = 59
    Top = 43
    Width = 124
    Height = 20
    DataField = 'GON_NUMBER'
    DataSource = DM.DS
    TabOrder = 0
  end
  object DBEdit3: TDBEdit
    Left = 406
    Top = 140
    Width = 184
    Height = 20
    DataField = 'EMPLOYEE_NAME'
    DataSource = DM.DS
    TabOrder = 10
  end
  object DBEdit4: TDBEdit
    Left = 67
    Top = 115
    Width = 184
    Height = 20
    DataField = 'PO_NUMBER'
    DataSource = DM.DS
    TabOrder = 2
  end
  object DBDateTimeEditEh1: TDBDateTimeEditEh
    Left = 64
    Top = 90
    Width = 121
    Height = 20
    DataField = 'TDATE'
    DataSource = DM.DS
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 1
    Visible = True
  end
  object DBEdit2: TDBEdit
    Left = 63
    Top = 160
    Width = 184
    Height = 20
    DataField = 'GROUP_DESC'
    DataSource = DM.DS
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 63
    Top = 186
    Width = 184
    Height = 20
    DataField = 'INV_PART_NUMBER'
    DataSource = DM.DS
    TabOrder = 4
  end
  object DBEdit6: TDBEdit
    Left = 63
    Top = 212
    Width = 184
    Height = 20
    DataField = 'INV_NAME'
    DataSource = DM.DS
    TabOrder = 5
  end
  object DBEdit7: TDBEdit
    Left = 63
    Top = 236
    Width = 184
    Height = 20
    DataField = 'INV_DESCRIPTION'
    DataSource = DM.DS
    TabOrder = 6
  end
  object DBEdit8: TDBEdit
    Left = 63
    Top = 260
    Width = 74
    Height = 20
    DataField = 'UNIT_NAME'
    DataSource = DM.DS
    TabOrder = 7
  end
  object DBEdit9: TDBEdit
    Left = 408
    Top = 268
    Width = 97
    Height = 20
    DataField = 'QUANTITY'
    DataSource = DM.DS
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 14
  end
  object DBEdit10: TDBEdit
    Left = 406
    Top = 91
    Width = 184
    Height = 20
    DataField = 'CODE'
    DataSource = DM.DS
    TabOrder = 8
  end
  object DBEdit11: TDBEdit
    Left = 406
    Top = 114
    Width = 184
    Height = 20
    DataField = 'ABBR_NAME'
    DataSource = DM.DS
    TabOrder = 9
  end
  object DBEdit12: TDBEdit
    Left = 406
    Top = 165
    Width = 184
    Height = 20
    DataField = 'issue_EMPLOYEENAME'
    DataSource = DM.DS
    TabOrder = 11
  end
  object DBEdit13: TDBEdit
    Left = 406
    Top = 208
    Width = 184
    Height = 20
    DataField = 'LOCATION'
    DataSource = DM.DS
    TabOrder = 12
  end
  object DBEdit14: TDBEdit
    Left = 406
    Top = 231
    Width = 184
    Height = 20
    DataField = 'WAREHOUSE_CODE'
    DataSource = DM.DS
    TabOrder = 13
  end
  object DBEdit15: TDBEdit
    Left = 407
    Top = 293
    Width = 97
    Height = 20
    DataField = 'issue_area'
    DataSource = DM.DS
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 15
  end
  object DBEdit16: TDBEdit
    Left = 407
    Top = 319
    Width = 97
    Height = 20
    DataField = 'issue_weight'
    DataSource = DM.DS
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 16
  end
  object DBEdit17: TDBEdit
    Left = 64
    Top = 287
    Width = 121
    Height = 20
    DataField = 'unit_sq'
    DataSource = DM.DS
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 18
  end
  object DBEdit18: TDBEdit
    Left = 64
    Top = 317
    Width = 121
    Height = 20
    DataField = 'unit_weight'
    DataSource = DM.DS
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 19
  end
  object DBEdit19: TDBEdit
    Left = 406
    Top = 187
    Width = 184
    Height = 20
    DataField = 'DEPT_NAME'
    DataSource = DM.DS
    TabOrder = 20
  end
end
