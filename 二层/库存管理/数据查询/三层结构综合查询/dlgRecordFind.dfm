object frmdlgRecordFind: TfrmdlgRecordFind
  Left = 292
  Top = 254
  BorderStyle = bsDialog
  Caption = #35760#24405#26597#25214#23450#20301
  ClientHeight = 128
  ClientWidth = 412
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
    Caption = #26597#25214#21015#65306
  end
  object Label2: TLabel
    Left = 24
    Top = 64
    Width = 65
    Height = 13
    Caption = #26597#25214#20869#23481#65306
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
    TabOrder = 2
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
    Top = 24
    ModalResult = 1
    Caption = #26597#25214
    Color = clWhite
    HotTrack = True
    TabOrder = 1
  end
  object RzButton2: TRzButton
    Left = 296
    Top = 64
    ModalResult = 2
    Caption = #21462#28040
    Color = clWhite
    HotTrack = True
    TabOrder = 3
  end
end
