object Form8: TForm8
  Left = 239
  Top = 306
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #26434#39033#21450#36816#36755#36153#29992#31246
  ClientHeight = 142
  ClientWidth = 545
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
    Left = 33
    Top = 53
    Width = 51
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#22686#20540#31246':'
  end
  object Label2: TLabel
    Left = 116
    Top = 24
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#26631#35782
  end
  object Label3: TLabel
    Left = 212
    Top = 24
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#35013#36816
  end
  object Label4: TLabel
    Left = 292
    Top = 24
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#26434#39033
  end
  object Label5: TLabel
    Left = 396
    Top = 24
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#31246#29575
  end
  object Label6: TLabel
    Left = 465
    Top = 50
    Width = 8
    Height = 13
    Caption = '%'
  end
  object Button1: TButton
    Left = 191
    Top = 104
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 0
  end
  object Button2: TButton
    Left = 271
    Top = 104
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 93
    Top = 48
    Width = 89
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 2
  end
  object DBCheckBox1: TDBCheckBox
    Left = 224
    Top = 48
    Width = 25
    Height = 17
    DataField = 'STATE_SHIP_TAX_FLAG'
    DataSource = DM.DataSource2
    TabOrder = 3
    ValueChecked = 'Y'
    ValueUnchecked = 'N'
  end
  object DBCheckBox2: TDBCheckBox
    Left = 301
    Top = 48
    Width = 25
    Height = 17
    DataField = 'STATE_MISC_TAX_FLAG'
    DataSource = DM.DataSource2
    TabOrder = 4
    ValueChecked = 'Y'
    ValueUnchecked = 'N'
  end
  object DBEdit1: TDBEdit
    Left = 377
    Top = 47
    Width = 81
    Height = 21
    Color = cl3DLight
    DataField = 'FEDERAL_TAX'
    DataSource = DM.DataSource2
    ReadOnly = True
    TabOrder = 5
  end
end
