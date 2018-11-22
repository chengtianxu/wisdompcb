object Form7: TForm7
  Left = 707
  Top = 222
  Width = 805
  Height = 483
  Caption = #24211#23384#26448#26009#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 411
    Width = 797
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Label2: TLabel
      Left = 26
      Top = 14
      Width = 33
      Height = 13
      Caption = #24037#21378':'
    end
    object Button1: TButton
      Left = 230
      Top = 8
      Width = 75
      Height = 25
      Caption = #21457#25918
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 320
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
    object ComboBox1: TComboBox
      Left = 67
      Top = 11
      Width = 129
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnChange = ComboBox1Change
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 797
    Height = 411
    Align = alClient
    DataSource = DM.DataSource2
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
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
        FieldName = 'INV_PART_NUMBER'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Width = 143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCATION'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quan_hand'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXPIRE_DATE'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ship_DATE'
        Title.Caption = #36865#36135#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUPPLIER2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'barcode_id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STD_COST'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rohs'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRN_NUMBER'
        Title.Alignment = taCenter
        Title.Caption = #20837#24211#21333#21495
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DELIVER_NUMBER'
        Title.Alignment = taCenter
        Title.Caption = #36865#36135#21333#21495
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUT_NO'
        Visible = True
      end>
  end
end
