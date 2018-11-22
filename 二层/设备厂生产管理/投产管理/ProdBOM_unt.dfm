object ProdBOM_frm: TProdBOM_frm
  Left = 606
  Top = 192
  Width = 1095
  Height = 635
  Caption = #29983#20135'BOM'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzToolbar1: TRzToolbar
    Left = 0
    Top = 0
    Width = 1087
    Height = 29
    ButtonHeight = 30
    TextOptions = ttoCustom
    BorderInner = fsNone
    BorderOuter = fsGroove
    BorderSides = [sdTop]
    BorderWidth = 0
    TabOrder = 0
    ToolbarControls = (
      Button3
      Button1
      Button2
      Button4
      Panel1)
    object Button3: TButton
      Left = 4
      Top = 2
      Width = 75
      Height = 25
      Caption = #20851#38381
      TabOrder = 0
      OnClick = Button3Click
    end
    object Button1: TButton
      Left = 79
      Top = 2
      Width = 75
      Height = 25
      Hint = #20174#26368#26032#30340#24037#31243'BOM'#26356#26032#21040#24403#21069#29983#20135'BOM'#20013
      Caption = #26356#26032'BOM'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 154
      Top = 2
      Width = 75
      Height = 25
      Caption = #21047#26032
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button4: TButton
      Left = 229
      Top = 2
      Width = 75
      Height = 25
      Caption = #23548#20986
      TabOrder = 3
      OnClick = Button4Click
    end
    object Panel1: TPanel
      Left = 304
      Top = 2
      Width = 337
      Height = 25
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'Panel1'
      TabOrder = 4
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 29
    Width = 1087
    Height = 575
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = GB2312_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'part_name'
        Footers = <>
        Width = 54
      end
      item
        EditButtons = <>
        FieldName = 'production_teamname'
        Footers = <>
        Width = 53
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOYEE_NAME'
        Footers = <>
        Width = 68
      end
      item
        EditButtons = <>
        FieldName = 'INV_PART_NUMBER'
        Footers = <>
        Width = 109
      end
      item
        EditButtons = <>
        FieldName = 'INV_NAME'
        Footers = <>
        Width = 126
      end
      item
        EditButtons = <>
        FieldName = 'INV_DESCRIPTION'
        Footers = <>
        Width = 243
      end
      item
        EditButtons = <>
        FieldName = 'UNIT_CODE'
        Footers = <>
        Width = 36
      end
      item
        EditButtons = <>
        FieldName = 'STD_QTY'
        Footers = <>
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'App_QTY'
        Footers = <>
        Width = 56
      end
      item
        EditButtons = <>
        FieldName = 'QUAN_ASSIGN'
        Footers = <>
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = 'Con_QTY'
        Footers = <>
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'QUAN_ON_HAND'
        Footers = <>
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'P_CODE'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'INV_PART_NUMBER_1'
        Footers = <>
        Title.Caption = #26367#20195#29289#26009#32534#21495
        Width = 92
      end
      item
        EditButtons = <>
        FieldName = 'INV_NAME_1'
        Footers = <>
        Title.Caption = #26367#20195#29289#26009#21517#31216
        Width = 113
      end
      item
        EditButtons = <>
        FieldName = 'INV_DESCRIPTION_1'
        Footers = <>
        Title.Caption = #26367#20195#29289#26009#35268#26684
        Width = 226
      end>
  end
  object DataSource1: TDataSource
    DataSet = cds_wzcp0492
    Left = 336
    Top = 208
  end
  object wzcp0492: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select  d17_1.INV_PART_NUMBER,d17_1.INV_NAME,d17_1.INV_DESCRIPTI' +
      'ON,d17_1.QUAN_ON_HAND,'#13#10'd17_1.QUAN_ON_HAND - d17_1.QUAN_ASSIGN D' +
      '17_QUAN_ASSIGN,'#13#10'data0002.UNIT_CODE,wzcp0494.part_name,wzcp0495.' +
      'P_CODE,wzcp0495.production_teamname,'#13#10'data0005.EMPLOYEE_NAME,d17' +
      '.INV_PART_NUMBER  ,d17.INV_NAME ,d17.INV_DESCRIPTION ,'#13#10'wzcp0492' +
      '.* '#13#10'from wzcp0492'#13#10'join data0017 d17_1 on wzcp0492.[D017_ptr] =' +
      ' d17_1.rkey'#13#10'join data0002 on d17_1.STOCK_UNIT_PTR = data0002.rk' +
      'ey'#13#10'left join wzcp0495 on wzcp0492.wzcp0495_ptr = wzcp0495.rkey'#13 +
      #10'left join wzcp0494 on wzcp0495.PARTBOM_PTR = wzcp0494.rkey'#13#10'lef' +
      't join data0005 on wzcp0494.user3_ptr = data0005.rkey'#13#10'LEFT JOIN' +
      ' Data0017 as d17 on WZCP0495.repl_invt_ptr=d17.rkey '
    CommandTimeout = 0
    Parameters = <>
    Left = 64
    Top = 208
    object wzcp0492INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      ProviderFlags = []
      ReadOnly = True
      Size = 25
    end
    object wzcp0492INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object wzcp0492INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      ProviderFlags = []
      ReadOnly = True
      Size = 70
    end
    object wzcp0492QUAN_ON_HAND: TBCDField
      DisplayLabel = #24403#21069#24211#23384
      FieldName = 'QUAN_ON_HAND'
      ProviderFlags = []
      ReadOnly = True
      Precision = 19
    end
    object wzcp0492D17_QUAN_ASSIGN: TBCDField
      DisplayLabel = #24635#24211#23384#26410#20998#37197
      FieldName = 'D17_QUAN_ASSIGN'
      ProviderFlags = []
      Precision = 10
    end
    object wzcp0492UNIT_CODE: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_CODE'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object wzcp0492Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object wzcp0492D492_ptr: TIntegerField
      FieldName = 'D492_ptr'
    end
    object wzcp0492D017_ptr: TIntegerField
      FieldName = 'D017_ptr'
    end
    object wzcp0492STD_QTY: TBCDField
      DisplayLabel = #26631#20934#29992#37327
      FieldName = 'STD_QTY'
      Precision = 12
    end
    object wzcp0492App_QTY: TBCDField
      DisplayLabel = #24050#30003#35831
      FieldName = 'App_QTY'
      Precision = 12
    end
    object wzcp0492Con_QTY: TBCDField
      DisplayLabel = #24050#39046#29992
      FieldName = 'Con_QTY'
      Precision = 12
    end
    object wzcp0492QUAN_ASSIGN: TBCDField
      DisplayLabel = #24050#20998#37197
      FieldName = 'QUAN_ASSIGN'
      Precision = 10
    end
    object wzcp0492part_name: TStringField
      FieldName = 'part_name'
      ProviderFlags = []
    end
    object wzcp0492P_CODE: TIntegerField
      FieldName = 'P_CODE'
      ProviderFlags = []
    end
    object wzcp0492production_teamname: TWideStringField
      FieldName = 'production_teamname'
      ProviderFlags = []
      Size = 10
    end
    object wzcp0492D148_PTR: TIntegerField
      FieldName = 'D148_PTR'
    end
    object wzcp0492EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      ProviderFlags = []
      Size = 16
    end
    object wzcp0492wzcp0495_ptr: TIntegerField
      FieldName = 'wzcp0495_ptr'
    end
    object strngfldwzcp0492INV_PART_NUMBER_1: TStringField
      FieldName = 'INV_PART_NUMBER_1'
      Size = 25
    end
    object strngfldwzcp0492INV_NAME_1: TStringField
      FieldName = 'INV_NAME_1'
      Size = 30
    end
    object strngfldwzcp0492INV_DESCRIPTION_1: TStringField
      FieldName = 'INV_DESCRIPTION_1'
      Size = 70
    end
  end
  object ds1: TADODataSet
    Connection = DM.ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    Left = 168
    Top = 264
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 400
    Top = 96
    object N1: TMenuItem
      Caption = #33258#21160#20998#37197
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21462#28040#20998#37197
      OnClick = N2Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Caption = #26597#30475#20998#37197#26126#32454
      OnClick = N3Click
    end
  end
  object ADO22: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey17'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0022.INVENTORY_PTR, dbo.Data0017.INV_PART_NUM' +
        'BER, dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION, '
      
        '                      dbo.Data0022.QUAN_on_hand , dbo.Data0022.Q' +
        'UAN_TO_BE_STOCKED, dbo.Data0022.QUAN_on_hand - dbo.Data0022.QUAN' +
        '_TO_BE_STOCKED AS ValQty, '
      
        '                      dbo.Data0022.RKEY, dbo.Data0456.CREATE_DAT' +
        'E, dbo.Data0456.GRN_NUMBER, dbo.Data0023.SUPPLIER_NAME, dbo.Data' +
        '0016.LOCATION, '
      
        '                      dbo.Data0002.UNIT_CODE, dbo.Data0022.EXPIR' +
        'E_DATE'
      'FROM         dbo.Data0016 INNER JOIN'
      '                      dbo.Data0022 INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR' +
        ' = dbo.Data0017.RKEY ON dbo.Data0016.RKEY = dbo.Data0022.LOCATIO' +
        'N_PTR INNER JOIN'
      '                      dbo.Data0002 ON '
      
        '                      dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002' +
        '.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo' +
        '.Data0456.RKEY FULL OUTER JOIN'
      
        '                      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = db' +
        'o.Data0023.RKEY'
      
        'WHERE     (dbo.Data0022.QUAN_on_hand - dbo.Data0022.QUAN_TO_BE_S' +
        'TOCKED > 0) and (dbo.Data0022.INVENTORY_PTR=:rkey17)'
      'order by Data0022.EXPIRE_DATE')
    Left = 176
    Top = 352
    object ADO22INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ADO22INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADO22INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADO22INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADO22QUAN_on_hand: TBCDField
      DisplayLabel = #24403#21069#24211#23384
      FieldName = 'QUAN_on_hand'
      Precision = 9
      Size = 3
    end
    object ADO22QUAN_TO_BE_STOCKED: TBCDField
      DisplayLabel = #24050#20998#37197#25968
      FieldName = 'QUAN_TO_BE_STOCKED'
      Precision = 9
      Size = 2
    end
    object ADO22ValQty: TBCDField
      DisplayLabel = #26377#25928#24211#23384
      FieldName = 'ValQty'
      ReadOnly = True
      Precision = 11
      Size = 3
    end
    object ADO22RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO22CREATE_DATE: TDateTimeField
      DisplayLabel = #20837#24211#26085#26399
      FieldName = 'CREATE_DATE'
    end
    object ADO22GRN_NUMBER: TStringField
      DisplayLabel = #20837#24211#21333#21495
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object ADO22SUPPLIER_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object ADO22LOCATION: TStringField
      DisplayLabel = #20179#24211
      FieldName = 'LOCATION'
      Size = 10
    end
    object ADO22UNIT_CODE: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object ADO22EXPIRE_DATE: TDateTimeField
      DisplayLabel = #26377#25928#26399
      FieldName = 'EXPIRE_DATE'
    end
  end
  object ADOCommand1: TADOCommand
    Connection = DM.ADOConnection1
    Parameters = <>
    Left = 160
    Top = 440
  end
  object dsp_wzcp0492: TDataSetProvider
    DataSet = wzcp0492
    Options = [poAllowCommandText]
    OnGetTableName = dsp_wzcp0492GetTableName
    Left = 152
    Top = 208
  end
  object cds_wzcp0492: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    CommandText = 
      'select  d17_1.INV_PART_NUMBER,d17_1.INV_NAME,d17_1.INV_DESCRIPTI' +
      'ON,d17_1.QUAN_ON_HAND,'#13#10'd17_1.QUAN_ON_HAND - d17_1.QUAN_ASSIGN D' +
      '17_QUAN_ASSIGN,'#13#10'data0002.UNIT_CODE,wzcp0494.part_name,wzcp0495.' +
      'P_CODE,wzcp0495.production_teamname,'#13#10'data0005.EMPLOYEE_NAME,d17' +
      '.INV_PART_NUMBER  ,d17.INV_NAME ,d17.INV_DESCRIPTION ,'#13#10'wzcp0492' +
      '.* '#13#10'from wzcp0492'#13#10'join data0017 d17_1 on wzcp0492.[D017_ptr] =' +
      ' d17_1.rkey'#13#10'join data0002 on d17_1.STOCK_UNIT_PTR = data0002.rk' +
      'ey'#13#10'left join wzcp0495 on wzcp0492.wzcp0495_ptr = wzcp0495.rkey'#13 +
      #10'left join wzcp0494 on wzcp0495.PARTBOM_PTR = wzcp0494.rkey'#13#10'lef' +
      't join data0005 on wzcp0494.user3_ptr = data0005.rkey'#13#10'LEFT JOIN' +
      ' Data0017 as d17 on WZCP0495.repl_invt_ptr=d17.rkey '
    Params = <>
    ProviderName = 'dsp_wzcp0492'
    BeforeClose = cds_wzcp0492BeforeClose
    OnFilterRecord = cds_wzcp0492FilterRecord
    OnReconcileError = cds_wzcp0492ReconcileError
    Left = 248
    Top = 168
    object cds_wzcp0492part_name: TStringField
      DisplayLabel = 'BOM'#21517#31216
      FieldName = 'part_name'
      ProviderFlags = []
    end
    object cds_wzcp0492INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      ProviderFlags = []
      ReadOnly = True
      Size = 25
    end
    object cds_wzcp0492INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object cds_wzcp0492INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      ProviderFlags = []
      ReadOnly = True
      Size = 70
    end
    object cds_wzcp0492QUAN_ON_HAND: TBCDField
      DisplayLabel = #24403#21069#24211#23384
      FieldName = 'QUAN_ON_HAND'
      ProviderFlags = []
      ReadOnly = True
      Precision = 19
    end
    object cds_wzcp0492QUAN_ASSIGN: TBCDField
      DisplayLabel = #24050#20998#37197
      FieldName = 'QUAN_ASSIGN'
      Precision = 10
    end
    object cds_wzcp0492UNIT_CODE: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_CODE'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object cds_wzcp0492Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object cds_wzcp0492D492_ptr: TIntegerField
      FieldName = 'D492_ptr'
    end
    object cds_wzcp0492D017_ptr: TIntegerField
      FieldName = 'D017_ptr'
    end
    object cds_wzcp0492STD_QTY: TBCDField
      DisplayLabel = #26631#20934#29992#37327
      FieldName = 'STD_QTY'
      Precision = 12
    end
    object cds_wzcp0492App_QTY: TBCDField
      DisplayLabel = #24050#30003#35831
      FieldName = 'App_QTY'
      Precision = 12
    end
    object cds_wzcp0492Con_QTY: TBCDField
      DisplayLabel = #24050#39046#29992
      FieldName = 'Con_QTY'
      Precision = 12
    end
    object cds_wzcp0492D17_QUAN_ASSIGN: TBCDField
      DisplayLabel = #24635#24211#23384#26410#20998#37197
      FieldName = 'D17_QUAN_ASSIGN'
      ProviderFlags = []
      Precision = 10
    end
    object cds_wzcp0492P_CODE: TIntegerField
      DisplayLabel = #37319#36141#20248#20808#32423
      FieldName = 'P_CODE'
      ProviderFlags = []
    end
    object cds_wzcp0492production_teamname: TWideStringField
      DisplayLabel = #29983#20135#29677#32452
      FieldName = 'production_teamname'
      ProviderFlags = []
      Size = 10
    end
    object cds_wzcp0492D148_PTR: TIntegerField
      FieldName = 'D148_PTR'
    end
    object cds_wzcp0492EMPLOYEE_NAME: TStringField
      DisplayLabel = #24037#31243#23457#26680#20154
      FieldName = 'EMPLOYEE_NAME'
      ProviderFlags = []
      Size = 16
    end
    object cds_wzcp0492wzcp0495_ptr: TIntegerField
      FieldName = 'wzcp0495_ptr'
    end
    object strngfld_wzcp0492INV_PART_NUMBER_1: TStringField
      FieldName = 'INV_PART_NUMBER_1'
      Size = 25
    end
    object strngfld_wzcp0492INV_NAME_1: TStringField
      FieldName = 'INV_NAME_1'
      Size = 30
    end
    object strngfld_wzcp0492INV_DESCRIPTION_1: TStringField
      FieldName = 'INV_DESCRIPTION_1'
      Size = 70
    end
  end
  object ADODataSet2: TADOQuery
    Connection = DM.ADOConnection1
    CommandTimeout = 0
    Parameters = <>
    Left = 520
    Top = 160
  end
  object qrytemp: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <>
    Left = 400
    Top = 328
  end
end
