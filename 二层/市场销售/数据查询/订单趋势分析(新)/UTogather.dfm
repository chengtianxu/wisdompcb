object frmTotather: TfrmTotather
  Left = 373
  Top = 140
  Width = 904
  Height = 536
  Caption = #35746#21333#20108#32500#25968#25454#27719#24635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 888
    Height = 498
    Align = alClient
    TabOrder = 0
    object pnl2: TPanel
      Left = 1
      Top = 1
      Width = 886
      Height = 40
      Align = alTop
      TabOrder = 0
      DesignSize = (
        886
        40)
      object btn1: TSpeedButton
        Left = 74
        Top = 3
        Width = 63
        Height = 26
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
        Left = 706
        Top = 11
        Width = 51
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #32479#35745#21333#20301' '
      end
      object BitBtn1: TBitBtn
        Left = 9
        Top = 3
        Width = 63
        Height = 26
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
      object cbb1: TComboBox
        Left = 759
        Top = 7
        Width = 123
        Height = 21
        Style = csDropDownList
        Anchors = [akTop, akRight]
        Enabled = False
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 1
        Text = #25968#37327
        OnChange = cbb1Change
        Items.Strings = (
          #25968#37327
          #38754#31215
          #37329#39069'('#19981#21547#31246#37329#39069#26412#24065')'
          #37329#39069'('#21547#31246#37329#39069#26412#24065')')
      end
    end
    object pnl3: TPanel
      Left = 1
      Top = 41
      Width = 886
      Height = 456
      Align = alClient
      TabOrder = 1
      object pgc1: TPageControl
        Left = 1
        Top = 1
        Width = 884
        Height = 454
        ActivePage = ts1
        Align = alClient
        TabOrder = 0
        OnChange = pgc1Change
        object ts1: TTabSheet
          Caption = #35746#21333#26126#32454
          object eh60: TDBGridEh
            Left = 0
            Top = 0
            Width = 876
            Height = 426
            Align = alClient
            DataSource = ds60_Detail
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'MS Sans Serif'
            FooterFont.Style = []
            FooterRowCount = 1
            ReadOnly = True
            SumList.Active = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnKeyDown = eh60KeyDown
            Columns = <
              item
                EditButtons = <>
                Footers = <>
              end
              item
                EditButtons = <>
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = #25968#37327
                Footer.FieldName = #25968#37327
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = #38754#31215
                Footer.FieldName = #38754#31215
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = #19981#21547#31246#37329#39069
                Footer.FieldName = #19981#21547#31246#37329#39069
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = #21547#31246#37329#39069
                Footer.FieldName = #21547#31246#37329#39069
                Footer.ValueType = fvtSum
                Footers = <>
              end>
          end
        end
        object ts2: TTabSheet
          Caption = #35746#21333#27719#24635
          ImageIndex = 1
          object sg1: TStringGrid
            Left = 0
            Top = 0
            Width = 884
            Height = 433
            Align = alClient
            ColCount = 3
            DefaultColWidth = 100
            DefaultRowHeight = 20
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
            TabOrder = 0
          end
        end
      end
    end
  end
  object qry60_detail: TADOQuery
    Connection = Frm_main.ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 220
    Top = 129
  end
  object ds60_Detail: TDataSource
    DataSet = qry60_detail
    Left = 164
    Top = 129
  end
  object dsV: TDataSource
    DataSet = qryV
    Left = 476
    Top = 223
  end
  object qryV: TADOQuery
    Connection = Frm_main.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 516
    Top = 231
  end
  object dsH: TDataSource
    DataSet = qryH
    Left = 556
    Top = 151
  end
  object qryH: TADOQuery
    Connection = Frm_main.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 596
    Top = 159
  end
end
