inherited frmqk20001Edit: Tfrmqk20001Edit
  Caption = 'frmqk20001Edit'
  ClientHeight = 571
  ClientWidth = 953
  ExplicitWidth = 969
  ExplicitHeight = 610
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBase1: TPanel
    Width = 953
    Height = 571
    ExplicitWidth = 953
    ExplicitHeight = 571
    inherited pnlTop: TPanel
      Width = 951
      ExplicitWidth = 951
      inherited pnlTopTool: TPanel
        Width = 949
        ExplicitWidth = 949
      end
    end
    inherited pnlBase2: TPanel
      Width = 951
      Height = 544
      ExplicitWidth = 951
      ExplicitHeight = 544
      inherited spl1: TSplitter
        Left = 1
        Top = 256
        Width = 949
        Height = 14
        Cursor = crVSplit
        Align = alBottom
        ExplicitLeft = 1
        ExplicitTop = 203
        ExplicitWidth = 949
        ExplicitHeight = 14
      end
      inherited veh1: TDBVertGridEh
        Width = 949
        Height = 255
        Align = alClient
      end
      object mmoSqltxt: TRzDBMemo
        Left = 1
        Top = 270
        Width = 949
        Height = 273
        Align = alBottom
        DataField = 'Sqltxt'
        DataSource = ds1
        TabOrder = 1
      end
    end
  end
end
