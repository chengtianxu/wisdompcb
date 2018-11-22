object Form3: TForm3
  Left = 245
  Top = 218
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26597#35810#26465#20214#23450#20041
  ClientHeight = 326
  ClientWidth = 640
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
  object Label17: TLabel
    Left = 26
    Top = 24
    Width = 78
    Height = 13
    Alignment = taRightJustify
    Caption = #25351#27966#36215#22987#26085#26399
  end
  object Label16: TLabel
    Left = 300
    Top = 24
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = #32456#27490#26085#26399
  end
  object Label1: TLabel
    Left = 21
    Top = 269
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #20837#20179#31867#22411':'
  end
  object label_rkey15: TLabel
    Left = 136
    Top = 304
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object label_rkey16: TLabel
    Left = 248
    Top = 302
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object GroupBox6: TGroupBox
    Left = 23
    Top = 60
    Width = 278
    Height = 178
    Caption = #25104#21697#20986#20179#27719#24635
    TabOrder = 0
    object Label18: TLabel
      Left = 101
      Top = 42
      Width = 52
      Height = 13
      Caption = #26412#21378#32534#21495
    end
    object Edit6: TEdit
      Left = 104
      Top = 72
      Width = 124
      Height = 21
      TabOrder = 0
      OnChange = Edit6Change
    end
    object ComboBox3: TComboBox
      Left = 104
      Top = 72
      Width = 126
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 5
      Text = #33258#21046
      Visible = False
      Items.Strings = (
        #33258#21046
        #22806#21457
        #21322#21046#31243)
    end
    object Button6: TButton
      Left = 107
      Top = 143
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 1
      OnClick = Button6Click
    end
    object BitBtn9: TBitBtn
      Left = 238
      Top = 70
      Width = 25
      Height = 25
      TabOrder = 2
      Visible = False
      OnClick = BitBtn9Click
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
    object ListBox6: TListBox
      Left = 10
      Top = 40
      Width = 81
      Height = 127
      ItemHeight = 13
      Items.Strings = (
        #26412#21378#32534#21495
        #23458#25143#22411#21495
        #20135#21697#31867#22411
        #23458#25143#20195#30721
        #24037#21378
        #20179#24211
        #21152#24037#24418#24335)
      TabOrder = 3
      OnClick = ListBox6Click
    end
    object StaticText7: TStaticText
      Left = 9
      Top = 23
      Width = 81
      Height = 17
      Alignment = taCenter
      AutoSize = False
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = #26465#20214#39033#30446
      Color = clGrayText
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 4
    end
  end
  object SGrid1: TStringGrid
    Left = 306
    Top = 81
    Width = 249
    Height = 158
    ColCount = 3
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    PopupMenu = PopupMenu1
    ScrollBars = ssVertical
    TabOrder = 1
    ColWidths = (
      76
      167
      250)
  end
  object StaticText2: TStaticText
    Left = 306
    Top = 64
    Width = 248
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BevelInner = bvLowered
    BevelOuter = bvNone
    Caption = #24050#23450#20041#30340#26465#20214
    Color = clGrayText
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindow
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 2
  end
  object DTPk1: TDateTimePicker
    Left = 108
    Top = 20
    Width = 97
    Height = 21
    Date = 37257.000000000000000000
    Time = 37257.000000000000000000
    TabOrder = 3
  end
  object DTPk2: TDateTimePicker
    Left = 356
    Top = 20
    Width = 93
    Height = 21
    Date = 37575.000000000000000000
    Time = 37575.000000000000000000
    TabOrder = 4
  end
  object dttm1: TDateTimePicker
    Left = 207
    Top = 20
    Width = 84
    Height = 21
    Date = 38976.000000000000000000
    Time = 38976.000000000000000000
    Kind = dtkTime
    TabOrder = 5
  end
  object dttm2: TDateTimePicker
    Left = 453
    Top = 20
    Width = 84
    Height = 21
    Date = 38976.999305555550000000
    Time = 38976.999305555550000000
    Kind = dtkTime
    TabOrder = 6
  end
  object RadioGroup4: TRadioGroup
    Left = 362
    Top = 253
    Width = 151
    Height = 39
    Caption = #25351#27966#31867#22411
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      #27491#24120
      #36864#36135
      #20840#37096)
    TabOrder = 7
  end
  object RGp3: TRadioGroup
    Left = 516
    Top = 245
    Width = 117
    Height = 72
    ItemIndex = 0
    Items.Strings = (
      #24050#35013#36816
      #26410#35013#36816
      #20840#37096)
    TabOrder = 8
  end
  object RadioGroup3: TRadioGroup
    Left = 208
    Top = 251
    Width = 150
    Height = 40
    Caption = #20135#21697#31867#21035
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      #37327#26495
      #26679#26495
      #20840#37096)
    TabOrder = 9
  end
  object ComboBox4: TComboBox
    Left = 82
    Top = 265
    Width = 117
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 10
    Text = #27491#24120#36807#25968#20837#20179
    Items.Strings = (
      #27491#24120#36807#25968#20837#20179
      #36864#36135#37325#26816#20837#20179
      #36820#20462#37325#26816#20837#20179
      #30452#25509#20837#20179
      #22996#22806#21152#24037#20837#20179
      #22996#22806#21152#24037#36864#36135#20837#20179
      #38144#21806#36864#36135#20837#20179
      #36716#25442#20837#20179
      #30424#28857#20837#20179
      #20840#37096)
  end
  object BitBtn1: TBitBtn
    Left = 561
    Top = 104
    Width = 70
    Height = 25
    Caption = #26597#25214
    Default = True
    TabOrder = 11
    OnClick = BitBtn1Click
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
  object BitBtn2: TBitBtn
    Left = 561
    Top = 143
    Width = 70
    Height = 25
    Caption = #37325#32622
    TabOrder = 12
    OnClick = BitBtn2Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
      33333333333F8888883F33330000324334222222443333388F3833333388F333
      000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
      F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
      223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
      3338888300003AAAAAAA33333333333888888833333333330000333333333333
      333333333333333333FFFFFF000033333333333344444433FFFF333333888888
      00003A444333333A22222438888F333338F3333800003A2243333333A2222438
      F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
      22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
      33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
      3333333333338888883333330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn3: TBitBtn
    Left = 561
    Top = 179
    Width = 70
    Height = 25
    Caption = #20851#38381
    ModalResult = 2
    TabOrder = 13
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
  object AQ52: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT TOP 100 PERCENT dbo.Data0025.RKEY, dbo.Data0025.MANU_PART' +
        '_NUMBER,'
      '      dbo.Data0025.MANU_PART_DESC, dbo.Data0008.PRODUCT_NAME, '
      
        '      dbo.Data0010.ABBR_NAME, SUM(dbo.Data0052.QUAN_SHP) AS puto' +
        'ut_total, '
      
        '      ROUND(SUM(dbo.Data0052.QUAN_SHP * dbo.Data0025.unit_sq), 4' +
        ') AS mianqi, '
      
        '      ROUND(SUM(dbo.Data0052.QUAN_SHP * dbo.Data0025.REPORT_UNIT' +
        '_VALUE1 / 1000),'
      '       4) AS weight, '
      
        '      ROUND(SUM(Data0052.QUAN_SHP * Data0060.parts_alloc / Data0' +
        '060.EXCH_RATE),'
      '       4) AS amount'
      'FROM dbo.Data0010 INNER JOIN'
      '      dbo.Data0008 INNER JOIN'
      
        '      dbo.Data0025 ON dbo.Data0008.RKEY = dbo.Data0025.PROD_CODE' +
        '_PTR ON '
      '      dbo.Data0010.RKEY = dbo.Data0025.CUSTOMER_PTR INNER JOIN'
      '      dbo.Data0060 INNER JOIN'
      '      dbo.Data0052 INNER JOIN'
      
        '      dbo.Data0064 ON dbo.Data0052.SO_SHP_PTR = dbo.Data0064.RKE' +
        'Y INNER JOIN'
      
        '      dbo.Data0053 ON dbo.Data0052.DATA0053_PTR = dbo.Data0053.R' +
        'KEY ON '
      '      dbo.Data0060.RKEY = dbo.Data0064.SO_PTR ON '
      
        '      dbo.Data0025.RKEY = dbo.Data0053.CUST_PART_PTR LEFT OUTER ' +
        'JOIN'
      
        '      dbo.data0439 ON dbo.Data0064.packing_list_ptr = dbo.data04' +
        '39.rkey'
      'WHERE Data0052.QUAN_SHP > 0 AND'
      '      Data0064.date_assign >= :dtpk1 and'
      '      Data0064.date_assign <= :dtpk2'
      'GROUP BY dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.RKEY, '
      '      dbo.Data0025.MANU_PART_DESC, dbo.Data0008.PRODUCT_NAME, '
      '      dbo.Data0010.ABBR_NAME'
      'ORDER BY dbo.Data0025.MANU_PART_NUMBER ')
    Left = 544
    Top = 8
    object AQ52RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQ52MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object AQ52MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object AQ52PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object AQ52ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object AQ52putout_total: TFloatField
      FieldName = 'putout_total'
    end
    object AQ52mianqi: TFloatField
      FieldName = 'mianqi'
      ReadOnly = True
    end
    object AQ52weight: TFloatField
      FieldName = 'weight'
      ReadOnly = True
    end
    object AQ52amount: TFloatField
      FieldName = 'amount'
      ReadOnly = True
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 584
    Top = 72
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = N1Click
    end
  end
  object AQdate: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select convert(datetime,convert(varchar,getdate(),101),101)'
      ' as sys_datetime')
    Left = 576
    Top = 9
    object AQdatesys_datetime: TDateTimeField
      FieldName = 'sys_datetime'
      ReadOnly = True
    end
  end
end
