object Form_deptinfo: TForm_deptinfo
  Left = 223
  Top = 207
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #35746#21333#35780#23457#21450#20132#26399
  ClientHeight = 379
  ClientWidth = 593
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 13
    Top = 16
    Width = 65
    Height = 13
    Caption = #20837#24211#35745#21010#65306
  end
  object Label2: TLabel
    Left = 278
    Top = 16
    Width = 65
    Height = 13
    Caption = #35780#23457#20449#24687#65306
  end
  object Label3: TLabel
    Left = 7
    Top = 230
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #22791#27880#20449#24687':'
  end
  object DBGrid6: TDBGrid
    Left = 10
    Top = 32
    Width = 241
    Height = 177
    DataSource = DataSource2
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'sch_date'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantity'
        Width = 100
        Visible = True
      end>
  end
  object DBGrid3: TDBGrid
    Left = 275
    Top = 32
    Width = 308
    Height = 175
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DEPT_NAME'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'auth_flag'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'auth_date'
        Width = 92
        Visible = True
      end>
  end
  object Memo1: TMemo
    Left = 8
    Top = 248
    Width = 577
    Height = 89
    ReadOnly = True
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 240
    Top = 344
    Width = 75
    Height = 25
    Cancel = True
    Caption = #20851#38381
    Default = True
    ModalResult = 2
    TabOrder = 3
  end
  object ADO90: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ADO90CalcFields
    DataSource = DM.DataSource1
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
      'SELECT Data0034.DEPT_NAME,Data0005.EMPLOYEE_NAME,'
      '      data0090.auth_date,data0090.rkey,data0090.dept_ptr'
      'FROM Data0034 INNER JOIN'
      
        '     data0090 ON Data0034.RKEY = data0090.dept_ptr LEFT OUTER JO' +
        'IN'
      '     Data0005 ON data0090.user_ptr = Data0005.RKEY'
      'where data0090.pact_ptr=:rkey')
    Left = 310
    Top = 61
    object ADO90DEPT_NAME: TStringField
      DisplayLabel = #35780#23457#37096#38376
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADO90EMPLOYEE_NAME: TStringField
      DisplayLabel = #35780#23457#20154
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADO90auth_date: TDateTimeField
      DisplayLabel = #35780#23457#26085#26399
      FieldName = 'auth_date'
    end
    object ADO90rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO90auth_flag: TStringField
      DisplayLabel = #35780#23457#29366#24577
      FieldKind = fkCalculated
      FieldName = 'auth_flag'
      Size = 6
      Calculated = True
    end
    object ADO90dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO90
    Left = 280
    Top = 61
  end
  object DataSource2: TDataSource
    DataSet = ADO360
    Left = 166
    Top = 60
  end
  object ADO360: TADOQuery
    Connection = DM.ADOConnection1
    LockType = ltReadOnly
    DataSource = DM.DataSource1
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
      'select rkey,so_ptr,quantity,sch_date'
      'from data0360'
      'where so_ptr=:rkey')
    Left = 196
    Top = 60
    object ADO360rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO360so_ptr: TIntegerField
      FieldName = 'so_ptr'
    end
    object ADO360quantity: TIntegerField
      DisplayLabel = #23436#24037#25968#37327
      FieldName = 'quantity'
    end
    object ADO360sch_date: TDateTimeField
      DisplayLabel = #23436#24037#26085#26399
      FieldName = 'sch_date'
    end
  end
end
