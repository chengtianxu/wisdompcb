object Form_lot: TForm_lot
  Left = 223
  Top = 161
  Width = 991
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
    Width = 975
    Height = 41
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      975
      41)
    object BitBtn1: TBitBtn
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akLeft]
      Cancel = True
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
      Left = 90
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #23548#20986
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
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 975
    Height = 427
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    FooterRowCount = 1
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    PopupMenu = PopupMenu1
    ReadOnly = True
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'STEP'
        Footer.Value = #21512#35745
        Footer.ValueType = fvtStaticText
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_NAME'
        Footers = <>
        Width = 93
      end
      item
        EditButtons = <>
        FieldName = 'FM_DATE'
        Footers = <>
        Width = 76
      end
      item
        EditButtons = <>
        FieldName = 'END_DATE'
        Footers = <>
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'QTY'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'sc_type'
        Footers = <>
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'matl_pcs'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 86
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
        FieldName = 'ovhd1_pcs'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'outsource_pcs'
        Footer.ValueType = fvtSum
        Footers = <>
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
      end
      item
        EditButtons = <>
        FieldName = 'bring_ovhd1_pcs'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'bring_outsource_pcs'
        Footer.ValueType = fvtSum
        Footers = <>
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
      end
      item
        EditButtons = <>
        FieldName = 'std_sqrt_cost'
        Footers = <>
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADO410_16
    Left = 120
    Top = 128
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
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
    object N5: TMenuItem
      Caption = #30452#25509#20154#24037
      OnClick = N3Click
    end
    object N6: TMenuItem
      Caption = #20108#31867#26448#26009
      OnClick = N3Click
    end
    object N7: TMenuItem
      Tag = 1
      Caption = #22806#21457#36153#29992
      OnClick = N3Click
    end
  end
  object ADO410_16: TADODataSet
    Connection = DM.Conn
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT     TOP 100 PERCENT dbo.Data0451.FM_DATE, dbo.Data0451.EN' +
      'D_DATE, '#13#10'dbo.Data0451.ACTUAL_FM_DATE, dbo.Data0451.ACTUAL_END_D' +
      'ATE, '#13#10'  dbo.Data0034.DEPT_NAME, dbo.data0410.STEP, dbo.data0410' +
      '.QTY, '#13#10' data0410.matl_pcs, data0410.ovhd_pcs, data0410.ovhd1_pc' +
      's,data0410.outsource_pcs,'#13#10'dbo.Data0006.BOM_PTR, dbo.data0410.DE' +
      'PT_PTR,   dbo.Data0451.RKEY,  '#13#10'  dbo.data0410.bring_matl_pcs, d' +
      'bo.data0410.bring_ovhd_pcs, '#13#10'data0410.bring_ovhd1_pcs,data0410.' +
      'bring_outsource_pcs,'#13#10'dbo.Data0006.RKEY AS reky06, dbo.Data0006.' +
      'CUT_NO, data0410.unit_sq,'#13#10'  (data0410.matl_pcs + data0410.ovhd_' +
      'pcs +data0410.ovhd1_pcs+data0410.outsource_pcs'#13#10' +data0410.bring' +
      '_matl_pcs + data0410.bring_ovhd_pcs+data0410.bring_ovhd1_pcs+dat' +
      'a0410.bring_outsource_pcs) '#13#10'  / dbo.data0410.unit_sq AS Pcspere' +
      'Ear, dbo.data0410.warehouse_ptr, dbo.Data0015.ABBR_NAME,'#13#10'case d' +
      'ata0410.wtype when 0 then '#39#27491#24120#39' when 2 then '#39#36820#24037#39' when 3 then '#39#22806#21457#39 +
      ' end as sc_type,'#13#10' (data0410.MATL_PER_SQFT_1+data0410.MATL_PER_S' +
      'QFT_2)* data0410.unit_sq as std_sqrt_cost'#13#10'FROM         dbo.data' +
      '0410 INNER JOIN'#13#10'      dbo.Data0451 ON dbo.data0410.D0451_PTR = ' +
      'dbo.Data0451.RKEY INNER JOIN'#13#10'      dbo.Data0034 ON dbo.data0410' +
      '.DEPT_PTR = dbo.Data0034.RKEY INNER JOIN'#13#10'      dbo.Data0006 ON ' +
      'dbo.data0410.WO_PTR = dbo.Data0006.RKEY INNER JOIN'#13#10'      dbo.Da' +
      'ta0015 ON dbo.data0410.warehouse_ptr = dbo.Data0015.RKEY'#13#10'WHERE ' +
      '    (dbo.data0410.WO_PTR = :rkey06)'
    EnableBCD = False
    IndexFieldNames = 'step'
    Parameters = <
      item
        Name = 'rkey06'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 160
    Top = 128
    object ADO410_16FM_DATE: TDateTimeField
      DisplayLabel = #24320#22987#26399#38388
      FieldName = 'FM_DATE'
    end
    object ADO410_16END_DATE: TDateTimeField
      DisplayLabel = #32467#26463#26399#38388
      FieldName = 'END_DATE'
    end
    object ADO410_16ACTUAL_FM_DATE: TDateTimeField
      FieldName = 'ACTUAL_FM_DATE'
    end
    object ADO410_16ACTUAL_END_DATE: TDateTimeField
      FieldName = 'ACTUAL_END_DATE'
    end
    object ADO410_16DEPT_NAME: TStringField
      DisplayLabel = #24037#24207#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADO410_16STEP: TIntegerField
      DisplayLabel = #27493#39588
      FieldName = 'STEP'
    end
    object ADO410_16QTY: TIntegerField
      DisplayLabel = #29983#20135#25968#37327'pcs'
      FieldName = 'QTY'
    end
    object ADO410_16matl_pcs: TFloatField
      DisplayLabel = #26448#26009#25104#26412
      FieldName = 'matl_pcs'
    end
    object ADO410_16ovhd_pcs: TFloatField
      DisplayLabel = #21046#36896#36153#29992
      FieldName = 'ovhd_pcs'
    end
    object ADO410_16ovhd1_pcs: TFloatField
      DisplayLabel = #30452#25509#20154#24037
      FieldName = 'ovhd1_pcs'
    end
    object ADO410_16outsource_pcs: TFloatField
      DisplayLabel = #20108#31867#26448#26009
      FieldName = 'outsource_pcs'
    end
    object ADO410_16BOM_PTR: TIntegerField
      FieldName = 'BOM_PTR'
    end
    object ADO410_16DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADO410_16RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO410_16bring_matl_pcs: TFloatField
      DisplayLabel = #20869#23618#26448#26009#25104#26412
      FieldName = 'bring_matl_pcs'
    end
    object ADO410_16bring_ovhd_pcs: TFloatField
      DisplayLabel = #20869#23618#21046#36896#36153#29992
      FieldName = 'bring_ovhd_pcs'
    end
    object ADO410_16bring_ovhd1_pcs: TFloatField
      DisplayLabel = #20869#23618#30452#25509#20154#24037
      FieldName = 'bring_ovhd1_pcs'
    end
    object ADO410_16bring_outsource_pcs: TFloatField
      DisplayLabel = #20869#23618#20108#31867#26448#26009
      FieldName = 'bring_outsource_pcs'
    end
    object ADO410_16reky06: TIntegerField
      FieldName = 'reky06'
      ReadOnly = True
    end
    object ADO410_16CUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ADO410_16PcspereEar: TFloatField
      DisplayLabel = #24179#31859#25104#26412
      FieldName = 'PcspereEar'
      ReadOnly = True
    end
    object ADO410_16warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object ADO410_16ABBR_NAME: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADO410_16sc_type: TStringField
      DisplayLabel = #29983#20135#31867#22411
      FieldName = 'sc_type'
      ReadOnly = True
      Size = 4
    end
    object ADO410_16std_sqrt_cost: TFloatField
      DisplayLabel = #27599'PCS'#26631#20934#26448#26009#25104#26412
      FieldName = 'std_sqrt_cost'
      ReadOnly = True
    end
    object ADO410_16unit_sq: TFloatField
      FieldName = 'unit_sq'
    end
  end
end
