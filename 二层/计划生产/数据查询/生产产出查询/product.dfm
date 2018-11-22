object Form_product: TForm_product
  Left = 270
  Top = 149
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26412#21378#32534#21495#25628#32034
  ClientHeight = 520
  ClientWidth = 538
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
    Width = 538
    Height = 36
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 96
      Top = 12
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #26412#21378#32534#21495
    end
    object Edit1: TEdit
      Left = 150
      Top = 8
      Width = 161
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
      OnKeyDown = DBGrid1KeyDown
    end
    object BitBtn1: TBitBtn
      Left = 319
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
      Left = 352
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
    Top = 479
    Width = 538
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      538
      41)
    object Button1: TButton
      Left = 174
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 271
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
    Width = 538
    Height = 443
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
        FieldName = 'MANU_PART_NUMBER'
        Title.Color = clRed
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Width = 144
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANALYSIS_CODE_2'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 84
        Visible = True
      end>
  end
  object ads50: TADODataSet
    Connection = Form_condition.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.Data0025.PROD_CODE_PTR, dbo.Data0008.PROD_CODE, '#13#10'   ' +
      '   dbo.Data0008.PRODUCT_NAME, dbo.Data0010.CUST_CODE, '#13#10'      db' +
      'o.Data0010.ABBR_NAME, dbo.Data0025.RKEY AS rkey25, '#13#10'      dbo.D' +
      'ata0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC, '#13#10'      d' +
      'bo.Data0025.ANALYSIS_CODE_2, dbo.Data0025.set_lngth, dbo.Data002' +
      '5.set_width, '#13#10'      dbo.Data0025.set_qty'#13#10'FROM dbo.Data0025 INN' +
      'ER JOIN'#13#10'      dbo.Data0008 ON '#13#10'      dbo.Data0025.PROD_CODE_PT' +
      'R = dbo.Data0008.RKEY INNER JOIN'#13#10'      dbo.Data0010 ON dbo.Data' +
      '0025.CUSTOMER_PTR = dbo.Data0010.RKEY'#13#10'order by dbo.Data0025.MAN' +
      'U_PART_NUMBER'
    IndexFieldNames = 'MANU_PART_NUMBER'
    Parameters = <>
    Left = 120
    Top = 312
    object ads50ANALYSIS_CODE_2: TStringField
      DisplayLabel = #23458#25143#29289#26009#21495
      FieldName = 'ANALYSIS_CODE_2'
      Size = 50
    end
    object ads50set_lngth: TFloatField
      FieldName = 'set_lngth'
    end
    object ads50set_width: TFloatField
      FieldName = 'set_width'
    end
    object ads50PROD_CODE_PTR: TIntegerField
      FieldName = 'PROD_CODE_PTR'
    end
    object ads50PROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ads50PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ads50CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ads50ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ads50rkey25: TIntegerField
      FieldName = 'rkey25'
      ReadOnly = True
    end
    object ads50MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ads50MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ads50set_qty: TIntegerField
      FieldName = 'set_qty'
    end
  end
  object DataSource1: TDataSource
    DataSet = ads50
    OnDataChange = DataSource1DataChange
    Left = 80
    Top = 312
  end
end
