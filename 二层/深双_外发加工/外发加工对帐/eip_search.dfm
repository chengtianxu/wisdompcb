object Form_episearch: TForm_episearch
  Left = 309
  Top = 201
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #35745#31639#20844#24335#23450#20041
  ClientHeight = 291
  ClientWidth = 417
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 128
    Top = 254
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 6
    OnClick = BitBtn1Click
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 216
    Top = 254
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 7
  end
  object ListBox1: TListBox
    Left = 56
    Top = 48
    Width = 114
    Height = 184
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 20
    Items.Strings = (
      #25509#25910#25968#37327
      #24179#26041#31859
      #24179#26041#33521#23610
      #21333#20215
      #27169#20855#36153
      #24037#31243#36153
      #26368#20302#25910#36153)
    ParentFont = False
    TabOrder = 0
    OnClick = ListBox1Click
  end
  object ListBox2: TListBox
    Left = 256
    Top = 48
    Width = 121
    Height = 184
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 20
    ParentFont = False
    TabOrder = 5
  end
  object BitBtn3: TBitBtn
    Left = 181
    Top = 163
    Width = 65
    Height = 25
    Caption = #21152
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 181
    Top = 131
    Width = 65
    Height = 25
    Caption = #20054
    TabOrder = 3
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 182
    Top = 66
    Width = 63
    Height = 25
    Caption = #65293#65293#12299
    TabOrder = 1
    OnClick = BitBtn5Click
  end
  object BitBtn6: TBitBtn
    Left = 182
    Top = 98
    Width = 63
    Height = 25
    Caption = #12298#65293#65293
    TabOrder = 2
    OnClick = BitBtn6Click
  end
end
