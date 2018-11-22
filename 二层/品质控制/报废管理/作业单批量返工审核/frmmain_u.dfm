object frm_main: Tfrm_main
  Left = 232
  Top = 218
  Width = 867
  Height = 500
  Caption = #20316#19994#21333#22312#32447#36820#24037#23457#26680
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 851
    Height = 41
    Align = alTop
    TabOrder = 0
    DesignSize = (
      851
      41)
    object radiogroup1: TRadioGroup
      Left = 674
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
      OnClick = radiogroup1Click
    end
    object btn1: TBitBtn
      Left = 1
      Top = 5
      Width = 57
      Height = 30
      Hint = #36864#20986#31995#32479
      Caption = #36864#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btn1Click
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
    object btn2: TBitBtn
      Left = 58
      Top = 5
      Width = 57
      Height = 30
      Hint = #21047#26032#24403#21069#25968#25454
      Caption = #21047#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btn2Click
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
  object DBGrid1: TDBGridEh
    Left = 0
    Top = 41
    Width = 851
    Height = 421
    Align = alClient
    DataSource = DM.DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        EditButtons = <>
        FieldName = 'rkey203'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'return_code'
        Footers = <>
        Title.Caption = #36820#24037#20195#30721
      end
      item
        EditButtons = <>
        FieldName = 'user_ptr_203'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'employee_name'
        Footers = <>
        Title.Caption = #30003#35831#20154#21592
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'ENT_DATE'
        Footers = <>
        Title.Caption = #30003#35831#26102#38388
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'submit'
        Footers = <>
        Title.Caption = #25552#20132#23457#25209#26085#26399
        Width = 110
      end
      item
        EditButtons = <>
        FieldName = 'dept_ptr'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'dept_name'
        Footers = <>
        Title.Caption = #30003#35831#24037#24207
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'CUST_PART_PTR'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'manu_part_number'
        Footers = <>
        Title.Caption = #26412#21378#32534#21495
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'panel_qty'
        Footers = <>
        Title.Caption = #36820#24037'Pan'#25968#37327
        Width = 75
      end
      item
        EditButtons = <>
        FieldName = 'pcs_qty'
        Footers = <>
        Title.Caption = #36820#24037'Pcs'#25968#37327
        Width = 75
      end
      item
        EditButtons = <>
        FieldName = 'v_ttype'
        Footers = <>
        Title.Caption = #24322#24120#31561#32423
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'vttyperemark'
        Footers = <>
        Title.Caption = #24322#24120#36820#24037#31561#32423#35828#26126
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'status'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 't_status'
        Footers = <>
        Title.Caption = #29366#24577
      end
      item
        EditButtons = <>
        FieldName = 'WTYPE_step'
        Footers = <>
        Title.Caption = #36820#24037#26102#27493#39588#21495
        Width = 75
      end
      item
        EditButtons = <>
        FieldName = 'describe'
        Footers = <>
        Title.Caption = #24322#24120#25551#36848
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'reason'
        Footers = <>
        Title.Caption = #24322#24120#21407#22240
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'scheme'
        Footers = <>
        Title.Caption = #36820#24037#26041#26696
        Width = 200
      end
      item
        EditButtons = <>
        FieldName = 'auth_flag'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'auth_date'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'seq_no'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'user_ptr260'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'puth_info'
        Footers = <>
        Visible = False
      end>
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 120
    Top = 176
    object N8: TMenuItem
      Caption = '-'
    end
    object N1: TMenuItem
      Caption = #23457#25209
      Enabled = False
      OnClick = N1Click
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Caption = #36864#22238#30003#35831#20154#21592
      Enabled = False
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Caption = #26816#26597#26126#32454
      Enabled = False
      OnClick = N5Click
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object N6: TMenuItem
      Caption = #23457#25209#20449#24687
      Enabled = False
      OnClick = N6Click
    end
  end
end
