object Form_iesmodel: TForm_iesmodel
  Left = 465
  Top = 164
  BorderStyle = bsSingle
  Caption = #27969#31243#27169#22411#26597#25214
  ClientHeight = 514
  ClientWidth = 419
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
    Width = 419
    Height = 38
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 79
      Top = 14
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #27169#22411#20195#30721
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object MaskEdit1: TMaskEdit
      Left = 136
      Top = 9
      Width = 153
      Height = 21
      TabOrder = 0
      OnChange = MaskEdit1Change
      OnKeyDown = DBGrid1KeyDown
    end
    object BitBtn2: TBitBtn
      Left = 294
      Top = 7
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
    Width = 419
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
        Expanded = False
        FieldName = 'ENG_FLOW_NAME'
        Title.Color = clRed
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENG_FLOW_DESC'
        Width = 275
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 473
    Width = 419
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
    Left = 304
    Top = 379
  end
  object ADOQuery1: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'select RKEY, ENG_FLOW_NAME, ENG_FLOW_DESC'#13#10'from data0504'#13#10
    IndexFieldNames = 'ENG_FLOW_NAME'
    Parameters = <>
    Left = 335
    Top = 379
    object ADOQuery1RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery1ENG_FLOW_NAME: TStringField
      DisplayLabel = #27169#22411#20195#30721
      FieldName = 'ENG_FLOW_NAME'
      Size = 10
    end
    object ADOQuery1ENG_FLOW_DESC: TStringField
      DisplayLabel = #27169#22411#21517#31216
      FieldName = 'ENG_FLOW_DESC'
      Size = 50
    end
  end
end
