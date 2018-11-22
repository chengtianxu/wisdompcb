inherited FrmMain_Mod02: TFrmMain_Mod02
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'FrmMain_Mod02'
  ClientHeight = 384
  ClientWidth = 826
  ExplicitWidth = 842
  ExplicitHeight = 422
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 826
    Height = 384
    ExplicitWidth = 826
    ExplicitHeight = 384
    inherited pnlDisplayMain: TPanel
      Width = 826
      Height = 384
      ExplicitWidth = 826
      ExplicitHeight = 384
      inherited pnlChildMain: TPanel
        Width = 824
        Height = 382
        ExplicitWidth = 824
        ExplicitHeight = 382
        inherited pnlEhMainDisplay: TPanel
          Width = 822
          Height = 351
          ExplicitWidth = 822
          ExplicitHeight = 351
          inherited ehMain: TDBGridEh
            Width = 820
            Height = 349
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'unit_code'
                Footers = <>
                Title.Caption = #21333#20301#20195#30721
                Width = 100
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'unit_name'
                Footers = <>
                Title.Caption = #21333#20301#21517#31216
                Width = 170
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'prod'
                Footers = <>
                Title.Caption = #29983#20135#21333#20301
                Width = 100
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'purch'
                Footers = <>
                Title.Caption = #37319#36141#21333#20301
                Width = 100
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'stock'
                Footers = <>
                Title.Caption = #23384#36135#21333#20301
                Width = 100
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'quote'
                Footers = <>
                Title.Caption = #25253#20215#21333#20301
                Width = 100
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 822
          ExplicitWidth = 822
          inherited btnQry: TBitBtn
            Visible = False
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'select rkey,unit_code ,unit_name ,prod ,purch ,stock ,quote   fr' +
      'om data0002'#13#10
    ProviderName = 'DataSetProvider1'
    Left = 416
    Top = 160
    object cdsMainunit_code: TStringField
      FieldName = 'unit_code'
      Size = 5
    end
    object cdsMainunit_name: TStringField
      FieldName = 'unit_name'
    end
    object cdsMainprod: TStringField
      FieldName = 'prod'
      FixedChar = True
      Size = 1
    end
    object cdsMainpurch: TStringField
      FieldName = 'purch'
      FixedChar = True
      Size = 1
    end
    object cdsMainstock: TStringField
      FieldName = 'stock'
      FixedChar = True
      Size = 1
    end
    object cdsMainquote: TStringField
      FieldName = 'quote'
      FixedChar = True
      Size = 1
    end
    object cdsMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
  end
  inherited dsMain: TDataSource
    Left = 336
    Top = 168
  end
  inherited pmMain: TPopupMenu
    object N_Add: TMenuItem
      Caption = #26032#22686
      OnClick = N_AddClick
    end
    object N_delete: TMenuItem
      Tag = 1
      Caption = #21024#38500
      OnClick = N_deleteClick
    end
    object N3: TMenuItem
      Tag = 2
      Caption = #20462#25913
      OnClick = N_Edit
    end
  end
  object cds02: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 336
    Top = 248
  end
end
