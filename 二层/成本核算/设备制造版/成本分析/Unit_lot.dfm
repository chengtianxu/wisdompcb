object Form_lot: TForm_lot
  Left = 223
  Top = 161
  Width = 731
  Height = 506
  Caption = #26597#30475#25104#26412#35814#24773
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 723
    Height = 41
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      723
      41)
    object BitBtn1: TBitBtn
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akLeft]
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
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 723
    Height = 435
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    FooterRowCount = 1
    PopupMenu = PopupMenu1
    ReadOnly = True
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
        FieldName = 'step'
        Footer.Value = #21512#35745
        Footer.ValueType = fvtStaticText
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'dept_name'
        Footers = <>
        Width = 93
      end
      item
        EditButtons = <>
        FieldName = 'fm_date'
        Footers = <>
        Width = 76
      end
      item
        EditButtons = <>
        FieldName = 'end_date'
        Footers = <>
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'qty'
        Footers = <>
        Width = 69
      end
      item
        EditButtons = <>
        FieldName = 'matl_pcs'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 92
      end
      item
        EditButtons = <>
        FieldName = 'ovhd_pcs'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 83
      end
      item
        EditButtons = <>
        FieldName = 'bring_matl_pcs'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 106
      end
      item
        EditButtons = <>
        FieldName = 'bring_ovhd_pcs'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 112
      end
      item
        EditButtons = <>
        FieldName = 'matl_amount'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 77
      end
      item
        EditButtons = <>
        FieldName = 'ovhd1_amount'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 88
      end
      item
        EditButtons = <>
        FieldName = 'ovhd2_amount'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 84
      end
      item
        EditButtons = <>
        FieldName = 'ovhd3_amount'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 87
      end
      item
        EditButtons = <>
        FieldName = 'PcspereEar'
        Footers = <>
        Width = 82
      end
      item
        EditButtons = <>
        FieldName = 'ABBR_NAME'
        Footers = <>
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADO410_16
    Left = 120
    Top = 128
  end
  object PopupMenu1: TPopupMenu
    Left = 152
    Top = 200
    object N1: TMenuItem
      Caption = #26681#25454#37197#26009#21333#21457#25918#30340#26448#26009#25104#26412#35745#31639#26126#32454
      OnClick = N1Click
    end
    object N4: TMenuItem
      Caption = #20869#23618#20998#37197#25104#26412#26126#32454
      OnClick = N4Click
    end
    object N2: TMenuItem
      Caption = #26448#26009#25104#26412#26126#32454
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21046#36896#36153#29992#26126#32454
      OnClick = N3Click
    end
  end
  object ADO410_16: TADOStoredProc
    Connection = DM.Conn
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'wzcx090;16'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@vptr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@vstep'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 152
    Top = 128
    object ADO410_16step: TIntegerField
      DisplayLabel = #27493#39588
      FieldName = 'step'
    end
    object ADO410_16dept_name: TStringField
      DisplayLabel = #24037#24207
      FieldName = 'dept_name'
      Size = 30
    end
    object ADO410_16fm_date: TDateTimeField
      DisplayLabel = #26399#38388'FROM'
      FieldName = 'fm_date'
    end
    object ADO410_16end_date: TDateTimeField
      DisplayLabel = #26399#38388'TO'
      FieldName = 'end_date'
    end
    object ADO410_16qty: TIntegerField
      DisplayLabel = #29983#20135#25968#37327
      FieldName = 'qty'
    end
    object ADO410_16matl_pcs: TFloatField
      DisplayLabel = #26448#26009#25104#26412'/PCS'
      FieldName = 'matl_pcs'
    end
    object ADO410_16ovhd_pcs: TFloatField
      DisplayLabel = #21046#36896#36153#29992'/PCS'
      FieldName = 'ovhd_pcs'
    end
    object ADO410_16bring_cost_pcs: TFloatField
      DisplayLabel = #24102#20837#25104#26412'/PCS'
      FieldName = 'bring_cost_pcs'
      ReadOnly = True
    end
    object ADO410_16matl_amount: TFloatField
      DisplayLabel = #26448#26009#25104#26412'/LOT'
      FieldName = 'matl_amount'
    end
    object ADO410_16ovhd1_amount: TFloatField
      DisplayLabel = #21046#36896#36153#29992'1/LOT'
      FieldName = 'ovhd1_amount'
    end
    object ADO410_16ovhd2_amount: TFloatField
      DisplayLabel = #21046#36896#36153#29992'2/LOT'
      FieldName = 'ovhd2_amount'
    end
    object ADO410_16ovhd3_amount: TFloatField
      DisplayLabel = #21046#36896#36153#29992'3/LOT'
      FieldName = 'ovhd3_amount'
    end
    object ADO410_16actual_end_date: TDateTimeField
      FieldName = 'actual_end_date'
    end
    object ADO410_16actual_fm_date: TDateTimeField
      FieldName = 'actual_fm_date'
    end
    object ADO410_16rkey: TAutoIncField
      DisplayLabel = 'rkey451'
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO410_16dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object ADO410_16bom_ptr: TIntegerField
      FieldName = 'bom_ptr'
    end
    object ADO410_16bring_matl_pcs: TFloatField
      DisplayLabel = #24102#20837#26448#26009#25104#26412'/Pcs'
      FieldName = 'bring_matl_pcs'
    end
    object ADO410_16bring_ovhd_pcs: TFloatField
      DisplayLabel = #24102#20837#21046#36896#36153#29992'/Pcs'
      FieldName = 'bring_ovhd_pcs'
    end
    object ADO410_16reky06: TIntegerField
      FieldName = 'reky06'
      ReadOnly = True
    end
    object ADO410_16PcspereEar: TFloatField
      DisplayLabel = #27599#24179#26041#31859#25104#26412
      FieldName = 'PcspereEar'
      ReadOnly = True
    end
    object ADO410_16cut_no: TStringField
      FieldName = 'cut_no'
      FixedChar = True
      Size = 12
    end
    object ADO410_16warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object ADO410_16ABBR_NAME: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
  end
end
