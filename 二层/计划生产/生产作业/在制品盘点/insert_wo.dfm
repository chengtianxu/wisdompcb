object Form4: TForm4
  Left = 570
  Top = 265
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22686#21152#22312#32447#24037#21333
  ClientHeight = 346
  ClientWidth = 568
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
    Left = 127
    Top = 11
    Width = 32
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '  '#24037#21378':'
  end
  object Label2: TLabel
    Left = 94
    Top = 83
    Width = 65
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #26412#21378#32534#21495':'
  end
  object Label3: TLabel
    Left = 168
    Top = 107
    Width = 153
    Height = 13
    AutoSize = False
  end
  object Label5: TLabel
    Left = 113
    Top = 164
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = #24037#21333#21495':'
  end
  object Label6: TLabel
    Left = 87
    Top = 194
    Width = 72
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #24403#21069#24037#24207':'
  end
  object Label7: TLabel
    Left = 328
    Top = 195
    Width = 193
    Height = 13
    AutoSize = False
  end
  object Label8: TLabel
    Left = 100
    Top = 225
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #35745#21010#25968#37327':'
  end
  object Label9: TLabel
    Left = 79
    Top = 280
    Width = 80
    Height = 13
    Alignment = taRightJustify
    Caption = #28165#28857#25968#37327'pcs:'
  end
  object Label10: TLabel
    Left = 126
    Top = 136
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #23458#25143':'
  end
  object rkey06: TLabel
    Left = 24
    Top = 94
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object rkey25: TLabel
    Left = 24
    Top = 114
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object flow_no: TLabel
    Left = 24
    Top = 134
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object dept_ptr: TLabel
    Left = 24
    Top = 168
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object step: TLabel
    Left = 25
    Top = 196
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object Label11: TLabel
    Left = 65
    Top = 250
    Width = 94
    Height = 13
    Alignment = taRightJustify
    Caption = #28165#28857#25968#37327'panel:'
  end
  object DBEdit1: TDBEdit
    Left = 168
    Top = 7
    Width = 65
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'WAREHOUSE_CODE'
    DataSource = DM.DataSource1
    ReadOnly = True
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 248
    Top = 7
    Width = 153
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'WAREHOUSE_NAME'
    DataSource = DM.DataSource1
    ReadOnly = True
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 167
    Top = 79
    Width = 121
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 294
    Top = 77
    Width = 25
    Height = 25
    TabOrder = 4
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
  object Edit3: TEdit
    Left = 167
    Top = 159
    Width = 121
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 5
  end
  object Button1: TButton
    Left = 201
    Top = 304
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 12
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 293
    Top = 304
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 13
  end
  object Edit4: TEdit
    Left = 168
    Top = 190
    Width = 121
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 6
  end
  object BitBtn2: TBitBtn
    Left = 294
    Top = 189
    Width = 25
    Height = 25
    Enabled = False
    TabOrder = 7
    OnClick = BitBtn2Click
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
  object Edit5: TEdit
    Left = 168
    Top = 219
    Width = 121
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 8
  end
  object Edit6: TEdit
    Left = 168
    Top = 275
    Width = 121
    Height = 21
    TabOrder = 10
    Text = '0'
    OnExit = Edit6Exit
    OnKeyPress = Edit6KeyPress
  end
  object Edit7: TEdit
    Left = 168
    Top = 132
    Width = 73
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 11
  end
  object RadioGroup1: TRadioGroup
    Left = 168
    Top = 34
    Width = 204
    Height = 37
    Caption = #24037#21333#36873#25321
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #22312#32447#24037#21333
      #38750#22312#32447#24037#21333)
    TabOrder = 2
    OnClick = RadioGroup1Click
  end
  object Edit8: TEdit
    Left = 168
    Top = 245
    Width = 121
    Height = 21
    TabOrder = 9
    Text = '0'
    OnExit = Edit8Exit
    OnKeyPress = Edit6KeyPress
  end
end
