inherited frmqk20000MainFrm: Tfrmqk20000MainFrm
  Caption = 'frmqk20000MainFrm'
  ClientHeight = 464
  ClientWidth = 730
  ExplicitWidth = 746
  ExplicitHeight = 503
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlbase: TPanel
    Width = 730
    Height = 464
    ExplicitWidth = 730
    ExplicitHeight = 464
    inherited pnlbaseforGrid: TPanel
      Width = 728
      Height = 462
      inherited pnlbaseGrid: TPanel
        Width = 557
        Height = 436
        ExplicitWidth = 557
        ExplicitHeight = 436
        inherited eh1: TDBGridEh
          Width = 555
          Height = 434
          PopupMenu = pmMain
        end
      end
      inherited pnlTop: TPanel
        Width = 726
        ExplicitWidth = 726
        inherited lblModID: TLabel
          Left = 669
          ExplicitLeft = 669
        end
      end
      inherited pnlWhere: TPanel
        Height = 436
        ExplicitHeight = 436
      end
    end
  end
  inherited pmMain: TPopupMenu
    inherited mniDele: TMenuItem
      Visible = False
    end
  end
  object mteh1: TMemTableEh
    Params = <>
    Left = 505
    Top = 305
  end
end
