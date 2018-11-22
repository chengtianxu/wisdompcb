object Form_group: TForm_group
  Left = 324
  Top = 217
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #29992#25143#35282#33394
  ClientHeight = 451
  ClientWidth = 404
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 100
    Top = 8
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = #35282#33394#32534#21495
  end
  object Edit1: TEdit
    Left = 155
    Top = 5
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGridEh1KeyDown
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 35
    Width = 402
    Height = 362
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGridEh1DblClick
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'USER_LOGIN_NAME'
        Footers = <>
        Title.Color = clRed
        Width = 99
      end
      item
        EditButtons = <>
        FieldName = 'USER_FULL_NAME'
        Footers = <>
        Width = 150
      end
      item
        Checkboxes = True
        EditButtons = <>
        FieldName = 'message_flag'
        Footers = <>
        ReadOnly = False
        Width = 55
      end
      item
        EditButtons = <>
        FieldName = 'hr_qs'
        Footers = <>
      end>
  end
  object Button1: TButton
    Left = 120
    Top = 411
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 2
  end
  object Button2: TButton
    Left = 201
    Top = 411
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
  object BitBtn2: TBitBtn
    Left = 281
    Top = 3
    Width = 25
    Height = 25
    Hint = #21047#26032
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
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
  object ads73: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT rkey,USER_LOGIN_NAME, USER_FULL_NAME, '#13#10'message_flag,hrpo' +
      'pm,warehouse_ptr,'#13#10'case hrpopm when 0 then '#39#26080#26435#38480#39' when 1 then '#39#26597#35810 +
      #26435#38480#39#13#10'when 2 then '#39#25552#20132#26435#38480#39' when 3 then '#39#23457#26680#26435#38480#39' end as hr_qs'#13#10'FROM db' +
      'o.Data0073'#13#10'WHERE (USER_GROUP_FLAG = :flag) AND (ACTIVE_FLAG = 0' +
      ')'
    Parameters = <
      item
        Name = 'flag'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 0
      end>
    Left = 56
    Top = 72
    object ads73rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ads73USER_LOGIN_NAME: TStringField
      DisplayLabel = #35282#33394#32534#21495
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object ads73USER_FULL_NAME: TStringField
      DisplayLabel = #35282#33394#21517#31216
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ads73message_flag: TBooleanField
      DisplayLabel = #30701#20449#26435#38480
      FieldName = 'message_flag'
    end
    object ads73hrpopm: TIntegerField
      FieldName = 'hrpopm'
    end
    object ads73hr_qs: TStringField
      DisplayLabel = #32593#39029#26435#38480
      FieldName = 'hr_qs'
      ReadOnly = True
      Size = 8
    end
    object ads73warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
  end
  object DataSource1: TDataSource
    DataSet = ads73
    OnDataChange = DataSource1DataChange
    Left = 24
    Top = 72
  end
end
