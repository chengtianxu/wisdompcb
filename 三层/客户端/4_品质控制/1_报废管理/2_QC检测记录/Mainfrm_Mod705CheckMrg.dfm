inherited FrmMain_Mod705CheckMrg: TFrmMain_Mod705CheckMrg
  Caption = #32570#38519#24405#20837#31649#29702
  ClientHeight = 517
  ClientWidth = 1036
  KeyPreview = True
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  ExplicitWidth = 1052
  ExplicitHeight = 556
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 1036
    Height = 517
    ExplicitWidth = 1036
    ExplicitHeight = 517
    inherited pnlDisplayMain: TPanel
      Width = 1036
      Height = 517
      ExplicitWidth = 1036
      ExplicitHeight = 517
      inherited pnlChildMain: TPanel
        Width = 1034
        Height = 515
        ExplicitWidth = 1034
        ExplicitHeight = 515
        inherited pnlEhMainDisplay: TPanel
          Width = 1032
          Height = 484
          ExplicitWidth = 1032
          ExplicitHeight = 484
          object pnl2: TPanel [0]
            Left = 1
            Top = 1
            Width = 1030
            Height = 482
            Align = alClient
            TabOrder = 0
            object pnl4: TPanel
              Left = 1
              Top = 1
              Width = 1028
              Height = 480
              Align = alClient
              TabOrder = 0
              object ehRDetail: TDBGridEh
                Left = 1
                Top = 1
                Width = 224
                Height = 478
                Hint = #21452#20987#27169#29256#21517#31216#28155#21152#30456#24212#30340#19981#33391#35760#24405
                Align = alLeft
                DataSource = dsMMain
                DynProps = <>
                ParentShowHint = False
                PopupMenu = pmMain
                ShowHint = True
                TabOrder = 0
                OnDblClick = ehRDetailDblClick
                Columns = <
                  item
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'ID'
                    Footers = <>
                    Width = 24
                  end
                  item
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'TypeName'
                    Footers = <>
                    Title.Caption = #27169#29256#21517#31216
                    Width = 83
                  end
                  item
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'TypeDesc'
                    Footers = <>
                    Title.Caption = #27169#29256#35828#26126
                    Width = 94
                  end>
                object RowDetailData: TRowDetailPanelControlEh
                end
              end
              object pgcPackPrint: TRzPageControl
                Left = 225
                Top = 1
                Width = 802
                Height = 478
                Hint = ''
                Align = alClient
                ShowCloseButtonOnActiveTab = True
                TabOrder = 1
                OnClose = pgcPackPrintClose
                FixedDimension = 0
              end
            end
          end
          inherited ehMain: TDBGridEh
            Left = 896
            Top = 32
            Width = 113
            Height = 49
            Align = alNone
            TabOrder = 1
            Visible = False
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 1032
          ExplicitWidth = 1032
          inherited lblFilter: TLabel
            Visible = False
          end
          inherited btnRefresh: TBitBtn
            Visible = False
          end
          inherited btnExportToExcel: TBitBtn
            Visible = False
          end
          inherited btnQry: TBitBtn
            Visible = False
          end
          inherited edtFliter: TEdit
            Visible = False
          end
          inherited btnAuthDispatch: TBitBtn
            Visible = False
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    Left = 968
    Top = 72
  end
  inherited dsMain: TDataSource
    Left = 992
    Top = 72
  end
  inherited pmZD: TPopupMenu
    Left = 656
    Top = 0
  end
  inherited xpmnfst1: TXPManifest
    Left = 896
    Top = 0
  end
  inherited pmMain: TPopupMenu
    Top = 264
    object N_ModelMrg: TMenuItem
      Caption = #32534#36753#27169#29256
      OnClick = N_ModelMrgClick
    end
    object mniN_RecordMrg: TMenuItem
      Caption = #20462#25913#26816#27979#35760#24405
      OnClick = mniN_RecordMrgClick
    end
    object mni_Report: TMenuItem
      Caption = #25253#34920
      OnClick = mni_ReportClick
    end
  end
  inherited cdsMainWhereInit: TClientDataSet
    Left = 728
    Top = 0
  end
  object qry1: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security In' +
      'fo=True;User ID=WZPCBConnect;Initial Catalog=sj_v20_live;Data So' +
      'urce=172.16.8.112'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      ''
      'select   * from dbo.QC_DeptBugDef ')
    Left = 224
    Top = 408
    object qry1ID: TIntegerField
      FieldName = 'ID'
    end
    object qry1TypeName: TStringField
      FieldName = 'TypeName'
      Size = 50
    end
    object qry1TypeDesc: TStringField
      FieldName = 'TypeDesc'
      Size = 50
    end
  end
  object cdsMMain: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 152
    Top = 144
  end
  object dsMMain: TDataSource
    DataSet = cdsMain
    Left = 136
    Top = 64
  end
end
