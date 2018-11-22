object Form_lotmb2: TForm_lotmb2
  Left = 223
  Top = 138
  Width = 751
  Height = 598
  Caption = #26448#26009#25104#26412#35745#31639#26126#32454
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
    Top = 386
    Width = 735
    Height = 8
    Cursor = crVSplit
    Align = alBottom
    Color = clActiveCaption
    ParentColor = False
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 57
    Width = 735
    Height = 329
    Align = alClient
    DataSource = DataSource19
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    PopupMenu = PopupMenu1
    SumList.Active = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'inv_part_number'
        Footers = <>
        Width = 127
      end
      item
        EditButtons = <>
        FieldName = 'inv_part_description'
        Footer.Value = #21512#35745
        Footer.ValueType = fvtStaticText
        Footers = <>
        Width = 159
      end
      item
        EditButtons = <>
        FieldName = 'quantity'
        Footers = <>
        ReadOnly = True
        Width = 107
      end
      item
        EditButtons = <>
        FieldName = 'actual_cost'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 123
      end
      item
        EditButtons = <>
        FieldName = 'OPEN_QUANTITY'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'OPEN_AMOUNT'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'CLOSED_QTY'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'CLOSED_AMOUNT'
        Footer.ValueType = fvtSum
        Footers = <>
      end>
  end
  object DBGridEh2: TDBGridEh
    Left = 0
    Top = 394
    Width = 735
    Height = 166
    Align = alBottom
    DataSource = DataSource20
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    PopupMenu = PopupMenu2
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'WORK_ORDER_NUMBER'
        Footers = <>
        ReadOnly = True
        Width = 112
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_CODE'
        Footer.Value = #21512#35745
        Footer.ValueType = fvtStaticText
        Footers = <>
        ReadOnly = True
        Width = 37
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_NUMBER'
        Footers = <>
        ReadOnly = True
        Width = 98
      end
      item
        EditButtons = <>
        FieldName = 'manu_part_desc'
        Footers = <>
        Width = 130
      end
      item
        EditButtons = <>
        FieldName = 'QTY_PROD'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = True
        Width = 66
      end
      item
        EditButtons = <>
        FieldName = 'PARAMETER_VALUE'
        Footers = <>
        ReadOnly = True
        Width = 69
      end
      item
        Alignment = taLeftJustify
        EditButtons = <>
        FieldName = 'MATL_PER_SQFT_1'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = True
        Width = 94
      end
      item
        Alignment = taLeftJustify
        EditButtons = <>
        FieldName = 'MATL_PER_SQFT_2'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = True
        Width = 97
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 735
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      735
      57)
    object Label9: TLabel
      Left = 5
      Top = 7
      Width = 72
      Height = 13
      Anchors = []
      Caption = #24635#23454#38469#25104#26412':'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 382
      Top = 7
      Width = 46
      Height = 13
      Anchors = []
      Caption = #24635#20135#20986':'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 174
      Top = 8
      Width = 111
      Height = 13
      Anchors = []
      Caption = #19968#31867#26448#26009#26631#20934#25104#26412':'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 526
      Top = 8
      Width = 111
      Height = 13
      Anchors = []
      Caption = #20108#31867#26448#26009#26631#20934#25104#26412':'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 36
      Width = 42
      Height = 13
      Caption = 'Label4'
    end
    object Label5: TLabel
      Left = 440
      Top = 36
      Width = 42
      Height = 13
      Caption = 'Label5'
    end
    object BitBtn1: TBitBtn
      Left = 818
      Top = 4
      Width = 89
      Height = 23
      Anchors = []
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
    object Edit1: TEdit
      Left = 82
      Top = 5
      Width = 89
      Height = 21
      Anchors = []
      TabOrder = 1
    end
    object Edit2: TEdit
      Left = 434
      Top = 3
      Width = 89
      Height = 21
      Anchors = []
      TabOrder = 2
    end
    object Edit3: TEdit
      Left = 285
      Top = 6
      Width = 89
      Height = 21
      Anchors = []
      TabOrder = 3
    end
    object Edit4: TEdit
      Left = 637
      Top = 6
      Width = 89
      Height = 21
      Anchors = []
      TabOrder = 4
    end
    object BitBtn2: TBitBtn
      Left = 818
      Top = 29
      Width = 89
      Height = 22
      Anchors = []
      Caption = #23548#20986'EXCEL'
      Default = True
      TabOrder = 5
      Visible = False
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
    object BitBtn3: TBitBtn
      Left = 642
      Top = 29
      Width = 75
      Height = 25
      Anchors = [akTop]
      Cancel = True
      Caption = #20851#38381
      ModalResult = 1
      TabOrder = 6
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        0400000000007800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
        FFFFFFFF00FFFFFFFFFFFFF030FFFFFFFFFFFF0330FFFFFFFFFF003330000000
        0FFFF03330FF0FFFFFFFF03300FF0FFFF4FFF03330FF0FFF44FFF03330FF0FF4
        4444F03330FF0F444444F03330FF0FF44444F0330FFF0FFF44FFF030FFFF0FFF
        F4FFF00FFFFF0FFFFFFFF00000000FFFFFFF}
    end
  end
  object DataSource19: TDataSource
    DataSet = ADOS_19
    Left = 88
    Top = 80
  end
  object DataSource20: TDataSource
    DataSet = ADOS_20
    Left = 8
    Top = 336
  end
  object PopupMenu1: TPopupMenu
    Left = 88
    Top = 112
    object Excel1: TMenuItem
      Caption = #23548#20986'Excel'
      OnClick = Excel1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 280
    Top = 296
    object Excel2: TMenuItem
      Caption = #23548#20986'Excel'
      OnClick = Excel2Click
    end
  end
  object ADOS_19: TADOStoredProc
    Connection = DM.Conn
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'wzcx090;19'
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
        Name = '@OVHD_MTAL_1'
        DataType = ftString
        Direction = pdInputOutput
        Size = 20
        Value = Null
      end
      item
        Name = '@yield_sqft'
        DataType = ftString
        Direction = pdInputOutput
        Size = 20
        Value = Null
      end
      item
        Name = '@STD_MTAL_1'
        DataType = ftString
        Direction = pdInputOutput
        Size = 20
        Value = Null
      end
      item
        Name = '@STD_MTAL_2'
        DataType = ftString
        Direction = pdInputOutput
        Size = 20
        Value = Null
      end
      item
        Name = '@warehouse_ptr'
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 122
    Top = 78
    object ADOS_19inv_part_number: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'inv_part_number'
      Size = 25
    end
    object ADOS_19inv_part_description: TStringField
      DisplayLabel = #26448#26009#25551#36848
      FieldName = 'inv_part_description'
      ReadOnly = True
      Size = 100
    end
    object ADOS_19quantity: TBCDField
      DisplayLabel = #21457#25918#25968#37327
      FieldName = 'quantity'
      Precision = 19
    end
    object ADOS_19actual_cost: TFloatField
      DisplayLabel = #21457#25918#37329#39069
      FieldName = 'actual_cost'
      ReadOnly = True
    end
    object ADOS_19OPEN_QUANTITY: TFloatField
      DisplayLabel = #26399#21021#25968#37327
      FieldName = 'OPEN_QUANTITY'
    end
    object ADOS_19OPEN_AMOUNT: TBCDField
      DisplayLabel = #26399#21021#25104#26412
      FieldName = 'OPEN_AMOUNT'
      Precision = 18
      Size = 2
    end
    object ADOS_19CLOSED_QTY: TFloatField
      DisplayLabel = #26399#26410#25968#37327
      FieldName = 'CLOSED_QTY'
    end
    object ADOS_19CLOSED_AMOUNT: TBCDField
      DisplayLabel = #26399#26410#25104#26412
      FieldName = 'CLOSED_AMOUNT'
      Precision = 18
      Size = 2
    end
  end
  object ADOS_20: TADOStoredProc
    Connection = DM.Conn
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'wzcx090;20'
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
    Left = 42
    Top = 334
    object ADOS_20DEPT_CODE: TStringField
      DisplayLabel = #24037#24207
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADOS_20MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOS_20WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20316#19994#21333#21495
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ADOS_20QTY_PROD: TIntegerField
      DisplayLabel = #20135#20986#25968#37327
      FieldName = 'QTY_PROD'
    end
    object ADOS_20PARAMETER_VALUE: TFloatField
      DisplayLabel = #21333#20803#38754#31215
      FieldName = 'PARAMETER_VALUE'
    end
    object ADOS_20MATL_PER_SQFT_1: TFloatField
      DisplayLabel = #27599#24179#31859#19968#31867#26448#26009
      FieldName = 'MATL_PER_SQFT_1'
    end
    object ADOS_20MATL_PER_SQFT_2: TFloatField
      DisplayLabel = #27599#24179#31859#20108#31867#26448#26009
      FieldName = 'MATL_PER_SQFT_2'
    end
    object ADOS_20manu_part_desc: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'manu_part_desc'
      Size = 40
    end
  end
end
