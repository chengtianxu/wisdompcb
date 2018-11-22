object frmBackMX: TfrmBackMX
  Left = 337
  Top = 137
  Width = 535
  Height = 565
  Caption = #21518#24037#24207#23436#25104#26102#38388#26126#32454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 519
    Height = 33
    Align = alTop
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 8
      Top = 4
      Width = 59
      Height = 27
      Caption = #20851#38381
      ModalResult = 2
      TabOrder = 0
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        0400000000007800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
        FFFFFFFF00FFFFFFFFFFFFF030FFFFFFFFFFFF0330FFFFFFFFFF003330000000
        0FFFF03330FF0FFFFFFFF03300FF0FFFF4FFF03330FF0FFF44FFF03330FF0FF4
        4444F03330FF0F444444F03330FF0FF44444F0330FFF0FFF44FFF030FFFF0FFF
        F4FFF00FFFFF0FFFFFFFF00000000FFFFFFF}
    end
    object BitBtn2: TBitBtn
      Left = 67
      Top = 4
      Width = 59
      Height = 27
      Caption = #23548#20986
      TabOrder = 1
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
        EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
        DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
        70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 33
    Width = 519
    Height = 494
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'dept_code'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #24037#24207#20195#30721
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'dept_name'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #24037#24207#21517#31216
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'step_number'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #27493#39588#21495
        Width = 45
      end
      item
        EditButtons = <>
        FieldName = 'DataValues'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #24037#24207#23436#24037#23567#26102#25968
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'OutDate'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #24037#24207#29702#35770#23436#24037#26102#38388
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 152
    Top = 136
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    AfterScroll = ADOQuery1AfterScroll
    Parameters = <
      item
        Name = 'TType'
        Size = -1
        Value = Null
      end
      item
        Name = 'D06RKEY'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'StepNum'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      'select data0038.rkey,data0038.step_number,data0034.dept_code, '
      'data0034.dept_name,D586.DataValues '
      'FROM'#9'dbo.Data0025 INNER JOIN'
      #9#9'dbo.Data0006 ON Data0025.RKEY = Data0006.BOM_PTR INNER JOIN'
      #9#9'dbo.Data0038 ON Data0025.RKEY = Data0038.SOURCE_PTR INNER JOIN'
      
        #9#9'dbo.Data0034 ON Data0038.DEPT_PTR = Data0034.RKEY LEFT OUTER J' +
        'OIN'
      '          (SELECT     Rkey34, DataValues'
      '            FROM          dbo.data0586'
      
        '           where TType=:TType ) AS D586 ON Data0034.RKEY = D586.' +
        'Rkey34  inner join '
      '        Data0056 ON Data0006.RKEY =Data0056.WO_PTR '
      
        'WHERE (Data0034.BARCODE_ENTRY_FLAG = '#39'Y'#39') AND (Data0034.ACTIVE_F' +
        'LAG = 0)  '
      
        'and (Data0006.RKEY =:D06RKEY) AND (Data0038.STEP_NUMBER > :StepN' +
        'um)'
      'order by Data0038.step_number')
    Left = 224
    Top = 136
    object ADOQuery1rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1step_number: TSmallintField
      FieldName = 'step_number'
    end
    object ADOQuery1dept_code: TStringField
      FieldName = 'dept_code'
      Size = 10
    end
    object ADOQuery1dept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object ADOQuery1DataValues: TFloatField
      FieldName = 'DataValues'
    end
    object ADOQuery1OutDate: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'OutDate'
      Calculated = True
    end
  end
end
