object frmQnty: TfrmQnty
  Left = 376
  Top = 268
  Width = 605
  Height = 465
  Caption = #21512#25340'Set'#25968#37327
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 589
    Height = 386
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 0
      Top = 41
      Width = 589
      Height = 345
      Align = alClient
      AllowedOperations = [alopUpdateEh]
      DataSource = DataSource1
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'MANU_PART_NUMBER'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #26412#21378#32534#21495
          Width = 116
        end
        item
          EditButtons = <>
          FieldName = 'ANALYSIS_CODE_1'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #20132#36135#23610#23544
          Width = 113
        end
        item
          EditButtons = <>
          FieldName = 'PARTS_ORDERED'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #35746#21333#25968#37327
          Width = 79
        end
        item
          EditButtons = <>
          FieldName = 'spell_qty'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'PCS/SET'
          Width = 81
        end
        item
          DisplayFormat = '#0.0'
          EditButtons = <>
          FieldName = 'Rate'
          Footers = <>
          ReadOnly = True
          Width = 62
        end
        item
          EditButtons = <>
          FieldName = 'SetQty'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = 'SET'#25968#37327
          Width = 87
        end>
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 589
      Height = 41
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 32
        Top = 16
        Width = 72
        Height = 13
        Caption = #26032#20135#21697#32534#21495#65306
      end
      object lbl1: TLabel
        Left = 347
        Top = 16
        Width = 32
        Height = 13
        Caption = #20493#25968
      end
      object edtProdNo: TEdit
        Left = 125
        Top = 9
        Width = 121
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object edtRate: TEdit
        Left = 384
        Top = 12
        Width = 41
        Height = 21
        TabOrder = 2
        Text = '1'
        OnKeyPress = edtRateKeyPress
      end
      object btnAdd: TBitBtn
        Left = 455
        Top = 9
        Width = 81
        Height = 25
        Caption = #25353#20493#25968#22686#21152
        TabOrder = 1
        OnClick = btnAddClick
      end
      object ud1: TUpDown
        Left = 425
        Top = 12
        Width = 16
        Height = 21
        Associate = edtRate
        Position = 1
        TabOrder = 3
      end
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 386
    Width = 589
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 589
      Height = 41
      Align = alBottom
      TabOrder = 0
      object btnOK: TBitBtn
        Left = 189
        Top = 8
        Width = 75
        Height = 25
        Caption = #30830#23450
        Default = True
        TabOrder = 0
        OnClick = btnOKClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object btnCancel: TBitBtn
        Left = 325
        Top = 8
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 1
        Kind = bkCancel
      end
    end
  end
  object cdsOrder: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'RKEY25'
        DataType = ftInteger
      end
      item
        Name = 'RKEY60'
        DataType = ftInteger
      end
      item
        Name = 'SetQty'
        DataType = ftInteger
      end
      item
        Name = 'MANU_PART_NUMBER'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PARTS_ORDERED'
        DataType = ftFloat
      end
      item
        Name = 'spell_qty'
        DataType = ftInteger
      end
      item
        Name = 'ANALYSIS_CODE_1'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Rate'
        DataType = ftCurrency
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'Rate'
    Params = <>
    StoreDefs = True
    Left = 120
    Top = 80
    Data = {
      D90000009619E0BD010000001800000008000000000003000000D90006524B45
      593235040001000000000006524B455936300400010000000000065365745174
      790400010000000000104D414E555F504152545F4E554D424552010049000000
      01000557494454480200020014000D50415254535F4F52444552454408000400
      00000000097370656C6C5F71747904000100000000000F414E414C595349535F
      434F44455F310100490000000100055749445448020002001E00045261746508
      0004000000010007535542545950450200490006004D6F6E6579000000}
    object cdsOrderRKEY25: TIntegerField
      FieldName = 'RKEY25'
    end
    object cdsOrderRKEY60: TIntegerField
      FieldName = 'RKEY60'
    end
    object cdsOrderSetQty: TIntegerField
      FieldName = 'SetQty'
    end
    object cdsOrderMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object cdsOrderPARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
    end
    object cdsOrderspell_qty: TIntegerField
      FieldName = 'spell_qty'
    end
    object cdsOrderANALYSIS_CODE_1: TStringField
      FieldName = 'ANALYSIS_CODE_1'
      Size = 30
    end
    object cdsOrderRate: TCurrencyField
      DisplayLabel = #22522#30784#27604#20363
      FieldName = 'Rate'
      currency = False
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsOrder
    Left = 184
    Top = 80
  end
  object aspCompare38: TADOStoredProc
    Connection = DM.con1
    ProcedureName = 'Compare_38;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@rkey25'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@rkey25_new'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 32
    Top = 72
  end
  object cdsUpdate: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 128
    Data = {
      940000009619E0BD010000001800000006000000000003000000940006524B45
      593235040001000000000006524B455936300400010000000000065365745174
      790400010000000000104D414E555F504152545F4E554D424552010049000000
      01000557494454480200020014000D50415254535F4F52444552454408000400
      00000000097370656C6C5F71747904000100000000000000}
    object IntegerField1: TIntegerField
      FieldName = 'RKEY25'
    end
    object IntegerField2: TIntegerField
      FieldName = 'RKEY60'
    end
    object IntegerField3: TIntegerField
      FieldName = 'SetQty'
    end
    object StringField2: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
  end
end
