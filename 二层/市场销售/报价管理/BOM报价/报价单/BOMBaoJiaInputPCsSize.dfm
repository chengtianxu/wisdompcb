object frmBOMPaoJiainPutPCSSize: TfrmBOMPaoJiainPutPCSSize
  Left = 0
  Top = 0
  Caption = 'PCS'#23610#23544
  ClientHeight = 252
  ClientWidth = 296
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
  object lbl1: TRzLabel
    Left = 32
    Top = 42
    Width = 43
    Height = 13
    Caption = 'PCS'#38271#65306
  end
  object lbl2: TRzLabel
    Left = 166
    Top = 42
    Width = 43
    Height = 13
    Caption = 'PCS'#23485#65306
  end
  object lbl3: TRzLabel
    Left = 67
    Top = 113
    Width = 53
    Height = 13
    Caption = 'PCS/SET'#65306
  end
  object lbl4: TRzLabel
    Left = 197
    Top = 113
    Width = 12
    Height = 13
    Caption = #20010
  end
  object lbl5: TRzLabel
    Left = 126
    Top = 57
    Width = 16
    Height = 13
    Caption = 'mm'
  end
  object lbl6: TRzLabel
    Left = 263
    Top = 57
    Width = 16
    Height = 13
    Caption = 'mm'
  end
  object lbl7: TRzLabel
    Left = 32
    Top = 74
    Width = 42
    Height = 13
    Caption = 'SET'#38271#65306
  end
  object lbl8: TRzLabel
    Left = 166
    Top = 74
    Width = 42
    Height = 13
    Caption = 'SET'#23485#65306
  end
  object edt1: TRzEdit
    Left = 72
    Top = 39
    Width = 50
    Height = 21
    Text = ''
    TabOrder = 0
    OnKeyPress = edt1KeyPress
  end
  object btn1: TRzButton
    Left = 49
    Top = 176
    Caption = #30830#23450
    TabOrder = 1
    OnClick = btn1Click
  end
  object btn2: TRzButton
    Left = 168
    Top = 176
    Caption = #21462#28040
    TabOrder = 2
    OnClick = btn2Click
  end
  object edt2: TRzEdit
    Left = 208
    Top = 39
    Width = 50
    Height = 21
    Text = ''
    TabOrder = 3
  end
  object edtSetL: TRzEdit
    Left = 72
    Top = 69
    Width = 50
    Height = 21
    Text = ''
    TabOrder = 4
    OnKeyPress = edt1KeyPress
  end
  object edtSetW: TRzEdit
    Left = 208
    Top = 69
    Width = 50
    Height = 21
    Text = ''
    TabOrder = 5
  end
  object edtPcsPerSet: TEdit
    Left = 126
    Top = 110
    Width = 62
    Height = 21
    TabOrder = 6
  end
end
