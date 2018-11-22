object frmPOSel: TfrmPOSel
  Left = 199
  Top = 129
  Width = 1219
  Height = 731
  Caption = #36873#25321#35746#21333#26126#32454
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1203
    Height = 41
    Align = alTop
    TabOrder = 0
    object lbFilter: TLabel
      Left = 306
      Top = 14
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'lbFilter'
    end
    object btnCommit: TBitBtn
      Left = 2
      Top = 4
      Width = 73
      Height = 33
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
      OnClick = dbPODblClick
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777700007777777777777777777700007777700777777777777700007777
        0990777777777777000077709999077777777777000077799999907777777777
        00007709999999077777777700007799999999907777777700007799997B9999
        07777777000077999977B99990777777000077B999777B99990777770000777B
        997777B99990777700007777BB77777B999907770000777777777777B9999077
        00007777777777777B999977000077777777777777B999770000777777777777
        777B997700007777777777777777777700007777777777777777777700007777
        77777777777777770000}
    end
    object btnCancel: TBitBtn
      Left = 76
      Top = 4
      Width = 73
      Height = 33
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
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
    object edtFilter: TEdit
      Left = 376
      Top = 10
      Width = 121
      Height = 21
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 2
      OnChange = edtFilterChange
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 1203
    Height = 652
    Align = alClient
    TabOrder = 1
    object dbPO: TDBGridEh
      Left = 1
      Top = 1
      Width = 1201
      Height = 650
      Align = alClient
      DataSource = DM.DataSource4
      FooterColor = clWindow
      FooterFont.Charset = ANSI_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDblClick = dbPODblClick
      OnKeyDown = dbPOKeyDown
      OnTitleClick = dbPOTitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'PO_NUMBER'
          Footers = <>
          Title.Color = clRed
          Title.SortIndex = 1
          Title.SortMarker = smUpEh
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'INV_PART_NUMBER'
          Footers = <>
          Width = 146
        end
        item
          EditButtons = <>
          FieldName = 'INV_NAME'
          Footers = <>
          Width = 139
        end
        item
          EditButtons = <>
          FieldName = 'INV_DESCRIPTION'
          Footers = <>
          Width = 232
        end
        item
          EditButtons = <>
          FieldName = 'extra_req'
          Footers = <>
          Width = 107
        end
        item
          EditButtons = <>
          FieldName = 'UNIT_NAME'
          Footers = <>
          Width = 45
        end
        item
          EditButtons = <>
          FieldName = 'QUAN_ORD'
          Footers = <>
          Width = 63
        end
        item
          EditButtons = <>
          FieldName = 'NotCheck'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'purchase_name'
          Footers = <>
          Width = 65
        end
        item
          EditButtons = <>
          FieldName = 'CODE'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'ABBR_NAME'
          Footers = <>
          Width = 108
        end
        item
          EditButtons = <>
          FieldName = 'REQ_DATE'
          Footers = <>
          Width = 75
        end
        item
          EditButtons = <>
          FieldName = 'SGS_NO'
          Footers = <>
          Width = 106
        end
        item
          EditButtons = <>
          FieldName = 'TestDate'
          Footers = <>
          Width = 79
        end
        item
          EditButtons = <>
          FieldName = 'halogen_cn'
          Footers = <>
          Width = 45
        end
        item
          EditButtons = <>
          FieldName = 'HaTong'
          Footers = <>
          Width = 67
        end
        item
          EditButtons = <>
          FieldName = 'CAP'
          Footers = <>
          Width = 42
        end
        item
          EditButtons = <>
          FieldName = 'rohs'
          Footers = <>
          Width = 40
        end
        item
          EditButtons = <>
          FieldName = 'imp'
          Footers = <>
          Width = 36
        end
        item
          EditButtons = <>
          FieldName = 'murgency'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'hourwork'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'IES_PARAMETER_VALUE2'
          Footers = <>
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'IES_PARAMETER_VALUE3'
          Footers = <>
          Width = 68
        end
        item
          EditButtons = <>
          FieldName = 'IES_PARAMETER_VALUE4'
          Footers = <>
          Width = 60
        end>
    end
  end
end
