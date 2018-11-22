inherited frm_DepaRight1: Tfrm_DepaRight1
  Left = 343
  Top = 182
  Width = 879
  Height = 668
  Caption = #39640#25928#22686#21152
  PixelsPerInch = 96
  TextHeight = 12
  inherited dxStatusBar1: TdxStatusBar
    Top = 612
    Width = 871
  end
  inherited cxTabControl1: TcxTabControl
    Width = 871
    Height = 573
    ClientRectBottom = 573
    ClientRectRight = 871
    inherited Panel3: TPanel
      Top = 35
      Width = 871
      Height = 538
      inherited Panel2: TPanel
        Left = 751
        Height = 534
        inherited RzToolbar1: TRzToolbar
          Height = 534
          RowHeight = 26
          ToolbarControls = (
            Button1
            Button3)
          inherited Button1: TButton
            Top = 3
          end
          object Button3: TButton
            Left = 4
            Top = 30
            Width = 110
            Height = 23
            Caption = #26597#35810#21024#38500
            Enabled = False
            TabOrder = 1
            OnClick = Button3Click
          end
        end
      end
      inherited Panel4: TPanel
        Width = 751
        Height = 534
        inherited Panel5: TPanel
          Top = 528
          Width = 751
        end
        inherited Panel6: TPanel
          Height = 528
        end
        inherited cxPageControl2: TcxPageControl
          Width = 746
          Height = 528
          ActivePage = cxTabSheet1
          ClientRectBottom = 528
          ClientRectRight = 746
          inherited cxTabSheet0: TcxTabSheet
            ParentShowHint = False
            inherited ToolBar2: TToolBar
              Left = 333
              Height = 505
            end
            inherited DghMain: TDBGridEh
              Left = 333
              Width = 413
              Height = 505
              PopupMenu = PopupMenu2
            end
            object DBGridEh1: TDBGridEh
              Left = 0
              Top = 0
              Width = 333
              Height = 505
              Align = alLeft
              DataSource = ds_0419
              FooterColor = clWindow
              FooterFont.Charset = GB2312_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -12
              FooterFont.Name = #23435#20307
              FooterFont.Style = []
              TabOrder = 2
              TitleFont.Charset = GB2312_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -12
              TitleFont.Name = #23435#20307
              TitleFont.Style = []
            end
          end
          inherited cxTabSheet1: TcxTabSheet
            ParentShowHint = False
            ShowHint = True
            object DBGridEh2: TDBGridEh
              Left = 0
              Top = 0
              Width = 378
              Height = 505
              Align = alLeft
              DataSource = ds_0419
              EditActions = [geaCopyEh, geaSelectAllEh]
              FooterColor = clWindow
              FooterFont.Charset = GB2312_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -12
              FooterFont.Name = #23435#20307
              FooterFont.Style = []
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
              PopupMenu = PopupMenu3
              ReadOnly = True
              SortLocal = True
              TabOrder = 0
              TitleFont.Charset = GB2312_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -12
              TitleFont.Name = #23435#20307
              TitleFont.Style = []
              OnDrawColumnCell = DghMainDrawColumnCell
              OnEnter = DghMainEnter
              OnGetCellParams = DghMainGetCellParams
              OnKeyDown = DghMainKeyDown
              OnKeyPress = DghMainKeyPress
              OnTitleClick = DghMainTitleClick
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'DESCRIPTION'
                  Footers = <>
                  Width = 153
                end
                item
                  EditButtons = <>
                  FieldName = 'PROGRAME'
                  Footers = <>
                  Width = 188
                end>
            end
            object DBGridEh3: TDBGridEh
              Left = 378
              Top = 0
              Width = 368
              Height = 505
              Align = alClient
              DataSource = ds_adepartment
              EditActions = [geaCopyEh, geaSelectAllEh]
              FooterColor = clWindow
              FooterFont.Charset = GB2312_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -12
              FooterFont.Name = #23435#20307
              FooterFont.Style = []
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
              PopupMenu = PopupMenu3
              ReadOnly = True
              SortLocal = True
              TabOrder = 1
              TitleFont.Charset = GB2312_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -12
              TitleFont.Name = #23435#20307
              TitleFont.Style = []
              OnDrawColumnCell = DghMainDrawColumnCell
              OnEnter = DghMainEnter
              OnGetCellParams = DghMainGetCellParams
              OnKeyDown = DghMainKeyDown
              OnKeyPress = DghMainKeyPress
              OnTitleClick = DghMainTitleClick
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'departmentname'
                  Footers = <>
                  Width = 114
                end
                item
                  EditButtons = <>
                  FieldName = 'departmentcode'
                  Footers = <>
                  Width = 115
                end>
            end
          end
        end
      end
      inherited Panel7: TPanel
        Top = 534
        Width = 871
      end
    end
    inherited Panel1: TPanel
      Width = 871
      Height = 35
      object Label1: TLabel
        Left = 10
        Top = 14
        Width = 24
        Height = 12
        Caption = #29992#25143
      end
      object edt_USER_FULL_NAME: TEdit
        Left = 118
        Top = 11
        Width = 102
        Height = 20
        ReadOnly = True
        TabOrder = 0
        OnChange = edt_USER_FULL_NAMEChange
      end
      object edt_USER_LOGIN_NAME: TButtonEdit
        Left = 38
        Top = 11
        Width = 80
        Height = 20
        ReadOnlyColor = clInactiveCaptionText
        TabOrder = 1
        F_DownFormWidth = 0
        F_DownListDataSet = frm_DepaRight.cds0073
        F_DownDataSetFilterField = 'USER_LOGIN_NAME'
        F_ResultFieldName = 'USER_LOGIN_NAME'
        F_GetFieldName = 'USER_LOGIN_NAME'
        F_RkeyFieldName = 'rkey'
        F_Edit1 = edt_USER_FULL_NAME
        F_ResultFieldName1 = 'USER_FULL_NAME'
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
          ItemName = 'tblDelete'
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
      'tr=data0419.rkey'#13#10'where 1=2'
  end
  inherited cdsMain: Tcds
    CommandText = 
      'select data0073.USER_LOGIN_NAME,data0073.USER_FULL_NAME,departme' +
      'ntname,'#13#10'departmentcode,DESCRIPTION,PROGRAME,hr_permission.*'#13#10'fr' +
      'om dbo.hr_permission'#13#10'join data0073 on hr_permission.operator_pt' +
      'r=data0073.rkey'#13#10'join datadepartment on hr_permission.department' +
      'id=datadepartment.rkey'#13#10'join data0419 on hr_permission.program_p' +
      'tr=data0419.rkey'#13#10'where 1=2'
    object cdsMainUSER_LOGIN_NAME: TStringField
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object cdsMainUSER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object cdsMaindepartmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object cdsMaindepartmentcode: TWideStringField
      FieldName = 'departmentcode'
    end
    object cdsMainDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 50
    end
    object cdsMainPROGRAME: TStringField
      FieldName = 'PROGRAME'
      Size = 50
    end
    object cdsMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
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
  end
  inherited dtRead: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'declare @@tempTable table (selected bit null)'#13#10'insert into @@tem' +
      'pTable'#13#10'values(0)'#13#10'select selected,rkey,departmentname,departmen' +
      'tcode from dbo.datadepartment'#13#10'join @@tempTable on 1=1'#13#10'where in' +
      'valid=0 '#13#10'order by departmentcode'
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
  inherited PopupMenu1: TPopupMenu
    Left = 181
    Top = 154
  end
  object cds_datadepartment: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select rkey,departmentname,departmentcode '#13#10'from dbo.datadepartm' +
      'ent'#13#10'where 1=0 '#13#10'order by departmentcode'
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    Left = 248
    Top = 216
    object cds_datadepartmentrkey: TIntegerField
      FieldName = 'rkey'
      Visible = False
    end
    object cds_datadepartmentdepartmentname: TWideStringField
      DisplayLabel = #37096#38376
      FieldName = 'departmentname'
    end
    object cds_datadepartmentdepartmentcode: TWideStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'departmentcode'
    end
  end
  object cds_0419: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select data0419.rkey,data0419.DESCRIPTION,data0419.PROGRAME '#13#10'fr' +
      'om data0419 '#13#10'WHERE  1=2'#13#10'order by DESCRIPTION'
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    Left = 440
    Top = 216
    object cds_0419rkey: TIntegerField
      FieldName = 'rkey'
      Visible = False
    end
    object cds_0419DESCRIPTION: TStringField
      DisplayLabel = #31243#24207#25551#36848
      FieldName = 'DESCRIPTION'
      Size = 50
    end
    object cds_0419PROGRAME: TStringField
      DisplayLabel = #31243#24207#20195#30721
      FieldName = 'PROGRAME'
      Size = 50
    end
  end
  object ds_adepartment: TDataSource
    DataSet = cds_datadepartment
    Left = 357
    Top = 219
  end
  object ds_0419: TDataSource
    DataSet = cds_0419
    Left = 501
    Top = 211
  end
  object PopupMenu2: TPopupMenu
    Left = 141
    Top = 323
  end
  object PopupMenu3: TPopupMenu
    Left = 197
    Top = 403
    object MenuItem1: TMenuItem
      Caption = #28155#21152
      OnClick = MenuItem1Click
    end
  end
  object cdsDataDepartment_1: TClientDataSet
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
    Left = 576
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
      '.SYSTEM_MAIN.DESCRIPTION = '#39#20154#20107#31649#29702#39')'#13#10'order by DESCRIPTION'
    FilterOptions = [foCaseInsensitive]
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    Left = 576
    Top = 304
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
end
