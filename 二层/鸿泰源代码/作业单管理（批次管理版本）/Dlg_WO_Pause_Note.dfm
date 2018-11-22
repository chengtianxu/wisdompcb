object frmDlg_WO_Pause_Note: TfrmDlg_WO_Pause_Note
  Left = 255
  Top = 185
  BorderStyle = bsDialog
  Caption = #20316#19994#21333#26242#20572#22791#27880
  ClientHeight = 402
  ClientWidth = 542
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
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 78
    Height = 13
    Caption = #21382#21490#21464#26356#35760#24405
  end
  object Label2: TLabel
    Left = 8
    Top = 200
    Width = 78
    Height = 13
    Caption = #26412#27425#21464#26356#22791#27880
  end
  object Memo1: TMemo
    Left = 8
    Top = 38
    Width = 521
    Height = 145
    Color = clMenu
    ReadOnly = True
    TabOrder = 0
  end
  object Memo2: TMemo
    Left = 8
    Top = 222
    Width = 521
    Height = 115
    TabOrder = 1
  end
  object btnYes: TButton
    Left = 152
    Top = 360
    Width = 75
    Height = 25
    Caption = #30830#23450'(&Y)'
    ModalResult = 1
    TabOrder = 2
  end
  object btnCancel: TButton
    Left = 296
    Top = 360
    Width = 75
    Height = 25
    Caption = #21462#28040'(&C)'
    ModalResult = 2
    TabOrder = 3
  end
end
