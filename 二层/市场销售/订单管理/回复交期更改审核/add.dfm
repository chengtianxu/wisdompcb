object Frm_add: TFrm_add
  Left = 547
  Top = 308
  Width = 376
  Height = 143
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #23436#24037#35745#21010
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 88
    Top = 20
    Width = 65
    Height = 13
    Caption = #23436#24037#26085#26399#65306
  end
  object Label2: TLabel
    Left = 72
    Top = 50
    Width = 80
    Height = 13
    Caption = #23436#24037#25968#37327'PCS:'
  end
  object Button1: TButton
    Left = 96
    Top = 80
    Width = 75
    Height = 25
    Caption = #30830' '#23450
    TabOrder = 2
    OnClick = Button1Click
    OnEnter = Button1Enter
  end
  object Button2: TButton
    Left = 200
    Top = 80
    Width = 75
    Height = 25
    Caption = #21462' '#28040
    TabOrder = 3
    OnClick = Button2Click
  end
  object DBEdit2: TDBEdit
    Left = 160
    Top = 46
    Width = 121
    Height = 21
    DataField = 'quantity'
    DataSource = DM.DataSource2
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 160
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
  end
end
