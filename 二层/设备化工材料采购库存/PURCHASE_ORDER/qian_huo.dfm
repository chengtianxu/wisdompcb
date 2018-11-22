object Form21: TForm21
  Left = 188
  Top = 131
  Width = 872
  Height = 574
  Caption = #21040#26399#26410#20132#36135#25968#25454#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 856
    Height = 38
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 188
      Top = 13
      Width = 79
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '   '#29289#26009#21517#31216':'
    end
    object Button1: TButton
      Left = 16
      Top = 6
      Width = 75
      Height = 25
      Caption = #36864#20986
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 96
      Top = 6
      Width = 75
      Height = 25
      Caption = #23548#20986'Excel'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Edit1: TEdit
      Left = 276
      Top = 9
      Width = 179
      Height = 21
      TabOrder = 2
      OnChange = Edit1Change
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 38
    Width = 856
    Height = 498
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Title.Caption = #37319#36141#35746#21333#21495
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Title.Color = clRed
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_NAME'
        Title.Caption = #29289#26009#21517#31216
        Width = 192
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Title.Caption = #29289#26009#35268#26684
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Title.Caption = #20379#24212#21830
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REQ_DATE'
        ReadOnly = False
        Title.Caption = #20132#36135#26085#26399
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Title.Caption = #37319#36141#21333#20301
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_ORD'
        ReadOnly = False
        Title.Caption = #35746#21333#25968#37327
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_RECD'
        ReadOnly = False
        Title.Caption = #24050#25910#36135#25968#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quan_qh'
        ReadOnly = False
        Title.Caption = #27424#36135#25968#37327
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_REV_NO'
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 304
    Top = 448
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION, ' +
        'dbo.Data0023.ABBR_NAME, dbo.Data0070.PO_NUMBER, dbo.Data0071.REQ' +
        '_DATE, '
      
        '                      dbo.Data0071.QUAN_ORD, dbo.Data0071.QUAN_R' +
        'ECD, dbo.Data0071.QUAN_ORD - dbo.Data0071.QUAN_RECD AS quan_qh, ' +
        'dbo.Data0002.UNIT_NAME, '
      
        '                      dbo.Data0070.PO_TYPE, dbo.Data0017.INV_PAR' +
        'T_NUMBER, dbo.Data0070.PO_REV_NO'
      'FROM         dbo.Data0017 INNER JOIN'
      
        '                      dbo.Data0071 ON dbo.Data0017.RKEY = dbo.Da' +
        'ta0071.INVT_PTR INNER JOIN'
      
        '                      dbo.Data0070 ON dbo.Data0071.PO_PTR = dbo.' +
        'Data0070.RKEY INNER JOIN'
      
        '                      dbo.Data0023 ON dbo.Data0070.SUPPLIER_POIN' +
        'TER = dbo.Data0023.RKEY INNER JOIN'
      
        '                      dbo.Data0002 ON dbo.Data0071.PURCHASE_UNIT' +
        '_PTR = dbo.Data0002.RKEY'
      'WHERE     (dbo.Data0071.QUAN_RECD < dbo.Data0071.QUAN_ORD) AND'
      ' (dbo.Data0071.REQ_DATE < GETDATE()) AND'
      ' (dbo.Data0070.STATUS = 5)')
    Left = 336
    Top = 448
    object ADOQuery1INV_NAME: TStringField
      DisplayWidth = 8
      FieldName = 'INV_NAME'
      ReadOnly = True
      Size = 60
    end
    object ADOQuery1INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      ReadOnly = True
      Size = 200
    end
    object ADOQuery1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOQuery1PO_NUMBER: TStringField
      DisplayWidth = 10
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object ADOQuery1REQ_DATE: TDateTimeField
      DisplayWidth = 5
      FieldName = 'REQ_DATE'
    end
    object ADOQuery1QUAN_ORD: TFloatField
      DisplayWidth = 10
      FieldName = 'QUAN_ORD'
    end
    object ADOQuery1QUAN_RECD: TFloatField
      DisplayWidth = 10
      FieldName = 'QUAN_RECD'
    end
    object ADOQuery1quan_qh: TFloatField
      DisplayWidth = 10
      FieldName = 'quan_qh'
      ReadOnly = True
    end
    object ADOQuery1UNIT_NAME: TStringField
      DisplayWidth = 10
      FieldName = 'UNIT_NAME'
    end
    object ADOQuery1PO_TYPE: TStringField
      FieldName = 'PO_TYPE'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADOQuery1PO_REV_NO: TStringField
      DisplayLabel = #35831#36141#37096#38376
      FieldName = 'PO_REV_NO'
      Size = 10
    end
  end
end
