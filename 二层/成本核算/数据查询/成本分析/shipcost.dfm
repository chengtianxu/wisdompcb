object frm_shipcost: Tfrm_shipcost
  Left = 274
  Top = 160
  Width = 773
  Height = 537
  Caption = #36865#36135#26126#32454#21450#25104#26412
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
    Top = 458
    Width = 757
    Height = 41
    Align = alBottom
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 328
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = #20851#38381
      ModalResult = 2
      TabOrder = 0
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
    object BitBtn2: TBitBtn
      Left = 248
      Top = 8
      Width = 75
      Height = 25
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
    Top = 0
    Width = 757
    Height = 458
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
        FieldName = 'SHIPMENT_NO'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'DATE_ASSIGN'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'QUAN_SHP'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'WORK_ORDER_NUMBER'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'LOCATION'
        Footers = <>
        Width = 115
      end
      item
        EditButtons = <>
        FieldName = 'MATL_COST'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'OVHD_COST'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'ovhd1_pcs'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'outsource_pcs'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'PLANNED_QTY'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'cost_pcs'
        Footers = <>
        Width = 95
      end
      item
        EditButtons = <>
        FieldName = 'total_cost_pcs'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'ship_cost'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #20986#36135#24635#25104#26412
      end>
  end
  object ADS52: TADODataSet
    Connection = DM.Conn
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.Data0064.SHIPMENT_NO, dbo.Data0064.DATE_ASSIGN, d' +
      'bo.Data0052.QUAN_SHP, dbo.Data0006.WORK_ORDER_NUMBER, '#13#10'        ' +
      '              dbo.Data0053.WORK_ORDER_PTR, dbo.Data0016.LOCATION' +
      ', '#13#10'data0053.matl_ovhd_pcs as MATL_COST, data0053.OVHD_COST, dbo' +
      '.Data0053.PLANNED_QTY, '#13#10'dbo.Data0053.cost_pcs, data0053.ovhd1_p' +
      'cs,data0053.outsource_pcs,'#13#10'(data0053.matl_ovhd_pcs+data0053.cos' +
      't_pcs+data0053.OVHD_COST+data0053.PLANNED_QTY+data0053.ovhd1_pcs' +
      '+data0053.outsource_pcs)'#13#10'                      AS total_cost_pc' +
      's,'#13#10'round(dbo.Data0052.QUAN_SHP*'#13#10'(data0053.matl_ovhd_pcs+data00' +
      '53.cost_pcs+data0053.OVHD_COST+data0053.PLANNED_QTY+data0053.ovh' +
      'd1_pcs+data0053.outsource_pcs),3) as ship_cost'#13#10#13#10'FROM         d' +
      'bo.Data0052 INNER JOIN'#13#10'                      dbo.Data0053 ON db' +
      'o.Data0052.DATA0053_PTR = dbo.Data0053.RKEY INNER JOIN'#13#10'        ' +
      '              dbo.Data0064 ON dbo.Data0052.SO_SHP_PTR = dbo.Data' +
      '0064.RKEY INNER JOIN'#13#10'                      dbo.Data0016 ON dbo.' +
      'Data0053.LOC_PTR = dbo.Data0016.RKEY LEFT OUTER JOIN'#13#10'          ' +
      '            dbo.Data0006 ON dbo.Data0053.WORK_ORDER_PTR = dbo.Da' +
      'ta0006.RKEY'#13#10'where data0064.so_ptr=:rkey60 and'#13#10'(dbo.Data0064.DA' +
      'TE_ASSIGN > :vdate1) AND '#13#10'      (dbo.Data0064.DATE_ASSIGN <= :v' +
      'date2)'#13#10'order by dbo.Data0064.SHIPMENT_NO'
    Parameters = <
      item
        Name = 'rkey60'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'vdate1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'vdate2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    Prepared = True
    Left = 112
    Top = 224
    object ADS52SHIPMENT_NO: TSmallintField
      DisplayLabel = #25351#27966#25209#27425
      FieldName = 'SHIPMENT_NO'
    end
    object ADS52DATE_ASSIGN: TDateTimeField
      DisplayLabel = #25351#27966#26085#26399
      FieldName = 'DATE_ASSIGN'
    end
    object ADS52QUAN_SHP: TFloatField
      DisplayLabel = #20986#36135#25968#37327
      FieldName = 'QUAN_SHP'
    end
    object ADS52WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20316#19994#21333#21495
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ADS52WORK_ORDER_PTR: TIntegerField
      FieldName = 'WORK_ORDER_PTR'
    end
    object ADS52LOCATION: TStringField
      DisplayLabel = #20179#24211
      FieldName = 'LOCATION'
    end
    object ADS52MATL_COST: TFloatField
      DisplayLabel = 'PCS'#26448#26009#25104#26412
      FieldName = 'MATL_COST'
    end
    object ADS52OVHD_COST: TFloatField
      DisplayLabel = 'PCS'#21046#36896#36153#29992
      FieldName = 'OVHD_COST'
    end
    object ADS52PLANNED_QTY: TFloatField
      DisplayLabel = #24102#20837#25104#26412
      FieldName = 'PLANNED_QTY'
    end
    object ADS52cost_pcs: TFloatField
      DisplayLabel = #22996#22806#25110#25253#24223#25104#26412
      FieldName = 'cost_pcs'
    end
    object ADS52total_cost_pcs: TFloatField
      DisplayLabel = 'PCS'#24635#25104#26412
      FieldName = 'total_cost_pcs'
      ReadOnly = True
    end
    object ADS52ship_cost: TFloatField
      DisplayLabel = #20986#36135#25104#26412
      FieldName = 'ship_cost'
      ReadOnly = True
    end
    object ADS52ovhd1_pcs: TFloatField
      DisplayLabel = #30452#25509#20154#24037'PCS'
      FieldName = 'ovhd1_pcs'
    end
    object ADS52outsource_pcs: TFloatField
      DisplayLabel = #20108#31867#26448#26009'pcs'
      FieldName = 'outsource_pcs'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS52
    Left = 80
    Top = 224
  end
  object PopupMenu1: TPopupMenu
    Left = 152
    Top = 112
    object N1: TMenuItem
      Caption = #20316#19994#21333#25104#26412#26126#32454
      OnClick = N1Click
    end
  end
end
