inherited frmUpdateSysFile_Mod474: TfrmUpdateSysFile_Mod474
  Caption = #26356#26032#29256#26412
  ClientHeight = 639
  ClientWidth = 1094
  OnCreate = FormCreate
  ExplicitWidth = 1110
  ExplicitHeight = 678
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 1094
    Height = 639
    ExplicitWidth = 1094
    ExplicitHeight = 639
    inherited pnl1: TPanel
      Width = 1092
      ExplicitWidth = 1092
      inherited btnSave: TBitBtn
        Caption = #26356#26032
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 1092
      Height = 604
      ExplicitWidth = 1092
      ExplicitHeight = 604
      object pnl3: TPanel
        Left = 769
        Top = 1
        Width = 322
        Height = 602
        Align = alClient
        TabOrder = 0
        object lbl3: TLabel
          Left = 1
          Top = 1
          Width = 320
          Height = 14
          Align = alTop
          Caption = #19978#20256'FTP'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 54
        end
        object ehUpLoadFTP: TDBGridEh
          Left = 1
          Top = 15
          Width = 320
          Height = 586
          Align = alClient
          DataSource = dsUpLoadFtp
          DynProps = <>
          TabOrder = 0
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Checked'
              Footers = <>
              Title.Caption = #36873
              Width = 30
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'UpdateOK'
              Footers = <>
              KeyList.Strings = (
                '1'
                '0')
              PickList.Strings = (
                #25104#21151
                #22833#36133)
              ReadOnly = True
              Title.Caption = #29366#24577
              Width = 40
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'FtpDesc'
              Footers = <>
              ReadOnly = True
              Title.Caption = 'FTP'#25551#36848
              Width = 150
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'FtpIP'
              Footers = <>
              ReadOnly = True
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object pnl4: TPanel
        Left = 465
        Top = 1
        Width = 304
        Height = 602
        Align = alLeft
        TabOrder = 1
        object lbl2: TLabel
          Left = 1
          Top = 1
          Width = 302
          Height = 14
          Align = alTop
          Caption = #26356#26032#25968#25454#24211
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 75
        end
        object ehUpdateDB: TDBGridEh
          Left = 1
          Top = 15
          Width = 302
          Height = 586
          Align = alClient
          DataSource = dsUpdateDB
          DynProps = <>
          TabOrder = 0
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Checked'
              Footers = <>
              Title.Caption = #36873
              Width = 30
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'UpdateOK'
              Footers = <>
              KeyList.Strings = (
                '1'
                '0')
              PickList.Strings = (
                'OK'
                'False')
              Title.Caption = #29366#24577
              Width = 50
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'DBName'
              Footers = <>
              ReadOnly = True
              Title.Caption = #25968#25454#24211
              Width = 120
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object pnl5: TPanel
        Left = 1
        Top = 1
        Width = 464
        Height = 602
        Align = alLeft
        TabOrder = 2
        object lbl1: TLabel
          Left = 1
          Top = 1
          Width = 462
          Height = 14
          Align = alTop
          Caption = #25991#20214
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 30
        end
        object ehLocalFile: TDBGridEh
          Left = 1
          Top = 15
          Width = 462
          Height = 586
          Align = alClient
          DataSource = dsLocalFile
          DynProps = <>
          ReadOnly = True
          TabOrder = 0
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'FileName'
              Footers = <>
              Title.Caption = #25991#20214#21517
              Width = 180
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'LocalPath'
              Footers = <>
              Title.Caption = #26412#22320#36335#24452
              Width = 100
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'FtpPath'
              Footers = <>
              Title.Caption = 'Ftp'#36335#24452
              Width = 100
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'CheckByVer'
              Footers = <>
              Title.Caption = #25353#29256#26412
              Width = 50
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
  end
  object cdsLocalFile: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 184
    object cdsLocalFileFileName: TStringField
      FieldName = 'FileName'
      Size = 50
    end
    object cdsLocalFileLocalPath: TStringField
      FieldName = 'LocalPath'
      Size = 150
    end
    object cdsLocalFileFtpPath: TStringField
      FieldName = 'FtpPath'
      Size = 150
    end
    object cdsLocalFileCheckByVer: TIntegerField
      FieldName = 'CheckByVer'
    end
  end
  object dsLocalFile: TDataSource
    DataSet = cdsLocalFile
    Left = 216
    Top = 184
  end
  object cdsUpdateDB: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 528
    Top = 192
    object cdsUpdateDBUpdateOK: TIntegerField
      FieldName = 'UpdateOK'
    end
    object cdsUpdateDBChecked: TBooleanField
      FieldName = 'Checked'
    end
    object cdsUpdateDBDBName: TStringField
      FieldName = 'DBName'
      Size = 30
    end
  end
  object dsUpdateDB: TDataSource
    DataSet = cdsUpdateDB
    Left = 608
    Top = 192
  end
  object dsUpLoadFtp: TDataSource
    DataSet = cdsUploadFtp
    Left = 912
    Top = 200
  end
  object cdsUploadFtp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 856
    Top = 200
    object cdsUploadFtpUpdateOK: TIntegerField
      FieldName = 'UpdateOK'
    end
    object cdsUploadFtpChecked: TBooleanField
      FieldName = 'Checked'
    end
    object cdsUploadFtpFtpDesc: TStringField
      FieldName = 'FtpDesc'
      Size = 50
    end
    object cdsUploadFtpFtpIP: TStringField
      FieldName = 'FtpIP'
      Size = 50
    end
  end
  object idftp1: TIdFTP
    IPVersion = Id_IPv4
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 856
    Top = 264
  end
end
