object Form4: TForm4
  Left = 312
  Top = 171
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25237#35785#32534#21495#26597#35810
  ClientHeight = 447
  ClientWidth = 557
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
  object Label1: TLabel
    Left = 143
    Top = 14
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = '  '#25237#35785#32534#21495
  end
  object Edit1: TEdit
    Left = 215
    Top = 10
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object BitBtn2: TBitBtn
    Left = 342
    Top = 7
    Width = 26
    Height = 26
    Hint = #21047#26032
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TabStop = False
    OnClick = BitBtn2Click
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 40
    Width = 558
    Height = 365
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
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
        FieldName = 'LOG_NUMBER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOG_DATE'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTENT'
        Width = 190
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANALYSIS'
        Width = 200
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 190
    Top = 416
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 273
    Top = 416
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object ADOQuery1: TADOQuery
    Connection = dm.ADOConnection1
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey50'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT rkey,LOG_NUMBER, LOG_DATE, CONTENT, ANALYSIS'
      'FROM dbo.Data0101'
      'where CUSTOMER_PART_PTR=:rkey50')
    Left = 432
    Top = 408
    object ADOQuery1LOG_NUMBER: TStringField
      DisplayLabel = #25237#35785#32534#21495
      FieldName = 'LOG_NUMBER'
      FixedChar = True
      Size = 10
    end
    object ADOQuery1LOG_DATE: TDateTimeField
      DisplayLabel = #25237#35785#26085#26399
      FieldName = 'LOG_DATE'
    end
    object ADOQuery1CONTENT: TStringField
      DisplayLabel = #25237#35785#20869#23481
      FieldName = 'CONTENT'
      Size = 600
    end
    object ADOQuery1ANALYSIS: TStringField
      DisplayLabel = #21407#22240#20998#26512
      FieldName = 'ANALYSIS'
      Size = 600
    end
    object ADOQuery1rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 400
    Top = 408
  end
end
