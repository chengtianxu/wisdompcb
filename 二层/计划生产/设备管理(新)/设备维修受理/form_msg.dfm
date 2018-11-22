object frm_msg: Tfrm_msg
  Left = 552
  Top = 322
  BorderStyle = bsDialog
  Caption = #35810#38382
  ClientHeight = 90
  ClientWidth = 340
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label_Msg: TLabel
    Left = 32
    Top = 24
    Width = 52
    Height = 13
    Caption = 'Label_Msg'
  end
  object Button1: TButton
    Left = 32
    Top = 52
    Width = 75
    Height = 25
    Caption = '1'#29677
    ModalResult = 1
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 136
    Top = 52
    Width = 75
    Height = 25
    Caption = '2'#29677
    ModalResult = 1
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 236
    Top = 52
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 1
    TabOrder = 2
    OnClick = Button3Click
  end
end
