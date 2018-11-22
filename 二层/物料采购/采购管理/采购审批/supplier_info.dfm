object Form_INVTSUPP: TForm_INVTSUPP
  Left = 276
  Top = 221
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #29616#26377#20379#24212#21830#20449#24687
  ClientHeight = 294
  ClientWidth = 520
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 520
    Height = 245
    Align = alTop
    DataSource = DataSource7
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = FormKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE_1'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_2'
        Title.Caption = #31246#29575'%'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax_flag'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LEAD_TIME'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'avl_type'
        Width = 59
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 223
    Top = 257
    Width = 71
    Height = 26
    Caption = #20851#38381
    ModalResult = 1
    TabOrder = 1
    OnKeyDown = FormKeyDown
  end
  object DataSource7: TDataSource
    DataSet = ADO28
    Left = 345
    Top = 256
  end
  object ADO28: TADOQuery
    Connection = DM.ADOConnection1
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ADO28CalcFields
    DataSource = DM.DataSource2
    Parameters = <
      item
        Name = 'invt_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT dbo.Data0028.PRICE_1, dbo.Data0028.AVL_FLAG, dbo.Data0028' +
        '.LEAD_TIME,'
      
        '      dbo.Data0028.TAX_2, dbo.Data0001.CURR_NAME, dbo.Data0002.U' +
        'NIT_NAME, '
      '      dbo.Data0023.ABBR_NAME,data0028.tax_flag'
      'FROM dbo.Data0028 INNER JOIN'
      
        '      dbo.Data0001 ON dbo.Data0028.CURRENCY_PTR = dbo.Data0001.R' +
        'KEY INNER JOIN'
      '      dbo.Data0002 ON '
      
        '      dbo.Data0028.PURCHASE_UNIT_PTR = dbo.Data0002.RKEY INNER J' +
        'OIN'
      
        '      dbo.Data0023 ON dbo.Data0028.SUPPLIER_PTR = dbo.Data0023.R' +
        'KEY'
      'where data0028.INVENTORY_PTR=:invt_ptr'
      ' ')
    Left = 384
    Top = 256
    object ADO28PRICE_1: TFloatField
      DisplayLabel = #20215#26684
      FieldName = 'PRICE_1'
    end
    object ADO28AVL_FLAG: TStringField
      FieldName = 'AVL_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADO28LEAD_TIME: TSmallintField
      DisplayLabel = #20132#36135#26102#38388'('#22825')'
      FieldName = 'LEAD_TIME'
    end
    object ADO28TAX_2: TFloatField
      DisplayLabel = #31246#29575
      FieldName = 'TAX_2'
    end
    object ADO28CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
    end
    object ADO28UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ADO28ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADO28avl_type: TStringField
      DisplayLabel = #36164#26684#35748#21487
      FieldKind = fkCalculated
      FieldName = 'avl_type'
      Size = 8
      Calculated = True
    end
    object ADO28tax_flag: TStringField
      DisplayLabel = #20215#26684#21547#31246
      FieldName = 'tax_flag'
      FixedChar = True
      Size = 1
    end
  end
end
