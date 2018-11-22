inherited frmEdit_mod26: TfrmEdit_mod26
  Caption = #20379#24212#21830#20215#26684'/'#20132#36135#26102#38388#34920
  ClientHeight = 571
  ClientWidth = 837
  Font.Height = -13
  Font.Name = #23435#20307
  OnShow = FormShow
  ExplicitWidth = 853
  ExplicitHeight = 610
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 837
    Height = 571
    ExplicitWidth = 837
    ExplicitHeight = 571
    inherited pnl1: TPanel
      Width = 835
      ExplicitWidth = 835
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 835
      Height = 536
      ExplicitWidth = 835
      ExplicitHeight = 536
      object pnl3: TPanel
        Left = 1
        Top = 1
        Width = 833
        Height = 328
        Align = alTop
        TabOrder = 0
        object lbl1: TLabel
          Left = 58
          Top = 16
          Width = 65
          Height = 13
          Caption = #24211#23384#21407#26448#26009
        end
        object lbl2: TLabel
          Left = 6
          Top = 96
          Width = 117
          Height = 13
          Caption = #20379#24212#21830#26448#26009#22411#21495#20195#30721
        end
        object lbl3: TLabel
          Left = 83
          Top = 43
          Width = 39
          Height = 13
          Caption = #20379#24212#21830
        end
        object lbl4: TLabel
          Left = 95
          Top = 68
          Width = 26
          Height = 13
          Caption = #36135#24065
        end
        object lbl5: TLabel
          Left = 32
          Top = 122
          Width = 91
          Height = 13
          Caption = #20379#24212#21830#20132#36135#22825#25968
        end
        object lbl6: TLabel
          Left = 199
          Top = 122
          Width = 26
          Height = 13
          Caption = #22825#25968
        end
        object lbl7: TLabel
          Left = 71
          Top = 149
          Width = 52
          Height = 13
          Caption = #20445#23384#26399#38480
        end
        object lbl8: TLabel
          Left = 200
          Top = 149
          Width = 13
          Height = 13
          Caption = #22825
        end
        object lbl9: TLabel
          Left = 244
          Top = 149
          Width = 52
          Height = 13
          Caption = #23384#36135#21333#20301
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object lbl10: TLabel
          Left = 71
          Top = 176
          Width = 52
          Height = 13
          Caption = #37319#36141#21333#20301
        end
        object lbl11: TLabel
          Left = 237
          Top = 176
          Width = 59
          Height = 13
          Caption = #23384#36135'/'#37319#36141
        end
        object lbl12: TLabel
          Left = 70
          Top = 203
          Width = 52
          Height = 13
          Caption = #29615#20445#31561#32423
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object lbl13: TLabel
          Left = 262
          Top = 202
          Width = 34
          Height = 13
          Caption = #32784'CAF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object lbl14: TLabel
          Left = 45
          Top = 231
          Width = 78
          Height = 13
          Caption = #27979#35797#29615#22659#25253#21578
        end
        object lbl15: TLabel
          Left = 96
          Top = 255
          Width = 26
          Height = 13
          Caption = #22791#27880
        end
        object lbl16: TLabel
          Left = 581
          Top = 35
          Width = 73
          Height = 13
          Caption = 'AVL'#23457#25209#20154#21592
        end
        object lbl17: TLabel
          Left = 576
          Top = 62
          Width = 78
          Height = 13
          Caption = #26368#21518#20445#23384#26085#26399
        end
        object lbl18: TLabel
          Left = 607
          Top = 87
          Width = 47
          Height = 13
          Caption = 'AVL'#26631#35760
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object lbl19: TLabel
          Left = 602
          Top = 114
          Width = 52
          Height = 13
          Caption = #35746#36141#26041#27861
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object lbl20: TLabel
          Left = 543
          Top = 143
          Width = 111
          Height = 13
          Caption = #26368#23567#35746#36141#25968#37327'/'#37329#39069
        end
        object lbl21: TLabel
          Left = 576
          Top = 170
          Width = 78
          Height = 13
          Caption = #24314#35758#37325#36141#25968#37327
        end
        object lbl22: TLabel
          Left = 615
          Top = 197
          Width = 39
          Height = 13
          Caption = #22686#20540#31246
        end
        object lbl23: TLabel
          Left = 732
          Top = 195
          Width = 7
          Height = 13
          Caption = '%'
        end
        object lbl24: TLabel
          Left = 602
          Top = 254
          Width = 52
          Height = 13
          Caption = #36141#20837#26041#24335
        end
        object lbl25: TLabel
          Left = 576
          Top = 281
          Width = 78
          Height = 13
          Caption = #24066#22330#25253#20215#20215#26684
        end
        object lbl26: TLabel
          Left = 576
          Top = 308
          Width = 78
          Height = 13
          Caption = #26368#21518#20445#23384#20154#21592
        end
        object lbl_WUnit: TLabel
          Left = 376
          Top = 149
          Width = 7
          Height = 13
          Caption = '.'
        end
        object edt_mtrl: TRKeyRzBtnEdit
          Left = 129
          Top = 11
          Width = 153
          Height = 21
          Text = ''
          TabOrder = 0
          ButtonKind = bkFind
          AltBtnWidth = 15
          ButtonWidth = 15
          OnButtonClick = edt_mtrlButtonClick
          DataSource = ds28
          DataSourceField = 'INVENTORY_PTR'
          DispalyTableName = 'data0017'
          DisplaytextField = 'INV_PART_NUMBER'
          DisplayRetKeyField = 'rkey'
          DisplayNoteField = 'INV_PART_DESCRIPTION'
          DisplayPickID = '2'
          DisplayModID = 26
          ForceOnFocus = True
        end
        object edt_vendor: TRKeyRzBtnEdit
          Left = 128
          Top = 38
          Width = 80
          Height = 21
          Text = ''
          TabOrder = 1
          ButtonKind = bkFind
          AltBtnWidth = 15
          ButtonWidth = 15
          OnButtonClick = edt_vendorButtonClick
          DataSource = ds28
          DataSourceField = 'SUPPLIER_PTR'
          DispalyTableName = 'data0023'
          DisplaytextField = 'CODE'
          DisplayRetKeyField = 'rkey'
          DisplayNoteField = 'SUPPLIER_NAME'
          DisplayPickID = '1'
          DisplayModID = 26
          ForceOnFocus = True
        end
        object edt_curr: TRKeyRzBtnEdit
          Left = 126
          Top = 65
          Width = 80
          Height = 21
          Text = ''
          TabOrder = 2
          ButtonKind = bkFind
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds28
          DataSourceField = 'CURRENCY_PTR'
          DispalyTableName = 'data0001'
          DisplaytextField = 'CURR_CODE'
          DisplayRetKeyField = 'rkey'
          DisplayNoteField = 'CURR_NAME'
          DisplayPickID = '4'
          DisplayModID = 26
          ForceOnFocus = True
        end
        object edt_VMtrl: TRKeyRzBtnEdit
          Left = 126
          Top = 92
          Width = 336
          Height = 21
          Text = ''
          TabOrder = 3
          ButtonKind = bkFind
          ButtonVisible = False
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds28
          DataSourceField = 'SUPPLIER_PART_NO'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object edt_VDays: TRKeyRzBtnEdit
          Left = 126
          Top = 119
          Width = 71
          Height = 21
          Text = ''
          TabOrder = 4
          ButtonKind = bkFind
          ButtonVisible = False
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds28
          DataSourceField = 'LEAD_TIME'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object edt_EDays: TRKeyRzBtnEdit
          Left = 126
          Top = 146
          Width = 71
          Height = 21
          Text = ''
          TabOrder = 5
          OnExit = edt_EDaysExit
          ButtonKind = bkFind
          ButtonVisible = False
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds28
          DataSourceField = 'qte_price2'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object edt_WUnit: TRKeyRzBtnEdit
          Left = 302
          Top = 144
          Width = 70
          Height = 21
          Text = ''
          Color = clBtnFace
          Enabled = False
          FocusColor = clScrollBar
          TabOrder = 6
          ButtonKind = bkFind
          ButtonVisible = False
          AltBtnWidth = 15
          ButtonWidth = 15
          DisplayModID = 0
          ForceOnFocus = True
        end
        object edt_PUinit: TRKeyRzBtnEdit
          Left = 126
          Top = 173
          Width = 71
          Height = 21
          Text = ''
          TabOrder = 7
          ButtonKind = bkFind
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds28
          DataSourceField = 'PURCHASE_UNIT_PTR'
          DispalyTableName = 'data0002'
          DisplaytextField = 'UNIT_CODE'
          DisplayRetKeyField = 'rkey'
          DisplayNoteField = 'UNIT_NAME'
          DisplayPickID = '3'
          DisplayModID = 26
          ForceOnFocus = True
        end
        object edt_rate: TRKeyRzBtnEdit
          Left = 298
          Top = 171
          Width = 71
          Height = 21
          Text = ''
          TabOrder = 8
          ButtonKind = bkFind
          ButtonVisible = False
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds28
          DataSourceField = 'CONVERSION_FACTOR'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object cbb_Grade: TComboBox
          Left = 126
          Top = 200
          Width = 71
          Height = 21
          TabOrder = 9
          Items.Strings = (
            #8544#32423
            #8545#32423)
        end
        object cbb_caf: TComboBox
          Left = 298
          Top = 198
          Width = 70
          Height = 21
          TabOrder = 10
          Items.Strings = (
            #26159
            #21542)
        end
        object edt_Report: TRKeyRzBtnEdit
          Left = 126
          Top = 226
          Width = 99
          Height = 21
          Text = ''
          TabOrder = 11
          ButtonKind = bkFind
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds28
          DataSourceField = 'prot_report_ptr'
          DispalyTableName = 'data0805'
          DisplaytextField = 'Model'
          DisplayRetKeyField = 'rkey'
          DisplayPickID = '7'
          DisplayModID = 26
          ForceOnFocus = True
        end
        object chk_IfRpt: TCheckBox
          Left = 237
          Top = 227
          Width = 163
          Height = 17
          Caption = #26159#21542#38656#35201#29615#22659#27979#35797#25253#21578
          Color = clRed
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 12
        end
        object edt_remark: TRKeyRzBtnEdit
          Left = 126
          Top = 253
          Width = 419
          Height = 21
          Text = ''
          TabOrder = 13
          ButtonKind = bkFind
          ButtonVisible = False
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds28
          DataSourceField = 'remark'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object edt_AVLMan: TRKeyRzBtnEdit
          Left = 658
          Top = 30
          Width = 103
          Height = 21
          Text = ''
          Color = clBtnFace
          Enabled = False
          FocusColor = clScrollBar
          TabOrder = 14
          ButtonKind = bkFind
          ButtonVisible = False
          AltBtnWidth = 15
          ButtonWidth = 15
          DisplayModID = 0
          ForceOnFocus = True
        end
        object edt_ModiDate: TRKeyRzBtnEdit
          Left = 659
          Top = 57
          Width = 103
          Height = 21
          Text = ''
          Color = clBtnFace
          Enabled = False
          FocusColor = clScrollBar
          TabOrder = 15
          ButtonKind = bkFind
          ButtonVisible = False
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds28
          DataSourceField = 'TDate'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object cbb_IfAVL: TComboBox
          Left = 659
          Top = 84
          Width = 102
          Height = 21
          Style = csDropDownList
          Enabled = False
          TabOrder = 16
          Items.Strings = (
            #24050#35748#21487
            #26410#35748#21487
            #26242#26102#35748#21487)
        end
        object cbb_PMethod: TComboBox
          Left = 658
          Top = 111
          Width = 104
          Height = 21
          Style = csDropDownList
          TabOrder = 17
          OnSelect = cbb_PMethodSelect
          Items.Strings = (
            #25968#37327
            #37329#39069)
        end
        object edt_MinQM: TRKeyRzBtnEdit
          Left = 658
          Top = 138
          Width = 104
          Height = 21
          Text = ''
          TabOrder = 18
          OnExit = edt_MinQMExit
          ButtonKind = bkFind
          ButtonVisible = False
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds28
          DataSourceField = 'MIN_ORDER_QTY'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object edt_SQty: TRKeyRzBtnEdit
          Left = 659
          Top = 165
          Width = 104
          Height = 21
          Text = ''
          TabOrder = 19
          ButtonKind = bkFind
          ButtonVisible = False
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds28
          DataSourceField = 'SUGG_REORDER_QTY'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object edt_ATax: TRKeyRzBtnEdit
          Left = 660
          Top = 192
          Width = 71
          Height = 21
          Text = ''
          TabOrder = 20
          ButtonKind = bkFind
          ButtonVisible = False
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds28
          DataSourceField = 'TAX_2'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object chk_IfTax: TCheckBox
          Left = 658
          Top = 219
          Width = 119
          Height = 17
          Caption = #20379#24212#21830#20215#26684#21547#31246
          TabOrder = 21
        end
        object edt_SPrice: TRKeyRzBtnEdit
          Left = 660
          Top = 277
          Width = 103
          Height = 21
          Text = ''
          Color = clBtnFace
          Enabled = False
          FocusColor = clScrollBar
          TabOrder = 22
          ButtonKind = bkFind
          ButtonVisible = False
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds28
          DataSourceField = 'qte_price'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object edt_ModiMan: TRKeyRzBtnEdit
          Left = 660
          Top = 304
          Width = 103
          Height = 21
          Text = ''
          Color = clBtnFace
          Enabled = False
          FocusColor = clScrollBar
          TabOrder = 23
          ButtonKind = bkFind
          ButtonVisible = False
          AltBtnWidth = 15
          ButtonWidth = 15
          DisplayModID = 0
          ForceOnFocus = True
        end
        object rg_SMethod: TRadioGroup
          Left = 658
          Top = 239
          Width = 103
          Height = 32
          Caption = ' '
          Columns = 2
          Items.Strings = (
            #20869#38144
            #36716#21378)
          TabOrder = 24
        end
      end
      object pnl4: TPanel
        Left = 1
        Top = 329
        Width = 833
        Height = 206
        Align = alClient
        TabOrder = 1
        object pgc1: TPageControl
          Left = 1
          Top = 1
          Width = 831
          Height = 204
          ActivePage = ts2
          Align = alClient
          TabOrder = 0
          object ts1: TTabSheet
            Caption = #20215#26684#33539#22260
            object sg_range: TStringGrid
              Left = 0
              Top = 0
              Width = 823
              Height = 175
              Hint = #21491#38190#21024#38500
              Align = alClient
              ColCount = 4
              DefaultColWidth = 190
              DefaultRowHeight = 21
              RowCount = 7
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing]
              ParentShowHint = False
              PopupMenu = pm_range
              ScrollBars = ssVertical
              ShowHint = True
              TabOrder = 0
              OnExit = sg_rangeExit
              OnKeyPress = sg_rangeKeyPress
              OnKeyUp = sg_rangeKeyUp
              OnSelectCell = sg_rangeSelectCell
              ColWidths = (
                190
                191
                190
                190)
              RowHeights = (
                21
                21
                21
                21
                21
                21
                21)
            end
          end
          object ts2: TTabSheet
            Caption = #20215#26684#23457#25209#25991#20214
            ImageIndex = 1
            object eh_file: TDBGridEh
              Left = 0
              Top = 0
              Width = 823
              Height = 175
              Align = alClient
              DataSource = ds28File
              DynProps = <>
              PopupMenu = pm_file
              ReadOnly = True
              TabOrder = 0
              Columns = <
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'FileName'
                  Footers = <>
                  Title.Caption = #25991#20214#21517
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
          end
          object ts3: TTabSheet
            Caption = #26368#36817#37319#36141#20215#26684
            ImageIndex = 2
            object eh_PurPrice: TDBGridEh
              Left = 0
              Top = 0
              Width = 823
              Height = 175
              Align = alClient
              DataSource = dsPrice
              DynProps = <>
              ReadOnly = True
              TabOrder = 0
              OnKeyDown = eh_PurPriceKeyDown
              Columns = <
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'PO_NUMBER'
                  Footers = <>
                  Title.Caption = #35746#21333#32534#21495
                  Width = 68
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'employee_name'
                  Footers = <>
                  Title.Caption = #37319#36141#20154#21592
                  Width = 69
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'PO_DATE'
                  Footers = <>
                  Title.Caption = #35746#21333#26085#26399
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'QUAN_ORD'
                  Footers = <>
                  Title.Caption = #25968#37327
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
                  FieldName = 'DISCOUNT'
                  Footers = <>
                  Title.Caption = #25240#25187
                  Width = 59
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'TAX_2'
                  Footers = <>
                  Title.Caption = #22686#20540#31246
                  Width = 68
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
          end
        end
      end
    end
  end
  object cds28: TClientDataSet
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
    Left = 512
    Top = 56
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
    Left = 688
  end
  object qrytemp: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security In' +
      'fo=True;User ID=WZPCBConnect;Initial Catalog=sj_v20_live;Data So' +
      'urce=172.16.8.112'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Data0028_FileList inner join '
      
        #9#9#9'Tier3_CustomerFiles on Data0028_FileList.FtpIDKey = Tier3_Cus' +
        'tomerFiles.IDKey'
      'WHERE Data0028_FileList.rkey28=-1')
    Left = 496
    Top = 400
    object strngfldFileName: TStringField
      FieldName = 'FileName'
      Size = 512
    end
  end
  object ds28: TDataSource
    DataSet = cds28
    Left = 472
    Top = 58
  end
  object dsPrice: TDataSource
    DataSet = cdsPrice
    Left = 320
    Top = 482
  end
  object cdsPrice: TClientDataSet
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
    Left = 368
    Top = 480
  end
  object ds28File: TDataSource
    DataSet = cds28File
    Left = 312
    Top = 410
  end
  object cds28File: TClientDataSet
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
    Left = 368
    Top = 408
  end
  object cds328: TClientDataSet
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
    Left = 416
    Top = 320
  end
  object cds28FileSave: TClientDataSet
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
    Left = 664
    Top = 440
  end
  object cdsFTPFileSave: TClientDataSet
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
    Left = 576
    Top = 448
  end
  object pm_file: TPopupMenu
    OnPopup = pm_filePopup
    Left = 712
    Top = 368
    object mni_upLoad: TMenuItem
      Caption = #19978#20256#25991#20214
      OnClick = mni_upLoadClick
    end
    object mni_download: TMenuItem
      Caption = #19979#36733#25991#20214
      OnClick = mni_downloadClick
    end
    object mni_Del: TMenuItem
      Caption = #21024#38500
      OnClick = mni_DelClick
    end
  end
  object pm_range: TPopupMenu
    OnPopup = pm_rangePopup
    Left = 32
    Top = 408
    object mni_DelR: TMenuItem
      Caption = #21024#38500
      OnClick = mni_DelRClick
    end
  end
end
