inherited frmqk20005Edit: Tfrmqk20005Edit
  Caption = 'frmqk20005Edit'
  ClientHeight = 640
  ClientWidth = 1122
  ExplicitWidth = 1138
  ExplicitHeight = 679
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBase1: TPanel
    Width = 1122
    Height = 640
    ExplicitWidth = 1122
    ExplicitHeight = 640
    inherited pnlTop: TPanel
      Width = 1120
      ExplicitWidth = 1120
      inherited pnlTopTool: TPanel
        Width = 1118
        ExplicitWidth = 1118
      end
    end
    inherited pnlBaseForVEditGrid: TPanel
      Width = 1120
      Height = 613
      ExplicitLeft = 1
      ExplicitTop = 26
      ExplicitWidth = 1120
      ExplicitHeight = 613
      inherited pnlBase2: TPanel
        Width = 256
        Height = 611
        Align = alLeft
        ExplicitTop = 1
        ExplicitWidth = 256
        ExplicitHeight = 611
        inherited spl1: TSplitter
          Left = 250
          Height = 609
          ExplicitLeft = 664
          ExplicitHeight = 557
        end
        inherited veh1: TDBVertGridEh
          Width = 249
          Height = 609
        end
      end
      object pnl1: TPanel
        Left = 257
        Top = 1
        Width = 862
        Height = 611
        Align = alClient
        TabOrder = 1
        object grp1: TGroupBox
          Left = 1
          Top = 1
          Width = 860
          Height = 184
          Align = alTop
          Caption = 'SQL'#33050#26412
          TabOrder = 0
          object dbmmoSqlTxt: TDBMemo
            Left = 2
            Top = 15
            Width = 856
            Height = 167
            Align = alClient
            DataField = 'SqlTxt'
            DataSource = dsMainSql
            TabOrder = 0
          end
        end
        object grp2: TGroupBox
          Left = 1
          Top = 185
          Width = 860
          Height = 425
          Align = alClient
          Caption = #30028#38754#26174#31034
          TabOrder = 1
          object pnl3: TPanel
            Left = 2
            Top = 15
            Width = 856
            Height = 408
            Align = alClient
            TabOrder = 0
            object pnl5: TPanel
              Left = 1
              Top = 1
              Width = 854
              Height = 406
              Align = alClient
              TabOrder = 0
            end
          end
        end
      end
    end
  end
  inherited ds1: TDataSource
    DataSet = mtPickID
    Left = 112
    Top = 489
  end
  object mtMainSql: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 145
    Top = 218
  end
  object mtMainSqlWhere: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 145
    Top = 282
  end
  object mtUIGrid: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 305
    Top = 226
  end
  object mtUIGridDetail: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 305
    Top = 282
  end
  object dsUIGridDetail: TDataSource
    DataSet = mtUIGridDetail
    Left = 574
    Top = 464
  end
  object mtPickID: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 114
    Top = 411
  end
  object dsMainSql: TDataSource
    DataSet = mtMainSql
    Left = 214
    Top = 220
  end
end
