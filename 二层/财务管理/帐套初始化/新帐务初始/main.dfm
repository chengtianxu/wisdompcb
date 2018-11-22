object Form1: TForm1
  Left = 218
  Top = 119
  Width = 853
  Height = 579
  Caption = #36130#21153#21021#22987#25968#25454
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 837
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 345
      Top = 12
      Width = 52
      Height = 13
      Caption = #24403#21069#24180#24230
    end
    object Label2: TLabel
      Left = 472
      Top = 12
      Width = 52
      Height = 13
      Caption = #24403#21069#26399#38388
    end
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 70
      Height = 25
      Caption = #36864#20986
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 78
      Top = 8
      Width = 70
      Height = 25
      Caption = #20445#23384
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 219
      Top = 8
      Width = 70
      Height = 25
      Caption = #26356#26032#24080#22871
      Enabled = False
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 148
      Top = 8
      Width = 70
      Height = 25
      Caption = #23548#20986'Eecel'
      TabOrder = 3
      OnClick = Button4Click
    end
    object SpinEdit1: TSpinEdit
      Left = 401
      Top = 8
      Width = 65
      Height = 22
      MaxValue = 3000
      MinValue = 2008
      TabOrder = 4
      Value = 2008
    end
    object SpinEdit2: TSpinEdit
      Left = 529
      Top = 8
      Width = 65
      Height = 22
      MaxValue = 12
      MinValue = 0
      TabOrder = 5
      Value = 0
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 41
    Width = 837
    Height = 500
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = #26126#32454#31185#30446
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 829
        Height = 472
        Align = alClient
        DataSource = DataSource1
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        FooterRowCount = 1
        FrozenCols = 2
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        UseMultiTitle = True
        OnColExit = DBGridEh1ColExit
        OnDrawColumnCell = DBGridEh1DrawColumnCell
        OnKeyDown = DBGridEh1KeyDown
        Columns = <
          item
            EditButtons = <>
            FieldName = 'GL_ACC_NUMBER'
            Footers = <>
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'GL_DESCRIPTION'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'CURR_CODE'
            Footers = <>
            Width = 38
          end
          item
            EditButtons = <>
            FieldName = 'BASE_TO_OTHER'
            Footers = <>
            Width = 49
          end
          item
            EditButtons = <>
            FieldName = 'dbcr'
            Footer.Value = #21512#35745
            Footer.ValueType = fvtStaticText
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'TYR_OPEN'
            Footer.Color = clMoneyGreen
            Footer.DisplayFormat = '#,0.00'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 98
          end
          item
            EditButtons = <>
            FieldName = 'TYR_DEBIT'
            Footer.Color = clMoneyGreen
            Footer.DisplayFormat = '#,0.00'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 85
          end
          item
            EditButtons = <>
            FieldName = 'TYR_CREDIT'
            Footer.Color = clMoneyGreen
            Footer.DisplayFormat = '#,0.00'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 90
          end
          item
            EditButtons = <>
            FieldName = 'TYR_OPEN_ORIG'
            Footer.Color = clMoneyGreen
            Footer.DisplayFormat = '#,0.00'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'TYR_DEBIT_ORIG'
            Footer.Color = clMoneyGreen
            Footer.DisplayFormat = '#,0.00'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 84
          end
          item
            EditButtons = <>
            FieldName = 'TYR_CREDIT_ORIG'
            Footer.Color = clMoneyGreen
            Footer.DisplayFormat = '#,0.00'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 88
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = #35797#31639#24179#34913
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 829
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label3: TLabel
          Left = 48
          Top = 16
          Width = 376
          Height = 16
          Caption = #36164#20135#31561#20110#36127#20538#21152#25152#26377#32773#26435#30410#35797#31639#24179#34913#21487#20197#24320#21551#24080#22871'!!!'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          Visible = False
        end
      end
      object DBGridEh2: TDBGridEh
        Left = 0
        Top = 41
        Width = 829
        Height = 431
        Align = alClient
        DataSource = DataSource2
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        FooterRowCount = 1
        FrozenCols = 2
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
        ReadOnly = True
        SumList.Active = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        UseMultiTitle = True
        OnDrawColumnCell = DBGridEh1DrawColumnCell
        Columns = <
          item
            EditButtons = <>
            FieldName = 'GL_ACC_NUMBER'
            Footers = <>
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'GL_DESCRIPTION'
            Footers = <>
            Width = 129
          end
          item
            EditButtons = <>
            FieldName = 'CURR_CODE'
            Footers = <>
            Width = 38
          end
          item
            EditButtons = <>
            FieldName = 'BASE_TO_OTHER'
            Footers = <>
            Width = 49
          end
          item
            EditButtons = <>
            FieldName = 'dbcr'
            Footer.Value = #21512#35745
            Footer.ValueType = fvtStaticText
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'OPEN_DEBIT'
            Footer.DisplayFormat = '#,0.00'
            Footer.ValueType = fvtSum
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'OPEN_CREDIT'
            Footer.DisplayFormat = '#,0.00'
            Footer.ValueType = fvtSum
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'TYR_DEBIT'
            Footer.Color = clMoneyGreen
            Footer.DisplayFormat = '#,0.00'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 81
          end
          item
            EditButtons = <>
            FieldName = 'TYR_CREDIT'
            Footer.Color = clMoneyGreen
            Footer.DisplayFormat = '#,0.00'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 75
          end
          item
            EditButtons = <>
            FieldName = 'OPEN_ORIG_DEBIT'
            Footer.DisplayFormat = '#,0.00'
            Footer.ValueType = fvtSum
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'OPEN_ORIG_CREDIT'
            Footer.DisplayFormat = '#,0.00'
            Footer.ValueType = fvtSum
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'TYR_DEBIT_ORIG'
            Footer.Color = clMoneyGreen
            Footer.DisplayFormat = '#,0.00'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'TYR_CREDIT_ORIG'
            Footer.Color = clMoneyGreen
            Footer.DisplayFormat = '#,0.00'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 84
          end>
      end
    end
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 208
  end
  object ADS103: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    AfterScroll = ADS103AfterScroll
    CommandText = 
      'SELECT     dbo.Data0103.GL_ACC_NUMBER, dbo.Data0103.GL_DESCRIPTI' +
      'ON, '#13#10'case dbo.Data0103.DB_CR'#13#10'when '#39'D'#39' then '#39#20511#39' else '#39#36151#39' end as' +
      ' dbcr,'#13#10'dbo.Data0001.CURR_CODE, dbo.Data0001.CURR_NAME, '#13#10'dbo.Da' +
      'ta0001.BASE_TO_OTHER, dbo.Data0103.TYR_OPEN_ORIG,'#13#10'data0103.TYR_' +
      'DEBIT_ORIG, data0103.TYR_CREDIT_ORIG,'#13#10'data0103.TYR_OPEN, data01' +
      '03.TYR_DEBIT, data0103.TYR_CREDIT,'#13#10'data0103.PARENT_PTR'#13#10'FROM   ' +
      '      dbo.Data0001  RIGHT OUTER JOIN'#13#10'                      dbo.' +
      'Data0103 ON dbo.Data0001.RKEY = dbo.Data0103.CURR_PTR'#13#10'WHERE    ' +
      ' (dbo.Data0103.HAS_CHILD = 0) '#13#10'order by Data0103.GL_ACC_NUMBER'
    Parameters = <>
    Left = 72
    Top = 208
    object ADS103GL_ACC_NUMBER: TStringField
      DisplayLabel = #31185#30446#20195#30721
      DisplayWidth = 13
      FieldName = 'GL_ACC_NUMBER'
      ReadOnly = True
      Size = 18
    end
    object ADS103GL_DESCRIPTION: TStringField
      DisplayLabel = #31185#30446#21517#31216
      DisplayWidth = 19
      FieldName = 'GL_DESCRIPTION'
      ReadOnly = True
      Size = 50
    end
    object ADS103CURR_CODE: TStringField
      DisplayLabel = #36135#24065#20195#30721
      DisplayWidth = 9
      FieldName = 'CURR_CODE'
      ReadOnly = True
      Size = 5
    end
    object ADS103CURR_NAME: TStringField
      DisplayLabel = #36135#24065#21517#31216
      DisplayWidth = 11
      FieldName = 'CURR_NAME'
      ReadOnly = True
    end
    object ADS103BASE_TO_OTHER: TFloatField
      DisplayLabel = #27719#29575
      DisplayWidth = 10
      FieldName = 'BASE_TO_OTHER'
      ReadOnly = True
    end
    object ADS103dbcr: TStringField
      DisplayLabel = #20313#39069#26041#21521
      DisplayWidth = 4
      FieldName = 'dbcr'
      ReadOnly = True
      Size = 2
    end
    object ADS103PARENT_PTR: TIntegerField
      DisplayWidth = 10
      FieldName = 'PARENT_PTR'
      ReadOnly = True
    end
    object ADS103TYR_OPEN_ORIG: TBCDField
      DisplayLabel = #26399#21021#20313#39069'('#21407#24065')'
      DisplayWidth = 15
      FieldName = 'TYR_OPEN_ORIG'
      DisplayFormat = '#,0.00'
      Precision = 19
    end
    object ADS103TYR_DEBIT_ORIG: TBCDField
      DisplayLabel = #26412#24180#32047#35745#21407#24065'|'#20511#26041
      DisplayWidth = 20
      FieldName = 'TYR_DEBIT_ORIG'
      DisplayFormat = '#,0.00'
      Precision = 19
    end
    object ADS103TYR_CREDIT_ORIG: TBCDField
      DisplayLabel = #26412#24180#32047#35745#21407#24065'|'#36151#26041
      DisplayWidth = 20
      FieldName = 'TYR_CREDIT_ORIG'
      DisplayFormat = '#,0.00'
      Precision = 19
    end
    object ADS103TYR_OPEN: TBCDField
      DisplayLabel = #26399#21021#20313#39069'('#26412#24065')'
      DisplayWidth = 20
      FieldName = 'TYR_OPEN'
      DisplayFormat = '#,0.00'
      Precision = 19
    end
    object ADS103TYR_DEBIT: TBCDField
      DisplayLabel = #26412#24180#32047#35745#26412#24065'|'#20511#26041
      DisplayWidth = 20
      FieldName = 'TYR_DEBIT'
      DisplayFormat = '#,0.00'
      Precision = 19
    end
    object ADS103TYR_CREDIT: TBCDField
      DisplayLabel = #26412#24180#32047#35745#26412#24065'|'#36151#26041
      DisplayWidth = 20
      FieldName = 'TYR_CREDIT'
      DisplayFormat = '#,0.00'
      Precision = 19
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS103
    Left = 112
    Top = 208
  end
  object ADS508: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'SELECT CURR_FYEAR, CURR_PERIOD, INITIALIZED, CONTROL_DATE'#13#10'FROM ' +
      'Data0508'
    Parameters = <>
    Left = 72
    Top = 248
    object ADS508CURR_FYEAR: TIntegerField
      FieldName = 'CURR_FYEAR'
    end
    object ADS508CURR_PERIOD: TSmallintField
      FieldName = 'CURR_PERIOD'
    end
    object ADS508INITIALIZED: TSmallintField
      FieldName = 'INITIALIZED'
    end
    object ADS508CONTROL_DATE: TDateTimeField
      FieldName = 'CONTROL_DATE'
    end
  end
  object ADOCommand1: TADOCommand
    CommandText = 
      'UPDATE Data0103'#13#10' SET '#13#10'        TYR_OPEN= TYR_OPEN + :open,'#13#10'   ' +
      '      TYR_DEBIT= TYR_DEBIT + :debit,'#13#10'         TYR_CREDIT=TYR_CR' +
      'EDIT + :credit,        '#13#10'        TYR_OPEN_ORIG= TYR_OPEN_ORIG + ' +
      ':open_orig,'#13#10'         TYR_DEBIT_ORIG= TYR_DEBIT_ORIG + :debit_or' +
      'ig,'#13#10'         TYR_CREDIT_ORIG=TYR_CREDIT_ORIG + :credit_orig '#13#10'W' +
      'HERE Data0103.rkey=:rkey'#13#10' '
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'open'
        Attributes = [paSigned]
        DataType = ftBCD
        NumericScale = 4
        Precision = 19
        Size = 8
        Value = Null
      end
      item
        Name = 'debit'
        Attributes = [paSigned]
        DataType = ftBCD
        NumericScale = 4
        Precision = 19
        Size = 8
        Value = Null
      end
      item
        Name = 'credit'
        Attributes = [paSigned]
        DataType = ftBCD
        NumericScale = 4
        Precision = 19
        Size = 8
        Value = Null
      end
      item
        Name = 'open_orig'
        Attributes = [paSigned]
        DataType = ftBCD
        NumericScale = 4
        Precision = 19
        Size = 8
        Value = Null
      end
      item
        Name = 'debit_orig'
        Attributes = [paSigned]
        DataType = ftBCD
        NumericScale = 4
        Precision = 19
        Size = 8
        Value = Null
      end
      item
        Name = 'credit_orig'
        Attributes = [paSigned]
        DataType = ftBCD
        NumericScale = 4
        Precision = 19
        Size = 8
        Value = Null
      end
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 112
    Top = 280
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 72
    Top = 280
  end
  object adstype0_103: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = adstype0_103CalcFields
    CommandText = 
      'SELECT     dbo.Data0103.GL_ACC_NUMBER, dbo.Data0103.GL_DESCRIPTI' +
      'ON, '#13#10'case dbo.Data0103.DB_CR'#13#10'when '#39'D'#39' then '#39#20511#39' else '#39#36151#39' end as' +
      ' dbcr,'#13#10'dbo.Data0001.CURR_CODE, dbo.Data0001.CURR_NAME, '#13#10'dbo.Da' +
      'ta0001.BASE_TO_OTHER, dbo.Data0103.TYR_OPEN_ORIG,'#13#10'data0103.TYR_' +
      'DEBIT_ORIG, data0103.TYR_CREDIT_ORIG,'#13#10'data0103.TYR_OPEN, data01' +
      '03.TYR_DEBIT, data0103.TYR_CREDIT,'#13#10'data0103.PARENT_PTR'#13#10'FROM   ' +
      '      dbo.Data0001  RIGHT OUTER JOIN'#13#10'                      dbo.' +
      'Data0103 ON dbo.Data0001.RKEY = dbo.Data0103.CURR_PTR'#13#10'WHERE    ' +
      ' (dbo.Data0103.ttype = 0) '#13#10'order by Data0103.GL_ACC_NUMBER'
    Parameters = <>
    Left = 154
    Top = 208
    object ADStype0_103GL_ACC_NUMBER: TStringField
      DisplayLabel = #31185#30446#20195#30721
      DisplayWidth = 13
      FieldName = 'GL_ACC_NUMBER'
      ReadOnly = True
      Size = 18
    end
    object ADStype0_103gl_description: TStringField
      DisplayLabel = #31185#30446#21517#31216
      DisplayWidth = 19
      FieldName = 'GL_DESCRIPTION'
      ReadOnly = True
      Size = 50
    end
    object StringField3: TStringField
      DisplayLabel = #36135#24065#20195#30721
      DisplayWidth = 9
      FieldName = 'CURR_CODE'
      ReadOnly = True
      Size = 5
    end
    object StringField4: TStringField
      DisplayLabel = #36135#24065#21517#31216
      DisplayWidth = 11
      FieldName = 'CURR_NAME'
      ReadOnly = True
    end
    object FloatField1: TFloatField
      DisplayLabel = #27719#29575
      DisplayWidth = 10
      FieldName = 'BASE_TO_OTHER'
      ReadOnly = True
    end
    object ADStype0_103dbcr: TStringField
      DisplayLabel = #20313#39069#26041#21521
      DisplayWidth = 4
      FieldName = 'dbcr'
      ReadOnly = True
      Size = 2
    end
    object IntegerField1: TIntegerField
      DisplayWidth = 10
      FieldName = 'PARENT_PTR'
      ReadOnly = True
    end
    object ADStype0_103tyr_open_orig: TBCDField
      DisplayLabel = #26399#21021#20313#39069'('#21407#24065')'
      DisplayWidth = 15
      FieldName = 'TYR_OPEN_ORIG'
      DisplayFormat = '#,0.00'
      Precision = 19
    end
    object BCDField2: TBCDField
      DisplayLabel = #26412#24180#32047#35745#21407#24065'|'#20511#26041
      DisplayWidth = 20
      FieldName = 'TYR_DEBIT_ORIG'
      DisplayFormat = '#,0.00'
      Precision = 19
    end
    object BCDField3: TBCDField
      DisplayLabel = #26412#24180#32047#35745#21407#24065'|'#36151#26041
      DisplayWidth = 20
      FieldName = 'TYR_CREDIT_ORIG'
      DisplayFormat = '#,0.00'
      Precision = 19
    end
    object ADStype0_103tyr_open: TBCDField
      DisplayLabel = #26399#21021#20313#39069'('#26412#24065')'
      DisplayWidth = 20
      FieldName = 'TYR_OPEN'
      DisplayFormat = '#,0.00'
      Precision = 19
    end
    object BCDField5: TBCDField
      DisplayLabel = #26412#24180#32047#35745#26412#24065'|'#20511#26041
      DisplayWidth = 20
      FieldName = 'TYR_DEBIT'
      DisplayFormat = '#,0.00'
      Precision = 19
    end
    object BCDField6: TBCDField
      DisplayLabel = #26412#24180#32047#35745#26412#24065'|'#36151#26041
      DisplayWidth = 20
      FieldName = 'TYR_CREDIT'
      DisplayFormat = '#,0.00'
      Precision = 19
    end
    object adstype0_103OPEN_DEBIT: TCurrencyField
      DisplayLabel = #26399#21021#20313#39069#26412#24065'|'#20511#26041
      FieldKind = fkCalculated
      FieldName = 'OPEN_DEBIT'
      DisplayFormat = '#,0.00'
      Calculated = True
    end
    object adstype0_103OPEN_CREDIT: TCurrencyField
      DisplayLabel = #26399#21021#20313#39069#26412#24065'|'#36151#26041
      FieldKind = fkCalculated
      FieldName = 'OPEN_CREDIT'
      DisplayFormat = '#,0.00'
      Calculated = True
    end
    object adstype0_103OPEN_ORIG_DEBIT: TCurrencyField
      DisplayLabel = #26399#21021#20313#39069#21407#24065'|'#20511#26041
      FieldKind = fkCalculated
      FieldName = 'OPEN_ORIG_DEBIT'
      DisplayFormat = '#,0.00'
      Calculated = True
    end
    object adstype0_103OPEN_ORIG_CREDIT: TCurrencyField
      DisplayLabel = #26399#21021#20313#39069#21407#24065'|'#36151#26041
      FieldKind = fkCalculated
      FieldName = 'OPEN_ORIG_CREDIT'
      DisplayFormat = '#,0.00'
      Calculated = True
    end
  end
  object DataSource2: TDataSource
    DataSet = adstype0_103
    Left = 194
    Top = 208
  end
end
