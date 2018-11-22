object ShowForm1: TShowForm1
  Left = 401
  Top = 185
  Width = 367
  Height = 326
  Caption = 'FindForm1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Temp_DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 359
    Height = 258
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = Temp_DBGridEh1DrawColumnCell
  end
  object Panel2: TPanel
    Left = 0
    Top = 258
    Width = 359
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TButton
      Left = 144
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOStoredProc1
    Left = 96
    Top = 128
  end
  object ADOStoredProc1: TADOStoredProc
    Connection = DM.ADOConnection1
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    Left = 136
    Top = 192
  end
end
