object frmExcelImport: TfrmExcelImport
  Left = 755
  Top = 571
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
    ActivePage = ts3
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
        Width = 294
        Height = 13
        Caption = #23548#20837#25991#20214#26684#24335#65306#24037#21378#20195#30721'|'#24037#24207#20195#30721'|'#26448#26009#32534#30721'|'#25968#37327
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
        Top = 72
        Width = 417
        Height = 45
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
        WordWrap = True
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
  object con1: TADOConnection
    LoginPrompt = False
    Left = 340
    Top = 27
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
    Connection = DM.Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select WAREHOUSE_CODE,DEPT_CODE,INV_PART_NUMBER,QUAN,STD_PRICE'
      'from Data0462_Import'
      'where 1<>1')
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
  object cmd1: TADOCommand
    CommandText = 'TRUNCATE TABLE Data0462_Import'
    Connection = DM.Conn
    Parameters = <>
    Left = 68
    Top = 67
  end
  object cmdInsert: TADOCommand
    CommandText = 
      'if exists(select 1 from Data0462_Import t where not exists(selec' +
      't 1 from data0015 t15 where t.WAREHOUSE_CODE=t15.WAREHOUSE_CODE)' +
      ')'#13#10#9'Raiserror 39999 '#39#24037#21378#20195#30721#38169#35823#65292#35831#26816#26597#65281#39#13#10'else'#13#10'if exists(select 1 from' +
      ' Data0462_Import t where not exists(select 1 from data0034 t34 w' +
      'here (ttype in (4,5) or (is_cost_dept=1 and cost_dept_ptr=rkey))' +
      ' '#13#10#9'and (ACTIVE_FLAG=0) and t.DEPT_CODE=t34.DEPT_CODE))'#13#10#9'Raiser' +
      'ror 39999 '#39#24037#24207#20195#30721#38169#35823#65292#35831#26816#26597#24037#24207#26159#21542#20026#39030#32423#25104#26412#20013#24515#65281#39#13#10'else'#13#10'if exists(select 1 fro' +
      'm Data0462_Import t where not exists(select 1 from data0017 t17 ' +
      'where t.INV_PART_NUMBER=t17.INV_PART_NUMBER))'#13#10#9'Raiserror 39999 ' +
      #39#26448#26009#32534#30721#38169#35823#65292#35831#26816#26597#65281#39#13#10'else'#13#10#9'insert Data0462(D0443_PTR,DEPT_PTR,INVENT_' +
      'PTR,warehouse_ptr,QUAN,STD_PRICE)'#13#10#9'select :D0443_PTR,t34.RKEY,t' +
      '17.RKEY,t15.RKEY,t.QUAN,t.STD_PRICE'#13#10#9'from Data0462_Import t inn' +
      'er join Data0015 t15 on t.WAREHOUSE_CODE=t15.WAREHOUSE_CODE'#13#10#9'in' +
      'ner join Data0034 t34 on t.DEPT_CODE=t34.DEPT_CODE'#13#10#9'inner join ' +
      'Data0017 t17 on t.INV_PART_NUMBER=t17.INV_PART_NUMBER'
    Connection = DM.Conn
    Parameters = <
      item
        Name = 'D0443_PTR'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    Left = 124
    Top = 67
  end
  object cmdPrice: TADOCommand
    CommandText = 
      'if object_ID('#39'tempdb..#temp'#39') is not null drop table #temp '#13#10'SEL' +
      'ECT D207.INVENTORY_PTR,'#13#10'       ISNULL(SUM((D22.tax_price * D207' +
      '.QUANTITY * D456.exch_rate) / (1 + D22.TAX_2 * 0.01)),0) AS amou' +
      'nt,'#13#10'       ISNULL(SUM(D207.QUANTITY),0) AS QUANTITY'#13#10'INTO #temp' +
      #13#10'FROM   DATA0456 D456 INNER JOIN'#13#10'       DATA0022 D22  ON D456.' +
      'RKEY=D22.GRN_PTR INNER JOIN'#13#10'       DATA0207 D207 ON D22.RKEY=D2' +
      '07.D0022_PTR INNER JOIN'#13#10'       DATA0457 D457 ON D457.RKEY=D207.' +
      'GON_PTR INNER JOIN'#13#10#9'   Data0017 D17 ON D207.INVENTORY_PTR=D17.R' +
      'KEY INNER JOIN'#13#10#9'   Data0015 D15 ON D457.warehouse_ptr=D15.RKEY ' +
      'INNER JOIN'#13#10#9'   Data0462_Import D ON D17.INV_PART_NUMBER=D.INV_P' +
      'ART_NUMBER AND D15.WAREHOUSE_CODE=D.WAREHOUSE_CODE'#13#10'WHERE (D207.' +
      'TDATE>(SELECT MATL_DATE FROM DATA0444 WHERE RKEY=(SELECT EARLY_P' +
      'TR FROM DATA0444 WHERE RKEY= :RKEY444 )) AND '#13#10'       D207.TDATE' +
      '<(SELECT MATL_DATE FROM DATA0444 WHERE RKEY= :RKEY444 ))'#13#10'GROUP ' +
      'BY D207.INVENTORY_PTR'#13#10'UNION ALL'#13#10'SELECT D462.INVENT_PTR AS INVE' +
      'NTORY_PTR,ISNULL(SUM(D462.STD_PRICE * D462.QUAN),0) AS amount,IS' +
      'NULL(SUM(D462.QUAN),0) AS QUANTITY'#13#10'FROM   DATA0462 D462 INNER J' +
      'OIN'#13#10#9'   Data0017 D17 ON D462.INVENT_PTR=D17.RKEY INNER JOIN'#13#10#9' ' +
      '  Data0015 D15 ON D462.warehouse_ptr=D15.RKEY INNER JOIN'#13#10#9'   Da' +
      'ta0462_Import D ON D17.INV_PART_NUMBER=D.INV_PART_NUMBER AND D15' +
      '.WAREHOUSE_CODE=D.WAREHOUSE_CODE'#13#10'WHERE  (D462.D0443_PTR=(SELECT' +
      ' EARLY_PTR FROM DATA0444 WHERE RKEY= :RKEY444 ))'#13#10'GROUP BY D462.' +
      'INVENT_PTR'#13#10#13#10'IF EXISTS(select * from Data0462_Import t inner jo' +
      'in Data0017 t17 on t.INV_PART_NUMBER=t17.INV_PART_NUMBER'#13#10#9#9#9'inn' +
      'er join #temp tt on t17.RKEY=tt.INVENTORY_PTR)'#13#10#9'UPDATE t SET ST' +
      'D_PRICE=tt.amount/tt.QUANTITY'#13#10#9'FROM Data0462_Import t inner joi' +
      'n Data0017 t17 on t.INV_PART_NUMBER=t17.INV_PART_NUMBER'#13#10#9'inner ' +
      'join (select INVENTORY_PTR,SUM(amount) as amount,SUM(QUANTITY) a' +
      's QUANTITY'#13#10#9#9#9#9'from #temp GROUP BY INVENTORY_PTR HAVING SUM(QUA' +
      'NTITY)<>0) as tt ON t17.RKEY=tt.INVENTORY_PTR'#13#10'ELSE'#13#10#9'UPDATE t S' +
      'ET STD_PRICE=Isnull(t17.std_cost,0)'#13#10#9'FROM Data0462_Import t inn' +
      'er join DATA0017 t17 on t.INV_PART_NUMBER=t17.INV_PART_NUMBER'
    Connection = DM.Conn
    Parameters = <
      item
        Name = 'RKEY444'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end
      item
        Name = 'RKEY444'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end
      item
        Name = 'RKEY444'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    Left = 116
    Top = 187
  end
end
