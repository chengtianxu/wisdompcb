object FrmDLShow: TFrmDLShow
  Left = 210
  Top = 135
  Width = 754
  Height = 580
  Caption = #26126#32454#20998#31867#24080
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 57
    Width = 746
    Height = 496
    Align = alClient
    AllowedOperations = []
    Ctl3D = False
    DataSource = DM.DataSource2
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = [fsBold]
    TitleHeight = 30
    UseMultiTitle = True
    OnDblClick = DBGridEh1DblClick
    OnDrawColumnCell = DBGridEh1DrawColumnCell
    Columns = <
      item
        EditButtons = <>
        FieldName = 'VOUCHER'
        Footers = <>
        Title.Caption = #20973#35777#21495
      end
      item
        EditButtons = <>
        FieldName = 'TDATE'
        Footers = <>
        Title.Caption = #26085#26399
        Width = 63
      end
      item
        EditButtons = <>
        FieldName = 'DESCRIPTION'
        Footers = <>
        Title.Caption = #25688#35201
        Width = 138
      end
      item
        EditButtons = <>
        FieldName = 'CURR_CODE'
        Footers = <>
        Width = 38
      end
      item
        EditButtons = <>
        FieldName = 'EXCH_RATE'
        Footers = <>
        Width = 52
      end
      item
        DisplayFormat = '#,0.00'
        EditButtons = <>
        FieldName = 'orig_amountD'
        Footers = <>
        Title.Caption = #21407#24065'|'#20511#26041
        Visible = False
        Width = 103
      end
      item
        DisplayFormat = '#,0.00'
        EditButtons = <>
        FieldName = 'orig_amountC'
        Footers = <>
        Title.Caption = #21407#24065'|'#36151#26041
        Visible = False
        Width = 94
      end
      item
        DisplayFormat = '#,0.00'
        EditButtons = <>
        FieldName = 'DEBIT'
        Footers = <>
        Title.Caption = #26412#24065'|'#20511#26041
        Width = 100
      end
      item
        DisplayFormat = '#,0.00'
        EditButtons = <>
        FieldName = 'CREDIT'
        Footers = <>
        Title.Caption = #26412#24065'|'#36151#26041
        Width = 85
      end
      item
        EditButtons = <>
        FieldName = 'DBCR'
        Footers = <>
        Width = 38
      end
      item
        DisplayFormat = '#,0.00'
        EditButtons = <>
        FieldName = 'BALANCE'
        Footers = <>
        Width = 89
      end
      item
        DisplayFormat = '#,0.00'
        EditButtons = <>
        FieldName = 'orig_amount'
        Footers = <>
        Visible = False
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'remark'
        Footers = <>
        Title.Caption = #24448#26469#23545#26041
        Width = 243
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 746
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 5
      Top = 5
      Width = 36
      Height = 39
      Hint = #36864#20986
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
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object SpeedButton4: TSpeedButton
      Left = 41
      Top = 5
      Width = 36
      Height = 39
      Hint = #23558#25968#25454#36755#20986#21040'EXCEL'#25991#20214#20013
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
        EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
        DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
        70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton4Click
    end
    object GroupBox1: TGroupBox
      Left = 89
      Top = 2
      Width = 653
      Height = 54
      Caption = #26597#35810#26465#20214
      TabOrder = 0
      object Label1: TLabel
        Left = 3
        Top = 23
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #20250#35745#24180#24230':'
      end
      object Label2: TLabel
        Left = 129
        Top = 23
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = #26399#38388':'
      end
      object Label4: TLabel
        Left = 316
        Top = 13
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #31185#30446#20195#30721':'
      end
      object Label7: TLabel
        Left = 316
        Top = 35
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #31185#30446#21517#31216':'
      end
      object Label3: TLabel
        Left = 227
        Top = 23
        Width = 20
        Height = 13
        Alignment = taRightJustify
        Caption = #21040':'
      end
      object Label5: TLabel
        Left = 376
        Top = 35
        Width = 21
        Height = 13
        Caption = '   '
      end
      object Edit4: TEdit
        Left = 374
        Top = 10
        Width = 97
        Height = 21
        Color = clScrollBar
        ReadOnly = True
        TabOrder = 0
      end
      object Edit1: TEdit
        Left = 62
        Top = 19
        Width = 65
        Height = 21
        Color = clScrollBar
        Enabled = False
        TabOrder = 1
      end
      object Edit2: TEdit
        Left = 162
        Top = 19
        Width = 65
        Height = 21
        Color = clScrollBar
        Enabled = False
        TabOrder = 2
      end
      object Edit3: TEdit
        Left = 247
        Top = 19
        Width = 65
        Height = 21
        Color = clScrollBar
        Enabled = False
        TabOrder = 3
      end
      object CheckBox1: TCheckBox
        Left = 477
        Top = 12
        Width = 76
        Height = 17
        Caption = #26174#31034#22806#24065
        TabOrder = 4
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Left = 557
        Top = 11
        Width = 76
        Height = 17
        Caption = #26174#31034#26412#24065
        Checked = True
        State = cbChecked
        TabOrder = 5
        OnClick = CheckBox2Click
      end
      object CheckBox3: TCheckBox
        Left = 546
        Top = 32
        Width = 101
        Height = 17
        Caption = #21253#26410#30331#24080#20973#35777
        Checked = True
        State = cbChecked
        TabOrder = 6
      end
    end
  end
end
