object Form1: TForm1
  Left = 280
  Top = 169
  Width = 1044
  Height = 574
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 336
    Width = 1028
    Height = 8
    Cursor = crVSplit
    Align = alBottom
    Beveled = True
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 1028
    Height = 295
    Align = alClient
    DataSource = DM.DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ReadOnly = True
    ShowHint = True
    TabOrder = 1
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
        Title.Caption = #37319#36141#21333#21495#30721
        Width = 88
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
        FieldName = #24037#21378#31616#31216
        Title.Caption = #24037#21378
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'employee_name'
        Title.Caption = #21019#24314#20154#21592
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_DATE'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'curr_name'
        Title.Caption = #36135#31181
        Width = 74
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SUB_TOTAL'
        Title.Caption = #24635#35745#37329#39069#65288#21547#31246#65289
        Width = 115
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'v_type'
        Title.Caption = #31867#22411
        Width = 96
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'STATE_INVT_TAX_FLAG'
        Title.Caption = #26159#21542'VMI'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_status'
        Title.Caption = #29366#24577
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FACTORY_LOCATION'
        Title.Caption = #35013#36816#22320#28857
        Width = 154
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1028
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label2: TLabel
      Left = 275
      Top = 16
      Width = 7
      Height = 13
    end
    object Label1: TLabel
      Left = 200
      Top = 15
      Width = 53
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #20379#24212#21830':'
    end
    object BitBtn1: TBitBtn
      Left = 16
      Top = 4
      Width = 65
      Height = 31
      Hint = #36864#20986
      Caption = #36864#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
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
      Left = 84
      Top = 4
      Width = 64
      Height = 31
      Hint = #21047#26032
      Caption = #21047#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
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
      Left = 255
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
      TabOrder = 4
      OnClick = Edit1Click
      OnExit = Edit1Exit
    end
    object BitBtn3: TBitBtn
      Left = 330
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
      TabOrder = 0
      OnClick = RadioGroup1Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 344
    Width = 1028
    Height = 192
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object DBGrid3: TDBGrid
      Left = 0
      Top = 0
      Width = 1028
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
          FieldName = 'GUI_GE'
          Title.Caption = #26448#26009#32534#30721
          Width = 130
          Visible = True
        end
        item
          Color = cl3DLight
          Expanded = False
          FieldName = 'DESCRIPTION'
          Title.Caption = #26448#26009#21517#31216
          Width = 136
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DEL_DATE'
          Title.Caption = #21040#36135#26085#26399
          Width = 77
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
          FieldName = 'unit_name'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tax_price'
          Title.Alignment = taRightJustify
          Title.Caption = #21547#31246#20215
          Width = 67
          Visible = True
        end
        item
          Color = clAqua
          Expanded = False
          FieldName = 'STATE_TAX'
          Title.Alignment = taRightJustify
          Title.Caption = #31246#29575'%'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'so_total'
          Title.Caption = #20215#26684'('#21547#31246')'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'rohs'
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IF_urgency'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DEPT_NAME'
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMPLOYEE_NAME'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'reason'
          Title.Caption = #35831#36141#21407#22240
          Width = 100
          Visible = True
        end>
    end
    object DBGrid2: TDBGrid
      Left = 0
      Top = 0
      Width = 1028
      Height = 192
      Align = alClient
      DataSource = DM.DataSource2
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = PopupMenu2
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid2DrawColumnCell
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
          Title.Caption = #26448#26009#21517#31216
          Width = 147
          Visible = True
        end
        item
          Color = cl3DLight
          Expanded = False
          FieldName = 'inv_part_description'
          Title.Caption = #26448#26009#35268#26684
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
          Expanded = False
          FieldName = 'QUAN_ORD'
          Title.Alignment = taRightJustify
          Title.Caption = #37319#36141#25968#37327
          Width = 66
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
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vmi_qty'
          Title.Caption = 'VMI'#24211#23384
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantity_zaitu'
          Width = 64
          Visible = True
        end
        item
          Color = clAqua
          Expanded = False
          FieldName = 'tax_price'
          Title.Alignment = taRightJustify
          Title.Caption = #21547#31246#20215
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'so_total'
          Title.Caption = #20215#26684#65288#21547#31246#65289
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'reason'
          Title.Caption = #35831#36141#21407#22240
          Width = 136
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'rohs'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IF_urgency'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IF_CAF'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'extra_req'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DEPT_NAME'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMPLOYEE_NAME'
          Width = 64
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
  object PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 64
    Top = 401
    object N8: TMenuItem
      Caption = #29289#26009#29616#26377#20379#24212#21830
      OnClick = N8Click
    end
    object N9: TMenuItem
      Caption = #26597#30475#24211#23384#26126#32454
      OnClick = N9Click
    end
    object N10: TMenuItem
      Caption = #21382#21490#20215#26684
      OnClick = N10Click
    end
    object mniPriceCheck: TMenuItem
      Caption = #26597#30475#20215#26684#23457#25209#25991#20214
      OnClick = mniPriceCheckClick
    end
  end
end
