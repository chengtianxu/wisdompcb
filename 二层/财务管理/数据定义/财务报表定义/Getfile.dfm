object FrmGetfile: TFrmGetfile
  Left = 347
  Top = 183
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #36873#21462#25991#20214
  ClientHeight = 333
  ClientWidth = 388
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 107
    Top = 11
    Width = 65
    Height = 13
    Caption = #20250#35745#24180#24230#65306
  end
  object BitBtn1: TBitBtn
    Left = 224
    Top = 296
    Width = 75
    Height = 25
    TabOrder = 0
    Kind = bkCancel
  end
  object BitBtn2: TBitBtn
    Left = 80
    Top = 296
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object FileListBox1: TFileListBox
    Left = 20
    Top = 37
    Width = 344
    Height = 249
    ExtendedSelect = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    Mask = '*.XLS'
    ParentFont = False
    TabOrder = 2
    OnDblClick = FileListBox1DblClick
  end
  object SpinEdit1: TSpinEdit
    Left = 168
    Top = 8
    Width = 65
    Height = 22
    MaxValue = 2100
    MinValue = 1900
    ReadOnly = True
    TabOrder = 3
    Value = 1900
  end
end
