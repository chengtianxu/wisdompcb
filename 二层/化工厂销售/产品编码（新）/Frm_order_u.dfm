object Frm_order: TFrm_order
  Left = 304
  Top = 182
  BorderStyle = bsSingle
  Caption = #38144#21806#35746#21333
  ClientHeight = 550
  ClientWidth = 880
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 33
    Width = 880
    Height = 517
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'cust_code'
        Footers = <>
        Width = 53
      end
      item
        EditButtons = <>
        FieldName = 'ABBR_NAME'
        Footers = <>
        Width = 56
      end
      item
        EditButtons = <>
        FieldName = 'sales_order'
        Footers = <>
        Width = 67
      end
      item
        EditButtons = <>
        FieldName = 'PROD_CODE'
        Footers = <>
        Width = 74
      end
      item
        EditButtons = <>
        FieldName = 'PRODUCT_NAME'
        Footers = <>
        Width = 82
      end
      item
        EditButtons = <>
        FieldName = 'PRODUCT_DESC'
        Footers = <>
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_NAME'
        Footers = <>
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'sales_date'
        Footers = <>
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'quantity'
        Footers = <>
        Title.Caption = #35746#21333#25968#37327
        Width = 58
      end
      item
        EditButtons = <>
        FieldName = 'unit_name'
        Footers = <>
        Width = 32
      end
      item
        EditButtons = <>
        FieldName = 'complete_date'
        Footers = <>
        Width = 68
      end
      item
        EditButtons = <>
        FieldName = 'CONTACT_NAME'
        Footers = <>
        Width = 41
      end
      item
        EditButtons = <>
        FieldName = 'CONT_PHONE'
        Footers = <>
        Width = 58
      end
      item
        EditButtons = <>
        FieldName = 'remark'
        Footers = <>
        Width = 101
      end
      item
        EditButtons = <>
        FieldName = 'status_c'
        Footers = <>
        Width = 52
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 880
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label2: TLabel
      Left = 148
      Top = 7
      Width = 48
      Height = 12
      Caption = #23458#25143#20195#30721
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object BitBtn1: TBitBtn
      Left = 3
      Top = 2
      Width = 55
      Height = 30
      Cursor = crHandPoint
      Hint = #36864#20986
      Caption = #36864#20986
      ModalResult = 1
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      TabStop = False
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
      Left = 208
      Top = 4
      Width = 121
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnChange = Edit1Change
    end
    object BitBtn2: TBitBtn
      Left = 58
      Top = 2
      Width = 64
      Height = 30
      Caption = #23548#20986
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
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
  end
  object ADO70: TADOQuery
    Connection = DM.ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     dbo.WZCP0070.sales_order, dbo.WZCP0070.sales_date, db' +
        'o.Data0010.CUST_CODE, dbo.Data0010.ABBR_NAME, dbo.WZCP0071.quant' +
        'ity, '
      
        '                      dbo.WZCP0071.complete_date, dbo.WZCP0071.r' +
        'emark, dbo.WZCP0070.status, dbo.WZCP0070.CONTACT_NAME, dbo.WZCP0' +
        '070.CONT_PHONE, '
      
        '                      dbo.WZCP0071.prod_ptr, dbo.Data0008.PROD_C' +
        'ODE, dbo.Data0008.PRODUCT_NAME, dbo.Data0008.PRODUCT_DESC, dbo.D' +
        'ata0034.DEPT_CODE, '
      
        '                      dbo.Data0034.DEPT_NAME, dbo.Data0002.UNIT_' +
        'NAME, '
      
        '                      CASE WHEN wzcp0070.status = 1 THEN '#39#26410#25552#20132#39' W' +
        'HEN wzcp0070.status = 2 THEN '#39#24453#30830#35748#39' WHEN wzcp0070.status = 3 THEN' +
        ' '#39#24050#30830#35748#39' WHEN wzcp0070.status'
      
        '                       = 4 THEN '#39#24050#25237#20135#39' WHEN wzcp0070.status = 5 T' +
        'HEN '#39#24050#23436#25104#39' WHEN wzcp0070.status = 6 THEN '#39#34987#36864#22238#39' END AS status_c'
      'FROM         dbo.WZCP0070 INNER JOIN'
      
        '                      dbo.WZCP0071 ON dbo.WZCP0070.rkey = dbo.WZ' +
        'CP0071.so_ptr INNER JOIN'
      
        '                      dbo.Data0010 ON dbo.WZCP0070.customer_ptr ' +
        '= dbo.Data0010.RKEY INNER JOIN'
      
        '                      dbo.Data0008 ON dbo.WZCP0071.prod_ptr = db' +
        'o.Data0008.RKEY INNER JOIN'
      
        '                      dbo.Data0034 ON dbo.WZCP0070.produce_deptp' +
        'tr = dbo.Data0034.RKEY INNER JOIN'
      
        '                      dbo.Data0002 ON dbo.Data0008.unit_ptr = db' +
        'o.Data0002.RKEY')
    Left = 552
    object ADO70cust_code: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'cust_code'
      Size = 10
    end
    object ADO70ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADO70sales_order: TStringField
      DisplayLabel = #35746#21333#32534#21495
      FieldName = 'sales_order'
      Size = 12
    end
    object ADO70sales_date: TDateTimeField
      DisplayLabel = #19979#21333#26085#26399
      FieldName = 'sales_date'
    end
    object ADO70unit_name: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'unit_name'
    end
    object ADO70complete_date: TDateTimeField
      DisplayLabel = #23436#24037#26085#26399
      FieldName = 'complete_date'
    end
    object ADO70CONTACT_NAME: TStringField
      DisplayLabel = #32852#31995#20154
      FieldName = 'CONTACT_NAME'
    end
    object ADO70CONT_PHONE: TStringField
      DisplayLabel = #32852#31995#30005#35805
      FieldName = 'CONT_PHONE'
    end
    object ADO70remark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 50
    end
    object ADO70status_c: TStringField
      DisplayLabel = #35746#21333#29366#24577
      FieldName = 'status_c'
      ReadOnly = True
      Size = 6
    end
    object ADO70status: TWordField
      FieldName = 'status'
    end
    object ADO70prod_ptr: TIntegerField
      FieldName = 'prod_ptr'
    end
    object ADO70PROD_CODE: TStringField
      DisplayLabel = #24037#31243#32534#30721
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADO70PRODUCT_NAME: TStringField
      DisplayLabel = #24037#31243#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADO70DEPT_CODE: TStringField
      DisplayLabel = #21046#36896#37096#38376
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADO70DEPT_NAME: TStringField
      DisplayLabel = #29983#20135#37096#38376
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADO70PRODUCT_DESC: TStringField
      DisplayLabel = #20135#21697#35268#26684
      FieldName = 'PRODUCT_DESC'
      Size = 200
    end
    object ADO70quantity: TFloatField
      FieldName = 'quantity'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO70
    Left = 512
  end
end
