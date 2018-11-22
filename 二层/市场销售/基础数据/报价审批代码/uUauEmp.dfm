object frmAuEmp: TfrmAuEmp
  Left = 359
  Top = 295
  Width = 279
  Height = 177
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #23457#25209#20154#21592
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
    Left = 13
    Top = 23
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #31995#32479#29992#25143':'
  end
  object Label2: TLabel
    Left = 13
    Top = 53
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = #23457#25209#19978#38480'%:'
  end
  object Label4: TLabel
    Left = 193
    Top = 21
    Width = 7
    Height = 13
  end
  object Label3: TLabel
    Left = 13
    Top = 85
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = #23457#25209#19979#38480'%:'
  end
  object Button1: TButton
    Left = 50
    Top = 118
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 130
    Top = 118
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 80
    Top = 18
    Width = 73
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnExit = Edit1Exit
  end
  object Edit2: TEdit
    Left = 80
    Top = 48
    Width = 138
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 3
    Text = '0.00'
  end
  object Edit3: TEdit
    Left = 80
    Top = 78
    Width = 138
    Height = 21
    MaxLength = 10
    TabOrder = 4
    Text = '0.00'
  end
  object BitBtn1: TBitBtn
    Left = 160
    Top = 16
    Width = 25
    Height = 25
    TabOrder = 5
    TabStop = False
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
