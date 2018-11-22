object frmDlg_WO_Split: TfrmDlg_WO_Split
  Left = 262
  Top = 148
  BorderStyle = bsDialog
  Caption = #20316#19994#21333#25286#20998#35774#32622
  ClientHeight = 416
  ClientWidth = 427
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 10
    Top = 304
    Width = 104
    Height = 13
    Caption = #20316#19994#21333#25286#20998#22791#27880#65306
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 1
    Width = 401
    Height = 297
    TabOrder = 0
    object Label1: TLabel
      Left = 56
      Top = 63
      Width = 59
      Height = 13
      Caption = #20316#19994#21333#21495':'
    end
    object Label2: TLabel
      Left = 35
      Top = 87
      Width = 80
      Height = 13
      Caption = #22312#32447#25968#37327'PCS:'
    end
    object Label3: TLabel
      Left = 35
      Top = 111
      Width = 80
      Height = 13
      Caption = #22312#32447#25968#37327'PNL:'
    end
    object Label4: TLabel
      Left = 30
      Top = 183
      Width = 85
      Height = 13
      Caption = #25286#20998#20316#19994#21333#21495':'
    end
    object Label5: TLabel
      Left = 35
      Top = 207
      Width = 80
      Height = 13
      Caption = #25286#20998#25968#37327'PCS:'
    end
    object Label6: TLabel
      Left = 35
      Top = 231
      Width = 80
      Height = 13
      Caption = #25286#20998#25968#37327'PNL:'
    end
    object labelPCS_PER_PNL: TLabel
      Left = 240
      Top = 84
      Width = 56
      Height = 13
      Caption = 'PCS/PNL:'
    end
    object Label8: TLabel
      Left = 30
      Top = 135
      Width = 85
      Height = 13
      Caption = #30003#35831#25253#24223#25968#37327':'
    end
    object Shape1: TShape
      Left = 32
      Top = 159
      Width = 313
      Height = 1
      Pen.Color = clRed
    end
    object Label9: TLabel
      Left = 29
      Top = 277
      Width = 91
      Height = 13
      Caption = #22312#32447#25286#20998#22791#27880#65306
    end
    object edtWoNo: TEdit
      Left = 128
      Top = 55
      Width = 201
      Height = 21
      Color = clInactiveBorder
      ReadOnly = True
      TabOrder = 1
    end
    object edtPCS: TEdit
      Left = 128
      Top = 79
      Width = 105
      Height = 21
      Color = clInactiveBorder
      ReadOnly = True
      TabOrder = 2
    end
    object edtPNL: TEdit
      Left = 128
      Top = 103
      Width = 201
      Height = 21
      Color = clInactiveBorder
      ReadOnly = True
      TabOrder = 3
    end
    object edtNewWONO: TEdit
      Left = 128
      Top = 175
      Width = 201
      Height = 21
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 5
    end
    object edtNewPCS: TEdit
      Left = 128
      Top = 199
      Width = 201
      Height = 21
      TabOrder = 6
      OnExit = edtNewPCSExit
      OnKeyPress = edtNewPCSKeyPress
    end
    object edtNewPNL: TEdit
      Left = 128
      Top = 223
      Width = 201
      Height = 21
      TabOrder = 7
      OnExit = edtNewPNLExit
      OnKeyPress = edtNewPCSKeyPress
    end
    object edtDiscardQty: TEdit
      Left = 128
      Top = 127
      Width = 201
      Height = 21
      Color = clInactiveBorder
      ReadOnly = True
      TabOrder = 4
    end
    object CheckBox1: TCheckBox
      Left = 36
      Top = 251
      Width = 213
      Height = 17
      Caption = #19981#26816#26597#25286#20998#21518'PNL/PCS'#36923#36753
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
    end
    object Edit1: TEdit
      Left = 128
      Top = 271
      Width = 201
      Height = 21
      TabOrder = 9
    end
    object rdgType: TRadioGroup
      Left = 29
      Top = 9
      Width = 324
      Height = 41
      Caption = #25286#20998#31867#22411
      Color = clBtnFace
      Columns = 3
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        #27491#24120#23614#25968#25286#20998
        #24453#36820#24037#25286#20998
        #24453#25253#24223#25286#20998)
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
  end
  object Button1: TButton
    Left = 98
    Top = 387
    Width = 75
    Height = 25
    Caption = #30830#23450'(&Y)'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 226
    Top = 387
    Width = 75
    Height = 25
    Caption = #21462#28040'(&C)'
    ModalResult = 2
    TabOrder = 3
  end
  object Memo1: TMemo
    Left = 8
    Top = 321
    Width = 401
    Height = 57
    TabOrder = 1
  end
end
