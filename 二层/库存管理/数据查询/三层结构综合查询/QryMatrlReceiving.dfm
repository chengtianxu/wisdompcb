inherited frmQryMatrlReceiving: TfrmQryMatrlReceiving
  Left = 91
  Top = 139
  Caption = #26448#26009#25509#25910
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 49
  end
  inherited Panel2: TPanel
    Top = 49
    Height = 454
    inherited Splitter1: TSplitter
      Height = 450
    end
    inherited Panel3: TPanel
      Height = 450
      inherited Panel4: TPanel
        Top = 396
      end
      inherited RzPageControl1: TRzPageControl
        Height = 396
        FixedDimension = 19
        inherited TabSheet1: TRzTabSheet
          inherited DBGrid1: TDBGridEh
            Height = 373
          end
        end
      end
    end
    inherited Panel5: TPanel
      Height = 450
      inherited DBGrid3: TDBGridEh
        Height = 429
      end
      inherited StatusBar1: TStatusBar
        Top = 430
      end
    end
  end
end
