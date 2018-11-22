inherited frmMain_Mod38OutToCheck: TfrmMain_Mod38OutToCheck
  Caption = #32534#30721#26448#26009#21457#25918#21040#26448#26009#26816#26597
  ClientHeight = 420
  ClientWidth = 647
  OnClose = FormClose
  ExplicitWidth = 663
  ExplicitHeight = 459
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 647
    Height = 420
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 647
    ExplicitHeight = 420
    inherited pnl1: TPanel
      Width = 645
      Font.Style = [fsBold, fsStrikeOut]
      ParentFont = False
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 645
      object lbl1: TLabel [0]
        Left = 296
        Top = 8
        Width = 78
        Height = 13
        Caption = #21491#38190#28155#21152#29289#26009
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 645
      Height = 385
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 645
      ExplicitHeight = 385
      object pnl4: TPanel
        Left = 1
        Top = 1
        Width = 643
        Height = 383
        Align = alClient
        TabOrder = 0
        object eh95: TDBGridEh
          Left = 1
          Top = 1
          Width = 641
          Height = 381
          Align = alClient
          DataSource = ds95
          DynProps = <>
          PopupMenu = pm95
          ReadOnly = True
          TabOrder = 0
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'INV_PART_NUMBER'
              Footers = <>
              Title.Caption = #29289#26009#32534#30721
              Width = 73
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'INV_NAME'
              Footers = <>
              Title.Caption = #29289#26009#21517#31216
              Width = 108
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'INV_DESCRIPTION'
              Footers = <>
              Title.Caption = #29289#26009#35268#26684
              Width = 175
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'rohs'
              Footers = <>
              Title.Caption = #29615#20445#26631#35782
              Width = 65
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'UNIT_NAME'
              Footers = <>
              Title.Caption = #21457#25918#21333#20301
              Width = 65
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'QUANTITY'
              Footers = <>
              Title.Caption = #21457#25918#25968#37327
              Width = 67
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
  end
  object pm95: TPopupMenu
    Left = 456
    Top = 88
    object mniAdd: TMenuItem
      Caption = #26032#22686
      OnClick = mniAddClick
    end
    object mniDel: TMenuItem
      Caption = #21024#38500
      OnClick = mniDelClick
    end
  end
  object ds95: TDataSource
    DataSet = cds95
    Left = 240
    Top = 184
  end
  object cds95: TClientDataSet
    Aggregates = <>
    CommandText = 
      ' select TRAN_TP ,INVT_PTR,SRCE_PTR,TRAN_BY,TRAN_DATE,d17.INV_PAR' +
      'T_NUMBER as '#29289#26009#32534#30721',d17.INV_NAME as '#29289#26009#21517#31216',d17.INV_PART_DESCRIPTION a' +
      's '#29289#26009#35268#26684','#13#10' d22.rohs as '#29615#20445#26631#35782', d02.UNIT_NAME as '#21457#25918#21333#20301', d95.QUANTITY ' +
      'as '#21457#25918#25968#37327#13#10'from data0095 d95 '#13#10'inner join data0017 d17 on d95.INVT' +
      '_PTR=d17.RKEY '#13#10'inner join data0002 d02 on d17.STOCK_UNIT_PTR=d0' +
      '2.RKEY'#13#10'inner join data0022 d22 on  d95.SRCE_PTR=d22.rkey'#13#10'where' +
      ' d95.rkey is null'
    Params = <>
    Left = 200
    Top = 184
  end
  object cdstemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 320
  end
  object cdsLookUp17: TClientDataSet
    Aggregates = <>
    CommandText = 
      '  select  D17.rkey, d17.INV_PART_NUMBER ,d17.INV_NAME ,d17.INV_P' +
      'ART_DESCRIPTION , '#13#10'  d22.rohs , d02.UNIT_NAME '#13#10'  from data0095' +
      ' d95 '#13#10' inner join data0017 d17 on d95.INVT_PTR=d17.RKEY '#13#10'  inn' +
      'er join data0002 d02 on d17.STOCK_UNIT_PTR=d02.RKEY '#13#10'  inner jo' +
      'in data0022 d22 on  d95.SRCE_PTR=d22.rkey '#13#10'  where d95.rkey=0'
    Params = <>
    Left = 280
    Top = 96
  end
  object qry1: TADOQuery
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\Ole DB\Data Links' +
      '\8.112.udl'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      ' select d17.INV_PART_NUMBER,d17.INV_NAME,d17.INV_DESCRIPTION,'
      ' d22.rohs , d02.UNIT_NAME , d95.QUANTITY'
      'from data0095 d95 '
      'inner join data0017 d17 on d95.INVT_PTR=d17.RKEY '
      'inner join data0002 d02 on d17.STOCK_UNIT_PTR=d02.RKEY'
      'inner join data0022 d22 on  d95.SRCE_PTR=d22.rkey'
      'where d95.rkey is null')
    Left = 88
    Top = 200
    object qry1INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object qry1INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object qry1INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object qry1rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object qry1UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object qry1QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
  end
end
