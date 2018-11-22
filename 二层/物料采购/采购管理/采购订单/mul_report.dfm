object Form_mulreport: TForm_mulreport
  Left = 232
  Top = 159
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #36830#32493#25171#21360#25253#34920
  ClientHeight = 473
  ClientWidth = 574
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 2
    Top = 13
    Width = 123
    Height = 13
    Alignment = taRightJustify
    Caption = '        '#36873#25321#38656#35201#25171#21360#30340'PO'
  end
  object Label2: TLabel
    Left = 364
    Top = 12
    Width = 84
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#23558#35201#25171#21360#30340'PO'
  end
  object StG1: TStringGrid
    Left = 0
    Top = 33
    Width = 225
    Height = 384
    ColCount = 4
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    ScrollBars = ssVertical
    TabOrder = 0
    OnDblClick = Button1Click
    ColWidths = (
      130
      74
      44
      40)
  end
  object StG2: TStringGrid
    Left = 344
    Top = 33
    Width = 226
    Height = 384
    ColCount = 4
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    ScrollBars = ssVertical
    TabOrder = 1
    OnDblClick = Button3Click
    ColWidths = (
      128
      92
      44
      42)
  end
  object Button1: TButton
    Left = 248
    Top = 118
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
    Left = 248
    Top = 155
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
    Left = 248
    Top = 192
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
    Left = 248
    Top = 229
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
    Left = 202
    Top = 437
    Width = 75
    Height = 25
    Caption = #25171#21360
    TabOrder = 6
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 290
    Top = 437
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 7
  end
end
