object Frm_recv: TFrm_recv
  Left = 228
  Top = 223
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25910#36135#20449#24687
  ClientHeight = 329
  ClientWidth = 661
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 661
    Height = 273
    Align = alTop
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
        FieldName = 'DELIVER_NUMBER'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHIP_NAME'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REQ_DATE'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHIP_DATE'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rece_quantity'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'manu_PART_NUMBER'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'manu_PART_DESC'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REMARK'
        Width = 87
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 290
    Top = 300
    Width = 75
    Height = 25
    Caption = #20851#38381
    ModalResult = 1
    TabOrder = 1
    OnKeyDown = FormKeyDown
  end
  object DataSource1: TDataSource
    DataSet = Aqwz304
    Left = 384
    Top = 288
  end
  object Aqwz304: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    DataSource = DM.DataSource1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT dbo.WZDATA303.DELIVER_NUMBER, dbo.WZDATA303.SHIP_NAME, '
      '      dbo.WZDATA303.SHIP_DATE, dbo.Data0005.EMPLOYEE_NAME, '
      '      dbo.WZDATA304.rece_quantity, dbo.WZDATA304.REMARK, '
      '      dbo.WZDATA301.REQ_DATE, dbo.Data0025.manu_PART_NUMBER,'
      '      dbo.Data0025.manu_PART_DESC'
      'FROM dbo.WZDATA304 INNER JOIN'
      '      dbo.WZDATA301 ON '
      '      dbo.WZDATA304.EPILIST_PTR = dbo.WZDATA301.RKEY INNER JOIN'
      '      dbo.WZDATA303 ON'
      '      dbo.WZDATA304.DELIVER_PTR = dbo.WZDATA303.RKEY INNER JOIN'
      
        '      dbo.Data0005 ON dbo.WZDATA303.EMPL_PTR = dbo.Data0005.RKEY' +
        ' INNER JOIN'
      '      dbo.Data0025 ON '
      '      dbo.WZDATA301.CUSTPART_PTR = dbo.Data0025.RKEY'
      'where WZDATA301.EPIBOLY_PTR=:rkey')
    Left = 416
    Top = 288
    object Aqwz304DELIVER_NUMBER: TStringField
      DisplayLabel = #36865#36135#21333#21495
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object Aqwz304SHIP_NAME: TStringField
      DisplayLabel = #36865#36135#20154#21592
      FieldName = 'SHIP_NAME'
    end
    object Aqwz304SHIP_DATE: TDateTimeField
      DisplayLabel = #36865#36135#26102#38388
      FieldName = 'SHIP_DATE'
    end
    object Aqwz304EMPLOYEE_NAME: TStringField
      DisplayLabel = #25910#36135#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object Aqwz304rece_quantity: TIntegerField
      DisplayLabel = #25509#25910#25968#37327
      FieldName = 'rece_quantity'
    end
    object Aqwz304REMARK: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REMARK'
      Size = 50
    end
    object Aqwz304REQ_DATE: TDateTimeField
      DisplayLabel = #35201#27714#26085#26399
      FieldName = 'REQ_DATE'
    end
    object Aqwz304manu_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'manu_PART_NUMBER'
    end
    object Aqwz304manu_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'manu_PART_DESC'
      Size = 40
    end
  end
end
