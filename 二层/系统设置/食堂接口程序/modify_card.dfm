object Form_modify_card: TForm_modify_card
  Left = 354
  Top = 346
  Width = 371
  Height = 217
  Caption = #25968#25454#20462#25913
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label_empcode_cx: TLabel
    Left = 31
    Top = 38
    Width = 33
    Height = 17
    AutoSize = False
    Caption = #24037#21495
  end
  object Label_cardtime1_cx: TLabel
    Left = 160
    Top = 38
    Width = 57
    Height = 13
    AutoSize = False
    Caption = #25171#21345#26102#38388
  end
  object Label_empname_cx: TLabel
    Left = 31
    Top = 77
    Width = 33
    Height = 13
    AutoSize = False
    Caption = #22995#21517
  end
  object Label_cardtime2_xg: TLabel
    Left = 159
    Top = 75
    Width = 65
    Height = 17
    AutoSize = False
    Caption = #26102#38388#20462#25913#65306
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object cx_empcode: TLabel
    Left = 74
    Top = 38
    Width = 45
    Height = 13
    AutoSize = False
  end
  object cx_empname: TLabel
    Left = 71
    Top = 77
    Width = 63
    Height = 13
    AutoSize = False
  end
  object cx_empcardtime: TLabel
    Left = 228
    Top = 38
    Width = 104
    Height = 17
    AutoSize = False
  end
  object MaskEdit_modify_cardtime: TMaskEdit
    Left = 226
    Top = 70
    Width = 106
    Height = 21
    EditMask = '!9999/99/00 00:00:00;1;_'
    MaxLength = 19
    TabOrder = 0
    Text = '    -  -     :  :  '
  end
  object BitBtn_cardxg: TBitBtn
    Left = 40
    Top = 128
    Width = 75
    Height = 25
    Caption = #30830#35748#20462#25913
    TabOrder = 1
    OnClick = BitBtn_cardxgClick
  end
  object BitBtn_cardqx: TBitBtn
    Left = 240
    Top = 128
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 2
    OnClick = BitBtn_cardqxClick
  end
  object BitBtn_cardadd: TButton
    Left = 40
    Top = 128
    Width = 75
    Height = 25
    Caption = #34917#21345
    TabOrder = 3
    OnClick = BitBtn_cardaddClick
  end
end
