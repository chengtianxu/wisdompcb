inherited frmqk20000003Edit: Tfrmqk20000003Edit
  PixelsPerInch = 96
  TextHeight = 13
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
    Left = 170
    Top = 155
  end
end
