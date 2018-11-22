object frmBOMBaoJiaDeptEditMGroup: TfrmBOMBaoJiaDeptEditMGroup
  Left = 0
  Top = 0
  Caption = #26448#26009#31867#22411
  ClientHeight = 445
  ClientWidth = 724
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 724
    Height = 32
    Align = alTop
    TabOrder = 0
    object btn3: TRzButton
      Left = 76
      Top = 1
      Height = 30
      Align = alLeft
      Caption = #21462#28040
      TabOrder = 0
      OnClick = btn3Click
    end
    object btn2: TRzButton
      Left = 1
      Top = 1
      Height = 30
      Align = alLeft
      Caption = #20445#23384
      TabOrder = 1
      OnClick = btn2Click
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 32
    Width = 724
    Height = 41
    Align = alTop
    TabOrder = 1
    object btn1: TSpeedButton
      Left = 282
      Top = 5
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = btn1Click
    end
    object lbl1: TRzLabel
      Left = 25
      Top = 14
      Width = 60
      Height = 13
      Caption = #26448#26009#31867#22411#65306
    end
    object edt1: TRzEdit
      Left = 91
      Top = 6
      Width = 185
      Height = 21
      Text = ''
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 0
    end
  end
  object pgc1: TPageControl
    Left = 0
    Top = 73
    Width = 724
    Height = 372
    ActivePage = ts1
    Align = alClient
    TabOrder = 2
    object ts1: TTabSheet
      Caption = #28040#32791#20844#24335
      object lbl2: TRzLabel
        Left = 0
        Top = 0
        Width = 716
        Height = 13
        Align = alTop
        Caption = #27599'PCS'#28040#32791#35745#31639#20844#24335#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 125
      end
      object mmoUseCalc: TRzMemo
        Left = 0
        Top = 13
        Width = 716
        Height = 331
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #40657#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object ts2: TTabSheet
      Caption = #26448#26009#20215#26684
      ImageIndex = 1
      object lbl3: TRzLabel
        Left = 0
        Top = 0
        Width = 716
        Height = 13
        Align = alTop
        Caption = #26448#26009#20215#26684#35745#31639#20844#24335#65288'M.P'#34920#31034#37319#36141#30340#20215#26684#65289
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 241
      end
      object mmoMPCalc: TRzMemo
        Left = 0
        Top = 13
        Width = 716
        Height = 331
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #40657#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
  end
end
