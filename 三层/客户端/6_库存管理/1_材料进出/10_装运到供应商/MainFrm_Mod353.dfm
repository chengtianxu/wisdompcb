inherited FrmMain_Mod353: TFrmMain_Mod353
  Caption = 'FrmMain_Mod353'
  ClientHeight = 350
  ClientWidth = 755
  Font.Height = -13
  Font.Name = #23435#20307
  ExplicitWidth = 763
  ExplicitHeight = 384
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 755
    Height = 350
    ExplicitWidth = 755
    ExplicitHeight = 350
    inherited pnlDisplayMain: TPanel
      Width = 755
      Height = 350
      ExplicitWidth = 755
      ExplicitHeight = 350
      inherited pnlChildMain: TPanel
        Width = 753
        Height = 348
        ExplicitWidth = 753
        ExplicitHeight = 348
        inherited pnlEhMainDisplay: TPanel
          Width = 751
          Height = 273
          ExplicitWidth = 751
          ExplicitHeight = 273
          inherited ehMain: TDBGridEh
            Width = 749
            Height = 271
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'goods_name'
                Footers = <>
                Width = 165
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'goods_guige'
                Footers = <>
                Width = 225
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'goods_type'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'v_state'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'quan_to_ship'
                Footers = <>
                Title.Caption = #26412#29289#21697#36864#36135#24453#35013#36816#24635#25968#37327
                Width = 128
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUANTITY'
                Footers = <>
                Title.Caption = #26412#27425#36864#36135#24453#35013#36816#25968#37327
                Width = 91
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'UNIT_NAME'
                Footers = <>
                Width = 50
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'unit_price'
                Footers = <>
                Width = 89
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'sum_price'
                Footers = <>
                Width = 59
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CURR_NAME'
                Footers = <>
                Width = 59
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'state_tax'
                Footers = <>
                Width = 56
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'exch_rate'
                Footers = <>
                Width = 80
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PO_NUMBER'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'TDATE'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'vEMPLOYEE_NAME'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'shipping_method'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'tran_date'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'EMPLOYEE_NAME'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CODE'
                Footers = <>
                Width = 57
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'REJECT_DESCRIPTION'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ABBR_NAME_1'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'LOCATION'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'remark'
                Footers = <>
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 751
          ExplicitWidth = 751
          inherited lblFilter: TLabel
            Left = 463
            Width = 52
            ExplicitLeft = 463
            ExplicitWidth = 52
          end
          inherited btnDY: TBitBtn
            OnClick = btnDYClick
          end
        end
        object Panel1: TPanel
          Left = 1
          Top = 303
          Width = 751
          Height = 44
          Align = alBottom
          TabOrder = 2
          object GroupBox1: TGroupBox
            Left = 1
            Top = 1
            Width = 208
            Height = 42
            Align = alLeft
            Caption = #29366#24577
            TabOrder = 0
            object cbx1: TCheckBox
              Left = 17
              Top = 16
              Width = 64
              Height = 17
              Caption = #26410#35013#36816
              Checked = True
              State = cbChecked
              TabOrder = 0
              OnClick = cbx1Click
            end
            object cbx2: TCheckBox
              Left = 120
              Top = 16
              Width = 97
              Height = 17
              Caption = #24050#35013#36816
              TabOrder = 1
              OnClick = cbx1Click
            end
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'SELECT     dbo.Data0235.goods_name, dbo.Data0235.goods_guige, db' +
      'o.Data0235.goods_type, dbo.Data0023.ABBR_NAME,  dbo.Data0023.Rke' +
      'y as Rkey23,'#13#10'           dbo.Data0235.quan_to_ship, dbo.Data0209' +
      '.QUANTITY, dbo.Data0002.UNIT_NAME, dbo.Data0209.TDATE, Data0209.' +
      'SRCE_PTR,'#13#10'           dbo.Data0005.EMPLOYEE_NAME AS vEMPLOYEE_NA' +
      'ME, dbo.Data0209.remark, dbo.Data0209.shipping_method,dbo.Data02' +
      '09.tran_date, '#13#10'           case dbo.Data0209.status when '#39'1'#39' the' +
      'n '#39#24050#35013#36816#39' when '#39'0'#39' then '#39#26410#35013#36816#39' end  as '#39'v_state'#39','#13#10'           dbo.D' +
      'ata0015.ABBR_NAME,dbo.Data0016.LOCATION, tran_by.EMPLOYEE_NAME, ' +
      'dbo.Data0076.CODE,'#13#10'           dbo.Data0076.REJECT_DESCRIPTION,d' +
      'ata0209.Rkey,Data0235.quan_returned,Data0235.QUAN_RECD,'#13#10'       ' +
      '    Data0072.QUAN_RETN,Data0235.D0072_PTR,Data0235.RKEY as Rkey2' +
      '35, Data0235.unit_price,Data0456.exch_rate,'#13#10'           Data0235' +
      '.state_tax,Data0209.QUANTITY*Data0235.unit_price as sum_price ,D' +
      'ata0001.CURR_NAME,data0070.PO_NUMBER'#13#10'FROM         dbo.Data0209 ' +
      'INNER JOIN'#13#10'             dbo.Data0235 ON dbo.Data0209.SRCE_PTR =' +
      ' dbo.Data0235.RKEY INNER JOIN'#13#10'             dbo.Data0005 ON dbo.' +
      'Data0209.EMPL_PTR = dbo.Data0005.RKEY left JOIN'#13#10'             db' +
      'o.Data0005 AS tran_by ON dbo.Data0209.tran_by_userptr = tran_by.' +
      'RKEY INNER JOIN'#13#10'             dbo.Data0076 ON dbo.Data0209.GL_HD' +
      'R_PTR = dbo.Data0076.RKEY INNER JOIN'#13#10'             dbo.Data0002 ' +
      'ON dbo.Data0235.unit_ptr = dbo.Data0002.RKEY INNER JOIN'#13#10'       ' +
      '      dbo.Data0456 ON dbo.Data0235.GRN_PTR = dbo.Data0456.RKEY I' +
      'NNER JOIN'#13#10'             dbo.Data0016 ON dbo.Data0235.location_pt' +
      'r = dbo.Data0016.RKEY INNER JOIN'#13#10'             dbo.Data0015 ON d' +
      'bo.Data0456.warehouse_ptr = dbo.Data0015.RKEY INNER JOIN'#13#10'      ' +
      '       dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY' +
      '  INNER JOIN'#13#10'             Data0072  ON     Data0072.RKEY = Data' +
      '0235.D0072_PTR inner join'#13#10'             data0001  ON Data0001.RK' +
      'EY = Data0456.currency_ptr left join'#13#10'             data0070  on ' +
      'data0070.rkey=data0456.PO_PTR'#13#10'where    1=1'#13#10
    ProviderName = 'DataSetProvider1'
    object cdsMaingoods_name: TStringField
      DisplayLabel = #29289#21697#21517#31216
      FieldName = 'goods_name'
      Size = 60
    end
    object cdsMaingoods_guige: TStringField
      DisplayLabel = #29289#21697#35268#26684
      FieldName = 'goods_guige'
      Size = 200
    end
    object cdsMaingoods_type: TStringField
      DisplayLabel = #29289#21697#31867#21035
      FieldName = 'goods_type'
    end
    object cdsMainABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object cdsMainv_state: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'v_state'
      ReadOnly = True
      Size = 6
    end
    object cdsMainquan_to_ship: TFloatField
      DisplayLabel = #24453#35013#36816#25968#37327
      FieldName = 'quan_to_ship'
    end
    object cdsMainQUANTITY: TFloatField
      DisplayLabel = #26412#27425#36864#36135#25968#37327
      FieldName = 'QUANTITY'
    end
    object cdsMainquan_returned: TFloatField
      DisplayLabel = #24050#35013#36816#36864#36135#25968#37327
      FieldName = 'quan_returned'
    end
    object cdsMainUNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object cdsMainunit_price: TBCDField
      DisplayLabel = #25509#25910#21333#20215'('#21547#31246')'
      FieldName = 'unit_price'
      Precision = 10
      Size = 3
    end
    object cdsMainCURR_NAME: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
    end
    object cdsMainstate_tax: TBCDField
      DisplayLabel = #31246#29575#65288'%'#65289
      FieldName = 'state_tax'
      Precision = 4
      Size = 2
    end
    object cdsMainsum_price: TFloatField
      DisplayLabel = #24635#37329#39069
      FieldName = 'sum_price'
      ReadOnly = True
    end
    object cdsMainexch_rate: TFMTBCDField
      DisplayLabel = #27719#29575
      FieldName = 'exch_rate'
      Precision = 12
    end
    object cdsMainPO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object cdsMainTDATE: TDateTimeField
      DisplayLabel = #36864#36135#26085#26399
      FieldName = 'TDATE'
    end
    object cdsMainvEMPLOYEE_NAME: TStringField
      DisplayLabel = #36864#36135#20154#21592
      FieldName = 'vEMPLOYEE_NAME'
      Size = 16
    end
    object cdsMainshipping_method: TWideStringField
      DisplayLabel = #35013#36816#26041#24335
      FieldName = 'shipping_method'
    end
    object cdsMaintran_date: TDateTimeField
      DisplayLabel = #35013#36816#26102#38388
      FieldName = 'tran_date'
    end
    object cdsMainEMPLOYEE_NAME: TStringField
      DisplayLabel = #35013#36816#20154
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object cdsMainCODE: TStringField
      DisplayLabel = #25298#25910#20195#30721
      FieldName = 'CODE'
      Size = 5
    end
    object cdsMainREJECT_DESCRIPTION: TStringField
      DisplayLabel = #25298#25910#21407#22240
      FieldName = 'REJECT_DESCRIPTION'
      Size = 30
    end
    object cdsMainABBR_NAME_1: TStringField
      DisplayLabel = #24037#21378#21517#31216
      FieldName = 'ABBR_NAME_1'
      Size = 10
    end
    object cdsMainLOCATION: TStringField
      DisplayLabel = #20179#24211#20301#32622
      FieldName = 'LOCATION'
    end
    object cdsMainremark: TWideStringField
      DisplayLabel = #36864#36135#22791#27880
      FieldName = 'remark'
      Size = 50
    end
    object cdsMainRkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object cdsMainQUAN_RECD: TBCDField
      FieldName = 'QUAN_RECD'
      Precision = 10
      Size = 3
    end
    object cdsMainQUAN_RETN: TFloatField
      FieldName = 'QUAN_RETN'
    end
    object cdsMainD0072_PTR: TIntegerField
      FieldName = 'D0072_PTR'
    end
    object cdsMainRkey235: TAutoIncField
      FieldName = 'Rkey235'
      ReadOnly = True
    end
    object cdsMainRkey23: TAutoIncField
      FieldName = 'Rkey23'
      ReadOnly = True
    end
    object cdsMainSRCE_PTR: TIntegerField
      FieldName = 'SRCE_PTR'
    end
  end
  inherited pmMain: TPopupMenu
    OnPopup = pmMainPopup
    Top = 232
    object N1: TMenuItem
      Caption = #35013#36816
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21462#28040#35013#36816
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #25171#21360
      OnClick = N3Click
    end
  end
end
