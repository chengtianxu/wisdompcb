object Form_AllBook: TForm_AllBook
  Left = 292
  Top = 149
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #35746#21333#39044#22788#29702#20449#24687
  ClientHeight = 493
  ClientWidth = 700
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 13
    Top = 17
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#26412#21378#32534#21495':'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 48
    Width = 700
    Height = 396
    Align = alBottom
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 4
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Title.Caption = #26412#21378#32534#21495
        Title.Color = clRed
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Title.Caption = #23458#25143#22411#21495
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANALYSIS_CODE_2'
        Title.Caption = #23458#25143#29289#26009#21495
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_CODE'
        Title.Caption = #23458#25143#20195#30721
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Title.Caption = #23458#25143#35746#21333#21495
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PART_PRICE'
        Title.Caption = #21547#31246#20215#26684
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PARTS_ORDERED'
        Title.Caption = #25968#37327
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UsedQuantity'
        Title.Caption = #24050#19979#21333#25968
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORIG_REQUEST_DATE'
        Title.Caption = #20986#21378#26085#26399
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORIG_SCHED_SHIP_DATE'
        Title.Caption = #20132#36135#26085#26399
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCE_NUMBER'
        Title.Caption = #21442#32771#38468#27880
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WAREHOUSE_CODE'
        Title.Caption = #24037#21378
        Width = 50
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 444
    Width = 700
    Height = 49
    Align = alBottom
    TabOrder = 0
    object Button2: TButton
      Left = 411
      Top = 11
      Width = 75
      Height = 26
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 0
    end
    object Button1: TButton
      Left = 215
      Top = 12
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 1
    end
    object CheckBox1: TCheckBox
      Left = 27
      Top = 20
      Width = 57
      Height = 17
      Caption = #20840#36873
      TabOrder = 2
      OnClick = CheckBox1Click
    end
  end
  object Edit1: TEdit
    Left = 82
    Top = 13
    Width = 166
    Height = 21
    TabOrder = 1
    OnChange = Edit1Change
  end
  object BitBtn3: TBitBtn
    Left = 249
    Top = 11
    Width = 25
    Height = 25
    Hint = #21047#26032
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    TabStop = False
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
  object RadioGroup1: TRadioGroup
    Left = 302
    Top = 3
    Width = 240
    Height = 39
    Caption = #26597#25214#23383#27573
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      #26412#21378#32534#21495
      #23458#25143#22411#21495
      #23458#25143#26009#21495)
    TabOrder = 3
    OnClick = RadioGroup1Click
  end
  object DataSource1: TDataSource
    DataSet = ADO213
    Left = 256
    Top = 216
  end
  object ADO213: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      ''
      'SELECT    data0213. *'
      'FROM         dbo.DATA0213 inner join data0025'
      'on data0025.manu_part_number=data0213.MANU_PART_NUMBER'
      'inner join data0015 on data0015.rkey=data0025.PROD_ROUTE_PTR'
      
        'WHERE    status=3 and data0213.PARTS_ORDERED-IsNull(data0213.Use' +
        'dQuantity,0)>0')
    Left = 272
    Top = 320
    object ADO213RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO213MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADO213PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADO213ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 80
    end
    object ADO213MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADO213ORIG_REQUEST_DATE: TDateTimeField
      FieldName = 'ORIG_REQUEST_DATE'
    end
    object ADO213ORIG_SCHED_SHIP_DATE: TDateTimeField
      FieldName = 'ORIG_SCHED_SHIP_DATE'
    end
    object ADO213PARTS_ORDERED: TIntegerField
      FieldName = 'PARTS_ORDERED'
    end
    object ADO213PART_PRICE: TFloatField
      FieldName = 'PART_PRICE'
    end
    object ADO213CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADO213PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object ADO213status: TWordField
      FieldName = 'status'
    end
    object ADO213user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ADO213submit_date: TDateTimeField
      FieldName = 'submit_date'
    end
    object ADO213audit_ptr: TIntegerField
      FieldName = 'audit_ptr'
    end
    object ADO213audit_date: TDateTimeField
      FieldName = 'audit_date'
    end
    object ADO213so_oldnew: TStringField
      FieldName = 'so_oldnew'
      Size = 50
    end
    object ADO213is_alter: TWordField
      FieldName = 'is_alter'
    end
    object ADO213Lis_num: TStringField
      FieldName = 'Lis_num'
      Size = 50
    end
    object ADO213CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADO213orig_customer: TStringField
      FieldName = 'orig_customer'
      Size = 10
    end
    object ADO213REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
      Size = 50
    end
    object ADO213WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
    end
    object ADO213EDI_FLAG_FOR_INVOICE: TSmallintField
      FieldName = 'EDI_FLAG_FOR_INVOICE'
    end
    object ADO213UsedQuantity: TIntegerField
      FieldName = 'UsedQuantity'
    end
    object ADO213Remark: TStringField
      FieldName = 'Remark'
      Size = 100
    end
    object ADO213close_Ren: TIntegerField
      FieldName = 'close_Ren'
    end
    object ADO213so_style: TWordField
      FieldName = 'so_style'
    end
    object ADO213operateType: TWordField
      FieldName = 'operateType'
    end
    object ADO213lineLocationId: TStringField
      FieldName = 'lineLocationId'
      Size = 50
    end
    object ADO213EditREDATEType: TWordField
      FieldName = 'EditREDATEType'
    end
    object ADO213New_REDATE: TDateTimeField
      FieldName = 'New_REDATE'
    end
    object ADO213Print2DKey: TIntegerField
      FieldName = 'Print2DKey'
    end
  end
end
