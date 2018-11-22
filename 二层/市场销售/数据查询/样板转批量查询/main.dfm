object mainform: Tmainform
  Left = 206
  Top = 119
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26679#21697#36716#37327#20135#29575#26597#35810
  ClientHeight = 419
  ClientWidth = 706
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 706
    Height = 378
    Align = alClient
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'cust_code'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'zcs'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'xys'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'zcl'
        Width = 150
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 706
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 14
      Width = 39
      Height = 13
      Caption = #24037#21378#65306
    end
    object Label2: TLabel
      Left = 285
      Top = 14
      Width = 13
      Height = 13
      Caption = #20174
    end
    object Label3: TLabel
      Left = 402
      Top = 14
      Width = 13
      Height = 13
      Caption = #21040
    end
    object Label4: TLabel
      Left = 182
      Top = 14
      Width = 39
      Height = 13
      Caption = #23458#25143#65306
    end
    object Edit1: TEdit
      Left = 217
      Top = 10
      Width = 64
      Height = 21
      TabOrder = 0
    end
    object dt1: TDateTimePicker
      Left = 301
      Top = 10
      Width = 96
      Height = 21
      Date = 39037.000000000000000000
      Time = 39037.000000000000000000
      TabOrder = 1
    end
    object dt2: TDateTimePicker
      Left = 418
      Top = 10
      Width = 96
      Height = 21
      Date = 39037.000000000000000000
      Time = 39037.000000000000000000
      TabOrder = 2
    end
    object BitBtn1: TBitBtn
      Left = 520
      Top = 8
      Width = 58
      Height = 25
      Caption = #26597#35810
      Default = True
      ModalResult = 1
      TabOrder = 3
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
    object BitBtn3: TBitBtn
      Left = 642
      Top = 8
      Width = 58
      Height = 25
      Cancel = True
      Caption = #36864#20986
      TabOrder = 4
      OnClick = BitBtn3Click
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
    object BitBtn2: TBitBtn
      Left = 581
      Top = 8
      Width = 58
      Height = 25
      Cancel = True
      Caption = #23548#20986
      Enabled = False
      TabOrder = 5
      OnClick = BitBtn2Click
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        100003000000000200000000000000000000000000000000000000F80000E007
        00001F000000874B874B874B664366436643254325432543E432E432E4328332
        83328332632A874B2D7D0C750C75CB74CB74AA6CAA6C895C895C895C67546754
        664C664C632AC8532D7D9DEF9DEF9CE77CE77CE77BDF5BDF5BDF5BDF5BDF3BDF
        3BDF664C632AC8534E85BDEF9DEF9DEF9CE77CE77CE77BDF5BDF5BDF5BDF5BDF
        3BDF67548332085C6E85BDEFBDEF9DEF9DEF9DEF7CE7508D852A852A852A852A
        5BDF675483322964AF8DDEF72A5D852A852A852A852AA31BAD75895CA94CE432
        5BDF895CE4326A64F095DEF7BEF72A5D8C752A5DA31B0F86895CA94CE432508D
        5BDF895CE432AA6CB195DEF7DEF7DEF72A5D2634F095895CA94CE432CC64CC64
        7BDF895CE432CB74329EDFFFDEF7DEF72634329E4B652A5D664340039CE77CE7
        7CE7AA6C25430C75329EFFFFDFFF874493A6AD754B65284C2A5D263440039CE7
        7CE7AA6C25432D7D93A6FFFFA94CB5B6CE7DCE7D895C0A5C8C6D2A5D26344003
        9CE7CB7466434E8593A6FFFF8C6D6C6D6C6DCA5CDEF7DEF70A5C0A5C0A5C0A5C
        9DEFCB7466436E85B5B6FFFFFFFFFFFFFFFFDFFFDFFFDEF7DEF7BEF7BDEFBDEF
        9DEF0C75874BAF8DB5B6FFFFFFFFFFFFFFFFFFFFDFFFDFFFDEF7DEF7BEF7BDEF
        BDEF0C75874BAF8DB5B6B5B693A693A6329E329E329EB195F095AF8D6E854E85
        4E852D7D874BF095AF8D6E854E852D7D0C75CB74AA6C6A6429642964085CC853
        C853874B874B}
    end
    object ComboBox1: TComboBox
      Left = 39
      Top = 10
      Width = 138
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 6
      OnChange = ComboBox1Change
    end
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 337
    Top = 78
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'cust1'
        Size = -1
        Value = Null
      end
      item
        Name = 'fromdate1'
        Size = -1
        Value = Null
      end
      item
        Name = 'todate1'
        Size = -1
        Value = Null
      end
      item
        Name = 'wh1'
        Size = -1
        Value = Null
      end
      item
        Name = 'cust2'
        Size = -1
        Value = Null
      end
      item
        Name = 'fromdate2'
        Size = -1
        Value = Null
      end
      item
        Name = 'todate2'
        Size = -1
        Value = Null
      end
      item
        Name = 'wh2'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT B.cust_code AS cust_code,B.ABBR_NAME AS ABBR_NAME,'
      '       isnull(A.ypzlc,0) AS zcs,isnull(B.xys,0) AS xys,'
      '       isnull(ROUND(A.ypzlc * 100.00 / B.xys, 2),0) AS zcl'
      'FROM (SELECT Data0010.CUST_CODE AS cust_code,Data0010.ABBR_NAME,'
      '             COUNT(*) AS ypzlc'
      '     FROM Data0273 INNER JOIN Data0010 '
      
        '          ON Data0273.CUSTOMER_PTR=Data0010.RKEY inner join data' +
        '0025 '
      
        '          ON data0273.copyfromcust_ptr=data0025.rkey inner join ' +
        'data0015 '
      '          ON data0025.prod_route_ptr=data0015.rkey'
      
        '     WHERE (Data0010.CUST_CODE like :cust1) AND (data0273.toolin' +
        'g_close=4) '
      '           AND (data0273.ENTERED_DATE >= :fromdate1) '
      '           AND (data0273.ENTERED_DATE <= :todate1) '
      '           AND (data0015.warehouse_code like :wh1) '
      '     GROUP BY Data0010.CUST_CODE,Data0010.ABBR_NAME) A'
      'RIGHT OUTER JOIN'
      '     (SELECT COUNT(*) AS xys, Data0010.CUST_CODE AS cust_code,'
      '             Data0010.ABBR_NAME '
      '     FROM Data0025 INNER JOIN Data0010 '
      
        '          ON Data0025.CUSTOMER_PTR = Data0010.RKEY inner join da' +
        'ta0015 '
      '          ON data0025.prod_route_ptr=data0015.rkey'
      
        '     WHERE (Data0010.CUST_CODE like :cust2) AND (Data0025.TTYPE ' +
        '= 1) '
      '           AND (Data0025.CUSTPART_ENT_DATE >= :fromdate2) '
      '           AND (Data0025.CUSTPART_ENT_DATE <= :todate2) '
      '           AND (data0015.warehouse_code like :wh2) '
      '           AND (data0025.parent_ptr is null)'
      '    GROUP BY Data0010.CUST_CODE,Data0010.ABBR_NAME) B '
      'ON A.cust_code = B.cust_code')
    Left = 367
    Top = 79
    object ADOQuery1cust_code: TStringField
      DisplayLabel = #23458#25143#20195#30721
      DisplayWidth = 12
      FieldName = 'cust_code'
      Size = 10
    end
    object ADOQuery1ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOQuery1zcs: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = #26679#21697#36716#37327#20135#25968
      DisplayWidth = 14
      FieldName = 'zcs'
    end
    object ADOQuery1xys: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = #19979#26679#21697#25968
      DisplayWidth = 12
      FieldName = 'xys'
    end
    object ADOQuery1zcl: TBCDField
      Alignment = taLeftJustify
      DisplayLabel = #26679#21697#36716#37327#20135#29575'(%)'
      DisplayWidth = 18
      FieldName = 'zcl'
      ReadOnly = True
      Precision = 27
      Size = 13
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 399
    Top = 79
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 368
    Top = 112
  end
end
