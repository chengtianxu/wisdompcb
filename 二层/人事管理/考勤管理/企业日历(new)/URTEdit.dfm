object frmRTEdit: TfrmRTEdit
  Left = 477
  Top = 194
  Width = 346
  Height = 286
  Caption = #20551#26085#31867#21035#20462#25913
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 13
    Top = 32
    Width = 60
    Height = 13
    Caption = #20551#26085#31867#22411#65306
  end
  object Label2: TLabel
    Left = 37
    Top = 67
    Width = 36
    Height = 13
    Caption = #39068#33394#65306
  end
  object Label3: TLabel
    Left = 37
    Top = 99
    Width = 36
    Height = 13
    Caption = #22791#27880#65306
  end
  object btn_Save: TButton
    Left = 85
    Top = 192
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 0
  end
  object btn_cancel: TButton
    Left = 181
    Top = 192
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 1
    OnClick = btn_cancelClick
  end
  object edt_HType: TEdit
    Left = 72
    Top = 27
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object edt_Color: TEdit
    Left = 71
    Top = 63
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object edt_remark: TEdit
    Left = 71
    Top = 95
    Width = 186
    Height = 21
    TabOrder = 4
  end
  object qrytemp: TADOQuery
    Connection = DM.con1
    Parameters = <>
    Left = 296
    Top = 32
  end
  object qryFC: TADOQuery
    Connection = DM.con1
    Parameters = <>
    Left = 288
    Top = 112
  end
end
