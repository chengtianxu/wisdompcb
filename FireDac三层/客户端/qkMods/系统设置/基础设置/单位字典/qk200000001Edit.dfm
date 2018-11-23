inherited frmqk20000001Edit: Tfrmqk20000001Edit
  Caption = 'frmqk20000001Edit'
  ClientHeight = 368
  ClientWidth = 421
  ExplicitWidth = 437
  ExplicitHeight = 407
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBase1: TPanel
    Width = 421
    Height = 368
    ExplicitWidth = 421
    ExplicitHeight = 368
    inherited pnlTop: TPanel
      Width = 419
      ExplicitWidth = 419
      inherited pnlTopTool: TPanel
        Width = 417
        ExplicitWidth = 417
      end
    end
    inherited pnlBaseForVEditGrid: TPanel
      Width = 419
      Height = 341
      ExplicitLeft = 1
      ExplicitTop = 26
      ExplicitWidth = 419
      ExplicitHeight = 341
      inherited pnlBase2: TPanel
        Width = 417
        Height = 339
        ExplicitTop = 1
        ExplicitWidth = 417
        ExplicitHeight = 339
        inherited spl1: TSplitter
          Left = 411
          Height = 337
          ExplicitLeft = 625
          ExplicitHeight = 557
        end
        inherited veh1: TDBVertGridEh
          Width = 410
          Height = 337
        end
      end
    end
  end
  object mt1: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 176
    Top = 353
  end
end
