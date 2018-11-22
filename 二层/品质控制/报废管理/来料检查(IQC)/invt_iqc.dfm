object Form_invt_iqc: TForm_invt_iqc
  Left = 354
  Top = 287
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26448#26009#21333#39033#26816#26597
  ClientHeight = 260
  ClientWidth = 388
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 76
    Top = 11
    Width = 65
    Height = 13
    Caption = #26448#26009#32534#30721#65306
  end
  object Label2: TLabel
    Left = 76
    Top = 36
    Width = 65
    Height = 13
    Caption = #26448#26009#21517#31216#65306
  end
  object Label3: TLabel
    Left = 76
    Top = 58
    Width = 65
    Height = 13
    Caption = #26448#26009#35268#26684#65306
  end
  object Label4: TLabel
    Left = 76
    Top = 92
    Width = 65
    Height = 13
    Caption = #37319#36141#25968#37327#65306
  end
  object Label5: TLabel
    Left = 63
    Top = 119
    Width = 78
    Height = 13
    Caption = #24050#36890#36807#25968#37327#65306
  end
  object Label6: TLabel
    Left = 50
    Top = 156
    Width = 91
    Height = 13
    Caption = #26412#27425#36890#36807#25968#37327#65306
  end
  object DBEdit1: TDBEdit
    Left = 140
    Top = 7
    Width = 145
    Height = 21
    Color = cl3DLight
    DataField = 'INV_PART_NUMBER'
    DataSource = DM.DS2
    ReadOnly = True
    TabOrder = 3
  end
  object DBEdit2: TDBEdit
    Left = 140
    Top = 31
    Width = 121
    Height = 21
    Color = cl3DLight
    DataField = 'INV_NAME'
    DataSource = DM.DS2
    ReadOnly = True
    TabOrder = 4
  end
  object DBEdit3: TDBEdit
    Left = 140
    Top = 55
    Width = 193
    Height = 21
    Color = cl3DLight
    DataField = 'INV_DESCRIPTION'
    DataSource = DM.DS2
    ReadOnly = True
    TabOrder = 5
  end
  object DBEdit4: TDBEdit
    Left = 140
    Top = 88
    Width = 86
    Height = 21
    Color = cl3DLight
    DataField = 'QUAN_ORD'
    DataSource = DM.DS2
    ReadOnly = True
    TabOrder = 6
  end
  object DBEdit5: TDBEdit
    Left = 140
    Top = 114
    Width = 86
    Height = 21
    Color = cl3DLight
    DataField = 'QUAN_IN_INSP'
    DataSource = DM.DS2
    ReadOnly = True
    TabOrder = 7
  end
  object Edit1: TEdit
    Left = 140
    Top = 152
    Width = 87
    Height = 21
    TabOrder = 0
    Text = '0'
    OnKeyPress = Edit1KeyPress
    OnKeyUp = Edit1KeyUp
  end
  object Button1: TButton
    Left = 120
    Top = 208
    Width = 75
    Height = 25
    Caption = #30830#35748
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 208
    Top = 208
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
end
