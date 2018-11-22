inherited PpCutting_frm: TPpCutting_frm
  Left = 240
  Top = 176
  Caption = 'PpCutting_frm'
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 12
  inherited cxTabControl1: TcxTabControl
    inherited Splitter1: TSplitter
      Top = 360
    end
    inherited Panel2: TPanel
      Height = 355
      inherited Panel4: TPanel
        Height = 355
        inherited RzToolbar2: TRzToolbar
          Height = 355
          ToolbarControls = (
            btn1
            btn_InCut
            btn_Consumption
            btn_RecordSee
            Button1)
          object btn_InCut: TBitBtn
            Left = 4
            Top = 32
            Width = 111
            Height = 25
            Hint = #24403#32418#33394#23383#20307#26102#65292#26377#24453#20999#21106#30340#35760#24405
            Caption = #36827#20837#20999#21106
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = btn_InCutClick
          end
          object btn_Consumption: TButton
            Left = 4
            Top = 60
            Width = 111
            Height = 25
            Caption = #25439#32791#20999#21106
            TabOrder = 2
            OnClick = btn_ConsumptionClick
          end
          object btn_RecordSee: TButton
            Left = 4
            Top = 88
            Width = 111
            Height = 25
            Caption = #25439#32791#20999#21106#35760#24405
            TabOrder = 3
            OnClick = btn_RecordSeeClick
          end
          object Button1: TButton
            Left = 4
            Top = 116
            Width = 111
            Height = 25
            Caption = #26448#26009#28040#32791#35760#24405
            TabOrder = 4
            OnClick = Button1Click
          end
        end
      end
      inherited cxPageControl1: TcxPageControl
        Height = 355
        ClientRectBottom = 355
        inherited cxTabSheetMain1: TcxTabSheet
          inherited ToolBar2: TToolBar
            Height = 332
          end
          inherited DghMain: TDBGridEh
            Height = 332
            FooterRowCount = 1
            FrozenCols = 6
            ReadOnly = True
            Columns = <
              item
                EditButtons = <>
                FieldName = 'rkey'
                Footers = <>
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'rkey733'
                Footers = <>
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'TYPE'
                Footers = <>
                Width = 53
              end
              item
                EditButtons = <>
                FieldName = 'creare_date'
                Footers = <>
                Width = 101
              end
              item
                EditButtons = <>
                FieldName = 'create_EMPL_CODE'
                Footers = <>
                Visible = False
                Width = 48
              end
              item
                EditButtons = <>
                FieldName = 'create_EMPLOYEE_NAME'
                Footers = <>
                Width = 48
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
                FieldName = 'EMPL_CODE'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'EMPLOYEE_NAME'
                Footers = <>
                Width = 52
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
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'panel_qty_e'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'pick_material_qty'
                Footers = <>
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'pick_material_qty_e'
                Footers = <>
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'SurplusSheet'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'pp_quota_len_e'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'pp_quota_len'
                Footers = <>
                Width = 99
              end
              item
                EditButtons = <>
                FieldName = 'pp_quota_roll'
                Footers = <>
                Width = 98
              end
              item
                EditButtons = <>
                FieldName = 'pp_quota_roll_e'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'd5_2_EMPLOYEE_NAME'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'CODE'
                Footers = <>
                Width = 51
              end
              item
                EditButtons = <>
                FieldName = 'REJECT_DESCRIPTION'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'remark'
                Footers = <>
                Width = 166
              end>
          end
        end
        inherited cxTabSheetMain2: TcxTabSheet
          object Label6: TLabel
            Left = 152
            Top = 8
            Width = 48
            Height = 12
            Caption = #20135#21697#22411#21495
          end
          object Label7: TLabel
            Left = 152
            Top = 48
            Width = 48
            Height = 12
            Caption = #26448#26009#32534#21495
          end
          object Label8: TLabel
            Left = 152
            Top = 88
            Width = 48
            Height = 12
            Caption = #26448#26009#21517#31216
          end
          object Label9: TLabel
            Left = 152
            Top = 128
            Width = 48
            Height = 12
            Caption = #26448#26009#35268#26684
          end
          object Label10: TLabel
            Left = 8
            Top = 168
            Width = 60
            Height = 12
            Caption = #20999#21106#20154#20195#30721
          end
          object Label11: TLabel
            Left = 8
            Top = 208
            Width = 48
            Height = 12
            Caption = #20999#21106#20154#21592
          end
          object Label12: TLabel
            Left = 152
            Top = 168
            Width = 48
            Height = 12
            Caption = #26448#26009#21378#21830
          end
          object Label13: TLabel
            Left = 152
            Top = 208
            Width = 48
            Height = 12
            Caption = #26448#26009#22411#21495
          end
          object Label14: TLabel
            Left = 339
            Top = 5
            Width = 60
            Height = 12
            Caption = #38271#24230'('#32428#21521')'
          end
          object Label15: TLabel
            Left = 339
            Top = 45
            Width = 60
            Height = 12
            Caption = #23485#24230'('#32463#21521')'
          end
          object Label16: TLabel
            Left = 483
            Top = 5
            Width = 102
            Height = 12
            Caption = #29983#20135#24635#25968#37327'(panel)'
          end
          object Label17: TLabel
            Left = 483
            Top = 45
            Width = 96
            Height = 12
            Caption = #20999#21106#24352#25968#9
          end
          object Label18: TLabel
            Left = 339
            Top = 88
            Width = 96
            Height = 12
            Caption = #37197#39069#20999#21106#38271#24230'('#31859')'
          end
          object Label19: TLabel
            Left = 339
            Top = 128
            Width = 72
            Height = 12
            Caption = #37197#39069#20999#21106#21367#25968
          end
          object Label20: TLabel
            Left = 625
            Top = 126
            Width = 24
            Height = 12
            Caption = #22791#27880
          end
          object Label21: TLabel
            Left = 481
            Top = 88
            Width = 84
            Height = 12
            Caption = #25439#32791#20999#21106#24635#24352#25968
          end
          object Label22: TLabel
            Left = 337
            Top = 168
            Width = 84
            Height = 12
            Caption = #25439#32791#20999#21106#24635#38271#24230
          end
          object Label23: TLabel
            Left = 337
            Top = 208
            Width = 84
            Height = 12
            Caption = #25439#32791#20999#21106#24635#21367#25968
          end
          object Label24: TLabel
            Left = 481
            Top = 128
            Width = 96
            Height = 12
            Caption = #24050#27491#24120#39046#29992'PP'#24352#25968
          end
          object Label25: TLabel
            Left = 481
            Top = 168
            Width = 96
            Height = 12
            Caption = #24050#25439#32791#39046#29992'PP'#24352#25968
          end
          object Label2: TLabel
            Left = 8
            Top = 8
            Width = 48
            Height = 12
            Caption = #20999#21106#32534#21495
          end
          object Label3: TLabel
            Left = 8
            Top = 48
            Width = 24
            Height = 12
            Caption = #31867#22411
          end
          object Label4: TLabel
            Left = 8
            Top = 88
            Width = 48
            Height = 12
            Caption = #21019#24314#26085#26399
          end
          object Label5: TLabel
            Left = 8
            Top = 128
            Width = 36
            Height = 12
            Caption = #21019#24314#20154
          end
          object Label26: TLabel
            Left = 480
            Top = 208
            Width = 48
            Height = 12
            Caption = #21097#20313#24352#25968
          end
          object Label27: TLabel
            Left = 626
            Top = 5
            Width = 60
            Height = 12
            Caption = #25439#22351#36131#20219#20154
          end
          object Label28: TLabel
            Left = 626
            Top = 45
            Width = 48
            Height = 12
            Caption = #25439#22351#20195#30721
          end
          object Label29: TLabel
            Left = 626
            Top = 85
            Width = 48
            Height = 12
            Caption = #25439#22351#21407#22240
          end
          object DBEdit1: TDBEdit
            Left = 9
            Top = 24
            Width = 121
            Height = 20
            DataField = 'rkey'
            DataSource = dsMain
            TabOrder = 0
          end
          object DBEdit2: TDBEdit
            Left = 9
            Top = 64
            Width = 121
            Height = 20
            DataField = 'TYPE'
            DataSource = dsMain
            TabOrder = 1
          end
          object DBEdit3: TDBEdit
            Left = 9
            Top = 104
            Width = 121
            Height = 20
            DataField = 'creare_date'
            DataSource = dsMain
            TabOrder = 2
          end
          object DBEdit4: TDBEdit
            Left = 9
            Top = 144
            Width = 121
            Height = 20
            DataField = 'create_EMPLOYEE_NAME'
            DataSource = dsMain
            TabOrder = 3
          end
          object DBEdit5: TDBEdit
            Left = 9
            Top = 184
            Width = 121
            Height = 20
            DataField = 'EMPL_CODE'
            DataSource = dsMain
            TabOrder = 4
          end
          object DBEdit6: TDBEdit
            Left = 9
            Top = 224
            Width = 121
            Height = 20
            DataField = 'EMPLOYEE_NAME'
            DataSource = dsMain
            TabOrder = 5
          end
          object DBEdit7: TDBEdit
            Left = 152
            Top = 24
            Width = 165
            Height = 20
            DataField = 'MANU_PART_NUMBER'
            DataSource = dsMain
            TabOrder = 6
          end
          object DBEdit8: TDBEdit
            Left = 152
            Top = 64
            Width = 165
            Height = 20
            DataField = 'INV_PART_NUMBER'
            DataSource = dsMain
            TabOrder = 7
          end
          object DBEdit9: TDBEdit
            Left = 152
            Top = 104
            Width = 165
            Height = 20
            DataField = 'INV_NAME'
            DataSource = dsMain
            TabOrder = 8
          end
          object DBEdit10: TDBEdit
            Left = 152
            Top = 144
            Width = 165
            Height = 20
            DataField = 'INV_DESCRIPTION'
            DataSource = dsMain
            TabOrder = 9
          end
          object DBEdit11: TDBEdit
            Left = 152
            Top = 184
            Width = 165
            Height = 20
            DataField = 'lam2'
            DataSource = dsMain
            TabOrder = 10
          end
          object DBEdit12: TDBEdit
            Left = 152
            Top = 224
            Width = 165
            Height = 20
            DataField = 'lam_ty_gp'
            DataSource = dsMain
            TabOrder = 11
          end
          object DBEdit13: TDBEdit
            Left = 339
            Top = 21
            Width = 121
            Height = 20
            DataField = 'panel_ln'
            DataSource = dsMain
            TabOrder = 12
          end
          object DBEdit14: TDBEdit
            Left = 339
            Top = 61
            Width = 121
            Height = 20
            DataField = 'panel_wd'
            DataSource = dsMain
            TabOrder = 13
          end
          object DBEdit15: TDBEdit
            Left = 483
            Top = 21
            Width = 121
            Height = 20
            DataField = 'manuf_qty'
            DataSource = dsMain
            TabOrder = 14
          end
          object DBEdit17: TDBEdit
            Left = 339
            Top = 104
            Width = 121
            Height = 20
            DataField = 'pp_quota_len'
            DataSource = dsMain
            TabOrder = 15
          end
          object DBEdit18: TDBEdit
            Left = 339
            Top = 144
            Width = 121
            Height = 20
            DataField = 'pp_quota_roll'
            DataSource = dsMain
            TabOrder = 16
          end
          object DBEdit19: TDBEdit
            Left = 482
            Top = 103
            Width = 121
            Height = 20
            DataField = 'panel_qty_e'
            DataSource = dsMain
            TabOrder = 17
          end
          object DBEdit20: TDBEdit
            Left = 338
            Top = 183
            Width = 121
            Height = 20
            DataField = 'pp_quota_len_e'
            DataSource = dsMain
            TabOrder = 18
          end
          object DBEdit21: TDBEdit
            Left = 338
            Top = 223
            Width = 121
            Height = 20
            DataField = 'pp_quota_roll_e'
            DataSource = dsMain
            TabOrder = 19
          end
          object DBEdit22: TDBEdit
            Left = 482
            Top = 143
            Width = 121
            Height = 20
            DataField = 'pick_material_qty'
            DataSource = dsMain
            TabOrder = 20
          end
          object DBEdit23: TDBEdit
            Left = 482
            Top = 183
            Width = 121
            Height = 20
            DataField = 'pick_material_qty_e'
            DataSource = dsMain
            TabOrder = 21
          end
          object DBMemo1: TDBMemo
            Left = 626
            Top = 142
            Width = 185
            Height = 65
            DataField = 'remark'
            DataSource = dsMain
            TabOrder = 22
          end
          object DBEdit16: TDBEdit
            Left = 483
            Top = 62
            Width = 121
            Height = 20
            DataField = 'panel_qty'
            DataSource = dsMain
            TabOrder = 23
          end
          object DBEdit24: TDBEdit
            Left = 481
            Top = 223
            Width = 121
            Height = 20
            DataField = 'SurplusSheet'
            DataSource = dsMain
            TabOrder = 24
          end
          object DBEdit25: TDBEdit
            Left = 625
            Top = 21
            Width = 121
            Height = 20
            DataField = 'd5_2_EMPLOYEE_NAME'
            DataSource = dsMain
            TabOrder = 25
          end
          object DBEdit26: TDBEdit
            Left = 625
            Top = 61
            Width = 121
            Height = 20
            DataField = 'CODE'
            DataSource = dsMain
            TabOrder = 26
          end
          object DBEdit27: TDBEdit
            Left = 625
            Top = 101
            Width = 185
            Height = 20
            DataField = 'REJECT_DESCRIPTION'
            DataSource = dsMain
            TabOrder = 27
          end
        end
      end
      inherited Panel6: TPanel
        Height = 355
      end
    end
    inherited Panel3: TPanel
      Top = 367
      Height = 142
      inherited Panel5: TPanel
        Top = 137
      end
      inherited Panel7: TPanel
        Height = 137
        inherited Panel8: TPanel
          Height = 137
          inherited RzToolbar3: TRzToolbar
            Height = 137
            ToolbarControls = (
              btn2)
          end
        end
        inherited Panel9: TPanel
          Height = 137
          inherited Panel10: TPanel
            Top = 102
            Height = 35
            object Label1: TLabel
              Left = 264
              Top = 13
              Width = 48
              Height = 12
              Caption = #26448#26009#32534#21495
            end
            object edt_Filter: TEdit
              Left = 326
              Top = 9
              Width = 126
              Height = 20
              TabOrder = 0
              OnChange = edt_FilterChange
            end
            object RadioGroup2: TRadioGroup
              Left = 0
              Top = 0
              Width = 241
              Height = 35
              Align = alLeft
              Caption = #31867#22411#36807#28388
              Columns = 3
              ItemIndex = 2
              Items.Strings = (
                #27491#24120#20999#21106
                #25439#32791#20999#21106
                #20840#37096)
              TabOrder = 1
              OnClick = RadioGroup2Click
            end
          end
          inherited Panel11: TPanel
            Height = 102
          end
          inherited cxPageControl2: TcxPageControl
            Height = 102
            ClientRectBottom = 102
            inherited cxTabSheetChild1: TcxTabSheet
              inherited ToolBar1: TToolBar
                Height = 79
              end
              inherited dghChild: TDBGridEh
                Height = 79
                ReadOnly = True
                Columns = <
                  item
                    EditButtons = <>
                    FieldName = 'WORK_ORDER_NUMBER'
                    Footers = <>
                  end
                  item
                    EditButtons = <>
                    FieldName = 'manuf_qty'
                    Footers = <>
                    Width = 100
                  end
                  item
                    EditButtons = <>
                    FieldName = 'pp_quota'
                    Footers = <>
                    Width = 65
                  end
                  item
                    EditButtons = <>
                    FieldName = 'panel_qty'
                    Footers = <>
                    Width = 66
                  end
                  item
                    EditButtons = <>
                    FieldName = 'panel_ln'
                    Footers = <>
                    Width = 97
                  end
                  item
                    EditButtons = <>
                    FieldName = 'panel_wd'
                    Footers = <>
                    Width = 95
                  end
                  item
                    EditButtons = <>
                    FieldName = 'PP_TYP'
                    Footers = <>
                    Width = 151
                  end
                  item
                    EditButtons = <>
                    FieldName = 'pp_rc'
                    Footers = <>
                    Width = 94
                  end
                  item
                    EditButtons = <>
                    FieldName = 'pp_tg'
                    Footers = <>
                    Width = 97
                  end
                  item
                    EditButtons = <>
                    FieldName = 'pp_quota_len'
                    Footers = <>
                    Width = 82
                  end
                  item
                    EditButtons = <>
                    FieldName = 'pp_quota_roll'
                    Footers = <>
                    Width = 80
                  end
                  item
                    EditButtons = <>
                    FieldName = 'matrece_flag'
                    Footers = <>
                    Width = 53
                  end
                  item
                    EditButtons = <>
                    FieldName = 'remark'
                    Footers = <>
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
      'select data0005.EMPL_CODE,data0005.EMPLOYEE_NAME,d5.EMPL_CODE cr' +
      'eate_EMPL_CODE,d5.EMPLOYEE_NAME create_EMPLOYEE_NAME,'#13#10'data0025.' +
      'MANU_PART_NUMBER,data0017.INV_PART_NUMBER,data0017.INV_NAME,data' +
      '0017.INV_DESCRIPTION,'#13#10'd5_2.EMPL_CODE d5_2_EMPL_CODE,d5_2.EMPLOY' +
      'EE_NAME d5_2_EMPLOYEE_NAME,data0076.CODE,data0076.REJECT_DESCRIP' +
      'TION,'#13#10'data0733.* from data0733 '#13#10'join data0005 on data0733.[emp' +
      'l_ptr]=data0005.rkey'#13#10'join data0005 as d5 on data0733.[create_em' +
      'pl_ptr]=d5.rkey'#13#10'join data0025 on data0733.[rkey25]=data0025.rke' +
      'y'#13#10'join data0017 on data0733.[rkey17]=data0017.rkey'#13#10'left join d' +
      'ata0076 on data0733.rkey76=data0076.rkey'#13#10'left join data0005 as ' +
      'd5_2 on data0733.rkey05=d5_2.rkey'#13#10'where [creare_date]>=getDate(' +
      ')-7'#13#10
    EnableBCD = False
    object dtMainEMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object dtMainEMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 16
    end
    object dtMaincreate_EMPL_CODE: TStringField
      FieldName = 'create_EMPL_CODE'
      ProviderFlags = []
      Size = 10
    end
    object dtMaincreate_EMPLOYEE_NAME: TStringField
      FieldName = 'create_EMPLOYEE_NAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 16
    end
    object dtMainMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
      ProviderFlags = []
      ReadOnly = True
    end
    object dtMainINV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      ProviderFlags = []
      ReadOnly = True
      Size = 25
    end
    object dtMainINV_NAME: TStringField
      FieldName = 'INV_NAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object dtMainINV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      ProviderFlags = []
      ReadOnly = True
      Size = 70
    end
    object dtMainrkey: TIntegerField
      FieldName = 'rkey'
      ProviderFlags = []
      ReadOnly = True
    end
    object dtMainTYPE: TWordField
      FieldName = 'TYPE'
      ProviderFlags = []
      ReadOnly = True
    end
    object dtMainempl_ptr: TIntegerField
      FieldName = 'empl_ptr'
      ProviderFlags = []
      ReadOnly = True
    end
    object dtMaincreate_empl_ptr: TIntegerField
      FieldName = 'create_empl_ptr'
      ProviderFlags = []
      ReadOnly = True
    end
    object dtMaincreare_date: TDateTimeField
      FieldName = 'creare_date'
      ProviderFlags = []
      ReadOnly = True
    end
    object dtMainrkey25: TIntegerField
      FieldName = 'rkey25'
      ProviderFlags = []
      ReadOnly = True
    end
    object dtMainlam2: TStringField
      FieldName = 'lam2'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object dtMainlam_ty_gp: TStringField
      FieldName = 'lam_ty_gp'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object dtMainrkey17: TIntegerField
      FieldName = 'rkey17'
      ReadOnly = True
    end
    object dtMainpanel_ln: TBCDField
      FieldName = 'panel_ln'
      ReadOnly = True
      Precision = 7
      Size = 2
    end
    object dtMainpanel_wd: TBCDField
      FieldName = 'panel_wd'
      ReadOnly = True
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
    object dtMainremark: TWideStringField
      FieldName = 'remark'
      ProviderFlags = [pfInUpdate]
      ReadOnly = True
      Size = 100
    end
    object dtMainrkey733: TIntegerField
      FieldName = 'rkey733'
      ReadOnly = True
    end
    object dtMainpanel_qty_e: TIntegerField
      FieldName = 'panel_qty_e'
      ReadOnly = True
    end
    object dtMainpick_material_qty: TIntegerField
      FieldName = 'pick_material_qty'
      ReadOnly = True
    end
    object dtMainpick_material_qty_e: TIntegerField
      FieldName = 'pick_material_qty_e'
      ReadOnly = True
    end
    object dtMainpp_quota_len: TFloatField
      FieldName = 'pp_quota_len'
      ReadOnly = True
    end
    object dtMainpp_quota_roll: TFloatField
      FieldName = 'pp_quota_roll'
      ReadOnly = True
    end
    object dtMainpp_quota_len_e: TFloatField
      FieldName = 'pp_quota_len_e'
    end
    object dtMainpp_quota_roll_e: TFloatField
      FieldName = 'pp_quota_roll_e'
    end
    object dtMaind5_2_EMPL_CODE: TStringField
      FieldName = 'd5_2_EMPL_CODE'
      Size = 10
    end
    object dtMaind5_2_EMPLOYEE_NAME: TStringField
      FieldName = 'd5_2_EMPLOYEE_NAME'
      Size = 16
    end
    object dtMainCODE: TStringField
      FieldName = 'CODE'
      Size = 5
    end
    object dtMainREJECT_DESCRIPTION: TStringField
      FieldName = 'REJECT_DESCRIPTION'
      Size = 30
    end
    object dtMainrkey76: TIntegerField
      FieldName = 'rkey76'
    end
    object dtMainrkey05: TIntegerField
      FieldName = 'rkey05'
    end
  end
  inherited cdsMain: Tcds
    CommandText = 
      'select data0005.EMPL_CODE,data0005.EMPLOYEE_NAME,d5.EMPL_CODE cr' +
      'eate_EMPL_CODE,d5.EMPLOYEE_NAME create_EMPLOYEE_NAME,'#13#10'data0025.' +
      'MANU_PART_NUMBER,data0017.INV_PART_NUMBER,data0017.INV_NAME,data' +
      '0017.INV_DESCRIPTION,'#13#10'd5_2.EMPL_CODE d5_2_EMPL_CODE,d5_2.EMPLOY' +
      'EE_NAME d5_2_EMPLOYEE_NAME,data0076.CODE,data0076.REJECT_DESCRIP' +
      'TION,'#13#10'data0733.* from data0733 '#13#10'join data0005 on data0733.[emp' +
      'l_ptr]=data0005.rkey'#13#10'join data0005 as d5 on data0733.[create_em' +
      'pl_ptr]=d5.rkey'#13#10'join data0025 on data0733.[rkey25]=data0025.rke' +
      'y'#13#10'join data0017 on data0733.[rkey17]=data0017.rkey'#13#10'left join d' +
      'ata0076 on data0733.rkey76=data0076.rkey'#13#10'left join data0005 as ' +
      'd5_2 on data0733.rkey05=d5_2.rkey'#13#10'where [creare_date]>=getDate(' +
      ')-7'#13#10
    OnCalcFields = cdsMainCalcFields
    OnFilterRecord = cdsMainFilterRecord
    F_AutoSave = False
    F_SQLSelectFrom = 
      'select data0005.EMPL_CODE,data0005.EMPLOYEE_NAME,d5.EMPL_CODE cr' +
      'eate_EMPL_CODE,d5.EMPLOYEE_NAME create_EMPLOYEE_NAME,'#13#10'data0025.' +
      'MANU_PART_NUMBER,data0017.INV_PART_NUMBER,data0017.INV_NAME,data' +
      '0017.INV_DESCRIPTION,'#13#10'd5_2.EMPL_CODE d5_2_EMPL_CODE,d5_2.EMPLOY' +
      'EE_NAME d5_2_EMPLOYEE_NAME,data0076.CODE,data0076.REJECT_DESCRIP' +
      'TION,'#13#10'data0733.* from data0733 '#13#10'join data0005 on data0733.[emp' +
      'l_ptr]=data0005.rkey'#13#10'join data0005 as d5 on data0733.[create_em' +
      'pl_ptr]=d5.rkey'#13#10'join data0025 on data0733.[rkey25]=data0025.rke' +
      'y'#13#10'join data0017 on data0733.[rkey17]=data0017.rkey'#13#10'left join d' +
      'ata0076 on data0733.rkey76=data0076.rkey'#13#10'left join data0005 as ' +
      'd5_2 on data0733.rkey05=d5_2.rkey'#13#10#13#10
    object cdsMainEMPL_CODE: TStringField
      DisplayLabel = #20999#21106#20154#20195#30721
      FieldName = 'EMPL_CODE'
      ProviderFlags = []
      OnChange = cdsMainEMPL_CODEChange
      Size = 10
    end
    object cdsMainEMPLOYEE_NAME: TStringField
      DisplayLabel = #20999#21106#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      ProviderFlags = []
      Size = 16
    end
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
    object cdsMainrkey: TAutoIncField
      DisplayLabel = #20999#21106#32534#21495
      FieldName = 'rkey'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsMainTYPE: TSmallintField
      DisplayLabel = #31867#22411
      FieldName = 'TYPE'
      ProviderFlags = []
      OnGetText = cdsMainTYPEGetText
    end
    object cdsMainempl_ptr: TIntegerField
      FieldName = 'empl_ptr'
      ProviderFlags = []
    end
    object cdsMaincreate_empl_ptr: TIntegerField
      FieldName = 'create_empl_ptr'
      ProviderFlags = []
    end
    object cdsMaincreare_date: TDateTimeField
      DisplayLabel = #21019#24314#26085#26399
      FieldName = 'creare_date'
      ProviderFlags = []
    end
    object cdsMaincreate_EMPL_CODE: TStringField
      DisplayLabel = #21019#24314#20154#20195#30721
      FieldName = 'create_EMPL_CODE'
      ProviderFlags = []
      Visible = False
      Size = 10
    end
    object cdsMaincreate_EMPLOYEE_NAME: TStringField
      DisplayLabel = #21019#24314#20154
      FieldName = 'create_EMPLOYEE_NAME'
      ProviderFlags = []
      Size = 16
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
    object cdsMainpp_quota_len: TFloatField
      DisplayLabel = #37197#39069#20999#21106#38271#24230'('#31859')'
      FieldName = 'pp_quota_len'
      ReadOnly = True
    end
    object cdsMainpp_quota_roll: TFloatField
      DisplayLabel = #37197#39069#20999#21106#21367#25968
      FieldName = 'pp_quota_roll'
      ReadOnly = True
    end
    object cdsMainremark: TWideStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsMainrkey733: TIntegerField
      DisplayLabel = #20851#32852#32534#21495
      FieldName = 'rkey733'
      ReadOnly = True
    end
    object cdsMainpanel_qty_e: TIntegerField
      DisplayLabel = #25439#32791#20999#21106#24635#24352#25968
      FieldName = 'panel_qty_e'
      ReadOnly = True
    end
    object cdsMainpp_quota_len_e: TFloatField
      DisplayLabel = #25439#32791#20999#21106#24635#38271#24230
      FieldName = 'pp_quota_len_e'
    end
    object cdsMainpp_quota_roll_e: TFloatField
      DisplayLabel = #25439#32791#20999#21106#24635#21367#25968
      FieldName = 'pp_quota_roll_e'
    end
    object cdsMainpick_material_qty: TIntegerField
      DisplayLabel = #24050#27491#24120#39046#29992'PP'#24352#25968
      FieldName = 'pick_material_qty'
      ReadOnly = True
    end
    object cdsMainpick_material_qty_e: TIntegerField
      DisplayLabel = #24050#25439#32791#39046#29992'PP'#24352#25968
      FieldName = 'pick_material_qty_e'
      ReadOnly = True
    end
    object cdsMainSurplusSheet: TIntegerField
      DisplayLabel = #21097#20313#24352#25968
      FieldKind = fkCalculated
      FieldName = 'SurplusSheet'
      Calculated = True
    end
    object cdsMaind5_2_EMPL_CODE: TStringField
      DisplayLabel = #25439#22351#36131#20219#20154#20195#30721
      FieldName = 'd5_2_EMPL_CODE'
      Size = 10
    end
    object cdsMaind5_2_EMPLOYEE_NAME: TStringField
      DisplayLabel = #25439#22351#36131#20219#20154
      FieldName = 'd5_2_EMPLOYEE_NAME'
      Size = 16
    end
    object cdsMainCODE: TStringField
      DisplayLabel = #25439#22351#20195#30721
      FieldName = 'CODE'
      Size = 5
    end
    object cdsMainREJECT_DESCRIPTION: TStringField
      DisplayLabel = #25439#22351#21407#22240
      FieldName = 'REJECT_DESCRIPTION'
      Size = 30
    end
    object cdsMainrkey76: TIntegerField
      FieldName = 'rkey76'
    end
    object cdsMainrkey05: TIntegerField
      FieldName = 'rkey05'
    end
  end
  inherited dtRead: TADODataSet
    CursorType = ctStatic
    CommandText = 'select * from data0076'
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
      'select data0006.WORK_ORDER_NUMBER,data0732.* from data0732'#13#10'join' +
      ' data0731 on data0732.rkey731=data0731.rkey'#13#10'join data0006 on da' +
      'ta0732.rkey06=data0006.rkey'
    ReadOnly = True
    F_AutoIncrField = 'rkey'
    F_SQLSelectFrom = 
      'select data0006.WORK_ORDER_NUMBER,data0732.* from data0732'#13#10'join' +
      ' data0731 on data0732.rkey731=data0731.rkey'#13#10'join data0006 on da' +
      'ta0732.rkey06=data0006.rkey'
    F_Primarykey = 'rkey'
    F_Foreignkey = 'rkey733'
    object cdsChildWORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20316#19994#21333#21495
      FieldName = 'WORK_ORDER_NUMBER'
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
      DisplayLabel = #26159#21542#39046#26009
      FieldName = 'matrece_flag'
    end
  end
  inherited MainGrid_PopupMenu: TPopupMenu
    Left = 405
    Top = 200
    inherited N_ResetColumns: TMenuItem
      Visible = True
    end
  end
  inherited dtChild: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'select data0006.WORK_ORDER_NUMBER,data0732.* from data0732'#13#10'join' +
      ' data0731 on data0732.rkey731=data0731.rkey'#13#10'join data0006 on da' +
      'ta0732.rkey06=data0006.rkey'
    object dtChildWORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
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
  inherited dlgOpen1: TOpenDialog
    Left = 988
    Top = 276
  end
  object cdsD005: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select RKEY,EMPL_CODE,EMPLOYEE_NAME from data0005'#13#10'where ACTIVE_' +
      'FLAG='#39'Y'#39
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 536
    Top = 256
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
      'ON'#9#26448#26009#35215#26684#13#10'from data0017 '#13#10'where GROUP_PTR= @TType'#13#10'order by INV_P' +
      'ART_NUMBER'
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 536
    Top = 169
    object cds0017RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object cds0017CDSDesigner: TStringField
      DisplayWidth = 25
      FieldName = #21407#26448#26009#20195#30721
      Size = 25
    end
    object cds0017CDSDesigner2: TStringField
      FieldName = #26448#26009#21517#31281
      Size = 30
    end
    object cds0017CDSDesigner3: TStringField
      DisplayWidth = 40
      FieldName = #26448#26009#35215#26684
      Size = 70
    end
  end
  object cds025: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select RKEY,MANU_PART_NUMBER,MANU_PART_DESC'#13#10'from data0025'#13#10'orde' +
      'r by MANU_PART_NUMBER'
    Params = <>
    ProviderName = 'dsp025'
    ReadOnly = True
    Left = 608
    Top = 332
    object cds025RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object cds025MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      DisplayWidth = 50
      FieldName = 'MANU_PART_NUMBER'
    end
    object cds025MANU_PART_DESC: TStringField
      DisplayLabel = #20135#21697#25551#36848
      DisplayWidth = 45
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
  end
  object ADOUpdate1: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <
      item
        Name = 'panel_qty'
        Size = -1
        Value = Null
      end
      item
        Name = 'pp_quota_len'
        Size = -1
        Value = Null
      end
      item
        Name = 'pp_quota_roll'
        Size = -1
        Value = Null
      end
      item
        Name = 'rkey733'
        Size = -1
        Value = Null
      end
      item
        Name = 'TYPE'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
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
        Attributes = [paSigned]
        DataType = ftString
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'lam_ty_gp'
        Attributes = [paSigned]
        DataType = ftString
        Precision = 10
        Size = 4
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
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'panel_wd'
        Attributes = [paSigned]
        DataType = ftBCD
        Precision = 10
        Size = 4
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
        Name = 'panel_qty1'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'pp_quota_len1'
        Attributes = [paSigned]
        DataType = ftBCD
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'pp_quota_roll1'
        Attributes = [paSigned]
        DataType = ftBCD
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'remark'
        Attributes = [paSigned]
        DataType = ftString
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey733_1'
        Attributes = [paSigned]
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
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'pp_quota_roll_e'
        Attributes = [paSigned]
        DataType = ftBCD
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'pick_material_qty'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey76'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey05'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'update data0733'
      'set panel_qty_e=panel_qty_e+ :panel_qty,'
      'pp_quota_len_e=pp_quota_len_e+ :pp_quota_len,'
      'pp_quota_roll_e=pp_quota_roll_e+ :pp_quota_roll'
      'where rkey=:rkey733'
      ''
      
        'insert into data0733([TYPE],empl_ptr,create_empl_ptr,creare_date' +
        ',rkey25,lam2,'
      
        'lam_ty_gp,rkey17,panel_ln,panel_wd,manuf_qty,panel_qty,pp_quota_' +
        'len,pp_quota_roll,'
      
        'remark,rkey733,panel_qty_e,pp_quota_len_e,pp_quota_roll_e,pick_m' +
        'aterial_qty,rkey76,rkey05)'
      'values(:TYPE,:empl_ptr,:create_empl_ptr,getDate(),:rkey25,:lam2,'
      
        ':lam_ty_gp,:rkey17,:panel_ln,:panel_wd,:manuf_qty,:panel_qty1,:p' +
        'p_quota_len1,:pp_quota_roll1,'
      
        ':remark,:rkey733_1,:panel_qty_e,:pp_quota_len_e,:pp_quota_roll_e' +
        ',:pick_material_qty,:rkey76,:rkey05)'
      'select @@identity')
    Left = 405
    Top = 255
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 776
    Top = 216
  end
  object cds076: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from data0076'
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 309
    Top = 432
    object cds076RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object cds076CODE: TStringField
      DisplayLabel = #20195#30721
      FieldName = 'CODE'
      Size = 5
    end
    object cds076REJECT_DESCRIPTION: TStringField
      DisplayLabel = #21407#22240
      FieldName = 'REJECT_DESCRIPTION'
      Size = 30
    end
  end
  object dt025: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select RKEY,MANU_PART_NUMBER,MANU_PART_DESC'#13#10'from data0025'#13#10'orde' +
      'r by MANU_PART_NUMBER'
    Parameters = <>
    Left = 510
    Top = 332
    object dt025RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object dt025MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object dt025MANU_PART_DESC: TStringField
      DisplayLabel = #20135#21697#25551#36848
      DisplayWidth = 35
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
  end
  object dsp025: TDataSetProvider
    DataSet = dt025
    Options = [poAllowCommandText]
    Left = 560
    Top = 332
  end
end
