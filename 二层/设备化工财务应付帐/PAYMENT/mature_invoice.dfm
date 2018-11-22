object Form3: TForm3
  Left = 209
  Top = 165
  Width = 739
  Height = 492
  Caption = #20379#24212#21830#21040#26399#24080#27454
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 32
    Width = 731
    Height = 433
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'INVOICE_NO'
        Title.Color = clRed
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_TOTAL'
        ReadOnly = False
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pay_amt'
        ReadOnly = False
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_RATE'
        ReadOnly = False
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DUE_DATE'
        ReadOnly = False
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mature_yamt'
        ReadOnly = False
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mature_bamt'
        ReadOnly = False
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODE'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUPPLIER_NAME'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WAREHOUSE_CODE'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WAREHOUSE_NAME'
        Width = 126
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DATE'
        ReadOnly = False
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax_invoice_amt'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax_invoice_date'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax_invoice_ref'
        Width = 162
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 731
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 202
      Top = 11
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #21457#31080#32534#30721
    end
    object Edit1: TEdit
      Left = 256
      Top = 7
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object Button1: TButton
      Left = 10
      Top = 4
      Width = 57
      Height = 25
      Caption = #36864#20986
      ModalResult = 1
      TabOrder = 1
    end
    object Button2: TButton
      Left = 69
      Top = 4
      Width = 57
      Height = 25
      Caption = #25968#25454#23548#20986
      TabOrder = 2
      OnClick = Button2Click
    end
    object BitBtn1: TBitBtn
      Left = 127
      Top = 4
      Width = 59
      Height = 25
      Caption = #26174#31034#23383#27573
      PopupMenu = PopupMenu1
      TabOrder = 3
      OnClick = BitBtn1Click
    end
  end
  object Aq107: TADOQuery
    Connection = dm.ACt
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT dbo.Data0107.INVOICE_NO, dbo.Data0023.CODE, dbo.Data0023.' +
        'ABBR_NAME,'
      
        '      dbo.Data0023.SUPPLIER_NAME, dbo.Data0001.CURR_NAME, dbo.Da' +
        'ta0107.INV_TP,'
      '      dbo.Data0005.EMPLOYEE_NAME, dbo.Data0015.WAREHOUSE_CODE, '
      '      dbo.Data0015.WAREHOUSE_NAME, dbo.Data0107.INV_DATE, '
      '      dbo.Data0107.DUE_DATE, dbo.Data0107.tax_invoice_amt, '
      
        '      dbo.Data0107.tax_invoice_date, dbo.Data0107.tax_invoice_re' +
        'f, '
      '      dbo.Data0107.INV_TOTAL, '
      
        '      dbo.Data0107.AMT_PAID + dbo.Data0107.CASH_DISC AS pay_amt,' +
        ' '
      '      dbo.Data0107.EX_RATE, '
      
        '      dbo.Data0107.INV_TOTAL - dbo.Data0107.AMT_PAID - dbo.Data0' +
        '107.CASH_DISC AS mature_yamt,'
      
        '       ROUND((dbo.Data0107.INV_TOTAL - dbo.Data0107.AMT_PAID - d' +
        'bo.Data0107.CASH_DISC)'
      '       * dbo.Data0107.EX_RATE, 2) AS mature_bamt'
      'FROM dbo.Data0023 INNER JOIN'
      
        '      dbo.Data0107 ON dbo.Data0023.RKEY = dbo.Data0107.SUPP_PTR ' +
        'INNER JOIN'
      
        '      dbo.Data0005 ON dbo.Data0107.EMPL_PTR = dbo.Data0005.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0001 ON dbo.Data0107.CURRENCY_PTR = dbo.Data0001.R' +
        'KEY INNER JOIN'
      
        '      dbo.Data0015 ON dbo.Data0107.warehouse_ptr = dbo.Data0015.' +
        'RKEY'
      
        'WHERE (dbo.Data0107.STATUS = 1) AND (dbo.Data0107.DUE_DATE < GET' +
        'DATE())'
      'order by data0023.code,data0107.due_date,Data0107.INVOICE_NO')
    Left = 80
    Top = 400
    object Aq107INVOICE_NO: TStringField
      DisplayLabel = #21457#31080#32534#30721
      DisplayWidth = 18
      FieldName = 'INVOICE_NO'
      Size = 15
    end
    object Aq107CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      DisplayWidth = 12
      FieldName = 'CODE'
      Size = 10
    end
    object Aq107ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      DisplayWidth = 13
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object Aq107SUPPLIER_NAME: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      DisplayWidth = 36
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object Aq107CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      DisplayWidth = 24
      FieldName = 'CURR_NAME'
    end
    object Aq107INV_TP: TWordField
      DisplayWidth = 12
      FieldName = 'INV_TP'
    end
    object Aq107EMPLOYEE_NAME: TStringField
      DisplayLabel = #21019#24314#21592#24037
      DisplayWidth = 19
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object Aq107WAREHOUSE_CODE: TStringField
      DisplayLabel = #24037#21378#20195#30721
      DisplayWidth = 22
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object Aq107WAREHOUSE_NAME: TStringField
      DisplayLabel = #24037#21378#21517#31216
      DisplayWidth = 84
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object Aq107INV_DATE: TDateTimeField
      DisplayLabel = #21457#31080#26085#26399
      DisplayWidth = 22
      FieldName = 'INV_DATE'
    end
    object Aq107DUE_DATE: TDateTimeField
      DisplayLabel = #21040#26399#26085#26399
      DisplayWidth = 22
      FieldName = 'DUE_DATE'
    end
    object Aq107tax_invoice_amt: TBCDField
      DisplayLabel = #31246#31080#37329#39069
      DisplayWidth = 24
      FieldName = 'tax_invoice_amt'
      Precision = 19
    end
    object Aq107tax_invoice_date: TDateTimeField
      DisplayLabel = #31246#31080#26085#26399
      DisplayWidth = 22
      FieldName = 'tax_invoice_date'
    end
    object Aq107tax_invoice_ref: TStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 60
      FieldName = 'tax_invoice_ref'
      Size = 50
    end
    object Aq107INV_TOTAL: TBCDField
      DisplayLabel = #21457#31080#37329#39069
      DisplayWidth = 24
      FieldName = 'INV_TOTAL'
      Precision = 19
    end
    object Aq107pay_amt: TBCDField
      DisplayLabel = #24050#20184#37329#39069
      DisplayWidth = 24
      FieldName = 'pay_amt'
      ReadOnly = True
      Precision = 19
    end
    object Aq107EX_RATE: TBCDField
      DisplayLabel = #27719#29575
      DisplayWidth = 16
      FieldName = 'EX_RATE'
      Precision = 12
      Size = 8
    end
    object Aq107mature_yamt: TBCDField
      DisplayLabel = #21040#26399#37329#39069'('#21407#24065')'
      DisplayWidth = 24
      FieldName = 'mature_yamt'
      ReadOnly = True
      Precision = 19
    end
    object Aq107mature_bamt: TBCDField
      DisplayLabel = #21040#26399#37329#39069'('#26412#24065')'
      DisplayWidth = 40
      FieldName = 'mature_bamt'
      ReadOnly = True
      Precision = 32
      Size = 12
    end
  end
  object DataSource1: TDataSource
    DataSet = Aq107
    Left = 48
    Top = 400
  end
  object PopupMenu1: TPopupMenu
    Left = 184
    Top = 184
    object N1: TMenuItem
      Caption = #21457#31080#32534#30721
      Checked = True
      OnClick = N1Click
    end
    object N3: TMenuItem
      Tag = 1
      Caption = #21457#31080#37329#39069
      Checked = True
      OnClick = N1Click
    end
    object N4: TMenuItem
      Tag = 2
      Caption = #24050#20184#37329#39069
      Checked = True
      OnClick = N1Click
    end
    object N5: TMenuItem
      Tag = 3
      Caption = #36135#24065
      Checked = True
      OnClick = N1Click
    end
    object N6: TMenuItem
      Tag = 4
      Caption = #27719#29575
      Checked = True
      OnClick = N1Click
    end
    object N2: TMenuItem
      Tag = 5
      Caption = #21040#26399#26085#26399
      Checked = True
      OnClick = N1Click
    end
    object N7: TMenuItem
      Tag = 6
      Caption = #21040#26399#37329#39069'('#21407#24065')'
      Checked = True
      OnClick = N1Click
    end
    object N8: TMenuItem
      Tag = 7
      Caption = #21040#26399#37329#39069'('#26412#24065')'
      Checked = True
      OnClick = N1Click
    end
    object N9: TMenuItem
      Tag = 8
      Caption = #20379#24212#21830#20195#30721
      Checked = True
      OnClick = N1Click
    end
    object N10: TMenuItem
      Tag = 9
      Caption = #20379#24212#21830#31616#31216
      Checked = True
      OnClick = N1Click
    end
    object N11: TMenuItem
      Tag = 10
      Caption = #20379#24212#21830#21517#31216
      OnClick = N1Click
    end
    object N12: TMenuItem
      Tag = 11
      Caption = #21019#24314#21592#24037
      Checked = True
      OnClick = N1Click
    end
    object N13: TMenuItem
      Tag = 12
      Caption = #24037#21378#20195#30721
      Checked = True
      OnClick = N1Click
    end
    object N14: TMenuItem
      Tag = 13
      Caption = #24037#21378#21517#31216
      Checked = True
      OnClick = N1Click
    end
    object N15: TMenuItem
      Tag = 14
      Caption = #21457#31080#26085#26399
      Checked = True
      OnClick = N1Click
    end
    object N16: TMenuItem
      Tag = 15
      Caption = #31246#31080#37329#39069
      Checked = True
      OnClick = N1Click
    end
    object N17: TMenuItem
      Tag = 16
      Caption = #31246#31080#26085#26399
      Checked = True
      OnClick = N1Click
    end
    object N18: TMenuItem
      Tag = 17
      Caption = #22791#27880
      Checked = True
      OnClick = N1Click
    end
  end
end
