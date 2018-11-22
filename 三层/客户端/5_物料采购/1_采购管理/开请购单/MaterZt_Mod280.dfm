inherited frmMaterZt_Mod280: TfrmMaterZt_Mod280
  Caption = #22312#36884#26448#26009#26597#35810
  ClientHeight = 600
  ClientWidth = 1200
  WindowState = wsMaximized
  OnShow = FormShow
  ExplicitLeft = -269
  ExplicitWidth = 1208
  ExplicitHeight = 627
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 1200
    Height = 600
    ExplicitWidth = 798
    ExplicitHeight = 407
    inherited pnlDisplayMain: TPanel
      Width = 1200
      Height = 600
      ExplicitWidth = 798
      ExplicitHeight = 407
      inherited pnlChildMain: TPanel
        Width = 1198
        Height = 598
        ExplicitWidth = 796
        ExplicitHeight = 405
        inherited pnlEhMainDisplay: TPanel
          Width = 1196
          Height = 567
          ExplicitWidth = 794
          ExplicitHeight = 374
          inherited ehMain: TDBGridEh
            Width = 1194
            Height = 565
            PopupMenu = nil
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_PART_NUMBER'
                Footers = <>
                Title.Caption = #26448#26009#32534#30721
                Width = 109
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_PART_DESCRIPTION'
                Footers = <>
                Title.Caption = #26448#26009#35268#26684
                Width = 122
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
                Title.Caption = #20379#24212#21830
                Width = 62
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUAN_ORD'
                Footers = <>
                Title.Caption = #35746#21333#25968#37327
                Width = 62
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUAN_RECD'
                Footers = <>
                Title.Caption = #24050#25910#36135#25968#37327
                Width = 68
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'zaitu'
                Footers = <>
                Title.Caption = #27424#36135#25968#37327
                Width = 61
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'Quan_on_hand'
                Footers = <>
                Title.Caption = #24211#23384#25968#37327
                Width = 58
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'Unit_name'
                Footers = <>
                Title.Caption = #21333#20301
                Width = 56
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'REQ_DATE'
                Footers = <>
                Title.Caption = #38656#27714#26085#26399
                Width = 75
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PO_NUMBER'
                Footers = <>
                Title.Caption = #37319#36141#21333#21495
                Width = 59
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ANALYSIS_CODE_1'
                Footers = <>
                Title.Caption = #35831#36141#20154
                Width = 62
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'dept_name'
                Footers = <>
                Title.Caption = #35831#36141#37096#38376
                Width = 65
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PO_REQ_NUMBER'
                Footers = <>
                Title.Caption = #35831#36141#21333#21495
                Width = 66
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'reason'
                Footers = <>
                Title.Caption = #35831#36141#21407#22240
                Width = 86
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'rohs'
                Footers = <>
                Title.Caption = #29615#20445#26631#35782
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ComNm'
                Footers = <>
                Title.Caption = #24037#21378#21517#31216
                Width = 105
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'EMPLOYEE_NAME'
                Footers = <>
                Title.Caption = #37319#36141#20154
                Width = 60
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 1196
          ExplicitWidth = 794
          inherited lblFilter: TLabel
            Left = 274
            Top = 6
            Caption = #26448#26009#32534#30721
            ExplicitLeft = 274
            ExplicitTop = 6
          end
          object Label1: TLabel [1]
            Left = 586
            Top = 6
            Width = 24
            Height = 13
            Caption = #24037#21378
          end
          inherited btnQry: TBitBtn
            Visible = False
          end
          inherited btnZD: TBitBtn
            Visible = False
          end
          inherited edtFliter: TEdit
            Left = 331
            Top = 2
            ExplicitLeft = 331
            ExplicitTop = 2
          end
          inherited btnAuthDispatch: TBitBtn
            Visible = False
          end
          object cmbfac: TComboBox
            Left = 615
            Top = 3
            Width = 145
            Height = 21
            Style = csDropDownList
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
            TabOrder = 8
            OnChange = cmbfacChange
          end
        end
      end
    end
  end
  inherited dsMain: TDataSource
    Left = 528
    Top = 192
  end
  inherited pmZD: TPopupMenu
    Left = 240
    Top = 136
  end
  inherited cdsMainWhereInit: TClientDataSet
    Top = 112
  end
end
