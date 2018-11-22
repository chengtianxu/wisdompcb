object Form_layer: TForm_layer
  Left = 297
  Top = 169
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26631#20934#23618#21387
  ClientHeight = 471
  ClientWidth = 455
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 252
    Width = 455
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 455
    Height = 38
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 60
      Top = 14
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #23618#21387#20195#30721
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object BitBtn2: TBitBtn
      Left = 275
      Top = 7
      Width = 25
      Height = 25
      Hint = #21047#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = False
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
    object Edit1: TEdit
      Left = 119
      Top = 9
      Width = 152
      Height = 21
      TabOrder = 1
      OnChange = Edit1Change
      OnKeyDown = DBGrid1KeyDown
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 430
    Width = 455
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TButton
      Left = 131
      Top = 10
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 211
      Top = 10
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 38
    Width = 455
    Height = 214
    Align = alTop
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
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
        FieldName = 'CODE'
        Title.Color = clRed
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPTION'
        Width = 341
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 255
    Width = 455
    Height = 175
    Align = alClient
    DataSource = DataSource2
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'SEQUENCE_NUMBER'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TEXT_LINE'
        Width = 390
        Visible = True
      end>
  end
  object ads93: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'select  RECORD_KEY,CODE, DESCRIPTION'#13#10'from data0193'#13#10'where SPEC_' +
      'RKEY is null'
    IndexFieldNames = 'CODE'
    Parameters = <>
    Left = 184
    Top = 152
    object ads93RECORD_KEY: TAutoIncField
      FieldName = 'RECORD_KEY'
      ReadOnly = True
    end
    object ads93CODE: TStringField
      DisplayLabel = #23618#21387#20195#30721
      FieldName = 'CODE'
      FixedChar = True
      Size = 5
    end
    object ads93DESCRIPTION: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'DESCRIPTION'
      Size = 40
    end
  end
  object DataSource1: TDataSource
    DataSet = ads93
    Left = 152
    Top = 152
  end
  object ads94: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'select HEADER_POINTER ,SEQUENCE_NUMBER, TEXT_LINE'#13#10'from data0194' +
      #13#10'where HEADER_POINTER = :RECORD_KEY'#13#10'order by SEQUENCE_NUMBER'
    DataSource = DataSource1
    IndexFieldNames = 'HEADER_POINTER'
    MasterFields = 'RECORD_KEY'
    Parameters = <
      item
        Name = 'RECORD_KEY'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = 1
      end>
    Left = 184
    Top = 192
    object ads94SEQUENCE_NUMBER: TSmallintField
      DisplayLabel = #24207#21495
      FieldName = 'SEQUENCE_NUMBER'
    end
    object ads94TEXT_LINE: TStringField
      DisplayLabel = #23618#21387#31526#21495
      FieldName = 'TEXT_LINE'
      Size = 100
    end
    object ads94HEADER_POINTER: TIntegerField
      FieldName = 'HEADER_POINTER'
    end
  end
  object DataSource2: TDataSource
    DataSet = ads94
    Left = 152
    Top = 192
  end
end
