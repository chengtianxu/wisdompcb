object Form4: TForm4
  Left = 236
  Top = 112
  Width = 1015
  Height = 557
  Caption = #26448#26009#24211#23384#27719#24635
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 43
    Width = 1007
    Height = 480
    Hint = #20302#20110#23433#20840#24211#23384#20026#32418#33394
    Align = alClient
    DataSource = DataSource1
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'inv_group_name'
        Title.Caption = #26448#26009#32452#21035
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Title.Caption = #26448#26009#32534#30721
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_NAME'
        Title.Caption = #26448#26009#21517#31216
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Title.Caption = #26448#26009#35268#26684
        Width = 182
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GROUP_NAME'
        Title.Caption = #26448#26009#31867#21035
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME23'
        Title.Caption = #20379#24212#21830
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'supplier2'
        Title.Caption = #21407#21046#36896#21830
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quan_total'
        Title.Alignment = taRightJustify
        Title.Caption = #24211#23384#25968#37327
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'avl_price'
        ReadOnly = False
        Title.Alignment = taRightJustify
        Title.Caption = #24179#22343#20215#26684
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'amount'
        Title.Alignment = taRightJustify
        Title.Caption = #37329#39069'('#26412#24065#21547#31246')'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'amount_notax'
        ReadOnly = False
        Title.Caption = #37329#39069'('#26412#24065#19981#21547#31246')'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_CODE'
        Title.Caption = #23384#36135#21333#20301
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONSIGN_ONHAND_QTY'
        Title.Caption = #23433#20840#24211#23384
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STOCK_SELL'
        Title.Caption = #21333#20301#38754#31215
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total_area'
        Title.Caption = #24211#23384#38754#31215
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'location'
        Title.Caption = #20179#24211
        Width = 83
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1007
    Height = 43
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      1007
      43)
    object Label1: TLabel
      Left = 288
      Top = 16
      Width = 81
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #26448#26009#32534#30721
    end
    object Edit1: TEdit
      Left = 373
      Top = 12
      Width = 204
      Height = 21
      BevelEdges = [beLeft, beTop, beBottom]
      TabOrder = 0
      OnChange = Edit1Change
    end
    object CheckBox1: TCheckBox
      Left = 787
      Top = 16
      Width = 153
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #26174#31034#24211#23384#20026#38646#30340#26448#26009
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = Edit1Change
    end
    object BitBtn4: TBitBtn
      Left = 73
      Top = 6
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
      TabOrder = 2
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
    object BitBtn1: TBitBtn
      Left = 15
      Top = 6
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
      TabOrder = 3
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
  end
  object ADO22: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'SELECT Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME,'
      
        '      dbo.Data0017.INV_DESCRIPTION, dbo.Data0496.GROUP_NAME,Data' +
        '0016.location,'
      '      SUM(Data0134.QUAN_ON_HAND) AS quan_total,'
      
        'ROUND(avg(Data0134.tax_PRICE * Data0133.exch_rate), 4) AS avl_pr' +
        'ice,'
      
        'ROUND(SUM(Data0134.QUAN_ON_HAND * Data0134.tax_PRICE * Data0133.' +
        'exch_rate),4) AS amount,'
      
        'ROUND(SUM(Data0134.QUAN_ON_HAND * Data0134.PRICE * Data0133.exch' +
        '_rate),4) AS amount_notax,'
      'Data0002.UNIT_CODE,Data0134.supplier2,'
      'Data0023.ABBR_NAME AS ABBR_NAME23,Data0019.inv_group_name,'
      ' Data0017.STOCK_SELL,'
      
        'ROUND(SUM(Data0134.QUAN_ON_HAND * Data0017.STOCK_SELL ), 4) AS t' +
        'otal_area,'
      'data0017.QUAN_ON_HAND,data0017.CONSIGN_ONHAND_QTY'
      'FROM dbo.Data0134 INNER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0134.INVENTORY_PTR = dbo.Data0017.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY' +
        ' INNER JOIN'
      
        '      dbo.Data0019 ON dbo.Data0496.group_ptr = dbo.Data0019.rkey' +
        ' INNER JOIN'
      '      dbo.Data0002 ON'
      '      dbo.Data0134.UNIT_PTR = dbo.Data0002.RKEY INNER JOIN'
      
        '      dbo.Data0133 ON dbo.Data0134.GRN_PTR = dbo.Data0133.RKEY I' +
        'NNER JOIN'
      
        '      dbo.Data0023 ON dbo.Data0133.SUPP_PTR = dbo.Data0023.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0016 ON dbo.Data0134.LOCATION_PTR = dbo.Data0016.R' +
        'KEY INNER JOIN'
      
        '      dbo.Data0015 ON dbo.Data0133.warehouse_ptr = dbo.Data0015.' +
        'RKEY'
      'where 1=1'
      'GROUP BY dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME,'
      '      dbo.Data0017.INV_DESCRIPTION, dbo.Data0496.GROUP_NAME,'
      '      dbo.Data0002.UNIT_CODE, dbo.Data0023.ABBR_NAME,'
      '      dbo.Data0019.inv_group_name, '
      '      dbo.Data0017.STOCK_SELL,Data0134.supplier2,'
      
        '      data0017.QUAN_ON_HAND,data0017.CONSIGN_ONHAND_QTY,data0016' +
        '.location'
      'ORDER BY dbo.Data0017.INV_PART_NUMBER')
    Left = 400
    Top = 472
    object ADO22INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADO22INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADO22INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADO22GROUP_NAME: TStringField
      FieldName = 'GROUP_NAME'
      Size = 10
    end
    object ADO22location: TStringField
      FieldName = 'location'
    end
    object ADO22quan_total: TBCDField
      FieldName = 'quan_total'
      ReadOnly = True
      Precision = 32
    end
    object ADO22avl_price: TBCDField
      FieldName = 'avl_price'
      ReadOnly = True
      Precision = 32
      Size = 11
    end
    object ADO22amount: TBCDField
      FieldName = 'amount'
      ReadOnly = True
      Precision = 32
      Size = 8
    end
    object ADO22amount_notax: TBCDField
      FieldName = 'amount_notax'
      ReadOnly = True
      Precision = 32
      Size = 8
    end
    object ADO22UNIT_CODE: TStringField
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object ADO22supplier2: TStringField
      FieldName = 'supplier2'
      Size = 30
    end
    object ADO22ABBR_NAME23: TStringField
      FieldName = 'ABBR_NAME23'
      Size = 16
    end
    object ADO22inv_group_name: TStringField
      FieldName = 'inv_group_name'
    end
    object ADO22STOCK_SELL: TFloatField
      FieldName = 'STOCK_SELL'
    end
    object ADO22total_area: TFloatField
      FieldName = 'total_area'
      ReadOnly = True
    end
    object ADO22QUAN_ON_HAND: TBCDField
      FieldName = 'QUAN_ON_HAND'
      Precision = 19
    end
    object ADO22CONSIGN_ONHAND_QTY: TFloatField
      FieldName = 'CONSIGN_ONHAND_QTY'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO22
    Left = 368
    Top = 473
  end
end
