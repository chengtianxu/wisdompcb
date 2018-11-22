object Form_FindBook: TForm_FindBook
  Left = 299
  Top = 137
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #39044#22788#29702#35746#21333#26597#25214
  ClientHeight = 379
  ClientWidth = 693
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 338
    Width = 693
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 213
      Top = 9
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 409
      Top = 8
      Width = 75
      Height = 26
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 693
    Height = 338
    Align = alClient
    DataSource = DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Title.Caption = #26412#21378#32534#21495
        Title.Color = clRed
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Title.Caption = #23458#25143#22411#21495
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANALYSIS_CODE_2'
        Title.Caption = #23458#25143#29289#26009#21495
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Title.Caption = #23458#25143#35746#21333#21495
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PART_PRICE'
        Title.Caption = #21547#31246#20215#26684
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PARTS_ORDERED'
        Title.Caption = #25968#37327
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORIG_REQUEST_DATE'
        Title.Caption = #20986#21378#26085#26399
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORIG_SCHED_SHIP_DATE'
        Title.Caption = #20132#36135#26085#26399
        Width = 72
        Visible = True
      end>
  end
  object ADS213: TADODataSet
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      #13#10'SELECT     RKEY, MANU_PART_NUMBER, PO_NUMBER, ANALYSIS_CODE_2,' +
      ' MANU_PART_DESC, ORIG_REQUEST_DATE, ORIG_SCHED_SHIP_DATE, '#13#10'    ' +
      '               PARTS_ORDERED, PART_PRICE, CURR_CODE, PO_DATE, st' +
      'atus, user_ptr, submit_date'#13#10'FROM         dbo.DATA0213'#13#10'WHERE   ' +
      ' status=3 and  MANU_PART_NUMBER=:str1 and  PO_NUMBER=:str2'
    Parameters = <
      item
        Name = 'str1'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end
      item
        Name = 'str2'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 25
        Value = Null
      end>
    Prepared = True
    Left = 327
    Top = 204
    object ADS213RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS213MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADS213PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADS213ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 80
    end
    object ADS213MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADS213ORIG_REQUEST_DATE: TDateTimeField
      FieldName = 'ORIG_REQUEST_DATE'
    end
    object ADS213ORIG_SCHED_SHIP_DATE: TDateTimeField
      FieldName = 'ORIG_SCHED_SHIP_DATE'
    end
    object ADS213PARTS_ORDERED: TIntegerField
      FieldName = 'PARTS_ORDERED'
    end
    object ADS213PART_PRICE: TFloatField
      FieldName = 'PART_PRICE'
    end
    object ADS213CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADS213PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object ADS213status: TWordField
      FieldName = 'status'
    end
    object ADS213user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ADS213submit_date: TDateTimeField
      FieldName = 'submit_date'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS213
    Left = 240
    Top = 200
  end
end
