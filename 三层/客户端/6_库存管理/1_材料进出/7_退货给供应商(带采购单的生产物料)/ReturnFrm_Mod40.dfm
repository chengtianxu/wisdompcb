inherited FrmReturn_Mod40: TFrmReturn_Mod40
  BorderStyle = bsSingle
  Caption = #36864#36135#32473#20379#24212#21830
  ClientHeight = 252
  ClientWidth = 390
  Font.Height = -13
  Font.Name = #23435#20307
  OnClose = FormClose
  ExplicitWidth = 396
  ExplicitHeight = 284
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl1: TPanel
    Width = 390
    ExplicitWidth = 390
    inherited btnSave: TBitBtn
      OnClick = btnSaveClick
    end
    inherited btnClose: TBitBtn
      OnClick = btnCloseClick
    end
  end
  inherited pnl2: TPanel
    Width = 390
    Height = 222
    ExplicitWidth = 390
    ExplicitHeight = 222
    object Label1: TLabel
      Left = 91
      Top = 24
      Width = 59
      Height = 13
      Caption = #22312#24211#25968#37327':'
    end
    object Label2: TLabel
      Left = 91
      Top = 56
      Width = 59
      Height = 13
      Caption = #36864#36135#25968#37327':'
    end
    object Label3: TLabel
      Left = 91
      Top = 89
      Width = 59
      Height = 13
      Caption = #25298#25910#20195#30721':'
    end
    object Label4: TLabel
      Left = 91
      Top = 120
      Width = 85
      Height = 13
      Caption = #25298#25910#22791#27880#20449#24687':'
    end
    object edtTHSL: TEdit
      Left = 160
      Top = 53
      Width = 121
      Height = 21
      TabOrder = 0
      Text = '0.00'
      OnExit = edtTHSLExit
      OnKeyPress = edtTHSLKeyPress
    end
    object Memo1: TMemo
      Left = 91
      Top = 139
      Width = 190
      Height = 76
      TabOrder = 1
    end
    object edtZKSL: TEdit
      Left = 160
      Top = 21
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object RzButtonEdit1: TRzButtonEdit
      Left = 160
      Top = 86
      Width = 121
      Height = 21
      Text = ''
      TabOrder = 3
      OnKeyPress = RzButtonEdit1KeyPress
      ButtonKind = bkFind
      AltBtnWidth = 15
      ButtonWidth = 15
      OnButtonClick = RzButtonEdit1ButtonClick
    end
  end
  object cds17: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 40
  end
  object cds22: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 88
  end
  object cds96: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 136
  end
  object cds209: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 328
    Top = 80
  end
  object cds235: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 328
    Top = 128
  end
end
