object Frm_out: TFrm_out
  Left = 442
  Top = 138
  BorderStyle = bsDialog
  Caption = #26448#26009
  ClientHeight = 487
  ClientWidth = 668
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 19
    Width = 52
    Height = 13
    Caption = #26448#26009#32534#30721
  end
  object Label2: TLabel
    Left = 24
    Top = 47
    Width = 85
    Height = 13
    Caption = #26448#26009#21517#31216'/'#35268#26684
  end
  object Label3: TLabel
    Left = 56
    Top = 79
    Width = 52
    Height = 13
    Caption = #24211#23384#21333#20301
  end
  object lbl1: TLabel
    Left = 3
    Top = 110
    Width = 104
    Height = 13
    Caption = #26448#26009#24037#24207#25511#21046#26631#20934
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object lbl6: TLabel
    Left = 21
    Top = 468
    Width = 78
    Height = 13
    Caption = #29289#26009#25511#21046#26631#20934
    Visible = False
  end
  object lbl3: TLabel
    Left = 26
    Top = 134
    Width = 80
    Height = 19
    Caption = #26377#25928#24211#23384
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 112
    Top = 15
    Width = 218
    Height = 21
    Color = clScrollBar
    ReadOnly = True
    TabOrder = 3
  end
  object Edit2: TEdit
    Left = 112
    Top = 44
    Width = 218
    Height = 21
    Color = clScrollBar
    ReadOnly = True
    TabOrder = 4
  end
  object BitBtn1: TBitBtn
    Left = 576
    Top = 407
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 2
    Kind = bkCancel
  end
  object BitBtn2: TBitBtn
    Left = 576
    Top = 375
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    TabOrder = 1
    OnClick = BitBtn2Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object GroupBox1: TGroupBox
    Left = 19
    Top = 288
    Width = 550
    Height = 140
    Caption = #30003#35831#20449#24687
    TabOrder = 0
    object Label6: TLabel
      Left = 13
      Top = 67
      Width = 39
      Height = 13
      Caption = #20379#24212#21830
    end
    object Label5: TLabel
      Left = -2
      Top = 26
      Width = 56
      Height = 13
      Caption = #30003#35831#25968#37327
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl8: TLabel
      Left = 157
      Top = 18
      Width = 56
      Height = 13
      Caption = #36229#39046#29702#30001
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit5: TEdit
      Left = 55
      Top = 22
      Width = 74
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnKeyPress = Edit5KeyPress
    end
    object ComboBox1: TComboBox
      Left = 55
      Top = 64
      Width = 130
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
    end
    object mmo1: TMemo
      Left = 216
      Top = 10
      Width = 325
      Height = 121
      Lines.Strings = (
        'mmo1')
      TabOrder = 2
    end
  end
  object Edit3: TEdit
    Left = 112
    Top = 76
    Width = 81
    Height = 21
    Color = clScrollBar
    ReadOnly = True
    TabOrder = 5
  end
  object cbb_BZ: TComboBox
    Left = 112
    Top = 105
    Width = 156
    Height = 21
    ItemHeight = 13
    TabOrder = 6
    OnChange = cbb_BZChange
  end
  object grp1: TGroupBox
    Left = 17
    Top = 160
    Width = 550
    Height = 113
    Caption = #25353#25511#21046#26631#20934#39046#26009': '
    TabOrder = 7
    object lbl2: TLabel
      Left = 6
      Top = 20
      Width = 78
      Height = 13
      Caption = #26412#26376#24635#21487#39046#25968
    end
    object lbl4: TLabel
      Left = 17
      Top = 44
      Width = 65
      Height = 13
      Caption = #26412#26376#24050#39046#25968
    end
    object lbl5: TLabel
      Left = 30
      Top = 87
      Width = 52
      Height = 13
      Caption = #36824#21487#39046#25968
    end
    object lbl7: TLabel
      Left = 31
      Top = 68
      Width = 52
      Height = 13
      Caption = #19978#26376#32467#23384
    end
    object edt1: TEdit
      Left = 88
      Top = 17
      Width = 81
      Height = 21
      Color = clScrollBar
      ReadOnly = True
      TabOrder = 0
    end
    object edt2: TEdit
      Left = 88
      Top = 39
      Width = 81
      Height = 21
      Color = clScrollBar
      ReadOnly = True
      TabOrder = 1
    end
    object edt3: TEdit
      Left = 88
      Top = 82
      Width = 81
      Height = 21
      Color = clScrollBar
      ReadOnly = True
      TabOrder = 2
    end
    object edt_remark: TEdit
      Left = 88
      Top = 63
      Width = 81
      Height = 21
      Color = clScrollBar
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
  end
  object edt_standard: TEdit
    Left = 104
    Top = 467
    Width = 401
    Height = 21
    Color = clScrollBar
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 8
    Visible = False
  end
  object edit4: TEdit
    Left = 112
    Top = 129
    Width = 81
    Height = 27
    Color = clScrollBar
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 9
  end
end
