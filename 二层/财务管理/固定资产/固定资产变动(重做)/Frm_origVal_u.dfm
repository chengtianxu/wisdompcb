object Frm_origVal: TFrm_origVal
  Left = 404
  Top = 335
  BorderStyle = bsDialog
  Caption = #21407#20540#32534#36753
  ClientHeight = 174
  ClientWidth = 262
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 15
    Top = 16
    Width = 64
    Height = 16
    Caption = #21407#24065#37329#39069
    FocusControl = DBEdit1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 42
    Top = 42
    Width = 32
    Height = 16
    Caption = #24065#21035
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 39
    Top = 72
    Width = 32
    Height = 16
    Caption = #27719#29575
    FocusControl = DBEdit3
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 15
    Top = 103
    Width = 64
    Height = 16
    Caption = #26412#24065#37329#39069
    FocusControl = DBEdit1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object DBEdit1: TDBEdit
    Left = 82
    Top = 13
    Width = 142
    Height = 21
    DataField = 'orig_curr_orig_value'
    DataSource = DataSource1
    TabOrder = 0
  end
  object DBEdit3: TDBEdit
    Left = 82
    Top = 69
    Width = 142
    Height = 21
    DataField = 'ex_rate'
    DataSource = DataSource1
    TabOrder = 1
  end
  object CBCurr: TComboBox
    Left = 82
    Top = 40
    Width = 143
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
    OnChange = CBCurrChange
  end
  object BitBtn1: TBitBtn
    Left = 48
    Top = 136
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
    Left = 144
    Top = 136
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 4
    Kind = bkCancel
  end
  object DBEdit2: TDBEdit
    Left = 82
    Top = 101
    Width = 142
    Height = 21
    Color = clSilver
    DataField = 'curr_value'
    DataSource = DataSource1
    Enabled = False
    TabOrder = 5
  end
  object DataSource1: TDataSource
    DataSet = DM.ADO325_1
    Left = 8
    Top = 48
  end
end
