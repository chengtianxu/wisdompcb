object Form1: TForm1
  Left = 263
  Top = 181
  Width = 738
  Height = 552
  Caption = #29616#37329'('#38134#34892')'#36716#24080#22788#29702
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
    Width = 722
    Height = 37
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 192
      Top = 14
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #36716#24080#32534#21495
    end
    object empl_name: TLabel
      Left = 378
      Top = 3
      Width = 7
      Height = 13
      Visible = False
    end
    object curr_code: TLabel
      Left = 378
      Top = 19
      Width = 7
      Height = 13
      Visible = False
    end
    object Label2: TLabel
      Left = 386
      Top = 14
      Width = 46
      Height = 13
      Caption = #26085#26399#20174':'
    end
    object Label3: TLabel
      Left = 541
      Top = 14
      Width = 20
      Height = 13
      Caption = #21040':'
    end
    object BitBtn1: TBitBtn
      Left = 2
      Top = 6
      Width = 56
      Height = 29
      Hint = #36864#20986#31995#32479
      Caption = #36864#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
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
      Top = 6
      Width = 56
      Height = 29
      Hint = #21047#26032
      Caption = #21047#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
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
    object BitBtn2: TBitBtn
      Left = 114
      Top = 6
      Width = 56
      Height = 29
      Hint = #23548#20986#25968#25454#21040'Excel'
      Caption = #23548#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
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
    object Edit1: TEdit
      Left = 178
      Top = 10
      Width = 121
      Height = 21
      TabOrder = 3
      OnChange = Edit1Change
    end
    object dtpk1: TDateTimePicker
      Left = 436
      Top = 9
      Width = 96
      Height = 21
      Date = 38847.000000000000000000
      Time = 38847.000000000000000000
      TabOrder = 4
      OnCloseUp = dtpk1CloseUp
      OnExit = dtpk1CloseUp
    end
    object dtpk2: TDateTimePicker
      Left = 564
      Top = 10
      Width = 96
      Height = 21
      Date = 38847.000000000000000000
      Time = 38847.000000000000000000
      TabOrder = 5
      OnCloseUp = dtpk1CloseUp
      OnExit = dtpk1CloseUp
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 37
    Width = 722
    Height = 477
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
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'REF_NUMBER'
        Title.Color = clRed
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TDATE'
        ReadOnly = False
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21046#21333#20154
        Title.Color = cl3DLight
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = #36716#20986#31080#25454#21495
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = #36716#20986#24080#25143
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = #36716#20837#31080#25454#21495
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = #36716#20837#24080#25143
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = #36716#20986#37329#39069
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = #36135#24065
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'exch_rate'
        Title.Caption = #27719#29575
        Visible = True
      end
      item
        Expanded = False
        FieldName = #32463#21150#20154
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20973#35777#32534#21495
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20973#35777#29366#24577
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbrname15'
        Width = 64
        Visible = True
      end>
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 192
    Top = 184
    object N1: TMenuItem
      Caption = #26032#22686
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #32534#36753
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #26816#26597
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #21462#28040
      OnClick = N4Click
    end
  end
end
