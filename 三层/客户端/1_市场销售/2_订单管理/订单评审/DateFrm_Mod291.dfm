inherited frmDate_Mod291: TfrmDate_Mod291
  BorderIcons = [biSystemMenu]
  Caption = #23436#24037#35745#21010
  ClientHeight = 155
  ClientWidth = 270
  ExplicitWidth = 286
  ExplicitHeight = 193
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 32
    Width = 60
    Height = 13
    Caption = #23436#24037#26085#26399#65306
  end
  object Label2: TLabel
    Left = 32
    Top = 64
    Width = 76
    Height = 13
    Caption = #23436#24037#25968#37327'pcs'#65306
  end
  object dtpDate: TDateTimePicker
    Left = 121
    Top = 32
    Width = 101
    Height = 21
    Date = 43073.423070486110000000
    Time = 43073.423070486110000000
    TabOrder = 0
  end
  object edtQty: TEdit
    Left = 121
    Top = 59
    Width = 101
    Height = 21
    TabOrder = 1
    Text = '0'
    OnKeyPress = edtQtyKeyPress
  end
  object btnOK: TBitBtn
    Left = 48
    Top = 104
    Width = 75
    Height = 35
    Caption = #30830#35748
    TabOrder = 2
    OnClick = btnOKClick
  end
  object btnCancel: TBitBtn
    Left = 147
    Top = 104
    Width = 75
    Height = 35
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
end
