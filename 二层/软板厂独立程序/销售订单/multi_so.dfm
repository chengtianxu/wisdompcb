object Form6: TForm6
  Left = 331
  Top = 241
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24314#31435#22810#26465'SO'#20449#24687#36755#20837
  ClientHeight = 244
  ClientWidth = 389
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 37
    Top = 43
    Width = 98
    Height = 13
    Alignment = taRightJustify
    Caption = #24320#22987#23458#25143#20132#36135#26399':'
  end
  object Label2: TLabel
    Left = 95
    Top = 72
    Width = 40
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#38388#38548':'
  end
  object Label3: TLabel
    Left = 95
    Top = 104
    Width = 40
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#27425#25968':'
  end
  object Label4: TLabel
    Left = 53
    Top = 136
    Width = 82
    Height = 13
    Alignment = taRightJustify
    Caption = '  '#25968#37327'(Set):'
  end
  object Label5: TLabel
    Left = 201
    Top = 72
    Width = 47
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#22825#25968
  end
  object Label6: TLabel
    Left = 53
    Top = 164
    Width = 82
    Height = 13
    Alignment = taRightJustify
    Caption = '  '#25968#37327'(Pcs):'
  end
  object Label7: TLabel
    Left = 69
    Top = 189
    Width = 184
    Height = 13
    AutoSize = False
  end
  object MaskEdit1: TMaskEdit
    Left = 145
    Top = 39
    Width = 86
    Height = 21
    EditMask = '!0000-!90-90;1;_'
    MaxLength = 10
    TabOrder = 0
    Text = '    -  -  '
    OnKeyDown = MaskEdit1KeyDown
  end
  object Edit1: TEdit
    Left = 145
    Top = 69
    Width = 64
    Height = 21
    MaxLength = 3
    TabOrder = 1
    Text = '0'
    OnClick = Edit1Click
    OnExit = Edit1Exit
    OnKeyDown = Edit1KeyDown
    OnKeyPress = Edit3KeyPress
  end
  object Edit2: TEdit
    Left = 145
    Top = 100
    Width = 64
    Height = 21
    MaxLength = 2
    TabOrder = 2
    Text = '1'
    OnClick = Edit2Click
    OnExit = Edit2Exit
    OnKeyDown = Edit2KeyDown
    OnKeyPress = Edit3KeyPress
  end
  object Edit3: TEdit
    Left = 145
    Top = 132
    Width = 110
    Height = 21
    TabOrder = 3
    Text = '0'
    OnClick = Edit3Click
    OnExit = Edit3Exit
    OnKeyDown = Edit3KeyDown
    OnKeyPress = Edit3KeyPress
  end
  object Button1: TButton
    Left = 112
    Top = 210
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 5
  end
  object Button2: TButton
    Left = 192
    Top = 210
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 6
  end
  object Edit4: TEdit
    Left = 145
    Top = 160
    Width = 110
    Height = 21
    TabOrder = 4
    Text = '0'
    OnExit = Edit4Exit
    OnKeyDown = Edit4KeyDown
    OnKeyPress = Edit3KeyPress
  end
end
