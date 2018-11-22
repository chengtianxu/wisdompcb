object frmShowShipNoInfo: TfrmShowShipNoInfo
  Left = 130
  Top = 217
  Width = 1104
  Height = 659
  Caption = #36319'lot'#36861#28335#35760#24405
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
  object eh1: TDBGridEh
    Left = 0
    Top = 32
    Width = 1088
    Height = 589
    Align = alClient
    DataSource = ds1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'Barcode'
        Footers = <>
        Title.Caption = 'ASN'#31665#21495
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'PONumber'
        Footers = <>
        Title.Caption = #23458#25143#35746#21333#21495
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'Itemcode'
        Footers = <>
        Title.Caption = #23458#25143#22411#21495
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'PCSpercarton'
        Footers = <>
        Title.Caption = #25968#37327
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'ItemRevision'
        Footers = <>
        Title.Caption = #29256#26412
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'VendorLotNumber'
        Footers = <>
        Title.Caption = #21608#26399
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'ourBarID'
        Footers = <>
        Title.Caption = #25105#21496#31665#26631'ID'
        Width = 100
      end
      item
        Color = clGradientActiveCaption
        EditButtons = <>
        FieldName = 'cmpret'
        Footers = <>
        KeyList.Strings = (
          '0'
          '1')
        PickList.Strings = (
          'NG'
          'PASS')
        Title.Caption = #23545#27604#25805#20316
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'cmpDate'
        Footers = <>
        Title.Caption = #23545#27604#26085#26399
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOYEE_NAME'
        Footers = <>
        Title.Caption = #23545#27604#20154#21592
        Width = 120
      end>
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 1088
    Height = 32
    Align = alTop
    TabOrder = 1
    object lbl1: TLabel
      Left = 125
      Top = 5
      Width = 120
      Height = 19
      Caption = #21326#20026#36135#21333#21495#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl2: TLabel
      Left = 246
      Top = 5
      Width = 11
      Height = 19
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn1: TBitBtn
      Left = 3
      Top = 2
      Width = 75
      Height = 29
      Caption = #20851#38381
      TabOrder = 0
      OnClick = btn1Click
      Kind = bkClose
    end
  end
  object ads1: TADODataSet
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'SELECT d736.Barcode,d736.PONumber,d736.Itemcode,d736.PCSpercarto' +
      'n,d736.ItemRevision,d736.VendorLotNumber,'#13#10' d737.ourBarID,isnull' +
      '(d737.cmpRet,0) as cmpret,d737.cmpDate,d737.cmpUser,d05.EMPLOYEE' +
      '_NAME FROM Data0736 d736'#13#10'left JOIN Data0737 d737 ON d737.HWBarC' +
      'ode = d736.Barcode'#13#10'LEFT join Data0005 d05 ON d05.RKEY = d737.cm' +
      'pUser'#13#10'WHERE ShipNo = :P1'
    Parameters = <
      item
        Name = 'P1'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    Left = 136
    Top = 88
    object ads1Barcode: TStringField
      FieldName = 'Barcode'
      Size = 200
    end
    object ads1PONumber: TStringField
      FieldName = 'PONumber'
      Size = 200
    end
    object ads1Itemcode: TStringField
      FieldName = 'Itemcode'
      Size = 50
    end
    object ads1PCSpercarton: TStringField
      FieldName = 'PCSpercarton'
      Size = 10
    end
    object ads1ItemRevision: TStringField
      FieldName = 'ItemRevision'
      Size = 50
    end
    object ads1VendorLotNumber: TStringField
      FieldName = 'VendorLotNumber'
      Size = 200
    end
    object ads1ourBarID: TStringField
      FieldName = 'ourBarID'
      Size = 50
    end
    object ads1cmpret: TIntegerField
      FieldName = 'cmpret'
      ReadOnly = True
    end
    object ads1cmpDate: TDateTimeField
      FieldName = 'cmpDate'
    end
    object ads1cmpUser: TIntegerField
      FieldName = 'cmpUser'
    end
    object ads1EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object ds1: TDataSource
    DataSet = ads1
    Left = 248
    Top = 88
  end
end
