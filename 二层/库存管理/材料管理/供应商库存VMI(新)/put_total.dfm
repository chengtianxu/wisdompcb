object Form7: TForm7
  Left = 188
  Top = 104
  Width = 1002
  Height = 556
  Caption = #26448#26009#20986#24211#27719#24635
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 994
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      994
      41)
    object Label3: TLabel
      Left = 381
      Top = 14
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop]
      Caption = #26448#26009#32534#30721
    end
    object Edit3: TEdit
      Left = 468
      Top = 11
      Width = 152
      Height = 21
      Anchors = [akTop]
      TabOrder = 0
      OnChange = Edit3Change
    end
    object BitBtn4: TBitBtn
      Left = 74
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
    object BitBtn1: TBitBtn
      Left = 16
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
      TabOrder = 2
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 994
    Height = 481
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'inv_group_name'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_NAME'
        Width = 166
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GROUP_DESC'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Stype'
        Title.Caption = #20986#24211#31867#22411
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'put_total'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'put_price'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'put_notax'
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
        Title.Caption = #21457#25918#38754#31215
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REPORT_VALUE1'
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = adotota207
    Left = 224
    Top = 8
  end
  object adotota207: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      
        'SELECT   TOP (100) PERCENT dbo.Data0017.INV_PART_NUMBER, dbo.Dat' +
        'a0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION, dbo.Data0002.UNIT_' +
        'NAME, '
      
        '                      dbo.Data0496.GROUP_DESC, dbo.Data0023.ABBR' +
        '_NAME, '
      
        '                      case when dbo.data0724.ttype=0 then '#39#36864#36135#20986#20179#39 +
        ' when dbo.data0724.ttype=1 then '#39#39046#26009#20986#20179#39'  end  Stype,'
      
        '                      case when data0724.ttype=1 then SUM(dbo.Da' +
        'ta0149.QUANTITY) else sum(Data0149.RTN_QUANTITY) end AS put_tota' +
        'l, dbo.Data0017.STOCK_SELL, '
      
        '                      case when data0724.ttype=1 then ROUND(SUM(' +
        'dbo.Data0149.QUANTITY * dbo.Data0134.tax_price * dbo.Data0133.ex' +
        'ch_rate), 3) '
      
        '                      else ROUND(SUM(dbo.Data0149.RTN_QUANTITY *' +
        ' dbo.Data0134.tax_price * dbo.Data0133.exch_rate), 3) end AS put' +
        '_price, '
      
        '                      dbo.Data0019.inv_group_name,dbo.Data0017.R' +
        'EPORT_VALUE1, '
      
        '                      case when data0724.ttype=1 then ROUND(SUM(' +
        '(dbo.Data0149.QUANTITY * dbo.Data0134.tax_price * dbo.Data0133.e' +
        'xch_rate) '
      
        '                      / (1 + dbo.Data0134.TAX_2 * 0.01)), 3) els' +
        'e ROUND(SUM((dbo.Data0149.RTN_QUANTITY * dbo.Data0134.tax_price ' +
        '* dbo.Data0133.exch_rate) '
      
        '                      / (1 + dbo.Data0134.TAX_2 * 0.01)), 3)end ' +
        'AS put_notax,  dbo.data0016.code, '
      
        '                      case when data0724.ttype=1 then ROUND(SUM(' +
        'dbo.Data0149.QUANTITY * dbo.Data0017.STOCK_SELL), 4) else ROUND(' +
        'SUM(dbo.Data0149.QUANTITY * dbo.Data0017.STOCK_SELL),4) end as t' +
        'otal_area'
      'FROM                  dbo.Data0724 INNER JOIN'
      '                      dbo.Data0133 INNER JOIN'
      '                      dbo.Data0002 INNER JOIN'
      '                      dbo.Data0134 INNER JOIN'
      
        '                      dbo.Data0149 ON dbo.Data0134.RKEY = dbo.Da' +
        'ta0149.D0134_PTR ON '
      
        '                      dbo.Data0002.RKEY = dbo.Data0134.unit_ptr ' +
        'ON '
      
        '                      dbo.Data0133.RKEY = dbo.Data0134.GRN_PTR I' +
        'NNER JOIN'
      
        '                      dbo.Data0023 ON dbo.Data0133.SUPP_PTR = db' +
        'o.Data0023.RKEY INNER JOIN'
      '                      dbo.Data0496 INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.Data0496.RKEY = dbo.Da' +
        'ta0017.GROUP_PTR INNER JOIN'
      
        '                      dbo.Data0019 ON dbo.Data0496.group_ptr = d' +
        'bo.Data0019.rkey ON dbo.Data0149.INVENTORY_PTR = dbo.Data0017.RK' +
        'EY ON '
      
        '                      dbo.Data0724.RKEY = dbo.Data0149.GON_PTR  ' +
        'inner join'
      
        '                     dbo.Data0016 ON dbo.Data0134.LOCATION_PTR =' +
        ' dbo.Data0016.RKEY'
      
        'WHERE     (dbo.Data0149.QUANTITY <> 0) or (dbo.Data0149.RTN_QUAN' +
        'TITY<>0)'
      
        'GROUP BY dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, db' +
        'o.Data0017.INV_DESCRIPTION, dbo.Data0496.GROUP_DESC, dbo.Data000' +
        '2.UNIT_NAME, '
      
        '                      dbo.Data0023.ABBR_NAME, dbo.Data0017.STD_C' +
        'OST, dbo.Data0019.inv_group_name,  dbo.Data0017.REPORT_VALUE1, '
      
        '                      dbo.Data0017.STOCK_SELL,dbo.Data0724.ttype' +
        ', dbo.data0016.code'
      'ORDER BY dbo.Data0017.INV_PART_NUMBER'
      '')
    Left = 256
    Top = 8
    object adotota207inv_group_name: TStringField
      DisplayLabel = #26448#26009#32452#21035
      FieldName = 'inv_group_name'
    end
    object adotota207INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object adotota207UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object adotota207GROUP_DESC: TStringField
      DisplayLabel = #26448#26009#31867#21035
      DisplayWidth = 15
      FieldName = 'GROUP_DESC'
      Size = 30
    end
    object adotota207ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object adotota207put_total: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'put_total'
    end
    object adotota207put_price: TFloatField
      DisplayLabel = #37329#39069'('#26412#24065#21547#31246')'
      FieldName = 'put_price'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object adotota207put_notax: TBCDField
      DisplayLabel = #37329#39069'('#26412#24065#19981#21547#31246')'
      DisplayWidth = 10
      FieldName = 'put_notax'
      ReadOnly = True
      Precision = 32
      Size = 16
    end
    object adotota207INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      DisplayWidth = 16
      FieldName = 'INV_NAME'
      Size = 30
    end
    object adotota207INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      DisplayWidth = 20
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object adotota207STOCK_SELL: TFloatField
      DisplayLabel = #21333#20301#38754#31215'('#24179#26041#33521#23544')'
      FieldName = 'STOCK_SELL'
    end
    object adotota207total_area: TFloatField
      DisplayLabel = #21457#25918#38754#31215'('#24179#26041#33521#23610')'
      FieldName = 'total_area'
      ReadOnly = True
    end
    object adotota207REPORT_VALUE1: TFloatField
      DisplayLabel = #26631#20934#20135#20986'('#24179#31859')'
      FieldName = 'REPORT_VALUE1'
    end
    object adotota207Stype: TStringField
      FieldName = 'Stype'
      ReadOnly = True
      Size = 8
    end
  end
end
