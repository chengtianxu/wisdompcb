object FrmAdjustDeptStock: TFrmAdjustDeptStock
  Left = 424
  Top = 192
  Width = 399
  Height = 285
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #35843#25972#36710#38388#24211#23384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 37
    Top = 103
    Width = 80
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #24403#21069#24211#23384':'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 37
    Top = 20
    Width = 80
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #24037#24207#20195#21495':'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 37
    Top = 47
    Width = 80
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #26448#26009#20195#21495':'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 37
    Top = 75
    Width = 80
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #21333#20301':'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 56
    Top = 144
    Width = 63
    Height = 13
    Caption = #26032#35843#25972#24211#23384':'
    FocusControl = DBEdit1
  end
  object DBEdit1: TDBEdit
    Left = 128
    Top = 99
    Width = 70
    Height = 21
    Color = clScrollBar
    DataField = 'BAL_QTY'
    DataSource = FrmMain5.DataSource1
    Enabled = False
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 128
    Top = 16
    Width = 57
    Height = 21
    Color = clScrollBar
    DataField = 'dept_code'
    DataSource = FrmMain5.DataSource1
    Enabled = False
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 128
    Top = 43
    Width = 209
    Height = 21
    Color = clScrollBar
    DataField = 'inv_part_number'
    DataSource = FrmMain5.DataSource1
    Enabled = False
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 128
    Top = 71
    Width = 69
    Height = 21
    Color = clScrollBar
    DataField = 'unit_code'
    DataSource = FrmMain5.DataSource1
    Enabled = False
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 128
    Top = 138
    Width = 71
    Height = 21
    TabOrder = 4
    Text = '0'
  end
  object BitBtn1: TBitBtn
    Left = 96
    Top = 200
    Width = 75
    Height = 25
    Caption = #30830#35748
    Default = True
    TabOrder = 5
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
    Left = 232
    Top = 200
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 6
    Kind = bkCancel
  end
end
