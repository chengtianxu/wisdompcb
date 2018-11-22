object frmQRep: TfrmQRep
  Left = 404
  Top = 219
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #27719#24635#25253#34920
  ClientHeight = 334
  ClientWidth = 545
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
  object btnOk: TBitBtn
    Left = 158
    Top = 282
    Width = 75
    Height = 30
    Caption = #30830#23450
    TabOrder = 0
    OnClick = btnOkClick
  end
  object btnCancel: TBitBtn
    Left = 323
    Top = 284
    Width = 75
    Height = 30
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 1
  end
  object rgMode: TRadioGroup
    Left = 40
    Top = 72
    Width = 465
    Height = 57
    Caption = #27719#24635#27169#24335
    Columns = 3
    ItemIndex = 1
    Items.Strings = (
      #25353#26085#27719#24635
      #25353#21608#27719#24635
      #25353#26376#27719#24635)
    TabOrder = 2
  end
  object grpDate: TGroupBox
    Left = 40
    Top = 8
    Width = 465
    Height = 57
    Caption = #26085#26399#33539#22260
    TabOrder = 3
    object lbl1: TLabel
      Left = 33
      Top = 25
      Width = 65
      Height = 13
      Caption = #37319#38598#26085#26399#65306
    end
    object lbl2: TLabel
      Left = 249
      Top = 25
      Width = 26
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
  object rgQryMode: TRadioGroup
    Left = 40
    Top = 135
    Width = 465
    Height = 58
    Caption = #26597#35810#27169#24335
    Columns = 4
    ItemIndex = 0
    Items.Strings = (
      #20197#35774#22791#32447#21035#27719#24635
      #20197#35774#22791#32452#21035#27719#24635
      #20197#24037#24207#27719#24635
      #20197#24037#21378#27719#24635)
    TabOrder = 4
  end
  object grpWHW: TGroupBox
    Left = 40
    Top = 200
    Width = 465
    Height = 49
    Caption = #36873#25321#24037#21378
    TabOrder = 5
    object Label3: TLabel
      Left = 8
      Top = 22
      Width = 39
      Height = 13
      Caption = #24037#21378#65306
    end
    object cbbWH: TComboBox
      Left = 64
      Top = 18
      Width = 137
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
  end
end
