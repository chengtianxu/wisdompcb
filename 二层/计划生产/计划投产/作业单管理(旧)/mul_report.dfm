object Form_mulreport: TForm_mulreport
  Left = 244
  Top = 142
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #36830#32493#25171#21360#20316#19994#21333
  ClientHeight = 473
  ClientWidth = 574
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
    Left = 5
    Top = 13
    Width = 130
    Height = 13
    Alignment = taRightJustify
    Caption = #36873#25321#38656#35201#25171#21360#30340#20316#19994#21333
  end
  object Label2: TLabel
    Left = 344
    Top = 12
    Width = 104
    Height = 13
    Alignment = taRightJustify
    Caption = #23558#35201#25171#21360#30340#20316#19994#21333
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 49
    Width = 246
    Height = 384
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    ScrollBars = ssVertical
    TabOrder = 9
    Visible = False
    OnDblClick = Button1Click
    ColWidths = (
      125
      92
      44
      40
      64)
  end
  object StG1: TStringGrid
    Left = 0
    Top = 33
    Width = 258
    Height = 384
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    ScrollBars = ssVertical
    TabOrder = 0
    OnDblClick = Button1Click
    ColWidths = (
      161
      75
      44
      40
      64)
  end
  object StG2: TStringGrid
    Left = 317
    Top = 33
    Width = 258
    Height = 384
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    ScrollBars = ssVertical
    TabOrder = 1
    OnDblClick = Button3Click
    ColWidths = (
      165
      74
      9
      12
      64)
  end
  object Button1: TButton
    Left = 262
    Top = 118
    Width = 52
    Height = 37
    Hint = #21333#20010#36873#20013
    Caption = '------'#12297
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 262
    Top = 155
    Width = 52
    Height = 37
    Hint = #20840#37096#36873#20013
    Caption = '--'#12297#12297
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 262
    Top = 192
    Width = 52
    Height = 37
    Hint = #21333#20010#21462#28040
    Caption = #12296'------'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 262
    Top = 229
    Width = 52
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
  object CheckBox1: TCheckBox
    Left = 40
    Top = 432
    Width = 100
    Height = 17
    Caption = #25171#21360#23618#21387#32467#26500
    TabOrder = 8
  end
  object CheckBox2: TCheckBox
    Left = 40
    Top = 453
    Width = 100
    Height = 17
    Caption = #25171#21360#38459#25239#34920
    TabOrder = 10
  end
end
