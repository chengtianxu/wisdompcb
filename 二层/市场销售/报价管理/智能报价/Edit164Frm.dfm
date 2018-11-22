object frmEdit164: TfrmEdit164
  Left = 384
  Top = 129
  Width = 719
  Height = 560
  Caption = #21152#20215#20844#24335
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
    Top = 480
    Width = 703
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btn1: TButton
      Left = 192
      Top = 8
      Width = 75
      Height = 25
      Caption = #20445#23384
      TabOrder = 0
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 440
      Top = 8
      Width = 75
      Height = 25
      Caption = #36864#20986
      TabOrder = 1
      OnClick = btn2Click
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 703
    Height = 480
    Align = alClient
    TabOrder = 1
    object lbl1: TLabel
      Left = 20
      Top = 39
      Width = 68
      Height = 13
      AutoSize = False
      Caption = #21152#20215#21517#31216#65306
    end
    object edtPtr: TEdit
      Left = 95
      Top = 35
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object pgc1: TPageControl
      Left = 1
      Top = 131
      Width = 701
      Height = 348
      ActivePage = ts1
      Align = alBottom
      TabOrder = 1
      object ts1: TTabSheet
        Caption = #29983#25928#26465#20214
        object mmoEnableStr: TMemo
          Left = 0
          Top = 0
          Width = 693
          Height = 320
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object ts2: TTabSheet
        Caption = #21046#29256#36153#20844#24335
        ImageIndex = 1
        object mmoValueStr: TMemo
          Left = 0
          Top = 0
          Width = 693
          Height = 320
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object ts3: TTabSheet
        Caption = #24037#31243#36153#20844#24335
        ImageIndex = 2
        object mmoValueStrEng: TMemo
          Left = 0
          Top = 0
          Width = 693
          Height = 320
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object ts4: TTabSheet
        Caption = #21512#21516#24635#20540#20844#24335
        ImageIndex = 3
        object mmoValueStrTotal: TMemo
          Left = 0
          Top = 0
          Width = 693
          Height = 320
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    object rgAddType: TRadioGroup
      Left = 224
      Top = 8
      Width = 153
      Height = 105
      ItemIndex = 0
      Items.Strings = (
        #21046#26495#36153#21333#20215#27604#20363#21152#25104
        #21046#26495#36153#21333#20215#37329#39069#21152#25104)
      TabOrder = 2
    end
    object rgAddTypeTotal: TRadioGroup
      Left = 544
      Top = 8
      Width = 145
      Height = 105
      Items.Strings = (
        #21512#21516#24635#20540#27604#20363#21152#25104
        #21512#21516#24635#20540#37329#39069#21152#25104)
      TabOrder = 3
    end
    object rgAddTypeEng: TRadioGroup
      Left = 384
      Top = 8
      Width = 145
      Height = 105
      Items.Strings = (
        #24037#31243#36153#27604#20363#21152#25104
        #24037#31243#36153#25968#20540#21152#25104)
      TabOrder = 4
    end
  end
end
