object Form1: TForm1
  Left = 182
  Top = 150
  Width = 1151
  Height = 613
  Caption = #29305#27530#20986#20179#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1135
    Height = 45
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      1135
      45)
    object Label1: TLabel
      Left = 274
      Top = 16
      Width = 76
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #20986#20179#21333#21495
    end
    object Button1: TButton
      Left = 6
      Top = 8
      Width = 59
      Height = 29
      Caption = #36864#20986
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 64
      Top = 8
      Width = 59
      Height = 29
      Caption = #25968#25454#23548#20986
      TabOrder = 1
      OnClick = Button2Click
    end
    object Edit1: TEdit
      Left = 353
      Top = 12
      Width = 122
      Height = 21
      TabOrder = 2
      OnChange = Edit1Change
    end
    object BitBtn1: TBitBtn
      Left = 122
      Top = 8
      Width = 61
      Height = 29
      Caption = #26174#31034#23383#27573
      PopupMenu = PopupMenu1
      TabOrder = 3
      OnClick = BitBtn1Click
    end
    object RadioGroup2: TRadioGroup
      Left = 692
      Top = -1
      Width = 84
      Height = 45
      Anchors = [akTop, akRight]
      Caption = #38754#31215
      ItemIndex = 0
      Items.Strings = (
        #19981#21547#26495#36793
        #21547#26495#36793)
      TabOrder = 4
      OnClick = RadioGroup2Click
    end
    object Button3: TButton
      Left = 182
      Top = 8
      Width = 61
      Height = 29
      Caption = #26597#35810
      TabOrder = 5
      OnClick = Button3Click
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 45
    Width = 1135
    Height = 529
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'number'
        Footers = <>
        Title.Alignment = taCenter
      end
      item
        DisplayFormat = 'yyyy-MM-dd'
        EditButtons = <>
        FieldName = 'sys_date'
        Footers = <>
        Title.Alignment = taCenter
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOYEE_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_NUMBER'
        Footers = <>
        Title.Alignment = taCenter
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_DESC'
        Footers = <>
        Title.Alignment = taCenter
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'SALES_ORDER'
        Footers = <>
        Title.Caption = #38144#21806#35746#21333
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'CUST_CODE'
        Footers = <>
        Title.Alignment = taCenter
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'CUSTOMER_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'ABBR_NAME10'
        Footers = <>
        Title.Alignment = taCenter
      end
      item
        EditButtons = <>
        FieldName = 'QUANTITY'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Alignment = taCenter
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'LATEST_PRICE'
        Footers = <>
        Title.Caption = #26368#26032#21333#20215
      end
      item
        EditButtons = <>
        FieldName = #20986#20179#31867#22411
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #29366#24577
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'amount'
        Footers = <>
        Title.Caption = #37329#39069'('#26412#20301#24065')'
      end
      item
        EditButtons = <>
        FieldName = 'SAMPLE_NR'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #27979#24335#25104#22411#22791#27880
        Visible = False
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'bzchengben'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #21333'PCS'#26631#20934#25104#26412
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'bzjechengben'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #26631#20934#25104#26412#24635#37329#39069
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'weight'
        Footers = <>
        Title.Alignment = taCenter
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'mianji'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Alignment = taCenter
      end
      item
        EditButtons = <>
        FieldName = 'WORK_ORDER_NUMBER'
        Footers = <>
        Title.Alignment = taCenter
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'WAREHOUSE_CODE'
        Footers = <>
        Title.Alignment = taCenter
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'CODE'
        Footers = <>
        Title.Alignment = taCenter
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'LOCATION'
        Footers = <>
        Title.Alignment = taCenter
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'reference'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #22791#27880
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'ABBR_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #22806#21327#21378#23478
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'RMA_NUMBER'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'RMA'#21495#30721
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'chengben'
        Footers = <>
        Title.Caption = #21333'PCS'#25104#26412
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'Jechengben'
        Footers = <>
        Title.Caption = #25104#26412#24635#37329#39069
        Visible = False
      end>
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 56
    Top = 304
  end
  object aq415: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'SELECT   dbo.data0415.number, dbo.data0415.sys_date, '
      
        '                CASE data0415.status WHEN 1 THEN '#39#24453#25552#20132#39' WHEN 2 TH' +
        'EN '#39#24453#20986#20179#39' WHEN 3 THEN '#39#24050#20986#20179#39' WHEN 4 THEN '#39#24050#26816#35270#39
      '                 WHEN 5 THEN '#39#34987#36864#22238#39' ELSE '#39#20854#20182#39' END AS '#29366#24577', '
      
        '                CASE data0415.type WHEN 1 THEN '#39#30452#25509#20986#20179#39' WHEN 2 THE' +
        'N '#39#22996#22806#36864#36135#39' WHEN 3 THEN '#39#36864#36135#37325#26816#39' WHEN 4 THEN '#39#27491#24120#37325#26816#39
      
        '                 ELSE '#39#20854#20182#39' END AS '#20986#20179#31867#22411', dbo.Data0005.EMPLOYEE_NA' +
        'ME, dbo.Data0025.MANU_PART_NUMBER, '
      
        '                dbo.Data0025.MANU_PART_DESC, dbo.Data0025.SAMPLE' +
        '_NR, dbo.Data0465.QUANTITY, '
      
        '                dbo.Data0006.WORK_ORDER_NUMBER, dbo.Data0010.CUS' +
        'T_CODE, dbo.Data0010.CUSTOMER_NAME, '
      
        '                dbo.Data0010.ABBR_NAME AS ABBR_NAME10, dbo.Data0' +
        '015.WAREHOUSE_CODE, '
      '                CASE WHEN data0416.so_ptr IS NULL '
      
        '                THEN Data0025.LATEST_PRICE ELSE data0060.PARTS_A' +
        'LLOC / data0060.EXCH_RATE END AS LATEST_PRICE, '
      
        '                dbo.Data0060.SALES_ORDER, CASE WHEN data0416.so_' +
        'ptr IS NULL '
      
        '                THEN Data0465.QUANTITY * Data0025.LATEST_PRICE E' +
        'LSE Data0465.QUANTITY * (data0060.PARTS_ALLOC / data0060.EXCH_RA' +
        'TE)'
      
        '                 END AS amount, dbo.Data0465.QUANTITY * dbo.Data' +
        '0025.REPORT_UNIT_VALUE1 / 1000 AS weight, '
      
        '                ROUND(dbo.Data0465.QUANTITY * dbo.Data0025.unit_' +
        'sq, 4) AS mianji, dbo.data0415.type, dbo.data0415.status, '
      
        '                dbo.Data0016.CODE, dbo.Data0016.LOCATION, dbo.da' +
        'ta0415.reference, dbo.Data0023.ABBR_NAME, '
      
        '                CASE WHEN data0053.work_order_ptr > 0 THEN ROUND' +
        '(Data0465.QUANTITY * Data0006.panel_ln * Data0006.panel_wd *'
      
        '                 0.000001 / Data0006.PARTS_PER_PANEL, 4) ELSE RO' +
        'UND(dbo.Data0465.QUANTITY * dbo.Data0025.unit_sq, 4) '
      '                END AS mianji_1, dbo.Data0098.RMA_NUMBER, '
      
        '                dbo.Data0053.cost_pcs + dbo.Data0053.matl_ovhd_p' +
        'cs + dbo.Data0053.OVHD_COST + dbo.Data0053.PLANNED_QTY + dbo.Dat' +
        'a0053.ovhd1_pcs'
      '                 + dbo.Data0053.outsource_pcs AS chengben, '
      
        '                ROUND(dbo.Data0465.QUANTITY * (dbo.Data0053.cost' +
        '_pcs + dbo.Data0053.matl_ovhd_pcs + dbo.Data0053.OVHD_COST'
      
        '                 + dbo.Data0053.PLANNED_QTY + dbo.Data0053.ovhd1' +
        '_pcs + dbo.Data0053.outsource_pcs), 6) AS Jechengben, '
      
        '                (ISNULL(dbo.Data0025.tot_accu_matl_per_sqft, 0) ' +
        '+ ISNULL(dbo.Data0025.tot_accu_OVHD_per_sqft, 0)) '
      '                * dbo.Data0025.unit_sq AS bzchengben, '
      
        '                ROUND(dbo.Data0465.QUANTITY * ((ISNULL(dbo.Data0' +
        '025.tot_accu_matl_per_sqft, 0) '
      
        '                + ISNULL(dbo.Data0025.tot_accu_OVHD_per_sqft, 0)' +
        ') * dbo.Data0025.unit_sq), 6) AS bzjechengben'
      'FROM      dbo.Data0465 INNER JOIN'
      
        '                dbo.data0415 ON dbo.Data0465.heard_ptr = dbo.dat' +
        'a0415.rkey LEFT OUTER JOIN'
      
        '                dbo.Data0098 ON dbo.data0415.rma_ptr = dbo.Data0' +
        '098.RKEY INNER JOIN'
      
        '                dbo.Data0005 ON dbo.data0415.empl_ptr = dbo.Data' +
        '0005.RKEY INNER JOIN'
      
        '                dbo.Data0025 ON dbo.data0415.custpart_ptr = dbo.' +
        'Data0025.RKEY INNER JOIN'
      
        '                dbo.Data0053 ON dbo.Data0465.D0053_PTR = dbo.Dat' +
        'a0053.RKEY INNER JOIN'
      
        '                dbo.Data0015 ON dbo.Data0053.WHSE_PTR = dbo.Data' +
        '0015.RKEY INNER JOIN'
      
        '                dbo.Data0016 ON dbo.Data0053.LOC_PTR = dbo.Data0' +
        '016.RKEY INNER JOIN'
      
        '                dbo.data0416 ON dbo.Data0053.NPAD_PTR = dbo.data' +
        '0416.rkey INNER JOIN'
      
        '                dbo.Data0010 ON dbo.data0415.customer_ptr = dbo.' +
        'Data0010.RKEY LEFT OUTER JOIN'
      
        '                dbo.Data0006 ON dbo.Data0053.WORK_ORDER_PTR = db' +
        'o.Data0006.RKEY LEFT OUTER JOIN'
      
        '                dbo.Data0060 ON dbo.data0416.so_ptr = dbo.Data00' +
        '60.RKEY LEFT OUTER JOIN'
      
        '                dbo.Data0023 ON dbo.Data0060.supplier_ptr = dbo.' +
        'Data0023.RKEY'
      
        'where data0415.sys_date >= :dtpk1 and data0415.sys_date <= :dtpk' +
        '2'
      ''
      'order by data0415.number select getdate()')
    Left = 136
    Top = 304
    object aq415number: TStringField
      DisplayLabel = #20986#20179#21333#21495
      FieldName = 'number'
      Size = 15
    end
    object aq415sys_date: TDateTimeField
      DisplayLabel = #20986#20179#26085#26399
      FieldName = 'sys_date'
    end
    object aq415EMPLOYEE_NAME: TStringField
      DisplayLabel = #25805#20316#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object aq415QUANTITY: TIntegerField
      DisplayLabel = #25968#37327
      FieldName = 'QUANTITY'
    end
    object aq415WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #24037#20316#23450#21333
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object aq415CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object aq415WAREHOUSE_CODE: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object aq415weight: TFloatField
      DisplayLabel = #37325#37327'('#20844#26020')'
      FieldName = 'weight'
      ReadOnly = True
    end
    object aq415mianji: TFloatField
      DisplayLabel = #38754#31215
      FieldName = 'mianji'
      ReadOnly = True
    end
    object aq415type: TWordField
      FieldName = 'type'
    end
    object aq415status: TWordField
      FieldName = 'status'
    end
    object aq415DSDesigner: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 6
    end
    object aq415DSDesigner2: TStringField
      FieldName = #20986#20179#31867#22411
      ReadOnly = True
      Size = 8
    end
    object aq415MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object aq415MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object aq415CODE: TStringField
      DisplayLabel = #20179#24211#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object aq415LOCATION: TStringField
      DisplayLabel = #20179#24211#21517#31216
      FieldName = 'LOCATION'
    end
    object aq415reference: TStringField
      FieldName = 'reference'
      Size = 50
    end
    object aq415ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object aq415mianji_1: TFloatField
      DisplayLabel = #38754#31215
      FieldName = 'mianji_1'
      ReadOnly = True
    end
    object aq415RMA_NUMBER: TStringField
      FieldName = 'RMA_NUMBER'
      Size = 10
    end
    object aq415chengben: TFloatField
      FieldName = 'chengben'
      ReadOnly = True
    end
    object aq415Jechengben: TFloatField
      FieldName = 'Jechengben'
      ReadOnly = True
    end
    object aq415SAMPLE_NR: TStringField
      FieldName = 'SAMPLE_NR'
      Size = 50
    end
    object aq415CUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      DisplayWidth = 25
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object aq415ABBR_NAME10: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME10'
      Size = 10
    end
    object aq415SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object aq415LATEST_PRICE: TFloatField
      FieldName = 'LATEST_PRICE'
      ReadOnly = True
    end
    object aq415amount: TFloatField
      FieldName = 'amount'
      ReadOnly = True
    end
    object aq415bzchengben: TFloatField
      FieldName = 'bzchengben'
      ReadOnly = True
    end
    object aq415bzjechengben: TFloatField
      FieldName = 'bzjechengben'
      ReadOnly = True
    end
  end
  object DataSource1: TDataSource
    DataSet = aq415
    Left = 200
    Top = 304
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    Left = 128
    Top = 384
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    Left = 312
    Top = 176
  end
end
