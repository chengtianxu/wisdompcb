object Form_layerpre: TForm_layerpre
  Left = 318
  Top = 151
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20135#21697#23618#25968#32534#30721#21021#22987#20540
  ClientHeight = 446
  ClientWidth = 384
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
    Width = 384
    Height = 18
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 18
    Width = 384
    Height = 387
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
    Columns = <
      item
        Expanded = False
        FieldName = 'layers'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECHAR1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECHAR2'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sufchar'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 405
    Width = 384
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Button1: TButton
      Left = 108
      Top = 10
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 188
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
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'select'#13#10'rkey, layers, PRECHAR1, PRECHAR2,sufchar'#13#10'from data0081'#13 +
      #10'order by layers'
    Parameters = <>
    Left = 335
    Top = 379
    object ADOQuery1rkey: TIntegerField
      FieldName = 'rkey'
    end
    object ADOQuery1layers: TWordField
      DisplayLabel = #23618#25968
      FieldName = 'layers'
    end
    object ADOQuery1PRECHAR1: TStringField
      DisplayLabel = #37327#20135#21021#22987#20540
      FieldName = 'PRECHAR1'
      Size = 15
    end
    object ADOQuery1PRECHAR2: TStringField
      DisplayLabel = #26679#21697#21021#22987#20540
      FieldName = 'PRECHAR2'
      Size = 15
    end
    object ADOQuery1sufchar: TStringField
      DisplayLabel = #20135#21697#27969#27700#21495
      FieldName = 'sufchar'
      Size = 10
    end
  end
end
