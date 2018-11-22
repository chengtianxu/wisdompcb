object Form1: TForm1
  Left = 162
  Top = 146
  Width = 800
  Height = 503
  Caption = #25253#20215#21333#23457#26680
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      792
      41)
    object RadioGroup1: TRadioGroup
      Left = 599
      Top = -1
      Width = 185
      Height = 42
      Anchors = [akTop, akRight]
      Caption = #23457#25209
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #24403#21069
        #20840#37096)
      TabOrder = 0
      OnClick = RadioGroup1Click
    end
    object BitBtn1: TBitBtn
      Left = 1
      Top = 5
      Width = 57
      Height = 30
      Hint = #36864#20986#31995#32479
      Caption = #36864#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BitBtn1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
    object BitBtn3: TBitBtn
      Left = 58
      Top = 5
      Width = 57
      Height = 30
      Hint = #21047#26032#24403#21069#25968#25454
      Caption = #21047#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BitBtn3Click
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
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 792
    Height = 435
    Align = alClient
    DataSource = DM.DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'TNUMBER'
        Title.Color = cl3DLight
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REF_PART_NO'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_PART_NO'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_NAME'
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'orig_customer'
        Title.Caption = #20851#32852#21407#23458#25143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quote_taxprice'
        ReadOnly = False
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_RATE'
        ReadOnly = False
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'vatax'
        ReadOnly = False
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rate_margin'
        ReadOnly = False
        Title.Caption = #27611#21033#29575'%'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mian_ji'
        ReadOnly = False
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTE_DATE'
        ReadOnly = False
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXPIRATION_DATE'
        ReadOnly = False
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'apprv_date'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = #31867#22411
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = #38144#21806#26041#24335
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = #25253#20215#21333#20301
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ststus_c'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALES_ORDERS_ENTERED'
        ReadOnly = False
        Width = 64
        Visible = True
      end>
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 120
    Top = 168
    object N1: TMenuItem
      Caption = #23457#25209
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21462#28040#23457#25209
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #36864#22238#25253#20215#21592
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Caption = #26816#26597#26126#32454
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #23457#25209#20449#24687
      OnClick = N6Click
    end
  end
end
