object Form1: TForm1
  Left = 205
  Top = 142
  Width = 844
  Height = 568
  Caption = #22806#24065#31185#30446#26399#21021#20313#39069#35774#23450
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 828
    Height = 489
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = 'GL_ACC_NUMBER'
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = 'GL_DESCRIPTION'
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = 'dbcr'
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = 'CURR_CODE'
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = 'CURR_NAME'
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = 'BASE_TO_OTHER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TYR_OPEN_ORIG'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TYR_DEBIT_ORIG'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TYR_CREDIT_ORIG'
        Width = 80
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 828
    Height = 41
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 409
      Top = 12
      Width = 52
      Height = 13
      Caption = #24403#21069#24180#24230
    end
    object Label2: TLabel
      Left = 536
      Top = 12
      Width = 52
      Height = 13
      Caption = #24403#21069#26399#38388
    end
    object Edit1: TEdit
      Left = 464
      Top = 8
      Width = 65
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 0
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 592
      Top = 8
      Width = 65
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 1
      Text = 'Edit2'
    end
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 70
      Height = 25
      Caption = #36864#20986
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 78
      Top = 8
      Width = 70
      Height = 25
      Caption = #20445#23384
      TabOrder = 3
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 150
      Top = 8
      Width = 70
      Height = 25
      Caption = #26356#26032#24080#22871
      TabOrder = 4
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 222
      Top = 8
      Width = 70
      Height = 25
      Caption = #23548#20986'Eecel'
      TabOrder = 5
      OnClick = Button4Click
    end
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 208
  end
  object ADODataSet1: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT     dbo.Data0103.GL_ACC_NUMBER, dbo.Data0103.GL_DESCRIPTI' +
      'ON, '#13#10'case dbo.Data0103.DB_CR'#13#10'when '#39'D'#39' then '#39#20511#39' else '#39#36151#39' end as' +
      ' dbcr,'#13#10'dbo.Data0001.CURR_CODE, dbo.Data0001.CURR_NAME, '#13#10'dbo.Da' +
      'ta0001.BASE_TO_OTHER, dbo.Data0103.TYR_OPEN_ORIG,'#13#10'data0103.TYR_' +
      'DEBIT_ORIG, data0103.TYR_CREDIT_ORIG,'#13#10'data0103.PARENT_PTR'#13#10'FROM' +
      '         dbo.Data0001 INNER JOIN'#13#10'                      dbo.Data' +
      '0103 ON dbo.Data0001.RKEY = dbo.Data0103.CURR_PTR'#13#10'WHERE     (db' +
      'o.Data0103.HAS_CHILD = 0) AND (dbo.Data0103.CURR_TP = 2)'#13#10'order ' +
      'by Data0103.GL_ACC_NUMBER'
    Parameters = <>
    Left = 72
    Top = 208
    object ADODataSet1GL_ACC_NUMBER: TStringField
      DisplayLabel = #31185#30446#20195#30721
      DisplayWidth = 13
      FieldName = 'GL_ACC_NUMBER'
      ReadOnly = True
      Size = 18
    end
    object ADODataSet1GL_DESCRIPTION: TStringField
      DisplayLabel = #31185#30446#21517#31216
      DisplayWidth = 19
      FieldName = 'GL_DESCRIPTION'
      ReadOnly = True
      Size = 50
    end
    object ADODataSet1CURR_CODE: TStringField
      DisplayLabel = #36135#24065#20195#30721
      DisplayWidth = 9
      FieldName = 'CURR_CODE'
      ReadOnly = True
      Size = 5
    end
    object ADODataSet1CURR_NAME: TStringField
      DisplayLabel = #36135#24065#21517#31216
      DisplayWidth = 11
      FieldName = 'CURR_NAME'
      ReadOnly = True
    end
    object ADODataSet1BASE_TO_OTHER: TFloatField
      DisplayLabel = #24403#21069#27719#29575
      DisplayWidth = 13
      FieldName = 'BASE_TO_OTHER'
      ReadOnly = True
    end
    object ADODataSet1TYR_OPEN_ORIG: TBCDField
      DisplayLabel = #26399#21021#20313#39069'('#21407#24065')'
      DisplayWidth = 15
      FieldName = 'TYR_OPEN_ORIG'
      DisplayFormat = '#,0.00'
      Precision = 19
    end
    object ADODataSet1dbcr: TStringField
      DisplayLabel = #20313#39069#26041#21521
      FieldName = 'dbcr'
      ReadOnly = True
      Size = 2
    end
    object ADODataSet1TYR_DEBIT_ORIG: TBCDField
      DisplayLabel = #26412#24180#20511#26041#32047#35745
      FieldName = 'TYR_DEBIT_ORIG'
      DisplayFormat = '#,0.00'
      Precision = 19
    end
    object ADODataSet1TYR_CREDIT_ORIG: TBCDField
      DisplayLabel = #26412#24180#36151#26041#32047#35745
      FieldName = 'TYR_CREDIT_ORIG'
      DisplayFormat = '#,0.00'
      Precision = 19
    end
    object ADODataSet1PARENT_PTR: TIntegerField
      FieldName = 'PARENT_PTR'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 112
    Top = 208
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 72
    Top = 248
  end
  object ADOCommand1: TADOCommand
    CommandText = 
      'UPDATE Data0103'#13#10' SET TYR_OPEN_ORIG= TYR_OPEN_ORIG + :open_orig,' +
      #13#10'         TYR_DEBIT_ORIG= TYR_DEBIT_ORIG + :debit_orig,'#13#10'      ' +
      '   TYR_CREDIT_ORIG=TYR_CREDIT_ORIG + :credit_orig '#13#10'WHERE Data01' +
      '03.rkey=:rkey'#13#10' '
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'open_orig'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        NumericScale = 4
        Precision = 19
        Size = 8
        Value = Null
      end
      item
        Name = 'debit_orig'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        NumericScale = 4
        Precision = 19
        Size = 8
        Value = Null
      end
      item
        Name = 'credit_orig'
        Attributes = [paSigned, paNullable]
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
    Top = 248
  end
end
