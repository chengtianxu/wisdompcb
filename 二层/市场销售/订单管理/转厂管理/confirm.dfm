object FrmConfirm: TFrmConfirm
  Left = 447
  Top = 352
  Width = 421
  Height = 253
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #36716#20135#30830#35748
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
    Left = 43
    Top = 22
    Width = 86
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #25509#21333#38480#39069#65306
  end
  object Label2: TLabel
    Left = 8
    Top = 49
    Width = 121
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #22791#27880#20449#24687'('#26679#21697')'#65306
  end
  object DBEdit1: TDBEdit
    Left = 128
    Top = 16
    Width = 121
    Height = 21
    DataField = 'SO_AMT_LTD'
    DataSource = FrmCustPart.DataSource1
    TabOrder = 0
    OnExit = DBEdit1Exit
  end
  object DBEdit2: TDBEdit
    Left = 128
    Top = 43
    Width = 265
    Height = 21
    DataField = 'REFERENCE'
    DataSource = FrmCustPart.DataSource1
    TabOrder = 1
  end
  object DBRadioGroup1: TDBRadioGroup
    Left = 128
    Top = 72
    Width = 185
    Height = 73
    Caption = #30830#35748#29366#24577
    DataField = 'PROD_CONF'
    DataSource = FrmCustPart.DataSource1
    Items.Strings = (
      #19981#30830#35748
      #20551#30830#35748
      #30495#30830#35748)
    TabOrder = 2
    Values.Strings = (
      '0'
      '1'
      '2')
    OnClick = DBRadioGroup1Click
  end
  object BitBtn1: TBitBtn
    Left = 104
    Top = 168
    Width = 75
    Height = 25
    Caption = 'OK'
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
    Left = 248
    Top = 168
    Width = 75
    Height = 25
    TabOrder = 4
    Kind = bkCancel
  end
end
