object Form9: TForm9
  Left = 229
  Top = 168
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25353#37319#36141#23450#21333#32622#20110#26242#32531
  ClientHeight = 447
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 75
    Top = 22
    Width = 61
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#23458#25143':'
  end
  object Label2: TLabel
    Left = 49
    Top = 49
    Width = 87
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#37319#36141#23450#21333':'
  end
  object Label3: TLabel
    Left = -19
    Top = 82
    Width = 119
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#21487#29992#30340#38144#21806#23450#21333
  end
  object Label4: TLabel
    Left = -16
    Top = 240
    Width = 80
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#32622#20110#26242#32531
  end
  object Label5: TLabel
    Left = 258
    Top = 21
    Width = 7
    Height = 13
  end
  object Lab_rkey10: TLabel
    Left = 448
    Top = 16
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object lab_rkey97: TLabel
    Left = 448
    Top = 48
    Width = 7
    Height = 13
    Visible = False
  end
  object Edit1: TEdit
    Left = 142
    Top = 18
    Width = 76
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    TabOrder = 1
    OnClick = Edit1Click
    OnExit = Edit1Exit
  end
  object Edit2: TEdit
    Left = 141
    Top = 44
    Width = 188
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    MaxLength = 25
    ParentFont = False
    TabOrder = 0
    OnClick = Edit2Click
    OnExit = Edit2Exit
  end
  object BitBtn1: TBitBtn
    Left = 224
    Top = 15
    Width = 25
    Height = 25
    TabOrder = 2
    OnClick = BitBtn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
      333333777777777F33333330B00000003333337F7777777F3333333000000000
      333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
      333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
      03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
      03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
      3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
      333333333377F7F33333333333330F03333333333337F7F33333333333330B03
      3333333333373733333333333333303333333333333373333333}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 336
    Top = 42
    Width = 25
    Height = 25
    TabOrder = 3
    OnClick = BitBtn2Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
      333333777777777F33333330B00000003333337F7777777F3333333000000000
      333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
      333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
      03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
      03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
      3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
      333333333377F7F33333333333330F03333333333337F7F33333333333330B03
      3333333333373733333333333333303333333333333373333333}
    NumGlyphs = 2
  end
  object StringGrid1: TStringGrid
    Left = 1
    Top = 100
    Width = 618
    Height = 125
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goRowSelect]
    PopupMenu = PopupMenu1
    ScrollBars = ssVertical
    TabOrder = 4
    OnDblClick = StringGrid1DblClick
    OnMouseDown = StringGrid1MouseDown
    ColWidths = (
      97
      252
      49
      87
      125)
  end
  object StringGrid2: TStringGrid
    Left = 1
    Top = 260
    Width = 618
    Height = 133
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goRowSelect]
    PopupMenu = PopupMenu2
    ScrollBars = ssVertical
    TabOrder = 5
    OnMouseDown = StringGrid2MouseDown
    ColWidths = (
      96
      252
      49
      87
      125)
  end
  object Button1: TButton
    Left = 217
    Top = 416
    Width = 75
    Height = 25
    Caption = #30830#23450
    Enabled = False
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 293
    Top = 416
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 7
    OnClick = Button2Click
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 528
    Top = 40
    object N1: TMenuItem
      Caption = #36873#25321
      OnClick = N1Click
    end
  end
  object PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 560
    Top = 40
    object N2: TMenuItem
      Caption = #21462#28040#36873#25321
      OnClick = N2Click
    end
  end
end
