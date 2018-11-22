object FrmChgPass: TFrmChgPass
  Left = 227
  Top = 305
  Width = 454
  Height = 150
  Caption = #26356#25913#23494#30721
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 72
    Top = 50
    Width = 76
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #26032#23494#30721#65306
  end
  object Label1: TLabel
    Left = 72
    Top = 23
    Width = 76
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #26087#23494#30721#65306
  end
  object Label2: TLabel
    Left = 24
    Top = 77
    Width = 124
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #37325#36755#26032#23494#30721#65306
  end
  object Edit1: TEdit
    Left = 160
    Top = 19
    Width = 121
    Height = 21
    MaxLength = 32
    PasswordChar = '*'
    TabOrder = 0
    OnExit = Edit1Exit
    OnKeyDown = Edit1KeyDown
  end
  object Edit2: TEdit
    Left = 160
    Top = 46
    Width = 121
    Height = 21
    MaxLength = 32
    PasswordChar = '*'
    TabOrder = 1
    OnKeyDown = Edit2KeyDown
  end
  object Edit3: TEdit
    Left = 160
    Top = 73
    Width = 121
    Height = 21
    MaxLength = 32
    PasswordChar = '*'
    TabOrder = 2
    OnKeyDown = Edit3KeyDown
  end
  object BitBtn2: TBitBtn
    Left = 328
    Top = 64
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
    NumGlyphs = 2
  end
  object Button1: TButton
    Left = 328
    Top = 24
    Width = 75
    Height = 25
    Caption = #30830#23450
    Enabled = False
    TabOrder = 4
    OnClick = Button1Click
  end
end
