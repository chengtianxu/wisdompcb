object Form_proout: TForm_proout
  Left = 339
  Top = 264
  Width = 925
  Height = 574
  Caption = #29289#21697#20986#20179
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
    Width = 917
    Height = 512
    Align = alClient
    DataSource = dm.DataSource2
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnColEnter = DBGrid1ColEnter
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'GON_NUMBER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'goods_name'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'goods_type'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'goods_guige'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = #37319#36141#20154#21592
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21333#20301
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = #36135#24065
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = #31246#29575
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'exch_rate'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RTN_QUANTITY'
        Title.Caption = #36864#20179#25968#37327
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'unit_price'
        ReadOnly = True
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = #19981#21547#31246#20215
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21547#31246#37329#39069
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = #19981#21547#31246#37329#39069
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPT_NAME'
        Width = 54
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
        FieldName = 'WAREHOUSE_CODE'
        Title.Caption = #24037#21378#32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CREATE_DATE'
        Title.Caption = #20986#20179#26085#26399
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rohs'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ref_number'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29983#20135#21333#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21457#26009#20154#21592
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cut_NO'
        Width = 204
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 917
    Height = 38
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Lbl_FieldCaption: TLabel
      Left = 270
      Top = 13
      Width = 52
      Height = 13
      Caption = #20986#20179#21333#21495
    end
    object Label2: TLabel
      Left = 694
      Top = 6
      Width = 78
      Height = 13
      Caption = #20986#20179#25968#37327#21512#35745
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label3: TLabel
      Left = 695
      Top = 21
      Width = 78
      Height = 13
      Caption = #20986#20179#37329#39069#21512#35745
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label4: TLabel
      Left = 781
      Top = 5
      Width = 7
      Height = 13
      Caption = '0'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label5: TLabel
      Left = 782
      Top = 21
      Width = 28
      Height = 13
      Caption = '0.00'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
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
    object Edt_Start: TEdit
      Left = 369
      Top = 9
      Width = 121
      Height = 21
      TabOrder = 3
      Visible = False
      OnChange = Edt_StartChange
      OnKeyPress = Edt_StartKeyPress
    end
    object cbxSymbol: TComboBox
      Left = 331
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
    object EdtDate_Start: TDBDateTimeEditEh
      Left = 496
      Top = 9
      Width = 121
      Height = 21
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 5
      Visible = False
      OnKeyPress = EdtDate_StartKeyPress
    end
    object EdtDate_End: TDBDateTimeEditEh
      Left = 560
      Top = 9
      Width = 121
      Height = 21
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 6
      Visible = False
      OnKeyPress = EdtDate_EndKeyPress
    end
    object Edt_End: TEdit
      Left = 393
      Top = 9
      Width = 121
      Height = 21
      TabOrder = 7
      Visible = False
      OnKeyPress = Edt_EndKeyPress
    end
  end
end
