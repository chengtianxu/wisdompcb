object frmedti317: Tfrmedti317
  Left = 481
  Top = 195
  Width = 416
  Height = 305
  Caption = #27169#26495
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
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 400
    Height = 226
    Align = alClient
    TabOrder = 0
    object lbl1: TLabel
      Left = 56
      Top = 48
      Width = 60
      Height = 13
      Caption = #27169#26495#21517#31216#65306
    end
    object lbl2: TLabel
      Left = 56
      Top = 88
      Width = 60
      Height = 13
      Caption = #27169#26495#25551#36848#65306
    end
    object lbl3: TLabel
      Left = 59
      Top = 123
      Width = 60
      Height = 13
      Caption = #32465#23450#23458#25143#65306
    end
    object btn3: TSpeedButton
      Left = 281
      Top = 117
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = btn3Click
    end
    object edtGroupName: TEdit
      Left = 125
      Top = 43
      Width = 148
      Height = 21
      TabOrder = 0
    end
    object edtGroupDesc: TEdit
      Left = 125
      Top = 83
      Width = 148
      Height = 21
      TabOrder = 1
    end
    object edtCustomer_ptr: TEdit
      Left = 126
      Top = 118
      Width = 147
      Height = 21
      TabOrder = 2
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 226
    Width = 400
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btn1: TButton
      Left = 104
      Top = 8
      Width = 75
      Height = 25
      Caption = #20445#23384
      TabOrder = 0
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 232
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = btn2Click
    end
  end
end
