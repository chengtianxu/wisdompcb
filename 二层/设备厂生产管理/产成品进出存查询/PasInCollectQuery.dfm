object FrmInCollectQuery: TFrmInCollectQuery
  Left = 383
  Top = 175
  BorderStyle = bsSingle
  Caption = #20837#24211#27719#24635#26597#35810
  ClientHeight = 521
  ClientWidth = 784
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
    Width = 784
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 451
      Top = 17
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '    '#20837#20179#25968#37327#21512#35745':'
    end
    object Label2: TLabel
      Left = 136
      Top = 16
      Width = 65
      Height = 13
      Caption = #20135#21697#32534#30721#65306
    end
    object Edit1: TEdit
      Left = 544
      Top = 14
      Width = 89
      Height = 21
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 0
      Text = '0'
    end
    object BitBtn1: TBitBtn
      Left = 3
      Top = 6
      Width = 60
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
      TabOrder = 1
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
      Left = 63
      Top = 6
      Width = 60
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
    object Edit2: TEdit
      Left = 206
      Top = 13
      Width = 130
      Height = 21
      TabOrder = 3
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 784
    Height = 480
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
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
        FieldName = 'PROD_CODE'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #20135#21697#32534#30721
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'LOCATION'
        Footer.Value = #21512#35745
        Footer.ValueType = fvtStaticText
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #20179#24211#21517#31216
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'PRODUCT_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #20135#21697#21517#31216
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'PRODUCT_DESC'
        Footers = <>
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'QUANTITY'
        Footer.FieldName = 'QUANTITY'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #25968#37327
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #21046#36896#37096#38376#21517#31216
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = #20837#24211#31867#22411
        Footers = <>
        Title.Alignment = taCenter
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'ABBR_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #29983#20135#24037#21378
        Width = 80
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
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 320
    Top = 160
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT  dbo.Data0016.LOCATION,dbo.data0008.PROD_CODE, dbo.Data00' +
        '08.PRODUCT_NAME, '
      
        '      sum(dbo.Data0053.QUANTITY) as QUANTITY, dbo.Data0034.DEPT_' +
        'CODE,dbo.Data0034.DEPT_NAME, '
      
        '      CASE dbo.data0416.type WHEN 1 THEN '#39#30452#25509#20837#24211#39' WHEN 2 THEN '#39#29983#20135#20837 +
        #24211#39' WHEN 4 THEN '#39#36864#36135#20837#24211#39' END AS '#20837#24211#31867#22411','
      
        '      dbo.Data0015.ABBR_NAME,dbo.data0002.UNIT_NAME,data0008.PRO' +
        'DUCT_DESC'
      'FROM  dbo.Data0416 LEFT OUTER JOIN'
      
        '      dbo.Data0053 ON dbo.Data0416.RKEY = dbo.Data0053.NPAD_PTR ' +
        'LEFT OUTER JOIN'
      
        #9'  dbo.Data0016 ON dbo.Data0053.LOC_PTR = dbo.Data0016.RKEY LEFT' +
        ' OUTER JOIN'
      
        '      dbo.Data0008 ON dbo.Data0053.CUST_PART_PTR = dbo.Data0008.' +
        'RKEY INNER JOIN'
      
        '      dbo.data0002 on dbo.data0008.unit_ptr=dbo.data0002.Rkey in' +
        'ner join'
      
        '      dbo.Data0005 ON dbo.data0416.empl_ptr = dbo.Data0005.RKEY ' +
        'LEFT OUTER JOIN'
      
        '      dbo.Data0015 ON dbo.data0416.warehouse_ptr = dbo.Data0015.' +
        'RKEY LEFT OUTER JOIN'
      '      dbo.Data0034 ON dbo.data0416.dept_ptr = dbo.Data0034.RKEY '
      'WHERE (1 = 1) and data0416.type<>5'
      
        'group by dbo.Data0016.LOCATION,dbo.data0008.PROD_CODE, dbo.Data0' +
        '008.PRODUCT_NAME,dbo.data0416.type,data0008.PRODUCT_DESC,'
      
        ' dbo.Data0034.DEPT_NAME, dbo.Data0034.DEPT_CODE,dbo.data0416.typ' +
        'e,dbo.Data0015.ABBR_NAME,dbo.data0002.UNIT_NAME'
      
        'order by dbo.Data0016.LOCATION, dbo.Data0008.PROD_CODE, dbo.Data' +
        '0034.DEPT_CODE')
    Left = 408
    Top = 152
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
    object ADOQuery1QUANTITY: TBCDField
      FieldName = 'QUANTITY'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
    object ADOQuery1DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADOQuery1DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADOQuery1DSDesigner: TStringField
      FieldName = #20837#24211#31867#22411
      ReadOnly = True
      Size = 8
    end
    object ADOQuery1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOQuery1UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ADOQuery1PRODUCT_DESC: TStringField
      DisplayLabel = #20135#21697#35268#26684
      DisplayWidth = 50
      FieldName = 'PRODUCT_DESC'
      Size = 200
    end
  end
end
