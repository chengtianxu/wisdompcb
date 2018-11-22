object BaseFindForm1: TBaseFindForm1
  Left = 327
  Top = 177
  Width = 367
  Height = 404
  Caption = 'FindForm1'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Temp_DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 359
    Height = 292
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = GB2312_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDrawColumnCell = Temp_DBGridEh1DrawColumnCell
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 359
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 45
      Top = 16
      Width = 65
      Height = 13
      Caption = #37096#38376#32534#21495#65306
    end
    object Edit1: TEdit
      Left = 114
      Top = 11
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 261
      Top = 10
      Width = 33
      Height = 25
      TabOrder = 1
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADABFBFBDADADADADADDADADBFADADADADAADADAD000DADADADDADAD0FBF0DA
        DADAADAD0F7FBF0DADADDAD0F7F87BF0DADAAD0F7F87BFB70DADD0F7F87BFB78
        80DA000F87BFB78880ADDAD00BFB78880ADAADADA0B7888740ADDADADA088804
        440AADADADA000A04440DADADADADADA0440ADADADADADADA00D}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 333
    Width = 359
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Button1: TButton
      Left = 88
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 192
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = Button2Click
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
