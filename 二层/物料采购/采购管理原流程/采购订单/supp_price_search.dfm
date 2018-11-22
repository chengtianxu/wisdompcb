object Form3: TForm3
  Left = 235
  Top = 172
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20379#24212#21830#20215#26684#25628#32034
  ClientHeight = 421
  ClientWidth = 713
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 340
    Top = 42
    Width = 98
    Height = 13
    Alignment = taRightJustify
    Caption = #20379#24212#21830#30005#35805#21495#30721':'
  end
  object Label2: TLabel
    Left = 340
    Top = 16
    Width = 98
    Height = 13
    Alignment = taRightJustify
    Caption = #20379#24212#21830#37096#20214#21495#30721':'
  end
  object Label5: TLabel
    Left = 340
    Top = 68
    Width = 98
    Height = 13
    Alignment = taRightJustify
    Caption = #20379#24212#21830#20132#36135#26102#38388':'
  end
  object Label11: TLabel
    Left = 495
    Top = 66
    Width = 47
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#22825#25968
  end
  object Label3: TLabel
    Left = 405
    Top = 95
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #36135#24065':'
  end
  object DBText1: TDBText
    Left = 512
    Top = 93
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'curr_name'
    DataSource = DataSource1
  end
  object Label7: TLabel
    Left = 379
    Top = 122
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #37319#36141#21333#20301':'
  end
  object DBText2: TDBText
    Left = 511
    Top = 121
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'unit_name'
    DataSource = DataSource1
  end
  object Label4: TLabel
    Left = 379
    Top = 175
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #35748#21487#26631#35760':'
  end
  object Label8: TLabel
    Left = 305
    Top = 149
    Width = 133
    Height = 13
    Alignment = taRightJustify
    Caption = '  '#23384#36135'/'#37319#36141'('#36716#25442#29575'):'
  end
  object Label19: TLabel
    Left = 353
    Top = 229
    Width = 85
    Height = 13
    Alignment = taRightJustify
    Caption = #24314#35758#37325#36141#25968#37327':'
  end
  object Label17: TLabel
    Left = 539
    Top = 175
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #35746#36141#26041#27861':'
  end
  object Label18: TLabel
    Left = 320
    Top = 203
    Width = 118
    Height = 13
    Alignment = taRightJustify
    Caption = #26368#23569#35746#36141#25968#37327'/'#37329#39069':'
  end
  object Label6: TLabel
    Left = 552
    Top = 229
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = #22686#20540#31246':'
  end
  object Label9: TLabel
    Left = 540
    Top = 147
    Width = 59
    Height = 13
    Caption = #29615#20445#26631#35782':'
    FocusControl = DBEdit12
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 309
    Height = 401
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = Button1Click
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'code'
        Title.Caption = #20379#23601#21830#20195#30721
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'supplier_name'
        Title.Caption = #20379#24212#21830#21517#31216
        Width = 206
        Visible = True
      end>
  end
  object Bar1: TStatusBar
    Left = 0
    Top = 402
    Width = 713
    Height = 19
    Panels = <>
  end
  object DBEdit1: TDBEdit
    Left = 442
    Top = 37
    Width = 97
    Height = 21
    Color = cl3DLight
    DataField = 'phone'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBEdit2: TDBEdit
    Left = 442
    Top = 12
    Width = 121
    Height = 21
    Color = cl3DLight
    DataField = 'supplier_part_no'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBEdit3: TDBEdit
    Left = 442
    Top = 63
    Width = 61
    Height = 21
    Color = cl3DLight
    DataField = 'lead_time'
    DataSource = DataSource1
    TabOrder = 4
  end
  object DBEdit4: TDBEdit
    Left = 442
    Top = 90
    Width = 61
    Height = 21
    Color = cl3DLight
    DataField = 'curr_code'
    DataSource = DataSource1
    TabOrder = 5
  end
  object DBEdit5: TDBEdit
    Left = 442
    Top = 117
    Width = 61
    Height = 21
    Color = cl3DLight
    DataField = 'unit_code'
    DataSource = DataSource1
    TabOrder = 6
  end
  object DBEdit6: TDBEdit
    Left = 442
    Top = 144
    Width = 61
    Height = 21
    Color = cl3DLight
    DataField = 'CONVERSION_FACTOR'
    DataSource = DataSource1
    TabOrder = 7
  end
  object DBEdit7: TDBEdit
    Left = 442
    Top = 225
    Width = 81
    Height = 21
    Color = cl3DLight
    DataField = 'sugg_reorder_qty'
    DataSource = DataSource1
    TabOrder = 8
  end
  object DBEdit8: TDBEdit
    Left = 442
    Top = 171
    Width = 82
    Height = 21
    Color = cl3DLight
    DataField = 'v_flag'
    DataSource = DataSource1
    TabOrder = 9
  end
  object DBEdit9: TDBEdit
    Left = 602
    Top = 171
    Width = 81
    Height = 21
    Color = cl3DLight
    DataField = 'v_meoth'
    DataSource = DataSource1
    TabOrder = 10
  end
  object DBEdit10: TDBEdit
    Left = 442
    Top = 198
    Width = 81
    Height = 21
    Color = cl3DLight
    DataField = 'v_min_order'
    DataSource = DataSource1
    TabOrder = 11
  end
  object StringGrid1: TStringGrid
    Left = 319
    Top = 257
    Width = 306
    Height = 138
    ColCount = 4
    DefaultRowHeight = 18
    RowCount = 7
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
    TabOrder = 12
    ColWidths = (
      78
      75
      80
      64)
  end
  object Button1: TButton
    Left = 632
    Top = 364
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 13
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 632
    Top = 324
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 14
  end
  object DBEdit11: TDBEdit
    Left = 602
    Top = 225
    Width = 81
    Height = 21
    Color = cl3DLight
    DataField = 'tax_2'
    DataSource = DataSource1
    TabOrder = 15
  end
  object DBCheckBox1: TDBCheckBox
    Left = 571
    Top = 200
    Width = 112
    Height = 17
    Caption = #20379#24212#21830#20215#26684#21547#31246
    DataField = 'tax_flag'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 16
    ValueChecked = 'Y'
    ValueUnchecked = 'N'
  end
  object DBEdit12: TDBEdit
    Left = 602
    Top = 144
    Width = 73
    Height = 21
    Color = cl3DLight
    DataField = 'rohs'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 17
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    AfterScroll = ADOQuery1AfterScroll
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select data0023.code,data0023.supplier_name,data0023.phone,'
      '       data0028.supplier_part_no,data0028.sugg_reorder_qty,'
      
        '       data0028.lead_time,data0028.rkey as rkey28,data0028.CONVE' +
        'RSION_FACTOR,'
      '       data0028.avl_flag,data0028.AMT_QUAN_FLAG,data0028.tax_2,'
      '       data0028.MIN_ORDER_QTY,data0028.MIN_ORDER_AMT,'
      '       data0028.currency_ptr,data0028.purchase_unit_ptr,'
      
        '       data0001.curr_name,data0001.curr_code,data0023.rkey as rk' +
        'ey23,'
      '       data0002.unit_code,data0002.unit_name,data0028.tax_flag,'
      '       PRICE_1,PRICE_2,PRICE_3,PRICE_4,PRICE_5,PRICE_6,'
      '       QUAN_VOL_1,QUAN_VOL_2,QUAN_VOL_3,QUAN_VOL_4,QUAN_VOL_5,'
      '       data0028.DISC_1,data0028.DISC_2,data0028.DISC_3,'
      '       data0028.DISC_4,data0028.DISC_5,DISC_6,data0028.rohs'
      'from data0017,data0023,data0028,data0001,data0002'
      'where data0028.inventory_ptr=data0017.rkey and'
      '      data0028.supplier_ptr=data0023.rkey  and'
      '      data0028.currency_ptr=data0001.rkey and'
      '      data0028.purchase_unit_ptr=data0002.rkey and'
      '      data0028.inventory_ptr = :rkey and'
      '      data0023.status=0'
      'order by'
      ' data0023.code'
      ' ')
    Left = 48
    Top = 360
    object ADOQuery1code: TStringField
      FieldName = 'code'
      Size = 5
    end
    object ADOQuery1supplier_name: TStringField
      FieldName = 'supplier_name'
      Size = 30
    end
    object ADOQuery1phone: TStringField
      FieldName = 'phone'
      FixedChar = True
      Size = 14
    end
    object ADOQuery1supplier_part_no: TStringField
      FieldName = 'supplier_part_no'
    end
    object ADOQuery1sugg_reorder_qty: TFloatField
      Alignment = taLeftJustify
      FieldName = 'sugg_reorder_qty'
      DisplayFormat = '0.000'
    end
    object ADOQuery1lead_time: TSmallintField
      FieldName = 'lead_time'
    end
    object ADOQuery1CONVERSION_FACTOR: TFloatField
      Alignment = taLeftJustify
      FieldName = 'CONVERSION_FACTOR'
      DisplayFormat = '0.0000'
    end
    object ADOQuery1avl_flag: TStringField
      FieldName = 'avl_flag'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1curr_name: TStringField
      FieldName = 'curr_name'
    end
    object ADOQuery1curr_code: TStringField
      FieldName = 'curr_code'
      Size = 5
    end
    object ADOQuery1unit_code: TStringField
      FieldName = 'unit_code'
      Size = 5
    end
    object ADOQuery1unit_name: TStringField
      FieldName = 'unit_name'
    end
    object ADOQuery1AMT_QUAN_FLAG: TWordField
      FieldName = 'AMT_QUAN_FLAG'
    end
    object ADOQuery1v_flag: TStringField
      FieldKind = fkCalculated
      FieldName = 'v_flag'
      Size = 8
      Calculated = True
    end
    object ADOQuery1v_meoth: TStringField
      DisplayWidth = 6
      FieldKind = fkCalculated
      FieldName = 'v_meoth'
      Size = 6
      Calculated = True
    end
    object ADOQuery1v_min_order: TFloatField
      Alignment = taLeftJustify
      FieldKind = fkCalculated
      FieldName = 'v_min_order'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object ADOQuery1MIN_ORDER_QTY: TFloatField
      FieldName = 'MIN_ORDER_QTY'
    end
    object ADOQuery1MIN_ORDER_AMT: TFloatField
      FieldName = 'MIN_ORDER_AMT'
    end
    object ADOQuery1tax_2: TFloatField
      Alignment = taLeftJustify
      FieldName = 'tax_2'
      DisplayFormat = '0.00'
    end
    object ADOQuery1PRICE_1: TFloatField
      FieldName = 'PRICE_1'
    end
    object ADOQuery1PRICE_2: TFloatField
      FieldName = 'PRICE_2'
    end
    object ADOQuery1PRICE_3: TFloatField
      FieldName = 'PRICE_3'
    end
    object ADOQuery1PRICE_4: TFloatField
      FieldName = 'PRICE_4'
    end
    object ADOQuery1PRICE_5: TFloatField
      FieldName = 'PRICE_5'
    end
    object ADOQuery1PRICE_6: TFloatField
      FieldName = 'PRICE_6'
    end
    object ADOQuery1QUAN_VOL_1: TFloatField
      FieldName = 'QUAN_VOL_1'
    end
    object ADOQuery1QUAN_VOL_2: TFloatField
      FieldName = 'QUAN_VOL_2'
    end
    object ADOQuery1QUAN_VOL_3: TFloatField
      FieldName = 'QUAN_VOL_3'
    end
    object ADOQuery1QUAN_VOL_4: TFloatField
      FieldName = 'QUAN_VOL_4'
    end
    object ADOQuery1QUAN_VOL_5: TFloatField
      FieldName = 'QUAN_VOL_5'
    end
    object ADOQuery1DISC_1: TFloatField
      FieldName = 'DISC_1'
    end
    object ADOQuery1DISC_2: TFloatField
      FieldName = 'DISC_2'
    end
    object ADOQuery1DISC_3: TFloatField
      FieldName = 'DISC_3'
    end
    object ADOQuery1DISC_4: TFloatField
      FieldName = 'DISC_4'
    end
    object ADOQuery1DISC_5: TFloatField
      FieldName = 'DISC_5'
    end
    object ADOQuery1DISC_6: TFloatField
      FieldName = 'DISC_6'
    end
    object ADOQuery1rkey28: TIntegerField
      FieldName = 'rkey28'
      ReadOnly = True
    end
    object ADOQuery1rkey23: TIntegerField
      FieldName = 'rkey23'
      ReadOnly = True
    end
    object ADOQuery1currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
    object ADOQuery1purchase_unit_ptr: TIntegerField
      FieldName = 'purchase_unit_ptr'
    end
    object ADOQuery1tax_flag: TStringField
      FieldName = 'tax_flag'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 16
    Top = 360
  end
end
