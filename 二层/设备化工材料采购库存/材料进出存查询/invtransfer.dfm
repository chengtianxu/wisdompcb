object Form5: TForm5
  Left = 434
  Top = 216
  Width = 802
  Height = 510
  Caption = #26448#26009#36716#31227#26597#35810
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 786
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 13
      Top = 5
      Width = 57
      Height = 30
      Cursor = crHandPoint
      Hint = #36864#20986
      Caption = #36864#20986
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
    object BitBtn4: TBitBtn
      Left = 71
      Top = 5
      Width = 57
      Height = 30
      Hint = #23548#20986#25968#25454'Excel'
      Caption = #23548#20986
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BitBtn4Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
        EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
        DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
        70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 786
    Height = 431
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Title.Alignment = taCenter
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_DESCRIPTION'
        Title.Alignment = taCenter
        Width = 163
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_NAME'
        Title.Alignment = taCenter
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Title.Alignment = taCenter
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        Title.Alignment = taCenter
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_CODE'
        Title.Alignment = taCenter
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = #19981#21547#31246#20215
        Title.Alignment = taCenter
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26412#24065#19981#21547#31246#37329#39069
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26412#24065#21547#31246#37329#39069
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21407#24065#21547#31246#37329#39069
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Title.Alignment = taCenter
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TDATE'
        Title.Alignment = taCenter
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'form_ware'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'from_location'
        Title.Alignment = taCenter
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'to_ware'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'to_location'
        Title.Alignment = taCenter
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BARCODE_ID'
        Title.Alignment = taCenter
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODE'
        Title.Alignment = taCenter
        Title.Caption = #20379#24212#21830#20195#30721
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUPPLIER_NAME'
        Title.Alignment = taCenter
        Title.Caption = #20379#24212#21830#21517#31216
        Width = 230
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ado27
    Left = 232
    Top = 360
  end
  object ado27: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT TOP 100 PERCENT Data0005.EMPLOYEE_NAME, Data0022.BARCODE_' +
        'ID, '
      '      Data0017.INV_PART_NUMBER, Data0017.INV_PART_DESCRIPTION, '
      '      Data0017.INV_NAME, Data0015.WAREHOUSE_CODE AS form_ware, '
      
        '      Data0016.LOCATION AS from_location, Data0002.UNIT_NAME, Da' +
        'ta0027.TDATE, '
      '      Data0027.QUANTITY, Data0015_1.WAREHOUSE_CODE AS to_ware, '
      
        '      Data0016_1.LOCATION AS to_location, Data0023.SUPPLIER_NAME' +
        ', '
      '      Data0023.CODE,'
      '      Data0001.CURR_CODE,Data0022.TAX_2,'
      '      Data0022.tax_PRICE,Data0022.PRICE as '#19981#21547#31246#20215','
      'ROUND(Data0027.QUANTITY * Data0022.tax_PRICE, 2) AS '#21407#24065#21547#31246#37329#39069','
      
        'ROUND(Data0027.QUANTITY * Data0022.tax_PRICE * Data0456.exch_rat' +
        'e, 2)  AS '#26412#24065#21547#31246#37329#39069','
      
        'ROUND(Data0027.QUANTITY * Data0022.tax_PRICE * Data0456.exch_rat' +
        'e/'
      '      (1+Data0022.TAX_2*0.01), 2) AS '#26412#24065#19981#21547#31246#37329#39069
      '    '
      'FROM Data0002 INNER JOIN'
      '      Data0022 INNER JOIN'
      
        '      Data0027 ON Data0022.RKEY = Data0027.D0022_fromPTR INNER J' +
        'OIN'
      
        '      Data0022 Data0022_1 ON Data0027.d0022_toptr = Data0022_1.R' +
        'KEY INNER JOIN'
      '      Data0005 ON Data0027.EMPL_PTR = Data0005.RKEY INNER JOIN'
      '      Data0016 ON Data0022.LOCATION_PTR = Data0016.RKEY ON '
      '      Data0002.RKEY = Data0022.LOCATION_PTR_FROM INNER JOIN'
      
        '      Data0017 ON Data0022.INVENTORY_PTR = Data0017.RKEY INNER J' +
        'OIN'
      '      Data0016 Data0016_1 ON '
      '      Data0022_1.LOCATION_PTR = Data0016_1.RKEY INNER JOIN'
      '      Data0456 ON Data0022_1.GRN_PTR = Data0456.RKEY INNER JOIN'
      
        '      Data0015 Data0015_1 ON Data0456.warehouse_ptr = Data0015_1' +
        '.RKEY INNER JOIN'
      
        '      Data0456 Data0456_1 ON Data0022.GRN_PTR = Data0456_1.RKEY ' +
        'INNER JOIN'
      
        '      Data0015 ON Data0456_1.warehouse_ptr = Data0015.RKEY INNER' +
        ' JOIN'
      '      Data0023 ON Data0456_1.SUPP_PTR = Data0023.RKEY INNER JOIN'
      '      dbo.Data0001 ON '
      '      dbo.Data0456.currency_ptr = dbo.Data0001.RKEY'
      'WHERE (Data0027.QUANTITY <> 0)'
      'ORDER BY Data0027.TDATE')
    Left = 288
    Top = 360
    object ado27INV_PART_NUMBER: TStringField
      DisplayLabel = #29289#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 100
    end
    object ado27INV_PART_DESCRIPTION: TStringField
      DisplayLabel = #29289#26009#35268#26684
      DisplayWidth = 20
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ado27INV_NAME: TStringField
      DisplayLabel = #29289#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ado27UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ado27QUANTITY: TFloatField
      DisplayLabel = #35843#25320#25968#37327
      FieldName = 'QUANTITY'
    end
    object ado27form_ware: TStringField
      DisplayLabel = #36716#20986#24037#21378
      FieldName = 'form_ware'
      Size = 5
    end
    object ado27EMPLOYEE_NAME: TStringField
      DisplayLabel = #35843#25320#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ado27TDATE: TDateTimeField
      DisplayLabel = #35843#25320#26085#26399
      FieldName = 'TDATE'
    end
    object ado27from_location: TStringField
      DisplayLabel = #36716#20986#20179#24211
      FieldName = 'from_location'
      Size = 30
    end
    object ado27to_ware: TStringField
      DisplayLabel = #36716#20837#24037#21378
      FieldName = 'to_ware'
      Size = 5
    end
    object ado27to_location: TStringField
      DisplayLabel = #36716#20837#20179#24211
      FieldName = 'to_location'
      Size = 30
    end
    object ado27BARCODE_ID: TStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 50
      FieldName = 'BARCODE_ID'
      Size = 50
    end
    object ado27SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object ado27CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object ado27CURR_CODE: TStringField
      DisplayLabel = #24065#31181
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ado27TAX_2: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ado27tax_PRICE: TBCDField
      DisplayLabel = #21547#31246#20215
      FieldName = 'tax_PRICE'
      Precision = 12
      Size = 3
    end
    object ado27DSDesigner: TBCDField
      FieldName = #19981#21547#31246#20215
      Precision = 15
      Size = 6
    end
    object ado27DSDesigner2: TFloatField
      FieldName = #21407#24065#21547#31246#37329#39069
      ReadOnly = True
    end
    object ado27DSDesigner3: TFloatField
      FieldName = #26412#24065#21547#31246#37329#39069
      ReadOnly = True
    end
    object ado27DSDesigner4: TFloatField
      FieldName = #26412#24065#19981#21547#31246#37329#39069
      ReadOnly = True
    end
  end
end
