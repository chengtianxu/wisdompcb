inherited frmRecInf_Mod280: TfrmRecInf_Mod280
  Caption = #25910#36135#20449#24687
  ClientHeight = 408
  ClientWidth = 732
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  ExplicitWidth = 740
  ExplicitHeight = 435
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 141
    Width = 732
    Height = 35
    Align = alTop
    BevelOuter = bvNone
    Caption = #20179#24211#25910#36135#20449#24687
    TabOrder = 0
    ExplicitTop = 147
  end
  object Dg71: TDBGrid
    Left = 0
    Top = 0
    Width = 732
    Height = 141
    Align = alTop
    DataSource = ds71
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Dg22: TDBGrid
    Left = 0
    Top = 176
    Width = 732
    Height = 269
    Align = alTop
    DataSource = ds22
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel2: TPanel
    Left = 0
    Top = 367
    Width = 732
    Height = 41
    Align = alBottom
    TabOrder = 3
    ExplicitTop = 272
    ExplicitWidth = 695
    object Button1: TButton
      Left = 299
      Top = 9
      Width = 75
      Height = 25
      Caption = #20851#38381
      ModalResult = 1
      TabOrder = 0
    end
  end
  object cds71: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = cds71AfterScroll
    Left = 456
    Top = 40
    object cds71PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object cds71INV_PART_NUMBER: TStringField
      DisplayLabel = #29289#26009#32534#21495
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object cds71INV_PART_DESCRIPTION: TStringField
      DisplayLabel = #29289#26009#25551#36848
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object cds71QUAN_ORD: TBCDField
      DisplayLabel = #37319#36141#25968#37327
      FieldName = 'QUAN_ORD'
      Precision = 13
    end
    object cds71QUAN_RECD: TBCDField
      DisplayLabel = #25910#36135#25968#37327
      FieldName = 'QUAN_RECD'
      Precision = 13
    end
    object cds71rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
  end
  object cds72: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    AfterScroll = cds72AfterScroll
    Left = 512
    Top = 40
    object cds72PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333#32534#21495
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object cds72DESCRIPTION: TStringField
      DisplayLabel = #29289#21697#21517#31216
      FieldName = 'DESCRIPTION'
      Size = 60
    end
    object cds72GUI_GE: TStringField
      DisplayLabel = #29289#21697#35268#26684
      FieldName = 'GUI_GE'
      Size = 200
    end
    object cds72QUAN_ORD: TFloatField
      DisplayLabel = #37319#36141#25968#37327
      FieldName = 'QUAN_ORD'
    end
    object cds72QUANTITY_RECEIVED: TFloatField
      DisplayLabel = #25910#36135#25968#37327
      FieldName = 'QUANTITY_RECEIVED'
    end
    object cds72rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
  end
  object cds22: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 448
    Top = 224
    object cds22GRN_NUMBER: TStringField
      DisplayLabel = #25910#36135#21333#21495
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object cds22TDATE: TDateTimeField
      DisplayLabel = #25509#25910#26085#26399
      FieldName = 'TDATE'
    end
    object cds22QUANTITY: TFloatField
      DisplayLabel = #25509#25910#25968#37327
      FieldName = 'QUANTITY'
    end
    object cds22WAREHOUSE_CODE: TStringField
      DisplayLabel = #23384#25918#24037#21378
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object cds22LOCATION: TStringField
      DisplayLabel = #23384#25918#20179#24211
      FieldName = 'LOCATION'
    end
    object cds22BARCODE_ID: TStringField
      DisplayLabel = #26465#24418#30721#32534#21495
      FieldName = 'BARCODE_ID'
      Size = 50
    end
    object cds22REF_NUMBER: TStringField
      DisplayLabel = #36865#36135#21333#21495
      FieldName = 'REF_NUMBER'
      Size = 100
    end
    object cds22EMPLOYEE_NAME: TStringField
      DisplayLabel = #25910#36135#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object cds235: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 224
    object cds235GRN_NUMBER: TStringField
      DisplayLabel = #25910#36135#21333#21495
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object cds235DATE_RECD: TDateTimeField
      DisplayLabel = #25509#25910#26085#26399
      FieldName = 'DATE_RECD'
    end
    object cds235QUAN_RECD: TBCDField
      DisplayLabel = #25509#25910#25968#37327
      FieldName = 'QUAN_RECD'
      Precision = 10
      Size = 3
    end
    object cds235REF_NUMBER: TStringField
      DisplayLabel = #36865#36135#21333#21495
      FieldName = 'REF_NUMBER'
      Size = 100
    end
    object cds235EMPLOYEE_NAME: TStringField
      DisplayLabel = #25910#36135#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object ds71: TDataSource
    Left = 336
    Top = 40
  end
  object ds22: TDataSource
    Left = 336
    Top = 216
  end
end
