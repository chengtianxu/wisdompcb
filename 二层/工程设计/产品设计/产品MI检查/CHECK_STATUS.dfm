object Form3: TForm3
  Left = 435
  Top = 245
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #36890#36807#26816#26597
  ClientHeight = 348
  ClientWidth = 333
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
  object Label1: TLabel
    Left = 8
    Top = 136
    Width = 36
    Height = 13
    Caption = #22791#27880#65306
  end
  object Memo1: TMemo
    Left = 2
    Top = 154
    Width = 329
    Height = 152
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object DBCheckBox4: TDBCheckBox
    Left = 116
    Top = 31
    Width = 76
    Height = 17
    Caption = #20801#35768#32534#36753
    DataField = 'ALLOW_EDIT_FLAG'
    DataSource = DM.DataSource2
    ReadOnly = True
    TabOrder = 1
    ValueChecked = 'Y'
    ValueUnchecked = 'N'
  end
  object DBCheckBox2: TDBCheckBox
    Left = 116
    Top = 91
    Width = 76
    Height = 17
    Caption = #25237#20135#26242#32531
    DataField = 'ONHOLD_PLANNING_FLAG'
    DataSource = DM.DataSource2
    ReadOnly = True
    TabOrder = 2
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object DBCheckBox3: TDBCheckBox
    Left = 116
    Top = 62
    Width = 97
    Height = 17
    Caption = #24037#21333#21457#20986#26242#32531
    DataField = 'ONHOLD_RELEASE_FLAG'
    DataSource = DM.DataSource2
    ReadOnly = True
    TabOrder = 3
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object DBRadioGroup2: TDBRadioGroup
    Left = 115
    Top = 118
    Width = 122
    Height = 33
    Caption = #38144#21806#29366#24577
    Columns = 2
    DataField = 'ONHOLD_SALES_FLAG'
    DataSource = DM.DataSource2
    Items.Strings = (
      #26377#25928
      #36807#26399)
    ReadOnly = True
    TabOrder = 4
    Values.Strings = (
      '0'
      '1')
  end
  object Button1: TButton
    Left = 94
    Top = 315
    Width = 75
    Height = 25
    Caption = #30830#35748
    ModalResult = 1
    TabOrder = 5
  end
  object Button2: TButton
    Left = 174
    Top = 315
    Width = 75
    Height = 25
    Caption = #36820#22238
    ModalResult = 2
    TabOrder = 6
  end
end
