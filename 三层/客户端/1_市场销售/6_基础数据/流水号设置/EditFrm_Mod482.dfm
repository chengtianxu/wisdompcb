inherited frmEdiFrm_Mod482: TfrmEdiFrm_Mod482
  Caption = #27969#27700#21495#32534#36753
  ClientHeight = 178
  ClientWidth = 394
  ExplicitWidth = 410
  ExplicitHeight = 216
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel [0]
    Left = 16
    Top = 16
    Width = 48
    Height = 13
    Caption = #30003#39046#21333#21495
  end
  inherited pnlMain: TPanel
    Width = 394
    Height = 178
    ExplicitWidth = 472
    ExplicitHeight = 243
    inherited pnl1: TPanel
      Width = 392
      ExplicitWidth = 470
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 392
      Height = 143
      ExplicitTop = 35
      ExplicitWidth = 386
      ExplicitHeight = 119
      object Label1: TLabel
        Left = 44
        Top = 27
        Width = 60
        Height = 24
        Caption = #23618#25968#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 23
        Top = 78
        Width = 80
        Height = 24
        Caption = #27969#27700#21495#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edt_layers: TRKeyRzBtnEdit
        Left = 95
        Top = 30
        Width = 121
        Height = 21
        Text = ''
        TabOrder = 0
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds81
        DataSourceField = 'layers'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object edt_sufchar: TRKeyRzBtnEdit
        Left = 95
        Top = 81
        Width = 121
        Height = 21
        Text = ''
        TabOrder = 1
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds81
        DataSourceField = 'sufchar'
        DisplayModID = 0
        ForceOnFocus = True
      end
    end
  end
  object cds81: TClientDataSet
    Aggregates = <>
    CommandText = 'select  * from data0081 '#13#10
    Params = <>
    Left = 292
    Top = 95
  end
  object ds81: TDataSource
    DataSet = cds81
    Left = 332
    Top = 87
  end
  object qrytemp: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security In' +
      'fo=True;User ID=WZPCBConnect;Initial Catalog=sj_v20_live;Data So' +
      'urce=172.16.8.112'
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'layer'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT rkey, layers, sufchar'
      'FROM data0081'
      'WHERE layers = :layer')
    Left = 294
    Top = 46
    object qrytemprkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qrytemplayers: TWordField
      FieldName = 'layers'
    end
    object qrytempsufchar: TStringField
      FieldName = 'sufchar'
      Size = 10
    end
  end
end
