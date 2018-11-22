inherited PP_Qty_f: TPP_Qty_f
  Left = 333
  Top = 189
  Height = 537
  Caption = 'PP'#24211#23384#26597#35810
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 12
  inherited dxStatusBar1: TdxStatusBar
    Top = 481
  end
  inherited cxTabControl1: TcxTabControl
    Height = 442
    ClientRectBottom = 442
    inherited Panel3: TPanel
      Height = 437
      inherited Panel2: TPanel
        Height = 433
        inherited RzToolbar1: TRzToolbar
          Height = 433
          ToolbarControls = (
            Button1
            btn_add
            Button2
            Button3)
          object btn_add: TButton
            Left = 4
            Top = 32
            Width = 110
            Height = 25
            Hint = #26032#22686
            Caption = #28155#21152#26448#26009
            TabOrder = 1
            OnClick = btn_addClick
          end
          object Button2: TButton
            Left = 4
            Top = 60
            Width = 110
            Height = 25
            Caption = #32791#29992#35760#24405#34892
            TabOrder = 2
            OnClick = Button2Click
          end
          object Button3: TButton
            Left = 4
            Top = 88
            Width = 110
            Height = 25
            Caption = #23614#25968#28165#38646
            TabOrder = 3
            Visible = False
          end
        end
      end
      inherited Panel4: TPanel
        Height = 433
        inherited Panel5: TPanel
          Top = 398
          Height = 35
          object Label1: TLabel
            Left = 18
            Top = 13
            Width = 48
            Height = 12
            Caption = #26448#26009#32534#21495
          end
          object edit1: TEdit
            Left = 80
            Top = 9
            Width = 126
            Height = 20
            TabOrder = 0
            OnChange = edit1Change
          end
        end
        inherited Panel6: TPanel
          Height = 398
        end
        inherited cxPageControl2: TcxPageControl
          Height = 398
          ClientRectBottom = 398
          inherited cxTabSheet0: TcxTabSheet
            inherited ToolBar2: TToolBar
              Height = 375
            end
            inherited DghMain: TDBGridEh
              Height = 375
              FooterRowCount = 1
              FrozenCols = 4
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'ABBR_NAME'
                  Footers = <>
                  ReadOnly = True
                  Width = 89
                end
                item
                  EditButtons = <>
                  FieldName = 'TDATE'
                  Footers = <>
                  ReadOnly = True
                  Width = 103
                end
                item
                  EditButtons = <>
                  FieldName = 'INV_PART_NUMBER'
                  Footers = <>
                  ReadOnly = True
                  Width = 156
                end
                item
                  EditButtons = <>
                  FieldName = 'INV_NAME'
                  Footers = <>
                  ReadOnly = True
                  Width = 155
                end
                item
                  EditButtons = <>
                  FieldName = 'INV_DESCRIPTION'
                  Footers = <>
                  ReadOnly = True
                  Width = 118
                end
                item
                  EditButtons = <>
                  FieldName = 'UNIT_CODE'
                  Footers = <>
                  ReadOnly = True
                  Width = 29
                end
                item
                  EditButtons = <>
                  FieldName = 'QUANTITY'
                  Footer.ValueType = fvtSum
                  Footers = <>
                  ReadOnly = True
                  Width = 52
                end
                item
                  EditButtons = <>
                  FieldName = 'QUAN_ON_HAND_1'
                  Footer.ValueType = fvtSum
                  Footers = <>
                  ReadOnly = True
                  Width = 75
                end
                item
                  EditButtons = <>
                  FieldName = 'QUAN_ON_HAND_2'
                  Footer.ValueType = fvtSum
                  Footers = <>
                  ReadOnly = True
                  Width = 75
                end
                item
                  EditButtons = <>
                  FieldName = 'EXPIRE_DATE'
                  Footers = <>
                  ReadOnly = True
                  Width = 71
                end
                item
                  EditButtons = <>
                  FieldName = 'BARCODE_ID'
                  Footers = <>
                  ReadOnly = True
                  Width = 101
                end
                item
                  EditButtons = <>
                  FieldName = 'SUPPLIER2'
                  Footers = <>
                  ReadOnly = True
                  Width = 113
                end
                item
                  EditButtons = <>
                  FieldName = 'EMPL_CODE'
                  Footers = <>
                  ReadOnly = True
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'EMPLOYEE_NAME'
                  Footers = <>
                  ReadOnly = True
                  Width = 55
                end
                item
                  EditButtons = <>
                  FieldName = 'DescText'
                  Footers = <>
                  Width = 293
                end>
            end
          end
          inherited cxTabSheet1: TcxTabSheet
            TabVisible = False
          end
        end
      end
      inherited Panel7: TPanel
        Top = 433
      end
    end
  end
  inherited dxBarManager: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockControlHeights = (
      0
      0
      39
      0)
    inherited dxBarManagerBar2: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'tblEdit'
        end
        item
          Visible = True
          ItemName = 'tblSave'
        end
        item
          Visible = True
          ItemName = 'tblCancel'
        end
        item
          Visible = True
          ItemName = 'tblDelete'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'tblRefresh'
        end
        item
          Visible = True
          ItemName = 'tblFind'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'tblExport'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'tblFirst'
        end
        item
          Visible = True
          ItemName = 'tblPrior'
        end
        item
          Visible = True
          ItemName = 'tblNext'
        end
        item
          Visible = True
          ItemName = 'tblLast'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'tblHelp'
        end
        item
          Visible = True
          ItemName = 'tblExit'
        end>
    end
    inherited tblAdd: TdxBarLargeButton
      ImageIndex = 3
    end
    inherited tblEdit: TdxBarLargeButton
      ImageIndex = 4
    end
    inherited tblReject: TdxBarLargeButton
      ImageIndex = 130
    end
    inherited tblCancelFilter: TdxBarLargeButton
      ImageIndex = 129
    end
    inherited tblFilter: TdxBarLargeButton
      ImageIndex = 128
    end
    inherited tblExpand: TdxBarLargeButton
      ImageIndex = 131
    end
  end
  inherited dtMain: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'select data0017.INV_PART_NUMBER,data0017.INV_NAME,data0017.INV_D' +
      'ESCRIPTION,data0002.UNIT_CODE,'#13#10'data0005.EMPL_CODE,data0005.EMPL' +
      'OYEE_NAME,Data0022.SUPPLIER2,Data0022.BARCODE_ID,data0023.ABBR_N' +
      'AME,'#13#10'data0730.* '#13#10'from data0730'#13#10'join data0017 on data0730.[D01' +
      '7_PTR]=data0017.rkey'#13#10'join data0002 on data0730.[D002_PTR]=data0' +
      '002.rkey'#13#10'join data0005 on data0730.[empl_ptr]=data0005.rkey'#13#10'jo' +
      'in data0207 on data0730.D207_ptr=data0207.rkey'#13#10'join Data0022 on' +
      ' data0207.D0022_PTR=Data0022.rkey'#13#10'left join data0456 on Data002' +
      '2.GRN_PTR=data0456.rkey'#13#10'left join data0023 on data0456.SUPP_PTR' +
      '=data0023.rkey'#13#10'where [QUAN_ON_HAND_1]>0 or  [QUAN_ON_HAND_2]>0 '
    object dtMainINV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      ProviderFlags = []
      Size = 25
    end
    object dtMainINV_NAME: TStringField
      FieldName = 'INV_NAME'
      ProviderFlags = []
      Size = 30
    end
    object dtMainINV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      ProviderFlags = []
      Size = 70
    end
    object dtMainUNIT_CODE: TStringField
      FieldName = 'UNIT_CODE'
      ProviderFlags = []
      Size = 5
    end
    object dtMainEMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      ProviderFlags = []
      Size = 10
    end
    object dtMainEMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      ProviderFlags = []
      Size = 16
    end
    object dtMainRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object dtMainD207_PTR: TIntegerField
      FieldName = 'D207_PTR'
    end
    object dtMainD017_PTR: TIntegerField
      FieldName = 'D017_PTR'
    end
    object dtMainD002_PTR: TIntegerField
      FieldName = 'D002_PTR'
    end
    object dtMainQUANTITY: TBCDField
      FieldName = 'QUANTITY'
      Precision = 9
    end
    object dtMainTDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object dtMainempl_ptr: TIntegerField
      FieldName = 'empl_ptr'
    end
    object dtMainQUAN_ON_HAND_1: TBCDField
      FieldName = 'QUAN_ON_HAND_1'
      Precision = 9
    end
    object dtMainQUAN_ON_HAND_2: TBCDField
      FieldName = 'QUAN_ON_HAND_2'
      Precision = 10
      Size = 5
    end
    object dtMainDescText: TStringField
      FieldName = 'DescText'
      Size = 100
    end
    object dtMainEXPIRE_DATE: TDateTimeField
      FieldName = 'EXPIRE_DATE'
    end
    object dtMainSUPPLIER2: TStringField
      FieldName = 'SUPPLIER2'
      ProviderFlags = []
      Size = 30
    end
    object dtMainBARCODE_ID: TStringField
      FieldName = 'BARCODE_ID'
      ProviderFlags = []
      Size = 50
    end
    object dtMainABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      ProviderFlags = []
      Size = 16
    end
  end
  inherited cdsMain: Tcds
    CommandText = 
      'select data0017.INV_PART_NUMBER,data0017.INV_NAME,data0017.INV_D' +
      'ESCRIPTION,data0002.UNIT_CODE,'#13#10'data0005.EMPL_CODE,data0005.EMPL' +
      'OYEE_NAME,Data0022.SUPPLIER2,Data0022.BARCODE_ID,data0023.ABBR_N' +
      'AME,'#13#10'data0730.* '#13#10'from data0730'#13#10'join data0017 on data0730.[D01' +
      '7_PTR]=data0017.rkey'#13#10'join data0002 on data0730.[D002_PTR]=data0' +
      '002.rkey'#13#10'join data0005 on data0730.[empl_ptr]=data0005.rkey'#13#10'jo' +
      'in data0207 on data0730.D207_ptr=data0207.rkey'#13#10'join Data0022 on' +
      ' data0207.D0022_PTR=Data0022.rkey'#13#10'left join data0456 on Data002' +
      '2.GRN_PTR=data0456.rkey'#13#10'left join data0023 on data0456.SUPP_PTR' +
      '=data0023.rkey'#13#10'where [QUAN_ON_HAND_1]>0 or  [QUAN_ON_HAND_2]>0 '
    OnFilterRecord = cdsMainFilterRecord
    F_AutoIncrField = 'rkey'
    F_TableName = 'data0730'
    F_SQLSelectFrom = 
      'select data0017.INV_PART_NUMBER,data0017.INV_NAME,data0017.INV_D' +
      'ESCRIPTION,data0002.UNIT_CODE,'#13#10'data0005.EMPL_CODE,data0005.EMPL' +
      'OYEE_NAME,Data0022.SUPPLIER2,Data0022.BARCODE_ID,data0023.ABBR_N' +
      'AME,'#13#10'data0730.* '#13#10'from data0730'#13#10'join data0017 on data0730.[D01' +
      '7_PTR]=data0017.rkey'#13#10'join data0002 on data0730.[D002_PTR]=data0' +
      '002.rkey'#13#10'join data0005 on data0730.[empl_ptr]=data0005.rkey'#13#10'jo' +
      'in data0207 on data0730.D207_ptr=data0207.rkey'#13#10'join Data0022 on' +
      ' data0207.D0022_PTR=Data0022.rkey'#13#10'left join data0456 on Data002' +
      '2.GRN_PTR=data0456.rkey'#13#10'left join data0023 on data0456.SUPP_PTR' +
      '=data0023.rkey'#13#10
    object cdsMainINV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#21495
      FieldName = 'INV_PART_NUMBER'
      ProviderFlags = []
      Size = 25
    end
    object cdsMainINV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      ProviderFlags = []
      Size = 30
    end
    object cdsMainINV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      ProviderFlags = []
      Size = 70
    end
    object cdsMainUNIT_CODE: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_CODE'
      ProviderFlags = []
      Size = 5
    end
    object cdsMainEMPL_CODE: TStringField
      DisplayLabel = #25805#20316#20154#20195#30721
      FieldName = 'EMPL_CODE'
      ProviderFlags = []
      Size = 10
    end
    object cdsMainEMPLOYEE_NAME: TStringField
      DisplayLabel = #25805#20316#20154
      FieldName = 'EMPLOYEE_NAME'
      ProviderFlags = []
      Size = 16
    end
    object cdsMainRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object cdsMainD207_PTR: TIntegerField
      FieldName = 'D207_PTR'
    end
    object cdsMainD017_PTR: TIntegerField
      FieldName = 'D017_PTR'
    end
    object cdsMainQUANTITY: TBCDField
      DisplayLabel = #39046#29992#25968#37327
      FieldName = 'QUANTITY'
      Precision = 9
    end
    object cdsMainD002_PTR: TIntegerField
      FieldName = 'D002_PTR'
    end
    object cdsMainTDATE: TDateTimeField
      DisplayLabel = #21019#24314#26085#26399
      FieldName = 'TDATE'
    end
    object cdsMainempl_ptr: TIntegerField
      FieldName = 'empl_ptr'
    end
    object cdsMainQUAN_ON_HAND_1: TBCDField
      DisplayLabel = #24403#21069#25968#37327'('#21367')'
      FieldName = 'QUAN_ON_HAND_1'
      Precision = 9
    end
    object cdsMainQUAN_ON_HAND_2: TBCDField
      DisplayLabel = #24403#21069#25968#37327'('#31859')'
      FieldName = 'QUAN_ON_HAND_2'
      Precision = 10
      Size = 5
    end
    object cdsMainDescText: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'DescText'
      Size = 100
    end
    object cdsMainEXPIRE_DATE: TDateTimeField
      DisplayLabel = #26377#25928#26399
      FieldName = 'EXPIRE_DATE'
    end
    object cdsMainSUPPLIER2: TStringField
      DisplayLabel = #29983#20135#25209#21495#25110#21407#20379#24212#21830
      FieldName = 'SUPPLIER2'
      ProviderFlags = []
      Size = 30
    end
    object cdsMainBARCODE_ID: TStringField
      DisplayLabel = #22791#27880'('#20379#24212#21830#22411#21495')'
      FieldName = 'BARCODE_ID'
      ProviderFlags = []
      Size = 50
    end
    object cdsMainABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'ABBR_NAME'
      ProviderFlags = []
      Size = 16
    end
  end
  inherited dtRead: TADODataSet
    CursorType = ctStatic
    CommandText = 'exec p_D730_1 '
  end
  inherited pp_Report1: TppReport
    DataPipelineName = 'pp_DBPipeline1'
    inherited ppDetailBand1: TppDetailBand
      inherited ppDBText1: TppDBText
        DataPipelineName = 'pp_DBPipeline1'
      end
      inherited ppDBText2: TppDBText
        DataPipelineName = 'pp_DBPipeline1'
      end
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    CommandText = 
      'declare @TDATE Datetime'#13#10'declare @Dept_ptr int ,@group_ptr int--' +
      ',@TDATE Datetime'#13#10'select @Dept_ptr=CLOSE_DAYTH,@group_ptr=CLOSE_' +
      'HOURTH from Data0192'#13#10'if @TDATE is null'#13#10'set @TDATE=getdate()-16' +
      '0--'#26597#35810#26368#36817'2'#20010#26376#20197#20869#30340#39046#26009#35760#24405#13#10'select Cast(0 as bit)as Selected,data0207.rke' +
      'y, data0207.INVENTORY_PTR,data0017.STOCK_UNIT_PTR,'#13#10'data0017.INV' +
      '_PART_NUMBER,data0017.INV_NAME,data0017.INV_DESCRIPTION,data0002' +
      '.UNIT_CODE,'#13#10'data0207.QUANTITY,rtrim(data0017.IES_PARAMETER_VALU' +
      'E3 )IES_PARAMETER_VALUE3,rtrim(data0017.IES_PARAMETER_VALUE3 )*d' +
      'ata0207.QUANTITY as QUANTITY_2,'#13#10'data0034.DEPT_NAME,data0005.EMP' +
      'L_CODE,data0005.EMPLOYEE_NAME,data0207.TDATE,data0207.Invent_or'#13 +
      #10',Data0022.EXPIRE_DATE,data0457.REF_NUMBER,Data0022.SUPPLIER2,Da' +
      'ta0022.BARCODE_ID,data0023.ABBR_NAME'#13#10'from  data0207 '#13#10'join data' +
      '0017 on  data0207.INVENTORY_PTR=data0017.rkey'#13#10'join data0002 on ' +
      'data0017.STOCK_UNIT_PTR=data0002.rkey'#13#10'join data0457 on data0207' +
      '.GON_PTR=data0457.rkey'#13#10'join data0005 on data0457.RECD_BY=data00' +
      '05.rkey'#13#10'join Data0022 on data0207.D0022_PTR=Data0022.rkey'#13#10'join' +
      ' data0034 on data0207.dept_ptr=data0034.rkey'#13#10'left join data0456' +
      ' on Data0022.GRN_PTR=data0456.rkey'#13#10'left join data0023 on data04' +
      '56.SUPP_PTR=data0023.rkey'#13#10'where data0017.GROUP_PTR=@group_ptr '#13 +
      #10'and data0207.dept_ptr=@Dept_ptr  '#13#10'and data0207.Invent_or=0 and' +
      ' data0207.TDATE >=@TDATE'#13#10'and data0207.TTYPE<>4 '#13#10'order by data0' +
      '207.TDATE'
    FetchOnDemand = False
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 488
    Top = 128
    object ClientDataSet1Selected: TBooleanField
      DisplayLabel = #36873#25321
      FieldName = 'Selected'
      ProviderFlags = []
    end
    object ClientDataSet1rkey: TIntegerField
      FieldName = 'rkey'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
    end
    object ClientDataSet1INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
      ProviderFlags = []
      Visible = False
    end
    object ClientDataSet1INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      DisplayWidth = 25
      FieldName = 'INV_PART_NUMBER'
      ProviderFlags = []
      Size = 25
    end
    object ClientDataSet1INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      DisplayWidth = 25
      FieldName = 'INV_NAME'
      ProviderFlags = []
      Size = 30
    end
    object ClientDataSet1INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      DisplayWidth = 20
      FieldName = 'INV_DESCRIPTION'
      ProviderFlags = []
      Size = 70
    end
    object ClientDataSet1UNIT_CODE: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_CODE'
      ProviderFlags = []
      Size = 5
    end
    object ClientDataSet1STOCK_UNIT_PTR: TIntegerField
      FieldName = 'STOCK_UNIT_PTR'
      ProviderFlags = []
      Visible = False
    end
    object ClientDataSet1QUANTITY: TBCDField
      DisplayLabel = #39046#26009#25968#37327
      DisplayWidth = 8
      FieldName = 'QUANTITY'
      ProviderFlags = []
      Precision = 19
    end
    object ClientDataSet1REF_NUMBER2: TStringField
      DisplayLabel = #39046#26009#21333#21495
      DisplayWidth = 10
      FieldName = 'REF_NUMBER'
      ProviderFlags = []
      Size = 15
    end
    object ClientDataSet1TDATE: TDateTimeField
      DisplayLabel = #21457#26009#26085#26399
      DisplayWidth = 16
      FieldName = 'TDATE'
      ProviderFlags = []
    end
    object ClientDataSet1ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      DisplayWidth = 10
      FieldName = 'ABBR_NAME'
      ProviderFlags = []
      Size = 16
    end
    object ClientDataSet1SUPPLIER2: TStringField
      DisplayLabel = #29983#20135#25209#21495#25110#21407#20379#24212#21830
      DisplayWidth = 15
      FieldName = 'SUPPLIER2'
      ProviderFlags = []
      Size = 30
    end
    object ClientDataSet1BARCODE_ID: TStringField
      DisplayLabel = #22791#27880'('#20379#24212#21830#22411#21495')'
      DisplayWidth = 15
      FieldName = 'BARCODE_ID'
      ProviderFlags = []
      Size = 50
    end
    object ClientDataSet1IES_PARAMETER_VALUE3: TStringField
      DisplayLabel = #21367#38271
      DisplayWidth = 8
      FieldName = 'IES_PARAMETER_VALUE3'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object ClientDataSet1QUANTITY_2: TBCDField
      DisplayLabel = #25968#37327'(M)'
      DisplayWidth = 8
      FieldName = 'QUANTITY_2'
      ProviderFlags = []
      ReadOnly = True
      Precision = 32
      Size = 7
    end
    object ClientDataSet1Invent_or: TSmallintField
      FieldName = 'Invent_or'
      Visible = False
    end
    object ClientDataSet1EMPL_CODE: TStringField
      DisplayLabel = #39046#26009#20154
      FieldName = 'EMPL_CODE'
      ProviderFlags = []
      Visible = False
      Size = 10
    end
    object ClientDataSet1EMPLOYEE_NAME: TStringField
      DisplayLabel = #39046#26009#20154
      DisplayWidth = 10
      FieldName = 'EMPLOYEE_NAME'
      ProviderFlags = []
      Size = 16
    end
    object ClientDataSet1EXPIRE_DATE: TDateTimeField
      DisplayLabel = #26377#25928#26399
      DisplayWidth = 11
      FieldName = 'EXPIRE_DATE'
      ProviderFlags = []
    end
    object ClientDataSet1DEPT_NAME: TStringField
      DisplayLabel = #37096#38376
      DisplayWidth = 10
      FieldName = 'DEPT_NAME'
      ProviderFlags = []
      Size = 30
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = ADODataSet1
    Options = [poAllowCommandText]
    OnGetTableName = DataSetProvider1GetTableName
    Left = 421
    Top = 135
  end
  object ADODataSet1: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'declare @TDATE Datetime'#13#10'declare @Dept_ptr int ,@group_ptr int--' +
      ',@TDATE Datetime'#13#10'select @Dept_ptr=CLOSE_DAYTH,@group_ptr=CLOSE_' +
      'HOURTH from Data0192'#13#10'if @TDATE is null'#13#10'set @TDATE=getdate()-16' +
      '0--'#26597#35810#26368#36817'2'#20010#26376#20197#20869#30340#39046#26009#35760#24405#13#10'select Cast(0 as bit)as Selected,data0207.rke' +
      'y, data0207.INVENTORY_PTR,data0017.STOCK_UNIT_PTR,'#13#10'data0017.INV' +
      '_PART_NUMBER,data0017.INV_NAME,data0017.INV_DESCRIPTION,data0002' +
      '.UNIT_CODE,'#13#10'data0207.QUANTITY,rtrim(data0017.IES_PARAMETER_VALU' +
      'E3 )IES_PARAMETER_VALUE3,rtrim(data0017.IES_PARAMETER_VALUE3 )*d' +
      'ata0207.QUANTITY as QUANTITY_2,'#13#10'data0034.DEPT_NAME,data0005.EMP' +
      'L_CODE,data0005.EMPLOYEE_NAME,data0207.TDATE,data0207.Invent_or'#13 +
      #10',Data0022.EXPIRE_DATE,data0457.REF_NUMBER,Data0022.SUPPLIER2,Da' +
      'ta0022.BARCODE_ID,data0023.ABBR_NAME'#13#10'from  data0207 '#13#10'join data' +
      '0017 on  data0207.INVENTORY_PTR=data0017.rkey'#13#10'join data0002 on ' +
      'data0017.STOCK_UNIT_PTR=data0002.rkey'#13#10'join data0457 on data0207' +
      '.GON_PTR=data0457.rkey'#13#10'join data0005 on data0457.RECD_BY=data00' +
      '05.rkey'#13#10'join Data0022 on data0207.D0022_PTR=Data0022.rkey'#13#10'join' +
      ' data0034 on data0207.dept_ptr=data0034.rkey'#13#10'left join data0456' +
      ' on Data0022.GRN_PTR=data0456.rkey'#13#10'left join data0023 on data04' +
      '56.SUPP_PTR=data0023.rkey'#13#10'where data0017.GROUP_PTR=@group_ptr '#13 +
      #10'and data0207.dept_ptr=@Dept_ptr  '#13#10'and data0207.Invent_or=0 and' +
      ' data0207.TDATE >=@TDATE'#13#10'order by data0207.TDATE'
    Parameters = <>
    Left = 349
    Top = 135
    object ADODataSet1Selected: TBooleanField
      FieldName = 'Selected'
      ProviderFlags = []
    end
    object ADODataSet1rkey: TAutoIncField
      FieldName = 'rkey'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object ADODataSet1INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
      ProviderFlags = []
      ReadOnly = True
    end
    object ADODataSet1INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      ProviderFlags = []
      Size = 25
    end
    object ADODataSet1INV_NAME: TStringField
      FieldName = 'INV_NAME'
      ProviderFlags = []
      Size = 30
    end
    object ADODataSet1INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      ProviderFlags = []
      Size = 70
    end
    object ADODataSet1UNIT_CODE: TStringField
      FieldName = 'UNIT_CODE'
      ProviderFlags = []
      Size = 5
    end
    object ADODataSet1STOCK_UNIT_PTR: TIntegerField
      FieldName = 'STOCK_UNIT_PTR'
      ProviderFlags = []
      ReadOnly = True
    end
    object ADODataSet1QUANTITY: TBCDField
      FieldName = 'QUANTITY'
      ProviderFlags = []
      ReadOnly = True
      Precision = 19
    end
    object ADODataSet1IES_PARAMETER_VALUE3: TStringField
      FieldName = 'IES_PARAMETER_VALUE3'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object ADODataSet1QUANTITY_2: TBCDField
      FieldName = 'QUANTITY_2'
      ProviderFlags = []
      ReadOnly = True
      Precision = 32
      Size = 7
    end
    object ADODataSet1TDATE: TDateTimeField
      FieldName = 'TDATE'
      ProviderFlags = []
      ReadOnly = True
    end
    object ADODataSet1Invent_or: TSmallintField
      FieldName = 'Invent_or'
    end
    object ADODataSet1EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object ADODataSet1EXPIRE_DATE: TDateTimeField
      FieldName = 'EXPIRE_DATE'
      ProviderFlags = []
      ReadOnly = True
    end
    object ADODataSet1REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      ProviderFlags = []
      Size = 15
    end
    object ADODataSet1DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      ProviderFlags = []
      Size = 30
    end
    object ADODataSet1EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      ProviderFlags = []
      Size = 16
    end
    object ADODataSet1SUPPLIER2: TStringField
      FieldName = 'SUPPLIER2'
      ProviderFlags = []
      Size = 30
    end
    object ADODataSet1BARCODE_ID: TStringField
      FieldName = 'BARCODE_ID'
      ProviderFlags = []
      Size = 50
    end
    object ADODataSet1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      ProviderFlags = []
      Size = 16
    end
  end
  object cds0017: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Declare @TType int '#13#10'select @TType=CLOSE_HOURTH from data0192 '#13#10 +
      #13#10'select RKEY'#9',INV_PART_NUMBER'#9#21407#26448#26009#20195#30721',INV_NAME'#9#26448#26009#21517#31281',INV_DESCRIPTI' +
      'ON'#9#26448#26009#35215#26684#13#10'from data0017 '#13#10'where GROUP_PTR= @TType'
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 440
    Top = 281
    object cds0017RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object cds0017CDSDesigner: TStringField
      FieldName = #21407#26448#26009#20195#30721
      Size = 25
    end
    object cds0017CDSDesigner2: TStringField
      DisplayWidth = 25
      FieldName = #26448#26009#21517#31281
      Size = 30
    end
    object cds0017CDSDesigner3: TStringField
      DisplayWidth = 40
      FieldName = #26448#26009#35215#26684
      Size = 70
    end
  end
  object cdsD005: TClientDataSet
    Aggregates = <>
    CommandText = 'select RKEY,EMPL_CODE,EMPLOYEE_NAME from data0005'
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 432
    Top = 336
    object cdsD005RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object cdsD005EMPL_CODE: TStringField
      DisplayLabel = #38599#21592#20195#30721
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object cdsD005EMPLOYEE_NAME: TStringField
      DisplayLabel = #38599#21592#22995#21517
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object dt023: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    CommandText = 'select Code,ABBR_NAME from data0023'
    Parameters = <>
    Left = 429
    Top = 399
    object dt023Code: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'Code'
      Size = 10
    end
    object dt023ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'ABBR_NAME'
      Size = 16
    end
  end
  object ADOCommand_updt207: TADOCommand
    Connection = DM.ADOConnection1
    Parameters = <>
    Left = 269
    Top = 247
  end
end
