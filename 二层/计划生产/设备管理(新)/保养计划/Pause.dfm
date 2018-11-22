object frm_Pause: Tfrm_Pause
  Left = 342
  Top = 227
  Width = 588
  Height = 369
  Caption = #26242#20572#35760#24405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 580
    Height = 335
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
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
        FieldName = 'Rkey'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'rkey831'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'stop_begin_date'
        Footers = <>
        Title.Caption = #26242#20572#24320#22987#26102#38388
        Width = 147
      end
      item
        EditButtons = <>
        FieldName = 'stop_end_date'
        Footers = <>
        Title.Caption = #26242#20572#32467#26463#26102#38388
        Width = 143
      end
      item
        EditButtons = <>
        FieldName = 'remark'
        Footers = <>
        Title.Caption = #26242#20572#21407#22240
        Width = 249
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADS833
    Left = 200
    Top = 112
  end
  object ADS833: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT     remark, stop_end_date, stop_begin_date, rkey831, Rkey' +
      #13#10'FROM         DATA0833'#13#10'where Rkey831 = :vRkey831'
    Parameters = <
      item
        Name = 'vRkey831'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 272
    Top = 128
    object ADS833remark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
    object ADS833stop_end_date: TDateTimeField
      FieldName = 'stop_end_date'
    end
    object ADS833stop_begin_date: TDateTimeField
      FieldName = 'stop_begin_date'
    end
    object ADS833rkey831: TIntegerField
      FieldName = 'rkey831'
    end
    object ADS833Rkey: TIntegerField
      FieldName = 'Rkey'
      ReadOnly = True
    end
  end
end
