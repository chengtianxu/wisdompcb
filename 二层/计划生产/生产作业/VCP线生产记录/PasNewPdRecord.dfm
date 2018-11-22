object FrmNewPdRecord: TFrmNewPdRecord
  Left = 574
  Top = 134
  BorderStyle = bsDialog
  Caption = #26032#22686'VCP'#32447#29983#20135#35760#24405
  ClientHeight = 421
  ClientWidth = 507
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 43
    Width = 507
    Height = 43
    Align = alTop
    TabOrder = 0
    object Label3: TLabel
      Left = 18
      Top = 16
      Width = 26
      Height = 13
      Caption = #29677#21035
    end
    object Label17: TLabel
      Left = 151
      Top = 16
      Width = 33
      Height = 13
      Caption = #22791' '#27880
    end
    object ComboBox1: TComboBox
      Left = 46
      Top = 13
      Width = 75
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = #30333#29677
      Items.Strings = (
        #30333#29677
        #22812#29677)
    end
    object edtRemark: TEdit
      Left = 186
      Top = 12
      Width = 279
      Height = 21
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 86
    Width = 507
    Height = 46
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 15
      Top = 15
      Width = 65
      Height = 13
      Caption = #20316#19994#21333#21495#65306
    end
    object Label9: TLabel
      Left = 276
      Top = 15
      Width = 65
      Height = 13
      Caption = #20135#32447#31867#22411#65306
    end
    object edtWORK_ORDER_NUMBER: TEdit
      Left = 75
      Top = 11
      Width = 150
      Height = 21
      TabOrder = 0
      OnChange = edtWORK_ORDER_NUMBERChange
      OnKeyDown = edtWORK_ORDER_NUMBERKeyDown
      OnKeyPress = edtWORK_ORDER_NUMBERKeyPress
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 507
    Height = 43
    Align = alTop
    TabOrder = 2
    object labVCPID: TLabel
      Left = 168
      Top = 16
      Width = 56
      Height = 13
      Caption = 'labVCPID'
      Visible = False
    end
    object labd06Rkey: TLabel
      Left = 248
      Top = 16
      Width = 70
      Height = 13
      Caption = 'labd06Rkey'
      Visible = False
    end
    object labd34Rkey: TLabel
      Left = 336
      Top = 16
      Width = 70
      Height = 13
      Caption = 'labd34Rkey'
      Visible = False
    end
    object lab25Rkey: TLabel
      Left = 424
      Top = 16
      Width = 7
      Height = 13
      Visible = False
    end
    object labType: TLabel
      Left = 432
      Top = 16
      Width = 49
      Height = 13
      Caption = 'labType'
      Visible = False
    end
    object BitBtn2: TBitBtn
      Left = 73
      Top = 6
      Width = 66
      Height = 32
      Caption = #20445#23384
      TabOrder = 0
      OnClick = BitBtn2Click
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
    object BitBtn5: TBitBtn
      Left = 3
      Top = 6
      Width = 70
      Height = 32
      Caption = #20851#38381
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
  end
  object Panel4: TPanel
    Left = 0
    Top = 132
    Width = 507
    Height = 289
    Align = alClient
    TabOrder = 3
    object Label6: TLabel
      Left = 41
      Top = 25
      Width = 52
      Height = 13
      Caption = #26412#21378#32534#21495
    end
    object Label7: TLabel
      Left = 41
      Top = 55
      Width = 52
      Height = 13
      Caption = #24403#21069#27493#39588
    end
    object Label8: TLabel
      Left = 282
      Top = 55
      Width = 52
      Height = 13
      Caption = #29983#20135#24037#24207
    end
    object Label10: TLabel
      Left = 287
      Top = 87
      Width = 47
      Height = 13
      Caption = 'PCS'#25968#37327
    end
    object Label11: TLabel
      Left = 60
      Top = 86
      Width = 34
      Height = 13
      Caption = 'PNL'#38271
    end
    object Label12: TLabel
      Left = 287
      Top = 119
      Width = 47
      Height = 13
      Caption = 'PCS'#23610#23544
    end
    object Label13: TLabel
      Left = 59
      Top = 118
      Width = 34
      Height = 13
      Caption = 'PNL'#23485
    end
    object Label14: TLabel
      Left = 287
      Top = 151
      Width = 47
      Height = 13
      Caption = 'PCS'#38754#31215
    end
    object Label15: TLabel
      Left = 47
      Top = 181
      Width = 47
      Height = 13
      Caption = 'PNL'#38754#31215
    end
    object Label16: TLabel
      Left = 301
      Top = 23
      Width = 33
      Height = 13
      Caption = #24037' '#21378
    end
    object Label18: TLabel
      Left = 43
      Top = 213
      Width = 52
      Height = 13
      Caption = #25805#20316#20154#21592
    end
    object Label19: TLabel
      Left = 283
      Top = 213
      Width = 52
      Height = 13
      Caption = #25805#20316#26102#38388
    end
    object Label4: TLabel
      Left = 43
      Top = 245
      Width = 52
      Height = 13
      Caption = #30005#33041#21517#31216
    end
    object Label5: TLabel
      Left = 292
      Top = 246
      Width = 40
      Height = 13
      Caption = 'IP'#22320#22336
    end
    object Label2: TLabel
      Left = 47
      Top = 150
      Width = 47
      Height = 13
      Caption = 'PNL'#25968#37327
    end
    object edtMANU_PART_NUMBER: TEdit
      Left = 95
      Top = 20
      Width = 121
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 0
    end
    object edtSTEP: TEdit
      Left = 95
      Top = 51
      Width = 121
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 1
    end
    object edtDEPT_NAME: TEdit
      Left = 335
      Top = 51
      Width = 121
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 2
    end
    object edtQTY_BACKLOG: TEdit
      Left = 335
      Top = 83
      Width = 121
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 3
    end
    object edtpanel_ln: TEdit
      Left = 95
      Top = 82
      Width = 121
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 4
    end
    object edtANALYSIS_CODE_5: TEdit
      Left = 335
      Top = 115
      Width = 121
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 5
    end
    object edtpanel_wd: TEdit
      Left = 95
      Top = 114
      Width = 121
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 6
    end
    object edtwip_area: TEdit
      Left = 335
      Top = 147
      Width = 121
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 7
    end
    object edtPANELS: TEdit
      Left = 95
      Top = 146
      Width = 121
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 8
    end
    object edtABBR_NAME: TEdit
      Left = 335
      Top = 19
      Width = 121
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 9
    end
    object edtuser_ptr: TEdit
      Left = 96
      Top = 209
      Width = 121
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 10
    end
    object edtComputerName: TEdit
      Left = 97
      Top = 241
      Width = 120
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 11
    end
    object edtIPAddress: TEdit
      Left = 334
      Top = 242
      Width = 124
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 12
    end
    object edtPNLArae: TEdit
      Left = 95
      Top = 177
      Width = 121
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 13
    end
    object DateTimePicker1: TDateTimePicker
      Left = 335
      Top = 209
      Width = 122
      Height = 21
      Date = 41430.489140798600000000
      Format = 'yyyy-MM-dd'
      Time = 41430.489140798600000000
      Color = clInfoBk
      Enabled = False
      TabOrder = 14
    end
  end
  object cbName: TComboBox
    Left = 333
    Top = 98
    Width = 125
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    OnChange = cbNameChange
  end
end
