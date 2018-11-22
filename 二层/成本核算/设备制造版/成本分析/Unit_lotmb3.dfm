object Form_lotmb3: TForm_lotmb3
  Left = 214
  Top = 124
  Width = 722
  Height = 516
  Caption = #21046#36896#36153#29992#35745#31639#26126#32454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 142
    Width = 714
    Height = 2
    Cursor = crVSplit
    Align = alTop
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 714
    Height = 101
    Align = alTop
    DataSource = DataSource21
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
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
        FieldName = 'STD_OVHD_1'
        Footers = <>
        ReadOnly = True
        Width = 89
      end
      item
        EditButtons = <>
        FieldName = 'STD_OVHD_2'
        Footers = <>
        ReadOnly = True
        Width = 87
      end
      item
        EditButtons = <>
        FieldName = 'STD_OVHD_3'
        Footers = <>
        ReadOnly = True
        Width = 97
      end>
  end
  object DBGridEh2: TDBGridEh
    Left = 0
    Top = 144
    Width = 714
    Height = 342
    Align = alClient
    DataSource = DataSource22
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'work_order_number'
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
        FieldName = 'OVERHEAD1_PER_SQFT'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = True
        Width = 98
      end
      item
        EditButtons = <>
        FieldName = 'OVERHEAD2_PER_SQFT'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = True
        Width = 102
      end
      item
        EditButtons = <>
        FieldName = 'OVERHEAD3_PER_SQFT'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = True
        Width = 102
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 714
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
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
    DataSet = ADOS_21
    Left = 64
    Top = 72
  end
  object DataSource22: TDataSource
    DataSet = ADOS_22
    Left = 64
    Top = 224
  end
  object ADOS_21: TADOStoredProc
    Connection = DM.Conn
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'wzcx090;21'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@vdept_ptr'
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@vd451ptr'
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@vtype'
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@warehouse_ptr'
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 98
    Top = 72
    object ADOS_21RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOS_21D0451_PTR: TIntegerField
      FieldName = 'D0451_PTR'
    end
    object ADOS_21DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADOS_21OVHD_1: TBCDField
      DisplayLabel = #23454#38469#36153#29992'1'
      FieldName = 'OVHD_1'
      Precision = 18
      Size = 2
    end
    object ADOS_21OVHD_2: TBCDField
      DisplayLabel = #23454#38469#36153#29992'2'
      FieldName = 'OVHD_2'
      Precision = 18
      Size = 2
    end
    object ADOS_21OVHD_3: TBCDField
      DisplayLabel = #23454#38469#36153#29992'3'
      FieldName = 'OVHD_3'
      Precision = 18
      Size = 2
    end
    object ADOS_21yield_sqft: TBCDField
      DisplayLabel = #20135#20986#38754#31215
      FieldName = 'yield_sqft'
      Precision = 19
    end
    object ADOS_21yield_amount: TBCDField
      DisplayLabel = #20135#20986#37329#39069
      FieldName = 'yield_amount'
      Precision = 19
    end
    object ADOS_21STD_OVHD_1: TBCDField
      DisplayLabel = #26631#20934#36153#29992'1'
      FieldName = 'STD_OVHD_1'
      Precision = 18
      Size = 2
    end
    object ADOS_21STD_OVHD_2: TBCDField
      DisplayLabel = #26631#20934#36153#29992'2'
      FieldName = 'STD_OVHD_2'
      Precision = 18
      Size = 2
    end
    object ADOS_21STD_OVHD_3: TBCDField
      DisplayLabel = #26631#20934#36153#29992'3'
      FieldName = 'STD_OVHD_3'
      Precision = 18
      Size = 2
    end
  end
  object ADOS_22: TADOStoredProc
    Connection = DM.Conn
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'wzcx090;22'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@vdept_ptr'
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@d451'
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@vtype'
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@warehouse_ptr'
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 98
    Top = 223
    object ADOS_22work_order_number: TStringField
      DisplayLabel = #20316#19994#21333#21495
      FieldName = 'work_order_number'
      Size = 22
    end
    object ADOS_22QTY_PROD: TIntegerField
      DisplayLabel = #20135#20986#25968#37327
      FieldName = 'QTY_PROD'
    end
    object ADOS_22PARAMETER_VALUE: TFloatField
      DisplayLabel = #21333#20803#38754#31215
      FieldName = 'PARAMETER_VALUE'
    end
    object ADOS_22OVERHEAD_PER_SQFT: TFloatField
      DisplayLabel = #27599#24179#31859#26631#20934#36153#29992'1'
      FieldName = 'OVERHEAD1_PER_SQFT'
    end
    object ADOS_22OVERHEAD2_PER_SQFT: TFloatField
      DisplayLabel = #27599#24179#31859#26631#20934#36153#29992'2'
      FieldName = 'OVERHEAD2_PER_SQFT'
    end
    object ADOS_22OVERHEAD3_PER_SQFT: TFloatField
      DisplayLabel = #27599#24179#31859#26631#20934#36153#29992'3'
      FieldName = 'OVERHEAD3_PER_SQFT'
    end
    object ADOS_22MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOS_22manu_part_desc: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'manu_part_desc'
      Size = 40
    end
  end
end
