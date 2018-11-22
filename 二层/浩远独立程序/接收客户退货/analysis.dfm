object Form5: TForm5
  Left = 400
  Top = 217
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24120#29992#20998#26512#20449#24687
  ClientHeight = 233
  ClientWidth = 428
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
  object Label8: TLabel
    Left = 50
    Top = 33
    Width = 60
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#20998#26512#20195#30721'1:'
  end
  object Label9: TLabel
    Left = 50
    Top = 63
    Width = 60
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#20998#26512#20195#30721'2:'
  end
  object Label10: TLabel
    Left = 50
    Top = 93
    Width = 60
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#20998#26512#20195#30721'3:'
  end
  object Label11: TLabel
    Left = 50
    Top = 123
    Width = 60
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#20998#26512#20195#30721'4:'
  end
  object Label12: TLabel
    Left = 50
    Top = 154
    Width = 60
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#20998#26512#20195#30721'5:'
  end
  object DBEdit1: TDBEdit
    Left = 120
    Top = 30
    Width = 253
    Height = 21
    DataField = 'ANALYSIS_CODE_1'
    DataSource = Form2.DataSource1
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 120
    Top = 60
    Width = 253
    Height = 21
    DataField = 'ANALYSIS_CODE_2'
    DataSource = Form2.DataSource1
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 120
    Top = 90
    Width = 253
    Height = 21
    DataField = 'ANALYSIS_CODE_3'
    DataSource = Form2.DataSource1
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 120
    Top = 121
    Width = 253
    Height = 21
    DataField = 'ANALYSIS_CODE_4'
    DataSource = Form2.DataSource1
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 120
    Top = 150
    Width = 253
    Height = 21
    DataField = 'ANALYSIS_CODE_5'
    DataSource = Form2.DataSource1
    TabOrder = 4
  end
  object Button1: TButton
    Left = 177
    Top = 194
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 5
  end
end
