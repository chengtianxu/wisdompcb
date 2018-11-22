inherited frmMainPurAudit_mod274: TfrmMainPurAudit_mod274
  Caption = 'frmMainPurAudit_mod274'
  ClientHeight = 452
  ClientWidth = 755
  ExplicitWidth = 771
  ExplicitHeight = 491
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 755
    Height = 452
    ExplicitWidth = 527
    ExplicitHeight = 242
    inherited pnlDisplayMain: TPanel
      Width = 755
      Height = 452
      ExplicitWidth = 527
      ExplicitHeight = 242
      inherited pnlChildMain: TPanel
        Width = 753
        Height = 450
        ExplicitWidth = 525
        ExplicitHeight = 240
        inherited pnlEhMainDisplay: TPanel
          Width = 751
          Height = 419
          ExplicitWidth = 523
          ExplicitHeight = 209
          inherited ehMain: TDBGridEh
            Width = 749
            Height = 417
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PURCHASE_TYPE'
                Footers = <>
                Title.Caption = #23457#26680#31867#22411
                Width = 110
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'warehouse_code'
                Footers = <>
                Title.Caption = #24037#21378#20195#30721
                Width = 63
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
                Title.Caption = #24037#21378
                Width = 88
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'user_id'
                Footers = <>
                Title.Caption = #29992#25143#20195#30721
                Width = 71
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'USER_FULL_NAME'
                Footers = <>
                Title.Caption = #29992#25143#21517
                Width = 84
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'seq_no'
                Footers = <>
                Title.Caption = #39034#24207
                Width = 46
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'lower_limit'
                Footers = <>
                Title.Caption = #39069#24230#19979#38480' '
                Width = 84
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'upper_limit'
                Footers = <>
                Title.Caption = #39069#24230#19978#38480
                Width = 89
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 751
          ExplicitWidth = 523
          inherited btnExportToExcel: TBitBtn
            Visible = False
          end
          inherited btnQry: TBitBtn
            Visible = False
          end
          inherited btnZD: TBitBtn
            Visible = False
          end
          inherited btnAuthDispatch: TBitBtn
            Visible = False
          end
        end
      end
    end
  end
  inherited dsMain: TDataSource
    Left = 328
  end
  inherited pmZD: TPopupMenu
    Top = 72
  end
  inherited pmMain: TPopupMenu
    Left = 152
    Top = 192
    object mniAdd: TMenuItem
      Caption = #26032#22686
      OnClick = mniAddClick
    end
    object mniEdit: TMenuItem
      Caption = #32534#36753
      OnClick = mniEditClick
    end
    object mniDel: TMenuItem
      Caption = #21024#38500
      OnClick = mniDelClick
    end
  end
  inherited cdsMainWhereInit: TClientDataSet
    Left = 352
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
      'SELECT dbo.Data0073.USER_LOGIN_NAME AS user_id, '
      
        'dbo.Data0073.USER_FULL_NAME, dbo.data0077.user_ptr, dbo.data0077' +
        '.upper_limit, '
      
        'dbo.data0077.lower_limit, dbo.data0077.seq_no, dbo.Data0015.ABBR' +
        '_NAME,'
      
        'data0077.warehouse_ptr,data0015.warehouse_code,data0077.PURCHASE' +
        '_TYPE,data0077.rkey'
      'FROM   dbo.data0077 INNER JOIN'
      
        'dbo.Data0073 ON dbo.data0077.user_ptr = dbo.Data0073.RKEY INNER ' +
        'JOIN'
      'dbo.Data0015 ON dbo.data0077.warehouse_ptr = dbo.Data0015.RKEY'
      'where 1=2')
    Left = 560
    Top = 232
    object wdstrngfldPURCHASE_TYPE: TWideStringField
      FieldName = 'PURCHASE_TYPE'
      Size = 50
    end
    object strngfld_code: TStringField
      FieldName = 'warehouse_code'
      Size = 5
    end
    object strngfldABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object strngfld_id: TStringField
      FieldName = 'user_id'
      Size = 15
    end
    object strngfldUSER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object intgrfld_no: TIntegerField
      FieldName = 'seq_no'
    end
    object qrytemplower_limit: TBCDField
      FieldName = 'lower_limit'
      Precision = 19
    end
    object qrytempupper_limit: TBCDField
      FieldName = 'upper_limit'
      Precision = 19
    end
  end
  object cdstemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 472
    Top = 168
  end
end
