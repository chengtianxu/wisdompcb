object Form_pronow: TForm_pronow
  Left = 239
  Top = 159
  Width = 967
  Height = 580
  Caption = #24403#21069#24211#23384#29366#20917
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 38
    Width = 951
    Height = 504
    Align = alClient
    DataSource = dm.DataSource3
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = pm1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnColEnter = DBGrid1ColEnter
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'goods_name'
        ReadOnly = True
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'goods_guige'
        ReadOnly = True
        Width = 182
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'goods_type'
        ReadOnly = True
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24403#21069#24211#23384#25968#37327
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20179#24211#20301#32622
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        ReadOnly = True
        Title.Caption = #21333#20301
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21547#31246#20215
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = #19981#21547#31246#20215
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'state_tax'
        Visible = True
      end
      item
        Expanded = False
        FieldName = #36135#24065
        Visible = True
      end
      item
        Expanded = False
        FieldName = #27719#29575
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24635#37329#39069
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20379#24212#21830#31616#31216
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WAREHOUSE_CODE'
        ReadOnly = True
        Title.Caption = #24037#21378#20195#30721
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ship_DATE'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REF_NUMBER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_RECD'
        Title.Caption = #21046#36896#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cust_decl'
        Title.Caption = #25253#20851#21333#21495
        Width = 130
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 951
    Height = 38
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 305
      Top = 13
      Width = 52
      Height = 13
      Caption = #29289#21697#21517#31216
      Visible = False
    end
    object Lbl_FieldCaption: TLabel
      Left = 518
      Top = 13
      Width = 52
      Height = 13
      Caption = #20986#20179#21333#21495
    end
    object BitBtn1: TBitBtn
      Left = 2
      Top = 4
      Width = 60
      Height = 30
      Caption = #36864#20986
      TabOrder = 0
      OnClick = BitBtn1Click
      Kind = bkClose
    end
    object BitBtn2: TBitBtn
      Left = 61
      Top = 4
      Width = 60
      Height = 30
      Caption = #21047#26032
      TabOrder = 1
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
    object BitBtn3: TBitBtn
      Left = 120
      Top = 4
      Width = 60
      Height = 30
      Caption = #23548#20986
      TabOrder = 2
      OnClick = BitBtn3Click
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
    object Edit1: TEdit
      Left = 369
      Top = 9
      Width = 121
      Height = 21
      TabOrder = 3
      Visible = False
      OnChange = Edit1Change
    end
    object Edt_Start: TEdit
      Left = 625
      Top = 9
      Width = 121
      Height = 21
      TabOrder = 5
      Visible = False
      OnChange = Edt_StartChange
      OnKeyPress = Edt_StartKeyPress
    end
    object Edt_End: TEdit
      Left = 641
      Top = 9
      Width = 121
      Height = 21
      TabOrder = 6
      Visible = False
      OnKeyPress = Edt_EndKeyPress
    end
    object EdtDate_Start: TDBDateTimeEditEh
      Left = 744
      Top = 9
      Width = 121
      Height = 21
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 7
      Visible = False
      OnKeyPress = EdtDate_StartKeyPress
    end
    object EdtDate_End: TDBDateTimeEditEh
      Left = 808
      Top = 9
      Width = 121
      Height = 21
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 8
      Visible = False
      OnKeyPress = EdtDate_EndKeyPress
    end
    object cbxSymbol: TComboBox
      Left = 579
      Top = 9
      Width = 41
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 4
      Text = '='
      Visible = False
      OnChange = cbxSymbolChange
      Items.Strings = (
        '='
        '>'
        '>='
        '<'
        '<='
        '<>'
        '><')
    end
  end
  object pm1: TPopupMenu
    Left = 376
    Top = 208
    object N1: TMenuItem
      Caption = #25171#21360#29289#26009#26631#35782#21345
      OnClick = N1Click
    end
  end
end
