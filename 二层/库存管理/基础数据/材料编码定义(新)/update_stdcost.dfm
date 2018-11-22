object Form5: TForm5
  Left = 279
  Top = 195
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #26356#26032#21407#26448#26009#26631#20934#25104#26412
  ClientHeight = 340
  ClientWidth = 507
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 216
    Top = 150
    Width = 269
    Height = 106
    Shape = bsFrame
  end
  object Bevel1: TBevel
    Left = 22
    Top = 150
    Width = 185
    Height = 106
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 256
    Top = 70
    Width = 48
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #30446#30340#22320
  end
  object Label4: TLabel
    Left = 37
    Top = 145
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = #26085#26399#33539#22260
  end
  object Label2: TLabel
    Left = 48
    Top = 171
    Width = 13
    Height = 13
    Caption = #20174
  end
  object Label3: TLabel
    Left = 48
    Top = 215
    Width = 13
    Height = 13
    Caption = #21040
  end
  object Label5: TLabel
    Left = 224
    Top = 170
    Width = 38
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #36215#22987':'
  end
  object Label6: TLabel
    Left = 224
    Top = 213
    Width = 38
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #32467#26463':'
  end
  object Label7: TLabel
    Left = 227
    Top = 145
    Width = 73
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = #21407#26448#26009#33539#22260
    ParentBiDiMode = False
  end
  object Label8: TLabel
    Left = 274
    Top = 193
    Width = 7
    Height = 13
  end
  object Label9: TLabel
    Left = 275
    Top = 233
    Width = 7
    Height = 13
  end
  object Label10: TLabel
    Left = 251
    Top = 43
    Width = 59
    Height = 13
    Caption = #20215#26684#26469#28304':'
  end
  object RadioGroup1: TRadioGroup
    Left = 22
    Top = 33
    Width = 184
    Height = 105
    Caption = #35745#20215#26041#24335
    ItemIndex = 1
    Items.Strings = (
      #26368#26032#20215#26684
      #21152#26435#24179#22343)
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 312
    Top = 67
    Width = 121
    Height = 21
    TabStop = False
    Color = cl3DLight
    TabOrder = 1
    Text = #21407#26448#26009#26631#20934#25104#26412
  end
  object DTpk1: TDateTimePicker
    Left = 73
    Top = 168
    Width = 110
    Height = 21
    Date = 37597.433484490700000000
    Time = 37597.433484490700000000
    TabOrder = 2
  end
  object DTpk2: TDateTimePicker
    Left = 73
    Top = 211
    Width = 110
    Height = 21
    Date = 37597.433551597200000000
    Time = 37597.433551597200000000
    TabOrder = 3
  end
  object Edit2: TEdit
    Left = 270
    Top = 167
    Width = 157
    Height = 21
    ReadOnly = True
    TabOrder = 4
  end
  object Edit3: TEdit
    Left = 270
    Top = 209
    Width = 157
    Height = 21
    ReadOnly = True
    TabOrder = 5
  end
  object BitBtn1: TBitBtn
    Left = 434
    Top = 165
    Width = 25
    Height = 25
    TabOrder = 6
    TabStop = False
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
    Left = 433
    Top = 207
    Width = 25
    Height = 25
    TabOrder = 7
    TabStop = False
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
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 324
    Width = 507
    Height = 16
    Align = alBottom
    TabOrder = 8
  end
  object ComboBox1: TComboBox
    Left = 312
    Top = 40
    Width = 121
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 9
    Text = #20837#24211#20215#26684
    Items.Strings = (
      #20837#24211#20215#26684
      #21457#26009#20215#26684)
  end
  object BitBtn3: TBitBtn
    Left = 264
    Top = 280
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 10
    Kind = bkCancel
  end
  object BitBtn4: TBitBtn
    Left = 160
    Top = 280
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    TabOrder = 11
    OnClick = Button1Click
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
  object ado17: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'begin'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 25
        Value = Null
      end
      item
        Name = 'end'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 25
        Value = Null
      end>
    SQL.Strings = (
      'select rkey,STOCK_UNIT_PTR,STD_COST from data0017'
      'where inv_part_number>=:begin and'
      '      inv_part_number<=:end '
      'order by rkey')
    Left = 24
    Top = 288
    object ado17rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ado17STOCK_UNIT_PTR: TIntegerField
      FieldName = 'STOCK_UNIT_PTR'
    end
    object ado17STD_COST: TFloatField
      FieldName = 'STD_COST'
    end
  end
  object ado22: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'begin_dt'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'end_dt'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT dbo.Data0022.INVENTORY_PTR, dbo.Data0022.LOCATION_PTR_FRO' +
        'M,'
      '      MAX(CONVERT(char(10), dbo.Data0456.ship_DATE, 101)'
      
        '      + '#39' '#39' + STR(dbo.Data0022.PRICE, 15, 8) + '#39','#39' + STR(dbo.Dat' +
        'a0456.exch_rate, 11, 8))'
      '      AS Expr1'
      'FROM dbo.Data0022 INNER JOIN'
      '     dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY'
      'where data0456.ship_date>=:begin_dt and'
      '      data0456.ship_date<=:end_dt and Data0022.PRICE<>0'
      'GROUP BY Data0022.INVENTORY_PTR,Data0022.LOCATION_PTR_FROM')
    Left = 57
    Top = 288
    object ado22INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ado22LOCATION_PTR_FROM: TIntegerField
      FieldName = 'LOCATION_PTR_FROM'
    end
    object ado22Expr1: TStringField
      FieldName = 'Expr1'
      Size = 38
    end
  end
  object adoavl22: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'begin_dt'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'end_dt'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'SELECT TOP 100 PERCENT dbo.Data0022.INVENTORY_PTR,'
      '      dbo.Data0022.LOCATION_PTR_FROM,'
      
        '      SUM(dbo.Data0022.QUANTITY * dbo.Data0022.PRICE * dbo.Data0' +
        '456.exch_rate)'
      '      / SUM(dbo.Data0022.QUANTITY) AS AVG01'
      'FROM dbo.Data0022 INNER JOIN'
      '      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY'
      'where'
      '  data0022.quantity>0 and'
      '  data0456.ship_date>=:begin_dt and'
      '  data0456.ship_date<=:end_dt  and Data0022.PRICE<>0'
      
        'GROUP BY dbo.Data0022.INVENTORY_PTR, dbo.Data0022.LOCATION_PTR_F' +
        'ROM'
      
        'ORDER BY dbo.Data0022.INVENTORY_PTR, dbo.Data0022.LOCATION_PTR_F' +
        'ROM')
    Left = 86
    Top = 288
    object adoavl22INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object adoavl22LOCATION_PTR_FROM: TIntegerField
      FieldName = 'LOCATION_PTR_FROM'
    end
    object adoavl22AVG01: TFloatField
      FieldName = 'AVG01'
      ReadOnly = True
    end
  end
  object ado207: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'begin_dt'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'end_dt'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT dbo.Data0207.INVENTORY_PTR, dbo.Data0022.LOCATION_PTR_FRO' +
        'M, '
      '      MAX(CONVERT(char(10), dbo.Data0457.CREATE_DATE, 101)'
      
        '      + '#39' '#39' + STR(dbo.Data0022.PRICE, 15, 8) + '#39','#39' + STR(dbo.Dat' +
        'a0456.exch_rate, 11, 8))'
      '      AS Expr1'
      'FROM dbo.Data0207 INNER JOIN'
      
        '      dbo.Data0457 ON dbo.Data0207.GON_PTR = dbo.Data0457.RKEY I' +
        'NNER JOIN'
      
        '      dbo.Data0022 ON dbo.Data0207.D0022_PTR = dbo.Data0022.RKEY' +
        ' INNER JOIN'
      '      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY'
      'where data0457.CREATE_DATE>=:begin_dt and'
      '      data0457.CREATE_DATE<=:end_dt and Data0022.PRICE<>0'
      
        'GROUP BY dbo.Data0207.INVENTORY_PTR, dbo.Data0022.LOCATION_PTR_F' +
        'ROM')
    Left = 57
    Top = 259
    object ado207INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ado207LOCATION_PTR_FROM: TIntegerField
      FieldName = 'LOCATION_PTR_FROM'
    end
    object ado207Expr1: TStringField
      FieldName = 'Expr1'
      Size = 38
    end
  end
  object ADOavl207: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'begin_dt'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'end_dt'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'SELECT TOP 100 PERCENT dbo.Data0207.INVENTORY_PTR,'
      '      dbo.Data0022.LOCATION_PTR_FROM,'
      
        '      SUM(dbo.Data0207.QUANTITY * dbo.Data0022.PRICE * dbo.Data0' +
        '456.exch_rate)'
      '      / SUM(dbo.Data0207.QUANTITY) AS AVG01'
      'FROM dbo.Data0207 INNER JOIN'
      
        '      dbo.Data0457 ON dbo.Data0207.GON_PTR = dbo.Data0457.RKEY I' +
        'NNER JOIN'
      
        '      dbo.Data0022 ON dbo.Data0207.D0022_PTR = dbo.Data0022.RKEY' +
        ' INNER JOIN'
      '      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY'
      'where'
      '  Data0207.QUANTITY > 0 and'
      '  data0457.CREATE_DATE >= :begin_dt and'
      '  data0457.CREATE_DATE <= :end_dt and Data0022.PRICE<>0'
      
        'GROUP BY dbo.Data0207.INVENTORY_PTR, dbo.Data0022.LOCATION_PTR_F' +
        'ROM'
      
        'ORDER BY dbo.Data0207.INVENTORY_PTR, dbo.Data0022.LOCATION_PTR_F' +
        'ROM')
    Left = 86
    Top = 259
    object ADOavl207INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ADOavl207LOCATION_PTR_FROM: TIntegerField
      FieldName = 'LOCATION_PTR_FROM'
    end
    object ADOavl207AVG01: TBCDField
      FieldName = 'AVG01'
      ReadOnly = True
      Precision = 32
      Size = 13
    end
  end
end
