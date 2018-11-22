object frm_Main: Tfrm_Main
  Left = 208
  Top = 47
  Width = 1005
  Height = 623
  Caption = #32771#21220#27719#24635#26376#25253
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 997
    Height = 540
    Align = alClient
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    DesignSize = (
      997
      540)
    object Label1: TLabel
      Left = 4
      Top = 297
      Width = 57
      Height = 17
      AutoSize = False
      Caption = #21592#24037#24037#21495
    end
    object Label3: TLabel
      Left = 555
      Top = 131
      Width = 65
      Height = 17
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = #32771#21220#26085#26399#20174
    end
    object Label4: TLabel
      Left = 558
      Top = 191
      Width = 17
      Height = 17
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = #21040
    end
    object Label2: TLabel
      Left = 288
      Top = 302
      Width = 59
      Height = 13
      Caption = #24453#36873#20154#25968':'
    end
    object Label5: TLabel
      Left = 348
      Top = 302
      Width = 45
      Height = 13
      AutoSize = False
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label6: TLabel
      Left = 671
      Top = 302
      Width = 59
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #24050#36873#20154#25968':'
    end
    object Label7: TLabel
      Left = 733
      Top = 302
      Width = 41
      Height = 13
      Anchors = [akTop, akRight]
      AutoSize = False
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label10: TLabel
      Left = 558
      Top = 248
      Width = 52
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #25130#27490#26085#26399
    end
    object Label11: TLabel
      Left = 985
      Top = 1
      Width = 13
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #33694
    end
    object Image1: TImage
      Left = 968
      Top = 2
      Width = 32
      Height = 32
      Anchors = [akTop, akRight]
      AutoSize = True
      Picture.Data = {
        055449636F6E0000010001002020040000000000E80200001600000028000000
        2000000040000000010004000000000000020000000000000000000000000000
        0000000000000000000080000080000000808000800000008000800080800000
        80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
        FFFFFF00000000000000000000000000000000000000000000000040B3000000
        0000000000000000000044444B3000700000000000000000004444444B300777
        70000000000000004444444444B3077777700000000000444444444444B30777
        7777700000004444444444424440007777700000000844444444444244481077
        70000000000704444444442A2444810000000000000074444444746A24448100
        00000000000084444447746AA6444810000000000000704444774AAAAA644810
        000000000000074447774AAAAA6474400000000000000844477426A46CC77444
        0000000000000707774667477777777440000000000000777466777777777774
        400000000000008774A7777777777774440000000000007046AAAA7777777774
        44000000000000074AAAAA7777777774444000000000000844AAAAA777777754
        4440000000000007042A677777777754444700000000000074C2277777777754
        4770000000000000877777777777775770000000000000007077777777777770
        0000000000000000077777777777700000000000000000000877777777700000
        0000000000000000070777777000000000000000000000000077777000000000
        0000000000000000008770000000000000000000000000000070000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000FFFC1FFFFFF007FFFFC001FFFF00007FFC00001FF0000007E000001F
        C000007FC00001FFE00001FFE00000FFE00000FFF000007FF000007FF000003F
        F800003FF800001FF800001FFC00000FFC00000FFC000007FE000007FE00001F
        FE00007FFF0001FFFF0007FFFF001FFFFF807FFFFF81FFFFFF87FFFFFFDFFFFF
        FFFFFFFF}
    end
    object dtpk1: TDateTimePicker
      Left = 566
      Top = 158
      Width = 94
      Height = 21
      Anchors = [akTop, akRight]
      Date = 41000.000000000000000000
      Format = 'yyyy-MM-dd'
      Time = 41000.000000000000000000
      TabOrder = 4
      OnExit = dtpk1Exit
    end
    object dtpk2: TDateTimePicker
      Left = 565
      Top = 218
      Width = 95
      Height = 21
      Anchors = [akTop, akRight]
      Date = 41029.000000000000000000
      Format = 'yyyy-MM-dd'
      Time = 41029.000000000000000000
      TabOrder = 5
      OnExit = dtpk2Exit
    end
    object DBGrd1: TDBGridEh
      Left = 0
      Top = 13
      Width = 556
      Height = 279
      Anchors = [akLeft, akTop, akRight]
      DataSource = DM.DataSource1
      FooterColor = clWindow
      FooterFont.Charset = ANSI_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnKeyDown = DBGrd1KeyDown
      OnTitleClick = DBGrd1TitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'employeecode'
          Footers = <>
          Title.Caption = #21592#24037#24037#21495
          Title.SortIndex = 1
          Title.SortMarker = smUpEh
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'chinesename'
          Footers = <>
          Title.Caption = #21592#24037#22995#21517
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'departmentname'
          Footers = <>
          Title.Caption = #37096#38376
          Width = 85
        end
        item
          EditButtons = <>
          FieldName = 'ondutytime'
          Footers = <>
          Tag = 1
          Title.Caption = #20837#32844#26085#26399
          Width = 75
        end
        item
          EditButtons = <>
          FieldName = 'outdutytime'
          Footers = <>
          Title.Caption = #31163#32844#26085#26399
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'accountname'
          Footers = <>
          Title.Caption = #24080#22871
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'position_item'
          Footers = <>
          Title.Caption = #32844#21153
          Width = 50
        end>
    end
    object SGrd: TStringGrid
      Left = 669
      Top = 13
      Width = 313
      Height = 274
      Anchors = [akTop, akRight]
      ColCount = 4
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      PopupMenu = Popup1
      TabOrder = 1
      ColWidths = (
        92
        90
        95
        98)
    end
    object DBGrd2: TDBGridEh
      Left = 2
      Top = 319
      Width = 993
      Height = 217
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DM.DataSource2
      FooterColor = clWindow
      FooterFont.Charset = ANSI_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 12
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnTitleClick = DBGrd2TitleClick
    end
    object Button1: TButton
      Left = 580
      Top = 24
      Width = 65
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '>'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 580
      Top = 80
      Width = 66
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '>>'
      TabOrder = 3
      OnClick = Button2Click
    end
    object Button5: TButton
      Left = 770
      Top = 291
      Width = 75
      Height = 24
      Anchors = [akTop, akRight]
      Caption = #26597#35810
      TabOrder = 7
      OnClick = Button5Click
    end
    object Edit1: TEdit
      Left = 76
      Top = 295
      Width = 185
      Height = 21
      TabOrder = 9
      OnChange = Edit1Change
    end
    object CheckBox1: TCheckBox
      Left = 563
      Top = 278
      Width = 73
      Height = 14
      Anchors = [akTop, akRight]
      Caption = #21253#25324#31163#32844
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
    object ComboBox1: TComboBox
      Left = 350
      Top = 295
      Width = 104
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 10
      OnChange = ComboBox1Change
    end
    object BitBtn4: TBitBtn
      Left = 262
      Top = 296
      Width = 22
      Height = 19
      TabOrder = 11
      OnClick = BitBtn4Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        333333777777777F33333330B00000003333337F7777777F3333333000000000
        333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
        333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
        03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
        03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
        3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
        333333333377F7F33333333333330F03333333333337F7F33333333333330B03
        3333333333373733333333333333303333333333333373333333}
      NumGlyphs = 2
    end
    object Button3: TButton
      Left = 867
      Top = 291
      Width = 96
      Height = 24
      Anchors = [akTop, akRight]
      Caption = #26631#35782#21608#26411#21152#29677
      TabOrder = 8
      Visible = False
      OnClick = Button3Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 540
    Width = 997
    Height = 56
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      997
      56)
    object Label8: TLabel
      Left = 552
      Top = 12
      Width = 59
      Height = 13
      Anchors = [akLeft, akRight, akBottom]
      Caption = #35760#24405#20154#25968':'
    end
    object Label9: TLabel
      Left = 616
      Top = 12
      Width = 187
      Height = 13
      Anchors = [akLeft, akRight, akBottom]
      AutoSize = False
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object BitBtn1: TBitBtn
      Left = 282
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #25171#21360
      TabOrder = 0
      Visible = False
      OnClick = BitBtn1Click
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
    end
    object BitBtn2: TBitBtn
      Left = 810
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #23548#20986
      TabOrder = 1
      OnClick = BitBtn2Click
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
    object BitBtn3: TBitBtn
      Left = 898
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #36864#20986
      TabOrder = 2
      OnClick = BitBtn3Click
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
    object ProgressBar1: TProgressBar
      Left = 3
      Top = 36
      Width = 990
      Height = 10
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 4
    end
    object StaticText1: TStaticText
      Left = 8
      Top = 11
      Width = 268
      Height = 17
      AutoSize = False
      TabOrder = 3
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    Columns = 2
    ColumnPositions.Strings = (
      '6350'
      '139700')
    DataPipeline = ppDBPipeline1
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Letter 8.5x11 '#33521#23544
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 215900
    PrinterSetup.mmPaperWidth = 279401
    PrinterSetup.PaperSize = 1
    Template.FileName = 'D:\SJSYS\NIERP\Report\1.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 328
    Top = 336
    Version = '7.01'
    mmColumnWidth = 133350
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 794
      mmPrintPosition = 0
    end
    object ppColumnHeaderBand1: TppColumnHeaderBand
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = #26085
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 4498
        mmTop = 0
        mmWidth = 5292
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'in1'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 10583
        mmTop = 0
        mmWidth = 9525
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'out1'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 21431
        mmTop = 0
        mmWidth = 9260
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'in2'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 31750
        mmTop = 0
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'in3'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 53181
        mmTop = 0
        mmWidth = 9790
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'out3'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 63765
        mmTop = 0
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'out2'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 42333
        mmTop = 0
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        BlankWhenZero = True
        DataField = 'work3'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.0;-#,0.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 82021
        mmTop = 0
        mmWidth = 7938
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        BlankWhenZero = True
        DataField = 'RWT'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 74083
        mmTop = 0
        mmWidth = 7408
        BandType = 4
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 4498
        mmWidth = 132027
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText101'
        BlankWhenZero = True
        DataField = 'qj'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.0;-#,0.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3703
        mmLeft = 126736
        mmTop = 0
        mmWidth = 3970
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        BlankWhenZero = True
        DataField = 'SumCT'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 102659
        mmTop = 0
        mmWidth = 4498
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        BlankWhenZero = True
        DataField = 'SumKT'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.0;-#,0.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 112977
        mmTop = 0
        mmWidth = 5821
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        BlankWhenZero = True
        DataField = 'SumZT'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 107950
        mmTop = 0
        mmWidth = 4233
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        BlankWhenZero = True
        DataField = 'restday'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 119327
        mmTop = 0
        mmWidth = 6085
        BandType = 4
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 4233
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 9790
        mmTop = 0
        mmWidth = 1852
        BandType = 4
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 20638
        mmTop = 0
        mmWidth = 1852
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 31221
        mmTop = 0
        mmWidth = 1852
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 41540
        mmTop = 0
        mmWidth = 1852
        BandType = 4
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 52652
        mmTop = 0
        mmWidth = 1852
        BandType = 4
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 63236
        mmTop = 0
        mmWidth = 1852
        BandType = 4
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 72761
        mmTop = 0
        mmWidth = 1852
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line101'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 81756
        mmTop = 0
        mmWidth = 1852
        BandType = 4
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 89959
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 102129
        mmTop = 0
        mmWidth = 1852
        BandType = 4
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 107421
        mmTop = 0
        mmWidth = 1852
        BandType = 4
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 112448
        mmTop = 0
        mmWidth = 1852
        BandType = 4
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 119063
        mmTop = 0
        mmWidth = 1852
        BandType = 4
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4763
        mmLeft = 125677
        mmTop = 0
        mmWidth = 264
        BandType = 4
      end
      object ppLine36: TppLine
        UserName = 'Line36'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4763
        mmLeft = 0
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine47: TppLine
        UserName = 'Line47'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 132027
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object ppLine49: TppLine
        UserName = 'Line49'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 96044
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        BlankWhenZero = True
        DataField = 'work10'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.0;-#,0.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 96573
        mmTop = 0
        mmWidth = 5292
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText201'
        BlankWhenZero = True
        DataField = 'work4'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.0;-#,0.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 90223
        mmTop = 0
        mmWidth = 5556
        BandType = 4
      end
      object ppLine45: TppLine
        UserName = 'Line45'
        Pen.Style = psDot
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.125000000000000000
        mmHeight = 4498
        mmLeft = 132822
        mmTop = 0
        mmWidth = 795
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'flag'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 529
        mmTop = 0
        mmWidth = 3440
        BandType = 4
      end
    end
    object ppColumnFooterBand1: TppColumnFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 125677
        mmTop = 265
        mmWidth = 16404
        BandType = 8
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'EmployeeCode'
      DataPipeline = ppDBPipeline1
      OutlineSettings.CreateNode = True
      NewColumn = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPipeline1'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 21167
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'Line1'
          Weight = 0.750000000000000000
          mmHeight = 1058
          mmLeft = 0
          mmTop = 11377
          mmWidth = 132292
          BandType = 3
          GroupNo = 0
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          DataField = 'DepartmentName'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3895
          mmLeft = 16669
          mmTop = 0
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText12: TppDBText
          UserName = 'DBText12'
          DataField = 'EmployeeCode'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3895
          mmLeft = 16669
          mmTop = 4498
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          DataField = 'ChineseName'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3895
          mmLeft = 62177
          mmTop = 4498
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText14: TppDBText
          UserName = 'DBText14'
          DataField = #24180
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3969
          mmLeft = 62177
          mmTop = 0
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
        end
        object ppDBText15: TppDBText
          UserName = 'DBText15'
          DataField = #26376
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3895
          mmLeft = 74348
          mmTop = 0
          mmWidth = 4233
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = #24180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3895
          mmLeft = 70644
          mmTop = 0
          mmWidth = 3302
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = #26376
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3895
          mmLeft = 78581
          mmTop = 265
          mmWidth = 3302
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = #26376#20221':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3895
          mmLeft = 46567
          mmTop = 265
          mmWidth = 7705
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = #22995#21517':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3895
          mmLeft = 46302
          mmTop = 4763
          mmWidth = 7705
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = #24037#21495':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3895
          mmLeft = 2117
          mmTop = 4233
          mmWidth = 7705
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = #37096#38376':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3895
          mmLeft = 2381
          mmTop = 0
          mmWidth = 7705
          BandType = 3
          GroupNo = 0
        end
        object ppLine19: TppLine
          UserName = 'Line19'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 8996
          mmLeft = 4233
          mmTop = 11906
          mmWidth = 794
          BandType = 3
          GroupNo = 0
        end
        object ppLine20: TppLine
          UserName = 'Line20'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 9260
          mmLeft = 9790
          mmTop = 11642
          mmWidth = 1852
          BandType = 3
          GroupNo = 0
        end
        object ppLine21: TppLine
          UserName = 'Line21'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 10054
          mmLeft = 20638
          mmTop = 11642
          mmWidth = 1852
          BandType = 3
          GroupNo = 0
        end
        object ppLine22: TppLine
          UserName = 'Line22'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 9525
          mmLeft = 31221
          mmTop = 11642
          mmWidth = 1852
          BandType = 3
          GroupNo = 0
        end
        object ppLine23: TppLine
          UserName = 'Line23'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 9525
          mmLeft = 41540
          mmTop = 11642
          mmWidth = 1852
          BandType = 3
          GroupNo = 0
        end
        object ppLine24: TppLine
          UserName = 'Line24'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 10054
          mmLeft = 52652
          mmTop = 11642
          mmWidth = 1852
          BandType = 3
          GroupNo = 0
        end
        object ppLine25: TppLine
          UserName = 'Line25'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 9790
          mmLeft = 63236
          mmTop = 11642
          mmWidth = 1852
          BandType = 3
          GroupNo = 0
        end
        object ppLine26: TppLine
          UserName = 'Line102'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 9260
          mmLeft = 72761
          mmTop = 11642
          mmWidth = 1852
          BandType = 3
          GroupNo = 0
        end
        object ppLine27: TppLine
          UserName = 'Line27'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 9260
          mmLeft = 81756
          mmTop = 11642
          mmWidth = 2381
          BandType = 3
          GroupNo = 0
        end
        object ppLine28: TppLine
          UserName = 'Line28'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 8996
          mmLeft = 89959
          mmTop = 11642
          mmWidth = 1852
          BandType = 3
          GroupNo = 0
        end
        object ppLine29: TppLine
          UserName = 'Line29'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 9525
          mmLeft = 102129
          mmTop = 11642
          mmWidth = 1852
          BandType = 3
          GroupNo = 0
        end
        object ppLine30: TppLine
          UserName = 'Line30'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 9525
          mmLeft = 107421
          mmTop = 11642
          mmWidth = 1852
          BandType = 3
          GroupNo = 0
        end
        object ppLine31: TppLine
          UserName = 'Line31'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 9790
          mmLeft = 112448
          mmTop = 11642
          mmWidth = 1852
          BandType = 3
          GroupNo = 0
        end
        object ppLine32: TppLine
          UserName = 'Line32'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 9260
          mmLeft = 119063
          mmTop = 11642
          mmWidth = 1852
          BandType = 3
          GroupNo = 0
        end
        object ppLine34: TppLine
          UserName = 'Line34'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 9525
          mmLeft = 132027
          mmTop = 11377
          mmWidth = 1852
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = #26631
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 794
          mmTop = 12171
          mmWidth = 3175
          BandType = 3
          GroupNo = 0
        end
        object ppLine35: TppLine
          UserName = 'Line35'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 9260
          mmLeft = 0
          mmTop = 11377
          mmWidth = 1058
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = #26085
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 3260
          mmLeft = 5704
          mmTop = 12171
          mmWidth = 2879
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = #21047#21345'1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 3969
          mmLeft = 10319
          mmTop = 15081
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = #21047#21345'2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 3703
          mmLeft = 21430
          mmTop = 15080
          mmWidth = 8997
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label101'
          Caption = #21047#21345'3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 3703
          mmLeft = 32278
          mmTop = 15080
          mmWidth = 8730
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = #21047#21345'4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 3703
          mmLeft = 42863
          mmTop = 15080
          mmWidth = 8730
          BandType = 3
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          Caption = #21047#21345'5'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 3439
          mmLeft = 53711
          mmTop = 15080
          mmWidth = 8997
          BandType = 3
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = #21047#21345'6'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 3439
          mmLeft = 63500
          mmTop = 15080
          mmWidth = 8466
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = #27491#29677
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3970
          mmLeft = 74379
          mmTop = 15080
          mmWidth = 7409
          BandType = 3
          GroupNo = 0
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          Caption = #21152#29677
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 4234
          mmLeft = 82550
          mmTop = 15080
          mmWidth = 6878
          BandType = 3
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'Label17'
          Caption = #35831
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 4234
          mmLeft = 126736
          mmTop = 12172
          mmWidth = 4234
          BandType = 3
          GroupNo = 0
        end
        object ppLabel18: TppLabel
          UserName = 'Label18'
          Caption = #36831
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 3970
          mmLeft = 102924
          mmTop = 12172
          mmWidth = 4763
          BandType = 3
          GroupNo = 0
        end
        object ppLabel19: TppLabel
          UserName = 'Label19'
          Caption = #26089
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 4498
          mmLeft = 107686
          mmTop = 12172
          mmWidth = 4498
          BandType = 3
          GroupNo = 0
        end
        object ppLabel20: TppLabel
          UserName = 'Label20'
          Caption = #26103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 4234
          mmLeft = 113241
          mmTop = 12172
          mmWidth = 5555
          BandType = 3
          GroupNo = 0
        end
        object ppLabel21: TppLabel
          UserName = 'Label201'
          Caption = #20241
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 3703
          mmLeft = 119591
          mmTop = 12172
          mmWidth = 6086
          BandType = 3
          GroupNo = 0
        end
        object ppLine37: TppLine
          UserName = 'Line37'
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 1323
          mmLeft = 0
          mmTop = 19844
          mmWidth = 132292
          BandType = 3
          GroupNo = 0
        end
        object ppLabel23: TppLabel
          UserName = 'Label23'
          Caption = #21040
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 3970
          mmLeft = 102924
          mmTop = 15875
          mmWidth = 4498
          BandType = 3
          GroupNo = 0
        end
        object ppLabel24: TppLabel
          UserName = 'Label24'
          Caption = #36864
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 3970
          mmLeft = 107686
          mmTop = 15875
          mmWidth = 4763
          BandType = 3
          GroupNo = 0
        end
        object ppLabel25: TppLabel
          UserName = 'Label202'
          Caption = #24037
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 4234
          mmLeft = 113241
          mmTop = 15875
          mmWidth = 5555
          BandType = 3
          GroupNo = 0
        end
        object ppLabel26: TppLabel
          UserName = 'Label26'
          Caption = #24687
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 3703
          mmLeft = 119591
          mmTop = 15875
          mmWidth = 6086
          BandType = 3
          GroupNo = 0
        end
        object ppLine44: TppLine
          UserName = 'Line17'
          Pen.Style = psDot
          Pen.Width = 0
          Position = lpLeft
          Weight = 0.125000000000000000
          mmHeight = 20902
          mmLeft = 132821
          mmTop = 0
          mmWidth = 529
          BandType = 3
          GroupNo = 0
        end
        object ppLine46: TppLine
          UserName = 'Line46'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 10054
          mmLeft = 125677
          mmTop = 11113
          mmWidth = 1852
          BandType = 3
          GroupNo = 0
        end
        object ppLabel34: TppLabel
          UserName = 'Label34'
          Caption = #20551
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 3970
          mmLeft = 126736
          mmTop = 15875
          mmWidth = 4234
          BandType = 3
          GroupNo = 0
        end
        object ppLine48: TppLine
          UserName = 'Line48'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 9525
          mmLeft = 96044
          mmTop = 11642
          mmWidth = 1852
          BandType = 3
          GroupNo = 0
        end
        object ppLabel35: TppLabel
          UserName = 'Label35'
          Caption = #33410
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 4234
          mmLeft = 97366
          mmTop = 12172
          mmWidth = 4234
          BandType = 3
          GroupNo = 0
        end
        object ppLabel36: TppLabel
          UserName = 'Label36'
          Caption = #26085
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 3970
          mmLeft = 97366
          mmTop = 15875
          mmWidth = 4234
          BandType = 3
          GroupNo = 0
        end
        object ppLabel37: TppLabel
          UserName = 'Label37'
          Caption = #21608
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 3970
          mmLeft = 91016
          mmTop = 12172
          mmWidth = 3970
          BandType = 3
          GroupNo = 0
        end
        object ppLabel38: TppLabel
          UserName = 'Label38'
          Caption = #26411
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 3970
          mmLeft = 91016
          mmTop = 15875
          mmWidth = 3970
          BandType = 3
          GroupNo = 0
        end
        object ppLabel31: TppLabel
          UserName = 'Label21'
          Caption = #35782
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3259
          mmLeft = 795
          mmTop = 15875
          mmWidth = 2878
          BandType = 3
          GroupNo = 0
        end
        object ppLabel32: TppLabel
          UserName = 'Label22'
          Caption = #26399
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3260
          mmLeft = 5705
          mmTop = 15875
          mmWidth = 2879
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8996
        mmPrintPosition = 0
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'RWT'
          DataPipeline = ppDBPipeline1
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ParentDataPipeline = False
          ResetGroup = ppGroup2
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3175
          mmLeft = 73025
          mmTop = 265
          mmWidth = 8467
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'SumCT'
          DataPipeline = ppDBPipeline1
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ParentDataPipeline = False
          ResetGroup = ppGroup2
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3302
          mmLeft = 102659
          mmTop = 529
          mmWidth = 4763
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'work10'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ParentDataPipeline = False
          ResetGroup = ppGroup2
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3175
          mmLeft = 96573
          mmTop = 265
          mmWidth = 5556
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'work3'
          DataPipeline = ppDBPipeline1
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ParentDataPipeline = False
          ResetGroup = ppGroup2
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3175
          mmLeft = 82021
          mmTop = 265
          mmWidth = 7938
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'work4'
          DataPipeline = ppDBPipeline1
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ParentDataPipeline = False
          ResetGroup = ppGroup2
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3175
          mmLeft = 90223
          mmTop = 265
          mmWidth = 5821
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'SumZT'
          DataPipeline = ppDBPipeline1
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ParentDataPipeline = False
          ResetGroup = ppGroup2
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3175
          mmLeft = 107686
          mmTop = 265
          mmWidth = 4763
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'SumKT'
          DataPipeline = ppDBPipeline1
          DisplayFormat = '#,0.0;-#,0.0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ParentDataPipeline = False
          ResetGroup = ppGroup2
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3175
          mmLeft = 112977
          mmTop = 265
          mmWidth = 5821
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          DataField = 'restday'
          DataPipeline = ppDBPipeline1
          DisplayFormat = '#,0.0;-#,0.0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ParentDataPipeline = False
          ResetGroup = ppGroup2
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3175
          mmLeft = 119592
          mmTop = 265
          mmWidth = 6085
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'qj'
          DataPipeline = ppDBPipeline1
          DisplayFormat = '#,0.0;-#,0.0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ParentDataPipeline = False
          ResetGroup = ppGroup2
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3302
          mmLeft = 126207
          mmTop = 265
          mmWidth = 5821
          BandType = 5
          GroupNo = 0
        end
        object ppLabel22: TppLabel
          UserName = 'Label11'
          Caption = #21512'    '#35745
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 29369
          mmTop = 2646
          mmWidth = 10319
          BandType = 5
          GroupNo = 0
        end
        object ppLine17: TppLine
          UserName = 'Line11'
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 265
          mmLeft = 0
          mmTop = 8467
          mmWidth = 132027
          BandType = 5
          GroupNo = 0
        end
        object ppLine33: TppLine
          UserName = 'Line103'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 8467
          mmLeft = 72761
          mmTop = 0
          mmWidth = 1852
          BandType = 5
          GroupNo = 0
        end
        object ppLine38: TppLine
          UserName = 'Line38'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 4498
          mmLeft = 81756
          mmTop = 0
          mmWidth = 1852
          BandType = 5
          GroupNo = 0
        end
        object ppLine39: TppLine
          UserName = 'Line39'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 4498
          mmLeft = 89959
          mmTop = 0
          mmWidth = 1323
          BandType = 5
          GroupNo = 0
        end
        object ppLine40: TppLine
          UserName = 'Line40'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 8731
          mmLeft = 102129
          mmTop = 0
          mmWidth = 1852
          BandType = 5
          GroupNo = 0
        end
        object ppLine41: TppLine
          UserName = 'Line41'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 4763
          mmLeft = 107421
          mmTop = 0
          mmWidth = 1852
          BandType = 5
          GroupNo = 0
        end
        object ppLine42: TppLine
          UserName = 'Line42'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 8467
          mmLeft = 112448
          mmTop = 0
          mmWidth = 1852
          BandType = 5
          GroupNo = 0
        end
        object ppLine43: TppLine
          UserName = 'Line43'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 4763
          mmLeft = 119063
          mmTop = 0
          mmWidth = 1852
          BandType = 5
          GroupNo = 0
        end
        object ppLine51: TppLine
          UserName = 'Line51'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 8731
          mmLeft = 132027
          mmTop = 0
          mmWidth = 1852
          BandType = 5
          GroupNo = 0
        end
        object ppLine52: TppLine
          UserName = 'Line52'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 8467
          mmLeft = 125677
          mmTop = 0
          mmWidth = 1323
          BandType = 5
          GroupNo = 0
        end
        object ppLine53: TppLine
          UserName = 'Line53'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 4498
          mmLeft = 96044
          mmTop = 0
          mmWidth = 1323
          BandType = 5
          GroupNo = 0
        end
        object ppLine54: TppLine
          UserName = 'Line54'
          Pen.Style = psDot
          Pen.Width = 0
          Position = lpLeft
          Weight = 0.125000000000000000
          mmHeight = 8730
          mmLeft = 132822
          mmTop = 0
          mmWidth = 528
          BandType = 5
          GroupNo = 0
        end
        object ppLine50: TppLine
          UserName = 'Line50'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 8731
          mmLeft = 0
          mmTop = 0
          mmWidth = 265
          BandType = 5
          GroupNo = 0
        end
        object ppLabel27: TppLabel
          UserName = 'Label27'
          Caption = #23567'        '#26102
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3895
          mmLeft = 80683
          mmTop = 4763
          mmWidth = 14055
          BandType = 5
          GroupNo = 0
        end
        object ppLabel29: TppLabel
          UserName = 'Label29'
          Caption = #23567#26102
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 126207
          mmTop = 4233
          mmWidth = 5556
          BandType = 5
          GroupNo = 0
        end
        object ppLine55: TppLine
          UserName = 'Line26'
          Weight = 0.750000000000000000
          mmHeight = 794
          mmLeft = 72761
          mmTop = 4498
          mmWidth = 59531
          BandType = 5
          GroupNo = 0
        end
        object ppLabel28: TppLabel
          UserName = 'Label28'
          Caption = #20998'  '#38047
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3895
          mmLeft = 103188
          mmTop = 4498
          mmWidth = 8467
          BandType = 5
          GroupNo = 0
        end
        object ppLabel30: TppLabel
          UserName = 'Label30'
          Caption = #22825
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3895
          mmLeft = 117411
          mmTop = 4498
          mmWidth = 3302
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppDesigner1: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppReport1
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 299
    Top = 336
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = DM.DataSource2
    UserName = 'DBPipeline1'
    Left = 272
    Top = 336
  end
  object Popup1: TPopupMenu
    Left = 720
    Top = 144
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #20840#37096#21024#38500
      OnClick = N2Click
    end
  end
end
