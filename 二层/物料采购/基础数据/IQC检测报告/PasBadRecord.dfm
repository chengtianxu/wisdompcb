object frmBadRecord: TfrmBadRecord
  Left = 408
  Top = 152
  Width = 918
  Height = 581
  Caption = #19981#33391#29289#26009#29366#20917#30331#35760#34920
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
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 902
    Height = 41
    Align = alTop
    TabOrder = 0
    object lbl1: TLabel
      Left = 280
      Top = 16
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'lbl1'
    end
    object lbl2: TLabel
      Left = 636
      Top = 15
      Width = 13
      Height = 13
      Caption = #33267
    end
    object lbl3: TLabel
      Left = 469
      Top = 16
      Width = 65
      Height = 13
      Caption = #21457#29983#26085#26399#65306
    end
    object btnClose: TBitBtn
      Left = 0
      Top = 4
      Width = 75
      Height = 33
      Caption = #20851#38381
      ModalResult = 2
      TabOrder = 0
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
    object btnRefresh: TBitBtn
      Left = 75
      Top = 4
      Width = 75
      Height = 33
      Caption = #21047#26032
      TabOrder = 1
      OnClick = btnRefreshClick
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
    object btnExport: TBitBtn
      Left = 150
      Top = 4
      Width = 75
      Height = 33
      Caption = #23548#20986
      TabOrder = 2
      OnClick = btnExportClick
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
    object edtFilter: TEdit
      Left = 317
      Top = 12
      Width = 121
      Height = 21
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 3
      OnChange = edtFilterChange
    end
    object dtp1: TDateTimePicker
      Left = 536
      Top = 12
      Width = 97
      Height = 21
      Date = 42780.000000000000000000
      Time = 42780.000000000000000000
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 4
      OnChange = dtp1Change
    end
    object dtp2: TDateTimePicker
      Left = 652
      Top = 11
      Width = 97
      Height = 21
      Date = 42780.000000000000000000
      Time = 42780.000000000000000000
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 5
      OnChange = dtp1Change
    end
    object chk1: TCheckBox
      Left = 800
      Top = 16
      Width = 97
      Height = 17
      Caption = #26174#31034#25152#26377#35760#24405
      TabOrder = 6
      OnClick = chk1Click
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 41
    Width = 902
    Height = 502
    Align = alClient
    TabOrder = 1
    object ehBadRecord: TDBGridEh
      Left = 1
      Top = 1
      Width = 900
      Height = 500
      Align = alClient
      DataSource = DM.dsBadRecord
      FooterColor = clWindow
      FooterFont.Charset = ANSI_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
      PopupMenu = pmBadRecord
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDrawColumnCell = ehBadRecordDrawColumnCell
      OnKeyDown = ehBadRecordKeyDown
      OnTitleClick = ehBadRecordTitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'CODE'
          Footers = <>
          Title.Color = clRed
          Title.SortIndex = 1
          Title.SortMarker = smUpEh
        end
        item
          EditButtons = <>
          FieldName = 'abbr_name'
          Footers = <>
          Width = 92
        end
        item
          EditButtons = <>
          FieldName = 'INV_PART_NUMBER'
          Footers = <>
          Width = 86
        end
        item
          EditButtons = <>
          FieldName = 'INV_PART_DESCRIPTION'
          Footers = <>
          Width = 159
        end
        item
          EditButtons = <>
          FieldName = 'DiscoverDate'
          Footers = <>
          Width = 74
        end
        item
          EditButtons = <>
          FieldName = 'BatchNO'
          Footers = <>
          Width = 89
        end
        item
          EditButtons = <>
          FieldName = 'BadQuantity'
          Footers = <>
          Title.Caption = #19981#33391#25968#37327#19981#33391#29575'%'
          Width = 111
        end
        item
          EditButtons = <>
          FieldName = 'BadRemark'
          Footers = <>
          Width = 102
        end
        item
          EditButtons = <>
          FieldName = 'Result'
          Footers = <>
          Width = 121
        end
        item
          EditButtons = <>
          FieldName = 'IsReport'
          Footers = <>
          Width = 75
        end
        item
          EditButtons = <>
          FieldName = 'IsClose'
          Footers = <>
          Width = 58
        end
        item
          EditButtons = <>
          FieldName = 'ModiDate'
          Footers = <>
          Width = 89
        end
        item
          EditButtons = <>
          FieldName = 'USER_FULL_NAME'
          Footers = <>
          Width = 78
        end
        item
          EditButtons = <>
          FieldName = 'str_status'
          Footers = <>
          Width = 55
        end>
    end
  end
  object pmBadRecord: TPopupMenu
    OnPopup = pmBadRecordPopup
    Left = 408
    Top = 113
    object NAdd: TMenuItem
      Caption = #26032#22686
      OnClick = NAddClick
    end
    object NEdit: TMenuItem
      Caption = #32534#36753
      OnClick = NEditClick
    end
    object NCheck: TMenuItem
      Caption = #26816#26597
      OnClick = NCheckClick
    end
    object NDelete: TMenuItem
      Caption = #21024#38500
      OnClick = NDeleteClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object NEnd: TMenuItem
      Caption = #23436#25104#35760#24405
      OnClick = NEndClick
    end
  end
end
