object frmEditBOMBaoJia: TfrmEditBOMBaoJia
  Left = 231
  Top = 187
  Caption = 'BOM'#25253#20215
  ClientHeight = 754
  ClientWidth = 1014
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TRzPanel
    Left = 0
    Top = 0
    Width = 1014
    Height = 29
    Align = alTop
    TabOrder = 0
    object btnSvae: TRzButton
      Left = 2
      Top = 2
      Width = 50
      Align = alLeft
      Caption = #20445#23384
      TabOrder = 0
      OnClick = btnSvaeClick
    end
    object btnExit: TRzButton
      Left = 52
      Top = 2
      Width = 50
      Align = alLeft
      Caption = #36864#20986
      TabOrder = 1
      OnClick = btnExitClick
    end
  end
  object pnl14: TPanel
    Left = 0
    Top = 29
    Width = 1014
    Height = 587
    Align = alClient
    TabOrder = 1
    object spl7: TSplitter
      Left = 499
      Top = 1
      Height = 585
      ExplicitLeft = 648
      ExplicitTop = 120
      ExplicitHeight = 100
    end
    object pnl32: TPanel
      Left = 1
      Top = 1
      Width = 498
      Height = 585
      Align = alLeft
      TabOrder = 0
      object pgcBom: TPageControl
        Left = 1
        Top = 1
        Width = 496
        Height = 583
        ActivePage = tsBaseInfo
        Align = alClient
        TabOrder = 0
        OnChange = pgcBomChange
        object tsBaseInfo: TTabSheet
          Caption = #22522#26412#20449#24687
          ImageIndex = 6
          object lbl4: TRzLabel
            Left = 3
            Top = 60
            Width = 65
            Height = 13
            Caption = #23458#25143#20195#30721#65306
            Transparent = True
          end
          object lbl44: TRzLabel
            Left = 3
            Top = 33
            Width = 65
            Height = 13
            Caption = #23458#25143#21517#31216#65306
            Transparent = True
          end
          object lbl22: TRzLabel
            Left = 131
            Top = 60
            Width = 65
            Height = 13
            Caption = #20851#32852#23458#25143#65306
            Transparent = True
          end
          object lbl11: TRzLabel
            Left = 307
            Top = 114
            Width = 65
            Height = 13
            Caption = #36135#24065#31181#31867#65306
            Transparent = True
          end
          object lbl23: TRzLabel
            Left = 307
            Top = 60
            Width = 65
            Height = 13
            Caption = #20184#27454#26041#24335#65306
            Transparent = True
          end
          object lbl14: TRzLabel
            Left = 3
            Top = 114
            Width = 52
            Height = 13
            Caption = #19994#21153#21592#65306
            Transparent = True
          end
          object lbl8: TRzLabel
            Left = 131
            Top = 114
            Width = 65
            Height = 13
            Caption = #23457#25209#27969#31243#65306
            Transparent = True
          end
          object lbl5: TRzLabel
            Left = 3
            Top = 144
            Width = 65
            Height = 13
            Caption = #23458#25143#22411#21495#65306
            Transparent = True
          end
          object lbl10: TRzLabel
            Left = 3
            Top = 171
            Width = 65
            Height = 13
            Caption = #23458#25143#29289#26009#65306
            Transparent = True
          end
          object lbl21: TRzLabel
            Left = 3
            Top = 87
            Width = 52
            Height = 13
            Caption = #32852#31995#20154#65306
            Transparent = True
          end
          object lbl24: TRzLabel
            Left = 132
            Top = 87
            Width = 65
            Height = 13
            Caption = #32852#31995#30005#35805#65306
            Transparent = True
          end
          object lbl31: TRzLabel
            Left = 307
            Top = 87
            Width = 65
            Height = 13
            Caption = #23458#25143#37038#31665#65306
            Transparent = True
          end
          object lbl9: TRzLabel
            Left = 3
            Top = 6
            Width = 65
            Height = 13
            Caption = #25253#20215#26694#26550#65306
            Transparent = True
          end
          object lbl6: TRzLabel
            Left = 236
            Top = 6
            Width = 65
            Height = 13
            Align = alCustom
            Caption = #26412#21378#32534#21495#65306
            Transparent = True
          end
          object lbl2: TRzLabel
            Left = 3
            Top = 199
            Width = 65
            Height = 13
            Align = alCustom
            Caption = #26377#25928#26102#38388#65306
            Transparent = True
          end
          object lbl53: TRzLabel
            Left = 469
            Top = 200
            Width = 13
            Height = 13
            Align = alCustom
            Caption = #22825
            Transparent = True
          end
          object lbl3: TRzLabel
            Left = 307
            Top = 200
            Width = 65
            Height = 13
            Align = alCustom
            Caption = #26377#25928#26399#38480#65306
            Transparent = True
          end
          object btn3: TSpeedButton
            Left = 462
            Top = 2
            Width = 23
            Height = 22
            Caption = '...'
            OnClick = btn4Click
          end
          object edtcust_code: TRzDBEdit
            Left = 67
            Top = 57
            Width = 54
            Height = 21
            DataSource = dsBP06
            DataField = 'cust_code'
            ReadOnly = True
            Color = clInfoBk
            ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
            TabOrder = 0
            OnDblClick = btn22Click
          end
          object edtcustomerName: TRzDBEdit
            Left = 67
            Top = 30
            Width = 418
            Height = 21
            DataSource = dsBP06
            DataField = 'Customer_Name'
            ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
            TabOrder = 1
          end
          object edtsalemanname1: TRzDBEdit
            Left = 199
            Top = 57
            Width = 101
            Height = 21
            DataSource = dsBP06
            DataField = 'ORIG_CUSTOMER'
            ReadOnly = True
            Color = clInfoBk
            ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
            TabOrder = 2
            OnDblClick = btn18Click
          end
          object edtcurr_name: TRzDBEdit
            Left = 374
            Top = 111
            Width = 111
            Height = 21
            DataSource = dsBP06
            DataField = 'curr_name'
            ReadOnly = True
            Color = clInfoBk
            ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
            TabOrder = 3
            OnClick = btn6Click
          end
          object edtORIG_CUSTOMER: TRzDBEdit
            Left = 374
            Top = 57
            Width = 111
            Height = 21
            DataSource = dsBP06
            DataField = 'PayMent'
            ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
            TabOrder = 4
          end
          object edtsalemanname: TRzDBEdit
            Left = 67
            Top = 111
            Width = 55
            Height = 21
            DataSource = dsBP06
            DataField = 'salemanname'
            ReadOnly = True
            Color = clInfoBk
            ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
            TabOrder = 5
            OnDblClick = btn7Click
          end
          object edtsalemanname2: TRzDBEdit
            Left = 199
            Top = 111
            Width = 101
            Height = 21
            DataSource = dsBP06
            DataField = 'ShenPiLiuCheng'
            ReadOnly = True
            Color = clInfoBk
            ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
            TabOrder = 6
            OnDblClick = btn19Click
          end
          object edtManu_Part_desc: TRzDBEdit
            Left = 68
            Top = 141
            Width = 232
            Height = 21
            DataSource = dsBP06
            DataField = 'Manu_part_desc'
            ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
            TabOrder = 7
          end
          object edtANALYSIS_CODE_2: TRzDBEdit
            Left = 68
            Top = 168
            Width = 232
            Height = 21
            DataSource = dsBP06
            DataField = 'ANALYSIS_CODE_2'
            ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
            TabOrder = 8
          end
          object edtcust_code1: TRzDBEdit
            Left = 68
            Top = 84
            Width = 54
            Height = 21
            DataSource = dsBP06
            DataField = 'CustomContectPeop'
            ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
            TabOrder = 9
            OnDblClick = btn22Click
          end
          object edtORIG_CUSTOMER1: TRzDBEdit
            Left = 199
            Top = 84
            Width = 101
            Height = 21
            DataSource = dsBP06
            DataField = 'CustomContectPhone'
            ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
            TabOrder = 10
            OnDblClick = btn18Click
          end
          object edtORIG_CUSTOMER2: TRzDBEdit
            Left = 374
            Top = 84
            Width = 111
            Height = 21
            DataSource = dsBP06
            DataField = 'CustomContectEmail'
            ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
            TabOrder = 11
            OnDblClick = btn18Click
          end
          object grp1: TGroupBox
            Left = 248
            Top = 237
            Width = 227
            Height = 153
            Caption = #26679#21697#36153
            TabOrder = 12
            object lbl32: TRzLabel
              Left = 15
              Top = 22
              Width = 52
              Height = 13
              Caption = #24037#31243#36153#65306
              Transparent = True
            end
            object lbl51: TRzLabel
              Left = 15
              Top = 49
              Width = 52
              Height = 13
              Caption = #21046#26495#36153#65306
              Transparent = True
            end
            object lbl52: TRzLabel
              Left = 15
              Top = 76
              Width = 52
              Height = 13
              Caption = #27979#35797#36153#65306
              Transparent = True
            end
            object lbl55: TRzLabel
              Left = 15
              Top = 103
              Width = 52
              Height = 13
              Caption = #26679#21697#25968#65306
              Transparent = True
            end
            object lbl56: TRzLabel
              Left = 15
              Top = 128
              Width = 39
              Height = 13
              Caption = #38754#31215#65306
              Transparent = True
            end
            object edtManu_part_desc1: TRzDBEdit
              Left = 72
              Top = 19
              Width = 121
              Height = 21
              DataSource = dsBP06
              DataField = 'Rpt_GongChengFei'
              ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
              TabOrder = 0
            end
            object edtRpt_GongChengFei: TRzDBEdit
              Left = 72
              Top = 46
              Width = 121
              Height = 21
              DataSource = dsBP06
              DataField = 'Rpt_ZhiBanFei'
              ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
              TabOrder = 1
            end
            object edtRpt_GongChengFei1: TRzDBEdit
              Left = 72
              Top = 73
              Width = 121
              Height = 21
              DataSource = dsBP06
              DataField = 'Rpt_CeShiFei'
              ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
              TabOrder = 2
            end
            object edtRpt_CeShiFei: TRzDBEdit
              Left = 72
              Top = 100
              Width = 121
              Height = 21
              DataSource = dsBP06
              DataField = 'Rpt_YangpinShu'
              ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
              TabOrder = 3
            end
            object edtRpt_CeShiFei1: TRzDBEdit
              Left = 72
              Top = 125
              Width = 121
              Height = 21
              DataSource = dsBP06
              DataField = 'Rpt_YangpinMianji'
              ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
              TabOrder = 4
            end
          end
          object grp2: TGroupBox
            Left = 3
            Top = 237
            Width = 221
            Height = 153
            Caption = #25209#37327#36153
            TabOrder = 13
            object lbl33: TRzLabel
              Left = 18
              Top = 28
              Width = 52
              Height = 13
              Caption = #24320#25289#36153#65306
              Transparent = True
            end
            object lbl36: TRzLabel
              Left = 19
              Top = 58
              Width = 52
              Height = 13
              Caption = #27169#20855#36153#65306
              Transparent = True
            end
            object lbl45: TRzLabel
              Left = 19
              Top = 88
              Width = 65
              Height = 13
              Caption = #27979#35797#26550#36153#65306
              Transparent = True
            end
            object lbl46: TRzLabel
              Left = 19
              Top = 118
              Width = 78
              Height = 13
              Caption = #26368#23567#35746#21333#25968#65306
              Transparent = True
            end
            object edtManu_part_desc2: TRzDBEdit
              Left = 83
              Top = 25
              Width = 114
              Height = 21
              DataSource = dsBP06
              DataField = 'Rpt_KaiLaFei'
              ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
              TabOrder = 0
            end
            object edtManu_part_desc3: TRzDBEdit
              Left = 83
              Top = 55
              Width = 114
              Height = 21
              DataSource = dsBP06
              DataField = 'Rpt_MojuFei'
              ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
              TabOrder = 1
            end
            object edtManu_part_desc4: TRzDBEdit
              Left = 83
              Top = 85
              Width = 114
              Height = 21
              DataSource = dsBP06
              DataField = 'Rpt_CeShiJiaFei'
              ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
              TabOrder = 2
            end
            object edtManu_part_desc5: TRzDBEdit
              Left = 99
              Top = 115
              Width = 98
              Height = 21
              DataSource = dsBP06
              DataField = 'Rpt_ZuiXiaoDingDanShu'
              ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
              TabOrder = 3
            end
          end
          object edtcurr_name1: TRzDBEdit
            Left = 67
            Top = 3
            Width = 156
            Height = 21
            DataSource = dsBP06
            DataField = 'Pricetypename'
            ReadOnly = True
            Color = clInfoBk
            ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
            TabOrder = 14
            OnDblClick = btn5Click
          end
          object dtpBPTime: TRzDBDateTimePicker
            Left = 67
            Top = 195
            Width = 233
            Height = 19
            Align = alCustom
            Date = 42453.682181909720000000
            Format = ''
            Time = 42453.682181909720000000
            ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
            TabOrder = 15
            DataField = 'BPTime'
            DataSource = dsBP06
          end
          object edtEnableDays: TRzDBEdit
            Left = 374
            Top = 196
            Width = 89
            Height = 21
            DataSource = dsBP06
            DataField = 'EnableDays'
            Align = alCustom
            ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
            TabOrder = 16
          end
          object edtManuPartNum: TEdit
            Left = 310
            Top = 3
            Width = 148
            Height = 21
            ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
            TabOrder = 17
            Text = 'edtManuPartNum'
          end
        end
        object tsAllParam: TTabSheet
          Caption = #25152#26377#21442#25968
          object spl8: TSplitter
            Left = 241
            Top = 0
            Height = 554
            ExplicitLeft = 304
            ExplicitTop = 144
            ExplicitHeight = 100
          end
          object pnl36: TPanel
            Left = 0
            Top = 0
            Width = 241
            Height = 554
            Align = alLeft
            TabOrder = 0
            object lbl13: TLabel
              Left = 1
              Top = 1
              Width = 239
              Height = 13
              Align = alTop
              Alignment = taCenter
              Caption = #24037#24207#21442#25968
              Color = clAqua
              ParentColor = False
              Transparent = False
              ExplicitWidth = 52
            end
            object ehBP09: TDBGridEh
              Left = 1
              Top = 14
              Width = 239
              Height = 539
              Align = alClient
              DataSource = dsBP09
              DynProps = <>
              ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
              TabOrder = 0
              OnDrawColumnCell = ehBP09DrawColumnCell
              Columns = <
                item
                  ButtonStyle = cbsNone
                  DynProps = <>
                  EditButton.Visible = False
                  EditButtons = <>
                  FieldName = 'dept_name'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = #24037#24207
                  Width = 70
                end
                item
                  ButtonStyle = cbsNone
                  DynProps = <>
                  EditButton.Visible = False
                  EditButtons = <>
                  FieldName = 'param_desc'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = #21442#25968
                  Width = 70
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'Param_Value'
                  Footers = <>
                  Title.Caption = #20540
                  Width = 80
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'param_code'
                  Footers = <>
                  Title.Caption = #21442#25968#20195#30721
                  Width = 80
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
          end
          object pnl18: TPanel
            Left = 244
            Top = 0
            Width = 244
            Height = 554
            Align = alClient
            TabOrder = 1
            object spl3: TSplitter
              Left = 1
              Top = 366
              Width = 242
              Height = 8
              Cursor = crVSplit
              Align = alBottom
              ExplicitTop = 317
              ExplicitWidth = 368
            end
            object pnl19: TPanel
              Left = 1
              Top = 374
              Width = 242
              Height = 179
              Align = alBottom
              TabOrder = 0
              object lbl54: TLabel
                Left = 1
                Top = 1
                Width = 240
                Height = 13
                Align = alTop
                Alignment = taCenter
                Caption = #24037#24207#21442#25968'-'#38144#21806
                Color = clAqua
                ParentColor = False
                Transparent = False
                ExplicitWidth = 85
              end
              object ehAllParamSale: TDBGridEh
                Left = 1
                Top = 14
                Width = 240
                Height = 164
                Align = alClient
                DataSource = dsBP10_Sale
                DynProps = <>
                ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
                PopupMenu = pm10
                TabOrder = 0
                OnEnter = ehParamGlobMIEnter
                Columns = <
                  item
                    ButtonStyle = cbsNone
                    DynProps = <>
                    EditButton.Visible = False
                    EditButtons = <>
                    FieldName = 'param_desc'
                    Footers = <>
                    ReadOnly = True
                    Title.Caption = #21442#25968#25551#36848
                    Width = 80
                  end
                  item
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'Param_Value'
                    Footers = <>
                    Title.Caption = #21442#25968#20540
                    Width = 120
                  end
                  item
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'param_name'
                    Footers = <>
                    Title.Caption = #21442#25968#20195#30721
                    Width = 80
                  end>
                object RowDetailData: TRowDetailPanelControlEh
                end
              end
            end
            object pnl17: TPanel
              Left = 1
              Top = 1
              Width = 242
              Height = 365
              Align = alClient
              TabOrder = 1
              object lbl37: TLabel
                Left = 1
                Top = 1
                Width = 240
                Height = 13
                Align = alTop
                Alignment = taCenter
                Caption = #20840#23616#21442#25968'-MI'
                Color = clAqua
                ParentColor = False
                Transparent = False
                ExplicitWidth = 73
              end
              object ehAllParamMI: TDBGridEh
                Left = 1
                Top = 14
                Width = 240
                Height = 350
                Align = alClient
                DataSource = dsBP10
                DynProps = <>
                ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
                TabOrder = 0
                OnEnter = ehParamGlobMIEnter
                Columns = <
                  item
                    ButtonStyle = cbsNone
                    DynProps = <>
                    EditButton.Visible = False
                    EditButtons = <>
                    FieldName = 'param_desc'
                    Footers = <>
                    ReadOnly = True
                    Title.Caption = #21442#25968#25551#36848
                    Width = 80
                  end
                  item
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'Param_Value'
                    Footers = <>
                    Title.Caption = #21442#25968#20540
                    Width = 120
                  end
                  item
                    ButtonStyle = cbsNone
                    DynProps = <>
                    EditButton.Visible = False
                    EditButtons = <>
                    FieldName = 'param_name'
                    Footers = <>
                    Title.Caption = #21442#25968#20195#30721
                    Width = 80
                  end>
                object RowDetailData: TRowDetailPanelControlEh
                end
              end
            end
          end
        end
        object tsDept: TTabSheet
          Caption = #24037#24207
          ImageIndex = 1
          object spl1: TSplitter
            Left = 225
            Top = 0
            Height = 554
            ExplicitLeft = 312
            ExplicitTop = 96
            ExplicitHeight = 100
          end
          object pnl4: TRzPanel
            Left = 0
            Top = 0
            Width = 225
            Height = 554
            Align = alLeft
            TabOrder = 0
            object eh2: TDBGridEh
              Left = 2
              Top = 2
              Width = 221
              Height = 550
              Align = alClient
              DataSource = dsBP07
              DynProps = <>
              ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
              PopupMenu = pmbp07
              TabOrder = 0
              Columns = <
                item
                  ButtonStyle = cbsNone
                  DynProps = <>
                  EditButton.Visible = False
                  EditButtons = <>
                  FieldName = 'Selforder'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = #24207#21495
                  Width = 30
                end
                item
                  ButtonStyle = cbsNone
                  DynProps = <>
                  EditButton.Visible = False
                  EditButtons = <>
                  FieldName = 'dept_code'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = #24037#24207#20195#30721
                  Width = 60
                end
                item
                  ButtonStyle = cbsNone
                  DynProps = <>
                  EditButton.Visible = False
                  EditButtons = <>
                  FieldName = 'dept_name'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = #24037#24207#21517#31216
                  Width = 70
                end
                item
                  ButtonStyle = cbsNone
                  DynProps = <>
                  EditButton.Visible = False
                  EditButtons = <>
                  FieldName = 'BeiShu'
                  Footers = <>
                  Title.Caption = #27425#25968
                  Width = 30
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
          end
          object pnl5: TRzPanel
            Left = 228
            Top = 0
            Width = 260
            Height = 554
            Align = alClient
            TabOrder = 1
            object lbl16: TRzLabel
              Left = 2
              Top = 2
              Width = 256
              Height = 13
              Align = alTop
              Alignment = taCenter
              Caption = #24037#24207#21442#25968
              ExplicitWidth = 52
            end
            object ehBP08: TDBGridEh
              Left = 2
              Top = 267
              Width = 256
              Height = 285
              Align = alClient
              DataSource = dsBP08
              DynProps = <>
              ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
              PopupMenu = pmbp08
              TabOrder = 0
              Columns = <
                item
                  ButtonStyle = cbsNone
                  DynProps = <>
                  EditButton.Visible = False
                  EditButtons = <>
                  FieldName = 'MGroupname'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = #31867#21035#20195#30721
                  Width = 60
                end
                item
                  ButtonStyle = cbsNone
                  DynProps = <>
                  EditButton.Visible = False
                  EditButtons = <>
                  FieldName = 'MGroupDesc'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = #31867#21035#21517#31216
                  Width = 70
                end
                item
                  AlwaysShowEditButton = True
                  ButtonStyle = cbsEllipsis
                  DynProps = <>
                  EditButton.Style = ebsEllipsisEh
                  EditButton.Visible = True
                  EditButtons = <>
                  FieldName = 'MName'
                  Footers = <>
                  Title.Caption = #19968#31867#26448#26009
                  Width = 200
                  OnEditButtonClick = eh3Columns2EditButtonClick
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'beishu'
                  Footers = <>
                  Title.Caption = #20493#25968
                  Width = 40
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'TDATE'
                  Footers = <>
                  Title.Caption = #20215#26684#26085#26399
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'SUPPLIER_NAME'
                  Footers = <>
                  Title.Caption = #26448#26009#20379#24212#21830
                  Width = 150
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'PRICE_1'
                  Footers = <>
                  Title.Caption = #20215#26684
                  Width = 80
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'INV_PART_NUMBER'
                  Footers = <>
                  Title.Caption = #26448#26009#32534#30721
                  Width = 120
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
            object ehDeptParam: TDBGridEh
              Left = 2
              Top = 15
              Width = 256
              Height = 228
              Align = alTop
              DataSource = dsBP09
              DynProps = <>
              ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
              TabOrder = 1
              OnDrawColumnCell = ehBP09DrawColumnCell
              Columns = <
                item
                  ButtonStyle = cbsNone
                  DynProps = <>
                  EditButton.Visible = False
                  EditButtons = <>
                  FieldName = 'param_desc'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = #21442#25968#21517#31216
                  Width = 100
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'Param_Value'
                  Footers = <>
                  Title.Caption = #21442#25968#20540
                  Width = 130
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'param_code'
                  Footers = <>
                  Title.Caption = #21442#25968#20195#30721
                  Width = 80
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
            object pnl11: TRzPanel
              Left = 2
              Top = 243
              Width = 256
              Height = 24
              Align = alTop
              TabOrder = 2
              object lbl38: TRzLabel
                Left = 2
                Top = 2
                Width = 65
                Height = 20
                Align = alLeft
                Caption = #26448#26009#31867#22411#65306
                ExplicitHeight = 13
              end
              object btnDeptBom: TSpeedButton
                Left = 226
                Top = 2
                Width = 23
                Height = 20
                Align = alLeft
                Caption = #36873
                OnClick = btnDeptBomClick
                ExplicitLeft = 327
                ExplicitTop = 3
                ExplicitHeight = 22
              end
              object cbxDeptBomType: TRzComboBox
                Left = 67
                Top = 2
                Width = 159
                Height = 21
                Align = alLeft
                Style = csDropDownList
                ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
                TabOrder = 0
              end
            end
          end
        end
        object tsAllBom: TTabSheet
          Caption = #25152#26377'BOM'
          ImageIndex = 2
          object spl2: TSplitter
            Left = 0
            Top = 251
            Width = 488
            Height = 3
            Cursor = crVSplit
            Align = alTop
            ExplicitLeft = -21
            ExplicitTop = 376
            ExplicitWidth = 494
          end
          object pnl20: TPanel
            Left = 0
            Top = 254
            Width = 488
            Height = 300
            Align = alClient
            TabOrder = 0
            object lbl66: TLabel
              Left = 1
              Top = 25
              Width = 486
              Height = 13
              Align = alTop
              Alignment = taCenter
              Caption = #25152#26377'BOM'
              Color = clAqua
              ParentColor = False
              Transparent = False
              ExplicitWidth = 47
            end
            object eh5: TDBGridEh
              Left = 1
              Top = 38
              Width = 486
              Height = 261
              Align = alClient
              DataSource = dsBP08
              DynProps = <>
              ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
              PopupMenu = pmbp08
              TabOrder = 0
              Columns = <
                item
                  ButtonStyle = cbsNone
                  DynProps = <>
                  EditButton.Visible = False
                  EditButtons = <>
                  FieldName = 'step_number'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = #27493#39588
                  Width = 50
                end
                item
                  ButtonStyle = cbsNone
                  DynProps = <>
                  EditButton.Visible = False
                  EditButtons = <>
                  FieldName = 'beishu'
                  Footers = <>
                  Title.Caption = #20493#25968
                  Width = 40
                end
                item
                  ButtonStyle = cbsNone
                  DynProps = <>
                  EditButton.Visible = False
                  EditButtons = <>
                  FieldName = 'dept_name'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = #24037#24207#21517#31216
                  Width = 60
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'INV_PART_NUMBER'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = #29289#26009#32534#30721
                  Width = 100
                end
                item
                  DisplayFormat = '0.00000'
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'PRICE_1'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = #37319#36141#21333#20301#20215
                  Width = 80
                end
                item
                  AlwaysShowEditButton = True
                  ButtonStyle = cbsEllipsis
                  DynProps = <>
                  EditButton.Style = ebsEllipsisEh
                  EditButton.Visible = True
                  EditButtons = <>
                  FieldName = 'MName'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = 'BOM'#26448#26009
                  Width = 250
                  OnEditButtonClick = eh3Columns2EditButtonClick
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'TDATE'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = #20215#26684#26085#26399
                  Width = 80
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'SUPPLIER_NAME'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = #26448#26009#20379#24212#21830
                  Width = 150
                end
                item
                  ButtonStyle = cbsNone
                  DynProps = <>
                  EditButton.Visible = False
                  EditButtons = <>
                  FieldName = 'MGroupDesc'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = #26448#26009#31867#21035
                  Width = 100
                end
                item
                  ButtonStyle = cbsNone
                  DynProps = <>
                  EditButton.Visible = False
                  EditButtons = <>
                  FieldName = 'dept_code'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = #24037#24207#20195#30721
                  Width = 60
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
            object pnl25: TRzPanel
              Left = 1
              Top = 1
              Width = 486
              Height = 24
              Align = alTop
              TabOrder = 1
              object lbl17: TRzLabel
                Left = 2
                Top = 2
                Width = 65
                Height = 20
                Align = alLeft
                Caption = #26448#26009#31867#22411#65306
                ExplicitHeight = 13
              end
              object btnAllBomPickBom: TSpeedButton
                Left = 457
                Top = 2
                Width = 23
                Height = 20
                Align = alLeft
                Caption = #36873
                OnClick = btnAllBomPickBomClick
                ExplicitLeft = 448
                ExplicitTop = 4
              end
              object cbxAllBomDeptBomType: TRzComboBox
                Left = 67
                Top = 2
                Width = 390
                Height = 21
                Align = alLeft
                Style = csDropDownList
                ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
                TabOrder = 0
              end
            end
          end
          object pnl21: TPanel
            Left = 0
            Top = 0
            Width = 488
            Height = 251
            Align = alTop
            TabOrder = 1
            object pnl23: TPanel
              Left = 1
              Top = 1
              Width = 486
              Height = 249
              Align = alTop
              TabOrder = 0
              object ehAllBomDept: TDBGridEh
                Left = 1
                Top = 21
                Width = 484
                Height = 227
                Align = alClient
                DataSource = dsAllBomDept
                DynProps = <>
                ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
                PopupMenu = pmbp07
                ReadOnly = True
                TabOrder = 0
                Columns = <
                  item
                    ButtonStyle = cbsNone
                    DynProps = <>
                    EditButton.Visible = False
                    EditButtons = <>
                    FieldName = 'Selforder'
                    Footers = <>
                    Title.Caption = #24207#21495
                    Width = 40
                  end
                  item
                    ButtonStyle = cbsNone
                    DynProps = <>
                    EditButton.Visible = False
                    EditButtons = <>
                    FieldName = 'dept_code'
                    Footers = <>
                    Title.Caption = #24037#24207#20195#30721
                    Width = 70
                  end
                  item
                    ButtonStyle = cbsNone
                    DynProps = <>
                    EditButton.Visible = False
                    EditButtons = <>
                    FieldName = 'dept_name'
                    Footers = <>
                    Title.Caption = #24037#24207#21517#31216
                    Width = 80
                  end
                  item
                    ButtonStyle = cbsNone
                    DynProps = <>
                    EditButton.Visible = False
                    EditButtons = <>
                    FieldName = 'BeiShu'
                    Footers = <>
                    Title.Caption = #27425#25968
                    Width = 50
                  end>
                object RowDetailData: TRowDetailPanelControlEh
                end
              end
              object pnl24: TPanel
                Left = 1
                Top = 1
                Width = 484
                Height = 20
                Align = alTop
                TabOrder = 1
                object btn16: TSpeedButton
                  Left = 1
                  Top = 1
                  Width = 81
                  Height = 18
                  Align = alLeft
                  Caption = #26174#31034'BOM'#24037#24207
                  OnClick = btn16Click
                  ExplicitLeft = 2
                  ExplicitTop = 0
                  ExplicitHeight = 22
                end
              end
            end
          end
        end
        object tsCalcBom: TTabSheet
          Caption = #35745#31639'BOM'
          ImageIndex = 5
          object eh6: TDBGridEh
            Left = 0
            Top = 24
            Width = 488
            Height = 530
            Align = alClient
            DataSource = dsBP08
            DynProps = <>
            FooterRowCount = 1
            ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
            ReadOnly = True
            SumList.Active = True
            TabOrder = 0
            Columns = <
              item
                ButtonStyle = cbsNone
                DynProps = <>
                EditButton.Visible = False
                EditButtons = <>
                FieldName = 'step_number'
                Footers = <>
                Title.Caption = #27493#39588
                Width = 40
              end
              item
                ButtonStyle = cbsNone
                DynProps = <>
                EditButton.Visible = False
                EditButtons = <>
                FieldName = 'dept_code'
                Footers = <>
                Title.Caption = #24037#24207#20195#30721
                Width = 60
              end
              item
                ButtonStyle = cbsNone
                DynProps = <>
                EditButton.Visible = False
                EditButtons = <>
                FieldName = 'dept_name'
                Footers = <>
                Title.Caption = #24037#24207#21517#31216
                Width = 80
              end
              item
                ButtonStyle = cbsNone
                DynProps = <>
                EditButton.Visible = False
                EditButtons = <>
                FieldName = 'MGroupDesc'
                Footers = <>
                Title.Caption = #26448#26009#31867#21035
                Width = 70
              end
              item
                ButtonStyle = cbsNone
                DynProps = <>
                EditButton.Visible = False
                EditButtons = <>
                FieldName = 'MName'
                Footers = <>
                Title.Caption = #26448#26009
                Width = 150
              end
              item
                ButtonStyle = cbsNone
                DynProps = <>
                EditButton.Visible = False
                EditButtons = <>
                FieldName = 'MStdPrice'
                Footers = <>
                Title.Caption = #26448#26009#28040#32791#21333#20301#20215
                Width = 100
              end
              item
                ButtonStyle = cbsNone
                DynProps = <>
                EditButton.Visible = False
                EditButtons = <>
                FieldName = 'MUsePerPcs'
                Footers = <>
                Title.Caption = #27599'PCS'#29992#37327
                Width = 70
              end
              item
                ButtonStyle = cbsNone
                DynProps = <>
                EditButton.Visible = False
                EditButtons = <>
                FieldName = 'MUsePrice'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #27599'PCS'#25104#26412
                Width = 70
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'MUsePrice_M'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #24179#31859#25104#26412
                Width = 80
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
          object pnl8: TRzPanel
            Left = 0
            Top = 0
            Width = 488
            Height = 24
            Align = alTop
            TabOrder = 1
            object lbl19: TLabel
              Left = 152
              Top = 2
              Width = 162
              Height = 20
              Align = alLeft
              Caption = #32467#26524#20026#27599'PCS'#30340#25104#26412'(RMB)'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitHeight = 13
            end
            object btn12: TRzButton
              Left = 2
              Top = 2
              Height = 20
              Align = alLeft
              Caption = #35745#31639#25104#26412
              TabOrder = 0
              OnClick = btn12Click
            end
            object btn15: TRzButton
              Left = 77
              Top = 2
              Height = 20
              Align = alLeft
              Caption = #26356#26032#20844#24335
              TabOrder = 1
              OnClick = btn15Click
            end
          end
        end
        object ts7: TTabSheet
          Caption = #35745#31639#24037#24207
          ImageIndex = 5
          object pnl2: TRzPanel
            Left = 0
            Top = 0
            Width = 488
            Height = 24
            Align = alTop
            TabOrder = 0
            object lbl67: TLabel
              Left = 152
              Top = 2
              Width = 162
              Height = 20
              Align = alLeft
              Caption = #32467#26524#20026#27599'PCS'#30340#25104#26412'(RMB)'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitHeight = 13
            end
            object btn1: TRzButton
              Left = 2
              Top = 2
              Height = 20
              Align = alLeft
              Caption = #35745#31639#25104#26412
              TabOrder = 0
              OnClick = btn13Click
            end
            object btn2: TRzButton
              Left = 77
              Top = 2
              Height = 20
              Align = alLeft
              Caption = #26356#26032#20844#24335
              TabOrder = 1
              OnClick = btn17Click
            end
          end
          object eh7: TDBGridEh
            Left = 0
            Top = 24
            Width = 488
            Height = 530
            Align = alClient
            DataSource = dsBP07
            DynProps = <>
            FooterRowCount = 1
            ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
            ReadOnly = True
            SumList.Active = True
            TabOrder = 1
            Columns = <
              item
                ButtonStyle = cbsNone
                DynProps = <>
                EditButton.Visible = False
                EditButtons = <>
                FieldName = 'Selforder'
                Footers = <>
                Title.Caption = #27493#39588
                Width = 40
              end
              item
                ButtonStyle = cbsNone
                DynProps = <>
                EditButton.Visible = False
                EditButtons = <>
                FieldName = 'dept_code'
                Footers = <>
                Title.Caption = #24037#24207#20195#30721
                Width = 70
              end
              item
                ButtonStyle = cbsNone
                DynProps = <>
                EditButton.Visible = False
                EditButtons = <>
                FieldName = 'dept_name'
                Footers = <>
                Title.Caption = #24037#24207#21517
                Width = 70
              end
              item
                ButtonStyle = cbsNone
                DynProps = <>
                EditButton.Visible = False
                EditButtons = <>
                FieldName = 'BeiShu'
                Footers = <>
                Title.Caption = #27425#25968
                Width = 40
              end
              item
                ButtonStyle = cbsNone
                DynProps = <>
                EditButton.Visible = False
                EditButtons = <>
                FieldName = 'P1'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #20027#26009#25104#26412
                Width = 80
              end
              item
                ButtonStyle = cbsNone
                DynProps = <>
                EditButton.Visible = False
                EditButtons = <>
                FieldName = 'P2'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #36741#26009#25104#26412
                Width = 70
              end
              item
                ButtonStyle = cbsNone
                DynProps = <>
                EditButton.Visible = False
                EditButtons = <>
                FieldName = 'P3'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #20154#24037#25104#26412
                Width = 70
              end
              item
                ButtonStyle = cbsNone
                DynProps = <>
                EditButton.Visible = False
                EditButtons = <>
                FieldName = 'P4'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #27700#30005#25104#26412
                Width = 70
              end
              item
                ButtonStyle = cbsNone
                DynProps = <>
                EditButton.Visible = False
                EditButtons = <>
                FieldName = 'P5'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #25240#26087#25104#26412
                Width = 70
              end
              item
                ButtonStyle = cbsNone
                DynProps = <>
                EditButton.Visible = False
                EditButtons = <>
                FieldName = 'AllP'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #24635#35745
                Width = 70
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'AllP_M'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #24179#31859
                Width = 80
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
        end
        object tsAllCalc: TTabSheet
          Caption = #24635#35745
          ImageIndex = 4
          TabVisible = False
          object pnl16: TPanel
            Left = 96
            Top = 78
            Width = 295
            Height = 210
            BevelInner = bvLowered
            TabOrder = 0
            object lbl39: TLabel
              Left = 8
              Top = 57
              Width = 52
              Height = 13
              Caption = #36816#36755#25104#26412
            end
            object lbl40: TLabel
              Left = 8
              Top = 81
              Width = 59
              Height = 13
              Caption = #33829#38144#25104#26412'%'
            end
            object lbl41: TLabel
              Left = 8
              Top = 106
              Width = 59
              Height = 13
              Caption = #36130#21153#25104#26412'%'
            end
            object lbl42: TLabel
              Left = 8
              Top = 131
              Width = 59
              Height = 13
              Caption = #31649#29702#25104#26412'%'
            end
            object lbl43: TLabel
              Left = 8
              Top = 156
              Width = 59
              Height = 13
              Caption = #25240#25187#25104#26412'%'
            end
            object lblbaofei_cost_M: TDBText
              Left = 205
              Top = 56
              Width = 65
              Height = 17
              DataField = 'yunshu_cost_M'
              DataSource = dsBP06
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object lblbaofei_cost_pcs: TDBText
              Left = 130
              Top = 56
              Width = 65
              Height = 17
              DataField = 'yunshu_cost_pcs'
              DataSource = dsBP06
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object lblyunshu_cost_M: TDBText
              Left = 205
              Top = 80
              Width = 65
              Height = 17
              DataField = 'xiaoshou_cost_M'
              DataSource = dsBP06
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object lblyunshu_cost_pcs: TDBText
              Left = 130
              Top = 81
              Width = 65
              Height = 17
              DataField = 'xiaoshou_cost_pcs'
              DataSource = dsBP06
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object lblxiaoshou_cost_M: TDBText
              Left = 205
              Top = 105
              Width = 65
              Height = 17
              DataField = 'caiwu_cost_M'
              DataSource = dsBP06
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object lblxiaoshou_cost_pcs: TDBText
              Left = 130
              Top = 106
              Width = 65
              Height = 17
              DataField = 'caiwu_cost_pcs'
              DataSource = dsBP06
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object lblcaiwu_cost_pcs: TDBText
              Left = 130
              Top = 131
              Width = 65
              Height = 17
              DataField = 'guanli_cost_pcs'
              DataSource = dsBP06
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object lblcaiwu_cost_M: TDBText
              Left = 205
              Top = 131
              Width = 65
              Height = 17
              DataField = 'guanli_cost_M'
              DataSource = dsBP06
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object lblguanli_cost_pcs: TDBText
              Left = 130
              Top = 156
              Width = 65
              Height = 17
              DataField = 'zhekou_cost_pcs'
              DataSource = dsBP06
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object lblguanli_cost_M: TDBText
              Left = 205
              Top = 156
              Width = 65
              Height = 17
              DataField = 'zhekou_cost_M'
              DataSource = dsBP06
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object lblzhekou_cost_M1: TDBText
              Left = 81
              Top = 156
              Width = 40
              Height = 13
              DataField = 'xiaoshouzhekou'
              DataSource = dsBP06
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object lblyunshu_cost_calcret: TDBText
              Left = 81
              Top = 56
              Width = 40
              Height = 13
              DataField = 'yunshu_cost_calcret'
              DataSource = dsBP06
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object lblxiaoshou_cost_calcret: TDBText
              Left = 81
              Top = 81
              Width = 40
              Height = 13
              DataField = 'xiaoshou_cost_calcret'
              DataSource = dsBP06
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object lblcaiwu_cost_calcret: TDBText
              Left = 81
              Top = 106
              Width = 40
              Height = 13
              DataField = 'caiwu_cost_calcret'
              DataSource = dsBP06
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object lblguanli_cost_calcret: TDBText
              Left = 81
              Top = 131
              Width = 40
              Height = 13
              DataField = 'guanli_cost_calcret'
              DataSource = dsBP06
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object lblzhekou_cost_M: TDBText
              Left = 204
              Top = 185
              Width = 65
              Height = 17
              DataField = 'AllCost_M'
              DataSource = dsBP06
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblzhekou_cost_pcs: TDBText
              Left = 113
              Top = 185
              Width = 65
              Height = 17
              DataField = 'AllCost_PCS'
              DataSource = dsBP06
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl30: TLabel
              Left = 8
              Top = 184
              Width = 52
              Height = 13
              Hint = #26448#26009'+'#21046#36896
              Caption = #24635#35745#25104#26412
            end
            object lbl20: TLabel
              Left = 2
              Top = 2
              Width = 291
              Height = 16
              Align = alTop
              Alignment = taCenter
              Caption = #23454#38469#20928#21033#29575#25104#26412
              Color = clMoneyGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = #23435#20307
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Transparent = False
              ExplicitWidth = 119
            end
            object shp6: TShape
              Left = 7
              Top = 46
              Width = 277
              Height = 1
            end
            object lbl62: TLabel
              Left = 11
              Top = 30
              Width = 26
              Height = 13
              Caption = #31867#22411
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object lbl63: TLabel
              Left = 207
              Top = 30
              Width = 26
              Height = 13
              Caption = #24179#31859
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object lbl64: TLabel
              Left = 132
              Top = 30
              Width = 21
              Height = 13
              Caption = 'PCS'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object lbl65: TLabel
              Left = 81
              Top = 30
              Width = 26
              Height = 13
              Caption = #30334#20998
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object shp7: TShape
              Left = 7
              Top = 177
              Width = 277
              Height = 1
            end
          end
        end
      end
    end
    object pnl34: TPanel
      Left = 502
      Top = 1
      Width = 511
      Height = 585
      Align = alClient
      TabOrder = 1
      object pgcMI: TPageControl
        Left = 147
        Top = 1
        Width = 363
        Height = 583
        ActivePage = ts5
        Align = alClient
        TabOrder = 0
        object ts5: TTabSheet
          Caption = #23618#21387
          ImageIndex = 1
          object pg2: TRzPageControl
            Left = 0
            Top = 0
            Width = 355
            Height = 554
            Hint = ''
            ActivePage = tsTabSheet5
            Align = alClient
            TabIndex = 0
            TabOrder = 0
            FixedDimension = 19
            object tsTabSheet5: TRzTabSheet
              Caption = #22270#29255#32467#26500
              object imgYaHe: TImage
                Left = 0
                Top = 23
                Width = 351
                Height = 508
                Align = alClient
                AutoSize = True
                ExplicitLeft = 80
                ExplicitTop = 166
                ExplicitWidth = 105
                ExplicitHeight = 105
              end
              object pnl6: TRzPanel
                Left = 0
                Top = 0
                Width = 351
                Height = 23
                Align = alTop
                TabOrder = 0
                object btn10: TRzButton
                  Left = 2
                  Top = 2
                  Height = 19
                  Align = alLeft
                  Caption = #23548#20837#22270#29255
                  TabOrder = 0
                  OnClick = btn10Click
                end
                object chk1: TCheckBox
                  Left = 77
                  Top = 2
                  Width = 97
                  Height = 19
                  Align = alLeft
                  Caption = #25289#20280#26174#31034
                  TabOrder = 1
                  OnClick = chk1Click
                end
                object btn11: TRzButton
                  Left = 423
                  Top = 2
                  Caption = #28165#31354#22270#29255
                  TabOrder = 2
                  OnClick = btn11Click
                end
              end
            end
            object tsTabSheet4: TRzTabSheet
              Caption = #25991#26412#32467#26500
              object pnl7: TRzPanel
                Left = 0
                Top = 0
                Width = 351
                Height = 28
                Align = alTop
                TabOrder = 0
                object btn9: TRzButton
                  Left = 172
                  Top = 1
                  Caption = #23548#20837#25991#26412
                  TabOrder = 0
                  OnClick = btn9Click
                end
              end
              object mmoYaHeTxt: TRzDBMemo
                Left = 0
                Top = 28
                Width = 351
                Height = 503
                Align = alClient
                DataField = 'YaHeTxt'
                DataSource = dsBP06
                ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
                TabOrder = 1
              end
            end
          end
        end
        object ts4: TTabSheet
          Caption = #25340#29256
          object pnl33: TRzPanel
            Left = 0
            Top = 0
            Width = 355
            Height = 554
            Align = alClient
            TabOrder = 0
            object pnl3: TRzPanel
              Left = 2
              Top = 2
              Width = 351
              Height = 22
              Align = alTop
              TabOrder = 0
              object btn8: TRzButton
                Left = 2
                Top = 2
                Width = 54
                Height = 18
                Align = alLeft
                Caption = #25340#29256
                TabOrder = 0
                OnClick = btn8Click
              end
              object btnLoadCut: TRzButton
                Left = 56
                Top = 2
                Width = 49
                Height = 18
                Align = alLeft
                Caption = #35835#21462
                TabOrder = 1
                OnClick = btnLoadCutClick
              end
            end
            object pg1: TRzPageControl
              Left = 2
              Top = 24
              Width = 351
              Height = 528
              Hint = ''
              ActivePage = tsTabSheet1
              Align = alClient
              TabIndex = 0
              TabOrder = 1
              FixedDimension = 19
              object tsTabSheet1: TRzTabSheet
                Caption = #22823#26009#22270
                object img1: TImage
                  Left = 0
                  Top = 0
                  Width = 347
                  Height = 505
                  Align = alClient
                  Stretch = True
                  ExplicitLeft = -4
                  ExplicitTop = 3
                  ExplicitWidth = 455
                  ExplicitHeight = 229
                end
              end
              object tsTabSheet2: TRzTabSheet
                Caption = 'A'#26495#22270
                object img2: TImage
                  Left = 0
                  Top = 0
                  Width = 347
                  Height = 505
                  Align = alClient
                  Stretch = True
                  ExplicitLeft = 96
                  ExplicitTop = 144
                  ExplicitWidth = 105
                  ExplicitHeight = 105
                end
              end
              object tsTabSheet3: TRzTabSheet
                Caption = 'B'#26495#22270
                object img3: TImage
                  Left = 0
                  Top = 0
                  Width = 347
                  Height = 505
                  Align = alClient
                  Stretch = True
                  ExplicitLeft = 104
                  ExplicitTop = 152
                  ExplicitWidth = 105
                  ExplicitHeight = 105
                end
              end
            end
          end
        end
        object tsDrll: TTabSheet
          Caption = #38075#22068#34920
          ImageIndex = 2
          object eh3: TDBGridEh
            Left = 0
            Top = 0
            Width = 355
            Height = 554
            Align = alClient
            DataSource = dsD29
            DynProps = <>
            ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
            ReadOnly = True
            TabOrder = 0
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'SEQ_NO'
                Footers = <>
                Title.Caption = #24207#21495
                Width = 35
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'SEQ_NR'
                Footers = <>
                Title.Caption = #20992#20855
                Width = 40
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'MARK'
                Footers = <>
                Title.Caption = #31526#21495
                Width = 40
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'HOLES_DIA'
                Footers = <>
                Title.Caption = #25104#21697#23380#24452
                Width = 65
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PTH'
                Footers = <>
                Width = 35
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'TOLERANCE'
                Footers = <>
                Title.Caption = #20844#24046
                Width = 70
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DRILL_DIA'
                Footers = <>
                Title.Caption = #38075#22068
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'UNIT'
                Footers = <>
                Title.Caption = 'PCS'#23380#25968
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'SET_UNMBER'
                Footers = <>
                Title.Caption = 'SET'#23380#25968
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PANEL_A'
                Footers = <>
                Title.Caption = 'A'#26495#23380#25968
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PANEL_B'
                Footers = <>
                Title.Caption = 'B'#26495#23380#25968
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'REMARK'
                Footers = <>
                Title.Caption = #22791#27880
                Width = 80
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
        end
      end
      object pnl35: TPanel
        Left = 1
        Top = 1
        Width = 146
        Height = 583
        Align = alLeft
        TabOrder = 1
        object pnl29: TPanel
          Left = 1
          Top = 1
          Width = 144
          Height = 24
          Align = alTop
          TabOrder = 0
          object btnReadMIStep: TSpeedButton
            Left = 65
            Top = 1
            Width = 64
            Height = 22
            Align = alLeft
            Caption = #23548#20837'MI'
            OnClick = btnReadMIStepClick
          end
          object btnViewMI: TSpeedButton
            Left = 1
            Top = 1
            Width = 64
            Height = 22
            Align = alLeft
            Caption = #26597#30475'MI'
            OnClick = btnViewMIClick
            ExplicitLeft = 9
            ExplicitTop = 2
          end
        end
        object tvMI: TTreeView
          Left = 1
          Top = 25
          Width = 144
          Height = 557
          Align = alClient
          Indent = 19
          TabOrder = 1
          OnChange = tvMIChange
        end
      end
    end
  end
  object pnl31: TPanel
    Left = 0
    Top = 616
    Width = 1014
    Height = 138
    Align = alBottom
    TabOrder = 2
    object lbl26: TLabel
      Left = 8
      Top = 53
      Width = 21
      Height = 13
      Caption = 'PCS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object lbl27: TLabel
      Left = 8
      Top = 78
      Width = 26
      Height = 13
      Caption = #24179#31859
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object lbl28: TLabel
      Left = 41
      Top = 31
      Width = 52
      Height = 13
      Hint = #19968#31867#26448#26009'+'#20108#31867#26448#26009
      Caption = #26448#26009#25104#26412
    end
    object lbl29: TLabel
      Left = 116
      Top = 31
      Width = 52
      Height = 13
      Hint = #20154#24037'+'#27700#30005'+'#25240#26087
      Caption = #21046#36896#25104#26412
    end
    object lbl25: TLabel
      Left = 190
      Top = 31
      Width = 26
      Height = 13
      Hint = #20154#24037'+'#27700#30005'+'#25240#26087
      Caption = #25253#24223
    end
    object lbl47: TLabel
      Left = 77
      Top = 104
      Width = 65
      Height = 13
      Hint = #19968#31867#26448#26009'+'#20108#31867#26448#26009
      Caption = #20135#21697#29992#36884#65306
    end
    object lblP1P2_M1: TDBText
      Left = 138
      Top = 104
      Width = 19
      Height = 13
      DataField = 'chanpinyongtu_add'
      DataSource = dsBP06
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl48: TLabel
      Left = 172
      Top = 104
      Width = 65
      Height = 13
      Hint = #19968#31867#26448#26009'+'#20108#31867#26448#26009
      Caption = #38144#21806#21306#22495#65306
    end
    object lblP3P4P5_M1: TDBText
      Left = 233
      Top = 104
      Width = 23
      Height = 13
      DataField = 'xiaoshouquyu_add'
      DataSource = dsBP06
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl49: TLabel
      Left = 274
      Top = 104
      Width = 65
      Height = 13
      Hint = #19968#31867#26448#26009'+'#20108#31867#26448#26009
      Caption = #35746#21333#25968#37327#65306
    end
    object lblbaofei_cost_M1: TDBText
      Left = 336
      Top = 104
      Width = 23
      Height = 13
      DataField = 'dingdanshuliang_add'
      DataSource = dsBP06
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl69: TLabel
      Left = 280
      Top = 31
      Width = 26
      Height = 13
      Caption = #24635#35745
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object lbl70: TLabel
      Left = 8
      Top = 104
      Width = 65
      Height = 13
      Caption = #39044#35745#21152#25104#65306
    end
    object lbl58: TLabel
      Left = 381
      Top = 104
      Width = 52
      Height = 13
      Caption = #24635#21152#25104#65306
    end
    object lblAllYuJiMaoLiLv: TDBText
      Left = 431
      Top = 104
      Width = 26
      Height = 13
      DataField = 'AllYuJiMaoLiLv'
      DataSource = dsBP06
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bvl1: TBevel
      Left = 337
      Top = 4
      Width = 3
      Height = 92
    end
    object lbl72: TLabel
      Left = 343
      Top = 6
      Width = 52
      Height = 13
      Caption = #27611#21033#29575#65306
    end
    object lbl34: TLabel
      Left = 509
      Top = 1
      Width = 39
      Height = 13
      Caption = #25240#29575#65306
    end
    object lbl50: TLabel
      Left = 197
      Top = 6
      Width = 52
      Height = 13
      Caption = #22686#20540#31246#65306
    end
    object lbl35: TLabel
      Left = 6
      Top = 6
      Width = 39
      Height = 13
      Caption = #24065#31181#65306
    end
    object lbl73: TLabel
      Left = 343
      Top = 31
      Width = 52
      Height = 13
      Caption = #19981#21547#31246#20215
    end
    object lbl75: TLabel
      Left = 447
      Top = 31
      Width = 39
      Height = 13
      Caption = #21547#31246#20215
    end
    object lbldingdanshuliang_add: TDBText
      Left = 40
      Top = 6
      Width = 40
      Height = 13
      DataField = 'curr_name'
      DataSource = dsBP06
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblcurr_name: TDBText
      Left = 242
      Top = 6
      Width = 23
      Height = 13
      DataField = 'zengzhishui_add'
      DataSource = dsBP06
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblzengzhishui_add: TDBText
      Left = 557
      Top = 1
      Width = 81
      Height = 13
      DataField = 'jinglilv_add'
      DataSource = dsBP06
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl1: TLabel
      Left = 163
      Top = 104
      Width = 7
      Height = 13
      Caption = '%'
    end
    object lbl7: TLabel
      Left = 258
      Top = 104
      Width = 7
      Height = 13
      Caption = '%'
    end
    object lbl57: TLabel
      Left = 360
      Top = 104
      Width = 7
      Height = 13
      Caption = '%'
    end
    object lbl59: TLabel
      Left = 456
      Top = 104
      Width = 7
      Height = 13
      Caption = '%'
    end
    object lbl60: TLabel
      Left = 264
      Top = 30
      Width = 7
      Height = 13
      Caption = '%'
    end
    object lbl12: TLabel
      Left = 476
      Top = 7
      Width = 7
      Height = 13
      Caption = '%'
    end
    object lbl18: TLabel
      Left = 275
      Top = 6
      Width = 7
      Height = 13
      Caption = '%'
    end
    object lbl61: TLabel
      Left = 641
      Top = 2
      Width = 7
      Height = 13
      Caption = '%'
    end
    object lblcurr_name1: TDBText
      Left = 124
      Top = 6
      Width = 67
      Height = 13
      DataField = 'curr_rate'
      DataSource = dsBP06
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl68: TLabel
      Left = 79
      Top = 6
      Width = 39
      Height = 13
      Caption = #27719#29575#65306
    end
    object lbl15: TLabel
      Left = 509
      Top = 17
      Width = 73
      Height = 13
      Caption = #26412#24065#20215'PCS'#65306
    end
    object lblBenBiPrice: TLabel
      Left = 584
      Top = 17
      Width = 133
      Height = 13
      Caption = '                   '
    end
    object lbl71: TLabel
      Left = 685
      Top = 27
      Width = 78
      Height = 13
      Caption = #26412#24065#20215#24179#31859#65306
    end
    object lblBenBiPriceM: TLabel
      Left = 765
      Top = 27
      Width = 133
      Height = 13
      Caption = '                   '
    end
    object lbl: TLabel
      Left = 559
      Top = 33
      Width = 52
      Height = 13
      Caption = #21407#21333#20215#26684
    end
    object lbl74: TLabel
      Left = 892
      Top = 23
      Width = 26
      Height = 13
      Caption = #25240#29575
    end
    object RzDBLabel1: TRzDBLabel
      Left = 924
      Top = 22
      Width = 65
      Height = 17
      Alignment = taRightJustify
      DataField = 'OrignZL'
      DataSource = dsBP06
    end
    object lbl76: TLabel
      Left = 687
      Top = 44
      Width = 118
      Height = 13
      Caption = #32418#32447#20215#26684'('#19981#21547#31246')'#65306
    end
    object lblredline: TRzDBLabel
      Left = 810
      Top = 41
      Width = 123
      Height = 17
      DataField = 'redline'
      DataSource = dsBP06
    end
    object btn14: TRzButton
      Left = 630
      Top = 46
      Width = 53
      Height = 46
      Caption = #35745#31639
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btn14Click
    end
    object edtbaofeilv: TDBEdit
      Left = 218
      Top = 27
      Width = 43
      Height = 21
      Color = clInfoBk
      DataField = 'baofeilv'
      DataSource = dsBP06
      ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
      ReadOnly = True
      TabOrder = 1
    end
    object edtd: TDBEdit
      Left = 41
      Top = 50
      Width = 70
      Height = 21
      Color = clInfoBk
      DataField = 'P1P2_Pcs'
      DataSource = dsBP06
      ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
      ReadOnly = True
      TabOrder = 2
    end
    object edtd1: TDBEdit
      Left = 116
      Top = 50
      Width = 70
      Height = 21
      Color = clInfoBk
      DataField = 'P3P4P5_Pcs'
      DataSource = dsBP06
      ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
      ReadOnly = True
      TabOrder = 3
    end
    object edtd2: TDBEdit
      Left = 191
      Top = 50
      Width = 70
      Height = 21
      Color = clInfoBk
      DataField = 'baofei_cost_pcs'
      DataSource = dsBP06
      ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
      ReadOnly = True
      TabOrder = 4
    end
    object edtd3: TDBEdit
      Left = 41
      Top = 75
      Width = 70
      Height = 21
      Color = clInfoBk
      DataField = 'P1P2_M'
      DataSource = dsBP06
      ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
      ReadOnly = True
      TabOrder = 5
    end
    object edtd4: TDBEdit
      Left = 116
      Top = 75
      Width = 70
      Height = 21
      Color = clInfoBk
      DataField = 'P3P4P5_M'
      DataSource = dsBP06
      ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
      ReadOnly = True
      TabOrder = 6
    end
    object edtd5: TDBEdit
      Left = 191
      Top = 75
      Width = 70
      Height = 21
      Color = clInfoBk
      DataField = 'baofei_cost_M'
      DataSource = dsBP06
      ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
      ReadOnly = True
      TabOrder = 7
    end
    object edtP1P2_M: TDBEdit
      Left = 264
      Top = 50
      Width = 70
      Height = 21
      Color = clInfoBk
      DataField = 'PAllAndBaoFei_Pcs'
      DataSource = dsBP06
      ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
      ReadOnly = True
      TabOrder = 8
    end
    object edtP3P4P5_M: TDBEdit
      Left = 264
      Top = 75
      Width = 70
      Height = 21
      Color = clInfoBk
      DataField = 'PAllAndBaoFei_M'
      DataSource = dsBP06
      ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
      ReadOnly = True
      TabOrder = 9
    end
    object edtPAllAndBaoFei_Pcs: TDBEdit
      Left = 395
      Top = 2
      Width = 78
      Height = 21
      DataField = 'maolilv_add'
      DataSource = dsBP06
      ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
      TabOrder = 10
      OnKeyPress = edtmaolilvKeyPress
    end
    object edtbuhanshuijiage_Pcs1: TRzDBEdit
      Tag = 1
      Left = 339
      Top = 50
      Width = 95
      Height = 21
      DataSource = dsBP06
      DataField = 'buhanshuijiage_Pcs'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
      ParentFont = False
      TabOrder = 11
      OnKeyPress = edtbuhanshuijiage_PcsKeyPress
    end
    object edtbuhanshuijiage_M1: TRzDBEdit
      Left = 339
      Top = 75
      Width = 96
      Height = 21
      DataSource = dsBP06
      DataField = 'buhanshuijiage_M'
      ReadOnly = True
      Color = clInfoBk
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
      ParentFont = False
      TabOrder = 12
    end
    object edthanshuijiage_Pcs1: TRzDBEdit
      Tag = 2
      Left = 446
      Top = 50
      Width = 96
      Height = 21
      DataSource = dsBP06
      DataField = 'hanshuijiage_Pcs'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
      ParentFont = False
      TabOrder = 13
      OnKeyPress = edthanshuijiage_PcsKeyPress
    end
    object edthanshuijiage_M1: TRzDBEdit
      Left = 446
      Top = 75
      Width = 96
      Height = 21
      DataSource = dsBP06
      DataField = 'hanshuijiage_M'
      ReadOnly = True
      Color = clInfoBk
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
      ParentFont = False
      TabOrder = 14
    end
    object mmoBeiZhu: TDBMemo
      Left = 687
      Top = 60
      Width = 316
      Height = 66
      DataField = 'BeiZhu'
      DataSource = dsBP06
      ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
      TabOrder = 15
    end
    object RzDBEdit1: TRzDBEdit
      Left = 557
      Top = 50
      Width = 67
      Height = 21
      DataSource = dsBP06
      DataField = 'OrignPrice'
      ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
      TabOrder = 16
      OnKeyPress = edthanshuijiage_PcsKeyPress
    end
    object edtOrignPrice_M: TRzDBEdit
      Left = 557
      Top = 75
      Width = 67
      Height = 21
      DataSource = dsBP06
      DataField = 'OrignPrice_M'
      ReadOnly = True
      Color = clInfoBk
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
      ParentFont = False
      TabOrder = 17
    end
  end
  object cdsBP06: TClientDataSet
    Aggregates = <>
    Params = <>
    OnCalcFields = cdsBP06CalcFields
    Left = 688
    Top = 136
    object fmtbcdfldBP06yunshu_cost_calcret: TFMTBCDField
      FieldName = 'yunshu_cost_calcret'
      Precision = 18
    end
    object fmtbcdfldBP06xiaoshou_cost_calcret: TFMTBCDField
      FieldName = 'xiaoshou_cost_calcret'
      Precision = 18
    end
    object fmtbcdfldBP06caiwu_cost_calcret: TFMTBCDField
      FieldName = 'caiwu_cost_calcret'
      Precision = 18
    end
    object fmtbcdfldBP06guanli_cost_calcret: TFMTBCDField
      FieldName = 'guanli_cost_calcret'
      Precision = 18
    end
    object TFMTBCDField
      FieldName = 'AllCost_PCS'
      Precision = 18
    end
    object fmtbcdfldBP06AllCost_M: TFMTBCDField
      FieldName = 'AllCost_M'
      Precision = 18
    end
    object TFMTBCDField
      FieldName = 'maolilv_add'
      Precision = 18
      Size = 5
    end
    object fmtbcdfldBP06zengzhishui_add: TFMTBCDField
      FieldName = 'zengzhishui_add'
      Precision = 18
      Size = 5
    end
    object fmtbcdfldBP06chanpinyongfu_add: TFMTBCDField
      FieldName = 'chanpinyongtu_add'
      Precision = 18
      Size = 5
    end
    object fmtbcdfldBP06xiaoshouquyu_add: TFMTBCDField
      FieldName = 'xiaoshouquyu_add'
      Precision = 18
      Size = 5
    end
    object fmtbcdfldBP06dingdanshuliang_add: TFMTBCDField
      FieldName = 'dingdanshuliang_add'
      Precision = 18
      Size = 5
    end
    object strngfldBP06IDKey: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
    object strngfldBP06BPNO: TStringField
      FieldName = 'BPNO'
      Size = 50
    end
    object dtmfldBP06BPTime: TDateTimeField
      FieldName = 'BPTime'
    end
    object intgrfldBP06EnableDays: TIntegerField
      FieldName = 'EnableDays'
    end
    object intgrfldBP06D10_Ptr: TIntegerField
      FieldName = 'D10_Ptr'
    end
    object intgrfldBP06D25_Ptr: TIntegerField
      FieldName = 'D25_Ptr'
    end
    object fmtbcdfldBP06Thickness: TFMTBCDField
      FieldName = 'Thickness'
      Precision = 18
      Size = 5
    end
    object intgrfldBP06D01_Ptr: TIntegerField
      FieldName = 'D01_Ptr'
    end
    object fmtbcdfldBP06CurRate: TFMTBCDField
      FieldName = 'CurRate'
      Precision = 18
      Size = 5
    end
    object intgrfldBP06SaleMan: TIntegerField
      FieldName = 'SaleMan'
    end
    object intgrfldBP06CreateMan: TIntegerField
      FieldName = 'CreateMan'
    end
    object dtmfldBP06CreateTime: TDateTimeField
      FieldName = 'CreateTime'
    end
    object mfldBP06YaHeTxt: TMemoField
      FieldName = 'YaHeTxt'
      BlobType = ftMemo
    end
    object blbfldBP06YaHeImg: TBlobField
      FieldName = 'YaHeImg'
    end
    object strngfldBP06cust_code: TStringField
      FieldKind = fkLookup
      FieldName = 'cust_code'
      LookupDataSet = cdsLookup10
      LookupKeyFields = 'RKEY'
      LookupResultField = 'CUST_CODE'
      KeyFields = 'D10_Ptr'
      Lookup = True
    end
    object intgrfldBP06Seqno: TIntegerField
      FieldName = 'Seqno'
    end
    object strngfldBP06curr_name: TStringField
      FieldKind = fkLookup
      FieldName = 'curr_name'
      LookupDataSet = cdsLookUp01
      LookupKeyFields = 'RKEY'
      LookupResultField = 'CURR_NAME'
      KeyFields = 'D01_Ptr'
      Lookup = True
    end
    object strngfldBP06salemanname: TStringField
      FieldKind = fkLookup
      FieldName = 'salemanname'
      LookupDataSet = cdsLookUp05
      LookupKeyFields = 'RKEY'
      LookupResultField = 'EMPLOYEE_NAME'
      KeyFields = 'SaleMan'
      Lookup = True
    end
    object strngfldBP06manu_part_number: TStringField
      FieldKind = fkCalculated
      FieldName = 'manu_part_number'
      Calculated = True
    end
    object strngfldBP06Pricetypename: TStringField
      FieldKind = fkCalculated
      FieldName = 'Pricetypename'
      Calculated = True
    end
    object fltfldBP06curr_rate: TFloatField
      FieldKind = fkLookup
      FieldName = 'curr_rate'
      LookupDataSet = cdsLookUp01
      LookupKeyFields = 'RKEY'
      LookupResultField = 'QTE_BASE_TO_OTHER'
      KeyFields = 'D01_Ptr'
      Lookup = True
    end
    object fmtbcdfldBP06P1P2_Pcs: TFMTBCDField
      FieldName = 'P1P2_Pcs'
      Precision = 18
    end
    object fmtbcdfldBP06P3P4P5_Pcs: TFMTBCDField
      FieldName = 'P3P4P5_Pcs'
      Precision = 18
    end
    object fmtbcdfldBP06P1P2P3P4P5_Pcs: TFMTBCDField
      FieldName = 'P1P2P3P4P5_Pcs'
      Precision = 18
    end
    object fmtbcdfldBP06P1P2_M: TFMTBCDField
      FieldName = 'P1P2_M'
      Precision = 18
    end
    object fmtbcdfldBP06P3P4P5_M: TFMTBCDField
      FieldName = 'P3P4P5_M'
      Precision = 18
    end
    object fmtbcdfldBP06P1P2P3P4P5_M: TFMTBCDField
      FieldName = 'P1P2P3P4P5_M'
      Precision = 18
    end
    object cdsBP06ReadLine: TFMTBCDField
      FieldName = 'RedLine'
      Precision = 18
    end
    object fmtbcdfldBP06baofeilv: TFMTBCDField
      FieldName = 'baofeilv'
      Precision = 18
      Size = 5
    end
    object fmtbcdfldBP06xiaoshouzhekou: TFMTBCDField
      FieldName = 'xiaoshouzhekou'
      Precision = 18
      Size = 5
    end
    object fmtbcdfldBP06buhanshuijiage_Pcs: TFMTBCDField
      FieldName = 'buhanshuijiage_Pcs'
      DisplayFormat = '#0.########'
      Precision = 18
    end
    object fmtbcdfldBP06hanshuijiage_Pcs: TFMTBCDField
      FieldName = 'hanshuijiage_Pcs'
      DisplayFormat = '#0.########'
      Precision = 18
    end
    object fmtbcdfldBP06buhanshuijiage_M: TFMTBCDField
      FieldName = 'buhanshuijiage_M'
      DisplayFormat = '#0.########'
      Precision = 18
    end
    object fmtbcdfldBP06hanshuijiage_M: TFMTBCDField
      FieldName = 'hanshuijiage_M'
      DisplayFormat = '#0.########'
      Precision = 18
    end
    object strngfldBP06bp00_ptr: TStringField
      FieldName = 'bp00_ptr'
      Size = 38
    end
    object strngfldBP06ORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      Size = 50
    end
    object strngfldBP06PayMent: TStringField
      FieldName = 'PayMent'
      Size = 50
    end
    object intgrfldBP06d264_ptr: TIntegerField
      FieldName = 'd264_ptr'
    end
    object strngfldBP06ShenPiLiuCheng: TStringField
      FieldKind = fkCalculated
      FieldName = 'ShenPiLiuCheng'
      Calculated = True
    end
    object fmtbcdfldBP06baofei_cost_pcs: TFMTBCDField
      FieldName = 'baofei_cost_pcs'
      Precision = 18
    end
    object fmtbcdfldBP06baofei_cost_M: TFMTBCDField
      FieldName = 'baofei_cost_M'
      Precision = 18
    end
    object fmtbcdfldBP06yunshu_cost_pcs: TFMTBCDField
      FieldName = 'yunshu_cost_pcs'
      Precision = 18
    end
    object fmtbcdfldBP06yunshu_cost_M: TFMTBCDField
      FieldName = 'yunshu_cost_M'
      Precision = 18
    end
    object fmtbcdfldBP06xiaoshou_cost_pcs: TFMTBCDField
      FieldName = 'xiaoshou_cost_pcs'
      Precision = 18
    end
    object fmtbcdfldBP06xiaoshou_cost_M: TFMTBCDField
      FieldName = 'xiaoshou_cost_M'
      Precision = 18
    end
    object fmtbcdfldBP06caiwu_cost_pcs: TFMTBCDField
      FieldName = 'caiwu_cost_pcs'
      Precision = 18
    end
    object fmtbcdfldBP06caiwu_cost_M: TFMTBCDField
      FieldName = 'caiwu_cost_M'
      Precision = 18
    end
    object fmtbcdfldBP06guanli_cost_pcs: TFMTBCDField
      FieldName = 'guanli_cost_pcs'
      Precision = 18
    end
    object fmtbcdfldBP06guanli_cost_M: TFMTBCDField
      FieldName = 'guanli_cost_M'
      Precision = 18
    end
    object fmtbcdfldBP06zhekou_cost_pcs: TFMTBCDField
      FieldName = 'zhekou_cost_pcs'
      Precision = 18
    end
    object fmtbcdfldBP06zhekou_cost_M: TFMTBCDField
      FieldName = 'zhekou_cost_M'
      Precision = 18
    end
    object intgrfldBP06AuthStatus: TIntegerField
      FieldName = 'AuthStatus'
    end
    object fltfldBP06PAllAndBaoFei_Pcs: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PAllAndBaoFei_Pcs'
      Calculated = True
    end
    object fltfldBP06PAllAndBaoFei_M: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PAllAndBaoFei_M'
      Calculated = True
    end
    object fltfldBP06Base_1_pcs: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Base_1_pcs'
      Calculated = True
    end
    object fmtbcdfldBP06jinglilv_add: TFMTBCDField
      FieldName = 'jinglilv_add'
      Precision = 18
      Size = 5
    end
    object strngfldBP06Manu_part_desc: TStringField
      FieldName = 'Manu_part_desc'
      Size = 512
    end
    object strngfldBP06ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 512
    end
    object strngfldBP06Customer_Name: TStringField
      FieldName = 'Customer_Name'
      Size = 512
    end
    object fltfldBP06AllYuJiMaoLiLv: TFloatField
      FieldKind = fkCalculated
      FieldName = 'AllYuJiMaoLiLv'
      Calculated = True
    end
    object strngfldBP06BeiZhu: TStringField
      FieldName = 'BeiZhu'
      Size = 2048
    end
    object strngfldBP06CustomContectPeop: TStringField
      FieldName = 'CustomContectPeop'
      Size = 200
    end
    object strngfldBP06CustomContectPhone: TStringField
      FieldName = 'CustomContectPhone'
      Size = 200
    end
    object strngfldBP06CustomContectEmail: TStringField
      FieldName = 'CustomContectEmail'
      Size = 200
    end
    object strngfldBP06Rpt_GongChengFei: TStringField
      FieldName = 'Rpt_GongChengFei'
      Size = 200
    end
    object strngfldBP06Rpt_KaiLaFei: TStringField
      FieldName = 'Rpt_KaiLaFei'
      Size = 200
    end
    object strngfldBP06Rpt_MojuFei: TStringField
      FieldName = 'Rpt_MojuFei'
      Size = 200
    end
    object strngfldBP06Rpt_CeShiJiaFei: TStringField
      FieldName = 'Rpt_CeShiJiaFei'
      Size = 200
    end
    object strngfldBP06Rpt_ZuiXiaoDingDanShu: TStringField
      FieldName = 'Rpt_ZuiXiaoDingDanShu'
      Size = 200
    end
    object strngfldBP06Rpt_CeShiFei: TStringField
      FieldName = 'Rpt_CeShiFei'
      Size = 200
    end
    object strngfldBP06Rpt_ZhiBanFei: TStringField
      FieldName = 'Rpt_ZhiBanFei'
      Size = 200
    end
    object strngfldBP06Rpt_YangpinShu: TStringField
      FieldName = 'Rpt_YangpinShu'
      Size = 200
    end
    object strngfldBP06Rpt_YangpinMianji: TStringField
      FieldName = 'Rpt_YangpinMianji'
      Size = 200
    end
    object cdsBP06OrignPrice: TFMTBCDField
      FieldName = 'OrignPrice'
      Precision = 18
    end
    object cdsBP06OrignZL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'OrignZL'
      DisplayFormat = '##.###'
      Calculated = True
    end
    object fmtbcdfldBP06OrignPrice_M: TFMTBCDField
      FieldName = 'OrignPrice_M'
      Precision = 18
    end
    object cdsBP06完成板厚mm: TStringField
      FieldName = #23436#25104#26495#21402'mm'
    end
    object cdsBP06bPCSPerSet: TStringField
      FieldName = 'bPCSPerSet'
    end
    object cdsBP06bSet_L: TStringField
      FieldName = 'bSet_L'
    end
    object cdsBP06bSet_W: TStringField
      FieldName = 'bSet_W'
    end
    object cdsBP06bSurface: TStringField
      FieldName = 'bSurface'
    end
    object cdsBP06bBPType: TStringField
      FieldName = 'bBPType'
    end
    object cdsBP06bUseAge: TStringField
      FieldName = 'bUseAge'
    end
    object fmtbcdfldBP06P1_M: TFMTBCDField
      FieldName = 'P1_M'
      Precision = 8
      Size = 18
    end
    object fmtbcdfldBP06P1_Pcs: TFMTBCDField
      FieldName = 'P1_Pcs'
      Precision = 8
    end
  end
  object dsBP06: TDataSource
    DataSet = cdsBP06
    Left = 728
    Top = 136
  end
  object cdsLookup10: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp1'
    Left = 248
    Top = 448
    object strngfldLookup10CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object atncfldLookup10RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object strngfldLookup10CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
  end
  object cdsLookUp05: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp1'
    Left = 320
    Top = 448
    object atncfldLookUp05RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object strngfldLookUp05EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object strngfldLookUp05EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object cdsLookUp01: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp1'
    Left = 392
    Top = 448
    object atncfldLookUp01RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object strngfldLookUp01CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object strngfldLookUp01CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object fltfldLookUp01BASE_TO_OTHER: TFloatField
      FieldName = 'BASE_TO_OTHER'
    end
    object fltfldLookUp01QTE_BASE_TO_OTHER: TFloatField
      FieldName = 'QTE_BASE_TO_OTHER'
    end
  end
  object cdsBP10: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    IndexFieldNames = 'd278_ptr'
    Params = <>
    StoreDefs = True
    AfterPost = cdsBP10AfterPost
    AfterScroll = cdsBP10AfterScroll
    Left = 692
    Top = 192
    object strngfldBP10IDKey: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
    object strngfldBP10BP06_ptr: TStringField
      FieldName = 'BP06_ptr'
      FixedChar = True
      Size = 38
    end
    object strngfldBP10Param_Value: TStringField
      FieldName = 'Param_Value'
      Size = 255
    end
    object intgrfldBP10D278_ptr: TIntegerField
      FieldName = 'D278_ptr'
    end
    object strngfldBP10param_name: TStringField
      FieldKind = fkLookup
      FieldName = 'param_name'
      LookupDataSet = dm1.cdsLookup278
      LookupKeyFields = 'rkey'
      LookupResultField = 'PARAMETER_NAME'
      KeyFields = 'D278_ptr'
      Lookup = True
    end
    object strngfldBP10param_desc: TStringField
      FieldKind = fkLookup
      FieldName = 'param_desc'
      LookupDataSet = dm1.cdsLookup278
      LookupKeyFields = 'rkey'
      LookupResultField = 'PARAMETER_DESC'
      KeyFields = 'D278_ptr'
      Size = 0
      Lookup = True
    end
    object strngfldBP10datetype: TStringField
      FieldKind = fkLookup
      FieldName = 'datetype'
      LookupDataSet = dm1.cdsLookup278
      LookupKeyFields = 'rkey'
      LookupResultField = 'datatype'
      KeyFields = 'D278_ptr'
      Lookup = True
    end
    object intgrfldBP10ttype: TIntegerField
      FieldName = 'ttype'
    end
  end
  object dsBP10: TDataSource
    DataSet = cdsBP10
    Left = 732
    Top = 192
  end
  object pm10: TPopupMenu
    Left = 16
    Top = 280
    object mniN1: TMenuItem
      Caption = #28155#21152
      OnClick = mniN1Click
    end
    object mniN2: TMenuItem
      Caption = #32534#36753
      OnClick = mniN2Click
    end
    object mniN3: TMenuItem
      Caption = #21024#38500
      OnClick = mniN3Click
    end
  end
  object cdsBP11: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 240
    object strngfldBP11IDKey: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
    object strngfldBP11BP06_ptr: TStringField
      FieldName = 'BP06_ptr'
      FixedChar = True
      Size = 38
    end
    object fmtbcdfldBP11SheetW: TFMTBCDField
      FieldName = 'SheetW'
      Precision = 18
      Size = 5
    end
    object fmtbcdfldBP11SheetH: TFMTBCDField
      FieldName = 'SheetH'
      Precision = 18
      Size = 5
    end
    object fmtbcdfldBP11SetW_A: TFMTBCDField
      FieldName = 'SetW_A'
      Precision = 18
      Size = 5
    end
    object fmtbcdfldBP11SetH_A: TFMTBCDField
      FieldName = 'SetH_A'
      Precision = 18
      Size = 5
    end
    object intgrfldBP11PnlCount_A: TIntegerField
      FieldName = 'PnlCount_A'
    end
    object fmtbcdfldBP11PnlW_A: TFMTBCDField
      FieldName = 'PnlW_A'
      Precision = 18
      Size = 5
    end
    object fmtbcdfldBP11PnlH_A: TFMTBCDField
      FieldName = 'PnlH_A'
      Precision = 18
      Size = 5
    end
    object intgrfldBP11SetCountPerPnl_A: TIntegerField
      FieldName = 'SetCountPerPnl_A'
    end
    object fmtbcdfldBP11SetHorSapce_A: TFMTBCDField
      FieldName = 'SetHorSapce_A'
      Precision = 18
      Size = 5
    end
    object fmtbcdfldBP11SetVerSapce_A: TFMTBCDField
      FieldName = 'SetVerSapce_A'
      Precision = 18
      Size = 5
    end
    object fmtbcdfldBP11PnlLeftRightBorderW_A: TFMTBCDField
      FieldName = 'PnlLeftRightBorderW_A'
      Precision = 18
      Size = 5
    end
    object fmtbcdfldBP11PnlTopBottomBorderW_A: TFMTBCDField
      FieldName = 'PnlTopBottomBorderW_A'
      Precision = 18
      Size = 5
    end
    object fmtbcdfldBP11SheetUseage: TFMTBCDField
      FieldName = 'SheetUseage'
      Precision = 18
      Size = 5
    end
    object intgrfldBP11PnlCount_B: TIntegerField
      FieldName = 'PnlCount_B'
    end
    object fmtbcdfldBP11PnlW_B: TFMTBCDField
      FieldName = 'PnlW_B'
      Precision = 18
      Size = 5
    end
    object fmtbcdfldBP11PnlH_B: TFMTBCDField
      FieldName = 'PnlH_B'
      Precision = 18
      Size = 5
    end
    object intgrfldBP11SetCountPerPnl_B: TIntegerField
      FieldName = 'SetCountPerPnl_B'
    end
    object fmtbcdfldBP11PnlLeftRightBorderW_B: TFMTBCDField
      FieldName = 'PnlLeftRightBorderW_B'
      Precision = 18
      Size = 5
    end
    object fmtbcdfldBP11PnlTopBottomBorderW_B: TFMTBCDField
      FieldName = 'PnlTopBottomBorderW_B'
      Precision = 18
      Size = 5
    end
    object blbfldBP11SheetImg: TBlobField
      FieldName = 'SheetImg'
    end
    object blbfldBP11PnlAImg: TBlobField
      FieldName = 'PnlAImg'
    end
    object blbfldBP11PnlBImg: TBlobField
      FieldName = 'PnlBImg'
    end
  end
  object dsBP11: TDataSource
    DataSet = cdsBP11
    Left = 56
    Top = 240
  end
  object cdsBP07: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterScroll = cdsBP07AfterScroll
    Left = 80
    Top = 297
    object strngfldBP07IDKey: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
    object intgrfldBP07D34_ptr: TIntegerField
      FieldName = 'D34_ptr'
    end
    object strngfldBP07BP06_ptr: TStringField
      FieldName = 'BP06_ptr'
      FixedChar = True
      Size = 38
    end
    object intgrfldBP07BeiShu: TIntegerField
      FieldName = 'BeiShu'
    end
    object intgrfldBP07Selforder: TIntegerField
      FieldName = 'Selforder'
    end
    object strngfldBP07dept_code: TStringField
      FieldKind = fkLookup
      FieldName = 'dept_code'
      LookupDataSet = dm1.cdslookup34
      LookupKeyFields = 'RKEY'
      LookupResultField = 'DEPT_CODE'
      KeyFields = 'D34_ptr'
      Lookup = True
    end
    object strngfldBP07dept_name: TStringField
      FieldKind = fkLookup
      FieldName = 'dept_name'
      LookupDataSet = dm1.cdslookup34
      LookupKeyFields = 'RKEY'
      LookupResultField = 'DEPT_NAME'
      KeyFields = 'D34_ptr'
      Lookup = True
    end
    object fmtbcdfldBP07P1: TFMTBCDField
      FieldName = 'P1'
      Precision = 18
    end
    object fmtbcdfldBP07P2: TFMTBCDField
      FieldName = 'P2'
      Precision = 18
    end
    object fmtbcdfldBP07P3: TFMTBCDField
      FieldName = 'P3'
      Precision = 18
    end
    object fmtbcdfldBP07P4: TFMTBCDField
      FieldName = 'P4'
      Precision = 18
    end
    object fmtbcdfldBP07P5: TFMTBCDField
      FieldName = 'P5'
      Precision = 18
    end
    object strngfldBP07P2CalcStr: TStringField
      FieldName = 'P2CalcStr'
      Size = 1024
    end
    object strngfldBP07P3CalcStr: TStringField
      FieldName = 'P3CalcStr'
      Size = 1024
    end
    object strngfldBP07P4CalcStr: TStringField
      FieldName = 'P4CalcStr'
      Size = 1024
    end
    object strngfldBP07P5CalcStr: TStringField
      FieldName = 'P5CalcStr'
      Size = 1024
    end
    object fmtbcdfldBP07AllP: TFMTBCDField
      FieldName = 'AllP'
      Precision = 18
      Size = 5
    end
    object fmtbcdfldBP07zhekou_cost_pcs: TFMTBCDField
      FieldName = 'AllP_M'
      Precision = 18
    end
  end
  object dsBP07: TDataSource
    DataSet = cdsBP07
    Left = 128
    Top = 297
  end
  object pmbp07: TPopupMenu
    OnPopup = pmbp07Popup
    Left = 16
    Top = 328
    object mniN4: TMenuItem
      Caption = #26032#22686
      OnClick = mniN4Click
    end
    object mniN7: TMenuItem
      Caption = #25554#20837
      OnClick = mniN7Click
    end
    object mniN6: TMenuItem
      Caption = #21024#38500
      OnClick = mniN6Click
    end
  end
  object cdsBP08: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'IDKey'
        Attributes = [faFixed]
        DataType = ftString
        Size = 38
      end
      item
        Name = 'BP06_ptr'
        Attributes = [faFixed]
        DataType = ftString
        Size = 38
      end
      item
        Name = 'BP07_ptr'
        Attributes = [faFixed]
        DataType = ftString
        Size = 38
      end
      item
        Name = 'D34_ptr'
        DataType = ftInteger
      end
      item
        Name = 'D496_ptr'
        DataType = ftInteger
      end
      item
        Name = 'D17_ptr'
        DataType = ftInteger
      end
      item
        Name = 'selforder'
        DataType = ftInteger
      end
      item
        Name = 'MUsePerPcs'
        DataType = ftFMTBcd
        Precision = 18
        Size = 5
      end
      item
        Name = 'MUsePrice'
        DataType = ftFMTBcd
        Precision = 18
        Size = 5
      end
      item
        Name = 'MStdPrice'
        DataType = ftFMTBcd
        Precision = 18
        Size = 5
      end
      item
        Name = 'calcstr'
        DataType = ftString
        Size = 1024
      end>
    IndexDefs = <>
    IndexFieldNames = 'step_number;selforder;d496_ptr'
    Params = <>
    StoreDefs = True
    OnCalcFields = cdsBP08CalcFields
    Left = 80
    Top = 353
    object strngfldBP08IDKey: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
    object strngfldBP08BP06_ptr: TStringField
      FieldName = 'BP06_ptr'
      FixedChar = True
      Size = 38
    end
    object strngfldBP08BP07_ptr: TStringField
      FieldName = 'BP07_ptr'
      FixedChar = True
      Size = 38
    end
    object intgrfldBP08D496_ptr: TIntegerField
      FieldName = 'D496_ptr'
    end
    object intgrfldBP08D17_ptr: TIntegerField
      FieldName = 'D17_ptr'
    end
    object strngfldBP08calcstr: TStringField
      FieldName = 'calcstr'
      Size = 1024
    end
    object strngfldBP08MGroupname: TStringField
      FieldKind = fkLookup
      FieldName = 'MGroupname'
      LookupDataSet = dm1.cdslookup496
      LookupKeyFields = 'rkey'
      LookupResultField = 'GROUP_NAME'
      KeyFields = 'D496_ptr'
      Lookup = True
    end
    object strngfldBP08MGroupDesc: TStringField
      FieldKind = fkLookup
      FieldName = 'MGroupDesc'
      LookupDataSet = dm1.cdslookup496
      LookupKeyFields = 'rkey'
      LookupResultField = 'GROUP_DESC'
      KeyFields = 'D496_ptr'
      Lookup = True
    end
    object strngfldBP08MName: TStringField
      FieldKind = fkCalculated
      FieldName = 'MName'
      Size = 512
      Calculated = True
    end
    object intgrfldBP08D34_ptr: TIntegerField
      FieldName = 'D34_ptr'
    end
    object strngfldBP08dept_code: TStringField
      FieldKind = fkLookup
      FieldName = 'dept_code'
      LookupDataSet = dm1.cdslookup34
      LookupKeyFields = 'RKEY'
      LookupResultField = 'DEPT_CODE'
      KeyFields = 'D34_ptr'
      Lookup = True
    end
    object strngfldBP08dept_name: TStringField
      FieldKind = fkLookup
      FieldName = 'dept_name'
      LookupDataSet = dm1.cdslookup34
      LookupKeyFields = 'RKEY'
      LookupResultField = 'DEPT_NAME'
      KeyFields = 'D34_ptr'
      Lookup = True
    end
    object intgrfldBP08selforder: TIntegerField
      FieldName = 'selforder'
    end
    object fmtbcdfldBP08MUsePerPcs: TFMTBCDField
      FieldName = 'MUsePerPcs'
      Precision = 18
      Size = 10
    end
    object cdsBP08zhekou_cost_pcs: TFMTBCDField
      FieldName = 'MUsePrice_M'
      Precision = 18
    end
    object fmtbcdfldBP08MUsePrice: TFMTBCDField
      FieldName = 'MUsePrice'
      Precision = 18
      Size = 10
    end
    object fmtbcdfldBP08MStdPrice: TFMTBCDField
      FieldName = 'MStdPrice'
      Precision = 18
      Size = 10
    end
    object intgrfldBP08beishu: TIntegerField
      FieldName = 'beishu'
    end
    object intgrfldBP08d28_ptr: TIntegerField
      FieldName = 'd28_ptr'
    end
    object intgrfldBP08step_number: TIntegerField
      FieldName = 'step_number'
    end
    object strngfldBP08INV_PART_NUMBER: TStringField
      FieldKind = fkCalculated
      FieldName = 'INV_PART_NUMBER'
      Size = 100
      Calculated = True
    end
    object strngfldBP08SUPPLIER_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'SUPPLIER_NAME'
      Calculated = True
    end
    object fltfldBP08PRICE_1: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PRICE_1'
      Calculated = True
    end
    object dtmfldBP08TDATE: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'TDATE'
      Calculated = True
    end
  end
  object dsBP08: TDataSource
    DataSet = cdsBP08
    Left = 128
    Top = 353
  end
  object opdg1: TOpenDialog
    Left = 16
    Top = 440
  end
  object pmbp08: TPopupMenu
    OnPopup = pmbp08Popup
    Left = 16
    Top = 376
    object mniN5: TMenuItem
      Caption = #21024#38500
      OnClick = mniN5Click
    end
  end
  object cdsBP10_Sale: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = cdsBP10_SaleAfterScroll
    Left = 56
    Top = 496
    object strngfldBP10_SaleIDKey: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
    object strngfldBP10_SaleBP06_ptr: TStringField
      FieldName = 'BP06_ptr'
      FixedChar = True
      Size = 38
    end
    object strngfldBP10_SaleParam_Value: TStringField
      FieldName = 'Param_Value'
      Size = 255
    end
    object intgrfldBP10_SaleD278_ptr: TIntegerField
      FieldName = 'D278_ptr'
    end
    object strngfldBP10_Saleparam_name: TStringField
      FieldKind = fkLookup
      FieldName = 'param_name'
      LookupDataSet = dm1.cdsLookup278
      LookupKeyFields = 'rkey'
      LookupResultField = 'PARAMETER_NAME'
      KeyFields = 'D278_ptr'
      Lookup = True
    end
    object strngfldBP10_Saleparam_desc: TStringField
      FieldKind = fkLookup
      FieldName = 'param_desc'
      LookupDataSet = dm1.cdsLookup278
      LookupKeyFields = 'rkey'
      LookupResultField = 'PARAMETER_DESC'
      KeyFields = 'D278_ptr'
      Size = 0
      Lookup = True
    end
    object strngfldBP10_Saledatetype: TStringField
      FieldKind = fkLookup
      FieldName = 'datetype'
      LookupDataSet = dm1.cdsLookup278
      LookupKeyFields = 'rkey'
      LookupResultField = 'datatype'
      KeyFields = 'D278_ptr'
      Lookup = True
    end
    object intgrfldBP10_Salettype: TIntegerField
      FieldName = 'ttype'
    end
  end
  object dsBP10_Sale: TDataSource
    DataSet = cdsBP10_Sale
    Left = 128
    Top = 496
  end
  object cdsAllBomDept: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = cdsAllBomDeptAfterScroll
    Left = 568
    Top = 200
    object strngfldAllBomDeptIDKey: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
    object intgrfldAllBomDeptD34_ptr: TIntegerField
      FieldName = 'D34_ptr'
    end
    object strngfldAllBomDeptBP06_ptr: TStringField
      FieldName = 'BP06_ptr'
      FixedChar = True
      Size = 38
    end
    object intgrfldAllBomDeptBeiShu: TIntegerField
      FieldName = 'BeiShu'
    end
    object intgrfldAllBomDeptSelforder: TIntegerField
      FieldName = 'Selforder'
    end
    object strngfldAllBomDeptdept_code: TStringField
      FieldKind = fkLookup
      FieldName = 'dept_code'
      LookupDataSet = dm1.cdslookup34
      LookupKeyFields = 'RKEY'
      LookupResultField = 'DEPT_CODE'
      KeyFields = 'D34_ptr'
      Lookup = True
    end
    object strngfldAllBomDeptdept_name: TStringField
      FieldKind = fkLookup
      FieldName = 'dept_name'
      LookupDataSet = dm1.cdslookup34
      LookupKeyFields = 'RKEY'
      LookupResultField = 'DEPT_NAME'
      KeyFields = 'D34_ptr'
      Lookup = True
    end
  end
  object dsAllBomDept: TDataSource
    DataSet = cdsAllBomDept
    Left = 520
    Top = 200
  end
  object cdsBP09: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'BP07_ptr'
    Params = <>
    AfterPost = cdsBP09AfterPost
    AfterScroll = cdsBP09AfterScroll
    OnCalcFields = cdsBP09CalcFields
    Left = 688
    Top = 257
    object strngfld1: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
    object strngfld2: TStringField
      FieldName = 'BP06_ptr'
      FixedChar = True
      Size = 38
    end
    object strngfld3: TStringField
      FieldName = 'BP07_ptr'
      FixedChar = True
      Size = 38
    end
    object intgrfld1: TIntegerField
      FieldName = 'D278_ptr'
    end
    object strngfld4: TStringField
      FieldName = 'Param_Value'
      Size = 255
    end
    object strngfld5: TStringField
      FieldKind = fkLookup
      FieldName = 'param_code'
      LookupDataSet = dm1.cdsLookup278
      LookupKeyFields = 'rkey'
      LookupResultField = 'PARAMETER_NAME'
      KeyFields = 'D278_ptr'
      Lookup = True
    end
    object strngfld6: TStringField
      FieldKind = fkLookup
      FieldName = 'param_desc'
      LookupDataSet = dm1.cdsLookup278
      LookupKeyFields = 'rkey'
      LookupResultField = 'PARAMETER_DESC'
      KeyFields = 'D278_ptr'
      Lookup = True
    end
    object strngfld7: TStringField
      FieldKind = fkLookup
      FieldName = 'datatype'
      LookupDataSet = dm1.cdsLookup278
      LookupKeyFields = 'rkey'
      LookupResultField = 'datatype'
      KeyFields = 'D278_ptr'
      Lookup = True
    end
    object intgrfldBP09d34_ptr: TIntegerField
      FieldName = 'd34_ptr'
    end
    object strngfldBP09dept_name: TStringField
      FieldKind = fkLookup
      FieldName = 'dept_name'
      LookupDataSet = dm1.cdslookup34
      LookupKeyFields = 'RKEY'
      LookupResultField = 'DEPT_NAME'
      KeyFields = 'd34_ptr'
      Size = 100
      Lookup = True
    end
    object cdsBP09Color: TStringField
      FieldKind = fkCalculated
      FieldName = 'Color'
      Calculated = True
    end
  end
  object dsBP09: TDataSource
    DataSet = cdsBP09
    Left = 736
    Top = 256
  end
  object cdsD29: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 688
    Top = 320
  end
  object dsD29: TDataSource
    DataSet = cdsD29
    Left = 736
    Top = 328
  end
  object updtsql1: TUpdateSQL
    DeleteSQL.Strings = (
      ''
      'SELECT  '
      #9'CASE '
      #9#9'WHEN '
      #9#9#9'd28.CURRENCY_PTR = 1 '
      #9#9'THEN'
      #9#9#9'CASE'
      #9#9#9#9'WHEN '
      #9#9#9#9#9'd28.tax_flag = '#39'Y'#39
      #9#9#9#9'THEN'
      #9#9#9#9#9'd28.PRICE_1 / (d28.TAX_2 /100 + 1.0) '
      #9#9#9#9'ELSE'
      #9#9#9#9#9'd28.PRICE_1'
      #9#9#9'END'
      #9#9'ELSE'
      #9#9#9'CASE'
      #9#9#9#9'WHEN '
      #9#9#9#9#9'd28.tax_flag = '#39'Y'#39
      #9#9#9#9'THEN'
      #9#9#9#9#9'(d28.PRICE_1 * d01.BASE_TO_OTHER) / (d28.TAX_2 /100 + 1.0) '
      #9#9#9#9'ELSE'
      #9#9#9#9#9'd28.PRICE_1 * d01.BASE_TO_OTHER'
      #9#9#9'END'
      #9#9'END AS PRICE_1'
      'FROM '
      #9'Data0028 d28'
      #9'INNER JOIN Data0001 d01 ON d01.RKEY = d28.CURRENCY_PTR')
    Left = 352
    Top = 320
  end
end
