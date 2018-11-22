object FrmParameter: TFrmParameter
  Left = 391
  Top = 150
  Width = 470
  Height = 496
  Caption = #26597#25214#21442#25968
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 462
    Height = 49
    Cursor = crVSplit
    Align = alTop
  end
  object Label1: TLabel
    Left = 69
    Top = 20
    Width = 30
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#21517#31216':'
  end
  object Edit1: TEdit
    Left = 112
    Top = 16
    Width = 209
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 328
    Top = 14
    Width = 26
    Height = 26
    TabOrder = 1
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 49
    Width = 462
    Height = 379
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'category_name'
        Title.Caption = #31867#21035
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PARAMETER_NAME'
        Title.Caption = #21517#31216
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'parameter_desc'
        Title.Caption = #25551#36848
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DataType'
        Title.Caption = #25968#25454#31867#22411
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'unit_name'
        Title.Caption = #21333#20301
        Width = 60
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 428
    Width = 462
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object Button1: TButton
      Left = 139
      Top = 10
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 243
      Top = 10
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    SQL.Strings = (
      'select data0278.rkey,data0278.PARAMETER_NAME,'
      'data0278.parameter_desc,data0277.category_name,'
      'data0277.category_type,data0002.unit_name,'
      'data0278.data_type from data0278,data0277,data0002'
      'where data0278.category_ptr=data0277.rkey '
      'and data0277.category_type > 1'
      'and data0278.unit_ptr=data0002.rkey'
      'order by data0277.category_type,'
      'data0277.category_name,data0278.parameter_name')
    Left = 32
    Top = 88
    object ADOQuery1rkey: TIntegerField
      FieldName = 'rkey'
    end
    object ADOQuery1PARAMETER_NAME: TStringField
      FieldName = 'PARAMETER_NAME'
      FixedChar = True
      Size = 10
    end
    object ADOQuery1parameter_desc: TStringField
      FieldName = 'parameter_desc'
      FixedChar = True
    end
    object ADOQuery1category_name: TStringField
      FieldName = 'category_name'
      FixedChar = True
      Size = 10
    end
    object ADOQuery1category_type: TSmallintField
      FieldName = 'category_type'
    end
    object ADOQuery1data_type: TSmallintField
      FieldName = 'data_type'
    end
    object ADOQuery1DataType: TStringField
      FieldKind = fkCalculated
      FieldName = 'DataType'
      Size = 8
      Calculated = True
    end
    object ADOQuery1unit_name: TStringField
      FieldName = 'unit_name'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 64
    Top = 88
  end
end
