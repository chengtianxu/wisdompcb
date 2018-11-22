object Frm_RecvDetail: TFrm_RecvDetail
  Left = 270
  Top = 208
  BorderStyle = bsDialog
  Caption = #38075#22068#22238#25910
  ClientHeight = 369
  ClientWidth = 591
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 77
    Top = 14
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = #26426#22120#20195#30721
  end
  object Label2: TLabel
    Left = 77
    Top = 42
    Width = 52
    Height = 13
    Caption = #38075#22068#20195#30721
  end
  object Label4: TLabel
    Left = 71
    Top = 96
    Width = 60
    Height = 19
    Caption = #26377#25928#25968
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 256
    Top = 43
    Width = 42
    Height = 13
    Caption = 'Label8'
  end
  object Label3: TLabel
    Left = 256
    Top = 16
    Width = 42
    Height = 13
    Caption = 'Label3'
  end
  object Label7: TLabel
    Left = 77
    Top = 66
    Width = 52
    Height = 13
    Caption = #30740#30952#27425#25968
  end
  object Label5: TLabel
    Left = 229
    Top = 100
    Width = 39
    Height = 13
    Caption = #21097#20313#25968
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 269
    Top = 66
    Width = 75
    Height = 15
    Caption = #24050#22238#25910#25968#37327
    Font.Charset = ANSI_CHARSET
    Font.Color = clFuchsia
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 133
    Top = 10
    Width = 121
    Height = 21
    Color = clScrollBar
    ReadOnly = True
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 133
    Top = 39
    Width = 121
    Height = 21
    Color = clScrollBar
    ReadOnly = True
    TabOrder = 2
  end
  object Edit4: TEdit
    Left = 133
    Top = 92
    Width = 92
    Height = 27
    Color = clScrollBar
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object Edit3: TEdit
    Left = 133
    Top = 63
    Width = 121
    Height = 21
    Color = clScrollBar
    ReadOnly = True
    TabOrder = 4
  end
  object SGrid: TStringGrid
    Left = 8
    Top = 126
    Width = 577
    Height = 201
    ColCount = 6
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goEditing, goTabs]
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnKeyPress = SGridKeyPress
    OnKeyUp = SGridKeyUp
    OnSelectCell = SGridSelectCell
    OnSetEditText = SGridSetEditText
    ColWidths = (
      64
      112
      71
      145
      7
      136)
  end
  object BitBtn2: TBitBtn
    Left = 184
    Top = 334
    Width = 76
    Height = 29
    Caption = #30830#23450
    TabOrder = 5
    OnClick = BitBtn2Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn1: TBitBtn
    Left = 328
    Top = 334
    Width = 76
    Height = 29
    Caption = #21462#28040
    TabOrder = 6
    Kind = bkCancel
  end
  object BtActNote: TButton
    Left = 163
    Top = 187
    Width = 25
    Height = 23
    Caption = '...'
    TabOrder = 7
    Visible = False
    OnClick = BtActNoteClick
  end
  object Edit5: TEdit
    Left = 271
    Top = 96
    Width = 81
    Height = 21
    Color = clScrollBar
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 8
  end
  object Button1: TButton
    Left = 360
    Top = 96
    Width = 89
    Height = 25
    Caption = #20840#37096#21040#24453#30740#30952
    TabOrder = 9
    OnClick = Button1Click
  end
  object Edit6: TEdit
    Left = 345
    Top = 63
    Width = 104
    Height = 21
    Color = clScrollBar
    ReadOnly = True
    TabOrder = 10
  end
  object Edit7: TEdit
    Left = 453
    Top = 63
    Width = 113
    Height = 21
    Color = clScrollBar
    ReadOnly = True
    TabOrder = 11
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 496
    Top = 256
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = N1Click
    end
  end
end
