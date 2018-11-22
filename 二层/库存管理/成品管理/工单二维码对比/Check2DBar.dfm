object Form1: TForm1
  Left = 278
  Top = 187
  Width = 730
  Height = 411
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -20
  Font.Name = #40657#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 20
  object lbl1: TLabel
    Left = 150
    Top = 149
    Width = 60
    Height = 20
    Caption = #24037#21495#65306
  end
  object lbl2: TLabel
    Left = 150
    Top = 207
    Width = 80
    Height = 20
    Caption = #20316#19994#21333#65306
  end
  object lbl3: TLabel
    Left = 150
    Top = 269
    Width = 80
    Height = 20
    Caption = #20108#32500#30721#65306
  end
  object lbl4: TLabel
    Left = 149
    Top = 104
    Width = 60
    Height = 20
    Caption = #21608#26399#65306
  end
  object edtgonghao: TEdit
    Left = 248
    Top = 145
    Width = 353
    Height = 28
    TabOrder = 0
  end
  object edtwo: TEdit
    Left = 248
    Top = 203
    Width = 353
    Height = 28
    TabOrder = 1
  end
  object edt2dbar: TEdit
    Left = 248
    Top = 261
    Width = 353
    Height = 28
    TabOrder = 2
    OnKeyPress = edt2dbarKeyPress
  end
  object btn1: TButton
    Left = 592
    Top = 24
    Width = 97
    Height = 25
    Caption = #23545#27604#35760#24405
    TabOrder = 3
    OnClick = btn1Click
  end
  object edtzq: TEdit
    Left = 247
    Top = 100
    Width = 353
    Height = 28
    TabOrder = 4
  end
  object ads1: TADODataSet
    Connection = dm1.con1
    Parameters = <>
    Left = 416
    Top = 40
  end
  object qrytmp: TADOQuery
    Connection = dm1.con1
    Parameters = <>
    Left = 472
    Top = 40
  end
end
