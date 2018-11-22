object Form_deptcode: TForm_deptcode
  Left = 367
  Top = 89
  Width = 464
  Height = 534
  Caption = #24037#24207#20195#30721#26597#25214
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 456
    Height = 38
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 86
      Top = 13
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #24037#24207#20195#30721
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
  object Panel1: TPanel
    Left = 0
    Top = 466
    Width = 456
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
    Width = 456
    Height = 428
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
        Color = clWhite
        Expanded = False
        FieldName = 'DEPT_CODE'
        Title.Color = clRed
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPT_NAME'
        Width = 249
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BARCODE_ENTRY_FLAG'
        Title.Caption = #26159#21542#36807#25968
        Width = 85
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 376
    Top = 467
  end
  object ADOQuery1: TADODataSet
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT rkey,DEPT_CODE, DEPT_NAME, BARCODE_ENTRY_FLAG, DEF_ROUT_I' +
      'NST'#13#10'FROM dbo.Data0034'#13#10'WHERE (ACTIVE_FLAG = 0) AND (TTYPE = '#39'1'#39 +
      ')'
    IndexFieldNames = 'DEPT_CODE'
    Parameters = <>
    Left = 407
    Top = 467
    object ADOQuery1rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1DEPT_CODE: TStringField
      DisplayLabel = #24037#24207#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADOQuery1DEPT_NAME: TStringField
      DisplayLabel = #24037#24207#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADOQuery1BARCODE_ENTRY_FLAG: TStringField
      DisplayLabel = #36807#25968
      FieldName = 'BARCODE_ENTRY_FLAG'
      Size = 1
    end
    object ADOQuery1DEF_ROUT_INST: TStringField
      FieldName = 'DEF_ROUT_INST'
      Size = 200
    end
  end
end
