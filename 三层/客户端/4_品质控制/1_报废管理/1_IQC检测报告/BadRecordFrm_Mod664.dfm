inherited frmBadRecord_Mod664: TfrmBadRecord_Mod664
  Caption = #19981#33391#29289#26009#30331#35760
  ClientHeight = 438
  ClientWidth = 811
  ExplicitWidth = 827
  ExplicitHeight = 477
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 811
    Height = 438
    ExplicitWidth = 811
    ExplicitHeight = 438
    inherited pnlDisplayMain: TPanel
      Width = 811
      Height = 438
      ExplicitWidth = 811
      ExplicitHeight = 438
      inherited pnlChildMain: TPanel
        Width = 809
        Height = 436
        ExplicitWidth = 809
        ExplicitHeight = 436
        inherited pnlEhMainDisplay: TPanel
          Width = 807
          Height = 405
          ExplicitWidth = 807
          ExplicitHeight = 405
          inherited ehMain: TDBGridEh
            Width = 805
            Height = 403
            OnDrawColumnCell = ehMainDrawColumnCell
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CODE'
                Footers = <>
                Title.Caption = #20379#24212#21830#20195#30721
                Title.Color = clRed
                Title.SortIndex = 1
                Title.SortMarker = smUpEh
                Width = 83
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'abbr_name'
                Footers = <>
                Title.Caption = #20379#24212#21830#31616#31216
                Width = 90
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_PART_NUMBER'
                Footers = <>
                Title.Caption = #26448#26009#32534#30721
                Width = 86
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_PART_DESCRIPTION'
                Footers = <>
                Title.Caption = #26448#26009#25551#36848
                Width = 159
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DiscoverDate'
                Footers = <>
                Title.Caption = #21457#29983#26085#26399
                Width = 74
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'BatchNO'
                Footers = <>
                Title.Caption = #25209#21495
                Width = 89
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'BadQuantity'
                Footers = <>
                Title.Caption = #19981#33391#25968#37327'/'#19981#33391#29575
                Width = 111
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'BadRemark'
                Footers = <>
                Title.Caption = #38382#39064#28857
                Width = 180
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'Result'
                Footers = <>
                Title.Caption = #22788#29702#32467#26524
                Width = 121
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'IsReport'
                Footers = <>
                Title.Caption = #21457#36865'8D'#25253#21578
                Width = 75
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'IsClose'
                Footers = <>
                Title.Caption = #20851#38381#36319#36394
                Width = 58
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ModiDate'
                Footers = <>
                Title.Caption = #26368#21518#20462#25913#26102#38388
                Width = 89
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'USER_FULL_NAME'
                Footers = <>
                Title.Caption = #36319#36827#20154
                Width = 78
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'str_status'
                Footers = <>
                Title.Caption = #29366#24577
                Width = 55
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 807
          ExplicitWidth = 807
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'select QC_IQCBadRecord.rkey, QC_IQCBadRecord.rkey23, QC_IQCBadRe' +
      'cord.rkey17, QC_IQCBadRecord.DiscoverDate'#13#10#9#9', QC_IQCBadRecord.B' +
      'atchNO, QC_IQCBadRecord.BadQuantity, QC_IQCBadRecord.BadRemark, ' +
      'QC_IQCBadRecord.Result'#13#10#9#9', IsReport, QC_IQCBadRecord.IsClose, Q' +
      'C_IQCBadRecord.Status, QC_IQCBadRecord.TrancertMen, QC_IQCBadRec' +
      'ord.ModiDate'#13#10#9#9', data0023.SUPPLIER_NAME,data0023.CODE,data0017.' +
      'INV_PART_NUMBER,data0017.INV_PART_DESCRIPTION'#13#10#9#9', DATA0073.USER' +
      '_FULL_NAME,DATA0073.USER_LOGIN_NAME,data0023.abbr_name'#13#10'        ' +
      '                        , case QC_IQCBadRecord.Status when  0 th' +
      'en '#39#24453#30830#35748#39' when 1 then '#39#24050#23436#25104#39' end as str_status'#13#10'from QC_IQCBadReco' +
      'rd inner join '#13#10#9#9'data0023 on QC_IQCBadRecord.rkey23=data0023.rk' +
      'ey inner join'#13#10#9#9'data0017 on QC_IQCBadRecord.rkey17=data0017.rke' +
      'y left join '#13#10#9#9'data0073 on QC_IQCBadRecord.trancertmen=data0073' +
      '.rkey '
  end
  inherited pmMain: TPopupMenu
    OnPopup = pmMainPopup
    Left = 264
    Top = 168
    object mniAdd: TMenuItem
      Caption = #26032#22686
      OnClick = mniAddClick
    end
    object mniEdit: TMenuItem
      Caption = #32534#36753
      OnClick = mniEditClick
    end
    object mniCheck: TMenuItem
      Caption = #26816#26597
      OnClick = mniCheckClick
    end
    object mniDel: TMenuItem
      Caption = #21024#38500
      OnClick = mniDelClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object mniDone: TMenuItem
      Caption = #23436#25104#35760#24405
      OnClick = mniDoneClick
    end
  end
end
