object frmXSMB: TfrmXSMB
  Left = 331
  Top = 192
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #38144#21806#30446#26631
  ClientHeight = 352
  ClientWidth = 429
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 429
    Height = 35
    Cursor = crVSplit
    Align = alTop
  end
  object Label1: TLabel
    Left = 64
    Top = 8
    Width = 78
    Height = 13
    Caption = #35745#21010#20154#20195#30721#65306
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 48
    Width = 425
    Height = 225
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'JHID'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'YJH'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MJH'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MJHJE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPL_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'YJHJE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LJJE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'YWWJE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WWZNBL'
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 136
    Top = 8
    Width = 137
    Height = 21
    TabOrder = 1
    OnChange = Edit1Change
  end
  object BitBtn2: TBitBtn
    Left = 275
    Top = 6
    Width = 25
    Height = 25
    Hint = #21047#26032
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    TabStop = False
    OnClick = BitBtn2Click
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000120B0000120B00001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
      DADABFBFBDADADADADADDADADBFADADADADAADADAD000DADADADDADAD0FBF0DA
      DADAADAD0F7FBF0DADADDAD0F7F87BF0DADAAD0F7F87BFB70DADD0F7F87BFB78
      80DA000F87BFB78880ADDAD00BFB78880ADAADADA0B7888740ADDADADA088804
      440AADADADA000A04440DADADADADADA0440ADADADADADADA00D}
  end
  object Button1: TButton
    Left = 104
    Top = 304
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 240
    Top = 304
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object DataSource1: TDataSource
    DataSet = AQery704
    Left = 152
    Top = 152
  end
  object AQery704: TADOQuery
    Connection = DM.Conn
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'vrky'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT data0704.YJH, data0704.JHID,data0704.MJH, data0704.MJHJE,' +
        ' Data0005.EMPLOYEE_NAME, '
      
        '      Data0005.EMPL_CODE, data0704.YJHJE, data0704.LJJE, data070' +
        '4.YWWJE, '
      '      data0704.WWZNBL*100 as WWZNBL, data0704.RKEY'
      'FROM data0704 INNER JOIN'
      '      Data0005 ON data0704.CJRPTR = Data0005.RKEY'
      'where data0704.CJRPTR=:vrky')
    Left = 192
    Top = 152
    object AQery704JHID: TStringField
      DisplayLabel = #38144#21806#30446#26631'ID'
      FieldName = 'JHID'
      Size = 12
    end
    object AQery704YJH: TIntegerField
      DisplayLabel = #35745#21010#24180
      FieldName = 'YJH'
    end
    object AQery704MJH: TIntegerField
      DisplayLabel = #35745#21010#26376
      FieldName = 'MJH'
    end
    object AQery704MJHJE: TBCDField
      DisplayLabel = #26412#26376#35745#21010
      FieldName = 'MJHJE'
      Precision = 10
      Size = 2
    end
    object AQery704EMPL_CODE: TStringField
      DisplayLabel = #35745#21010#20154#20195#30721
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object AQery704EMPLOYEE_NAME: TStringField
      DisplayLabel = #35745#21010#20154
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object AQery704YJHJE: TBCDField
      DisplayLabel = #20840#24180#35745#21010
      FieldName = 'YJHJE'
      Precision = 12
      Size = 2
    end
    object AQery704LJJE: TBCDField
      DisplayLabel = #29616#32047#35745#37329#39069
      FieldName = 'LJJE'
      Precision = 12
      Size = 2
    end
    object AQery704YWWJE: TBCDField
      DisplayLabel = #24180#26410#23436#25104#35746#21333
      FieldName = 'YWWJE'
      Precision = 12
      Size = 2
    end
    object AQery704WWZNBL: TBCDField
      DisplayLabel = #24180#26410#23436#25104#27604#20363'(%)'
      FieldName = 'WWZNBL'
      Precision = 5
      Size = 2
    end
    object AQery704RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
  end
end
