inherited frmMain_Mod623: TfrmMain_Mod623
  Caption = #35746#21333#39044#22788#29702
  ClientHeight = 410
  ClientWidth = 864
  ExplicitWidth = 880
  ExplicitHeight = 448
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 864
    Height = 410
    ExplicitWidth = 864
    ExplicitHeight = 410
    inherited pnlDisplayMain: TPanel
      Width = 864
      Height = 410
      ExplicitWidth = 864
      ExplicitHeight = 410
      inherited pnlChildMain: TPanel
        Width = 862
        Height = 408
        ExplicitWidth = 862
        ExplicitHeight = 408
        inherited pnlEhMainDisplay: TPanel
          Width = 860
          Height = 377
          ExplicitWidth = 860
          ExplicitHeight = 377
          inherited ehMain: TDBGridEh
            Width = 858
            Height = 334
            OnDrawColumnCell = ehMainDrawColumnCell
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'XUHAO'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #24207#21495
                Width = 40
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'MANU_PART_NUMBER'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26412#21378#32534#21495
                Width = 108
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PO_NUMBER'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #21512#21516#32534#21495
                Width = 89
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ANALYSIS_CODE_2'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #23458#25143#29289#26009#21495
                Width = 114
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'MANU_PART_DESC'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #23458#25143#22411#21495
                Width = 102
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'cust_code'
                Footers = <>
                Title.Caption = #23458#25143#20195#30721
                Width = 61
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ORIG_SCHED_SHIP_DATE'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20986#21378#26085#26399
                Width = 78
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ORIG_REQUEST_DATE'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20132#36135#26085#26399
                Width = 81
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PRODUCT_NAME'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20135#21697#31867#22411
                Width = 100
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PARTS_ORDERED'
                Footer.FieldName = 'PARTS_ORDERED'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #35746#21333#25968#37327
                Width = 70
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'UsedQuantity'
                Footer.FieldName = 'UsedQuantity'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #24050#19979#21333#25968#37327
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'SL'
                Footer.FieldName = 'SL'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26410#19979#21333#25968#37327
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PART_PRICE'
                Footers = <>
                Title.Caption = #20215#26684
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CURR_CODE'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #36135#24065
                Width = 53
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'EDI_FLAG'
                Footers = <>
                Title.Caption = #26159#21542#21547#31246
                Width = 65
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PRICE_Mi'
                Footers = <>
                Title.Caption = #24179#31859#25253#20215
                Width = 70
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PO_DATE'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #21512#21516#21457#36865#26085#26399
                Width = 91
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'stroperateType'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #31614#36820#26631#35782
                Width = 55
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'REFERENCE_NUMBER'
                Footers = <>
                Title.Caption = #21442#32771#38468#27880
                Width = 100
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'abbr_name'
                Footers = <>
                Title.Caption = #24037#21378#31616#31216
                Width = 85
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CUST_CODE2'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20851#32852#23458#25143#20195#30721
                Width = 80
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'name10'
                Footers = <>
                Title.Caption = #23458#25143#31616#31216
                Width = 75
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'orig_customer'
                Footers = <>
                Title.Caption = #20851#32852#21407#23458#25143
                Width = 78
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'total_case'
                Footer.FieldName = 'total_case'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #35746#21333#37329#39069
                Width = 67
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'parts_area'
                Footer.FieldName = 'parts_area'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #35746#21333#38754#31215
                Width = 75
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'sstatus'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #29366#24577
                Width = 47
              end
              item
                DisplayFormat = 'yyyy-MM-dd'
                DynProps = <>
                EditButtons = <>
                FieldName = 'submit_date'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #36755#20837#26085#26399
                Width = 83
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'employee_name'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #36755#20837#20154#21592
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'audit_name'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #23457#26680#20154#21592
                Width = 70
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'audit_date'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #23457#26680#26085#26399
                Width = 74
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'WAREHOUSE_CODE'
                Footers = <>
                Title.Caption = #24037#21378#20195#30721
                Width = 65
              end>
          end
          object pnl1: TPanel
            Left = 1
            Top = 335
            Width = 858
            Height = 41
            Align = alBottom
            TabOrder = 2
            object grpStatus: TGroupBox
              Left = 7
              Top = 1
              Width = 382
              Height = 35
              Caption = #29366#24577
              TabOrder = 0
              object chk1: TCheckBox
                Left = 33
                Top = 12
                Width = 64
                Height = 17
                Caption = #26410#25552#20132
                Checked = True
                State = cbChecked
                TabOrder = 0
                OnClick = chk1Click
              end
              object chk2: TCheckBox
                Left = 122
                Top = 12
                Width = 65
                Height = 17
                Caption = #24050#25552#20132
                TabOrder = 1
                OnClick = chk1Click
              end
              object chk3: TCheckBox
                Left = 211
                Top = 12
                Width = 62
                Height = 17
                Caption = #24050#23457#26680
                TabOrder = 2
                OnClick = chk1Click
              end
              object chk4: TCheckBox
                Left = 300
                Top = 12
                Width = 61
                Height = 17
                Caption = #24050#19979#21333
                TabOrder = 3
                OnClick = chk1Click
              end
            end
          end
          object sg213: TStringGrid
            Left = 195
            Top = 232
            Width = 504
            Height = 73
            ColCount = 1
            FixedCols = 0
            FixedRows = 0
            TabOrder = 1
            Visible = False
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 860
          ExplicitWidth = 860
          inherited btnDY: TBitBtn
            Visible = True
            OnClick = btnDYClick
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'SELECT  ROW_NUMBER() OVER (ORDER BY data0213.RKEY ASC) AS XUHAO,' +
      'data0213.RKEY'#13#10#9#9',data0213.MANU_PART_NUMBER,data0213. PO_NUMBER,' +
      'data0213. ANALYSIS_CODE_2'#13#10#9#9',data0213.MANU_PART_DESC,data0213.c' +
      'ust_code, data0213.ORIG_SCHED_SHIP_DATE'#13#10#9#9',data0213. ORIG_REQUE' +
      'ST_DATE,data0008.PRODUCT_NAME'#13#10#9#9',data0213.PARTS_ORDERED,data021' +
      '3.UsedQuantity'#13#10#9#9',data0213.PARTS_ORDERED - Isnull(data0213.Used' +
      'Quantity,0) as SL'#13#10#9#9',data0213.PART_PRICE,data0213. CURR_CODE'#13#10#9 +
      #9',case data0213.EDI_FLAG_FOR_INVOICE when 0 then '#39#21547#31246#39' when 1 the' +
      'n '#39#19981#21547#31246#39' end as EDI_FLAG'#13#10#9#9',CASE WHEN Data0025.unit_sq <> 0 then' +
      ' round(data0213.part_price / Data0025.unit_sq,2) end as PRICE_Mi' +
      #13#10#9#9',case data0213.operateType when 0 then '#39#26410#31614#36820#39' when 1 then '#39#24050#31614 +
      #36820#39' end as stroperateType'#13#10#9#9',data0213.PO_DATE,data0213.REFERENCE' +
      '_NUMBER'#13#10#9#9',data0015.abbr_name,D10.CUST_CODE as CUST_CODE2'#13#10#9#9',D' +
      'ata0010.abbr_name as name10,data0213.orig_customer'#13#10#9#9',data0213.' +
      'Parts_ordered * data0213.part_price as total_case'#13#10#9#9',data0213.P' +
      'arts_ordered*data0025.unit_sq as parts_area'#13#10#9#9',case data0213.st' +
      'atus when 0 then '#39#26410#25552#20132#39' when 1 then '#39#24050#25552#20132#39' when 2 then '#39#24050#19979#21333' '#39' when' +
      ' 3 then '#39#24050#23457#26680#39'  end as sstatus'#13#10#9#9',data0213.submit_date,D5_1.empl' +
      'oyee_name,D5_2.employee_name as audit_name'#13#10#9#9',data0213.audit_da' +
      'te,data0213.WAREHOUSE_CODE'#13#10'                                ,dat' +
      'a0213.status,Data0213.user_ptr,Data0010.rkey as rkey10'#13#10'FROM    ' +
      '  DATA0213 '#13#10'            inner join data0025 on data0213.manu_pa' +
      'rt_number = data0025.manu_part_number'#13#10'            inner join da' +
      'ta0010 on data0213.cust_code = data0010.cust_code'#13#10'            i' +
      'nner join data0015 on data0025.PROD_ROUTE_PTR = data0015.rkey'#13#10' ' +
      '           inner join data0008 on data0025.PROD_CODE_PTR = data0' +
      '008.rkey'#13#10'            left outer join data0005 D5_1 on data0213.' +
      'user_ptr = D5_1.rkey'#13#10'            left outer join data0005 D5_2 ' +
      'on data0213.audit_ptr = D5_2.rkey'#13#10'            left outer join D' +
      'ata0010 D10 on DATA0213.orig_customer = D10.ABBR_NAME'#13#10'WHERE 1=1' +
      ' '
  end
  inherited pmMain: TPopupMenu
    OnPopup = pmMainPopup
    Left = 304
    Top = 200
    object NAdd: TMenuItem
      Caption = #26032#22686
      OnClick = NAddClick
    end
    object NCopy: TMenuItem
      Caption = #22797#21046
      OnClick = NCopyClick
    end
    object NEdit: TMenuItem
      Caption = #32534#36753
      OnClick = NEditClick
    end
    object NDel: TMenuItem
      Caption = #21024#38500
      OnClick = NDelClick
    end
    object NCheck: TMenuItem
      Caption = #26816#26597
      OnClick = NCheckClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object NDo: TMenuItem
      Caption = #25552#20132
      OnClick = NDoClick
    end
    object NUnDo: TMenuItem
      Caption = #21462#28040#25552#20132
      OnClick = NUnDoClick
    end
    object NAuth: TMenuItem
      Caption = #23457#26680
      OnClick = NAuthClick
    end
    object NBack: TMenuItem
      Caption = #36864#22238
      OnClick = NBackClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object NPrint: TMenuItem
      Caption = #36830#32493#32534#21495#25171#21360
      OnClick = NPrintClick
    end
    object NClose: TMenuItem
      Caption = #20851#38381#39044#22788#29702
      OnClick = NCloseClick
    end
    object NDocument: TMenuItem
      Caption = #23458#25143#35746#21333#20851#32852#25991#26723
      OnClick = NDocumentClick
    end
    object mniN3: TMenuItem
      Caption = '-'
    end
    object NRepeat: TMenuItem
      Caption = #31614#36820'('#21326#20026')'
    end
    object NDate: TMenuItem
      Caption = #20462#25913#20132#26399'('#21326#20026')'
    end
    object NGetResult: TMenuItem
      Caption = #33719#21462#20132#26399#20462#25913#32467#26524'('#21326#20026')'
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object NDoAll: TMenuItem
      Caption = #25209#37327#25552#20132
      OnClick = NDoAllClick
    end
    object NAuthAll: TMenuItem
      Caption = #25209#37327#23457#26680
      OnClick = NAuthAllClick
    end
    object NDelAll: TMenuItem
      Caption = #25209#37327#21024#38500
      OnClick = NDelAllClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object NExport: TMenuItem
      Caption = #23548#20986#27169#26495
      OnClick = NExportClick
    end
    object NImport: TMenuItem
      Caption = #23548#20837
      OnClick = NImportClick
    end
  end
end
