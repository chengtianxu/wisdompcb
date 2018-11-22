inherited WorkLog_f: TWorkLog_f
  Left = 233
  Top = 150
  Width = 871
  Height = 619
  Caption = #24037#20316#26085#24535
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 12
  inherited StatusBar1: TStatusBar
    Top = 562
    Width = 855
  end
  inherited RzToolbar1: TRzToolbar
    Width = 855
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
    inherited tblfind: TRzToolButton
      Visible = False
    end
  end
  inherited Panel_Left: TPanel
    Height = 521
  end
  inherited Panel_Main: TPanel
    Width = 843
    Height = 521
    inherited Splitter1: TSplitter
      Width = 843
    end
    inherited Panel_Below: TPanel
      Width = 843
      Height = 213
      inherited Panel_Bottom: TPanel
        Top = 181
        Width = 843
        Height = 32
        object BtFind: TSpeedButton
          Left = 756
          Top = 5
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
          OnClick = BtFindClick
        end
        object GroupBox1: TGroupBox
          Left = 0
          Top = 0
          Width = 259
          Height = 32
          Align = alLeft
          TabOrder = 0
          object Label1: TLabel
            Left = 6
            Top = 15
            Width = 36
            Height = 12
            Caption = #36131#20219#20154
          end
          object Edit1: TEdit
            Left = 140
            Top = 11
            Width = 112
            Height = 20
            Color = clMedGray
            ReadOnly = True
            TabOrder = 0
          end
          object btEdt_USER_LOGIN_NAME: TButtonEdit
            Left = 48
            Top = 11
            Width = 92
            Height = 20
            ReadOnlyColor = clInactiveCaptionText
            TabOrder = 1
            AltBtnWidth = 16
            ButtonWidth = 16
            F_DownFormWidth = 0
            F_DownListDataSet = cdsRead0073
            F_ResultFieldName = 'USER_LOGIN_NAME'
            F_RkeyFieldName = 'USER_LOGIN_NAME'
            F_Edit1 = Edit1
            F_ResultFieldName1 = 'USER_FULL_NAME'
          end
        end
        object RadioGroup2: TRadioGroup
          Left = 259
          Top = 0
          Width = 250
          Height = 32
          Align = alLeft
          Caption = #26597#30475
          Columns = 3
          ItemIndex = 0
          Items.Strings = (
            #26597#30475#33258#24049
            #26597#30475#20854#20182
            #26597#30475#20840#37096)
          TabOrder = 1
          OnClick = RadioGroup2Click
        end
        object GroupBox2: TGroupBox
          Left = 509
          Top = 0
          Width = 237
          Height = 32
          Align = alLeft
          Caption = #24320#22987#26102#38388
          TabOrder = 2
          object Label11: TLabel
            Left = 7
            Top = 15
            Width = 12
            Height = 12
            Caption = #20174
          end
          object Label12: TLabel
            Left = 120
            Top = 15
            Width = 12
            Height = 12
            Caption = #21040
          end
          object DateTimePicker1: TDateTimePicker
            Left = 24
            Top = 10
            Width = 90
            Height = 21
            Date = 41778.693501689810000000
            Time = 41778.693501689810000000
            TabOrder = 0
          end
          object DateTimePicker2: TDateTimePicker
            Left = 138
            Top = 10
            Width = 90
            Height = 21
            Date = 41778.693501689810000000
            Time = 41778.693501689810000000
            TabOrder = 1
          end
        end
      end
      inherited Panel9: TPanel
        Width = 843
        Height = 176
        inherited Panel10: TPanel
          Left = 723
          Height = 176
          inherited RzToolbar_right_2: TRzToolbar
            Height = 176
            ToolbarControls = (
              Button1
              btn2)
            object btn2: TButton
              Left = 4
              Top = 36
              Width = 111
              Height = 25
              Caption = #23436#25104
              TabOrder = 1
              OnClick = btn2Click
            end
          end
          inherited Panel3: TPanel
            Height = 176
          end
        end
        inherited PageControl_D: TPageControl
          Width = 723
          Height = 176
          inherited TabSheet3: TTabSheet
            inherited dghChild: TDBGridEh
              Width = 715
              Height = 149
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'Number'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'BeginDate'
                  Footers = <>
                  Width = 60
                end
                item
                  EditButtons = <>
                  FieldName = 'EndDate'
                  Footers = <>
                  Width = 60
                end
                item
                  EditButtons = <>
                  FieldName = 'DescText'
                  Footers = <>
                  Width = 460
                end
                item
                  EditButtons = <>
                  FieldName = 'v_Status'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'Assist'
                  Footers = <>
                  Width = 125
                end
                item
                  EditButtons = <>
                  FieldName = 'ForeDate'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'CompleteDate'
                  Footers = <>
                end>
            end
          end
          inherited TabSheet4: TTabSheet
            object Label2: TLabel
              Left = 15
              Top = 12
              Width = 24
              Height = 12
              Caption = #24207#21495
            end
            object Label3: TLabel
              Left = 15
              Top = 49
              Width = 48
              Height = 12
              Caption = #24320#22987#26102#38388
            end
            object Label4: TLabel
              Left = 15
              Top = 86
              Width = 48
              Height = 12
              Caption = #32467#26463#26102#38388
            end
            object Label5: TLabel
              Left = 15
              Top = 123
              Width = 126
              Height = 12
              Caption = #24037#20316#20869#23481' '#36319#36827#24773#20917#25551#36848
            end
            object Label6: TLabel
              Left = 254
              Top = 12
              Width = 48
              Height = 12
              Caption = #23436#25104#24773#20917
            end
            object Label8: TLabel
              Left = 254
              Top = 51
              Width = 36
              Height = 12
              Caption = #21327#21161#26041
            end
            object Label9: TLabel
              Left = 254
              Top = 126
              Width = 48
              Height = 12
              Caption = #23436#25104#26102#38388
            end
            object Label10: TLabel
              Left = 254
              Top = 90
              Width = 72
              Height = 12
              Caption = #39044#35745#23436#25104#26102#38388
            end
            object edt_Number: TDBEdit
              Left = 15
              Top = 25
              Width = 51
              Height = 20
              DataField = 'Number'
              DataSource = dsChild
              ReadOnly = True
              TabOrder = 0
            end
            object edt_v_Status: TDBEdit
              Left = 256
              Top = 26
              Width = 107
              Height = 20
              DataField = 'v_Status'
              DataSource = dsChild
              ReadOnly = True
              TabOrder = 1
            end
            object edt_DescText: TDBMemo
              Left = 15
              Top = 138
              Width = 210
              Height = 111
              DataField = 'DescText'
              DataSource = dsChild
              TabOrder = 2
            end
            object edt_Assist: TDBEdit
              Left = 256
              Top = 65
              Width = 186
              Height = 20
              DataField = 'Assist'
              DataSource = dsChild
              TabOrder = 3
            end
            object DBDateTimeEditEh3: TDBDateTimeEditEh
              Left = 254
              Top = 141
              Width = 87
              Height = 20
              DataField = 'CompleteDate'
              DataSource = dsChild
              EditButtons = <>
              Kind = dtkDateEh
              TabOrder = 4
              Visible = True
            end
            object DBDateTimeEditEh4: TDBDateTimeEditEh
              Left = 255
              Top = 104
              Width = 87
              Height = 20
              DataField = 'ForeDate'
              DataSource = dsChild
              EditButtons = <>
              Kind = dtkDateEh
              TabOrder = 5
              Visible = True
            end
            object DBDateTimeEditEh7: TDBDateTimeEditEh
              Left = 347
              Top = 104
              Width = 54
              Height = 20
              DataField = 'ForeDate'
              DataSource = dsChild
              EditButtons = <>
              TabOrder = 6
              Visible = True
              EditFormat = 'HH:nn'
            end
            object DBDateTimeEditEh1: TDBDateTimeEditEh
              Left = 346
              Top = 141
              Width = 56
              Height = 20
              DataField = 'CompleteDate'
              DataSource = dsChild
              EditButtons = <>
              TabOrder = 7
              Visible = True
              EditFormat = 'HH:nn'
            end
            object edt_BeginDate: TDBEdit
              Left = 16
              Top = 62
              Width = 55
              Height = 20
              DataField = 'BeginDate'
              DataSource = dsChild
              TabOrder = 8
            end
            object edt_EndDate: TDBEdit
              Left = 16
              Top = 100
              Width = 55
              Height = 20
              DataField = 'EndDate'
              DataSource = dsChild
              TabOrder = 9
            end
          end
        end
      end
      inherited Panel12: TPanel
        Width = 843
      end
    end
    inherited Panel_Above: TPanel
      Width = 843
      inherited Panel5: TPanel
        Width = 843
        inherited Panel7: TPanel
          Left = 723
          inherited RzToolbar_right_1: TRzToolbar
            ToolbarControls = (
              btn1
              bt_Expand
              Button2)
            object bt_Expand: TButton
              Left = 4
              Top = 36
              Width = 112
              Height = 25
              Caption = #25552#20132
              TabOrder = 1
              OnClick = bt_ExpandClick
            end
            object Button2: TButton
              Left = 4
              Top = 67
              Width = 112
              Height = 25
              Caption = #21462#28040#25552#20132
              TabOrder = 2
              Visible = False
              OnClick = Button2Click
            end
          end
        end
        inherited PageControl_M: TPageControl
          Width = 723
          inherited TabSheet1: TTabSheet
            inherited DghMain: TDBGridEh
              Width = 715
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'WorkDate'
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = 'USER_FULL_NAME'
                  Footers = <>
                  Width = 85
                end
                item
                  EditButtons = <>
                  FieldName = 'v_Status'
                  Footers = <>
                end>
            end
          end
          inherited TabSheet2: TTabSheet
            ParentShowHint = False
            TabVisible = False
          end
        end
      end
      inherited Panel_Top: TPanel
        Width = 843
      end
      inherited Panel11: TPanel
        Width = 843
      end
    end
  end
  inherited Panel_right: TPanel
    Left = 849
    Height = 521
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
  inherited cdsRead: TClientDataSet
    Top = 380
  end
  inherited dspRead: TDataSetProvider
    Top = 422
  end
  inherited dtRead: TADODataSet
    Top = 332
  end
  inherited cdsMain: Tcds
    CommandText = 
      'Declare @user073 int'#13#10'set  @user073=:user073  '#13#10'   select data00' +
      '73.USER_FULL_NAME,[data0807].* from [data0807]'#13#10' join data0073 o' +
      'n [data0807].[D073_ptr]=data0073.rkey'#13#10'where (data0073.rkey in (' +
      'select rkey73 from data0720 where ttype=1 and grpName'#13#10'  in (sel' +
      'ect distinct grpname from data0720 where rkey73=@user073 and tty' +
      'pe=0)))or(data0073.rkey=@user073)'
    Params = <
      item
        DataType = ftInteger
        Name = 'user073'
        ParamType = ptUnknown
      end>
    BeforeClose = cdsMainBeforeClose
    OnCalcFields = cdsMainCalcFields
    F_AutoIncrField = 'rkey'
    F_UKSaveNotEdit = True
    F_SQLSelectFrom = 
      'Declare @user073 int'#13#10'set  @user073=:user073  '#13#10'   select data00' +
      '73.USER_FULL_NAME,[data0807].* from [data0807]'#13#10' join data0073 o' +
      'n [data0807].[D073_ptr]=data0073.rkey'#13#10
    F_SQLWhere = 
      'where (data0073.rkey in (select rkey73 from data0720 where ttype' +
      '=1 and grpName'#13#10'  in (select distinct grpname from data0720 wher' +
      'e rkey73=@user073 and ttype=0)))or(data0073.rkey=@user073)'
    F_SQLOrderBy = 'order by data0073.USER_FULL_NAME,WorkDate'
    object cdsMainUSER_FULL_NAME: TStringField
      DisplayLabel = #36131#20219#20154
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object cdsMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object cdsMainWorkDate: TDateTimeField
      DisplayLabel = #24037#20316#26085#26399
      FieldName = 'WorkDate'
    end
    object cdsMainD073_ptr: TIntegerField
      FieldName = 'D073_ptr'
    end
    object cdsMainStatus: TSmallintField
      FieldName = 'Status'
    end
    object cdsMainv_Status: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkCalculated
      FieldName = 'v_Status'
      Size = 10
      Calculated = True
    end
  end
  inherited cdsChild: Tcds
    CommandText = 'select * from [data0808]'
    FieldDefs = <
      item
        Name = 'Number'
        DataType = ftSmallint
      end
      item
        Name = 'D807_ptr'
        DataType = ftInteger
      end
      item
        Name = 'BeginDate'
        Attributes = [faFixed]
        DataType = ftString
        Size = 5
      end
      item
        Name = 'EndDate'
        Attributes = [faFixed]
        DataType = ftString
        Size = 5
      end
      item
        Name = 'DescText'
        DataType = ftWideString
        Size = 500
      end
      item
        Name = 'Status'
        DataType = ftSmallint
      end
      item
        Name = 'Assist'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'ForeDate'
        DataType = ftDateTime
      end
      item
        Name = 'CompleteDate'
        DataType = ftDateTime
      end>
    StoreDefs = True
    OnCalcFields = cdsChildCalcFields
    F_SQLSelectFrom = 'select * from [data0808]'
    F_SQLOrderBy = 'order by [Number]'
    F_Primarykey = 'rkey'
    F_Foreignkey = 'D807_ptr'
    object cdsChildNumber: TSmallintField
      DisplayLabel = #24207#21495
      FieldName = 'Number'
    end
    object cdsChildD807_ptr: TIntegerField
      FieldName = 'D807_ptr'
    end
    object cdsChildBeginDate: TStringField
      DisplayLabel = #24320#22987#26102#38388
      FieldName = 'BeginDate'
      OnChange = cdsChildBeginDateChange
      FixedChar = True
      Size = 5
    end
    object cdsChildEndDate: TStringField
      DisplayLabel = #32467#26463#26102#38388
      FieldName = 'EndDate'
      OnChange = cdsChildBeginDateChange
      FixedChar = True
      Size = 5
    end
    object cdsChildDescText: TWideStringField
      DisplayLabel = #24037#20316#20869#23481' '#36319#36827#24773#20917#25551#36848
      FieldName = 'DescText'
      Size = 500
    end
    object cdsChildStatus: TSmallintField
      FieldName = 'Status'
    end
    object cdsChildv_Status: TStringField
      DisplayLabel = #23436#25104#24773#20917
      FieldKind = fkCalculated
      FieldName = 'v_Status'
      Size = 10
      Calculated = True
    end
    object cdsChildAssist: TWideStringField
      DisplayLabel = #21327#21161#26041
      FieldName = 'Assist'
      Size = 100
    end
    object cdsChildForeDate: TDateTimeField
      DisplayLabel = #39044#35745#23436#25104#26102#38388
      FieldName = 'ForeDate'
    end
    object cdsChildCompleteDate: TDateTimeField
      DisplayLabel = #23436#25104#26102#38388
      FieldName = 'CompleteDate'
    end
  end
  inherited dtChild: TADODataSet
    CursorType = ctStatic
    CommandText = 'select * from [data0808]'
    object dtChildNumber: TWordField
      FieldName = 'Number'
    end
    object dtChildD807_ptr: TIntegerField
      FieldName = 'D807_ptr'
    end
    object dtChildBeginDate: TStringField
      FieldName = 'BeginDate'
      FixedChar = True
      Size = 5
    end
    object dtChildEndDate: TStringField
      FieldName = 'EndDate'
      FixedChar = True
      Size = 5
    end
    object dtChildDescText: TWideStringField
      FieldName = 'DescText'
      Size = 500
    end
    object dtChildStatus: TWordField
      FieldName = 'Status'
    end
    object dtChildAssist: TWideStringField
      FieldName = 'Assist'
      Size = 100
    end
    object dtChildForeDate: TDateTimeField
      FieldName = 'ForeDate'
    end
    object dtChildCompleteDate: TDateTimeField
      FieldName = 'CompleteDate'
    end
  end
  inherited dtMain: TADODataSet
    CursorType = ctStatic
    CommandText = 
      ' select data0073.USER_FULL_NAME,[data0807].* from [data0807]'#13#10' j' +
      'oin data0073 on [data0807].[D073_ptr]=data0073.rkey'
    object dtMainWorkDate: TDateTimeField
      FieldName = 'WorkDate'
    end
    object dtMainUSER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      ProviderFlags = []
      Size = 30
    end
    object dtMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object dtMainD073_ptr: TIntegerField
      FieldName = 'D073_ptr'
    end
    object dtMainStatus: TWordField
      FieldName = 'Status'
    end
  end
  object cdsRead0073: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Declare @user073 int'#13#10'set  @user073=:rkey73   '#13#10'   select USER_F' +
      'ULL_NAME,USER_LOGIN_NAME from Data0073 '#13#10'   where (rkey in (sele' +
      'ct rkey73 from data0720 where ttype=1 and grpName'#13#10'  in (select ' +
      'distinct grpname from data0720 where rkey73=@user073  and ttype=' +
      '0)))or(data0073.rkey=@user073)'
    FetchOnDemand = False
    Params = <
      item
        DataType = ftInteger
        Name = 'rkey73'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 536
    Top = 392
    object cdsRead0073USER_LOGIN_NAME: TStringField
      DisplayLabel = #29992#25143#30331#38470#21517
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object cdsRead0073USER_FULL_NAME: TStringField
      DisplayLabel = #29992#25143#21517
      DisplayWidth = 15
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
  end
end
