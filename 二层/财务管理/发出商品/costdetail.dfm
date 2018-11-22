object Form_costdetail: TForm_costdetail
  Left = 258
  Top = 183
  Width = 858
  Height = 506
  Caption = #20986#36135#25104#26412#26126#32454
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
    Top = 427
    Width = 842
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 376
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = '&Close'
      ModalResult = 2
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
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 842
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
        FieldName = 'WORK_ORDER_NUMBER'
        Footers = <>
        Width = 122
      end
      item
        EditButtons = <>
        FieldName = 'LOCATION'
        Footers = <>
        Width = 78
      end
      item
        EditButtons = <>
        FieldName = 'MFG_DATE'
        Footers = <>
        Width = 85
      end
      item
        EditButtons = <>
        FieldName = 'PO_NUMBER'
        Footers = <>
        Width = 67
      end
      item
        EditButtons = <>
        FieldName = 'QUAN_SHP'
        Footer.FieldName = 'QUAN_SHP'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'cost_2'
        Footer.FieldName = 'cost_2'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 129
      end
      item
        EditButtons = <>
        FieldName = 'MATL_COST'
        Footers = <>
        Width = 118
      end
      item
        EditButtons = <>
        FieldName = 'OVHD_COST'
        Footers = <>
        Width = 112
      end
      item
        EditButtons = <>
        FieldName = 'REFERENCE_NUMBER'
        Footers = <>
        Width = 124
      end>
  end
  object DataSource1: TDataSource
    DataSet = ads52
    Left = 160
    Top = 56
  end
  object ads52: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.Data0006.WORK_ORDER_NUMBER, dbo.Data0052.QUAN_SHP' +
      ', dbo.Data0006.MATL_COST, dbo.Data0006.OVHD_COST, dbo.Data0053.P' +
      'O_NUMBER, '#13#10'                      dbo.Data0053.REFERENCE_NUMBER,' +
      ' dbo.Data0053.MFG_DATE, dbo.Data0016.LOCATION,'#13#10'dbo.Data0052.QUA' +
      'N_SHP*isnull(dbo.Data0006.MATL_COST+dbo.Data0006.OVHD_COST,0) as' +
      ' cost_2'#13#10'FROM         dbo.Data0052 INNER JOIN'#13#10'                 ' +
      '     dbo.Data0053 ON dbo.Data0052.DATA0053_PTR = dbo.Data0053.RK' +
      'EY INNER JOIN'#13#10'                      dbo.Data0016 ON dbo.Data005' +
      '3.LOC_PTR = dbo.Data0016.RKEY LEFT OUTER JOIN'#13#10'                 ' +
      '     dbo.Data0006 ON dbo.Data0053.WORK_ORDER_PTR = dbo.Data0006.' +
      'RKEY'#13#10'where data0052.SO_SHP_PTR=:rkey64'
    EnableBCD = False
    Parameters = <
      item
        Name = 'rkey64'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Prepared = True
    Left = 192
    Top = 56
    object ads52WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20316#19994#21333#21495
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ads52QUAN_SHP: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'QUAN_SHP'
    end
    object ads52MATL_COST: TFloatField
      DisplayLabel = #27599'PCS'#26448#26009#25104#26412
      FieldName = 'MATL_COST'
    end
    object ads52OVHD_COST: TFloatField
      DisplayLabel = #27599'PCS'#21046#36896#36153#29992
      FieldName = 'OVHD_COST'
    end
    object ads52PO_NUMBER: TStringField
      DisplayLabel = #23458#25143#35746#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ads52REFERENCE_NUMBER: TStringField
      DisplayLabel = #20855#20307#20301#32622
      FieldName = 'REFERENCE_NUMBER'
    end
    object ads52MFG_DATE: TDateTimeField
      DisplayLabel = #20837#24211#26085#26399
      FieldName = 'MFG_DATE'
    end
    object ads52LOCATION: TStringField
      DisplayLabel = #20179#24211
      FieldName = 'LOCATION'
    end
    object ads52cost_2: TFloatField
      DisplayLabel = #25104#26412
      FieldName = 'cost_2'
      ReadOnly = True
    end
  end
end
