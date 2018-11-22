object Form3: TForm3
  Left = 289
  Top = 159
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20379#24212#21830#39044#20184#25903#31080#26597#25214
  ClientHeight = 459
  ClientWidth = 534
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 143
    Top = 14
    Width = 48
    Height = 13
    Caption = #25903#31080#32534#21495
  end
  object DBGrid1: TDBGrid
    Left = -1
    Top = 40
    Width = 533
    Height = 379
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CHECK_NUMBER'
        Title.Color = clRed
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AMOUNT'
        ReadOnly = False
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BANK_NAME'
        Width = 129
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 168
    Top = 427
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 2
  end
  object Button2: TButton
    Left = 256
    Top = 427
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 197
    Top = 11
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object aq129: TADOQuery
    Connection = dm.ACt
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT Data0129.RKEY,Data0023.CODE, dbo.Data0023.SUPPLIER_NAME, ' +
        'dbo.Data0129.SRCE_PTR, '
      
        '      dbo.Data0129.CHECK_NUMBER, dbo.Data0129.CURR_PTR, dbo.Data' +
        '0129.EX_RATE, '
      
        '      dbo.Data0001.CURR_CODE, dbo.Data0001.CURR_NAME, dbo.Data01' +
        '28.BANK_NAME, '
      '      dbo.Data0129.AMOUNT,data0023.abbr_name'
      'FROM dbo.Data0129 INNER JOIN'
      
        '      dbo.Data0001 ON dbo.Data0129.CURR_PTR = dbo.Data0001.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0128 ON dbo.Data0129.BANK_PTR = dbo.Data0128.RKEY ' +
        'INNER JOIN'
      '      dbo.Data0023 ON dbo.Data0129.SRCE_PTR = dbo.Data0023.RKEY'
      'WHERE (dbo.Data0129.TTYPE = 2) and'
      '      (Data0129.status=1)'
      'order by Data0129.CHECK_NUMBER')
    Left = 120
    Top = 368
    object aq129CHECK_NUMBER: TStringField
      DisplayLabel = #25903#31080#32534#21495
      FieldName = 'CHECK_NUMBER'
      Size = 10
    end
    object aq129CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object aq129abbr_name: TStringField
      DisplayLabel = #20379#24212#21830#31216
      FieldName = 'abbr_name'
      Size = 10
    end
    object aq129SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object aq129SRCE_PTR: TIntegerField
      FieldName = 'SRCE_PTR'
    end
    object aq129CURR_PTR: TIntegerField
      FieldName = 'CURR_PTR'
    end
    object aq129EX_RATE: TBCDField
      FieldName = 'EX_RATE'
      Precision = 12
      Size = 8
    end
    object aq129CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object aq129CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
    end
    object aq129BANK_NAME: TStringField
      DisplayLabel = #20184#27454#24080#25143
      FieldName = 'BANK_NAME'
      Size = 30
    end
    object aq129AMOUNT: TBCDField
      DisplayLabel = #20184#27454#37329#39069
      FieldName = 'AMOUNT'
      Precision = 19
    end
    object aq129RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
  end
  object DataSource1: TDataSource
    DataSet = aq129
    Left = 88
    Top = 368
  end
end
