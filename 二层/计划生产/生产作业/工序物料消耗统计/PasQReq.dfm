object frmQRep: TfrmQRep
  Left = 432
  Top = 301
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #27719#24635#25253#34920
  ClientHeight = 379
  ClientWidth = 557
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
    Left = 170
    Top = 326
    Width = 75
    Height = 30
    Caption = #30830#23450
    TabOrder = 0
    OnClick = btnOkClick
  end
  object btnCancel: TBitBtn
    Left = 315
    Top = 324
    Width = 75
    Height = 30
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 1
  end
  object rgMode: TRadioGroup
    Left = 24
    Top = 128
    Width = 505
    Height = 41
    Caption = #27719#24635#27169#24335
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      #25353#26085
      #25353#21608
      #25353#26376)
    TabOrder = 2
  end
  object rgData: TRadioGroup
    Left = 24
    Top = 175
    Width = 505
    Height = 69
    Caption = #25968#25454#26469#28304
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      #29702#35770#28040#32791
      #23454#38469#39046#26009
      #29702#35770#28040#32791'+'#23454#38469#39046#26009
      #23454#38469#19982#29702#35770#27604#20363'%'
      #29983#20135#38754#31215'('#24179#31859#21547#26495#36793')')
    TabOrder = 3
  end
  object grpDate: TGroupBox
    Left = 24
    Top = 248
    Width = 505
    Height = 49
    Caption = #26085#26399#33539#22260
    TabOrder = 4
    object Label1: TLabel
      Left = 16
      Top = 19
      Width = 78
      Height = 13
      Caption = #27719#24635#26085#26399#20174#65306
    end
    object Label2: TLabel
      Left = 264
      Top = 19
      Width = 26
      Height = 13
      Caption = #33267#65306
    end
    object dtpStart: TDateTimePicker
      Left = 120
      Top = 16
      Width = 105
      Height = 21
      Date = 42634.000000000000000000
      Time = 42634.000000000000000000
      TabOrder = 0
    end
    object dtpEnd: TDateTimePicker
      Left = 320
      Top = 16
      Width = 105
      Height = 21
      Date = 42634.000000000000000000
      Time = 42634.000000000000000000
      TabOrder = 1
    end
  end
  object grpWHW: TGroupBox
    Left = 24
    Top = 16
    Width = 241
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
  object GroupBox1: TGroupBox
    Left = 24
    Top = 72
    Width = 281
    Height = 49
    Caption = #36873#25321#20844#24335#20195#30721
    TabOrder = 6
    object Label4: TLabel
      Left = 8
      Top = 21
      Width = 65
      Height = 13
      Caption = #20844#24335#20195#30721#65306
    end
    object cbbGS: TComboBox
      Left = 80
      Top = 17
      Width = 137
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
  end
end
