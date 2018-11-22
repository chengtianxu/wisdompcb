inherited frmPutOut_mod38: TfrmPutOut_mod38
  Caption = #26448#26009#21457#25918
  ClientHeight = 319
  ClientWidth = 435
  ExplicitWidth = 451
  ExplicitHeight = 357
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 435
    Height = 319
    Align = alClient
    TabOrder = 0
    object lbl1: TLabel
      Left = 120
      Top = 76
      Width = 76
      Height = 13
      Caption = #26377#25928#24211#23384#25968#37327':'
    end
    object lbl2: TLabel
      Left = 172
      Top = 106
      Width = 28
      Height = 13
      Caption = #21333#20301':'
    end
    object lbl3: TLabel
      Left = 120
      Top = 135
      Width = 81
      Height = 13
      Caption = #26412#27425#21457#25918#25968#37327':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl4: TLabel
      Left = 146
      Top = 161
      Width = 52
      Height = 13
      Caption = #37197#39069#25968#37327':'
      Visible = False
    end
    object lbl5: TLabel
      Left = 133
      Top = 189
      Width = 64
      Height = 13
      Caption = #24050#21457#25918#25968#37327':'
      Visible = False
    end
    object btn1: TBitBtn
      Left = 102
      Top = 229
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = btn1Click
    end
    object btnCancel: TBitBtn
      Left = 208
      Top = 229
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object edtQtyOnHnad: TEdit
      Left = 208
      Top = 72
      Width = 121
      Height = 21
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 2
    end
    object edtUnitName: TEdit
      Left = 208
      Top = 102
      Width = 65
      Height = 21
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 3
    end
    object edtThisQty: TEdit
      Left = 202
      Top = 129
      Width = 89
      Height = 21
      TabOrder = 4
      Text = '0.0000'
      OnKeyPress = edtThisQtyKeyPress
    end
    object edtBomQty: TEdit
      Left = 204
      Top = 157
      Width = 89
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 5
      Text = '0.00'
      Visible = False
    end
    object chkSended: TCheckBox
      Left = 319
      Top = 159
      Width = 82
      Height = 17
      Caption = #21457#25918#23436#27605
      TabOrder = 6
      Visible = False
    end
    object edtIssuedQty: TEdit
      Left = 203
      Top = 184
      Width = 89
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 7
      Text = '0.00'
      Visible = False
    end
  end
end
