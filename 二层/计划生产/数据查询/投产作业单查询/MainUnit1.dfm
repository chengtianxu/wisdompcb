object MainForm1: TMainForm1
  Left = 153
  Top = 113
  Width = 1032
  Height = 744
  Caption = #25237#20135#20316#19994#21333#26597#35810
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
  object Splitter1: TSplitter
    Left = 0
    Top = 530
    Width = 1024
    Height = 4
    Cursor = crVSplit
    Align = alBottom
  end
  object sgrid1: TStringGrid
    Left = 133
    Top = 69
    Width = 248
    Height = 158
    ColCount = 3
    FixedCols = 0
    RowCount = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 3
    Visible = False
    ColWidths = (
      83
      160
      79)
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 33
    Width = 1024
    Height = 497
    Align = alClient
    DataSource = DM.DataSource1
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDrawColumnCell = DBGridEh1DrawColumnCell
    OnKeyDown = DBGridEh1KeyDown
    OnTitleBtnClick = DBGridEh1TitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'CUT_NO'
        Footer.Value = #21512#35745
        Footer.ValueType = fvtStaticText
        Footers = <>
        Title.Color = clRed
        Title.SortIndex = 1
        Title.SortMarker = smDownEh
        Title.TitleButton = True
        Width = 85
      end
      item
        EditButtons = <>
        FieldName = 'SALES_ORDER'
        Footers = <>
        Title.TitleButton = True
        Width = 95
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_NUMBER'
        Footers = <>
        Title.TitleButton = True
        Width = 108
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_DESC'
        Footers = <>
        Title.TitleButton = True
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'PRODUCT_NAME'
        Footers = <>
        Title.TitleButton = True
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'CUST_CODE'
        Footers = <>
        Title.TitleButton = True
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'PO_NUMBER'
        Footers = <>
        Title.TitleButton = True
        Width = 75
      end
      item
        EditButtons = <>
        FieldName = 'ENT_DATE'
        Footers = <>
        Title.Caption = #19979#21333#26085#26399
        Title.TitleButton = True
        Width = 74
      end
      item
        EditButtons = <>
        FieldName = 'SCH_DATE'
        Footers = <>
        Title.TitleButton = True
        Width = 74
      end
      item
        EditButtons = <>
        FieldName = 'set_ordered'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #35746#21333'Set'#25968
        Title.TitleButton = True
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'PARTS_ORDERED'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #35746#21333'Pcs'#25968
        Title.TitleButton = True
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'ISSUED_QTY'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.TitleButton = True
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'ISSUE_DATE'
        Footers = <>
        Title.TitleButton = True
        Width = 74
      end
      item
        EditButtons = <>
        FieldName = 'ENAME492'
        Footers = <>
        Title.Caption = #25237#20135#20154#21592
        Title.TitleButton = True
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'type492'
        Footers = <>
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'status492'
        Footers = <>
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'ENAME60'
        Footers = <>
        Title.Caption = #19979#21333#20154#21592
        Title.TitleButton = True
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'myStatus'
        Footers = <>
        Width = 60
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1024
    Height = 33
    Align = alTop
    TabOrder = 1
    object BitBtn6: TBitBtn
      Left = 6
      Top = 4
      Width = 89
      Height = 24
      Caption = #36864#20986
      TabOrder = 0
      OnClick = BitBtn6Click
      Kind = bkClose
    end
    object BitBtn2: TBitBtn
      Left = 292
      Top = 4
      Width = 89
      Height = 24
      Hint = #23548#20986#21040#30005#23376#34920#26684
      Caption = #23548#20986'EXCEL'
      Default = True
      ParentShowHint = False
      ShowHint = True
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
      Left = 101
      Top = 4
      Width = 89
      Height = 25
      Hint = #25353#19968#23450#30340#26465#20214#26469#27169#31946#26597#35810
      Caption = #26597#35810#26465#20214
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BitBtn3Click
      Glyph.Data = {
        AA040000424DAA04000000000000360000002800000014000000130000000100
        18000000000074040000C40E0000C40E00000000000000000000EFF1F3F3F4F6
        F1F3F4EFF1F3EDEFF1EBEEF0E9ECEEE7EBEDE5E9EBE4E7EAE4E8EAE1E6E8DFE4
        E6DDE2E4DAE0E2D8DEE0D6DCDFD3DADDD1D8DBCFD6D9EFF1F30000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FFCFD6D9EFF1F30000FFF1F3F4EFF1F3EDEF
        F1EBEEF0E9ECEEE7EBEDA06020805020704820E1E6E8DFE4E6DDE2E4DAE0E2C0
        70308050206040200000FFCFD6D9F5F6F70000FFF1F3F4EFF1F3EDEFF1EBEEF0
        E9ECEEE7EBEDD07830905820E4E8EAE1E6E8AF625CA73E37DAE0E2D8DEE0C070
        307048200000FFCFD6D9F5F6F70000FFF1F3F4EFF1F3EDEFF1EBEEF0E9ECEEE7
        EBEDE08040905820E4E8EAE1E6E8C7ACACC5ABAADAE0E2D8DEE0D08030805020
        0000FFCFD6D9F5F6F70000FFF1F3F4EFF1F3EDEFF1EBEEF0E9ECEEE7EBEDE080
        40905820E4E8EAE1E6E8BB8E8F91292AD4D1D3D8DEE0D078308050200000FFCF
        D6D9F5F6F70000FFF1F3F4EFF1F3EDEFF1EBEEF0E9ECEEE7EBEDE08040905820
        E4E8EAE1E6E8DFE4E6A25454963737D8DEE0D078308050200000FFCFD6D9F5F6
        F70000FFF1F3F4EFF1F3EDEFF1EBEEF0E9ECEEE7EBEDE08840905820E4E8EA97
        3839D9D5D7D7D3D5800000D8DEE0D080308050200000FFCFD6D9F5F6F70000FF
        F1F3F4EFF1F3EDEFF1EBEEF0E9ECEEE7EBEDE08840905820E4E8EAAA64648B1B
        1B8B1B1BA76162D8DEE0D078308058200000FFCFD6D9F5F6F70000FFB0989060
        4830604830604830604830E7EBEDE09050A06820E4E8EAE1E6E8CDB9BACBB7B9
        DAE0E2D8DEE0E080309058200000FFCFD6D9F5F6F70000FFB09890FFFFFFFFE8
        E0F0D0B0604830E7EBEDF09860E08840A06020E1E6E8DFE4E6DDE2E4DAE0E2E0
        8850E08850C070300000FFCFD6D9F5F6F70000FFB0A090FFFFFFFFFFFFFFE8E0
        604830E7EBEDE5E9EBE4E7EAE4E8EAE1E6E8DFE4E6DDE2E4DAE0E2D8DEE0D6DC
        DFD3DADD0000FFCFD6D9F5F6F70000FFF0A890F0A080E09870E08860E0805060
        4830604830604830E4E8EAE1E6E8DFE4E6DDE2E4DAE0E2D8DEE0D6DCDFD3DADD
        0000FFCFD6D9F5F6F70000FFF0A890F0A890F0A080E09870E08860FFE8E0F0D0
        B0604830E4E8EAE1E6E8DFE4E6DDE2E4DAE0E2D8DEE0D6DCDFD3DADD0000FFCF
        D6D9F5F6F70000FFF1F3F4EFF1F3EDEFF1B0A090FFFFFFFFFFFFFFE8E0604830
        E4E8EAE1E6E8DFE4E6DDE2E4DAE0E2D8DEE0D6DCDFD3DADD0000FFCFD6D9F5F6
        F70000FFF1F3F4EFF1F3EDEFF1F0A890F0A080E09870E08860E08050E4E8EAE1
        E6E8DFE4E6DDE2E4DAE0E2D8DEE0D6DCDFD3DADD0000FFCFD6D9EFF1F30000FF
        F1F3F4EFF1F3EDEFF1F0A890F0A890F0A080E09870E08860E4E8EAE1E6E8DFE4
        E6DDE2E4DAE0E2D8DEE0D6DCDFD3DADD0000FFCFD6D9EFF1F30000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FFCFD6D9EFF1F3F3F4F6F1F3F4EFF1F3EDEF
        F1EBEEF0E9ECEEE7EBEDE5E9EBE4E7EAE4E8EAE1E6E8DFE4E6DDE2E4DAE0E2D8
        DEE0D6DCDFD3DADDD1D8DBCFD6D9}
    end
    object BitBtn4: TBitBtn
      Left = 197
      Top = 4
      Width = 89
      Height = 25
      Hint = #25353#25152#28857#30340#23383#27573#20840#21305#37197#26597#25214
      Caption = #26597#25214
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BitBtn4Click
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C9A790E3B49DC9A790C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C9A790E3B49DC9A790C8D0D4C8D0D4C8D0D4987232
        E0CDAEF1E7D7F7E4CBD48B5CAFA89FC8D0D4C8D0D4C8D0D4987232E0CDAEF1E7
        D7F7E4CBD48B5CAFA89FB09B6ACC9965DEB19FE2CFB0EFE6D6F4E5AEB8876FC8
        D0D49DA3A6B09B6ACC9965DEB19FE2CFB0EFE6D6F4E5AEB8876FB09B6ACC9972
        D5A582D5B19CDEBE9FEECB8F6D5427C8D0D4727678B09B6ACC9972D5A582D5B1
        9CDEBE9FEECB8F6D5427ADB3B6A5720CCC9966CC9959CCA57FCB8D67616364C8
        D0D4727678B7BDC0A5720CCC9966CC9959CCA57FCB8D676F7375949697B4A99D
        BD9B76CA9B83CA9B83797B7C505050C8D0D4727678CDCDCD8E8378BD9B76CA9B
        83CA9B83ADB3B6292929AFB5B8C3C3C3BFBFBF8E8E8E7777775F5F5F505050C8
        D0D4727678DEDEDEB9B9B98E8E8E7777777171714C4C4C6F7375C8D0D49D9FA0
        D5D5D5A4A4A47E7E7E6B6B6B575757C8D0D4727678DEDEDEB9B9B98E8E8E7777
        77656565292929C8D0D4C8D0D4AFB5B89B9B9B8E8E8E7676766B6B6B575757C2
        C8CB6C6E6F9E9E9E8B8B8B7878786B6B6B4C4C4C6F7375C8D0D4C8D0D4C8D0D4
        9D9FA0C8C8C8B1B1B1898989565656AFB3B55C5C5CDEDEDEB5B5B5A0A0A07E7E
        7E292929C8D0D4C8D0D4C8D0D4C8D0D4AFB5B8C3C3C3BFBFBF8E8E8E5C5C5C72
        76781C1C1CDEDEDEB9B9B98A8A8A5C5C5C6F7375C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D49D9FA0D2D2D2A4A4A46060609FA1A2747474DEDEDEB9B9B98282822929
        29C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4AFB5B8C3C3C3C5C5C59C9C9C93
        9799686A6BADADADC5C5C55B5B5B9AA0A3C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D495999BB6BABC989C9EC8D0D4C8D0D49FA3A5B2B6B8A9AFB2C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4}
    end
    object BitBtn5: TBitBtn
      Left = 388
      Top = 4
      Width = 89
      Height = 25
      Hint = #29992#25143#33258#23450#20041#26174#31034#23383#27573
      Caption = #23383#27573
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BitBtn5Click
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000F8F8F8F8F8F8
        C4C4C41F271F151E15151E15151E15151E15151E15151E15151E15151E15151E
        15151E159A9B9AF8F8F8F8F8F8F8F8F872727233493338503838503838503838
        5038385038385038385038385038385038385038414541F8F8F8F8F8F8F8F8F8
        7272723349333850383850383850383850383850383850383850383850383850
        38385038414541F8F8F8F8F8F8F8F8F87272722B3A2B2B2D2B33343333343331
        32313334333334333334333334332F302F1C281C414541F8F8F8F8F8F8F8F8F8
        7272723B493B8A8A8AA3A3A39797987579779E9E9EA3A3A3A4A4A4A4A4A49797
        97192419414541F8F8F8F8F8F8F8F8F87272723D4C3D9C9C9CAEAEAE6F807013
        6915898989B3B3B3BBBBBBBBBBBBACACAC192419414541F8F8F8F8F8F8F8F8F8
        727272415041A0A0A07B8E7C17B01E11D0192B632B8E928EC4C1C1CBCCCCBCBD
        BA192419414541F8F8F8F8F8F8F8F8F87272724352439FA79F3BD04436ED3F8F
        EE963BC2392F8840808680C8C8C8CECECE192419414541F8F8F8F8F8F8F8F8F8
        727272475647CDCDCDF5F5F5F8F8F8F8F8F8F3F3F3BCF2BD46DD4D317E33C4C4
        C4192419414541F8F8F8F8F8F8F8F8F8727272465546C9C9C9EFEFEFEFEFEFEF
        EFEFEFEFEFE7EBE7AFECB25ADF60AFD0B019241A414541F8F8F8F8F8F8F8F8F8
        727272435243B8B8B8DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD9D9D9B7E2B7BDCB
        BB19241C414541F8F8F8F8F8F8F8F8F87272723B4A3B8E8C8E9DA09DAEB1B1AC
        ACAC969093A3A5A2ABA9A9A6A5A59A979A192419414541F8F8F8F8F8F8F8F8F8
        7272723246323A493A383938A4A4A4BBBBBB4B474A8080809292926666663B47
        3B2E422E414541F8F8F8F8F8F8F8F8F8727272334933385038293B29242C249F
        9F9F808080AFAFAF414741223122385038385038414541F8F8F8F8F8F8F8F8F8
        E3E3E34C4F4C4145414145413F423F5D5D5D9D9D9D4343433D3F3D4145414145
        41414541C3C4C3F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F88A
        8A8A4C4C4C5E5E5EF8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8}
    end
  end
  object DBGridEh2: TDBGridEh
    Left = 0
    Top = 534
    Width = 1024
    Height = 180
    Align = alBottom
    DataSource = DataSource2
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking]
    PopupMenu = PopupMenu1
    ReadOnly = True
    SumList.Active = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDrawColumnCell = DBGridEh2DrawColumnCell
    OnTitleBtnClick = DBGridEh2TitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'MANU_PART_NUMBER'
        Footer.Value = #21512#35745
        Footer.ValueType = fvtStaticText
        Footers = <>
        Title.SortIndex = 1
        Title.SortMarker = smDownEh
        Title.TitleButton = True
        Width = 106
      end
      item
        EditButtons = <>
        FieldName = 'WORK_ORDER_NUMBER'
        Footers = <>
        Title.TitleButton = True
        Width = 122
      end
      item
        EditButtons = <>
        FieldName = 'QUAN_SCH'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.TitleButton = True
        Width = 67
      end
      item
        EditButtons = <>
        FieldName = 'QUAN_REJ'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'QUAN_PROD'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.TitleButton = True
        Width = 77
      end
      item
        EditButtons = <>
        FieldName = 'My_number1'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'My_PROD_STATUS'
        Footers = <>
        Width = 95
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_CODE'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_NAME'
        Footers = <>
        Title.TitleButton = True
        Width = 101
      end
      item
        EditButtons = <>
        FieldName = 'PROD_CODE'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'PRODUCT_NAME'
        Footers = <>
        Title.TitleButton = True
        Width = 117
      end>
  end
  object DataSource2: TDataSource
    DataSet = DM.ADODataSet2
    Left = 112
    Top = 112
  end
  object PopupMenu2: TPopupMenu
    AutoHotkeys = maManual
    Left = 487
    Top = 1
  end
  object PopupMenu1: TPopupMenu
    Left = 72
    Top = 112
    object Menu_N1: TMenuItem
      Caption = #26597#35810#25253#24223#24773#20917
      OnClick = Menu_N1Click
    end
    object Menu_N2: TMenuItem
      Caption = #26597#35810#20837#20179#20449#24687
      OnClick = Menu_N2Click
    end
    object Menu_N3: TMenuItem
      Caption = #26597#35810#27969#36716#20449#24687
      OnClick = Menu_N3Click
    end
    object Menu_N4: TMenuItem
      Caption = 'MI'#27969#31243#20449#24687
      OnClick = Menu_N4Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object EXCEL1: TMenuItem
      Caption = #23548#20986'EXCEL'
      OnClick = EXCEL1Click
    end
  end
end
