inherited frmUser_Mod83: TfrmUser_Mod83
  Caption = #30701#20449#25509#25910#20154#21592#35774#32622
  ClientHeight = 410
  ClientWidth = 338
  ExplicitWidth = 346
  ExplicitHeight = 437
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 338
    Height = 410
    ExplicitWidth = 338
    ExplicitHeight = 410
    inherited pnlDisplayMain: TPanel
      Width = 338
      Height = 410
      ExplicitWidth = 338
      ExplicitHeight = 410
      inherited pnlChildMain: TPanel
        Width = 336
        Height = 408
        ExplicitWidth = 336
        ExplicitHeight = 408
        inherited pnlEhMainDisplay: TPanel
          Width = 334
          Height = 377
          ExplicitWidth = 334
          ExplicitHeight = 377
          inherited ehMain: TDBGridEh
            Width = 332
            Height = 335
            OnDblClick = ehMainDblClick
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'USER_LOGIN_NAME'
                Footers = <>
                Title.Caption = #24037#21495
                Width = 88
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'USER_FULL_NAME'
                Footers = <>
                Title.Caption = #22995#21517
                Width = 110
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'TPOSTION'
                Footers = <>
                Title.Caption = #32844#20301
                Width = 127
              end>
          end
          object Panel1: TPanel
            Left = 1
            Top = 336
            Width = 332
            Height = 40
            Align = alBottom
            TabOrder = 1
            object btnOK: TButton
              Left = 71
              Top = 6
              Width = 75
              Height = 25
              Caption = #30830#23450
              TabOrder = 0
              OnClick = btnOKClick
            end
            object btnCancelPick: TButton
              Left = 187
              Top = 6
              Width = 75
              Height = 25
              Caption = #21462#28040
              TabOrder = 1
              OnClick = btnCancelPickClick
            end
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 334
          ExplicitWidth = 334
          inherited lblFilter: TLabel
            Left = 74
            Top = 7
            Width = 24
            Caption = #24037#21495
            ExplicitLeft = 74
            ExplicitTop = 7
            ExplicitWidth = 24
          end
          inherited btnExit: TBitBtn
            Visible = False
          end
          inherited btnRefresh: TBitBtn
            Visible = False
          end
          inherited btnExportToExcel: TBitBtn
            Visible = False
          end
          inherited btnQry: TBitBtn
            Visible = False
          end
          inherited btnZD: TBitBtn
            Visible = False
          end
          inherited edtFliter: TEdit
            Left = 120
            Top = 3
            Width = 131
            ExplicitLeft = 120
            ExplicitTop = 3
            ExplicitWidth = 131
          end
          inherited btnAuthDispatch: TBitBtn
            Visible = False
          end
        end
      end
    end
  end
end
