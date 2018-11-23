inherited frmqk1005002ScriptFunc: Tfrmqk1005002ScriptFunc
  ClientWidth = 726
  ExplicitWidth = 742
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlbase: TPanel
    Width = 726
    inherited pnlbaseforGrid: TPanel
      Width = 724
      inherited pnlbaseGrid: TPanel
        Width = 553
        inherited eh1: TDBGridEh
          Width = 551
          PopupMenu = pmMain
        end
      end
      inherited pnlTop: TPanel
        Width = 722
        inherited lblModID: TLabel
          Left = 665
        end
        inherited pnlFilter: TPanel
          Left = 185
          Width = 504
          ExplicitLeft = 185
          ExplicitWidth = 504
          inherited lblFilter: TLabel
            Left = 103
          end
          inherited lbl1: TLabel
            Left = 382
          end
          inherited edtSearch: TRzEdit
            Left = 166
          end
          object cbxUseFor: TComboBox
            Left = 0
            Top = 0
            Width = 103
            Height = 21
            Align = alLeft
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 1
            Text = #31995#32479
            OnChange = cbxUseForChange
            Items.Strings = (
              #31995#32479
              #25253#20215
              #24037#31243)
            ExplicitLeft = -14
          end
        end
        inherited pnlTopTool: TPanel
          Width = 184
          ExplicitWidth = 184
          inherited btnDisplay: TRzBitBtn
            Visible = False
          end
          inherited btnWhere: TRzBitBtn
            Visible = False
          end
          inherited btnExportXls: TRzBitBtn
            Visible = False
          end
        end
      end
    end
  end
end
