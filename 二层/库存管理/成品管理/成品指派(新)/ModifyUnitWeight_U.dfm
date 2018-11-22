object FrmModifyUnitWeight: TFrmModifyUnitWeight
  Left = 531
  Top = 183
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20462#25913#21333#37325
  ClientHeight = 184
  ClientWidth = 246
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 200
    Top = 14
    Width = 23
    Height = 22
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
      333333777777777F33333330B00000003333337F7777777F3333333000000000
      333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
      333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
      03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
      03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
      3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
      333333333377F7F33333333333330F03333333333337F7F33333333333330B03
      3333333333373733333333333333303333333333333373333333}
    NumGlyphs = 2
    OnClick = SpeedButton1Click
  end
  object LbManuPartDesc: TLabel
    Left = 24
    Top = 46
    Width = 65
    Height = 13
    AutoSize = False
    Caption = #23458#25143#22411#21495':'
  end
  object lblOrigUnitWeight: TLabel
    Left = 24
    Top = 74
    Width = 65
    Height = 13
    AutoSize = False
    Caption = #21407#21333#37325'(g):'
  end
  object lblManuPartNumber: TLabel
    Left = 24
    Top = 18
    Width = 65
    Height = 13
    AutoSize = False
    Caption = #26412#21378#32534#21495':'
  end
  object lblNewUnitWeight: TLabel
    Left = 24
    Top = 101
    Width = 65
    Height = 13
    AutoSize = False
    Caption = #26032#21333#37325'(g):'
  end
  object edtManuPartNumber: TEdit
    Left = 90
    Top = 14
    Width = 111
    Height = 21
    TabOrder = 0
    OnExit = edtManuPartNumberExit
    OnKeyPress = edtManuPartNumberKeyPress
  end
  object Button1: TButton
    Left = 40
    Top = 142
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 138
    Top = 142
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 5
  end
  object edtManuPartDesc: TEdit
    Left = 90
    Top = 43
    Width = 133
    Height = 19
    Color = clScrollBar
    Ctl3D = False
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 1
  end
  object edtOrigUnitWeight: TEdit
    Left = 90
    Top = 71
    Width = 133
    Height = 19
    Color = clScrollBar
    Ctl3D = False
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 2
  end
  object edtNewUnitWeight: TEdit
    Left = 90
    Top = 96
    Width = 133
    Height = 21
    TabOrder = 3
    OnKeyPress = edtNewUnitWeightKeyPress
  end
end
