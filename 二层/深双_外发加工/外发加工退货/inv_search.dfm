object form_inv: Tform_inv
  Left = 229
  Top = 148
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26412#21378#32534#21495#26597#35810
  ClientHeight = 485
  ClientWidth = 492
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
    Left = 32
    Top = 19
    Width = 72
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = ' '#26412#21378#32534#21495':'
  end
  object RadioGroup1: TRadioGroup
    Left = 331
    Top = 3
    Width = 158
    Height = 42
    Caption = #26597#25214#23383#27573
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #26412#21378#32534#21495
      #23458#25143#22411#21495)
    TabOrder = 5
    OnClick = RadioGroup1Click
  end
  object Edit1: TEdit
    Left = 112
    Top = 15
    Width = 180
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 297
    Top = 13
    Width = 25
    Height = 25
    TabOrder = 2
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
    Left = 161
    Top = 451
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 241
    Top = 451
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 47
    Width = 491
    Height = 399
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
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
        FieldName = 'MANU_PART_NUMBER'
        Title.Caption = #26412#21378#32534#21495
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Title.Caption = #23458#25143#22411#21495
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANALYSIS_CODE_2'
        Width = 190
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'batch_or_formal'
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    OnDataChange = DataSource1DataChange
    Left = 408
    Top = 447
  end
  object ADOQuery1: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'part_number'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    SQL.Strings = (
      'SELECT data0025.rkey,dbo.Data0025.MANU_PART_NUMBER,'
      '      dbo.Data0025.MANU_PART_DESC, ANALYSIS_CODE_2,'
      '      CASE TTYPE when 0 then '#39#37327#20135#39
      '                 when 1 then '#39#25209#37327#39
      '      end as batch_or_formal,  data0025.LAYERS'
      'FROM dbo.Data0025 '
      'WHERE  Data0025.MANU_PART_NUMBER like :part_number'
      'order by MANU_PART_NUMBER desc')
    Left = 440
    Top = 448
    object ADOQuery1rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1LAYERS: TWordField
      FieldName = 'LAYERS'
    end
    object ADOQuery1MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQuery1MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADOQuery1ANALYSIS_CODE_2: TStringField
      DisplayLabel = #23458#25143#29289#26009#21495
      FieldName = 'ANALYSIS_CODE_2'
      Size = 50
    end
    object ADOQuery1batch_or_formal: TStringField
      DisplayLabel = #37327'/'#26679
      FieldName = 'batch_or_formal'
      ReadOnly = True
      Size = 4
    end
  end
end
