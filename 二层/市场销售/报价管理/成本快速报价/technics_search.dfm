object Form_technics: TForm_technics
  Left = 340
  Top = 161
  BorderStyle = bsSingle
  Caption = #29305#21035#24037#33402#25628#32034
  ClientHeight = 507
  ClientWidth = 438
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
    Width = 438
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
      Caption = #24037#33402#21517#31216
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object MaskEdit1: TMaskEdit
      Left = 117
      Top = 9
      Width = 153
      Height = 21
      TabOrder = 0
      OnChange = MaskEdit1Change
    end
    object BitBtn2: TBitBtn
      Left = 275
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
    Width = 438
    Height = 428
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
    Columns = <
      item
        Expanded = False
        FieldName = 'ADDER_NAME'
        Title.Color = cl3DLight
        Width = 291
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cac_meoth'
        Width = 125
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 466
    Width = 438
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Button1: TButton
      Left = 134
      Top = 10
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 214
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
    Left = 304
    Top = 379
  end
  object ADOQuery1: TADODataSet
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'select rkey, ADDER_NAME, FORMULA, MIN_VALUE, MAX_VALUE,'#13#10'case Da' +
      'ta0348.PCENTS when 0 then '#39#37329#39069#39' else '#39#22522#20215#30334#20221#27604#39#13#10'       end as cac_m' +
      'eoth'#13#10'from data0348'#13#10'where ttype=1 and'#13#10'  ActiveFlag=1'#13#10'order by' +
      ' ADDER_NAME'#13#10
    Parameters = <>
    Left = 335
    Top = 379
    object ADOQuery1rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1ADDER_NAME: TStringField
      DisplayLabel = #24037#33402#21517#31216
      FieldName = 'ADDER_NAME'
    end
    object ADOQuery1FORMULA: TMemoField
      FieldName = 'FORMULA'
      BlobType = ftMemo
    end
    object ADOQuery1MIN_VALUE: TMemoField
      FieldName = 'MIN_VALUE'
      BlobType = ftMemo
    end
    object ADOQuery1MAX_VALUE: TMemoField
      FieldName = 'MAX_VALUE'
      BlobType = ftMemo
    end
    object ADOQuery1cac_meoth: TStringField
      DisplayLabel = #35745#31639#26041#24335
      FieldName = 'cac_meoth'
      ReadOnly = True
      Size = 10
    end
  end
end
