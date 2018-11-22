object Form12: TForm12
  Left = 386
  Top = 247
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20316#19994#21333#25286#20998
  ClientHeight = 195
  ClientWidth = 254
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
    Left = 31
    Top = 33
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#20316#19994#21333':'
  end
  object Label2: TLabel
    Left = 46
    Top = 60
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = '  '#20179#24211':'
  end
  object Label3: TLabel
    Left = 43
    Top = 88
    Width = 36
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#25968#37327':'
  end
  object Label4: TLabel
    Left = 19
    Top = 116
    Width = 60
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#25286#21435#25968#37327':'
  end
  object Label5: TLabel
    Left = 158
    Top = 86
    Width = 6
    Height = 13
    Caption = '0'
    Visible = False
  end
  object Edit1: TEdit
    Left = 83
    Top = 29
    Width = 146
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 83
    Top = 57
    Width = 106
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 83
    Top = 83
    Width = 65
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 2
  end
  object Button1: TButton
    Left = 54
    Top = 161
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 132
    Top = 161
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 5
  end
  object Edit4: TEdit
    Left = 83
    Top = 112
    Width = 66
    Height = 21
    PopupMenu = PopupMenu1
    TabOrder = 3
    Text = '0'
    OnKeyDown = Edit4KeyDown
    OnKeyPress = Edit4KeyPress
    OnKeyUp = Edit4KeyUp
  end
  object PopupMenu1: TPopupMenu
    Left = 192
    Top = 128
  end
end
