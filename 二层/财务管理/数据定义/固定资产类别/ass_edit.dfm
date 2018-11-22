object Form_edit: TForm_edit
  Left = 283
  Top = 218
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22266#23450#36164#20135#31867#21035#32534#36753
  ClientHeight = 368
  ClientWidth = 457
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 124
    Top = 29
    Width = 60
    Height = 13
    Caption = #31867#21035#21517#31216#65306
  end
  object Label2: TLabel
    Left = 119
    Top = 190
    Width = 132
    Height = 13
    Caption = #39044#35745#20351#29992#26102#38388#65288#26376#20221#65289#65306
  end
  object Label3: TLabel
    Left = 138
    Top = 229
    Width = 116
    Height = 13
    Caption = #39044#35745#20928#27531#20540#29575#65288'%'#65289#65306
  end
  object Label4: TLabel
    Left = 145
    Top = 269
    Width = 108
    Height = 13
    Caption = #32534#30721#35268#21017#65288#21069#32512#65289#65306
  end
  object Edit1: TEdit
    Left = 204
    Top = 25
    Width = 141
    Height = 21
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 82
    Top = 61
    Width = 298
    Height = 113
    Caption = #25240#26087#26041#27861
    TabOrder = 1
    object RadioButton1: TRadioButton
      Left = 26
      Top = 25
      Width = 113
      Height = 17
      Caption = #19981#35745#25552#25240#26087
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 26
      Top = 57
      Width = 113
      Height = 17
      Caption = #24179#22343#24180#38480#27861
      TabOrder = 1
    end
    object RadioButton3: TRadioButton
      Left = 26
      Top = 89
      Width = 113
      Height = 17
      Caption = #24037#20316#37327#27861
      TabOrder = 2
    end
    object RadioButton4: TRadioButton
      Left = 165
      Top = 26
      Width = 113
      Height = 17
      Caption = #21452#20493#20313#39069#36882#20943#27861
      TabOrder = 3
    end
    object RadioButton5: TRadioButton
      Left = 165
      Top = 56
      Width = 113
      Height = 17
      Caption = #24037#20316#24180#38480#27861
      TabOrder = 4
    end
  end
  object Edit2: TEdit
    Left = 279
    Top = 186
    Width = 41
    Height = 21
    TabOrder = 2
    OnKeyPress = Edit2KeyPress
  end
  object Edit3: TEdit
    Left = 279
    Top = 226
    Width = 41
    Height = 21
    TabOrder = 3
    OnKeyPress = Edit2KeyPress
  end
  object Edit4: TEdit
    Left = 279
    Top = 266
    Width = 90
    Height = 21
    MaxLength = 15
    TabOrder = 4
  end
  object BitBtn1: TBitBtn
    Left = 128
    Top = 315
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 5
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 264
    Top = 315
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 6
    Kind = bkCancel
  end
end
