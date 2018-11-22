object frmMain: TfrmMain
  Left = 331
  Top = 29
  Width = 1045
  Height = 659
  Caption = #22521#35757#31649#29702
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
    Width = 1037
    Height = 628
    Align = alClient
    TabOrder = 0
  end
  object pnl5: TPanel
    Left = 0
    Top = 0
    Width = 1037
    Height = 628
    Align = alClient
    TabOrder = 1
    object pgc1: TPageControl
      Left = 1
      Top = 42
      Width = 1035
      Height = 585
      ActivePage = ts3
      Align = alClient
      TabOrder = 0
      OnChange = pgc1Change
      object ts1: TTabSheet
        Caption = '1.'#35838#31243#20307#31995
        object pnl2: TPanel
          Left = 0
          Top = 0
          Width = 1027
          Height = 41
          Align = alTop
          TabOrder = 0
          object lbl_field: TLabel
            Left = 341
            Top = 15
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = #35838#31243#32534#21495
          end
          object btn_export1: TBitBtn
            Left = 67
            Top = 1
            Width = 60
            Height = 40
            Caption = #23548#20986
            TabOrder = 0
            OnClick = btn_export1Click
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
          object btn_qry1: TBitBtn
            Left = 129
            Top = -4
            Width = 65
            Height = 45
            Caption = #26597#35810
            TabOrder = 1
            OnClick = btn_qry1Click
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
            Left = 399
            Top = 12
            Width = 91
            Height = 21
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnChange = edt_valueChange
          end
          object btn_refresh: TBitBtn
            Left = 4
            Top = 2
            Width = 60
            Height = 38
            Caption = #21047#26032'1'
            TabOrder = 3
            OnClick = btn_refreshClick
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              04000000000080000000CE0E0000C40E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777777777777777777777777744447777777777444444447777777444777744
              4777777447777774477777447777777744777744777777774477774477777777
              4477774477777777447777744777747447777774477774444777777777777444
              7777777777777444477777777777777777777777777777777777}
          end
        end
        object pnl4: TPanel
          Left = 0
          Top = 41
          Width = 1027
          Height = 311
          Align = alClient
          TabOrder = 1
          object eh_Tclass: TDBGridEh
            Left = 1
            Top = 1
            Width = 1025
            Height = 309
            Align = alClient
            DataSource = ds_TC
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -13
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            PopupMenu = pm1
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            OnKeyDown = eh_TclassKeyDown
            OnTitleClick = eh_TclassTitleClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'CCode'
                Footers = <>
                Title.Caption = #35838#31243#32534#21495
                Width = 142
              end
              item
                EditButtons = <>
                FieldName = 'Cname'
                Footers = <>
                Title.Caption = #35838#31243#21517#31216
                Width = 279
              end>
          end
        end
        object pnl3: TPanel
          Left = 0
          Top = 352
          Width = 1027
          Height = 205
          Align = alBottom
          TabOrder = 2
          object eh_file: TDBGridEh
            Left = 1
            Top = 1
            Width = 1025
            Height = 203
            Align = alClient
            DataSource = ds_TCFile
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -13
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            PopupMenu = pm1_2
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            Columns = <
              item
                EditButtons = <>
                FieldName = 'FileName'
                Footers = <>
                Title.Caption = #35838#20214#21517
                Width = 335
              end>
          end
        end
      end
      object ts2: TTabSheet
        Caption = '2.'#22521#35757#38656#27714
        ImageIndex = 1
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 1027
          Height = 557
          Align = alClient
          TabOrder = 0
          object Panel2: TPanel
            Left = 1
            Top = 1
            Width = 1025
            Height = 41
            Align = alTop
            TabOrder = 0
            object lbl_field2: TLabel
              Left = 367
              Top = 15
              Width = 26
              Height = 13
              Alignment = taRightJustify
              Caption = #37096#38376
            end
            object btn_export2: TBitBtn
              Left = 69
              Top = 1
              Width = 60
              Height = 40
              Caption = #23548#20986
              TabOrder = 0
              OnClick = btn_export2Click
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
            object btn_qry2: TBitBtn
              Left = 131
              Top = -4
              Width = 65
              Height = 45
              Caption = #26597#35810
              TabOrder = 1
              OnClick = btn_qry2Click
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
            object edt_value2: TEdit
              Left = 399
              Top = 12
              Width = 91
              Height = 21
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnChange = edt_value2Change
            end
            object btn_refresh2: TBitBtn
              Left = 6
              Top = 2
              Width = 60
              Height = 38
              Caption = #21047#26032'2'
              TabOrder = 3
              OnClick = btn_refresh2Click
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                04000000000080000000CE0E0000C40E00001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                7777777777777777777777777744447777777777444444447777777444777744
                4777777447777774477777447777777744777744777777774477774477777777
                4477774477777777447777744777747447777774477774444777777777777444
                7777777777777444477777777777777777777777777777777777}
            end
          end
          object Panel3: TPanel
            Left = 1
            Top = 42
            Width = 1025
            Height = 514
            Align = alClient
            TabOrder = 1
            object eh2_detail: TDBGridEh
              Left = 1
              Top = 1
              Width = 1023
              Height = 512
              Align = alClient
              DataSource = ds_TC2
              FooterColor = clWindow
              FooterFont.Charset = DEFAULT_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -13
              FooterFont.Name = #23435#20307
              FooterFont.Style = []
              PopupMenu = pm2
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -13
              TitleFont.Name = #23435#20307
              TitleFont.Style = []
              OnKeyDown = eh2_detailKeyDown
              OnTitleClick = eh2_detailTitleClick
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'departmentName'
                  Footers = <>
                  Title.Caption = #37096#38376
                end
                item
                  EditButtons = <>
                  FieldName = 'PName'
                  Footers = <>
                  Title.Caption = #32844#21153
                  Width = 123
                end
                item
                  EditButtons = <>
                  FieldName = 'CCode'
                  Footers = <>
                  Title.Caption = #35838#31243#32534#30721
                  Width = 93
                end
                item
                  EditButtons = <>
                  FieldName = 'Cname'
                  Footers = <>
                  Title.Caption = #35838#31243#21517#31216
                  Width = 156
                end
                item
                  EditButtons = <>
                  FieldName = 'ctype'
                  Footers = <>
                  Title.Caption = #35838#31243#31867#21035
                  Width = 92
                end>
            end
          end
        end
      end
      object ts3: TTabSheet
        Caption = '3.'#24180#24230#22521#35757#35745#21010
        ImageIndex = 2
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 1027
          Height = 557
          Align = alClient
          TabOrder = 0
          object Panel6: TPanel
            Left = 1
            Top = 1
            Width = 1025
            Height = 40
            Align = alTop
            TabOrder = 0
            object lbl_field3: TLabel
              Left = 367
              Top = 15
              Width = 26
              Height = 13
              Alignment = taRightJustify
              Caption = #37096#38376
            end
            object btn_refresh3: TBitBtn
              Left = 0
              Top = 2
              Width = 60
              Height = 38
              Caption = #21047#26032'3'
              TabOrder = 0
              OnClick = btn_refresh3Click
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                04000000000080000000CE0E0000C40E00001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                7777777777777777777777777744447777777777444444447777777444777744
                4777777447777774477777447777777744777744777777774477774477777777
                4477774477777777447777744777747447777774477774444777777777777444
                7777777777777444477777777777777777777777777777777777}
            end
            object btn_export3: TBitBtn
              Left = 60
              Top = 1
              Width = 60
              Height = 40
              Caption = #23548#20986
              TabOrder = 1
              OnClick = btn_export3Click
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
            object btn_qry3: TBitBtn
              Left = 122
              Top = -4
              Width = 65
              Height = 45
              Caption = #26597#35810
              TabOrder = 2
              OnClick = btn_qry3Click
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
            object edt_value3: TEdit
              Left = 399
              Top = 12
              Width = 91
              Height = 21
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              OnChange = edt_value3Change
            end
          end
          object Panel7: TPanel
            Left = 1
            Top = 41
            Width = 1025
            Height = 515
            Align = alClient
            TabOrder = 1
            object eh_main3: TDBGridEh
              Left = 1
              Top = 1
              Width = 1023
              Height = 513
              Align = alClient
              DataSource = ds_main3
              FooterColor = clWindow
              FooterFont.Charset = DEFAULT_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -13
              FooterFont.Name = #23435#20307
              FooterFont.Style = []
              PopupMenu = pm3
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -13
              TitleFont.Name = #23435#20307
              TitleFont.Style = []
              OnKeyDown = eh_main3KeyDown
              OnTitleClick = eh_main3TitleClick
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'departmentname'
                  Footers = <>
                  Title.Caption = #37096#38376
                  Width = 92
                end
                item
                  EditButtons = <>
                  FieldName = 'ccode'
                  Footers = <>
                  Title.Caption = #35838#31243#32534#21495
                  Width = 85
                end
                item
                  EditButtons = <>
                  FieldName = 'cname'
                  Footers = <>
                  Title.Caption = #35838#31243#21517#31216
                  Width = 109
                end
                item
                  EditButtons = <>
                  FieldName = 'PMonth'
                  Footers = <>
                  Title.Caption = #22521#35757#26376#20221
                  Width = 67
                end
                item
                  EditButtons = <>
                  FieldName = 'pdate'
                  Footers = <>
                  Title.Caption = #35745#21010#26085#26399
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'item2'
                  Footers = <>
                  Title.Caption = #22521#35757#31867#22411
                  Visible = False
                  Width = 91
                end
                item
                  EditButtons = <>
                  FieldName = 'ctype2'
                  Footers = <>
                  Title.Caption = #22521#35757#31867#21035' '
                  Visible = False
                  Width = 85
                end
                item
                  EditButtons = <>
                  FieldName = 'Bdate'
                  Footers = <>
                  Title.Caption = #22521#35757#24320#22987#26085#26399
                  Visible = False
                  Width = 89
                end
                item
                  EditButtons = <>
                  FieldName = 'EDate'
                  Footers = <>
                  Title.Caption = #25130#27490#26085#26399
                  Visible = False
                  Width = 77
                end
                item
                  EditButtons = <>
                  FieldName = 'Teacher'
                  Footers = <>
                  Title.Caption = #22521#35757#35762#24072
                  Visible = False
                  Width = 73
                end
                item
                  EditButtons = <>
                  FieldName = 'place'
                  Footers = <>
                  Title.Caption = #22521#35757#22320#28857
                  Visible = False
                  Width = 80
                end
                item
                  EditButtons = <>
                  FieldName = 'THours'
                  Footers = <>
                  Title.Caption = #22521#35757#26102#38271
                  Visible = False
                  Width = 55
                end
                item
                  EditButtons = <>
                  FieldName = 'IsFinished'
                  Footers = <>
                  Title.Caption = #26159#21542#23436#25104
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'remark'
                  Footers = <>
                  Title.Caption = #22791#27880
                  Visible = False
                  Width = 99
                end>
            end
          end
        end
      end
      object ts4: TTabSheet
        Caption = '4.'#26376#24230#22521#35757#35745#21010
        ImageIndex = 3
        object pnl7: TPanel
          Left = 0
          Top = 0
          Width = 1027
          Height = 33
          Align = alTop
          TabOrder = 0
          object lbl_field4: TLabel
            Left = 367
            Top = 11
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = #37096#38376
          end
          object btn_refresh4: TBitBtn
            Left = 4
            Top = -5
            Width = 60
            Height = 38
            Caption = #21047#26032'4'
            TabOrder = 0
            OnClick = btn_refresh4Click
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              04000000000080000000CE0E0000C40E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777777777777777777777777744447777777777444444447777777444777744
              4777777447777774477777447777777744777744777777774477774477777777
              4477774477777777447777744777747447777774477774444777777777777444
              7777777777777444477777777777777777777777777777777777}
          end
          object btn_export4: TBitBtn
            Left = 65
            Top = -7
            Width = 60
            Height = 40
            Caption = #23548#20986
            TabOrder = 1
            OnClick = btn_export4Click
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
          object btn_qry4: TBitBtn
            Left = 127
            Top = -12
            Width = 65
            Height = 45
            Caption = #26597#35810
            TabOrder = 2
            OnClick = btn_qry3Click
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
          object edt_value4: TEdit
            Left = 399
            Top = 8
            Width = 91
            Height = 21
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnChange = edt_value4Change
          end
        end
        object eh4: TDBGridEh
          Left = 0
          Top = 33
          Width = 1027
          Height = 524
          Align = alClient
          DataSource = ds_main3
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -13
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          PopupMenu = pm4
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnKeyDown = eh_main3KeyDown
          OnTitleClick = eh4TitleClick
          Columns = <
            item
              EditButtons = <>
              FieldName = 'departmentname'
              Footers = <>
              Title.Caption = #37096#38376
              Width = 92
            end
            item
              EditButtons = <>
              FieldName = 'ccode'
              Footers = <>
              Title.Caption = #35838#31243#32534#21495
              Width = 85
            end
            item
              EditButtons = <>
              FieldName = 'cname'
              Footers = <>
              Title.Caption = #35838#31243#21517#31216
              Width = 109
            end
            item
              EditButtons = <>
              FieldName = 'PMonth'
              Footers = <>
              Title.Caption = #22521#35757#26376#20221
              Width = 67
            end
            item
              EditButtons = <>
              FieldName = 'pdate'
              Footers = <>
              Title.Caption = #35745#21010#26085#26399
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'Bdate'
              Footers = <>
              Title.Caption = #22521#35757#24320#22987#26085#26399
              Width = 89
            end
            item
              EditButtons = <>
              FieldName = 'EDate'
              Footers = <>
              Title.Caption = #25130#27490#26085#26399
              Width = 77
            end
            item
              EditButtons = <>
              FieldName = 'Teacher'
              Footers = <>
              Title.Caption = #22521#35757#35762#24072
              Width = 73
            end
            item
              EditButtons = <>
              FieldName = 'place'
              Footers = <>
              Title.Caption = #22521#35757#22320#28857
              Width = 80
            end
            item
              EditButtons = <>
              FieldName = 'THours'
              Footers = <>
              Title.Caption = #22521#35757#26102#38271
              Width = 55
            end
            item
              EditButtons = <>
              FieldName = 'remark'
              Footers = <>
              Title.Caption = #22791#27880
              Width = 99
            end
            item
              EditButtons = <>
              FieldName = 'IsFinished'
              Footers = <>
              Title.Caption = #26159#21542#23436#25104
              Width = 60
            end>
        end
      end
      object ts5: TTabSheet
        Caption = '5.'#22521#35757#35760#24405
        ImageIndex = 6
        object pnl10: TPanel
          Left = 0
          Top = 0
          Width = 1027
          Height = 41
          Align = alTop
          TabOrder = 0
          object lbl_field55: TLabel
            Left = 341
            Top = 11
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = #22521#35757#32534#21495
          end
          object btn_refresh5: TBitBtn
            Left = 4
            Top = -2
            Width = 60
            Height = 38
            Caption = #21047#26032'5'
            TabOrder = 2
            OnClick = btn_refresh5Click
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              04000000000080000000CE0E0000C40E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777777777777777777777777744447777777777444444447777777444777744
              4777777447777774477777447777777744777744777777774477774477777777
              4477774477777777447777744777747447777774477774444777777777777444
              7777777777777444477777777777777777777777777777777777}
          end
          object btn4: TBitBtn
            Left = 65
            Top = -4
            Width = 60
            Height = 40
            Caption = #23548#20986
            TabOrder = 1
            OnClick = btn4Click
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
          object btn5: TBitBtn
            Left = 127
            Top = -9
            Width = 65
            Height = 45
            Caption = #26597#35810
            TabOrder = 0
            OnClick = btn5Click
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
          object edt_value5: TEdit
            Left = 399
            Top = 8
            Width = 91
            Height = 21
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnChange = edt_value4Change
          end
        end
        object pnl12: TPanel
          Left = 0
          Top = 41
          Width = 1027
          Height = 516
          Align = alClient
          TabOrder = 1
          object eh55: TDBGridEh
            Left = 1
            Top = 1
            Width = 1025
            Height = 514
            Align = alClient
            DataSource = ds_TrainRecord
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -13
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            PopupMenu = pm5
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            OnKeyDown = eh55KeyDown
            OnTitleClick = eh55TitleClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'Train_NO'
                Footers = <>
                Title.Caption = #22521#35757#32534#21495
                Title.Color = clRed
                Width = 156
              end
              item
                EditButtons = <>
                FieldName = 'ccode'
                Footers = <>
                Title.Caption = #35838#31243#32534#21495
                Width = 81
              end
              item
                EditButtons = <>
                FieldName = 'Train_topics'
                Footers = <>
                Title.Caption = #22521#35757#20027#39064
                Width = 157
              end
              item
                EditButtons = <>
                FieldName = 'cname'
                Footers = <>
                Title.Caption = #35838#31243#21517#31216
                Width = 113
              end
              item
                EditButtons = <>
                FieldName = 'cType'
                Footers = <>
                Title.Caption = #22521#35757#31867#21035
              end
              item
                EditButtons = <>
                FieldName = 'TType'
                Footers = <>
                Title.Caption = #22521#35757#26041#24335
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'EType'
                Footers = <>
                Title.Caption = #32771#26680#26041#24335
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'employeecode'
                Footers = <>
                Title.Caption = #24037#21495
                Width = 66
              end
              item
                EditButtons = <>
                FieldName = 'chinesename'
                Footers = <>
                Title.Caption = #22995#21517
                Width = 70
              end
              item
                EditButtons = <>
                FieldName = 'departmentname'
                Footers = <>
                Title.Caption = #37096#38376
                Width = 103
              end
              item
                EditButtons = <>
                FieldName = 'payed'
                Footers = <>
                Title.Caption = #26159#21542#32467#26696
                Width = 56
              end
              item
                EditButtons = <>
                FieldName = 'train_feels'
                Footers = <>
                Title.Caption = #22521#35757#36153#29992
                Width = 59
              end
              item
                EditButtons = <>
                FieldName = 'actually_feels'
                Footers = <>
                Title.Caption = #23454#38469#25187#36153
                Width = 58
              end
              item
                EditButtons = <>
                FieldName = 'effective_date'
                Footers = <>
                Title.Caption = #36153#29992#26377#25928#26399
                Width = 78
              end
              item
                EditButtons = <>
                FieldName = 'ondutytime'
                Footers = <>
                Title.Caption = #20837#32844#26085#26399
                Width = 71
              end
              item
                EditButtons = <>
                FieldName = 'startdate'
                Footers = <>
                Title.Caption = #22521#35757#24320#22987#26085#26399
                Width = 73
              end
              item
                EditButtons = <>
                FieldName = 'starttime'
                Footers = <>
                Title.Caption = #24320#22987#26102#38388
                Width = 72
              end
              item
                EditButtons = <>
                FieldName = 'enddate'
                Footers = <>
                Title.Caption = #22521#35757#32467#26463#26085#26399
                Width = 77
              end
              item
                EditButtons = <>
                FieldName = 'endtime'
                Footers = <>
                Title.Caption = #32467#26463#26102#38388
                Width = 62
              end
              item
                EditButtons = <>
                FieldName = 'Train_time'
                Footers = <>
                Title.Caption = #22521#35757#26102#38271
                Width = 56
              end
              item
                EditButtons = <>
                FieldName = 'Train_place'
                Footers = <>
                Title.Caption = #22521#35757#22320#28857
                Width = 75
              end
              item
                EditButtons = <>
                FieldName = 'Teacher'
                Footers = <>
                Title.Caption = #22521#35757#35762#24072
                Width = 59
              end
              item
                EditButtons = <>
                FieldName = 'Train_grade'
                Footers = <>
                Title.Caption = #20998#25968
                Width = 66
              end
              item
                EditButtons = <>
                FieldName = 'Train_result'
                Footers = <>
                Title.Caption = #22521#35757#32467#26524
                Width = 132
              end
              item
                EditButtons = <>
                FieldName = 'item'
                Footers = <>
                Title.Caption = #22521#35757#29366#24577
                Width = 63
              end
              item
                EditButtons = <>
                FieldName = 'status'
                Footers = <>
                Title.Caption = #29366#24577
                Width = 66
              end
              item
                EditButtons = <>
                FieldName = 'flag'
                Footers = <>
                Title.Caption = #26159#21542#34987#24341#29992
                Width = 67
              end
              item
                EditButtons = <>
                FieldName = 'employee_name'
                Footers = <>
                Title.Caption = #25805#20316#20154
                Width = 61
              end
              item
                EditButtons = <>
                FieldName = 'oprate_time'
                Footers = <>
                Title.Caption = #25805#20316#26102#38388
                Width = 73
              end
              item
                EditButtons = <>
                FieldName = 'Train_content'
                Footers = <>
                Title.Caption = #22521#35757#20869#23481
                Width = 186
              end
              item
                EditButtons = <>
                FieldName = 'positionname'
                Footers = <>
                Title.Caption = #20851#38190#23703#20301
                Width = 95
              end>
          end
        end
      end
      object ts6: TTabSheet
        Caption = '6.'#22521#35757#25253#21578
        ImageIndex = 4
        object pnl8: TPanel
          Left = 0
          Top = 0
          Width = 1027
          Height = 57
          Align = alTop
          TabOrder = 0
          DesignSize = (
            1027
            57)
          object lbl_field5: TLabel
            Left = 477
            Top = 9
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = #21592#24037
          end
          object lbl5: TLabel
            Left = 238
            Top = 6
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = #37096#38376
          end
          object lbl6: TLabel
            Left = 238
            Top = 34
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = #23703#20301
          end
          object lbl7: TLabel
            Left = 20
            Top = 38
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = #35838#31243
          end
          object lbl8: TLabel
            Left = 20
            Top = 9
            Width = 26
            Height = 13
            Caption = #26376#20221
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object lbl9: TLabel
            Left = 138
            Top = 8
            Width = 13
            Height = 13
            Caption = #33267
          end
          object lbl10: TLabel
            Left = 477
            Top = 33
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = #35762#24072
          end
          object lbl_Ename: TLabel
            Left = 680
            Top = 8
            Width = 21
            Height = 13
            Caption = '...'
          end
          object edt_emp: TEdit
            Left = 509
            Top = 4
            Width = 138
            Height = 21
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object btn_SelDept: TBitBtn
            Left = 650
            Top = 5
            Width = 25
            Height = 23
            TabOrder = 1
            TabStop = False
            OnClick = btn_SelDeptClick
            Glyph.Data = {
              EE000000424DEE000000000000007600000028000000100000000F0000000100
              04000000000078000000130B0000130B00001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              888800000888880000080F000888880F00080F000888880F0008000000080000
              000800F000000F00000800F000800F00000800F000800F000008800000000000
              0088880F00080F000888880000080000088888800088800088888880F08880F0
              888888800088800088888888888888888888}
          end
          object edt_Dept: TEdit
            Left = 272
            Top = 2
            Width = 145
            Height = 21
            Enabled = False
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object btn2: TBitBtn
            Left = 412
            Top = 1
            Width = 25
            Height = 23
            TabOrder = 3
            TabStop = False
            OnClick = btn2Click
            Glyph.Data = {
              EE000000424DEE000000000000007600000028000000100000000F0000000100
              04000000000078000000130B0000130B00001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              888800000888880000080F000888880F00080F000888880F0008000000080000
              000800F000000F00000800F000800F00000800F000800F000008800000000000
              0088880F00080F000888880000080000088888800088800088888880F08880F0
              888888800088800088888888888888888888}
          end
          object edt_post: TEdit
            Left = 272
            Top = 30
            Width = 145
            Height = 21
            Enabled = False
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object btn_SelPost: TBitBtn
            Left = 412
            Top = 29
            Width = 25
            Height = 23
            TabOrder = 5
            TabStop = False
            OnClick = btn_SelPostClick
            Glyph.Data = {
              EE000000424DEE000000000000007600000028000000100000000F0000000100
              04000000000078000000130B0000130B00001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              888800000888880000080F000888880F00080F000888880F0008000000080000
              000800F000000F00000800F000800F00000800F000800F000008800000000000
              0088880F00080F000888880000080000088888800088800088888880F08880F0
              888888800088800088888888888888888888}
          end
          object edt_tc: TEdit
            Left = 53
            Top = 34
            Width = 151
            Height = 21
            Enabled = False
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 6
          end
          object btn_selDTC: TBitBtn
            Left = 206
            Top = 32
            Width = 25
            Height = 23
            TabOrder = 7
            TabStop = False
            OnClick = btn_selDTCClick
            Glyph.Data = {
              EE000000424DEE000000000000007600000028000000100000000F0000000100
              04000000000078000000130B0000130B00001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              888800000888880000080F000888880F00080F000888880F0008000000080000
              000800F000000F00000800F000800F00000800F000800F000008800000000000
              0088880F00080F000888880000080000088888800088800088888880F08880F0
              888888800088800088888888888888888888}
          end
          object BDate: TDateTimePicker
            Left = 52
            Top = 5
            Width = 81
            Height = 21
            Date = 41433.367838715280000000
            Format = 'yyyy-MM'
            Time = 41433.367838715280000000
            TabOrder = 8
          end
          object EDate: TDateTimePicker
            Left = 153
            Top = 4
            Width = 79
            Height = 21
            Date = 41433.368129699080000000
            Format = 'yyyy-MM'
            Time = 41433.368129699080000000
            TabOrder = 9
          end
          object edt_teacher: TEdit
            Left = 509
            Top = 28
            Width = 138
            Height = 21
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 10
          end
          object btn_qry5: TBitBtn
            Left = 782
            Top = 6
            Width = 65
            Height = 45
            Anchors = [akRight]
            Caption = #26597#35810
            TabOrder = 11
            OnClick = btn_qry5Click
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
          object btn_export567: TBitBtn
            Left = 854
            Top = 9
            Width = 65
            Height = 40
            Anchors = [akRight]
            Caption = #23548#20986'5'
            TabOrder = 12
            OnClick = btn_export567Click
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
        end
        object pnl11: TPanel
          Left = 0
          Top = 57
          Width = 1027
          Height = 500
          Align = alClient
          TabOrder = 1
          object pgc2: TPageControl
            Left = 1
            Top = 1
            Width = 1025
            Height = 498
            ActivePage = ts8
            Align = alClient
            TabOrder = 0
            object ts8: TTabSheet
              Caption = #35762#24072#22521#35757#25253#21578
              object eh5: TDBGridEh
                Left = 0
                Top = 0
                Width = 1017
                Height = 470
                Align = alClient
                DataSource = ds5
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
                Columns = <
                  item
                    EditButtons = <>
                    FieldName = 'teacher'
                    Footers = <>
                    Title.Caption = #35762#24072
                    Width = 91
                  end
                  item
                    EditButtons = <>
                    FieldName = 'cname'
                    Footers = <>
                    Title.Caption = #35838#31243#21517#31216
                    Width = 108
                  end
                  item
                    EditButtons = <>
                    FieldName = 'CType'
                    Footers = <>
                    Title.Caption = #22521#35757#31867#21035
                    Width = 124
                  end
                  item
                    EditButtons = <>
                    FieldName = 'TType'
                    Footers = <>
                    Title.Caption = #22521#35757#26041#24335
                  end
                  item
                    EditButtons = <>
                    FieldName = 'EType'
                    Footers = <>
                    Title.Caption = #32771#26680#26041#24335
                  end
                  item
                    EditButtons = <>
                    FieldName = 'Tmonth'
                    Footers = <>
                    Title.Caption = #22521#35757#26376#20221
                    Width = 99
                  end
                  item
                    EditButtons = <>
                    FieldName = 'ecount'
                    Footers = <>
                    Title.Caption = #21442#35757#20154#25968
                  end
                  item
                    EditButtons = <>
                    FieldName = 'train_grade'
                    Footers = <>
                    Title.Caption = #20154#22343#32771#26680#24471#20998
                    Width = 80
                  end
                  item
                    EditButtons = <>
                    FieldName = 'rate'
                    Footers = <>
                    Title.Caption = #32771#26680#21512#26684#29575
                  end>
              end
            end
            object ts9: TTabSheet
              Caption = #37096#38376#22521#35757#25253#21578
              ImageIndex = 1
              object eh6: TDBGridEh
                Left = 0
                Top = 0
                Width = 1008
                Height = 470
                Align = alClient
                DataSource = ds6
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
                OnDblClick = eh6DblClick
                Columns = <
                  item
                    EditButtons = <>
                    FieldName = 'pmonth'
                    Footers = <>
                    Title.Caption = #26376#20221
                  end
                  item
                    EditButtons = <>
                    FieldName = 'departmentName'
                    Footers = <>
                    Title.Caption = #37096#38376
                    Width = 108
                  end
                  item
                    EditButtons = <>
                    FieldName = 'cname'
                    Footers = <>
                    Title.Caption = #35838#31243#21517#31216
                    Width = 263
                  end
                  item
                    EditButtons = <>
                    FieldName = 'teacher'
                    Footers = <>
                    Title.Caption = #22521#35757#35762#24072
                    Width = 66
                  end
                  item
                    EditButtons = <>
                    FieldName = 'Pdate'
                    Footers = <>
                    Title.Caption = #35745#21010#22521#35757#26085#26399
                    Width = 87
                  end
                  item
                    EditButtons = <>
                    FieldName = 'IsFinished'
                    Footers = <>
                    Title.Caption = #22521#35757#23436#25104#24773#20917' '
                    Width = 85
                  end
                  item
                    EditButtons = <>
                    FieldName = 'pcount'
                    Footers = <>
                    Title.Caption = #35745#21010#22521#35757#20154#25968
                    Width = 90
                  end
                  item
                    EditButtons = <>
                    FieldName = 'RCount'
                    Footers = <>
                    Title.Caption = #23454#38469#22521#35757#20154#25968
                    Width = 87
                  end
                  item
                    EditButtons = <>
                    FieldName = 'TTime'
                    Footers = <>
                    Title.Caption = #20154#22343#22521#35757#35838#26102
                    Width = 85
                  end
                  item
                    EditButtons = <>
                    FieldName = 'Tgrade'
                    Footers = <>
                    Title.Caption = #32771#35797#21512#26684#29575
                  end>
              end
            end
            object ts10: TTabSheet
              Caption = #20010#20154#22521#35757#25253#21578
              ImageIndex = 2
              object eh7: TDBGridEh
                Left = 0
                Top = 0
                Width = 1008
                Height = 470
                Align = alClient
                DataSource = ds7
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
                Columns = <
                  item
                    EditButtons = <>
                    FieldName = 'employeecode'
                    Footers = <>
                    Title.Caption = #24037#21495
                    Width = 70
                  end
                  item
                    EditButtons = <>
                    FieldName = 'chineseName'
                    Footers = <>
                    Title.Caption = #22995#21517
                    Width = 51
                  end
                  item
                    EditButtons = <>
                    FieldName = 'cname'
                    Footers = <>
                    Title.Caption = #35838#31243#21517#31216
                    Width = 284
                  end
                  item
                    EditButtons = <>
                    FieldName = 'ctype'
                    Footers = <>
                    Title.Caption = #22521#35757#31867#21035' '
                    Width = 84
                  end
                  item
                    EditButtons = <>
                    FieldName = 'ttype'
                    Footers = <>
                    Title.Caption = #22521#35757#26041#24335
                    Width = 71
                  end
                  item
                    EditButtons = <>
                    FieldName = 'etype'
                    Footers = <>
                    Title.Caption = #32771#26680#26041#24335
                    Width = 77
                  end
                  item
                    EditButtons = <>
                    FieldName = 'train_time'
                    Footers = <>
                    Title.Caption = #22521#35757#26102#38271
                  end
                  item
                    EditButtons = <>
                    FieldName = 'TMonth'
                    Footers = <>
                    Title.Caption = #22521#35757#26376#20221
                    Width = 61
                  end
                  item
                    EditButtons = <>
                    FieldName = 'train_grade'
                    Footers = <>
                    Title.Caption = #22521#35757#20998#25968
                    Width = 74
                  end
                  item
                    EditButtons = <>
                    FieldName = 'train_result'
                    Footers = <>
                    Title.Caption = #22521#35757#32467#26524
                    Width = 75
                  end>
              end
            end
          end
        end
      end
      object ts7: TTabSheet
        Caption = '7.'#20010#20154#25805#20316#39029#38754
        ImageIndex = 5
        object pnl9: TPanel
          Left = 0
          Top = 0
          Width = 1027
          Height = 33
          Align = alTop
          TabOrder = 0
          object lbl4: TLabel
            Left = 367
            Top = 9
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = #24037#21495
          end
          object btn1: TBitBtn
            Left = 104
            Top = 1
            Width = 64
            Height = 32
            Caption = #23548#20986'6'
            TabOrder = 0
            OnClick = btn1Click
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
          object btn_qry6: TBitBtn
            Left = 577
            Top = 4
            Width = 65
            Height = 29
            Caption = #26597#35810
            TabOrder = 1
            OnClick = btn_qry6Click
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
          object edt_Ecode: TEdit
            Left = 399
            Top = 6
            Width = 91
            Height = 21
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnExit = edt_EcodeExit
            OnKeyDown = edt_EcodeKeyDown
          end
        end
        object eh66: TDBGridEh
          Left = 0
          Top = 33
          Width = 1027
          Height = 327
          Align = alClient
          DataSource = ds66
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -13
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          PopupMenu = pm71
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnKeyDown = eh66KeyDown
          Columns = <
            item
              EditButtons = <>
              FieldName = 'startdate'
              Footers = <>
              Title.Caption = #22521#35757#26085#26399
            end
            item
              EditButtons = <>
              FieldName = 'employeeCode'
              Footers = <>
              Title.Caption = #24037#21495
            end
            item
              EditButtons = <>
              FieldName = 'chineseName'
              Footers = <>
              Title.Caption = #22995#21517
              Width = 67
            end
            item
              EditButtons = <>
              FieldName = 'CCOde'
              Footers = <>
              Title.Caption = #35838#31243#32534#21495
              Width = 73
            end
            item
              EditButtons = <>
              FieldName = 'CName'
              Footers = <>
              Title.Caption = #35838#31243#21517#31216
              Width = 179
            end
            item
              EditButtons = <>
              FieldName = 'ctype'
              Footers = <>
              Title.Caption = #22521#35757#31867#21035
            end
            item
              EditButtons = <>
              FieldName = 'ttype'
              Footers = <>
              Title.Caption = #22521#35757#26041#24335
              Visible = False
              Width = 68
            end
            item
              EditButtons = <>
              FieldName = 'etype'
              Footers = <>
              Title.Caption = #32771#26680#26041#24335
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'ifFinished'
              Footers = <>
              Title.Caption = #26159#21542#23436#25104
              Width = 71
            end
            item
              EditButtons = <>
              FieldName = 'score'
              Footers = <>
              Title.Caption = #32771#26680#24471#20998
            end
            item
              EditButtons = <>
              FieldName = 'result'
              Footers = <>
              Title.Caption = #32771#26680#32467#26524
              Width = 72
            end>
        end
        object eh66_Detail: TDBGridEh
          Left = 0
          Top = 360
          Width = 1027
          Height = 197
          Align = alBottom
          DataSource = ds66_file
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -13
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          PopupMenu = pmFile
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnKeyDown = eh66_DetailKeyDown
          Columns = <
            item
              EditButtons = <>
              FieldName = 'FileName'
              Footers = <>
              Title.Caption = #35838#20214#21517#31216
            end>
        end
      end
    end
    object pnl6: TPanel
      Left = 1
      Top = 1
      Width = 1035
      Height = 41
      Align = alTop
      TabOrder = 1
      object btnExit: TBitBtn
        Left = 1
        Top = 2
        Width = 60
        Height = 39
        Hint = #36864#20986
        Caption = #36864#20986
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TabStop = False
        OnClick = btnExitClick
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
    end
  end
  object pm1: TPopupMenu
    Left = 185
    Top = 426
    object mni_add: TMenuItem
      Caption = #28155#21152
      OnClick = mni_addClick
    end
    object mni_edit: TMenuItem
      Caption = #32534#36753
      OnClick = mni_editClick
    end
    object mni_check: TMenuItem
      Caption = #26597#30475
      OnClick = mni_checkClick
    end
    object mni_Del: TMenuItem
      Caption = #21024#38500
      OnClick = mni_DelClick
    end
    object mni_import: TMenuItem
      Caption = #25209#37327#23548#20837
      OnClick = mni_importClick
    end
    object mniImportPaper: TMenuItem
      Caption = #23548#20837#35797#39064
      OnClick = mniImportPaperClick
    end
    object mniPaperDetail: TMenuItem
      Caption = #26597#30475#35797#39064
      OnClick = mniPaperDetailClick
    end
    object mni_ToPlan: TMenuItem
      Caption = #25209#37327#29983#25104#21592#24037#22521#35757#35745#21010
      Enabled = False
      Visible = False
      OnClick = mni_ToPlanClick
    end
    object mni_signIn: TMenuItem
      Caption = #22521#35757#31614#21040
      Enabled = False
      Visible = False
      OnClick = mni_signInClick
    end
  end
  object ds_TC: TDataSource
    DataSet = qry_tc
    Left = 25
    Top = 442
  end
  object ds_TCFile: TDataSource
    DataSet = qry_TCFile
    Left = 97
    Top = 432
  end
  object qry_tc: TADOQuery
    Connection = DM.con
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterScroll = qry_tcAfterScroll
    Parameters = <>
    SQL.Strings = (
      'select a.rkey,CCode,Cname'
      'from   trainclass a '
      'where 1=1')
    Left = 81
    Top = 378
  end
  object qry_TCFile: TADOQuery
    Connection = DM.con
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * FROM   trainclass_file  inner join '
      
        'Tier3_CustomerFiles on trainclass_file.FtpIDKey = Tier3_Customer' +
        'Files.IDKey'
      'WHERE trainclass_file.TClass_ptr=:rkey')
    Left = 145
    Top = 456
  end
  object pm2: TPopupMenu
    Left = 177
    Top = 498
    object mni_add2: TMenuItem
      Caption = #28155#21152
      OnClick = mni_add2Click
    end
    object mni_edit2: TMenuItem
      Caption = #32534#36753
      OnClick = mni_edit2Click
    end
    object mni_check2: TMenuItem
      Caption = #26597#30475
      OnClick = mni_check2Click
    end
    object mni_del2: TMenuItem
      Caption = #21024#38500
      OnClick = mni_del2Click
    end
    object mni_import2: TMenuItem
      Caption = #25209#37327#23548#20837
      OnClick = mni_import2Click
    end
    object mni_ToDTainPlan: TMenuItem
      Caption = #29983#25104#24180#24230#22521#35757#35745#21010
      OnClick = mni_ToDTainPlanClick
    end
    object mni_Sigin: TMenuItem
      Caption = #21047#21345#31614#21040
      OnClick = mni_SiginClick
    end
  end
  object ds_TC2: TDataSource
    DataSet = qry_TC2
    Left = 25
    Top = 496
  end
  object qry_TC2: TADOQuery
    Connection = DM.con
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        'select  a.* , t.CCode,t.Cname,dept.departmentName,d1.item as PNa' +
        'me,b.DeptID,b.PostID'
      
        ',case when b.ctype=0  then '#39#20837#32844#22521#35757#39' when b.ctype=1 then '#39#23703#21069#22521#35757#39' whe' +
        'n b.ctype=2 then '#39#22312#23703#22521#35757#39' else '#39#39' end as ctype'
      'from  DeptPostTrainClass_detail a '
      'inner join TrainClass t on a.TC_ptr=t.rkey'
      'inner join DeptPostTrainClass_main  b   on b.rkey=a.m_ptr'
      'inner join datadepartment dept on b.DeptID=dept.rkey'
      'inner join datadetail  d1 on b.PostID=d1.rkey'
      'where d1.dictid=1')
    Left = 65
    Top = 496
  end
  object qrytemp: TADOQuery
    Connection = DM.con
    Parameters = <
      item
        Name = 'code'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select  rkey'
      'from  employeemsg '
      'where  :code  in ( employeecode,'#39#39')')
    Left = 721
    Top = 418
  end
  object ds_main3: TDataSource
    DataSet = qry_main3
    Left = 65
    Top = 569
  end
  object qry_main3: TADOQuery
    Connection = DM.con
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        '  select  a.rkey, a.PMonth,a.Bdate,a.BTime, a.EDate,a.ETime,a.pd' +
        'ate,'
      
        'a.TC_ptr,a.Ttype,a.remark,a.DeptID,a.PostID,a.Teacher,a.place,a.' +
        'THours,'
      
        'case when a.IsFinished=0  then '#39#26410#23436#25104#39' else '#39#24050#23436#25104#39' end as IsFinishe' +
        'd,'
      ' c.ccode,c.cname, e.departmentname, f2.item as item2'
      'from   TrainPlan a  '
      'inner join trainclass c on c.rkey=a.tc_ptr '
      'inner join datadepartment e  on e.rkey=a.DeptId '
      'inner join datadetail f2 on f2.rkey=a.ttype  '
      'where   f2.dictid=20')
    Left = 33
    Top = 553
  end
  object pm3: TPopupMenu
    Left = 161
    Top = 562
    object mni_add3: TMenuItem
      Caption = #28155#21152'('#22312#22521#35757#38656#27714#22788#28155#21152')'
      Enabled = False
      OnClick = mni_add3Click
    end
    object mni_edit3: TMenuItem
      Caption = #32534#36753
      Visible = False
      OnClick = mni_edit3Click
    end
    object mni_check3: TMenuItem
      Caption = #26597#30475
      Visible = False
      OnClick = mni_check3Click
    end
    object mni_del3: TMenuItem
      Caption = #21024#38500
      OnClick = mni_del3Click
    end
    object mni_import3: TMenuItem
      Caption = #25209#37327#23548#20837
      OnClick = mni_import3Click
    end
    object mni_TMonthPlan: TMenuItem
      Caption = #29983#25104#26376#24230#22521#35757#35745#21010
      OnClick = mni_TMonthPlanClick
    end
    object mni_GetPlans: TMenuItem
      Caption = #25209#37327#29983#25104#21592#24037#24517#20462#22521#35757#35745#21010
      Enabled = False
      Visible = False
      OnClick = mni_GetPlansClick
    end
    object mni_Signe: TMenuItem
      Caption = #22521#35757#31614#21040
      Enabled = False
      Visible = False
      OnClick = mni_SigneClick
    end
  end
  object ds5: TDataSource
    DataSet = sp5
    Left = 637
    Top = 210
  end
  object ds6: TDataSource
    DataSet = sp6
    Left = 693
    Top = 210
  end
  object ds7: TDataSource
    DataSet = sp7
    Left = 757
    Top = 205
  end
  object qrytemp2: TADOQuery
    Connection = DM.con
    Parameters = <>
    Left = 969
    Top = 18
  end
  object pm4: TPopupMenu
    Left = 249
    Top = 562
    object mni2: TMenuItem
      Caption = #32534#36753
      OnClick = mni2Click
    end
    object mni3: TMenuItem
      Caption = #26597#30475
      OnClick = mni3Click
    end
    object mni4: TMenuItem
      Caption = #21024#38500
      OnClick = mni_del3Click
    end
    object mni_Tsigne: TMenuItem
      Caption = #22521#35757#31614#21040
      Visible = False
      OnClick = mni_TsigneClick
    end
    object mniimport4: TMenuItem
      Caption = #25209#37327#23548#20837
      OnClick = mniimport4Click
    end
  end
  object sp5: TADOStoredProc
    Connection = DM.con
    CursorType = ctStatic
    ProcedureName = 'sp_GetTeacherRpt'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@Bmonth'
        Attributes = [paNullable]
        DataType = ftString
        Size = 7
        Value = Null
      end
      item
        Name = '@Emonth'
        Attributes = [paNullable]
        DataType = ftString
        Size = 7
        Value = Null
      end
      item
        Name = '@tc_ptr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@teacher'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end>
    Left = 642
    Top = 300
  end
  object sp6: TADOStoredProc
    Connection = DM.con
    CursorType = ctStatic
    ProcedureName = 'sp_GetDeptRpt'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Bmonth'
        Attributes = [paNullable]
        DataType = ftString
        Size = 7
        Value = Null
      end
      item
        Name = '@Emonth'
        Attributes = [paNullable]
        DataType = ftString
        Size = 7
        Value = Null
      end
      item
        Name = '@tc_ptr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@deptID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 698
    Top = 300
  end
  object sp7: TADOStoredProc
    Connection = DM.con
    CursorType = ctStatic
    ProcedureName = 'sp_GetMyRpt'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@Bmonth'
        Attributes = [paNullable]
        DataType = ftString
        Size = 7
        Value = '2017-01'
      end
      item
        Name = '@Emonth'
        Attributes = [paNullable]
        DataType = ftString
        Size = 7
        Value = '2017-01'
      end
      item
        Name = '@tc_ptr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@DeptID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@PostID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@Ecode'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = #39#39
      end>
    Left = 754
    Top = 300
  end
  object ds66: TDataSource
    DataSet = qry66
    Left = 917
    Top = 538
  end
  object qry66: TADOQuery
    Connection = DM.con
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterScroll = qry66AfterScroll
    Parameters = <
      item
        Name = 'ecode'
        Size = -1
        Value = Null
      end
      item
        Name = 'ecode'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'select startdate, a.tc_ptr,e.rkey, e.employeeCode,e.chineseName,' +
        'C.CCOde, C.CName,a.rkey as rkeyT,'
      
        'case when a.ctype=0  then '#39#20837#32844#22521#35757#39' when a.ctype=1 then '#39#23703#21069#22521#35757#39' when' +
        ' a.ctype=2 then '#39#22312#23703#22521#35757#39' else '#39#39' end as ctype, '
      
        'case when a.ttype=0  then '#39#35838#22530#38754#25480#39' when a.ttype=1 then '#39#23454#25805#22521#35757#39' when' +
        ' a.ttype=2 then '#39#22312#32447#22521#35757#39' else '#39#39' end as ttype ,'
      
        'case when a.etype=0  then '#39#21475#35797#32771#26680#39'  when a.etype=1  then '#39#31508#35797#32771#26680#39'  w' +
        'hen a.etype=2  then '#39#23454#25805#32771#26680#39'  when a.etype=3  then '#39#22312#32447#32771#26680#39' else '#39#39' ' +
        'end as etype ,'
      
        #39#24050#23436#25104#39'   as ifFinished,  a.train_grade as score, a.train_result a' +
        's result,e.departmentid,e.position, -1 as ctype_2 '
      'from employee_train a '
      'inner join trainClass c on  a.tc_ptr =c.rkey'
      'inner join employeemsg e on a.employeeid=e.rkey '
      'where  1=1    and  e.employeeCode= :ecode'
      ' union all  '
      
        'select  null as startdate, b.tc_ptr,e.rkey,e.employeeCode,e.chin' +
        'eseName,C.CCOde, C.CName,f.rkey as rkeyT,'
      
        'case when a.ctype=0  then '#39#20837#32844#22521#35757#39' when a.ctype=1 then '#39#23703#21069#22521#35757#39' when' +
        ' a.ctype=2 then '#39#22312#23703#22521#35757#39' else '#39#39' end as ctype, '
      
        'case when f.ttype=0  then '#39#35838#22530#38754#25480#39' when f.ttype=1 then '#39#23454#25805#22521#35757#39' when' +
        ' f.ttype=2 then '#39#22312#32447#22521#35757#39' else '#39#39' end as ttype ,'
      
        'case when f.etype=0  then '#39#21475#35797#32771#26680#39'  when f.etype=1  then '#39#31508#35797#32771#26680#39'  w' +
        'hen f.etype=2  then '#39#23454#25805#32771#26680#39'  when f.etype=3  then '#39#22312#32447#32771#26680#39' else '#39#39' ' +
        'end as etype ,'
      
        #39#26410#23436#25104#39' as ifFinished, '#39#39' as score, '#39' '#39' as  result ,e.departmentid' +
        ',e.position,a.ctype as ctype_2'
      'from DeptPostTrainClass_main  a'
      'inner join DeptPostTrainClass_Detail b on a.rkey=b.M_ptr'
      
        'inner join employeemsg e on a.DeptID=e.departmentID and a.PostID' +
        '=e.Position'
      'inner join trainClass c on b.tc_ptr=c.rkey'
      
        'left join employee_train  f on a.deptID=f.DeptID and a.POstID=f.' +
        'POstID and b.tc_ptr=f.tc_ptr  and e.rkey=f.employeeID'
      'where f.rkey is null   and   e.employeeCode= :ecode'
      'order by  startdate desc')
    Left = 957
    Top = 538
  end
  object ds66_file: TDataSource
    DataSet = qry66_file
    Left = 725
    Top = 570
  end
  object qry66_file: TADOQuery
    Connection = DM.con
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * FROM   trainclass_file  inner join '
      
        'Tier3_CustomerFiles on trainclass_file.FtpIDKey = Tier3_Customer' +
        'Files.IDKey'
      'WHERE trainclass_file.TClass_ptr=:rkey')
    Left = 797
    Top = 562
  end
  object pmFile: TPopupMenu
    Left = 452
    Top = 511
    object mnistudy: TMenuItem
      Caption = #35838#20214#23398#20064
      OnClick = mnistudyClick
    end
  end
  object ds_TrainRecord: TDataSource
    DataSet = qry_TrainRecord
    Left = 261
    Top = 243
  end
  object qry_TrainRecord: TADOQuery
    Connection = DM.con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     dbo.Employee_Train.rkey, dbo.Employee_Train.employeei' +
        'd, dbo.v_employeemsg.employeecode, dbo.v_employeemsg.chinesename' +
        ', '
      
        '                      dbo.v_employeemsg.departmentname, dbo.Empl' +
        'oyee_Train.Train_NO, dbo.Employee_Train.Train_topics, dbo.Employ' +
        'ee_Train.startdate, '
      
        '                      dbo.Employee_Train.starttime, dbo.Employee' +
        '_Train.enddate, dbo.Employee_Train.endtime, dbo.Employee_Train.T' +
        'rain_time, '
      
        '                      dbo.Employee_Train.Teacher, dbo.Employee_T' +
        'rain.Train_place, dbo.Employee_Train.Train_grade, dbo.Employee_T' +
        'rain.Train_result, '
      
        '                      dbo.Employee_Train.Train_content, dbo.Empl' +
        'oyee_Train.Train_status ,v_employeemsg.ondutytime,'
      
        #9#9#9#9#9'  case dbo.Employee_Train.Train_status when 0 then '#39#26410#23436#25104#39' wh' +
        'en 1 then '#39#23436#25104#39' end as status, dbo.Employee_Train.type_ptr, dbo.d' +
        'atadetail.item, '
      
        '                      case  when dbo.Employee_Train.ptr_flag=0 t' +
        'hen '#39#26410#29992#39' when dbo.Employee_Train.ptr_flag=1 then '#39#24341#29992#39' end as fla' +
        'g, dbo.Employee_Train.ptr_flag,'
      
        #9#9#9#9#9'  dbo.Employee_Train.train_feels, dbo.Employee_Train.effect' +
        'ive_date, dbo.Employee_Train.feels_payed, '
      
        '                      case dbo.Employee_Train.feels_payed when 0' +
        ' then '#39#26410#32467#28165#39' when 1 then '#39#24050#32467#28165#39' end as payed,actually_feels,'
      
        '                      dbo.Employee_Train.oprator_ptr, data0005.e' +
        'mployee_name,dbo.Employee_Train.oprate_time,hr_KeyPosition.posit' +
        'ionname'
      
        '                      ,case when Employee_Train.cType=0 then '#39#20837#32844 +
        #22521#35757#39'  when Employee_Train.cType=1 then '#39#23703#21069#22521#35757#39'  when  Employee_Tra' +
        'in.cType=2 then '#39#22312#23703#22521#35757#39' else '#39#39' end  as cType, '
      
        '                        case when Employee_Train.TType=0 then '#39#35838 +
        #22530#38754#25480#39'  when Employee_Train.TType=1 then '#39#23454#25805#22521#35757#39'   when  Employee_T' +
        'rain.TType=2 then '#39#22312#32447#22521#35757#39'  else '#39#39' end  as TType,  '
      
        '                        case when Employee_Train.EType=0 then '#39#21475 +
        #35797#32771#26680#39'  when Employee_Train.EType=1 then '#39#31508#35797#32771#26680#39' when Employee_Trai' +
        'n.EType=2 then '#39#23454#25805#32771#26680#39'   when  Employee_Train.EType=3 then  '#39#22312#32447#32771#26680 +
        #39'  else '#39#39' end  as EType'
      '                ,c.ccode,position_item,c.cname'
      'FROM         dbo.Employee_Train INNER JOIN'
      
        '                      dbo.v_employeemsg ON dbo.Employee_Train.em' +
        'ployeeid = dbo.v_employeemsg.rkey INNER JOIN'
      
        '                      dbo.datadetail ON dbo.Employee_Train.type_' +
        'ptr = dbo.datadetail.rkey LEFT OUTER JOIN'
      
        '                      dbo.Data0005 ON dbo.Employee_Train.oprator' +
        '_ptr = dbo.Data0005.RKEY LEFT JOIN'
      
        '                      hr_KeyPosition ON dbo.Employee_Train.KeyPo' +
        'sitionId = hr_KeyPosition.rkey'
      'left  join trainclass   c on  Employee_Train.tc_ptr=c.rkey'
      'where  train_feels=0 ')
    Left = 349
    Top = 243
  end
  object pm5: TPopupMenu
    Left = 433
    Top = 242
    object mni1: TMenuItem
      Caption = #28155#21152
      Visible = False
      OnClick = mni_add2Click
    end
    object mni5: TMenuItem
      Caption = #32534#36753
      Visible = False
      OnClick = mni_edit2Click
    end
    object mni6: TMenuItem
      Caption = #26597#30475
      Visible = False
      OnClick = mni_check2Click
    end
    object mni7: TMenuItem
      Caption = #21024#38500
      OnClick = mni7Click
    end
    object mni8: TMenuItem
      Caption = #25209#37327#23548#20837
      OnClick = mni8Click
    end
  end
  object pm71: TPopupMenu
    Left = 445
    Top = 322
    object mniEXam: TMenuItem
      Caption = #24320#22987#32771#35797
      OnClick = mniEXamClick
    end
  end
  object pm1_2: TPopupMenu
    Left = 268
    Top = 511
    object mniLook: TMenuItem
      Caption = #26597#30475#35838#20214
      OnClick = mniLookClick
    end
  end
end
