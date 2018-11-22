object Form3: TForm3
  Left = 204
  Top = 179
  Width = 737
  Height = 532
  Caption = #25910#36135#26126#32454#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 729
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      729
      31)
    object Label1: TLabel
      Left = 204
      Top = 8
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #36865#36135#21333#21495
      Visible = False
    end
    object Button1: TButton
      Left = 8
      Top = 1
      Width = 55
      Height = 25
      Hint = #20851#38381
      Caption = #20851#38381
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object Button2: TButton
      Left = 119
      Top = 1
      Width = 55
      Height = 25
      Hint = #25968#25454#23548#20986#21040'Excel'
      Caption = #23548#20986#25968#25454
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = Button2Click
    end
    object Edit1: TEdit
      Left = 265
      Top = 4
      Width = 121
      Height = 21
      TabOrder = 0
      Visible = False
    end
    object GroupBox2: TGroupBox
      Left = 448
      Top = 0
      Width = 259
      Height = 27
      Anchors = [akTop, akRight]
      Caption = #26085#26399#33539#22260
      TabOrder = 3
      Visible = False
      object Label8: TLabel
        Left = 6
        Top = 17
        Width = 20
        Height = 13
        Alignment = taRightJustify
        Caption = #20174':'
      end
      object Label9: TLabel
        Left = 134
        Top = 17
        Width = 20
        Height = 13
        Alignment = taRightJustify
        Caption = #21040':'
      end
      object dtpk1: TDateTimePicker
        Left = 30
        Top = 13
        Width = 97
        Height = 21
        Date = 37600.000000000000000000
        Time = 37600.000000000000000000
        TabOrder = 0
      end
      object DTPk2: TDateTimePicker
        Left = 156
        Top = 13
        Width = 97
        Height = 21
        Date = 37600.000000000000000000
        Time = 37600.000000000000000000
        TabOrder = 1
      end
    end
    object Button3: TButton
      Left = 64
      Top = 1
      Width = 55
      Height = 25
      Hint = #35774#32622#26597#35810#26465#20214
      Caption = #26597#35810
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = Button3Click
    end
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 31
    Width = 729
    Height = 471
    Align = alClient
    ColCount = 15
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    TabOrder = 1
    OnKeyDown = StringGrid1KeyDown
    ColWidths = (
      78
      71
      71
      64
      86
      85
      77
      40
      64
      64
      64
      64
      123
      64
      64)
  end
  object Memo1: TMemo
    Left = 88
    Top = 128
    Width = 617
    Height = 345
    Lines.Strings = (
      'SELECT wzdata301.rkey,WZDATA300.epiboly_number,'
      '      Data0025.MANU_PART_NUMBER, Data0025.MANU_PART_DESC,'
      
        '      dbo.WZDATA301.STANDARD, dbo.WZDATA300.refer_date as ent_da' +
        'ta, dbo.Data0023.ABBR_NAME,'
      
        '      dbo.Data0034.DEPT_NAME, WZDATA301.QUANTITY,WZDATA301.RETUR' +
        'N_QTY,'
      
        '      dbo.WZDATA301.RECEVIED_QTY, wzdata301.UNIT_NAME,wzdata301.' +
        'reject_qty,'
      '      WZDATA301.QUANTITY - WZDATA301.RECEVIED_QTY -'
      
        '      WZDATA301.RETURN_QTY-wzdata301.reject_qty AS short_qty,wzd' +
        'ata301.REMARTK,'
      '      DATA0015.ABBR_NAME as whouse_name'
      'FROM WZDATA301 INNER JOIN  Data0025 ON'
      '      WZDATA301.CUSTPART_PTR = dbo.Data0025.RKEY INNER JOIN'
      '      WZDATA300 ON'
      '      WZDATA301.EPIBOLY_PTR = dbo.WZDATA300.rkey INNER JOIN'
      
        '      Data0034 ON dbo.WZDATA300.dept_ptr = dbo.Data0034.RKEY INN' +
        'ER JOIN'
      
        '      Data0023 ON dbo.WZDATA300.supp_ptr = dbo.Data0023.RKEY INN' +
        'ER JOIN '
      '      Data0015 ON WZDATA300.WAREHOUSE_PTR=DATA0015.RKEY'
      'where WZDATA301.rkey>0'
      'ORDER BY dbo.WZDATA300.epiboly_number')
    ScrollBars = ssBoth
    TabOrder = 2
    Visible = False
  end
  object wzaq301: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT wzdata301.rkey,WZDATA300.epiboly_number,'
      '      Data0025.MANU_PART_NUMBER, Data0025.MANU_PART_DESC,'
      
        '      dbo.WZDATA301.STANDARD, WZDATA300.refer_date as ent_data, ' +
        'dbo.Data0023.ABBR_NAME,'
      
        '      dbo.Data0034.DEPT_NAME, WZDATA301.QUANTITY,WZDATA301.RETUR' +
        'N_QTY,'
      
        '      dbo.WZDATA301.RECEVIED_QTY, wzdata301.UNIT_NAME,wzdata301.' +
        'reject_qty,'
      '      WZDATA301.QUANTITY - WZDATA301.RECEVIED_QTY -'
      
        '      WZDATA301.RETURN_QTY-wzdata301.reject_qty AS short_qty,wzd' +
        'ata301.REMARTK,'
      '      DATA0015.ABBR_NAME as whouse_name'
      'FROM WZDATA301 INNER JOIN  Data0025 ON'
      '      WZDATA301.CUSTPART_PTR = dbo.Data0025.RKEY INNER JOIN'
      '      WZDATA300 ON'
      '      WZDATA301.EPIBOLY_PTR = dbo.WZDATA300.rkey INNER JOIN'
      
        '      Data0034 ON dbo.WZDATA300.dept_ptr = dbo.Data0034.RKEY INN' +
        'ER JOIN'
      
        '      Data0023 ON dbo.WZDATA300.supp_ptr = dbo.Data0023.RKEY INN' +
        'ER JOIN '
      '      Data0015 ON wzdata300.warehouse_ptr=data0015.rkey'
      'where WZDATA301.rkey>0'
      'ORDER BY dbo.WZDATA300.epiboly_number')
    Left = 56
    Top = 288
    object wzaq301rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object wzaq301epiboly_number: TStringField
      FieldName = 'epiboly_number'
      Size = 15
    end
    object wzaq301ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object wzaq301DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object wzaq301MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object wzaq301MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object wzaq301STANDARD: TStringField
      FieldName = 'STANDARD'
      Size = 30
    end
    object wzaq301ent_data: TDateTimeField
      FieldName = 'ent_data'
    end
    object wzaq301UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
      Size = 10
    end
    object wzaq301QUANTITY: TIntegerField
      FieldName = 'QUANTITY'
    end
    object wzaq301RECEVIED_QTY: TIntegerField
      FieldName = 'RECEVIED_QTY'
    end
    object wzaq301RETURN_QTY: TIntegerField
      FieldName = 'RETURN_QTY'
    end
    object wzaq301reject_qty: TIntegerField
      FieldName = 'reject_qty'
    end
    object wzaq301short_qty: TIntegerField
      FieldName = 'short_qty'
      ReadOnly = True
    end
    object wzaq301REMARTK: TStringField
      FieldName = 'REMARTK'
      Size = 50
    end
    object wzaq301whouse_name: TStringField
      FieldName = 'whouse_name'
      Size = 10
    end
  end
  object DataSource2: TDataSource
    DataSet = wzaq301
    Left = 20
    Top = 288
  end
  object wzdata304: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    DataSource = DataSource2
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = 45
      end>
    SQL.Strings = (
      
        'SELECT dbo.WZDATA303.DELIVER_NUMBER, WZDATA303.ship_DATE as  SHI' +
        'P_DATE,'
      
        '      dbo.WZDATA304.rece_quantity,wzdata304.reject_qty,wzdata304' +
        '.RETURN_QTY'
      'FROM dbo.WZDATA303 INNER JOIN'
      
        '      dbo.WZDATA304 ON dbo.WZDATA303.RKEY = dbo.WZDATA304.DELIVE' +
        'R_PTR'
      'where WZDATA304.EPILIST_PTR=:rkey')
    Left = 56
    Top = 320
    object wzdata304DELIVER_NUMBER: TStringField
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object wzdata304SHIP_DATE: TDateTimeField
      FieldName = 'SHIP_DATE'
    end
    object wzdata304rece_quantity: TIntegerField
      FieldName = 'rece_quantity'
    end
    object wzdata304RETURN_QTY: TIntegerField
      FieldName = 'RETURN_QTY'
    end
    object wzdata304reject_qty: TIntegerField
      FieldName = 'reject_qty'
    end
  end
end
