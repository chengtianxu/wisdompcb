object frmshowXSMB: TfrmshowXSMB
  Left = 315
  Top = 145
  BorderStyle = bsSingle
  Caption = #38144#21806#35745#21010
  ClientHeight = 493
  ClientWidth = 506
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 78
    Width = 52
    Height = 13
    Caption = #35745#21010#24180#65306
  end
  object Label2: TLabel
    Left = 240
    Top = 78
    Width = 52
    Height = 13
    Caption = #35745#21010#26376#65306
  end
  object Label3: TLabel
    Left = 8
    Top = 110
    Width = 65
    Height = 13
    Caption = #20840#24180#30446#26631#65306
  end
  object Label4: TLabel
    Left = 227
    Top = 110
    Width = 65
    Height = 13
    Caption = #29616#24050#32047#35745#65306
  end
  object Label5: TLabel
    Left = 8
    Top = 138
    Width = 65
    Height = 13
    Caption = #26412#26376#30446#26631#65306
  end
  object Label6: TLabel
    Left = 227
    Top = 138
    Width = 65
    Height = 13
    Caption = #21344#24180#30446#26631#65306
  end
  object Label7: TLabel
    Left = 8
    Top = 166
    Width = 78
    Height = 13
    Caption = #20840#24180#26410#23436#25104#65306
  end
  object Label8: TLabel
    Left = 227
    Top = 166
    Width = 65
    Height = 13
    Caption = #21344#24180#30446#26631#65306
  end
  object Label17: TLabel
    Left = 32
    Top = 376
    Width = 39
    Height = 13
    Caption = #22791#27880#65306
  end
  object Label18: TLabel
    Left = 24
    Top = 464
    Width = 52
    Height = 13
    Caption = #21019#24314#20154#65306
  end
  object Label19: TLabel
    Left = 202
    Top = 464
    Width = 39
    Height = 13
    Caption = #32844#20301#65306
  end
  object Label20: TLabel
    Left = 338
    Top = 464
    Width = 65
    Height = 13
    Caption = #21019#24314#26085#26399#65306
  end
  object Label21: TLabel
    Left = 8
    Top = 48
    Width = 79
    Height = 13
    Caption = #38144#21806#30446#26631'ID'#65306
  end
  object Label22: TLabel
    Left = 182
    Top = 114
    Width = 26
    Height = 13
    Caption = #19975#20803
  end
  object Label23: TLabel
    Left = 182
    Top = 143
    Width = 26
    Height = 13
    Caption = #19975#20803
  end
  object Label24: TLabel
    Left = 182
    Top = 170
    Width = 26
    Height = 13
    Caption = #19975#20803
  end
  object Label25: TLabel
    Left = 386
    Top = 114
    Width = 26
    Height = 13
    Caption = #19975#20803
  end
  object Label34: TLabel
    Left = 387
    Top = 143
    Width = 7
    Height = 13
    Caption = '%'
  end
  object Label35: TLabel
    Left = 387
    Top = 167
    Width = 7
    Height = 13
    Caption = '%'
  end
  object YJH: TSpinEdit
    Left = 79
    Top = 78
    Width = 102
    Height = 22
    MaxValue = 9999
    MinValue = 1990
    TabOrder = 0
    Value = 1990
  end
  object MJH: TSpinEdit
    Left = 287
    Top = 78
    Width = 100
    Height = 22
    MaxValue = 12
    MinValue = 1
    TabOrder = 1
    Value = 1
  end
  object YJHJE: TEdit
    Left = 80
    Top = 110
    Width = 101
    Height = 21
    TabOrder = 2
    Text = '0'
  end
  object LJJE: TEdit
    Left = 288
    Top = 110
    Width = 99
    Height = 21
    TabOrder = 3
    Text = '0'
  end
  object MJHJE: TEdit
    Left = 80
    Top = 138
    Width = 101
    Height = 21
    TabOrder = 4
    Text = '0'
  end
  object YZNBL: TEdit
    Left = 288
    Top = 138
    Width = 99
    Height = 21
    TabOrder = 5
    Text = '0'
  end
  object YWWJE: TEdit
    Left = 80
    Top = 166
    Width = 101
    Height = 21
    TabOrder = 6
    Text = '0'
  end
  object WWZNBL: TEdit
    Left = 288
    Top = 166
    Width = 99
    Height = 21
    TabOrder = 7
    Text = '0'
  end
  object RadioGroup1: TRadioGroup
    Left = 416
    Top = 48
    Width = 65
    Height = 137
    Caption = #33258#25105#37492#23450
    ItemIndex = 0
    Items.Strings = (
      #20248#31168
      #19968#33324
      #24046)
    TabOrder = 8
  end
  object Edit15: TEdit
    Left = 72
    Top = 464
    Width = 89
    Height = 21
    Color = clScrollBar
    ReadOnly = True
    TabOrder = 9
  end
  object DateTimePicker1: TDateTimePicker
    Left = 394
    Top = 464
    Width = 93
    Height = 21
    Date = 39211.000000000000000000
    Time = 39211.000000000000000000
    TabOrder = 10
  end
  object Panel1: TPanel
    Left = 72
    Top = 196
    Width = 409
    Height = 86
    BevelInner = bvLowered
    TabOrder = 11
    object Label9: TLabel
      Left = 8
      Top = 12
      Width = 52
      Height = 13
      Caption = #19978#26376#39044#27979
    end
    object Label10: TLabel
      Left = 206
      Top = 12
      Width = 52
      Height = 13
      Caption = #19978#26376#24050#25509
    end
    object Label11: TLabel
      Left = 8
      Top = 52
      Width = 52
      Height = 13
      Caption = #27604#39044#27979#22810
    end
    object Label12: TLabel
      Left = 222
      Top = 52
      Width = 39
      Height = 13
      Caption = #21344#39044#27979
    end
    object Label26: TLabel
      Left = 161
      Top = 16
      Width = 26
      Height = 13
      Caption = #19975#20803
    end
    object Label27: TLabel
      Left = 380
      Top = 17
      Width = 26
      Height = 13
      Caption = #19975#20803
    end
    object Label28: TLabel
      Left = 160
      Top = 57
      Width = 26
      Height = 13
      Caption = #19975#20803
    end
    object Label32: TLabel
      Left = 384
      Top = 56
      Width = 7
      Height = 13
      Caption = '%'
    end
    object SQJHJE: TEdit
      Left = 64
      Top = 12
      Width = 95
      Height = 21
      TabOrder = 0
      Text = '0'
    end
    object SQWCJE: TEdit
      Left = 262
      Top = 12
      Width = 118
      Height = 21
      TabOrder = 1
      Text = '0'
    end
    object SQXCJE: TEdit
      Left = 64
      Top = 52
      Width = 95
      Height = 21
      ReadOnly = True
      TabOrder = 2
      Text = '0'
    end
    object SQWCBL: TEdit
      Left = 262
      Top = 52
      Width = 118
      Height = 21
      ReadOnly = True
      TabOrder = 3
      Text = '0'
    end
  end
  object Panel2: TPanel
    Left = 72
    Top = 286
    Width = 409
    Height = 90
    BevelInner = bvLowered
    TabOrder = 12
    object Label13: TLabel
      Left = 8
      Top = 13
      Width = 52
      Height = 13
      Caption = #26412#26376#30446#26631
    end
    object Label14: TLabel
      Left = 208
      Top = 13
      Width = 52
      Height = 13
      Caption = #26412#26376#39044#27979
    end
    object Label15: TLabel
      Left = 8
      Top = 53
      Width = 52
      Height = 13
      Caption = #27604#30446#26631#22810
    end
    object Label16: TLabel
      Left = 221
      Top = 53
      Width = 39
      Height = 13
      Caption = #21344#30446#26631
    end
    object Label29: TLabel
      Left = 162
      Top = 16
      Width = 26
      Height = 13
      Caption = #19975#20803
    end
    object Label30: TLabel
      Left = 161
      Top = 57
      Width = 26
      Height = 13
      Caption = #19975#20803
    end
    object Label31: TLabel
      Left = 380
      Top = 17
      Width = 26
      Height = 13
      Caption = #19975#20803
    end
    object Label33: TLabel
      Left = 384
      Top = 56
      Width = 7
      Height = 13
      Caption = '%'
    end
    object BQMBJE: TEdit
      Left = 64
      Top = 13
      Width = 98
      Height = 21
      ReadOnly = True
      TabOrder = 0
      Text = '0'
    end
    object BQJHJE: TEdit
      Left = 264
      Top = 13
      Width = 117
      Height = 21
      TabOrder = 1
      Text = '0'
    end
    object BQXCJE: TEdit
      Left = 64
      Top = 53
      Width = 98
      Height = 21
      ReadOnly = True
      TabOrder = 2
      Text = '0'
    end
    object BQJHBL: TEdit
      Left = 264
      Top = 53
      Width = 117
      Height = 21
      ReadOnly = True
      TabOrder = 3
      Text = '0'
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 506
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 13
    object SpeedButton1: TSpeedButton
      Left = 10
      Top = 2
      Width = 28
      Height = 27
      Enabled = False
      Glyph.Data = {
        26050000424D26050000000000003604000028000000100000000F0000000100
        080000000000F0000000CE0E0000C40E00000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
        A400000000000000000000000000000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF00000000
        000000000000000000FFFF0003030000000000000707000300FFFF0003030000
        000000000707000300FFFF0003030000000000000707000300FFFF0003030000
        000000000000000300FFFF0003030303030303030303030300FFFF0003030000
        000000000000030300FFFF000300FFFFFFFFFFFFFFFF000300FFFF000300FFFF
        FFFFFFFFFFFF000300FFFF000300FFFFFFFFFFFFFFFF000300FFFF000300FFFF
        FFFFFFFFFFFF000300FFFF000300FFFFFFFFFFFFFFFF000000FFFF000300FFFF
        FFFFFFFFFFFF000700FFFF0000000000000000000000000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF}
    end
    object SpeedButton2: TSpeedButton
      Left = 38
      Top = 2
      Width = 28
      Height = 27
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
      OnClick = SpeedButton2Click
    end
  end
  object Memo1: TMemo
    Left = 72
    Top = 379
    Width = 409
    Height = 81
    TabOrder = 14
  end
  object BitBtn1: TBitBtn
    Left = 165
    Top = 464
    Width = 23
    Height = 23
    TabOrder = 15
    Visible = False
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000120B0000120B00001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
      DADA000000000000ADAD0FFFFFFFFFF0DADA0F00F00000F0ADAD0FFFFFFFFFF0
      DADA0F00F00000F0ADAD0FFFFFFFFFF0DADA0FFFFFFF0FF0ADAD0FF0FFF080F0
      DAD40F080F0808000D440FF08080808880440000080808888844DADAD0808888
      8844ADADAD0888888044DADADAD000000A44ADADADADADADADAD}
  end
  object JHID: TEdit
    Left = 80
    Top = 48
    Width = 329
    Height = 21
    Color = clInactiveBorder
    ReadOnly = True
    TabOrder = 16
  end
  object Edit1: TEdit
    Left = 240
    Top = 464
    Width = 97
    Height = 21
    Color = clScrollBar
    ReadOnly = True
    TabOrder = 17
  end
end
