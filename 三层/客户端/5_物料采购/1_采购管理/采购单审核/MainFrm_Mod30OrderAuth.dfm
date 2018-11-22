inherited frmMain_Mod30OrderAuth: TfrmMain_Mod30OrderAuth
  Left = 366
  Top = 214
  Caption = #37319#36141#21333#23457#26680
  ClientHeight = 602
  ClientWidth = 854
  ExplicitWidth = 870
  ExplicitHeight = 641
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 854
    Height = 602
    ExplicitWidth = 854
    ExplicitHeight = 602
    inherited pnlDisplayMain: TPanel
      Width = 854
      Height = 602
      ExplicitWidth = 854
      ExplicitHeight = 602
      inherited pnlChildMain: TPanel
        Width = 852
        Height = 600
        ExplicitWidth = 852
        ExplicitHeight = 600
        inherited pnlEhMainDisplay: TPanel
          Width = 850
          Height = 298
          ExplicitWidth = 850
          ExplicitHeight = 298
          inherited ehMain: TDBGridEh
            Width = 848
            Height = 296
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PO_NUMBER'
                Footers = <>
                Title.Caption = #35746#21333#32534#21495
                Width = 102
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
                Title.Caption = #20379#24212#21830
                Width = 74
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'EMPLOYEE_NAME'
                Footers = <>
                Title.Caption = #21019#24314#20154#21592
                Width = 100
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PO_DATE'
                Footers = <>
                Title.Caption = #36755#20837#26085#26399
                Width = 87
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CURR_NAME'
                Footers = <>
                Title.Caption = #24065#31181
                Width = 62
              end
              item
                DisplayFormat = '#0.000'
                DynProps = <>
                EditButtons = <>
                FieldName = 'SUB_TOTAL'
                Footers = <>
                Title.Caption = #24635#35745#37329#39069#65288#21547#31246#65289
                Width = 103
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'str_type'
                Footers = <>
                Title.Caption = #31867#22411
                Width = 65
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'STATE_INVT_TAX_FLAG'
                Footers = <>
                Title.Caption = #26159#21542'VMI'
                Width = 58
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'str_status'
                Footers = <>
                Title.Caption = #29366#24577
                Width = 62
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'FACTORY_LOCATION'
                Footers = <>
                Title.Caption = #35013#36816#22320#28857
                Width = 70
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'Name15'
                Footers = <>
                Title.Caption = #24037#21378
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 850
          ExplicitWidth = 850
          inherited edtFliter: TEdit
            Width = 141
            ExplicitWidth = 141
          end
          object rg1: TRzRadioGroup
            Left = 688
            Top = -6
            Width = 161
            Height = 35
            BiDiMode = bdLeftToRight
            Caption = ''
            Columns = 2
            ItemHeight = 20
            ItemIndex = 0
            Items.Strings = (
              #24403#21069#23457#26680
              #20840#37096#23457#26680)
            ParentBiDiMode = False
            StartYPos = 0
            TabOrder = 8
            OnClick = rg1Click
          end
        end
        object pnlEhDetail: TPanel
          Left = 1
          Top = 328
          Width = 850
          Height = 271
          Align = alBottom
          TabOrder = 2
          object ehDetail72: TDBGridEh
            Left = 1
            Top = 1
            Width = 848
            Height = 269
            Align = alClient
            DataSource = dsDetail72
            DynProps = <>
            TabOrder = 1
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'GUI_GE'
                Footers = <>
                Title.Caption = #26448#26009#35268#26684
                Width = 156
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DESCRIPTION'
                Footers = <>
                Title.Caption = #26448#26009#21517#31216
                Width = 151
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DEL_DATE'
                Footers = <>
                Title.Caption = #21040#36135#26085#26399
                Width = 76
              end
              item
                DisplayFormat = '#0.000'
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUAN_ORD'
                Footers = <>
                Title.Caption = #25968#37327
                Width = 64
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'unit_name'
                Footers = <>
                Title.Caption = #21333#20301
                Width = 65
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'tax_price'
                Footers = <>
                Title.Caption = #21547#31246#20215
                Width = 73
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'STATE_TAX'
                Footers = <>
                Title.Caption = #31246#29575
                Width = 68
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'so_total'
                Footers = <>
                Title.Caption = #24635#37329#39069#65288#21547#31246#65289
                Width = 90
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'rohs'
                Footers = <>
                Width = 52
              end
              item
                Checkboxes = True
                DynProps = <>
                EditButtons = <>
                FieldName = 'IF_urgency'
                Footers = <>
                Title.Caption = #32039#24613#29289#26009
                Width = 71
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DEPT_NAME'
                Footers = <>
                Title.Caption = #35831#36141#37096#38376
                Width = 67
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'EMPLOYEE_NAME'
                Footers = <>
                Title.Caption = #35831#36141#20154#21592
                Width = 66
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'reason'
                Footers = <>
                Title.Caption = #35831#36141#21407#22240
                Width = 191
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
          object ehDetail71: TDBGridEh
            Left = 1
            Top = 1
            Width = 848
            Height = 269
            Align = alClient
            DataSource = dsDetail71
            DynProps = <>
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
            PopupMenu = pmDetail71
            TabOrder = 0
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'partnumber'
                Footers = <>
                Title.Caption = #26448#26009#32534#30721
                Width = 106
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'inv_part_number'
                Footers = <>
                Title.Caption = #26448#26009#21517#31216
                Width = 120
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'inv_part_description'
                Footers = <>
                Title.Caption = #26448#26009#35268#26684
                Width = 125
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'REQ_DATE'
                Footers = <>
                Title.Caption = #21040#36135#26085#26399
                Width = 75
              end
              item
                DisplayFormat = '#0.000'
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUAN_ORD'
                Footers = <>
                Title.Caption = #25968#37327
                Width = 59
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'unit_name'
                Footers = <>
                Title.Caption = #21333#20301
                Width = 72
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'quantity_stock'
                Footers = <>
                Title.Caption = #24211#23384#25968#37327
                Width = 61
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'quantity_zaitu'
                Footers = <>
                Title.Caption = #22312#36884#25968#37327
                Width = 61
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'tax_price'
                Footers = <>
                Title.Caption = #21547#31246#21333#20215
                Width = 59
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'so_total'
                Footers = <>
                Title.Caption = #24635#37329#39069#65288#21547#31246#65289
                Width = 83
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'reason'
                Footers = <>
                Title.Caption = #35831#36141#21407#22240
                Width = 149
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'rohs'
                Footers = <>
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'IF_urgency'
                Footers = <>
                Title.Caption = #32039#24613#29289#26009
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'IF_CAF'
                Footers = <>
                Width = 57
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'extra_req'
                Footers = <>
                Title.Caption = #29305#27530#35201#27714
                Width = 88
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DEPT_NAME'
                Footers = <>
                Title.Caption = #35831#36141#37096#38376
                Width = 68
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'EMPLOYEE_NAME'
                Footers = <>
                Title.Caption = #35831#36141#20154#21592
                Width = 63
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'SELECT     dbo.Data0023.ABBR_NAME,data0023.code, dbo.Data0024.FA' +
      'CTORY_LOCATION'#13#10#9#9#9', dbo.data0078.auth_flag, dbo.Data0015.WAREHO' +
      'USE_CODE'#13#10#9#9#9', dbo.Data0015.WAREHOUSE_NAME,dbo.Data0015.ABBR_NAM' +
      'E AS Name15'#13#10#9#9#9', dbo.Data0001.CURR_CODE, dbo.Data0001.CURR_NAME' +
      #13#10#9#9#9', dbo.Data0005.EMPL_CODE, dbo.Data0005.EMPLOYEE_NAME '#13#10#9#9#9',' +
      'dbo.data0078.auth_date, dbo.data0078.ranking'#13#10#9#9#9', dbo.data0078.' +
      'user_ptr, dbo.Data0070.*'#13#10#9#9#9',CASE WHEN dbo.data0070.PO_TYPE = '#39 +
      'S'#39' then '#39#26631#20934#29289#26009#39' else '#39#26434#39033#29289#26009#39' end as str_type'#13#10'FROM         dbo.Dat' +
      'a0070 INNER JOIN'#13#10'                      dbo.Data0023 ON dbo.Data' +
      '0070.SUPPLIER_POINTER = dbo.Data0023.RKEY INNER JOIN'#13#10'          ' +
      '            dbo.Data0024 ON dbo.Data0070.SUPP_FAC_ADD_PTR = dbo.' +
      'Data0024.RKEY INNER JOIN'#13#10'                      dbo.Data0015 ON ' +
      'dbo.Data0070.WAREHOUSE_POINTER = dbo.Data0015.RKEY INNER JOIN'#13#10' ' +
      '                     dbo.Data0005 ON dbo.Data0070.EMPLOYEE_POINT' +
      'ER = dbo.Data0005.RKEY INNER JOIN'#13#10'                      dbo.Dat' +
      'a0001 ON dbo.Data0070.CURRENCY_PTR = dbo.Data0001.RKEY INNER JOI' +
      'N'#13#10'                      dbo.data0078 ON dbo.Data0070.RKEY = dbo' +
      '.data0078.po_ptr'#13#10'WHERE     (dbo.Data0070.STATUS = 1) '#13#10'AND (dbo' +
      '.data0078.auth_date IS NULL) '#13#10
    AfterScroll = cdsMainAfterScroll
    OnCalcFields = cdsMainCalcFields
  end
  inherited pmMain: TPopupMenu
    OnPopup = pmMainPopup
    Left = 144
    Top = 176
    object mniAuth: TMenuItem
      Caption = #23457#26680
      OnClick = mniAuthClick
    end
    object mniUnAuth: TMenuItem
      Caption = #21462#28040#23457#26680
      OnClick = mniUnAuthClick
    end
    object mniBack: TMenuItem
      Caption = #36864#22238#37319#36141#37096
      OnClick = mniBackClick
    end
    object mniRemark: TMenuItem
      Caption = #22791#27880#20449#24687
      OnClick = mniRemarkClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mniCheck: TMenuItem
      Caption = #26597#30475#32454#33410
      OnClick = mniCheckClick
    end
    object mniAuthMsg: TMenuItem
      Caption = #23457#25209#20449#24687
      OnClick = mniAuthMsgClick
    end
  end
  object cds1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 50
    Top = 385
  end
  object cds2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 114
    Top = 385
  end
  object cdsDetail72: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT     dbo.Data0072.RKEY, dbo.Data0072.POPTR'#13#10#9#9#9', dbo.Data0' +
      '072.DESCRIPTION, dbo.Data0072.GUI_GE'#13#10#9#9#9', dbo.Data0072.QUAN_ORD' +
      ', dbo.Data0072.QUAN_INVD '#13#10#9#9#9', dbo.Data0072.UNIT_PRICE, dbo.Dat' +
      'a0072.STATE_TAX'#13#10#9#9#9', dbo.Data0072.GL_PTR, dbo.Data0072.QUANTITY' +
      '_RECEIVED'#13#10#9#9#9', dbo.Data0072.DESCRIPTION2,dbo.Data0072.DEL_DATE'#13 +
      #10#9#9#9', dbo.Data0072.UNIT_PTR, dbo.Data0072.PRINTED_DATE'#13#10#9#9#9', dbo' +
      '.Data0072.reason, dbo.Data0072.tax_price'#13#10#9#9#9', dbo.Data0072.rohs' +
      ',dbo.Data0072.IF_urgency'#13#10#9#9#9', dbo.Data0002.UNIT_CODE, dbo.Data0' +
      '002.UNIT_NAME'#13#10#9#9#9', dbo.Data0068.PO_REQ_NUMBER, dbo.Data0005.EMP' +
      'LOYEE_NAME '#13#10#9#9#9', dbo.Data0034.DEPT_NAME, ROUND(data0072.QUAN_OR' +
      'D * data0072.tax_price, 4) AS so_total'#13#10'FROM         dbo.Data006' +
      '8 LEFT OUTER JOIN'#13#10'                      dbo.Data0034 ON dbo.Dat' +
      'a0068.DEPARTMENT_NAME = dbo.Data0034.DEPT_CODE LEFT OUTER JOIN'#13#10 +
      '                      dbo.Data0005 ON dbo.Data0068.REQ_BY = dbo.' +
      'Data0005.RKEY RIGHT OUTER JOIN'#13#10'                      dbo.Data02' +
      '04 ON dbo.Data0068.RKEY = dbo.Data0204.PURCHASE_REQ_PTR RIGHT OU' +
      'TER JOIN'#13#10'                      dbo.Data0072 INNER JOIN'#13#10'       ' +
      '               dbo.Data0002 ON dbo.Data0072.UNIT_PTR = dbo.Data0' +
      '002.RKEY ON dbo.Data0204.RKEY = dbo.Data0072.rkey204'#13#10
    Params = <>
    ReadOnly = True
    Left = 162
    Top = 497
  end
  object dsDetail72: TDataSource
    DataSet = cdsDetail72
    Left = 218
    Top = 497
  end
  object pmDetail71: TPopupMenu
    OnPopup = pmDetail71Popup
    Left = 362
    Top = 409
    object mniSupplier: TMenuItem
      Caption = #29289#26009#29616#26377#20379#24212#21830
      OnClick = mniSupplierClick
    end
    object mniStore: TMenuItem
      Caption = #26597#30475#24211#23384#26126#32454
      OnClick = mniStoreClick
    end
    object mniOldPrice: TMenuItem
      Caption = #21382#21490#20215#26684
      OnClick = mniOldPriceClick
    end
  end
  object cdsDetail71: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT     dbo.Data0071.RKEY, dbo.Data0071.PO_PTR'#13#10#9#9#9', dbo.Data' +
      '0071.INVT_PTR, dbo.Data0071.QUAN_ORD'#13#10#9#9#9', dbo.Data0071.QUAN_REC' +
      'D, dbo.Data0071.QUAN_IN_INSP '#13#10#9#9#9', dbo.Data0071.QUAN_RETN, dbo.' +
      'Data0071.QUAN_INVD'#13#10#9#9#9', dbo.Data0071.PRICE, dbo.Data0071.TAX_2'#13 +
      #10#9#9#9', dbo.Data0071.DISCOUNT,dbo.Data0071.REQ_DATE'#13#10#9#9#9', dbo.Data' +
      '0071.QUAN_REJD, dbo.Data0071.WO_PTR'#13#10#9#9#9', dbo.Data0071.PURCHASE_' +
      'UNIT_PTR, dbo.Data0071.CONVERSION_FACTOR '#13#10#9#9#9', dbo.Data0071.PRI' +
      'NTED_DATE, dbo.Data0071.reason'#13#10#9#9#9', dbo.Data0071.extra_req, dbo' +
      '.Data0071.avl_flag'#13#10#9#9#9', dbo.Data0071.tax_price, dbo.Data0071.ro' +
      'hs'#13#10#9#9#9', dbo.Data0071.IF_CAF,dbo.Data0071.IF_urgency'#13#10#9#9#9', dbo.D' +
      'ata0017.INV_PART_NUMBER AS partnumber'#13#10#9#9#9', ROUND(data0071.QUAN_' +
      'ORD * data0071.tax_price, 4) AS so_total'#13#10#9#9#9', dbo.Data0017.INV_' +
      'NAME AS inv_part_number, dbo.Data0017.INV_DESCRIPTION AS inv_par' +
      't_description'#13#10#9#9#9', dbo.Data0002.UNIT_CODE, dbo.Data0002.UNIT_NA' +
      'ME '#13#10#9#9#9', dbo.Data0017.QUAN_ON_HAND AS quantity_stock'#13#10#9#9#9', CASE' +
      ' data0017.CRITICAL_MATL_FLAG WHEN 0 THEN '#39#21542#39' WHEN 1 THEN '#39#26159#39' END' +
      ' AS CRITICAL_MATL '#13#10#9#9#9', dbo.Data0068.PO_REQ_NUMBER, dbo.Data003' +
      '4.DEPT_NAME'#13#10#9#9#9', dbo.Data0005.EMPLOYEE_NAME'#13#10'FROM         dbo.D' +
      'ata0068 LEFT OUTER JOIN'#13#10'                      dbo.Data0005 ON d' +
      'bo.Data0068.REQ_BY = dbo.Data0005.RKEY LEFT OUTER JOIN'#13#10'        ' +
      '              dbo.Data0034 ON dbo.Data0068.DEPARTMENT_NAME = dbo' +
      '.Data0034.DEPT_CODE RIGHT OUTER JOIN'#13#10'                      dbo.' +
      'Data0069 ON dbo.Data0068.RKEY = dbo.Data0069.PURCH_REQ_PTR RIGHT' +
      ' OUTER JOIN'#13#10'                      dbo.Data0071 INNER JOIN'#13#10'    ' +
      '                  dbo.Data0017 ON dbo.Data0071.INVT_PTR = dbo.Da' +
      'ta0017.RKEY INNER JOIN'#13#10'                      dbo.Data0002 ON db' +
      'o.Data0071.PURCHASE_UNIT_PTR = dbo.Data0002.RKEY ON dbo.Data0069' +
      '.RKEY = dbo.Data0071.rkey69'#13#10
    Params = <>
    ReadOnly = True
    Left = 514
    Top = 505
  end
  object dsDetail71: TDataSource
    DataSet = cdsDetail71
    Left = 570
    Top = 505
  end
end
