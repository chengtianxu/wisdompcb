object frm_HistoryAdd: Tfrm_HistoryAdd
  Left = 213
  Top = 258
  Width = 979
  Height = 563
  Caption = #20174#21382#21490#35760#24405#28155#21152
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 255
    Width = 971
    Height = 9
    Cursor = crVSplit
    Align = alBottom
    Color = clAqua
    ParentColor = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 971
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 12
      Top = 16
      Width = 52
      Height = 13
      Caption = #24037#20316#21333#21495
    end
    object Edit1: TEdit
      Left = 88
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 971
    Height = 214
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = #24037#20316#21333#21495
        Footers = <>
        Title.Color = clRed
      end
      item
        EditButtons = <>
        FieldName = #37096#38376#21517#31216
        Footers = <>
        Width = 168
      end
      item
        EditButtons = <>
        FieldName = #24037#20316#20219#21153#35828#26126
        Footers = <>
        Width = 294
      end
      item
        EditButtons = <>
        FieldName = #29366#24577
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #30003#35831#20154
        Footers = <>
      end>
  end
  object DBGridEh2: TDBGridEh
    Left = 0
    Top = 264
    Width = 971
    Height = 205
    Align = alBottom
    DataSource = DataSource2
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh2KeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'selected'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'WorkDate'
        Footers = <>
        ReadOnly = True
      end
      item
        EditButtons = <>
        FieldName = 'BeginTime'
        Footers = <>
        ReadOnly = True
        Width = 161
      end
      item
        EditButtons = <>
        FieldName = 'EndTime'
        Footers = <>
        ReadOnly = True
        Width = 163
      end
      item
        EditButtons = <>
        FieldName = 'EMPL_CODE'
        Footers = <>
        ReadOnly = True
        Width = 86
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOYEE_NAME'
        Footers = <>
        ReadOnly = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 469
    Width = 971
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object Label1: TLabel
      Left = 120
      Top = 16
      Width = 52
      Height = 13
      Caption = #24037#20316#26085#26399
    end
    object DBDTE_CompTime: TDBDateTimeEditEh
      Left = 184
      Top = 12
      Width = 97
      Height = 21
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 0
      Visible = True
    end
    object CheckBox1: TCheckBox
      Left = 16
      Top = 16
      Width = 57
      Height = 17
      Caption = #20840#36873
      TabOrder = 1
      OnClick = CheckBox1Click
    end
    object BtnOk: TButton
      Left = 440
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 2
      OnClick = BtnOkClick
    end
    object BtnCancel: TButton
      Left = 520
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 3
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 510
    Width = 971
    Height = 19
    Panels = <
      item
        Width = 300
      end>
  end
  object ADS835: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterScroll = ADS835AfterScroll
    CommandText = 
      'select top 100 data0835.rkey,WorkOrder as '#24037#20316#21333#21495',DeptName as '#37096#38376#21517#31216',' +
      #13#10'WorkName as '#24037#20316#20219#21153#35828#26126',MainExecStat as '#29366#24577',USER_FULL_NAME as '#30003#35831#20154#13#10'f' +
      'rom data0835'#13#10'join data0830 on data0835.[Dept_ptr]=data0830.rkey' +
      #13#10'join data0836 on data0835.[Work_ptr]=data0836.rkey'#13#10'join data0' +
      '073 on data0835.[Applican]=data0073.rkey'#13#10'join data0832 on data0' +
      '835.[Status]  =data0832.rkey'#13#10'where status<>1'#13#10'order by data0835' +
      '.rkey desc'#13#10
    Parameters = <>
    Left = 392
    Top = 120
    object ADS835rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS835DSDesigner: TStringField
      FieldName = #24037#20316#21333#21495
      Size = 15
    end
    object ADS835DSDesigner2: TStringField
      FieldName = #37096#38376#21517#31216
      Size = 50
    end
    object ADS835DSDesigner4: TStringField
      FieldName = #29366#24577
      Size = 10
    end
    object ADS835DSDesigner5: TStringField
      FieldName = #30003#35831#20154
      Size = 30
    end
    object ADS835DSDesigner3: TStringField
      FieldName = #24037#20316#20219#21153#35828#26126
      Size = 50
    end
  end
  object ADS837: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select cast(0 as bit) selected,Data0837.WorkDate ,Data0837.Begin' +
      'Time ,Data0837.EndTime ,'#13#10'data0005.EMPL_CODE ,data0005.EMPLOYEE_' +
      'NAME ,Data0837.Work_ptr,Data0837.Empl_ptr'#13#10'from Data0837'#13#10'join d' +
      'ata0005 on Data0837.Empl_ptr=data0005.rkey'#13#10'where Data0837.Work_' +
      'ptr=:rkey'#13#10
    DataSource = DataSource1
    IndexFieldNames = 'Work_ptr'
    Parameters = <
      item
        Name = 'Work_ptr'
        DataType = ftInteger
        Value = 93
      end>
    Left = 472
    Top = 312
    object ADS837selected: TBooleanField
      DisplayLabel = #36873#25321
      FieldName = 'selected'
    end
    object ADS837WorkDate: TDateTimeField
      DisplayLabel = #24037#20316#26085#26399
      FieldName = 'WorkDate'
    end
    object ADS837BeginTime: TDateTimeField
      DisplayLabel = #24320#22987#26102#38388
      FieldName = 'BeginTime'
    end
    object ADS837EndTime: TDateTimeField
      DisplayLabel = #32467#26463#26102#38388
      FieldName = 'EndTime'
    end
    object ADS837EMPL_CODE: TStringField
      DisplayLabel = #38599#21592#20195#30721
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object ADS837EMPLOYEE_NAME: TStringField
      DisplayLabel = #38599#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS837Work_ptr: TIntegerField
      FieldName = 'Work_ptr'
    end
    object ADS837Empl_ptr: TIntegerField
      FieldName = 'Empl_ptr'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS835
    Left = 280
    Top = 112
  end
  object DataSource2: TDataSource
    DataSet = CDS837
    Left = 712
    Top = 320
  end
  object CDS837: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Work_ptr'
    MasterFields = 'rkey'
    MasterSource = DataSource1
    PacketRecords = 0
    Params = <>
    ProviderName = 'DataSetProvider1'
    BeforeInsert = CDS837BeforeInsert
    BeforeDelete = CDS837BeforeDelete
    Left = 656
    Top = 312
    object CDS837selected: TBooleanField
      DisplayLabel = #36873#25321
      FieldName = 'selected'
    end
    object CDS837WorkDate: TDateTimeField
      DisplayLabel = #24037#20316#26085#26399
      FieldName = 'WorkDate'
    end
    object CDS837BeginTime: TDateTimeField
      DisplayLabel = #24320#22987#26102#38388
      FieldName = 'BeginTime'
    end
    object CDS837EndTime: TDateTimeField
      DisplayLabel = #32467#26463#26102#38388
      FieldName = 'EndTime'
    end
    object CDS837EMPL_CODE: TStringField
      DisplayLabel = #38599#21592#20195#30721
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object CDS837EMPLOYEE_NAME: TStringField
      DisplayLabel = #38599#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object CDS837Work_ptr: TIntegerField
      FieldName = 'Work_ptr'
    end
    object CDS837Empl_ptr: TIntegerField
      FieldName = 'Empl_ptr'
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = ADS837
    Left = 552
    Top = 328
  end
end
