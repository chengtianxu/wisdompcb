inherited frmqk1604001PeopList: Tfrmqk1604001PeopList
  Caption = 'frmqk1604001PeopList'
  ClientWidth = 1049
  ExplicitWidth = 1065
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlbase: TPanel
    Width = 1049
    ExplicitWidth = 1049
    inherited pnlbaseforGrid: TPanel
      Width = 1047
      inherited pnlbaseGrid: TPanel
        Width = 876
        ExplicitWidth = 878
        inherited eh1: TDBGridEh
          Width = 876
          PopupMenu = pmMain
        end
      end
      inherited pnlTop: TPanel
        Width = 1045
        ExplicitWidth = 1047
        inherited lblModID: TLabel
          Left = 988
          ExplicitLeft = 988
        end
        inherited pnlFilter: TPanel
          Left = 529
          ExplicitLeft = 1046
        end
        inherited pnlTopTool: TPanel
          Left = 111
          Width = 418
          TabOrder = 3
          ExplicitLeft = 111
          ExplicitWidth = 418
        end
        object cbxOffDuty: TCheckBox
          Left = 56
          Top = 1
          Width = 55
          Height = 22
          Align = alLeft
          Caption = #31163#32844
          TabOrder = 2
          OnClick = cbxOnDutyClick
        end
        object cbxOnDuty: TCheckBox
          Left = 1
          Top = 1
          Width = 55
          Height = 22
          Align = alLeft
          Caption = #22312#32844
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnClick = cbxOnDutyClick
        end
      end
    end
  end
  inherited pmMain: TPopupMenu
    inherited mniNew: TMenuItem
      Visible = False
    end
    inherited mniEdit: TMenuItem
      Tag = 110
    end
    inherited mniView: TMenuItem
      Tag = 111
      OnClick = mniEditClick
    end
    inherited mniDele: TMenuItem
      Visible = False
    end
    object mniN1: TMenuItem
      Caption = '-'
    end
    object mniN2: TMenuItem
      Tag = 112
      Caption = #31163#32844
      OnClick = mniN2Click
    end
  end
end
