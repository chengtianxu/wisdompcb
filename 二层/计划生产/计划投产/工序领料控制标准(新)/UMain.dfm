object FrmMain: TFrmMain
  Left = 329
  Top = 53
  Width = 1194
  Height = 716
  Caption = #24037#24207#26448#26009#28040#32791#26631#20934
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 1186
    Height = 685
    Align = alClient
    TabOrder = 0
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 1184
      Height = 683
      Align = alClient
      TabOrder = 0
      object pnl2: TPanel
        Left = 1
        Top = 1
        Width = 1182
        Height = 41
        Align = alTop
        TabOrder = 0
        object lbl_field: TLabel
          Left = 441
          Top = 19
          Width = 52
          Height = 13
          Alignment = taRightJustify
          Caption = #26631#20934#20195#30721
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object btn_quit: TBitBtn
          Left = 6
          Top = 3
          Width = 57
          Height = 27
          Hint = #36864#20986#31995#32479
          Caption = #36864#20986
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = btn_quitClick
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
            F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
            000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
            338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
            45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
            3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
            F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
            000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
            338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
            4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
            8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
            333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
            0000}
          NumGlyphs = 2
        end
        object btn_refresh: TBitBtn
          Left = 63
          Top = 3
          Width = 57
          Height = 27
          Hint = #21047#26032#24403#21069#25968#25454
          Caption = #21047#26032
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btn_refreshClick
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000120B0000120B00001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
            DADABFBFBDADADADADADDADADBFADADADADAADADAD000DADADADDADAD0FBF0DA
            DADAADAD0F7FBF0DADADDAD0F7F87BF0DADAAD0F7F87BFB70DADD0F7F87BFB78
            80DA000F87BFB78880ADDAD00BFB78880ADAADADA0B7888740ADDADADA088804
            440AADADADA000A04440DADADADADADA0440ADADADADADADA00D}
        end
        object btn_export: TBitBtn
          Left = 182
          Top = 3
          Width = 57
          Height = 28
          Hint = #23548#20986#25968#25454#21040'Excel'
          Caption = #23548#20986
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = btn_exportClick
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000120B0000120B00001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
            DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
            EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
            DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
            70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
        end
        object btn_qry: TBitBtn
          Left = 240
          Top = 3
          Width = 57
          Height = 28
          Hint = #37325#26032#23450#20041#26597#35810#26465#20214
          Caption = #26597#35810
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = btn_qryClick
          Glyph.Data = {
            C6050000424DC605000000000000360400002800000014000000140000000100
            08000000000090010000C40E0000C40E0000000100000000000000000000E8E0
            0000D0A000006060600038383800F0700000B8B8C00020202000A8B0B000F0F0
            F800B8400000C0600800A0A0A000E0E0E800D8D8E000B8100000D0D8D800C0A0
            8800B8300000F8F8080098989800B0504000B0908800B8706000E0A86000E0D8
            C000F070380088888800F0D8B0005858580008101000E0D0B000B8504000E8C8
            A000F0B85000E8D8A800C8C8C800D8982000D8C0B00050505000C8803800F0C8
            8800F8500800D8A040007078780008080800E8C0880028283000F8980000E8F0
            F00040404000B0B8B800B8A0A000C0682800E0A87800F0800000C8D0D000C898
            8000E0A88000D8904800E0E0E000F0A0000070707000E0783000B0888800E8D0
            6800C8B8A800C8700800D8885000B850180028282000B8887800F0F0D8001818
            1800F070180090909000D8C05800E8B09800F8F0E000F8F0F00048484800B8C0
            C800F0C06000F8F8F800F8805800F8F0C80080808000B8906000B0B0B000D090
            5000F8600000D8D0C800E0A05800B8585800B8B00000B8481000D0D0B000D078
            3000C0702000F0A86800C0602000E8E8E800A8A8A800F0C0B800B0201000F0A8
            4000E0B89000B8B8B80068686800F0F0E800F0982000D8D0A800E8C88000F0E0
            C000B8380800F0800800D8E0E000C0C0C000F0680800B0B0B800C0601800E0B8
            7800F0981000C8781800C0C8C80010101800C8A09000E0B8600030303000F0F0
            F000C0B8B80028282800E8E0E000F0F8F8003838400078787800F0D8B800D8C8
            B800F0C89000E0E8E800B8601000D0883800F8680800D8D0B800E8D08800C8C8
            D000D0D0D000B8B0B00058586000D8D8D8002820200010101000E8E8F000F8F8
            F000D8D0D000B8786000B8480000F0780000F0880000E0B08000B8C0C000B818
            0000C0A88800B8300800B0504800F0E0B000E8D0B000F0D08800F8501000F880
            0800ECFD7F0002000000000000001300E8000100000001000A0000884000F877
            78004B1B00000100000000998400E6775400F71200000101010001D8F8001200
            450090FB7700801FF80077FFFF00FFFF6000F8120000AD84E6007760F8001200
            D80084E677000000000000FFFF0000003800A8F8000038A8F800001800000000
            00000000000044F8120000400000000000000000000028F81200000000000000
            00000000000000000000000C000000000200000000000101120000872B00F877
            0000ECFD7F00000000000002000000006C00001A0200804B1B00007FFF00FFFF
            000000000000804B1B00000500000000870031E6770084F8120000218600E677
            9800F81200006713000010FFFF00000020000100000038A8F800000000000000
            7000F8120000ACF8120000D8F8001200100030001000F8400000105F5400E677
            200001000000D0F8120000D8F80012000800000000000E0000005331B2861D86
            1D861D861D861DF81DC57431F62C9824801414572C572C6C2C6C6C1D6C6C77B2
            6CB2B26C2CDF1232DF6C6CF86CF86C861D1B006C1D0E94530E8A6E8A24240E24
            24240E6F6CB294800E531D31550E4C245524242424515551B26C322453318655
            248A0E557780000086576C002CB20E5398536C31305A55F8CC1424511486B2F3
            1D802453535386534C229457536F066F06242CB2806C065353551D5353511D53
            638C12152477248680F8245353318653531D7755358D35121B57066FF66C2453
            98536C535380240EAA6F631557123551B26C24535353945353B2065398554D35
            776F0624C56C065353551D53536C6F53535355246F152451806C245353319453
            532480535353246F7E8D531D946C245398536C53535314F85353AA2453531480
            576C245353532C5353555314C557776F14002C246C5706535355575353315353
            551B6CF857146E146C2C24535331866C775353555353535353225A35C5B20653
            9853570E57535353535353535353AA08143153315353986C866C2C6C6C1D941D
            861D8680775398535355}
        end
        object edt_value: TEdit
          Left = 502
          Top = 15
          Width = 121
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnChange = edt_valueChange
        end
        object btn_import: TButton
          Left = 122
          Top = 4
          Width = 58
          Height = 25
          Caption = #23548#20837
          TabOrder = 5
          OnClick = btn_importClick
        end
      end
      object pnl3: TPanel
        Left = 1
        Top = 42
        Width = 1182
        Height = 640
        Align = alClient
        TabOrder = 1
        object spl1: TSplitter
          Left = 1
          Top = 193
          Width = 1180
          Height = 8
          Cursor = crVSplit
          Align = alTop
          Beveled = True
          Color = clGrayText
          ParentColor = False
          ResizeStyle = rsLine
        end
        object spl2: TSplitter
          Left = 1
          Top = 631
          Width = 1180
          Height = 8
          Cursor = crVSplit
          Align = alBottom
          Beveled = True
          Color = clGrayText
          ParentColor = False
          ResizeStyle = rsLine
        end
        object pnl4: TPanel
          Left = 1
          Top = 1
          Width = 1180
          Height = 192
          Align = alTop
          TabOrder = 0
          object dbgrdh_main: TDBGridEh
            Left = 1
            Top = 1
            Width = 1178
            Height = 190
            Align = alClient
            DataSource = ds_main
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -13
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs]
            PopupMenu = pm_Main
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            OnDblClick = dbgrdh_mainDblClick
            OnTitleClick = dbgrdh_mainTitleClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'control_name'
                Footers = <>
                Title.Caption = #26631#20934#32534#21495' '
                Width = 55
              end
              item
                EditButtons = <>
                FieldName = #24037#21378#21517#31216
                Footers = <>
                Width = 74
              end
              item
                EditButtons = <>
                FieldName = 'inv_part_numbers'
                Footers = <>
                Title.Caption = #29289#26009#32534#21495
                Width = 135
              end
              item
                EditButtons = <>
                FieldName = #25104#26412#20013#24515
                Footers = <>
                Width = 62
              end
              item
                EditButtons = <>
                FieldName = #29289#26009#31867#22411
                Footers = <>
                Width = 60
              end
              item
                EditButtons = <>
                FieldName = #37319#36141#21333#20301
                Footers = <>
                Width = 61
              end
              item
                EditButtons = <>
                FieldName = 'Isfreq'
                Footers = <>
                Title.Caption = #25353#20445#20859#39057#29575
                Width = 67
              end
              item
                EditButtons = <>
                FieldName = 'FDays'
                Footers = <>
                Title.Caption = #20445#20859#39057#29575
                Width = 59
              end
              item
                EditButtons = <>
                FieldName = 'FAMountUsed'
                Footers = <>
                Title.Caption = #20445#20859#19968#27425#29992#37327
                Width = 82
              end
              item
                EditButtons = <>
                FieldName = 'IsMCount'
                Footers = <>
                Title.Caption = #25353#21592#24037#20154#25968
                Width = 69
              end
              item
                EditButtons = <>
                FieldName = 'MCount'
                Footers = <>
                Title.Caption = #21592#24037#20154#25968
                Width = 59
              end
              item
                EditButtons = <>
                FieldName = 'MUsed'
                Footers = <>
                Title.Caption = #27599#20154#29992#37327
                Width = 62
              end
              item
                EditButtons = <>
                FieldName = 'IsSTime'
                Footers = <>
                Title.Caption = #25353#22266#23450#26102#38388
                Width = 71
              end
              item
                EditButtons = <>
                FieldName = 'TCount'
                Footers = <>
                Title.Caption = #26376#39046#29992#27425#25968
                Width = 67
              end
              item
                EditButtons = <>
                FieldName = 'TUsed'
                Footers = <>
                Title.Caption = #19968#27425#39046#29992#37327
                Width = 69
              end
              item
                EditButtons = <>
                FieldName = 'IsFactor'
                Footers = <>
                Title.Caption = #25353#29983#20135#22240#32032
                Width = 72
              end
              item
                EditButtons = <>
                FieldName = 'FacDay'
                Footers = <>
                Title.Caption = #39046#26009#39057#29575
                Width = 58
              end
              item
                EditButtons = <>
                FieldName = 'stan_consume'
                Footers = <>
                Title.Caption = #21333#32791'('#21315#24179#31859')'
                Width = 66
              end
              item
                EditButtons = <>
                FieldName = #20135#20986#21333#20301
                Footers = <>
                Width = 58
              end
              item
                EditButtons = <>
                FieldName = 'IsFormula'
                Footers = <>
                Title.Caption = #25353#20844#24335
                Width = 47
              end
              item
                EditButtons = <>
                FieldName = 'Formula_ptr'
                Footers = <>
                Title.Caption = #20844#24335#32534#30721
              end
              item
                EditButtons = <>
                FieldName = 'dept_codes'
                Footers = <>
                Title.Caption = #24037#24207#20195#30721
                Width = 195
              end
              item
                EditButtons = <>
                FieldName = 'property'
                Footers = <>
                Title.Caption = #23646#24615'1'
                Width = 38
              end
              item
                EditButtons = <>
                FieldName = #29992#37327#21333#20301
                Footers = <>
                Width = 55
              end
              item
                EditButtons = <>
                FieldName = 'CRate'
                Footers = <>
                Title.Caption = #25442#31639#29575
                Width = 43
              end
              item
                EditButtons = <>
                FieldName = 'property2'
                Footers = <>
                Title.Caption = #23646#24615'2'
                Width = 40
              end
              item
                EditButtons = <>
                FieldName = 'property3'
                Footers = <>
                Title.Caption = #23646#24615'3'
                Width = 38
              end
              item
                EditButtons = <>
                FieldName = 'property4'
                Footers = <>
                Title.Caption = #23646#24615'4'
                Width = 40
              end
              item
                EditButtons = <>
                FieldName = 'remark'
                Footers = <>
                Title.Caption = #22791#27880
                Width = 139
              end>
          end
          object dbgrdh_outport: TDBGridEh
            Left = 770
            Top = 50
            Width = 343
            Height = 63
            DataSource = ds_main
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -13
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs]
            PopupMenu = pm_Main
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            Visible = False
            OnDblClick = dbgrdh_mainDblClick
            OnTitleClick = dbgrdh_mainTitleClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'control_name'
                Footers = <>
                Title.Caption = #26631#20934#32534#21495' '
                Width = 55
              end
              item
                EditButtons = <>
                FieldName = 'DeptId_P'
                Footers = <>
                Width = 62
              end
              item
                EditButtons = <>
                FieldName = 'inv_part_numbers'
                Footers = <>
                Title.Caption = #29289#26009#32534#21495
                Width = 221
              end
              item
                EditButtons = <>
                FieldName = #37319#36141#21333#20301
                Footers = <>
                Width = 61
              end
              item
                EditButtons = <>
                FieldName = #29992#37327#21333#20301
                Footers = <>
                Width = 55
              end
              item
                EditButtons = <>
                FieldName = 'CRate'
                Footers = <>
                Title.Caption = #25442#31639#29575
                Width = 43
              end
              item
                EditButtons = <>
                FieldName = #29289#26009#31867#22411
                Footers = <>
                Width = 60
              end
              item
                EditButtons = <>
                FieldName = 'property'
                Footers = <>
                Title.Caption = #23646#24615'1'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'property2'
                Footers = <>
                Title.Caption = #23646#24615'2'
                Width = 47
              end
              item
                EditButtons = <>
                FieldName = 'property3'
                Footers = <>
                Title.Caption = #23646#24615'3'
                Width = 54
              end
              item
                EditButtons = <>
                FieldName = 'property4'
                Footers = <>
                Title.Caption = #23646#24615'4'
                Width = 55
              end
              item
                EditButtons = <>
                FieldName = 'Isfreq'
                Footers = <>
                Title.Caption = #25353#20445#20859#39057#29575
                Width = 67
              end
              item
                EditButtons = <>
                FieldName = 'FDays'
                Footers = <>
                Title.Caption = #20445#20859#39057#29575
                Width = 59
              end
              item
                EditButtons = <>
                FieldName = 'FAMountUsed'
                Footers = <>
                Title.Caption = #20445#20859#19968#27425#29992#37327
                Width = 82
              end
              item
                EditButtons = <>
                FieldName = 'IsMCount'
                Footers = <>
                Title.Caption = #25353#21592#24037#20154#25968
                Width = 69
              end
              item
                EditButtons = <>
                FieldName = 'MCount'
                Footers = <>
                Title.Caption = #21592#24037#20154#25968
                Width = 59
              end
              item
                EditButtons = <>
                FieldName = 'MUsed'
                Footers = <>
                Title.Caption = #27599#20154#29992#37327
                Width = 62
              end
              item
                EditButtons = <>
                FieldName = 'IsSTime'
                Footers = <>
                Title.Caption = #25353#22266#23450#26102#38388
                Width = 71
              end
              item
                EditButtons = <>
                FieldName = 'TCount'
                Footers = <>
                Title.Caption = #26376#39046#29992#27425#25968
                Width = 67
              end
              item
                EditButtons = <>
                FieldName = 'TUsed'
                Footers = <>
                Title.Caption = #19968#27425#39046#29992#37327
                Width = 69
              end
              item
                EditButtons = <>
                FieldName = 'IsFactor'
                Footers = <>
                Title.Caption = #25353#29983#20135#22240#32032
                Width = 72
              end
              item
                EditButtons = <>
                FieldName = 'stan_consume'
                Footers = <>
                Title.Caption = #21333#32791'('#21315#24179#31859')'
                Width = 66
              end
              item
                EditButtons = <>
                FieldName = 'dept_codes'
                Footers = <>
                Title.Caption = #24037#24207#20195#30721
                Width = 195
              end
              item
                EditButtons = <>
                FieldName = 'FacName'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = #22240#32032#21333#20301
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = #20135#20986#21333#20301
                Footers = <>
                Width = 58
              end
              item
                EditButtons = <>
                FieldName = 'remark'
                Footers = <>
                Title.Caption = #22791#27880
                Width = 139
              end
              item
                EditButtons = <>
                FieldName = 'WAREHOUSE_CODE'
                Footers = <>
                Title.Caption = #24037#21378#32534#21495
                Width = 74
              end
              item
                EditButtons = <>
                FieldName = 'FacDay'
                Footers = <>
                Title.Caption = #39046#26009#39057#29575
                Width = 58
              end
              item
                EditButtons = <>
                FieldName = 'IsFormula'
                Footers = <>
                Title.Caption = #25353#20844#24335
              end
              item
                EditButtons = <>
                FieldName = 'Formula_ptr'
                Footers = <>
                Title.Caption = #20844#24335#20195#30721
              end>
          end
        end
        object pnl7: TPanel
          Left = 1
          Top = 201
          Width = 1180
          Height = 430
          Align = alClient
          TabOrder = 1
          object pnl5: TPanel
            Left = 1
            Top = 257
            Width = 1178
            Height = 172
            Align = alClient
            TabOrder = 0
            object dbgrdh_process: TDBGridEh
              Left = 1
              Top = 1
              Width = 168
              Height = 170
              Align = alLeft
              DataSource = ds_process
              FooterColor = clWindow
              FooterFont.Charset = DEFAULT_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -13
              FooterFont.Name = #23435#20307
              FooterFont.Style = []
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -13
              TitleFont.Name = #23435#20307
              TitleFont.Style = []
              OnTitleClick = dbgrdh_processTitleClick
              Columns = <
                item
                  EditButtons = <>
                  FieldName = #24037#24207#20195#30721
                  Footers = <>
                  Width = 60
                end
                item
                  EditButtons = <>
                  FieldName = #24037#24207#21517#31216
                  Footers = <>
                  Width = 97
                end>
            end
            object dbgrdh_man: TDBGridEh
              Left = 814
              Top = 1
              Width = 363
              Height = 170
              Align = alRight
              DataSource = ds_man
              FooterColor = clWindow
              FooterFont.Charset = DEFAULT_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -13
              FooterFont.Name = #23435#20307
              FooterFont.Style = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -13
              TitleFont.Name = #23435#20307
              TitleFont.Style = []
              OnTitleClick = dbgrdh_manTitleClick
              Columns = <
                item
                  EditButtons = <>
                  FieldName = #24037#21495
                  Footers = <>
                  Width = 61
                end
                item
                  EditButtons = <>
                  FieldName = #22995#21517
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #30005#35805
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #26159#21542#26377#25928
                  Footers = <>
                  Width = 58
                end>
            end
            object dbgrdh_materiel: TDBGridEh
              Left = 169
              Top = 1
              Width = 645
              Height = 170
              Align = alClient
              DataSource = ds_materiel
              FooterColor = clWindow
              FooterFont.Charset = DEFAULT_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -13
              FooterFont.Name = #23435#20307
              FooterFont.Style = []
              ReadOnly = True
              TabOrder = 2
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -13
              TitleFont.Name = #23435#20307
              TitleFont.Style = []
              OnTitleClick = dbgrdh_materielTitleClick
              Columns = <
                item
                  EditButtons = <>
                  FieldName = #26448#26009#32534#21495
                  Footers = <>
                  Width = 121
                end
                item
                  EditButtons = <>
                  FieldName = #26448#26009#21517#31216
                  Footers = <>
                  Width = 203
                end
                item
                  EditButtons = <>
                  FieldName = #24211#23384#21333#20301
                  Footers = <>
                  Width = 69
                end
                item
                  EditButtons = <>
                  FieldName = #37319#36141#21333#20301
                  Footers = <>
                  Width = 57
                end
                item
                  EditButtons = <>
                  FieldName = #26631#20934#21333#20301#38754#31215
                  Footers = <>
                  Width = 86
                end
                item
                  EditButtons = <>
                  FieldName = #26631#20934#21333#20301#37325#37327
                  Footers = <>
                  Width = 88
                end>
            end
          end
          object grp1: TGroupBox
            Left = 1
            Top = 1
            Width = 1178
            Height = 256
            Align = alTop
            Caption = #39046#26009#25511#21046#26631#20934
            TabOrder = 1
            object Label7: TLabel
              Left = -10
              Top = 70
              Width = 1134
              Height = 13
              Caption = 
                '----------------------------------------------------------------' +
                '----------------------------------------------------------------' +
                '----------------------------------'
            end
            object Label1: TLabel
              Left = 32
              Top = 53
              Width = 52
              Height = 13
              Caption = #21160#22240#21517#31216
            end
            object Label2: TLabel
              Left = 169
              Top = 53
              Width = 52
              Height = 13
              Caption = #21160#22240#21333#20301
            end
            object Label5: TLabel
              Left = 383
              Top = 50
              Width = 52
              Height = 13
              Caption = #20135#20986#21333#20301
            end
            object Label6: TLabel
              Left = 559
              Top = 49
              Width = 39
              Height = 13
              Caption = #22791#27880#65306
            end
            object lbl28: TLabel
              Left = 45
              Top = 102
              Width = 33
              Height = 13
              Caption = #20844#24335' '
            end
            object Label3: TLabel
              Left = 61
              Top = 195
              Width = 39
              Height = 13
              Caption = #39057#29575#22825
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label8: TLabel
              Left = -26
              Top = 118
              Width = 1134
              Height = 13
              Caption = 
                '----------------------------------------------------------------' +
                '----------------------------------------------------------------' +
                '----------------------------------'
            end
            object lbl31: TLabel
              Left = 167
              Top = 193
              Width = 176
              Height = 13
              Caption = #21315#24179#31859#21333#32791'/'#23454#38469#19982#29702#35770#27604#20363#20540
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label4: TLabel
              Left = 16
              Top = 156
              Width = 91
              Height = 13
              Caption = #24403#26376#24635#21487#39046#29992#37327
            end
            object Label9: TLabel
              Left = 236
              Top = 154
              Width = 26
              Height = 13
              Caption = #22791#27880
            end
            object lbl16: TLabel
              Left = -42
              Top = 172
              Width = 1134
              Height = 13
              Caption = 
                '----------------------------------------------------------------' +
                '----------------------------------------------------------------' +
                '----------------------------------'
            end
            object pnl6: TPanel
              Left = 2
              Top = 234
              Width = 1174
              Height = 20
              Align = alBottom
              TabOrder = 0
              Visible = False
              object lbl11: TLabel
                Left = 24
                Top = 133
                Width = 52
                Height = 13
                Caption = #22266#23450#26102#38388
              end
              object lbl6: TLabel
                Left = 24
                Top = 90
                Width = 52
                Height = 13
                Caption = #21592#24037#20154#25968
              end
              object lbl1: TLabel
                Left = 24
                Top = 40
                Width = 52
                Height = 13
                Caption = #20445#20859#39057#29575
              end
              object lbl2: TLabel
                Left = 177
                Top = 40
                Width = 33
                Height = 13
                Caption = #22825'/'#27425
              end
              object lbl4: TLabel
                Left = 232
                Top = 40
                Width = 52
                Height = 13
                Caption = #21333#20301#32791#29992
              end
              object lbl3: TLabel
                Left = 382
                Top = 40
                Width = 33
                Height = 13
                Caption = #21319'/'#27425
              end
              object lbl5: TLabel
                Left = 456
                Top = 39
                Width = 26
                Height = 13
                Caption = #22791#27880
              end
              object lbl7: TLabel
                Left = 177
                Top = 90
                Width = 33
                Height = 13
                Caption = #20010'/'#29677
              end
              object lbl8: TLabel
                Left = 232
                Top = 90
                Width = 52
                Height = 13
                Caption = #21333#20301#32791#29992
              end
              object lbl9: TLabel
                Left = 382
                Top = 90
                Width = 53
                Height = 13
                Caption = #20010'/'#29677'/'#20154
              end
              object lbl10: TLabel
                Left = 456
                Top = 89
                Width = 26
                Height = 13
                Caption = #22791#27880
              end
              object lbl36: TLabel
                Left = 15
                Top = 56
                Width = 1134
                Height = 13
                Caption = 
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '----------------------------------'
              end
              object lbl37: TLabel
                Left = 15
                Top = 104
                Width = 1134
                Height = 13
                Caption = 
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '----------------------------------'
              end
              object lbl12: TLabel
                Left = 177
                Top = 133
                Width = 33
                Height = 13
                Caption = #27425'/'#26376
              end
              object lbl13: TLabel
                Left = 232
                Top = 133
                Width = 52
                Height = 13
                Caption = #21333#20301#32791#29992
              end
              object lbl14: TLabel
                Left = 382
                Top = 133
                Width = 33
                Height = 13
                Caption = #21319'/'#27425
              end
              object lbl15: TLabel
                Left = 456
                Top = 133
                Width = 26
                Height = 13
                Caption = #22791#27880
              end
              object lbl38: TLabel
                Left = 14
                Top = 133
                Width = 1134
                Height = 13
                Caption = 
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '----------------------------------'
              end
              object chk_time2: TCheckBox
                Left = 7
                Top = 114
                Width = 97
                Height = 17
                Caption = #25353#22266#23450#26102#38388
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #23435#20307
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
              end
              object chk_MCount: TCheckBox
                Left = 7
                Top = 66
                Width = 97
                Height = 17
                Caption = #25353#21592#24037#20154#25968
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #23435#20307
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
              end
              object chk_freq: TCheckBox
                Left = 7
                Top = 18
                Width = 97
                Height = 17
                Caption = #25353#20445#20859#39057#29575
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #23435#20307
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
              end
              object edt_freq: TEdit
                Left = 88
                Top = 35
                Width = 89
                Height = 21
                TabOrder = 3
              end
              object edt_FUse: TEdit
                Left = 288
                Top = 35
                Width = 89
                Height = 21
                TabOrder = 4
              end
              object edt_Fremark: TEdit
                Left = 488
                Top = 32
                Width = 601
                Height = 21
                TabOrder = 5
              end
              object edt_Mcount: TEdit
                Left = 88
                Top = 85
                Width = 89
                Height = 21
                TabOrder = 6
              end
              object edt_MUse: TEdit
                Left = 288
                Top = 85
                Width = 89
                Height = 21
                TabOrder = 7
              end
              object edt_Mremark: TEdit
                Left = 488
                Top = 84
                Width = 601
                Height = 21
                TabOrder = 8
              end
              object edt_TCont: TEdit
                Left = 88
                Top = 125
                Width = 89
                Height = 21
                TabOrder = 9
              end
              object edt_Tuse2: TEdit
                Left = 288
                Top = 125
                Width = 89
                Height = 21
                TabOrder = 10
              end
              object edt_TRemark2: TEdit
                Left = 488
                Top = 125
                Width = 601
                Height = 21
                TabOrder = 11
              end
            end
            object chk_fac: TCheckBox
              Left = 15
              Top = 32
              Width = 97
              Height = 17
              Caption = #25353#22240#32032
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
            end
            object edt_FacName: TEdit
              Left = 87
              Top = 48
              Width = 76
              Height = 21
              TabOrder = 2
            end
            object edt_FacUnit: TEdit
              Left = 224
              Top = 49
              Width = 121
              Height = 21
              TabOrder = 3
            end
            object edt_OUnit: TEdit
              Left = 438
              Top = 46
              Width = 91
              Height = 21
              TabOrder = 4
            end
            object edt_facRemark: TEdit
              Left = 599
              Top = 44
              Width = 234
              Height = 21
              TabOrder = 5
            end
            object chk_format: TCheckBox
              Left = 15
              Top = 80
              Width = 97
              Height = 17
              Caption = #25353#20844#24335
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 6
            end
            object edt_Formula: TEdit
              Left = 77
              Top = 97
              Width = 121
              Height = 21
              TabOrder = 7
            end
            object edt_Facday: TEdit
              Left = 102
              Top = 190
              Width = 47
              Height = 21
              TabOrder = 8
            end
            object edt_FacUse: TEdit
              Left = 345
              Top = 190
              Width = 73
              Height = 21
              TabOrder = 9
            end
            object edt_Tuse: TEdit
              Left = 112
              Top = 151
              Width = 89
              Height = 21
              TabOrder = 10
            end
            object edt_TRemark: TEdit
              Left = 268
              Top = 150
              Width = 601
              Height = 21
              TabOrder = 11
            end
            object chk_time: TCheckBox
              Left = 7
              Top = 130
              Width = 97
              Height = 17
              Caption = #25353#22266#23450#26102#38388
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 12
            end
          end
        end
      end
    end
  end
  object pm_Main: TPopupMenu
    Left = 218
    Top = 120
    object mni_add: TMenuItem
      Caption = #26032#22686
      OnClick = mni_addClick
    end
    object N_edit: TMenuItem
      Caption = #32534#36753
      OnClick = N_editClick
    end
    object N_browse: TMenuItem
      Caption = #26597#30475
      OnClick = N_browseClick
    end
    object N_del: TMenuItem
      Caption = #21024#38500
      OnClick = N_delClick
    end
  end
  object qry_Main: TADOQuery
    AutoCalcFields = False
    Connection = DM.con1
    CursorType = ctStatic
    AfterScroll = qry_MainAfterScroll
    Parameters = <>
    SQL.Strings = (
      ''
      
        'select  a.*,f.abbr_name as '#24037#21378#21517#31216',g.dept_name as '#25104#26412#20013#24515',h.group_desc' +
        ' as '#29289#26009#31867#22411','
      'c.unit_name as '#37319#36141#21333#20301', e.unit_name as '#29992#37327#21333#20301','
      
        'b.unit_name as '#20135#20986#21333#20301' ,convert(varchar(2000),d154.dept_codes) as d' +
        'ept_codes ,convert(varchar(2000),d155.inv_part_numbers)inv_part_' +
        'numbers ,ee.unit_name as '#22240#32032#21333#20301
      ', f.WAREHOUSE_CODE'
      'from data0136  a'
      'left join data0002 b on a.unit_ptr=b.rkey'
      'left join data0002 c on a.purunit=c.rkey'
      'left join data0002 e on a.useunit=e.rkey'
      'left join data0002 ee on a.fac_unit=ee.rkey'
      'left join data0015 f on a.warehouse_ptr=f.rkey'
      'left join  data0034 g on a.deptid_p=g.rkey'
      'left join data0496 h  on a.PGroupID=h.rkey'
      'left join (SELECT control_ptr, dept_codes=STUFF'
      '      ((SELECT '#39','#39' + b.dept_code'
      
        '          FROM  dbo.data0154 a  inner join data0034 b on a.dept_' +
        'ptr=b.rkey'
      '          WHERE a.control_ptr=dept.control_ptr'
      '          order by b.dept_code    FOR XML PATH('#39#39') ), 1, 1, '#39#39')'
      
        'FROM   dbo.data0154 AS dept GROUP BY control_ptr) as d154 on d15' +
        '4.control_ptr=a.rkey '
      'left join (SELECT control_ptr, inv_part_numbers=STUFF'
      '      ((SELECT '#39','#39' + b.inv_part_number'
      
        '          FROM  dbo.data0155 a  inner join data0017 b on a.invt_' +
        'ptr=b.rkey'
      '          WHERE a.control_ptr=inv.control_ptr'
      
        '          order by b.inv_part_number    FOR XML PATH('#39#39') ), 1, 1' +
        ', '#39#39')'
      
        'FROM   dbo.data0155 AS inv GROUP BY control_ptr) as d155 on d155' +
        '.control_ptr=a.rkey '
      'where 1=1 ')
    Left = 146
    Top = 107
    object atncfld_Mainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object strngfld_Maincontrol_name: TStringField
      FieldName = 'control_name'
      Size = 50
    end
    object intgrfld_Mainunit_ptr: TIntegerField
      FieldName = 'unit_ptr'
    end
    object intgrfld_Mainwarehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object bcdfld_Mainstan_consume: TBCDField
      FieldName = 'stan_consume'
      Precision = 8
      Size = 2
    end
    object intgrfld_MainDeptId_P: TIntegerField
      FieldName = 'DeptId_P'
    end
    object intgrfld_MainPurUnit: TIntegerField
      FieldName = 'PurUnit'
    end
    object intgrfld_MainUseUnit: TIntegerField
      FieldName = 'UseUnit'
    end
    object intgrfld_MainCRate: TIntegerField
      FieldName = 'CRate'
    end
    object intgrfld_MainPGroupID: TIntegerField
      FieldName = 'PGroupID'
    end
    object strngfld_Mainproperty: TStringField
      FieldName = 'property'
    end
    object strngfld_Mainproperty2: TStringField
      FieldName = 'property2'
      Size = 30
    end
    object strngfld_Mainproperty3: TStringField
      FieldName = 'property3'
      Size = 30
    end
    object strngfld_Mainproperty4: TStringField
      FieldName = 'property4'
      Size = 30
    end
    object blnfld_MainIsfreq: TBooleanField
      FieldName = 'Isfreq'
    end
    object fltfld_MainFDays: TFloatField
      FieldName = 'FDays'
    end
    object fltfld_MainFAMountUsed: TFloatField
      FieldName = 'FAMountUsed'
    end
    object strngfld_MainFRemark: TStringField
      FieldName = 'FRemark'
      Size = 500
    end
    object blnfld_MainIsMCount: TBooleanField
      FieldName = 'IsMCount'
    end
    object intgrfld_MainMCount: TIntegerField
      FieldName = 'MCount'
    end
    object fltfld_MainMUsed: TFloatField
      FieldName = 'MUsed'
    end
    object strngfld_MainMRemark: TStringField
      FieldName = 'MRemark'
      Size = 500
    end
    object blnfld_MainIsSTime: TBooleanField
      FieldName = 'IsSTime'
    end
    object intgrfld_MainTCount: TIntegerField
      FieldName = 'TCount'
    end
    object fltfld_MainTUsed: TFloatField
      FieldName = 'TUsed'
    end
    object strngfld_MainTRemark: TStringField
      FieldName = 'TRemark'
      Size = 500
    end
    object blnfld_MainIsFactor: TBooleanField
      FieldName = 'IsFactor'
    end
    object strngfld_MainFacName: TStringField
      FieldName = 'FacName'
    end
    object strngfld_MainFacRemark: TStringField
      FieldName = 'FacRemark'
      Size = 500
    end
    object strngfld_Mainremark: TStringField
      FieldName = 'remark'
      Size = 500
    end
    object intgrfld_MainFac_unit: TIntegerField
      FieldName = 'Fac_unit'
    end
    object intgrfld_MainFacDay: TIntegerField
      FieldName = 'FacDay'
    end
    object blnfld_MainIsFormula: TBooleanField
      FieldName = 'IsFormula'
    end
    object strngfld_MainDSDesigner: TStringField
      FieldName = #24037#21378#21517#31216
      Size = 70
    end
    object strngfld_MainDSDesigner2: TStringField
      FieldName = #25104#26412#20013#24515
      Size = 30
    end
    object strngfld_MainDSDesigner3: TStringField
      FieldName = #29289#26009#31867#22411
      Size = 30
    end
    object strngfld_MainDSDesigner4: TStringField
      FieldName = #37319#36141#21333#20301
    end
    object strngfld_MainDSDesigner5: TStringField
      FieldName = #29992#37327#21333#20301
    end
    object strngfld_MainDSDesigner6: TStringField
      FieldName = #20135#20986#21333#20301
    end
    object strngfld_MainDSDesigner7: TStringField
      FieldName = #22240#32032#21333#20301
    end
    object strngfld_MainFormula_ptr: TStringField
      FieldName = 'Formula_ptr'
    end
    object wrdfld_Maingroup_id: TWordField
      FieldName = 'group_id'
    end
    object intgrfld_MainFacFreq: TIntegerField
      FieldName = 'FacFreq'
    end
    object strngfld_MainWAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object strngfld_Maindept_codes: TStringField
      FieldName = 'dept_codes'
      ReadOnly = True
      Size = 2000
    end
    object strngfld_Maininv_part_numbers: TStringField
      FieldName = 'inv_part_numbers'
      ReadOnly = True
      Size = 2000
    end
  end
  object qry_process: TADOQuery
    Connection = DM.con1
    Parameters = <
      item
        Name = 'control_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select a.* ,b.dept_code as '#24037#24207#20195#30721', b.dept_Name as '#24037#24207#21517#31216
      'from data0154 a'
      'left  join  data0034 b on a.Dept_ptr=b.rkey'
      'where a.control_ptr=   :control_ptr')
    Left = 66
    Top = 683
    object intgrfld_processcontrol_ptr: TIntegerField
      FieldName = 'control_ptr'
    end
    object intgrfld_processdept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object strngfld_processDSDesigner: TStringField
      FieldName = #24037#24207#20195#30721
      Size = 10
    end
    object strngfld_processDSDesigner2: TStringField
      FieldName = #24037#24207#21517#31216
      Size = 30
    end
  end
  object qry_materiel: TADOQuery
    Connection = DM.con1
    Parameters = <
      item
        Name = 'control_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select  a.*,b.Inv_part_number as  '#26448#26009#32534#21495', b.inv_Name as '#26448#26009#21517#31216',c.uni' +
        't_name as '#24211#23384#21333#20301', d.unit_name as '#37319#36141#21333#20301
      ',b.STOCK_SELL as '#26631#20934#21333#20301#38754#31215',STOCK_BASE as '#26631#20934#21333#20301#37325#37327
      'from data0155  a'
      'left join data0017 b   on a.invt_ptr=b.rkey '
      'left join data0002 c on b.STOCK_UNIT_PTR=c.rkey'
      'left join data0002 d on b.PURCH_UNIT_PTR=d.rkey'
      'where a.control_ptr= :control_ptr')
    Left = 1394
    Top = 339
    object intgrfld_materielcontrol_ptr: TIntegerField
      FieldName = 'control_ptr'
    end
    object intgrfld_materielinvt_ptr: TIntegerField
      FieldName = 'invt_ptr'
    end
    object strngfld_materielDSDesigner: TStringField
      FieldName = #26448#26009#32534#21495
      Size = 25
    end
    object strngfld_materielDSDesigner2: TStringField
      FieldName = #26448#26009#21517#31216
      Size = 30
    end
    object strngfld_materielDSDesigner3: TStringField
      FieldName = #24211#23384#21333#20301
    end
    object strngfld_materielDSDesigner4: TStringField
      FieldName = #37319#36141#21333#20301
    end
    object fltfld_materielDSDesigner5: TFloatField
      FieldName = #26631#20934#21333#20301#38754#31215
    end
    object fltfld_materielDSDesigner6: TFloatField
      FieldName = #26631#20934#21333#20301#37325#37327
    end
  end
  object qry_Man: TADOQuery
    Connection = DM.con1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey136'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select a.*,b.user_login_name as '#24037#21495',b.user_full_name  as '#22995#21517','
      
        'd05.phone '#30005#35805', case when d05.active_flag='#39'Y'#39' then '#39#26377#25928#39' else '#39#26080#25928#39' ' +
        'end as '#26159#21542#26377#25928
      'from  data0139 a '
      'left join data0073  b  on a.csi_ptr=b.rkey '
      ' INNER JOIN  dbo.Data0005  d05 ON b.EMPLOYEE_PTR = d05.RKEY '
      'where a.rkey136= :rkey136')
    Left = 1010
    Top = 595
    object intgrfld_Manrkey136: TIntegerField
      FieldName = 'rkey136'
    end
    object intgrfld_Mancsi_ptr: TIntegerField
      FieldName = 'csi_ptr'
    end
    object strngfld_ManDSDesigner: TStringField
      FieldName = #24037#21495
      Size = 10
    end
    object strngfld_ManDSDesigner2: TStringField
      FieldName = #22995#21517
      Size = 16
    end
    object qry_ManDSDesigner: TStringField
      FieldName = #30005#35805
      Size = 14
    end
    object qry_ManDSDesigner2: TStringField
      FieldName = #26159#21542#26377#25928
      ReadOnly = True
      Size = 4
    end
  end
  object ds_main: TDataSource
    DataSet = qry_Main
    Left = 170
    Top = 195
  end
  object ds_process: TDataSource
    DataSet = qry_process
    Left = 114
    Top = 691
  end
  object ds_materiel: TDataSource
    DataSet = qry_materiel
    Left = 1354
    Top = 339
  end
  object ds_man: TDataSource
    DataSet = qry_Man
    Left = 1058
    Top = 603
  end
end
