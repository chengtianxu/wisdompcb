object Form_rep: TForm_rep
  Left = 277
  Top = 306
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #38144#21806#20195#34920
  ClientHeight = 144
  ClientWidth = 514
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
    Left = 52
    Top = 24
    Width = 80
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#38144#21806#20195#34920':'
  end
  object Label2: TLabel
    Left = 78
    Top = 51
    Width = 54
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#20323#37329':'
  end
  object Label3: TLabel
    Left = 78
    Top = 79
    Width = 54
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#20998#37197':'
  end
  object Label4: TLabel
    Left = 247
    Top = 24
    Width = 130
    Height = 13
    AutoSize = False
    Caption = '         '
  end
  object Label5: TLabel
    Left = 192
    Top = 52
    Width = 7
    Height = 13
    Caption = '%'
  end
  object Label6: TLabel
    Left = 192
    Top = 80
    Width = 7
    Height = 13
    Caption = '%'
  end
  object Label7: TLabel
    Left = 320
    Top = 56
    Width = 7
    Height = 13
    Visible = False
  end
  object Button1: TButton
    Left = 172
    Top = 113
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 4
  end
  object Button2: TButton
    Left = 252
    Top = 113
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 5
  end
  object Edit1: TEdit
    Left = 136
    Top = 21
    Width = 74
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Edit1Click
    OnExit = Edit1Exit
  end
  object Edit2: TEdit
    Left = 136
    Top = 48
    Width = 52
    Height = 21
    MaxLength = 6
    TabOrder = 1
    Text = '0.00'
    OnExit = Edit2Exit
    OnKeyPress = Edit2KeyPress
  end
  object Edit3: TEdit
    Left = 136
    Top = 75
    Width = 51
    Height = 21
    MaxLength = 6
    TabOrder = 2
    Text = '100.00'
    OnExit = Edit3Exit
    OnKeyPress = Edit3KeyPress
  end
  object BitBtn1: TBitBtn
    Left = 216
    Top = 19
    Width = 25
    Height = 25
    TabOrder = 3
    OnClick = BitBtn1Click
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      04000000000078000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      888800000888880000080F000888880F00080F000888880F0008000000080000
      000800F000000F00000800F000800F00000800F000800F000008800000000000
      0088880F00080F000888880000080000088888800088800088888880F08880F0
      888888800088800088888888888888888888}
  end
end
