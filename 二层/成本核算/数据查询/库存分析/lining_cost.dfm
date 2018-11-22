object Form_lining: TForm_lining
  Left = 252
  Top = 201
  Width = 929
  Height = 480
  Caption = #20869#23618#20998#37197#25104#26412
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
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 913
    Height = 401
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
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
        FieldName = 'WORK_ORDER_NUMBER'
        Footers = <>
        Width = 119
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_NUMBER'
        Footer.Value = #21512#35745
        Footer.ValueType = fvtStaticText
        Footers = <>
        Width = 99
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_DESC'
        Footers = <>
        Width = 99
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_CODE'
        Footers = <>
        Width = 54
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_NAME'
        Footers = <>
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'STEP'
        Footers = <>
        Width = 32
      end
      item
        EditButtons = <>
        FieldName = 'putout_qty'
        Footers = <>
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'matl_pcs'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 87
      end
      item
        EditButtons = <>
        FieldName = 'ovhd_pcs'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 92
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
        Width = 77
      end
      item
        EditButtons = <>
        FieldName = 'bring_matl_pcs'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 110
      end
      item
        EditButtons = <>
        FieldName = 'bring_ovhd_pcs'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 114
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
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 401
    Width = 913
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      913
      41)
    object BitBtn1: TBitBtn
      Left = 455
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #20851#38381
      ModalResult = 1
      TabOrder = 0
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
      Left = 356
      Top = 12
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
  object AD489: TADODataSet
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT d1.MANU_PART_NUMBER, d1.MANU_PART_DESC, d1.WORK_ORDER_NUM' +
      'BER, '#13#10'     d1.putout_qty, data0410.matl_pcs, data0410.ovhd_pcs,' +
      ' data0410.ovhd1_pcs, data0410.outsource_pcs,'#13#10'      dbo.Data0034' +
      '.DEPT_CODE, dbo.Data0034.DEPT_NAME, dbo.data0410.STEP, '#13#10'    dat' +
      'a0410.bring_matl_pcs, data0410.bring_ovhd_pcs, data0410.bring_ov' +
      'hd1_pcs, data0410.bring_outsource_pcs,'#13#10'      d1.putout_qty * (d' +
      'ata0410.matl_pcs+data0410.bring_matl_pcs) AS total_matl, '#13#10'     ' +
      ' d1.putout_qty * (data0410.ovhd_pcs+data0410.bring_ovhd_pcs) AS ' +
      'total_ovhd,'#13#10'      d1.putout_qty * (data0410.ovhd1_pcs+data0410.' +
      'bring_ovhd1_pcs) AS total_ovhd1, '#13#10'      d1.putout_qty * (data04' +
      '10.outsource_pcs+data0410.bring_outsource_pcs) AS total_boutsour' +
      'ce'#13#10'FROM dbo.data0410 INNER JOIN'#13#10'(SELECT dbo.Data0489.SOURCE_PT' +
      'R, dbo.Data0006.WORK_ORDER_NUMBER, '#13#10'      dbo.Data0025.MANU_PAR' +
      'T_NUMBER, dbo.Data0025.MANU_PART_DESC, '#13#10'      SUM(dbo.Data0489.' +
      'QTY) AS putout_qty'#13#10'FROM dbo.Data0025 INNER JOIN'#13#10'      dbo.Data' +
      '0006 ON dbo.Data0025.RKEY = dbo.Data0006.BOM_PTR INNER JOIN'#13#10'   ' +
      '   dbo.Data0489 ON dbo.Data0006.RKEY = dbo.Data0489.SOURCE_PTR'#13#10 +
      'WHERE (dbo.Data0489.TTYPE = 2) AND (dbo.Data0489.QTY > 0) AND '#13#10 +
      '      (dbo.Data0489.WO_PTR = :key06) AND (dbo.Data0025.BOM_STEP ' +
      '= :step)'#13#10'GROUP BY dbo.Data0006.WORK_ORDER_NUMBER, '#13#10'      dbo.D' +
      'ata0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC, '#13#10'      d' +
      'bo.Data0489.SOURCE_PTR) d1 ON '#13#10'      dbo.data0410.WO_PTR = d1.S' +
      'OURCE_PTR INNER JOIN'#13#10'      dbo.Data0034 ON dbo.data0410.DEPT_PT' +
      'R = dbo.Data0034.RKEY'#13#10'order by d1.WORK_ORDER_NUMBER,data0410.ST' +
      'EP'#13#10
    Parameters = <
      item
        Name = 'key06'
        DataType = ftString
        Size = 5
        Value = '51813'
      end
      item
        Name = 'step'
        DataType = ftString
        Size = 1
        Value = '1'
      end>
    Left = 96
    Top = 200
    object AD489MANU_PART_NUMBER: TStringField
      DisplayLabel = #20869#23618#32534#21495
      DisplayWidth = 20
      FieldName = 'MANU_PART_NUMBER'
    end
    object AD489MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      DisplayWidth = 21
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object AD489WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20869#23618#20316#19994#21333#21495
      DisplayWidth = 22
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object AD489DEPT_CODE: TStringField
      DisplayLabel = #24037#24207#20195#30721
      DisplayWidth = 10
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object AD489DEPT_NAME: TStringField
      DisplayLabel = #24037#24207#21517#31216
      DisplayWidth = 30
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object AD489STEP: TIntegerField
      DisplayLabel = #27493#39588
      DisplayWidth = 10
      FieldName = 'STEP'
    end
    object AD489putout_qty: TIntegerField
      DisplayLabel = #20998#37197#25968#37327
      DisplayWidth = 10
      FieldName = 'putout_qty'
    end
    object AD489matl_pcs: TFloatField
      DisplayLabel = #26448#26009#25104#26412
      DisplayWidth = 10
      FieldName = 'matl_pcs'
    end
    object AD489ovhd_pcs: TFloatField
      DisplayLabel = #21046#36896#36153#29992
      DisplayWidth = 10
      FieldName = 'ovhd_pcs'
    end
    object AD489ovhd1_pcs: TFloatField
      DisplayLabel = #30452#25509#20154#24037
      FieldName = 'ovhd1_pcs'
    end
    object AD489outsource_pcs: TFloatField
      DisplayLabel = #20108#31867#26448#26009
      FieldName = 'outsource_pcs'
    end
    object AD489bring_matl_pcs: TFloatField
      DisplayLabel = #20869#23618#26448#26009#25104#26412
      FieldName = 'bring_matl_pcs'
    end
    object AD489bring_ovhd_pcs: TFloatField
      DisplayLabel = #20869#23618#21046#36896#36153#29992
      FieldName = 'bring_ovhd_pcs'
    end
    object AD489bring_ovhd1_pcs: TFloatField
      DisplayLabel = #20869#23618#30452#25509#20154#24037
      FieldName = 'bring_ovhd1_pcs'
    end
    object AD489bring_outsource_pcs: TFloatField
      DisplayLabel = #20869#23618#20108#31867#26448#26009
      FieldName = 'bring_outsource_pcs'
    end
    object AD489total_matl: TFloatField
      DisplayLabel = #24635#26448#26009#25104#26412
      DisplayWidth = 10
      FieldName = 'total_matl'
      ReadOnly = True
    end
    object AD489total_ovhd: TFloatField
      DisplayLabel = #24635#21046#36896#36153#29992
      DisplayWidth = 10
      FieldName = 'total_ovhd'
      ReadOnly = True
    end
    object AD489total_ovhd1: TFloatField
      DisplayLabel = #24635#30452#25509#20154#24037
      FieldName = 'total_ovhd1'
      ReadOnly = True
    end
    object AD489total_boutsource: TFloatField
      DisplayLabel = #24635#20108#31867#26448#26009
      FieldName = 'total_boutsource'
      ReadOnly = True
    end
  end
  object DataSource1: TDataSource
    DataSet = AD489
    Left = 64
    Top = 200
  end
end
