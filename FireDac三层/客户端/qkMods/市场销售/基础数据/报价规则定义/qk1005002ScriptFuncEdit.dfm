inherited frmqk1005002ScriptFuncEdit: Tfrmqk1005002ScriptFuncEdit
  ClientHeight = 631
  ClientWidth = 878
  ExplicitWidth = 894
  ExplicitHeight = 670
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBase1: TPanel
    Width = 878
    Height = 631
    ExplicitWidth = 725
    ExplicitHeight = 607
    inherited pnlTop: TPanel
      Width = 876
      ExplicitWidth = 723
      inherited pnlTopTool: TPanel
        Width = 874
        ExplicitWidth = 721
      end
    end
    inherited pnlBaseForVEditGrid: TPanel
      Width = 320
      Height = 604
      Align = alLeft
      ExplicitLeft = 1
      ExplicitTop = 26
      ExplicitWidth = 320
      ExplicitHeight = 580
      inherited pnlBase2: TPanel
        Width = 318
        Height = 602
        ExplicitTop = 1
        ExplicitWidth = 721
        ExplicitHeight = 578
        inherited spl1: TSplitter
          Left = 312
          Height = 600
          ExplicitLeft = 715
          ExplicitHeight = 576
        end
        inherited veh1: TDBVertGridEh
          Width = 311
          Height = 600
        end
      end
    end
    object pnl1: TPanel
      Left = 321
      Top = 26
      Width = 556
      Height = 604
      Align = alClient
      Caption = 'pnl1'
      TabOrder = 2
      ExplicitLeft = 272
      ExplicitTop = 280
      ExplicitWidth = 185
      ExplicitHeight = 41
      object dbmmof: TDBMemo
        Left = 1
        Top = 1
        Width = 554
        Height = 602
        Align = alClient
        DataField = 'FuncCode'
        DataSource = ds1
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        WantTabs = True
        WordWrap = False
        ExplicitWidth = 560
        ExplicitHeight = 578
      end
    end
  end
  inherited ds1: TDataSource
    DataSet = mt1
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
    Left = 442
    Top = 435
  end
end
