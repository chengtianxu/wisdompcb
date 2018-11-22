inherited frmQryItem_Mod725: TfrmQryItem_Mod725
  Caption = #27719#24635#26465#20214#35774#23450
  ClientHeight = 351
  ClientWidth = 532
  ExplicitWidth = 548
  ExplicitHeight = 390
  PixelsPerInch = 96
  TextHeight = 13
  object grpDate: TGroupBox
    Left = 32
    Top = 24
    Width = 465
    Height = 57
    Caption = #26085#26399#33539#22260
    TabOrder = 0
    object lbl1: TLabel
      Left = 33
      Top = 25
      Width = 60
      Height = 13
      Caption = #36807#26495#26085#26399#65306
    end
    object lbl2: TLabel
      Left = 249
      Top = 25
      Width = 24
      Height = 13
      Caption = #33267#65306
    end
    object dtpk1: TDateTimePicker
      Left = 115
      Top = 21
      Width = 105
      Height = 21
      Date = 42800.000000000000000000
      Time = 42800.000000000000000000
      TabOrder = 0
    end
    object dtpk2: TDateTimePicker
      Left = 303
      Top = 21
      Width = 105
      Height = 21
      Date = 42800.000000000000000000
      Time = 42800.000000000000000000
      TabOrder = 1
    end
  end
  object rgSumaryMode: TRadioGroup
    Left = 32
    Top = 87
    Width = 465
    Height = 58
    Caption = #27719#24635#27169#24335
    Columns = 3
    ItemIndex = 1
    Items.Strings = (
      #25353#26085#27719#24635
      #25353#21608#27719#24635
      #25353#26376#27719#24635)
    TabOrder = 1
  end
  object rgQryMode: TRadioGroup
    Left = 32
    Top = 151
    Width = 465
    Height = 58
    Caption = #26597#35810#27169#24335
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      #20197#32447#21035#27719#24635
      #20197#24037#24207#27719#24635
      #20197#24037#21378#27719#24635)
    TabOrder = 2
  end
  object rgFactory: TRadioGroup
    Left = 32
    Top = 215
    Width = 465
    Height = 58
    Caption = #24037#21378#36873#25321
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #19968#21378#65288#39640#22810#23618#65289
      #20108#21378#65288'HDI'#65289)
    TabOrder = 3
  end
  object btnSummit: TBitBtn
    Left = 139
    Top = 296
    Width = 65
    Height = 29
    Caption = #30830#23450
    TabOrder = 4
  end
  object btnCancel: TBitBtn
    Left = 312
    Top = 296
    Width = 65
    Height = 29
    Caption = #21462#28040
    TabOrder = 5
  end
end
