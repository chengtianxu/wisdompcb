object frmTmpTo: TfrmTmpTo
  Left = 751
  Top = 366
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26242#26102#36890#36807#33267
  ClientHeight = 144
  ClientWidth = 259
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 27
    Top = 46
    Width = 78
    Height = 13
    Caption = #26242#26102#36890#36807#33267#65306
  end
  object Label2: TLabel
    Left = 24
    Top = 3
    Width = 65
    Height = 13
    Caption = #36864#22238#21407#22240#65306
  end
  object dtpkTmpTo: TDateTimePicker
    Left = 112
    Top = 41
    Width = 113
    Height = 21
    Date = 42310.337488425930000000
    Time = 42310.337488425930000000
    TabOrder = 0
  end
  object btnComfirm: TBitBtn
    Left = 39
    Top = 100
    Width = 73
    Height = 33
    Caption = #30830#23450
    TabOrder = 1
    OnClick = btnComfirmClick
  end
  object btnCancel: TBitBtn
    Left = 140
    Top = 99
    Width = 73
    Height = 33
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
  object Memo1: TMemo
    Left = 24
    Top = 21
    Width = 209
    Height = 65
    TabOrder = 3
  end
end
