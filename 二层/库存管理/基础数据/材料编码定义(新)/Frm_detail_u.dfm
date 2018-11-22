object Frm_detail: TFrm_detail
  Left = 399
  Top = 164
  BorderStyle = bsDialog
  Caption = #21407#26448#26009#25511#21046#35774#35745#20013#24515
  ClientHeight = 553
  ClientWidth = 780
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object HeaderControl1: THeaderControl
    Left = 0
    Top = 48
    Width = 780
    Height = 17
    Sections = <
      item
        Alignment = taCenter
        ImageIndex = -1
        Text = #20869#23481#36873#25321
        Width = 200
      end
      item
        Alignment = taCenter
        ImageIndex = -1
        Width = 535
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 534
    Width = 780
    Height = 19
    Panels = <>
  end
  object TreeView1: TTreeView
    Left = 0
    Top = 65
    Width = 200
    Height = 469
    Align = alLeft
    HideSelection = False
    Indent = 19
    ReadOnly = True
    TabOrder = 1
    OnChange = TreeView1Change
    Items.Data = {
      01000000230000000000000000000000FFFFFFFFFFFFFFFF0000000008000000
      0AD4ADB2C4C1CFD0C5CFA2210000000000000001000000FFFFFFFFFFFFFFFF00
      0000000000000008D2BBB0E3D7CAD1B6210000000000000002000000FFFFFFFF
      FFFFFFFF000000000000000008B2C9B9BAD0C5CFA22100000000000000030000
      00FFFFFFFFFFFFFFFF000000000000000008B4E6BBF5D0C5CFA21F0000000000
      000004000000FFFFFFFFFFFFFFFF000000000000000006CCE6B4FAC1CF1F0000
      000000000005000000FFFFFFFFFFFFFFFF000000000000000006BCC7CAC2B1BE
      1D0000000000000006000000FFFFFFFFFFFFFFFF000000000000000004B2C6CE
      F11C0000000000000007000000FFFFFFFFFFFFFFFF0000000000000000034945
      53210000000000000008000000FFFFFFFFFFFFFFFF000000000000000008B2C4
      C1CFCCD8D0D4}
  end
  object Notebook1: TNotebook
    Left = 200
    Top = 65
    Width = 580
    Height = 469
    Align = alClient
    PageIndex = 3
    TabOrder = 2
    OnPageChanged = Notebook1PageChanged
    object TPage
      Left = 0
      Top = 0
      Caption = 'Default'
    end
    object TPage
      Left = 0
      Top = 0
      Caption = #19968#33324#36164#35759
      object Label3: TLabel
        Left = 63
        Top = 16
        Width = 73
        Height = 13
        Alignment = taRightJustify
        Caption = '  '#26448#26009#32534#30721':'
      end
      object Label4: TLabel
        Left = 56
        Top = 46
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#26448#26009#21517#31216':'
      end
      object Label5: TLabel
        Left = 36
        Top = 101
        Width = 100
        Height = 13
        Alignment = taRightJustify
        Caption = '    '#21046#36896#21830#20195#30721':'
      end
      object Label6: TLabel
        Left = 77
        Top = 133
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #29305#21035#35201#27714':'
      end
      object Label7: TLabel
        Left = 56
        Top = 164
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#26448#26009#31867#21035':'
      end
      object Label8: TLabel
        Left = 56
        Top = 359
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#22791#36873#26448#26009':'
        Visible = False
      end
      object Label35: TLabel
        Left = 147
        Top = 184
        Width = 63
        Height = 13
        Caption = '         '
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label36: TLabel
        Left = 152
        Top = 384
        Width = 7
        Height = 13
      end
      object ctype: TLabel
        Left = 146
        Top = 205
        Width = 79
        Height = 13
        AutoSize = False
      end
      object Label17: TLabel
        Left = 76
        Top = 72
        Width = 59
        Height = 13
        Caption = #26448#26009#35268#26684':'
      end
      object Label58: TLabel
        Left = 40
        Top = 228
        Width = 104
        Height = 13
        Caption = #26448#26009#37325#35201#24615#20998#31867#65306
      end
      object btn1: TSpeedButton
        Left = 272
        Top = 158
        Width = 23
        Height = 22
        Visible = False
        OnClick = btn1Click
      end
      object DBEdit3: TDBEdit
        Left = 144
        Top = 12
        Width = 177
        Height = 21
        DataField = 'INV_PART_NUMBER'
        DataSource = DM.DataSource1
        TabOrder = 0
      end
      object DBEdit4: TDBEdit
        Left = 144
        Top = 42
        Width = 222
        Height = 21
        DataField = 'INV_NAME'
        DataSource = DM.DataSource1
        TabOrder = 1
      end
      object DBEdit5: TDBEdit
        Left = 144
        Top = 97
        Width = 139
        Height = 21
        DataField = 'MANUFACTURER_CODE'
        DataSource = DM.DataSource1
        TabOrder = 3
      end
      object DBEdit6: TDBEdit
        Left = 144
        Top = 129
        Width = 139
        Height = 21
        DataField = 'MANUFACTURER_NAME'
        DataSource = DM.DataSource1
        TabOrder = 4
      end
      object DBCheckBox1: TDBCheckBox
        Left = 144
        Top = 268
        Width = 97
        Height = 17
        Caption = #37325#35201#26448#26009
        DataField = 'CRITICAL_MATL_FLAG'
        DataSource = DM.DataSource1
        TabOrder = 6
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object Edit1: TEdit
        Left = 144
        Top = 160
        Width = 121
        Height = 21
        Color = clInfoBk
        Enabled = False
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object Edit2: TEdit
        Left = 144
        Top = 355
        Width = 170
        Height = 21
        Hint = #35201#24186#36755#20837#27491#30830#35201#24186#20026#31354'!'
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        Visible = False
      end
      object BitBtn4: TBitBtn
        Left = 320
        Top = 353
        Width = 25
        Height = 25
        TabOrder = 7
        TabStop = False
        Visible = False
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
      object DBEdit9: TDBEdit
        Left = 144
        Top = 68
        Width = 278
        Height = 21
        DataField = 'INV_DESCRIPTION'
        DataSource = DM.DataSource1
        TabOrder = 2
      end
      object ComboBox2: TComboBox
        Left = 144
        Top = 224
        Width = 122
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 9
        OnChange = ComboBox2Change
        Items.Strings = (
          'A'
          'B'
          'C'
          'D'
          'E')
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = #37319#36141#20449#24687
      object Label9: TLabel
        Left = 93
        Top = 15
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = #37319#36141#21592':'
      end
      object Label10: TLabel
        Left = 67
        Top = 43
        Width = 72
        Height = 13
        Alignment = taRightJustify
        Caption = #39318#36873#20379#24212#21830':'
      end
      object Label11: TLabel
        Left = 80
        Top = 70
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #37319#36141#21333#20301':'
      end
      object Label12: TLabel
        Left = 73
        Top = 97
        Width = 66
        Height = 13
        Alignment = taRightJustify
        Caption = #23384#36135'/'#37319#36141':'
      end
      object Label13: TLabel
        Left = 86
        Top = 126
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = #25439#32791#29575'%:'
      end
      object Label37: TLabel
        Left = 267
        Top = 15
        Width = 7
        Height = 13
      end
      object Label38: TLabel
        Left = 267
        Top = 44
        Width = 7
        Height = 13
      end
      object Label39: TLabel
        Left = 267
        Top = 70
        Width = 7
        Height = 13
      end
      object Label40: TLabel
        Left = 232
        Top = 97
        Width = 7
        Height = 13
      end
      object Label41: TLabel
        Left = 280
        Top = 97
        Width = 7
        Height = 13
      end
      object Label54: TLabel
        Left = 9
        Top = 208
        Width = 72
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#20379#24212#21830#20449#24687
      end
      object Edit3: TEdit
        Left = 144
        Top = 11
        Width = 78
        Height = 21
        Hint = #35201#24186#36755#20837#27491#30830#35201#24186#20026#31354'!'
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        MaxLength = 5
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = Edit3Click
        OnExit = Edit3Exit
      end
      object Edit4: TEdit
        Left = 144
        Top = 39
        Width = 78
        Height = 21
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        MaxLength = 5
        ParentFont = False
        TabOrder = 1
        OnClick = Edit4Click
        OnExit = Edit4Exit
      end
      object Edit5: TEdit
        Left = 144
        Top = 67
        Width = 78
        Height = 21
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = Edit5Click
        OnExit = Edit5Exit
      end
      object BitBtn5: TBitBtn
        Left = 229
        Top = 9
        Width = 25
        Height = 25
        TabOrder = 8
        TabStop = False
        OnClick = BitBtn5Click
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
      object BitBtn6: TBitBtn
        Left = 229
        Top = 38
        Width = 25
        Height = 25
        TabOrder = 9
        TabStop = False
        OnClick = BitBtn6Click
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
      object BitBtn7: TBitBtn
        Left = 229
        Top = 65
        Width = 25
        Height = 25
        TabOrder = 10
        TabStop = False
        OnClick = BitBtn7Click
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
      object DBCheckBox2: TDBCheckBox
        Left = 146
        Top = 149
        Width = 75
        Height = 17
        Caption = #20572#27490#37319#36141
        DataField = 'STOP_PURCH'
        DataSource = DM.DataSource1
        TabOrder = 4
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
      end
      object DBCheckBox3: TDBCheckBox
        Left = 146
        Top = 173
        Width = 117
        Height = 17
        Caption = #35201#27714#35748#21487#20379#24212#21830
        DataField = 'AVL_FLAG'
        DataSource = DM.DataSource1
        TabOrder = 5
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
      end
      object DBCheckBox4: TDBCheckBox
        Left = 394
        Top = 432
        Width = 81
        Height = 17
        Caption = #33258#21160#37319#36141
        DataField = 'AUTO_PURCHASE_FLAG'
        TabOrder = 6
        ValueChecked = '1'
        ValueUnchecked = '0'
        Visible = False
      end
      object DBEdit7: TDBEdit
        Left = 144
        Top = 94
        Width = 78
        Height = 21
        DataField = 'STOCK_PURCH'
        DataSource = DM.DataSource1
        TabOrder = 3
      end
      object DBEdit18: TDBEdit
        Left = 394
        Top = 403
        Width = 91
        Height = 21
        DataField = 'NEW_STD_COST'
        TabOrder = 7
        Visible = False
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 231
        Width = 580
        Height = 238
        Align = alBottom
        DataSource = DM.DataSource7
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 11
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CODE'
            Title.Caption = #20379#24212#21830#20195#30721
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUPPLIER_NAME'
            Title.Caption = #20379#24212#21830#21517#31216
            Width = 248
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUPPLIER_PART_NO'
            Title.Caption = #21697#29260
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LEAD_TIME'
            Title.Caption = #20132#26399#26102#38388'('#22825')'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRICE_1'
            Title.Caption = #21333#20215
            Width = 56
            Visible = True
          end>
      end
      object CheckBox1: TCheckBox
        Left = 145
        Top = 196
        Width = 156
        Height = 17
        Caption = #26159#21542#38656#35201#29615#20445#27979#35797#25253#21578
        TabOrder = 12
      end
      object DBEdit32: TDBEdit
        Left = 145
        Top = 121
        Width = 76
        Height = 21
        DataField = 'FAILURE_RATE'
        DataSource = DM.DataSource1
        TabOrder = 13
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = #23384#36135#20449#24687
      object Label14: TLabel
        Left = 51
        Top = 48
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#20648#23384#26041#27861':'
      end
      object Label16: TLabel
        Left = 39
        Top = 80
        Width = 92
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#23454#38469#30424#28857#26041#27861':'
      end
      object Label18: TLabel
        Left = 51
        Top = 139
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#20445#23384#26399#38480':'
      end
      object Label19: TLabel
        Left = 205
        Top = 137
        Width = 40
        Height = 13
        Caption = #22825#25968'  '
      end
      object Label20: TLabel
        Left = 51
        Top = 170
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#23384#36135#21333#20301':'
      end
      object Label21: TLabel
        Left = 37
        Top = 202
        Width = 94
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#23384#36135'/ '#37319#36141':'
      end
      object Label42: TLabel
        Left = 249
        Top = 169
        Width = 7
        Height = 13
      end
      object Label43: TLabel
        Left = 265
        Top = 201
        Width = 7
        Height = 13
      end
      object Label44: TLabel
        Left = 322
        Top = 201
        Width = 7
        Height = 13
      end
      object Label45: TLabel
        Left = 145
        Top = 80
        Width = 79
        Height = 13
        Alignment = taRightJustify
        Caption = '  '#25353#21608#26399#35745#25968
      end
      object Label15: TLabel
        Left = 51
        Top = 232
        Width = 80
        Height = 13
        Caption = '   '#26631#20934#25104#26412':'
      end
      object Label29: TLabel
        Left = 46
        Top = 262
        Width = 85
        Height = 13
        Alignment = taRightJustify
        Caption = #26631#20934#21333#20301#37325#37327':'
      end
      object Label51: TLabel
        Left = 46
        Top = 293
        Width = 85
        Height = 13
        Alignment = taRightJustify
        Caption = #26631#20934#21333#20301#38754#31215':'
      end
      object Label52: TLabel
        Left = 261
        Top = 264
        Width = 47
        Height = 13
        Caption = #21315#20811' KG'
      end
      object Label53: TLabel
        Left = 263
        Top = 290
        Width = 39
        Height = 13
        Caption = #24179#26041#31859
      end
      object Label32: TLabel
        Left = 71
        Top = 324
        Width = 59
        Height = 13
        Caption = #24403#21069#24211#23384':'
      end
      object Label50: TLabel
        Left = 73
        Top = 382
        Width = 65
        Height = 13
        Caption = #23433#20840#24211#23384#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label55: TLabel
        Left = 73
        Top = 409
        Width = 65
        Height = 13
        Caption = #20877#35746#36141#28857#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label30: TLabel
        Left = 248
        Top = 323
        Width = 72
        Height = 13
        Caption = #24050#20998#37197#24211#23384':'
      end
      object Label56: TLabel
        Left = 72
        Top = 352
        Width = 59
        Height = 13
        Caption = #26377#25928#24211#23384':'
      end
      object Label57: TLabel
        Left = 332
        Top = 168
        Width = 92
        Height = 13
        Caption = #26631#20934#20135#20986'('#24179#31859')'
      end
      object Label59: TLabel
        Left = 308
        Top = 383
        Width = 65
        Height = 13
        Caption = #26368#39640#24211#23384#65306
      end
      object Label60: TLabel
        Left = 306
        Top = 352
        Width = 59
        Height = 13
        Caption = #22312#36884#25968#37327':'
      end
      object Label61: TLabel
        Left = 312
        Top = 411
        Width = 54
        Height = 13
        Caption = 'VMI'#24211#23384':'
      end
      object Label62: TLabel
        Left = 264
        Top = 136
        Width = 35
        Height = 13
        Caption = '     '
      end
      object DBCheckBox5: TDBCheckBox
        Left = 142
        Top = 103
        Width = 57
        Height = 17
        Caption = #26816#39564
        DataField = 'INSPECT'
        DataSource = DM.DataSource1
        TabOrder = 1
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
      end
      object DBCheckBox6: TDBCheckBox
        Left = 310
        Top = 441
        Width = 112
        Height = 17
        Caption = #20801#35768#28151#21512#37096#20214
        DataField = 'MIX_PARTS'
        DataSource = DM.DataSource1
        TabOrder = 15
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
        Visible = False
      end
      object DBEdit10: TDBEdit
        Left = 141
        Top = 134
        Width = 57
        Height = 21
        DataField = 'SHELF_LIFE'
        DataSource = DM.DataSource1
        TabOrder = 2
      end
      object Edit6: TEdit
        Left = 141
        Top = 166
        Width = 78
        Height = 21
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = Edit6Click
        OnExit = Edit6Exit
      end
      object BitBtn8: TBitBtn
        Left = 220
        Top = 164
        Width = 25
        Height = 25
        TabOrder = 3
        TabStop = False
        OnClick = BitBtn8Click
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
      object DBEdit11: TDBEdit
        Left = 141
        Top = 198
        Width = 114
        Height = 21
        DataField = 'STOCK_PURCH'
        DataSource = DM.DataSource1
        TabOrder = 6
      end
      object ComboBox1: TComboBox
        Left = 141
        Top = 43
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 0
        Text = #24207#21495
        OnChange = ComboBox1Change
        Items.Strings = (
          #24207#21495
          #25209#27425
          #26080)
      end
      object DBEdit8: TDBEdit
        Left = 141
        Top = 228
        Width = 115
        Height = 21
        DataField = 'STD_COST'
        DataSource = DM.DataSource1
        TabOrder = 7
      end
      object DBEdit17: TDBEdit
        Left = 141
        Top = 258
        Width = 114
        Height = 21
        DataField = 'STOCK_BASE'
        DataSource = DM.DataSource1
        TabOrder = 8
      end
      object DBEdit22: TDBEdit
        Left = 141
        Top = 288
        Width = 114
        Height = 21
        DataField = 'STOCK_SELL'
        DataSource = DM.DataSource1
        TabOrder = 9
      end
      object DBEdit25: TDBEdit
        Left = 140
        Top = 378
        Width = 121
        Height = 21
        DataField = 'CONSIGN_ONHAND_QTY'
        DataSource = DM.DataSource1
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 13
      end
      object DBEdit26: TDBEdit
        Left = 140
        Top = 409
        Width = 121
        Height = 21
        DataField = 'CONSIGN_QTY_IN_INSP'
        DataSource = DM.DataSource1
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 14
      end
      object DBEdit23: TDBEdit
        Left = 141
        Top = 320
        Width = 89
        Height = 21
        Color = cl3DLight
        DataField = 'QUAN_ON_HAND'
        DataSource = DM.DataSource1
        ReadOnly = True
        TabOrder = 10
      end
      object DBEdit24: TDBEdit
        Left = 320
        Top = 320
        Width = 88
        Height = 21
        Color = cl3DLight
        DataField = 'QUAN_ASSIGN'
        DataSource = DM.DataSource1
        ReadOnly = True
        TabOrder = 11
      end
      object DBEdit27: TDBEdit
        Left = 142
        Top = 349
        Width = 87
        Height = 21
        Color = cl3DLight
        DataField = 'quan_alloc'
        DataSource = DM.DataSource1
        ReadOnly = True
        TabOrder = 12
      end
      object DBEdit28: TDBEdit
        Left = 423
        Top = 164
        Width = 94
        Height = 21
        DataField = 'REPORT_VALUE1'
        DataSource = DM.DataSource1
        TabOrder = 4
      end
      object DBEdit30: TDBEdit
        Left = 372
        Top = 379
        Width = 94
        Height = 21
        DataField = 'REPORT_VALUE2'
        DataSource = DM.DataSource1
        TabOrder = 16
      end
      object DBEdit31: TDBEdit
        Left = 371
        Top = 346
        Width = 95
        Height = 21
        DataField = 'zaitu'
        DataSource = DM.DataSource1
        TabOrder = 17
      end
      object DBEdit29: TDBEdit
        Left = 373
        Top = 408
        Width = 94
        Height = 21
        DataField = 'vmi_quantotal'
        DataSource = DM.DataSource1
        TabOrder = 18
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = #26367#20195#29289#26009
      object Label46: TLabel
        Left = 51
        Top = 256
        Width = 113
        Height = 13
        Alignment = taRightJustify
        Caption = '    '#26368#23569#24211#23384#25968#37327':'
        Visible = False
      end
      object Label47: TLabel
        Left = 51
        Top = 281
        Width = 113
        Height = 13
        Alignment = taRightJustify
        Caption = '    '#26368#22823#24211#23384#25968#37327':'
        Visible = False
      end
      object Label48: TLabel
        Left = 25
        Top = 307
        Width = 140
        Height = 14
        Alignment = taRightJustify
        Caption = '       '#20877#35746#36141#28857#24211#23384':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object TreeView2: TTreeView
        Left = 11
        Top = 23
        Width = 481
        Height = 217
        HideSelection = False
        Images = ImageList1
        Indent = 19
        PopupMenu = PopupMenu1
        ReadOnly = True
        RightClickSelect = True
        TabOrder = 0
        OnChange = TreeView2Change
      end
      object DBEdit19: TDBEdit
        Left = 168
        Top = 252
        Width = 121
        Height = 21
        DataField = 'min_stock'
        DataSource = DM.DataSource2
        TabOrder = 1
        Visible = False
      end
      object DBEdit20: TDBEdit
        Left = 168
        Top = 277
        Width = 121
        Height = 21
        DataField = 'max_stock'
        DataSource = DM.DataSource2
        TabOrder = 2
        Visible = False
      end
      object DBEdit21: TDBEdit
        Left = 168
        Top = 303
        Width = 121
        Height = 24
        DataField = 'reorder_point'
        DataSource = DM.DataSource2
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Visible = False
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = #35760#20107#26412
      object Label27: TLabel
        Left = 43
        Top = 48
        Width = 146
        Height = 13
        Alignment = taRightJustify
        Caption = '     '#35760#20107#26412#36164#26009#24211#25628#32034':'
      end
      object Memo1: TMemo
        Left = 6
        Top = 80
        Width = 489
        Height = 121
        TabOrder = 0
        OnChange = Memo1Change
      end
      object BitBtn9: TBitBtn
        Left = 193
        Top = 42
        Width = 25
        Height = 25
        TabOrder = 1
        OnClick = BitBtn9Click
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
    end
    object TPage
      Left = 0
      Top = 0
      Caption = #25104#26412#35745#31639
      object Label28: TLabel
        Left = 46
        Top = 24
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#24635#24080#24080#30446':'
        Visible = False
      end
      object Bevel1: TBevel
        Left = 24
        Top = 152
        Width = 457
        Height = 97
        Shape = bsFrame
      end
      object Label31: TLabel
        Left = 44
        Top = 195
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#26126#32454#24080#30446':'
      end
      object Label33: TLabel
        Left = 136
        Top = 48
        Width = 7
        Height = 13
      end
      object Label34: TLabel
        Left = 136
        Top = 224
        Width = 63
        Height = 13
        Caption = '         '
      end
      object Edit7: TEdit
        Left = 130
        Top = 21
        Width = 196
        Height = 21
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Visible = False
        OnClick = Edit7Click
        OnExit = Edit7Exit
      end
      object BitBtn10: TBitBtn
        Left = 331
        Top = 19
        Width = 25
        Height = 25
        TabOrder = 2
        TabStop = False
        Visible = False
        OnClick = BitBtn10Click
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
      object Edit8: TEdit
        Left = 130
        Top = 192
        Width = 196
        Height = 21
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Edit8Click
        OnExit = Edit8Exit
      end
      object BitBtn11: TBitBtn
        Left = 331
        Top = 189
        Width = 25
        Height = 25
        TabOrder = 3
        TabStop = False
        OnClick = BitBtn11Click
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
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'IES'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 580
        Height = 469
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object StringGrid1: TStringGrid
          Left = 65
          Top = 73
          Width = 434
          Height = 225
          ColCount = 4
          DefaultRowHeight = 19
          FixedCols = 2
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing]
          TabOrder = 0
          OnKeyPress = StringGrid1KeyPress
          OnSelectCell = StringGrid1SelectCell
          ColWidths = (
            79
            152
            146
            47)
          RowHeights = (
            19
            19)
        end
        object DBComboBox1: TDBComboBox
          Left = 299
          Top = 94
          Width = 150
          Height = 21
          DataField = 'IES_PARAMETER_VALUE1'
          DataSource = DM.DataSource1
          ItemHeight = 13
          TabOrder = 1
          Visible = False
        end
        object DBComboBox2: TDBComboBox
          Left = 299
          Top = 114
          Width = 150
          Height = 21
          DataField = 'IES_PARAMETER_VALUE2'
          DataSource = DM.DataSource1
          ItemHeight = 13
          TabOrder = 2
          Visible = False
        end
        object DBComboBox3: TDBComboBox
          Left = 299
          Top = 135
          Width = 150
          Height = 21
          DataField = 'IES_PARAMETER_VALUE3'
          DataSource = DM.DataSource1
          ItemHeight = 13
          TabOrder = 3
          Visible = False
        end
        object DBComboBox4: TDBComboBox
          Left = 299
          Top = 154
          Width = 150
          Height = 21
          DataField = 'IES_PARAMETER_VALUE4'
          DataSource = DM.DataSource1
          ItemHeight = 13
          TabOrder = 4
          Visible = False
        end
        object DBComboBox5: TDBComboBox
          Left = 299
          Top = 174
          Width = 150
          Height = 21
          DataField = 'IES_PARAMETER_VALUE5'
          DataSource = DM.DataSource1
          ItemHeight = 13
          TabOrder = 5
          Visible = False
        end
        object DBComboBox6: TDBComboBox
          Left = 299
          Top = 194
          Width = 150
          Height = 21
          DataField = 'IES_PARAMETER_VALUE6'
          DataSource = DM.DataSource1
          ItemHeight = 13
          TabOrder = 6
          Visible = False
        end
        object DBComboBox7: TDBComboBox
          Left = 299
          Top = 214
          Width = 150
          Height = 21
          DataField = 'IES_PARAMETER_VALUE7'
          DataSource = DM.DataSource1
          ItemHeight = 13
          TabOrder = 7
          Visible = False
        end
        object DBComboBox8: TDBComboBox
          Left = 299
          Top = 234
          Width = 150
          Height = 21
          DataField = 'IES_PARAMETER_VALUE8'
          DataSource = DM.DataSource1
          ItemHeight = 13
          TabOrder = 8
          Visible = False
        end
        object DBComboBox9: TDBComboBox
          Left = 299
          Top = 254
          Width = 150
          Height = 21
          DataField = 'IES_PARAMETER_VALUE9'
          DataSource = DM.DataSource1
          ItemHeight = 13
          TabOrder = 9
          Visible = False
        end
        object DBComboBox10: TDBComboBox
          Left = 299
          Top = 274
          Width = 150
          Height = 21
          DataField = 'IES_PARAMETER_VALUE10'
          DataSource = DM.DataSource1
          ItemHeight = 13
          TabOrder = 10
          Visible = False
        end
        object StringGrid2: TStringGrid
          Left = 36
          Top = 116
          Width = 469
          Height = 230
          ColCount = 8
          DefaultRowHeight = 19
          FixedCols = 2
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing]
          TabOrder = 11
          Visible = False
          OnDrawCell = StringGrid2DrawCell
          OnKeyPress = StringGrid2KeyPress
          ColWidths = (
            79
            152
            146
            47
            64
            64
            64
            64)
          RowHeights = (
            19
            19)
        end
        object ComboBox3: TComboBox
          Tag = 11
          Left = 270
          Top = 137
          Width = 150
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 12
          Visible = False
          OnChange = ComboBox3Change
          OnExit = ComboBox3Exit
        end
        object ComboBox4: TComboBox
          Tag = 12
          Left = 270
          Top = 157
          Width = 150
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 13
          Visible = False
          OnChange = ComboBox4Change
          OnExit = ComboBox4Exit
        end
        object ComboBox5: TComboBox
          Tag = 13
          Left = 270
          Top = 177
          Width = 150
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 14
          Visible = False
          OnChange = ComboBox5Change
          OnExit = ComboBox5Exit
        end
        object ComboBox6: TComboBox
          Tag = 14
          Left = 270
          Top = 197
          Width = 150
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 15
          Visible = False
          OnChange = ComboBox6Change
          OnExit = ComboBox6Exit
        end
        object ComboBox7: TComboBox
          Tag = 15
          Left = 270
          Top = 217
          Width = 150
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 16
          Visible = False
          OnChange = ComboBox7Change
          OnExit = ComboBox7Exit
        end
        object ComboBox8: TComboBox
          Tag = 16
          Left = 270
          Top = 237
          Width = 150
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 17
          Visible = False
          OnChange = ComboBox8Change
          OnExit = ComboBox8Exit
        end
        object ComboBox9: TComboBox
          Tag = 17
          Left = 270
          Top = 257
          Width = 150
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 18
          Visible = False
          OnChange = ComboBox9Change
          OnExit = ComboBox9Exit
        end
        object ComboBox10: TComboBox
          Tag = 18
          Left = 270
          Top = 278
          Width = 150
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 19
          Visible = False
          OnChange = ComboBox10Change
          OnExit = ComboBox10Exit
        end
        object ComboBox11: TComboBox
          Tag = 19
          Left = 270
          Top = 298
          Width = 150
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 20
          Visible = False
          OnChange = ComboBox11Change
          OnExit = ComboBox11Exit
        end
        object ComboBox12: TComboBox
          Tag = 20
          Left = 270
          Top = 318
          Width = 150
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 21
          Visible = False
          OnChange = ComboBox12Change
        end
        object ComboBox13: TComboBox
          Tag = 21
          Left = 462
          Top = 137
          Width = 60
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 22
          Visible = False
          OnChange = ComboBox3Change
          OnExit = ComboBox3Exit
        end
        object ComboBox14: TComboBox
          Tag = 22
          Left = 462
          Top = 157
          Width = 60
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 23
          Visible = False
          OnChange = ComboBox3Change
          OnExit = ComboBox4Exit
        end
        object ComboBox15: TComboBox
          Tag = 23
          Left = 462
          Top = 177
          Width = 60
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 24
          Visible = False
          OnChange = ComboBox3Change
          OnExit = ComboBox5Exit
        end
        object ComboBox16: TComboBox
          Tag = 24
          Left = 462
          Top = 197
          Width = 60
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 25
          Visible = False
          OnChange = ComboBox3Change
          OnExit = ComboBox6Exit
        end
        object ComboBox17: TComboBox
          Tag = 25
          Left = 462
          Top = 217
          Width = 60
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 26
          Visible = False
          OnChange = ComboBox3Change
          OnExit = ComboBox7Exit
        end
        object ComboBox18: TComboBox
          Tag = 26
          Left = 462
          Top = 237
          Width = 60
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 27
          Visible = False
          OnChange = ComboBox3Change
          OnExit = ComboBox8Exit
        end
        object ComboBox19: TComboBox
          Tag = 27
          Left = 462
          Top = 257
          Width = 60
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 28
          Visible = False
          OnChange = ComboBox3Change
          OnExit = ComboBox9Exit
        end
        object ComboBox20: TComboBox
          Tag = 28
          Left = 462
          Top = 278
          Width = 60
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 29
          Visible = False
          OnChange = ComboBox3Change
          OnExit = ComboBox10Exit
        end
        object ComboBox21: TComboBox
          Tag = 29
          Left = 462
          Top = 298
          Width = 60
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 30
          Visible = False
          OnChange = ComboBox3Change
          OnExit = ComboBox11Exit
        end
        object ComboBox22: TComboBox
          Tag = 30
          Left = 462
          Top = 318
          Width = 60
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 31
          Visible = False
          OnChange = ComboBox3Change
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = #20998#26512#20195#30721
      object Label22: TLabel
        Left = 68
        Top = 32
        Width = 74
        Height = 13
        Alignment = taRightJustify
        Caption = '    '#32784#28201#24615':'
      end
      object Label23: TLabel
        Left = 55
        Top = 60
        Width = 87
        Height = 13
        Alignment = taRightJustify
        Caption = '    '#20351#29992#23551#21629':'
      end
      object Label24: TLabel
        Left = 55
        Top = 88
        Width = 87
        Height = 13
        Alignment = taRightJustify
        Caption = '    '#21270#23398#24615#33021':'
      end
      object Label25: TLabel
        Left = 55
        Top = 116
        Width = 87
        Height = 13
        Alignment = taRightJustify
        Caption = '    '#29289#29702#24615#33021':'
      end
      object Label26: TLabel
        Left = 55
        Top = 144
        Width = 87
        Height = 13
        Alignment = taRightJustify
        Caption = '    '#20855#20307#20301#32622':'
      end
      object DBEdit12: TDBEdit
        Left = 152
        Top = 28
        Width = 224
        Height = 21
        DataField = 'ANALYSIS_CODE1'
        DataSource = DM.DataSource1
        TabOrder = 0
      end
      object DBEdit13: TDBEdit
        Left = 152
        Top = 58
        Width = 224
        Height = 21
        DataField = 'ANALYSIS_CODE2'
        DataSource = DM.DataSource1
        TabOrder = 1
      end
      object DBEdit14: TDBEdit
        Left = 152
        Top = 85
        Width = 224
        Height = 21
        DataField = 'ANALYSIS_CODE3'
        DataSource = DM.DataSource1
        TabOrder = 2
      end
      object DBEdit15: TDBEdit
        Left = 152
        Top = 112
        Width = 224
        Height = 21
        DataField = 'ANALYSIS_CODE4'
        DataSource = DM.DataSource1
        TabOrder = 3
      end
      object DBEdit16: TDBEdit
        Left = 152
        Top = 139
        Width = 224
        Height = 21
        DataField = 'ANALYSIS_CODE5'
        DataSource = DM.DataSource1
        TabOrder = 4
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 780
    Height = 48
    Align = alTop
    TabOrder = 4
    object Label1: TLabel
      Left = 77
      Top = 16
      Width = 80
      Height = 13
      Alignment = taRightJustify
      Caption = '   '#26448#26009#20195#21495':'
    end
    object Label2: TLabel
      Left = 286
      Top = 17
      Width = 105
      Height = 13
      Alignment = taRightJustify
      Caption = ' '#26448#26009#21517#31216#21450#35268#26684':'
    end
    object BtnSave: TBitBtn
      Left = 16
      Top = 12
      Width = 26
      Height = 26
      Cursor = crHandPoint
      Hint = #20445#23384
      DragCursor = crHandPoint
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = False
      OnClick = BtnSaveClick
      Glyph.Data = {
        56070000424D5607000000000000360400002800000028000000140000000100
        0800000000002003000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
        0303030303030303030303030303030303030303030303030303030303030303
        0303030303030303030303030303030303030303030303030303030303030303
        0303030303030303030303030303030303030303030303030303030303030303
        030303FFFFFFFFFFFFFFFFFFFFFFFF030303030303F800000000000000000000
        0000F803030303030303F8F8F8F8F8F8F8F8F8F8F8F803FF030303030300FCFC
        00F8FCFCFF070700FCFC00030303030303F8FF03F8FF0303030303F8FF03F8FF
        030303030300FCFC00F8FCFCFF070700FCFC00030303030303F8FF03F8FF0303
        030303F8FF03F8FF030303030300FCFC0007F8F807070700FCFC000303030303
        03F8FF03F8FFFFFFFFFFFFF80303F8FF030303030300FCFC0600000000000006
        FCFC00030303030303F8FF0303F8F8F8F8F8F8030303F8FF030303030300FCFC
        FCFCFCFCFCFCFCFCFCFC00030303030303F8FF0303FFFFFFFFFFFFFFFF03F8FF
        030303030300FC06000000000000000006FC00030303030303F8FF03F8F8F8F8
        F8F8F8F803FFF8FF030303030300FC00FFFFFFFFFFFFFFFF00FC000303030303
        03F8FFF8FF03030303030303F8FFF8FF030303030300FC00FFFFFFFFFFFFFFFF
        00FC00030303030303F8FFF8FF03030303030303F8FFF8FF030303030300FC00
        FFFFFFFFFFFFFFFF00FC00030303030303F8FFF8FF03030303030303F8FFF8FF
        030303030300FC00FFFFFFFFFFFFFFFF00FC00030303030303F8FFF8FF030303
        03030303F8FFF8FF0303030303000000FFFFFFFFFFFFFFFF0000000303030303
        03F8FFF8FF03030303030303F8FFF8FF030303030300FC00FFFFFFFFFFFFFFFF
        00FC00030303030303F8FFF8FFFFFFFFFFFFFFFFF8FFF8030303030303F80000
        00000000000000000000F803030303030303F8F8F8F8F8F8F8F8F8F8F8F80303
        0303030303030303030303030303030303030303030303030303030303030303
        0303030303030303030303030303030303030303030303030303030303030303
        0303030303030303030303030303030303030303030303030303030303030303
        0303030303030303030303030303030303030303030303030303}
      NumGlyphs = 2
    end
    object BtnCanel: TBitBtn
      Left = 46
      Top = 12
      Width = 26
      Height = 26
      Cursor = crHandPoint
      Hint = #21462#28040
      DragCursor = crHandPoint
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = False
      OnClick = BtnCanelClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333FFFFF333333000033333388888833333333333F888888FFF333
        000033338811111188333333338833FFF388FF33000033381119999111833333
        38F338888F338FF30000339119933331111833338F388333383338F300003391
        13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
        33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
        33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
        000039183811193333918338F8F833F83333838F000039118111933339118338
        F3833F83333833830000339111193333391833338F33F8333FF838F300003391
        11833338111833338F338FFFF883F83300003339111888811183333338FF3888
        83FF83330000333399111111993333333388FFFFFF8833330000333333999999
        3333333333338888883333330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object DBEdit1: TDBEdit
      Left = 160
      Top = 12
      Width = 127
      Height = 21
      TabStop = False
      Color = cl3DLight
      DataField = 'INV_PART_NUMBER'
      DataSource = DM.DataSource1
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit2: TDBEdit
      Left = 349
      Top = 13
      Width = 292
      Height = 21
      TabStop = False
      Color = cl3DLight
      DataField = 'INV_PART_DESCRIPTION'
      DataSource = DM.DataSource1
      ReadOnly = True
      TabOrder = 3
    end
  end
  object ImageList1: TImageList
    Left = 112
    Top = 344
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000634A3100C69C6300AD8C4A005A4A1800392910000000
      0000000000000000000000000000000000000000000052BDDE00108CB5003173
      84005A5A5A007B7B7B007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C7B5200CE9C6B00E7DECE00C69C6300AD8C4A009C7B39005A4221002929
      1000000000000000000000000000000000000000000039B5E7007BDEFF0073DE
      FF0073DEFF004AC6EF0010A5D600297B9400525A63007B7B7B007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E7DECE000000000094735200C69C6300AD8C4A009C7B3900735A21005239
      1000000000000000000000000000000000000000000084D6FF00D6F7FF007BE7
      FF007BE7FF007BE7FF007BE7FF007BE7FF007BE7FF0063D6F70021B5DE00396B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CEA5
      730094735200C69C6300C69C6300C69C6300AD8C4A009C7B3900846329006B52
      290052391000000000000000000000000000000000007BD6FF00BDE7F70084EF
      FF0084EFFF0084EFFF0084EFFF0084EFFF0084EFFF0084EFFF0084EFFF0039BD
      DE007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6B58C00CEA5
      7300C69C6B00C69C6300C69C6300C69C6300AD8C4A009C7B3900846B3100735A
      21005A422100000000000000000000000000000000008CD6FF0039B5E70094F7
      FF0094F7FF0094F7FF0094F7FF0094F7FF008CD6EF0084DEFF0094F7FF00B5FF
      FF004A636B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6B58C00CEAD
      8400CEA57300C69C6B00C69C6300C69C6300AD8C4A009C7B3900846B31007B5A
      2900634A2100423110000000000000000000000000008CD6FF0052C6FF00DEFF
      FF009CFFFF009CFFFF009CFFFF008CE7FF00FFD6A500FFCE9C0094F7FF00CEFF
      FF0021ADD6007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6BD9C00D6B5
      8C00CEAD8400CEA57300C69C6B00B58C4A00000000000000000042311000846B
      3100735A31005239100000000000000000000000000094DEFF006BD6FF0052BD
      DE00DEF7FF00EFFFFF00CEFFFF00FFDEAD00FFE7AD00FFE7B500FFD6A500DEFF
      FF00DEFFFF00525A630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD8C5200DEC6A500D6BD
      9C00D6B58C00AD8C520000000000A59C9C00A5A5B500A5A5AD009C948C000000
      000042311000524221000000000000000000000000009CE7FF0084E7FF0084E7
      FF0084E7FF0073D6FF00C6BD9C00CEEFF700FFE7BD00FFF7BD00FFF7C600FFDE
      BD00EFFFFF001894C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7DECE00DECEB500AD8C
      5200000000009C9C9C0094949400CECECE00A5A59C00A5A5A500F7F7F7009C9C
      9400949C940000000000423110000000000000000000A5F7FF0094FFFF0094FF
      FF0084EFFF00EFB58C00FFDEB500FFD6A5009CBDB50063B5C60063BDDE00ADDE
      F700FFFFFF00EFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD8C5200000000009494
      9C009C9C9400CECECE007B7B7B0094949400A59C9C009C9C9C00A59CA5009C9C
      9C00F7F7F70094948C00949494000000000000000000B5FFFF009CFFFF0094FF
      FF00DEAD8C00FFDEBD00FFD6A500FFD6A500FFCE9C00FFCE9C00FFCE9C00FFEF
      D600FFCE9C006363630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5A5A5009CA59C00C6CE
      C60073737300737373007B7B7B0094949400A59C9C009C9C9C00A59CA500A5A5
      A500A59CA500A59CA500A5ADA5000000000000000000B5E7F700B5FFFF00DEAD
      8C00FFEFD600FFEFDE00FFCE9C00FFCE9C00FFCE9C00FFD6A500FFD6AD00FFEF
      DE00DEBDA5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7F7F700737373007373
      730073737300737373007B7B7B0094949400A59C9C009C9C9C00A59CA5009C9C
      9C00EFF7F7000000000000000000000000000000000000000000ADDEF700C6D6
      D600FFF7EF00FFF7EF00FFF7EF00FFD6A500FFD6AD00FFD6AD00FFE7C600F7DE
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFF7F7007373
      730073737300737373007B7B7B0094949400A59C9C00A5A5A500F7EFEF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EFCEAD00FFFFF700FFFFF700FFFFF700FFDEB500FFE7C600FFF7EF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EFF7F700737373007B7B7B0094949400F7EFEF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F7DEC600FFFFFF00FFF7EF00FFF7EF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFEFDE00FFBD6300FFDEB50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FC3FFFFF00000000F00F81FF00000000
      E007801F00000000C007800F00000000C003800700000000C003800700000000
      8003800300000000800180030000000080018001000000008001800100000000
      000080030000000000008007000000000001C00F000000008007F01F00000000
      E01FF83F00000000F87FFC7F0000000000000000000000000000000000000000
      000000000000}
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 144
    Top = 344
    object N1: TMenuItem
      Caption = #28155#21152
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21024#38500
      OnClick = N2Click
    end
  end
end
