object FrmMain: TFrmMain
  Left = 624
  Top = 156
  Width = 771
  Height = 546
  VertScrollBar.Range = 218
  AutoScroll = False
  Caption = #21322#25104#21697#39046#26009#20986#20179
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 330
    Width = 755
    Height = 7
    Cursor = crVSplit
    Align = alBottom
  end
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 755
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 160
      Top = 14
      Width = 65
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #20986#20179#21333#21495
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object BitBtn1: TBitBtn
      Left = 6
      Top = 5
      Width = 75
      Height = 28
      Cursor = crHandPoint
      Hint = #36864#20986
      Caption = #36864#20986
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = False
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
    object Edit1: TEdit
      Left = 228
      Top = 10
      Width = 121
      Height = 21
      TabOrder = 3
      OnChange = Edit1Change
    end
    object GroupBox2: TGroupBox
      Left = 498
      Top = 0
      Width = 259
      Height = 38
      Caption = #26085#26399#33539#22260
      TabOrder = 0
      object Label8: TLabel
        Left = 8
        Top = 17
        Width = 18
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20174':'
      end
      object Label9: TLabel
        Left = 134
        Top = 17
        Width = 17
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #21040':'
      end
      object dtpk1: TDateTimePicker
        Left = 32
        Top = 13
        Width = 97
        Height = 21
        Date = 37600.000000000000000000
        Time = 37600.000000000000000000
        TabOrder = 0
        OnCloseUp = dtpk1CloseUp
        OnExit = dtpk1CloseUp
      end
      object DTPk2: TDateTimePicker
        Left = 156
        Top = 13
        Width = 97
        Height = 21
        Date = 37600.000000000000000000
        Time = 37600.000000000000000000
        TabOrder = 1
        OnCloseUp = dtpk1CloseUp
        OnExit = dtpk1CloseUp
      end
    end
    object BitBtn3: TBitBtn
      Left = 81
      Top = 5
      Width = 75
      Height = 28
      Hint = #21047#26032#25968#25454
      Caption = #21047#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
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
  end
  object pnlDetail: TPanel
    Left = 0
    Top = 337
    Width = 755
    Height = 171
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object DBGrid2: TDBGrid
      Left = 0
      Top = 0
      Width = 755
      Height = 171
      Align = alClient
      DataSource = DataSource2
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = PopupMenu2
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'PROD_CODE'
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRODUCT_NAME'
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRODUCT_DESC'
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LOCATION'
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantity'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'returen_qty'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'price'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'remark'
          Width = 169
          Visible = True
        end>
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 755
    Height = 289
    Align = alClient
    DataSource = DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'sales_order'
        Title.Color = clRed
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SO_NO'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUT_NO'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sales_date'
        ReadOnly = False
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ship_method'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ent_date'
        ReadOnly = False
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total_amount'
        ReadOnly = False
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTACT_NAME'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'remark'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 109
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = dsaq60
    Left = 100
    Top = 169
  end
  object DataSource2: TDataSource
    DataSet = dsaq63
    Left = 100
    Top = 416
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 128
    Top = 169
    object N3: TMenuItem
      Caption = #21322#25104#21697#21457#25918
      OnClick = N3Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N1: TMenuItem
      Caption = #20840#37096#36864#20179
      OnClick = N1Click
    end
    object N4: TMenuItem
      Caption = #25171#21360#20986#20179#21333
      Visible = False
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 128
    Top = 416
    object N2: TMenuItem
      Caption = #21333#39033#36864#20179
      OnClick = N2Click
    end
  end
  object dsaq60: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.WZCP0060.rkey, dbo.WZCP0060.sales_order, dbo.WZCP' +
      '0060.sales_date, dbo.WZCP0060.type, dbo.WZCP0060.status, '#13#10'     ' +
      '                 dbo.WZCP0060.ship_method, dbo.WZCP0060.ent_date' +
      ', dbo.WZCP0060.ent_user_ptr, dbo.Data0005.EMPLOYEE_NAME, dbo.WZC' +
      'P0060.currency_ptr, '#13#10'                      dbo.WZCP0060.total_a' +
      'mount, dbo.WZCP0060.CONTACT_NAME, dbo.WZCP0060.remark, dbo.WZCP0' +
      '060.MO_PTR, '#13#10'                      dbo.data0492.CUT_NO, dbo.dat' +
      'a0492.SO_NO'#13#10'FROM         dbo.WZCP0060 INNER JOIN'#13#10'             ' +
      '         dbo.data0492 ON dbo.WZCP0060.MO_PTR = dbo.data0492.rkey' +
      ' INNER JOIN'#13#10'                      dbo.Data0005 ON dbo.WZCP0060.' +
      'ent_user_ptr = dbo.Data0005.RKEY'#13#10'WHERE     (dbo.WZCP0060.type =' +
      ' 3) AND (dbo.WZCP0060.status = 3) AND (dbo.WZCP0060.currency_ptr' +
      ' = 1) AND '#13#10'                  (dbo.WZCP0060.sales_date >= :dtpk1' +
      ' ) AND (dbo.WZCP0060.sales_date <= :dtpk2 )'
    IndexFieldNames = 'SALES_ORDER'
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 38718d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 38930d
      end>
    Left = 72
    Top = 169
    object dsaq60rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object dsaq60sales_order: TStringField
      DisplayLabel = #20986#20179#21333#21495
      FieldName = 'sales_order'
      Size = 12
    end
    object dsaq60sales_date: TDateTimeField
      DisplayLabel = #20986#20179#26085#26399
      FieldName = 'sales_date'
    end
    object dsaq60type: TWordField
      FieldName = 'type'
    end
    object dsaq60status: TWordField
      FieldName = 'status'
    end
    object dsaq60ship_method: TStringField
      DisplayLabel = #35013#36816#26041#24335
      FieldName = 'ship_method'
    end
    object dsaq60ent_date: TDateTimeField
      DisplayLabel = #24405#20837#26102#38388
      FieldName = 'ent_date'
    end
    object dsaq60ent_user_ptr: TIntegerField
      FieldName = 'ent_user_ptr'
    end
    object dsaq60EMPLOYEE_NAME: TStringField
      DisplayLabel = #24405#20837#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object dsaq60currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
    object dsaq60total_amount: TBCDField
      DisplayLabel = #21512#35745#37329#39069
      FieldName = 'total_amount'
      Precision = 10
      Size = 2
    end
    object dsaq60CONTACT_NAME: TStringField
      DisplayLabel = #39046#26009#20154
      FieldName = 'CONTACT_NAME'
    end
    object dsaq60remark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 50
    end
    object dsaq60MO_PTR: TIntegerField
      FieldName = 'MO_PTR'
    end
    object dsaq60CUT_NO: TStringField
      DisplayLabel = #29983#20135#21333#21495
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object dsaq60SO_NO: TStringField
      DisplayLabel = #38144#21806#35746#21333#21495
      FieldName = 'SO_NO'
      Size = 12
    end
  end
  object dsaq63: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT     dbo.WZCP0063.rkey, dbo.WZCP0063.so_ptr, dbo.WZCP0063.' +
      'prod_ptr, dbo.Data0008.PROD_CODE, dbo.Data0008.PRODUCT_NAME, '#13#10' ' +
      '                     dbo.Data0008.PRODUCT_DESC, dbo.WZCP0063.loc' +
      'ation_ptr, dbo.Data0016.LOCATION, dbo.WZCP0063.D0468_PTR, dbo.WZ' +
      'CP0063.quantity, '#13#10'                      dbo.WZCP0063.price, dbo' +
      '.WZCP0063.returen_qty, dbo.WZCP0063.remark, dbo.Data0468.QUAN_IS' +
      'SUED, dbo.Data0468.STATUS,dbo.Data0002.UNIT_NAME,'#13#10'             ' +
      '        dbo.WZCP0001.qty_on_hand AS qty_on_hand01, dbo.Data0008.' +
      'qty_onhand AS qty_onhand08'#13#10'FROM         dbo.WZCP0063 INNER JOIN' +
      #13#10'                      dbo.Data0008 ON dbo.WZCP0063.prod_ptr = ' +
      'dbo.Data0008.RKEY INNER JOIN'#13#10'                      dbo.Data0016' +
      ' ON dbo.WZCP0063.location_ptr = dbo.Data0016.RKEY INNER JOIN'#13#10'  ' +
      '                    dbo.Data0468 ON dbo.WZCP0063.D0468_PTR = dbo' +
      '.Data0468.RKEY INNER JOIN'#13#10'                      dbo.Data0002 ON' +
      ' dbo.Data0008.unit_ptr = dbo.Data0002.RKEY INNER JOIN'#13#10'         ' +
      '             dbo.WZCP0001 ON dbo.WZCP0063.location_ptr = dbo.WZC' +
      'P0001.location_ptr AND dbo.WZCP0063.prod_ptr = dbo.WZCP0001.proc' +
      '_ptr'#13#10'WHERE dbo.WZCP0063.so_ptr = :rkey'
    DataSource = DataSource1
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    Left = 72
    Top = 416
    object dsaq63rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object dsaq63so_ptr: TIntegerField
      FieldName = 'so_ptr'
    end
    object dsaq63prod_ptr: TIntegerField
      FieldName = 'prod_ptr'
    end
    object dsaq63PROD_CODE: TStringField
      DisplayLabel = #20135#21697#32534#30721
      FieldName = 'PROD_CODE'
      Size = 15
    end
    object dsaq63PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object dsaq63PRODUCT_DESC: TStringField
      DisplayLabel = #20135#21697#35268#26684
      FieldName = 'PRODUCT_DESC'
      Size = 50
    end
    object dsaq63location_ptr: TIntegerField
      FieldName = 'location_ptr'
    end
    object dsaq63LOCATION: TStringField
      DisplayLabel = #20179#24211
      FieldName = 'LOCATION'
      Size = 10
    end
    object dsaq63D0468_PTR: TIntegerField
      FieldName = 'D0468_PTR'
    end
    object dsaq63quantity: TBCDField
      DisplayLabel = #20986#20179#25968#37327
      FieldName = 'quantity'
      Precision = 10
      Size = 2
    end
    object dsaq63price: TBCDField
      DisplayLabel = #20215#26684
      FieldName = 'price'
      Precision = 10
      Size = 2
    end
    object dsaq63returen_qty: TBCDField
      DisplayLabel = #36864#22238#25968#37327
      FieldName = 'returen_qty'
      Precision = 10
      Size = 2
    end
    object dsaq63remark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 50
    end
    object dsaq63QUAN_ISSUED: TFloatField
      FieldName = 'QUAN_ISSUED'
    end
    object dsaq63STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object dsaq63UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object dsaq63qty_on_hand01: TBCDField
      FieldName = 'qty_on_hand01'
      Precision = 10
      Size = 3
    end
    object dsaq63qty_onhand08: TBCDField
      FieldName = 'qty_onhand08'
      Precision = 10
      Size = 3
    end
  end
end
