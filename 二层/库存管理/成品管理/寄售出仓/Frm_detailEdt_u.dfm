object Frm_detailEdt: TFrm_detailEdt
  Left = 402
  Top = 199
  BorderStyle = bsSingle
  Caption = #20986#24211#36755#20837
  ClientHeight = 439
  ClientWidth = 764
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 266
    Top = 409
    Width = 75
    Height = 25
    Caption = #21457#25918
    TabOrder = 0
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 410
    Top = 409
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 1
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object Grd1: TDBGridEh
    Left = 0
    Top = 34
    Width = 764
    Height = 367
    Align = alTop
    DataSource = DataSource1
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    FooterRowCount = 1
    SumList.Active = True
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = Grd1KeyDown
    OnTitleClick = Grd1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'chk'
        Footers = <>
        Title.Alignment = taCenter
        Width = 31
      end
      item
        Color = clScrollBar
        EditButtons = <>
        FieldName = 'MANU_PART_NUMBER'
        Footers = <>
        Title.Alignment = taCenter
        Width = 84
      end
      item
        Color = clScrollBar
        EditButtons = <>
        FieldName = 'MANU_PART_DESC'
        Footers = <>
        Title.Alignment = taCenter
        Width = 110
      end
      item
        Color = clScrollBar
        EditButtons = <>
        FieldName = 'QTY_ON_HAND'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Alignment = taCenter
        Width = 52
      end
      item
        Color = clScrollBar
        EditButtons = <>
        FieldName = 'Price6'
        Footers = <>
        Title.Alignment = taCenter
        Width = 75
      end
      item
        EditButtons = <>
        FieldName = 'OutQty'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Alignment = taCenter
        Width = 61
      end
      item
        EditButtons = <>
        FieldName = 'OutPrice'
        Footers = <>
        Title.Alignment = taCenter
        Width = 114
      end
      item
        Color = clScrollBar
        EditButtons = <>
        FieldName = 'TAX_RATE'
        Footers = <>
        Width = 59
      end
      item
        Color = clScrollBar
        EditButtons = <>
        FieldName = 'analysis_code_2'
        Footers = <>
        Title.Alignment = taCenter
        Width = 126
      end
      item
        Color = clScrollBar
        EditButtons = <>
        FieldName = 'PO_NUMBER'
        Footers = <>
        Title.Alignment = taCenter
        Width = 106
      end
      item
        Color = clScrollBar
        EditButtons = <>
        FieldName = 'delivery_no'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #35013#31665#21333#21495
        Width = 81
      end
      item
        Color = clScrollBar
        EditButtons = <>
        FieldName = 'MFG_DATE'
        Footers = <>
        Title.Alignment = taCenter
        Width = 98
      end
      item
        Color = clScrollBar
        EditButtons = <>
        FieldName = 'SHIP_PTR'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #35760#24405#21495
        Width = 50
      end
      item
        Color = clScrollBar
        EditButtons = <>
        FieldName = 'REMARK'
        Footers = <>
        Title.Alignment = taCenter
        Width = 82
      end
      item
        EditButtons = <>
        FieldName = 'Note'
        Footers = <>
        Title.Alignment = taCenter
        Width = 94
      end
      item
        EditButtons = <>
        FieldName = 'ReferenceNum'
        Footers = <>
        Title.Alignment = taCenter
        Width = 97
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 764
    Height = 34
    Align = alTop
    TabOrder = 3
    object Label1: TLabel
      Left = 15
      Top = 11
      Width = 52
      Height = 13
      Caption = #26412#21378#32534#21495
    end
    object Edit1: TEdit
      Left = 80
      Top = 6
      Width = 143
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
  end
  object chk1: TCheckBox
    Left = 8
    Top = 408
    Width = 65
    Height = 17
    Caption = #20840#36873
    TabOrder = 4
    OnClick = chk1Click
  end
  object AQ153: TADOQuery
    Connection = DM.ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'CUSTOMER_PTR'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'sRkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select cast(0 as bit) as chk,data0153.*,data0025.MANU_PART_NUMBE' +
        'R,data0025.MANU_PART_DESC,data0025.analysis_code_2,Convert(Float' +
        ',data0153.PRICE) as Price6,data0439.delivery_no,'
      
        'OutQty=0,OutPrice=Convert(Float,data0153.PRICE),ReferenceNum=CAS' +
        'T('#39#39' as Varchar(15)),Note=CAST('#39#39' as Varchar(50))'
      
        'from data0153 inner join data0025 on data0153.CUSTPART_PTR=data0' +
        '025.rkey'
      'left join data0064 on data0153.SHIP_PTR=data0064.rkey'
      'left join data0439 on data0064.packing_list_ptr=data0439.rkey'
      'where data0153.CUSTOMER_PTR=:CUSTOMER_PTR '
      'and data0153.QTY_ON_HAND>0 and (not  data0153.rkey in (:sRkey) )'
      'order by data0025.MANU_PART_DESC,data0153.MFG_DATE')
    Left = 600
    Top = 96
    object AQ153chk: TBooleanField
      DisplayLabel = #36873#25321
      FieldName = 'chk'
    end
    object AQ153rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ153MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      DisplayWidth = 30
      FieldName = 'MANU_PART_NUMBER'
    end
    object AQ153analysis_code_2: TStringField
      DisplayLabel = #23458#25143#29289#26009#21495
      FieldName = 'analysis_code_2'
      Size = 50
    end
    object AQ153PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333#21495
      DisplayWidth = 20
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object AQ153MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      DisplayWidth = 30
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object AQ153MFG_DATE: TDateTimeField
      DisplayLabel = #20837#24211#26085#26399
      DisplayWidth = 20
      FieldName = 'MFG_DATE'
    end
    object AQ153QTY_ON_HAND: TIntegerField
      DisplayLabel = #24211#23384#25968
      DisplayWidth = 10
      FieldName = 'QTY_ON_HAND'
    end
    object AQ153REMARK: TStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 30
      FieldName = 'REMARK'
      Size = 100
    end
    object AQ153TAX_RATE: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'TAX_RATE'
      Precision = 5
      Size = 2
    end
    object AQ153PRICE: TBCDField
      FieldName = 'PRICE'
      Precision = 12
      Size = 6
    end
    object AQ153Price6: TFloatField
      DisplayLabel = #21333#20215
      FieldName = 'Price6'
      ReadOnly = True
    end
    object AQ153CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object AQ153CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object AQ153EXCH_RATE: TBCDField
      FieldName = 'EXCH_RATE'
      Precision = 12
      Size = 8
    end
    object AQ153EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object AQ153QUANTITY: TIntegerField
      FieldName = 'QUANTITY'
    end
    object AQ153CUSTPART_PTR: TIntegerField
      FieldName = 'CUSTPART_PTR'
    end
    object AQ153SHIP_PTR: TIntegerField
      FieldName = 'SHIP_PTR'
    end
    object AQ153delivery_no: TStringField
      FieldName = 'delivery_no'
      Size = 10
    end
    object AQ153OutQty: TIntegerField
      DisplayLabel = #21457#25918#25968#37327
      FieldName = 'OutQty'
    end
    object AQ153OutPrice: TFloatField
      DisplayLabel = #20837#24211#21333#20215'('#19981#21547#31246')'
      FieldName = 'OutPrice'
    end
    object AQ153ReferenceNum: TStringField
      DisplayLabel = #21442#32771#21495
      FieldName = 'ReferenceNum'
      Size = 15
    end
    object AQ153Note: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Note'
      Size = 50
    end
  end
  object DataSource1: TDataSource
    DataSet = cds153
    Left = 552
    Top = 96
  end
  object cds153: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    ProviderName = 'dsp153'
    AfterScroll = cds153AfterScroll
    Left = 600
    Top = 144
    object cds153chk: TBooleanField
      DisplayLabel = #36873#25321
      FieldName = 'chk'
      OnChange = cds153chkChange
    end
    object cds153rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object cds153MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      DisplayWidth = 30
      FieldName = 'MANU_PART_NUMBER'
      ReadOnly = True
    end
    object cds153analysis_code_2: TStringField
      DisplayLabel = #23458#25143#29289#26009#21495
      FieldName = 'analysis_code_2'
      ReadOnly = True
      Size = 50
    end
    object cds153PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333#21495
      DisplayWidth = 20
      FieldName = 'PO_NUMBER'
      ReadOnly = True
      Size = 25
    end
    object cds153MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      DisplayWidth = 30
      FieldName = 'MANU_PART_DESC'
      ReadOnly = True
      Size = 40
    end
    object cds153MFG_DATE: TDateTimeField
      DisplayLabel = #20837#24211#26085#26399
      DisplayWidth = 20
      FieldName = 'MFG_DATE'
      ReadOnly = True
    end
    object cds153QTY_ON_HAND: TIntegerField
      DisplayLabel = #24211#23384#25968
      FieldName = 'QTY_ON_HAND'
      ReadOnly = True
    end
    object cds153REMARK: TStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 30
      FieldName = 'REMARK'
      ReadOnly = True
      Size = 100
    end
    object cds153TAX_RATE: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'TAX_RATE'
      ReadOnly = True
      Precision = 5
      Size = 2
    end
    object cds153PRICE: TBCDField
      FieldName = 'PRICE'
      ReadOnly = True
      Precision = 12
      Size = 6
    end
    object cds153Price6: TFloatField
      DisplayLabel = #21333#20215
      FieldName = 'Price6'
      ReadOnly = True
    end
    object cds153CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
      ReadOnly = True
    end
    object cds153CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
      ReadOnly = True
    end
    object cds153EXCH_RATE: TBCDField
      FieldName = 'EXCH_RATE'
      ReadOnly = True
      Precision = 12
      Size = 8
    end
    object cds153EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
      ReadOnly = True
    end
    object cds153QUANTITY: TIntegerField
      FieldName = 'QUANTITY'
      ReadOnly = True
    end
    object cds153CUSTPART_PTR: TIntegerField
      FieldName = 'CUSTPART_PTR'
      ReadOnly = True
    end
    object cds153SHIP_PTR: TIntegerField
      FieldName = 'SHIP_PTR'
      ReadOnly = True
    end
    object cds153delivery_no: TStringField
      FieldName = 'delivery_no'
      ReadOnly = True
      Size = 10
    end
    object cds153OutQty: TIntegerField
      DisplayLabel = #21457#25918#25968#37327
      FieldName = 'OutQty'
      ReadOnly = True
      OnValidate = cds153OutQtyValidate
    end
    object cds153OutPrice: TFloatField
      DisplayLabel = #20837#24211#21333#20215'('#19981#21547#31246')'
      FieldName = 'OutPrice'
      ReadOnly = True
    end
    object cds153ReferenceNum: TStringField
      DisplayLabel = #21442#32771#21495
      FieldName = 'ReferenceNum'
      ReadOnly = True
      Size = 15
    end
    object cds153Note: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Note'
      ReadOnly = True
      Size = 50
    end
  end
  object dsp153: TDataSetProvider
    DataSet = AQ153
    Left = 552
    Top = 144
  end
end
