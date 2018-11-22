object Frm_DlgRd: TFrm_DlgRd
  Left = 192
  Top = 250
  BorderStyle = bsDialog
  Caption = #35835#21462#27979#37327#25968#25454
  ClientHeight = 256
  ClientWidth = 420
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 113
    Top = 23
    Width = 78
    Height = 13
    Caption = #25991#20214#25152#22312#30446#24405
  end
  object Label2: TLabel
    Left = 104
    Top = 184
    Width = 215
    Height = 13
    Caption = #35835#21462#30340#25991#20214#21517#31216#24517#39035#19982#26412#21378#32534#21495#30456#20851','
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 104
    Top = 203
    Width = 208
    Height = 13
    Caption = #35835#21462#23558#20250#21024#38500#21407#24050#23384#22312#30340#27979#37327#25968#25454#65281
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 187
    Width = 75
    Height = 24
    Caption = #27880#24847#65306
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -24
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RadioGroup1: TRadioGroup
    Left = 4
    Top = 16
    Width = 101
    Height = 153
    Caption = #35835#21462#33539#22260
    TabOrder = 0
  end
  object RdBtn1: TRadioButton
    Left = 20
    Top = 112
    Width = 79
    Height = 17
    Caption = #24403#21069#35760#24405
    TabOrder = 1
  end
  object RdBtnAll: TRadioButton
    Left = 20
    Top = 56
    Width = 79
    Height = 17
    Caption = #25152#26377#35760#24405
    Checked = True
    TabOrder = 2
    TabStop = True
  end
  object BitBtn1: TBitBtn
    Left = 80
    Top = 224
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    TabOrder = 3
    OnClick = BitBtn1Click
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
  object BitBtn2: TBitBtn
    Left = 256
    Top = 224
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 4
    Kind = bkClose
  end
  object DirectoryListBox1: TDirectoryListBox
    Left = 193
    Top = 37
    Width = 223
    Height = 140
    ItemHeight = 16
    TabOrder = 5
  end
  object DriveComboBox1: TDriveComboBox
    Left = 193
    Top = 19
    Width = 222
    Height = 19
    DirList = DirectoryListBox1
    TabOrder = 6
  end
  object Animate1: TAnimate
    Left = 108
    Top = 103
    Width = 80
    Height = 50
    CommonAVI = aviFindFolder
    StopFrame = 29
    Visible = False
  end
  object RichEdit1: TRichEdit
    Left = 424
    Top = 104
    Width = 649
    Height = 105
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    Lines.Strings = (
      'RichEdit1')
    ParentFont = False
    TabOrder = 8
    Visible = False
  end
end
