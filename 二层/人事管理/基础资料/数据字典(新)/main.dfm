object frm_main: Tfrm_main
  Left = 582
  Top = 83
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25968#25454#23383#20856
  ClientHeight = 490
  ClientWidth = 548
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
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 548
    Height = 41
    Align = alTop
    TabOrder = 0
    object lblColumn: TLabel
      Left = 251
      Top = 14
      Width = 7
      Height = 13
    end
    object Label1: TLabel
      Left = 207
      Top = 13
      Width = 59
      Height = 13
      AutoSize = False
      Caption = #31867#22411#21517#31216' '
    end
    object Label2: TLabel
      Left = 199
      Top = 13
      Width = 88
      Height = 13
      AutoSize = False
      Caption = #31867#21035#26126#32454#21517#31216
      Visible = False
    end
    object btnExit: TBitBtn
      Left = 5
      Top = 5
      Width = 57
      Height = 30
      Caption = #36864#20986
      TabOrder = 1
      OnClick = btnExitClick
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
      Left = 63
      Top = 5
      Width = 57
      Height = 30
      Caption = #21047#26032
      TabOrder = 2
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
      Left = 120
      Top = 5
      Width = 57
      Height = 30
      Caption = #23548#20986
      TabOrder = 3
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
    object Edit1: TEdit
      Left = 287
      Top = 11
      Width = 110
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 41
    Width = 548
    Height = 449
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = '   '#25968#25454#31867#21035'   '
      object Grd1: TDBGridEh
        Left = 0
        Top = 0
        Width = 540
        Height = 421
        Align = alClient
        DataSource = DM.DataSource1
        FooterColor = clWindow
        FooterFont.Charset = ANSI_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnKeyDown = Grd1KeyDown
        OnTitleClick = Grd1TitleClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'item'
            Footers = <>
            Title.Caption = #31867#22411#21517#31216
            Title.Color = clRed
            Title.SortIndex = 1
            Title.SortMarker = smUpEh
            Width = 87
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = '   '#31867#21035#26126#32454'   '
      ImageIndex = 1
      object Grd2: TDBGridEh
        Left = 0
        Top = 0
        Width = 540
        Height = 421
        Align = alClient
        DataSource = DM.DataSource2
        FooterColor = clWindow
        FooterFont.Charset = ANSI_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = PopupMenu1
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnKeyDown = Grd2KeyDown
        OnTitleClick = Grd2TitleClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'item'
            Footers = <>
            Title.Caption = #31867#21035#26126#32454#21517#31216
            Title.Color = clRed
            Title.SortIndex = 1
            Title.SortMarker = smUpEh
            Width = 135
          end
          item
            EditButtons = <>
            FieldName = 'memo'
            Footers = <>
            Title.Caption = #35828#26126
            Width = 124
          end
          item
            EditButtons = <>
            FieldName = 'train_flag'
            Footers = <>
            Title.Caption = #20851#32852#22521#35757
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'user_defined1'
            Footers = <>
            Width = 117
          end
          item
            EditButtons = <>
            FieldName = 'user_defined2'
            Footers = <>
            Width = 143
          end>
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 156
    Top = 209
    object N1: TMenuItem
      Caption = #26032#22686
      OnClick = N1Click
    end
    object N2: TMenuItem
      Tag = 1
      Caption = #32534#36753
      OnClick = N1Click
    end
    object N3: TMenuItem
      Tag = 2
      Caption = #21024#38500
      OnClick = N1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 108
    Top = 121
  end
end
