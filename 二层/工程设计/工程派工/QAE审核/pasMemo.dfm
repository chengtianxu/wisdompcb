object FrmMemo: TFrmMemo
  Left = 384
  Top = 172
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23457#26680#22791#27880#20449#24687
  ClientHeight = 181
  ClientWidth = 287
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
  object Label1: TLabel
    Left = 51
    Top = 23
    Width = 65
    Height = 13
    Caption = #20135#21697#31995#25968#65306
  end
  object Label2: TLabel
    Left = 51
    Top = 64
    Width = 65
    Height = 13
    Caption = #26816#27979#31867#22411#65306
  end
  object Label3: TLabel
    Left = 40
    Top = 107
    Width = 78
    Height = 13
    Caption = #26159#21542#21518#22788#29702#65306
  end
  object Edit1: TEdit
    Left = 114
    Top = 20
    Width = 121
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    TabOrder = 0
    Text = '0'
    OnExit = Edit1Exit
    OnKeyPress = Edit1KeyPress
  end
  object ComboBox1: TComboBox
    Left = 114
    Top = 62
    Width = 124
    Height = 21
    Style = csDropDownList
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 1
    Text = #20840#26816
    Items.Strings = (
      #20840#26816
      #25277#26816
      #20813#26816)
  end
  object BitBtn1: TBitBtn
    Left = 35
    Top = 145
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 2
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 147
    Top = 145
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 3
    Kind = bkCancel
  end
  object ComboBox2: TComboBox
    Left = 114
    Top = 103
    Width = 124
    Height = 21
    Style = csDropDownList
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 4
    Text = #26159
    Items.Strings = (
      #26159
      #21542)
  end
end
