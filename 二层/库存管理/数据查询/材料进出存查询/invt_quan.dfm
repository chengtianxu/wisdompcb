object Form4: TForm4
  Left = 38
  Top = 262
  Width = 876
  Height = 548
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
    Width = 860
    Height = 467
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
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inv_name'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Width = 182
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GROUP_NAME'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME23'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'supplier2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quan_total'
        Title.Alignment = taRightJustify
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quan_allow'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'avl_price'
        ReadOnly = False
        Title.Alignment = taRightJustify
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'amount'
        Title.Alignment = taRightJustify
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'amount_notax'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONSIGN_ONHAND_QTY'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total_weigth'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STOCK_SELL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total_area'
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
    Width = 860
    Height = 43
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      860
      43)
    object Label1: TLabel
      Left = 347
      Top = 16
      Width = 81
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #26448#26009#32534#30721
    end
    object lbl1: TLabel
      Left = 251
      Top = 17
      Width = 78
      Height = 13
      Caption = #20302#20110#23433#20840#24211#23384
    end
    object Edit1: TEdit
      Left = 432
      Top = 12
      Width = 156
      Height = 21
      BevelEdges = [beLeft, beTop, beBottom]
      TabOrder = 0
      OnChange = Edit1Change
    end
    object CheckBox1: TCheckBox
      Left = 648
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
    object BitBtn2: TBitBtn
      Left = 131
      Top = 6
      Width = 57
      Height = 30
      Hint = #23548#20986#25968#25454'Excel'
      Caption = #25171#21360
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      PopupMenu = PopupMenu1
      ShowHint = True
      TabOrder = 2
      OnClick = BitBtn2Click
      Glyph.Data = {
        46060000424D4606000000000000360400002800000016000000160000000100
        0800000000001002000000000000000000000001000000010000343234009C9A
        9C00CCCECC006466640084828400B4B6B400ECEAEC004C4E4C00DCDEDC007476
        7400ACAAAC008C8E8C00CCC2CC0044424400F4F6F400645A6400DCD2DC00746A
        7400C4C2C400A4A2A400ECE2EC00948A9400C4BAC400FCF2FC005C5A5C00847A
        8400BCB2BC009C929C003C3A3C008C8A8C00F4F2F400E4E6E400B4B2B4004C4A
        4C0074727400D4D6D4008C828C00BCBEBC00F4EAF4005C565C00E4DEE4007C7E
        7C00B4AAB40094969400CCCACC004C424C00FCFEFC0064626400DCDADC00ACA2
        AC00A49AA400D4CED4006C666C00BCB6BC00544E54007C767C00948E9400FCF6
        FC007C6E7C00443A44003C363C0084868400ECEEEC00DCE2DC00ACAEAC00CCC6
        CC0044464400645E6400DCD6DC00746E7400C4C6C400A4A6A400ECE6EC00C4BE
        C4005C5E5C00847E84009C969C007C727C008C868C00F4EEF400E4E2E400B4AE
        B400D4CAD4004C464C006C626C00E4DAE400ACA6AC00A49EA400D4D2D4006C6A
        6C00BCBABC00545254007C7A7C0094929400FCFAFC00443E4400000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000041410C44144B
        27531B55264B37591C1926330C414152000052331031344D51241C4537384C48
        041C451A330C524100000C2A5919514458491A11003152164E073C5316330C41
        000024451630410C3358334415420241054D59420D16330C08020F06102C490C
        4133352F364D304F2E1B0F11210D16330000574D4955282C32592D595A5E5E2E
        0E50372F340D531A0000502A5F1A56110D595A2E2E5E5E50583F483743430019
        00000C04440C210312172E5E0E0658442346501F37340D24080234150841252E
        2E5E2E282358233D4C08461F1F195F2400004B45484F2E5E393E493847130721
        212B50402A2E59370000455D2E39391F2323515D031C2121034301252C401156
        00003A385E5058582C011853425B5B374B324C0545341A330802114C0E25235A
        5B4242214A111D1B510B1D225E404E520000152F48502C4622215B5C19571301
        22560839522E27410000554C5B5A3E5802293438200B1D5D4F2E2E2E125D1541
        00001210564D1B1E301E05380932352E5E5E1E49254D2A330802520C58104545
        120B5C36215E28103E10202551262752000041410C4133152F4D351027010E13
        524012352533131B00004152414141550C10524152115918141E350E5E442F19
        000041524152410C41414141520C4B11242E58485E2E4754080241520C414152
        4141524141414455151B2F522E35224E00005241524152410C52414152410C0C
        33381934191915330000}
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
      TabOrder = 3
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
      TabOrder = 4
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
    object edt1: TEdit
      Left = 204
      Top = 13
      Width = 45
      Height = 21
      Font.Charset = GB2312_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Text = #23383#20307#33394
    end
  end
  object ADO22: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'SELECT Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME,'
      
        '      dbo.Data0017.INV_DESCRIPTION, dbo.Data0496.GROUP_NAME,Data' +
        '0016.location,'
      '      SUM(Data0022.QUAN_ON_HAND) AS quan_total,'
      
        '      SUM(Data0022.QUAN_ON_HAND-Data0022.QUAN_TO_BE_STOCKED) AS ' +
        'quan_allow,'
      
        'ROUND(avg(Data0022.tax_PRICE * Data0456.exch_rate), 4) AS avl_pr' +
        'ice,'
      
        'ROUND(SUM(Data0022.QUAN_ON_HAND * Data0022.tax_PRICE * Data0456.' +
        'exch_rate),4) AS amount,'
      
        'ROUND(SUM(Data0022.QUAN_ON_HAND * Data0022.PRICE * Data0456.exch' +
        '_rate),4) AS amount_notax,'
      'Data0002.UNIT_CODE,data0022.supplier2,'
      'Data0023.ABBR_NAME AS ABBR_NAME23,Data0019.inv_group_name,'
      ' Data0017.STOCK_SELL,'
      
        'SUM(Data0022.QUAN_ON_HAND * Data0022.STOCK_BASE) AS total_weigth' +
        ','
      
        'ROUND(SUM(Data0022.QUAN_ON_HAND * Data0017.STOCK_SELL ), 4) AS t' +
        'otal_area,'
      'data0017.QUAN_ON_HAND,data0017.CONSIGN_ONHAND_QTY'
      'FROM dbo.Data0022 INNER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY' +
        ' INNER JOIN'
      
        '      dbo.Data0019 ON dbo.Data0496.group_ptr = dbo.Data0019.rkey' +
        ' INNER JOIN'
      '      dbo.Data0002 ON'
      
        '      dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY INNER J' +
        'OIN'
      
        '      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY I' +
        'NNER JOIN'
      
        '      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Data0016.R' +
        'KEY INNER JOIN'
      
        '      dbo.Data0015 ON dbo.Data0456.warehouse_ptr = dbo.Data0015.' +
        'RKEY'
      'where 1=1'
      'GROUP BY dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME,'
      '      dbo.Data0017.INV_DESCRIPTION, dbo.Data0496.GROUP_NAME,'
      '      dbo.Data0002.UNIT_CODE, dbo.Data0023.ABBR_NAME,'
      '      dbo.Data0019.inv_group_name, '
      '      dbo.Data0017.STOCK_SELL,data0022.supplier2,'
      
        '      data0017.QUAN_ON_HAND,data0017.CONSIGN_ONHAND_QTY,data0016' +
        '.location'
      'ORDER BY dbo.Data0017.INV_PART_NUMBER')
    Left = 400
    Top = 472
    object ADO22inv_group_name: TStringField
      DisplayLabel = #26448#26009#32452#21035
      FieldName = 'inv_group_name'
    end
    object ADO22INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      DisplayWidth = 29
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADO22inv_name: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'inv_name'
      Size = 30
    end
    object ADO22INV_PART_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      DisplayWidth = 100
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADO22GROUP_NAME: TStringField
      DisplayLabel = #26448#26009#31867#21035
      DisplayWidth = 15
      FieldName = 'GROUP_NAME'
      Size = 10
    end
    object ADO22UNIT_CODE: TStringField
      DisplayLabel = #23384#36135#21333#20301
      DisplayWidth = 5
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object ADO22ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'ABBR_NAME23'
      Size = 16
    end
    object ADO22quan_total: TFloatField
      DisplayLabel = #24211#23384#25968#37327
      DisplayWidth = 18
      FieldName = 'quan_total'
    end
    object ADO22avl_price: TFloatField
      DisplayLabel = #24179#22343#20215#26684'('#21547#31246')'
      DisplayWidth = 15
      FieldName = 'avl_price'
      ReadOnly = True
      DisplayFormat = '0.0000'
    end
    object ADO22amount: TFloatField
      DisplayLabel = #37329#39069'('#26412#24065#21547#31246')'
      DisplayWidth = 15
      FieldName = 'amount'
    end
    object ADO22amount_notax: TBCDField
      DisplayLabel = #37329#39069'('#26412#24065#19981#21547#31246')'
      DisplayWidth = 10
      FieldName = 'amount_notax'
      ReadOnly = True
      Precision = 32
      Size = 8
    end
    object ADO22STOCK_SELL: TFloatField
      DisplayLabel = #21333#20301#38754#31215
      FieldName = 'STOCK_SELL'
    end
    object ADO22total_weigth: TFloatField
      DisplayLabel = #24211#23384#24635#37325'KG'
      FieldName = 'total_weigth'
    end
    object ADO22total_area: TFloatField
      DisplayLabel = #24211#23384#38754#31215
      FieldName = 'total_area'
      ReadOnly = True
    end
    object ADO22supplier2: TStringField
      DisplayLabel = #21407#21046#36896#21830
      DisplayWidth = 30
      FieldName = 'supplier2'
      Size = 30
    end
    object ADO22QUAN_ON_HAND: TBCDField
      FieldName = 'QUAN_ON_HAND'
      Precision = 19
    end
    object ADO22CONSIGN_ONHAND_QTY: TFloatField
      DisplayLabel = #23433#20840#24211#23384
      FieldName = 'CONSIGN_ONHAND_QTY'
    end
    object ADO22quan_allow: TBCDField
      DisplayLabel = #26377#25928#24211#23384
      DisplayWidth = 10
      FieldName = 'quan_allow'
      ReadOnly = True
      Precision = 32
      Size = 6
    end
    object ADO22location: TStringField
      FieldName = 'location'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO22
    Left = 368
    Top = 473
  end
  object PopupMenu1: TPopupMenu
    Left = 414
    Top = 13
    object N1: TMenuItem
      Caption = #35774#35745#25253#34920
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #25171#21360#25253#34920
      OnClick = N2Click
    end
  end
end
