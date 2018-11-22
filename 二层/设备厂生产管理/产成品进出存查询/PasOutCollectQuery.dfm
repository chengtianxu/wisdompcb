object FrmOutCollectQuery: TFrmOutCollectQuery
  Left = 279
  Top = 126
  BorderStyle = bsSingle
  Caption = #20135#21697#20986#20179#27719#24635#26597#35810
  ClientHeight = 529
  ClientWidth = 971
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 971
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 228
      Top = 17
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #20986#20179#25968#37327#21512#35745':'
    end
    object Label4: TLabel
      Left = 425
      Top = 16
      Width = 69
      Height = 14
      Alignment = taRightJustify
      AutoSize = False
      Caption = '   '#37329#39069#21512#35745':'
    end
    object Edit1: TEdit
      Left = 321
      Top = 14
      Width = 89
      Height = 21
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 2
      Text = '0'
    end
    object BitBtn1: TBitBtn
      Left = 3
      Top = 7
      Width = 61
      Height = 30
      Hint = #36864#20986#31995#32479
      Caption = #36864#20986
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
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
    object BitBtn2: TBitBtn
      Left = 64
      Top = 7
      Width = 62
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
    object Edit2: TEdit
      Left = 499
      Top = 12
      Width = 90
      Height = 21
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 3
      Text = '0.00'
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 971
    Height = 488
    Align = alClient
    DataSource = DataSource2
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    ReadOnly = True
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'LOCATION'
        Footer.Value = #21512#35745
        Footer.ValueType = fvtStaticText
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #20179#24211#21517#31216
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'PROD_CODE'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #20135#21697#32534#30721
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'PRODUCT_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #20135#21697#21517#31216
        Width = 150
      end
      item
        EditButtons = <>
        FieldName = 'PRODUCT_DESC'
        Footers = <>
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'PRODUCT_GROUP_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #20135#21697#31867#21035
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'quantity'
        Footer.FieldName = 'quantity'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #25968#37327
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'CPTatal'
        Footer.FieldName = 'CPTatal'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #20986#24211#37329#39069
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'UNIT_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #21333#20301
        Width = 50
      end>
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery1
    Left = 760
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT  dbo.Data0016.LOCATION,dbo.data0008.PROD_CODE, dbo.Data00' +
        '08.PRODUCT_NAME, dbo.Data0007.PRODUCT_GROUP_NAME,data0008.PRODUC' +
        'T_DESC,'
      
        #9#9'sum(dbo.WZCP0063.quantity) as quantity,'#9'sum(dbo.WZCP0063.price' +
        ' * dbo.WZCP0063.quantity) AS CPTatal,dbo.data0002.UNIT_NAME'
      'FROM    dbo.WZCP0063 INNER JOIN'
      
        #9#9'dbo.WZCP0060 ON  dbo.WZCP0063.so_ptr= dbo.WZCP0060.rkey INNER ' +
        'JOIN'
      
        #9#9'dbo.Data0016 ON dbo.WZCP0063.location_ptr = dbo.Data0016.RKEY ' +
        'INNER JOIN'
      
        '        dbo.data0008 on dbo.WZCP0063.prod_ptr=data0008.Rkey inne' +
        'r join'
      
        '        dbo.data0002 on dbo.data0008.unit_ptr=dbo.data0002.Rkey ' +
        'inner join'
      
        '        dbo.data0007 on dbo.Data0008.PR_GRP_POINTER = dbo.Data00' +
        '07.RKEY inner join'
      
        #9#9'dbo.Data0005 ON dbo.WZCP0060.ent_user_ptr = dbo.Data0005.RKEY ' +
        'left outer JOIN'
      
        '        dbo.data0005 as data0005_1 on dbo.WZCP0060.CONF_BY_EMPL_' +
        'PTR=data0005_1.Rkey left outer join'#9#9
      
        #9#9'dbo.Data0010 ON dbo.WZCP0060.customer_ptr = dbo.Data0010.RKEY ' +
        'LEFT OUTER JOIN'
      #9#9'dbo.Data0001 ON dbo.WZCP0060.currency_ptr = dbo.Data0001.RKEY '
      'WHERE  (1 = 1) AND (dbo.WZCP0060.status IN (3, 4))'
      
        'Group by dbo.Data0016.LOCATION,dbo.data0008.PROD_CODE, dbo.Data0' +
        '008.PRODUCT_NAME,'
      
        ' dbo.Data0007.PRODUCT_GROUP_NAME,dbo.data0002.UNIT_NAME,data0008' +
        '.PRODUCT_DESC'
      'order by dbo.Data0016.LOCATION, dbo.Data0008.PROD_CODE')
    Left = 808
    Top = 8
    object ADOQuery1LOCATION: TStringField
      FieldName = 'LOCATION'
    end
    object ADOQuery1PROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 25
    end
    object ADOQuery1PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADOQuery1PRODUCT_GROUP_NAME: TStringField
      FieldName = 'PRODUCT_GROUP_NAME'
      Size = 30
    end
    object ADOQuery1quantity: TBCDField
      FieldName = 'quantity'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
    object ADOQuery1CPTatal: TBCDField
      FieldName = 'CPTatal'
      ReadOnly = True
      Precision = 32
    end
    object ADOQuery1UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ADOQuery1PRODUCT_DESC: TStringField
      DisplayLabel = #20135#21697#35268#26684
      DisplayWidth = 100
      FieldName = 'PRODUCT_DESC'
      Size = 200
    end
  end
end
