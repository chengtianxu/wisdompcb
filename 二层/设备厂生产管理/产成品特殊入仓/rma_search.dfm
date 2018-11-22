object Form3: TForm3
  Left = 206
  Top = 125
  Width = 732
  Height = 508
  Caption = #24453#20837#20179#36864#36135#21333#25628#32034
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 724
    Height = 399
    Align = alClient
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
        FieldName = 'rma_number'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rma_date'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTY_AUTH'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qty_recd'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sales_order'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'customer_part_number'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUSTOMER_PART_DESC'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cp_rev'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rma_type'
        ReadOnly = False
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'status'
        ReadOnly = False
        Width = 54
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 440
    Width = 724
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      724
      41)
    object Button1: TButton
      Left = 269
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 359
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 724
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 192
      Top = 14
      Width = 121
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #36864#36135#21333#21495
    end
    object Edit1: TEdit
      Left = 319
      Top = 10
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
      OnKeyDown = DBGrid1KeyDown
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    SQL.Strings = (
      
        'select data0098.rma_number,data0098.rma_date,data0098.QTY_AUTH,d' +
        'ata0098.qty_recd,'
      
        ' data0098.RMA_STATUS,data0098.rkey,data0098.customer_ptr,data009' +
        '8.customer_part_ptr,'
      ' data0060.sales_order,data0098.shipment_ptr,data0098.so_ptr,'
      ' data0010.abbr_name,data0050.CUSTOMER_PART_DESC,'
      ' data0050.customer_part_number,data0050.cp_rev'
      'from data0098 left outer join data0060'
      ' on data0098.SO_PTR=data0060.rkey inner join data0010'
      ' on data0098.customer_ptr=data0010.rkey inner join data0050'
      ' on data0098.customer_part_ptr=data0050.rkey'
      'where data0098.rma_status=2'
      ''
      'order by rma_number')
    Left = 610
    Top = 439
    object ADOQuery1rma_number: TStringField
      DisplayLabel = #36864#36135#21333#21495
      FieldName = 'rma_number'
      FixedChar = True
      Size = 10
    end
    object ADOQuery1rma_date: TDateTimeField
      DisplayLabel = #36864#36135#26085#26399
      FieldName = 'rma_date'
    end
    object ADOQuery1QTY_AUTH: TIntegerField
      DisplayLabel = #36864#36135#25968#37327
      FieldName = 'QTY_AUTH'
    end
    object ADOQuery1qty_recd: TIntegerField
      DisplayLabel = #20837#20179#25968#37327
      FieldName = 'qty_recd'
    end
    object ADOQuery1so_ptr: TIntegerField
      FieldName = 'so_ptr'
    end
    object ADOQuery1RMA_STATUS: TSmallintField
      FieldName = 'RMA_STATUS'
    end
    object ADOQuery1rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1customer_ptr: TIntegerField
      FieldName = 'customer_ptr'
    end
    object ADOQuery1customer_part_ptr: TIntegerField
      FieldName = 'customer_part_ptr'
    end
    object ADOQuery1sales_order: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'sales_order'
      FixedChar = True
      Size = 12
    end
    object ADOQuery1shipment_ptr: TIntegerField
      FieldName = 'shipment_ptr'
    end
    object ADOQuery1customer_part_number: TStringField
      DisplayLabel = #26412#21378#32534#21495
      DisplayWidth = 10
      FieldName = 'customer_part_number'
    end
    object ADOQuery1cp_rev: TStringField
      DisplayLabel = #29256#26412
      FieldName = 'cp_rev'
      FixedChar = True
      Size = 5
    end
    object ADOQuery1rma_type: TStringField
      DisplayLabel = #31867#22411
      FieldKind = fkCalculated
      FieldName = 'rma_type'
      Size = 6
      Calculated = True
    end
    object ADOQuery1status: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkCalculated
      FieldName = 'status'
      Size = 6
      Calculated = True
    end
    object ADOQuery1abbr_name: TStringField
      DisplayLabel = #23458#25143
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADOQuery1CUSTOMER_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'CUSTOMER_PART_DESC'
      Size = 40
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 576
    Top = 440
  end
end
