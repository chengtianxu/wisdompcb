object frmBarComp: TfrmBarComp
  Left = 476
  Top = 350
  Width = 616
  Height = 303
  Caption = #26631#31614#23545#27604
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
  object lblQty: TLabel
    Left = 119
    Top = 137
    Width = 24
    Height = 13
    Caption = #25968#37327
  end
  object lblkhxh: TLabel
    Left = 119
    Top = 98
    Width = 48
    Height = 13
    Caption = #23458#25143#22411#21495
  end
  object lbl1: TLabel
    Left = 32
    Top = 13
    Width = 96
    Height = 13
    Caption = #26465#24418#30721#25195#25551#36755#20837#26639
  end
  object lbl2: TLabel
    Left = 78
    Top = 210
    Width = 66
    Height = 23
    Caption = '           '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblVer: TLabel
    Left = 120
    Top = 169
    Width = 24
    Height = 13
    Caption = #29256#26412
  end
  object edt1: TEdit
    Left = 134
    Top = 8
    Width = 387
    Height = 21
    TabOrder = 0
    OnKeyPress = edt1KeyPress
  end
  object mmo1: TMemo
    Left = 344
    Top = 48
    Width = 185
    Height = 177
    Enabled = False
    TabOrder = 1
  end
  object cbVPO: TCheckBox
    Left = 32
    Top = 60
    Width = 57
    Height = 17
    Caption = #35746#21333#21495#65306
    Checked = True
    State = cbChecked
    TabOrder = 2
  end
  object cbHWCode: TCheckBox
    Left = 32
    Top = 96
    Width = 73
    Height = 17
    Caption = #23458#25143#22411#21495#65306
    Checked = True
    State = cbChecked
    TabOrder = 3
  end
  object cbQty: TCheckBox
    Left = 32
    Top = 136
    Width = 65
    Height = 17
    Caption = #25968#37327#65306
    Checked = True
    State = cbChecked
    TabOrder = 4
  end
  object edtVPO: TEdit
    Left = 95
    Top = 58
    Width = 114
    Height = 21
    TabOrder = 5
  end
  object cbManualVPO: TCheckBox
    Left = 95
    Top = 35
    Width = 114
    Height = 17
    Caption = #25163#21160#36755#20837#35746#21333#21495
    TabOrder = 6
  end
  object cbxVer: TCheckBox
    Left = 32
    Top = 168
    Width = 64
    Height = 17
    Caption = #29256#26412
    Checked = True
    State = cbChecked
    TabOrder = 7
  end
  object btn1: TButton
    Left = 216
    Top = 128
    Width = 83
    Height = 25
    Caption = #26597#30475#21305#37197#35760#24405
    TabOrder = 8
    OnClick = btn1Click
  end
  object ads737: TADODataSet
    Connection = dm1.con1
    CommandText = 'select * from data0737 where 1=0'
    Parameters = <>
    Left = 224
    Top = 184
  end
end
