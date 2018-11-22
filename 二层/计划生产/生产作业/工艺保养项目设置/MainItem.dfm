inherited MainItem_f: TMainItem_f
  Left = 240
  Top = 240
  Caption = 'MainItem_f'
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 12
  inherited cxTabControl1: TcxTabControl
    inherited Panel2: TPanel
      inherited Panel4: TPanel
        inherited RzToolbar2: TRzToolbar
          ToolbarControls = (
            btn1)
        end
      end
      inherited cxPageControl1: TcxPageControl
        inherited cxTabSheetMain1: TcxTabSheet
          inherited DghMain: TDBGridEh
            Columns = <
              item
                EditButtons = <>
                FieldName = 'FASSET_CODE'
                Footers = <>
                Width = 97
              end
              item
                EditButtons = <>
                FieldName = 'FASSET_NAME'
                Footers = <>
                Width = 122
              end
              item
                EditButtons = <>
                FieldName = 'LOCATION'
                Footers = <>
                Width = 148
              end
              item
                EditButtons = <>
                FieldName = 'active_flag'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'DEPT_NAME'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'AcceCode'
                Footers = <>
                Width = 84
              end
              item
                EditButtons = <>
                FieldName = 'AcceName'
                Footers = <>
                ReadOnly = True
                Width = 88
              end
              item
                EditButtons = <>
                FieldName = 'PHONE'
                Footers = <>
              end>
          end
        end
        inherited cxTabSheetMain2: TcxTabSheet
          TabVisible = False
        end
      end
    end
    inherited Panel3: TPanel
      inherited Panel7: TPanel
        inherited Panel8: TPanel
          inherited RzToolbar3: TRzToolbar
            ToolbarControls = (
              btn2)
          end
        end
        inherited Panel9: TPanel
          inherited Panel10: TPanel
            Top = 181
            Height = 35
            object GroupBox3: TGroupBox
              Left = 0
              Top = 0
              Width = 193
              Height = 35
              Align = alLeft
              Caption = #36807#28388
              TabOrder = 0
              object Filter_Label: TLabel
                Left = 10
                Top = 14
                Width = 48
                Height = 12
                Caption = #23457#25209#31867#22411
              end
              object Filter_Edit: TEdit
                Left = 64
                Top = 10
                Width = 121
                Height = 20
                TabOrder = 0
                Text = 'Filter_Edit'
                OnChange = Filter_EditChange
              end
            end
          end
          inherited Panel11: TPanel
            Height = 181
          end
          inherited cxPageControl2: TcxPageControl
            Height = 181
            ClientRectBottom = 181
            inherited cxTabSheetChild1: TcxTabSheet
              inherited ToolBar1: TToolBar
                Height = 158
              end
              inherited dghChild: TDBGridEh
                Height = 158
                EditActions = [geaCopyEh, geaPasteEh, geaSelectAllEh]
                RowSizingAllowed = True
                Columns = <
                  item
                    EditButtons = <>
                    FieldName = 'number'
                    Footers = <>
                    Width = 27
                  end
                  item
                    EditButtons = <>
                    FieldName = 'Item'
                    Footers = <>
                    Width = 141
                  end
                  item
                    EditButtons = <>
                    FieldName = 'MainCycl'
                    Footers = <>
                  end
                  item
                    EditButtons = <>
                    FieldName = 'MainMeth'
                    Footers = <>
                    Width = 350
                  end
                  item
                    EditButtons = <>
                    FieldName = 'ChecAcce'
                    Footers = <>
                    Width = 350
                  end
                  item
                    EditButtons = <>
                    FieldName = 'defauMan'
                    Footers = <>
                    Width = 112
                  end
                  item
                    EditButtons = <>
                    FieldName = 'MainPhone'
                    Footers = <>
                    Width = 86
                  end>
              end
            end
            inherited cxTabSheetChild2: TcxTabSheet
              object Label1: TLabel
                Left = 16
                Top = 11
                Width = 24
                Height = 12
                Caption = #24207#21495
              end
              object Label2: TLabel
                Left = 16
                Top = 51
                Width = 48
                Height = 12
                Caption = #20445#20859#21608#26399
              end
              object Label3: TLabel
                Left = 16
                Top = 91
                Width = 48
                Height = 12
                Caption = #20445#20859#39033#30446
              end
              object Label4: TLabel
                Left = 16
                Top = 153
                Width = 48
                Height = 12
                Caption = #20445#20859#26041#27861
              end
              object Label5: TLabel
                Left = 262
                Top = 12
                Width = 48
                Height = 12
                Caption = #39564#25910#26631#20934
              end
              object Label6: TLabel
                Left = 262
                Top = 92
                Width = 60
                Height = 12
                Caption = #40664#35748#20445#20859#20154
              end
              object Label7: TLabel
                Left = 262
                Top = 132
                Width = 60
                Height = 12
                Caption = #20445#20859#20154#30005#35805
              end
              object edt_Item: TDBMemo
                Left = 18
                Top = 108
                Width = 200
                Height = 38
                DataField = 'Item'
                DataSource = dsChild
                TabOrder = 0
              end
              object edt_MainMeth: TDBMemo
                Left = 17
                Top = 168
                Width = 200
                Height = 57
                DataField = 'MainMeth'
                DataSource = dsChild
                TabOrder = 1
              end
              object edt_ChecAcce: TDBMemo
                Left = 262
                Top = 28
                Width = 200
                Height = 57
                DataField = 'ChecAcce'
                DataSource = dsChild
                TabOrder = 2
              end
              object edt_MainPhone: TDBEdit
                Left = 262
                Top = 149
                Width = 121
                Height = 20
                DataField = 'MainPhone'
                DataSource = dsChild
                TabOrder = 3
              end
              object edt_defauMan: TDBEdit
                Left = 262
                Top = 109
                Width = 121
                Height = 20
                DataField = 'defauMan'
                DataSource = dsChild
                TabOrder = 4
              end
              object edt_number: TDBEdit
                Left = 18
                Top = 27
                Width = 50
                Height = 20
                DataField = 'number'
                DataSource = dsChild
                TabOrder = 5
              end
              object edt_MainCycl: TDBButtonEdit
                Left = 18
                Top = 67
                Width = 121
                Height = 20
                Hint = #25353'F1'#24377#20986#19979#25289#21015#34920
                DataSource = dsChild
                DataField = 'MainCycl'
                ParentShowHint = False
                ReadOnlyColor = clInactiveCaptionText
                ShowHint = True
                TabOrder = 6
                F_DownFormWidth = 0
                F_DownListDataSet = cds0816
                F_DownDataSetFilterField = 'MainCycl'
                F_ResultFieldName = 'MainCycl'
                F_GetFieldName = 'MainCycl'
                F_PressKey13AutoDrop = False
              end
            end
          end
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
      'select data0417.rkey,data0417.FASSET_CODE,data0417.FASSET_NAME,d' +
      'ata0417.LOCATION,'#13#10'data0034.DEPT_NAME,data0005.EMPL_CODE [AcceCo' +
      'de],data0417.Acceptan_ptr,'#13#10'data0005.EMPLOYEE_NAME [AcceName],da' +
      'ta0005.PHONE,case DATA0417.active_flag when 1 then '#39#26032#36827#39' when 2 t' +
      'hen '#39#20179#24211#30830#35748#39' when 3 then '#39#23433#35013#23436#25104#39' '#13#10'       when 4 then '#39#39564#25910#21512#26684#39' when 5' +
      ' then '#39#25253#24223#39' when 6 then '#39#35843#25320#22806#20986#39' when 7 then '#39#38386#32622#39' end AS active_fla' +
      'g'#13#10'from data0417 '#13#10'join data0034 on data0417.DEPT_PTR=data0034.r' +
      'key'#13#10'left join data0005 on data0417.Acceptan_ptr=data0005.rkey'
    object dtMainFASSET_CODE: TStringField
      FieldName = 'FASSET_CODE'
      ProviderFlags = []
    end
    object dtMainFASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      ProviderFlags = []
      Size = 30
    end
    object dtMainLOCATION: TStringField
      FieldName = 'LOCATION'
      ProviderFlags = []
      Size = 40
    end
    object dtMainDEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      ProviderFlags = []
      Size = 30
    end
    object dtMainrkey: TIntegerField
      FieldName = 'rkey'
    end
    object dtMainAcceptan_ptr: TIntegerField
      FieldName = 'Acceptan_ptr'
    end
    object dtMainAcceCode: TStringField
      FieldName = 'AcceCode'
      ProviderFlags = []
      Size = 10
    end
    object dtMainAcceName: TStringField
      FieldName = 'AcceName'
      ProviderFlags = []
      Size = 16
    end
    object dtMainPHONE: TStringField
      FieldName = 'PHONE'
      ProviderFlags = []
      Size = 14
    end
    object dtMainactive_flag: TStringField
      FieldName = 'active_flag'
      ProviderFlags = []
      ReadOnly = True
      Size = 8
    end
  end
  inherited dspMain: TDataSetProvider
    OnGetTableName = dspMainGetTableName
  end
  inherited cdsMain: Tcds
    CommandText = 
      'select data0417.rkey,data0417.FASSET_CODE,data0417.FASSET_NAME,d' +
      'ata0417.LOCATION,'#13#10'data0034.DEPT_NAME,data0005.EMPL_CODE [AcceCo' +
      'de],data0417.Acceptan_ptr,'#13#10'data0005.EMPLOYEE_NAME [AcceName],da' +
      'ta0005.PHONE,case DATA0417.active_flag when 1 then '#39#26032#36827#39' when 2 t' +
      'hen '#39#20179#24211#30830#35748#39' when 3 then '#39#23433#35013#23436#25104#39' '#13#10'       when 4 then '#39#39564#25910#21512#26684#39' when 5' +
      ' then '#39#25253#24223#39' when 6 then '#39#35843#25320#22806#20986#39' when 7 then '#39#38386#32622#39' end AS active_fla' +
      'g'#13#10'from data0417 '#13#10'join data0034 on data0417.DEPT_PTR=data0034.r' +
      'key'#13#10'left join data0005 on data0417.Acceptan_ptr=data0005.rkey'
    OnFilterRecord = cdsMainFilterRecord
    F_SQLSelectFrom = 
      'select data0417.rkey,data0417.FASSET_CODE,data0417.FASSET_NAME,d' +
      'ata0417.LOCATION,'#13#10'data0034.DEPT_NAME,data0005.EMPL_CODE [AcceCo' +
      'de],data0417.Acceptan_ptr,'#13#10'data0005.EMPLOYEE_NAME [AcceName],da' +
      'ta0005.PHONE,case DATA0417.active_flag when 1 then '#39#26032#36827#39' when 2 t' +
      'hen '#39#20179#24211#30830#35748#39' when 3 then '#39#23433#35013#23436#25104#39' '#13#10'       when 4 then '#39#39564#25910#21512#26684#39' when 5' +
      ' then '#39#25253#24223#39' when 6 then '#39#35843#25320#22806#20986#39' when 7 then '#39#38386#32622#39' end AS active_fla' +
      'g'#13#10'from data0417 '#13#10'join data0034 on data0417.DEPT_PTR=data0034.r' +
      'key'#13#10'left join data0005 on data0417.Acceptan_ptr=data0005.rkey'
    F_SQLWhere = 'where  data0417.active_flag in(2,3,4,5,6)'
    F_SQLOrderBy = 'order by data0034.DEPT_CODE,data0417.FASSET_CODE'
    object cdsMainFASSET_CODE: TStringField
      DisplayLabel = #35774#22791#20195#30721
      FieldName = 'FASSET_CODE'
      ProviderFlags = []
      ReadOnly = True
      OnChange = cdsMainFASSET_CODEChange
    end
    object cdsMainFASSET_NAME: TStringField
      DisplayLabel = #35774#22791#21517#31216
      FieldName = 'FASSET_NAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object cdsMainLOCATION: TStringField
      DisplayLabel = #20301#32622
      FieldName = 'LOCATION'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object cdsMainDEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object cdsMainrkey: TIntegerField
      FieldName = 'rkey'
      Visible = False
    end
    object cdsMainAcceptan_ptr: TIntegerField
      FieldName = 'Acceptan_ptr'
    end
    object cdsMainAcceCode: TStringField
      DisplayLabel = #40664#35748#39564#25910#20195#30721
      FieldName = 'AcceCode'
      ProviderFlags = []
      OnChange = cdsMainAcceCodeChange
      Size = 10
    end
    object cdsMainAcceName: TStringField
      DisplayLabel = #40664#35748#39564#25910#20154
      FieldName = 'AcceName'
      ProviderFlags = []
      Size = 16
    end
    object cdsMainPHONE: TStringField
      DisplayLabel = #30005#35805
      FieldName = 'PHONE'
      ProviderFlags = []
      Size = 14
    end
    object cdsMainactive_flag: TStringField
      DisplayLabel = #35774#22791#29366#24577
      FieldName = 'active_flag'
      ReadOnly = True
      Size = 8
    end
  end
  inherited dtRead: TADODataSet
    CursorType = ctStatic
    CommandText = 'select MainCycl from data0816'
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
  inherited cdsChild: Tcds
    CommandText = 'select * from data0804'
    F_AutoIncrField = 'rkey'
    F_SQLSelectFrom = 'select * from data0804'
    F_SQLOrderBy = 'order by number'
    F_Primarykey = 'rkey'
    F_Foreignkey = 'D417_ptr'
    object cdsChildrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object cdsChildD804_ptr: TIntegerField
      FieldName = 'D417_ptr'
    end
    object cdsChildnumber: TSmallintField
      DisplayLabel = #24207#21495
      FieldName = 'number'
    end
    object cdsChildMainCycl: TStringField
      DisplayLabel = #20445#20859#21608#26399
      FieldName = 'MainCycl'
      Size = 10
    end
    object cdsChildItem: TStringField
      DisplayLabel = #20445#20859#39033#30446
      FieldName = 'Item'
      Size = 100
    end
    object cdsChildMainMeth: TStringField
      DisplayLabel = #20445#20859#26041#27861
      FieldName = 'MainMeth'
      Size = 400
    end
    object cdsChildChecAcce: TStringField
      DisplayLabel = #39564#25910#26631#20934
      FieldName = 'ChecAcce'
      Size = 400
    end
    object cdsChilddefauMan: TStringField
      DisplayLabel = #40664#35748#20445#20859#20154
      FieldName = 'defauMan'
      Size = 100
    end
    object cdsChildMainPhone: TStringField
      DisplayLabel = #20445#20859#20154#30005#35805
      FieldName = 'MainPhone'
      Size = 12
    end
  end
  inherited MainGrid_PopupMenu: TPopupMenu
    Left = 292
  end
  inherited dtChild: TADODataSet
    CursorType = ctStatic
    CommandText = 'select * from data0804'
  end
  object cds0417: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select data0417.rkey,rtrim(ltrim(data0417.FASSET_CODE))FASSET_CO' +
      'DE,data0417.FASSET_NAME,data0417.LOCATION,data0034.DEPT_NAME'#13#10'fr' +
      'om  data0417 '#13#10'join data0034 on data0417.DEPT_PTR=data0034.rkey'
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 544
    Top = 224
    object cds0417rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object cds0417FASSET_CODE: TStringField
      DisplayLabel = #35774#22791#20195#30721
      FieldName = 'FASSET_CODE'
      Size = 16
    end
    object cds0417FASSET_NAME: TStringField
      DisplayLabel = #35774#22791#21517#31216
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object cds0417LOCATION: TStringField
      DisplayLabel = #20301#32622
      FieldName = 'LOCATION'
      Size = 10
    end
    object cds0417DEPT_NAME: TStringField
      DisplayLabel = #37096#38376
      FieldName = 'DEPT_NAME'
      Size = 10
    end
  end
  object cds0816: TClientDataSet
    Aggregates = <>
    CommandText = 'select MainCycl from data0816'
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 544
    Top = 280
    object cds0816MainCycl: TStringField
      DisplayLabel = #20445#20859#21608#26399
      FieldName = 'MainCycl'
      Size = 10
    end
  end
  object cds005: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select data0005.rkey,data0005.EMPL_CODE [AcceCode],data0005.EMPL' +
      'OYEE_NAME [AcceName],data0005.PHONE,data0034.DEPT_NAME '#13#10'from da' +
      'ta0005 '#13#10'join data0034 on data0005.EMPLOYEE_ID=data0034.rkey'#13#10'wh' +
      'ere data0005.ACTIVE_FLAG='#39'Y'#39
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 544
    Top = 168
    object cds005AcceCode: TStringField
      DisplayLabel = #38599#21592#20195#30721
      FieldName = 'AcceCode'
      Size = 10
    end
    object cds005AcceName: TStringField
      DisplayLabel = #38599#21592#22995#21517
      FieldName = 'AcceName'
      Size = 16
    end
    object cds005DEPT_NAME: TStringField
      DisplayLabel = #37096#38376
      DisplayWidth = 20
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object cds005PHONE: TStringField
      DisplayLabel = #30005#35805
      FieldName = 'PHONE'
      Size = 14
    end
    object cds005rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
  end
end
