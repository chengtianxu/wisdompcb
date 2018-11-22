object FrmCostAnalyse: TFrmCostAnalyse
  Left = 362
  Top = 232
  Width = 981
  Height = 599
  Caption = #25104#26412#20013#24515#25104#26412#36235#21183#20998#26512
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 965
    Height = 561
    Align = alClient
    TabOrder = 0
    object pnl2: TPanel
      Left = 1
      Top = 1
      Width = 963
      Height = 48
      Align = alTop
      TabOrder = 0
      object lbl1: TLabel
        Left = 300
        Top = 11
        Width = 65
        Height = 13
        Caption = #26680#31639#26399#38388#65306
      end
      object Label1: TLabel
        Left = 467
        Top = 9
        Width = 28
        Height = 13
        Caption = '----'
      end
      object lbl3: TLabel
        Left = 688
        Top = 12
        Width = 143
        Height = 13
        Caption = #26085#26399#20197#26399#38388#32467#26463#26085#26399#32479#35745
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object btn1: TBitBtn
        Left = 2
        Top = 5
        Width = 63
        Height = 31
        Caption = #36864#20986
        TabOrder = 0
        OnClick = btn1Click
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
      object dtp1: TDateTimePicker
        Left = 363
        Top = 6
        Width = 103
        Height = 21
        Date = 42579.678130532400000000
        Format = 'yyyy-MM-dd'
        Time = 42579.678130532400000000
        TabOrder = 1
      end
      object dtp2: TDateTimePicker
        Left = 497
        Top = 6
        Width = 97
        Height = 21
        Date = 42579.678537314820000000
        Format = 'yyyy-MM-dd'
        Time = 42579.678537314820000000
        TabOrder = 2
      end
      object btn_export: TBitBtn
        Left = 67
        Top = 5
        Width = 59
        Height = 31
        Caption = #23548#20986
        TabOrder = 3
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
      object btn_qry: TButton
        Left = 593
        Top = 4
        Width = 75
        Height = 25
        Caption = #26597#35810
        TabOrder = 4
        OnClick = btn_qryClick
      end
    end
    object pnl3: TPanel
      Left = 1
      Top = 49
      Width = 963
      Height = 511
      Align = alClient
      TabOrder = 1
      object pgc1: TPageControl
        Left = 1
        Top = 1
        Width = 961
        Height = 509
        ActivePage = ts1
        Align = alClient
        TabOrder = 0
        object ts1: TTabSheet
          Caption = #25104#26412#26126#32454
          object pnl4: TPanel
            Left = 0
            Top = 0
            Width = 953
            Height = 34
            Align = alTop
            TabOrder = 0
            object lbl_field: TLabel
              Left = 384
              Top = 8
              Width = 78
              Height = 13
              Caption = #25104#26412#20013#24515#21517#31216
            end
            object lbl34: TLabel
              Left = 194
              Top = 9
              Width = 26
              Height = 13
              Caption = #24037#21378
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object cbb_WH: TComboBox
              Left = 224
              Top = 5
              Width = 145
              Height = 21
              ItemHeight = 13
              TabOrder = 0
              OnChange = cbb_WHChange
            end
            object cbb_cost: TComboBox
              Left = 464
              Top = 5
              Width = 145
              Height = 21
              ItemHeight = 13
              TabOrder = 1
              OnChange = cbb_costChange
            end
          end
          object pnl5: TPanel
            Left = 0
            Top = 34
            Width = 953
            Height = 447
            Align = alClient
            TabOrder = 1
            object dbgrdh1: TDBGridEh
              Left = 1
              Top = 1
              Width = 951
              Height = 445
              Align = alClient
              DataSource = ds1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              FooterColor = clWindow
              FooterFont.Charset = DEFAULT_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -13
              FooterFont.Name = #23435#20307
              FooterFont.Style = [fsBold]
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -13
              TitleFont.Name = #23435#20307
              TitleFont.Style = []
              OnTitleClick = dbgrdh1TitleClick
              Columns = <
                item
                  EditButtons = <>
                  FieldName = #24037#21378
                  Footers = <>
                  Width = 92
                end
                item
                  EditButtons = <>
                  FieldName = #24320#22987#26085#26399
                  Footers = <>
                  Width = 68
                end
                item
                  EditButtons = <>
                  FieldName = #32467#26463#26085#26399
                  Footers = <>
                  Width = 67
                end
                item
                  EditButtons = <>
                  FieldName = #25104#26412#20013#24515#20195#30721
                  Footers = <>
                  Width = 86
                end
                item
                  EditButtons = <>
                  FieldName = #25104#26412#20013#24515#21517#31216
                  Footers = <>
                  Width = 85
                end
                item
                  EditButtons = <>
                  FieldName = #20135#20986#38754#31215
                  Footers = <>
                  Width = 72
                end
                item
                  EditButtons = <>
                  FieldName = #22806#21457#29983#20135#38754#31215
                  Footers = <>
                  Width = 83
                end
                item
                  EditButtons = <>
                  FieldName = #30452#25509#20154#24037
                  Footers = <>
                  Width = 68
                end
                item
                  EditButtons = <>
                  FieldName = #35774#22791#25240#26087
                  Footers = <>
                  Width = 85
                end
                item
                  EditButtons = <>
                  FieldName = #27700#30005#20854#23427
                  Footers = <>
                  Width = 75
                end
                item
                  EditButtons = <>
                  FieldName = #22806#21457#36153#29992
                  Footers = <>
                  Width = 58
                end
                item
                  EditButtons = <>
                  FieldName = #20108#31867#26448#26009
                  Footers = <>
                  Width = 70
                end
                item
                  EditButtons = <>
                  FieldName = #19968#31867#26448#26009#25104#26412
                  Footers = <>
                  Width = 88
                end
                item
                  EditButtons = <>
                  FieldName = #27599#24179#31859#21046#36896#36153#29992
                  Footers = <>
                  Width = 102
                end
                item
                  EditButtons = <>
                  FieldName = #27599#24179#31859#26448#26009#36153#29992
                  Footers = <>
                  Width = 97
                end
                item
                  EditButtons = <>
                  FieldName = #27599#24179#31859#22806#21457#36153#29992
                  Footers = <>
                  Width = 99
                end>
            end
          end
        end
        object ts2: TTabSheet
          Caption = #20998#26512#22270#34920
          ImageIndex = 1
          object pnl6: TPanel
            Left = 0
            Top = 0
            Width = 953
            Height = 32
            Align = alTop
            TabOrder = 0
            DesignSize = (
              953
              32)
            object lbl2: TLabel
              Left = 130
              Top = 9
              Width = 65
              Height = 13
              Caption = #25104#26412#39033#30446#65306
            end
            object btn7: TSpeedButton
              Left = 682
              Top = 7
              Width = 26
              Height = 25
              Hint = #19979#19968#39029
              Anchors = [akTop, akRight]
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000000000000000000000000000000000000FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF0080000000FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF0080000000FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF008000000080000000FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00800000008000000080000000FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00800000008000000080000000800000008000
                0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00800000008000000080000000800000008000
                0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00800000008000000080000000800000008000
                0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF0080000000800000008000000080000000FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF008000000080000000FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF0080000000FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF0080000000FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
              ParentShowHint = False
              ShowHint = True
              OnClick = btn7Click
            end
            object btn6: TSpeedButton
              Left = 654
              Top = 7
              Width = 26
              Height = 25
              Hint = #19978#19968#39029
              Anchors = [akTop, akRight]
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000000000000000000000000000000000000FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF0080000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF0080000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008000
                000080000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00800000008000
                000080000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF008000000080000000800000008000
                000080000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF008000000080000000800000008000
                000080000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF008000000080000000800000008000
                000080000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0080000000800000008000
                000080000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008000
                000080000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF0080000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF0080000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
              ParentShowHint = False
              ShowHint = True
              OnClick = btn6Click
            end
            object btn5: TSpeedButton
              Left = 627
              Top = 8
              Width = 25
              Height = 24
              Hint = #32553#23567
              Anchors = [akTop, akRight]
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000000000000000000000000000000000000FF00FF000000
                000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
                00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00000000000000000000000000FF00FF0080808000000000000000
                0000000000000000000080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF0000000000000000000000000000000000C0C0C000C0C0
                C000C0C0C000C0C0C0000000000000000000FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF000000000080808000FFFF0000FFFF0000C0C0
                C000C0C0C000C0C0C000C0C0C0008080800000000000FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF008080800000000000C0C0C000FFFF0000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C0000000000080808000FF00FF00FF00
                FF00FF00FF00FF00FF0000000000C0C0C000FFFF0000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000000000FF00FF00FF00
                FF00FF00FF00FF00FF0000000000C0C0C000C0C0C00000000000000000000000
                0000000000000000000000000000C0C0C000C0C0C00000000000FF00FF00FF00
                FF00FF00FF00FF00FF0000000000C0C0C000C0C0C00000000000000000000000
                0000000000000000000000000000FFFF0000C0C0C00000000000FF00FF00FF00
                FF00FF00FF00FF00FF0000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000C0C0C000FFFF0000C0C0C00000000000FF00FF00FF00
                FF00FF00FF00FF00FF008080800000000000C0C0C000C0C0C000C0C0C000C0C0
                C000C0C0C000C0C0C000FFFF0000FFFF00000000000080808000FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF000000000080808000C0C0C000C0C0C000C0C0
                C000FFFF0000FFFF0000FFFF00008080800000000000FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000C0C0C000C0C0
                C000C0C0C000C0C0C0000000000000000000FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000000000000000
                0000000000000000000080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
              ParentShowHint = False
              ShowHint = True
              OnClick = btn5Click
            end
            object btn4: TSpeedButton
              Left = 599
              Top = 8
              Width = 25
              Height = 24
              Hint = #25918#22823
              Anchors = [akTop, akRight]
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000000000000000000000000000000000000FF00FF000000
                000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
                00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00000000000000000000000000FF00FF0080808000000000000000
                0000000000000000000080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF0000000000000000000000000000000000C0C0C000C0C0
                C000C0C0C000C0C0C0000000000000000000FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF000000000080808000FFFF0000FFFF0000C0C0
                C000C0C0C000C0C0C000C0C0C0008080800000000000FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF008080800000000000C0C0C000FFFF0000C0C0C0000000
                000000000000C0C0C000C0C0C000C0C0C0000000000080808000FF00FF00FF00
                FF00FF00FF00FF00FF0000000000C0C0C000FFFF0000C0C0C000C0C0C0000000
                000000000000C0C0C000C0C0C000C0C0C000C0C0C00000000000FF00FF00FF00
                FF00FF00FF00FF00FF0000000000C0C0C000C0C0C00000000000000000000000
                0000000000000000000000000000C0C0C000C0C0C00000000000FF00FF00FF00
                FF00FF00FF00FF00FF0000000000C0C0C000C0C0C00000000000000000000000
                0000000000000000000000000000FFFF0000C0C0C00000000000FF00FF00FF00
                FF00FF00FF00FF00FF0000000000C0C0C000C0C0C000C0C0C000C0C0C0000000
                000000000000C0C0C000C0C0C000FFFF0000C0C0C00000000000FF00FF00FF00
                FF00FF00FF00FF00FF008080800000000000C0C0C000C0C0C000C0C0C0000000
                000000000000C0C0C000FFFF0000FFFF00000000000080808000FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF000000000080808000C0C0C000C0C0C000C0C0
                C000FFFF0000FFFF0000FFFF00008080800000000000FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000C0C0C000C0C0
                C000C0C0C000C0C0C0000000000000000000FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000000000000000
                0000000000000000000080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
              ParentShowHint = False
              ShowHint = True
              OnClick = btn4Click
            end
            object btn3: TSpeedButton
              Left = 572
              Top = 7
              Width = 25
              Height = 25
              Hint = #20445#23384#22270#29255
              Anchors = [akTop, akRight]
              Glyph.Data = {
                C6050000424DC605000000000000360400002800000014000000140000000100
                08000000000090010000C40E0000C40E0000000100000000000000000000E8E0
                18008868080048484800D8D8E000C8C8C8001078F00070500000B0900800F8F8
                F800A8880800D0D8D800B8A81000A0800800C8D0D000E8E8E80068686800B0A0
                100098700800A8900800D0D0D000D8D8D80090700800B0981000C0A81000E0E0
                E0009878080090680800A0880800D8E0D800B8A01000B0901000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000100000000
                000000130000301A1600000000000000E400F712000035A6FC00770000001300
                0700A7FC7700080613000083A600FC7700000000000035A5FC0077FFFF000000
                6800010000000000000000000000000000000000000000000000000000000000
                31000000000000E2EC0000640000660000004716000078011300000047001600
                780001130000F8461600000000000000C000F7120000C8F3EB007770F5001200
                0000ECFD7F0002000000000000001300AF000000000001000A0000884000F877
                30001A1600000100000000998400E6775400F71200000101010001D8F8001200
                450090FB7700801FF80077FFFF00FFFF6000F8120000AD84E6007760F8001200
                D80084E677000000000000FFFF000000C800E2EC0000C8E2EC00001800000000
                00000000000044F8120000400000000000000000000028F81200000000000000
                00000000000000000000000C000000000200000000000101120000872B00F877
                0000ECFD7F00000000000002000000006C00001A0200381A1600007FFF00FFFF
                000000000000381A1600000500000000870031E6770084F8120000218600E677
                9800F81200006713000010FFFF000000680001000000C8E2EC00000000000000
                7000F8120000ACF8120000D8F8001200100030001000F8400000105F5400E677
                680001000000D0F8120000D8F80012000800000000000E0000000F0505BF05BF
                05BF05BF05BF05BF05BF05BF05C7BF0000000000000000000000000000000000
                00050500E1138CE0E0E0E0E0E0E0E0E0E006BD1B00BFBF00031305050505BF05
                050505050505181B00050500C60705050F050FC70F050FC70FBF011B00BFBF00
                011B05A7C7090383BF0503030305011300050500010705091003050503031003
                0305011B00BFBF00011BBF031005BF03101010101005181300050500010705C7
                0FC709C70FC70FC70F05011300BFBF00011B03171017101710171017101B1B18
                00050500011318131813181B181318131813181300BFBF0001181BC601C618C6
                01C601C60101181800050500E11713000003C210050505050510C61800BFBF00
                01181B000010C705C705BF0FC71718C600050500E113180000100F0505000005
                A717C61800BFBF0001C61B000010C70505000005C71718C600050500E1171300
                00100F05050000050F10C60100BFBF00BD0101000010090F0510100FC7170101
                00E90500000000000300000000000000000000000005C705BF05BF0509E9BF05
                BF05BF05BF05BF05BF09}
              ParentShowHint = False
              ShowHint = True
              OnClick = btn3Click
            end
            object btn_print: TSpeedButton
              Left = 544
              Top = 7
              Width = 26
              Height = 25
              Hint = #25171#21360#22270#29255
              Anchors = [akTop, akRight]
              Glyph.Data = {
                26050000424D26050000000000003604000028000000100000000F0000000100
                080000000000F000000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
                A400000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
                0707070707070707070707070000000000000000000000070707070007070707
                0707070707000700070700000000000000000000000000070007000707070707
                07FBFBFB07070000000700070707070707101010070700070007000000000000
                0000000000000007070000070707070707070707070007000700070000000000
                00000000000700070000070700FFFFFFFFFFFFFFFF000700070007070700FF00
                00000000FF000000000707070700FFFFFFFFFFFFFFFF000707070707070700FF
                0000000000FF000707070707070700FFFFFFFFFFFFFFFF000707070707070700
                00000000000000000707}
              ParentShowHint = False
              ShowHint = True
              OnClick = btn_printClick
            end
            object cbb_CostItem: TComboBox
              Left = 190
              Top = 4
              Width = 145
              Height = 21
              ItemHeight = 13
              TabOrder = 0
              OnChange = cbb_CostItemChange
            end
            object ud1: TUpDown
              Left = 738
              Top = 11
              Width = 16
              Height = 21
              Anchors = [akTop, akRight]
              Associate = edt_PCount
              Max = 30
              Position = 10
              TabOrder = 1
            end
            object edt_PCount: TEdit
              Left = 717
              Top = 11
              Width = 21
              Height = 21
              Anchors = [akTop, akRight]
              TabOrder = 2
              Text = '10'
              OnChange = edt_PCountChange
            end
          end
          object pnl7: TPanel
            Left = 0
            Top = 32
            Width = 953
            Height = 449
            Align = alClient
            TabOrder = 1
            object cht1: TChart
              Left = 1
              Top = 1
              Width = 951
              Height = 447
              AllowPanning = pmNone
              AnimatedZoom = True
              BackWall.Brush.Color = clWhite
              BackWall.Brush.Style = bsClear
              BackWall.Color = clSilver
              BottomWall.Brush.Color = clWhite
              BottomWall.Brush.Style = bsClear
              LeftWall.Brush.Color = clWhite
              LeftWall.Brush.Style = bsClear
              Title.Alignment = taLeftJustify
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clBlue
              Title.Font.Height = -16
              Title.Font.Name = #23435#20307
              Title.Font.Style = []
              Title.Text.Strings = (
                #25104#26412#20013#24515#25104#26412#36235#21183#20998#26512)
              BackColor = clSilver
              BottomAxis.LabelsAngle = 270
              LeftAxis.AxisValuesFormat = '0'
              LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
              LeftAxis.LabelsFont.Color = clBlack
              LeftAxis.LabelsFont.Height = -12
              LeftAxis.LabelsFont.Name = 'Arial'
              LeftAxis.LabelsFont.Style = []
              LeftAxis.LabelsSeparation = 20
              LeftAxis.Title.Caption = #37329#39069
              LeftAxis.Title.Font.Charset = ANSI_CHARSET
              LeftAxis.Title.Font.Color = clBlue
              LeftAxis.Title.Font.Height = -16
              LeftAxis.Title.Font.Name = #23435#20307
              LeftAxis.Title.Font.Style = []
              Legend.ShadowSize = 2
              Legend.VertMargin = 4
              MaxPointsPerPage = 10
              RightAxis.AxisValuesFormat = '0'
              TopAxis.Axis.Width = 1
              TopAxis.AxisValuesFormat = '0'
              Align = alClient
              BevelOuter = bvLowered
              BorderWidth = 1
              Color = 13160660
              TabOrder = 0
              object Series1: TBarSeries
                ColorEachPoint = True
                Marks.ArrowLength = 10
                Marks.BackColor = clGray
                Marks.Frame.Visible = False
                Marks.Style = smsValue
                Marks.Transparent = True
                Marks.Visible = True
                SeriesColor = clRed
                ShowInLegend = False
                ValueFormat = '0.00'
                AutoMarkPosition = False
                BarBrush.Color = clWhite
                BarStyle = bsRectGradient
                Dark3D = False
                SideMargins = False
                XValues.DateTime = False
                XValues.Name = 'X'
                XValues.Multiplier = 1.000000000000000000
                XValues.Order = loAscending
                YValues.DateTime = False
                YValues.Name = 'Bar'
                YValues.Multiplier = 1.000000000000000000
                YValues.Order = loNone
              end
            end
          end
        end
      end
    end
  end
  object ds1: TDataSource
    DataSet = qry_detail
    Left = 1158
    Top = 19
  end
  object qry_detail: TADOQuery
    Connection = DM.con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select  d.rkey, d.abbr_name as '#24037#21378', convert(varchar(7),a.end_date' +
        ',120) as '#26376#20221',a.FM_date as '#24320#22987#26085#26399',a.end_date as '#32467#26463#26085#26399',c.dept_code as ' +
        #25104#26412#20013#24515#20195#30721', c.dept_name '#25104#26412#20013#24515#21517#31216','
      
        'convert(numeric(18,2),isnull(yield_sqft,0)) as '#20135#20986#38754#31215',convert(nume' +
        'ric(18,2),isnull(yield_sqft_wf,0)) as '#22806#21457#29983#20135#38754#31215', '
      
        'convert(numeric(18,2),isnull(OVHD_1,0)) as '#30452#25509#20154#24037', convert(numeric' +
        '(18,2),isnull(OVHD_2,0)) as  '#35774#22791#25240#26087',convert(numeric(18,2),isnull(O' +
        'VHD_3,0)) as  '#27700#30005#20854#23427','
      'convert(numeric(18,2),isnull(OVHD_4,0)) as '#22806#21457#36153#29992','
      
        'convert(numeric(18,2),isnull(OVHD_5,0)) as  '#20108#31867#26448#26009',convert(numeric' +
        '(18,2),isnull(OVHD_MTAL_1,0))'#9'as '#19968#31867#26448#26009#25104#26412' ,'
      
        'convert(numeric(18,2),(case when isnull(yield_sqft,0)>0 then (is' +
        'null(OVHD_1,0) + isnull(OVHD_2,0)+isnull(OVHD_3,0))/isnull(yield' +
        '_sqft,0)  else 0 end)) as '#27599#24179#31859#21046#36896#36153#29992','
      
        'convert(numeric(18,2),case when isnull(yield_sqft,0)>0  then  (i' +
        'snull(OVHD_5,0)+isnull(OVHD_MTAL_1,0))/isnull(yield_sqft,0) else' +
        ' 0 end ) as '#27599#24179#31859#26448#26009#36153#29992','
      
        ' convert(numeric(18,2),(case when isnull(yield_sqft_wf,0)>0 then' +
        '  isnull(OVHD_4,0)/isnull(yield_sqft_wf,0) else 0 end))  as '#27599#24179#31859#22806 +
        #21457#36153#29992'     '
      'from  data0451 a '
      'left join data0424 b on a.rkey=b.D0451_ptr'
      'inner join data0034 c on b.dept_ptr=c.rkey '
      'inner join data0015 d on b.warehouse_ptr=d.rkey '
      'where 1=1')
    Left = 158
    Top = 51
    object strngfld_detailDSDesigner1: TStringField
      FieldName = #24037#21378
      Size = 10
    end
    object strngfld_detailDSDesigner: TStringField
      FieldName = #26376#20221
      ReadOnly = True
      Size = 7
    end
    object dtmfld_detailDSDesigner2: TDateTimeField
      FieldName = #24320#22987#26085#26399
    end
    object dtmfld_detailDSDesigner3: TDateTimeField
      FieldName = #32467#26463#26085#26399
    end
    object strngfld_detailDSDesigner4: TStringField
      FieldName = #25104#26412#20013#24515#20195#30721
      Size = 10
    end
    object strngfld_detailDSDesigner5: TStringField
      FieldName = #25104#26412#20013#24515#21517#31216
      Size = 30
    end
    object bcdfld_detailDSDesigner6: TBCDField
      FieldName = #20135#20986#38754#31215
      ReadOnly = True
      Precision = 19
    end
    object bcdfld_detailDSDesigner7: TBCDField
      FieldName = #22806#21457#29983#20135#38754#31215
      ReadOnly = True
      Precision = 18
    end
    object bcdfld_detailDSDesigner8: TBCDField
      FieldName = #30452#25509#20154#24037
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object bcdfld_detailDSDesigner9: TBCDField
      FieldName = #35774#22791#25240#26087
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object bcdfld_detailDSDesigner10: TBCDField
      FieldName = #27700#30005#20854#23427
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object bcdfld_detailDSDesigner11: TBCDField
      FieldName = #22806#21457#36153#29992
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object bcdfld_detailDSDesigner12: TBCDField
      FieldName = #20108#31867#26448#26009
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object bcdfld_detailDSDesigner13: TBCDField
      FieldName = #19968#31867#26448#26009#25104#26412
      ReadOnly = True
      Precision = 12
      Size = 2
    end
    object bcdfld_detailDSDesigner14: TBCDField
      FieldName = #27599#24179#31859#21046#36896#36153#29992
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object bcdfld_detailDSDesigner15: TBCDField
      FieldName = #27599#24179#31859#26448#26009#36153#29992
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object bcdfld_detailDSDesigner16: TBCDField
      FieldName = #27599#24179#31859#22806#21457#36153#29992
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object atncfld_detailrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object qry_period: TADOQuery
    Connection = DM.con1
    Parameters = <>
    Left = 265
    Top = 1
  end
  object dlgPnt1: TPrintDialog
    Left = 672
    Top = 32
  end
  object dlgSP1: TSavePictureDialog
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Left = 712
    Top = 40
  end
  object qry_cost: TADOQuery
    Connection = DM.con1
    Parameters = <
      item
        Name = 'BDate'
        Size = -1
        Value = Null
      end
      item
        Name = 'EDate'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select distinct   dept_name'
      'from'
      
        '(select  d.abbr_name  , convert(varchar(7),a.end_date,120) as  '#26376 +
        #20221',a.FM_date as '#24320#22987#26085#26399',a.end_date , c.dept_code , c.dept_name  '
      'from  data0451 a '
      'left join data0424 b on a.rkey=b.D0451_ptr'
      'inner join data0034 c on b.dept_ptr=c.rkey '
      'inner join data0015 d on b.warehouse_ptr=d.rkey '
      'where 1=1  and a.end_date >= :BDate and a.end_date <= :EDate)aa')
    Left = 625
    Top = 49
  end
end
