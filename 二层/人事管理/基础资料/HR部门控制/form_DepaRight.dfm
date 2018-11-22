inherited frm_DepaRight: Tfrm_DepaRight
  Left = 248
  Top = 172
  Width = 847
  Height = 617
  Caption = 'frm_DepaRight'
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 12
  inherited dxStatusBar1: TdxStatusBar
    Top = 561
    Width = 839
  end
  inherited cxTabControl1: TcxTabControl
    Width = 839
    Height = 522
    ClientRectBottom = 522
    ClientRectRight = 839
    inherited Panel3: TPanel
      Top = 37
      Width = 839
      Height = 485
      inherited Panel2: TPanel
        Left = 719
        Height = 481
        inherited RzToolbar1: TRzToolbar
          Height = 481
          RowHeight = 26
          ToolbarControls = (
            Button1
            Button2)
          inherited Button1: TButton
            Top = 3
          end
          object Button2: TButton
            Left = 4
            Top = 30
            Width = 110
            Height = 23
            Caption = #39640#25928#22686#21152
            TabOrder = 1
            OnClick = Button2Click
          end
        end
      end
      inherited Panel4: TPanel
        Width = 719
        Height = 481
        inherited Panel5: TPanel
          Top = 475
          Width = 719
        end
        inherited Panel6: TPanel
          Height = 475
        end
        inherited cxPageControl2: TcxPageControl
          Width = 714
          Height = 475
          ClientRectBottom = 475
          ClientRectRight = 714
          inherited cxTabSheet0: TcxTabSheet
            inherited ToolBar2: TToolBar
              Height = 452
            end
            inherited DghMain: TDBGridEh
              Width = 714
              Height = 452
              ReadOnly = True
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'USER_LOGIN_NAME'
                  Footers = <>
                  Width = 88
                end
                item
                  EditButtons = <>
                  FieldName = 'USER_FULL_NAME'
                  Footers = <>
                  Width = 124
                end
                item
                  EditButtons = <>
                  FieldName = 'departmentname'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'departmentcode'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'DESCRIPTION'
                  Footers = <>
                  Width = 152
                end
                item
                  EditButtons = <>
                  FieldName = 'PROGRAME'
                  Footers = <>
                  Width = 192
                end
                item
                  EditButtons = <>
                  FieldName = 'operator_ptr'
                  Footers = <>
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'departmentid'
                  Footers = <>
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'program_ptr'
                  Footers = <>
                  Visible = False
                end>
            end
          end
        end
      end
      inherited Panel7: TPanel
        Top = 481
        Width = 839
      end
    end
    inherited Panel1: TPanel
      Width = 839
      Height = 37
      object pnl_user: TPanel
        Left = 250
        Top = 0
        Width = 222
        Height = 37
        Align = alLeft
        TabOrder = 0
        object Label1: TLabel
          Left = 10
          Top = 14
          Width = 24
          Height = 12
          Caption = #29992#25143
        end
        object edt_USER_LOGIN_NAME_DELETE: TEditBit
          Left = 37
          Top = 11
          Width = 83
          Height = 20
          ReadOnly = True
          TabOrder = 0
          OnChange = edt_DESCRIPTION_deleteChange
          F_CanNull = False
          F_LookupDataSet = cds0073
          F_DropDataSetFilterField = 'USER_LOGIN_NAME'
          F_RkeyFieldName = 'rkey'
          F_Edit1 = edt_USER_FULL_NAME
          F_ResultFieldName1 = 'USER_FULL_NAME'
          F_GridNotDisplayFields.Strings = (
            'selected')
        end
        object edt_USER_FULL_NAME: TEdit
          Left = 119
          Top = 11
          Width = 102
          Height = 20
          ReadOnly = True
          TabOrder = 1
          OnChange = edt_USER_FULL_NAMEChange
        end
        object edt_USER_LOGIN_NAME: TButtonEdit
          Left = 37
          Top = 11
          Width = 83
          Height = 20
          ReadOnlyColor = clInactiveCaptionText
          TabOrder = 2
          F_DownFormWidth = 0
          F_DownListDataSet = cds0073
          F_ResultFieldName = 'USER_LOGIN_NAME'
          F_ColsInfo = 'USER_LOGIN_NAME/'#30331#38470#21517'/100,USER_FULL_NAME/'#29992#25143#21517'/140'
          F_RkeyFieldName = 'rkey'
          F_Edit1 = edt_USER_FULL_NAME
          F_ResultFieldName1 = 'USER_FULL_NAME'
        end
      end
      object pnl_DEPT: TPanel
        Left = 472
        Top = 0
        Width = 222
        Height = 37
        Align = alLeft
        TabOrder = 1
        object Label2: TLabel
          Left = 10
          Top = 14
          Width = 24
          Height = 12
          Caption = #37096#38376
        end
        object edt_departmentcode_delete: TEditBit
          Left = 37
          Top = 11
          Width = 83
          Height = 20
          ReadOnly = True
          TabOrder = 0
          OnChange = edt_DESCRIPTION_deleteChange
          F_CanNull = False
          F_LookupDataSet = cdsDataDepartment
          F_DropDataSetFilterField = 'departmentcode'
          F_RkeyFieldName = 'rkey'
          F_Edit1 = edt_departmentname
          F_ResultFieldName1 = 'departmentname'
          F_GridNotDisplayFields.Strings = (
            'selected')
        end
        object edt_departmentname: TEdit
          Left = 119
          Top = 11
          Width = 102
          Height = 20
          ReadOnly = True
          TabOrder = 1
          OnChange = edt_USER_FULL_NAMEChange
        end
        object edt_departmentcode: TButtonEdit
          Left = 37
          Top = 11
          Width = 83
          Height = 20
          ReadOnlyColor = clInactiveCaptionText
          TabOrder = 2
          F_DownFormWidth = 0
          F_DownListDataSet = cdsDataDepartment
          F_ResultFieldName = 'departmentcode'
          F_ColsInfo = 'departmentcode/'#37096#38376#20195#30721'/120,departmentname/'#37096#38376#21517#31216'/150'
          F_RkeyFieldName = 'rkey'
          F_Edit1 = edt_departmentname
          F_ResultFieldName1 = 'departmentname'
        end
      end
      object pnl_but: TPanel
        Left = 960
        Top = 0
        Width = 42
        Height = 37
        Align = alLeft
        TabOrder = 2
        Visible = False
        object BtFind: TSpeedButton
          Left = 9
          Top = 9
          Width = 25
          Height = 25
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
            00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FF0000CE0094FF0000CE000000FF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000CE0094FF0000
            FF0000CE000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF0000CE0094FF0000FF0000CE000000FF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF0000000000000000000000000000000094FF0000FF0000CE0000
            00FF00FFFF00FFFF00FFFF00FFFF00FF848484000000CE9400CE9400CE940094
            63299463290000000000CE000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
            ADB5ADFFCE29FFCE29FFCE29FFCE29CE9400CE9400946329000000FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FF848484FFFF94FFFF94FFFF94FFCE94FFCE29FF
            CE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484FFCE94
            FFFF94FFFF94FFFF94FFFF94FFFF94FFCE29FFCE29CE9400946329000000FF00
            FFFF00FFFF00FFFF00FF848484FFCE94FFFFCEFFFFCEFFFFCEFFFF94FFFF94FF
            FF94FFCE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FF848484FFCE94
            FFFFFFFFFFFFFFFFCEFFFFCEFFFF94FFFF94FFCE94FFCE29CE9400000000FF00
            FFFF00FFFF00FFFF00FF848484ADB5ADFFFFFFFFFFFFFFFFFFFFFFCEFFFFCEFF
            FF94FFFF94FFCE29CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
            FFCE94FFFFFFFFFFFFFFFFFFFFFFCEFFFF94FFFF94FFCE29000000FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FF848484ADB5ADFFCE94FFFFFFFFFFFFFFFFCEFF
            FF94FFCE94CE9429000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            848484848484ADB5ADFFCE94FFCE94FFCE94848484848484FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848484848484848484
            8484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        end
      end
      object RadioGroup1: TRadioGroup
        Left = 0
        Top = 0
        Width = 250
        Height = 37
        Align = alLeft
        Caption = #36873#25321
        Columns = 3
        ItemIndex = 1
        Items.Strings = (
          #29992#25143'/'#37096#38376
          #29992#25143'/'#31243#24207
          #37096#38376'/'#31243#24207)
        TabOrder = 3
        OnClick = RadioGroup1Click
      end
      object pnl_DESCRIPTION: TPanel
        Left = 694
        Top = 0
        Width = 266
        Height = 37
        Align = alLeft
        TabOrder = 4
        Visible = False
        object Label4: TLabel
          Left = 10
          Top = 14
          Width = 24
          Height = 12
          Caption = #31243#24207
        end
        object edt_DESCRIPTION_delete: TEditBit
          Left = 37
          Top = 11
          Width = 111
          Height = 20
          ReadOnly = True
          TabOrder = 0
          OnChange = edt_DESCRIPTION_deleteChange
          F_CanNull = False
          F_LookupDataSet = cds419
          F_DropDataSetFilterField = 'DESCRIPTION'
          F_RkeyFieldName = 'rkey'
          F_Edit1 = edt_PROGRAME
          F_ResultFieldName1 = 'PROGRAME'
          F_GridNotDisplayFields.Strings = (
            'selected')
        end
        object edt_PROGRAME: TEdit
          Left = 147
          Top = 11
          Width = 111
          Height = 20
          ReadOnly = True
          TabOrder = 1
          OnChange = edt_USER_FULL_NAMEChange
        end
        object edt_DESCRIPTION: TButtonEdit
          Left = 37
          Top = 11
          Width = 111
          Height = 20
          ReadOnlyColor = clInactiveCaptionText
          TabOrder = 2
          F_DownFormWidth = 0
          F_DownListDataSet = cds419
          F_ResultFieldName = 'DESCRIPTION'
          F_ColsInfo = 'DESCRIPTION/'#33756#21333'/140,PROGRAME/'#31243#24207'/180'
          F_RkeyFieldName = 'rkey'
          F_Edit1 = edt_PROGRAME
          F_ResultFieldName1 = 'PROGRAME'
        end
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
          ItemName = 'tblAdd'
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
      'select data0073.USER_LOGIN_NAME,data0073.USER_FULL_NAME,departme' +
      'ntname,'#13#10'departmentcode,DESCRIPTION,PROGRAME,hr_permission.*'#13#10'fr' +
      'om dbo.hr_permission'#13#10'join data0073 on hr_permission.operator_pt' +
      'r=data0073.rkey'#13#10'join datadepartment on hr_permission.department' +
      'id=datadepartment.rkey'#13#10'join data0419 on hr_permission.program_p' +
      'tr=data0419.rkey'
    object dtMainDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      ProviderFlags = []
      Size = 50
    end
    object dtMainPROGRAME: TStringField
      FieldName = 'PROGRAME'
      ProviderFlags = []
      Size = 50
    end
    object dtMainoperator_ptr: TIntegerField
      FieldName = 'operator_ptr'
    end
    object dtMaindepartmentid: TIntegerField
      FieldName = 'departmentid'
    end
    object dtMainprogram_ptr: TIntegerField
      FieldName = 'program_ptr'
    end
    object dtMainUSER_LOGIN_NAME: TStringField
      FieldName = 'USER_LOGIN_NAME'
      ProviderFlags = []
      Size = 15
    end
    object dtMainUSER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      ProviderFlags = []
      Size = 30
    end
    object dtMaindepartmentname: TWideStringField
      FieldName = 'departmentname'
      ProviderFlags = []
    end
    object dtMaindepartmentcode: TWideStringField
      FieldName = 'departmentcode'
      ProviderFlags = []
    end
  end
  inherited cdsMain: Tcds
    CommandText = 
      'select data0073.USER_LOGIN_NAME,data0073.USER_FULL_NAME,departme' +
      'ntname,'#13#10'departmentcode,DESCRIPTION,PROGRAME,hr_permission.*'#13#10'fr' +
      'om dbo.hr_permission'#13#10'join data0073 on hr_permission.operator_pt' +
      'r=data0073.rkey'#13#10'join datadepartment on hr_permission.department' +
      'id=datadepartment.rkey'#13#10'join data0419 on hr_permission.program_p' +
      'tr=data0419.rkey'#13#10'where 1=2'
    F_AutoSave = False
    F_SQLSelectFrom = 
      'select data0073.USER_LOGIN_NAME,data0073.USER_FULL_NAME,departme' +
      'ntname,'#13#10'departmentcode,DESCRIPTION,PROGRAME,hr_permission.*'#13#10'fr' +
      'om dbo.hr_permission'#13#10'join data0073 on hr_permission.operator_pt' +
      'r=data0073.rkey'#13#10'join datadepartment on hr_permission.department' +
      'id=datadepartment.rkey'#13#10'join data0419 on hr_permission.program_p' +
      'tr=data0419.rkey'
    F_SQLWhere = 'where 1=2'
    object cdsMainUSER_LOGIN_NAME: TStringField
      DisplayLabel = #29992#25143#20195#30721
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object cdsMainUSER_FULL_NAME: TStringField
      DisplayLabel = #29992#25143#21517
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object cdsMainDESCRIPTION: TStringField
      DisplayLabel = #33756#21333#21517
      FieldName = 'DESCRIPTION'
      Size = 50
    end
    object cdsMainPROGRAME: TStringField
      DisplayLabel = #31243#24207#21517
      FieldName = 'PROGRAME'
      Size = 50
    end
    object cdsMainoperator_ptr: TIntegerField
      FieldName = 'operator_ptr'
    end
    object cdsMaindepartmentid: TIntegerField
      FieldName = 'departmentid'
    end
    object cdsMainprogram_ptr: TIntegerField
      FieldName = 'program_ptr'
    end
    object cdsMaindepartmentname: TWideStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'departmentname'
    end
    object cdsMaindepartmentcode: TWideStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'departmentcode'
    end
  end
  inherited dtRead: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'select data0419.rkey,data0419.DESCRIPTION,data0419.PROGRAME from' +
      ' data0419'#13#10'INNER JOIN dbo.SYSTEM_MENU ON dbo.Data0419.manu_ptr =' +
      ' dbo.SYSTEM_MENU.RKEY INNER JOIN'#13#10'                      dbo.SYST' +
      'EM_MAIN ON dbo.SYSTEM_MENU.MAIN_PTR = dbo.SYSTEM_MAIN.RKEY'#13#10'WHER' +
      'E     (dbo.SYSTEM_MAIN.DESCRIPTION = '#39#20154#20107#31649#29702#39')'#13#10'order by DESCRIPTI' +
      'ON'
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
  object cds0073: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select rkey,USER_LOGIN_NAME,USER_FULL_NAME from data0073 '#13#10'where' +
      ' ACTIVE_FLAG=0 and USER_GROUP_FLAG=1'#13#10'order by data0073.USER_LOG' +
      'IN_NAME'
    FilterOptions = [foCaseInsensitive]
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    Left = 528
    Top = 192
    object cds0073USER_LOGIN_NAME: TStringField
      DisplayLabel = #30331#38470#21517
      FieldName = 'USER_LOGIN_NAME'
      ReadOnly = True
      Size = 15
    end
    object cds0073USER_FULL_NAME: TStringField
      DisplayLabel = #29992#25143#21517
      DisplayWidth = 25
      FieldName = 'USER_FULL_NAME'
      ReadOnly = True
      Size = 30
    end
    object cds0073rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
  end
  object cds419: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select data0419.rkey,data0419.DESCRIPTION,data0419.PROGRAME from' +
      ' data0419'#13#10'INNER JOIN dbo.SYSTEM_MENU ON dbo.Data0419.manu_ptr =' +
      ' dbo.SYSTEM_MENU.RKEY INNER JOIN'#13#10'                      dbo.SYST' +
      'EM_MAIN ON dbo.SYSTEM_MENU.MAIN_PTR = dbo.SYSTEM_MAIN.RKEY'#13#10'WHER' +
      'E     (dbo.SYSTEM_MAIN.DESCRIPTION = '#39#20154#20107#31649#29702#39')'#13#10'order by DESCRIPTI' +
      'ON'
    FilterOptions = [foCaseInsensitive]
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    Left = 528
    Top = 336
    object cds419rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object cds419DESCRIPTION: TStringField
      DisplayLabel = #33756#21333
      DisplayWidth = 25
      FieldName = 'DESCRIPTION'
      ReadOnly = True
      Size = 50
    end
    object cds419PROGRAME: TStringField
      DisplayLabel = #31243#24207
      DisplayWidth = 25
      FieldName = 'PROGRAME'
      ReadOnly = True
      Size = 50
    end
  end
  object cdsDataDepartment: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select rkey,departmentname,departmentcode from dbo.datadepartmen' +
      't'#13#10'where invalid=0 '#13#10'order by departmentcode'
    FilterOptions = [foCaseInsensitive]
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    Left = 528
    Top = 264
    object cdsDataDepartmentrkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object cdsDataDepartmentdepartmentcode: TWideStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'departmentcode'
      ReadOnly = True
    end
    object cdsDataDepartmentdepartmentname: TWideStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'departmentname'
      ReadOnly = True
    end
  end
  object cds0073_1: TClientDataSet
    Aggregates = <>
    CommandText = 
      'declare @@tempTable table (selected bit null)'#13#10'insert into @@tem' +
      'pTable'#13#10'values(0)'#13#10'select selected,data0073.rkey,data0073.USER_L' +
      'OGIN_NAME,data0073.USER_FULL_NAME,data0034.dept_code,data0034.de' +
      'pt_name '#13#10'from data0073 join data0005 on data0073.EMPLOYEE_PTR=d' +
      'ata0005.rkey'#13#10'join data0034 on data0005.[EMPLOYEE_ID]=data0034.r' +
      'key'#13#10'join @@tempTable on 1=1 '#13#10'where data0073.ACTIVE_FLAG=0 and ' +
      'data0073.USER_GROUP_FLAG=1'#13#10'and data0073.rkey not in '#13#10'(select o' +
      'perator_ptr from dbo.hr_permission where departmentid=:vDepartme' +
      'ntid and program_ptr=:vProgram_ptr)'#13#10'order by data0073.USER_LOGI' +
      'N_NAME'
    FilterOptions = [foCaseInsensitive]
    FetchOnDemand = False
    Params = <
      item
        DataType = ftString
        Name = 'vDepartmentid'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'vProgram_ptr'
        ParamType = ptUnknown
        Value = '0'
      end>
    ProviderName = 'dspRead'
    Left = 584
    Top = 192
    object BooleanField1: TBooleanField
      DisplayLabel = #36873#25321
      DisplayWidth = 4
      FieldName = 'selected'
    end
    object StringField1: TStringField
      DisplayLabel = #30331#38470#21517
      FieldName = 'USER_LOGIN_NAME'
      ReadOnly = True
      Size = 15
    end
    object StringField2: TStringField
      DisplayLabel = #29992#25143#21517
      DisplayWidth = 25
      FieldName = 'USER_FULL_NAME'
      ReadOnly = True
      Size = 30
    end
    object cds0073_1dept_code: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'dept_code'
      Size = 10
    end
    object cds0073_1dept_name: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'dept_name'
    end
    object IntegerField1: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
  end
  object cdsDataDepartment_1: TClientDataSet
    Aggregates = <>
    CommandText = 
      'declare @@tempTable table (selected bit null)'#13#10'insert into @@tem' +
      'pTable'#13#10'values(0)'#13#10'select selected,rkey,departmentname,departmen' +
      'tcode from dbo.datadepartment'#13#10'join @@tempTable on 1=1'#13#10'where in' +
      'valid=0 '#13#10'and rkey not in (select departmentid from dbo.hr_permi' +
      'ssion where operator_ptr=:vOperator_ptr and program_ptr=:vProgra' +
      'm_ptr)'#13#10'order by departmentcode'
    FilterOptions = [foCaseInsensitive]
    FetchOnDemand = False
    Params = <
      item
        DataType = ftUnknown
        Name = 'vOperator_ptr'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vProgram_ptr'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspRead'
    Left = 640
    Top = 264
    object BooleanField2: TBooleanField
      DisplayLabel = #36873#25321
      FieldName = 'selected'
    end
    object IntegerField2: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object WideStringField1: TWideStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'departmentcode'
      ReadOnly = True
    end
    object WideStringField2: TWideStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'departmentname'
      ReadOnly = True
    end
  end
  object cds419_1: TClientDataSet
    Aggregates = <>
    CommandText = 
      'declare @@tempTable table (selected bit null)'#13#10'insert into @@tem' +
      'pTable'#13#10'values(0)'#13#10'select selected,data0419.rkey,data0419.DESCRI' +
      'PTION,data0419.PROGRAME '#13#10'from data0419 join @@tempTable on 1=1'#13 +
      #10'INNER JOIN dbo.SYSTEM_MENU ON dbo.Data0419.manu_ptr = dbo.SYSTE' +
      'M_MENU.RKEY INNER JOIN'#13#10'                      dbo.SYSTEM_MAIN ON' +
      ' dbo.SYSTEM_MENU.MAIN_PTR = dbo.SYSTEM_MAIN.RKEY'#13#10'WHERE     (dbo' +
      '.SYSTEM_MAIN.DESCRIPTION = '#39#20154#20107#31649#29702#39')'#13#10'and data0419.rkey not in (se' +
      'lect program_ptr from hr_permission where operator_ptr=:vOperato' +
      'r_ptr and departmentid=:vDepartmentid)'#13#10'order by DESCRIPTION'
    FilterOptions = [foCaseInsensitive]
    FetchOnDemand = False
    Params = <
      item
        DataType = ftUnknown
        Name = 'vOperator_ptr'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vDepartmentid'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspRead'
    Left = 576
    Top = 336
    object BooleanField3: TBooleanField
      DisplayLabel = #36873#25321
      DisplayWidth = 4
      FieldName = 'selected'
    end
    object IntegerField3: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object StringField3: TStringField
      DisplayLabel = #33756#21333
      DisplayWidth = 25
      FieldName = 'DESCRIPTION'
      ReadOnly = True
      Size = 50
    end
    object StringField4: TStringField
      DisplayLabel = #31243#24207
      DisplayWidth = 25
      FieldName = 'PROGRAME'
      ReadOnly = True
      Size = 50
    end
  end
  object cds0073_DELETE: TClientDataSet
    Aggregates = <>
    CommandText = 
      'declare @@tempTable table (selected bit null)'#13#10'insert into @@tem' +
      'pTable'#13#10'values(0)'#13#10'select selected,rkey,USER_LOGIN_NAME,USER_FUL' +
      'L_NAME from data0073 '#13#10'join @@tempTable on 1=1 where ACTIVE_FLAG' +
      '=0 and USER_GROUP_FLAG=1'#13#10'order by data0073.USER_LOGIN_NAME'
    FilterOptions = [foCaseInsensitive]
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    Left = 664
    Top = 192
    object BooleanField4: TBooleanField
      DisplayLabel = #36873#25321
      DisplayWidth = 4
      FieldName = 'selected'
    end
    object StringField5: TStringField
      DisplayLabel = #30331#38470#21517
      FieldName = 'USER_LOGIN_NAME'
      ReadOnly = True
      Size = 15
    end
    object StringField6: TStringField
      DisplayLabel = #29992#25143#21517
      DisplayWidth = 25
      FieldName = 'USER_FULL_NAME'
      ReadOnly = True
      Size = 30
    end
    object IntegerField4: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
  end
  object cdsDataDepartment_delete: TClientDataSet
    Aggregates = <>
    CommandText = 
      'declare @@tempTable table (selected bit null)'#13#10'insert into @@tem' +
      'pTable'#13#10'values(0)'#13#10'select selected,rkey,departmentname,departmen' +
      'tcode from dbo.datadepartment'#13#10'join @@tempTable on 1=1'#13#10'where in' +
      'valid=0 '#13#10'order by departmentcode'
    FilterOptions = [foCaseInsensitive]
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    Left = 744
    Top = 272
    object BooleanField5: TBooleanField
      DisplayLabel = #36873#25321
      FieldName = 'selected'
    end
    object IntegerField5: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object WideStringField3: TWideStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'departmentcode'
      ReadOnly = True
    end
    object WideStringField4: TWideStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'departmentname'
      ReadOnly = True
    end
  end
  object cds419_delete: TClientDataSet
    Aggregates = <>
    CommandText = 
      'declare @@tempTable table (selected bit null)'#13#10'insert into @@tem' +
      'pTable'#13#10'values(0)'#13#10'select selected,data0419.rkey,data0419.DESCRI' +
      'PTION,data0419.PROGRAME from data0419 join @@tempTable on 1=1'#13#10'I' +
      'NNER JOIN dbo.SYSTEM_MENU ON dbo.Data0419.manu_ptr = dbo.SYSTEM_' +
      'MENU.RKEY INNER JOIN'#13#10'                      dbo.SYSTEM_MAIN ON d' +
      'bo.SYSTEM_MENU.MAIN_PTR = dbo.SYSTEM_MAIN.RKEY'#13#10'WHERE     (dbo.S' +
      'YSTEM_MAIN.DESCRIPTION = '#39#20154#20107#31649#29702#39')'#13#10'order by DESCRIPTION'
    FilterOptions = [foCaseInsensitive]
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    Left = 712
    Top = 344
    object BooleanField6: TBooleanField
      DisplayLabel = #36873#25321
      DisplayWidth = 4
      FieldName = 'selected'
    end
    object IntegerField6: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object StringField7: TStringField
      DisplayLabel = #33756#21333
      DisplayWidth = 25
      FieldName = 'DESCRIPTION'
      ReadOnly = True
      Size = 50
    end
    object StringField8: TStringField
      DisplayLabel = #31243#24207
      DisplayWidth = 25
      FieldName = 'PROGRAME'
      ReadOnly = True
      Size = 50
    end
  end
end
