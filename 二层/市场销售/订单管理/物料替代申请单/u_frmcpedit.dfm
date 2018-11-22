object frm_cpedit: Tfrm_cpedit
  Left = 309
  Top = 206
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  ClientHeight = 353
  ClientWidth = 592
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
    DataSource = dm.DS542
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 14
    Top = 63
    Width = 139
    Height = 23
    AutoSize = False
    DataField = 'type_code'
    DataSource = dm.DS542
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 13
    Top = 189
    Width = 532
    Height = 149
    AutoSize = False
    DataField = 'remark'
    DataSource = dm.DS542
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
end
