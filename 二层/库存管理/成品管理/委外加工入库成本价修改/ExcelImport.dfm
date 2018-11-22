object frmExcelImport: TfrmExcelImport
  Left = 391
  Top = 247
  Width = 441
  Height = 331
  Caption = #23548#20837#21521#23548
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 425
    Height = 293
    ActivePage = ts1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object ts1: TTabSheet
      Caption = #31532#19968#27493
      object btn1: TSpeedButton
        Left = 352
        Top = 70
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = btn1Click
      end
      object lbl1: TLabel
        Left = 32
        Top = 48
        Width = 165
        Height = 13
        Caption = #35831#36873#25321#38656#23548#20837#30340'Excel'#25991#20214#65306
      end
      object lbl3: TLabel
        Left = 32
        Top = 112
        Width = 146
        Height = 13
        Caption = #23548#20837#26684#24335#65306'RKEY53'#65372#25104#26412
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lbl4: TLabel
        Left = 88
        Top = 132
        Width = 325
        Height = 13
        Caption = #65288#23548#20837#25991#20214#26684#24335#24517#39035#25353#35201#27714#35774#23450#65292#21542#21017#20250#36896#25104#25968#25454#24322#24120#65289
      end
      object edtFile: TEdit
        Left = 32
        Top = 72
        Width = 313
        Height = 21
        TabOrder = 0
      end
      object BitBtn1: TBitBtn
        Left = 240
        Top = 232
        Width = 75
        Height = 25
        Caption = #19979#19968#27493
        TabOrder = 1
        OnClick = BitBtn1Click
      end
      object BitBtn2: TBitBtn
        Left = 328
        Top = 232
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 2
        OnClick = BitBtn2Click
      end
    end
    object ts2: TTabSheet
      Caption = #31532#20108#27493
      ImageIndex = 1
      object rg1: TRadioGroup
        Left = 8
        Top = 5
        Width = 402
        Height = 196
        Caption = #35831#36873#25321#34920#21333
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object BitBtn4: TBitBtn
        Left = 152
        Top = 232
        Width = 75
        Height = 25
        Caption = #19978#19968#27493
        TabOrder = 2
        OnClick = BitBtn4Click
      end
      object BitBtn5: TBitBtn
        Left = 240
        Top = 232
        Width = 75
        Height = 25
        Caption = #23548#20837
        TabOrder = 3
        OnClick = BitBtn5Click
      end
      object BitBtn6: TBitBtn
        Left = 328
        Top = 232
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 4
        OnClick = BitBtn6Click
      end
      object BitBtn3: TBitBtn
        Left = 16
        Top = 200
        Width = 75
        Height = 25
        Caption = #39044#35272
        TabOrder = 1
        OnClick = BitBtn3Click
      end
    end
    object ts3: TTabSheet
      Caption = #31532#19977#27493
      ImageIndex = 2
      DesignSize = (
        417
        262)
      object lbl2: TLabel
        Left = 0
        Top = 96
        Width = 417
        Height = 21
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = #23548#20837#25104#21151#65281
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = #26999#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object BitBtn7: TBitBtn
        Left = 168
        Top = 120
        Width = 75
        Height = 25
        Caption = #23436#25104
        TabOrder = 0
        OnClick = BitBtn7Click
      end
      object pb1: TProgressBar
        Left = 0
        Top = 232
        Width = 417
        Height = 30
        Align = alBottom
        Max = 1000
        Step = 1
        TabOrder = 1
      end
    end
    object ts4: TTabSheet
      Caption = #39044#35272
      ImageIndex = 4
      object BitBtn8: TBitBtn
        Left = 328
        Top = 232
        Width = 75
        Height = 25
        Caption = #36864#20986
        TabOrder = 0
        OnClick = BitBtn8Click
      end
      object dbgrd1: TDBGrid
        Left = 0
        Top = 0
        Width = 417
        Height = 225
        Align = alTop
        DataSource = ds1
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
      end
    end
  end
  object dlgOpen1: TOpenDialog
    Filter = 'Excel 97-2003 '#24037#20316#31807'(*.xls)|*.xls|Excel '#24037#20316#31807'(*.xlsx)|*.xlsx'
    Left = 380
    Top = 99
  end
  object qry1: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 292
    Top = 27
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 252
    Top = 27
  end
  object qryImport: TADOQuery
    Connection = Form1.con1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey53'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'price'
        Attributes = [paSigned]
        DataType = ftFloat
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'Exec sp_Update53Cost;2 :rkey53 , :price')
    Left = 308
    Top = 163
    object qryImportWAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object qryImportDEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object qryImportINV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object qryImportQUAN: TFloatField
      FieldName = 'QUAN'
    end
    object qryImportSTD_PRICE: TFloatField
      FieldName = 'STD_PRICE'
    end
  end
  object con1: TADOConnection
    LoginPrompt = False
    Left = 340
    Top = 27
  end
end
