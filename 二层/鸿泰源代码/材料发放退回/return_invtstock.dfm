object Form_returninvt: TForm_returninvt
  Left = 352
  Top = 291
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #36864#20179#25805#20316
  ClientHeight = 197
  ClientWidth = 407
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 96
    Top = 27
    Width = 59
    Height = 13
    Caption = #21457#25918#25968#37327':'
  end
  object Label2: TLabel
    Left = 122
    Top = 55
    Width = 33
    Height = 13
    Caption = #21333#20301':'
  end
  object Label3: TLabel
    Left = 83
    Top = 82
    Width = 72
    Height = 13
    Caption = #21487#36864#22238#25968#37327':'
  end
  object Label4: TLabel
    Left = 70
    Top = 110
    Width = 85
    Height = 13
    Caption = #26412#27425#36864#22238#25968#37327':'
  end
  object BitBtn1: TBitBtn
    Left = 128
    Top = 146
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 208
    Top = 146
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 160
    Top = 23
    Width = 121
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 2
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 160
    Top = 51
    Width = 79
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 3
    Text = 'Edit2'
  end
  object Edit3: TEdit
    Left = 160
    Top = 78
    Width = 121
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 4
    Text = 'Edit3'
  end
  object Edit4: TEdit
    Left = 160
    Top = 105
    Width = 121
    Height = 21
    TabOrder = 5
    Text = '0.0000'
    OnExit = Edit4Exit
    OnKeyDown = Edit4KeyDown
    OnKeyPress = Edit4KeyPress
    OnKeyUp = Edit4KeyUp
  end
end
