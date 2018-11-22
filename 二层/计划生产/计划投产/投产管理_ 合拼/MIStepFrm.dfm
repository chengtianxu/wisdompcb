object frmMIStep: TfrmMIStep
  Left = 262
  Top = 85
  Width = 1077
  Height = 700
  Caption = 'MI'#27969#31243
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 233
    Height = 662
    Align = alLeft
    TabOrder = 0
    object lbl6: TLabel
      Left = 1
      Top = 1
      Width = 231
      Height = 13
      Align = alTop
      Caption = 'MI'#23618#27425#32467#26500#65306
      Color = clMoneyGreen
      ParentColor = False
    end
    object tvMI: TTreeView
      Left = 1
      Top = 14
      Width = 231
      Height = 647
      Align = alClient
      Indent = 19
      ReadOnly = True
      TabOrder = 0
      OnChange = tvMIChange
    end
  end
  object pnl2: TPanel
    Left = 233
    Top = 0
    Width = 828
    Height = 662
    Align = alClient
    Caption = 'pnl1'
    TabOrder = 1
    object pnl4: TPanel
      Left = 297
      Top = 1
      Width = 530
      Height = 660
      Align = alClient
      Caption = 'pnl1'
      TabOrder = 0
      object pnl5: TPanel
        Left = 1
        Top = 435
        Width = 528
        Height = 224
        Align = alBottom
        TabOrder = 0
        object lbl4: TLabel
          Left = 1
          Top = 1
          Width = 526
          Height = 13
          Align = alTop
          Caption = #24211#23384#25968#25454#65306
          Color = clMoneyGreen
          ParentColor = False
        end
        object eh4: TDBGridEh
          Left = 1
          Top = 14
          Width = 526
          Height = 209
          Align = alClient
          DataSource = ds53
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -13
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'CODE'
              Footers = <>
              Title.Caption = #20179#24211#20195#30721
            end
            item
              EditButtons = <>
              FieldName = 'LOCATION'
              Footers = <>
              Title.Caption = #20179#24211#21517#31216
            end
            item
              EditButtons = <>
              FieldName = 'COLUMN1'
              Footers = <>
              Title.Caption = #25968#37327
            end
            item
              EditButtons = <>
              FieldName = 'ABBR_NAME'
              Footers = <>
              Title.Caption = #24037#21378
            end>
        end
      end
      object pnl6: TPanel
        Left = 1
        Top = 1
        Width = 528
        Height = 210
        Align = alClient
        TabOrder = 1
        object lbl3: TLabel
          Left = 1
          Top = 1
          Width = 526
          Height = 13
          Align = alTop
          Caption = #24037#24207#21442#25968#65306
          Color = clMoneyGreen
          ParentColor = False
        end
        object eh2: TDBGridEh
          Left = 1
          Top = 14
          Width = 526
          Height = 195
          Align = alClient
          DataSource = ds38_494
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -13
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'seq_no'
              Footers = <>
              Title.Caption = #24207#21495
              Width = 30
            end
            item
              EditButtons = <>
              FieldName = 'step_number'
              Footers = <>
              Title.Caption = #27493#39588
              Width = 30
            end
            item
              EditButtons = <>
              FieldName = 'PARAMETER_NAME'
              Footers = <>
              Title.Caption = #21442#25968#20195#30721
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'PARAMETER_DESC'
              Footers = <>
              Title.Caption = #21442#25968#21517#31216
              Width = 150
            end
            item
              EditButtons = <>
              FieldName = 'PARAMETER_VALUE'
              Footers = <>
              Title.Caption = #21442#25968#20540
              Width = 100
            end>
        end
      end
      object pnl7: TPanel
        Left = 1
        Top = 211
        Width = 528
        Height = 224
        Align = alBottom
        TabOrder = 2
        object lbl1: TLabel
          Left = 1
          Top = 129
          Width = 526
          Height = 13
          Align = alTop
          Caption = #31561#32423#25351#31034#65306
          Color = clMoneyGreen
          ParentColor = False
        end
        object lbl2: TLabel
          Left = 1
          Top = 1
          Width = 526
          Height = 13
          Align = alTop
          Caption = #21152#24037#25351#31034#65306
          Color = clMoneyGreen
          ParentColor = False
        end
        object dbmmodept_note: TDBMemo
          Left = 1
          Top = 142
          Width = 526
          Height = 81
          Align = alClient
          DataField = 'grade_note'
          DataSource = ds38
          ReadOnly = True
          TabOrder = 0
        end
        object dbmmoDEF_ROUT_INST: TDBMemo
          Left = 1
          Top = 14
          Width = 526
          Height = 115
          Align = alTop
          DataField = 'DEF_ROUT_INST'
          DataSource = ds38
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
    object pnl3: TPanel
      Left = 1
      Top = 1
      Width = 296
      Height = 660
      Align = alLeft
      TabOrder = 1
      object lbl5: TLabel
        Left = 1
        Top = 1
        Width = 294
        Height = 13
        Align = alTop
        Caption = #24037#24207#27969#31243#65306
        Color = clMoneyGreen
        ParentColor = False
      end
      object eh3: TDBGridEh
        Left = 1
        Top = 14
        Width = 294
        Height = 645
        Align = alClient
        DataSource = ds38
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'STEP_NUMBER'
            Footers = <>
            Title.Caption = #27493#39588
            Width = 30
          end
          item
            EditButtons = <>
            FieldName = 'DEPT_CODE'
            Footers = <>
            Title.Caption = #24037#24207#20195#30721
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'DEPT_NAME'
            Footers = <>
            Title.Caption = #24037#24207#21517#31216
            Width = 100
          end>
      end
    end
  end
  object ads38: TADODataSet
    Connection = DM.ADOConnection1
    CommandText = 
      'SELECT STEP_NUMBER,DEPT_CODE,DEPT_NAME,Data0025.RKEY as rkey25,D' +
      'ata0038.DEF_ROUT_INST,data0034.rkey as rkey34, data0038.grade_no' +
      'te,data0038.rkey as rkey38, SUM(QTY_BACKLOG) as OnLinePcs, SUM(D' +
      'ata0056.PANELS) as OnLinesPnl,grade_code  FROM Data0038 '#13#10'INNER ' +
      'JOIN Data0025 ON SOURCE_PTR = Data0025.RKEY'#13#10'INNER JOIN Data0034' +
      ' ON Data0038.DEPT_PTR = Data0034.RKEY'#13#10'LEFT JOIN Data0006 ON BOM' +
      '_PTR = Data0025.RKEY'#13#10'LEFT JOIN Data0056 ON WO_PTR = Data0006.RK' +
      'EY AND Data0038.DEPT_PTR = Data0056.DEPT_PTR'#13#10'WHERE SOURCE_PTR =' +
      ' :P1'#13#10'GROUP BY STEP_NUMBER,DEPT_CODE,DEPT_NAME,Data0025.RKEY,Dat' +
      'a0038.DEF_ROUT_INST,data0034.rkey,data0038.rkey ,grade_code,data' +
      '0038.grade_note'#13#10'order by step_number asc'
    IndexFieldNames = 'step_number'
    Parameters = <
      item
        Name = 'P1'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 298
    Top = 201
    object ads38STEP_NUMBER: TSmallintField
      FieldName = 'STEP_NUMBER'
    end
    object ads38DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ads38DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ads38rkey25: TAutoIncField
      FieldName = 'rkey25'
      ReadOnly = True
    end
    object ads38DEF_ROUT_INST: TStringField
      FieldName = 'DEF_ROUT_INST'
      Size = 400
    end
    object ads38rkey34: TAutoIncField
      FieldName = 'rkey34'
      ReadOnly = True
    end
    object ads38rkey38: TAutoIncField
      FieldName = 'rkey38'
      ReadOnly = True
    end
    object ads38OnLinePcs: TFloatField
      FieldName = 'OnLinePcs'
      ReadOnly = True
    end
    object ads38OnLinesPnl: TIntegerField
      FieldName = 'OnLinesPnl'
      ReadOnly = True
    end
    object ads38grade_code: TStringField
      FieldName = 'grade_code'
      Size = 10
    end
    object ads38grade_note: TWideStringField
      FieldName = 'grade_note'
      Size = 2048
    end
  end
  object ds38: TDataSource
    DataSet = ads38
    Left = 346
    Top = 201
  end
  object ads38_494: TADODataSet
    Connection = DM.ADOConnection1
    CommandText = 
      'SELECT seq_no,Data0494.step_number,PARAMETER_NAME,PARAMETER_DESC' +
      ',PARAMETER_VALUE FROM Data0494'#13#10'INNER JOIN Data0025 ON custpart_' +
      'ptr = RKEY'#13#10'INNER JOIN Data0038 ON Data0038.STEP_NUMBER = Data04' +
      '94.step_number AND custpart_ptr = Data0038.SOURCE_PTR'#13#10'INNER JOI' +
      'N Data0278 ON PARAMETER_PTR = Data0278.RKEY'#13#10'WHERE Data0038.RKEY' +
      ' = :rkey38'#13#10'order by seq_no asc'
    DataSource = ds38
    MasterFields = 'rkey38'
    Parameters = <
      item
        Name = 'rkey38'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 672
    Top = 113
    object ads38_494seq_no: TSmallintField
      FieldName = 'seq_no'
    end
    object ads38_494step_number: TSmallintField
      FieldName = 'step_number'
    end
    object ads38_494PARAMETER_NAME: TStringField
      FieldName = 'PARAMETER_NAME'
      Size = 10
    end
    object ads38_494PARAMETER_VALUE: TStringField
      FieldName = 'PARAMETER_VALUE'
      Size = 30
    end
    object ads38_494PARAMETER_DESC: TStringField
      FieldName = 'PARAMETER_DESC'
    end
  end
  object ds38_494: TDataSource
    DataSet = ads38_494
    Left = 712
    Top = 113
  end
  object ads53: TADODataSet
    Connection = DM.ADOConnection1
    CommandText = 
      'SELECT CODE,LOCATION,SUM(Data0025.QTY_ON_HAND),ABBR_NAME FROM Da' +
      'ta0053'#13#10'INNER JOIN Data0025 ON Data0053.CUST_PART_PTR = Data0025' +
      '.RKEY'#13#10'INNER JOIN Data0015 ON WHSE_PTR = Data0015.RKEY'#13#10'INNER JO' +
      'IN Data0016 ON LOC_PTR = Data0016.RKEY'#13#10'WHERE Data0025.RKEY = :r' +
      'key25'#13#10'GROUP BY ABBR_NAME,LOCATION,CODE'#13#10
    DataSource = ds38
    MasterFields = 'rkey25'
    Parameters = <
      item
        Name = 'rkey25'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 712
    Top = 529
    object ads53CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object ads53LOCATION: TStringField
      FieldName = 'LOCATION'
    end
    object ads53COLUMN1: TIntegerField
      FieldName = 'COLUMN1'
      ReadOnly = True
    end
    object ads53ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
  end
  object ds53: TDataSource
    DataSet = ads53
    Left = 760
    Top = 529
  end
end
