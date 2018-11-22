inherited frmPassNumber_Mod709: TfrmPassNumber_Mod709
  Caption = 'QC'#29983#20135#31649#25511
  ClientHeight = 414
  ClientWidth = 792
  ExplicitWidth = 800
  ExplicitHeight = 441
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 792
    Height = 414
    ExplicitWidth = 792
    ExplicitHeight = 414
    inherited pnlDisplayMain: TPanel
      Width = 792
      Height = 414
      ExplicitWidth = 792
      ExplicitHeight = 414
      inherited pnlChildMain: TPanel
        Width = 790
        Height = 412
        ExplicitWidth = 790
        ExplicitHeight = 412
        inherited pnlEhMainDisplay: TPanel
          Width = 788
          Height = 381
          ExplicitWidth = 788
          ExplicitHeight = 381
          inherited ehMain: TDBGridEh
            Left = 599
            Width = 188
            Height = 379
            Align = alRight
            Visible = False
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'Rkey'
                Footers = <>
                Title.Alignment = taCenter
                Width = 25
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'WORK_ORDER_NUMBER'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #27169#22359#21517#31216
                Width = 80
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DEPT_NAME'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #27169#22359#35828#26126
                Width = 70
              end>
          end
          object Panel1: TPanel
            Left = 1
            Top = 1
            Width = 598
            Height = 379
            Align = alClient
            TabOrder = 1
            object DBGridEh1: TDBGridEh
              Left = 1
              Top = 1
              Width = 216
              Height = 377
              Align = alLeft
              DataSource = dsQC_Dep
              DynProps = <>
              PopupMenu = pmMain
              ReadOnly = True
              RowHeight = 25
              SelectionDrawParams.SelectionStyle = gsdsGridThemedEh
              TabOrder = 0
              OnDblClick = DBGridEh1DblClick
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
        inherited pnlTopOperator: TPanel
          Width = 788
          ExplicitWidth = 788
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
          inherited btnZD: TBitBtn
            Visible = False
          end
          inherited edtFliter: TEdit
            Visible = False
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'SELECT top 2000 dbo.QC_PassNumCheck.*, dbo.Data0034.DEPT_CODE,Da' +
      'ta0034.DEPT_NAME,'#13#10'dbo.Data0006.WORK_ORDER_NUMBER, dbo.Data0005.' +
      'EMPLOYEE_NAME,'#13#10'case dbo.QC_PassNumCheck.Enable when 1 then '#39#26377#25928#39 +
      ' else '#39#26080#25928#39' end as sEnable'#13#10'FROM  dbo.QC_PassNumCheck INNER JOIN ' +
      #13#10'      dbo.Data0034 ON dbo.QC_PassNumCheck.D34_ptr = dbo.Data00' +
      '34.RKEY INNER JOIN '#13#10'      dbo.Data0006 ON dbo.QC_PassNumCheck.R' +
      'key06 = dbo.Data0006.RKEY left JOIN '#13#10'      dbo.Data0005 ON dbo.' +
      'QC_PassNumCheck.D05_ptr = dbo.Data0005.RKEY'#13#10'WHERE dbo.QC_PassNu' +
      'mCheck.Enable=1'#13#10
  end
  object cdsQC_Dep: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 360
    Top = 120
  end
  object dsQC_Dep: TDataSource
    DataSet = cdsQC_Dep
    Left = 304
    Top = 120
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 456
    Top = 120
  end
end
