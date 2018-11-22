inherited frmMain_Mod599: TfrmMain_Mod599
  Caption = #22238#22797#20132#26399#26356#25913#23457#26680
  ClientHeight = 439
  ClientWidth = 734
  ExplicitWidth = 750
  ExplicitHeight = 477
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 734
    Height = 439
    ExplicitWidth = 734
    ExplicitHeight = 439
    inherited pnlDisplayMain: TPanel
      Width = 734
      Height = 439
      ExplicitWidth = 734
      ExplicitHeight = 439
      inherited pnlChildMain: TPanel
        Width = 732
        Height = 437
        ExplicitWidth = 732
        ExplicitHeight = 437
        inherited pnlEhMainDisplay: TPanel
          Width = 730
          Height = 406
          ExplicitWidth = 730
          ExplicitHeight = 406
          inherited ehMain: TDBGridEh
            Width = 728
            Height = 183
            Columns = <
              item
                Alignment = taRightJustify
                DynProps = <>
                EditButtons = <>
                FieldName = 'SALES_ORDER'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #38144#21806#35746#21333#21495
                Width = 90
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'rkey174'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #30003#35831#32534#21495
                Width = 70
                WordWrap = True
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'status'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #29366#24577
                Width = 55
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CUST_CODE'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #23458#25143#20195#30721
                Width = 45
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'MANU_PART_NUMBER'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26412#21378#32534#21495
                Width = 94
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'MANU_PART_DESC'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #23458#25143#22411#21495
                Width = 146
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PO_NUMBER'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #23458#25143#35746#21333#21495
                Width = 129
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PARTS_ORDERED'
                Footers = <>
                Tag = 1
                Title.Alignment = taCenter
                Title.Caption = #35746#21333#25968#37327
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ENT_DATE'
                Footers = <>
                Tag = 1
                Title.Alignment = taCenter
                Title.Caption = #35746#21333#26085#26399
                Width = 78
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'unit_sq'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #21333#29255#38754#31215
                Width = 100
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'dArea'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #35746#21333#38754#31215
                Width = 100
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'proposer_name'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #30003#35831#20154
                Width = 61
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'proposer_Date'
                Footers = <>
                Tag = 1
                Title.Alignment = taCenter
                Title.Caption = #30003#35831#26085#26399
                Width = 78
              end
              item
                DisplayFormat = 'yyyy-MM-dd'
                DynProps = <>
                EditButtons = <>
                FieldName = 'oldReply_Date'
                Footers = <>
                Tag = 1
                Title.Alignment = taCenter
                Title.Caption = #21407#22238#22797#20132#26399
                Width = 78
              end
              item
                DisplayFormat = 'yyyy-MM-dd'
                DynProps = <>
                EditButtons = <>
                FieldName = 'newReply_Date'
                Footers = <>
                Tag = 1
                Title.Alignment = taCenter
                Title.Caption = #26032#22238#22797#20132#26399
                Width = 78
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'approval_name'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #23457#26680#20154
                Width = 72
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'approval_Date'
                Footers = <>
                Tag = 1
                Title.Alignment = taCenter
                Title.Caption = #23457#26680#26085#26399
                Width = 78
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'remark'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #22791#27880
                Width = 150
              end>
          end
          object Panel1: TPanel
            Left = 1
            Top = 184
            Width = 728
            Height = 221
            Align = alBottom
            TabOrder = 1
            object ehDetail: TDBGridEh
              Left = 1
              Top = 1
              Width = 726
              Height = 219
              Align = alClient
              DataSource = dsDetail
              DynProps = <>
              ReadOnly = True
              TabOrder = 0
              Columns = <
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'sch_date'
                  Footers = <>
                  Title.Caption = #23436#24037#26085#26399
                  Width = 154
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'quantity'
                  Footers = <>
                  Title.Caption = #23436#24037#25968#37327
                  Width = 98
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 730
          ExplicitWidth = 730
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'SELECT D60.SALES_ORDER,D25.MANU_PART_NUMBER,D25.MANU_PART_DESC'#13#10 +
      #9',D10.CUST_CODE,D97.PO_NUMBER,D60.PARTS_ORDERED,D60.ENT_DATE'#13#10#9',' +
      'D60.RKEY,D174.oldReply_Date,D174.newReply_Date,D174.RKEY as rkey' +
      '174'#13#10'    ,D05.employee_name as proposer_name,D174.proposer_Date,' +
      'D05_1.employee_name as approval_name'#13#10'    ,D174.approval_Date,ca' +
      'se D174.status when 0 then '#39#24453#23457#26680#39' when 1 then '#39#24050#23457#26680#39'  end as strst' +
      'atus'#13#10'    ,D174.remark,D60.set_ordered,D60.ORIG_REQUEST_DATE,D60' +
      '.ORIG_SCHED_SHIP_DATE, D174.status'#13#10'    ,D25.spell_qty,D60.SCH_D' +
      'ATE,D60.complete_date,D25.MFG_LEAD_TIME,D10.DAYS_EARLY_SCHEDULE'#13 +
      #10'    ,D25.unit_sq,D60.PARTS_ORDERED*D25.unit_sq as dArea,D174.pl' +
      'anned_FLAG'#13#10'FROM   Data0174 AS D174 '#13#10#9#9'INNER JOIN Data0060 AS D' +
      '60 ON D174.so_ptr=D60.Rkey '#13#10#9#9'INNER JOIN Data0025 AS D25 ON D60' +
      '.CUST_PART_PTR=D25.Rkey '#13#10#9#9'INNER JOIN Data0097 AS D97 ON D60.PU' +
      'RCHASE_ORDER_PTR=D97.Rkey '#13#10#9#9'INNER JOIN Data0010 AS D10 ON D60.' +
      'CUSTOMER_PTR=D10.Rkey '#13#10#9#9'LEFT OUTER JOIN Data0005 AS D05 ON D17' +
      '4.proposer=D05.Rkey '#13#10#9#9'LEFT OUTER JOIN Data0005 AS D05_1 ON D17' +
      '4.approval=D05_1.Rkey'#13#10'WHERE 1=1 '
    AfterScroll = cdsMainAfterScroll
  end
  inherited pmMain: TPopupMenu
    OnPopup = pmMainPopup
    Left = 200
    Top = 120
    object NAdd: TMenuItem
      Caption = #26032#22686
      OnClick = NAddClick
    end
    object NEdit: TMenuItem
      Caption = #32534#36753
      OnClick = NEditClick
    end
    object NAuth: TMenuItem
      Caption = #23457#26680
      OnClick = NAuthClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object NDel: TMenuItem
      Caption = #21024#38500
      OnClick = NDelClick
    end
  end
  object cdsDetail: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT rkey174,finish_Date as sch_date,finish_quantity as quanti' +
      'ty'#13#10'FROM Data0175'#13#10
    Params = <>
    ReadOnly = True
    Left = 400
    Top = 304
  end
  object dsDetail: TDataSource
    DataSet = cdsDetail
    Left = 472
    Top = 304
  end
end
