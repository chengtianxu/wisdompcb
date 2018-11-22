object frm_Recordt: Tfrm_Recordt
  Left = 192
  Top = 160
  Width = 752
  Height = 442
  Caption = #29366#24577#35760#24405
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
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 744
    Height = 408
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'USER_FULL_NAME'
        Footers = <>
        Width = 85
      end
      item
        EditButtons = <>
        FieldName = 'MainExecStat'
        Footers = <>
        Width = 86
      end
      item
        EditButtons = <>
        FieldName = 'Record_date'
        Footers = <>
        Width = 151
      end
      item
        EditButtons = <>
        FieldName = 'remark'
        Footers = <>
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADS839
    Left = 136
    Top = 128
  end
  object ADS839: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select USER_FULL_NAME,MainExecStat,Record_date,remark from data0' +
      '839'#13#10'join data0832 on data0839.Status_ptr=data0832.RKEY'#13#10'join da' +
      'ta0073 on data0839.User_ptr=data0073.rkey'#13#10'where TableName=:Tabl' +
      'eName and Record_rkey=:Record_rkey'
    Parameters = <
      item
        Name = 'TableName'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 8
        Value = Null
      end
      item
        Name = 'Record_rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 264
    Top = 136
    object ADS839USER_FULL_NAME: TStringField
      DisplayLabel = #22995#21517
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ADS839MainExecStat: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'MainExecStat'
      Size = 10
    end
    object ADS839Record_date: TDateTimeField
      DisplayLabel = #26085#26399
      FieldName = 'Record_date'
    end
    object ADS839remark: TWideStringField
      DisplayLabel = #25551#36848
      FieldName = 'remark'
      Size = 50
    end
  end
end
