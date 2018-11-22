object Form1: TForm1
  Left = 216
  Top = 198
  BorderStyle = bsSingle
  Caption = #20379#24212#21830#26723#26696
  ClientHeight = 435
  ClientWidth = 696
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
  object db_ptr: TLabel
    Left = 348
    Top = 14
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object vprev: TLabel
    Left = 364
    Top = 14
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 696
    Height = 34
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object Label10: TLabel
      Left = 86
      Top = 11
      Width = 79
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #20195#30721
    end
    object BitBtn2: TBitBtn
      Left = 41
      Top = 6
      Width = 30
      Height = 25
      TabOrder = 0
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
      Left = 168
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 1
      OnChange = Edit1Change
    end
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 6
    Width = 25
    Height = 25
    Cursor = crHandPoint
    Hint = #36864#20986
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
  object bar1: TStatusBar
    Left = 0
    Top = 416
    Width = 696
    Height = 19
    Panels = <>
    SimpleText = #25628#32034':'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 34
    Width = 343
    Height = 382
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
    OnDblClick = N2Click
    OnKeyPress = FormKeyPress
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CODE'
        Title.Caption = '*'#20195#30721
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUPPLIER_NAME'
        Title.Caption = #20379#24212#21830#21517#31216
        Width = 243
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 343
    Top = 34
    Width = 353
    Height = 382
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 4
    object Label1: TLabel
      Left = 3
      Top = 37
      Width = 82
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #20379#24212#21830#20195#30721':'
    end
    object Label11: TLabel
      Left = -1
      Top = 63
      Width = 86
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = ' '#20379#24212#21830#21517#31216':'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 50
      Top = 89
      Width = 33
      Height = 13
      Caption = #32553#20889':'
      FocusControl = DBEdit3
    end
    object Label3: TLabel
      Left = 50
      Top = 115
      Width = 33
      Height = 13
      Caption = #22320#22336':'
    end
    object Label4: TLabel
      Left = 43
      Top = 194
      Width = 40
      Height = 13
      Caption = #24030'/'#30465':'
      FocusControl = DBEdit7
    end
    object Label5: TLabel
      Left = 50
      Top = 220
      Width = 33
      Height = 13
      Caption = #37038#32534':'
      FocusControl = DBEdit8
    end
    object Label6: TLabel
      Left = 26
      Top = 246
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = #30005#35805#21495#30721':'
      FocusControl = DBEdit9
    end
    object Label7: TLabel
      Left = 26
      Top = 272
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = #20256#30495#21495#30721':'
      FocusControl = DBEdit10
    end
    object Label8: TLabel
      Left = 39
      Top = 298
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = #32852#32476#20154':'
      FocusControl = DBEdit11
    end
    object Label9: TLabel
      Left = 13
      Top = 325
      Width = 72
      Height = 13
      Alignment = taRightJustify
      Caption = #32852#32476#20154#30005#35805':'
      FocusControl = DBEdit12
    end
    object DBEdit1: TDBEdit
      Left = 88
      Top = 59
      Width = 235
      Height = 21
      Color = cl3DLight
      DataField = 'SUPPLIER_NAME'
      DataSource = DM.DataSource1
      ReadOnly = True
      TabOrder = 0
      OnKeyPress = FormKeyPress
    end
    object DBEdit2: TDBEdit
      Left = 88
      Top = 33
      Width = 69
      Height = 21
      Color = cl3DLight
      DataField = 'CODE'
      DataSource = DM.DataSource1
      ReadOnly = True
      TabOrder = 1
      OnKeyPress = FormKeyPress
    end
    object DBEdit3: TDBEdit
      Left = 88
      Top = 85
      Width = 134
      Height = 21
      Color = cl3DLight
      DataField = 'ABBR_NAME'
      DataSource = DM.DataSource1
      ReadOnly = True
      TabOrder = 2
      OnKeyPress = FormKeyPress
    end
    object DBEdit7: TDBEdit
      Left = 88
      Top = 189
      Width = 104
      Height = 21
      Color = cl3DLight
      DataField = 'STATE'
      DataSource = DM.DataSource1
      ReadOnly = True
      TabOrder = 3
      OnKeyPress = FormKeyPress
    end
    object DBEdit8: TDBEdit
      Left = 88
      Top = 215
      Width = 104
      Height = 21
      Color = cl3DLight
      DataField = 'ZIP'
      DataSource = DM.DataSource1
      ReadOnly = True
      TabOrder = 4
      OnKeyPress = FormKeyPress
    end
    object DBEdit9: TDBEdit
      Left = 88
      Top = 241
      Width = 139
      Height = 21
      Color = cl3DLight
      DataField = 'PHONE'
      DataSource = DM.DataSource1
      ReadOnly = True
      TabOrder = 5
      OnKeyPress = FormKeyPress
    end
    object DBEdit10: TDBEdit
      Left = 88
      Top = 267
      Width = 139
      Height = 21
      Color = cl3DLight
      DataField = 'FAX'
      DataSource = DM.DataSource1
      ReadOnly = True
      TabOrder = 6
      OnKeyPress = FormKeyPress
    end
    object DBEdit11: TDBEdit
      Left = 88
      Top = 293
      Width = 235
      Height = 21
      Color = cl3DLight
      DataField = 'CONTACT_NAME_1'
      DataSource = DM.DataSource1
      ReadOnly = True
      TabOrder = 7
      OnKeyPress = FormKeyPress
    end
    object DBEdit12: TDBEdit
      Left = 88
      Top = 320
      Width = 139
      Height = 21
      Color = cl3DLight
      DataField = 'CONT_PHONE_1'
      DataSource = DM.DataSource1
      ReadOnly = True
      TabOrder = 8
      OnKeyPress = FormKeyPress
    end
    object DBMemo1: TDBMemo
      Left = 88
      Top = 111
      Width = 260
      Height = 74
      Color = cl3DLight
      DataField = 'BILLING_ADDRESS_1'
      DataSource = DM.DataSource1
      ReadOnly = True
      TabOrder = 9
      WantReturns = False
    end
    object DBGrid2: TDBGrid
      Left = 0
      Top = 288
      Width = 320
      Height = 89
      DataSource = DM.DataSource1
      TabOrder = 10
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Visible = False
      Columns = <
        item
          Expanded = False
          FieldName = 'CODE'
          Title.Caption = ' '#20195#30721': '
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUPPLIER_NAME'
          Title.Caption = ' '#20379#24212#21830#21517#31216': '
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ABBR_NAME'
          Title.Caption = ' '#32553#20889': '
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BILLING_ADDRESS_1'
          Title.Caption = ' '#22320#22336': '
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATE'
          Title.Caption = ' '#24030'/'#30465': '
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ZIP'
          Title.Caption = ' '#37038#32534': '
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PHONE'
          Title.Caption = ' '#30005#35805#21495#30721': '
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FAX'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TELEX'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONTACT_NAME_1'
          Title.Caption = #32852#32476#20154'1:'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONTACT_NAME_2'
          Title.Caption = #32852#32476#20154'2:'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONTACT_NAME_3'
          Title.Caption = #32852#32476#20154'3:'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONTACT_NAME_4'
          Title.Caption = #32852#32476#20154'4:'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONTACT_NAME_5'
          Title.Caption = #32852#32476#20154'5:'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONTACT_NAME_6'
          Title.Caption = #32852#32476#20154'6:'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONT_PHONE_1'
          Title.Caption = #32852#32476#20154'1'#30005#35805':'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONT_PHONE_2'
          Title.Caption = #32852#32476#20154'2'#30005#35805':'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONT_PHONE_3'
          Title.Caption = #32852#32476#20154'3'#30005#35805':'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONT_PHONE_4'
          Title.Caption = #32852#32476#20154'4'#30005#35805':'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONT_PHONE_5'
          Title.Caption = #32852#32476#20154'5'#30005#35805':'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONT_PHONE_6'
          Title.Caption = #32852#32476#20154'5'#30005#35805':'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMAIL_FOR_CONTACT1'
          Title.Caption = #32852#32476#20154'1E-mail:'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMAIL_FOR_CONTACT2'
          Title.Caption = #32852#32476#20154'2E-mail:'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMAIL_FOR_CONTACT3'
          Title.Caption = #32852#32476#20154'3E-mail:'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMAIL_FOR_CONTACT4'
          Title.Caption = #32852#32476#20154'4E-mail:'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMAIL_FOR_CONTACT5'
          Title.Caption = #32852#32476#20154'5E-mail:'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMAIL_FOR_CONTACT6'
          Title.Caption = #32852#32476#20154'6E-mail:'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUPPIER_ENT_DATE'
          Title.Caption = #36755#20837#26085#26399':'
          Width = 141
          Visible = True
        end>
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 264
    Top = 152
    object N1: TMenuItem
      Caption = #26032#24314
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #32534#36753
      OnClick = N2Click
    end
    object N10: TMenuItem
      Caption = #26816#26597
      OnClick = N10Click
    end
    object N3: TMenuItem
      Caption = #22797#21046
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #21024#38500
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #31227#21160#35760#24405
      object N6: TMenuItem
        Caption = #31532#19968#26465
        OnClick = N6Click
      end
      object N7: TMenuItem
        Caption = #26368#21518#19968#26465
        OnClick = N7Click
      end
      object N8: TMenuItem
        Caption = #19978#19968#26465
        OnClick = N8Click
      end
      object N9: TMenuItem
        Caption = #19979#19968#26465
        OnClick = N9Click
      end
    end
  end
end
