object Form4: TForm4
  Left = 642
  Top = 248
  Width = 955
  Height = 501
  Caption = #29305#27530#20986#20179#23457#26680
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 43
    Width = 939
    Height = 420
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'number'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME10'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_EMPLOYEE_NAME'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'auth_date'
        Title.Caption = #23457#26680#26085#26399
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sys_date'
        ReadOnly = False
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantity'
        ReadOnly = False
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_type'
        Title.Caption = #20986#20179#31867#22411
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_status'
        Width = 52
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 939
    Height = 43
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 310
      Top = 14
      Width = 57
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #20986#20179#21333#21495
    end
    object Button1: TButton
      Left = -1
      Top = 5
      Width = 66
      Height = 30
      Caption = #36864#20986
      TabOrder = 1
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 369
      Top = 10
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object Button2: TButton
      Left = 65
      Top = 5
      Width = 66
      Height = 30
      Caption = #21047#26032
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 131
      Top = 5
      Width = 66
      Height = 30
      Caption = #25253#34920#23450#20041
      TabOrder = 3
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 197
      Top = 5
      Width = 66
      Height = 30
      Caption = #26597#35810
      TabOrder = 4
      OnClick = Button4Click
    end
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 336
    Top = 111
  end
  object AQ415: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = AQ415CalcFields
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 38353d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 39478d
      end>
    SQL.Strings = (
      
        'SELECT data0415.number, data0415.status, data0415.rkey,data0415.' +
        'type,'
      '      Data0025.MANU_PART_NUMBER, Data0025.MANU_PART_DESC,'
      
        '      Data0005.EMPLOYEE_NAME, data0415.sys_date, data0415.quanti' +
        'ty,'
      
        '      data0415.reference, Data0010.ABBR_NAME AS abbr_name10, Dat' +
        'a0010.CUST_CODE,'
      
        '      Data0010.CUSTOMER_NAME, data0415.auth_empl_ptr, data0415.a' +
        'uth_date,'
      
        '      data0415.qty_received,Data0005_1.EMPLOYEE_NAME AS AU_EMPLO' +
        'YEE_NAME,'
      'case data0415.status'
      ' when 1 then '#39#24453#25552#20132#39' when 2  then '#39#24453#20986#20179#39
      ' when 3 then '#39#24050#20986#20179#39' when 4 then '#39#24050#26816#35270#39
      ' when 5 then '#39#34987#36864#22238#39' end as v_status, '
      'case data0415.type'
      ' when 1 then '#39#30452#25509#20986#20179#39
      ' when 2 then '#39#22996#22806#36864#36135#39
      ' when 3 then '#39#36864#36135#37325#26816#39
      ' when 4 then '#39#27491#24120#37325#26816#39' end as v_type'
      'FROM data0415  left join'
      
        '      Data0025 ON data0415.custpart_ptr = Data0025.RKEY INNER JO' +
        'IN'
      '      Data0005 ON data0415.empl_ptr = Data0005.RKEY INNER JOIN'
      
        '      Data0010 ON data0415.CUSTOMER_PTR = Data0010.RKEY LEFT OUT' +
        'ER JOIN'
      
        '      Data0005 Data0005_1 ON data0415.auth_empl_ptr = Data0005_1' +
        '.RKEY'
      
        'where (data0415.sys_date >= :dtpk1) and (data0415.sys_date <= :d' +
        'tpk2)'
      '       and (data0415.status<>1)'
      '')
    Left = 496
    Top = 159
    object AQ415number: TStringField
      DisplayLabel = #20986#20179#21333#21495
      FieldName = 'number'
      Size = 15
    end
    object AQ415status: TWordField
      FieldName = 'status'
    end
    object AQ415EMPLOYEE_NAME: TStringField
      DisplayLabel = #30003#35831#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object AQ415sys_date: TDateTimeField
      DisplayLabel = #20986#20179#26085#26399
      FieldName = 'sys_date'
    end
    object AQ415quantity: TIntegerField
      DisplayLabel = #20986#20179#25968#37327
      FieldName = 'quantity'
    end
    object AQ415reference: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'reference'
      Size = 50
    end
    object AQ415ABBR_NAME: TStringField
      DisplayLabel = #23458#25143
      FieldName = 'ABBR_NAME10'
      Size = 10
    end
    object AQ415rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ415cust_code: TStringField
      FieldName = 'cust_code'
      Size = 10
    end
    object AQ415CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 30
    end
    object AQ415auth_empl_ptr: TIntegerField
      FieldName = 'auth_empl_ptr'
    end
    object AQ415auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object AQ415qty_received: TIntegerField
      FieldName = 'qty_received'
    end
    object AQ415MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object AQ415MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object AQ415AU_EMPLOYEE_NAME: TStringField
      DisplayLabel = #23457#26680#20154
      FieldName = 'AU_EMPLOYEE_NAME'
      Size = 16
    end
    object AQ415v_status: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'v_status'
      ReadOnly = True
      Size = 6
    end
    object AQ415type: TWordField
      FieldName = 'type'
    end
    object AQ415v_type: TStringField
      FieldName = 'v_type'
      ReadOnly = True
      Size = 8
    end
  end
  object DataSource1: TDataSource
    DataSet = AQ415
    Left = 432
    Top = 159
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 208
    Top = 200
    object N1: TMenuItem
      Caption = #23457#26680
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21462#28040#23457#26680
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #26816#26597
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #36864#22238
      OnClick = N4Click
    end
    object n5: TMenuItem
      Caption = #25171#21360#29305#27530#20986#20179#21333
      ShortCut = 16464
      OnClick = n5Click
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 432
    Top = 240
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 432
    Top = 280
  end
  object aq56: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey06'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT RKEY, WO_PTR, DEPT_PTR, EMPLOYEE_PTR, STEP, QTY_BACKLOG, ' +
        'PANELS, '
      '      INTIME, TDATE, WTYPE,LOC_PTR,PUT_TYPE'
      'FROM dbo.Data0056'
      'where wo_ptr=:rkey06')
    Left = 488
    Top = 280
    object aq56RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aq56WO_PTR: TIntegerField
      FieldName = 'WO_PTR'
    end
    object aq56DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object aq56EMPLOYEE_PTR: TIntegerField
      FieldName = 'EMPLOYEE_PTR'
    end
    object aq56STEP: TSmallintField
      FieldName = 'STEP'
    end
    object aq56QTY_BACKLOG: TFloatField
      FieldName = 'QTY_BACKLOG'
    end
    object aq56PANELS: TIntegerField
      FieldName = 'PANELS'
    end
    object aq56INTIME: TDateTimeField
      FieldName = 'INTIME'
    end
    object aq56TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object aq56WTYPE: TSmallintField
      FieldName = 'WTYPE'
    end
    object aq56LOC_PTR: TIntegerField
      FieldName = 'LOC_PTR'
    end
    object aq56PUT_TYPE: TWordField
      FieldName = 'PUT_TYPE'
    end
  end
  object qry06: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select rkey,WORK_ORDER_NUMBER,CUT_NO,BEGIN_STEP_NO,'
      'PANEL_A_B,EMPLOYEE_PTR,WHOUSE_PTR,SCH_COMPL_DATE,'
      'BOM_PTR,PROD_STATUS,QUAN_SCH,ENT_DATETIME,PARTS_PER_PANEL,'
      
        'RELEASE_DATE,FLOW_NO,WIPMAT_STATUS,panel_ln,panel_wd,REFERENCE_P' +
        'TR,'
      'pnl_size,from_wo_ptr,LOT_NUMBER,CUTNO_WO,wtype,RMA_PTR'
      'from data0006'
      'where rkey is null')
    Left = 488
    Top = 320
    object qry06rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qry06WORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object qry06BEGIN_STEP_NO: TSmallintField
      FieldName = 'BEGIN_STEP_NO'
    end
    object qry06CUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object qry06PANEL_A_B: TIntegerField
      FieldName = 'PANEL_A_B'
    end
    object qry06EMPLOYEE_PTR: TIntegerField
      FieldName = 'EMPLOYEE_PTR'
    end
    object qry06BOM_PTR: TIntegerField
      FieldName = 'BOM_PTR'
    end
    object qry06PROD_STATUS: TSmallintField
      FieldName = 'PROD_STATUS'
    end
    object qry06QUAN_SCH: TFloatField
      FieldName = 'QUAN_SCH'
    end
    object qry06ENT_DATETIME: TDateTimeField
      FieldName = 'ENT_DATETIME'
    end
    object qry06PARTS_PER_PANEL: TFloatField
      FieldName = 'PARTS_PER_PANEL'
    end
    object qry06RELEASE_DATE: TDateTimeField
      FieldName = 'RELEASE_DATE'
    end
    object qry06FLOW_NO: TSmallintField
      FieldName = 'FLOW_NO'
    end
    object qry06WIPMAT_STATUS: TSmallintField
      FieldName = 'WIPMAT_STATUS'
    end
    object qry06panel_ln: TFloatField
      FieldName = 'panel_ln'
    end
    object qry06panel_wd: TFloatField
      FieldName = 'panel_wd'
    end
    object qry06pnl_size: TStringField
      FieldName = 'pnl_size'
    end
    object qry06from_wo_ptr: TIntegerField
      FieldName = 'from_wo_ptr'
    end
    object qry06WHOUSE_PTR: TIntegerField
      FieldName = 'WHOUSE_PTR'
    end
    object qry06LOT_NUMBER: TStringField
      FieldName = 'LOT_NUMBER'
      Size = 4
    end
    object qry06CUTNO_WO: TStringField
      FieldName = 'CUTNO_WO'
      Size = 22
    end
    object qry06wtype: TWordField
      FieldName = 'wtype'
    end
    object qry06SCH_COMPL_DATE: TDateTimeField
      FieldName = 'SCH_COMPL_DATE'
    end
    object qry06RMA_PTR: TIntegerField
      FieldName = 'RMA_PTR'
    end
    object qry06REFERENCE_PTR: TIntegerField
      FieldName = 'REFERENCE_PTR'
    end
  end
end
