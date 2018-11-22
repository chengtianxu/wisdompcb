object Form_budget: TForm_budget
  Left = 380
  Top = 183
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #37319#36141#35831#27714#39044#31639#25628#32034
  ClientHeight = 394
  ClientWidth = 427
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 31
    Top = 12
    Width = 68
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#39044#31639#20195#30721':'
  end
  object edit1: TEdit
    Left = 102
    Top = 8
    Width = 189
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 297
    Top = 6
    Width = 25
    Height = 25
    Hint = #21047#26032
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TabStop = False
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 34
    Width = 427
    Height = 322
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'CODE'
        Title.Caption = #39044#31639#20195#30721
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPTION'
        Title.Caption = #35828#26126
        Width = 318
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 131
    Top = 363
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 211
    Top = 363
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 352
    Top = 361
  end
  object ADOQuery1: TADOStoredProc
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    ProcedureName = 'ep054;2'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@v_year'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 2003
      end
      item
        Name = '@v_user'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 61
      end>
    Left = 384
    Top = 360
    object ADOQuery1RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery1CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object ADOQuery1DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 40
    end
    object ADOQuery1bud_year: TIntegerField
      FieldName = 'bud_year'
    end
    object ADOQuery1GL_PTR: TIntegerField
      FieldName = 'GL_PTR'
    end
    object ADOQuery1BUDGET_PERIOD_1: TFloatField
      FieldName = 'BUDGET_PERIOD_1'
    end
    object ADOQuery1BUDGET_PERIOD_2: TFloatField
      FieldName = 'BUDGET_PERIOD_2'
    end
    object ADOQuery1BUDGET_PERIOD_3: TFloatField
      FieldName = 'BUDGET_PERIOD_3'
    end
    object ADOQuery1BUDGET_PERIOD_4: TFloatField
      FieldName = 'BUDGET_PERIOD_4'
    end
    object ADOQuery1BUDGET_PERIOD_5: TFloatField
      FieldName = 'BUDGET_PERIOD_5'
    end
    object ADOQuery1BUDGET_PERIOD_6: TFloatField
      FieldName = 'BUDGET_PERIOD_6'
    end
    object ADOQuery1BUDGET_PERIOD_7: TFloatField
      FieldName = 'BUDGET_PERIOD_7'
    end
    object ADOQuery1BUDGET_PERIOD_8: TFloatField
      FieldName = 'BUDGET_PERIOD_8'
    end
    object ADOQuery1BUDGET_PERIOD_9: TFloatField
      FieldName = 'BUDGET_PERIOD_9'
    end
    object ADOQuery1BUDGET_PERIOD_10: TFloatField
      FieldName = 'BUDGET_PERIOD_10'
    end
    object ADOQuery1BUDGET_PERIOD_11: TFloatField
      FieldName = 'BUDGET_PERIOD_11'
    end
    object ADOQuery1BUDGET_PERIOD_12: TFloatField
      FieldName = 'BUDGET_PERIOD_12'
    end
    object ADOQuery1BUDGET_PERIOD_13: TFloatField
      FieldName = 'BUDGET_PERIOD_13'
    end
    object ADOQuery1USED_PERIOD_1: TFloatField
      FieldName = 'USED_PERIOD_1'
    end
    object ADOQuery1USED_PERIOD_2: TFloatField
      FieldName = 'USED_PERIOD_2'
    end
    object ADOQuery1USED_PERIOD_3: TFloatField
      FieldName = 'USED_PERIOD_3'
    end
    object ADOQuery1USED_PERIOD_4: TFloatField
      FieldName = 'USED_PERIOD_4'
    end
    object ADOQuery1USED_PERIOD_5: TFloatField
      FieldName = 'USED_PERIOD_5'
    end
    object ADOQuery1USED_PERIOD_6: TFloatField
      FieldName = 'USED_PERIOD_6'
    end
    object ADOQuery1USED_PERIOD_7: TFloatField
      FieldName = 'USED_PERIOD_7'
    end
    object ADOQuery1USED_PERIOD_8: TFloatField
      FieldName = 'USED_PERIOD_8'
    end
    object ADOQuery1USED_PERIOD_9: TFloatField
      FieldName = 'USED_PERIOD_9'
    end
    object ADOQuery1USED_PERIOD_10: TFloatField
      FieldName = 'USED_PERIOD_10'
    end
    object ADOQuery1USED_PERIOD_11: TFloatField
      FieldName = 'USED_PERIOD_11'
    end
    object ADOQuery1USED_PERIOD_12: TFloatField
      FieldName = 'USED_PERIOD_12'
    end
    object ADOQuery1USED_PERIOD_13: TFloatField
      FieldName = 'USED_PERIOD_13'
    end
  end
end
