object Form1: TForm1
  Left = 207
  Top = 140
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #36864#22238#20379#24212#21830'('#19981#24102#37319#36141#35746#21333#30340#29983#20135#29289#26009')'
  ClientHeight = 440
  ClientWidth = 757
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
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
  object Label1: TLabel
    Left = 134
    Top = 32
    Width = 54
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#24037#21378':'
  end
  object Label2: TLabel
    Left = 121
    Top = 60
    Width = 67
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#20379#24212#21830':'
  end
  object Label3: TLabel
    Left = 304
    Top = 31
    Width = 7
    Height = 13
  end
  object Label4: TLabel
    Left = 304
    Top = 60
    Width = 7
    Height = 13
  end
  object csi_rkey: TLabel
    Left = 342
    Top = 16
    Width = 7
    Height = 13
    Caption = '1'
    Visible = False
  end
  object db_ptr: TLabel
    Left = 388
    Top = 14
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object vprev: TLabel
    Left = 404
    Top = 14
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 8
    Width = 52
    Height = 25
    Hint = #36864#20986
    Caption = #36864#20986
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 88
    Width = 757
    Height = 352
    Align = alBottom
    DataSource = DataSource1
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'inv_part_number'
        Title.Caption = #21407#26448#26009#20195#30721
        Width = 173
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BARCODE_ID'
        Title.Caption = #20837#20179#22791#27880
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantity'
        Title.Caption = #24050#25509#25910#30340#25968#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quan_on_hand'
        Title.Caption = #24211#23384#25968#37327
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quan_to_be_shipped'
        Title.Caption = #24453#35013#36816#25968#37327
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_RETURNED'
        Title.Caption = #24050#36864#36135#25968#37327
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'unit_code'
        Title.Caption = #23384#36135#21333#20301
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ship_DATE'
        Title.Caption = #25509#25910#26085#26399
        Width = 79
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 195
    Top = 28
    Width = 70
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Edit1Click
    OnExit = Edit1Exit
  end
  object Edit2: TEdit
    Left = 195
    Top = 56
    Width = 70
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Edit2Click
    OnExit = Edit2Exit
  end
  object BitBtn2: TBitBtn
    Left = 272
    Top = 26
    Width = 25
    Height = 25
    TabOrder = 4
    TabStop = False
    OnClick = BitBtn2Click
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
  object BitBtn3: TBitBtn
    Left = 272
    Top = 55
    Width = 25
    Height = 25
    TabOrder = 5
    TabStop = False
    OnClick = BitBtn3Click
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
  object BitBtn4: TBitBtn
    Left = 61
    Top = 8
    Width = 52
    Height = 25
    Caption = #21047#26032
    TabOrder = 6
    OnClick = BitBtn4Click
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      ' data0022.rkey,data0017.inv_part_number,data0017.inv_name,'
      ' data0022.BARCODE_ID,data0022.quantity,data0017.INV_DESCRIPTION,'
      ' data0022.quan_to_be_shipped,data0022.QUAN_RETURNED,'
      ' data0456.ship_DATE,data0022.quan_on_hand,'
      ' data0002.unit_code,data0022.inventory_ptr'
      'from data0022,data0017,data0002,data0456'
      'where data0022.grn_ptr=data0456.rkey  and'
      '      data0022.INVENTORY_PTR = data0017.rkey and'
      '      data0017.stock_unit_ptr = data0002.rkey and'
      '      data0022.quan_on_hand>0  AND data0456.ttype=3'
      ''
      ''
      'order by tdate')
    Left = 512
    Top = 24
    object ADOQuery1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1inv_part_number: TStringField
      FieldName = 'inv_part_number'
      Size = 25
    end
    object ADOQuery1BARCODE_ID: TStringField
      FieldName = 'BARCODE_ID'
      FixedChar = True
      Size = 12
    end
    object ADOQuery1quantity: TFloatField
      FieldName = 'quantity'
    end
    object ADOQuery1quan_to_be_shipped: TBCDField
      FieldName = 'quan_to_be_shipped'
      Precision = 18
      Size = 6
    end
    object ADOQuery1QUAN_RETURNED: TBCDField
      FieldName = 'QUAN_RETURNED'
      Precision = 18
      Size = 6
    end
    object ADOQuery1quan_on_hand: TFloatField
      FieldName = 'quan_on_hand'
    end
    object ADOQuery1unit_code: TStringField
      FieldName = 'unit_code'
      Size = 5
    end
    object ADOQuery1inventory_ptr: TIntegerField
      FieldName = 'inventory_ptr'
    end
    object ADOQuery1ship_DATE: TDateTimeField
      FieldName = 'ship_DATE'
    end
    object ADOQuery1inv_name: TStringField
      FieldName = 'inv_name'
      Size = 30
    end
    object ADOQuery1INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=SJ_V20_SAMPLE'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 478
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 512
    Top = 56
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 696
    Top = 56
    object N1: TMenuItem
      Caption = #36864#36135
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #32534#36753
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #26816#26597
      OnClick = N3Click
    end
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 544
    Top = 24
  end
end
