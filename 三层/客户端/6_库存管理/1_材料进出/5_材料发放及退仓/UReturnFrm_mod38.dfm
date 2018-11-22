inherited frmReturn_mod38: TfrmReturn_mod38
  Caption = #36864#20179#25805#20316
  ClientHeight = 243
  ClientWidth = 370
  ExplicitWidth = 386
  ExplicitHeight = 281
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 96
    Top = 27
    Width = 52
    Height = 13
    Caption = #21457#25918#25968#37327':'
  end
  object lbl2: TLabel
    Left = 122
    Top = 55
    Width = 28
    Height = 13
    Caption = #21333#20301':'
  end
  object lbl3: TLabel
    Left = 83
    Top = 82
    Width = 64
    Height = 13
    Caption = #21487#36864#22238#25968#37327':'
  end
  object lbl4: TLabel
    Left = 70
    Top = 110
    Width = 81
    Height = 13
    Caption = #26412#27425#36864#22238#25968#37327':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenuHighlight
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOk: TBitBtn
    Left = 128
    Top = 146
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 0
    OnClick = btnOkClick
  end
  object btnCancel: TBitBtn
    Left = 208
    Top = 146
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object edtIssueQty: TEdit
    Left = 160
    Top = 23
    Width = 121
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 2
  end
  object edtUnit: TEdit
    Left = 160
    Top = 51
    Width = 79
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 3
  end
  object edtReturnQty: TEdit
    Left = 160
    Top = 78
    Width = 121
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 4
  end
  object edtRReturnQty: TEdit
    Left = 160
    Top = 105
    Width = 121
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnKeyPress = edtRReturnQtyKeyPress
  end
end
