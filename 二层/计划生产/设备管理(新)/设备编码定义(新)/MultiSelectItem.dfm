object frm_MultiSelectItem: Tfrm_MultiSelectItem
  Left = 347
  Top = 177
  Width = 979
  Height = 563
  Caption = #36873#25321#35774#22791
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 971
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 59
      Height = 13
      Caption = #35774#22791#32534#30721':'
    end
    object Edit1: TEdit
      Left = 72
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 971
    Height = 447
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'selected'
        Footers = <>
        Title.Caption = #36873#25321
      end
      item
        EditButtons = <>
        FieldName = 'FASSET_CODE'
        Footers = <>
        ReadOnly = True
        Title.Caption = #35774#22791#32534#30721
        Title.Color = clRed
        Title.SortIndex = 1
        Title.SortMarker = smUpEh
        Width = 108
      end
      item
        EditButtons = <>
        FieldName = 'FASSET_NAME'
        Footers = <>
        ReadOnly = True
        Title.Caption = #35774#22791#21517#31216
        Width = 125
      end
      item
        EditButtons = <>
        FieldName = 'FASSET_DESC'
        Footers = <>
        ReadOnly = True
        Title.Caption = #35268#26684#22411#21495
        Width = 144
      end
      item
        EditButtons = <>
        FieldName = 'equipment_grade'
        Footers = <>
        ReadOnly = True
        Title.Caption = #35774#22791#32423#21035
        Width = 115
      end
      item
        EditButtons = <>
        FieldName = 'FASSET_TYPE'
        Footers = <>
        ReadOnly = True
        Title.Caption = #35774#22791#31867#21035
        Width = 77
      end
      item
        EditButtons = <>
        FieldName = 'DeviType'
        Footers = <>
        ReadOnly = True
        Title.Caption = #20445#20859#31867#22411
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_NAME'
        Footers = <>
        ReadOnly = True
        Title.Caption = #20351#29992#37096#38376
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'LOCATION'
        Footers = <>
        ReadOnly = True
        Title.Caption = #20855#20307#20301#32622
        Width = 158
      end
      item
        EditButtons = <>
        FieldName = 'active_flag'
        Footers = <>
        Title.Caption = #29366#24577
      end
      item
        EditButtons = <>
        FieldName = 'ABBR_NAME'
        Footers = <>
        ReadOnly = True
        Title.Caption = #24037#21378
      end
      item
        EditButtons = <>
        FieldName = 'RKEY'
        Footers = <>
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 488
    Width = 971
    Height = 41
    Align = alBottom
    TabOrder = 2
    object Button1: TButton
      Left = 394
      Top = 10
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 490
      Top = 10
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
    object CheckBox1: TCheckBox
      Left = 16
      Top = 16
      Width = 97
      Height = 17
      Caption = #20840#36873
      TabOrder = 2
      OnClick = CheckBox1Click
    end
  end
  object ADS417_1: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    CommandText = 
      'declare @TempTable table(selected bit)      '#13#10'  insert @TempTabl' +
      'e  values (0)'#13#10'SELECT selected,DATA0417.RKEY,DATA0417.FASSET_COD' +
      'E /*'#35774#22791#20195#30721'*/,DATA0417.FASSET_NAME /*'#35774#22791#21517#31216'*/,'#13#10'       DATA0417.FASSE' +
      'T_DESC /*'#35268#26684#22411#21495'*/,Data0514.FASSET_TYPE /*'#35774#22791#31867#21035'*/,equipment_grade /*' +
      #35774#22791#31561#32423'*/, '#13#10'       Data0034.DEPT_NAME/*'#37096#38376#21517#31216'*/,DATA0417.LOCATION /*' +
      #20855#20307#20301#32622'*/, '#13#10'       case DATA0417.active_flag when 1 then '#39#26032#36827#39' when' +
      ' 2 then '#39#20179#24211#30830#35748#39' when 3 then '#39#23433#35013#23436#25104#39' '#13#10'       when 4 then '#39#39564#25910#21512#26684#39' wh' +
      'en 5 then '#39#25253#24223#39' when 6 then '#39#35843#25320#22806#20986#39' '#13#10'      when 7 then '#39#38386#32622#39#13#10'end ' +
      'AS active_flag/**/,'#13#10'       Data0015.ABBR_NAME/*'#24037#21378'*/,DeviType/*'#35774 +
      #22791#31867#22411'*/'#13#10'FROM   DATA0417 LEFT OUTER JOIN'#13#10'       Data0514 ON DATA0' +
      '417.FASSET_TYPE_PTR = Data0514.RKEY LEFT OUTER JOIN'#13#10'       Data' +
      '0034 ON DATA0417.DEPT_PTR = Data0034.RKEY LEFT OUTER JOIN'#13#10'     ' +
      '  Data0015 ON DATA0417.warehouse_ptr = Data0015.RKEY '#13#10'       jo' +
      'in @TempTable on 1=1'#13#10'WHERE  Data0417.active_flag in (1,2,3,4) '#13 +
      #10'and IsGroup=0  '#13#10#13#10#13#10#13#10
    DataSource = DM.DataSource1
    IndexFieldNames = 'FASSET_CODE'
    Parameters = <>
    Left = 360
    Top = 176
    object ADS417_1selected: TBooleanField
      FieldName = 'selected'
    end
    object ADS417_1FASSET_CODE: TStringField
      FieldName = 'FASSET_CODE'
    end
    object ADS417_1FASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object ADS417_1FASSET_DESC: TStringField
      FieldName = 'FASSET_DESC'
      Size = 40
    end
    object ADS417_1equipment_grade: TStringField
      FieldName = 'equipment_grade'
      Size = 50
    end
    object ADS417_1FASSET_TYPE: TStringField
      FieldName = 'FASSET_TYPE'
    end
    object ADS417_1DeviType: TStringField
      FieldName = 'DeviType'
      Size = 10
    end
    object ADS417_1DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADS417_1LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 40
    end
    object ADS417_1active_flag: TStringField
      FieldName = 'active_flag'
      ReadOnly = True
      Size = 8
    end
    object ADS417_1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADS417_1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS417_1
    Left = 176
    Top = 176
  end
end
