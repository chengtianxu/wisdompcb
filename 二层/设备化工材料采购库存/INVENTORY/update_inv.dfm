object Form2: TForm2
  Left = 216
  Top = 188
  Width = 791
  Height = 430
  Caption = #26448#26009#39033#30446
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
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Bar1: TStatusBar
    Left = 0
    Top = 384
    Width = 783
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 47
    Width = 492
    Height = 337
    Align = alClient
    DataSource = DM.DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Width = 159
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Width = 234
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 783
    Height = 47
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      783
      47)
    object Label7: TLabel
      Left = 35
      Top = 5
      Width = 58
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #26448#26009#31867#22411
    end
    object Label8: TLabel
      Left = 277
      Top = 6
      Width = 7
      Height = 13
    end
    object Label12: TLabel
      Left = 27
      Top = 29
      Width = 66
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #29289#26009#32534#30721
    end
    object BitBtn1: TBitBtn
      Left = 701
      Top = 4
      Width = 71
      Height = 30
      Cursor = crHandPoint
      Hint = #36864#20986
      Anchors = [akTop, akRight]
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
    object BitBtn2: TBitBtn
      Left = 626
      Top = 4
      Width = 71
      Height = 30
      Anchors = [akTop, akRight]
      Caption = #23548#20986#25968#25454
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn5: TBitBtn
      Left = 233
      Top = 1
      Width = 36
      Height = 24
      TabOrder = 2
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
    object Edit1: TEdit
      Left = 99
      Top = 1
      Width = 131
      Height = 21
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = Edit1Click
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object Edit2: TEdit
      Left = 99
      Top = 25
      Width = 131
      Height = 21
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = Edit2Click
      OnExit = Edit2Exit
      OnKeyDown = Edit2KeyDown
    end
    object BitBtn3: TBitBtn
      Left = 233
      Top = 24
      Width = 36
      Height = 24
      TabOrder = 5
      TabStop = False
      OnClick = BitBtn3Click
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
  object Panel2: TPanel
    Left = 492
    Top = 47
    Width = 291
    Height = 337
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 3
    object Label1: TLabel
      Left = -3
      Top = 30
      Width = 80
      Height = 13
      Alignment = taRightJustify
      Caption = '   '#29289#26009#32534#30721':'
    end
    object Label2: TLabel
      Left = 11
      Top = 56
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = ' '#29289#26009#21517#31216':'
    end
    object Label3: TLabel
      Left = -2
      Top = 148
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = ' '#21046#36896#21830#20195#30721':'
    end
    object Label4: TLabel
      Left = 18
      Top = 172
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = #29305#21035#35201#27714':'
    end
    object Label5: TLabel
      Left = 11
      Top = 199
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = ' '#26448#26009#31867#22411':'
    end
    object DBText1: TDBText
      Left = 185
      Top = 194
      Width = 65
      Height = 17
      DataField = 'group_desc'
      DataSource = DM.DataSource5
    end
    object Label6: TLabel
      Left = 11
      Top = 221
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = ' '#26448#26009#32452#21035':'
    end
    object DBText2: TDBText
      Left = 186
      Top = 219
      Width = 65
      Height = 17
      DataField = 'inv_group_desc'
      DataSource = DM.DataSource5
    end
    object Label9: TLabel
      Left = 11
      Top = 80
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = ' '#29289#26009#35268#26684':'
    end
    object Label10: TLabel
      Left = 18
      Top = 245
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = #35831#36141#21333#20301':'
    end
    object Label11: TLabel
      Left = 4
      Top = 270
      Width = 73
      Height = 13
      Alignment = taRightJustify
      Caption = '  '#37319#36141#21333#20301':'
    end
    object DBText3: TDBText
      Left = 186
      Top = 243
      Width = 49
      Height = 13
      AutoSize = True
      DataField = 'UNIT_NAME'
      DataSource = DM.DataSource6
    end
    object DBText4: TDBText
      Left = 185
      Top = 267
      Width = 49
      Height = 13
      AutoSize = True
      DataField = 'Expr2'
      DataSource = DM.DataSource6
    end
    object DBEdit1: TDBEdit
      Left = 85
      Top = 28
      Width = 201
      Height = 21
      Color = cl3DLight
      DataField = 'INV_PART_NUMBER'
      DataSource = DM.DataSource1
      Font.Charset = GB2312_CHARSET
      Font.Color = clMenuText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 85
      Top = 51
      Width = 201
      Height = 21
      Color = cl3DLight
      DataField = 'INV_NAME'
      DataSource = DM.DataSource1
      Font.Charset = GB2312_CHARSET
      Font.Color = clMenuText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 85
      Top = 144
      Width = 201
      Height = 21
      Color = cl3DLight
      DataField = 'MANUFACTURER_CODE'
      DataSource = DM.DataSource1
      Font.Charset = GB2312_CHARSET
      Font.Color = clMenuText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 85
      Top = 168
      Width = 201
      Height = 21
      Color = cl3DLight
      DataField = 'MANUFACTURER_NAME'
      DataSource = DM.DataSource1
      Font.Charset = GB2312_CHARSET
      Font.Color = clMenuText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 85
      Top = 193
      Width = 90
      Height = 21
      TabStop = False
      Color = cl3DLight
      DataField = 'group_name'
      DataSource = DM.DataSource5
      ReadOnly = True
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 85
      Top = 218
      Width = 91
      Height = 21
      TabStop = False
      Color = cl3DLight
      DataField = 'inv_group_name'
      DataSource = DM.DataSource5
      ReadOnly = True
      TabOrder = 5
    end
    object DBMemo1: TDBMemo
      Left = 85
      Top = 76
      Width = 201
      Height = 64
      Color = cl3DLight
      DataField = 'INV_DESCRIPTION'
      DataSource = DM.DataSource1
      ReadOnly = True
      TabOrder = 6
    end
    object DBEdit7: TDBEdit
      Left = 85
      Top = 240
      Width = 91
      Height = 21
      Color = cl3DLight
      DataField = 'UNIT_CODE'
      DataSource = DM.DataSource6
      ReadOnly = True
      TabOrder = 7
    end
    object DBEdit8: TDBEdit
      Left = 84
      Top = 264
      Width = 92
      Height = 21
      Color = cl3DLight
      DataField = 'Expr1'
      DataSource = DM.DataSource6
      ReadOnly = True
      TabOrder = 8
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 360
    Top = 65535
    object N1: TMenuItem
      Caption = #26032#24314
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #32534#36753
      OnClick = N2Click
    end
    object N11: TMenuItem
      Caption = #26816#26597
      OnClick = N11Click
    end
    object N3: TMenuItem
      Caption = #22797#21046
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #21024#38500
      OnClick = N4Click
    end
    object N10: TMenuItem
      Caption = #26448#26009#39033#30446#21464#26356#35760#24405
      OnClick = N10Click
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
