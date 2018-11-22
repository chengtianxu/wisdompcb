object Frm_detail: TFrm_detail
  Left = 297
  Top = 186
  BorderStyle = bsDialog
  Caption = #35831#36141#23457#26680
  ClientHeight = 466
  ClientWidth = 766
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 41
    Width = 67
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #35831#36141#32534#21495':'
  end
  object Label2: TLabel
    Left = 42
    Top = 69
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #24037#21378':'
  end
  object Label3: TLabel
    Left = 454
    Top = 96
    Width = 66
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '   '#39044#31639#20195#30721':'
  end
  object Label4: TLabel
    Left = 8
    Top = 96
    Width = 67
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #23457#25209#20195#30721':'
  end
  object Label8: TLabel
    Left = 448
    Top = 67
    Width = 67
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #35831#36141#37096#38376':'
  end
  object Label14: TLabel
    Left = 224
    Top = 43
    Width = 67
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #35831#36141#26085#26399':'
  end
  object Label19: TLabel
    Left = 445
    Top = 41
    Width = 67
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #39044#31639#24180#24230':'
  end
  object Label20: TLabel
    Left = 573
    Top = 41
    Width = 46
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #39044#31639#26376#20221':'
  end
  object Label5: TLabel
    Left = 152
    Top = 70
    Width = 7
    Height = 13
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 152
    Top = 94
    Width = 7
    Height = 13
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 7
    Top = 120
    Width = 67
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #20351#29992#20154#21592':'
  end
  object Label9: TLabel
    Left = 144
    Top = 120
    Width = 91
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #20351#29992#20154#21592#30005#35805':'
  end
  object Grd3: TDBGridEh
    Left = 0
    Top = 140
    Width = 766
    Height = 327
    DataSource = DM.DS3
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 12
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'DESCRIPTION_1'
        Footers = <>
        Title.Alignment = taCenter
        Width = 104
      end
      item
        EditButtons = <>
        FieldName = 'GUI_GE'
        Footers = <>
        Title.Alignment = taCenter
        Width = 125
      end
      item
        EditButtons = <>
        FieldName = 'DESCRIPTION_2'
        Footers = <>
        Title.Alignment = taCenter
        Width = 55
      end
      item
        EditButtons = <>
        FieldName = 'UNIT_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Width = 56
      end
      item
        EditButtons = <>
        FieldName = 'QUANTITY_REQUIRED'
        Footers = <>
        Title.Alignment = taCenter
      end
      item
        EditButtons = <>
        FieldName = 'REQ_DATE'
        Footers = <>
        Title.Alignment = taCenter
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'reason'
        Footers = <>
        Title.Alignment = taCenter
        Width = 192
      end
      item
        EditButtons = <>
        FieldName = 'reply_date'
        Footers = <>
        Title.Alignment = taCenter
        Width = 54
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 766
    Height = 33
    Align = alTop
    TabOrder = 0
    object BitBtn9: TBitBtn
      Left = 6
      Top = 3
      Width = 59
      Height = 28
      Cursor = crHandPoint
      Hint = #20851#38381
      Caption = #20851#38381
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn9Click
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        0400000000007800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
        FFFFFFFF00FFFFFFFFFFFFF030FFFFFFFFFFFF0330FFFFFFFFFF003330000000
        0FFFF03330FF0FFFFFFFF03300FF0FFFF4FFF03330FF0FFF44FFF03330FF0FF4
        4444F03330FF0F444444F03330FF0FF44444F0330FFF0FFF44FFF030FFFF0FFF
        F4FFF00FFFFF0FFFFFFFF00000000FFFFFFF}
    end
    object BitBtn2: TBitBtn
      Left = 64
      Top = 3
      Width = 59
      Height = 28
      Cursor = crHandPoint
      Hint = #35760#20107#26412
      Caption = #35760#20107
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = False
      OnClick = BitBtn2Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555500000000
        0555555F7777777775F55500FFFFFFFFF0555577F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FFFFFFFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FF777FFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FF7F777FF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FF77F7FFF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FFFFFFFFF05557F7FF5F5F5F57F550F00F0F0F0F
        005557F77F7F7F7F77555055070707070555575F7F7F7F7F7F55550507070707
        0555557575757575755555505050505055555557575757575555}
      NumGlyphs = 2
    end
    object BitBtn3: TBitBtn
      Left = 124
      Top = 3
      Width = 59
      Height = 28
      Cursor = crHandPoint
      Caption = #25209#20934
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      TabStop = False
      OnClick = BitBtn3Click
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777700007777777777777777777700007777700777777777777700007777
        0990777777777777000077709999077777777777000077799999907777777777
        00007709999999077777777700007799999999907777777700007799997B9999
        07777777000077999977B99990777777000077B999777B99990777770000777B
        997777B99990777700007777BB77777B999907770000777777777777B9999077
        00007777777777777B999977000077777777777777B999770000777777777777
        777B997700007777777777777777777700007777777777777777777700007777
        77777777777777770000}
    end
    object BitBtn1: TBitBtn
      Left = 184
      Top = 3
      Width = 59
      Height = 28
      Cursor = crHandPoint
      Caption = #36864#37319
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      TabStop = False
      OnClick = BitBtn1Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777744447777777777444444447777777444777744
        4777777447777774477777447777777744777744777777774477774477777777
        4477774477777777447777744777747447777774477774444777777777777444
        7777777777777444477777777777777777777777777777777777}
    end
  end
  object MEdtReqNo: TMaskEdit
    Left = 82
    Top = 38
    Width = 120
    Height = 21
    TabStop = False
    MaxLength = 15
    ReadOnly = True
    TabOrder = 3
  end
  object EdtFac: TEdit
    Left = 82
    Top = 65
    Width = 60
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
  end
  object EdtAud: TEdit
    Left = 82
    Top = 93
    Width = 60
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    ReadOnly = True
    TabOrder = 8
  end
  object EdtBug: TEdit
    Left = 523
    Top = 91
    Width = 56
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
  end
  object SpYear: TSpinEdit
    Left = 516
    Top = 37
    Width = 52
    Height = 22
    Enabled = False
    MaxLength = 4
    MaxValue = 2050
    MinValue = 2000
    TabOrder = 1
    Value = 2000
  end
  object SpMonth: TSpinEdit
    Left = 623
    Top = 37
    Width = 41
    Height = 22
    Enabled = False
    MaxValue = 12
    MinValue = 1
    TabOrder = 2
    Value = 1
  end
  object DpReqDate: TDateTimePicker
    Left = 296
    Top = 39
    Width = 105
    Height = 21
    Date = 0.446967291667533600
    Time = 0.446967291667533600
    Checked = False
    TabOrder = 4
  end
  object Grd2: TDBGridEh
    Left = 0
    Top = 139
    Width = 766
    Height = 327
    DataSource = DM.DS2
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 11
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDrawColumnCell = Grd2DrawColumnCell
    Columns = <
      item
        EditButtons = <>
        FieldName = 'inv_part_number'
        Footers = <>
        Title.Alignment = taCenter
        Width = 140
      end
      item
        EditButtons = <>
        FieldName = 'inv_name'
        Footers = <>
        Title.Alignment = taCenter
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'inv_description'
        Footers = <>
        Title.Alignment = taCenter
        Width = 150
      end
      item
        EditButtons = <>
        FieldName = 'unit_name'
        Footers = <>
        Title.Alignment = taCenter
        Width = 53
      end
      item
        EditButtons = <>
        FieldName = 'QUANTITY'
        Footers = <>
        Title.Alignment = taCenter
        Width = 58
      end
      item
        EditButtons = <>
        FieldName = 'CurrStQty'
        Footers = <>
        Title.Alignment = taCenter
        Width = 59
      end
      item
        EditButtons = <>
        FieldName = 'qty_zaitu'
        Footers = <>
        Width = 56
      end
      item
        EditButtons = <>
        FieldName = 'REQ_DATE'
        Footers = <>
        Title.Alignment = taCenter
        Width = 63
      end
      item
        EditButtons = <>
        FieldName = 'reason'
        Footers = <>
        Title.Alignment = taCenter
        Width = 97
      end
      item
        EditButtons = <>
        FieldName = 'extra_req'
        Footers = <>
        Title.Alignment = taCenter
        Width = 61
      end
      item
        EditButtons = <>
        FieldName = 'reply_date'
        Footers = <>
        Title.Alignment = taCenter
        Width = 67
      end>
  end
  object EdtDept: TEdit
    Left = 520
    Top = 64
    Width = 63
    Height = 21
    Color = clScrollBar
    Enabled = False
    TabOrder = 5
  end
  object EdtUser: TEdit
    Left = 81
    Top = 117
    Width = 60
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    ReadOnly = True
    TabOrder = 9
  end
  object EdtPhone: TEdit
    Left = 234
    Top = 117
    Width = 111
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    ReadOnly = True
    TabOrder = 10
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 424
    object N5: TMenuItem
      Tag = 3
      Caption = #26816#26597
      OnClick = N1Click
    end
  end
end
