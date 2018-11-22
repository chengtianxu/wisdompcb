object Form_miscstock: TForm_miscstock
  Left = 271
  Top = 177
  Width = 698
  Height = 531
  Caption = #26434#39033#29289#21697#24211#23384#26597#25214
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 682
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 223
      Top = 15
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #29289#21697#21517#31216
    end
    object Label2: TLabel
      Left = 26
      Top = 14
      Width = 33
      Height = 13
      Caption = #24037#21378':'
    end
    object Edit1: TEdit
      Left = 280
      Top = 11
      Width = 169
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
      OnKeyDown = DBGrid1KeyDown
    end
    object ComboBox1: TComboBox
      Left = 67
      Top = 11
      Width = 129
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnChange = Edit1Change
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 458
    Width = 682
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      682
      37)
    object Button1: TButton
      Left = 249
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #21457#25918
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 337
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #36864#20986
      ModalResult = 2
      TabOrder = 1
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 682
    Height = 417
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'goods_name'
        Title.Color = clRed
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'goods_guige'
        Width = 195
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'goods_type'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_ON_HAND'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCATION'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Title.Caption = #20379#24212#21830
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rohs'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REF_NUMBER'
        Visible = True
      end>
  end
  object aq235: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT     dbo.Data0235.goods_name, dbo.Data0235.goods_guige,'#13#10' ' +
      'dbo.Data0235.goods_type, dbo.Data0002.UNIT_NAME, dbo.Data0016.LO' +
      'CATION, '#13#10'                      dbo.Data0235.QUAN_ON_HAND, dbo.D' +
      'ata0235.rohs, dbo.Data0235.REF_NUMBER, '#13#10'dbo.Data0023.ABBR_NAME,' +
      ' dbo.Data0235.RKEY, dbo.Data0456.warehouse_ptr, '#13#10'              ' +
      '        dbo.Data0070.PO_NUMBER'#13#10'FROM         dbo.Data0235 INNER ' +
      'JOIN'#13#10'                      dbo.Data0016 ON dbo.Data0235.locatio' +
      'n_ptr = dbo.Data0016.RKEY INNER JOIN'#13#10'                      dbo.' +
      'Data0456 ON dbo.Data0235.GRN_PTR = dbo.Data0456.RKEY INNER JOIN'#13 +
      #10'                      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = d' +
      'bo.Data0023.RKEY INNER JOIN'#13#10'                      dbo.Data0002 ' +
      'ON dbo.Data0235.unit_ptr = dbo.Data0002.RKEY LEFT OUTER JOIN'#13#10'  ' +
      '                    dbo.Data0070 ON dbo.Data0456.PO_PTR = dbo.Da' +
      'ta0070.RKEY'#13#10'WHERE     (dbo.Data0235.QUAN_ON_HAND > 0)'
    IndexFieldNames = 'goods_name'
    Parameters = <>
    Left = 88
    Top = 458
    object aq235goods_name: TStringField
      DisplayLabel = #29289#21697#21517#31216
      DisplayWidth = 20
      FieldName = 'goods_name'
      Size = 60
    end
    object aq235goods_guige: TStringField
      DisplayLabel = #29289#21697#35268#26684
      DisplayWidth = 31
      FieldName = 'goods_guige'
      Size = 200
    end
    object aq235goods_type: TStringField
      DisplayLabel = #31867#22411
      DisplayWidth = 10
      FieldName = 'goods_type'
    end
    object aq235UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      DisplayWidth = 8
      FieldName = 'UNIT_NAME'
    end
    object aq235LOCATION: TStringField
      DisplayLabel = #23384#20179#20301#32622
      DisplayWidth = 10
      FieldName = 'LOCATION'
      Size = 10
    end
    object aq235QUAN_ON_HAND: TBCDField
      DisplayLabel = #25968#37327
      DisplayWidth = 12
      FieldName = 'QUAN_ON_HAND'
      Precision = 10
      Size = 3
    end
    object aq235rohs: TStringField
      DisplayLabel = #29615#20445#26631#35782
      DisplayWidth = 10
      FieldName = 'rohs'
      Size = 10
    end
    object aq235REF_NUMBER: TStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 15
      FieldName = 'REF_NUMBER'
      Size = 15
    end
    object aq235ABBR_NAME: TStringField
      DisplayLabel = #20379#23601#24212#21830
      DisplayWidth = 10
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object aq235RKEY: TAutoIncField
      DisplayWidth = 10
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aq235warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object aq235PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 15
    end
  end
  object DataSource1: TDataSource
    DataSet = aq235
    OnDataChange = DataSource1DataChange
    Left = 56
    Top = 459
  end
end
