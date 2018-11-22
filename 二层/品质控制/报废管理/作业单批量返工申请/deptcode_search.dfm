object Form_deptcode: TForm_deptcode
  Left = 421
  Top = 129
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #36820#24037#24037#24207#26597#25214
  ClientHeight = 514
  ClientWidth = 410
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 410
    Height = 38
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 112
      Top = 13
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = #27493#39588
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object MaskEdit1: TMaskEdit
      Left = 143
      Top = 8
      Width = 153
      Height = 21
      TabOrder = 0
      OnChange = MaskEdit1Change
      OnKeyDown = DBGrid1KeyDown
    end
    object BitBtn2: TBitBtn
      Left = 301
      Top = 6
      Width = 25
      Height = 25
      Hint = #21047#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = False
      OnClick = BitBtn2Click
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 38
    Width = 410
    Height = 435
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
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
        Color = clWhite
        Expanded = False
        FieldName = 'DEPT_CODE'
        Title.Caption = #24037#24207#20195#30721
        Title.Color = clRed
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPT_NAME'
        Title.Caption = #24037#24207#21517#31216
        Width = 182
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'step_number'
        Title.Caption = #27493#39588
        Width = 67
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 473
    Width = 410
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
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
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    OnDataChange = DataSource1DataChange
    Left = 344
    Top = 475
  end
  object ADOQuery1: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'select data0034.rkey,data0034.DEPT_CODE, data0034.DEPT_NAME, '#13#10'd' +
      'ata0034.PRINTING_RESOURCE,data0038.step_number '#13#10'from data0038'#13#10 +
      'inner join data0034 on data0034.rkey=data0038.dept_ptr'#13#10'where da' +
      'ta0034.BARCODE_ENTRY_FLAG='#39'Y'#39' and source_ptr=:rkey25'#13#10'order by d' +
      'ata0038.step_number desc'
    IndexFieldNames = 'DEPT_CODE'
    Parameters = <
      item
        Name = 'rkey25'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 375
    Top = 475
    object ADOQuery1rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1DEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADOQuery1DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADOQuery1PRINTING_RESOURCE: TStringField
      DisplayLabel = #36127#36131#20154
      FieldName = 'PRINTING_RESOURCE'
      Size = 10
    end
    object ADOQuery1step_number: TSmallintField
      FieldName = 'step_number'
    end
  end
end
