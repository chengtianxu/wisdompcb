object frmType: TfrmType
  Left = 636
  Top = 311
  Width = 277
  Height = 216
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #36873#25321#25991#20214#31867#22411
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object rgType: TRadioGroup
    Left = 32
    Top = 0
    Width = 193
    Height = 121
    Align = alCustom
    ItemIndex = 0
    Items.Strings = (
      #22806#24418#22270
      'VCUT'#22270
      'ECN'#21464#26356#25991#26723
      #20854#23427#25991#26723)
    TabOrder = 0
  end
  object btnConfirm: TBitBtn
    Left = 40
    Top = 135
    Width = 65
    Height = 33
    Caption = #30830#35748
    ModalResult = 1
    TabOrder = 1
  end
  object btnCancel: TBitBtn
    Left = 152
    Top = 135
    Width = 65
    Height = 33
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
end
