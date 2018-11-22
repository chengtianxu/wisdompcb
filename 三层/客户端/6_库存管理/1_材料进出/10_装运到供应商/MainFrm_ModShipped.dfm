inherited frmMain_Mod50Caller: TfrmMain_Mod50Caller
  Caption = 'frmMain_Mod50Caller'
  ClientHeight = 351
  ClientWidth = 766
  ExplicitWidth = 782
  ExplicitHeight = 390
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 766
    Height = 351
    ExplicitWidth = 766
    ExplicitHeight = 351
    inherited pnlDisplayMain: TPanel
      Width = 766
      Height = 351
      ExplicitWidth = 766
      ExplicitHeight = 351
      inherited pnlChildMain: TPanel
        Left = 145
        Width = 620
        Height = 349
        ExplicitLeft = 145
        ExplicitWidth = 620
        ExplicitHeight = 349
        inherited pnlEhMainDisplay: TPanel
          Width = 618
          Height = 318
          ExplicitWidth = 618
          ExplicitHeight = 274
          inherited ehMain: TDBGridEh
            Width = 616
            Height = 316
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 618
          ExplicitWidth = 618
        end
      end
      object tvJump: TTreeView
        Left = 1
        Top = 1
        Width = 144
        Height = 349
        Align = alLeft
        Indent = 19
        TabOrder = 1
        OnChange = tvJumpChange
        Items.NodeData = {
          03010000002A0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
          00020000000106C588D08F30529B4F945E4655260000000000000000000000FF
          FFFFFFFFFFFFFF00000000000000000000000001041F75A74E69729965280000
          000000000000000000FFFFFFFFFFFFFFFF00000000000000000000000001055E
          971F75A74E69729965}
      end
    end
  end
  inherited pmMain: TPopupMenu
    Left = 160
    Top = 240
  end
end
