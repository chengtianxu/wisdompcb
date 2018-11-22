inherited frmShow213: TfrmShow213
  Caption = #39044#22788#29702#36873#25321
  ClientHeight = 378
  ClientWidth = 594
  OnShow = FormShow
  ExplicitWidth = 602
  ExplicitHeight = 405
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 594
    Height = 34
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 19
      Top = 10
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = #26412#21378#32534#21495
    end
    object Edit1: TEdit
      Left = 68
      Top = 7
      Width = 161
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 337
    Width = 594
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 183
      Top = 6
      Width = 69
      Height = 28
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 264
      Top = 6
      Width = 69
      Height = 29
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
    object CheckBox1: TCheckBox
      Left = 16
      Top = 12
      Width = 57
      Height = 17
      Caption = #20840#36873
      TabOrder = 2
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 34
    Width = 594
    Height = 303
    Align = alClient
    TabOrder = 2
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 592
      Height = 301
      Align = alClient
      DataSource = ds213
      DynProps = <>
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ReadOnly = True
      TabOrder = 0
      OnDblClick = DBGridEh1DblClick
      OnTitleClick = DBGridEh1TitleClick
      Columns = <
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'MANU_PART_NUMBER'
          Footers = <>
          Title.Caption = #26412#21378#32534#21495
          Title.Color = clRed
          Width = 86
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'MANU_PART_DESC'
          Footers = <>
          Title.Caption = #23458#25143#22411#21495
          Width = 107
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'ANALYSIS_CODE_2'
          Footers = <>
          Title.Caption = #23458#25143#29289#26009#21495
          Width = 101
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'CUST_CODE'
          Footers = <>
          Title.Caption = #23458#25143#20195#30721
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'PO_NUMBER'
          Footers = <>
          Title.Caption = #23458#25143#35746#21333#21495
          Width = 96
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'PART_PRICE'
          Footers = <>
          ReadOnly = False
          Title.Caption = #21547#31246#20215#26684
          Width = 81
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'PARTS_ORDERED'
          Footers = <>
          ReadOnly = False
          Title.Caption = #25968#37327
          Width = 51
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'UsedQuantity'
          Footers = <>
          ReadOnly = False
          Title.Caption = #24050#19979#21333#25968
          Width = 60
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'ORIG_REQUEST_DATE'
          Footers = <>
          ReadOnly = False
          Title.Caption = #20986#21378#26085#26399
          Width = 58
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'ORIG_SCHED_SHIP_DATE'
          Footers = <>
          ReadOnly = False
          Title.Caption = #20132#36135#26085#26399
          Width = 72
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'REFERENCE_NUMBER'
          Footers = <>
          ReadOnly = False
          Title.Caption = #21442#32771#38468#27880
          Width = 120
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'WAREHOUSE_CODE'
          Footers = <>
          ReadOnly = False
          Title.Caption = #24037#21378
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object ds213: TDataSource
    DataSet = cds213
    Left = 264
    Top = 104
  end
  object cds213: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT data0213. *,'#13#10'ENG_NOTE,PROD_CODE_PTR,data0025.REMARK,'#13#10'da' +
      'ta0025.RKEY AS rkey25,data0213.MANU_PART_NUMBER,data0213. MANU_P' +
      'ART_DESC, ttype, QTY_ON_HAND,Data0008.batch_flag, Data0008.forme' +
      'r_flag,'#13#10'SHELF_LIFE, ONHOLD_SALES_FLAG, data0213.ANALYSIS_CODE_2' +
      ',set_lngth, set_width,Data0097.RKEY as rkey97,'#13#10'unit_sq, set_qty' +
      ',qty_alloc,case data0025.ttype when 0 then '#39#37327#20135#39' when 1 then '#39#26679#26495#39 +
      ' end as bachorfam,'#13#10'data0008.product_name,data0025.prod_route_pt' +
      'r,data0008.LEAD_TIME,Data0025.ORIG_CUSTOMER,Data0010.RKEY as rke' +
      'y10,'#13#10'data0010.cust_code,Data0010.CUSTOMER_NAME,Data0015.WAREHOU' +
      'SE_CODE,Data0015.WAREHOUSE_NAME,Data0015.RKEY as rkey15'#13#10'FROM   ' +
      '      dbo.DATA0213 inner join data0025'#13#10'on data0025.manu_part_nu' +
      'mber=data0213.MANU_PART_NUMBER'#13#10'inner join data0008 on data0025.' +
      'PROD_CODE_PTR=data0008.rkey'#13#10'left join data0015 on data0015.rkey' +
      '=data0025.PROD_ROUTE_PTR'#13#10'inner join data0010 on data0213.cust_c' +
      'ode=data0010.cust_code'#13#10'left join Data0097 on DATA0213.PO_NUMBER' +
      '=Data0097.PO_NUMBER and Data0010.RKEY=DATA0097.CUSTOMER_PTR'#13#10'WHE' +
      'RE status=3 and data0213.PARTS_ORDERED-IsNull(data0213.UsedQuant' +
      'ity,0)>0 '#13#10'and Data0010.CUSTOMER_TYPE<>4 and data0025.ONHOLD_SAL' +
      'ES_FLAG=0 and (PARENT_PTR IS NULL)'#13#10
    Filtered = True
    Params = <>
    Left = 352
    Top = 104
  end
end
