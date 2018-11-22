object Form8: TForm8
  Left = 231
  Top = 91
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'VMI'#26377#25928#24211#23384#26597#25214
  ClientHeight = 473
  ClientWidth = 919
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 919
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 204
      Top = 15
      Width = 60
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #26448#26009#32534#30721
    end
    object Edit1: TEdit
      Left = 271
      Top = 11
      Width = 169
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object BitBtn2: TBitBtn
      Left = 443
      Top = 10
      Width = 25
      Height = 25
      Hint = #21047#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
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
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 919
    Height = 391
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
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
        FieldName = 'INV_PART_NUMBER'
        Title.Caption = #26448#26009#32534#30721
        Title.Color = clRed
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_NAME'
        Title.Caption = #26448#26009#21517#31216
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Title.Caption = #26448#26009#35268#26684
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCATION'
        Title.Caption = #23384#20179#20301#32622
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Title.Caption = #21333#20301
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_ON_HAND'
        ReadOnly = False
        Title.Caption = #24211#23384#25968#37327
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Title.Caption = #20379#24212#21830
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXPIRE_DATE'
        ReadOnly = False
        Title.Caption = #26377#25928#26399
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'barcode_id'
        Title.Caption = #22791#27880
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUPPLIER2'
        Title.Caption = #20379#24212#21830#29289#26009#25209#27425
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rohs'
        Title.Caption = #29615#20445
        Width = 57
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 432
    Width = 919
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      919
      41)
    object Button1: TButton
      Left = 344
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      Enabled = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 462
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #36864#20986
      ModalResult = 2
      TabOrder = 1
    end
  end
  object ADS134: TADODataSet
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, '#13#10'  ' +
      '    dbo.Data0017.INV_DESCRIPTION, dbo.Data0016.LOCATION, dbo.dat' +
      'a0002.rkey as rke02,'#13#10'      dbo.Data0002.UNIT_NAME, dbo.Data0134' +
      '.QUAN_ON_HAND, '#13#10'      dbo.Data0134.EXPIRE_DATE, dbo.Data0134.ro' +
      'hs, data0133.exch_rate,dbo.Data0023.ABBR_NAME, '#13#10'      dbo.Data0' +
      '134.SUPPLIER2, dbo.Data0017.STOCK_BASE, data0133.ship_by,'#13#10'     ' +
      ' dbo.Data0134.INVENTORY_PTR, dbo.Data0134.RKEY,data0134.barcode_' +
      'id,'#13#10'      dbo.data0134.tax_price,dbo.data0134.tax_2,data0133.de' +
      'liver_number'#13#10'FROM dbo.Data0134 INNER JOIN'#13#10'      dbo.Data0016 O' +
      'N dbo.Data0134.LOCATION_PTR = dbo.Data0016.RKEY INNER JOIN'#13#10'    ' +
      '  dbo.Data0017 ON dbo.Data0134.INVENTORY_PTR = dbo.Data0017.RKEY' +
      ' INNER JOIN'#13#10'      dbo.Data0002 ON dbo.Data0134.UNIT_PTR= dbo.Da' +
      'ta0002.RKEY INNER JOIN'#13#10'      dbo.Data0133 ON dbo.Data0134.GRN_P' +
      'TR = dbo.Data0133.RKEY INNER JOIN'#13#10'      dbo.Data0023 ON dbo.Dat' +
      'a0133.SUPP_PTR = dbo.Data0023.RKEY'#13#10'WHERE (dbo.Data0134.QUAN_ON_' +
      'HAND > 0)  and (data0133.supp_ptr=:rkey23) and (data0133.currenc' +
      'y_ptr=:rkey01)'#13#10'order by Data0134.rkey'#13#10
    IndexFieldNames = 'INV_PART_NUMBER'
    Parameters = <
      item
        Name = 'rkey23'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey01'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 232
    Top = 440
    object ADS134INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADS134INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADS134INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADS134LOCATION: TStringField
      FieldName = 'LOCATION'
    end
    object ADS134UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ADS134QUAN_ON_HAND: TBCDField
      FieldName = 'QUAN_ON_HAND'
      Precision = 19
    end
    object ADS134EXPIRE_DATE: TDateTimeField
      FieldName = 'EXPIRE_DATE'
    end
    object ADS134rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object ADS134ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object ADS134SUPPLIER2: TStringField
      FieldName = 'SUPPLIER2'
      Size = 30
    end
    object ADS134INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ADS134RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS134barcode_id: TStringField
      FieldName = 'barcode_id'
      Size = 50
    end
    object ADS134tax_price: TBCDField
      FieldName = 'tax_price'
      Precision = 12
      Size = 3
    end
    object ADS134tax_2: TBCDField
      FieldName = 'tax_2'
      Precision = 4
      Size = 2
    end
    object ADS134exch_rate: TBCDField
      FieldName = 'exch_rate'
      Precision = 12
      Size = 8
    end
    object ADS134ship_by: TStringField
      FieldName = 'ship_by'
    end
    object ADS134rke02: TAutoIncField
      FieldName = 'rke02'
      ReadOnly = True
    end
    object ADS134STOCK_BASE: TFloatField
      FieldName = 'STOCK_BASE'
    end
    object ADS134deliver_number: TStringField
      FieldName = 'deliver_number'
      Size = 15
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS134
    Left = 176
    Top = 439
  end
end
