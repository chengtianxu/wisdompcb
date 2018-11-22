object Form_stepnumber: TForm_stepnumber
  Left = 341
  Top = 167
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24037#24207#27969#31243#26597#25214
  ClientHeight = 533
  ClientWidth = 460
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #26032#23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 492
    Width = 460
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 142
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 224
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 460
    Height = 492
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #26032#23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'STEP_NUMBER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPT_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPT_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BARCODE_ENTRY_FLAG'
        Visible = True
      end>
  end
  object ADODataSet1: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.Data0038.STEP_NUMBER, dbo.Data0034.DEPT_CODE, '#13#10'     ' +
      ' dbo.Data0034.DEPT_NAME, dbo.Data0034.BARCODE_ENTRY_FLAG'#13#10'FROM d' +
      'bo.Data0038 INNER JOIN'#13#10'      dbo.Data0034 ON dbo.Data0038.DEPT_' +
      'PTR = dbo.Data0034.RKEY'#13#10'where data0038.SOURCE_PTR=:PARENT_PTR'#13#10 +
      'order by Data0038.STEP_NUMBER'
    DataSource = DM.DataSource2
    MasterFields = 'PARENT_PTR'
    Parameters = <
      item
        Name = 'PARENT_PTR'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 112
    Top = 312
    object ADODataSet1STEP_NUMBER: TSmallintField
      DisplayLabel = #27493#39588#21495
      FieldName = 'STEP_NUMBER'
    end
    object ADODataSet1DEPT_CODE: TStringField
      DisplayLabel = #24037#24207#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADODataSet1DEPT_NAME: TStringField
      DisplayLabel = #24037#24207#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADODataSet1BARCODE_ENTRY_FLAG: TStringField
      DisplayLabel = #26159#21542#36807#25968
      FieldName = 'BARCODE_ENTRY_FLAG'
      Size = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 64
    Top = 312
  end
end
