object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'ERP'#19977#23618#26381#31471
  ClientHeight = 444
  ClientWidth = 629
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 629
    Height = 444
    ActivePage = ts1
    Align = alClient
    TabOrder = 0
    object ts1: TTabSheet
      Caption = #24341#25806
      object eh2: TDBGrid
        Left = 0
        Top = 30
        Width = 621
        Height = 386
        Align = alClient
        DataSource = dsEng
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'EngName'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AllCallCount'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IntfGetDataBySql'
            Width = 140
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IntfPostDataByTable'
            Width = 140
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IntfGetDataBySqlArr'
            Width = 140
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IntfPostDataBySqlArr'
            Width = 140
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IntfPostModData'
            Width = 140
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IntfspGetData'
            Width = 140
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IntfspExec'
            Width = 140
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Handle'
            Visible = True
          end>
      end
      object pnl3: TPanel
        Left = 0
        Top = 0
        Width = 621
        Height = 30
        Align = alTop
        TabOrder = 1
        object btnRefreshEng: TButton
          Left = 7
          Top = 1
          Width = 75
          Height = 25
          Caption = #21047#26032
          TabOrder = 0
          OnClick = btnRefreshEngClick
        end
      end
    end
    object ts2: TTabSheet
      Caption = #36830#25509
      ImageIndex = 1
      object eh1: TDBGrid
        Left = 0
        Top = 29
        Width = 621
        Height = 387
        Align = alClient
        DataSource = dm1.dsUser
        PopupMenu = pm1
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'PConObj'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IP'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Port'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Protocol'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ConTime'
            Width = 80
            Visible = True
          end>
      end
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 621
        Height = 29
        Align = alTop
        TabOrder = 1
        object lbl1: TLabel
          Left = 328
          Top = 6
          Width = 48
          Height = 13
          Caption = #24050#36830#25509#65306
        end
        object lblConNum: TLabel
          Left = 382
          Top = 7
          Width = 6
          Height = 13
          Caption = '0'
        end
        object lbl2: TLabel
          Left = 450
          Top = 6
          Width = 24
          Height = 13
          Caption = #26368#22823
        end
        object btnRefreshUser: TButton
          Left = 7
          Top = 1
          Width = 75
          Height = 25
          Caption = #21047#26032
          TabOrder = 0
          OnClick = btnRefreshUserClick
        end
        object seMaxCon: TSpinEdit
          Left = 481
          Top = 3
          Width = 48
          Height = 22
          MaxValue = 999
          MinValue = 1
          TabOrder = 1
          Value = 200
          OnChange = seMaxConChange
        end
      end
    end
  end
  object mm1: TMainMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    Left = 176
    Top = 216
    object mniN1: TMenuItem
      Caption = #25805#20316
      object mniLoadAllEng: TMenuItem
        AutoHotkeys = maManual
        AutoLineReduction = maManual
        Caption = #21152#36733#25152#26377#24341#25806
        OnClick = mniLoadAllEngClick
      end
      object mniN5: TMenuItem
        AutoHotkeys = maManual
        AutoLineReduction = maManual
        Caption = #24320#22987#25152#26377#24341#25806
        OnClick = mniN5Click
      end
      object mniN6: TMenuItem
        Caption = '-'
      end
      object mniN3: TMenuItem
        AutoHotkeys = maManual
        AutoLineReduction = maManual
        Caption = #20572#27490#25152#26377#24341#25806
        OnClick = mniN3Click
      end
      object mniN4: TMenuItem
        AutoHotkeys = maManual
        AutoLineReduction = maManual
        Caption = #21368#36733#25152#26377#24341#25806
        OnClick = mniN4Click
      end
      object mniN7: TMenuItem
        Caption = '-'
      end
      object mniRefreshDB: TMenuItem
        Caption = #21047#26032#25968#25454#24211
        OnClick = mniRefreshDBClick
      end
    end
    object mniEngLoad: TMenuItem
      AutoHotkeys = maManual
      AutoLineReduction = maManual
      Caption = #21152#36733
    end
    object mniEngStart: TMenuItem
      AutoHotkeys = maManual
      AutoLineReduction = maManual
      Caption = #24320#22987
    end
    object mniEngStop: TMenuItem
      AutoHotkeys = maManual
      AutoLineReduction = maManual
      Caption = #20572#27490
    end
    object mniEngUnLoad: TMenuItem
      AutoHotkeys = maManual
      AutoLineReduction = maManual
      Caption = #21368#36733
    end
  end
  object pm1: TPopupMenu
    OnPopup = pm1Popup
    Left = 296
    Top = 160
    object mniCloseConnect: TMenuItem
      Caption = #26029#24320#36830#25509
      OnClick = mniCloseConnectClick
    end
  end
  object cdsEng: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 272
    object strngfldEngEngName: TStringField
      FieldName = 'EngName'
    end
    object lrgntfldEngAllCallCount: TLargeintField
      FieldName = 'AllCallCount'
    end
    object intgrfldEngIntfGetDataBySql: TIntegerField
      FieldName = 'IntfGetDataBySql'
    end
    object intgrfldEngIntfPostDataByTable: TIntegerField
      FieldName = 'IntfPostDataByTable'
    end
    object intgrfldEngIntfGetDataBySqlArr: TIntegerField
      FieldName = 'IntfGetDataBySqlArr'
    end
    object intgrfldEngIntfPostDataBySqlArr: TIntegerField
      FieldName = 'IntfPostDataBySqlArr'
    end
    object intgrfldEngIntfPostModData: TIntegerField
      FieldName = 'IntfPostModData'
    end
    object intgrfldEngIntfspGetDataByID: TIntegerField
      FieldName = 'IntfspGetData'
    end
    object intgrfldEngIntfspExecByID: TIntegerField
      FieldName = 'IntfspExec'
    end
    object intgrfldEngHandle: TIntegerField
      FieldName = 'Handle'
    end
  end
  object dsEng: TDataSource
    DataSet = cdsEng
    Left = 312
    Top = 272
  end
end
