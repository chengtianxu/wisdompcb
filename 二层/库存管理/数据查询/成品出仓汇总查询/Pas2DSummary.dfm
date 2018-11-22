object frm2DSummary: Tfrm2DSummary
  Left = 211
  Top = 127
  Width = 979
  Height = 563
  Caption = #20986#36135#20108#32500#27719#24635#26597#35810
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    963
    525)
  PixelsPerInch = 96
  TextHeight = 13
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 963
    Height = 40
    Align = alTop
    TabOrder = 0
    DesignSize = (
      963
      40)
    object btn1: TSpeedButton
      Left = 74
      Top = 3
      Width = 60
      Height = 29
      Hint = #23558#25968#25454#36755#20986#21040'EXCEL'#25991#20214#20013
      Caption = #23548#20986
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
      OnClick = btn1Click
    end
    object Label4: TLabel
      Left = 783
      Top = 11
      Width = 59
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #32479#35745#21333#20301' '
    end
    object BitBtn1: TBitBtn
      Left = 9
      Top = 3
      Width = 60
      Height = 29
      Hint = #36864#20986
      Caption = #20851#38381
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn1Click
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
  end
  object Panel1: TPanel
    Left = 0
    Top = 40
    Width = 963
    Height = 485
    Align = alClient
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 961
      Height = 483
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      OnChange = PageControl1Change
      object TabSheet1: TTabSheet
        Caption = #20986#36135#26126#32454#26597#35810
        object Eh1: TDBGridEh
          Left = 0
          Top = 0
          Width = 953
          Height = 455
          Align = alClient
          DataSource = DataSource1
          Flat = True
          FooterColor = clBtnFace
          FooterFont.Charset = ANSI_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -13
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          FooterRowCount = 1
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          SumList.Active = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnKeyDown = Eh1KeyDown
          Columns = <
            item
              EditButtons = <>
              Footer.Value = #21512#35745#65306
              Footer.ValueType = fvtStaticText
              Footers = <>
            end
            item
              EditButtons = <>
              Footers = <>
            end
            item
              EditButtons = <>
              Footer.FieldName = 'Qty'
              Footer.ValueType = fvtSum
              Footers = <>
            end
            item
              EditButtons = <>
              Footer.FieldName = 'Area'
              Footer.ValueType = fvtSum
              Footers = <>
            end
            item
              EditButtons = <>
              Footer.FieldName = 'NotaxMount'
              Footer.ValueType = fvtSum
              Footers = <>
            end
            item
              EditButtons = <>
              Footer.FieldName = 'taxMount'
              Footer.ValueType = fvtSum
              Footers = <>
            end>
        end
      end
      object TabSheet2: TTabSheet
        Caption = #20986#36135#27719#24635#26597#35810
        ImageIndex = 1
        object SG: TStringGrid
          Left = 0
          Top = 0
          Width = 953
          Height = 455
          Align = alClient
          ColCount = 2
          DefaultRowHeight = 21
          RowCount = 2
          TabOrder = 0
        end
      end
    end
  end
  object ComboBox2: TComboBox
    Left = 837
    Top = 7
    Width = 123
    Height = 21
    Style = csDropDownList
    Anchors = [akTop, akRight]
    Enabled = False
    ItemHeight = 13
    TabOrder = 2
    OnChange = ComboBox2Change
    Items.Strings = (
      #25968#37327
      #38754#31215
      #37329#39069'('#19981#21547#31246#37329#39069#26412#24065')'
      #37329#39069'('#21547#31246#37329#39069#26412#24065')')
  end
  object DataSource1: TDataSource
    DataSet = Ado64
    Left = 493
    Top = 185
  end
  object Ado64: TADOQuery
    Connection = Frm_main.ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    Left = 581
    Top = 185
  end
  object AdoCol_cb2: TADOQuery
    Connection = Frm_main.ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    Left = 661
    Top = 185
  end
  object AdoRow_cb3: TADOQuery
    Connection = Frm_main.ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    Left = 749
    Top = 185
  end
end
