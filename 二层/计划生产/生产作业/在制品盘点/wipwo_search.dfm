object Form10: TForm10
  Left = 336
  Top = 157
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22312#32447#24037#21333#25628#32034
  ClientHeight = 453
  ClientWidth = 542
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'ËÎÌו'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 131
    Top = 14
    Width = 77
    Height = 13
    Alignment = taRightJustify
    Caption = #24037#20316#23450#21333#21495':'
  end
  object Edit1: TEdit
    Left = 216
    Top = 10
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 344
    Top = 8
    Width = 25
    Height = 25
    Hint = #21047#26032
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = BitBtn1Click
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
  object Button1: TButton
    Left = 150
    Top = 411
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 2
  end
  object Button2: TButton
    Left = 230
    Top = 411
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 38
    Width = 544
    Height = 367
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'ËÎÌו'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'WORK_ORDER_NUMBER'
        Width = 144
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUT_NO'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SO_NO'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'panels'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_sch'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ttype'
        Width = 72
        Visible = True
      end>
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey400'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey25'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Data0006.RKEY,Data0006.WORK_ORDER_NUMBER,'
      '      Data0006.CUT_NO,data0492.SO_NO,Data0006.FLOW_NO,'
      '      Data0402.system_quan, '#39#29983#20135#20013#39' AS ttype,data0402.panels'
      'FROM Data0006 INNER JOIN'
      '      data0492 ON Data0006.CUT_NO = data0492.CUT_NO INNER JOIN'
      '      data0402 ON Data0006.RKEY = data0402.wo_ptr'
      'WHERE (data0402.wipcode_ptr = :rkey400) and'
      '      (data0006.bom_ptr=:rkey25)'
      'ORDER BY Data0006.WORK_ORDER_NUMBER')
    Left = 417
    Top = 407
    object ADOQuery1RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery1WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #24037#21333#21495
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 50
    end
    object ADOQuery1CUT_NO: TStringField
      DisplayLabel = #37197#26009#21333#21495
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ADOQuery1SO_NO: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'SO_NO'
      FixedChar = True
      Size = 10
    end
    object ADOQuery1FLOW_NO: TSmallintField
      FieldName = 'FLOW_NO'
    end
    object ADOQuery1ttype: TStringField
      DisplayLabel = #24037#21333#29366#24577
      FieldName = 'ttype'
      ReadOnly = True
      Size = 8
    end
    object ADOQuery1panels: TIntegerField
      DisplayLabel = 'pan'#25968#37327
      FieldName = 'panels'
    end
    object ADOQuery1system_quan: TFloatField
      FieldName = 'system_quan'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 388
    Top = 407
  end
end
