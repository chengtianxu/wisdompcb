object frm_Pause: Tfrm_Pause
  Left = 342
  Top = 227
  Width = 541
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
    Width = 533
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
        FieldName = 'rkey567'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'stop_begin_date'
        Footers = <>
        Title.Caption = #26242#20572#24320#22987#26102#38388
      end
      item
        EditButtons = <>
        FieldName = 'stop_end_date'
        Footers = <>
        Title.Caption = #26242#20572#32467#26463#26102#38388
        Width = 142
      end
      item
        EditButtons = <>
        FieldName = 'remark'
        Footers = <>
        Title.Caption = #26242#20572#21407#22240
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADS577
    Left = 200
    Top = 112
  end
  object ADS577: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select DATA0577.Rkey, DATA0577.rkey567, DATA0577.stop_begin_date' +
      ', '#13#10'          DATA0577.stop_end_date, DATA0577.remark'#13#10' from dat' +
      'a0577 where Rkey567 = :vRkey567'
    Parameters = <
      item
        Name = 'vRkey567'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 272
    Top = 128
    object ADS577Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object ADS577rkey567: TIntegerField
      FieldName = 'rkey567'
    end
    object ADS577stop_begin_date: TDateTimeField
      FieldName = 'stop_begin_date'
    end
    object ADS577stop_end_date: TDateTimeField
      FieldName = 'stop_end_date'
    end
    object ADS577remark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
  end
end
