object Form2: TForm2
  Left = 619
  Top = 230
  BorderStyle = bsDialog
  Caption = #24037#31243#22791#27880#20449#24687#24211
  ClientHeight = 312
  ClientWidth = 290
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object DBEdit1: TDBEdit
    Left = 0
    Top = 8
    Width = 281
    Height = 21
    DataField = 'INST_CODE'
    DataSource = Form1.DataSource2
    TabOrder = 0
  end
  object DBMemo1: TDBMemo
    Left = 0
    Top = 32
    Width = 281
    Height = 233
    DataField = 'PROD_ROUT_INST'
    DataSource = Form1.DataSource2
    TabOrder = 1
  end
  object Button1: TButton
    Left = 40
    Top = 272
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 136
    Top = 272
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 3
    OnClick = Button2Click
  end
end
