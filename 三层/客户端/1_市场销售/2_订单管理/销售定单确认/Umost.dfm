inherited cost_mod73: Tcost_mod73
  Caption = #38468#21152#24037#20855#36153#29992
  ClientHeight = 343
  ClientWidth = 456
  OnCreate = FormCreate
  ExplicitWidth = 472
  ExplicitHeight = 381
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 456
    Height = 343
    ExplicitWidth = 456
    ExplicitHeight = 343
    inherited pnl1: TPanel
      Width = 454
      ExplicitWidth = 454
      inherited btnSave: TBitBtn
        Visible = False
      end
      inherited btnClose: TBitBtn
        Visible = False
      end
    end
    inherited pnl2: TPanel
      Width = 454
      Height = 308
      ExplicitWidth = 454
      ExplicitHeight = 308
      object StringGrid1: TStringGrid
        Left = 1
        Top = 1
        Width = 452
        Height = 281
        Align = alTop
        Ctl3D = False
        DefaultRowHeight = 20
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        ParentCtl3D = False
        ScrollBars = ssVertical
        TabOrder = 0
        ColWidths = (
          215
          87
          78
          70
          64)
        RowHeights = (
          20
          20)
      end
      object Button1: TButton
        Left = 193
        Top = 283
        Width = 75
        Height = 25
        Caption = #20851#38381
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object ads61: TClientDataSet
    Aggregates = <>
    CommandText = 'select rkey,category,tax_flag from data0061 order by rkey'
    Params = <>
    Left = 48
    Top = 96
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from data0062 '
    Params = <>
    Left = 120
    Top = 96
  end
end
