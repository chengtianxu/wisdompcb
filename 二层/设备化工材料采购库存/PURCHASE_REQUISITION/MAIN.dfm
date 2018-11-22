object Form1: TForm1
  Left = 197
  Top = 114
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #35831#36141#21333#21463#29702
  ClientHeight = 517
  ClientWidth = 745
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
  object csi_ptr: TLabel
    Left = 671
    Top = 9
    Width = 7
    Height = 13
    Caption = '4'
    Visible = False
  end
  object db_ptr: TLabel
    Left = 688
    Top = 9
    Width = 7
    Height = 13
    Caption = '1'
    Visible = False
  end
  object vprev: TLabel
    Left = 704
    Top = 9
    Width = 7
    Height = 13
    Caption = '2'
    Visible = False
  end
  object Splitter1: TSplitter
    Left = 0
    Top = 297
    Width = 745
    Height = 6
    Cursor = crVSplit
    Align = alBottom
    Beveled = True
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 40
    Width = 745
    Height = 257
    Align = alClient
    DataSource = DM.DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'department_name'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'employee_name'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'req_date'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_status'
        Title.Caption = #29366#24577
        Width = 143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_flag'
        Title.Caption = #31867#22411
        Width = 100
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 745
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label7: TLabel
      Left = 136
      Top = 14
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #35831#36141#37096#38376
    end
    object Label10: TLabel
      Left = 327
      Top = 14
      Width = 7
      Height = 13
    end
    object GroupBox2: TGroupBox
      Left = 450
      Top = 0
      Width = 288
      Height = 38
      Caption = #26085#26399#33539#22260
      TabOrder = 0
      object Label8: TLabel
        Left = 15
        Top = 17
        Width = 20
        Height = 13
        Alignment = taRightJustify
        Caption = #20174':'
      end
      object Label9: TLabel
        Left = 152
        Top = 17
        Width = 20
        Height = 13
        Alignment = taRightJustify
        Caption = #21040':'
      end
      object dtpk1: TDateTimePicker
        Left = 41
        Top = 13
        Width = 97
        Height = 21
        Date = 37600.000000000000000000
        Time = 37600.000000000000000000
        TabOrder = 0
        OnCloseUp = dtpk1CloseUp
        OnExit = CheckBox1Click
      end
      object DTPk2: TDateTimePicker
        Left = 178
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
      Left = 3
      Top = 4
      Width = 61
      Height = 29
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
    object Edit1: TEdit
      Left = 191
      Top = 10
      Width = 95
      Height = 21
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Edit1Click
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object BitBtn2: TBitBtn
      Left = 295
      Top = 8
      Width = 25
      Height = 25
      Hint = #26597#25214#37096#38376
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
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
    object BitBtn3: TBitBtn
      Left = 65
      Top = 4
      Width = 61
      Height = 29
      Caption = #21047#26032
      TabOrder = 4
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
  object Panel2: TPanel
    Left = 0
    Top = 303
    Width = 745
    Height = 214
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object DBGrid3: TDBGrid
      Left = 0
      Top = 0
      Width = 745
      Height = 152
      Align = alClient
      DataSource = DM.DataSource4
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = PopupMenu4
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDblClick = MenuItem2Click
      Columns = <
        item
          Expanded = False
          FieldName = 'DESCRIPTION_1'
          Title.Caption = #29289#21697#21517#31216
          Width = 146
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GUI_GE'
          Title.Caption = #29289#21697#35268#26684
          Width = 182
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'abbr_name'
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANTITY_REQUIRED'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIT_NAME'
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tax_price'
          Title.Caption = #20215#26684
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REQ_DATE'
          Title.Caption = #35201#27714#26085#26399
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'curr_name'
          Title.Caption = #36135#24065
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPTION_2'
          Width = 147
          Visible = True
        end>
    end
    object DBGrid2: TDBGrid
      Left = 0
      Top = 0
      Width = 745
      Height = 152
      Align = alClient
      DataSource = DM.DataSource3
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = PopupMenu3
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDblClick = MenuItem1Click
      Columns = <
        item
          Expanded = False
          FieldName = 'inv_part_number'
          Title.Caption = #29289#26009#21517#31216
          Width = 163
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'inv_part_description'
          Title.Caption = #29289#26009#35268#26684
          Width = 209
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'extra_req'
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'abbr_name'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'unit_name'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANTITY'
          Title.Caption = #25968#37327
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tax_price'
          Title.Caption = #20215#26684
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REQ_DATE'
          Title.Caption = #35201#27714#21040#36135#26085#26399
          Width = 92
          Visible = True
        end>
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 152
      Width = 745
      Height = 43
      Align = alBottom
      Caption = #29366#24577
      TabOrder = 2
      object CheckBox1: TCheckBox
        Left = 81
        Top = 16
        Width = 60
        Height = 17
        Caption = #24453#23457#25209
        TabOrder = 0
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Left = 238
        Top = 16
        Width = 62
        Height = 17
        Caption = #24453#37319#36141
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = CheckBox1Click
      end
      object CheckBox3: TCheckBox
        Left = 158
        Top = 16
        Width = 61
        Height = 17
        Caption = #24050#25209#20934
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = CheckBox1Click
      end
      object CheckBox4: TCheckBox
        Left = 316
        Top = 16
        Width = 62
        Height = 17
        Caption = #34987#36864#22238
        TabOrder = 3
        OnClick = CheckBox1Click
      end
      object CheckBox5: TCheckBox
        Left = 392
        Top = 16
        Width = 114
        Height = 17
        Caption = #35831#36141#23450#21333#24050#25764#28040
        TabOrder = 4
        OnClick = CheckBox1Click
      end
      object CheckBox6: TCheckBox
        Left = 520
        Top = 16
        Width = 121
        Height = 18
        Caption = #35831#36141#23450#21333#24050#22788#29702
        TabOrder = 5
        OnClick = CheckBox1Click
      end
      object CheckBox7: TCheckBox
        Left = 10
        Top = 16
        Width = 63
        Height = 17
        Caption = #26410#25552#20132
        TabOrder = 6
        OnClick = CheckBox1Click
      end
    end
    object Bar1: TStatusBar
      Left = 0
      Top = 195
      Width = 745
      Height = 19
      Panels = <>
      SimpleText = #25628#32034':'
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 68
    Top = 88
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
    object N8: TMenuItem
      Caption = #25552#20132#37319#36141
      OnClick = N8Click
    end
    object N11: TMenuItem
      Caption = #36864#22238#35831#36141#32773
      OnClick = N11Click
    end
    object N12: TMenuItem
      Caption = '-'
    end
    object N9: TMenuItem
      Caption = #23457#25209#20449#24687
      OnClick = N9Click
    end
    object N10: TMenuItem
      Caption = #25910#36135#20449#24687
      OnClick = N10Click
    end
    object N13: TMenuItem
      Caption = #23548#20986#35831#36141#39033#30446
      OnClick = N13Click
    end
    object N4: TMenuItem
      Caption = #22797#21046
      OnClick = N4Click
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 324
    Top = 8
    object MenuItem1: TMenuItem
      Caption = #26816#26597
      OnClick = MenuItem1Click
    end
  end
  object PopupMenu4: TPopupMenu
    Left = 352
    Top = 8
    object MenuItem2: TMenuItem
      Caption = #26816#26597
      OnClick = MenuItem2Click
    end
  end
end
