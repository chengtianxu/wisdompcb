object Form_Genesis: TForm_Genesis
  Left = 397
  Top = 346
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20174'Genesis'#24037#31243#36335#24452#20013#35835#21462
  ClientHeight = 224
  ClientWidth = 630
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 51
    Top = 48
    Width = 67
    Height = 13
    Caption = 'PTH'#34917#20607#20540':'
  end
  object Label4: TLabel
    Left = 44
    Top = 72
    Width = 74
    Height = 13
    Caption = 'NPTH'#34917#20607#20540':'
  end
  object Label6: TLabel
    Left = 195
    Top = 48
    Width = 73
    Height = 13
    Caption = 'PTH'#34917#20607#22791#27880
  end
  object Label7: TLabel
    Left = 188
    Top = 72
    Width = 80
    Height = 13
    Caption = 'NPTH'#34917#20607#22791#27880
  end
  object Label1: TLabel
    Left = 56
    Top = 20
    Width = 59
    Height = 13
    Caption = #26412#21378#32534#21495':'
  end
  object Label2: TLabel
    Left = 58
    Top = 107
    Width = 59
    Height = 13
    Caption = #36335#24452#25991#20214':'
  end
  object pth: TComboBox
    Left = 120
    Top = 44
    Width = 57
    Height = 21
    ItemHeight = 13
    ItemIndex = 1
    TabOrder = 0
    Text = '0.10'
    Items.Strings = (
      '0.05'
      '0.10'
      '0.15'
      '0.20'
      '0.25')
  end
  object npth: TComboBox
    Left = 120
    Top = 68
    Width = 57
    Height = 21
    ItemHeight = 13
    ItemIndex = 1
    TabOrder = 1
    Text = '0.05'
    Items.Strings = (
      '0.00'
      '0.05'
      '0.10'
      '0.15')
  end
  object bzpth: TComboBox
    Left = 275
    Top = 44
    Width = 81
    Height = 21
    ItemHeight = 13
    ItemIndex = 1
    TabOrder = 2
    Text = '+/-0.08'
    Items.Strings = (
      '+/-0.0762'
      '+/-0.08')
  end
  object bznpth: TComboBox
    Left = 275
    Top = 68
    Width = 81
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 3
    Text = '+/-0.05'
    Items.Strings = (
      '+/-0.05'
      '+/-0.10'
      '+0.1/-0'
      '+0.1/-0.05')
  end
  object isvia: TCheckBox
    Left = 373
    Top = 72
    Width = 90
    Height = 17
    Caption = #36807#23380#19981#34917#20607
    TabOrder = 4
  end
  object jobname: TEdit
    Left = 120
    Top = 18
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object filepath: TEdit
    Left = 120
    Top = 104
    Width = 401
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 6
  end
  object Button1: TButton
    Left = 528
    Top = 100
    Width = 97
    Height = 25
    Caption = #35835#20986#25991#20214#36335#24452
    TabOrder = 7
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 224
    Top = 160
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 8
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 312
    Top = 160
    Width = 75
    Height = 25
    Cancel = True
    Caption = #20851#38381
    ModalResult = 2
    TabOrder = 9
  end
  object ziped: TCheckBox
    Left = 373
    Top = 46
    Width = 90
    Height = 17
    Caption = #25991#20214#24050#21387#32553
    Enabled = False
    TabOrder = 10
  end
end
