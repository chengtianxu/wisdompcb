object frmTable2DEdit: TfrmTable2DEdit
  Left = 484
  Top = 156
  Width = 630
  Height = 605
  Caption = #34920#26684#32534#36753
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
  object lbl1: TLabel
    Left = 72
    Top = 64
    Width = 36
    Height = 13
    Caption = #34892#25968#65306
  end
  object lbl2: TLabel
    Left = 256
    Top = 67
    Width = 36
    Height = 13
    Caption = #21015#25968#65306
  end
  object lbl3: TLabel
    Left = 72
    Top = 28
    Width = 36
    Height = 13
    Caption = #34920#21517#65306
  end
  object lbl4: TLabel
    Left = 70
    Top = 99
    Width = 36
    Height = 13
    Caption = #25551#36848#65306
  end
  object lbl5: TLabel
    Left = 19
    Top = 500
    Width = 60
    Height = 13
    Caption = #21462#20540#35745#31639#65306
  end
  object lbl6: TLabel
    Left = 255
    Top = 29
    Width = 36
    Height = 13
    Caption = #23458#25143#65306
  end
  object btn6: TSpeedButton
    Left = 391
    Top = 23
    Width = 23
    Height = 22
    Caption = '...'
    OnClick = btn6Click
  end
  object edtYCount: TEdit
    Left = 114
    Top = 61
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '3'
    OnExit = edtYCountExit
    OnKeyPress = edtYCountKeyPress
  end
  object edtXCount: TEdit
    Left = 297
    Top = 62
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '3'
    OnExit = edtYCountExit
    OnKeyPress = edtYCountKeyPress
  end
  object edtTableName: TEdit
    Left = 114
    Top = 25
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object edtDesc: TEdit
    Left = 114
    Top = 94
    Width = 309
    Height = 21
    TabOrder = 3
  end
  object btn1: TButton
    Left = 70
    Top = 129
    Width = 75
    Height = 25
    Caption = #35774#32622#34892#21015
    TabOrder = 4
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 175
    Top = 129
    Width = 82
    Height = 25
    Caption = #20462#25913#34892#21015#20540
    TabOrder = 5
    OnClick = btn2Click
  end
  object btn4: TButton
    Left = 169
    Top = 528
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 6
    OnClick = btn4Click
  end
  object sg1: TStringGrid
    Left = 11
    Top = 168
    Width = 590
    Height = 313
    Ctl3D = True
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ParentCtl3D = False
    TabOrder = 7
  end
  object btn3: TButton
    Left = 328
    Top = 528
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 8
    OnClick = btn3Click
  end
  object rg1: TRadioGroup
    Left = 448
    Top = 24
    Width = 81
    Height = 105
    Caption = #21462#20540
    ItemIndex = 0
    Items.Strings = (
      #31934#30830
      #33539#22260)
    TabOrder = 9
  end
  object edtStrValue: TEdit
    Left = 96
    Top = 496
    Width = 313
    Height = 21
    TabOrder = 10
    Text = 'T[Test(3,2)]'
  end
  object btn5: TButton
    Left = 424
    Top = 496
    Width = 75
    Height = 25
    Caption = #21462#20540
    TabOrder = 11
    OnClick = btn5Click
  end
  object edtCustom: TEdit
    Left = 296
    Top = 24
    Width = 89
    Height = 21
    TabOrder = 12
    OnExit = edtCustomExit
  end
end
