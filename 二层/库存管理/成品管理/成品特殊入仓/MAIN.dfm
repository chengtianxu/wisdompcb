object Form1: TForm1
  Left = 250
  Top = 184
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20837#20179#22788#29702
  ClientHeight = 503
  ClientWidth = 677
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
  object Label7: TLabel
    Left = 48
    Top = 46
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #20837#20179#21333#21495':'
  end
  object Label8: TLabel
    Left = 315
    Top = 42
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #20837#20179#26085#26399':'
  end
  object Label9: TLabel
    Left = 74
    Top = 74
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #22791#27880':'
  end
  object Label10: TLabel
    Left = 48
    Top = 176
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #20837#20179#25968#37327':'
  end
  object Label1: TLabel
    Left = 53
    Top = 103
    Width = 54
    Height = 13
    Alignment = taRightJustify
    Caption = 'RAM'#21495#30721':'
    Visible = False
  end
  object Label2: TLabel
    Left = 35
    Top = 127
    Width = 72
    Height = 13
    Alignment = taRightJustify
    Caption = #22806#21457#35746#21333#21495':'
    Visible = False
  end
  object Label3: TLabel
    Left = 315
    Top = 72
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #26412#21378#32534#21495':'
    Visible = False
  end
  object Label4: TLabel
    Left = 381
    Top = 97
    Width = 77
    Height = 13
    Caption = '           '
    Visible = False
  end
  object Label6: TLabel
    Left = 216
    Top = 177
    Width = 78
    Height = 13
    Alignment = taRightJustify
    Caption = #26412#27425#20837#24211#25968#37327
    Visible = False
  end
  object Label5: TLabel
    Left = 310
    Top = 128
    Width = 42
    Height = 13
    Caption = '      '
  end
  object Label11: TLabel
    Left = 442
    Top = 127
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #23458#25143#35746#21333':'
    Visible = False
  end
  object Label12: TLabel
    Left = 415
    Top = 152
    Width = 85
    Height = 13
    Caption = #22806#21457#24050#20837#24211#25968':'
    Visible = False
  end
  object Label13: TLabel
    Left = 605
    Top = 177
    Width = 56
    Height = 13
    Caption = '        '
  end
  object Label14: TLabel
    Left = 467
    Top = 177
    Width = 33
    Height = 13
    Caption = #24037#21378':'
  end
  object Label15: TLabel
    Left = 20
    Top = 152
    Width = 85
    Height = 13
    Caption = #35746#21333#21152#36864#36135#25968':'
    Visible = False
  end
  object Label_so: TLabel
    Left = 504
    Top = 152
    Width = 7
    Height = 13
    Visible = False
  end
  object Edit10: TEdit
    Left = 506
    Top = 148
    Width = 90
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 13
    Visible = False
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 8
    Width = 58
    Height = 25
    Hint = #20445#23384#31243#24207
    Caption = #20445#23384
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TabStop = False
    OnClick = BitBtn1Click
    OnEnter = BitBtn1Enter
    NumGlyphs = 2
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 200
    Width = 677
    Height = 303
    Align = alBottom
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 17
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CUSTOMER_PART_NUMBER'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUSTOMER_PART_DESC'
        Width = 138
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WAREHOUSE_CODE'
        Title.Caption = #24037#21378
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCATION'
        Title.Caption = #20179#24211
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCE_NUMBER'
        Title.Caption = #20855#20307#20301#32622
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        Title.Caption = #25968#37327
        Visible = True
      end>
  end
  object Edit4: TEdit
    Left = 112
    Top = 42
    Width = 121
    Height = 21
    MaxLength = 15
    TabOrder = 4
  end
  object BitBtn4: TBitBtn
    Left = 68
    Top = 8
    Width = 58
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 1
  end
  object Edit5: TEdit
    Left = 381
    Top = 39
    Width = 126
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 2
  end
  object Edit6: TEdit
    Left = 111
    Top = 71
    Width = 188
    Height = 21
    TabOrder = 6
  end
  object Edit7: TEdit
    Left = 111
    Top = 173
    Width = 94
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 14
    Text = '0'
  end
  object Edit1: TEdit
    Left = 111
    Top = 99
    Width = 121
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 8
    Visible = False
  end
  object BitBtn2: TBitBtn
    Left = 238
    Top = 96
    Width = 61
    Height = 25
    Caption = #26597#25214
    TabOrder = 7
    Visible = False
    OnClick = BitBtn2Click
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      04000000000078000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      888800000888880000080F000888880F00080F000888880F0008000000080000
      000800F000000F00000800F000800F00000800F000800F000008800000000000
      0088880F00080F000888880000080000088888800088800088888880F08880F0
      888888800088800088888888888888888888}
  end
  object Edit2: TEdit
    Left = 111
    Top = 123
    Width = 121
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 10
    Visible = False
  end
  object BitBtn3: TBitBtn
    Left = 238
    Top = 122
    Width = 61
    Height = 25
    Caption = #26597#25214
    TabOrder = 9
    Visible = False
    OnClick = BitBtn3Click
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      04000000000078000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      888800000888880000080F000888880F00080F000888880F0008000000080000
      000800F000000F00000800F000800F00000800F000800F000008800000000000
      0088880F00080F000888880000080000088888800088800088888880F08880F0
      888888800088800088888888888888888888}
  end
  object Edit3: TEdit
    Left = 381
    Top = 68
    Width = 124
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 5
    Visible = False
  end
  object Edit9: TEdit
    Left = 301
    Top = 173
    Width = 102
    Height = 21
    TabOrder = 15
    Text = '0'
    Visible = False
    OnKeyPress = Edit9KeyPress
    OnKeyUp = Edit9KeyUp
  end
  object CheckBox1: TCheckBox
    Left = 517
    Top = 40
    Width = 97
    Height = 17
    Caption = #22996#22806#36864#36135#20837#20179
    TabOrder = 3
    Visible = False
  end
  object Edit8: TEdit
    Left = 505
    Top = 123
    Width = 121
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 11
    Visible = False
  end
  object Edit11: TEdit
    Left = 506
    Top = 173
    Width = 91
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 16
  end
  object Edit12: TEdit
    Left = 111
    Top = 148
    Width = 94
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 12
    Visible = False
  end
  object ADO53: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey416'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Data0053.*'
      ''
      'FROM Data0053'
      ''
      'where data0053.npad_ptr=:rkey416')
    Left = 224
    Top = 272
    object ADO53RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO53WHSE_PTR: TIntegerField
      FieldName = 'WHSE_PTR'
    end
    object ADO53LOC_PTR: TIntegerField
      FieldName = 'LOC_PTR'
    end
    object ADO53WORK_ORDER_PTR: TIntegerField
      FieldName = 'WORK_ORDER_PTR'
    end
    object ADO53CUST_PART_PTR: TIntegerField
      FieldName = 'CUST_PART_PTR'
    end
    object ADO53QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object ADO53QTY_ON_HAND: TFloatField
      FieldName = 'QTY_ON_HAND'
    end
    object ADO53QTY_ALLOC: TFloatField
      FieldName = 'QTY_ALLOC'
    end
    object ADO53MFG_DATE: TDateTimeField
      FieldName = 'MFG_DATE'
    end
    object ADO53RMA_PTR: TIntegerField
      FieldName = 'RMA_PTR'
    end
    object ADO53NPAD_PTR: TIntegerField
      FieldName = 'NPAD_PTR'
    end
    object ADO53REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
      FixedChar = True
    end
    object ADO53USER_DATE: TDateTimeField
      FieldName = 'USER_DATE'
    end
    object ADO53barcode_ptr: TIntegerField
      FieldName = 'barcode_ptr'
    end
    object ADO53PO_NUMBER: TStringField
      DisplayWidth = 25
      FieldName = 'PO_NUMBER'
      Size = 100
    end
    object ADO53WAREHOUSE_CODE: TStringField
      FieldKind = fkLookup
      FieldName = 'WAREHOUSE_CODE'
      LookupDataSet = DM.ADOT15
      LookupKeyFields = 'RKEY'
      LookupResultField = 'WAREHOUSE_CODE'
      KeyFields = 'WHSE_PTR'
      Size = 5
      Lookup = True
    end
    object ADO53LOCATION: TStringField
      FieldKind = fkLookup
      FieldName = 'LOCATION'
      LookupDataSet = DM.ADOT16
      LookupKeyFields = 'RKEY'
      LookupResultField = 'LOCATION'
      KeyFields = 'LOC_PTR'
      Lookup = True
    end
    object ADO53WAREHOUSE_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'WAREHOUSE_NAME'
      LookupDataSet = DM.ADOT15
      LookupKeyFields = 'RKEY'
      LookupResultField = 'ABBR_NAME'
      KeyFields = 'WHSE_PTR'
      Size = 70
      Lookup = True
    end
    object ADO53CODE: TStringField
      FieldKind = fkLookup
      FieldName = 'CODE'
      LookupDataSet = DM.ADOT16
      LookupKeyFields = 'RKEY'
      LookupResultField = 'CODE'
      KeyFields = 'LOC_PTR'
      Size = 5
      Lookup = True
    end
    object ADO53CUSTOMER_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldKind = fkLookup
      FieldName = 'CUSTOMER_PART_NUMBER'
      LookupDataSet = DM.aq50
      LookupKeyFields = 'rkey'
      LookupResultField = 'MANU_PART_NUMBER'
      KeyFields = 'CUST_PART_PTR'
      Lookup = True
    end
    object ADO53CUSTOMER_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldKind = fkLookup
      FieldName = 'CUSTOMER_PART_DESC'
      LookupDataSet = DM.aq50
      LookupKeyFields = 'rkey'
      LookupResultField = 'MANU_PART_DESC'
      KeyFields = 'CUST_PART_PTR'
      Size = 40
      Lookup = True
    end
    object ADO53cost_pcs: TFloatField
      FieldName = 'cost_pcs'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO53
    Left = 72
    Top = 296
  end
  object ADOQuery2: TADOQuery
    Connection = DM.ADOConnection1
    ParamCheck = False
    Parameters = <>
    Left = 60
    Top = 264
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 112
    Top = 349
    object N1: TMenuItem
      Caption = #26032#22686
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #32534#36753
      OnClick = N2Click
    end
    object N4: TMenuItem
      Caption = #21024#38500
      OnClick = N4Click
    end
  end
  object ADO04: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from data0004'
      'where rkey=5')
    Left = 240
    Top = 39
    object ADO04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object ADO04SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 384
    Top = 8
  end
end
