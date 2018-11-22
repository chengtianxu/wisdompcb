inherited frmMain_Mod474Update: TfrmMain_Mod474Update
  Caption = 'frmMain_Mod474Update'
  ClientHeight = 596
  ClientWidth = 931
  ExplicitWidth = 947
  ExplicitHeight = 635
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 931
    Height = 596
    ExplicitWidth = 931
    ExplicitHeight = 596
    inherited pnlDisplayMain: TPanel
      Width = 931
      Height = 596
      ExplicitWidth = 931
      ExplicitHeight = 596
      inherited pnlChildMain: TPanel
        Width = 929
        Height = 594
        ExplicitWidth = 929
        ExplicitHeight = 594
        inherited pnlEhMainDisplay: TPanel
          Width = 927
          Height = 563
          ExplicitWidth = 927
          ExplicitHeight = 563
          inherited ehMain: TDBGridEh
            Width = 925
            Height = 561
            ReadOnly = False
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'FileName'
                Footers = <>
                ReadOnly = True
                Title.Caption = #25991#20214#21517
                Width = 200
              end
              item
                Checkboxes = True
                DynProps = <>
                EditButtons = <>
                FieldName = 'checked'
                Footers = <>
                Title.Caption = #36873
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'LastVersion'
                Footers = <>
                ReadOnly = True
                Title.Caption = #24403#21069#29256#26412
                Width = 80
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'LastModifyTime'
                Footers = <>
                ReadOnly = True
                Title.Caption = #25353#26102#38388
                Width = 90
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CheckByVer'
                Footers = <>
                ReadOnly = True
                Title.Caption = #25353#29256#26412
                Width = 70
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'LinkModID'
                Footers = <>
                ReadOnly = True
                Title.Caption = #20851#32852'MOD'
                Width = 80
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 927
          ExplicitWidth = 927
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'SELECT Checked,Tier3_SysFiles.*  FROM Tier3_SysFiles'#13#10'INNER JOIN' +
      ' Tier3_Checked on 1 = 1'#13#10'ORDER by FileName ASC'#13#10
  end
  inherited pmMain: TPopupMenu
    object mniUpdateVer: TMenuItem
      Caption = #26356#26032#29256#26412
      OnClick = mniUpdateVerClick
    end
  end
end
