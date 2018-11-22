inherited frmMain_Mod531: TfrmMain_Mod531
  Caption = 'frmMain_Mod531'
  ClientHeight = 574
  ClientWidth = 886
  ExplicitWidth = 902
  ExplicitHeight = 613
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 886
    Height = 574
    ExplicitWidth = 886
    ExplicitHeight = 574
    inherited pnlDisplayMain: TPanel
      Width = 886
      Height = 574
      ExplicitWidth = 886
      ExplicitHeight = 574
      inherited pnlChildMain: TPanel
        Width = 884
        Height = 572
        ExplicitWidth = 884
        ExplicitHeight = 572
        inherited pnlEhMainDisplay: TPanel
          Width = 882
          Height = 541
          ExplicitWidth = 882
          ExplicitHeight = 541
          inherited ehMain: TDBGridEh
            Width = 216
            Height = 539
            Align = alLeft
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            OnDblClick = ehMainDblClick
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'Operator'
                Footers = <>
                Title.Caption = #25805#20316
              end>
          end
          object pnl1: TPanel
            Left = 217
            Top = 1
            Width = 664
            Height = 539
            Align = alClient
            TabOrder = 1
            object pgcTagOperator: TRzPageControl
              Left = 1
              Top = 1
              Width = 662
              Height = 537
              Hint = ''
              Align = alClient
              ShowCloseButton = True
              ShowCloseButtonOnActiveTab = True
              TabOrder = 0
              OnClose = pgcTagOperatorClose
              FixedDimension = 0
            end
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 882
          ExplicitWidth = 882
          inherited lblFilter: TLabel
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
            Visible = False
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    object cdsMainOperator: TStringField
      FieldName = 'Operator'
      Size = 50
    end
  end
end
