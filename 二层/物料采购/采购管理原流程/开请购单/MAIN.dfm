object Form1: TForm1
  Left = 208
  Top = 119
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #37096#38376#35831#36141#21333
  ClientHeight = 516
  ClientWidth = 713
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
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
  object Splitter1: TSplitter
    Left = 0
    Top = 347
    Width = 713
    Height = 5
    Cursor = crVSplit
    Align = alBottom
    Beveled = True
    ResizeStyle = rsLine
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 713
    Height = 47
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object GroupBox2: TGroupBox
      Left = 393
      Top = 1
      Width = 302
      Height = 43
      Caption = #26085#26399#33539#22260
      TabOrder = 0
      object Label8: TLabel
        Left = 32
        Top = 18
        Width = 20
        Height = 13
        Alignment = taRightJustify
        Caption = #20174':'
      end
      object Label9: TLabel
        Left = 167
        Top = 18
        Width = 20
        Height = 13
        Alignment = taRightJustify
        Caption = #21040':'
      end
      object dtpk1: TDateTimePicker
        Left = 58
        Top = 14
        Width = 97
        Height = 21
        Date = 37600.000000000000000000
        Time = 37600.000000000000000000
        TabOrder = 0
        OnCloseUp = dtpk1CloseUp
        OnExit = CheckBox1Click
      end
      object DTPk2: TDateTimePicker
        Left = 190
        Top = 13
        Width = 97
        Height = 21
        Date = 37600.000000000000000000
        Time = 37600.000000000000000000
        TabOrder = 1
        OnCloseUp = dtpk1CloseUp
        OnExit = CheckBox1Click
      end
    end
    object BitBtn1: TBitBtn
      Left = 8
      Top = 8
      Width = 66
      Height = 31
      Cursor = crHandPoint
      Hint = #36864#20986
      Caption = #36864#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
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
    object BitBtn2: TBitBtn
      Left = 78
      Top = 8
      Width = 66
      Height = 31
      Caption = #21047#26032
      TabOrder = 2
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
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 47
    Width = 713
    Height = 300
    Align = alClient
    DataSource = DM.DataSource1
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'po_req_number'
        Title.Caption = #35831#36141#32534#21495
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'employee_name'
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'req_date'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_status'
        Title.Caption = #29366#24577
        Width = 157
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_flag'
        Title.Caption = #31867#22411
        Width = 84
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 352
    Width = 713
    Height = 164
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object DBGrid2: TDBGrid
      Left = 0
      Top = 0
      Width = 713
      Height = 108
      Align = alClient
      DataSource = DM.DataSource8
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 108
      Width = 713
      Height = 37
      Align = alBottom
      Caption = #29366#24577
      TabOrder = 1
      object CheckBox1: TCheckBox
        Left = 38
        Top = 13
        Width = 47
        Height = 17
        Caption = #26377#25928
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Left = 94
        Top = 13
        Width = 80
        Height = 17
        Caption = #25552#20132#23457#25209
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = CheckBox1Click
      end
      object CheckBox3: TCheckBox
        Left = 176
        Top = 13
        Width = 51
        Height = 17
        Caption = #25209#20934
        TabOrder = 2
        OnClick = CheckBox1Click
      end
      object CheckBox4: TCheckBox
        Left = 304
        Top = 13
        Width = 77
        Height = 17
        Caption = #26410#25209#36864#22238
        TabOrder = 3
        OnClick = CheckBox1Click
      end
      object CheckBox5: TCheckBox
        Left = 390
        Top = 13
        Width = 122
        Height = 17
        Caption = #35831#36141#23450#21333#24050#25764#28040
        TabOrder = 4
        OnClick = CheckBox1Click
      end
      object CheckBox6: TCheckBox
        Left = 517
        Top = 13
        Width = 121
        Height = 17
        Caption = #35831#36141#23450#21333#24050#22788#29702
        TabOrder = 5
        OnClick = CheckBox1Click
      end
      object CheckBox7: TCheckBox
        Left = 234
        Top = 13
        Width = 63
        Height = 17
        Caption = #26410#21463#29702
        Checked = True
        State = cbChecked
        TabOrder = 6
        OnClick = CheckBox1Click
      end
    end
    object Bar1: TStatusBar
      Left = 0
      Top = 145
      Width = 713
      Height = 19
      Panels = <>
      SimpleText = #25628#32034':'
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 320
    Top = 8
    object N1: TMenuItem
      Caption = #26032#24314
      object N6: TMenuItem
        Caption = #29983#20135#29289#26009
        OnClick = N6Click
      end
      object N7: TMenuItem
        Caption = #38750#29983#20135#29289#26009
        OnClick = N7Click
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
    object N10: TMenuItem
      Caption = #25552#20132#21463#29702
      OnClick = N10Click
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object N12: TMenuItem
      Caption = #23548#20986#25968#25454
      OnClick = N12Click
    end
    object N8: TMenuItem
      Caption = #23457#25209#20449#24687
      OnClick = N8Click
    end
    object N9: TMenuItem
      Caption = #25910#36135#20449#24687
      OnClick = N9Click
    end
    object N4: TMenuItem
      Caption = #22797#21046
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #21024#38500
      OnClick = N5Click
    end
  end
end
