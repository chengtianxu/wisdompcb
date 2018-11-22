object frm_cpedit: Tfrm_cpedit
  Left = 517
  Top = 250
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26032#22686#23457#26680#27969#31243
  ClientHeight = 353
  ClientWidth = 489
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 17
    Top = 43
    Width = 59
    Height = 13
    AutoSize = False
    Caption = #20195#30721
  end
  object Label2: TLabel
    Left = 12
    Top = 99
    Width = 75
    Height = 13
    AutoSize = False
    Caption = #21517#31216
  end
  object Label3: TLabel
    Left = 14
    Top = 159
    Width = 82
    Height = 13
    AutoSize = False
    Caption = #22791#27880
  end
  object DBEdit1: TDBEdit
    Left = 12
    Top = 125
    Width = 441
    Height = 24
    AutoSize = False
    DataField = 'name'
    DataSource = dm.DataSource2
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 14
    Top = 63
    Width = 139
    Height = 23
    AutoSize = False
    DataField = 'type_code'
    DataSource = dm.DataSource2
    TabOrder = 1
    OnExit = DBEdit2Exit
  end
  object DBEdit3: TDBEdit
    Left = 13
    Top = 189
    Width = 444
    Height = 149
    AutoSize = False
    DataField = 'remark'
    DataSource = dm.DataSource2
    TabOrder = 2
  end
  object BitBtn3: TBitBtn
    Left = 67
    Top = 1
    Width = 57
    Height = 34
    Caption = #20445#23384
    ModalResult = 1
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object BitBtn1: TBitBtn
    Left = 9
    Top = 1
    Width = 56
    Height = 34
    Caption = #21462#28040
    ModalResult = 1
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object DBRadioGroup1: TDBRadioGroup
    Left = 171
    Top = 40
    Width = 281
    Height = 69
    Caption = #27969#31243#36873#25321
    DataField = 'Type'
    DataSource = dm.DataSource2
    Items.Strings = (
      #21046#21069#33021#21147#31649#29702#23457#26680#27969#31243
      'FA'#27979#35797#23457#26680#27969#31243)
    TabOrder = 5
    Values.Strings = (
      '0'
      '1')
  end
end
