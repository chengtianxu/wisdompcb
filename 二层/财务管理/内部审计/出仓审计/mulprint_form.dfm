object Form_mulprint: TForm_mulprint
  Left = 234
  Top = 136
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #36830#32493#25171#21360
  ClientHeight = 492
  ClientWidth = 568
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
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
    Left = -4
    Top = 13
    Width = 137
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#36873#25321#38656#35201#25171#21360#30340#20837#20179#21333
  end
  object Label2: TLabel
    Left = 343
    Top = 13
    Width = 104
    Height = 13
    Alignment = taRightJustify
    Caption = #23558#35201#25171#21360#30340#20837#24211#21333
  end
  object StG1: TStringGrid
    Left = 0
    Top = 41
    Width = 225
    Height = 384
    ColCount = 4
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    ScrollBars = ssVertical
    TabOrder = 0
    ColWidths = (
      130
      86
      44
      40)
  end
  object StG2: TStringGrid
    Left = 342
    Top = 41
    Width = 227
    Height = 384
    ColCount = 4
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    ScrollBars = ssVertical
    TabOrder = 1
    ColWidths = (
      109
      111
      44
      42)
  end
  object Button1: TButton
    Left = 245
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
    Left = 245
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
    Left = 245
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
    Left = 245
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
    Left = 194
    Top = 445
    Width = 77
    Height = 25
    Caption = #25171#21360
    TabOrder = 6
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 295
    Top = 444
    Width = 76
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 7
    OnClick = Button6Click
  end
end
