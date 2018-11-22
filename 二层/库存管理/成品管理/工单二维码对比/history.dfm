object frmHistroy: TfrmHistroy
  Left = 314
  Top = 179
  Width = 692
  Height = 594
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 676
    Height = 41
    Align = alTop
    TabOrder = 0
    object lbl1: TLabel
      Left = 302
      Top = 12
      Width = 12
      Height = 13
      Caption = #33267
    end
    object btn1: TButton
      Left = 114
      Top = 7
      Width = 75
      Height = 25
      Caption = #26597#35810
      TabOrder = 0
      OnClick = btn1Click
    end
    object dtp1: TDateTimePicker
      Left = 200
      Top = 8
      Width = 97
      Height = 21
      Date = 43189.402644560180000000
      Time = 43189.402644560180000000
      TabOrder = 1
    end
    object dtp2: TDateTimePicker
      Left = 320
      Top = 8
      Width = 97
      Height = 21
      Date = 43189.402644560180000000
      Time = 43189.402644560180000000
      TabOrder = 2
    end
  end
  object eh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 676
    Height = 514
    Align = alClient
    DataSource = ds1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'succ'
        Footers = <>
        Title.Caption = #32467#26524
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'WORK_ORDER_NUMBER'
        Footers = <>
        Title.Caption = #20316#19994#21333
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_NUMBER'
        Footers = <>
        Title.Caption = #26412#21378#32534#21495
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_DESC'
        Footers = <>
        Title.Caption = #23458#25143#22411#21495
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'Bar2D'
        Footers = <>
        Title.Caption = #20108#32500#30721
        Width = 150
      end
      item
        EditButtons = <>
        FieldName = 'DTime'
        Footers = <>
        Title.Caption = #26102#38388
        Width = 100
      end>
  end
  object ads1: TADODataSet
    Connection = dm1.con1
    CursorType = ctStatic
    CommandText = 
      'select  succ ,WORK_ORDER_NUMBER,MANU_PART_NUMBER,MANU_PART_DESC,' +
      'Bar2D,DTime from data0737HWZD '#13#10'INNER JOIN Data0006 d06 ON d06.R' +
      'KEY = WO_Ptr'#13#10'inner join Data0025 d25 ON d25.RKEY = d06.BOM_PTR'#13 +
      #10'INNER JOIN Data0073 d73 ON d73.RKEY = D73_Ptr'#13#10'where DTime BETW' +
      'EEN :t1 and :t2'#13#10'order by dtime desc'
    Parameters = <
      item
        Name = 't1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 't2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    Left = 224
    Top = 152
    object ads1WORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ads1MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
      Size = 30
    end
    object ads1MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ads1Bar2D: TStringField
      FieldName = 'Bar2D'
      Size = 100
    end
    object ads1DTime: TDateTimeField
      FieldName = 'DTime'
    end
    object ads1succ: TStringField
      FieldName = 'succ'
      Size = 10
    end
  end
  object ds1: TDataSource
    DataSet = ads1
    Left = 280
    Top = 152
  end
end
