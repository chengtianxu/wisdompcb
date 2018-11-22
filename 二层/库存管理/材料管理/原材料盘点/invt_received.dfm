object Form6: TForm6
  Left = 270
  Top = 144
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24211#23384#26448#26009#25628#32034
  ClientHeight = 452
  ClientWidth = 511
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 511
    Height = 409
    Align = alTop
    DataSource = DataSource1
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'abbr_name'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BARCODE_ID'
        Title.Caption = 'BARCODE'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WAREHOUSE_CODE'
        Title.Caption = #20179#24211#20195#30721
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCATION'
        Title.Caption = #20301#32622
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_ON_HAND'
        Title.Caption = #21487#29992#25968#37327
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXPIRE_DATE'
        Title.Caption = #26377#25928#26399
        Width = 87
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 172
    Top = 421
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 252
    Top = 421
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey15'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey17'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT dbo.Data0022.RKEY, dbo.Data0022.INVENTORY_PTR, '
      '      dbo.Data0023.ABBR_NAME, dbo.Data0022.BARCODE_ID, '
      '      dbo.Data0022.EXPIRE_DATE, dbo.Data0022.QUAN_ON_HAND, '
      
        '      dbo.Data0015.WAREHOUSE_CODE, dbo.Data0016.CODE, dbo.Data00' +
        '16.LOCATION, '
      '      dbo.Data0022.LOCATION_PTR'
      'FROM dbo.Data0022 INNER JOIN'
      
        '      dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Data0016.R' +
        'KEY INNER JOIN'
      
        '      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY I' +
        'NNER JOIN'
      
        '      dbo.Data0015 ON dbo.Data0456.warehouse_ptr = dbo.Data0015.' +
        'RKEY INNER JOIN'
      '      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY'
      'where data0456.WAREHOUSE_PTR=:rkey15 and'
      '      data0022.INVENTORY_PTR=:rkey17')
    Left = 397
    Top = 416
    object ADOQuery1RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery1INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ADOQuery1LOCATION_PTR: TIntegerField
      FieldName = 'LOCATION_PTR'
    end
    object ADOQuery1BARCODE_ID: TStringField
      FieldName = 'BARCODE_ID'
      FixedChar = True
      Size = 12
    end
    object ADOQuery1EXPIRE_DATE: TDateTimeField
      FieldName = 'EXPIRE_DATE'
    end
    object ADOQuery1QUAN_ON_HAND: TFloatField
      FieldName = 'QUAN_ON_HAND'
      DisplayFormat = '0.0000'
    end
    object ADOQuery1WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADOQuery1CODE: TStringField
      FieldName = 'CODE'
      FixedChar = True
      Size = 5
    end
    object ADOQuery1LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 10
    end
    object ADOQuery1abbr_name: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'abbr_name'
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 365
    Top = 416
  end
end
