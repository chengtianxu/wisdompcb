object Form_proin: TForm_proin
  Left = 239
  Top = 195
  Width = 1008
  Height = 527
  Caption = #29289#21697#20837#20179
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1000
    Height = 38
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 257
      Top = 13
      Width = 52
      Height = 13
      Caption = #20837#20179#21333#21495
      Visible = False
    end
    object Label2: TLabel
      Left = 791
      Top = 6
      Width = 78
      Height = 13
      Caption = #20837#20179#25968#37327#21512#35745
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label3: TLabel
      Left = 792
      Top = 21
      Width = 78
      Height = 13
      Caption = #20837#20179#37329#39069#21512#35745
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label4: TLabel
      Left = 878
      Top = 5
      Width = 7
      Height = 13
      Caption = '0'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label5: TLabel
      Left = 879
      Top = 21
      Width = 28
      Height = 13
      Caption = '0.00'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Lbl_FieldCaption: TLabel
      Left = 457
      Top = 13
      Width = 52
      Height = 13
      Caption = #20986#20179#21333#21495
    end
    object EdtDate_End: TDBDateTimeEditEh
      Left = 616
      Top = 9
      Width = 121
      Height = 21
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 8
      Visible = False
      OnKeyPress = EdtDate_EndKeyPress
    end
    object BitBtn1: TBitBtn
      Left = 2
      Top = 4
      Width = 60
      Height = 30
      Caption = #36864#20986
      TabOrder = 0
      OnClick = BitBtn1Click
      Kind = bkClose
    end
    object BitBtn2: TBitBtn
      Left = 61
      Top = 4
      Width = 60
      Height = 30
      Caption = #21047#26032
      TabOrder = 1
      OnClick = BitBtn2Click
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
    object BitBtn3: TBitBtn
      Left = 120
      Top = 4
      Width = 60
      Height = 30
      Caption = #23548#20986
      TabOrder = 2
      OnClick = BitBtn3Click
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
    object Edit1: TEdit
      Left = 311
      Top = 9
      Width = 121
      Height = 21
      TabOrder = 3
      Visible = False
      OnChange = Edit1Change
    end
    object cbxSymbol: TComboBox
      Left = 513
      Top = 9
      Width = 41
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 4
      Text = '='
      Visible = False
      OnChange = cbxSymbolChange
      Items.Strings = (
        '='
        '>'
        '>='
        '<'
        '<='
        '<>'
        '><')
    end
    object Edt_Start: TEdit
      Left = 556
      Top = 9
      Width = 121
      Height = 21
      TabOrder = 5
      Visible = False
      OnChange = Edt_StartChange
      OnKeyPress = Edt_StartKeyPress
    end
    object Edt_End: TEdit
      Left = 576
      Top = 9
      Width = 121
      Height = 21
      TabOrder = 6
      Visible = False
      OnKeyPress = Edt_EndKeyPress
    end
    object EdtDate_Start: TDBDateTimeEditEh
      Left = 596
      Top = 9
      Width = 121
      Height = 21
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 7
      Visible = False
      OnKeyPress = EdtDate_StartKeyPress
    end
    object BitBtn4: TBitBtn
      Left = 181
      Top = 4
      Width = 57
      Height = 30
      Hint = #23548#20986#25968#25454'Excel'
      Caption = #25171#21360
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = BitBtn4Click
      Glyph.Data = {
        46060000424D4606000000000000360400002800000016000000160000000100
        0800000000001002000000000000000000000001000000010000343234009C9A
        9C00CCCECC006466640084828400B4B6B400ECEAEC004C4E4C00DCDEDC007476
        7400ACAAAC008C8E8C00CCC2CC0044424400F4F6F400645A6400DCD2DC00746A
        7400C4C2C400A4A2A400ECE2EC00948A9400C4BAC400FCF2FC005C5A5C00847A
        8400BCB2BC009C929C003C3A3C008C8A8C00F4F2F400E4E6E400B4B2B4004C4A
        4C0074727400D4D6D4008C828C00BCBEBC00F4EAF4005C565C00E4DEE4007C7E
        7C00B4AAB40094969400CCCACC004C424C00FCFEFC0064626400DCDADC00ACA2
        AC00A49AA400D4CED4006C666C00BCB6BC00544E54007C767C00948E9400FCF6
        FC007C6E7C00443A44003C363C0084868400ECEEEC00DCE2DC00ACAEAC00CCC6
        CC0044464400645E6400DCD6DC00746E7400C4C6C400A4A6A400ECE6EC00C4BE
        C4005C5E5C00847E84009C969C007C727C008C868C00F4EEF400E4E2E400B4AE
        B400D4CAD4004C464C006C626C00E4DAE400ACA6AC00A49EA400D4D2D4006C6A
        6C00BCBABC00545254007C7A7C0094929400FCFAFC00443E4400000000000000
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
        000000000000000000000000000000000000000000000000000041410C44144B
        27531B55264B37591C1926330C414152000052331031344D51241C4537384C48
        041C451A330C524100000C2A5919514458491A11003152164E073C5316330C41
        000024451630410C3358334415420241054D59420D16330C08020F06102C490C
        4133352F364D304F2E1B0F11210D16330000574D4955282C32592D595A5E5E2E
        0E50372F340D531A0000502A5F1A56110D595A2E2E5E5E50583F483743430019
        00000C04440C210312172E5E0E0658442346501F37340D24080234150841252E
        2E5E2E282358233D4C08461F1F195F2400004B45484F2E5E393E493847130721
        212B50402A2E59370000455D2E39391F2323515D031C2121034301252C401156
        00003A385E5058582C011853425B5B374B324C0545341A330802114C0E25235A
        5B4242214A111D1B510B1D225E404E520000152F48502C4622215B5C19571301
        22560839522E27410000554C5B5A3E5802293438200B1D5D4F2E2E2E125D1541
        00001210564D1B1E301E05380932352E5E5E1E49254D2A330802520C58104545
        120B5C36215E28103E10202551262752000041410C4133152F4D351027010E13
        524012352533131B00004152414141550C10524152115918141E350E5E442F19
        000041524152410C41414141520C4B11242E58485E2E4754080241520C414152
        4141524141414455151B2F522E35224E00005241524152410C52414152410C0C
        33381934191915330000}
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 38
    Width = 1000
    Height = 465
    Align = alClient
    DataSource = dm.DataSource1
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnColEnter = DBGrid1ColEnter
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'GRN_NUMBER'
        Title.Color = clRed
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'goods_name'
        Width = 144
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'goods_type'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'goods_guige'
        Width = 162
        Visible = True
      end
      item
        Expanded = False
        FieldName = #37319#36141#20154#21592
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_RECD'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = #36135#24065
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21333#20301
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Title.Caption = #25509#25910#20154
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODE'
        Title.Caption = #20379#24212#21830#32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name'
        Title.Caption = #20379#24212#21830#31616#31216
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20184#27454#26041#24335
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DELIVER_NUMBER'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'unit_price'
        Title.Caption = #21547#31246#20215
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = #19981#21547#31246#20215
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21547#31246#37329#39069
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = #19981#21547#31246#37329#39069
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'state_tax'
        Title.Caption = #31246#29575
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXCH_RATE'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ship_DATE'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rohs'
        Title.Caption = #29615#20445#26631#35782
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WAREHOUSE_CODE'
        Title.Caption = #24037#21378#32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REF_NUMBER'
        Title.Caption = #22791#27880
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_RECD'
        Title.Caption = #21046#36896#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cust_decl'
        Title.Caption = #25253#20851#21333#21495
        Width = 130
        Visible = True
      end>
  end
  object PopupMenu2: TPopupMenu
    Left = 147
    Top = 113
    object N1: TMenuItem
      Caption = #35774#35745#25253#34920
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #25171#21360#25253#34920
      OnClick = N2Click
    end
  end
end
