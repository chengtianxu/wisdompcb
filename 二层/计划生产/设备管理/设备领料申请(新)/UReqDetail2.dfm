object frmReqDetail2: TfrmReqDetail2
  Left = 283
  Top = 194
  Width = 978
  Height = 552
  Caption = #29983#20135#39046#26009#26126#32454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 970
    Height = 521
    Align = alClient
    TabOrder = 0
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 968
      Height = 49
      Align = alTop
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 278
        Top = 18
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = #39046#26009#21333#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clDefault
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object BtClose: TBitBtn
        Left = 3
        Top = 8
        Width = 57
        Height = 30
        Hint = #36864#20986#31995#32479
        Caption = #20851#38381
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = BtCloseClick
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
      object BtBrush: TBitBtn
        Left = 60
        Top = 8
        Width = 57
        Height = 30
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
        OnClick = BtBrushClick
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
      object Edit1: TEdit
        Left = 347
        Top = 13
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnChange = Edit1Change
      end
      object BitBtn4: TBitBtn
        Left = 118
        Top = 8
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
      object GroupBox2: TGroupBox
        Left = 705
        Top = 0
        Width = 263
        Height = 49
        Align = alRight
        Caption = #26085#26399#33539#22260
        TabOrder = 4
        object Label8: TLabel
          Left = 9
          Top = 20
          Width = 20
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #20174':'
        end
        object Label9: TLabel
          Left = 136
          Top = 20
          Width = 21
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #21040':'
        end
        object DTPK1: TDateTimePicker
          Left = 32
          Top = 16
          Width = 97
          Height = 21
          Date = 37600.000000000000000000
          Time = 37600.000000000000000000
          TabOrder = 0
          OnClick = DTPK1Click
          OnExit = DTPK1Exit
        end
        object DTPk2: TDateTimePicker
          Left = 158
          Top = 16
          Width = 97
          Height = 21
          Date = 37600.000000000000000000
          Time = 37600.000000000000000000
          TabOrder = 1
          OnClick = DTPK1Click
          OnExit = DTPK1Click
        end
      end
      object BitBtn6: TBitBtn
        Left = 176
        Top = 8
        Width = 58
        Height = 30
        Hint = #29992#25143#33258#23450#20041#26174#31034#23383#27573
        Caption = #23383#27573
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        Visible = False
        OnClick = BitBtn6Click
        Glyph.Data = {
          0E070000424D0E0700000000000036040000280000001A0000001A0000000100
          080000000000D80200001217000012170000000100000000000000000000D0C8
          C80078787800383838000088080050F85800B8B8B800F8F8F800004800006060
          600080F8880000F00800A0A0A000E0E0E0009898980030303000E8E8E800C0C0
          C00000A80800A8A8A80020F83000D8D8D800C8C8C800505050009090900000D8
          080068686800F0F0F0008080880010F8200098F8A000B0B0B00060F86800D0D0
          D0003850380000A0080090F898000058000008080800C8D0C80008F818007070
          70008080800000980800C8D0D00058F8600088888800D0C8D00068F87000A0F8
          A00000F8080028F8300000B0080000E0080018F8200098F89800000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000130000904C1A00000000000000E400F712000035A6FC00770000001300
          0700A7FC7700080613000083A600FC7700000000000035A5FC0077FFFF000000
          2000010000000000000000000000000000000000000000000000000000000000
          31000000000000F1F500006400006600C800651A00007801130000C865001A00
          780001130000C0651A00000000000000C000F7120000C8F3EB007770F5001200
          0000ECFD7F0002000000000000001300E8000100000001000A0000884000F877
          90004C1A00000100000000998400E6775400F71200000101010001D8F8001200
          450090FB7700801FF80077FFFF00FFFF6000F8120000AD84E6007760F8001200
          D80084E677000000000000FFFF0000003000F1F5000030F1F500001800000000
          00000000000044F8120000400000000000000000000028F81200000000000000
          00000000000000000000000C000000000200000000000101120000872B00F877
          0000ECFD7F00000000000002000000006C00001A0200984C1A00007FFF00FFFF
          000000000000984C1A00000500000000870031E6770084F8120000218600E677
          9800F81200006713000010FFFF00000020000100000030F1F500000000000000
          7000F8120000ACF8120000D8F8001200100030001000F8400000105F5400E677
          200001000000D0F8120000D8F80012000800000000000E000000070707070700
          0000000000000000000000000000000000070707000007070707002222222222
          2222222222222222222222222200070700000707070700222222222222222222
          2222222222222222220007070000070707070022222222222222222222222222
          2222222222000707000007070707002222222222222222222222222222222222
          2200070700000707070700220000000000000000000000000000000022000707
          0000070707070022170E0E0E0E0E180E0E0E0E0E0E0E0E002200070700000707
          07070022171313130C1C1A0C1313131313131300220007070000070707070022
          1706061F1809252E1F060606060606002200070700000707070700220911060E
          09239C1A0E061111111111002200070700000707070700221A110C1A34191908
          1A0C11012C0127002200070700000707070700221A0602343514302308291321
          1515150022000707000007070707002229160514050A0DC233D82202060D1000
          220007070000070707070022021B1B070707071B1B312D12081F070022000707
          000007070707002202070707070707070710312D23291B002200070700000707
          07070022021B1B1B1B1B1B1B1B1B0D1E2D201000220007070000070707070022
          290D0D0D0D0D0D0D0D0D0D1524C20DAF2200070700000707070700221A151515
          151515151515151515151500220007070000070707070022092F27212C161616
          0127210116162F002200070700000707070700220F090029291A29F50F171709
          1A0F09002200070700000707070700222222002E0D151017290E111F0E0F2222
          22000707000007070707002222222200002E10290E2121000022222222000707
          0000070707070022222222222200111829210022222222222200070700000707
          0707070000000000000002211F00000000000000000707070000070707070707
          0707070707070300110007070707070707070707000007070707070707070707
          0707170F2A03070707070707070707070000}
      end
    end
    object Grd1: TDBGridEh
      Left = 1
      Top = 50
      Width = 968
      Height = 470
      Align = alClient
      DataSource = ds1
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnKeyDown = Grd1KeyDown
      OnTitleClick = Grd1TitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = #39046#26009#21333#21495
          Footers = <>
          Width = 88
        end
        item
          EditButtons = <>
          FieldName = #30003#39046#20154#21592
          Footers = <>
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = #37096#38376
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = #26448#26009#32534#30721
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = #26448#26009#21517#31216
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = #26448#26009#35268#26684
          Footers = <>
          Width = 212
        end
        item
          EditButtons = <>
          FieldName = #20379#24212#21830
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = #21333#20301
          Footers = <>
          Width = 43
        end
        item
          EditButtons = <>
          FieldName = #30003#39046#25968#37327
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = #24050#21457#25918#25968#37327
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = #30003#39046#26085#26399
          Footers = <>
          Width = 78
        end
        item
          EditButtons = <>
          FieldName = #22791#27880
          Footers = <>
          Width = 198
        end
        item
          EditButtons = <>
          FieldName = #24037#21378#31616#31216
          Footers = <>
          Width = 76
        end
        item
          EditButtons = <>
          FieldName = #24037#21378#20195#30721
          Footers = <>
          Visible = False
          Width = 69
        end>
    end
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    Left = 256
    Top = 80
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 72
    Top = 216
  end
  object qry1: TADOQuery
    Connection = DM.con1
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'dtpk1'
        Size = -1
        Value = Null
      end
      item
        Name = 'dtpk2'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.DATA0268.rkey, dbo.DATA0268.number AS '#39046#26009#21333#21495', dbo.D' +
        'ata0005.EMPLOYEE_NAME AS '#30003#39046#20154#21592', dbo.Data0034.DEPT_NAME AS '#37096#38376', '
      
        '                      dbo.Data0017.INV_PART_NUMBER AS '#26448#26009#32534#30721', dbo.' +
        'Data0017.INV_NAME AS '#26448#26009#21517#31216', dbo.Data0017.INV_DESCRIPTION AS '#26448#26009#35268#26684',' +
        ' '
      
        '                      dbo.Data0468.VENDOR AS '#20379#24212#21830', dbo.Data0002.U' +
        'NIT_NAME AS '#21333#20301', dbo.Data0468.QUAN_BOM AS '#30003#39046#25968#37327', '
      
        '                      dbo.Data0468.QUAN_ISSUED AS '#24050#21457#25918#25968#37327', dbo.DAT' +
        'A0268.DATE AS '#30003#39046#26085#26399', dbo.DATA0268.DATE, dbo.DATA0268.reference AS' +
        ' '#22791#27880', '
      
        '                      dbo.Data0015.WAREHOUSE_CODE AS '#24037#21378#20195#30721', dbo.D' +
        'ata0015.ABBR_NAME AS '#24037#21378#31616#31216
      'FROM         dbo.Data0468 INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.Data0468.INVENT_PTR = ' +
        'dbo.Data0017.RKEY INNER JOIN'
      
        '                      dbo.DATA0268 ON dbo.Data0468.FLOW_NO = dbo' +
        '.DATA0268.rkey INNER JOIN'
      
        '                      dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PT' +
        'R = dbo.Data0002.RKEY INNER JOIN'
      
        '                      dbo.Data0034 ON dbo.DATA0268.dept_ptr = db' +
        'o.Data0034.RKEY INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.DATA0268.EMPL_PTR = db' +
        'o.Data0005.RKEY INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.DATA0268.warehouse_ptr' +
        ' = dbo.Data0015.RKEY'
      
        'WHERE  ---   (dbo.DATA0268.status = 2) AND (dbo.Data0468.STATUS ' +
        '= 0) AND'
      ' data0268.ttype in (0,1) and'
      '(dbo.DATA0268.DATE >= :dtpk1) AND (dbo.DATA0268.DATE <= :dtpk2)')
    Left = 136
    Top = 216
  end
end
