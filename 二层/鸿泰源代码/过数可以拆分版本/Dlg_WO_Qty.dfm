object frmDlg_WO_Qty: TfrmDlg_WO_Qty
  Left = 254
  Top = 195
  Width = 400
  Height = 312
  Caption = #20316#19994#21333#25968#37327
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
    Left = 71
    Top = 56
    Width = 119
    Height = 14
    Alignment = taRightJustify
    Caption = #21097#20313#25968#37327#65288'PCS'#65289#65306
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 71
    Top = 88
    Width = 119
    Height = 14
    Alignment = taRightJustify
    Caption = #21097#20313#25968#37327#65288'PNL'#65289#65306
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 71
    Top = 128
    Width = 119
    Height = 14
    Alignment = taRightJustify
    Caption = #29983#20135#25968#37327#65288'PCS'#65289#65306
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 71
    Top = 160
    Width = 119
    Height = 14
    Alignment = taRightJustify
    Caption = #29983#20135#25968#37327#65288'PNL'#65289#65306
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 120
    Top = 24
    Width = 70
    Height = 14
    Alignment = taRightJustify
    Caption = #29983#20135#21592#24037#65306
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object edtEmpCode: TEdit
    Left = 192
    Top = 17
    Width = 131
    Height = 24
    Color = clScrollBar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object edtRemainPCS: TEdit
    Left = 192
    Top = 49
    Width = 131
    Height = 24
    Color = clScrollBar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    Text = '0'
  end
  object edtRemainPNL: TEdit
    Left = 192
    Top = 81
    Width = 131
    Height = 24
    Color = clScrollBar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    Text = '0'
  end
  object edtPcs: TEdit
    Left = 192
    Top = 121
    Width = 131
    Height = 24
    Color = clScrollBar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    Text = '0'
  end
  object edtPNL: TEdit
    Left = 192
    Top = 153
    Width = 131
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Text = '0'
    OnChange = edtPNLChange
    OnKeyPress = edtPNLKeyPress
  end
  object BitBtn1: TBitBtn
    Left = 88
    Top = 224
    Width = 75
    Height = 28
    Caption = #30830#35748
    TabOrder = 5
    OnClick = BitBtn1Click
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 224
    Top = 224
    Width = 75
    Height = 28
    Cancel = True
    Caption = #21462#28040
    ModalResult = 7
    TabOrder = 6
    NumGlyphs = 2
  end
end
