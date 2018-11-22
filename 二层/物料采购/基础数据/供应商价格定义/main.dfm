object Form1: TForm1
  Left = 428
  Top = 338
  Width = 846
  Height = 496
  Caption = #20379#24212#21830#20215#26684
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bar1: TStatusBar
    Left = 0
    Top = 439
    Width = 830
    Height = 19
    Panels = <>
    SimpleText = #25628#32034':'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 80
    Width = 631
    Height = 359
    Align = alClient
    DataSource = DM.DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnKeyPress = DBGrid1KeyPress
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'inv_part_number'
        Title.Caption = '* '#26448#26009#21495#30721
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inv_part_description'
        Title.Caption = #26448#26009#25551#36848
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE_1'
        Width = 32
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TAX_2'
        Title.Caption = #22686#20540#31246
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'unit_code'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'curr_name'
        Width = 26
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qte_price'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qte_price2'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'avl_flag'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'supper_statu'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29615#27979#29289#26009#21517#31216
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'model'
        Title.Caption = #29615#27979#22411#21495
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'orig_abbrname'
        Width = 76
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 830
    Height = 80
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 11
      Top = 56
      Width = 86
      Height = 13
      Alignment = taRightJustify
      Caption = '  '#20379#24212#21830#20195#30721':'
    end
    object Label2: TLabel
      Left = 228
      Top = 57
      Width = 7
      Height = 13
    end
    object Label4: TLabel
      Left = 320
      Top = 55
      Width = 7
      Height = 13
      Visible = False
    end
    object inv_rkey: TLabel
      Left = 456
      Top = 55
      Width = 56
      Height = 13
      Caption = 'inv_rkey'
      Visible = False
    end
    object empl_ptr: TLabel
      Left = 640
      Top = 58
      Width = 7
      Height = 13
      Caption = '2'
      Visible = False
    end
    object supp_rkey: TLabel
      Left = 544
      Top = 56
      Width = 63
      Height = 13
      Caption = 'supp_rkey'
      Visible = False
    end
    object new_rkey: TLabel
      Left = 456
      Top = 32
      Width = 56
      Height = 13
      Caption = 'new_rkey'
      Visible = False
    end
    object new_code: TLabel
      Left = 520
      Top = 32
      Width = 56
      Height = 13
      Caption = 'new_code'
      Visible = False
    end
    object new_name: TLabel
      Left = 584
      Top = 32
      Width = 56
      Height = 13
      Caption = 'new_name'
      Transparent = False
      Visible = False
    end
    object Edit2: TEdit
      Left = 106
      Top = 52
      Width = 183
      Height = 21
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = False
      OnClick = Edit2Click
      OnExit = Edit2Exit
      OnKeyDown = Edit1KeyDown
    end
    object BitBtn1: TBitBtn
      Left = 1
      Top = 6
      Width = 60
      Height = 39
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
    object RadioGroup1: TRadioGroup
      Left = 280
      Top = 5
      Width = 173
      Height = 41
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #25353#20379#24212#21830
        #25353#26448#26009)
      TabOrder = 2
      OnClick = RadioGroup1Click
    end
    object Edit1: TEdit
      Left = 103
      Top = 52
      Width = 91
      Height = 21
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = Edit1Click
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object BitBtn2: TBitBtn
      Left = 197
      Top = 50
      Width = 26
      Height = 25
      TabOrder = 4
      TabStop = False
      OnClick = BitBtn2Click
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000888880000080F000888880F00080F000888880F0008000000080000
        000800F000000F00000800F000800F00000800F000800F000008800000000000
        0088880F00080F000888880000080000088888800088800088888880F08880F0
        888888800088800088888888888888888888}
    end
    object BitBtn3: TBitBtn
      Left = 290
      Top = 49
      Width = 26
      Height = 25
      TabOrder = 5
      TabStop = False
      Visible = False
      OnClick = BitBtn3Click
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000888880000080F000888880F00080F000888880F0008000000080000
        000800F000000F00000800F000800F00000800F000800F000008800000000000
        0088880F00080F000888880000080000088888800088800088888880F08880F0
        888888800088800088888888888888888888}
    end
    object BitBtn4: TBitBtn
      Left = 61
      Top = 6
      Width = 60
      Height = 40
      Caption = #23548#20986
      Enabled = False
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
    object BitBtn5: TBitBtn
      Left = 121
      Top = 5
      Width = 60
      Height = 41
      Caption = #21464#21160#26597#35810
      TabOrder = 7
      OnClick = BitBtn5Click
    end
    object BitBtn6: TBitBtn
      Left = 181
      Top = 5
      Width = 92
      Height = 41
      Caption = #22797#21046#26448#26009#26126#32454
      TabOrder = 8
      OnClick = BitBtn6Click
      OnEnter = BitBtn6Enter
    end
  end
  object Panel2: TPanel
    Left = 631
    Top = 80
    Width = 199
    Height = 359
    Align = alRight
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object Label7: TLabel
      Left = 1
      Top = 93
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = ' '#20379#24212#21830#21495#30721':'
    end
    object Label8: TLabel
      Left = -2
      Top = 135
      Width = 96
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #24314#35758#37325#36141#25968#37327':'
    end
    object Label9: TLabel
      Left = 2
      Top = 179
      Width = 104
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #20379#24212#21830#20132#36135#26102#38388':'
    end
    object Label10: TLabel
      Left = 2
      Top = 222
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = ' '#36135#24065':'
    end
    object Label11: TLabel
      Left = 77
      Top = 199
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = '   '#22825#25968
    end
    object Label3: TLabel
      Left = 9
      Top = 261
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = #29615#20445#26631#35782':'
    end
    object Label5: TLabel
      Left = 12
      Top = 303
      Width = 47
      Height = 13
      Caption = #32784'CAF'#65306
    end
    object Label6: TLabel
      Left = 85
      Top = 239
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = #22686#20540#31246
    end
    object DBEdit3: TDBEdit
      Left = 7
      Top = 109
      Width = 138
      Height = 21
      Color = cl3DLight
      DataField = 'supplier_part_no'
      DataSource = DM.DataSource1
      TabOrder = 0
    end
    object DBEdit4: TDBEdit
      Left = 7
      Top = 152
      Width = 75
      Height = 21
      Color = cl3DLight
      DataField = 'sugg_reorder_qty'
      DataSource = DM.DataSource1
      TabOrder = 1
    end
    object DBEdit5: TDBEdit
      Left = 7
      Top = 196
      Width = 75
      Height = 21
      Color = cl3DLight
      DataField = 'lead_time'
      DataSource = DM.DataSource1
      TabOrder = 2
    end
    object DBEdit6: TDBEdit
      Left = 7
      Top = 237
      Width = 75
      Height = 21
      Color = cl3DLight
      DataField = 'curr_name'
      DataSource = DM.DataSource1
      TabOrder = 3
    end
    object Button1: TButton
      Left = 128
      Top = 192
      Width = 63
      Height = 25
      Hint = #19968#27425#26356#26032#20379#24212#21830#20132#36135#26102#38388
      Caption = #26356#26032
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = Button1Click
    end
    object DBEdit1: TDBEdit
      Left = 7
      Top = 277
      Width = 75
      Height = 21
      Color = cl3DLight
      DataField = 'rohs'
      DataSource = DM.DataSource1
      TabOrder = 5
    end
    object DBEdit2: TDBEdit
      Left = 8
      Top = 318
      Width = 74
      Height = 21
      Color = cl3DLight
      DataField = 'IF_CAF'
      DataSource = DM.DataSource1
      TabOrder = 6
    end
    object Button2: TButton
      Left = 128
      Top = 234
      Width = 63
      Height = 25
      Hint = #19968#27425#26356#26032#20379#24212#21830#20132#36135#26102#38388
      Caption = #26356#26032
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = Button2Click
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 343
    Top = 194
    object N1: TMenuItem
      Caption = #26032#24314
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #32534#36753
      OnClick = N2Click
    end
    object N4: TMenuItem
      Caption = #26816#26597
      OnClick = N4Click
    end
    object N3: TMenuItem
      Caption = #21024#38500
      OnClick = N3Click
    end
    object N5: TMenuItem
      Caption = #20215#26684#21464#21160#35760#24405
      OnClick = N5Click
    end
  end
end
