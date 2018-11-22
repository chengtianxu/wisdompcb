object Form_quoteinvt: TForm_quoteinvt
  Left = 272
  Top = 160
  Width = 890
  Height = 541
  Caption = #25253#20215#26448#26009#25628#32034
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 874
    Height = 36
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 202
      Top = 12
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #26448#26009#32534#30721
    end
    object Edit1: TEdit
      Left = 255
      Top = 8
      Width = 161
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
      OnKeyDown = DBGrid1KeyDown
    end
    object BitBtn1: TBitBtn
      Left = 424
      Top = 5
      Width = 26
      Height = 26
      Hint = #21047#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = False
      OnClick = BitBtn1Click
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
    object RadioGroup1: TRadioGroup
      Left = 456
      Top = 2
      Width = 151
      Height = 34
      Caption = #26597#25214#26041#24335
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #21069#26041#19968#33268
        #27169#31946#26597#25214)
      TabOrder = 2
      OnClick = RadioGroup1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 462
    Width = 874
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      874
      41)
    object Button1: TButton
      Left = 310
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 468
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 36
    Width = 874
    Height = 426
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
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
        Title.Color = clRed
        Width = 152
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_NAME'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Width = 220
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODE'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUPPLIER_PART_NO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'price1'
        ReadOnly = False
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTE_PRICE'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BASE_TO_OTHER'
        ReadOnly = False
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TDATE'
        ReadOnly = False
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STOCK_SELL'
        Visible = True
      end>
  end
  object ads28: TADODataSet
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT TOP 100 PERCENT dbo.Data0023.CODE, dbo.Data0023.ABBR_NAME' +
      ', '#13#10'      dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, '#13 +
      #10'      dbo.Data0017.INV_DESCRIPTION,Data0028.QTE_PRICE,'#13#10'      d' +
      'bo.Data0028.QTE_PRICE * dbo.Data0001.BASE_TO_OTHER AS price1, '#13#10 +
      '      dbo.Data0028.TDATE, dbo.Data0028.RKEY, dbo.Data0017.RKEY A' +
      'S d0017_rkey, '#13#10'      dbo.Data0002.UNIT_NAME, dbo.Data0001.CURR_' +
      'NAME, '#13#10'      dbo.Data0001.BASE_TO_OTHER,DATA0028.SUPPLIER_PART_' +
      'NO,DATA0017.STOCK_SELL'#13#10'FROM dbo.Data0002 INNER JOIN'#13#10'      dbo.' +
      'Data0028 INNER JOIN'#13#10'      dbo.Data0023 ON dbo.Data0028.SUPPLIER' +
      '_PTR = dbo.Data0023.RKEY INNER JOIN'#13#10'      dbo.Data0017 ON dbo.D' +
      'ata0028.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN'#13#10'      dbo.' +
      'Data0001 ON dbo.Data0028.CURRENCY_PTR = dbo.Data0001.RKEY INNER ' +
      'JOIN'#13#10'      dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data049' +
      '6.RKEY ON '#13#10'      dbo.Data0002.RKEY = dbo.Data0028.PURCHASE_UNIT' +
      '_PTR'#13#10'WHERE (Data0028.QTE_PRICE > 0) AND '#13#10'              (Data04' +
      '96.quote_flag = 1) and'#13#10'              (data0028.AVL_FLAG <> '#39'N'#39')' +
      ' and'#13#10'              (data0023.status = 0) and'#13#10'              (da' +
      'ta0017.STOP_PURCH='#39'N'#39') and'#13#10'              (Data0017.INV_PART_NUM' +
      'BER like :invnumber)'#13#10
    IndexFieldNames = 'INV_PART_NUMBER'
    Parameters = <
      item
        Name = 'invnumber'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 25
        Value = Null
      end>
    Left = 104
    Top = 456
    object ads28INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ads28INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ads28INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ads28UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ads28CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object ads28ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ads28TDATE: TDateTimeField
      DisplayLabel = #20462#25913#26085#26399
      FieldName = 'TDATE'
    end
    object ads28RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ads28d0017_rkey: TIntegerField
      FieldName = 'd0017_rkey'
      ReadOnly = True
    end
    object ads28CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
    end
    object ads28BASE_TO_OTHER: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'BASE_TO_OTHER'
    end
    object ads28QTE_PRICE: TFloatField
      DisplayLabel = #21407#24065#20215#26684
      FieldName = 'QTE_PRICE'
    end
    object ads28price1: TFloatField
      DisplayLabel = #26412#24065#20215#26684
      FieldName = 'price1'
      ReadOnly = True
    end
    object ads28SUPPLIER_PART_NO: TStringField
      DisplayLabel = #20379#24212#21830#22411#21495
      FieldName = 'SUPPLIER_PART_NO'
    end
    object ads28STOCK_SELL: TFloatField
      DisplayLabel = #21333#20301#38754#31215
      FieldName = 'STOCK_SELL'
    end
  end
  object DataSource1: TDataSource
    DataSet = ads28
    Left = 72
    Top = 456
  end
end
