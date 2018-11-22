object Form12: TForm12
  Left = 288
  Top = 137
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25253#20215#21333#26597#35810
  ClientHeight = 507
  ClientWidth = 615
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 71
    Top = 18
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = #25253#20215#21333#21495
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 48
    Width = 615
    Height = 408
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = Button1Click
    Columns = <
      item
        Expanded = False
        FieldName = 'TNUMBER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ttype'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_NAME'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_PART_NO'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qte_unit'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quote_price'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quote_taxprice'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vatax'
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 186
    Top = 475
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 345
    Top = 475
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 127
    Top = 15
    Width = 121
    Height = 21
    TabOrder = 3
    OnChange = Edit1Change
    OnKeyDown = Edit1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 253
    Top = 11
    Width = 28
    Height = 28
    Hint = #21047#26032
    TabOrder = 4
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
    Left = 288
    Top = 0
    Width = 185
    Height = 47
    Caption = #26597#25214#23383#27573
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #25253#20215#21333#21495
      #20135#21697#22411#21495)
    TabOrder = 5
    OnClick = RadioGroup1Click
  end
  object DataSource1: TDataSource
    DataSet = aq85
    OnDataChange = DataSource1DataChange
    Left = 328
    Top = 368
  end
  object aq85: TADOStoredProc
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = aq85CalcFields
    ProcedureName = 'ep032;2'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@part_number'
        Attributes = [paNullable]
        DataType = ftString
        Size = 40
        Value = Null
      end>
    Left = 360
    Top = 368
    object aq85RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aq85TNUMBER: TStringField
      DisplayLabel = #25253#20215#21333#21495
      FieldName = 'TNUMBER'
      FixedChar = True
      Size = 10
    end
    object aq85CUST_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'CUST_NAME'
      FixedChar = True
      Size = 30
    end
    object aq85CUST_PART_NO: TStringField
      DisplayLabel = #20135#21697#22411#21495
      FieldName = 'CUST_PART_NO'
      Size = 40
    end
    object aq85Quote_type: TSmallintField
      FieldName = 'Quote_type'
    end
    object aq85ttype: TStringField
      DisplayLabel = #38144#21806#26041#24335
      FieldKind = fkCalculated
      FieldName = 'ttype'
      Size = 8
      Calculated = True
    end
    object aq85quote_price: TFloatField
      DisplayLabel = #19981#21547#31246#20215
      FieldName = 'quote_price'
    end
    object aq85quote_taxprice: TFloatField
      DisplayLabel = #21547#31246#20215
      FieldName = 'quote_taxprice'
    end
    object aq85CURR_RATE: TFloatField
      FieldName = 'CURR_RATE'
    end
    object aq85CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
    end
    object aq85EMPLOYEE_NAME: TStringField
      DisplayLabel = #25253#20215#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object aq85QTE_UNIT_PTR: TIntegerField
      FieldName = 'QTE_UNIT_PTR'
    end
    object aq85TUNITS: TIntegerField
      FieldName = 'TUNITS'
    end
    object aq85vatax: TBCDField
      DisplayLabel = #22686#20540#31246'%'
      FieldName = 'vatax'
      Precision = 5
      Size = 2
    end
    object aq85qte_unit: TStringField
      DisplayLabel = #25253#20215#21333#20803
      FieldKind = fkCalculated
      FieldName = 'qte_unit'
      Size = 6
      Calculated = True
    end
    object aq85CURR_PTR: TIntegerField
      FieldName = 'CURR_PTR'
    end
  end
end
