object SMS_Frm: TSMS_Frm
  Left = 401
  Top = 182
  Width = 372
  Height = 485
  Caption = #30701#20449#25509#25910#20154#21592#35774#32622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Grd1: TDBGridEh
    Left = 0
    Top = 41
    Width = 356
    Height = 360
    Align = alTop
    DataSource = DataSource1
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = Grd1DblClick
    OnTitleClick = Grd1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'USER_LOGIN_NAME'
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #24037#21495
        Width = 77
      end
      item
        EditButtons = <>
        FieldName = 'USER_FULL_NAME'
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #22995#21517
        Width = 99
      end
      item
        EditButtons = <>
        FieldName = 'TPOSTION'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #32844#20301
        Width = 140
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 356
    Height = 41
    Align = alTop
    TabOrder = 1
    object Label4: TLabel
      Left = 39
      Top = 14
      Width = 87
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #25628#32034': '#24037#21495
    end
    object Edit4: TEdit
      Left = 135
      Top = 10
      Width = 126
      Height = 21
      TabOrder = 0
      OnChange = Edit4Change
    end
  end
  object BitBtn2: TBitBtn
    Left = 216
    Top = 417
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 2
    Kind = bkClose
  end
  object BitBtn1: TBitBtn
    Left = 64
    Top = 417
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
  object DataSource1: TDataSource
    DataSet = dm.ADO73
    Left = 152
    Top = 232
  end
end
