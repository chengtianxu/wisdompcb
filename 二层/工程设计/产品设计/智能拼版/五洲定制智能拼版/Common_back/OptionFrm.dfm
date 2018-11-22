object frmOption: TfrmOption
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = #40664#35748#35774#32622
  ClientHeight = 362
  ClientWidth = 326
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
  object cbxPnlRotate: TCheckBox
    Left = 90
    Top = 8
    Width = 65
    Height = 17
    Caption = 'Pnl'#24322#21521
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 39
    Width = 297
    Height = 106
    Caption = #23450#20301#23380
    TabOrder = 1
    object cbxbb: TCheckBox
      Left = 24
      Top = 32
      Width = 73
      Height = 17
      Caption = #38774#26631
      TabOrder = 0
    end
    object cbxXDK: TCheckBox
      Left = 24
      Top = 72
      Width = 73
      Height = 17
      Caption = #38144#38025#23380
      TabOrder = 1
    end
    object cbxPXGG: TCheckBox
      Left = 183
      Top = 32
      Width = 97
      Height = 17
      Caption = #21943#38177#25346#38057#23380
      TabOrder = 2
    end
    object cbxJDK: TCheckBox
      Left = 183
      Top = 72
      Width = 97
      Height = 17
      Caption = #26657#23545#23380
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 164
    Width = 307
    Height = 133
    Caption = #38459#25239
    TabOrder = 2
    object lbl35: TLabel
      Left = 92
      Top = 19
      Width = 63
      Height = 15
      Align = alCustom
      Caption = ' X 3mm'#65306
      Color = clWhite
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
    end
    object lbl36: TLabel
      Left = 92
      Top = 51
      Width = 63
      Height = 15
      Align = alCustom
      Caption = ' X 6mm'#65306
      Color = clWhite
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
    end
    object lbl37: TLabel
      Left = 211
      Top = 17
      Width = 31
      Height = 15
      Align = alCustom
      Caption = ' '#32452' '
      Color = clWhite
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
    end
    object lbl38: TLabel
      Left = 210
      Top = 50
      Width = 31
      Height = 15
      Align = alCustom
      Caption = ' '#32452' '
      Color = clWhite
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
    end
    object se3mm: TSpinEdit
      Left = 155
      Top = 15
      Width = 50
      Height = 22
      MaxValue = 999
      MinValue = 0
      TabOrder = 0
      Value = 0
    end
    object se6mm: TSpinEdit
      Left = 155
      Top = 47
      Width = 50
      Height = 22
      MaxValue = 999
      MinValue = 0
      TabOrder = 1
      Value = 0
    end
    object rgZKPos: TRadioGroup
      Left = 48
      Top = 79
      Width = 194
      Height = 46
      Caption = #20301#32622
      Color = clBtnFace
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #27700#24179#38459#25239
        #22402#30452#38459#25239)
      ParentBackground = False
      ParentColor = False
      TabOrder = 2
    end
    object edtZK3mmLength: TEdit
      Left = 53
      Top = 18
      Width = 40
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = '100'
      OnExit = edtZK3mmLengthExit
    end
    object edtZK6mmLength: TEdit
      Left = 53
      Top = 48
      Width = 40
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Text = '100'
      OnExit = edtZK3mmLengthExit
    end
  end
  object btnOK: TButton
    Left = 56
    Top = 320
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 3
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 176
    Top = 320
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 4
    OnClick = btnCancelClick
  end
  object cbxSetRotate: TCheckBox
    Left = 8
    Top = 8
    Width = 65
    Height = 17
    Caption = 'Set'#24322#21521
    TabOrder = 5
  end
  object cbxDoubleCut: TCheckBox
    Left = 161
    Top = 8
    Width = 62
    Height = 17
    Caption = 'AB'#21452#25340
    TabOrder = 6
  end
end
