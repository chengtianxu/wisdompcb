object Form7: TForm7
  Left = 546
  Top = 249
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25286#20998#38144#21806#35746#21333
  ClientHeight = 215
  ClientWidth = 290
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
  object Label1: TLabel
    Left = 49
    Top = 23
    Width = 68
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#35746#21333#32534#21495':'
  end
  object Label2: TLabel
    Left = 22
    Top = 50
    Width = 95
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#35746#21333#25968#37327'(SET):'
  end
  object Label3: TLabel
    Left = 49
    Top = 108
    Width = 68
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#23458#25143#20132#26399':'
  end
  object Label4: TLabel
    Left = 49
    Top = 136
    Width = 68
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#35013#36816#26085#26399':'
  end
  object Label5: TLabel
    Left = 22
    Top = 79
    Width = 95
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#35746#21333#25968#37327'(PCS):'
  end
  object Edit1: TEdit
    Left = 122
    Top = 19
    Width = 99
    Height = 21
    TabOrder = 6
    OnExit = Edit1Exit
    OnKeyDown = Edit1KeyDown
  end
  object Edit2: TEdit
    Left = 123
    Top = 47
    Width = 98
    Height = 21
    TabOrder = 0
    Text = '0'
    OnExit = Edit2Exit
    OnKeyDown = Edit2KeyDown
    OnKeyPress = Edit2KeyPress
  end
  object MaskEdit1: TMaskEdit
    Left = 123
    Top = 104
    Width = 99
    Height = 21
    EditMask = '!0000/90/90;1;_'
    MaxLength = 10
    TabOrder = 2
    Text = '    -  -  '
    OnExit = MaskEdit1Exit
    OnKeyDown = MaskEdit1KeyDown
  end
  object MaskEdit2: TMaskEdit
    Left = 123
    Top = 132
    Width = 99
    Height = 21
    EditMask = '!0000/90/90;1;_'
    MaxLength = 10
    TabOrder = 3
    Text = '    -  -  '
    OnExit = MaskEdit2Exit
    OnKeyDown = MaskEdit2KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 70
    Top = 174
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 147
    Top = 174
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 5
    NumGlyphs = 2
  end
  object Edit3: TEdit
    Left = 123
    Top = 76
    Width = 98
    Height = 21
    TabOrder = 1
    Text = '0'
    OnExit = Edit3Exit
    OnKeyDown = Edit3KeyDown
    OnKeyPress = Edit2KeyPress
  end
end
