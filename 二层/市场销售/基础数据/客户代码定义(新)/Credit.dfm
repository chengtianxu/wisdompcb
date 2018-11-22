object CreditForm: TCreditForm
  Left = 304
  Top = 231
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23458#25143#20449#29992#35760#24405#26597#35810
  ClientHeight = 433
  ClientWidth = 791
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 791
    Height = 377
    Align = alTop
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Record_number'
        Title.Caption = #35760#24405#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'APPR_BY'
        Title.Caption = #35760#24405#20154#21592
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENT_date'
        Title.Caption = #35760#24405#26085#26399
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Record'
        Title.Caption = #20449#29992#35760#24405
        Width = 539
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 272
    Top = 392
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 416
    Top = 392
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
    OnClick = Button2Click
  end
  object DataSource1: TDataSource
    DataSet = ADO310
    Left = 168
    Top = 112
  end
  object ADO310: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterInsert = ADO310AfterInsert
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT  Record_number, cust_ptr, APPR_BY, ENT_date, Record  '
      'from data0310'
      'where cust_ptr=:rkey')
    Left = 216
    Top = 176
    object ADO310Record_number: TIntegerField
      FieldName = 'Record_number'
    end
    object ADO310cust_ptr: TIntegerField
      FieldName = 'cust_ptr'
    end
    object ADO310APPR_BY: TWideStringField
      FieldName = 'APPR_BY'
      Size = 50
    end
    object ADO310ENT_date: TDateTimeField
      FieldName = 'ENT_date'
    end
    object ADO310Record: TWideStringField
      FieldName = 'Record'
      Size = 300
    end
  end
end
