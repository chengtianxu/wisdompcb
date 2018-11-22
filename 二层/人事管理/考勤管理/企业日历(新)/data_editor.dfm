object dataedt: Tdataedt
  Left = 156
  Top = 183
  Width = 316
  Height = 250
  Caption = 'dataedt'
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 8
    Width = 52
    Height = 13
    Caption = #20551#26085#31867#22411
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 192
    Top = 8
    Width = 52
    Height = 13
    Caption = #26631#35782#39068#33394
  end
  object Label3: TLabel
    Left = 40
    Top = 64
    Width = 26
    Height = 13
    Caption = #22791#27880
  end
  object clrbox: TColorBox
    Left = 183
    Top = 24
    Width = 96
    Height = 22
    Style = [cbStandardColors]
    ItemHeight = 16
    TabOrder = 0
  end
  object doqry: TButton
    Left = 72
    Top = 176
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = doqryClick
  end
  object restname: TEdit
    Left = 31
    Top = 24
    Width = 120
    Height = 21
    TabOrder = 2
  end
  object remark: TMemo
    Left = 32
    Top = 80
    Width = 249
    Height = 89
    TabOrder = 3
  end
  object Button1: TButton
    Left = 184
    Top = 176
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object showresult: TButton
    Left = 16
    Top = 176
    Width = 41
    Height = 25
    TabOrder = 5
    Visible = False
  end
end
