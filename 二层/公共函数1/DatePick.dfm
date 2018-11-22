object frmDatePick: TfrmDatePick
  Left = 258
  Top = 244
  BorderStyle = bsDialog
  Caption = #36873#25321#26085#26399
  ClientHeight = 194
  ClientWidth = 305
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object MonthCalendar1: TMonthCalendar
    Left = 0
    Top = 0
    Width = 305
    Height = 153
    Align = alClient
    AutoSize = True
    Date = 39142.688195891210000000
    TabOrder = 0
    WeekNumbers = True
    OnDblClick = MonthCalendar1DblClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 153
    Width = 305
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnSelect: TButton
      Left = 64
      Top = 8
      Width = 75
      Height = 25
      Caption = #36873#25321'(&S)'
      ModalResult = 1
      TabOrder = 0
    end
    object btnCancel: TButton
      Left = 160
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040'(&C)'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
