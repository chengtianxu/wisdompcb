inherited AuditInfoForm2: TAuditInfoForm2
  Left = 252
  Top = 165
  Width = 482
  BorderIcons = [biSystemMenu]
  Caption = #23457#25209#20449#24687
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 474
    Height = 304
    Align = alClient
    DataSource = DataSource30
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDrawColumnCell = DBGridEh1DrawColumnCell
    Columns = <
      item
        EditButtons = <>
        FieldName = 'user_id'
        Footers = <>
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'user_full_name'
        Footers = <>
        Width = 160
      end
      item
        EditButtons = <>
        FieldName = 'auth_date'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'ranking'
        Footers = <>
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 304
    Width = 474
    Height = 41
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 200
      Top = 8
      Width = 75
      Height = 25
      Caption = #20851#38381
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00377777777788
        F8F8780000004444400777FFF4444400000033334D5008FFF433330000003333
        45D50FFFF4333300000033334D5D0FFFF43333000000333345D50FEFE4333300
        000033334D5D0FFFF43333000000333345D50FEFE4333300000033334D5D0FFF
        F43333000000333345D50FEFE4333300000033334D5D0EFEF433330000003333
        45D50FEFE4333300000033334D5D0EFEF4333300000033334444444444333300
        00003333333333333333330000003333330000003333330000003333330AAAA0
        333333000000333333000000333333000000}
    end
  end
  object Qwzpr85_30: TADOStoredProc
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'Qwzpr85;30'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@rkey0085'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 208
    Top = 144
    object Qwzpr85_30user_id: TStringField
      DisplayLabel = #23457#25209#20154#20195#30721
      FieldName = 'user_id'
      Size = 10
    end
    object Qwzpr85_30user_full_name: TStringField
      DisplayLabel = #23457#25209#20154#22995#21517
      FieldName = 'user_full_name'
      Size = 30
    end
    object Qwzpr85_30auth_date: TDateTimeField
      DisplayLabel = #23457#25209#26085#26399
      FieldName = 'auth_date'
    end
    object Qwzpr85_30ranking: TWordField
      DisplayLabel = #39034#24207#21495
      FieldName = 'ranking'
    end
    object Qwzpr85_30user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
  end
  object DataSource30: TDataSource
    DataSet = Qwzpr85_30
    Left = 152
    Top = 136
  end
end
