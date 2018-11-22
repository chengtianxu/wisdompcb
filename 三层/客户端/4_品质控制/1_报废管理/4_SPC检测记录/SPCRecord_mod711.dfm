inherited frmSPCRecord_mod711: TfrmSPCRecord_mod711
  Caption = 'SPC'#26816#27979#35760#24405
  ClientHeight = 446
  ClientWidth = 831
  ExplicitWidth = 839
  ExplicitHeight = 473
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 831
    Height = 446
    ExplicitWidth = 831
    ExplicitHeight = 446
    inherited pnlDisplayMain: TPanel
      Width = 831
      Height = 446
      ExplicitWidth = 831
      ExplicitHeight = 446
      inherited pnlChildMain: TPanel
        Width = 829
        Height = 444
        ExplicitWidth = 829
        ExplicitHeight = 444
        inherited pnlEhMainDisplay: TPanel
          Left = 217
          Width = 611
          Height = 413
          ExplicitLeft = 217
          ExplicitWidth = 611
          ExplicitHeight = 413
          inherited ehMain: TDBGridEh
            Width = 609
            Height = 203
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'supplierName'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20379#24212#21830#21517#31216
                Width = 120
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'factoryName'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #24037#21378#21517#31216
                Width = 120
              end
              item
                DisplayFormat = 'yyyy-MM-dd'
                DynProps = <>
                EditButtons = <>
                FieldName = 'analysisDate'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20998#26512#26085#26399
                Width = 90
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'analysisClass'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20998#26512#29677#27425
                Width = 60
              end
              item
                DisplayFormat = 'HH:MM:SS'
                DynProps = <>
                EditButtons = <>
                FieldName = 'analysisTime'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20998#26512#26102#38388
                Width = 80
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'bigProcessNode'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #19968#32423#24037#24207
                Width = 80
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'smallProcessNode'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20108#32423#24037#24207
                Width = 80
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'equipmentNode'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #27133#21495'/'#32568#21495
                Width = 80
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'testUnit'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #21333#20301
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'analyst'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20998#26512#20154#21592
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'Input_DateTime'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #36755#20837#26102#38388
                Width = 90
              end>
          end
          object Panel2: TPanel
            Left = 1
            Top = 204
            Width = 609
            Height = 208
            Align = alBottom
            TabOrder = 1
            object DBGridEh1: TDBGridEh
              Left = 1
              Top = 1
              Width = 607
              Height = 206
              Align = alClient
              DataSource = dsDetail
              DynProps = <>
              TabOrder = 0
              Columns = <
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'testItemName'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #27979#35797#39033#30446
                  Width = 150
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'frequency'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #20998#26512#39057#29575
                  Width = 80
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'controlTarget'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #25511#21046#30446#26631
                  Width = 80
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'controlLowerLimit'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #25511#21046#19979#38480
                  Width = 100
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'controlUpperLimit'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #25511#21046#19978#38480
                  Width = 100
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'testResult'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #27979#35797#32467#26524
                  Width = 80
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'additiveContent'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #28155#21152#37327
                  Width = 80
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'reviewResult'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #22797#27979#32467#26524
                  Width = 80
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 827
          ExplicitWidth = 827
        end
        object Panel1: TPanel
          Left = 1
          Top = 30
          Width = 216
          Height = 413
          Align = alLeft
          TabOrder = 2
          object Splitter1: TSplitter
            Left = 212
            Top = 1
            Height = 411
            Align = alRight
            ExplicitLeft = 186
            ExplicitTop = 6
            ExplicitHeight = 399
          end
          object DBGridEh2: TDBGridEh
            Left = 1
            Top = 1
            Width = 211
            Height = 411
            Align = alClient
            DataSource = dsQC_Dep
            DynProps = <>
            PopupMenu = pmMain
            ReadOnly = True
            RowHeight = 25
            SelectionDrawParams.SelectionStyle = gsdsGridThemedEh
            TabOrder = 0
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ID'
                Footers = <>
                Title.Alignment = taCenter
                Width = 25
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'TypeName'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #27169#22359#21517#31216
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'TypeDesc'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #27169#22359#35828#26126
                Width = 90
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 'select * from dbo.SPC_DevInfo_Main'#13#10'where 1=1'
    AfterScroll = cdsMainAfterScroll
    Left = 384
    Top = 120
  end
  inherited dsMain: TDataSource
    Top = 120
  end
  inherited pmMain: TPopupMenu
    OnPopup = pmMainPopup
    Left = 320
    Top = 112
    object N1: TMenuItem
      Caption = #26032#22686
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #32534#36753
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21024#38500
      OnClick = N3Click
    end
  end
  object dsQC_Dep: TDataSource
    DataSet = cdsQC_Dep
    Left = 72
    Top = 160
  end
  object cdsQC_Dep: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 160
  end
  object cdsDetail: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 296
  end
  object dsDetail: TDataSource
    DataSet = cdsDetail
    Left = 472
    Top = 296
  end
end
