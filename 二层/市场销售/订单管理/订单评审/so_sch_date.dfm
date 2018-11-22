object Form5: TForm5
  Left = 344
  Top = 293
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23436#25104#35745#21010
  ClientHeight = 123
  ClientWidth = 348
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 51
    Width = 73
    Height = 13
    Alignment = taRightJustify
    Caption = #23436#24037#25968#37327'pcs'
  end
  object Label2: TLabel
    Left = 63
    Top = 19
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #23436#24037#26085#26399':'
  end
  object Button1: TButton
    Left = 101
    Top = 90
    Width = 75
    Height = 25
    Caption = #20445#23384
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 180
    Top = 90
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
  object DBEdit1: TDBEdit
    Left = 128
    Top = 16
    Width = 121
    Height = 21
    DataField = 'sch_date'
    DataSource = DM.DataSource9
    TabOrder = 3
  end
  object DBEdit2: TDBEdit
    Left = 128
    Top = 48
    Width = 121
    Height = 21
    DataField = 'quantity'
    DataSource = DM.DataSource9
    TabOrder = 0
    OnKeyDown = DBEdit2KeyDown
  end
end
