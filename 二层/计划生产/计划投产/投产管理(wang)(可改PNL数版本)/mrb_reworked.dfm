object Form_MRBREWORKED: TForm_MRBREWORKED
  Left = 478
  Top = 198
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25353'MRB'#36820#24037
  ClientHeight = 534
  ClientWidth = 581
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 493
    Width = 581
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 204
      Top = 10
      Width = 75
      Height = 25
      Caption = #30830#23450
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 300
      Top = 10
      Width = 75
      Height = 25
      Cancel = True
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 581
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 164
      Top = 14
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = 'MRB'#32534#21495
    end
    object Edit1: TEdit
      Left = 215
      Top = 10
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
      OnKeyDown = DBGridEh1KeyDown
    end
    object BitBtn3: TBitBtn
      Left = 344
      Top = 8
      Width = 25
      Height = 25
      Hint = #21047#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BitBtn3Click
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
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 581
    Height = 452
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGridEh1DblClick
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'number'
        Footers = <>
        Title.Color = clRed
        Title.SortIndex = 1
        Title.SortMarker = smUpEh
        Width = 78
      end
      item
        EditButtons = <>
        FieldName = 'sys_date'
        Footers = <>
        ReadOnly = False
        Width = 76
      end
      item
        EditButtons = <>
        FieldName = 'CUST_CODE'
        Footers = <>
        Width = 61
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_NUMBER'
        Footers = <>
        Width = 88
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_DESC'
        Footers = <>
        Width = 129
      end
      item
        EditButtons = <>
        FieldName = 'qty_rece'
        Footers = <>
        ReadOnly = False
        Width = 78
      end
      item
        EditButtons = <>
        FieldName = 'SALES_ORDER'
        Footers = <>
      end>
  end
  object ads414: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      '  SELECT     TOP (100) PERCENT dbo.data0414.rkey, dbo.data0415.c' +
      'ustpart_ptr, dbo.data0414.number, dbo.data0414.sys_date, dbo.Dat' +
      'a0010.CUST_CODE, '#13#10'                      dbo.data0414.qty_rece, ' +
      'dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC, dbo.' +
      'data0414.qty_to_be_reworked, dbo.Data0010.ABBR_NAME, '#13#10'         ' +
      '             dbo.Data0025.OPT_LOT_SIZE, dbo.Data0025.EST_SCRAP, ' +
      'dbo.Data0025.CUSTOMER_PTR, dbo.Data0060.SALES_ORDER'#13#10'FROM       ' +
      '  dbo.Data0098 LEFT OUTER JOIN'#13#10'                      dbo.Data00' +
      '60 ON dbo.Data0098.SO_PTR = dbo.Data0060.RKEY RIGHT OUTER JOIN'#13#10 +
      '                      dbo.data0415 INNER JOIN'#13#10'                 ' +
      '     dbo.data0414 ON dbo.data0415.rkey = dbo.data0414.d415_ptr I' +
      'NNER JOIN'#13#10'                      dbo.Data0025 ON dbo.data0415.cu' +
      'stpart_ptr = dbo.Data0025.RKEY INNER JOIN'#13#10'                     ' +
      ' dbo.Data0010 ON dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY O' +
      'N dbo.Data0098.RKEY = dbo.data0415.rma_ptr'#13#10'WHERE     (dbo.data0' +
      '414.status = 2) AND (dbo.data0414.QTY_REWORKED = 0)'
    IndexFieldNames = 'number'
    Parameters = <>
    Left = 120
    Top = 144
    object ads414rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ads414custpart_ptr: TIntegerField
      FieldName = 'custpart_ptr'
    end
    object ads414number: TStringField
      DisplayLabel = 'MRB'#32534#21495
      FieldName = 'number'
      Size = 15
    end
    object ads414sys_date: TDateTimeField
      DisplayLabel = #22788#29702#26085#26399
      FieldName = 'sys_date'
    end
    object ads414CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ads414MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ads414MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ads414ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ads414qty_to_be_reworked: TIntegerField
      DisplayLabel = #24453#36820#24037
      FieldName = 'qty_to_be_reworked'
    end
    object ads414OPT_LOT_SIZE: TIntegerField
      FieldName = 'OPT_LOT_SIZE'
    end
    object ads414EST_SCRAP: TFloatField
      FieldName = 'EST_SCRAP'
    end
    object ads414CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object ads414qty_rece: TIntegerField
      DisplayLabel = #26816#35270#25968#37327
      FieldName = 'qty_rece'
    end
    object ads414SALES_ORDER: TStringField
      DisplayLabel = #35746#21333#21495
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
  end
  object DataSource1: TDataSource
    DataSet = ads414
    OnDataChange = DataSource1DataChange
    Left = 88
    Top = 144
  end
end
