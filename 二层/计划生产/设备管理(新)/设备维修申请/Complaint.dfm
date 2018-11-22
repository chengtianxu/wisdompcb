object frm_Complaint: Tfrm_Complaint
  Left = 442
  Top = 421
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #25237#35785
  ClientHeight = 205
  ClientWidth = 372
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 117
    Height = 13
    Caption = #35831#36755#20837#35201#25237#35785#30340#20869#23481
  end
  object Memo1: TMemo
    Left = 9
    Top = 28
    Width = 353
    Height = 137
    TabOrder = 0
    OnKeyPress = Memo1KeyPress
  end
  object Button1: TButton
    Left = 104
    Top = 176
    Width = 75
    Height = 25
    Caption = #30830#35748
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 200
    Top = 176
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
end
