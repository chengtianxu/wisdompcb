object Form_EditNote: TForm_EditNote
  Left = 439
  Top = 235
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25351#27966#22791#27880#20449#24687
  ClientHeight = 234
  ClientWidth = 385
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 50
    Top = 14
    Width = 40
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#27611#37325':'
  end
  object Label3: TLabel
    Left = 4
    Top = 90
    Width = 86
    Height = 13
    Alignment = taRightJustify
    Caption = '  '#21253#35013#31665#23610#23544':'
  end
  object Label4: TLabel
    Left = 5
    Top = 116
    Width = 85
    Height = 13
    Alignment = taRightJustify
    Caption = #23458#25143#25253#20851#22411#21495':'
  end
  object Label5: TLabel
    Left = 31
    Top = 142
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #31665#21495#20195#30721':'
  end
  object Label6: TLabel
    Left = 43
    Top = 38
    Width = 47
    Height = 13
    Alignment = taRightJustify
    Caption = '  '#20928#37325':'
  end
  object Label7: TLabel
    Left = 17
    Top = 167
    Width = 73
    Height = 13
    Alignment = taRightJustify
    Caption = '  '#25253#20851#37329#39069':'
  end
  object Label9: TLabel
    Left = 197
    Top = 14
    Width = 61
    Height = 13
    Alignment = taRightJustify
    Caption = '('#21333#20301':KG)'
  end
  object Label1: TLabel
    Left = 197
    Top = 38
    Width = 61
    Height = 13
    Alignment = taRightJustify
    Caption = '('#21333#20301':KG)'
  end
  object Label8: TLabel
    Left = 17
    Top = 62
    Width = 73
    Height = 13
    Alignment = taRightJustify
    Caption = '  '#24037#20855#36153#29992':'
  end
  object Button1: TButton
    Left = 111
    Top = 197
    Width = 77
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 0
  end
  object Button2: TButton
    Left = 209
    Top = 197
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 95
    Top = 8
    Width = 100
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    MaxLength = 70
    TabOrder = 2
    Text = '0'
    OnKeyPress = Edit2KeyPress
    OnKeyUp = Edit2KeyUp
  end
  object Edit3: TEdit
    Left = 95
    Top = 84
    Width = 241
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    MaxLength = 70
    TabOrder = 3
  end
  object Edit4: TEdit
    Left = 95
    Top = 111
    Width = 241
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    MaxLength = 70
    TabOrder = 4
  end
  object Edit5: TEdit
    Left = 95
    Top = 137
    Width = 241
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    MaxLength = 70
    TabOrder = 5
  end
  object Edit6: TEdit
    Left = 95
    Top = 34
    Width = 100
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    MaxLength = 70
    TabOrder = 6
    Text = '0'
    OnKeyPress = Edit2KeyPress
    OnKeyUp = Edit2KeyUp
  end
  object Edit7: TEdit
    Left = 95
    Top = 163
    Width = 100
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    MaxLength = 70
    TabOrder = 7
    OnKeyPress = Edit7KeyPress
    OnKeyUp = Edit7KeyUp
  end
  object Edit1: TEdit
    Left = 95
    Top = 58
    Width = 100
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    MaxLength = 70
    ReadOnly = True
    TabOrder = 8
    Text = '0'
  end
end
