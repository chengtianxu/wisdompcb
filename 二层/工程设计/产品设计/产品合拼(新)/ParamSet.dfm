object frmParamSet: TfrmParamSet
  Left = 267
  Top = 192
  Width = 837
  Height = 576
  Caption = #21512#25340#21442#25968#35774#32622
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 821
    Height = 42
    Align = alTop
    TabOrder = 0
    object btnRefresh: TBitBtn
      Left = 4
      Top = 2
      Width = 75
      Height = 29
      Hint = #21047#26032#24403#21069#25968#25454
      Caption = #21047#26032
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnRefreshClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADABFBFBDADADADADADDADADBFADADADADAADADAD000DADADADDADAD0FBF0DA
        DADAADAD0F7FBF0DADADDAD0F7F87BF0DADAAD0F7F87BFB70DADD0F7F87BFB78
        80DA000F87BFB78880ADDAD00BFB78880ADAADADA0B7888740ADDADADA088804
        440AADADADA000A04440DADADADADADA0440ADADADADADADA00D}
    end
    object btnAppend: TBitBtn
      Left = 78
      Top = 2
      Width = 75
      Height = 29
      Caption = #26032#22686
      TabOrder = 1
      OnClick = btnAppendClick
    end
    object btnDelete: TBitBtn
      Left = 152
      Top = 2
      Width = 75
      Height = 29
      Caption = #21024#38500
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object btnSave: TBitBtn
      Left = 226
      Top = 2
      Width = 75
      Height = 29
      Caption = #20445#23384
      TabOrder = 3
      OnClick = btnSaveClick
    end
    object btnCancel: TBitBtn
      Left = 300
      Top = 2
      Width = 75
      Height = 29
      Caption = #21462#28040
      TabOrder = 4
      OnClick = btnCancelClick
    end
    object btnExit: TBitBtn
      Left = 374
      Top = 2
      Width = 75
      Height = 29
      Cursor = crHandPoint
      Hint = #36864#20986
      Caption = #36864#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = btnExitClick
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
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 42
    Width = 821
    Height = 496
    Align = alClient
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
        FieldName = 'SeqNo'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #24207#21495
        Width = 43
      end
      item
        EditButtons = <>
        FieldName = 'PARAMETER_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #21442#25968#20195#30721
        Width = 73
      end
      item
        EditButtons = <>
        FieldName = 'PARAMETER_DESC'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #21442#25968#21517#31216
        Width = 104
      end
      item
        EditButtons = <>
        FieldName = 'CalcValueType'
        Footers = <>
        KeyList.Strings = (
          '0'
          '1')
        PickList.Strings = (
          #21442#25968#20013#21462#20540
          #20844#24335#35745#31639)
        Title.Alignment = taCenter
        Title.Caption = #21462#20540#26041#24335
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'IsDifferent'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
        PickList.Strings = (
          #30456#31561
          #19981#30456#31561)
        Title.Alignment = taCenter
        Title.Caption = #21512#25340#26465#20214
      end
      item
        EditButtons = <>
        FieldName = 'Formula'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #35745#31639#20844#24335
        Width = 278
      end
      item
        EditButtons = <>
        FieldName = 'Operator'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #36816#31639#31526
        Width = 47
      end
      item
        EditButtons = <>
        FieldName = 'FormulaValue'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #20540
        Width = 80
      end>
  end
  object aqParamSet: TADOQuery
    Connection = DM.con1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforePost = aqParamSetBeforePost
    Parameters = <>
    SQL.Strings = (
      'select * from SpellCondition')
    Left = 184
    Top = 80
    object aqParamSetParam_PTR: TIntegerField
      FieldName = 'Param_PTR'
    end
    object aqParamSetCalcValueType: TWordField
      FieldName = 'CalcValueType'
    end
    object aqParamSetFormula: TWideStringField
      FieldName = 'Formula'
      Size = 100
    end
    object aqParamSetOperator: TStringField
      FieldName = 'Operator'
      Size = 5
    end
    object aqParamSetFormulaValue: TWideStringField
      FieldName = 'FormulaValue'
    end
    object aqParamSetPARAMETER_NAME: TStringField
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'PARAMETER_NAME'
      LookupDataSet = qry278
      LookupKeyFields = 'RKEY'
      LookupResultField = 'PARAMETER_NAME'
      KeyFields = 'Param_PTR'
      Size = 10
      Lookup = True
    end
    object aqParamSetPARAMETER_DESC: TStringField
      FieldKind = fkLookup
      FieldName = 'PARAMETER_DESC'
      LookupDataSet = qry278
      LookupKeyFields = 'RKEY'
      LookupResultField = 'PARAMETER_DESC'
      KeyFields = 'Param_PTR'
      Lookup = True
    end
    object aqParamSetSeqNo: TIntegerField
      FieldName = 'SeqNo'
    end
    object aqParamSetIsDifferent: TSmallintField
      FieldName = 'IsDifferent'
    end
  end
  object DataSource1: TDataSource
    DataSet = aqParamSet
    Left = 240
    Top = 80
  end
  object qry278: TADOQuery
    Connection = DM.con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select RKEY,PARAMETER_NAME,PARAMETER_DESC from data0278(NOLOCK)')
    Left = 352
    Top = 96
    object qry278RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qry278PARAMETER_NAME: TStringField
      FieldName = 'PARAMETER_NAME'
      Size = 10
    end
    object qry278PARAMETER_DESC: TStringField
      FieldName = 'PARAMETER_DESC'
    end
  end
end
