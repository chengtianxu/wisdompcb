object Form_invtship: TForm_invtship
  Left = 178
  Top = 109
  Width = 765
  Height = 557
  Caption = #36864#36135#35013#36816#26597#25214
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 45
    Width = 757
    Height = 444
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'GRN_NUMBER'
        Title.Color = clRed
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DELIVER_NUMBER'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_NAME'
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Width = 182
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'code'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        ReadOnly = False
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE'
        ReadOnly = False
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_2'
        ReadOnly = False
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TDATE'
        ReadOnly = False
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name15'
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 757
    Height = 45
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 256
      Top = 20
      Width = 52
      Height = 13
      Caption = #20837#24211#21333#21495
    end
    object Edit1: TEdit
      Left = 314
      Top = 16
      Width = 96
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 489
    Width = 757
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      757
      41)
    object Button2: TButton
      Left = 313
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #20851#38381
      TabOrder = 0
      OnClick = Button2Click
    end
    object BitBtn2: TBitBtn
      Left = 426
      Top = 8
      Width = 75
      Height = 25
      Hint = #23548#20986#25968#25454#21040'Excel'
      Caption = #23548#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BitBtn2Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
        EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
        DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
        70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
    end
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 88
    Top = 400
  end
  object ADODataSet1: TADODataSet
    Connection = dm.ACt
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'wzep132;2'
    CommandType = cmdStoredProc
    IndexFieldNames = 'GRN_NUMBER'
    Parameters = <>
    Left = 128
    Top = 400
    object ADODataSet1GRN_NUMBER: TStringField
      DisplayLabel = #20837#24211#21333#21495
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object ADODataSet1DELIVER_NUMBER: TStringField
      DisplayLabel = #36865#36135#21333#21495
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object ADODataSet1INV_NAME: TStringField
      DisplayLabel = #29289#26009#21517#31216
      FieldName = 'INV_NAME'
      ReadOnly = True
      Size = 60
    end
    object ADODataSet1INV_DESCRIPTION: TStringField
      DisplayLabel = #29289#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      ReadOnly = True
      Size = 200
    end
    object ADODataSet1TDATE: TDateTimeField
      DisplayLabel = #35013#36816#26085#26399
      FieldName = 'TDATE'
    end
    object ADODataSet1QUANTITY: TFloatField
      DisplayLabel = #36864#36135#25968#37327
      FieldName = 'QUANTITY'
    end
    object ADODataSet1UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ADODataSet1PRICE: TBCDField
      DisplayLabel = #21547#31246#20215
      FieldName = 'PRICE'
      Precision = 10
      Size = 3
    end
    object ADODataSet1TAX_2: TBCDField
      DisplayLabel = #31246#29575
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ADODataSet1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADODataSet1EMPLOYEE_NAME: TStringField
      DisplayLabel = #35013#36816#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADODataSet1ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADODataSet1CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
    end
    object ADODataSet1code: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'code'
      Size = 10
    end
    object ADODataSet1abbr_name15: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'abbr_name15'
      ReadOnly = True
      Size = 10
    end
  end
end
