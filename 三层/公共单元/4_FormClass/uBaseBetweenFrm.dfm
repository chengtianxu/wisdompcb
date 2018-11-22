inherited frmBaseBetween: TfrmBaseBetween
  Caption = #26085#26399#33539#22260
  ClientHeight = 191
  ClientWidth = 345
  Position = poScreenCenter
  ExplicitWidth = 361
  ExplicitHeight = 230
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 345
    Height = 191
    Align = alClient
    TabOrder = 0
    object lbl1: TLabel
      Left = 48
      Top = 32
      Width = 36
      Height = 13
      Caption = #24320#22987#65306
    end
    object lbl2: TLabel
      Left = 48
      Top = 80
      Width = 36
      Height = 13
      Caption = #32467#26463#65306
    end
    object btnOK: TButton
      Left = 64
      Top = 128
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnClose: TButton
      Left = 202
      Top = 128
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = btnCloseClick
    end
    object dtp1: TDateTimePicker
      Left = 91
      Top = 28
      Width = 186
      Height = 21
      Date = 42620.000000000000000000
      Format = 'yyyy-MM-dd HH:mm:ss'
      Time = 42620.000000000000000000
      TabOrder = 2
    end
    object dtp2: TDateTimePicker
      Left = 90
      Top = 77
      Width = 187
      Height = 21
      Date = 42620.999988425920000000
      Format = 'yyyy-MM-dd HH:mm:ss'
      Time = 42620.999988425920000000
      TabOrder = 3
    end
  end
end
