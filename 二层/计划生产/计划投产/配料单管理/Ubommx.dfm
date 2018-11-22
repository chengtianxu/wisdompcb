object Form_shomx: TForm_shomx
  Left = 367
  Top = 341
  Width = 469
  Height = 328
  Caption = #20998#37197#26126#32454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 453
    Height = 290
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'EMPLOYEE_NAME'
        Footers = <>
        Title.Caption = #20998#37197#20154#21592
      end
      item
        EditButtons = <>
        FieldName = 'alloc_datetime'
        Footers = <>
        Title.Caption = #20998#37197#26102#38388
      end
      item
        EditButtons = <>
        FieldName = 'quan_alloc'
        Footers = <>
        Title.Caption = #20998#37197#25968#37327
      end>
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'cp492rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     TOP (100) PERCENT dbo.Data0005.EMPLOYEE_NAME, dbo.DAT' +
        'A0475.alloc_datetime, dbo.DATA0475.cp492_ptr, dbo.DATA0475.quan_' +
        'alloc'
      'FROM         dbo.Data0005 INNER JOIN'
      
        '                      dbo.DATA0475 ON dbo.Data0005.RKEY = dbo.DA' +
        'TA0475.alloc_userptr'
      'where dbo.DATA0475.cp492_ptr =:cp492rkey')
    Left = 156
    Top = 100
    object ADOQuery1EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOQuery1alloc_datetime: TDateTimeField
      FieldName = 'alloc_datetime'
    end
    object ADOQuery1cp492_ptr: TIntegerField
      FieldName = 'cp492_ptr'
    end
    object ADOQuery1quan_alloc: TBCDField
      FieldName = 'quan_alloc'
      Precision = 10
      Size = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 236
    Top = 104
  end
end
