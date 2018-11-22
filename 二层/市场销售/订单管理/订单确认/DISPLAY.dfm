object Form3: TForm3
  Left = 495
  Top = 297
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26174#31034#36873#39033
  ClientHeight = 241
  ClientWidth = 238
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
  object RdG1: TRadioGroup
    Left = 25
    Top = 8
    Width = 185
    Height = 80
    Caption = ' '#38480#21046
    Enabled = False
    ItemIndex = 0
    Items.Strings = (
      #20840#37096#26377#25928#30340#35746#21333
      #25353#23458#25143#21450#37319#36141#35746#21333
      #25353#37096#20214)
    TabOrder = 0
  end
  object RdG2: TRadioGroup
    Left = 25
    Top = 95
    Width = 185
    Height = 96
    Caption = #25490#24207
    Ctl3D = True
    ItemIndex = 3
    Items.Strings = (
      #23458#25143
      #37096#20214
      #20986#36135#26085#26399
      #25353#38144#21806#35746#21333#21495)
    ParentCtl3D = False
    TabOrder = 1
  end
  object Button1: TButton
    Left = 40
    Top = 200
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 2
  end
  object Button2: TButton
    Left = 120
    Top = 200
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
end
