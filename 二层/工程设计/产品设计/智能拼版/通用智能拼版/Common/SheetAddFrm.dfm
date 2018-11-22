object frmAddSheet: TfrmAddSheet
  Left = 0
  Top = 0
  Caption = #26032#22686#22823#26009
  ClientHeight = 134
  ClientWidth = 270
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 24
    Top = 5
    Width = 52
    Height = 13
    Caption = #22823#26009#23610#23544
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 136
    Top = 28
    Width = 7
    Height = 13
    Caption = 'X'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 24
    Top = 61
    Width = 52
    Height = 13
    Caption = #22823#26009#35268#26684
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object btnOK: TButton
    Left = 48
    Top = 101
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 0
    OnClick = btnOKClick
  end
  object edtW: TEdit
    Left = 56
    Top = 24
    Width = 67
    Height = 21
    TabOrder = 1
  end
  object edtH: TEdit
    Left = 160
    Top = 24
    Width = 67
    Height = 21
    TabOrder = 2
  end
  object btnCancel: TButton
    Left = 152
    Top = 101
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 3
    OnClick = btnCancelClick
  end
  object edtSize: TEdit
    Left = 82
    Top = 58
    Width = 145
    Height = 21
    TabOrder = 4
  end
end
