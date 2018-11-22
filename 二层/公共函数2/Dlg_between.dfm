object frmDlg_between: TfrmDlg_between
  Left = 199
  Top = 215
  BorderStyle = bsDialog
  Caption = #36755#20837#26465#20214
  ClientHeight = 132
  ClientWidth = 438
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 50
    Top = 32
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = #24320#22987#65306
  end
  object Label2: TLabel
    Left = 50
    Top = 64
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = #32467#26463#65306
  end
  object Bevel1: TBevel
    Left = 16
    Top = 6
    Width = 305
    Height = 115
    Shape = bsFrame
  end
  object OKBtn: TButton
    Left = 343
    Top = 20
    Width = 75
    Height = 25
    Caption = #30830#23450'(&Y)'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object CancelBtn: TButton
    Left = 343
    Top = 68
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040'(&C)'
    ModalResult = 2
    TabOrder = 2
  end
  object Notebook1: TNotebook
    Left = 90
    Top = 16
    Width = 215
    Height = 89
    PageIndex = 1
    TabOrder = 0
    object TPage
      Left = 0
      Top = 0
      Caption = 'Default'
      object edtValue1: TEdit
        Left = 8
        Top = 9
        Width = 129
        Height = 21
        TabOrder = 0
        OnKeyPress = edtValue1KeyPress
      end
      object edtValue2: TEdit
        Left = 8
        Top = 42
        Width = 129
        Height = 21
        TabOrder = 1
        OnKeyPress = edtValue1KeyPress
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'date'
      object dtpStartDate: TDateTimePicker
        Left = 8
        Top = 8
        Width = 113
        Height = 21
        Date = 39146.578009618050000000
        Time = 39146.578009618050000000
        Checked = False
        TabOrder = 0
      end
      object dtpEndDate: TDateTimePicker
        Left = 8
        Top = 41
        Width = 113
        Height = 21
        Date = 39146.578355567130000000
        Time = 39146.578355567130000000
        TabOrder = 1
      end
      object dtpStartTime: TDateTimePicker
        Left = 120
        Top = 8
        Width = 89
        Height = 21
        Date = 39171.000000000000000000
        Time = 39171.000000000000000000
        Kind = dtkTime
        TabOrder = 2
      end
      object dtpEndTime: TDateTimePicker
        Left = 120
        Top = 40
        Width = 89
        Height = 21
        Date = 39171.999988425930000000
        Time = 39171.999988425930000000
        Kind = dtkTime
        TabOrder = 3
      end
    end
  end
end
