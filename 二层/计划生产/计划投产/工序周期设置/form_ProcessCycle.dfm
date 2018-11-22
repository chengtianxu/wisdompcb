inherited frm_ProcessCycle: Tfrm_ProcessCycle
  Left = 235
  Top = 218
  Width = 832
  Height = 561
  Caption = 'frm_ProcessCycle'
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 12
  inherited StatusBar1: TStatusBar
    Top = 508
    Width = 824
  end
  inherited RzToolbar1: TRzToolbar
    Width = 824
    ToolbarControls = (
      tblAdd
      tblEdit
      tblSave
      tblCancel
      tblDelete
      RzSpacer1
      tblRefresh
      tblfind
      tblExport
      tblFilter
      tblCancelFilter
      tblPrint
      tblDesign
      RzSpacer2
      tblFirst
      tblPrior
      tblNext
      tblLast)
  end
  inherited Panel_right: TPanel
    Left = 818
    Height = 467
  end
  inherited Panel_Left: TPanel
    Height = 467
  end
  inherited Panel_Main: TPanel
    Width = 812
    Height = 467
    inherited Panel5: TPanel
      Width = 812
      Height = 454
      inherited Panel7: TPanel
        Left = 692
        Height = 454
        inherited RzToolbar2: TRzToolbar
          Height = 454
          ToolbarControls = (
            btn1
            Button2)
          object Button2: TButton
            Left = 4
            Top = 37
            Width = 110
            Height = 23
            Caption = #21608#26399#35774#32622
            TabOrder = 1
            OnClick = Button2Click
          end
        end
        inherited Panel2: TPanel
          Height = 454
        end
      end
      inherited PageControl_M: TPageControl
        Width = 692
        Height = 454
        inherited TabSheet1: TTabSheet
          inherited DghMain: TDBGridEh
            Width = 684
            Height = 427
            Columns = <
              item
                EditButtons = <>
                FieldName = 'DEPT_CODE'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'DEPT_NAME'
                Footers = <>
                Width = 102
              end
              item
                EditButtons = <>
                FieldName = 'Description'
                Footers = <>
                Width = 201
              end
              item
                EditButtons = <>
                FieldName = 'MinValue'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'MaxValue'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'DateValue'
                Footers = <>
              end>
          end
        end
        inherited TabSheet2: TTabSheet
          TabVisible = False
          object Label1: TLabel
            Left = 13
            Top = 18
            Width = 48
            Height = 12
            Caption = #37096#38376#20195#30721
          end
          object Label2: TLabel
            Left = 13
            Top = 54
            Width = 48
            Height = 12
            Caption = #37096#38376#21517#31216
            FocusControl = edt_DEPT_NAME
          end
          object Label3: TLabel
            Left = 13
            Top = 91
            Width = 48
            Height = 12
            Caption = #21608#26399#25551#36848
          end
          object Label4: TLabel
            Left = 25
            Top = 128
            Width = 36
            Height = 12
            Caption = #26368#23567#20540
            FocusControl = edt_MinValue
          end
          object Label5: TLabel
            Left = 25
            Top = 165
            Width = 36
            Height = 12
            Caption = #26368#22823#20540
            FocusControl = edt_MaxValue
          end
          object Label6: TLabel
            Left = 18
            Top = 202
            Width = 42
            Height = 12
            Caption = #26102#38388'(H)'
            FocusControl = edt_DateValue
          end
          object edt_DEPT_NAME: TDBEdit
            Left = 65
            Top = 51
            Width = 224
            Height = 20
            DataField = 'DEPT_NAME'
            DataSource = dsMain
            ReadOnly = True
            TabOrder = 0
          end
          object edt_MinValue: TDBEdit
            Left = 65
            Top = 125
            Width = 123
            Height = 20
            DataField = 'MinValue'
            DataSource = dsMain
            ReadOnly = True
            TabOrder = 1
          end
          object edt_MaxValue: TDBEdit
            Left = 65
            Top = 162
            Width = 123
            Height = 20
            DataField = 'MaxValue'
            DataSource = dsMain
            ReadOnly = True
            TabOrder = 2
          end
          object edt_DateValue: TDBEdit
            Tag = 1
            Left = 65
            Top = 198
            Width = 123
            Height = 20
            DataField = 'DateValue'
            DataSource = dsMain
            TabOrder = 3
          end
          object edb_DEPT_CODE: TDBButtonEdit
            Tag = 1
            Left = 65
            Top = 14
            Width = 123
            Height = 20
            Hint = #25353'F1'#24377#20986#19979#25289#21015#34920
            DataSource = dsMain
            DataField = 'DEPT_CODE'
            ParentShowHint = False
            ReadOnlyColor = clInactiveCaptionText
            ShowHint = True
            TabOrder = 4
            AltBtnWidth = 16
            ButtonWidth = 16
            F_DownFormWidth = 0
            F_DownListDataSet = cds0034
            F_DownDataSetFilterField = 'DEPT_CODE'
            F_ResultFieldName = 'DEPT_CODE'
            F_GetFieldName = 'DEPT_CODE'
            F_PressKey13AutoDrop = False
          end
          object edb_Description: TDBButtonEdit
            Tag = 1
            Left = 65
            Top = 88
            Width = 123
            Height = 20
            Hint = #25353'F1'#24377#20986#19979#25289#21015#34920
            DataSource = dsMain
            DataField = 'Description'
            ParentShowHint = False
            ReadOnlyColor = clInactiveCaptionText
            ShowHint = True
            TabOrder = 5
            AltBtnWidth = 16
            ButtonWidth = 16
            F_DownFormWidth = 0
            F_DownListDataSet = cds0051
            F_DownDataSetFilterField = 'Description'
            F_ResultFieldName = 'Description'
            F_GetFieldName = 'Description'
            F_PressKey13AutoDrop = False
          end
        end
      end
    end
    inherited Panel6: TPanel
      Width = 812
    end
    inherited Panel_Bottom: TPanel
      Top = 462
      Width = 812
    end
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
  inherited dtRead: TADODataSet
    CursorType = ctStatic
    CommandText = 'select *from data0051'
  end
  inherited cdsMain: Tcds
    CommandText = 
      'select data0034.DEPT_CODE,data0034.DEPT_NAME,[data0051].[Descrip' +
      'tion],[data0051].[MinValue],[data0051].[MaxValue],'#13#10'data0054.* f' +
      'rom data0054'#13#10'join data0034 on data0054.[DEPT_ptr]=data0034.rkey' +
      #13#10'join [data0051] on [data0054].[D051_ptr]=[data0051].rkey'
    F_AutoIncrField = 'rkey'
    F_SQLSelectFrom = 
      'select data0034.DEPT_CODE,data0034.DEPT_NAME,[data0051].[Descrip' +
      'tion],[data0051].[MinValue],[data0051].[MaxValue],'#13#10'data0054.* f' +
      'rom data0054'#13#10'join data0034 on data0054.[DEPT_ptr]=data0034.rkey' +
      #13#10'join [data0051] on [data0054].[D051_ptr]=[data0051].rkey'
    F_SQLOrderBy = 
      'order by data0054.DEPT_ptr,data0054.D051_ptr,[data0051].[MinValu' +
      'e]'
    object cdsMainDEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'DEPT_CODE'
      OnChange = cdsMainDEPT_CODEChange
      Size = 10
    end
    object cdsMainDEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object cdsMainDescription: TStringField
      DisplayLabel = #21608#26399#25551#36848
      FieldName = 'Description'
      OnChange = cdsMainDescriptionChange
      Size = 40
    end
    object cdsMainMinValue: TBCDField
      DisplayLabel = #26368#23567#20540
      FieldName = 'MinValue'
      Precision = 9
      Size = 2
    end
    object cdsMainMaxValue: TBCDField
      DisplayLabel = #26368#22823#20540
      FieldName = 'MaxValue'
      Precision = 9
      Size = 2
    end
    object cdsMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object cdsMainDEPT_ptr: TIntegerField
      FieldName = 'DEPT_ptr'
    end
    object cdsMainD051_ptr: TIntegerField
      FieldName = 'D051_ptr'
    end
    object cdsMainDateValue: TBCDField
      DisplayLabel = #26102#38388'(H)'
      FieldName = 'DateValue'
      Precision = 9
      Size = 2
    end
  end
  inherited dtMain: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'select data0034.DEPT_CODE,data0034.DEPT_NAME,[data0051].[Descrip' +
      'tion],[data0051].[MinValue],[data0051].[MaxValue],'#13#10'data0054.* f' +
      'rom data0054'#13#10'join data0034 on data0054.[DEPT_ptr]=data0034.rkey' +
      #13#10'join [data0051] on [data0054].[D051_ptr]=[data0051].rkey'
    object dtMainDEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      ProviderFlags = []
      Size = 10
    end
    object dtMainDEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      ProviderFlags = []
      Size = 30
    end
    object dtMainDescription: TStringField
      FieldName = 'Description'
      ProviderFlags = []
      Size = 40
    end
    object dtMainMinValue: TBCDField
      FieldName = 'MinValue'
      ProviderFlags = []
      Precision = 9
      Size = 2
    end
    object dtMainMaxValue: TBCDField
      FieldName = 'MaxValue'
      ProviderFlags = []
      Precision = 9
      Size = 2
    end
    object dtMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object dtMainDEPT_ptr: TIntegerField
      FieldName = 'DEPT_ptr'
    end
    object dtMainD051_ptr: TIntegerField
      FieldName = 'D051_ptr'
    end
    object dtMainDateValue: TBCDField
      FieldName = 'DateValue'
      Precision = 9
      Size = 2
    end
  end
  object cds0034: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select RKEY,DEPT_CODE,DEPT_NAME from data0034 '#13#10'where BARCODE_EN' +
      'TRY_FLAG='#39'Y'#39' and (ACTIVE_FLAG=0)'
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 508
    Top = 202
    object cds0034RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object cds0034DEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object cds0034DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
  end
  object cds0051: TClientDataSet
    Aggregates = <>
    CommandText = 'select *from data0051'
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 573
    Top = 202
    object cds0051rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object cds0051Description: TStringField
      DisplayLabel = #21608#26399#25551#36848
      DisplayWidth = 15
      FieldName = 'Description'
      Size = 40
    end
    object cds0051MinValue: TBCDField
      DisplayLabel = #26368#23567#20540
      FieldName = 'MinValue'
      Precision = 9
      Size = 2
    end
    object cds0051MaxValue: TBCDField
      DisplayLabel = #26368#22823#20540
      FieldName = 'MaxValue'
      Precision = 9
      Size = 2
    end
  end
end
