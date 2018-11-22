object Detailed_frm: TDetailed_frm
  Left = 579
  Top = 245
  Width = 385
  Height = 281
  Caption = #20998#37197#26126#32454
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 377
    Height = 250
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = GB2312_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -12
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'alloc_datetime'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'quan_alloc'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOYEE_NAME'
        Footers = <>
      end>
  end
  object ADODataSet1: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select DATA0475.alloc_datetime,DATA0475.quan_alloc,data0005.EMPL' +
      'OYEE_NAME from dbo.DATA0475'#13#10'join data0005 on DATA0475.alloc_use' +
      'rptr = data0005.rkey'
    Parameters = <>
    Left = 152
    Top = 152
    object ADODataSet1alloc_datetime: TDateTimeField
      DisplayLabel = #25805#20316#26085#26399
      FieldName = 'alloc_datetime'
    end
    object ADODataSet1quan_alloc: TBCDField
      DisplayLabel = #20998#37197#25968#37327
      FieldName = 'quan_alloc'
      Precision = 12
    end
    object ADODataSet1EMPLOYEE_NAME: TStringField
      DisplayLabel = #25805#20316#20154
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 240
    Top = 152
  end
end
