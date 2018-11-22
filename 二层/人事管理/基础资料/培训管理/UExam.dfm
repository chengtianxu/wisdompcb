object frmExam: TfrmExam
  Left = 543
  Top = 238
  Width = 967
  Height = 388
  Caption = #21592#24037#32771#35797
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 959
    Height = 357
    Align = alClient
    TabOrder = 0
    object pnl2: TPanel
      Left = 1
      Top = 1
      Width = 957
      Height = 314
      Align = alClient
      TabOrder = 0
      DesignSize = (
        957
        314)
      object lbl1: TLabel
        Left = 0
        Top = 72
        Width = 609
        Height = 13
        Caption = 
          '----------------------------------------------------------------' +
          '-----------------------'
      end
      object dbtxtNO: TDBText
        Left = 9
        Top = 9
        Width = 21
        Height = 17
        Alignment = taRightJustify
        DataField = 'PNo'
        DataSource = ds1
      end
      object lbl2: TLabel
        Left = 30
        Top = 10
        Width = 7
        Height = 13
        Caption = '.'
      end
      object chkA: TCheckBox
        Left = 19
        Top = 96
        Width = 34
        Height = 17
        Caption = 'A.'
        TabOrder = 0
        OnClick = chkAClick
      end
      object chkB: TCheckBox
        Left = 19
        Top = 138
        Width = 34
        Height = 17
        Caption = 'B.'
        TabOrder = 1
        OnClick = chkBClick
      end
      object chkC: TCheckBox
        Left = 19
        Top = 185
        Width = 34
        Height = 17
        Caption = 'C.'
        TabOrder = 2
        OnClick = chkCClick
      end
      object chkD: TCheckBox
        Left = 19
        Top = 236
        Width = 34
        Height = 17
        Caption = 'D.'
        TabOrder = 3
        OnClick = chkDClick
      end
      object dbmmoPContent: TDBMemo
        Left = 40
        Top = 8
        Width = 895
        Height = 70
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = clBtnFace
        Ctl3D = False
        DataField = 'PContent'
        DataSource = ds1
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 4
      end
      object dbtxtA: TDBMemo
        Left = 53
        Top = 88
        Width = 874
        Height = 45
        Color = clBtnFace
        Ctl3D = False
        DataField = 'A'
        DataSource = ds1
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 5
        OnClick = dbtxtA1Click
      end
      object dbtxtB: TDBMemo
        Left = 52
        Top = 136
        Width = 874
        Height = 45
        Color = clBtnFace
        Ctl3D = False
        DataField = 'B'
        DataSource = ds1
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 6
        OnClick = dbtxtBClick
      end
      object dbtxtC: TDBMemo
        Left = 52
        Top = 184
        Width = 874
        Height = 45
        Color = clBtnFace
        Ctl3D = False
        DataField = 'C'
        DataSource = ds1
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 7
        OnClick = dbtxtCClick
      end
      object dbtxtD: TDBMemo
        Left = 52
        Top = 236
        Width = 874
        Height = 45
        Color = clBtnFace
        Ctl3D = False
        DataField = 'D'
        DataSource = ds1
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 8
        OnClick = dbtxtDClick
      end
    end
    object pnl3: TPanel
      Left = 1
      Top = 315
      Width = 957
      Height = 41
      Align = alBottom
      TabOrder = 1
      object btnLast: TButton
        Left = 456
        Top = 8
        Width = 75
        Height = 25
        Caption = #19978#19968#39064
        TabOrder = 0
        OnClick = btnLastClick
      end
      object btnNext: TButton
        Left = 560
        Top = 7
        Width = 75
        Height = 25
        Caption = #19979#19968#39064
        TabOrder = 1
        OnClick = btnNextClick
      end
      object btn_Commit: TButton
        Left = 168
        Top = 8
        Width = 75
        Height = 25
        Caption = #20132#21367
        TabOrder = 2
        OnClick = btn_CommitClick
      end
    end
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 537
    Top = 89
  end
  object qry1: TADOQuery
    Connection = DM.con
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'tc_ptr'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'declare @TempTable table(sel  char(1),RScore float)      '
      '  insert @TempTable'
      '  values (0,0)'
      ''
      'select a.TC_ptr,a.AScore,b.*,c.*'
      'from  PaperMain a '
      'inner join  PaperDetail  b on a.rkey=b.M_ptr '
      'join @TempTable c  on 1=1 '
      'where a.tc_ptr=:tc_ptr'
      'order by PNO')
    Left = 569
    Top = 89
    object intgrfldqry1TC_ptr: TIntegerField
      FieldName = 'TC_ptr'
    end
    object fltfldqry1AScore: TFloatField
      FieldName = 'AScore'
    end
    object atncfldqry1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object intgrfldqry1M_ptr: TIntegerField
      FieldName = 'M_ptr'
    end
    object intgrfldqry1PType: TIntegerField
      FieldName = 'PType'
    end
    object intgrfldqry1PNo: TIntegerField
      FieldName = 'PNo'
      ReadOnly = True
    end
    object strngfldqry1PContent: TStringField
      FieldName = 'PContent'
      ReadOnly = True
      Size = 100
    end
    object strngfldqry1A: TStringField
      FieldName = 'A'
      ReadOnly = True
      Size = 50
    end
    object strngfldqry1B: TStringField
      FieldName = 'B'
      ReadOnly = True
      Size = 50
    end
    object strngfldqry1C: TStringField
      FieldName = 'C'
      ReadOnly = True
      Size = 50
    end
    object strngfldqry1D: TStringField
      FieldName = 'D'
      ReadOnly = True
      Size = 50
    end
    object strngfldqry1PRight: TStringField
      FieldName = 'PRight'
      FixedChar = True
      Size = 1
    end
    object fltfldqry1Ascore_1: TFloatField
      FieldName = 'Ascore_1'
    end
    object fltfldqry1RScore: TFloatField
      FieldName = 'RScore'
    end
    object strngfldqry1sel: TStringField
      FieldName = 'sel'
      FixedChar = True
      Size = 1
    end
  end
end
