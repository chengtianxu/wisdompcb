object Frm_DetailEdit1: TFrm_DetailEdit1
  Left = 316
  Top = 250
  BorderStyle = bsDialog
  Caption = #26434#39033#29289#26009
  ClientHeight = 229
  ClientWidth = 415
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 20
    Top = 16
    Width = 52
    Height = 13
    Caption = #29289#26009#21517#31216
    FocusControl = DBEdit1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 44
    Top = 59
    Width = 26
    Height = 13
    Caption = #35268#26684
    FocusControl = DBEdit2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 20
    Top = 125
    Width = 52
    Height = 13
    Caption = #29289#21697#31867#21035
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 234
    Top = 19
    Width = 52
    Height = 13
    Caption = #21333#20301#21517#31216
    FocusControl = DBEdit3
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 43
    Top = 92
    Width = 26
    Height = 13
    Caption = #25968#37327
    FocusControl = DBEdit4
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 234
    Top = 128
    Width = 52
    Height = 13
    Caption = #38656#27714#26085#26399
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 20
    Top = 166
    Width = 52
    Height = 13
    Caption = #35831#36141#21407#22240
    FocusControl = DBEdit6
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object DBText1: TDBText
    Left = 368
    Top = 17
    Width = 40
    Height = 17
    DataField = 'UNIT_NAME'
    DataSource = DM.DS3
  end
  object lbl1: TLabel
    Left = 195
    Top = 92
    Width = 91
    Height = 13
    Caption = #35831#36141#26102#38656#27714#25968#37327
    FocusControl = dbedtQUANTITY_REQUIRED
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object DBEdit1: TDBEdit
    Left = 76
    Top = 16
    Width = 133
    Height = 21
    DataField = 'DESCRIPTION_1'
    DataSource = DM.DS3
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 76
    Top = 56
    Width = 133
    Height = 21
    DataField = 'GUI_GE'
    DataSource = DM.DS3
    TabOrder = 4
  end
  object DBComboBox1: TDBComboBox
    Left = 76
    Top = 123
    Width = 129
    Height = 21
    DataField = 'DESCRIPTION_2'
    DataSource = DM.DS3
    ItemHeight = 13
    TabOrder = 8
  end
  object DBEdit3: TDBEdit
    Left = 287
    Top = 16
    Width = 42
    Height = 21
    DataField = 'UNIT_NAME'
    DataSource = DM.DS3
    TabOrder = 3
  end
  object DBEdit4: TDBEdit
    Left = 76
    Top = 88
    Width = 81
    Height = 21
    DataField = 'QUANTITY_REQUIRED'
    DataSource = DM.DS3
    TabOrder = 6
  end
  object DBEdit6: TDBEdit
    Left = 76
    Top = 163
    Width = 333
    Height = 21
    DataField = 'reason'
    DataSource = DM.DS3
    TabOrder = 10
  end
  object DBDateTimeEditEh1: TDBDateTimeEditEh
    Left = 287
    Top = 125
    Width = 121
    Height = 21
    DataField = 'REQ_DATE'
    DataSource = DM.DS3
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 9
    Visible = True
  end
  object BtSave: TBitBtn
    Left = 88
    Top = 198
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 11
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
  object BtCan: TBitBtn
    Left = 240
    Top = 198
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 12
    Kind = bkCancel
  end
  object BitBtn4: TBitBtn
    Left = 337
    Top = 13
    Width = 30
    Height = 25
    TabOrder = 0
    TabStop = False
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      04000000000078000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      888800000888880000080F000888880F00080F000888880F0008000000080000
      000800F000000F00000800F000800F00000800F000800F000008800000000000
      0088880F00080F000888880000080000088888800088800088888880F08880F0
      888888800088800088888888888888888888}
  end
  object Edit1: TEdit
    Left = 287
    Top = 16
    Width = 49
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object dbedtQUANTITY_REQUIRED: TDBEdit
    Left = 287
    Top = 88
    Width = 81
    Height = 21
    DataField = 'req_quantity'
    DataSource = DM.DS3
    TabOrder = 7
  end
  object dbchkIF_urgency: TDBCheckBox
    Left = 288
    Top = 56
    Width = 97
    Height = 17
    Caption = #26159#21542#32039#24613#29289#26009
    DataField = 'IF_urgency'
    DataSource = DM.DS3
    TabOrder = 5
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
end
