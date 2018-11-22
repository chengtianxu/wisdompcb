inherited frmDate_Mod29: TfrmDate_Mod29
  Left = 479
  Top = 417
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #20462#25913#20132#36135#26085#26399
  ClientHeight = 130
  ClientWidth = 306
  ExplicitLeft = 479
  ExplicitTop = 417
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 36
    Width = 60
    Height = 13
    Caption = #20132#36135#26085#26399#65306
  end
  object edtDate: TEdit
    Left = 96
    Top = 35
    Width = 175
    Height = 21
    TabOrder = 0
  end
  object btnCommit: TBitBtn
    Left = 64
    Top = 80
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 1
    OnClick = btnCommitClick
  end
  object btnCancel: TBitBtn
    Left = 176
    Top = 80
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
end
