inherited frmBaseDispchAuth: TfrmBaseDispchAuth
  Caption = #22996#25176#25480#26435
  ClientHeight = 600
  ClientWidth = 689
  ExplicitWidth = 705
  ExplicitHeight = 639
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 689
    Height = 600
    ExplicitWidth = 689
    ExplicitHeight = 600
    inherited pnlDisplayMain: TPanel
      Width = 689
      Height = 600
      ExplicitWidth = 689
      ExplicitHeight = 600
      inherited pnlChildMain: TPanel
        Width = 687
        Height = 598
        ExplicitWidth = 687
        ExplicitHeight = 598
        inherited pnlEhMainDisplay: TPanel
          Width = 685
          Height = 567
          ExplicitWidth = 685
          ExplicitHeight = 567
          inherited ehMain: TDBGridEh
            Width = 683
            Height = 565
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'USER_FULL_NAME'
                Footers = <>
                Title.Caption = #29992#25143#21517
                Width = 80
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DEPT_NAME'
                Footers = <>
                Title.Caption = #25152#22312#37096#38376
                Width = 100
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'OperatorName'
                Footers = <>
                Title.Caption = #21151#33021#21517#31216
                Width = 70
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'OperatorDesc'
                Footers = <>
                Title.Caption = #21151#33021#25551#36848
                Width = 180
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'OperatorID'
                Footers = <>
                Title.Caption = #21151#33021#21495
                Width = 70
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 685
          ExplicitWidth = 685
          inherited lblFilter: TLabel
            Left = 347
            ExplicitLeft = 347
          end
          inherited btnQry: TBitBtn
            Visible = False
          end
          inherited btnZD: TBitBtn
            Visible = False
          end
          inherited edtFliter: TEdit
            Left = 404
            ExplicitLeft = 404
          end
          inherited btnAuthDispatch: TBitBtn
            Visible = False
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'SELECT Tier3_UserAddsModOperator.IDKey,OperatorID,OperatorName,O' +
      'peratorDesc,d73_2.USER_FULL_NAME,d34.DEPT_NAME FROM Tier3_UserAd' +
      'dsModOperator'#13#10'INNER JOIN Tier3_UserModAuthCards ON MasterUserCa' +
      'rd_IDKey = Tier3_UserModAuthCards.IDKey'#13#10'INNER JOIN Tier3_ModAut' +
      'hCard on Tier3_ModAuthCard.IDKey = Tier3_UserModAuthCards.ModAut' +
      'hCard_IDKey'#13#10'INNER JOIN Tier3_ModAuthCardOperators ON Tier3_User' +
      'AddsModOperator.ModOperator_IDKey = Tier3_ModAuthCardOperators.M' +
      'odOperator_IDKey '#13#10'AND Tier3_ModAuthCardOperators.ModAuthCard_ID' +
      'Key = Tier3_ModAuthCard.IDKey'#13#10'INNER JOIN Tier3_ModOperators on ' +
      'Tier3_ModOperators.IDKey = Tier3_ModAuthCardOperators.ModOperato' +
      'r_IDKey'#13#10'INNER JOIN Data0073 d73_2 on d73_2.RKEY = Tier3_UserAdd' +
      'sModOperator.D73_Ptr'#13#10'INNER JOIN Data0005 d05 ON d05.RKEY = d73_' +
      '2.EMPLOYEE_PTR'#13#10'INNER JOIN Data0034 d34 ON d34.RKEY = d05.EMPLOY' +
      'EE_ID'#13#10'where 1=1'
  end
  inherited pmMain: TPopupMenu
    OnPopup = pmMainPopup
    object mniAddDispath: TMenuItem
      Caption = #26032#22686
      OnClick = mniAddDispathClick
    end
    object mniDeleDispathch: TMenuItem
      Caption = #21024#38500
      OnClick = mniDeleDispathchClick
    end
  end
end
