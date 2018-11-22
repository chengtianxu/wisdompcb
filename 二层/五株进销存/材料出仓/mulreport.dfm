object Form_mulreport: TForm_mulreport
  Left = 374
  Top = 98
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #36830#32493#25171#21360#20986#20179#21333
  ClientHeight = 476
  ClientWidth = 381
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 24
    Width = 156
    Height = 13
    Caption = #36873#25321#20320#35201#25171#21360#30340#20986#20179#21333#32534#21495
  end
  object Label2: TLabel
    Left = 240
    Top = 24
    Width = 130
    Height = 13
    Caption = #23558#35201#25171#21360#30340#20986#20179#21333#32534#21495
  end
  object StG1: TStringGrid
    Left = 8
    Top = 41
    Width = 137
    Height = 392
    ColCount = 2
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    ScrollBars = ssVertical
    TabOrder = 0
    ColWidths = (
      130
      64)
  end
  object StG2: TStringGrid
    Left = 232
    Top = 41
    Width = 137
    Height = 392
    ColCount = 2
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    ScrollBars = ssVertical
    TabOrder = 1
    ColWidths = (
      128
      64)
  end
  object Button1: TButton
    Left = 152
    Top = 134
    Width = 75
    Height = 37
    Hint = #21333#20010#36873#20013
    Caption = '------'#12297
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 152
    Top = 171
    Width = 75
    Height = 37
    Hint = #20840#37096#36873#20013
    Caption = '--'#12297#12297
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 152
    Top = 208
    Width = 75
    Height = 37
    Hint = #21333#20010#21462#28040
    Caption = #12296'------'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 152
    Top = 245
    Width = 75
    Height = 37
    Hint = #20840#37096#21462#28040
    Caption = #12296#12296'--'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 82
    Top = 445
    Width = 75
    Height = 25
    Caption = #25171#21360
    TabOrder = 6
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 234
    Top = 445
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 7
  end
end
