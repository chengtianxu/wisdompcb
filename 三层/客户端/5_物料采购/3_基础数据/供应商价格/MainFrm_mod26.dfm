inherited FrmMainVendorPrice_Mod26: TFrmMainVendorPrice_Mod26
  Caption = 'FrmMainVendorPrice_Mod26'
  ClientHeight = 554
  ClientWidth = 1121
  Font.Height = -13
  Font.Name = #23435#20307
  ExplicitWidth = 1137
  ExplicitHeight = 593
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 1121
    Height = 554
    ExplicitWidth = 1121
    ExplicitHeight = 554
    inherited pnlDisplayMain: TPanel
      Width = 1121
      Height = 554
      ExplicitWidth = 1121
      ExplicitHeight = 554
      inherited pnlChildMain: TPanel
        Width = 1119
        Height = 552
        ExplicitWidth = 1119
        ExplicitHeight = 552
        inherited pnlEhMainDisplay: TPanel
          Width = 1117
          Height = 521
          ExplicitWidth = 1117
          ExplicitHeight = 521
          object pnl1: TPanel [0]
            Left = 1
            Top = 1
            Width = 1115
            Height = 48
            Align = alTop
            TabOrder = 0
            object lbl_type: TLabel
              Left = 297
              Top = 15
              Width = 86
              Height = 13
              Alignment = taRightJustify
              Caption = '  '#20379#24212#21830#20195#30721':'
            end
            object lbl_Name: TLabel
              Left = 640
              Top = 16
              Width = 14
              Height = 13
              Caption = '..'
            end
            object edt_VOrMtrl: TEdit
              Left = 389
              Top = 11
              Width = 210
              Height = 21
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object btn_Sel: TButton
              Left = 598
              Top = 8
              Width = 37
              Height = 25
              Caption = '...'
              TabOrder = 1
              OnClick = btn_SelClick
            end
            object rg_type: TRadioGroup
              Left = 120
              Top = 5
              Width = 174
              Height = 37
              Columns = 2
              ItemIndex = 0
              Items.Strings = (
                #25353#20379#24212#21830
                #25353#26448#26009)
              TabOrder = 2
              OnClick = rg_typeClick
            end
          end
          object pnl2: TPanel [1]
            Left = 1
            Top = 49
            Width = 194
            Height = 471
            Align = alLeft
            TabOrder = 1
            object lbl1: TLabel
              Left = -5
              Top = 85
              Width = 79
              Height = 13
              Alignment = taRightJustify
              Caption = ' '#20379#24212#21830#21495#30721':'
            end
            object lbl2: TLabel
              Left = -14
              Top = 128
              Width = 96
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = #24314#35758#37325#36141#25968#37327':'
            end
            object lbl3: TLabel
              Left = 7
              Top = 169
              Width = 90
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = #20379#24212#21830#20132#36135#26102#38388':'
            end
            object lbl4: TLabel
              Left = -2
              Top = 214
              Width = 40
              Height = 13
              Alignment = taRightJustify
              Caption = ' '#36135#24065':'
            end
            object lbl5: TLabel
              Left = 0
              Top = 253
              Width = 59
              Height = 13
              Alignment = taRightJustify
              Caption = #29615#20445#26631#35782':'
            end
            object lbl6: TLabel
              Left = 7
              Top = 295
              Width = 47
              Height = 13
              Caption = #32784'CAF'#65306
            end
            object lbl7: TLabel
              Left = 74
              Top = 190
              Width = 47
              Height = 13
              Alignment = taRightJustify
              Caption = '   '#22825#25968
            end
            object lbl8: TLabel
              Left = 88
              Top = 232
              Width = 39
              Height = 13
              Alignment = taRightJustify
              Caption = #22686#20540#31246
            end
            object dbedtsupplier_part_no: TDBEdit
              Left = 7
              Top = 101
              Width = 138
              Height = 21
              Color = cl3DLight
              DataField = 'supplier_part_no'
              DataSource = dsMain
              TabOrder = 0
            end
            object dbedtsugg_reorder_qty: TDBEdit
              Left = 7
              Top = 144
              Width = 75
              Height = 21
              Color = cl3DLight
              DataField = 'sugg_reorder_qty'
              DataSource = dsMain
              TabOrder = 1
            end
            object dbedtlead_time: TDBEdit
              Left = 7
              Top = 188
              Width = 75
              Height = 21
              Color = cl3DLight
              DataField = 'lead_time'
              DataSource = dsMain
              TabOrder = 2
            end
            object dbedtcurr_name: TDBEdit
              Left = 7
              Top = 229
              Width = 75
              Height = 21
              Color = cl3DLight
              DataField = 'curr_name'
              DataSource = dsMain
              TabOrder = 3
            end
            object dbedtrohs: TDBEdit
              Left = 7
              Top = 269
              Width = 75
              Height = 21
              Color = cl3DLight
              DataField = 'rohs'
              DataSource = dsMain
              TabOrder = 4
            end
            object dbedtIF_CAF: TDBEdit
              Left = 7
              Top = 310
              Width = 74
              Height = 21
              Color = cl3DLight
              DataField = 'IF_CAF'
              DataSource = dsMain
              TabOrder = 5
            end
            object btn_updateTax: TButton
              Left = 130
              Top = 227
              Width = 57
              Height = 25
              Hint = #19968#27425#26356#26032#20379#24212#21830#20132#36135#26102#38388
              Caption = #26356#26032
              ParentShowHint = False
              ShowHint = True
              TabOrder = 6
              OnClick = btn_updateTaxClick
            end
            object btn_UpdateDay: TButton
              Left = 130
              Top = 185
              Width = 57
              Height = 25
              Hint = #19968#27425#26356#26032#20379#24212#21830#20132#36135#26102#38388
              Caption = #26356#26032
              ParentShowHint = False
              ShowHint = True
              TabOrder = 7
              OnClick = btn_UpdateDayClick
            end
          end
          inherited ehMain: TDBGridEh
            Left = 195
            Top = 49
            Width = 921
            Height = 471
            TabOrder = 2
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'code'
                Footers = <>
                Title.Caption = #20379#24212#21830#20195#30721
                Width = 66
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'supplier_name'
                Footers = <>
                Title.Caption = #20379#24212#21830#21517#31216
                Width = 128
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'inv_part_number'
                Footers = <>
                Title.Caption = #26448#26009#20195#30721
                Width = 110
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'inv_part_description'
                Footers = <>
                Title.Caption = #26448#26009#25551#36848
                Width = 144
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PRICE_1'
                Footers = <>
                Title.Caption = #21333#20215
                Width = 44
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'TAX_2'
                Footers = <>
                Title.Caption = #22686#20540#31246
                Width = 54
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'unit_code'
                Footers = <>
                Title.Caption = #37319#36141#21333#20301
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'curr_name'
                Footers = <>
                Title.Caption = #24065#21035
                Width = 48
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'qte_price'
                Footers = <>
                Title.Caption = #24066#22330#25253#20215#20215#26684
                Width = 76
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'qte_price2'
                Footers = <>
                Title.Caption = #20445#25345#26399#22825#25968
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'avl_flag'
                Footers = <>
                Title.Caption = #20215#26684#35748#21487
                Width = 62
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'supper_statu'
                Footers = <>
                Title.Caption = #20379#24212#21830#29366#24577
                Width = 68
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = #29615#27979#29289#26009#21517#31216
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'model'
                Footers = <>
                Title.Caption = #29615#27979#22411#21495
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 1117
          ExplicitWidth = 1117
          inherited lblFilter: TLabel
            Left = 518
            Width = 52
            ExplicitLeft = 518
            ExplicitWidth = 52
          end
          inherited btnQry: TBitBtn
            Left = 922
            Align = alRight
            Visible = False
            ExplicitLeft = 922
          end
          inherited btnZD: TBitBtn
            Left = 987
            Align = alRight
            Visible = False
            ExplicitLeft = 987
          end
          inherited edtFliter: TEdit
            Left = 576
            Top = 3
            Width = 121
            ExplicitLeft = 576
            ExplicitTop = 3
            ExplicitWidth = 121
          end
          inherited btnDY: TBitBtn
            Left = 857
            Align = alRight
            ExplicitLeft = 857
          end
          inherited btnAuthDispatch: TBitBtn
            Left = 1052
            Align = alRight
            Visible = False
            ExplicitLeft = 1052
          end
          object btn_QryChangeRec: TBitBtn
            Left = 195
            Top = 0
            Width = 69
            Height = 29
            Align = alLeft
            Caption = #21464#21160#26597#35810
            TabOrder = 8
            OnClick = btn_QryChangeRecClick
          end
          object btn_CopyMtrls: TBitBtn
            Left = 264
            Top = 0
            Width = 89
            Height = 29
            Align = alLeft
            Caption = #22797#21046#26448#26009#26126#32454
            TabOrder = 9
            OnClick = btn_CopyMtrlsClick
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'select inv_part_number,inv_part_description,data0017.stock_unit_' +
      'ptr,isnull(data0017.CATALOG_NUM,'#39#39') as CATALOG_NUM,'#13#10'       data' +
      '0023.code,data0023.supplier_name,data0028.lead_time,data0805.mod' +
      'el,data0805.inv_name as '#29615#27979#29289#26009#21517#31216' ,'#13#10'       data0028.supplier_part_' +
      'no,data0028.sugg_reorder_qty,'#13#10'       data0001.curr_name,data000' +
      '1.curr_code,data0028.rkey,'#13#10'       data0002.unit_code,data0002.u' +
      'nit_name,data0028.PRICE_1,'#13#10'       data0023.abbr_name,data0017.i' +
      'nv_name,data0028.rohs,data0028.TAX_2 as TAX,'#13#10'       cast(data00' +
      '28.TAX_2 as varchar(10))+ '#39'%'#39' as TAX_2,'#13#10'       data0028.qte_pri' +
      'ce,data0028.qte_price2,data0028.avl_flag,data0028.prot_report_pt' +
      'r,data0028.remark,'#13#10'case data0023.status when 0 then '#39#26377#25928#39' when 1' +
      ' then '#39#26080#25928#39' end as supper_statu,data0028.IF_CAF'#13#10'from   data0028 ' +
      'inner join '#13#10'       data0017 on data0028.inventory_ptr=data0017.' +
      'rkey inner join'#13#10'       data0023 on data0028.supplier_ptr=data00' +
      '23.rkey  inner join'#13#10'       data0001 on data0028.currency_ptr=da' +
      'ta0001.rkey inner join'#13#10'       data0002 on data0028.purchase_uni' +
      't_ptr=data0002.rkey left join'#13#10'       data0805 on data0028.prot_' +
      'report_ptr=data0805.rkey  '#13#10'       where  1=1'
    Left = 568
    Top = 96
  end
  inherited dsMain: TDataSource
    Left = 520
    Top = 96
  end
  inherited pmZD: TPopupMenu
    Left = 824
    Top = 8
  end
  inherited xpmnfst1: TXPManifest
    Left = 752
    Top = 8
  end
  inherited pmMain: TPopupMenu
    OnPopup = pmMainPopup
    Left = 424
    Top = 176
    object mniAdd: TMenuItem
      Caption = #26032#24314
      OnClick = mniAddClick
    end
    object mniEdit: TMenuItem
      Caption = #32534#36753
      OnClick = mniEditClick
    end
    object mniCheck: TMenuItem
      Caption = #26816#26597#13#10
      OnClick = mniCheckClick
    end
    object mniDel: TMenuItem
      Caption = #21024#38500
      OnClick = mniDelClick
    end
    object mniPChange: TMenuItem
      Caption = #20215#26684#21464#21160#35760#24405
      OnClick = mniPChangeClick
    end
  end
  inherited cdsMainWhereInit: TClientDataSet
    Left = 896
    Top = 8
  end
  object qrytemp: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security In' +
      'fo=True;User ID=WZPCBConnect;Initial Catalog=sj_v20_live;Data So' +
      'urce=172.16.8.112'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select inv_part_number,inv_part_description,data0017.stock_unit_' +
        'ptr,isnull(data0017.CATALOG_NUM,'#39#39') as CATALOG_NUM,'
      
        '       data0023.code,data0023.supplier_name,data0028.lead_time,d' +
        'ata0805.model,data0805.inv_name as '#29615#27979#29289#26009#21517#31216' ,'
      '       data0028.supplier_part_no,data0028.sugg_reorder_qty,'
      '       data0001.curr_name,data0001.curr_code,data0028.rkey,'
      '       data0002.unit_code,data0002.unit_name,data0028.PRICE_1,'
      
        '       data0023.abbr_name,data0017.inv_name,data0028.rohs,data00' +
        '28.TAX_2 as TAX,'
      '       cast(data0028.TAX_2 as varchar(10))+ '#39'%'#39' as TAX_2,'
      
        '       data0028.qte_price,data0028.qte_price2,data0028.avl_flag,' +
        'data0028.prot_report_ptr,data0028.remark,'
      
        'case data0023.status when 0 then '#39#26377#25928#39' when 1 then '#39#26080#25928#39' end as su' +
        'pper_statu,data0028.IF_CAF'
      'from   data0028 inner join '
      
        '       data0017 on data0028.inventory_ptr=data0017.rkey inner jo' +
        'in'
      
        '       data0023 on data0028.supplier_ptr=data0023.rkey  inner jo' +
        'in'
      
        '       data0001 on data0028.currency_ptr=data0001.rkey inner joi' +
        'n'
      
        '       data0002 on data0028.purchase_unit_ptr=data0002.rkey left' +
        ' join'
      '       data0805 on data0028.prot_report_ptr=data0805.rkey  '
      '       where  1=2')
    Left = 560
    Top = 232
    object strngfld_part_number: TStringField
      FieldName = 'inv_part_number'
      Size = 25
    end
    object strngfld_part_description: TStringField
      FieldName = 'inv_part_description'
      ReadOnly = True
      Size = 100
    end
    object strngfldCATALOG_NUM: TStringField
      FieldName = 'CATALOG_NUM'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object strngfldqrytempcode: TStringField
      FieldName = 'code'
      Size = 10
    end
    object strngfld_name: TStringField
      FieldName = 'supplier_name'
      Size = 100
    end
    object qrytempPRICE_1: TFloatField
      FieldName = 'PRICE_1'
    end
    object strngfldTAX_2: TStringField
      FieldName = 'TAX_2'
      ReadOnly = True
      Size = 11
    end
    object strngfld_code1: TStringField
      FieldName = 'unit_code'
      Size = 5
    end
    object strngfld_name1: TStringField
      FieldName = 'curr_name'
    end
    object qrytempqte_price: TFloatField
      FieldName = 'qte_price'
    end
    object intgrfld_price2: TIntegerField
      FieldName = 'qte_price2'
    end
    object strngfld_flag: TStringField
      FieldName = 'avl_flag'
      FixedChar = True
      Size = 1
    end
    object strngfld_statu: TStringField
      FieldName = 'supper_statu'
      ReadOnly = True
      Size = 4
    end
    object strngfldqrytemp环测物料名称: TStringField
      FieldName = #29615#27979#29289#26009#21517#31216
    end
    object strngfldqrytempmodel: TStringField
      FieldName = 'model'
    end
  end
  object cdstemp: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select inv_part_number,inv_part_description,data0017.stock_unit_' +
      'ptr,isnull(data0017.CATALOG_NUM,'#39#39') as CATALOG_NUM,'#13#10'       data' +
      '0023.code,data0023.supplier_name,data0028.lead_time,data0805.mod' +
      'el,data0805.inv_name as '#29615#27979#29289#26009#21517#31216' ,'#13#10'       data0028.supplier_part_' +
      'no,data0028.sugg_reorder_qty,'#13#10'       data0001.curr_name,data000' +
      '1.curr_code,data0028.rkey,'#13#10'       data0002.unit_code,data0002.u' +
      'nit_name,data0028.PRICE_1,'#13#10'       data0023.abbr_name,data0017.i' +
      'nv_name,data0028.rohs,data0028.TAX_2 as TAX,'#13#10'       cast(data00' +
      '28.TAX_2 as varchar(10))+ '#39'%'#39' as TAX_2,'#13#10'       data0028.qte_pri' +
      'ce,data0028.qte_price2,data0028.avl_flag,data0028.prot_report_pt' +
      'r,data0028.remark,'#13#10'case data0023.status when 0 then '#39#26377#25928#39' when 1' +
      ' then '#39#26080#25928#39' end as supper_statu,data0028.IF_CAF'#13#10'from   data0028 ' +
      'inner join '#13#10'       data0017 on data0028.inventory_ptr=data0017.' +
      'rkey inner join'#13#10'       data0023 on data0028.supplier_ptr=data00' +
      '23.rkey  inner join'#13#10'       data0001 on data0028.currency_ptr=da' +
      'ta0001.rkey inner join'#13#10'       data0002 on data0028.purchase_uni' +
      't_ptr=data0002.rkey left join'#13#10'       data0805 on data0028.prot_' +
      'report_ptr=data0805.rkey  '#13#10'       where  1=1'
    FilterOptions = [foCaseInsensitive]
    Params = <>
    Left = 648
    Top = 120
  end
end
