object Form_lotmb3: TForm_lotmb3
  Left = 296
  Top = 166
  Width = 770
  Height = 516
  Caption = #21046#36896#36153#29992#35745#31639#26126#32454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 142
    Width = 754
    Height = 2
    Cursor = crVSplit
    Align = alTop
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 754
    Height = 101
    Align = alTop
    DataSource = DataSource21
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'yield_sqft'
        Footers = <>
        ReadOnly = True
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'yield_sqft_wf'
        Footers = <>
        Width = 91
      end
      item
        EditButtons = <>
        FieldName = 'OVHD_1'
        Footers = <>
        ReadOnly = True
        Width = 89
      end
      item
        EditButtons = <>
        FieldName = 'OVHD_2'
        Footers = <>
        ReadOnly = True
        Width = 85
      end
      item
        EditButtons = <>
        FieldName = 'OVHD_3'
        Footers = <>
        ReadOnly = True
        Width = 84
      end
      item
        EditButtons = <>
        FieldName = 'OVHD_4'
        Footers = <>
        ReadOnly = True
        Width = 89
      end
      item
        EditButtons = <>
        FieldName = 'OVHD_5'
        Footers = <>
        ReadOnly = True
        Width = 87
      end>
  end
  object DBGridEh2: TDBGridEh
    Left = 0
    Top = 144
    Width = 754
    Height = 334
    Align = alClient
    DataSource = DataSource22
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh2KeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'WORK_ORDER_NUMBER'
        Footer.Value = #21512#35745
        Footer.ValueType = fvtStaticText
        Footers = <>
        ReadOnly = True
        Width = 130
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_NUMBER'
        Footers = <>
        Width = 107
      end
      item
        EditButtons = <>
        FieldName = 'manu_part_desc'
        Footers = <>
        Width = 92
      end
      item
        EditButtons = <>
        FieldName = 'QTY_PROD'
        Footers = <>
        ReadOnly = True
      end
      item
        EditButtons = <>
        FieldName = 'PARAMETER_VALUE'
        Footers = <>
        ReadOnly = True
      end
      item
        EditButtons = <>
        FieldName = 'sc_sqft'
        Footer.ValueType = fvtSum
        Footers = <>
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 754
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 65
      Height = 13
      Caption = #21333#21482#38754#31215#65306
    end
    object Label2: TLabel
      Left = 79
      Top = 17
      Width = 42
      Height = 13
      Caption = 'Label2'
    end
    object BitBtn1: TBitBtn
      Left = 416
      Top = 8
      Width = 75
      Height = 25
      Caption = #36864#20986
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 232
      Top = 9
      Width = 89
      Height = 24
      Caption = #23548#20986'EXCEL'
      Default = True
      TabOrder = 1
      OnClick = BitBtn2Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
        EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
        DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
        70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
    end
  end
  object DataSource21: TDataSource
    DataSet = dm.ADOS_21
    Left = 56
    Top = 88
  end
  object DataSource22: TDataSource
    DataSet = ADOS_22
    Left = 64
    Top = 224
  end
  object ADOS_22: TADODataSet
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT Data0025.MANU_PART_NUMBER, data0025.manu_part_desc,'#13#10'    ' +
      '       Data0006.WORK_ORDER_NUMBER, '#13#10'           data0410.QTY AS ' +
      'QTY_PROD, '#13#10'data0410.unit_sq AS PARAMETER_VALUE, '#13#10'           da' +
      'ta0410.QTY*data0410.unit_sq as sc_sqft'#13#10'    FROM data0410 INNER ' +
      'JOIN'#13#10'      Data0006 ON data0410.WO_PTR = Data0006.RKEY INNER JO' +
      'IN'#13#10'      Data0025 ON Data0006.BOM_PTR = Data0025.RKEY'#13#10'    WHER' +
      'E (data0410.DEPT_PTR = :vdept_ptr) and'#13#10'          (data0410.d045' +
      '1_ptr=:d451) and'#13#10'          (data0410.warehouse_ptr=:warehouse_p' +
      'tr) '
    IndexFieldNames = 'WORK_ORDER_NUMBER'
    Parameters = <
      item
        Name = 'vdept_ptr'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 80
      end
      item
        Name = 'd451'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 180
      end
      item
        Name = 'warehouse_ptr'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 1
      end>
    Prepared = True
    Left = 96
    Top = 224
    object ADOS_22MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOS_22manu_part_desc: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'manu_part_desc'
      Size = 80
    end
    object ADOS_22WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20316#19994#21333#21495
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ADOS_22QTY_PROD: TIntegerField
      DisplayLabel = #29983#20135#25968#37327'PCS'
      FieldName = 'QTY_PROD'
    end
    object ADOS_22PARAMETER_VALUE: TFloatField
      DisplayLabel = #21333#21482#38754#31215
      FieldName = 'PARAMETER_VALUE'
    end
    object ADOS_22sc_sqft: TFloatField
      DisplayLabel = #29983#20135#38754#31215
      FieldName = 'sc_sqft'
      ReadOnly = True
    end
  end
end
