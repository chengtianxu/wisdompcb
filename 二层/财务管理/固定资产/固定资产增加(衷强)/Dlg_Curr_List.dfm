object frmDlg_Curr_List: TfrmDlg_Curr_List
  Left = 264
  Top = 223
  Width = 421
  Height = 218
  Caption = #21407#20540#24405#20837
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 32
    Width = 59
    Height = 13
    Caption = #21407#24065#24065#21035':'
  end
  object Label2: TLabel
    Left = 24
    Top = 72
    Width = 54
    Height = 13
    Caption = #27719'   '#29575':'
  end
  object Label3: TLabel
    Left = 208
    Top = 32
    Width = 59
    Height = 13
    Caption = #21407#24065#37329#39069':'
  end
  object Label4: TLabel
    Left = 208
    Top = 72
    Width = 59
    Height = 13
    Caption = #26412#24065#37329#39069':'
  end
  object comboxCurr: TComboBox
    Left = 88
    Top = 24
    Width = 97
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    OnChange = comboxCurrChange
    OnKeyPress = comboxCurrKeyPress
  end
  object Button1: TButton
    Left = 96
    Top = 136
    Width = 75
    Height = 25
    Caption = #30830#23450'(&Y)'
    ModalResult = 1
    TabOrder = 4
  end
  object Button2: TButton
    Left = 232
    Top = 136
    Width = 75
    Height = 25
    Caption = #21462#28040'(&C)'
    ModalResult = 2
    TabOrder = 5
  end
  object edtExchRate: TEdit
    Left = 88
    Top = 64
    Width = 97
    Height = 21
    TabOrder = 2
    OnChange = edtExchRateChange
    OnKeyPress = edtOrgValueKeyPress
  end
  object edtOrgValue: TEdit
    Left = 272
    Top = 24
    Width = 105
    Height = 21
    TabOrder = 1
    OnChange = edtExchRateChange
    OnKeyPress = edtOrgValueKeyPress
  end
  object edtValue: TEdit
    Left = 272
    Top = 64
    Width = 105
    Height = 21
    Color = clScrollBar
    TabOrder = 3
  end
end
