object Form_vouchersearch: TForm_vouchersearch
  Left = 331
  Top = 165
  Width = 694
  Height = 558
  Caption = #22797#21046#20973#35777#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 289
    Width = 678
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 678
    Height = 38
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      678
      38)
    object Label2: TLabel
      Left = 415
      Top = 13
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight, akBottom]
      Caption = #20250#35745#24180#24230':'
    end
    object Label3: TLabel
      Left = 566
      Top = 13
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight, akBottom]
      Caption = #20250#35745#26399#38388':'
    end
    object Label1: TLabel
      Left = 99
      Top = 13
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #20973#35777#32534#21495
    end
    object SpinEdit1: TSpinEdit
      Left = 476
      Top = 8
      Width = 85
      Height = 22
      Anchors = [akTop, akRight, akBottom]
      MaxValue = 9999
      MinValue = 2000
      TabOrder = 1
      Value = 2007
      OnChange = SpinEdit1Change
    end
    object SpinEdit2: TSpinEdit
      Left = 627
      Top = 8
      Width = 49
      Height = 22
      Anchors = [akTop, akRight, akBottom]
      MaxLength = 1
      MaxValue = 12
      MinValue = 1
      TabOrder = 2
      Value = 1
      OnChange = SpinEdit1Change
    end
    object Edit1: TEdit
      Left = 157
      Top = 10
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object BitBtn1: TBitBtn
      Left = 13
      Top = 7
      Width = 75
      Height = 25
      Cancel = True
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 3
    end
    object CheckBox1: TCheckBox
      Left = 331
      Top = 12
      Width = 74
      Height = 17
      Caption = #33258#21160#20801#38144
      TabOrder = 4
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 38
    Width = 678
    Height = 251
    Align = alTop
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGridEh1DblClick
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'VOUCHER'
        Footers = <>
        Title.Color = clRed
        Title.SortIndex = 1
        Title.SortMarker = smUpEh
        Width = 107
      end
      item
        EditButtons = <>
        FieldName = 'ENTERED_DT'
        Footers = <>
        ReadOnly = False
      end
      item
        EditButtons = <>
        FieldName = 'FYEAR'
        Footers = <>
        ReadOnly = False
      end
      item
        EditButtons = <>
        FieldName = 'PERIOD'
        Footers = <>
        ReadOnly = False
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOYEE_NAME'
        Footers = <>
        Width = 76
      end
      item
        EditButtons = <>
        FieldName = 'BATCH_NUMBER'
        Footers = <>
        Width = 103
      end
      item
        EditButtons = <>
        FieldName = 'v_status'
        Footers = <>
        Width = 70
      end>
  end
  object DBGridEh2: TDBGridEh
    Left = 0
    Top = 292
    Width = 678
    Height = 228
    Align = alClient
    DataSource = DataSource2
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'DESCRIPTION'
        Footers = <>
        Width = 171
      end
      item
        EditButtons = <>
        FieldName = 'GL_ACC_NUMBER'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'description_2'
        Footers = <>
        Width = 232
      end
      item
        EditButtons = <>
        FieldName = 'D_C'
        Footers = <>
        Width = 40
      end
      item
        EditButtons = <>
        FieldName = 'AMOUNT'
        Footers = <>
        Width = 59
      end
      item
        EditButtons = <>
        FieldName = 'CURR_NAME'
        Footers = <>
        Width = 68
      end
      item
        EditButtons = <>
        FieldName = 'exch_rate'
        Footers = <>
        Width = 68
      end
      item
        EditButtons = <>
        FieldName = 'REF_NUMBER'
        Footers = <>
        Width = 86
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADs105
    Left = 80
    Top = 64
  end
  object ADs105: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT Data0105.RKEY, Data0105.VOUCHER,'#13#10'Data0105.ENTERED_DT, '#13#10 +
      'case Data0105.STATUS '#13#10'      when 0 then '#39#26410#23457#26680#39#13#10'      when 1 the' +
      'n '#39#20250#35745#24050#23457#39#13#10'      when 2 then '#39#20027#31649#24050#23457#39#13#10'      when 3 then '#39#24050#30331#24080#39#13#10'   ' +
      '   when 4 then '#39#20986#32435#24050#23457#39' end as v_status,'#13#10#13#10' Data0105.FYEAR, Data0' +
      '105.PERIOD,'#13#10'Data0005.EMPLOYEE_NAME,Data0105.ATTACHED,data0105.S' +
      'PECIAL_POSTING,'#13#10'data0105.BATCH_NUMBER'#13#10'FROM Data0105 INNER JOIN' +
      #13#10'     Data0005 ON Data0105.ENTERED_BY_EMPL_PTR = Data0005.RKEY'#13 +
      #10'where'#13#10'VOU_TYPE in (0,4)'#13#10'and STATUS <> 5'#13#10'and Data0105.FYEAR =' +
      ' :vdate1'#13#10'and Data0105.PERIOD= :vdate2'#13#10
    IndexFieldNames = 'VOUCHER'
    Parameters = <
      item
        Name = 'vdate1'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 2011
      end
      item
        Name = 'vdate2'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 6
      end>
    Prepared = True
    Left = 112
    Top = 64
    object ADs105RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADs105VOUCHER: TStringField
      DisplayLabel = #20973#35777#32534#21495
      FieldName = 'VOUCHER'
      Size = 12
    end
    object ADs105ENTERED_DT: TDateTimeField
      DisplayLabel = #26085#26399
      FieldName = 'ENTERED_DT'
    end
    object ADs105FYEAR: TIntegerField
      DisplayLabel = #24180#24230
      FieldName = 'FYEAR'
    end
    object ADs105PERIOD: TSmallintField
      DisplayLabel = #26376#20221
      FieldName = 'PERIOD'
    end
    object ADs105EMPLOYEE_NAME: TStringField
      DisplayLabel = #36755#20837#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADs105ATTACHED: TSmallintField
      FieldName = 'ATTACHED'
    end
    object ADs105SPECIAL_POSTING: TStringField
      FieldName = 'SPECIAL_POSTING'
      FixedChar = True
      Size = 1
    end
    object ADs105BATCH_NUMBER: TStringField
      DisplayLabel = #38468#21152#32534#21495
      FieldName = 'BATCH_NUMBER'
      Size = 16
    end
    object ADs105v_status: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'v_status'
      ReadOnly = True
      Size = 8
    end
  end
  object DataSource2: TDataSource
    DataSet = ads106
    Left = 88
    Top = 232
  end
  object ads106: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT Data0103.GL_ACC_NUMBER, -Data0106.AMOUNT as fu_amount,'#13#10' ' +
      '     dbo.Data0001.CURR_NAME, data0001.curr_code,'#13#10'      dbo.Data' +
      '0106.GL_HEADER_PTR, dbo.Data0106.RKEY, '#13#10'      dbo.Data0106.GL_A' +
      'CCT_NO_PTR, dbo.Data0106.REF_NUMBER, '#13#10'      dbo.Data0106.DESCRI' +
      'PTION, dbo.Data0106.SRCE_PTR, dbo.Data0106.AMOUNT, '#13#10'      dbo.D' +
      'ata0106.D_C, dbo.Data0106.CURR_PTR,  CAST(Data0106.EXCH_RATE as ' +
      'float) as exch_rate,'#13#10'(case when data0103_4.GL_DESCRIPTION is no' +
      't null then'#13#10'  data0103_4.GL_DESCRIPTION+'#39'-'#39'+'#13#10'  data0103_3.GL_D' +
      'ESCRIPTION+'#39'-'#39'+'#13#10'  data0103_2.GL_DESCRIPTION+'#39'-'#39'+'#13#10'  data0103_1.' +
      'GL_DESCRIPTION+'#39'-'#39'+data0103.GL_DESCRIPTION'#13#10'else case when data0' +
      '103_3.GL_DESCRIPTION is not null then'#13#10'  data0103_3.GL_DESCRIPTI' +
      'ON+'#39'-'#39'+'#13#10'  data0103_2.GL_DESCRIPTION+'#39'-'#39'+'#13#10'  data0103_1.GL_DESCR' +
      'IPTION+'#39'-'#39'+data0103.GL_DESCRIPTION'#13#10' else case when data0103_2.G' +
      'L_DESCRIPTION is not null then'#13#10'  data0103_2.GL_DESCRIPTION+'#39'-'#39'+' +
      #13#10'  data0103_1.GL_DESCRIPTION+'#39'-'#39'+data0103.GL_DESCRIPTION'#13#10' else' +
      ' case when data0103_1.GL_DESCRIPTION is not null then'#13#10'   data01' +
      '03_1.GL_DESCRIPTION+'#39'-'#39'+data0103.GL_DESCRIPTION'#13#10' else data0103.' +
      'GL_DESCRIPTION'#13#10'end end end end) as description_2'#13#10'FROM dbo.Data' +
      '0103 Data0103_4 RIGHT OUTER JOIN'#13#10'      dbo.Data0103 Data0103_3 ' +
      'ON '#13#10'      Data0103_4.RKEY = Data0103_3.PARENT_PTR RIGHT OUTER J' +
      'OIN'#13#10'      dbo.Data0103 Data0103_2 ON '#13#10'      Data0103_3.RKEY = ' +
      'Data0103_2.PARENT_PTR RIGHT OUTER JOIN'#13#10'      dbo.Data0103 Data0' +
      '103_1 ON '#13#10'      Data0103_2.RKEY = Data0103_1.PARENT_PTR RIGHT O' +
      'UTER JOIN'#13#10'      dbo.Data0103 ON Data0103_1.RKEY = dbo.Data0103.' +
      'PARENT_PTR'#13#10'inner join  dbo.Data0106 ON Data0103.RKEY = dbo.Data' +
      '0106.GL_ACCT_NO_PTR INNER JOIN'#13#10'      dbo.Data0001 ON dbo.Data01' +
      '06.CURR_PTR = dbo.Data0001.RKEY'#13#10'WHERE (dbo.Data0106.GL_HEADER_P' +
      'TR =  :rkey)'#13#10
    DataSource = DataSource1
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 6574
      end>
    Prepared = True
    Left = 120
    Top = 232
    object ads106GL_ACC_NUMBER: TStringField
      DisplayLabel = #31185#30446#32534#30721
      FieldName = 'GL_ACC_NUMBER'
      Size = 18
    end
    object ads106CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
    end
    object ads106curr_code: TStringField
      FieldName = 'curr_code'
      Size = 5
    end
    object ads106GL_HEADER_PTR: TIntegerField
      FieldName = 'GL_HEADER_PTR'
    end
    object ads106RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ads106GL_ACCT_NO_PTR: TIntegerField
      FieldName = 'GL_ACCT_NO_PTR'
    end
    object ads106REF_NUMBER: TStringField
      DisplayLabel = #38468#21152#21442#32771
      FieldName = 'REF_NUMBER'
    end
    object ads106DESCRIPTION: TStringField
      DisplayLabel = #20973#35777#25688#35201
      FieldName = 'DESCRIPTION'
      Size = 100
    end
    object ads106SRCE_PTR: TIntegerField
      FieldName = 'SRCE_PTR'
    end
    object ads106AMOUNT: TBCDField
      DisplayLabel = #37329#39069
      FieldName = 'AMOUNT'
      Precision = 18
      Size = 2
    end
    object ads106D_C: TStringField
      DisplayLabel = #20511#36151
      FieldName = 'D_C'
      FixedChar = True
      Size = 1
    end
    object ads106description_2: TStringField
      DisplayLabel = #31185#30446#21517#31216
      FieldName = 'description_2'
      ReadOnly = True
      Size = 254
    end
    object ads106CURR_PTR: TIntegerField
      FieldName = 'CURR_PTR'
    end
    object ads106fu_amount: TBCDField
      FieldName = 'fu_amount'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object ads106exch_rate: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'exch_rate'
      ReadOnly = True
    end
  end
end
