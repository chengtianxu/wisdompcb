inherited frmMatrlInOut: TfrmMatrlInOut
  Left = 192
  Top = 167
  Caption = #26448#26009#26597#35810
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 416
    inherited Panel3: TPanel
      Height = 65
      object rgObject: TRzRadioGroup
        Left = 12
        Top = 8
        Width = 333
        Height = 41
        Caption = #26597#25214#20869#23481
        Color = clWhite
        Columns = 4
        ItemIndex = 0
        Items.Strings = (
          #26448#26009#25509#25910
          #26448#26009#21457#25918
          #26448#26009#24211#23384
          #26448#26009#36716#31227)
        LightTextStyle = True
        TabOrder = 0
        OnChanging = rgObjectChanging
      end
      object rgGroupType: TRzRadioGroup
        Left = 357
        Top = 8
        Width = 137
        Height = 41
        Caption = #32467#26524
        Color = clWhite
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          #26126#32454
          #27719#24635)
        LightTextStyle = True
        TabOrder = 1
        OnChanging = rgGroupTypeChanging
      end
    end
    inherited Panel4: TPanel
      Top = 65
      Height = 351
    end
    inherited RzPageControl1: TRzPageControl
      Top = 65
      Height = 351
      FixedDimension = 19
      inherited TabSheet1: TRzTabSheet
        inherited DBGrid1: TDBGridEh
          Height = 328
        end
      end
    end
  end
  inherited Panel2: TPanel
    Top = 416
    Height = 1
  end
end
