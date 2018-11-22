object FrmAddItems: TFrmAddItems
  Left = 295
  Top = 241
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26434#39033#29289#21697#31867#21035'-'#26032#22686
  ClientHeight = 136
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 16
    Top = 13
    Width = 129
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #26434#39033#29289#21697#31867#21035#21517#31216':'
  end
  object Edit1: TEdit
    Left = 152
    Top = 9
    Width = 177
    Height = 21
    MaxLength = 20
    TabOrder = 0
  end
  object BitBtn5: TBitBtn
    Left = 374
    Top = 45
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 1
    OnClick = BitBtn5Click
  end
  object BitBtn6: TBitBtn
    Left = 374
    Top = 9
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 2
    OnClick = BitBtn6Click
  end
  object BitBtn1: TBitBtn
    Left = 375
    Top = 82
    Width = 75
    Height = 25
    Caption = #22686#21152
    TabOrder = 3
    OnClick = BitBtn1Click
  end
end
