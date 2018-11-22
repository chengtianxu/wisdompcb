object Form1: TForm1
  Left = 277
  Top = 174
  Width = 963
  Height = 585
  Caption = #22266#23450#36164#20135#35745#25552#25240#26087#20449#24687#26597#35810
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 947
    Height = 39
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      947
      39)
    object Label2: TLabel
      Left = 671
      Top = 13
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight, akBottom]
      Caption = #20250#35745#24180#24230':'
    end
    object Label3: TLabel
      Left = 822
      Top = 13
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight, akBottom]
      Caption = #20250#35745#26399#38388':'
    end
    object Label1: TLabel
      Left = 275
      Top = 13
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #36164#20135#32534#21495
    end
    object SpinEdit1: TSpinEdit
      Left = 732
      Top = 8
      Width = 85
      Height = 22
      Anchors = [akTop, akRight, akBottom]
      MaxValue = 9999
      MinValue = 2000
      TabOrder = 1
      Value = 2007
      OnChange = SpinEdit2Change
    end
    object SpinEdit2: TSpinEdit
      Left = 883
      Top = 8
      Width = 49
      Height = 22
      Anchors = [akTop, akRight, akBottom]
      MaxLength = 1
      MaxValue = 12
      MinValue = 1
      TabOrder = 2
      Value = 1
      OnChange = SpinEdit2Change
    end
    object Edit1: TEdit
      Left = 331
      Top = 9
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object BitBtn1: TBitBtn
      Left = 4
      Top = 3
      Width = 61
      Height = 30
      Caption = #36864#20986
      TabOrder = 3
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
    object BitBtn2: TBitBtn
      Left = 68
      Top = 3
      Width = 61
      Height = 30
      Caption = #21047#26032
      TabOrder = 4
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
      Left = 132
      Top = 3
      Width = 61
      Height = 30
      Caption = #23548#20986
      TabOrder = 5
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
    object BitBtn5: TBitBtn
      Left = 196
      Top = 3
      Width = 57
      Height = 30
      Hint = #29992#25143#33258#23450#20041#26174#31034#23383#27573
      Caption = #23383#27573
      ParentShowHint = False
      PopupMenu = PopupMenu2
      ShowHint = True
      TabOrder = 6
      OnClick = BitBtn5Click
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
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 39
    Width = 947
    Height = 507
    Align = alClient
    Anchors = [akTop, akRight, akBottom]
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'FYEAR'
        Footers = <>
        ReadOnly = False
        Title.Alignment = taCenter
        Visible = False
        Width = 47
      end
      item
        EditButtons = <>
        FieldName = 'PERIOD'
        Footers = <>
        ReadOnly = False
        Title.Alignment = taCenter
        Visible = False
        Width = 47
      end
      item
        EditButtons = <>
        FieldName = 'id_code'
        Footers = <>
        Title.Alignment = taCenter
        Title.Color = clRed
        Width = 74
      end
      item
        EditButtons = <>
        FieldName = 'FASSET_CODE'
        Footers = <>
        Title.Alignment = taCenter
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'FASSET_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Width = 101
      end
      item
        EditButtons = <>
        FieldName = 'FASSET_DESC'
        Footers = <>
        Title.Alignment = taCenter
        Width = 97
      end
      item
        EditButtons = <>
        FieldName = 'FASSET_TYPE'
        Footers = <>
        Title.Alignment = taCenter
        Width = 91
      end
      item
        EditButtons = <>
        FieldName = 'ORIGINAL_VALUE'
        Footer.DisplayFormat = '#,0.00'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = False
        Title.Alignment = taCenter
        Width = 76
      end
      item
        EditButtons = <>
        FieldName = 'SUMMED_DEPRE'
        Footer.DisplayFormat = '#,0.00'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = False
        Title.Alignment = taCenter
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'NET_VALUE'
        Footer.DisplayFormat = '#,0.00'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = False
        Title.Alignment = taCenter
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'DEPRE_RATE'
        Footers = <>
        ReadOnly = False
        Title.Alignment = taCenter
      end
      item
        EditButtons = <>
        FieldName = 'DEPRE_AMOUNT'
        Footer.DisplayFormat = '#,0.00'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = False
        Title.Alignment = taCenter
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'percents'
        Footers = <>
        ReadOnly = False
        Title.Alignment = taCenter
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'expected_depre_months'
        Footers = <>
        ReadOnly = False
        Title.Alignment = taCenter
      end
      item
        EditButtons = <>
        FieldName = 'accu_depre_months'
        Footers = <>
        ReadOnly = False
        Title.Alignment = taCenter
      end
      item
        EditButtons = <>
        FieldName = 'location'
        Footers = <>
        Title.Alignment = taCenter
        Visible = False
        Width = 144
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_CODE'
        Footers = <>
        Title.Alignment = taCenter
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Width = 77
      end
      item
        EditButtons = <>
        FieldName = 'VOUCHER'
        Footers = <>
        Title.Alignment = taCenter
        Width = 73
      end
      item
        EditButtons = <>
        FieldName = 'GL_ACC_NUMBER'
        Footers = <>
        Title.Alignment = taCenter
        Width = 68
      end
      item
        EditButtons = <>
        FieldName = 'gl_description'
        Footers = <>
        Title.Alignment = taCenter
        Width = 193
      end
      item
        EditButtons = <>
        FieldName = 'abbr_name'
        Footers = <>
        Title.Alignment = taCenter
      end
      item
        EditButtons = <>
        FieldName = 'USER_DATE'
        Footers = <>
        ReadOnly = False
        Visible = False
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'orig_BOOK_DATE'
        Footers = <>
        ReadOnly = False
        Visible = False
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'BOOK_DATE'
        Footers = <>
        ReadOnly = False
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'orig_original_value'
        Footers = <>
        ReadOnly = False
      end
      item
        EditButtons = <>
        FieldName = 'FASSET_ALT_TYPE'
        Footers = <>
        Visible = False
        Width = 94
      end
      item
        EditButtons = <>
        FieldName = 'supplier_name'
        Footers = <>
        Width = 107
      end
      item
        EditButtons = <>
        FieldName = 'SURPLUS_RATE'
        Footers = <>
        ReadOnly = False
      end
      item
        EditButtons = <>
        FieldName = 'SURPLUS'
        Footers = <>
        ReadOnly = False
      end
      item
        EditButtons = <>
        FieldName = 'acc_number_fasset'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'description_fasset'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'dept_code_1'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'dept_name_1'
        Footers = <>
        Visible = False
      end>
  end
  object ADOConnection1: TADOConnection
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 112
    Top = 328
  end
  object ads517: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.Data0528.FYEAR, dbo.Data0528.PERIOD, dbo.Data0528' +
      '.ORIGINAL_VALUE, dbo.Data0528.SUMMED_DEPRE, ROUND(dbo.Data0528.D' +
      'EPRE_RATE, 3) AS DEPRE_RATE, '#13#10'                      dbo.Data052' +
      '8.DEPRE_AMOUNT, dbo.Data0528.expected_depre_months, dbo.Data0528' +
      '.accu_depre_months, dbo.Data0528.percents, dbo.Data0034.DEPT_COD' +
      'E, dbo.Data0034.DEPT_NAME, '#13#10'                      dbo.Data0517.' +
      'FASSET_CODE, dbo.Data0517.NET_VALUE, dbo.Data0517.LOCATION, dbo.' +
      'Data0517.FASSET_NAME, dbo.Data0517.FASSET_DESC, dbo.Data0517.id_' +
      'code, '#13#10'                      dbo.Data0517.orig_BOOK_DATE, dbo.D' +
      'ata0517.orig_original_value, dbo.Data0517.BOOK_DATE, dbo.Data051' +
      '7.supplier_name, dbo.Data0517.USER_DATE, dbo.Data0517.SURPLUS, '#13 +
      #10'                      dbo.Data0517.SURPLUS_RATE, dbo.Data0515.F' +
      'ASSET_ALT_TYPE, dbo.Data0514.FASSET_TYPE, dbo.Data0105.VOUCHER, ' +
      'dbo.Data0103.GL_ACC_NUMBER, '#13#10'                      CASE WHEN da' +
      'ta0103_2.gl_description IS NULL THEN '#39#39' ELSE data0103_2.gl_descr' +
      'iption + '#39'-'#39' END + CASE WHEN data0103_1.gl_description IS NULL '#13 +
      #10'                      THEN '#39#39' ELSE data0103_1.gl_description + ' +
      #39'-'#39' END + Data0103_1.GL_DESCRIPTION AS gl_description, dbo.Data0' +
      '015.ABBR_NAME, Data0103_3.GL_ACC_NUMBER AS acc_number_fasset, '#13#10 +
      '                      Data0103_3.GL_DESCRIPTION AS description_f' +
      'asset, Data0034_1.DEPT_CODE AS dept_code_1, Data0034_1.DEPT_NAME' +
      ' AS dept_name_1'#13#10'FROM         dbo.Data0103 RIGHT OUTER JOIN'#13#10'   ' +
      '                   dbo.Data0528 INNER JOIN'#13#10'                    ' +
      '  dbo.Data0517 ON dbo.Data0528.D0517_ptr = dbo.Data0517.RKEY INN' +
      'ER JOIN'#13#10'                      dbo.Data0514 ON dbo.Data0517.FASS' +
      'ET_TYPE_PTR = dbo.Data0514.RKEY INNER JOIN'#13#10'                    ' +
      '  dbo.Data0515 ON dbo.Data0517.ALT_TYPE_PTR = dbo.Data0515.RKEY ' +
      'INNER JOIN'#13#10'                      dbo.Data0103 AS Data0103_3 ON ' +
      'dbo.Data0517.fasset_gl_ptr = Data0103_3.RKEY ON dbo.Data0103.RKE' +
      'Y = dbo.Data0528.gl_acct_ptr LEFT OUTER JOIN'#13#10'                  ' +
      '    dbo.Data0034 ON dbo.Data0528.dept_ptr = dbo.Data0034.RKEY LE' +
      'FT OUTER JOIN'#13#10'                      dbo.Data0103 AS Data0103_1 ' +
      'LEFT OUTER JOIN'#13#10'                      dbo.Data0103 AS Data0103_' +
      '2 ON Data0103_1.PARENT_PTR = Data0103_2.RKEY ON dbo.Data0103.PAR' +
      'ENT_PTR = Data0103_1.RKEY LEFT OUTER JOIN'#13#10'                     ' +
      ' dbo.Data0105 ON dbo.Data0528.voucher_ptr = dbo.Data0105.RKEY LE' +
      'FT OUTER JOIN'#13#10'                      dbo.Data0015 ON dbo.Data051' +
      '7.warehouse_ptr = dbo.Data0015.RKEY LEFT OUTER JOIN'#13#10'           ' +
      '           dbo.Data0034 AS Data0034_1 ON dbo.Data0034.COST_DEPT_' +
      'PTR = Data0034_1.RKEY'#13#10'WHERE (dbo.Data0528.FYEAR = :year) AND '#13#10 +
      '               (dbo.Data0528.PERIOD = :months)'
    IndexFieldNames = 'id_code'
    Parameters = <
      item
        Name = 'year'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 2007
      end
      item
        Name = 'months'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 2
      end>
    Left = 268
    Top = 328
    object ads517FYEAR: TIntegerField
      DisplayLabel = #24180#24230
      FieldName = 'FYEAR'
    end
    object ads517PERIOD: TIntegerField
      DisplayLabel = #26376#20221
      FieldName = 'PERIOD'
    end
    object ads517id_code: TStringField
      DisplayLabel = #36164#20135#32534#21495
      FieldName = 'id_code'
      FixedChar = True
      Size = 15
    end
    object ads517FASSET_CODE: TStringField
      DisplayLabel = #21345#29255#32534#21495
      FieldName = 'FASSET_CODE'
      Size = 10
    end
    object ads517FASSET_NAME: TStringField
      DisplayLabel = #36164#20135#21517#31216
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object ads517FASSET_DESC: TStringField
      DisplayLabel = #35268#26684
      FieldName = 'FASSET_DESC'
      Size = 40
    end
    object ads517FASSET_TYPE: TStringField
      DisplayLabel = #36164#20135#31867#21035
      FieldName = 'FASSET_TYPE'
      FixedChar = True
    end
    object ads517ORIGINAL_VALUE: TBCDField
      DisplayLabel = #24403#21069#21407#20540
      FieldName = 'ORIGINAL_VALUE'
      Precision = 18
      Size = 2
    end
    object ads517SUMMED_DEPRE: TBCDField
      DisplayLabel = #32047#35745#25240#26087
      FieldName = 'SUMMED_DEPRE'
      Precision = 18
      Size = 2
    end
    object ads517NET_VALUE: TFloatField
      DisplayLabel = #20928#20540
      FieldName = 'NET_VALUE'
    end
    object ads517DEPRE_RATE: TFloatField
      DisplayLabel = #26376#25240#26087#29575'%'
      FieldName = 'DEPRE_RATE'
      ReadOnly = True
    end
    object ads517DEPRE_AMOUNT: TBCDField
      DisplayLabel = #24403#26376#25240#26087
      FieldName = 'DEPRE_AMOUNT'
      Precision = 18
      Size = 2
    end
    object ads517percents: TFloatField
      DisplayLabel = #21344#30334#20998#27604'%'
      FieldName = 'percents'
    end
    object ads517expected_depre_months: TFloatField
      DisplayLabel = #39044#35745#20351#29992#26376#20221
      FieldName = 'expected_depre_months'
    end
    object ads517accu_depre_months: TIntegerField
      DisplayLabel = #24050#35745#25552#26376#20221
      FieldName = 'accu_depre_months'
    end
    object ads517location: TStringField
      DisplayLabel = #20301#32622
      FieldName = 'location'
      FixedChar = True
      Size = 40
    end
    object ads517DEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ads517DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ads517VOUCHER: TStringField
      DisplayLabel = #20973#35777#32534#21495
      FieldName = 'VOUCHER'
      Size = 12
    end
    object ads517GL_ACC_NUMBER: TStringField
      DisplayLabel = #31185#30446#20195#30721
      FieldName = 'GL_ACC_NUMBER'
      FixedChar = True
      Size = 18
    end
    object ads517gl_description: TStringField
      DisplayLabel = #31185#30446#21517#31216
      FieldName = 'gl_description'
      ReadOnly = True
      Size = 152
    end
    object ads517abbr_name: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'abbr_name'
      Size = 10
    end
    object ads517orig_BOOK_DATE: TDateTimeField
      DisplayLabel = #21021#22987#22987#20837#36134#26085#26399
      FieldName = 'orig_BOOK_DATE'
    end
    object ads517orig_original_value: TFloatField
      DisplayLabel = #20837#24080#21407#20540
      FieldName = 'orig_original_value'
    end
    object ads517BOOK_DATE: TDateTimeField
      DisplayLabel = #20837#24080#26085#26399
      FieldName = 'BOOK_DATE'
    end
    object ads517supplier_name: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'supplier_name'
      Size = 50
    end
    object ads517USER_DATE: TDateTimeField
      DisplayLabel = #36141#20837#26085#26399
      FieldName = 'USER_DATE'
    end
    object ads517SURPLUS: TFloatField
      DisplayLabel = #27531#20540
      FieldName = 'SURPLUS'
    end
    object ads517SURPLUS_RATE: TFloatField
      DisplayLabel = #27531#20540#29575'%'
      FieldName = 'SURPLUS_RATE'
    end
    object ads517FASSET_ALT_TYPE: TStringField
      DisplayLabel = #22686#21152#26041#24335
      FieldName = 'FASSET_ALT_TYPE'
    end
    object ads517acc_number_fasset: TStringField
      DisplayLabel = #22266#23450#36164#20135#31185#30446
      FieldName = 'acc_number_fasset'
      Size = 18
    end
    object ads517description_fasset: TStringField
      DisplayLabel = #22266#23450#36164#20135#31185#30446#21517#31216
      FieldName = 'description_fasset'
      Size = 50
    end
    object ads517dept_code_1: TStringField
      DisplayLabel = #25104#26412#20013#24515#20195#30721
      FieldName = 'dept_code_1'
      Size = 10
    end
    object ads517dept_name_1: TStringField
      DisplayLabel = #25104#26412#20013#24515#21517#31216
      FieldName = 'dept_name_1'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = ads517
    Left = 476
    Top = 340
  end
  object PopupMenu2: TPopupMenu
    AutoHotkeys = maManual
    Left = 221
    Top = 83
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    Left = 224
    Top = 444
  end
end
