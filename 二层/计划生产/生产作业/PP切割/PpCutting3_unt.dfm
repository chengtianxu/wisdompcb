inherited PpCutting3_frm: TPpCutting3_frm
  Left = 300
  Top = 256
  Caption = #24453#20999#21106
  Position = poMainFormCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 12
  inherited cxTabControl1: TcxTabControl
    inherited Splitter1: TSplitter
      Top = 295
    end
    inherited Panel2: TPanel
      Height = 290
      inherited Panel4: TPanel
        Height = 290
        inherited RzToolbar2: TRzToolbar
          Height = 290
          ToolbarControls = (
            btn1
            btn_NormalCut)
          object btn_NormalCut: TButton
            Left = 4
            Top = 32
            Width = 111
            Height = 25
            Caption = #27491#24120#20999#21106
            TabOrder = 1
            OnClick = btn_NormalCutClick
          end
        end
      end
      inherited cxPageControl1: TcxPageControl
        Height = 290
        ClientRectBottom = 290
        inherited cxTabSheetMain1: TcxTabSheet
          inherited ToolBar2: TToolBar
            Height = 267
          end
          inherited DghMain: TDBGridEh
            Height = 267
            FooterRowCount = 1
            ReadOnly = True
            Columns = <
              item
                EditButtons = <>
                FieldName = 'TTYPE'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'MANU_PART_NUMBER'
                Footers = <>
                Width = 96
              end
              item
                EditButtons = <>
                FieldName = 'INV_PART_NUMBER'
                Footers = <>
                Width = 158
              end
              item
                EditButtons = <>
                FieldName = 'INV_NAME'
                Footers = <>
                Width = 140
              end
              item
                EditButtons = <>
                FieldName = 'INV_DESCRIPTION'
                Footers = <>
                Width = 127
              end
              item
                EditButtons = <>
                FieldName = 'lam2'
                Footers = <>
                Width = 87
              end
              item
                EditButtons = <>
                FieldName = 'lam_ty_gp'
                Footers = <>
                Width = 106
              end
              item
                EditButtons = <>
                FieldName = 'panel_ln'
                Footers = <>
                Width = 62
              end
              item
                EditButtons = <>
                FieldName = 'panel_wd'
                Footers = <>
                Width = 63
              end
              item
                EditButtons = <>
                FieldName = 'manuf_qty'
                Footers = <>
                Width = 66
              end
              item
                EditButtons = <>
                FieldName = 'panel_qty'
                Footer.ValueType = fvtStaticText
                Footers = <>
                Width = 76
              end
              item
                EditButtons = <>
                FieldName = 'pp_quota_len'
                Footer.ValueType = fvtStaticText
                Footers = <>
                Width = 99
              end
              item
                EditButtons = <>
                FieldName = 'pp_quota_roll'
                Footers = <>
                Width = 98
              end>
          end
        end
        inherited cxTabSheetMain2: TcxTabSheet
          ParentShowHint = False
          ShowHint = True
          TabVisible = False
          object Label7: TLabel
            Left = 14
            Top = 48
            Width = 48
            Height = 12
            Caption = #26448#26009#32534#21495
          end
          object Label8: TLabel
            Left = 14
            Top = 88
            Width = 48
            Height = 12
            Caption = #26448#26009#21517#31216
          end
          object Label9: TLabel
            Left = 14
            Top = 128
            Width = 48
            Height = 12
            Caption = #26448#26009#35268#26684
          end
          object Label12: TLabel
            Left = 14
            Top = 168
            Width = 48
            Height = 12
            Caption = #26448#26009#21378#21830
          end
          object Label13: TLabel
            Left = 14
            Top = 208
            Width = 48
            Height = 12
            Caption = #26448#26009#22411#21495
          end
          object Label14: TLabel
            Left = 201
            Top = 5
            Width = 60
            Height = 12
            Caption = #38271#24230'('#32428#21521')'
          end
          object Label15: TLabel
            Left = 201
            Top = 45
            Width = 60
            Height = 12
            Caption = #23485#24230'('#32463#21521')'
          end
          object Label16: TLabel
            Left = 201
            Top = 85
            Width = 102
            Height = 12
            Caption = #29983#20135#24635#25968#37327'(panel)'
          end
          object Label17: TLabel
            Left = 201
            Top = 125
            Width = 96
            Height = 12
            Caption = #20999#21106#24352#25968#9
          end
          object Label18: TLabel
            Left = 201
            Top = 168
            Width = 96
            Height = 12
            Caption = #37197#39069#20999#21106#38271#24230'('#31859')'
          end
          object Label19: TLabel
            Left = 201
            Top = 208
            Width = 72
            Height = 12
            Caption = #37197#39069#20999#21106#21367#25968
          end
          object DBEdit8: TDBEdit
            Left = 14
            Top = 64
            Width = 165
            Height = 20
            DataField = 'INV_PART_NUMBER'
            DataSource = dsMain
            TabOrder = 0
          end
          object DBEdit9: TDBEdit
            Left = 14
            Top = 104
            Width = 165
            Height = 20
            DataField = 'INV_NAME'
            DataSource = dsMain
            TabOrder = 1
          end
          object DBEdit10: TDBEdit
            Left = 14
            Top = 144
            Width = 165
            Height = 20
            DataField = 'INV_DESCRIPTION'
            DataSource = dsMain
            TabOrder = 2
          end
          object DBEdit11: TDBEdit
            Left = 14
            Top = 184
            Width = 165
            Height = 20
            DataField = 'lam2'
            DataSource = dsMain
            TabOrder = 3
          end
          object DBEdit12: TDBEdit
            Left = 14
            Top = 224
            Width = 165
            Height = 20
            DataField = 'lam_ty_gp'
            DataSource = dsMain
            TabOrder = 4
          end
          object DBEdit13: TDBEdit
            Left = 201
            Top = 21
            Width = 121
            Height = 20
            DataField = 'panel_ln'
            DataSource = dsMain
            TabOrder = 5
          end
          object DBEdit14: TDBEdit
            Left = 201
            Top = 61
            Width = 121
            Height = 20
            DataField = 'panel_wd'
            DataSource = dsMain
            TabOrder = 6
          end
          object DBEdit15: TDBEdit
            Left = 201
            Top = 101
            Width = 121
            Height = 20
            DataField = 'manuf_qty'
            DataSource = dsMain
            TabOrder = 7
          end
          object DBEdit17: TDBEdit
            Left = 201
            Top = 184
            Width = 121
            Height = 20
            DataField = 'pp_quota_len'
            DataSource = dsMain
            TabOrder = 8
          end
          object DBEdit18: TDBEdit
            Left = 201
            Top = 224
            Width = 121
            Height = 20
            DataField = 'pp_quota_roll'
            DataSource = dsMain
            TabOrder = 9
          end
          object DBEdit16: TDBEdit
            Left = 201
            Top = 142
            Width = 121
            Height = 20
            DataField = 'panel_qty'
            DataSource = dsMain
            TabOrder = 10
          end
        end
      end
      inherited Panel6: TPanel
        Height = 290
      end
    end
    inherited Panel3: TPanel
      Top = 302
      Height = 207
      inherited Panel5: TPanel
        Top = 202
      end
      inherited Panel7: TPanel
        Height = 202
        inherited Panel8: TPanel
          Height = 202
          inherited RzToolbar3: TRzToolbar
            Height = 202
            ToolbarControls = (
              btn2)
          end
        end
        inherited Panel9: TPanel
          Height = 202
          inherited Panel10: TPanel
            Top = 167
            Height = 35
            object Label1: TLabel
              Left = 16
              Top = 15
              Width = 48
              Height = 12
              Caption = #26448#26009#32534#21495
            end
            object edt_Filter: TEdit
              Left = 78
              Top = 11
              Width = 126
              Height = 20
              TabOrder = 0
              OnChange = edt_FilterChange
            end
          end
          inherited Panel11: TPanel
            Height = 167
          end
          inherited cxPageControl2: TcxPageControl
            Height = 167
            ClientRectBottom = 167
            inherited cxTabSheetChild1: TcxTabSheet
              inherited ToolBar1: TToolBar
                Height = 144
              end
              inherited dghChild: TDBGridEh
                Height = 144
                Columns = <
                  item
                    EditButtons = <>
                    FieldName = 'Selected'
                    Footers = <>
                  end
                  item
                    EditButtons = <>
                    FieldName = 'WORK_ORDER_NUMBER'
                    Footers = <>
                    ReadOnly = True
                  end
                  item
                    EditButtons = <>
                    FieldName = 'manuf_qty'
                    Footers = <>
                    ReadOnly = True
                    Width = 100
                  end
                  item
                    EditButtons = <>
                    FieldName = 'pp_quota'
                    Footers = <>
                    ReadOnly = True
                    Width = 65
                  end
                  item
                    EditButtons = <>
                    FieldName = 'panel_qty'
                    Footers = <>
                    ReadOnly = True
                    Width = 66
                  end
                  item
                    EditButtons = <>
                    FieldName = 'panel_ln'
                    Footers = <>
                    ReadOnly = True
                    Width = 97
                  end
                  item
                    EditButtons = <>
                    FieldName = 'panel_wd'
                    Footers = <>
                    ReadOnly = True
                    Width = 95
                  end
                  item
                    EditButtons = <>
                    FieldName = 'PP_TYP'
                    Footers = <>
                    ReadOnly = True
                    Width = 151
                  end
                  item
                    EditButtons = <>
                    FieldName = 'pp_rc'
                    Footers = <>
                    ReadOnly = True
                    Width = 94
                  end
                  item
                    EditButtons = <>
                    FieldName = 'pp_tg'
                    Footers = <>
                    ReadOnly = True
                    Width = 97
                  end
                  item
                    EditButtons = <>
                    FieldName = 'pp_quota_len'
                    Footers = <>
                    ReadOnly = True
                    Width = 82
                  end
                  item
                    EditButtons = <>
                    FieldName = 'pp_quota_roll'
                    Footers = <>
                    ReadOnly = True
                  end
                  item
                    EditButtons = <>
                    FieldName = 'qg_flag'
                    Footers = <>
                    ReadOnly = True
                    Width = 42
                  end
                  item
                    EditButtons = <>
                    FieldName = 'remark'
                    Footers = <>
                    ReadOnly = True
                    Width = 201
                  end>
              end
            end
            inherited cxTabSheetChild2: TcxTabSheet
              TabVisible = False
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
      'select '#13#10'data0025.MANU_PART_NUMBER ,data0017.INV_PART_NUMBER,dat' +
      'a0017.INV_NAME,data0017.INV_DESCRIPTION, '#13#10't1.rkey25,lam2,lam_ty' +
      '_gp,t1.rkey17,t1.[TTYPE],'#13#10't1.panel_ln,t1.panel_wd,manuf_qty,t1.' +
      'panel_qty,pp_quota_len,pp_quota_roll'#13#10#9'from('#13#10#9'select data0731.r' +
      'key25,data0731.lam2,data0731.lam_ty_gp,data0732.rkey17,'#13#10'       ' +
      '    data0732.[panel_ln],data0732.[panel_wd],data0731.[TTYPE],'#13#10' ' +
      '   sum(data0732.[panel_qty])as [panel_qty],'#13#10'    sum(data0732.pp' +
      '_quota_len)as pp_quota_len,'#13#10'    sum(data0732.pp_quota_roll)as p' +
      'p_quota_roll,'#13#10'    sum(data0732.manuf_qty)as manuf_qty'#13#10#9'from da' +
      'ta0732'#13#10#9'join data0731 on data0732.rkey731=data0731.rkey'#13#10'    wh' +
      'ere data0732.qg_flag=0 and data0731.TStatus=1'#13#10#9'group by data073' +
      '1.rkey25,data0731.lam2,data0731.lam_ty_gp,data0732.rkey17,'#13#10'    ' +
      '         data0732.[panel_ln],data0732.[panel_wd],data0731.[TTYPE' +
      '])as t1'#13#10'join data0025 on t1.rkey25=data0025.rkey'#13#10'join data0017' +
      ' on t1.rkey17=data0017.rkey'
    EnableBCD = False
    object dtMainMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object dtMainINV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object dtMainINV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object dtMainINV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object dtMainrkey25: TIntegerField
      FieldName = 'rkey25'
    end
    object dtMainlam2: TStringField
      FieldName = 'lam2'
      Size = 30
    end
    object dtMainlam_ty_gp: TStringField
      FieldName = 'lam_ty_gp'
      Size = 30
    end
    object dtMainrkey17: TIntegerField
      FieldName = 'rkey17'
    end
    object dtMainpanel_ln: TBCDField
      FieldName = 'panel_ln'
      Precision = 7
      Size = 2
    end
    object dtMainpanel_wd: TBCDField
      FieldName = 'panel_wd'
      Precision = 7
      Size = 2
    end
    object dtMainmanuf_qty: TIntegerField
      FieldName = 'manuf_qty'
      ReadOnly = True
    end
    object dtMainpanel_qty: TIntegerField
      FieldName = 'panel_qty'
    end
    object dtMainpp_quota_len: TBCDField
      FieldName = 'pp_quota_len'
      Precision = 32
      Size = 5
    end
    object dtMainpp_quota_roll: TFloatField
      FieldName = 'pp_quota_roll'
    end
    object dtMainTTYPE: TWordField
      FieldName = 'TTYPE'
    end
  end
  inherited cdsMain: Tcds
    CommandText = 
      'select '#13#10'data0025.MANU_PART_NUMBER ,data0017.INV_PART_NUMBER,dat' +
      'a0017.INV_NAME,data0017.INV_DESCRIPTION, '#13#10't1.rkey25,lam2,lam_ty' +
      '_gp,t1.rkey17,t1.[TTYPE],'#13#10't1.panel_ln,t1.panel_wd,manuf_qty,t1.' +
      'panel_qty,pp_quota_len,pp_quota_roll'#13#10#9'from('#13#10#9'select data0731.r' +
      'key25,data0731.lam2,data0731.lam_ty_gp,data0732.rkey17,'#13#10'       ' +
      '    data0732.[panel_ln],data0732.[panel_wd],data0731.[TTYPE],'#13#10' ' +
      '   sum(data0732.[panel_qty])as [panel_qty],'#13#10'    sum(data0732.pp' +
      '_quota_len)as pp_quota_len,'#13#10'    sum(data0732.pp_quota_roll)as p' +
      'p_quota_roll,'#13#10'    sum(data0732.manuf_qty)as manuf_qty'#13#10#9'from da' +
      'ta0732'#13#10#9'join data0731 on data0732.rkey731=data0731.rkey'#13#10'    wh' +
      'ere data0732.qg_flag=0 and data0731.TStatus=1'#13#10#9'group by data073' +
      '1.rkey25,data0731.lam2,data0731.lam_ty_gp,data0732.rkey17,'#13#10'    ' +
      '         data0732.[panel_ln],data0732.[panel_wd],data0731.[TTYPE' +
      '])as t1'#13#10'join data0025 on t1.rkey25=data0025.rkey'#13#10'join data0017' +
      ' on t1.rkey17=data0017.rkey'
    OnFilterRecord = cdsMainFilterRecord
    F_AutoSave = False
    F_SQLSelectFrom = 
      'select '#13#10'data0025.MANU_PART_NUMBER ,data0017.INV_PART_NUMBER,dat' +
      'a0017.INV_NAME,data0017.INV_DESCRIPTION, '#13#10't1.rkey25,lam2,lam_ty' +
      '_gp,t1.rkey17,'#13#10't1.panel_ln,t1.panel_wd,manuf_qty,t1.panel_qty,p' +
      'p_quota_len,null pp_quota_roll'#13#10#9'from('#13#10#9'select data0731.rkey25,' +
      'data0731.lam2,data0731.lam_ty_gp,data0732.rkey17,data0732.[panel' +
      '_ln],data0732.[panel_wd],'#13#10'    sum(data0732.[panel_qty])as [pane' +
      'l_qty],'#13#10'    sum(data0732.pp_quota_len)as pp_quota_len,'#13#10'    sum' +
      '(data0732.manuf_qty)as manuf_qty'#13#10#9'from data0732'#13#10#9'join data0731' +
      ' on data0732.rkey731=data0731.rkey'#13#10'    where data0732.qg_flag=0' +
      ' and data0731.TStatus=1'#13#10#9'group by data0731.rkey25,data0731.lam2' +
      ',data0731.lam_ty_gp,data0732.rkey17,data0732.[panel_ln],data0732' +
      '.[panel_wd])as t1'#13#10'join data0025 on t1.rkey25=data0025.rkey'#13#10'joi' +
      'n data0017 on t1.rkey17=data0017.rkey'
    object cdsMainMANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
      ProviderFlags = []
    end
    object cdsMainINV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
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
    object cdsMainrkey25: TIntegerField
      FieldName = 'rkey25'
      ProviderFlags = []
    end
    object cdsMainlam2: TStringField
      DisplayLabel = #26448#26009#21378#21830
      FieldName = 'lam2'
      ProviderFlags = []
      Size = 30
    end
    object cdsMainlam_ty_gp: TStringField
      DisplayLabel = #26448#26009#22411#21495
      FieldName = 'lam_ty_gp'
      ProviderFlags = []
      Size = 30
    end
    object cdsMainrkey17: TIntegerField
      FieldName = 'rkey17'
    end
    object cdsMainpanel_ln: TBCDField
      DisplayLabel = #38271#24230'('#32428#21521')'
      FieldName = 'panel_ln'
      Precision = 7
      Size = 2
    end
    object cdsMainpanel_wd: TBCDField
      DisplayLabel = #23485#24230'('#32463#21521')'
      FieldName = 'panel_wd'
      Precision = 7
      Size = 2
    end
    object cdsMainmanuf_qty: TIntegerField
      DisplayLabel = #29983#20135#24635#25968#37327'(panel)'
      FieldName = 'manuf_qty'
    end
    object cdsMainpanel_qty: TIntegerField
      DisplayLabel = #20999#21106#24352#25968#9
      FieldName = 'panel_qty'
    end
    object cdsMainpp_quota_len: TBCDField
      DisplayLabel = #37197#39069#20999#21106#38271#24230'('#31859')'
      FieldName = 'pp_quota_len'
      Precision = 10
      Size = 5
    end
    object cdsMainpp_quota_roll: TFloatField
      DisplayLabel = #37197#39069#20999#21106#21367#25968
      FieldName = 'pp_quota_roll'
    end
    object cdsMainTTYPE: TSmallintField
      DisplayLabel = #37197#26009#21333#31867#22411
      FieldName = 'TTYPE'
      OnGetText = cdsMainTTYPEGetText
    end
  end
  inherited dtRead: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'select '#39#39' EMPL_CODE,'#39#39' EMPLOYEE_NAME,'#39#39' create_EMPLOYEE_NAME,'#13#10'd' +
      'ata0025.MANU_PART_NUMBER ,data0017.INV_PART_NUMBER,data0017.INV_' +
      'NAME,data0017.INV_DESCRIPTION, '#13#10'null rkey,null [TYPE],null empl' +
      '_ptr,null create_empl_ptr,null creare_date,t1.rkey25,lam2,lam_ty' +
      '_gp,t1.rkey17,'#13#10't1.panel_ln,t1.panel_wd,manuf_qty,t1.panel_qty,p' +
      'p_quota_len,null pp_quota_roll,null remark,null rkey733,'#13#10'null p' +
      'anel_qty_e,null pp_quota_len_e,null pp_quota_roll_e,null pick_ma' +
      'terial_qty,null pick_material_qty_e'#13#10#9'from('#13#10#9'select data0731.rk' +
      'ey25,data0731.lam2,data0731.lam_ty_gp,data0732.rkey17,data0732.[' +
      'panel_ln],data0732.[panel_wd],'#13#10'    sum(data0732.[panel_qty])as ' +
      '[panel_qty],'#13#10'    sum(data0732.pp_quota_len)as pp_quota_len,'#13#10'  ' +
      '  sum(data0732.manuf_qty)as manuf_qty'#13#10#9'from data0732'#13#10#9'join dat' +
      'a0731 on data0732.rkey731=data0731.rkey'#13#10'    where data0732.qg_f' +
      'lag=0 and data0731.TStatus=1'#13#10#9'group by data0731.rkey25,data0731' +
      '.lam2,data0731.lam_ty_gp,data0732.rkey17,data0732.[panel_ln],dat' +
      'a0732.[panel_wd])as t1'#13#10'join data0025 on t1.rkey25=data0025.rkey' +
      #13#10'join data0017 on t1.rkey17=data0017.rkey'
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
    CommandText = 
      'select Cast(1 as bit) Selected,data0006.WORK_ORDER_NUMBER,data07' +
      '32.* from data0732'#13#10'join data0731 on data0732.rkey731=data0731.r' +
      'key'#13#10'join data0006 on data0732.rkey06=data0006.rkey'
    F_AutoIncrField = 'rkey'
    F_SQLSelectFrom = 
      'select Cast(1 as bit) Selected,data0006.WORK_ORDER_NUMBER,data07' +
      '32.* from data0732'#13#10'join data0731 on data0732.rkey731=data0731.r' +
      'key'#13#10'join data0006 on data0732.rkey06=data0006.rkey'
    object cdsChildSelected: TBooleanField
      DisplayLabel = #36873#25321
      FieldName = 'Selected'
      ProviderFlags = []
      OnChange = cdsChildSelectedChange
    end
    object cdsChildWORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20316#19994#21333#21495
      FieldName = 'WORK_ORDER_NUMBER'
      ProviderFlags = []
      Size = 22
    end
    object cdsChildrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object cdsChildrkey731: TIntegerField
      FieldName = 'rkey731'
      Visible = False
    end
    object cdsChildrkey06: TIntegerField
      FieldName = 'rkey06'
      Visible = False
    end
    object cdsChildrkey17: TIntegerField
      FieldName = 'rkey17'
      Visible = False
    end
    object cdsChildmanuf_qty: TIntegerField
      DisplayLabel = #29983#20135#25968#37327'(panel)'
      FieldName = 'manuf_qty'
    end
    object cdsChildpp_quota: TIntegerField
      DisplayLabel = 'pp'#37197#39069#27604#20363
      FieldName = 'pp_quota'
    end
    object cdsChildpanel_qty: TIntegerField
      DisplayLabel = 'PP'#37197#26009#24352#25968
      FieldName = 'panel_qty'
    end
    object cdsChildpanel_ln: TBCDField
      DisplayLabel = 'panel'#38271#24230'('#32428#21521')'
      FieldName = 'panel_ln'
      Precision = 7
      Size = 2
    end
    object cdsChildpanel_wd: TBCDField
      DisplayLabel = 'panel'#23485#24230'('#32463#21521')'
      FieldName = 'panel_wd'
      Precision = 7
      Size = 2
    end
    object cdsChildPP_TYP: TStringField
      DisplayLabel = 'PP'#22411#21495
      FieldName = 'PP_TYP'
      Size = 30
    end
    object cdsChildpp_rc: TStringField
      DisplayLabel = #26641#33026#21547#37327
      FieldName = 'pp_rc'
      Size = 30
    end
    object cdsChildpp_tg: TStringField
      DisplayLabel = 'tg'#20540
      FieldName = 'pp_tg'
      Size = 30
    end
    object cdsChildpp_quota_len: TBCDField
      DisplayLabel = 'PP'#37197#39069#24635#38271#24230'('#31859')'
      FieldName = 'pp_quota_len'
      Precision = 10
      Size = 5
    end
    object cdsChildpp_quota_roll: TBCDField
      DisplayLabel = 'PP'#37197#39069#24635#21367#25968'('#21367')'
      FieldName = 'pp_quota_roll'
      Precision = 10
      Size = 5
    end
    object cdsChildqg_flag: TBooleanField
      DisplayLabel = #24050#20999#21106
      FieldName = 'qg_flag'
    end
    object cdsChildrkey733: TIntegerField
      FieldName = 'rkey733'
      Visible = False
    end
    object cdsChildremark: TWideStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 100
    end
    object cdsChildmatrece_flag: TBooleanField
      FieldName = 'matrece_flag'
    end
  end
  inherited MainGrid_PopupMenu: TPopupMenu
    Left = 669
    Top = 160
    inherited N_ResetColumns: TMenuItem
      Visible = True
    end
  end
  inherited dtChild: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'select Cast(1 as bit) Selected,data0006.WORK_ORDER_NUMBER,data07' +
      '32.* from data0732'#13#10'join data0731 on data0732.rkey731=data0731.r' +
      'key'#13#10'join data0006 on data0732.rkey06=data0006.rkey'
    object dtChildSelected: TBooleanField
      FieldName = 'Selected'
      ProviderFlags = []
    end
    object dtChildWORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      ProviderFlags = []
      Size = 22
    end
    object dtChildrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object dtChildrkey731: TIntegerField
      FieldName = 'rkey731'
    end
    object dtChildrkey06: TIntegerField
      FieldName = 'rkey06'
    end
    object dtChildrkey17: TIntegerField
      FieldName = 'rkey17'
    end
    object dtChildmanuf_qty: TIntegerField
      FieldName = 'manuf_qty'
    end
    object dtChildpp_quota: TIntegerField
      FieldName = 'pp_quota'
    end
    object dtChildpanel_qty: TIntegerField
      FieldName = 'panel_qty'
    end
    object dtChildpanel_ln: TBCDField
      FieldName = 'panel_ln'
      Precision = 7
      Size = 2
    end
    object dtChildpanel_wd: TBCDField
      FieldName = 'panel_wd'
      Precision = 7
      Size = 2
    end
    object dtChildPP_TYP: TStringField
      FieldName = 'PP_TYP'
      Size = 30
    end
    object dtChildpp_rc: TStringField
      FieldName = 'pp_rc'
      Size = 30
    end
    object dtChildpp_tg: TStringField
      FieldName = 'pp_tg'
      Size = 30
    end
    object dtChildpp_quota_len: TBCDField
      FieldName = 'pp_quota_len'
      Precision = 10
      Size = 5
    end
    object dtChildpp_quota_roll: TBCDField
      FieldName = 'pp_quota_roll'
      Precision = 10
      Size = 5
    end
    object dtChildqg_flag: TBooleanField
      FieldName = 'qg_flag'
    end
    object dtChildrkey733: TIntegerField
      FieldName = 'rkey733'
    end
    object dtChildremark: TWideStringField
      FieldName = 'remark'
      Size = 100
    end
    object dtChildmatrece_flag: TBooleanField
      FieldName = 'matrece_flag'
    end
  end
  object ADOUpdate: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <
      item
        Name = 'TYPE'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'empl_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'create_empl_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey25'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'lam2'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 30
        Value = Null
      end
      item
        Name = 'lam_ty_gp'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 30
        Value = Null
      end
      item
        Name = 'rkey17'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'panel_ln'
        Attributes = [paSigned]
        DataType = ftBCD
        NumericScale = 2
        Precision = 7
        Size = 19
        Value = Null
      end
      item
        Name = 'panel_wd'
        Attributes = [paSigned]
        DataType = ftBCD
        NumericScale = 2
        Precision = 7
        Size = 19
        Value = Null
      end
      item
        Name = 'manuf_qty'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'panel_qty'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'pp_quota_len'
        Attributes = [paSigned]
        DataType = ftBCD
        NumericScale = 5
        Precision = 10
        Size = 19
        Value = Null
      end
      item
        Name = 'pp_quota_roll'
        Attributes = [paSigned]
        DataType = ftBCD
        NumericScale = 5
        Precision = 10
        Size = 19
        Value = Null
      end
      item
        Name = 'remark'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end
      item
        Name = 'rkey733'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'panel_qty_e'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'pp_quota_len_e'
        Attributes = [paSigned]
        DataType = ftBCD
        NumericScale = 5
        Precision = 10
        Size = 19
        Value = Null
      end
      item
        Name = 'pp_quota_roll_e'
        Attributes = [paSigned]
        DataType = ftBCD
        NumericScale = 5
        Precision = 10
        Size = 19
        Value = Null
      end
      item
        Name = 'pick_material_qty'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'insert into data0733([TYPE],empl_ptr,create_empl_ptr,creare_date' +
        ',rkey25,lam2,'
      
        'lam_ty_gp,rkey17,panel_ln,panel_wd,manuf_qty,panel_qty,pp_quota_' +
        'len,pp_quota_roll,'
      
        'remark,rkey733,panel_qty_e,pp_quota_len_e,pp_quota_roll_e,pick_m' +
        'aterial_qty)'
      'values(:TYPE,:empl_ptr,:create_empl_ptr,getDate(),:rkey25,:lam2,'
      
        ':lam_ty_gp,:rkey17,:panel_ln,:panel_wd,:manuf_qty,:panel_qty,:pp' +
        '_quota_len,:pp_quota_roll,'
      
        ':remark,:rkey733,:panel_qty_e,:pp_quota_len_e,:pp_quota_roll_e,:' +
        'pick_material_qty)'
      'select @@identity')
    Left = 469
    Top = 239
  end
  object cdsD005: TClientDataSet
    Aggregates = <>
    CommandText = 'select RKEY,EMPL_CODE,EMPLOYEE_NAME from data0005'
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 632
    Top = 224
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
  object cds0017: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Declare @TType int '#13#10'select @TType=CLOSE_HOURTH from data0192 '#13#10 +
      #13#10'select RKEY'#9',INV_PART_NUMBER'#9#21407#26448#26009#20195#30721',INV_NAME'#9#26448#26009#21517#31281',INV_DESCRIPTI' +
      'ON'#9#26448#26009#35215#26684#13#10'from data0017 '#13#10'where GROUP_PTR= @TType'
    Params = <>
    ProviderName = 'dspRead'
    Left = 472
    Top = 161
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
      FieldName = #26448#26009#21517#31281
      Size = 30
    end
    object cds0017CDSDesigner3: TStringField
      FieldName = #26448#26009#35215#26684
      Size = 70
    end
  end
  object cds025: TClientDataSet
    Aggregates = <>
    CommandText = 'select RKEY,MANU_PART_NUMBER,MANU_PART_DESC'#13#10'from data0025'
    Params = <>
    ProviderName = 'dspRead'
    Left = 533
    Top = 159
    object cds025RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object cds025MANU_PART_NUMBER: TStringField
      DisplayLabel = #20135#21697#22411#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object cds025MANU_PART_DESC: TStringField
      DisplayLabel = #20135#21697#25551#36848
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
  end
  object ADOUpdate1: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <>
    Left = 469
    Top = 304
  end
  object TempCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 245
    Top = 199
  end
end
