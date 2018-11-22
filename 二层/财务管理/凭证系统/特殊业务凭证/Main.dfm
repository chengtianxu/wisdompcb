object FrmMain: TFrmMain
  Left = 240
  Top = 134
  Width = 952
  Height = 614
  Caption = #29305#27530#19994#21153#20973#35777
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
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
    Top = 419
    Width = 936
    Height = 8
    Cursor = crVSplit
    Align = alBottom
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 936
    Height = 378
    Align = alClient
    DataSource = DataSource1
    FixedColor = clMenu
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
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
        FieldName = 'voucher'
        Title.Caption = #20973#35777#21495
        Title.Color = clRed
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vTranType'
        Title.Caption = #20973#35777#31867#22411
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'entered_dt'
        Title.Caption = #26085#26399
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FYEAR'
        Title.Caption = #24180#24230
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERIOD'
        Title.Caption = #26376#20221
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'employee_name'
        Title.Caption = #21046#21333#20154
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cstatus'
        Title.Caption = #20973#35777#29366#24577
        Width = 106
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 427
    Width = 936
    Height = 149
    Align = alBottom
    DataSource = DataSource2
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid2KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCRIPTION'
        Title.Caption = #20973#35777#25688#35201
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GL_ACC_NUMBER'
        Title.Caption = #31185#30446#20195#30721
        Width = 165
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'description_2'
        Title.Caption = #31185#30446#21517#31216
        Width = 229
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AMOUNT'
        Title.Caption = #37329#39069
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_C'
        Title.Caption = #20511'/'#36151
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Title.Caption = #36135#24065
        Width = 56
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 936
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label4: TLabel
      Left = 90
      Top = 3
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = #20973#35777#21495':'
    end
    object BitBtn2: TBitBtn
      Left = 2
      Top = 4
      Width = 34
      Height = 30
      Hint = #36864#20986#31243#24207
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
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
    object Edit1: TEdit
      Left = 87
      Top = 16
      Width = 98
      Height = 21
      TabOrder = 1
      OnChange = Edit1Change
    end
    object GroupBox2: TGroupBox
      Left = 196
      Top = 0
      Width = 260
      Height = 40
      Caption = #26085#26399
      TabOrder = 2
      object Label1: TLabel
        Left = 11
        Top = 16
        Width = 20
        Height = 13
        Alignment = taRightJustify
        Caption = #20174':'
      end
      object Label2: TLabel
        Left = 137
        Top = 17
        Width = 20
        Height = 13
        Alignment = taRightJustify
        Caption = #21040':'
      end
      object DateTimePicker1: TDateTimePicker
        Left = 32
        Top = 12
        Width = 94
        Height = 21
        Date = 37566.000000000000000000
        Time = 37566.000000000000000000
        TabOrder = 0
        OnCloseUp = DateTimePicker1CloseUp
        OnExit = DateTimePicker2Exit
      end
      object DateTimePicker2: TDateTimePicker
        Left = 157
        Top = 12
        Width = 97
        Height = 21
        Date = 37566.000000000000000000
        Time = 37566.000000000000000000
        TabOrder = 1
        OnCloseUp = DateTimePicker2CloseUp
        OnExit = DateTimePicker2Exit
      end
    end
    object GroupBox1: TGroupBox
      Left = 454
      Top = 0
      Width = 332
      Height = 40
      Caption = #20973#35777#29366#24577
      TabOrder = 3
      object CheckBox1: TCheckBox
        Left = 8
        Top = 16
        Width = 59
        Height = 17
        Caption = #26410#23457#26680
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Left = 67
        Top = 15
        Width = 71
        Height = 17
        Caption = #20250#35745#24050#23457
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = CheckBox1Click
      end
      object CheckBox3: TCheckBox
        Left = 140
        Top = 15
        Width = 73
        Height = 17
        Caption = #20027#31649#24050#23457
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = CheckBox1Click
      end
      object CheckBox4: TCheckBox
        Left = 211
        Top = 15
        Width = 58
        Height = 17
        Caption = #24050#30331#24080
        Checked = True
        State = cbChecked
        TabOrder = 3
        OnClick = CheckBox1Click
      end
      object CheckBox5: TCheckBox
        Left = 271
        Top = 14
        Width = 58
        Height = 17
        Caption = #34987#20316#24223
        Checked = True
        State = cbChecked
        TabOrder = 4
        OnClick = CheckBox1Click
      end
    end
    object BitBtn1: TBitBtn
      Left = 37
      Top = 4
      Width = 34
      Height = 30
      Hint = #23548#20986#25968#25454#21040'Excel'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BitBtn1Click
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
  object DataSource1: TDataSource
    DataSet = DM.Ado105
    Left = 168
    Top = 224
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = PopupMenu1Popup
    Left = 136
    Top = 224
    object N2: TMenuItem
      Caption = #26032#24314
      OnClick = N2Click
    end
    object N5: TMenuItem
      Caption = #22797#21046#25104#26032#20973#35777
      OnClick = N5Click
    end
    object N3: TMenuItem
      Caption = #32534#36753
      OnClick = N3Click
    end
    object N9: TMenuItem
      Caption = #26816#26597
      OnClick = N9Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N10: TMenuItem
      Caption = #20316#24223#20973#35777
      OnClick = N10Click
    end
    object N1: TMenuItem
      Caption = #37325#26032#21551#29992
      OnClick = N1Click
    end
  end
  object DataSource2: TDataSource
    DataSet = DM.ADOQ0106
    Left = 160
    Top = 432
  end
end
