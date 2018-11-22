inherited frmMain_Mod474ModSet: TfrmMain_Mod474ModSet
  Caption = #31995#32479#27169#22359#35774#32622
  ClientHeight = 573
  ClientWidth = 1012
  ExplicitWidth = 1028
  ExplicitHeight = 612
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 1012
    Height = 573
    ExplicitWidth = 1012
    ExplicitHeight = 573
    inherited pnlDisplayMain: TPanel
      Width = 1012
      Height = 573
      ExplicitWidth = 1012
      ExplicitHeight = 573
      inherited pnlChildMain: TPanel
        Width = 1010
        Height = 571
        ExplicitWidth = 1010
        ExplicitHeight = 571
        inherited pnlEhMainDisplay: TPanel
          Width = 1008
          Height = 540
          ExplicitWidth = 1008
          ExplicitHeight = 540
          inherited ehMain: TDBGridEh
            Width = 1006
            Height = 538
            ReadOnly = False
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'BPLName'
                Footers = <>
                Title.Caption = 'BPL'#21517#31216
                Width = 170
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DESCRIPTION'
                Footers = <>
                Title.Caption = #27169#22359#21517#31216
                Width = 170
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'LastVersion'
                Footers = <>
                Title.Caption = #27169#22359#29256#26412
                Width = 100
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 1008
          ExplicitWidth = 1008
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'SELECT Checked,d419.RKEY,d419.BPLName,d419.DESCRIPTION,sf.LastVe' +
      'rsion,d419.ModID FROM Data0419 d419'#13#10'INNER JOIN Tier3_SysFiles s' +
      'f on sf.FileName = d419.BPLName'#13#10'LEFT JOIN Tier3_Checked on 1=1'#13 +
      #10'ORDER BY d419.manu_ptr,d419.seq_no'
  end
  inherited pmMain: TPopupMenu
    object mniEdit: TMenuItem
      Caption = #32534#36753
      OnClick = mniEditClick
    end
    object mniUpdateVer: TMenuItem
      Caption = #26356#26032#29256#26412
      Visible = False
    end
  end
end
