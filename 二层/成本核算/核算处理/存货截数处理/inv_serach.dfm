object form_inv: Tform_inv
  Left = 229
  Top = 148
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24211#23384#21407#26448#26009#25628#32034
  ClientHeight = 453
  ClientWidth = 556
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 57
    Top = 13
    Width = 87
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#29289#26009#32534#30721':'
  end
  object Edit1: TEdit
    Left = 152
    Top = 9
    Width = 210
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 368
    Top = 8
    Width = 25
    Height = 25
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
  object Button1: TButton
    Left = 183
    Top = 422
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 2
  end
  object Button2: TButton
    Left = 263
    Top = 422
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 36
    Width = 557
    Height = 381
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = GB2312_CHARSET
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
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_NAME'
        Width = 151
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Width = 250
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = adoquery1
    Left = 408
    Top = 422
  end
  object adoquery1: TADODataSet
    Connection = DM.Conn
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'select data0017.RKEY, INV_PART_NUMBER, INV_NAME, INV_DESCRIPTION' +
      ',std_cost,'#13#10'data0002.UNIT_NAME'#13#10'  from Data0017 inner join data0' +
      '002'#13#10'on data0017.stock_unit_ptr=data0002.rkey'#13#10'where INV_PART_NU' +
      'MBER like :number'
    IndexFieldNames = 'INV_PART_NUMBER'
    Parameters = <
      item
        Name = 'number'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 25
        Value = 'afr%'
      end>
    Left = 448
    Top = 424
    object adoquery1RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object adoquery1INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object adoquery1INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object adoquery1INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object adoquery1UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object adoquery1std_cost: TFloatField
      FieldName = 'std_cost'
    end
  end
end
