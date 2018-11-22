object Form_custrma: TForm_custrma
  Left = 242
  Top = 119
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23458#25143#36864#36135#26597#35810
  ClientHeight = 547
  ClientWidth = 739
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 202
    Top = 11
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #21457#31080#32534#21495':'
  end
  object Edit1: TEdit
    Left = 264
    Top = 6
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 32
    Width = 735
    Height = 474
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
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
        FieldName = 'RMA_NUMBER'
        Title.Color = clRed
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RMA_DATE'
        ReadOnly = False
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sys_date'
        ReadOnly = False
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALES_ORDER'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTY_RECD'
        ReadOnly = False
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PART_PRICE'
        ReadOnly = False
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RUSH_CHARGE'
        ReadOnly = False
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax_in_price'
        ReadOnly = False
        Width = 55
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Width = 44
        Visible = True
      end>
  end
  object Button2: TButton
    Left = 291
    Top = 513
    Width = 75
    Height = 25
    Caption = #20851#38381
    ModalResult = 2
    TabOrder = 2
  end
  object BitBtn3: TBitBtn
    Left = 394
    Top = 513
    Width = 76
    Height = 25
    Hint = #23548#20986#25968#25454#21040'Excel'
    Caption = #23548#20986
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = BitBtn3Click
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
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 72
    Top = 448
  end
  object ADODataSet1: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.Data0098.RMA_NUMBER, dbo.Data0098.RMA_DATE, '#13#10'dbo' +
      '.Data0060.SALES_ORDER, dbo.Data0025.MANU_PART_NUMBER, dbo.Data00' +
      '25.MANU_PART_DESC, '#13#10'                      dbo.Data0098.QTY_RECD' +
      ', dbo.Data0060.PART_PRICE, '#13#10'dbo.Data0060.tax_in_price, dbo.Data' +
      '0010.CUST_CODE, dbo.Data0010.ABBR_NAME, '#13#10'                      ' +
      'dbo.Data0001.CURR_NAME, dbo.Data0098.tax_2 as RUSH_CHARGE, dbo.d' +
      'ata0416.sys_date'#13#10'FROM         dbo.Data0098 INNER JOIN'#13#10'        ' +
      '              dbo.Data0025 ON dbo.Data0098.CUSTOMER_PART_PTR = d' +
      'bo.Data0025.RKEY INNER JOIN'#13#10'                      dbo.Data0060 ' +
      'ON dbo.Data0098.SO_PTR = dbo.Data0060.RKEY INNER JOIN'#13#10'         ' +
      '             dbo.Data0010 ON dbo.Data0098.CUSTOMER_PTR = dbo.Dat' +
      'a0010.RKEY INNER JOIN'#13#10'                      dbo.Data0001 ON dbo' +
      '.Data0060.CURRENCY_PTR = dbo.Data0001.RKEY INNER JOIN'#13#10'         ' +
      '             dbo.data0416 ON dbo.Data0098.RKEY = dbo.data0416.rm' +
      'a_ptr'#13#10'WHERE     (dbo.Data0098.RMA_STATUS = 3) AND (dbo.Data0098' +
      '.NOTE_PAD_PTR = 0)'
    IndexFieldNames = 'RMA_NUMBER'
    Parameters = <>
    Left = 104
    Top = 448
    object ADODataSet1RMA_NUMBER: TStringField
      DisplayLabel = 'RMA'#21495#30721
      FieldName = 'RMA_NUMBER'
      FixedChar = True
      Size = 10
    end
    object ADODataSet1RMA_DATE: TDateTimeField
      DisplayLabel = #36864#36135#26085#26399
      FieldName = 'RMA_DATE'
    end
    object ADODataSet1SALES_ORDER: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADODataSet1QTY_RECD: TIntegerField
      DisplayLabel = #36864#36135#25968#37327
      FieldName = 'QTY_RECD'
    end
    object ADODataSet1PART_PRICE: TFloatField
      DisplayLabel = #20215#26684
      FieldName = 'PART_PRICE'
    end
    object ADODataSet1tax_in_price: TStringField
      DisplayLabel = #20215#26684#21547#31246
      FieldName = 'tax_in_price'
      FixedChar = True
      Size = 1
    end
    object ADODataSet1CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADODataSet1ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADODataSet1CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
    end
    object ADODataSet1RUSH_CHARGE: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'RUSH_CHARGE'
      Precision = 5
      Size = 2
    end
    object ADODataSet1MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADODataSet1MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADODataSet1sys_date: TDateTimeField
      DisplayLabel = #20837#24211#26085#26399
      FieldName = 'sys_date'
    end
  end
end
