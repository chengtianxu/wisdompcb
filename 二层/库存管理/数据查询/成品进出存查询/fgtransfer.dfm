object Form5: TForm5
  Left = 199
  Top = 133
  Width = 831
  Height = 500
  Caption = #20135#25104#21697#36716#31227#26597#35810
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
    Width = 823
    Height = 44
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 412
      Top = 16
      Width = 65
      Height = 13
      Caption = #25968#37327#21512#35745#65306
    end
    object Label2: TLabel
      Left = 608
      Top = 16
      Width = 65
      Height = 13
      Caption = #38754#31215#21512#35745#65306
    end
    object BitBtn1: TBitBtn
      Left = 19
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
      Left = 77
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
    object Edit1: TEdit
      Left = 476
      Top = 12
      Width = 121
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    object Edit2: TEdit
      Left = 672
      Top = 12
      Width = 121
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 44
    Width = 823
    Height = 429
    Align = alClient
    DataSource = DataSource1
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
        FieldName = 'TDATE'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'customerpart_in'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cprev_in'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'custcode_in'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mian_ji'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCE_NUMBER'
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADO113
    Left = 136
    Top = 384
  end
  object ADO113: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      
        'SELECT TOP 100 PERCENT dbo.Data0113.TDATE, dbo.Data0005.EMPLOYEE' +
        '_NAME, '
      
        '      data0025_1.MANU_PART_NUMBER, data0025_1.MANU_PART_DESC, da' +
        'ta0010_1.CUST_CODE,'
      '      Data0025_2.MANU_PART_NUMBER AS customerpart_in, '
      '      Data0025_2.MANU_PART_DESC AS cprev_in, '
      '      Data0010_2.CUST_CODE AS custcode_in, '
      
        '      dbo.Data0113.QUANTITY,Data0113.QUANTITY*data0025_1.unit_sq' +
        ' as mian_ji,dbo.Data0113.REFERENCE_NUMBER'
      'FROM dbo.Data0113 INNER JOIN'
      
        '      dbo.Data0005 ON dbo.Data0113.EMPL_PTR = dbo.Data0005.RKEY ' +
        'INNER JOIN'
      '      dbo.Data0025 Data0025_1 ON'
      
        '      Data0113.FromMANU_PART_NUMBER=Data0025_1.MANU_PART_NUMBER ' +
        'INNER JOIN'
      '      dbo.Data0010 Data0010_1 ON '
      '      data0025_1.CUSTOMER_PTR = Data0010_1.RKEY INNER JOIN'
      '      dbo.Data0025 Data0025_2 ON'
      
        '      Data0113.ToMANU_PART_NUMBER=Data0025_2.MANU_PART_NUMBER IN' +
        'NER JOIN'
      '      dbo.Data0010 Data0010_2 ON '
      '      Data0025_2.CUSTOMER_PTR = Data0010_2.RKEY'
      'WHERE (dbo.Data0113.TRAN_TYPE = 2)'
      'ORDER BY dbo.Data0113.TDATE')
    Left = 168
    Top = 384
    object ADO113TDATE: TDateTimeField
      DisplayLabel = #36716#31227#26085#26399
      FieldName = 'TDATE'
    end
    object ADO113EMPLOYEE_NAME: TStringField
      DisplayLabel = #36716#31227#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADO113CUST_CODE: TStringField
      DisplayLabel = #23458#25143
      FieldName = 'CUST_CODE'
      Size = 5
    end
    object ADO113custcode_in: TStringField
      DisplayLabel = #23458#25143
      FieldName = 'custcode_in'
      Size = 5
    end
    object ADO113QUANTITY: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'QUANTITY'
    end
    object ADO113MANU_PART_NUMBER: TStringField
      DisplayLabel = #36716#20986#26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADO113MANU_PART_DESC: TStringField
      DisplayLabel = #36716#20986#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADO113customerpart_in: TStringField
      DisplayLabel = #36716#20837#26412#21378#32534#21495
      FieldName = 'customerpart_in'
    end
    object ADO113cprev_in: TStringField
      DisplayLabel = #36716#20837#22411#21495
      FieldName = 'cprev_in'
      Size = 40
    end
    object ADO113mian_ji: TFloatField
      DisplayLabel = #36716#20986#38754#31215
      FieldName = 'mian_ji'
      ReadOnly = True
    end
    object ADO113REFERENCE_NUMBER: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REFERENCE_NUMBER'
      Size = 50
    end
  end
end
