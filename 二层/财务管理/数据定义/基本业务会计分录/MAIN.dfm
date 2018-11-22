object frmmain: Tfrmmain
  Left = 266
  Top = 176
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22522#26412#19994#21153#20250#35745#20998#24405
  ClientHeight = 447
  ClientWidth = 382
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 0
    Top = 48
    Width = 383
    Height = 433
    ColCount = 2
    Ctl3D = True
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    ParentCtl3D = False
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnMouseDown = StringGrid1MouseDown
    ColWidths = (
      102
      270)
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 382
    Height = 41
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 14
      Top = 4
      Width = 59
      Height = 33
      Caption = #36864#20986
      TabOrder = 0
      Kind = bkClose
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from data0104')
    Left = 240
    Top = 256
  end
  object ADOConnection1: TADOConnection
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 280
    Top = 256
  end
  object PopupMenu1: TPopupMenu
    Left = 136
    Top = 144
    object N1: TMenuItem
      Caption = #35774#23450
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #26816#26597
      OnClick = N2Click
    end
  end
end
