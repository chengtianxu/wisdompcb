object SelectedDate_frm: TSelectedDate_frm
  Left = 480
  Top = 329
  BorderStyle = bsDialog
  Caption = #36873#25321#26085#26399
  ClientHeight = 130
  ClientWidth = 436
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 16
    Top = 6
    Width = 305
    Height = 115
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 40
    Top = 29
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = #24320#22987#65306
  end
  object Label2: TLabel
    Left = 40
    Top = 86
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = #32467#26463#65306
  end
  object OKBtn: TButton
    Left = 343
    Top = 27
    Width = 75
    Height = 25
    Caption = #30830#23450'(&Y)'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = OKBtnClick
  end
  object CancelBtn: TButton
    Left = 343
    Top = 75
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040'(&C)'
    ModalResult = 2
    TabOrder = 1
  end
  object Notebook1: TNotebook
    Left = 82
    Top = 17
    Width = 215
    Height = 95
    PageIndex = 1
    TabOrder = 2
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
      end
      object edtValue2: TEdit
        Left = 8
        Top = 42
        Width = 129
        Height = 21
        TabOrder = 1
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
        Top = 65
        Width = 113
        Height = 21
        Date = 39146.578355567130000000
        Time = 39146.578355567130000000
        Enabled = False
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
        Top = 65
        Width = 89
        Height = 21
        Date = 39171.999988425930000000
        Time = 39171.999988425930000000
        Enabled = False
        Kind = dtkTime
        TabOrder = 3
      end
      object CheckBox1: TCheckBox
        Left = 9
        Top = 38
        Width = 97
        Height = 17
        Caption = #33539#22260#20043#20869
        TabOrder = 4
        OnClick = CheckBox1Click
      end
    end
  end
end
