inherited frmPOMatrl: TfrmPOMatrl
  Left = 180
  Top = 191
  Caption = #35831#36141'/'#37319#36141#26597#35810
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 416
    inherited Panel3: TPanel
      object rgObject: TRzRadioGroup
        Left = 12
        Top = 8
        Width = 173
        Height = 41
        Alignment = taCenter
        Caption = #26597#25214#20869#23481
        Color = clWhite
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          #26448#26009#35831#36141
          #26448#26009#37319#36141)
        LightTextStyle = True
        TabOrder = 0
        OnChanging = rgObjectChanging
      end
      object rgGroupType: TRzRadioGroup
        Left = 204
        Top = 8
        Width = 181
        Height = 41
        Alignment = taCenter
        Caption = #26597#25214#20998#31867
        Color = clWhite
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          #29983#20135#29289#26009
          #38750#29983#20135#29289#26009)
        LightTextStyle = True
        TabOrder = 1
        OnChanging = rgGroupTypeChanging
      end
    end
    inherited Panel4: TPanel
      Height = 359
      inherited RzBitBtn1: TRzBitBtn
        Top = 200
        OnClick = RzBitBtn1Click
      end
      object RzBitBtn3: TRzBitBtn
        Left = 26
        Top = 128
        FrameColor = clWhite
        Caption = #37319#36141#27719#24635
        Color = clWhite
        HotTrack = True
        TabOrder = 4
        OnClick = RzBitBtn3Click
        NumGlyphs = 2
      end
    end
    inherited RzPageControl1: TRzPageControl
      Height = 359
      FixedDimension = 19
      inherited TabSheet1: TRzTabSheet
        inherited DBGrid1: TDBGridEh
          Height = 336
        end
      end
    end
  end
  inherited Panel2: TPanel
    Top = 416
    Height = 1
  end
end
