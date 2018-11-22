object fm_note: Tfm_note
  Left = 336
  Top = 117
  Width = 629
  Height = 180
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #35760#20107#26412
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
  object Memo1: TMemo
    Left = 1
    Top = 9
    Width = 606
    Height = 102
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 0
    OnKeyPress = Memo1KeyPress
  end
  object Button1: TButton
    Left = 214
    Top = 116
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 1
    Visible = False
  end
  object Button2: TButton
    Left = 294
    Top = 116
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
    Visible = False
  end
  object Button3: TButton
    Left = 252
    Top = 116
    Width = 75
    Height = 25
    Caption = #20851#38381
    ModalResult = 2
    TabOrder = 3
  end
end
