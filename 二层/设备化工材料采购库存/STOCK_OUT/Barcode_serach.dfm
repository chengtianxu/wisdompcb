object FrmBCSearch: TFrmBCSearch
  Left = 207
  Top = 198
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Barcode'#21495#25628#32034
  ClientHeight = 453
  ClientWidth = 776
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 776
    Height = 33
    Cursor = crArrow
    Align = alTop
  end
  object Label1: TLabel
    Left = 136
    Top = 13
    Width = 112
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #26448#26009#20195#21495':'
  end
  object Edit1: TEdit
    Left = 256
    Top = 9
    Width = 210
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 470
    Top = 8
    Width = 24
    Height = 23
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 33
    Width = 776
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
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Title.Caption = #26448#26009#20195#21495
        Title.Color = clRed
        Width = 159
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_DESCRIPTION'
        Title.Caption = #26448#26009#25551#36848
        Width = 192
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_ON_HAND'
        ReadOnly = False
        Title.Alignment = taRightJustify
        Title.Caption = #20179#23384#25968#37327
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'unit_price'
        ReadOnly = False
        Title.Alignment = taRightJustify
        Title.Caption = #20215#26684
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXPIRE_DATE'
        ReadOnly = False
        Title.Caption = #26377#25928#26399
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'scode'
        Title.Caption = #20379#24212#21830
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCATION'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BARCODE_ID'
        Width = 100
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 412
    Width = 776
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object Button1: TButton
      Left = 291
      Top = 10
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 371
      Top = 10
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 96
    Top = 416
  end
  object ADOQuery1: TADOStoredProc
    Connection = MainForm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    ProcedureName = 'wzsp017;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@vptr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 1
      end>
    Left = 128
    Top = 416
    object ADOQuery1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery1INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ADOQuery1INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADOQuery1BARCODE_ID: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BARCODE_ID'
      Size = 50
    end
    object ADOQuery1QUAN_ON_HAND: TBCDField
      FieldName = 'QUAN_ON_HAND'
      Precision = 9
      Size = 3
    end
    object ADOQuery1EXPIRE_DATE: TDateTimeField
      FieldName = 'EXPIRE_DATE'
    end
    object ADOQuery1scode: TStringField
      FieldName = 'scode'
      Size = 10
    end
    object ADOQuery1STD_COST: TBCDField
      FieldName = 'STD_COST'
      Precision = 8
      Size = 2
    end
    object ADOQuery1unit_price: TBCDField
      FieldName = 'unit_price'
      ReadOnly = True
      Precision = 30
      Size = 16
    end
    object ADOQuery1WareHOUSE_PTR: TIntegerField
      FieldName = 'WareHOUSE_PTR'
    end
    object ADOQuery1UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ADOQuery1LOCATION: TStringField
      DisplayLabel = #20301#32622
      FieldName = 'LOCATION'
      Size = 10
    end
    object ADOQuery1INV_PART_DESCRIPTION: TStringField
      DisplayWidth = 20
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
  end
end
