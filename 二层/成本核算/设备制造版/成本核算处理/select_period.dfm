object Form_period: TForm_period
  Left = 359
  Top = 189
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26680#31639#26399#38388#36873#25321
  ClientHeight = 428
  ClientWidth = 412
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 412
    Height = 376
    Align = alTop
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'CUT_DATE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TDATE'
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLOSED'
        Width = 70
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 128
    Top = 392
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 208
    Top = 392
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
  object aqd444: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.Data0444.CUT_DATE, dbo.Data0444.TDATE, dbo.Data0005.E' +
      'MPLOYEE_NAME, '#13#10'      dbo.Data0444.CLOSED'#13#10'FROM dbo.Data0444 INN' +
      'ER JOIN'#13#10'      dbo.Data0005 ON dbo.Data0444.CUT_BY = dbo.Data000' +
      '5.RKEY'#13#10'where cut_date > :fm_date '#13#10'and closed='#39'N'#39#13#10'order by cut' +
      '_date'
    Parameters = <
      item
        Name = 'fm_date'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 38718d
      end>
    Left = 376
    Top = 376
    object aqd444CUT_DATE: TDateTimeField
      DisplayLabel = #25130#25968#26085#26399
      DisplayWidth = 12
      FieldName = 'CUT_DATE'
    end
    object aqd444TDATE: TDateTimeField
      DisplayLabel = #25130#25968#26085#26399#26102#38388
      DisplayWidth = 18
      FieldName = 'TDATE'
    end
    object aqd444EMPLOYEE_NAME: TStringField
      DisplayLabel = #25130#25968#20154#21592
      DisplayWidth = 14
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object aqd444CLOSED: TStringField
      DisplayLabel = #26159#21542#26680#31639
      DisplayWidth = 6
      FieldName = 'CLOSED'
      FixedChar = True
      Size = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = aqd444
    Left = 344
    Top = 376
  end
end
