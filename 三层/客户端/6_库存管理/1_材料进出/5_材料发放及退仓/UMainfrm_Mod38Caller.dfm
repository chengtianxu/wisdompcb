inherited frmMain_Mod38Caller: TfrmMain_Mod38Caller
  Caption = 'frmMain_Mod38Caller'
  ClientHeight = 520
  ClientWidth = 739
  ExplicitWidth = 755
  ExplicitHeight = 558
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 739
    Height = 520
    ExplicitWidth = 739
    ExplicitHeight = 520
    inherited pnlDisplayMain: TPanel
      Left = 152
      Width = 587
      Height = 520
      ExplicitLeft = 152
      ExplicitWidth = 587
      ExplicitHeight = 520
      inherited pnlChildMain: TPanel
        Width = 585
        Height = 518
        ExplicitWidth = 585
        ExplicitHeight = 518
        inherited pnlEhMainDisplay: TPanel
          Width = 583
          Height = 487
          ExplicitWidth = 583
          ExplicitHeight = 487
          inherited ehMain: TDBGridEh
            Width = 581
            Height = 485
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 583
          ExplicitWidth = 583
        end
      end
    end
    object tv1: TTreeView
      Left = 0
      Top = 0
      Width = 152
      Height = 520
      Align = alLeft
      AutoExpand = True
      Indent = 19
      TabOrder = 1
      OnChange = tv1Change
      Items.NodeData = {
        030300000026000000000000000000000000000000FFFFFFFF00000000000000
        00040000000104167F01785067996528000000000000000100000001000000FF
        FFFFFF0000000000000000000000000105D1533E653052E890E8952A00000000
        00000000000000FFFFFFFFFFFFFFFF0000000000000000000000000106D1533E
        6530524D91996555532C0000000000000000000000FFFFFFFFFFFFFFFF000000
        0000000000000000000107D1533E65305250679965C068E5672A000000000000
        0000000000FFFFFFFFFFFFFFFF0000000000000000000000000106D1533E6530
        5286989965555326000000000000000200000000000000FFFFFFFF0000000000
        0000000100000001044267799850679965280000000000000000000000FFFFFF
        FFFFFFFFFF0000000000000000000000000105D1533E653052E890E8952A0000
        00000000000500000000000000FFFFFFFF000000000000000002000000010600
        90D34ECA53CD9170533752280000000000000000000000FFFFFFFFFFFFFFFF00
        000000000000000000000001050090D34E2F00CD917053320000000000000000
        000000FFFFFFFFFFFFFFFF000000000000000000000000010A895B6851935E58
        5BED77E14F1A90E5779A5B494E}
    end
  end
  inherited pmMain: TPopupMenu
    Left = 288
    Top = 296
  end
end
