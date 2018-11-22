object Form1: TForm1
  Left = 210
  Top = 135
  Width = 785
  Height = 572
  Caption = #37319#36141#21333#23457#26680
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 345
    Width = 777
    Height = 8
    Cursor = crVSplit
    Align = alBottom
    Beveled = True
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 777
    Height = 304
    Hint = #25552#31034#65306#25353#20303'Ctrl'#38190#21487#20197#19968#27425#36873#25321#22810#26465#35760#24405#21516#26102#23457#26680
    Align = alClient
    DataSource = DM.DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ReadOnly = True
    ShowHint = False
    TabOrder = 0
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
        FieldName = 'PO_NUMBER'
        Title.Caption = #37319#36141#23450#21333#21495
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'employee_name'
        Title.Caption = #21019#24314#20154
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name'
        Title.Caption = #20379#24212#21830
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FACTORY_LOCATION'
        Title.Caption = #35013#36816#22320#28857
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'in_out'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'warehouse_code'
        Title.Caption = #24037#21378
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'curr_name'
        Title.Caption = #36135#24065#31181#31867
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUB_TOTAL'
        Title.Caption = #24635#35745#37329#39069
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_type'
        Title.Caption = #31867#22411
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_status'
        Title.Caption = #29366#24577
        Width = 66
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 777
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label2: TLabel
      Left = 275
      Top = 16
      Width = 7
      Height = 13
    end
    object Label1: TLabel
      Left = 112
      Top = 15
      Width = 53
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #20379#24212#21830':'
    end
    object csi_rkey: TLabel
      Left = 422
      Top = 4
      Width = 7
      Height = 13
      Caption = '4'
      Visible = False
    end
    object vprev: TLabel
      Left = 404
      Top = 4
      Width = 7
      Height = 13
      Caption = '0'
      Visible = False
    end
    object db_ptr: TLabel
      Left = 388
      Top = 4
      Width = 7
      Height = 13
      Caption = '0'
      Visible = False
    end
    object BitBtn1: TBitBtn
      Left = 16
      Top = 4
      Width = 33
      Height = 31
      Hint = #36864#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = False
      OnClick = BitBtn1Click
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        0400000000007800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
        FFFFFFFF00FFFFFFFFFFFFF030FFFFFFFFFFFF0330FFFFFFFFFF003330000000
        0FFFF03330FF0FFFFFFFF03300FF0FFFF4FFF03330FF0FFF44FFF03330FF0FF4
        4444F03330FF0F444444F03330FF0FF44444F0330FFF0FFF44FFF030FFFF0FFF
        F4FFF00FFFFF0FFFFFFFF00000000FFFFFFF}
    end
    object BitBtn2: TBitBtn
      Left = 49
      Top = 4
      Width = 33
      Height = 31
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
    object Edit1: TEdit
      Left = 167
      Top = 11
      Width = 69
      Height = 21
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 2
      OnClick = Edit1Click
      OnExit = Edit1Exit
    end
    object BitBtn3: TBitBtn
      Left = 242
      Top = 8
      Width = 28
      Height = 28
      TabOrder = 3
      TabStop = False
      OnClick = BitBtn3Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        333333777777777F33333330B00000003333337F7777777F3333333000000000
        333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
        333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
        03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
        03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
        3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
        333333333377F7F33333333333330F03333333333337F7F33333333333330B03
        3333333333373733333333333333303333333333333373333333}
      NumGlyphs = 2
    end
    object RadioGroup1: TRadioGroup
      Left = 528
      Top = -1
      Width = 185
      Height = 42
      Caption = #23457#25209
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #24403#21069
        #20840#37096)
      TabOrder = 4
      OnClick = RadioGroup1Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 353
    Width = 777
    Height = 192
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object DBGrid3: TDBGrid
      Left = 0
      Top = 0
      Width = 777
      Height = 192
      Align = alClient
      DataSource = DM.DataSource3
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          Color = cl3DLight
          Expanded = False
          FieldName = 'DESCRIPTION'
          Title.Caption = #29289#21697#21517#31216
          Width = 153
          Visible = True
        end
        item
          Color = cl3DLight
          Expanded = False
          FieldName = 'GUI_GE'
          Title.Caption = #29289#21697#35268#26684
          Width = 166
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DEL_DATE'
          Title.Caption = #21040#36135#26085#26399
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUAN_ORD'
          Title.Alignment = taRightJustify
          Title.Caption = #25968#37327
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIT_PRICE'
          Title.Alignment = taRightJustify
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'unit_name'
          Width = 45
          Visible = True
        end
        item
          Color = clAqua
          Expanded = False
          FieldName = 'sim_total'
          Title.Alignment = taRightJustify
          Title.Caption = #37329#39069
          Visible = True
        end
        item
          Color = clAqua
          Expanded = False
          FieldName = 'STATE_TAX'
          Title.Alignment = taRightJustify
          Title.Caption = #31246#29575'%'
          Width = 64
          Visible = True
        end
        item
          Color = clAqua
          Expanded = False
          FieldName = 'tax_total'
          Title.Alignment = taRightJustify
          Title.Caption = #31246#37329
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'reason'
          Title.Caption = #35831#36141#21407#22240
          Width = 158
          Visible = True
        end>
    end
    object DBGrid2: TDBGrid
      Left = 0
      Top = 0
      Width = 777
      Height = 192
      Align = alClient
      DataSource = DM.DataSource2
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          Color = cl3DLight
          Expanded = False
          FieldName = 'partnumber'
          Width = 133
          Visible = True
        end
        item
          Color = cl3DLight
          Expanded = False
          FieldName = 'inv_part_number'
          Width = 147
          Visible = True
        end
        item
          Color = cl3DLight
          Expanded = False
          FieldName = 'inv_part_description'
          Width = 184
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REQ_DATE'
          Title.Caption = #21040#36135#26085#26399
          Width = 79
          Visible = True
        end
        item
          Color = clAqua
          Expanded = False
          FieldName = 'QUAN_ORD'
          Title.Alignment = taRightJustify
          Title.Caption = #37319#36141#25968#37327
          Width = 66
          Visible = True
        end
        item
          Color = clAqua
          Expanded = False
          FieldName = 'PRICE'
          Title.Alignment = taRightJustify
          Title.Caption = #20215#26684
          Width = 66
          Visible = True
        end
        item
          Color = clAqua
          Expanded = False
          FieldName = 'sim_total'
          Title.Alignment = taRightJustify
          Title.Caption = #37329#39069
          Width = 71
          Visible = True
        end
        item
          Color = clAqua
          Expanded = False
          FieldName = 'tax_total'
          Title.Alignment = taRightJustify
          Title.Caption = #31246#37329
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'unit_name'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantity_stock'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantity_zaitu'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'reason'
          Title.Caption = #35831#36141#21407#22240
          Width = 136
          Visible = True
        end>
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 64
    Top = 80
    object N1: TMenuItem
      Caption = #23457#26680
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21462#28040#23457#26680
      OnClick = N2Click
    end
    object N6: TMenuItem
      Caption = #36864#22238#37319#36141#37096
      OnClick = N6Click
    end
    object N7: TMenuItem
      Caption = #22791#27880#20449#24687
      OnClick = N7Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Caption = #26597#30475#32454#33410
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #23457#25209#20449#24687
      OnClick = N5Click
    end
  end
end
