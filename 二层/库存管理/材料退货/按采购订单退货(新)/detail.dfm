object fm_detail: Tfm_detail
  Left = 272
  Top = 189
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #36864#36135#32473#20379#24212#21830'('#24102#37319#36141#21333#30340#29983#20135#29289#26009')--'#26126#32454
  ClientHeight = 355
  ClientWidth = 653
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 19
    Top = 39
    Width = 65
    Height = 13
    Alignment = taRightJustify
    Caption = #37319#36141#35746#21333#65306
  end
  object Label7: TLabel
    Left = 176
    Top = 39
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #37319#36141#26085#26399':'
  end
  object Label1: TLabel
    Left = 45
    Top = 92
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = #24037#21378#65306
  end
  object Label2: TLabel
    Left = 32
    Top = 119
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = #20379#24212#21830#65306
  end
  object Label9: TLabel
    Left = 19
    Top = 159
    Width = 65
    Height = 13
    Alignment = taRightJustify
    Caption = #20837#24211#24635#25968#65306
  end
  object Label10: TLabel
    Left = 19
    Top = 65
    Width = 65
    Height = 13
    Alignment = taRightJustify
    Caption = #26448#26009#32534#30721#65306
  end
  object Label3: TLabel
    Left = 176
    Top = 159
    Width = 65
    Height = 13
    Alignment = taRightJustify
    Caption = #36864#36135#25968#37327#65306
  end
  object Label8: TLabel
    Left = 337
    Top = 159
    Width = 78
    Height = 13
    Alignment = taRightJustify
    Caption = #24453#35013#36816#25968#37327#65306
  end
  object Label12: TLabel
    Left = 507
    Top = 159
    Width = 65
    Height = 13
    Alignment = taRightJustify
    Caption = #22312#24211#25968#37327#65306
  end
  object Label13: TLabel
    Left = 465
    Top = 39
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #30830#35748#29992#25143':'
  end
  object DBText1: TDBText
    Left = 251
    Top = 65
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'INV_part_description'
    DataSource = dm.DS22
  end
  object DBText2: TDBText
    Left = 176
    Top = 92
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'abbr_name'
    DataSource = dm.DS22
  end
  object DBText3: TDBText
    Left = 176
    Top = 119
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'SUPPLIER_NAME'
    DataSource = dm.DS22
  end
  object DBEdit1: TDBEdit
    Left = 80
    Top = 35
    Width = 81
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'po_number'
    DataSource = dm.DS22
    ReadOnly = True
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 251
    Top = 35
    Width = 153
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'po_date'
    DataSource = dm.DS22
    ReadOnly = True
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 528
    Top = 35
    Width = 121
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'confirmation_number'
    DataSource = dm.DS22
    ReadOnly = True
    TabOrder = 3
  end
  object DBEdit4: TDBEdit
    Left = 80
    Top = 61
    Width = 163
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'inv_part_number'
    DataSource = dm.DS22
    ReadOnly = True
    TabOrder = 4
  end
  object DBEdit5: TDBEdit
    Left = 80
    Top = 88
    Width = 81
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'warehouse_code'
    DataSource = dm.DS22
    ReadOnly = True
    TabOrder = 5
  end
  object DBEdit6: TDBEdit
    Left = 80
    Top = 115
    Width = 81
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'CODE'
    DataSource = dm.DS22
    ReadOnly = True
    TabOrder = 6
  end
  object DBEdit8: TDBEdit
    Left = 80
    Top = 155
    Width = 81
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'quantity'
    DataSource = dm.DSQ22
    ReadOnly = True
    TabOrder = 7
  end
  object DBEdit9: TDBEdit
    Left = 238
    Top = 155
    Width = 81
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'QUAN_RETURNED'
    DataSource = dm.DSQ22
    ReadOnly = True
    TabOrder = 8
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 184
    Width = 652
    Height = 169
    DataSource = dm.DS96
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PM1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'employee_name'
        Footers = <>
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'tdate'
        Footers = <>
        Width = 140
      end
      item
        EditButtons = <>
        FieldName = 'reject_description'
        Footers = <>
        Width = 130
      end
      item
        EditButtons = <>
        FieldName = 'ttype'
        Footers = <>
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'v_status'
        Footers = <>
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'quan_rejd'
        Footers = <>
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'reference_number'
        Footers = <>
        Width = 100
      end>
  end
  object DBEdit10: TDBEdit
    Left = 410
    Top = 155
    Width = 81
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'quan_to_be_shipped'
    DataSource = dm.DSQ22
    ReadOnly = True
    TabOrder = 9
  end
  object DBEdit11: TDBEdit
    Left = 568
    Top = 155
    Width = 81
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'quan_on_hand'
    DataSource = dm.DSQ22
    ReadOnly = True
    TabOrder = 10
  end
  object BitBtn1: TBitBtn
    Left = 4
    Top = 3
    Width = 29
    Height = 28
    Hint = #36864#20986
    ModalResult = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    TabStop = False
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
  object PM1: TPopupMenu
    OnPopup = PM1Popup
    Left = 24
    Top = 224
    object N1: TMenuItem
      Caption = #26032#22686#36864#36135'(&A)'
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21024#38500'(&D)'
      OnClick = N2Click
    end
  end
end
