object frmMain: TfrmMain
  Left = 374
  Top = 197
  Width = 785
  Height = 564
  Caption = #20851#38190#23703#20301#35774#23450
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
    Width = 769
    Height = 41
    Align = alTop
    TabOrder = 0
    object lbl1: TLabel
      Left = 305
      Top = 17
      Width = 28
      Height = 13
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = 'lbl1'
      ParentBiDiMode = False
    end
    object btnClose: TBitBtn
      Left = 4
      Top = 4
      Width = 73
      Height = 33
      Caption = #20851#38381
      TabOrder = 0
      OnClick = btnCloseClick
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        0400000000007800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
        FFFFFFFF00FFFFFFFFFFFFF030FFFFFFFFFFFF0330FFFFFFFFFF003330000000
        0FFFF03330FF0FFFFFFFF03300FF0FFFF4FFF03330FF0FFF44FFF03330FF0FF4
        4444F03330FF0F444444F03330FF0FF44444F0330FFF0FFF44FFF030FFFF0FFF
        F4FFF00FFFFF0FFFFFFFF00000000FFFFFFF}
    end
    object btnRefresh: TBitBtn
      Left = 77
      Top = 4
      Width = 73
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
    object edtFilter: TEdit
      Left = 336
      Top = 13
      Width = 121
      Height = 21
      TabOrder = 2
      OnChange = edtFilterChange
    end
    object btnExport: TBitBtn
      Left = 150
      Top = 4
      Width = 73
      Height = 33
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
  end
  object pnl2: TPanel
    Left = 0
    Top = 329
    Width = 769
    Height = 196
    Align = alBottom
    TabOrder = 1
    object dbDetail: TDBGridEh
      Left = 1
      Top = 1
      Width = 767
      Height = 194
      Align = alClient
      DataSource = DM.dsDetail
      FooterColor = clWindow
      FooterFont.Charset = ANSI_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'strtype'
          Footers = <>
          Width = 87
        end
        item
          EditButtons = <>
          FieldName = 'reqitem'
          Footers = <>
          Width = 393
        end>
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 41
    Width = 769
    Height = 288
    Align = alClient
    TabOrder = 2
    object dbMain: TDBGridEh
      Left = 1
      Top = 1
      Width = 767
      Height = 286
      Align = alClient
      DataSource = DM.dsMain
      FooterColor = clWindow
      FooterFont.Charset = ANSI_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      PopupMenu = pm1
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnTitleClick = dbMainTitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'departmentcode'
          Footers = <>
          Width = 76
        end
        item
          EditButtons = <>
          FieldName = 'departmentname'
          Footers = <>
          Width = 86
        end
        item
          EditButtons = <>
          FieldName = 'positionname'
          Footers = <>
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'qty_Dev'
          Footers = <>
          Width = 83
        end
        item
          EditButtons = <>
          FieldName = 'qty_req'
          Footers = <>
          Width = 88
        end
        item
          EditButtons = <>
          FieldName = 'qty_has'
          Footers = <>
          Width = 90
        end>
    end
  end
  object pm1: TPopupMenu
    OnPopup = pm1Popup
    Left = 408
    Top = 137
    object N1: TMenuItem
      Caption = #26032#22686
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #32534#36753
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21024#38500
      OnClick = N3Click
    end
  end
end
