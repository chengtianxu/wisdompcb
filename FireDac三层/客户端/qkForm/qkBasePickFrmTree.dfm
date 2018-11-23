inherited frmqkbasePickTree: TfrmqkbasePickTree
  Caption = 'frmqkbasePickTree'
  ClientHeight = 570
  ClientWidth = 852
  ExplicitWidth = 868
  ExplicitHeight = 609
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlbase: TPanel
    Width = 852
    Height = 570
    ExplicitWidth = 852
    ExplicitHeight = 570
    inherited pnlbaseGrid: TPanel
      Width = 683
      Height = 545
      ExplicitWidth = 683
      ExplicitHeight = 545
      inherited eh1: TDBGridEh
        Width = 683
        Height = 545
      end
    end
    inherited pnlTop: TPanel
      Width = 852
      ExplicitWidth = 852
      inherited lblModID: TLabel
        Left = 815
        ExplicitLeft = 815
      end
    end
    inherited pnlWhere: TPanel
      Height = 545
      ExplicitHeight = 545
    end
  end
  object mteh1: TMemTableEh
    Params = <>
    TreeList.DefaultNodeExpanded = True
    Left = 417
    Top = 425
  end
end
