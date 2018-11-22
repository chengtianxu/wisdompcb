inherited frmMainOtherMtrlType_mod278: TfrmMainOtherMtrlType_mod278
  Caption = #26434#39033#29289#21697#31867#21035
  ClientHeight = 394
  ClientWidth = 711
  ExplicitWidth = 727
  ExplicitHeight = 433
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 711
    Height = 394
    ExplicitWidth = 711
    ExplicitHeight = 394
    inherited pnlDisplayMain: TPanel
      Width = 711
      Height = 394
      ExplicitWidth = 711
      ExplicitHeight = 394
      inherited pnlChildMain: TPanel
        Width = 709
        Height = 392
        ExplicitWidth = 709
        ExplicitHeight = 392
        inherited pnlEhMainDisplay: TPanel
          Width = 707
          Height = 361
          ExplicitWidth = 707
          ExplicitHeight = 361
          inherited ehMain: TDBGridEh
            Width = 705
            Height = 359
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DESCRIPTION'
                Footers = <>
                Title.Caption = #21517#31216
                Width = 205
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 707
          ExplicitWidth = 707
          inherited btnQry: TBitBtn
            Visible = False
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 'select * from data0075 where 1=1'
  end
  inherited dsMain: TDataSource
    Left = 344
    Top = 192
  end
  inherited xpmnfst1: TXPManifest
    Left = 552
    Top = 8
  end
  inherited pmMain: TPopupMenu
    Left = 184
    Top = 96
    object mniAdd: TMenuItem
      Caption = #28155#21152
      OnClick = mniAddClick
    end
    object mniEdit: TMenuItem
      Caption = #20462#25913
      OnClick = mniEditClick
    end
    object mniDel: TMenuItem
      Caption = #21024#38500
      OnClick = mniDelClick
    end
  end
  object cdstemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 512
    Top = 112
  end
  object qrytemp: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security In' +
      'fo=True;User ID=WZPCBConnect;Initial Catalog=sj_v20_live;Data So' +
      'urce=172.16.8.112'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0075'
      'order by rkey')
    Left = 560
    Top = 232
    object strngfldDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      FixedChar = True
    end
  end
end
