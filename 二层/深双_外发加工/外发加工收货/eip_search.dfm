object Form_episearch: TForm_episearch
  Left = 277
  Top = 139
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22806#21457#21152#24037#30003#35831#26597#35810
  ClientHeight = 549
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 169
    Top = 11
    Width = 72
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #22806#21457#32534#21495
  end
  object lbl1: TLabel
    Left = 8
    Top = 496
    Width = 73
    Height = 13
    AutoSize = False
    Caption = #26412#21378#32534#21495#65306
  end
  object lbl2: TLabel
    Left = 78
    Top = 520
    Width = 107
    Height = 13
    AutoSize = False
    Caption = #36755#20837#21518#25353#22238#36710
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 247
    Top = 7
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 35
    Width = 624
    Height = 249
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'epiboly_number'
        Title.Color = clRed
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPT_NAME'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'warehouse_abbname'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ent_data'
        ReadOnly = False
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'remark'
        Title.Caption = #22791#27880
        Width = 100
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 213
    Top = 493
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 2
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 301
    Top = 493
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 289
    Width = 626
    Height = 196
    DataSource = DataSource2
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STANDARD'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rece_qty'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REQ_DATE'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REMARTK'
        Width = 87
        Visible = True
      end>
  end
  object edt1: TEdit
    Left = 77
    Top = 493
    Width = 108
    Height = 21
    TabOrder = 5
    OnKeyPress = edt1KeyPress
  end
  object Aqwz300: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltPessimistic
    AfterScroll = Aqwz300AfterScroll
    Parameters = <>
    SQL.Strings = (
      'SELECT WZDATA300.rkey, WZDATA300.epiboly_number,'
      '      Data0034.DEPT_NAME, Data0034.DEPT_CODE, Data0023.CODE,'
      '      Data0023.SUPPLIER_NAME, Data0023.ABBR_NAME,'
      '      Data0015.WAREHOUSE_CODE, Data0015.WAREHOUSE_NAME,'
      
        '      Data0015.ABBR_NAME AS warehouse_abbname, WZDATA300.ent_dat' +
        'a,'
      '      Data0005.EMPL_CODE, Data0005.EMPLOYEE_NAME,'
      
        '      WZDATA300.currency_ptr,WZDATA300.exch_rate,WZDATA300.supp_' +
        'ptr,'
      
        '      WZDATA300.TAX_cate,WZDATA300.pay_method,WZDATA300.status,W' +
        'ZDATA300.remark'
      'FROM Data0023 INNER JOIN'
      '      WZDATA300 ON Data0023.RKEY = WZDATA300.supp_ptr INNER JOIN'
      '      Data0034 ON WZDATA300.dept_ptr = Data0034.RKEY INNER JOIN'
      '      Data0015 ON'
      '      WZDATA300.warehouse_ptr = Data0015.RKEY INNER JOIN'
      '      Data0005 ON WZDATA300.empl_ptr = Data0005.RKEY INNER JOIN'
      '      Data0094 ON WZDATA300.auth_ptr = Data0094.RKEY'
      'where'
      '      WZDATA300.status =3')
    Left = 496
    Top = 468
    object Aqwz300rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object Aqwz300epiboly_number: TStringField
      DisplayLabel = #22806#21457#32534#21495
      FieldName = 'epiboly_number'
      Size = 15
    end
    object Aqwz300DEPT_NAME: TStringField
      DisplayLabel = #22806#21457#24037#24207
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object Aqwz300DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object Aqwz300CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object Aqwz300SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 40
    end
    object Aqwz300ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object Aqwz300WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object Aqwz300WAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object Aqwz300warehouse_abbname: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'warehouse_abbname'
      Size = 10
    end
    object Aqwz300ent_data: TDateTimeField
      DisplayLabel = #30003#35831#26085#26399
      FieldName = 'ent_data'
    end
    object Aqwz300EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object Aqwz300EMPLOYEE_NAME: TStringField
      DisplayLabel = #30003#35831#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object Aqwz300currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
    object Aqwz300exch_rate: TBCDField
      FieldName = 'exch_rate'
      Precision = 10
      Size = 8
    end
    object Aqwz300TAX_cate: TStringField
      FieldName = 'TAX_cate'
    end
    object Aqwz300pay_method: TStringField
      FieldName = 'pay_method'
      Size = 50
    end
    object Aqwz300status: TWordField
      FieldName = 'status'
    end
    object Aqwz300supp_ptr: TIntegerField
      FieldName = 'supp_ptr'
    end
    object Aqwz300remark: TStringField
      FieldName = 'remark'
      Size = 100
    end
  end
  object DataSource1: TDataSource
    DataSet = Aqwz300
    Left = 464
    Top = 468
  end
  object DataSource2: TDataSource
    DataSet = Aqwz301
    Left = 464
    Top = 500
  end
  object Aqwz301: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 2
      end>
    SQL.Strings = (
      'select wzdata301.*,'
      'wzdata301.RECEVIED_QTY+RETURN_QTY+'
      'wzdata301.reject_qty as rece_qty,'
      'data0025.MANU_PART_NUMBER,'
      'data0025.MANU_PART_DESC'
      'from'
      ' wzdata301 inner join data0025'
      'on wzdata301.CUSTPART_PTR=data0025.rkey'
      'where (wzdata301.EPIBOLY_PTR=:rkey)')
    Left = 496
    Top = 500
    object Aqwz301RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object Aqwz301EPIBOLY_PTR: TIntegerField
      FieldName = 'EPIBOLY_PTR'
    end
    object Aqwz301CUSTPART_PTR: TIntegerField
      FieldName = 'CUSTPART_PTR'
    end
    object Aqwz301QUANTITY: TIntegerField
      DisplayLabel = #22806#21457#25968#37327
      FieldName = 'QUANTITY'
    end
    object Aqwz301RECEVIED_QTY: TIntegerField
      DisplayLabel = #24050#25509#25910#25968#37327
      FieldName = 'RECEVIED_QTY'
    end
    object Aqwz301RETURN_QTY: TIntegerField
      FieldName = 'RETURN_QTY'
    end
    object Aqwz301rece_qty: TIntegerField
      DisplayLabel = #24050#25509#25910#25968#37327
      FieldName = 'rece_qty'
      ReadOnly = True
    end
    object Aqwz301UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
      Size = 10
    end
    object Aqwz301STANDARD: TStringField
      DisplayLabel = #35268#26684
      FieldName = 'STANDARD'
      Size = 30
    end
    object Aqwz301AREA_SQM: TBCDField
      FieldName = 'AREA_SQM'
      Precision = 6
    end
    object Aqwz301AREA_SQF: TBCDField
      FieldName = 'AREA_SQF'
      Precision = 6
    end
    object Aqwz301LAYER: TWordField
      FieldName = 'LAYER'
    end
    object Aqwz301THINK: TBCDField
      FieldName = 'THINK'
      Precision = 4
      Size = 2
    end
    object Aqwz301MIN_aperture: TBCDField
      FieldName = 'MIN_aperture'
      Precision = 5
      Size = 3
    end
    object Aqwz301REQ_DATE: TDateTimeField
      DisplayLabel = #35201#27714#26085#26399
      FieldName = 'REQ_DATE'
    end
    object Aqwz301REMARTK: TStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 10
      FieldName = 'REMARTK'
      Size = 50
    end
    object Aqwz301reject_qty: TIntegerField
      FieldName = 'reject_qty'
    end
    object Aqwz301MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object Aqwz301MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
  end
end
