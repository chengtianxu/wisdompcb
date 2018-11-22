object Form4: TForm4
  Left = 310
  Top = 221
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22686#21152'/'#32534#36753#38750#29983#20135#29289#26009#39033#30446
  ClientHeight = 283
  ClientWidth = 496
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 51
    Top = 37
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #29289#21697#21517#31216':'
  end
  object Label6: TLabel
    Left = 40
    Top = 135
    Width = 70
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #37319#36141#25968#37327':'
  end
  object Label7: TLabel
    Left = 25
    Top = 166
    Width = 85
    Height = 13
    Alignment = taRightJustify
    Caption = #35201#27714#21040#36135#26085#26399':'
  end
  object Label1: TLabel
    Left = 72
    Top = 101
    Width = 38
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '   '#31867#21035':'
  end
  object Label3: TLabel
    Left = 225
    Top = 134
    Width = 69
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #37319#36141#21333#20301':'
  end
  object Label4: TLabel
    Left = 304
    Top = 166
    Width = 116
    Height = 13
    AutoSize = False
  end
  object Label5: TLabel
    Left = 51
    Top = 70
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #29289#21697#35268#26684':'
  end
  object Label8: TLabel
    Left = 51
    Top = 194
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #35831#36141#21407#22240':'
  end
  object DBEdit1: TDBEdit
    Left = 117
    Top = 33
    Width = 309
    Height = 21
    DataField = 'DESCRIPTION_1'
    DataSource = DM.DataSource4
    TabOrder = 0
    OnKeyDown = DBEdit1KeyDown
  end
  object DBEdit3: TDBEdit
    Left = 117
    Top = 130
    Width = 86
    Height = 21
    DataField = 'QUANTITY_REQUIRED'
    DataSource = DM.DataSource4
    TabOrder = 3
    OnExit = DBEdit3Exit
    OnKeyDown = DBEdit3KeyDown
    OnKeyPress = DBEdit4KeyPress
  end
  object MaskEdit1: TMaskEdit
    Left = 117
    Top = 161
    Width = 172
    Height = 21
    TabOrder = 5
    OnExit = MaskEdit1Exit
    OnKeyDown = MaskEdit1KeyDown
  end
  object Button1: TButton
    Left = 171
    Top = 234
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 7
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 251
    Top = 234
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 8
    OnClick = Button2Click
  end
  object DBComboBox1: TDBComboBox
    Left = 117
    Top = 97
    Width = 145
    Height = 21
    DataField = 'DESCRIPTION_2'
    DataSource = DM.DataSource4
    ItemHeight = 13
    TabOrder = 2
    OnKeyDown = DBComboBox1KeyDown
    OnKeyPress = DBComboBox1KeyPress
  end
  object Edit1: TEdit
    Left = 301
    Top = 130
    Width = 86
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = Edit1Click
    OnExit = Edit1Exit
    OnKeyDown = Edit1KeyDown
  end
  object BitBtn3: TBitBtn
    Left = 394
    Top = 125
    Width = 31
    Height = 31
    Hint = #26597#25214#21333#20301
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    TabStop = False
    OnExit = BitBtn3Exit
    OnMouseDown = BitBtn3MouseDown
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
  object DBEdit2: TDBEdit
    Left = 117
    Top = 66
    Width = 307
    Height = 21
    DataField = 'GUI_GE'
    DataSource = DM.DataSource4
    TabOrder = 1
    OnKeyDown = DBEdit2KeyDown
  end
  object DBEdit4: TDBEdit
    Left = 117
    Top = 191
    Width = 310
    Height = 21
    DataField = 'reason'
    DataSource = DM.DataSource4
    TabOrder = 6
    OnKeyDown = DBEdit4KeyDown
  end
  object Button3: TButton
    Left = 215
    Top = 235
    Width = 75
    Height = 25
    Caption = #20851#38381
    ModalResult = 1
    TabOrder = 10
    Visible = False
  end
end
