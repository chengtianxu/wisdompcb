inherited frmqk10000Main: Tfrmqk10000Main
  Caption = 'frmqk10000Main'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlbase: TPanel
    inherited pnlbaseGrid: TPanel
      inherited eh1: TDBGridEh
        PopupMenu = pmMain
      end
    end
    inherited pnlTop: TPanel
      inherited pnlFilter: TPanel
        ExplicitWidth = 477
      end
    end
  end
  inherited pmMain: TPopupMenu
    inherited mniNew: TMenuItem
      Visible = False
    end
    inherited mniDele: TMenuItem
      Visible = False
    end
    object mniN1: TMenuItem
      Tag = 101
      Caption = #28165#38500#30331#38470#24322#24120
      OnClick = mniN1Click
    end
    object mniN2: TMenuItem
      Tag = 102
      Caption = #37325#32622#23494#30721#20026#36134#21495
      OnClick = mniN2Click
    end
  end
end
