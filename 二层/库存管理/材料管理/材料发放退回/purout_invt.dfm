object Form_putout: TForm_putout
  Left = 570
  Top = 250
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26448#26009#21457#25918
  ClientHeight = 215
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 80
    Top = 31
    Width = 85
    Height = 13
    Caption = #26377#25928#24211#23384#25968#37327':'
  end
  object Label2: TLabel
    Left = 132
    Top = 61
    Width = 33
    Height = 13
    Caption = #21333#20301':'
  end
  object Label3: TLabel
    Left = 80
    Top = 90
    Width = 85
    Height = 13
    Caption = #26412#27425#21457#25918#25968#37327':'
  end
  object Label4: TLabel
    Left = 106
    Top = 116
    Width = 59
    Height = 13
    Caption = #37197#39069#25968#37327':'
    Visible = False
  end
  object Label5: TLabel
    Left = 93
    Top = 144
    Width = 72
    Height = 13
    Caption = #24050#21457#25918#25968#37327':'
    Visible = False
  end
  object BitBtn1: TBitBtn
    Left = 128
    Top = 176
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 208
    Top = 176
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 168
    Top = 27
    Width = 121
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 3
  end
  object Edit2: TEdit
    Left = 168
    Top = 57
    Width = 65
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 4
  end
  object Edit3: TEdit
    Left = 168
    Top = 85
    Width = 89
    Height = 21
    TabOrder = 0
    Text = '0.0000'
    OnExit = Edit3Exit
    OnKeyDown = Edit3KeyDown
    OnKeyPress = Edit3KeyPress
    OnKeyUp = Edit3KeyUp
  end
  object Edit4: TEdit
    Left = 168
    Top = 112
    Width = 89
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 5
    Text = '0.00'
    Visible = False
  end
  object CheckBox1: TCheckBox
    Left = 279
    Top = 114
    Width = 82
    Height = 17
    Caption = #21457#25918#23436#27605
    TabOrder = 6
    Visible = False
  end
  object Edit5: TEdit
    Left = 168
    Top = 140
    Width = 89
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 7
    Text = '0.00'
    Visible = False
  end
end
