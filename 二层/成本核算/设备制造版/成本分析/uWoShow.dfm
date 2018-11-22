object FrmWoShow: TFrmWoShow
  Left = 264
  Top = 214
  Width = 551
  Height = 394
  Caption = #26597#23436#24037#24037#21333
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 543
    Height = 326
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
        Width = 126
      end
      item
        EditButtons = <>
        FieldName = 'MATL_COST'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'OVHD_COST'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'QUAN_PROD'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'square'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'AMOUNT'
        Footer.ValueType = fvtSum
        Footers = <>
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 326
    Width = 543
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn2: TBitBtn
      Left = 224
      Top = 9
      Width = 75
      Height = 24
      Caption = #21462#28040
      TabOrder = 0
      OnClick = BitBtn2Click
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
  end
  object PopupMenu1: TPopupMenu
    Left = 216
    Top = 88
    object N1: TMenuItem
      Caption = #26597#24037#21333#25104#26412#26126#32454
      OnClick = N1Click
    end
  end
  object ADS464_LIST: TADODataSet
    Connection = DM.Conn
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT TOP 100 PERCENT dbo.Data0006.WORK_ORDER_NUMBER, '#13#10'dbo.Dat' +
      'a0464.WO_PTR, '#13#10'      sum(Data0464.MATL_COST) as MATL_COST, '#13#10'  ' +
      '    sum(Data0464.OVHD_COST) as OVHD_COST,'#13#10'      sum(Data0464.QU' +
      'AN_PROD) as QUAN_PROD, '#13#10'      sum(Data0464.square) as square, '#13 +
      #10'      sum(Data0464.AMOUNT) as AMOUNT'#13#10'FROM dbo.Data0464 INNER J' +
      'OIN'#13#10'      dbo.Data0006 ON dbo.Data0464.wo_ptr = dbo.Data0006.RK' +
      'EY'#13#10'WHERE (dbo.Data0464.D0451_PTR = :RKEY451) AND (dbo.Data0464.' +
      'so_ptr = :RKEY60)'#13#10'group by Data0006.WORK_ORDER_NUMBER,Data0464.' +
      'WO_PTR'#13#10'ORDER BY dbo.Data0006.WORK_ORDER_NUMBER'
    Parameters = <
      item
        Name = 'RKEY451'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'RKEY60'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 168
    Top = 200
    object ADS464_LISTWORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20316#19994#21333#21495
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ADS464_LISTMATL_COST: TFloatField
      DisplayLabel = #26448#26009#25104#26412
      FieldName = 'MATL_COST'
    end
    object ADS464_LISTOVHD_COST: TFloatField
      DisplayLabel = #21046#36896#36153#29992
      FieldName = 'OVHD_COST'
    end
    object ADS464_LISTQUAN_PROD: TIntegerField
      DisplayLabel = #20837#24211#25968#37327
      FieldName = 'QUAN_PROD'
    end
    object ADS464_LISTsquare: TFloatField
      DisplayLabel = #20837#24211#38754#31215
      FieldName = 'square'
    end
    object ADS464_LISTAMOUNT: TFloatField
      DisplayLabel = #20837#24211#37329#39069
      FieldName = 'AMOUNT'
    end
    object ADS464_LISTWO_PTR: TIntegerField
      FieldName = 'WO_PTR'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS464_LIST
    Left = 128
    Top = 200
  end
end
