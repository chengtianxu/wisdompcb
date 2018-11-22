inherited WorkOrder_frm: TWorkOrder_frm
  Left = 313
  Top = 196
  Width = 924
  Height = 563
  Caption = 'WorkOrder_frm'
  Font.Charset = DEFAULT_CHARSET
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar1: TStatusBar
    Top = 506
    Width = 908
  end
  inherited RzToolbar1: TRzToolbar
    Width = 908
    ToolbarControls = (
      tblAdd
      tblEdit
      tblSave
      tblCancel
      tblDelete
      tblRefresh
      tblfind
      tblExport
      tblFilter
      tblCancelFilter
      tblPrint
      tblDesign
      tblFirst
      tblPrior
      tblNext
      tblLast)
    inherited tblAdd: TRzToolButton
      Visible = False
    end
    inherited tblEdit: TRzToolButton
      Visible = False
    end
    inherited tblSave: TRzToolButton
      Visible = False
    end
    inherited tblCancel: TRzToolButton
      Visible = False
    end
    inherited tblCancelFilter: TRzToolButton
      Width = 64
    end
    inherited tblPrint: TRzToolButton
      Left = 419
    end
    inherited tblDesign: TRzToolButton
      Left = 458
      Width = 64
    end
    inherited tblFirst: TRzToolButton
      Left = 522
    end
    inherited tblPrior: TRzToolButton
      Left = 561
    end
    inherited tblNext: TRzToolButton
      Left = 600
    end
    inherited tblLast: TRzToolButton
      Left = 639
    end
  end
  inherited Panel_Left: TPanel
    Height = 465
  end
  inherited Panel_Main: TPanel
    Width = 896
    Height = 465
    inherited Splitter1: TSplitter
      Width = 896
    end
    inherited Panel_Below: TPanel
      Width = 896
      Height = 157
      inherited Panel_Bottom: TPanel
        Top = 127
        Width = 896
        Height = 30
      end
      inherited Panel9: TPanel
        Width = 896
        Height = 122
        inherited Panel10: TPanel
          Left = 776
          Height = 122
          inherited RzToolbar_right_2: TRzToolbar
            Height = 122
            ToolbarControls = (
              Button1)
          end
          inherited Panel3: TPanel
            Height = 122
          end
        end
        inherited PageControl_D: TPageControl
          Width = 776
          Height = 122
          inherited TabSheet3: TTabSheet
            inherited dghChild: TDBGridEh
              Width = 768
              Height = 94
              FooterFont.Charset = DEFAULT_CHARSET
              FooterFont.Height = -11
              FooterFont.Name = 'MS Sans Serif'
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'ID'
                  Footers = <>
                  Width = 97
                end
                item
                  EditButtons = <>
                  FieldName = 'seq_no'
                  Footers = <>
                  Width = 57
                end>
            end
          end
          inherited TabSheet4: TTabSheet
            object Label15: TLabel
              Left = 8
              Top = 8
              Width = 56
              Height = 13
              Caption = 'Panel_ID'#21495
              FocusControl = DBEdit15
            end
            object Label16: TLabel
              Left = 8
              Top = 48
              Width = 51
              Height = 13
              Caption = 'Panel'#24207#21495
              FocusControl = DBEdit16
            end
            object DBEdit15: TDBEdit
              Left = 8
              Top = 24
              Width = 160
              Height = 21
              DataField = 'ID'
              TabOrder = 0
            end
            object DBEdit16: TDBEdit
              Left = 8
              Top = 64
              Width = 134
              Height = 21
              DataField = 'seq_no'
              DataSource = dsChild
              TabOrder = 1
            end
          end
        end
      end
      inherited Panel12: TPanel
        Width = 896
      end
    end
    inherited Panel_Above: TPanel
      Width = 896
      inherited Panel5: TPanel
        Top = 35
        Width = 896
        Height = 260
        inherited Panel7: TPanel
          Left = 776
          Height = 260
          inherited RzToolbar_right_1: TRzToolbar
            Height = 260
            ToolbarControls = (
              btn1)
          end
          inherited Panel2: TPanel
            Height = 260
          end
        end
        inherited PageControl_M: TPageControl
          Width = 776
          Height = 260
          inherited TabSheet1: TTabSheet
            inherited DghMain: TDBGridEh
              Width = 768
              Height = 232
              FooterFont.Charset = DEFAULT_CHARSET
              FooterFont.Height = -11
              FooterFont.Name = 'MS Sans Serif'
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'WORK_ORDER_NUMBER'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'PANELS'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'PARTS_PER_PANEL'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'QUAN_SCH'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'panel_ln'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'panel_wd'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'EMPL_CODE'
                  Footers = <>
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'EMPLOYEE_NAME'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'ENT_DATETIME'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'CUST_CODE'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'MANU_PART_NUMBER'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'MANU_PART_DESC'
                  Footers = <>
                  Width = 142
                end
                item
                  EditButtons = <>
                  FieldName = 'ANALYSIS_CODE_2'
                  Footers = <>
                  Width = 118
                end
                item
                  EditButtons = <>
                  FieldName = 'PO_NUMBER'
                  Footers = <>
                  Width = 93
                end>
            end
          end
          inherited TabSheet2: TTabSheet
            object Label1: TLabel
              Left = 8
              Top = 8
              Width = 48
              Height = 13
              Caption = #20316#19994#21333#21495
              FocusControl = DBEdit1
            end
            object Label2: TLabel
              Left = 8
              Top = 48
              Width = 63
              Height = 13
              Caption = #25237#20135'Panel'#25968
              FocusControl = DBEdit2
            end
            object Label3: TLabel
              Left = 8
              Top = 88
              Width = 69
              Height = 13
              Caption = #27599'Pnl'#30340'Pcs'#25968
              FocusControl = DBEdit3
            end
            object Label4: TLabel
              Left = 8
              Top = 128
              Width = 90
              Height = 13
              Caption = #20316#19994#21333#24635'Pcs'#25968#37327
              FocusControl = DBEdit4
            end
            object Label5: TLabel
              Left = 176
              Top = 8
              Width = 39
              Height = 13
              Caption = 'Panel'#38271
              FocusControl = DBEdit5
            end
            object Label6: TLabel
              Left = 176
              Top = 48
              Width = 39
              Height = 13
              Caption = 'Panel'#23485
              FocusControl = DBEdit6
            end
            object Label7: TLabel
              Left = 176
              Top = 88
              Width = 60
              Height = 13
              Caption = #21019#24314#20154#20195#30721
              FocusControl = DBEdit7
            end
            object Label8: TLabel
              Left = 176
              Top = 128
              Width = 36
              Height = 13
              Caption = #21019#24314#20154
              FocusControl = DBEdit8
            end
            object Label9: TLabel
              Left = 336
              Top = 8
              Width = 48
              Height = 13
              Caption = #21019#24314#26085#26399
              FocusControl = DBEdit9
            end
            object Label10: TLabel
              Left = 336
              Top = 48
              Width = 48
              Height = 13
              Caption = #26412#21378#32534#21495
              FocusControl = DBEdit10
            end
            object Label11: TLabel
              Left = 336
              Top = 88
              Width = 48
              Height = 13
              Caption = #23458#25143#20195#30721
              FocusControl = DBEdit11
            end
            object Label12: TLabel
              Left = 336
              Top = 128
              Width = 48
              Height = 13
              Caption = #23458#25143#22411#21495
              FocusControl = DBEdit12
            end
            object Label13: TLabel
              Left = 560
              Top = 8
              Width = 60
              Height = 13
              Caption = #23458#25143#29289#26009#21495
              FocusControl = DBEdit13
            end
            object Label14: TLabel
              Left = 560
              Top = 48
              Width = 60
              Height = 13
              Caption = #23458#25143#35746#21333#21495
              FocusControl = DBEdit14
            end
            object DBEdit1: TDBEdit
              Left = 8
              Top = 24
              Width = 134
              Height = 21
              DataField = 'WORK_ORDER_NUMBER'
              DataSource = dsMain
              TabOrder = 0
            end
            object DBEdit2: TDBEdit
              Left = 8
              Top = 64
              Width = 134
              Height = 21
              DataField = 'PANELS'
              DataSource = dsMain
              TabOrder = 1
            end
            object DBEdit3: TDBEdit
              Left = 8
              Top = 104
              Width = 134
              Height = 21
              DataField = 'PARTS_PER_PANEL'
              DataSource = dsMain
              TabOrder = 2
            end
            object DBEdit4: TDBEdit
              Left = 8
              Top = 144
              Width = 134
              Height = 21
              DataField = 'QUAN_SCH'
              DataSource = dsMain
              TabOrder = 3
            end
            object DBEdit5: TDBEdit
              Left = 176
              Top = 24
              Width = 95
              Height = 21
              DataField = 'panel_ln'
              DataSource = dsMain
              TabOrder = 4
            end
            object DBEdit6: TDBEdit
              Left = 176
              Top = 64
              Width = 95
              Height = 21
              DataField = 'panel_wd'
              DataSource = dsMain
              TabOrder = 5
            end
            object DBEdit7: TDBEdit
              Left = 176
              Top = 104
              Width = 134
              Height = 21
              DataField = 'EMPL_CODE'
              DataSource = dsMain
              TabOrder = 6
            end
            object DBEdit8: TDBEdit
              Left = 176
              Top = 144
              Width = 134
              Height = 21
              DataField = 'EMPLOYEE_NAME'
              DataSource = dsMain
              TabOrder = 7
            end
            object DBEdit9: TDBEdit
              Left = 336
              Top = 24
              Width = 140
              Height = 21
              DataField = 'ENT_DATETIME'
              DataSource = dsMain
              TabOrder = 8
            end
            object DBEdit10: TDBEdit
              Left = 336
              Top = 64
              Width = 200
              Height = 21
              DataField = 'MANU_PART_NUMBER'
              DataSource = dsMain
              TabOrder = 9
            end
            object DBEdit11: TDBEdit
              Left = 336
              Top = 104
              Width = 134
              Height = 21
              DataField = 'CUST_CODE'
              DataSource = dsMain
              TabOrder = 10
            end
            object DBEdit12: TDBEdit
              Left = 336
              Top = 144
              Width = 200
              Height = 21
              DataField = 'MANU_PART_DESC'
              DataSource = dsMain
              TabOrder = 11
            end
            object DBEdit13: TDBEdit
              Left = 560
              Top = 24
              Width = 200
              Height = 21
              DataField = 'ANALYSIS_CODE_2'
              DataSource = dsMain
              TabOrder = 12
            end
            object DBEdit14: TDBEdit
              Left = 560
              Top = 64
              Width = 200
              Height = 21
              DataField = 'PO_NUMBER'
              DataSource = dsMain
              TabOrder = 13
            end
          end
        end
      end
      inherited Panel_Top: TPanel
        Width = 896
        Height = 35
        object Label17: TLabel
          Left = 15
          Top = 12
          Width = 13
          Height = 13
          Caption = 'IP:'
        end
        object Label18: TLabel
          Left = 240
          Top = 12
          Width = 39
          Height = 13
          Caption = #25968#25454#24211':'
        end
        object Label19: TLabel
          Left = 558
          Top = 12
          Width = 72
          Height = 13
          Caption = #36755#20837#20316#19994#21333#21495
        end
        object ComboBox2: TComboBox
          Left = 298
          Top = 9
          Width = 145
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          ItemHeight = 13
          ParentCtl3D = False
          TabOrder = 0
          OnChange = ComboBox2Change
        end
        object Edit2: TEdit
          Left = 42
          Top = 9
          Width = 154
          Height = 21
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 1
        end
        object BitBtn5: TBitBtn
          Left = 451
          Top = 7
          Width = 66
          Height = 25
          Caption = #27880#20876#36830#25509
          TabOrder = 2
          OnClick = BitBtn5Click
        end
        object Edit1: TEdit
          Left = 634
          Top = 9
          Width = 121
          Height = 21
          Hint = #29992#25195#25551#26538#36755#20837#25110#25163#21160#36755#20837#21518#22238#36710
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnKeyDown = Edit1KeyDown
        end
      end
      inherited Panel11: TPanel
        Width = 896
      end
    end
  end
  inherited Panel_right: TPanel
    Left = 902
    Height = 465
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
  inherited cdsMain: Tcds
    CommandText = 
      'select data0005.EMPL_CODE,data0005.EMPLOYEE_NAME, Y1406.* '#13#10'from' +
      ' Y1406 '#13#10'join data0005 on Y1406.EMPLOYEE_PTR = data0005.rkey'
    F_AutoIncrField = 'rkey'
    F_TableName = 'Y1406'
    F_SQLSelectFrom = 
      'select data0005.EMPL_CODE,data0005.EMPLOYEE_NAME, Y1406.* '#13#10'from' +
      ' Y1406 '#13#10'join data0005 on Y1406.EMPLOYEE_PTR = data0005.rkey'
    F_SQLOrderBy = 'order by WORK_ORDER_NUMBER'
    object cdsMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object cdsMainWORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20316#19994#21333#21495
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object cdsMainPANELS: TIntegerField
      DisplayLabel = #25237#20135'Panel'#25968
      FieldName = 'PANELS'
    end
    object cdsMainPARTS_PER_PANEL: TIntegerField
      DisplayLabel = #27599'Pnl'#30340'Pcs'#25968
      FieldName = 'PARTS_PER_PANEL'
    end
    object cdsMainQUAN_SCH: TIntegerField
      DisplayLabel = #20316#19994#21333#24635'Pcs'#25968#37327
      FieldName = 'QUAN_SCH'
    end
    object cdsMainpanel_ln: TBCDField
      DisplayLabel = 'Panel'#38271
      FieldName = 'panel_ln'
      Precision = 6
      Size = 2
    end
    object cdsMainpanel_wd: TBCDField
      DisplayLabel = 'Panel'#23485
      FieldName = 'panel_wd'
      Precision = 6
      Size = 2
    end
    object cdsMainEMPLOYEE_PTR: TIntegerField
      FieldName = 'EMPLOYEE_PTR'
    end
    object cdsMainEMPL_CODE: TStringField
      DisplayLabel = #21019#24314#20154#20195#30721
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object cdsMainEMPLOYEE_NAME: TStringField
      DisplayLabel = #21019#24314#20154
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object cdsMainENT_DATETIME: TDateTimeField
      DisplayLabel = #21019#24314#26085#26399
      FieldName = 'ENT_DATETIME'
    end
    object cdsMainMANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object cdsMainCUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object cdsMainMANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object cdsMainANALYSIS_CODE_2: TStringField
      DisplayLabel = #23458#25143#29289#26009#21495
      FieldName = 'ANALYSIS_CODE_2'
      Size = 80
    end
    object cdsMainPO_NUMBER: TStringField
      DisplayLabel = #23458#25143#35746#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 32
    end
  end
  inherited cdsChild: Tcds
    CommandText = 'select rkey,ID,Y1406_RKEY,seq_no from Y1407'
    F_TableName = 'Y1407'
    F_SQLSelectFrom = 'select rkey,ID,Y1406_RKEY,seq_no from Y1407'
    F_Primarykey = 'rkey'
    F_Foreignkey = 'Y1406_RKEY'
    object cdsChildrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object cdsChildY1406_RKEY: TIntegerField
      FieldName = 'Y1406_RKEY'
    end
    object cdsChildseq_no: TIntegerField
      DisplayLabel = 'Panel'#24207#21495
      FieldName = 'seq_no'
    end
    object cdsChildID: TStringField
      DisplayLabel = 'Panel_ID'#21495
      FieldName = 'ID'
      Size = 12
    end
  end
  inherited dtChild: TADODataSet
    CursorType = ctStatic
    CommandText = 'select rkey,ID,Y1406_RKEY,seq_no from Y1407'
    object dtChildrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object dtChildY1406_RKEY: TIntegerField
      FieldName = 'Y1406_RKEY'
    end
    object dtChildseq_no: TIntegerField
      FieldName = 'seq_no'
    end
    object dtChildID: TStringField
      FieldName = 'ID'
      Size = 12
    end
  end
  inherited dtMain: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'select data0005.EMPL_CODE,data0005.EMPLOYEE_NAME, Y1406.* '#13#10'from' +
      ' Y1406 '#13#10'join data0005 on Y1406.EMPLOYEE_PTR = data0005.rkey'
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
    object dtMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object dtMainWORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object dtMainPANELS: TIntegerField
      FieldName = 'PANELS'
    end
    object dtMainPARTS_PER_PANEL: TIntegerField
      FieldName = 'PARTS_PER_PANEL'
    end
    object dtMainQUAN_SCH: TIntegerField
      FieldName = 'QUAN_SCH'
    end
    object dtMainpanel_ln: TBCDField
      FieldName = 'panel_ln'
      Precision = 6
      Size = 2
    end
    object dtMainpanel_wd: TBCDField
      FieldName = 'panel_wd'
      Precision = 6
      Size = 2
    end
    object dtMainEMPLOYEE_PTR: TIntegerField
      FieldName = 'EMPLOYEE_PTR'
    end
    object dtMainENT_DATETIME: TDateTimeField
      FieldName = 'ENT_DATETIME'
    end
    object dtMainCUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object dtMainMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object dtMainMANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object dtMainANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 80
    end
    object dtMainPO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 32
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DM_frm.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'WORK_ORDER_NUMBER'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 22
        Value = Null
      end>
    SQL.Strings = (
      
        'select Data0006.PANELS,Data0006.PARTS_PER_PANEL,Data0006.QUAN_SC' +
        'H,'
      'Data0006.panel_ln,Data0006.panel_wd,data0010.CUST_CODE,'
      
        'Data0025.MANU_PART_NUMBER,Data0025.MANU_PART_DESC,Data0025.ANALY' +
        'SIS_CODE_2,data0097.PO_NUMBER'
      'from Data0006'
      'join data0492 on Data0006.CUT_NO = data0492.CUT_NO'
      'join Data0060 on data0492.SO_NO = Data0060.SALES_ORDER'
      'join data0010 on data0492.COMPLETED = data0010.rkey '
      'join Data0025 on data0492.BOM_PTR = Data0025.rkey'
      'join data0097 on Data0060.PURCHASE_ORDER_PTR = data0097.rkey'
      'where WORK_ORDER_NUMBER = :WORK_ORDER_NUMBER')
    Left = 434
    Top = 458
  end
  object ADOQuery3: TADOQuery
    Connection = DM_frm.ADOConnection1
    Parameters = <>
    Left = 618
    Top = 410
  end
  object ADOQuery4: TADOQuery
    Connection = DM_frm.ADOConnection1
    Parameters = <>
    Left = 682
    Top = 410
  end
  object ADOCommand1: TADOCommand
    Connection = DM_frm.ADOConnection1
    Parameters = <>
    Left = 530
    Top = 410
  end
  object dt_0005: TADODataSet
    Connection = DM_frm.ADOConnection1
    CursorType = ctStatic
    CommandText = 'select EMPL_CODE,EMPLOYEE_NAME from data0005'
    Parameters = <>
    Left = 340
    Top = 408
    object dt_0005EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object dt_0005EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
end
