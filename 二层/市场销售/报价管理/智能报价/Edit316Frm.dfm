object frmEdit316: TfrmEdit316
  Left = 441
  Top = 218
  Width = 521
  Height = 468
  Caption = #22522#20215#31867#22411
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 389
    Width = 505
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btn1: TButton
      Left = 128
      Top = 8
      Width = 75
      Height = 25
      Caption = #20445#23384
      TabOrder = 0
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 296
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = btn2Click
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 389
    Align = alClient
    TabOrder = 1
    object lbl2: TLabel
      Left = 128
      Top = 47
      Width = 60
      Height = 13
      Caption = #22522#20215#31867#22411#65306
    end
    object lbl3: TLabel
      Left = 8
      Top = 87
      Width = 81
      Height = 13
      AutoSize = False
      Caption = #21462#20540#20844#24335#65306
    end
    object cbb1: TComboBox
      Left = 200
      Top = 40
      Width = 121
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        #21046#29256#36153
        #24037#31243#36153
        #27979#35797#36153
        #37329#25163#25351#36153
        #21152#24613#36153
        #33778#26519#36153
        #24037#31243#26631#20934#21152#25104#21333#20215
        #21152#24613#22825#25968
        #20132#36135#22825#25968
        #25240#25187#37329#39069)
    end
    object mmoCalcStr: TMemo
      Left = 1
      Top = 111
      Width = 503
      Height = 277
      Align = alBottom
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
end
