inherited FindData0006Form2: TFindData0006Form2
  Left = 231
  Top = 64
  Width = 407
  Height = 505
  Caption = #26597#25214#23457#25209#20195#30721
  PixelsPerInch = 96
  TextHeight = 13
  inherited Temp_DBGridEh1: TDBGridEh
    Width = 399
    Height = 393
    OnDblClick = Temp_DBGridEh1DblClick
    OnTitleBtnClick = Temp_DBGridEh1TitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'CODE'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'QTE_APPROV_DESC'
        Footers = <>
      end>
  end
  inherited Panel1: TPanel
    Width = 399
    inherited Edit1: TEdit
      OnChange = Edit1Change
    end
    inherited BitBtn1: TBitBtn
      OnClick = BitBtn1Click
    end
  end
  inherited Panel2: TPanel
    Top = 434
    Width = 399
  end
  inherited DataSource1: TDataSource
    DataSet = ADOQuery1
  end
  inherited ADOStoredProc1: TADOStoredProc
    Left = 144
    Top = 128
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0264')
    Left = 96
    Top = 176
    object ADOQuery1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery1CODE: TStringField
      DisplayLabel = #23457#25209#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object ADOQuery1QTE_APPROV_DESC: TStringField
      DisplayLabel = #25551#36848
      FieldName = 'QTE_APPROV_DESC'
      Size = 40
    end
  end
end
