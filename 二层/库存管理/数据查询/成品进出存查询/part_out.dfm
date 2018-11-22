object Form3: TForm3
  Left = 333
  Top = 155
  Width = 944
  Height = 572
  Caption = #25104#21697#20986#20179#26126#32454
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 509
    Top = 30
    Width = 133
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#37329#39069#21512#35745'('#26412#20301#24065'):'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 73
    Width = 936
    Height = 468
    Align = alClient
    DataSource = DataSource1
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    TabOrder = 2
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'SALES_ORDER'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'delivery_no'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANALYSIS_CODE_2'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROD_CODE'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'product_name'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_CODE'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORIG_CUSTOMER'
        Title.Caption = #20851#32852#21407#23458#25143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_SHP'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'so_mianji'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'out_weight'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WORK_ORDER_NUMBER'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_ASSIGN'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'date_shipped'
        Title.Caption = #36865#36135#26085#26399
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHIPMENT_NO'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WAREHOUSE_CODE'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODE'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCATION'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'part_price'
        Title.Caption = #20215#26684'('#19981#21547#31246')'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXCH_RATE'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'amount'
        Title.Caption = #37329#39069'('#26412#20301#24065#19981#21547#31246')'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'taxpart_price'
        Title.Caption = #20215#26684'('#21547#31246')'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'taxamount'
        Title.Caption = #37329#39069'('#26412#20301#24065#21547#31246')'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total_cost'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'set_lngth'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'set_width'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'layers'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCE_NUMBER'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cust_decl'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'number'
        Title.Caption = #20837#20179#21333#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sys_date'
        Title.Caption = #20837#20179#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'intype'
        Title.Caption = #20135#21697#20837#20179#31867#22411
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name23'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PR_GRP_CODE'
        Title.Caption = #32452#21035#20195#30721
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCT_GROUP_NAME'
        Title.Caption = #32452#21035#21517#31216
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 936
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 306
      Top = 8
      Width = 113
      Height = 13
      Alignment = taRightJustify
      Caption = '    '#20986#20179#25968#37327#21512#35745':'
    end
    object Label2: TLabel
      Left = 524
      Top = 8
      Width = 158
      Height = 13
      Alignment = taRightJustify
      Caption = #37329#39069#21512#35745'('#19981#21547#31246','#26412#20301#24065'):'
    end
    object Label3: TLabel
      Left = 306
      Top = 30
      Width = 113
      Height = 13
      Alignment = taRightJustify
      Caption = '    '#20986#20179#38754#31215#21512#35745':'
    end
    object Label4: TLabel
      Left = 292
      Top = 51
      Width = 127
      Height = 13
      Alignment = taRightJustify
      Caption = '    '#37325#37327#21512#35745'('#20844#26020'):'
    end
    object Label6: TLabel
      Left = 537
      Top = 29
      Width = 145
      Height = 13
      Alignment = taRightJustify
      Caption = #37329#39069#21512#35745'('#21547#31246','#26412#20301#24065'):'
    end
    object Edit1: TEdit
      Left = 426
      Top = 4
      Width = 89
      Height = 21
      TabStop = False
      Color = cl3DLight
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      ReadOnly = True
      TabOrder = 0
      Text = '0.00'
    end
    object Edit2: TEdit
      Left = 683
      Top = 4
      Width = 121
      Height = 21
      TabStop = False
      Color = cl3DLight
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      ReadOnly = True
      TabOrder = 1
      Text = '0.0000'
    end
    object Edit3: TEdit
      Left = 426
      Top = 26
      Width = 89
      Height = 21
      TabStop = False
      Color = cl3DLight
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      ReadOnly = True
      TabOrder = 6
      Text = '0.00'
    end
    object Edit4: TEdit
      Left = 426
      Top = 48
      Width = 89
      Height = 21
      TabStop = False
      Color = cl3DLight
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      ReadOnly = True
      TabOrder = 7
      Text = '0.00'
    end
    object BitBtn5: TBitBtn
      Left = 193
      Top = 22
      Width = 57
      Height = 30
      Hint = #29992#25143#33258#23450#20041#25253#34920#35774#35745
      Caption = #35774#35745
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = BitBtn5Click
      Glyph.Data = {
        0E060000424D0E06000000000000360000002800000016000000160000000100
        180000000000D805000000000000000000000000000000000000FFFFFFFCFCFD
        F9FCFDFCFFFFE9EAEBBEBBBBBDBABABEBBBBBDBBBBBDBBBBBDBBBBBDBBBBBDBB
        BBBDBBBBBDBBBBBDBBBBBEBBBBBDBABABFBEBEE7E8E8FEFEFEFDFDFD6964FEFE
        FEFFFFFFFFFFFFFFFEFAD7CACACCC0C0CFC3C3CFC3C3CFC3C3CFC3C3CFC3C3CF
        C3C3CDC2C3CCC1C2CCC1C2CCC1C2CCC0C1CEC3C4C0B3B4C7C4C5FDFDFEFDFDFD
        4173FFFFFFF3F0EFA2B9C883A2B3C5BABAFFFFFFFEFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E7E1C7BDB7FFFF
        FFFFFFFE6964F9F4F161A4C80596E00091EB3698D1E4EBECFFFFFEF8F8F9FCFA
        FAFBFAFAFAF9FAFCFBFBD9DFEEBAC7E4BBC8E3B4C3E2B4C2E3BBC9E6A8B0CE7B
        839E96A1B8DDDDDF65709DBBCE199DE71FACE11E9CE5059EFC39A3DAE5EBEDFF
        FFFFF9F9FAFDFBFBF9F9FAFFFFFD9CB4E63067D86185D17993CB708FD06587CE
        5A82D4507CD92C5CC3BCBFC563659EC1D21296E8199EEE1999EA19ABFA11B7FC
        3AA6D9E6EBEDFFFFFFF9F9FAFAFAFBFFFFFCADC3F34F83F1A6BAE3AEBDDDD1DA
        EC8DA3D0A1B7E586A6E93E71DBBDC0C73C2FFCF8F567AFD70098F31BB1FD1FBD
        FB24C0FD0DAFFC3CA9DAE7ECEDFFFFFFF9F9FAFEFEFBC8D6F68DAFF6BFD0F4B0
        C2E7AEC4F1BBCAEAC0CCE9ABBCE37FA0E5D7DAE03C2FFCFEFFFAF8F662AED50E
        B2F527C7FF1CB8FC1BB0FE0AA7FC3EADDDDAE8EEFCFCFCFAFAFAFEFDFBFFFFFB
        FBFBFCFFFFFFFDFAFAFFFFFFE4DEE0C3BDBDFFFFFDFFFEFE303CFCFCFDFEFFFF
        FCF8F662AED50DAFF71EB8FF16A9FB13A8FF0B9EDEB4CFDAFFFFFFFBFCFDFEFD
        FDFBFBFCFCFAFAFCFAFAFBF9F9FEFEFEE5DEDEC4BEBEFEFEFFFEFDFD0000FFFF
        FFFCFDFDFEFFFFFCF8F65CA7C90BAAF514AEFF18A6E68DAEBAD8CBC7EDE7E6E9
        E3E2EDE7E6F6F2F1FAF8F8F9F6F6F8F6F6FDFCFCE3DDDDC4BFBFFEFEFEFEFDFD
        0000FEFEFFFEFEFEFDFEFEFAFCFCE8D8D569BBDC0E9FDA8DAEBBCCC4C1B7B9BA
        CAC7C7D4D3D3DDDBDADFD9D7EFE7E7F7F3F3F5F0F0FAF6F6E2DADAC5C0C0FFFF
        FFFFFEFE0000FFFFFFFDFDFEFFFFFFF9F8F9E9E0E0F6F7F7C7DAE2EBE0DCBEBF
        BFD8D8D8E0E0E1E9E9EAF1F2F2F0F1F2E4DCDAF2E9E9F3EBEBF7F0F0E0D8D8C5
        C1C1FFFFFFFFFEFEFFFFFFFFFFFEFEFEFEFFFFFBFAFAE3DDDDFEFDFDFFFFFFF4
        EFEFCAC5C4DADBDBE2E2E2EEEDEDEEE8E7F3F0F0EEEBEAEADEDDF1E7E8F3EAEA
        DFD6D6C5C2C2FFFFFFFFFEFE0000FFFFFFFEFEFEFFFFFFFAF9FAE5DFDFFCFBFB
        FBFAFBEFEAE9CAC7C7E0E0E0EBEBEBF0EBE9F1E7E7EBE1E1EBE5E3EADEDDEEE2
        E3F1E5E5DED4D4C6C3C3FFFFFFFFFDFD0000FFFFFFFEFEFEFFFFFFFBF9F9E5E0
        E0FDFCFBFCFBFBF2EDECD1CDCCE2E4E4E5DDDCF2E8E8F2E9E9EFE4E4E6D9D8E8
        DBDBE9DBDBEDDFDFDDD3D3C6C3C3FEFEFEFEFEFE0000FFFFFFFEFEFEFFFFFFFB
        FAFAE6E1E1FDFCFBFBF9F9F9F5F5E3DCDAE6E6E6E3E2E2E6DDDBEFE5E5DCD0D0
        E1D7D6E0D5D5DFD4D4E3D8D8CABCBCDBD9D9FFFFFFFDFEFED277FFFFFFFEFEFE
        FFFFFFFBFBFBE6E2E2FDFCFCFAF8F8FAF6F6F6F0EFEEE8E6F2F0F0EEEAE9E3D6
        D5DECECFFDFCFCF9F7F7FDFAFAD9CBCBD5CECEFCFDFDFEFEFEFDFDFD8703FFFF
        FFFEFEFEFFFFFFFBFAFAE7E3E3FDFCFCFBF9F9F9F5F5F8F3F3F6F0F0F2EBEAF4
        ECECEBE0E0DAC8C8FAF7F7FBF7F7D8C6C6D1C8C8FDFEFEFFFEFEFDFDFDFEFEFE
        0000FFFFFFFEFEFEFFFFFFFBFBFBE7E4E4FCFBFBFAF8F8F9F5F5F7F2F2F5EFEF
        F4EDEDF3EBEBECE1E1DCCCCCFCF9F9D9CBCBD3CACAFDFFFFFEFEFEFDFDFDFEFE
        FEFFFFFF0000FFFFFFFEFEFEFFFFFFFAFAFAE8E6E6FEFDFDFCFAFAFBF7F7F9F4
        F4F7F1F1F5EEEEF4ECECEEE3E3E2D6D6DED4D4D5CFCFFDFEFEFFFEFEFDFDFDFE
        FEFEFFFFFFFFFFFF0000FFFFFFFDFDFDFEFEFEFBFBFBE6E4E4F7F5F5F5F3F3F5
        F1F1F3EFEFF1ECECEFEAEAEFE8E8ECE4E4D3CACAD9D6D6FCFDFDFEFEFEFDFDFD
        FEFEFEFFFFFFFEFEFEFFFFFF0000FFFFFFFEFEFEFEFEFEFEFEFEF2F1F1EBEAEA
        EBEAEAECEAEAEBEAEAEBEAEAEBE9E9EBEAEAEAE8E8EBEAEAFCFCFCFFFFFFFDFD
        FDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF0000}
    end
    object BitBtn2: TBitBtn
      Left = 135
      Top = 22
      Width = 57
      Height = 30
      Hint = #25253#34920#25171#21360
      Caption = #25171#21360
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BitBtn2Click
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
    object BitBtn4: TBitBtn
      Left = 77
      Top = 22
      Width = 57
      Height = 30
      Hint = #23548#20986#25968#25454'Excel'
      Caption = #23548#20986
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BitBtn4Click
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
    object BitBtn1: TBitBtn
      Left = 19
      Top = 22
      Width = 57
      Height = 30
      Cursor = crHandPoint
      Hint = #36864#20986
      Caption = #36864#20986
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BitBtn1Click
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
  object Edit5: TEdit
    Left = 683
    Top = 26
    Width = 121
    Height = 21
    TabStop = False
    Color = cl3DLight
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    ReadOnly = True
    TabOrder = 1
    Text = '0.0000'
  end
  object ado52: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ado52CalcFields
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      
        'SELECT Data0060.SALES_ORDER,data0439.delivery_no,Data0008.PROD_C' +
        'ODE,Data0008.PRODUCT_NAME, '
      
        '       Data0010.CUST_CODE,Data0015.WAREHOUSE_CODE,Data0016.CODE,' +
        'Data0052.QUAN_SHP, '
      
        '       ROUND(Data0052.QUAN_SHP * Data0025.unit_sq, 4) AS so_mian' +
        'ji,'
      
        '       ROUND(Data0052.QUAN_SHP * Data0064.REPORT_UNIT_VALUE1 * 0' +
        '.001, 4) AS out_weight,Data0064.DATE_ASSIGN, '
      
        '       Data0064.SHIPMENT_NO,data0439.date_sailing AS DATE_SHIPPE' +
        'D,Data0060.REFERENCE_NUMBER, '
      
        '       Data0006.WORK_ORDER_NUMBER,Data0060.EXCH_RATE,Data0005.EM' +
        'PLOYEE_NAME,Data0097.PO_NUMBER, '
      
        '       Data0053.RMA_PTR,Data0010.ABBR_NAME,Data0025.MANU_PART_NU' +
        'MBER,Data0025.MANU_PART_DESC, '
      
        '       Data0025.ANALYSIS_CODE_2,Data0025.set_lngth,Data0025.set_' +
        'width, data0416.sys_date,'
      
        '       Data0060.PARTS_ALLOC * (1 + Data0064.TAX_2 * 0.01) AS tax' +
        'part_price,Data0060.PARTS_ALLOC AS part_price, '
      
        '       ROUND((Data0052.QUAN_SHP * Data0060.PARTS_ALLOC) * (1 + D' +
        'ata0064.TAX_2 * 0.01) / Data0060.EXCH_RATE, 4) '
      '       AS taxamount,Data0025.LAYERS,Data0016.LOCATION, '
      
        '      case when data0053.barcode_ptr is not null then data0060.O' +
        'RIG_CUSTOMER else data0025.ORIG_CUSTOMER end as ORIG_CUSTOMER,'
      
        '       ROUND(Data0052.QUAN_SHP * Data0060.PARTS_ALLOC / Data0060' +
        '.EXCH_RATE, 4) AS amount,Data0001.CURR_CODE, '
      
        '       Data0010.FED_TAX_ID_NO,Data0064.cust_decl,data0416.number' +
        ',Data0023.ABBR_NAME AS abbr_name23,'
      
        '        CASE WHEN data0053.work_order_ptr > 0 THEN round(Data005' +
        '2.QUAN_SHP * Data0006.panel_ln * Data0006.panel_wd * 0.000001 / ' +
        'Data0006.PARTS_PER_PANEL,'
      
        '       4) ELSE ROUND(Data0052.QUAN_SHP * dbo.Data0025.unit_sq, 4' +
        ') END AS total_sq,dbo.Data0007.PR_GRP_CODE, dbo.Data0007.PRODUCT' +
        '_GROUP_NAME,'
      
        'ROUND(Data0052.QUAN_SHP * (Data0053.cost_pcs+Data0053.matl_ovhd_' +
        'pcs+Data0053.OVHD_COST+Data0053.PLANNED_QTY+data0053.ovhd1_pcs+d' +
        'ata0053.outsource_pcs), 4) AS total_cost'
      'FROM   Data0097 INNER JOIN'
      '       Data0052 INNER JOIN'
      
        '       Data0064 ON Data0052.SO_SHP_PTR = Data0064.RKEY INNER JOI' +
        'N'
      '       Data0060 ON Data0064.SO_PTR = Data0060.RKEY INNER JOIN'
      
        '       Data0010 ON Data0060.CUSTOMER_PTR = Data0010.RKEY INNER J' +
        'OIN'
      
        '       Data0053 ON Data0052.DATA0053_PTR = Data0053.RKEY INNER J' +
        'OIN'
      '       Data0015 ON Data0053.WHSE_PTR = Data0015.RKEY INNER JOIN'
      
        '       Data0016 ON Data0053.LOC_PTR = Data0016.RKEY ON Data0097.' +
        'RKEY = Data0060.PURCHASE_ORDER_PTR INNER JOIN'
      '       Data0008 INNER JOIN'
      
        '       Data0025 ON Data0008.RKEY = Data0025.PROD_CODE_PTR ON Dat' +
        'a0060.CUST_PART_PTR = Data0025.RKEY INNER JOIN'
      
        '       Data0001 ON Data0060.CURRENCY_PTR = Data0001.RKEY INNER J' +
        'OIN'
      
        '       Data0005 ON Data0064.ENT_EMPL_PTR = Data0005.RKEY LEFT OU' +
        'TER JOIN'
      
        '       Data0023 ON Data0060.supplier_ptr = Data0023.RKEY LEFT OU' +
        'TER JOIN'
      
        '       data0416 ON Data0053.NPAD_PTR = data0416.rkey LEFT OUTER ' +
        'JOIN'
      
        '       data0439 ON Data0064.packing_list_ptr = data0439.rkey LEF' +
        'T OUTER JOIN'
      
        '       Data0006 ON Data0053.WORK_ORDER_PTR = Data0006.RKEY inner' +
        ' join'
      '       data0007 ON data0008.PR_GRP_POINTER=data0007.rkey'
      'WHERE  (Data0052.QUAN_SHP > 0)'
      
        'ORDER BY Data0010.CUST_CODE,Data0025.MANU_PART_NUMBER,Data0060.S' +
        'ALES_ORDER,Data0064.SHIPMENT_NO')
    Left = 480
    Top = 472
    object ado52SALES_ORDER: TStringField
      DisplayLabel = #38144#21806#35746#21333
      DisplayWidth = 15
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ado52delivery_no: TStringField
      DisplayLabel = #35013#31665#21333
      DisplayWidth = 17
      FieldName = 'delivery_no'
      FixedChar = True
      Size = 15
    end
    object ado52PROD_CODE: TStringField
      DisplayLabel = #31867#22411#20195#30721
      DisplayWidth = 11
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ado52CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      DisplayWidth = 11
      FieldName = 'CUST_CODE'
      Size = 5
    end
    object ado52WAREHOUSE_CODE: TStringField
      DisplayLabel = #24037#21378
      DisplayWidth = 13
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ado52CODE: TStringField
      DisplayLabel = #20179#24211#20195#30721
      DisplayWidth = 7
      FieldName = 'CODE'
      FixedChar = True
      Size = 5
    end
    object ado52LOCATION: TStringField
      DisplayLabel = #20179#24211#21517#31216
      FieldName = 'LOCATION'
    end
    object ado52QUAN_SHP: TFloatField
      DisplayLabel = #20986#20179#25968#37327
      DisplayWidth = 15
      FieldName = 'QUAN_SHP'
    end
    object ado52part_price: TFloatField
      DisplayLabel = #20215#26684
      DisplayWidth = 15
      FieldName = 'part_price'
    end
    object ado52amount: TFloatField
      DisplayLabel = #37329#39069'('#26412#20301#24065')'
      DisplayWidth = 15
      FieldName = 'amount'
      ReadOnly = True
    end
    object ado52SHIPMENT_NO: TSmallintField
      DisplayLabel = #25351#27966#25209#27425
      DisplayWidth = 19
      FieldName = 'SHIPMENT_NO'
    end
    object ado52WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #24037#20316#23450#21333
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ado52EXCH_RATE: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'EXCH_RATE'
    end
    object ado52DATE_ASSIGN: TDateTimeField
      DisplayLabel = #25351#27966#26085#26399
      FieldName = 'DATE_ASSIGN'
    end
    object ado52date_shipped: TDateTimeField
      DisplayLabel = #35013#36816#26085#26399
      FieldName = 'date_shipped'
    end
    object ado52out_weight: TFloatField
      DisplayLabel = #37325#37327'('#20844#26020')'
      FieldName = 'out_weight'
      ReadOnly = True
    end
    object ado52so_mianji: TFloatField
      DisplayLabel = #20986#20179#38754#31215
      FieldName = 'so_mianji'
      ReadOnly = True
    end
    object ado52PO_NUMBER: TStringField
      DisplayLabel = #23458#25143#35746#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ado52taxpart_price: TFloatField
      FieldName = 'taxpart_price'
      ReadOnly = True
    end
    object ado52taxamount: TFloatField
      FieldName = 'taxamount'
      ReadOnly = True
    end
    object ado52RMA_PTR: TIntegerField
      FieldName = 'RMA_PTR'
    end
    object ado52intype: TStringField
      FieldKind = fkCalculated
      FieldName = 'intype'
      Size = 16
      Calculated = True
    end
    object ado52ANALYSIS_CODE_2: TStringField
      DisplayLabel = #23458#25143#29289#26009#21495
      FieldName = 'ANALYSIS_CODE_2'
      Size = 50
    end
    object ado52abbr_name: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'abbr_name'
      Size = 10
    end
    object ado52product_name: TStringField
      DisplayLabel = #31867#22411#21517#31216
      FieldName = 'product_name'
      Size = 30
    end
    object ado52MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ado52MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ado52CURR_CODE: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ado52REFERENCE_NUMBER: TStringField
      DisplayLabel = #35746#21333#21442#32771
      FieldName = 'REFERENCE_NUMBER'
      Size = 30
    end
    object ado52set_lngth: TBCDField
      DisplayLabel = #20132#36135#26495#38271
      FieldName = 'set_lngth'
      Precision = 7
      Size = 3
    end
    object ado52set_width: TBCDField
      DisplayLabel = #20132#36135#26495#23485
      FieldName = 'set_width'
      Precision = 7
      Size = 3
    end
    object ado52layers: TWordField
      DisplayLabel = #23618#25968
      FieldName = 'layers'
    end
    object ado52fed_tax_id_no: TStringField
      FieldName = 'fed_tax_id_no'
      Size = 50
    end
    object ado52EMPLOYEE_NAME: TStringField
      DisplayLabel = #20986#20179#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ado52cust_decl: TStringField
      DisplayLabel = #25253#20851#21333#21495
      FieldName = 'cust_decl'
      Size = 50
    end
    object ado52number: TStringField
      FieldName = 'number'
      Size = 15
    end
    object ado52abbr_name23: TStringField
      DisplayLabel = #22806#21327#21378#23478
      FieldName = 'abbr_name23'
      Size = 16
    end
    object ado52total_sq: TFloatField
      DisplayLabel = #20986#20179#38754#31215
      FieldName = 'total_sq'
      ReadOnly = True
    end
    object ado52total_cost: TFloatField
      DisplayLabel = #25104#26412
      FieldName = 'total_cost'
      ReadOnly = True
    end
    object ado52sys_date: TDateTimeField
      FieldName = 'sys_date'
    end
    object ado52PR_GRP_CODE: TStringField
      FieldName = 'PR_GRP_CODE'
      Size = 5
    end
    object ado52PRODUCT_GROUP_NAME: TStringField
      FieldName = 'PRODUCT_GROUP_NAME'
      Size = 30
    end
    object ado52ORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      ReadOnly = True
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = ado52
    Left = 448
    Top = 472
  end
end
