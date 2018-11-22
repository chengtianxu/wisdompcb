inherited frmVMIchuku_Mod564: TfrmVMIchuku_Mod564
  Caption = #20379#24212#21830#36864#36135#20986#20179
  ClientHeight = 470
  ClientWidth = 1018
  ExplicitWidth = 1026
  ExplicitHeight = 497
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 1018
    Height = 470
    ExplicitWidth = 1018
    ExplicitHeight = 470
    inherited pnlDisplayMain: TPanel
      Width = 1018
      Height = 470
      ExplicitWidth = 1018
      ExplicitHeight = 470
      inherited pnlChildMain: TPanel
        Width = 1016
        Height = 468
        ExplicitWidth = 1016
        ExplicitHeight = 468
        inherited pnlEhMainDisplay: TPanel
          Width = 1014
          Height = 437
          ExplicitWidth = 1014
          ExplicitHeight = 437
          inherited ehMain: TDBGridEh
            Width = 1012
            Height = 435
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'GRN_NUMBER'
                Footers = <>
                Title.Caption = #20837#24211#21333#21495
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'stype'
                Footers = <>
                Title.Caption = #31867#22411
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CREATE_DATE'
                Footers = <>
                Title.Caption = #21019#24314#26085#26399
                Width = 57
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUANTITY'
                Footers = <>
                Title.Caption = #24050#25509#25910#25968#37327
                Width = 76
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUAN_ON_HAND'
                Footers = <>
                Title.Caption = #29616#25345#26377#25968#37327
                Width = 67
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUAN_RETURNED'
                Footers = <>
                Title.Caption = #36864#22238#30340#25968#37327
                Width = 70
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_PART_NUMBER'
                Footers = <>
                Title.Caption = #26448#26009#32534#30721
                Width = 61
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_NAME'
                Footers = <>
                Title.Caption = #26448#26009#21517#31216
                Width = 57
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'LOCATION'
                Footers = <>
                Title.Caption = #20179#24211#20301#32622
                Width = 54
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'EMPLOYEE_NAME'
                Footers = <>
                Title.Caption = #21019#24314#20154#21592
                Width = 57
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'UNIT_NAME'
                Footers = <>
                Title.Caption = #21333#20301
                Width = 28
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'WAREHOUSE_NAME'
                Footers = <>
                Title.Caption = #24037#21378
                Width = 35
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'SUPPLIER_NAME'
                Footers = <>
                Title.Caption = #20379#24212#21830
                Width = 45
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CODE'
                Footers = <>
                Title.Caption = #20379#24212#21830#20195#30721
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'tax_price'
                Footers = <>
                Title.Caption = #21547#31246#20215#26684
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PRICE'
                Footers = <>
                Title.Caption = #20215#26684
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'TAX_2'
                Footers = <>
                Title.Caption = #31246#29575
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 1014
          ExplicitWidth = 1014
          inherited lblFilter: TLabel
            Caption = #26448#26009#32534#30721
          end
          object CheckBox1: TCheckBox
            Left = 736
            Top = 8
            Width = 137
            Height = 17
            Caption = #24211#23384#22823#20110#38646#30340#25165#26174#31034
            Checked = True
            State = cbChecked
            TabOrder = 8
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'SELECT         dbo.data0133.*,data0134.*,'#13#10'                     ' +
      '  case data0133.ttype '#13#10'                       when 1 then '#39#25353'PO'#20837 +
      #24211#39#13#10'                       when 3 then '#39#30452#25509#20837#24211#39'  end  as stype,'#13#10' ' +
      '                     dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.' +
      'INV_NAME, dbo.Data0016.LOCATION, '#13#10'                      dbo.Dat' +
      'a0005.EMPLOYEE_NAME, dbo.Data0002.UNIT_NAME, dbo.Data0015.WAREHO' +
      'USE_NAME, dbo.Data0023.SUPPLIER_NAME, '#13#10'                      db' +
      'o.Data0023.CODE'#13#10'FROM         dbo.DATA0133 INNER JOIN'#13#10'         ' +
      '             dbo.DATA0134 ON dbo.DATA0133.RKEY = dbo.DATA0134.GR' +
      'N_PTR INNER JOIN'#13#10'                      dbo.Data0015 ON dbo.DATA' +
      '0133.warehouse_ptr = dbo.Data0015.RKEY INNER JOIN'#13#10'             ' +
      '         dbo.Data0023 ON dbo.DATA0133.SUPP_PTR = dbo.Data0023.RK' +
      'EY INNER JOIN'#13#10'                      dbo.Data0005 ON dbo.DATA013' +
      '3.CREATE_BY = dbo.Data0005.RKEY INNER JOIN'#13#10'                    ' +
      '  dbo.Data0017 ON dbo.DATA0134.INVENTORY_PTR = dbo.Data0017.RKEY' +
      ' INNER JOIN'#13#10'                      dbo.Data0016 ON dbo.DATA0134.' +
      'LOCATION_PTR = dbo.Data0016.RKEY  INNER JOIN'#13#10'                  ' +
      '    dbo.Data0002 ON dbo.DATA0134.UNIT_PTR = dbo.Data0002.RKEY'#13#10'w' +
      'here  1=1'
  end
  inherited pmMain: TPopupMenu
    OnPopup = pmMainPopup
    Left = 216
    Top = 144
    object N1: TMenuItem
      Caption = #36864#36135#22788#29702
      OnClick = N1Click
    end
  end
end
