inherited frmToolCostEdit_mod354: TfrmToolCostEdit_mod354
  Caption = #26356#25913#24037#20855#36153#29992
  ClientHeight = 368
  ClientWidth = 688
  Font.Height = -13
  Font.Name = #23435#20307
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 704
  ExplicitHeight = 407
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 688
    Height = 368
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 688
    ExplicitHeight = 368
    inherited pnl1: TPanel
      Width = 686
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 686
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnSaveAll: TBitBtn
        Left = 625
        Align = alRight
        ExplicitLeft = 625
      end
      inherited btnCheck: TBitBtn
        Left = 595
        Align = alRight
        ExplicitLeft = 595
      end
      inherited btnPrint: TBitBtn
        Left = 655
        Align = alRight
        ExplicitLeft = 655
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 686
      Height = 333
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 686
      ExplicitHeight = 333
      object SG1: TStringGrid
        Left = 1
        Top = 1
        Width = 684
        Height = 313
        Align = alTop
        ColCount = 6
        Ctl3D = False
        DefaultRowHeight = 20
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
        ParentCtl3D = False
        TabOrder = 0
        OnDrawCell = SG1DrawCell
        OnExit = SG1Exit
        OnKeyPress = SG1KeyPress
        OnSelectCell = SG1SelectCell
        ColWidths = (
          191
          89
          90
          96
          65
          23)
        RowHeights = (
          20
          20)
      end
      object cbb1: TComboBox
        Left = 467
        Top = 23
        Width = 67
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 1
        Text = 'Y'
        OnChange = cbb1Change
        OnKeyDown = cbb1KeyDown
        OnKeyPress = cbb1KeyPress
        Items.Strings = (
          'Y'
          'N')
      end
    end
  end
  object cdsTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 596
    Top = 160
  end
end
