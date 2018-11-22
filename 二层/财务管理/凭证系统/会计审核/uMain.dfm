object main: Tmain
  Left = 222
  Top = 119
  Width = 787
  Height = 560
  Caption = #20973#35777'-'#20250#35745#23457#26680
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    771
    522)
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 771
    Height = 41
    Cursor = crArrow
    Align = alTop
  end
  object Label3: TLabel
    Left = 149
    Top = 13
    Width = 57
    Height = 13
    AutoSize = False
    Caption = #20973#35777#21495#65306
  end
  object Label6: TLabel
    Left = 312
    Top = 13
    Width = 105
    Height = 13
    AutoSize = False
    Caption = #23545#26041'/'#21046#21333'/'#23457#26680#65306
  end
  object Splitter2: TSplitter
    Left = 0
    Top = 345
    Width = 771
    Height = 5
    Cursor = crVSplit
    Align = alBottom
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 771
    Height = 259
    Align = alClient
    DataSource = DM.DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'voucher'
        Title.Caption = #20973#35777#21495
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'entered_dt'
        Title.Alignment = taCenter
        Title.Caption = #26085#26399
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cstatus'
        Title.Caption = #20973#35777#29366#24577
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ttype'
        Title.Caption = #19994#21153#31867#22411
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fyear'
        Title.Caption = #24180#24230
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'period'
        Title.Caption = #26376#20221
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'remark'
        Title.Caption = #24448#26469#23545#26041
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'audited'
        Title.Caption = #20250#35745#23457#26680
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ctype'
        Title.Caption = #20973#35777#31867#22411
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'entered'
        Title.Caption = #21046#21333#20154
        Width = 62
        Visible = True
      end>
  end
  object BitBtn2: TBitBtn
    Left = 6
    Top = 5
    Width = 30
    Height = 29
    Hint = #36864#20986
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = BitBtn2Click
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
  object GroupBox2: TGroupBox
    Left = 584
    Top = -1
    Width = 192
    Height = 38
    Anchors = [akTop, akRight]
    Caption = #20250#35745#26399#38388
    TabOrder = 2
    object Label1: TLabel
      Left = 7
      Top = 18
      Width = 34
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #24180#24230':'
    end
    object Label2: TLabel
      Left = 103
      Top = 17
      Width = 34
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #26376#20221':'
    end
    object SpinEdit1: TSpinEdit
      Left = 44
      Top = 12
      Width = 53
      Height = 22
      MaxValue = 2100
      MinValue = 1990
      TabOrder = 0
      Value = 2006
    end
    object SpinEdit2: TSpinEdit
      Left = 140
      Top = 12
      Width = 37
      Height = 22
      MaxValue = 12
      MinValue = 1
      TabOrder = 1
      Value = 1
    end
  end
  object Edit1: TEdit
    Left = 207
    Top = 9
    Width = 99
    Height = 21
    TabOrder = 3
    OnChange = Edit1Change
  end
  object Edit2: TEdit
    Left = 415
    Top = 9
    Width = 99
    Height = 21
    TabOrder = 4
    OnChange = Edit2Change
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 350
    Width = 771
    Height = 172
    Align = alBottom
    DataSource = DM.DataSource2
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 5
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCRIPTION'
        Title.Caption = #20973#35777#25688#35201
        Width = 207
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GL_ACC_NUMBER'
        Title.Caption = #31185#30446#20195#30721
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cgl_Acc'
        Title.Caption = #31185#30446#21517#31216
        Width = 251
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AMOUNT'
        Title.Caption = #37329#39069
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_C'
        Title.Caption = #20511'/'#36151
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Title.Caption = #36135#24065
        Width = 52
        Visible = True
      end>
  end
  object BitBtn3: TBitBtn
    Left = 37
    Top = 5
    Width = 30
    Height = 29
    Hint = #23548#20986'EXCEL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
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
  object CheckBox10: TCheckBox
    Left = 72
    Top = 12
    Width = 49
    Height = 17
    Caption = #20840#36873
    TabOrder = 7
    OnClick = CheckBox10Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 300
    Width = 771
    Height = 45
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 8
    DesignSize = (
      771
      45)
    object Label4: TLabel
      Left = 256
      Top = 21
      Width = 60
      Height = 13
      Anchors = [akLeft, akBottom]
      AutoSize = False
      Caption = #19994#21153#31867#22411#65306
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 2
      Width = 248
      Height = 43
      Anchors = [akLeft, akBottom]
      Caption = #20973#35777#31867#22411
      TabOrder = 0
      object CheckBox1: TCheckBox
        Left = 8
        Top = 20
        Width = 57
        Height = 17
        Caption = #36716#24080
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Left = 64
        Top = 20
        Width = 57
        Height = 17
        Caption = #20184#27454
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = CheckBox1Click
      end
      object CheckBox3: TCheckBox
        Left = 120
        Top = 20
        Width = 57
        Height = 17
        Caption = #25910#27454
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = CheckBox1Click
      end
      object CheckBox4: TCheckBox
        Left = 176
        Top = 20
        Width = 65
        Height = 17
        Caption = #25910'/'#20184#27454
        Checked = True
        State = cbChecked
        TabOrder = 3
        OnClick = CheckBox1Click
      end
    end
    object GroupBox3: TGroupBox
      Left = 424
      Top = 2
      Width = 353
      Height = 43
      Anchors = [akRight, akBottom]
      Caption = #20973#35777#29366#24577
      TabOrder = 1
      object CheckBox5: TCheckBox
        Left = 2
        Top = 18
        Width = 47
        Height = 17
        Caption = #26410#23457
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = CheckBox1Click
      end
      object CheckBox7: TCheckBox
        Left = 139
        Top = 18
        Width = 72
        Height = 17
        Caption = #20250#35745#24050#23457
        TabOrder = 1
        OnClick = CheckBox1Click
      end
      object CheckBox9: TCheckBox
        Left = 291
        Top = 18
        Width = 59
        Height = 17
        Caption = #24050#30331#24080
        TabOrder = 2
        OnClick = CheckBox1Click
      end
      object CheckBox8: TCheckBox
        Left = 216
        Top = 18
        Width = 71
        Height = 17
        Caption = #20027#31649#24050#23457
        TabOrder = 3
        OnClick = CheckBox1Click
      end
      object CheckBox6: TCheckBox
        Left = 60
        Top = 18
        Width = 73
        Height = 17
        Caption = #20986#32435#24050#23457
        Checked = True
        State = cbChecked
        TabOrder = 4
        OnClick = CheckBox1Click
      end
    end
    object ComboBox1: TComboBox
      Left = 317
      Top = 16
      Width = 105
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akBottom]
      ItemHeight = 13
      ItemIndex = 10
      TabOrder = 2
      Text = #20840#37096
      OnChange = CheckBox1Click
      Items.Strings = (
        #26448#26009#24212#20184#20837#24080
        #26434#39033#24212#20184#20837#24080
        #24212#20184#20184#27454
        #20511#39033#22791#24536
        #24212#25910#20837#24080
        #25910#27454#22788#29702
        #36151#39033#22791#24536
        #32467#36716#21407#26448#26009
        #20854#23427
        #38134#34892#36716#24080
        #20840#37096)
    end
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = PopupMenu1Popup
    Left = 144
    Top = 224
    object N2: TMenuItem
      Caption = #20250#35745#23457#26680
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21462#28040#23457#26680
      OnClick = N3Click
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object N9: TMenuItem
      Caption = #26816#26597
      OnClick = N9Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N6: TMenuItem
      Caption = #21333#39033#25171#21360
      OnClick = N6Click
    end
    object N5: TMenuItem
      Caption = #36830#32493#25171#21360
      OnClick = N5Click
    end
  end
end
