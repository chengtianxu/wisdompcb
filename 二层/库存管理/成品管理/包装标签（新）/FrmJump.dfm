object frmJmp: TfrmJmp
  Left = 477
  Top = 304
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmJmp'
  ClientHeight = 340
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl2: TLabel
    Left = 80
    Top = 24
    Width = 69
    Height = 13
    AutoSize = False
    Caption = #26412#21378#32534#21495#65306
  end
  object lbl4: TLabel
    Left = 80
    Top = 67
    Width = 69
    Height = 13
    AutoSize = False
    Caption = #38144#21806#35746#21333#65306
  end
  object btnBCBH: TSpeedButton
    Left = 271
    Top = 20
    Width = 23
    Height = 22
    Caption = #26597
    OnClick = btnBCBHClick
  end
  object btnXSDD: TSpeedButton
    Left = 271
    Top = 64
    Width = 23
    Height = 22
    Caption = #26597
    OnClick = btnXSDDClick
  end
  object lblDDS: TLabel
    Left = 298
    Top = 30
    Width = 50
    Height = 13
    AutoSize = False
    Caption = '0'
  end
  object lbl24: TLabel
    Left = 298
    Top = 65
    Width = 50
    Height = 13
    AutoSize = False
    Caption = #24050#25171#21360#65306
  end
  object lblYDY: TLabel
    Left = 298
    Top = 80
    Width = 50
    Height = 13
    AutoSize = False
    Caption = '0'
  end
  object lbl26: TLabel
    Left = 298
    Top = 16
    Width = 50
    Height = 13
    AutoSize = False
    Caption = #35746#21333#25968#65306
  end
  object lbl1: TLabel
    Left = 8
    Top = 120
    Width = 80
    Height = 15
    Caption = #26412#21378#23458#25143#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 8
    Top = 208
    Width = 80
    Height = 15
    Caption = #20851#32852#23458#25143#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl5: TLabel
    Left = 88
    Top = 120
    Width = 9
    Height = 15
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl6: TLabel
    Left = 88
    Top = 208
    Width = 9
    Height = 15
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl7: TLabel
    Left = 8
    Top = 152
    Width = 80
    Height = 15
    Caption = #23458#25143#20195#30721#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl8: TLabel
    Left = 90
    Top = 152
    Width = 9
    Height = 15
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl9: TLabel
    Left = 8
    Top = 237
    Width = 80
    Height = 15
    Caption = #23458#25143#20195#30721#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl10: TLabel
    Left = 89
    Top = 236
    Width = 9
    Height = 15
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOK: TButton
    Left = 176
    Top = 288
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 0
    OnClick = btnOKClick
  end
  object edtBCBH: TEdit
    Left = 148
    Top = 22
    Width = 121
    Height = 21
    TabOrder = 1
    OnExit = edtBCBHExit
  end
  object edtXSDD: TEdit
    Left = 148
    Top = 65
    Width = 121
    Height = 21
    TabStop = False
    Color = clMoneyGreen
    ReadOnly = True
    TabOrder = 2
    OnExit = edtXSDDExit
  end
end
