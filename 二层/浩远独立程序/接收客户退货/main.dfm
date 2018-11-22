object Form1: TForm1
  Left = 320
  Top = 241
  Width = 823
  Height = 507
  Caption = #25509#25910#36864#36135
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bar1: TStatusBar
    Left = 0
    Top = 450
    Width = 807
    Height = 19
    Panels = <
      item
        Text = 'RMA'#21495#30721
        Width = 100
      end
      item
        Text = #25628#32034':'
        Width = 50
      end>
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 36
    Width = 807
    Height = 414
    Align = alClient
    DataSource = dm.DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = N3Click
    OnKeyDown = DBGrid1KeyDown
    OnKeyPress = FormKeyPress
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'rma_number'
        Title.Caption = 'RMA'#21495#30721
        Title.Color = clRed
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rma_date'
        Title.Caption = #36864#36135#26085#26399
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sales_order'
        Title.Caption = #38144#21806#35746#21333
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cust_code'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_part_number'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTY_AUTH'
        Title.Caption = #25968#37327
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PART_PRICE'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rma_type'
        Title.Caption = 'RMA'#31867#22411
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'status'
        Title.Caption = #29366#24577
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'warehouse_name'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rmatype'
        Title.Caption = #36864#36135#31867#22411
        Width = 70
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 807
    Height = 36
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label8: TLabel
      Left = 190
      Top = 11
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = ' '#23458#25143':'
    end
    object Label9: TLabel
      Left = 339
      Top = 11
      Width = 7
      Height = 13
    end
    object Label1: TLabel
      Left = 459
      Top = 10
      Width = 34
      Height = 13
      Caption = ' '#20174': '
    end
    object Label2: TLabel
      Left = 583
      Top = 10
      Width = 34
      Height = 13
      Caption = ' '#21040': '
    end
    object BitBtn1: TBitBtn
      Left = 7
      Top = 5
      Width = 58
      Height = 25
      Cursor = crHandPoint
      Hint = #36864#20986
      Caption = #36864#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = False
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
    object Edit1: TEdit
      Left = 234
      Top = 7
      Width = 65
      Height = 21
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Edit1Click
      OnExit = Edit1Exit
    end
    object BitBtn2: TBitBtn
      Left = 306
      Top = 5
      Width = 25
      Height = 25
      TabOrder = 2
      TabStop = False
      OnClick = BitBtn2Click
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
    object dtpk1: TDateTimePicker
      Left = 488
      Top = 6
      Width = 96
      Height = 21
      Date = 38003.000000000000000000
      Time = 38003.000000000000000000
      TabOrder = 3
      OnCloseUp = dtpk1Exit
      OnExit = dtpk1Exit
    end
    object dtpk2: TDateTimePicker
      Left = 608
      Top = 6
      Width = 96
      Height = 21
      Date = 38369.000000000000000000
      Time = 38369.000000000000000000
      TabOrder = 4
      OnCloseUp = dtpk1Exit
      OnExit = dtpk1Exit
    end
    object BitBtn3: TBitBtn
      Left = 66
      Top = 5
      Width = 58
      Height = 25
      Cursor = crHandPoint
      Hint = #36864#20986
      Caption = #21047#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      TabStop = False
      OnClick = BitBtn3Click
      NumGlyphs = 2
    end
    object BitBtn4: TBitBtn
      Left = 124
      Top = 5
      Width = 57
      Height = 25
      Hint = #23548#20986#25968#25454#21040'Excel'
      Caption = #23548#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = BitBtn4Click
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
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 328
    Top = 256
    object N1: TMenuItem
      Caption = #26032#24314
      object N9: TMenuItem
        Caption = #25353#38144#21806#23450#21333#21450#35013#36816
        OnClick = N9Click
      end
      object N10: TMenuItem
        Caption = #25353#23458#25143#37096#20214
        OnClick = N10Click
      end
    end
    object N2: TMenuItem
      Caption = #32534#36753
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #26816#26597
      OnClick = N3Click
    end
    object N6: TMenuItem
      Caption = #25552#20132#20837#20179
      OnClick = N6Click
    end
    object N4: TMenuItem
      Caption = #21024#38500
      OnClick = N4Click
    end
  end
end
