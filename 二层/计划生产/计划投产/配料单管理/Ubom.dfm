object Form_bom: TForm_bom
  Left = 33
  Top = 217
  Width = 1229
  Height = 640
  Caption = #29983#25104'BOM'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 39
    Width = 1213
    Height = 563
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGridEh1DrawColumnCell
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'zinv_part_number'
        Footers = <>
        Title.Caption = #26448#26009#32534#30721
        Title.Color = clRed
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'zinv_name'
        Footers = <>
        Title.Caption = #26448#26009#21517#31216
        Width = 98
      end
      item
        EditButtons = <>
        FieldName = 'UNIT_NAME'
        Footers = <>
        Title.Caption = #21333#20301
        Width = 55
      end
      item
        EditButtons = <>
        FieldName = 'STD_QTY'
        Footers = <>
        Title.Caption = #26631#20934#25968#37327
      end
      item
        EditButtons = <>
        FieldName = 'YXKC'
        Footers = <>
        Title.Caption = #26377#25928#24211#23384
        Width = 63
      end
      item
        EditButtons = <>
        FieldName = 'App_QTY'
        Footers = <>
        Title.Caption = #30003#35831#39046#26009#25968#37327
      end
      item
        EditButtons = <>
        FieldName = 'QUAN_ASSIGN'
        Footers = <>
        Title.Caption = #24050#20998#37197#25968#37327
        Width = 72
      end
      item
        EditButtons = <>
        FieldName = 'Con_QTY'
        Footers = <>
        Title.Caption = #24050#21457#26009#25968#37327
        Width = 75
      end
      item
        EditButtons = <>
        FieldName = 'zaitu'
        Footers = <>
        Title.Caption = #22312#36884
        Width = 69
      end
      item
        EditButtons = <>
        FieldName = 'vmi_quantotal'
        Footers = <>
        Title.Caption = 'VMI'#25968#37327
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'typeisTL'
        Footers = <>
        Title.Caption = #31867#22411
        Width = 66
      end
      item
        EditButtons = <>
        FieldName = 'isTL'
        Footers = <>
        Title.Caption = #26159#21542#26377#26367#26009
        Width = 71
      end
      item
        EditButtons = <>
        FieldName = 'INV_DESCRIPTION'
        Footers = <>
        Title.Caption = #26448#26009#35268#26684
        Width = 177
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1213
    Height = 39
    Align = alTop
    TabOrder = 1
    DesignSize = (
      1213
      39)
    object Label1: TLabel
      Left = 367
      Top = 14
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #26448#26009#32534#30721
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object BitBtn1: TBitBtn
      Left = 2
      Top = 5
      Width = 57
      Height = 30
      Hint = #36864#20986#31995#32479
      Caption = #36864#20986
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ModalResult = 3
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
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
    object BitBtn3: TBitBtn
      Left = 61
      Top = 5
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
      OnClick = BitBtn3Click
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
    object BitBtn2: TBitBtn
      Left = 119
      Top = 5
      Width = 57
      Height = 30
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
    object Edit1: TEdit
      Left = 428
      Top = 10
      Width = 121
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ParentFont = False
      TabOrder = 3
      OnChange = Edit1Change
    end
    object BitBtn4: TBitBtn
      Left = 177
      Top = 3
      Width = 84
      Height = 33
      Anchors = [akLeft, akBottom]
      Caption = #20445#23384'BOM'
      Default = True
      TabOrder = 4
      OnClick = BitBtn4Click
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
    end
    object BitBtn5: TBitBtn
      Left = 262
      Top = 3
      Width = 84
      Height = 33
      Anchors = [akLeft, akBottom]
      Caption = #26435#38480#35828#26126
      Default = True
      TabOrder = 5
      OnClick = BitBtn5Click
      NumGlyphs = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 620
    Top = 88
  end
  object ADODataSet2: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'SELECT     dbo.Data0017.QUAN_ON_HAND - dbo.Data0017.QUAN_ASSIGN ' +
      'AS YXKC,CASE dbo.data0801.Type WHEN 0 THEN '#39#20027#26009#39' WHEN 1 THEN '#39#26367#20195#26009 +
      #39' END AS typeisTL'#13#10',dbo.data0492.ISSUED_QTY * dbo.Data0801.Qty *' +
      '(1+ dbo.Data0801.FAILURE_RATE*0.01) AS qty, dbo.Data0800.RKEY25,' +
      ' dbo.data0492.ISSUED_QTY, dbo.Data0801.RKEY17, '#13#10'               ' +
      '       dbo.Data0801.RKEY AS rkey801, dbo.Data0800.Active, dbo.Da' +
      'ta0025.RKEY AS [25rkey], dbo.Data0801.Type, dbo.data0492.rkey, d' +
      'bo.Data0017.INV_NAME, '#13#10'                      dbo.Data0017.INV_P' +
      'ART_NUMBER, dbo.Data0801.FAILURE_RATE, dbo.Data0800.RKEY AS rkey' +
      '800, dbo.Data0017.INV_DESCRIPTION, '#13#10'                      dbo.D' +
      'ata0002.UNIT_NAME, isnull(z_t.zaitu,0)as zaitu , isnull(vmi.vmi_' +
      'quantotal,0)as vmi_quantotal,case WHEN TL.MainPtr is null THEN '#39 +
      #26080#26367#26009#39' ELSE '#39#26377#26367#26009#39' END as isTL'#13#10'FROM         dbo.Data0060 INNER JOI' +
      'N'#13#10'                      dbo.data0492 ON dbo.Data0060.SALES_ORDE' +
      'R = dbo.data0492.SO_NO INNER JOIN'#13#10'                      dbo.Dat' +
      'a0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY INNER JO' +
      'IN'#13#10'                      dbo.Data0800 INNER JOIN'#13#10'             ' +
      '         dbo.Data0801 ON dbo.Data0800.RKEY = dbo.Data0801.RKEY80' +
      '0 ON dbo.Data0025.RKEY = dbo.Data0800.RKEY25 INNER JOIN'#13#10'       ' +
      '               dbo.Data0017 ON dbo.Data0801.RKEY17 = dbo.Data001' +
      '7.RKEY INNER JOIN'#13#10'                      dbo.Data0002 ON dbo.Dat' +
      'a0017.PURCH_UNIT_PTR = dbo.Data0002.RKEY AND dbo.Data0017.STOCK_' +
      'UNIT_PTR = dbo.Data0002.RKEY LEFT OUTER JOIN'#13#10'                  ' +
      '        (SELECT     dbo.Data0071.INVT_PTR, SUM(dbo.Data0071.QUAN' +
      '_ORD - dbo.Data0071.QUAN_RECD) AS zaitu'#13#10'                       ' +
      '     FROM          dbo.Data0071 INNER JOIN'#13#10'                    ' +
      '                               dbo.Data0070 AS Data0070 ON dbo.D' +
      'ata0071.PO_PTR = Data0070.RKEY'#13#10'                            WHER' +
      'E      (Data0070.STATUS = 5) AND (dbo.Data0071.QUAN_ORD - dbo.Da' +
      'ta0071.QUAN_RECD > 0)'#13#10'                            GROUP BY dbo.' +
      'Data0071.INVT_PTR) AS z_t ON dbo.Data0017.RKEY = z_t.INVT_PTR LE' +
      'FT OUTER JOIN'#13#10'                          (SELECT     TOP (100) P' +
      'ERCENT INVENTORY_PTR, SUM(QUAN_ON_HAND) AS vmi_quantotal'#13#10'      ' +
      '                      FROM          dbo.DATA0134'#13#10'              ' +
      '              WHERE      (QUAN_ON_HAND > 0)'#13#10'                   ' +
      '         GROUP BY INVENTORY_PTR) AS vmi ON dbo.Data0017.RKEY = v' +
      'mi.INVENTORY_PTR'#13#10'                             LEFT OUTER JOIN(S' +
      'ELECT  d801.MainPtr'#13#10'                           FROM data0801 AS' +
      ' d801 WHERE d801.Type=1 GROUP BY d801.MainPtr) as TL ON tl.MainP' +
      'tr=data0801.rkey'#13#10
    Parameters = <>
    Left = 220
    Top = 88
    object ADODataSet2qty: TBCDField
      FieldName = 'qty'
      ReadOnly = True
      Precision = 20
      Size = 6
    end
    object ADODataSet2RKEY25: TIntegerField
      FieldName = 'RKEY25'
    end
    object ADODataSet2ISSUED_QTY: TIntegerField
      FieldName = 'ISSUED_QTY'
    end
    object ADODataSet2RKEY17: TIntegerField
      FieldName = 'RKEY17'
    end
    object ADODataSet2rkey801: TAutoIncField
      FieldName = 'rkey801'
      ReadOnly = True
    end
    object ADODataSet2Active: TBooleanField
      FieldName = 'Active'
    end
    object ADODataSet2DSDesigner25rkey: TAutoIncField
      FieldName = '25rkey'
      ReadOnly = True
    end
    object ADODataSet2Type: TWordField
      FieldName = 'Type'
    end
    object ADODataSet2rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADODataSet2INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADODataSet2INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADODataSet2FAILURE_RATE: TBCDField
      FieldName = 'FAILURE_RATE'
      Precision = 9
      Size = 6
    end
    object ADODataSet2rkey800: TAutoIncField
      FieldName = 'rkey800'
      ReadOnly = True
    end
    object ADODataSet2UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ADODataSet2vmi_quantotal: TBCDField
      FieldName = 'vmi_quantotal'
      Precision = 32
    end
    object ADODataSet2zaitu: TBCDField
      FieldName = 'zaitu'
      Precision = 32
    end
    object ADODataSet2isTL: TStringField
      FieldName = 'isTL'
      Size = 6
    end
    object ADODataSet2YXKC: TBCDField
      FieldName = 'YXKC'
      Precision = 20
    end
    object ADODataSet2typeisTL: TStringField
      FieldName = 'typeisTL'
      Size = 6
    end
    object ADODataSet2INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
  end
  object ADODataSet1: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT  dbo.WZCP0492.d017_ptr as cp492_17ptr, dbo.WZCP0492.Type,' +
      'CASE dbo.WZCP0492.Type WHEN 0 THEN '#39#20027#26009#39' WHEN 1 THEN '#39#26367#20195#26009#39' END AS' +
      ' typeisTL, dbo.Data0017.INV_PART_NUMBER AS zinv_part_number, '#13#10' ' +
      '                     dbo.Data0017.INV_NAME AS zinv_name, dbo.Dat' +
      'a0801.FAILURE_RATE, dbo.data0492.rkey AS rkey492, dbo.Data0801.R' +
      'KEY AS rkey801, dbo.WZCP0492.D492_ptr, WZCP0492.rkey as cprkey,'#13 +
      #10'                      dbo.WZCP0492.D017_ptr, dbo.WZCP0492.STD_Q' +
      'TY, dbo.Data0801.RKEY800, dbo.WZCP0492.d801_ptr, '#13#10'             ' +
      '         dbo.Data0017.INV_DESCRIPTION, dbo.Data0002.UNIT_NAME, d' +
      'bo.Data0017.QUAN_ON_HAND - dbo.Data0017.QUAN_ASSIGN AS YXKC, isn' +
      'ull(z_t.zaitu,0)as zaitu ,'#13#10'                      isnull(vmi.vmi' +
      '_quantotal,0)as vmi_quantotal,case WHEN TL.MainPtr is null THEN ' +
      #39#26080#26367#26009#39' ELSE '#39#26377#26367#26009#39' END as isTL  ,dbo.WZCP0492.App_QTY, dbo.WZCP049' +
      '2.Con_QTY, dbo.WZCP0492.QUAN_ASSIGN'#13#10'FROM       dbo.Data0017 '#13#10'I' +
      'NNER JOIN dbo.wzcp0492 ON dbo.Data0017.RKEY = wzcp0492.D017_ptr ' +
      ' '#13#10'INNER JOIN dbo.Data0801 ON dbo.Data0801.RKEY = dbo.WZCP0492.d' +
      '801_ptr'#13#10'INNER JOIN dbo.data0492 ON dbo.WZCP0492.D492_ptr = dbo.' +
      'data0492.rkey  '#13#10'INNER JOIN dbo.Data0002 ON dbo.Data0017.STOCK_U' +
      'NIT_PTR = dbo.Data0002.RKEY '#13#10'LEFT OUTER JOIN'#13#10'                 ' +
      '     '#13#10'                          (SELECT     dbo.Data0071.INVT_P' +
      'TR, SUM(dbo.Data0071.QUAN_ORD - dbo.Data0071.QUAN_RECD) AS zaitu' +
      #13#10'                            FROM          dbo.Data0071 INNER J' +
      'OIN'#13#10'                                                   dbo.Data' +
      '0070 AS Data0070 ON dbo.Data0071.PO_PTR = Data0070.RKEY'#13#10'       ' +
      '                     WHERE      (Data0070.STATUS = 5) AND (dbo.D' +
      'ata0071.QUAN_ORD - dbo.Data0071.QUAN_RECD > 0)'#13#10'                ' +
      '            GROUP BY dbo.Data0071.INVT_PTR) AS z_t ON dbo.Data00' +
      '17.RKEY = z_t.INVT_PTR LEFT OUTER JOIN'#13#10'                        ' +
      '  (SELECT     TOP (100) PERCENT INVENTORY_PTR, SUM(QUAN_ON_HAND)' +
      ' AS vmi_quantotal'#13#10'                            FROM          dbo' +
      '.DATA0134'#13#10'                            WHERE      (QUAN_ON_HAND ' +
      '> 0)'#13#10'                            GROUP BY INVENTORY_PTR) AS vmi' +
      ' ON dbo.Data0017.RKEY = vmi.INVENTORY_PTR'#13#10'                     ' +
      '       LEFT OUTER JOIN'#13#10'                          (SELECT   d801' +
      '.MainPtr   '#13#10'                           FROM data0801 AS d801 WH' +
      'ERE d801.Type=1 GROUP BY d801.MainPtr ) as TL ON tl.MainPtr=data' +
      '0801.rkey'#13#10
    Parameters = <>
    Left = 352
    Top = 92
    object ADODataSet1zinv_part_number: TStringField
      FieldName = 'zinv_part_number'
      Size = 25
    end
    object ADODataSet1zinv_name: TStringField
      FieldName = 'zinv_name'
      Size = 30
    end
    object ADODataSet1FAILURE_RATE: TBCDField
      FieldName = 'FAILURE_RATE'
      Precision = 9
      Size = 6
    end
    object ADODataSet1D492_ptr: TIntegerField
      FieldName = 'D492_ptr'
    end
    object ADODataSet1D017_ptr: TIntegerField
      FieldName = 'D017_ptr'
    end
    object ADODataSet1STD_QTY: TBCDField
      FieldName = 'STD_QTY'
      Precision = 12
    end
    object ADODataSet1RKEY800: TIntegerField
      FieldName = 'RKEY800'
    end
    object ADODataSet1d801_ptr: TIntegerField
      FieldName = 'd801_ptr'
    end
    object ADODataSet1rkey492: TAutoIncField
      FieldName = 'rkey492'
      ReadOnly = True
    end
    object ADODataSet1rkey801: TAutoIncField
      FieldName = 'rkey801'
    end
    object ADODataSet1UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ADODataSet1YXKC: TBCDField
      FieldName = 'YXKC'
      Precision = 20
    end
    object ADODataSet1isTL: TStringField
      FieldName = 'isTL'
      Size = 6
    end
    object ADODataSet1App_QTY: TBCDField
      FieldName = 'App_QTY'
      Precision = 12
    end
    object ADODataSet1Con_QTY: TBCDField
      FieldName = 'Con_QTY'
      Precision = 12
    end
    object ADODataSet1QUAN_ASSIGN: TBCDField
      FieldName = 'QUAN_ASSIGN'
      Precision = 12
    end
    object ADODataSet1Type: TWordField
      FieldName = 'Type'
    end
    object ADODataSet1typeisTL: TStringField
      FieldName = 'typeisTL'
      Size = 6
    end
    object ADODataSet1zaitu: TBCDField
      FieldName = 'zaitu'
      Precision = 32
    end
    object ADODataSet1vmi_quantotal: TBCDField
      FieldName = 'vmi_quantotal'
      Precision = 32
    end
    object ADODataSet1INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADODataSet1cprkey: TAutoIncField
      FieldName = 'cprkey'
      ReadOnly = True
    end
    object ADODataSet1cp492_17ptr: TIntegerField
      FieldName = 'cp492_17ptr'
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 240
    Top = 176
    object N1: TMenuItem
      Caption = #36873#25321#22791#29992#26009
      OnClick = N1Click
    end
    object N5: TMenuItem
      Caption = #36824#21407#20027#26009
      OnClick = N5Click
    end
    object N2: TMenuItem
      Caption = #33258#21160#20998#37197
      OnClick = N2Click
    end
    object N4: TMenuItem
      Caption = #21462#28040#20998#37197
      OnClick = N4Click
    end
    object N3: TMenuItem
      Caption = #26597#30475#20998#37197#26126#32454
      OnClick = N3Click
    end
  end
  object ADODataSet3: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from wzcp0492'
    Parameters = <>
    Left = 72
    Top = 96
    object ADODataSet3Rkey: TIntegerField
      FieldName = 'Rkey'
    end
    object ADODataSet3D492_ptr: TIntegerField
      FieldName = 'D492_ptr'
    end
    object ADODataSet3D017_ptr: TIntegerField
      FieldName = 'D017_ptr'
    end
    object ADODataSet3STD_QTY: TBCDField
      FieldName = 'STD_QTY'
      Precision = 12
    end
    object ADODataSet3App_QTY: TBCDField
      FieldName = 'App_QTY'
      Precision = 12
    end
    object ADODataSet3Con_QTY: TBCDField
      FieldName = 'Con_QTY'
      Precision = 12
    end
    object ADODataSet3QUAN_ASSIGN: TBCDField
      FieldName = 'QUAN_ASSIGN'
      Precision = 12
    end
    object ADODataSet3d801_ptr: TIntegerField
      FieldName = 'd801_ptr'
    end
    object ADODataSet3Type: TWordField
      FieldName = 'Type'
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 536
    Top = 88
    object ClientDataSet1zinv_part_number: TStringField
      FieldName = 'zinv_part_number'
      Size = 25
    end
    object ClientDataSet1zinv_name: TStringField
      FieldName = 'zinv_name'
      Size = 30
    end
    object ClientDataSet1FAILURE_RATE: TBCDField
      FieldName = 'FAILURE_RATE'
      Precision = 9
      Size = 6
    end
    object ClientDataSet1D492_ptr: TIntegerField
      FieldName = 'D492_ptr'
    end
    object ClientDataSet1D017_ptr: TIntegerField
      FieldName = 'D017_ptr'
    end
    object ClientDataSet1STD_QTY: TBCDField
      FieldName = 'STD_QTY'
      Precision = 12
    end
    object ClientDataSet1RKEY800: TIntegerField
      FieldName = 'RKEY800'
    end
    object ClientDataSet1d801_ptr: TIntegerField
      FieldName = 'd801_ptr'
    end
    object ClientDataSet1rkey492: TAutoIncField
      FieldName = 'rkey492'
      ReadOnly = True
    end
    object ClientDataSet1rkey801: TAutoIncField
      FieldName = 'rkey801'
      ReadOnly = True
    end
    object ClientDataSet1UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ClientDataSet1YXKC: TBCDField
      FieldName = 'YXKC'
      Precision = 20
    end
    object ClientDataSet1isTL: TStringField
      FieldName = 'isTL'
      Size = 6
    end
    object ClientDataSet1App_QTY: TBCDField
      FieldName = 'App_QTY'
      Precision = 12
    end
    object ClientDataSet1Con_QTY: TBCDField
      FieldName = 'Con_QTY'
      Precision = 12
    end
    object ClientDataSet1QUAN_ASSIGN: TBCDField
      FieldName = 'QUAN_ASSIGN'
      Precision = 12
    end
    object ClientDataSet1Type: TSmallintField
      FieldName = 'Type'
    end
    object ClientDataSet1typeisTL: TStringField
      FieldName = 'typeisTL'
      Size = 6
    end
    object ClientDataSet1zaitu: TBCDField
      FieldName = 'zaitu'
      Precision = 32
    end
    object ClientDataSet1vmi_quantotal: TBCDField
      FieldName = 'vmi_quantotal'
      Precision = 32
    end
    object ClientDataSet1INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ClientDataSet1cprkey: TAutoIncField
      FieldName = 'cprkey'
      ReadOnly = True
    end
    object ClientDataSet1cp492_17ptr: TIntegerField
      FieldName = 'cp492_17ptr'
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = ADODataSet1
    Left = 452
    Top = 88
  end
  object ADO22: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = '17key'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     TOP (100) PERCENT dbo.Data0456.ship_DATE, dbo.Data002' +
        '2.RKEY, dbo.Data0017.INV_PART_NUMBER, '
      
        '                      dbo.Data0022.QUAN_ON_HAND - dbo.Data0022.Q' +
        'UAN_TO_BE_STOCKED AS ValQty, dbo.Data0022.QUAN_TO_BE_SHIPPED, '
      '                      dbo.Data0022.QUAN_TO_BE_STOCKED'
      'FROM         dbo.Data0017 INNER JOIN'
      
        '                      dbo.Data0022 ON dbo.Data0017.RKEY = dbo.Da' +
        'ta0022.INVENTORY_PTR INNER JOIN'
      
        '                      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo' +
        '.Data0456.RKEY'
      
        'WHERE     (dbo.Data0017.RKEY = :17key) AND (dbo.Data0022.QUAN_ON' +
        '_HAND - dbo.Data0022.QUAN_TO_BE_STOCKED > 0)'
      'ORDER BY dbo.Data0456.ship_DATE')
    Left = 604
    Top = 312
    object ADO22ship_DATE: TDateTimeField
      FieldName = 'ship_DATE'
    end
    object ADO22RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO22INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADO22ValQty: TBCDField
      FieldName = 'ValQty'
      ReadOnly = True
      Precision = 22
      Size = 6
    end
    object ADO22QUAN_TO_BE_SHIPPED: TBCDField
      FieldName = 'QUAN_TO_BE_SHIPPED'
      Precision = 18
      Size = 6
    end
    object ADO22QUAN_TO_BE_STOCKED: TBCDField
      FieldName = 'QUAN_TO_BE_STOCKED'
      Precision = 18
      Size = 6
    end
  end
  object ADO475: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT     dbo.DATA0475.*'
      'FROM         dbo.DATA0475')
    Left = 600
    Top = 376
    object ADO475rkey468: TIntegerField
      FieldName = 'rkey468'
    end
    object ADO475rkey22: TIntegerField
      FieldName = 'rkey22'
    end
    object ADO475quan_alloc: TBCDField
      FieldName = 'quan_alloc'
      Precision = 10
      Size = 2
    end
    object ADO475alloc_userptr: TIntegerField
      FieldName = 'alloc_userptr'
    end
    object ADO475alloc_datetime: TDateTimeField
      FieldName = 'alloc_datetime'
    end
    object ADO475cp492_ptr: TIntegerField
      FieldName = 'cp492_ptr'
    end
  end
  object ADOCommand1: TADOCommand
    Connection = DM.ADOConnection1
    Parameters = <>
    Left = 724
    Top = 316
  end
end
