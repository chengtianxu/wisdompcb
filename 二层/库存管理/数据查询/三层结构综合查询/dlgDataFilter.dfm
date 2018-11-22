object frmdlgDataFilter: TfrmdlgDataFilter
  Left = 292
  Top = 254
  BorderStyle = bsDialog
  Caption = #25968#25454#36807#28388
  ClientHeight = 168
  ClientWidth = 404
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 32
    Width = 52
    Height = 13
    Caption = #36807#28388#21015#65306
  end
  object Label2: TLabel
    Left = 24
    Top = 64
    Width = 65
    Height = 13
    Caption = #36807#28388#20869#23481#65306
  end
  object comboxFieldList: TRzComboBox
    Left = 96
    Top = 24
    Width = 145
    Height = 21
    Ctl3D = False
    FrameSides = [sdBottom]
    FrameVisible = True
    ItemHeight = 13
    ParentCtl3D = False
    TabOnEnter = True
    TabOrder = 1
  end
  object edtValue: TRzEdit
    Left = 96
    Top = 56
    Width = 145
    Height = 21
    FrameSides = [sdBottom]
    FrameVisible = True
    TabOnEnter = True
    TabOrder = 0
  end
  object RzButton1: TRzButton
    Left = 296
    Top = 32
    ModalResult = 1
    Caption = #36807#28388
    Color = clWhite
    HotTrack = True
    TabOrder = 2
  end
  object RzButton2: TRzButton
    Left = 296
    Top = 72
    ModalResult = 2
    Caption = #21462#28040
    Color = clWhite
    HotTrack = True
    TabOrder = 3
  end
  object rgFilterType: TRzRadioGroup
    Left = 24
    Top = 96
    Width = 217
    Height = 41
    Caption = #36807#28388#26041#24335
    Color = clWhite
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      #21069#27169#31946
      #21518#27169#31946
      #21069#21518#27169#31946)
    TabOrder = 4
  end
end
