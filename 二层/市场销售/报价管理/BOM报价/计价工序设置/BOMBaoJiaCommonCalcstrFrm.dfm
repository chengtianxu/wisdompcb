object frmBOMBaoJiaCommonCalcstr: TfrmBOMBaoJiaCommonCalcstr
  Left = 0
  Top = 0
  Caption = 'BOM'#25253#20215#20844#29992#20844#24335#35774#32622
  ClientHeight = 413
  ClientWidth = 744
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 744
    Height = 34
    Align = alTop
    TabOrder = 0
    object btn1: TBitBtn
      Left = 0
      Top = 2
      Width = 57
      Height = 30
      Hint = #36864#20986#31995#32479
      Caption = #20445#23384
      Default = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btn1Click
    end
    object btn2: TBitBtn
      Left = 57
      Top = 2
      Width = 57
      Height = 30
      Hint = #21047#26032#24403#21069#25968#25454
      Caption = #36864#20986
      Kind = bkClose
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btn2Click
    end
  end
  object pnl2: TRzPanel
    Left = 0
    Top = 34
    Width = 744
    Height = 379
    Align = alClient
    TabOrder = 1
    object pg1: TRzPageControl
      Left = 2
      Top = 2
      Width = 740
      Height = 375
      Hint = ''
      ActivePage = tsTabSheet4
      Align = alClient
      TabIndex = 4
      TabOrder = 0
      FixedDimension = 19
      object tsTabSheet1: TRzTabSheet
        Caption = #25104#26412#31867#20844#24335
        object lbl1: TRzLabel
          Left = 29
          Top = 60
          Width = 48
          Height = 13
          Caption = #25253#24223#29575#65306
        end
        object lbl2: TRzLabel
          Left = 29
          Top = 90
          Width = 60
          Height = 13
          Caption = #36816#36755#25104#26412#65306
        end
        object lbl3: TRzLabel
          Left = 29
          Top = 120
          Width = 60
          Height = 13
          Caption = #38144#21806#25104#26412#65306
        end
        object lbl4: TRzLabel
          Left = 29
          Top = 150
          Width = 60
          Height = 13
          Caption = #36130#21153#25104#26412#65306
        end
        object lbl5: TRzLabel
          Left = 29
          Top = 213
          Width = 60
          Height = 13
          Caption = #38144#21806#25240#25187#65306
        end
        object lbl6: TRzLabel
          Left = 104
          Top = 24
          Width = 115
          Height = 13
          Caption = #20844#24335#32467#26524#22343#20026'PCS'#21333#20301
        end
        object lbl7: TRzLabel
          Left = 28
          Top = 180
          Width = 60
          Height = 13
          Caption = #31649#29702#25104#26412#65306
        end
        object edtbaofeilv_calcstr: TRzDBEdit
          Left = 94
          Top = 57
          Width = 630
          Height = 21
          DataSource = dsBP16
          DataField = 'baofeilv_calcstr'
          ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
          TabOrder = 0
        end
        object edtyunshu_cost_calcstr: TRzDBEdit
          Left = 94
          Top = 87
          Width = 630
          Height = 21
          DataSource = dsBP16
          DataField = 'yunshu_cost_calcstr'
          ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
          TabOrder = 1
        end
        object edtxiaoshou_cost_calcstr: TRzDBEdit
          Left = 94
          Top = 117
          Width = 630
          Height = 21
          DataSource = dsBP16
          DataField = 'xiaoshou_cost_calcstr'
          ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
          TabOrder = 2
        end
        object edtcaiwu_cost_calcstr: TRzDBEdit
          Left = 94
          Top = 147
          Width = 630
          Height = 21
          DataSource = dsBP16
          DataField = 'caiwu_cost_calcstr'
          ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
          TabOrder = 3
        end
        object edtguanli_cost_calcstr: TRzDBEdit
          Left = 94
          Top = 177
          Width = 630
          Height = 21
          DataSource = dsBP16
          DataField = 'guanli_cost_calcstr'
          ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
          TabOrder = 4
        end
        object edtguanli_cost_calcstr1: TRzDBEdit
          Left = 94
          Top = 210
          Width = 630
          Height = 21
          DataSource = dsBP16
          DataField = 'xiaoshouzhekou_calcstr'
          ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
          TabOrder = 5
        end
      end
      object tsTabSheet2: TRzTabSheet
        Caption = #38144#21806#21152#25104#31867
        object lbl8: TRzLabel
          Left = 37
          Top = 68
          Width = 48
          Height = 13
          Caption = #27611#21033#29575#65306
        end
        object lbl9: TRzLabel
          Left = 37
          Top = 98
          Width = 48
          Height = 13
          Caption = #22686#20540#31246#65306
        end
        object lbl10: TRzLabel
          Left = 37
          Top = 128
          Width = 60
          Height = 13
          Caption = #20135#21697#29992#36884#65306
        end
        object lbl11: TRzLabel
          Left = 37
          Top = 158
          Width = 60
          Height = 13
          Caption = #38144#21806#21306#22495#65306
        end
        object lbl13: TRzLabel
          Left = 112
          Top = 32
          Width = 115
          Height = 13
          Caption = #20844#24335#32467#26524#22343#20026'PCS'#21333#20301
        end
        object lbl14: TRzLabel
          Left = 36
          Top = 188
          Width = 60
          Height = 13
          Caption = #35746#21333#25968#37327#65306
        end
        object edtbaofeilv_calcstr1: TRzDBEdit
          Left = 102
          Top = 65
          Width = 630
          Height = 21
          DataSource = dsBP16
          DataField = 'maolilv_add_calcstr'
          ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
          TabOrder = 0
        end
        object edtyunshu_cost_calcstr1: TRzDBEdit
          Left = 102
          Top = 95
          Width = 630
          Height = 21
          DataSource = dsBP16
          DataField = 'zengzhishui_add_calcstr'
          ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
          TabOrder = 1
        end
        object edtxiaoshou_cost_calcstr1: TRzDBEdit
          Left = 102
          Top = 125
          Width = 630
          Height = 21
          DataSource = dsBP16
          DataField = 'chanpinyongtu_add_calcstr'
          ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
          TabOrder = 2
        end
        object edtcaiwu_cost_calcstr1: TRzDBEdit
          Left = 102
          Top = 155
          Width = 630
          Height = 21
          DataSource = dsBP16
          DataField = 'xiaoshouquyu_add_calcstr'
          ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
          TabOrder = 3
        end
        object edtguanli_cost_calcstr2: TRzDBEdit
          Left = 102
          Top = 185
          Width = 630
          Height = 21
          DataSource = dsBP16
          DataField = 'dingdanshuliang_add_calcstr'
          ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
          TabOrder = 4
        end
      end
      object tsTabSheet3: TRzTabSheet
        Caption = #25253#34920#31867#20844#24335
        object grp2: TGroupBox
          Left = 7
          Top = 3
          Width = 714
          Height = 153
          Caption = #25209#37327
          TabOrder = 0
          object lbl33: TRzLabel
            Left = 18
            Top = 28
            Width = 48
            Height = 13
            Caption = #24320#25289#36153#65306
            Transparent = True
          end
          object lbl36: TRzLabel
            Left = 19
            Top = 58
            Width = 48
            Height = 13
            Caption = #27169#20855#36153#65306
            Transparent = True
          end
          object lbl45: TRzLabel
            Left = 19
            Top = 88
            Width = 60
            Height = 13
            Caption = #27979#35797#26550#36153#65306
            Transparent = True
          end
          object lbl46: TRzLabel
            Left = 19
            Top = 118
            Width = 72
            Height = 13
            Caption = #26368#23567#35746#21333#25968#65306
            Transparent = True
          end
          object edtManu_part_desc2: TRzDBEdit
            Left = 83
            Top = 25
            Width = 600
            Height = 21
            DataSource = dsBP16
            DataField = 'Rpt_KaiLaFei_calcstr'
            ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
            TabOrder = 0
          end
          object edtManu_part_desc3: TRzDBEdit
            Left = 83
            Top = 55
            Width = 600
            Height = 21
            DataSource = dsBP16
            DataField = 'Rpt_MojuFei_calcstr'
            ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
            TabOrder = 1
          end
          object edtManu_part_desc4: TRzDBEdit
            Left = 83
            Top = 85
            Width = 600
            Height = 21
            DataSource = dsBP16
            DataField = 'Rpt_CeShiJiaFei_calcstr'
            ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
            TabOrder = 2
          end
          object edtManu_part_desc5: TRzDBEdit
            Left = 99
            Top = 115
            Width = 600
            Height = 21
            DataSource = dsBP16
            DataField = 'Rpt_ZuiXiaoDingDanShu_calcstr'
            ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
            TabOrder = 3
          end
        end
        object grp1: TGroupBox
          Left = 3
          Top = 162
          Width = 718
          Height = 153
          Caption = #26679#21697
          TabOrder = 1
          object lbl32: TRzLabel
            Left = 15
            Top = 22
            Width = 48
            Height = 13
            Caption = #24037#31243#36153#65306
            Transparent = True
          end
          object lbl51: TRzLabel
            Left = 15
            Top = 49
            Width = 48
            Height = 13
            Caption = #21046#26495#36153#65306
            Transparent = True
          end
          object lbl52: TRzLabel
            Left = 15
            Top = 76
            Width = 48
            Height = 13
            Caption = #27979#35797#36153#65306
            Transparent = True
          end
          object lbl55: TRzLabel
            Left = 15
            Top = 103
            Width = 48
            Height = 13
            Caption = #26679#21697#25968#65306
            Transparent = True
          end
          object lbl56: TRzLabel
            Left = 15
            Top = 128
            Width = 36
            Height = 13
            Caption = #38754#31215#65306
            Transparent = True
          end
          object edtManu_part_desc1: TRzDBEdit
            Left = 72
            Top = 19
            Width = 600
            Height = 21
            DataSource = dsBP16
            DataField = 'Rpt_GongChengFei_calcstr'
            ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
            TabOrder = 0
          end
          object edtRpt_GongChengFei: TRzDBEdit
            Left = 72
            Top = 46
            Width = 600
            Height = 21
            DataSource = dsBP16
            DataField = 'Rpt_ZhiBanFei_calcstr'
            ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
            TabOrder = 1
          end
          object edtRpt_GongChengFei1: TRzDBEdit
            Left = 72
            Top = 73
            Width = 600
            Height = 21
            DataSource = dsBP16
            DataField = 'Rpt_CeShiFei_calcstr'
            ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
            TabOrder = 2
          end
          object edtRpt_CeShiFei: TRzDBEdit
            Left = 72
            Top = 100
            Width = 600
            Height = 21
            DataSource = dsBP16
            DataField = 'Rpt_YangpinShu_calcstr'
            ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
            TabOrder = 3
          end
          object edtRpt_CeShiFei1: TRzDBEdit
            Left = 72
            Top = 125
            Width = 600
            Height = 21
            DataSource = dsBP16
            DataField = 'Rpt_YangpinMianji_calcstr'
            ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
            TabOrder = 4
          end
        end
      end
      object pgTabSheet1: TRzTabSheet
        Caption = #33050#26412
        object pnl3: TPanel
          Left = 0
          Top = 248
          Width = 736
          Height = 104
          Align = alBottom
          TabOrder = 0
          object lbl12: TLabel
            Left = 1
            Top = 1
            Width = 734
            Height = 13
            Align = alTop
            Caption = #33050#26412':'
            ExplicitWidth = 28
          end
          object dbmmoSqlText: TDBMemo
            Left = 1
            Top = 14
            Width = 734
            Height = 89
            Align = alClient
            DataField = 'SqlText'
            DataSource = dsSql
            ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
            TabOrder = 0
          end
        end
        object dbgrd1: TDBGrid
          Left = 0
          Top = 0
          Width = 736
          Height = 248
          Align = alClient
          DataSource = dsSql
          ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'SqlName'
              Title.Caption = #21517#31216
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SqlText'
              Title.Caption = #33050#26412
              Width = 300
              Visible = True
            end>
        end
      end
      object tsTabSheet4: TRzTabSheet
        Caption = #32418#32447#20215#26684
        object lbl15: TLabel
          Left = 0
          Top = 0
          Width = 736
          Height = 15
          Align = alTop
          Caption = #32418#32447#20215#26684
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #40657#20307
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 64
        end
        object dbmmoreadline: TDBMemo
          Left = 0
          Top = 15
          Width = 736
          Height = 337
          Align = alClient
          DataField = 'redline'
          DataSource = dsBP16
          ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
          TabOrder = 0
        end
      end
    end
  end
  object cdsBP16: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 352
    Top = 24
  end
  object dsBP16: TDataSource
    DataSet = cdsBP16
    Left = 416
    Top = 24
  end
  object cdsSql: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 360
    Top = 104
    object strngfldSqlSqlName: TStringField
      FieldName = 'SqlName'
      Size = 100
    end
    object strngfldSqlSqlText: TStringField
      FieldName = 'SqlText'
      Size = 2048
    end
  end
  object dsSql: TDataSource
    DataSet = cdsSql
    Left = 424
    Top = 104
  end
end
