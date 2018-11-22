object Form1: TForm1
  Left = 913
  Top = 144
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = #29366#24577#20449#24687
  ClientHeight = 81
  ClientWidth = 143
  Color = clBtnFace
  DefaultMonitor = dmDesktop
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 40
    Top = 12
    Width = 30
    Height = 12
    Alignment = taRightJustify
    Caption = #24635#35745':'
  end
  object Label2: TLabel
    Left = 28
    Top = 36
    Width = 42
    Height = 12
    Caption = #24050#22788#29702':'
  end
  object Label3: TLabel
    Left = 28
    Top = 60
    Width = 42
    Height = 12
    Caption = #26410#22788#29702':'
  end
  object edt_total: TEdit
    Left = 80
    Top = 8
    Width = 57
    Height = 20
    TabOrder = 0
  end
  object edt_done: TEdit
    Left = 80
    Top = 32
    Width = 57
    Height = 20
    TabOrder = 1
  end
  object edt_undo: TEdit
    Left = 80
    Top = 56
    Width = 57
    Height = 20
    TabOrder = 2
  end
  object Button1: TButton
    Left = 36
    Top = 96
    Width = 75
    Height = 25
    Caption = #30475#26126#32454
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 153
    Top = 11
    Width = 75
    Height = 25
    Caption = #21387
    TabOrder = 4
    Visible = False
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 152
    Top = 44
    Width = 75
    Height = 25
    Caption = #35299
    TabOrder = 5
    Visible = False
    OnClick = Button3Click
  end
  object tray: TRzTrayIcon
    Animate = True
    PopupMenu = pm
    RestoreOn = ticNone
    Left = 7
    Top = 3
  end
  object pm: TPopupMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    OnPopup = pmPopup
    Left = 8
    Top = 48
    object N1: TMenuItem
      Caption = #26174#31034#29366#24577
      Default = True
      Hint = #24403#21069#29256#26412':'
      OnClick = N1Click
    end
    object N2: TMenuItem
      AutoLineReduction = maAutomatic
      Caption = '-'
      GroupIndex = 1
    end
    object N3: TMenuItem
      Caption = #25163#21160#23450#20301#31243#24207'...'
      GroupIndex = 2
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #33258#21160#23450#20301#31243#24207
      GroupIndex = 2
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #36864#20986
      GroupIndex = 2
      OnClick = N5Click
    end
  end
  object stattmr: TTimer
    Interval = 5000
    OnTimer = stattmrTimer
    Left = 9
    Top = 85
  end
  object astmr: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = astmrTimer
    Left = 46
    Top = 84
  end
  object updtmr: TTimer
    Enabled = False
    Interval = 977
    OnTimer = updtmrTimer
    Left = 84
    Top = 85
  end
  object updqry: TADOQuery
    CommandTimeout = 5
    Parameters = <
      item
        Name = 'p1'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end
      item
        Name = 'p2'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'p3'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'p4'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'p5'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'p6'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'p7'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'p8'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'p9'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'p10'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'p11'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'p12'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'p13'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'p14'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'p15'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'p16'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'p17'
        Attributes = [paSigned]
        DataType = ftString
        Size = 32
        Value = Null
      end>
    SQL.Strings = (
      'insert into y1411 values'
      '(  :p1, :p2, :p3, :p4, :p5, :p6, :p7, :p8, :p9, :p10'
      '  , :p11, :p12, :p13, :p14, :p15, :p16, :p17, null'
      ')')
    Left = 117
    Top = 84
  end
end
