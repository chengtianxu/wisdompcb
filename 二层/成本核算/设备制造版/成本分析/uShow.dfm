object frmShow: TfrmShow
  Left = 138
  Top = 142
  Width = 807
  Height = 548
  Caption = #25104#26412#34920#29616#20998#26512
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 799
    Height = 41
    Cursor = crArrow
    Align = alTop
  end
  object SpeedButton1: TSpeedButton
    Left = 8
    Top = 5
    Width = 30
    Height = 30
    Hint = #36864#20986
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      0400000000007800000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
      FFFFFFFF00FFFFFFFFFFFFF030FFFFFFFFFFFF0330FFFFFFFFFF003330000000
      0FFFF03330FF0FFFFFFFF03300FF0FFFF4FFF03330FF0FFF44FFF03330FF0FF4
      4444F03330FF0F444444F03330FF0FF44444F0330FFF0FFF44FFF030FFFF0FFF
      F4FFF00FFFFF0FFFFFFFF00000000FFFFFFF}
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton1Click
  end
  object SpeedButton4: TSpeedButton
    Left = 41
    Top = 5
    Width = 30
    Height = 30
    Hint = #23558#25968#25454#36755#20986#21040'EXCEL'#25991#20214#20013
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
    PopupMenu = PopupMenu2
    ShowHint = True
    OnClick = SpeedButton4Click
  end
  object Label2: TLabel
    Left = 240
    Top = 16
    Width = 51
    Height = 16
    Caption = #24037#21378#65306
    Font.Charset = GB2312_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 41
    Width = 799
    Height = 480
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = #26448#26009#28040#32791#20998#26512
      object PageControl2: TPageControl
        Left = 0
        Top = 0
        Width = 791
        Height = 452
        ActivePage = TabSheet43
        Align = alClient
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        MultiLine = True
        ParentFont = False
        TabOrder = 0
        TabPosition = tpLeft
        OnChange = PageControl11Change
        object TabSheet6: TTabSheet
          Caption = #26448#26009#25104#26412'('#37096#38376')'
          object PageControl3: TPageControl
            Left = 0
            Top = 0
            Width = 763
            Height = 444
            ActivePage = TabSheet9
            Align = alClient
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = PageControl11Change
            object TabSheet9: TTabSheet
              Caption = #27719#24635#34920
              OnShow = TabSheet9Show
              object StringGrid1: TStringGrid
                Left = 0
                Top = 0
                Width = 755
                Height = 416
                Align = alClient
                ColCount = 6
                DefaultColWidth = 80
                DefaultRowHeight = 19
                FixedCols = 2
                RowCount = 2
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
                ParentFont = False
                TabOrder = 0
                OnDrawCell = StringGrid1DrawCell
                RowHeights = (
                  19
                  19)
              end
            end
            object TabSheet10: TTabSheet
              Caption = #26126#32454#34920
              ImageIndex = 1
              OnShow = TabSheet9Show
              object StringGrid2: TStringGrid
                Left = 0
                Top = 0
                Width = 755
                Height = 416
                Align = alClient
                ColCount = 13
                DefaultRowHeight = 19
                FixedCols = 3
                RowCount = 2
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
                ParentFont = False
                TabOrder = 0
                OnDrawCell = StringGrid2DrawCell
              end
            end
          end
        end
        object TabSheet7: TTabSheet
          Caption = #38388#25509#26448#26009#25104#26412
          ImageIndex = 1
          TabVisible = False
          object PageControl4: TPageControl
            Left = 0
            Top = 0
            Width = 763
            Height = 444
            ActivePage = TabSheet11
            Align = alClient
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = PageControl11Change
            object TabSheet11: TTabSheet
              Caption = #27719#24635#34920
              OnShow = TabSheet11Show
              object StringGrid3: TStringGrid
                Left = 0
                Top = 0
                Width = 755
                Height = 416
                Align = alClient
                ColCount = 6
                DefaultColWidth = 80
                DefaultRowHeight = 19
                FixedCols = 2
                RowCount = 2
                FixedRows = 0
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
                ParentFont = False
                TabOrder = 0
                OnDrawCell = StringGrid1DrawCell
              end
            end
            object TabSheet12: TTabSheet
              Caption = #26126#32454#34920
              ImageIndex = 1
              OnShow = TabSheet11Show
              object StringGrid4: TStringGrid
                Left = 0
                Top = 0
                Width = 755
                Height = 416
                Align = alClient
                ColCount = 13
                DefaultRowHeight = 19
                FixedCols = 3
                RowCount = 2
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
                ParentFont = False
                TabOrder = 0
                OnDrawCell = StringGrid4DrawCell
                RowHeights = (
                  19
                  19)
              end
            end
          end
        end
        object TabSheet8: TTabSheet
          Caption = #20854#23427#26448#26009#28040#32791
          ImageIndex = 2
          TabVisible = False
          object PageControl5: TPageControl
            Left = 0
            Top = 0
            Width = 763
            Height = 444
            ActivePage = TabSheet13
            Align = alClient
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = PageControl11Change
            object TabSheet13: TTabSheet
              Caption = #27719#24635#34920
              OnShow = TabSheet13Show
              object StringGrid5: TStringGrid
                Left = 0
                Top = 0
                Width = 755
                Height = 416
                Align = alClient
                ColCount = 6
                DefaultRowHeight = 19
                FixedCols = 2
                RowCount = 2
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
                ParentFont = False
                TabOrder = 0
                OnDrawCell = StringGrid1DrawCell
              end
            end
            object TabSheet14: TTabSheet
              Caption = #26126#32454#34920
              ImageIndex = 1
              OnShow = TabSheet13Show
              object StringGrid6: TStringGrid
                Left = 0
                Top = 0
                Width = 747
                Height = 405
                Align = alClient
                ColCount = 18
                DefaultRowHeight = 19
                FixedCols = 3
                RowCount = 2
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
                ParentFont = False
                TabOrder = 0
                OnDrawCell = StringGrid6DrawCell
              end
            end
          end
        end
        object TabSheet42: TTabSheet
          Caption = #26448#26009#25104#26412'('#26377#29983#20135#21333')'
          ImageIndex = 3
          OnShow = TabSheet42Show
          object DBGridEh9: TDBGridEh
            Left = 0
            Top = 33
            Width = 763
            Height = 411
            Align = alClient
            DataSource = DataSource9
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -13
            FooterFont.Name = #23435#20307
            FooterFont.Style = [fsBold]
            FooterRowCount = 1
            ParentFont = False
            ReadOnly = True
            SumList.Active = True
            TabOrder = 0
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            OnTitleClick = DBGridEh9TitleClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'CUT_NO'
                Footers = <>
                Title.Color = clRed
              end
              item
                EditButtons = <>
                FieldName = 'INV_PART_NUMBER'
                Footers = <>
                Width = 120
              end
              item
                EditButtons = <>
                FieldName = 'matl_std_cost'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'Price'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'IN_QUANTITY'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'IN_AMOUNT'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 109
              end
              item
                EditButtons = <>
                FieldName = 'STD_COST'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 112
              end
              item
                EditButtons = <>
                FieldName = 'ACTUAL_COST'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 115
              end
              item
                EditButtons = <>
                FieldName = 'Diff'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 104
              end
              item
                EditButtons = <>
                FieldName = 'INV_PART_DESCRIPTION'
                Footers = <>
                Width = 230
              end
              item
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
              end>
          end
          object Panel5: TPanel
            Left = 0
            Top = 0
            Width = 763
            Height = 33
            Align = alTop
            TabOrder = 1
            object Label8: TLabel
              Left = 194
              Top = 11
              Width = 56
              Height = 13
              Alignment = taRightJustify
              Caption = #29983#20135#21333#21495
            end
            object Edit6: TEdit
              Left = 256
              Top = 8
              Width = 153
              Height = 21
              TabOrder = 0
              OnChange = Edit6Change
            end
          end
        end
        object TabSheet43: TTabSheet
          Caption = #26448#26009#25104#26412'('#26080#29983#20135#21333')'
          ImageIndex = 4
          OnShow = TabSheet43Show
          object DBGridEh10: TDBGridEh
            Left = 0
            Top = 33
            Width = 763
            Height = 411
            Align = alClient
            DataSource = DataSource10
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -13
            FooterFont.Name = #23435#20307
            FooterFont.Style = [fsBold]
            FooterRowCount = 1
            ParentFont = False
            ReadOnly = True
            SumList.Active = True
            TabOrder = 0
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            OnTitleClick = DBGridEh10TitleClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'INV_PART_NUMBER'
                Footers = <>
                Title.Color = clRed
                Width = 120
              end
              item
                EditButtons = <>
                FieldName = 'matl_std_cost'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'Price'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'IN_QUANTITY'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'IN_AMOUNT'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 109
              end
              item
                EditButtons = <>
                FieldName = 'STD_COST'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 112
              end
              item
                EditButtons = <>
                FieldName = 'ACTUAL_COST'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 115
              end
              item
                EditButtons = <>
                FieldName = 'Diff'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 104
              end
              item
                EditButtons = <>
                FieldName = 'INV_PART_DESCRIPTION'
                Footers = <>
                Width = 230
              end
              item
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
              end>
          end
          object Panel6: TPanel
            Left = 0
            Top = 0
            Width = 763
            Height = 33
            Align = alTop
            TabOrder = 1
            object Label7: TLabel
              Left = 194
              Top = 11
              Width = 56
              Height = 13
              Alignment = taRightJustify
              Caption = #26448#26009#20195#21495
            end
            object Edit5: TEdit
              Left = 256
              Top = 8
              Width = 153
              Height = 21
              TabOrder = 0
              OnChange = Edit5Change
            end
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #26448#26009#25104#26412#32467#26500
      ImageIndex = 1
      TabVisible = False
      OnShow = TabSheet2Show
      object StringGrid7: TStringGrid
        Left = 0
        Top = 0
        Width = 791
        Height = 452
        Align = alClient
        ColCount = 8
        DefaultRowHeight = 19
        FixedCols = 2
        RowCount = 2
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
        ParentFont = False
        TabOrder = 0
        OnDrawCell = StringGrid7DrawCell
        RowHeights = (
          19
          19)
      end
    end
    object TabSheet3: TTabSheet
      Caption = #21046#36896#36153#29992#32467#26500
      ImageIndex = 2
      OnShow = TabSheet3Show
      object StringGrid8: TStringGrid
        Left = 0
        Top = 0
        Width = 791
        Height = 452
        Align = alClient
        ColCount = 7
        DefaultRowHeight = 19
        FixedCols = 2
        RowCount = 2
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
        ParentFont = False
        TabOrder = 0
        OnDrawCell = StringGrid1DrawCell
        ColWidths = (
          64
          64
          99
          64
          64
          64
          64)
        RowHeights = (
          19
          19)
      end
    end
    object TabSheet4: TTabSheet
      Caption = #36820#24037#25104#26412#20998#26512
      ImageIndex = 3
      TabVisible = False
      object PageControl8: TPageControl
        Left = 0
        Top = 0
        Width = 791
        Height = 452
        ActivePage = TabSheet18
        Align = alClient
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        MultiLine = True
        ParentFont = False
        TabOrder = 0
        TabPosition = tpLeft
        object TabSheet18: TTabSheet
          Caption = #22312#21046#21697#36820#24037#25104#26412
          OnShow = TabSheet18Show
          object PageControl16: TPageControl
            Left = 0
            Top = 0
            Width = 763
            Height = 444
            ActivePage = TabSheet40
            Align = alClient
            TabOrder = 0
            object TabSheet40: TTabSheet
              Caption = #27719#24635#25968#25454
              OnShow = TabSheet18Show
              object StringGrid10: TStringGrid
                Left = 0
                Top = 0
                Width = 755
                Height = 416
                Align = alClient
                ColCount = 6
                DefaultRowHeight = 19
                FixedCols = 2
                RowCount = 2
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
                ParentFont = False
                TabOrder = 0
                ColWidths = (
                  64
                  64
                  133
                  115
                  117
                  134)
                RowHeights = (
                  19
                  19)
              end
            end
            object TabSheet41: TTabSheet
              Caption = #26126#32454#25968#25454
              ImageIndex = 1
              OnShow = TabSheet18Show
              object StringGrid11: TStringGrid
                Left = 0
                Top = 0
                Width = 747
                Height = 405
                Align = alClient
                ColCount = 8
                DefaultRowHeight = 19
                FixedCols = 2
                RowCount = 2
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
                ParentFont = False
                TabOrder = 0
                ColWidths = (
                  64
                  64
                  103
                  95
                  106
                  98
                  90
                  80)
                RowHeights = (
                  19
                  19)
              end
            end
          end
        end
        object TabSheet19: TTabSheet
          Caption = #29305#27530#20986#20179#25104#26412
          ImageIndex = 1
          OnShow = TabSheet18Show
          object StringGrid26: TStringGrid
            Left = 0
            Top = 0
            Width = 755
            Height = 433
            Align = alClient
            ColCount = 8
            DefaultRowHeight = 19
            FixedCols = 0
            RowCount = 2
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
            ParentFont = False
            TabOrder = 0
            OnDrawCell = StringGrid1DrawCell
            ColWidths = (
              91
              103
              101
              99
              120
              117
              110
              64)
            RowHeights = (
              19
              19)
          end
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = #26448#26009#36827#20986#23384
      ImageIndex = 4
      object PageControl9: TPageControl
        Left = 0
        Top = 33
        Width = 791
        Height = 419
        ActivePage = TabSheet20
        Align = alClient
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        MultiLine = True
        ParentFont = False
        TabOrder = 0
        TabPosition = tpLeft
        OnChange = PageControl9Change
        object TabSheet20: TTabSheet
          Caption = #27719#24635#25968#25454
          OnShow = TabSheet20Show
          object DBGridEh1: TDBGridEh
            Left = 0
            Top = 0
            Width = 763
            Height = 411
            Align = alClient
            DataSource = DataSource1
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -13
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            FooterRowCount = 1
            ReadOnly = True
            SumList.Active = True
            TabOrder = 0
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            OnTitleClick = DBGridEh1TitleClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
                ReadOnly = False
              end
              item
                EditButtons = <>
                FieldName = 'inv_group_name'
                Footers = <>
                ReadOnly = False
              end
              item
                EditButtons = <>
                FieldName = 'GROUP_NAME'
                Footers = <>
                ReadOnly = False
              end
              item
                EditButtons = <>
                FieldName = 'INV_PART_NUMBER'
                Footers = <>
                ReadOnly = False
                Title.Color = clRed
                Width = 122
              end
              item
                EditButtons = <>
                FieldName = 'INV_PART_DESCRIPTION'
                Footers = <>
                ReadOnly = False
                Width = 166
              end
              item
                EditButtons = <>
                FieldName = 'UNIT_CODE'
                Footers = <>
                ReadOnly = False
              end
              item
                EditButtons = <>
                FieldName = 'STOCK_SELL'
                Footers = <>
                Width = 61
              end
              item
                EditButtons = <>
                FieldName = 'open_quantity'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 67
              end
              item
                EditButtons = <>
                FieldName = 'open_amount'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 69
              end
              item
                EditButtons = <>
                FieldName = 'in_quantity'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 59
              end
              item
                EditButtons = <>
                FieldName = 'in_amount'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 59
              end
              item
                EditButtons = <>
                FieldName = 'out_quantity'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 59
              end
              item
                EditButtons = <>
                FieldName = 'out_amount'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 62
              end
              item
                EditButtons = <>
                FieldName = 'reject_quantity'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 66
              end
              item
                EditButtons = <>
                FieldName = 'reject_amount'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'return_quantity'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 66
              end
              item
                EditButtons = <>
                FieldName = 'return_amount'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 59
              end
              item
                EditButtons = <>
                FieldName = 'closed_quantity'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 69
              end
              item
                EditButtons = <>
                FieldName = 'closed_amount'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 82
              end>
          end
        end
        object TabSheet21: TTabSheet
          Caption = #26126#32454#25968#25454
          ImageIndex = 1
          OnShow = TabSheet20Show
          object DBGridEh2: TDBGridEh
            Left = 0
            Top = 0
            Width = 763
            Height = 411
            Align = alClient
            DataSource = DataSource2
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -13
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            FooterRowCount = 1
            ReadOnly = True
            SumList.Active = True
            TabOrder = 0
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            OnTitleClick = DBGridEh2TitleClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'abbrname15'
                Footers = <>
                ReadOnly = False
              end
              item
                EditButtons = <>
                FieldName = 'inv_group_name'
                Footers = <>
                ReadOnly = False
                Width = 54
              end
              item
                EditButtons = <>
                FieldName = 'GROUP_NAME'
                Footers = <>
                ReadOnly = False
                Width = 59
              end
              item
                EditButtons = <>
                FieldName = 'INV_PART_NUMBER'
                Footers = <>
                ReadOnly = False
                Title.Color = clRed
                Width = 122
              end
              item
                EditButtons = <>
                FieldName = 'INV_PART_DESCRIPTION'
                Footers = <>
                ReadOnly = False
                Width = 140
              end
              item
                EditButtons = <>
                FieldName = 'UNIT_CODE'
                Footers = <>
                ReadOnly = False
              end
              item
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
                ReadOnly = False
              end
              item
                EditButtons = <>
                FieldName = 'SUPPLIER2'
                Footers = <>
                ReadOnly = False
              end
              item
                EditButtons = <>
                FieldName = 'LOCATION'
                Footers = <>
                ReadOnly = False
                Width = 78
              end
              item
                EditButtons = <>
                FieldName = 'rohs'
                Footers = <>
                ReadOnly = False
              end
              item
                EditButtons = <>
                FieldName = 'STOCK_SELL'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'OPEN_QUANTITY'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 63
              end
              item
                EditButtons = <>
                FieldName = 'OPEN_amount'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'IN_QUANTITY'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 63
              end
              item
                EditButtons = <>
                FieldName = 'in_amount'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'OUT_QUANTITY'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 70
              end
              item
                EditButtons = <>
                FieldName = 'out_amount'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'REJECT_QUANTITY'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 72
              end
              item
                EditButtons = <>
                FieldName = 'reject_amount'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'RETURN_QUANTITY'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'return_amount'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'CLOSED_QUANTITY'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 60
              end
              item
                EditButtons = <>
                FieldName = 'closed_amount'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'UNIT_PRICE'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'tax_2'
                Footers = <>
              end>
          end
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 791
        Height = 33
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Label1: TLabel
          Left = 198
          Top = 11
          Width = 52
          Height = 13
          Alignment = taRightJustify
          Caption = #26448#26009#32534#30721
        end
        object Edit1: TEdit
          Left = 256
          Top = 8
          Width = 153
          Height = 21
          TabOrder = 0
          OnChange = Edit1Change
        end
      end
    end
    object TabSheet22: TTabSheet
      Caption = #25104#21697#36827#20986#23384
      ImageIndex = 5
      object PageControl10: TPageControl
        Left = 0
        Top = 32
        Width = 791
        Height = 420
        ActivePage = TabSheet23
        Align = alClient
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        MultiLine = True
        ParentFont = False
        TabOrder = 0
        TabPosition = tpLeft
        OnChange = PageControl10Change
        object TabSheet23: TTabSheet
          Caption = #27719#24635#25968#25454
          OnShow = TabSheet23Show
          object DBGridEh3: TDBGridEh
            Left = 0
            Top = 0
            Width = 763
            Height = 412
            Align = alClient
            DataSource = DataSource3
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -13
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            FooterRowCount = 1
            ReadOnly = True
            SumList.Active = True
            TabOrder = 0
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            OnTitleClick = DBGridEh3TitleClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'PROD_CODE'
                Footers = <>
                ReadOnly = False
                Title.Caption = #20135#21697#20195#30721
                Title.Color = clRed
                Width = 80
              end
              item
                EditButtons = <>
                FieldName = 'PRODUCT_NAME'
                Footers = <>
                ReadOnly = False
                Title.Caption = #20135#21697#21517#31216
                Width = 120
              end
              item
                EditButtons = <>
                FieldName = 'PRODUCT_DESC'
                Footers = <>
                ReadOnly = False
                Title.Caption = #20135#21697#35268#26684
                Width = 150
              end
              item
                EditButtons = <>
                FieldName = 'UNIT_PRICE'
                Footers = <>
                Title.Caption = #26368#26032#38144#21806#21333#20215
                Width = 80
              end
              item
                EditButtons = <>
                FieldName = 'OPEN_QUANTITY'
                Footer.FieldName = 'OPEN_QUANTITY'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26399#21021#24211#23384#25968#37327
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'OPEN_AMOUNT'
                Footer.FieldName = 'OPEN_AMOUNT'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26399#21021#24211#23384#37329#39069
                Width = 120
              end
              item
                EditButtons = <>
                FieldName = 'IN_QUANTITY'
                Footer.FieldName = 'IN_QUANTITY'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#20837#24211#25968#37327
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'IN_AMOUNT'
                Footer.FieldName = 'IN_AMOUNT'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#20837#24211#37329#39069
                Width = 120
              end
              item
                EditButtons = <>
                FieldName = 'OUT_QUANTITY'
                Footer.FieldName = 'OUT_QUANTITY'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#20986#24211#25968#37327
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'OUT_AMOUNT'
                Footer.FieldName = 'OUT_AMOUNT'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#20986#24211#37329#39069
                Width = 120
              end
              item
                EditButtons = <>
                FieldName = 'TRANS_QUANTITY'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#36716#31227#25968#37327
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'TRANS_AMOUNT'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#36716#31227#37329#39069
                Width = 120
              end
              item
                EditButtons = <>
                FieldName = 'CLOSED_QUANTITY'
                Footer.FieldName = 'CLOSED_QUANTITY'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26399#26411#24211#23384#25968#37327
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'CLOSED_AMOUNT'
                Footer.FieldName = 'CLOSED_AMOUNT'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26399#26411#24211#23384#37329#39069
                Width = 120
              end>
          end
        end
        object TabSheet24: TTabSheet
          Caption = #26126#32454#25968#25454
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ImageIndex = 1
          ParentFont = False
          OnShow = TabSheet23Show
          object DBGridEh4: TDBGridEh
            Left = 0
            Top = 0
            Width = 763
            Height = 412
            Align = alClient
            DataSource = DataSource4
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -13
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            FooterRowCount = 1
            ReadOnly = True
            SumList.Active = True
            TabOrder = 0
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            OnKeyDown = DBGridEh4KeyDown
            OnTitleClick = DBGridEh4TitleClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'PROD_CODE'
                Footers = <>
                ReadOnly = False
                Title.Caption = #20135#21697#20195#30721
                Title.Color = clRed
                Width = 80
              end
              item
                EditButtons = <>
                FieldName = 'PRODUCT_NAME'
                Footers = <>
                ReadOnly = False
                Title.Caption = #20135#21697#21517#31216
                Width = 120
              end
              item
                EditButtons = <>
                FieldName = 'PRODUCT_DESC'
                Footers = <>
                ReadOnly = False
                Title.Caption = #20135#21697#35268#26684
                Width = 150
              end
              item
                EditButtons = <>
                FieldName = 'LOCATION'
                Footers = <>
                ReadOnly = False
                Title.Caption = #20179#24211
                Width = 80
              end
              item
                EditButtons = <>
                FieldName = 'UNIT_PRICE'
                Footers = <>
                Title.Caption = #26368#26032#38144#21806#21333#20215
                Width = 80
              end
              item
                EditButtons = <>
                FieldName = 'OPEN_QUANTITY'
                Footer.FieldName = 'OPEN_QUANTITY'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26399#21021#24211#23384#25968#37327
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'OPEN_AMOUNT'
                Footer.FieldName = 'OPEN_AMOUNT'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26399#21021#24211#23384#37329#39069
                Width = 120
              end
              item
                EditButtons = <>
                FieldName = 'IN_QUANTITY'
                Footer.FieldName = 'IN_QUANTITY'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#20837#24211#25968#37327
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'IN_AMOUNT'
                Footer.FieldName = 'IN_AMOUNT'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#20837#24211#37329#39069
                Width = 120
              end
              item
                EditButtons = <>
                FieldName = 'OUT_QUANTITY'
                Footer.FieldName = 'OUT_QUANTITY'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#20986#24211#25968#37327
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'OUT_AMOUNT'
                Footer.FieldName = 'OUT_AMOUNT'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#20986#24211#37329#39069
                Width = 120
              end
              item
                EditButtons = <>
                FieldName = 'TRANS_QUANTITY'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#36716#31227#25968#37327
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'TRANS_AMOUNT'
                Footer.FieldName = 'TRANS_AMOUNT'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#36716#31227#37329#39069
                Width = 120
              end
              item
                EditButtons = <>
                FieldName = 'CLOSED_QUANTITY'
                Footer.FieldName = 'CLOSED_QUANTITY'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26399#26411#24211#23384#25968#37327
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'CLOSED_AMOUNT'
                Footer.FieldName = 'CLOSED_AMOUNT'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26399#26411#24211#23384#37329#39069
                Width = 120
              end>
          end
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 791
        Height = 32
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          791
          32)
        object Label6: TLabel
          Left = 512
          Top = 11
          Width = 65
          Height = 13
          Caption = #35745#31639#20215#26684#65306
          Visible = False
        end
        object Label3: TLabel
          Left = 167
          Top = 9
          Width = 52
          Height = 13
          Alignment = taRightJustify
          Caption = #20135#21697#20195#30721
        end
        object ComboBox3: TComboBox
          Left = 610
          Top = 7
          Width = 81
          Height = 21
          Style = csDropDownList
          Anchors = [akTop, akRight]
          ItemHeight = 13
          ItemIndex = 1
          TabOrder = 0
          Text = #25104#26412#20215
          Visible = False
          OnChange = ComboBox3Change
          Items.Strings = (
            #38144#21806#20215
            #25104#26412#20215)
        end
        object Edit2: TEdit
          Left = 224
          Top = 5
          Width = 121
          Height = 21
          TabOrder = 1
          OnChange = Edit2Change
        end
        object BtQry: TBitBtn
          Left = 98
          Top = 2
          Width = 57
          Height = 30
          Hint = #37325#26032#23450#20041#26597#35810#26465#20214
          Caption = #26597#35810
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Visible = False
          OnClick = BtQryClick
          Glyph.Data = {
            C6050000424DC605000000000000360400002800000014000000140000000100
            08000000000090010000C40E0000C40E0000000100000000000000000000E8E0
            0000D0A000006060600038383800F0700000B8B8C00020202000A8B0B000F0F0
            F800B8400000C0600800A0A0A000E0E0E800D8D8E000B8100000D0D8D800C0A0
            8800B8300000F8F8080098989800B0504000B0908800B8706000E0A86000E0D8
            C000F070380088888800F0D8B0005858580008101000E0D0B000B8504000E8C8
            A000F0B85000E8D8A800C8C8C800D8982000D8C0B00050505000C8803800F0C8
            8800F8500800D8A040007078780008080800E8C0880028283000F8980000E8F0
            F00040404000B0B8B800B8A0A000C0682800E0A87800F0800000C8D0D000C898
            8000E0A88000D8904800E0E0E000F0A0000070707000E0783000B0888800E8D0
            6800C8B8A800C8700800D8885000B850180028282000B8887800F0F0D8001818
            1800F070180090909000D8C05800E8B09800F8F0E000F8F0F00048484800B8C0
            C800F0C06000F8F8F800F8805800F8F0C80080808000B8906000B0B0B000D090
            5000F8600000D8D0C800E0A05800B8585800B8B00000B8481000D0D0B000D078
            3000C0702000F0A86800C0602000E8E8E800A8A8A800F0C0B800B0201000F0A8
            4000E0B89000B8B8B80068686800F0F0E800F0982000D8D0A800E8C88000F0E0
            C000B8380800F0800800D8E0E000C0C0C000F0680800B0B0B800C0601800E0B8
            7800F0981000C8781800C0C8C80010101800C8A09000E0B8600030303000F0F0
            F000C0B8B80028282800E8E0E000F0F8F8003838400078787800F0D8B800D8C8
            B800F0C89000E0E8E800B8601000D0883800F8680800D8D0B800E8D08800C8C8
            D000D0D0D000B8B0B00058586000D8D8D8002820200010101000E8E8F000F8F8
            F000D8D0D000B8786000B8480000F0780000F0880000E0B08000B8C0C000B818
            0000C0A88800B8300800B0504800F0E0B000E8D0B000F0D08800F8501000F880
            0800ECFD7F0002000000000000001300E8000100000001000A0000884000F877
            78004B1B00000100000000998400E6775400F71200000101010001D8F8001200
            450090FB7700801FF80077FFFF00FFFF6000F8120000AD84E6007760F8001200
            D80084E677000000000000FFFF0000003800A8F8000038A8F800001800000000
            00000000000044F8120000400000000000000000000028F81200000000000000
            00000000000000000000000C000000000200000000000101120000872B00F877
            0000ECFD7F00000000000002000000006C00001A0200804B1B00007FFF00FFFF
            000000000000804B1B00000500000000870031E6770084F8120000218600E677
            9800F81200006713000010FFFF00000020000100000038A8F800000000000000
            7000F8120000ACF8120000D8F8001200100030001000F8400000105F5400E677
            200001000000D0F8120000D8F80012000800000000000E0000005331B2861D86
            1D861D861D861DF81DC57431F62C9824801414572C572C6C2C6C6C1D6C6C77B2
            6CB2B26C2CDF1232DF6C6CF86CF86C861D1B006C1D0E94530E8A6E8A24240E24
            24240E6F6CB294800E531D31550E4C245524242424515551B26C322453318655
            248A0E557780000086576C002CB20E5398536C31305A55F8CC1424511486B2F3
            1D802453535386534C229457536F066F06242CB2806C065353551D5353511D53
            638C12152477248680F8245353318653531D7755358D35121B57066FF66C2453
            98536C535380240EAA6F631557123551B26C24535353945353B2065398554D35
            776F0624C56C065353551D53536C6F53535355246F152451806C245353319453
            532480535353246F7E8D531D946C245398536C53535314F85353AA2453531480
            576C245353532C5353555314C557776F14002C246C5706535355575353315353
            551B6CF857146E146C2C24535331866C775353555353535353225A35C5B20653
            9853570E57535353535353535353AA08143153315353986C866C2C6C6C1D941D
            861D8680775398535355}
        end
      end
    end
    object TabSheet25: TTabSheet
      Caption = #25253#24223#25104#26412#20998#26512
      ImageIndex = 6
      TabVisible = False
      object PageControl11: TPageControl
        Left = 0
        Top = 0
        Width = 791
        Height = 452
        ActivePage = TabSheet26
        Align = alClient
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        MultiLine = True
        ParentFont = False
        TabOrder = 0
        OnChange = PageControl11Change
        object TabSheet26: TTabSheet
          Caption = #27719#24635#25968#25454
          OnShow = TabSheet26Show
          object StringGrid16: TStringGrid
            Left = 0
            Top = 0
            Width = 783
            Height = 424
            Align = alClient
            ColCount = 7
            DefaultRowHeight = 19
            FixedCols = 3
            RowCount = 2
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
            ParentFont = False
            TabOrder = 0
            OnDrawCell = StringGrid16DrawCell
            ColWidths = (
              64
              64
              64
              86
              90
              82
              84)
            RowHeights = (
              19
              19)
          end
        end
        object TabSheet27: TTabSheet
          Caption = #26126#32454#25968#25454
          ImageIndex = 1
          OnShow = TabSheet26Show
          object StringGrid17: TStringGrid
            Left = 0
            Top = 0
            Width = 775
            Height = 413
            Align = alClient
            ColCount = 13
            DefaultRowHeight = 19
            FixedCols = 3
            RowCount = 2
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
            ParentFont = False
            TabOrder = 0
            OnDrawCell = StringGrid17DrawCell
            ColWidths = (
              64
              64
              64
              64
              64
              64
              64
              64
              64
              64
              64
              75
              78)
            RowHeights = (
              19
              19)
          end
        end
      end
    end
    object TabSheet28: TTabSheet
      Caption = #23436#24037#25104#26412#20998#26512
      ImageIndex = 7
      TabVisible = False
      object PageControl12: TPageControl
        Left = 0
        Top = 0
        Width = 791
        Height = 452
        ActivePage = TabSheet30
        Align = alClient
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        MultiLine = True
        ParentFont = False
        TabOrder = 0
        TabPosition = tpLeft
        object TabSheet29: TTabSheet
          Caption = #27719#24635#25968#25454
          TabVisible = False
          object PageControl13: TPageControl
            Left = 0
            Top = 0
            Width = 763
            Height = 444
            ActivePage = TabSheet31
            Align = alClient
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = [fsBold]
            MultiLine = True
            ParentFont = False
            TabOrder = 0
            object TabSheet31: TTabSheet
              Caption = #25353#23458#25143
              OnShow = TabSheet31Show
              object StringGrid18: TStringGrid
                Left = 0
                Top = 0
                Width = 755
                Height = 416
                Align = alClient
                ColCount = 9
                Ctl3D = True
                DefaultRowHeight = 19
                FixedCols = 2
                RowCount = 2
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #23435#20307
                Font.Style = []
                Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 0
                OnDrawCell = StringGrid18DrawCell
                RowHeights = (
                  19
                  19)
              end
            end
            object TabSheet32: TTabSheet
              Caption = #25353#31867#21035
              ImageIndex = 1
              OnShow = TabSheet31Show
              object StringGrid19: TStringGrid
                Left = 0
                Top = 0
                Width = 747
                Height = 405
                Align = alClient
                ColCount = 10
                DefaultRowHeight = 19
                FixedCols = 3
                RowCount = 2
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #23435#20307
                Font.Style = []
                Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
                ParentFont = False
                TabOrder = 0
                OnDrawCell = StringGrid17DrawCell
                RowHeights = (
                  19
                  19)
              end
            end
          end
        end
        object TabSheet30: TTabSheet
          Caption = #26126#32454#25968#25454
          ImageIndex = 1
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 763
            Height = 30
            Align = alTop
            BevelOuter = bvNone
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object Label5: TLabel
              Left = 150
              Top = 8
              Width = 52
              Height = 13
              Alignment = taRightJustify
              Caption = #26412#21378#32534#21495
            end
            object Edit3: TEdit
              Left = 209
              Top = 4
              Width = 121
              Height = 21
              TabOrder = 0
              OnChange = Edit3Change
            end
          end
          object PageControl14: TPageControl
            Left = 0
            Top = 30
            Width = 763
            Height = 414
            ActivePage = TabSheet33
            Align = alClient
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnChange = PageControl14Change
            object TabSheet33: TTabSheet
              Caption = #25353#35746#21333
              OnShow = TabSheet31Show
              object DBGridEh5: TDBGridEh
                Left = 0
                Top = 0
                Width = 755
                Height = 386
                Align = alClient
                DataSource = DataSource5
                FooterColor = clWindow
                FooterFont.Charset = GB2312_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -13
                FooterFont.Name = #23435#20307
                FooterFont.Style = []
                FooterRowCount = 1
                PopupMenu = PopupMenu1
                ReadOnly = True
                SumList.Active = True
                TabOrder = 0
                TitleFont.Charset = GB2312_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -13
                TitleFont.Name = #23435#20307
                TitleFont.Style = []
                OnTitleClick = DBGridEh5TitleClick
                Columns = <
                  item
                    EditButtons = <>
                    FieldName = 'PROD_CODE'
                    Footers = <>
                    ReadOnly = False
                  end
                  item
                    EditButtons = <>
                    FieldName = 'PRODUCT_NAME'
                    Footers = <>
                    ReadOnly = False
                    Width = 100
                  end
                  item
                    EditButtons = <>
                    FieldName = 'MANU_PART_NUMBER'
                    Footers = <>
                    ReadOnly = False
                    Title.Color = clRed
                    Width = 86
                  end
                  item
                    EditButtons = <>
                    FieldName = 'MANU_PART_DESC'
                    Footers = <>
                    ReadOnly = False
                    Width = 142
                  end
                  item
                    EditButtons = <>
                    FieldName = 'CUST_CODE'
                    Footers = <>
                    ReadOnly = False
                    Width = 60
                  end
                  item
                    EditButtons = <>
                    FieldName = 'SALES_ORDER'
                    Footers = <>
                    ReadOnly = False
                  end
                  item
                    EditButtons = <>
                    FieldName = 'so_type'
                    Footers = <>
                    ReadOnly = False
                    Width = 48
                  end
                  item
                    EditButtons = <>
                    FieldName = 'SCH_DATE'
                    Footers = <>
                    Width = 68
                  end
                  item
                    EditButtons = <>
                    FieldName = 'PARTS_ORDERED'
                    Footers = <>
                  end
                  item
                    EditButtons = <>
                    FieldName = 'ISSUED_QTY'
                    Footers = <>
                  end
                  item
                    EditButtons = <>
                    FieldName = 'quan_prod'
                    Footer.ValueType = fvtSum
                    Footers = <>
                  end
                  item
                    EditButtons = <>
                    FieldName = 'matl_cost'
                    Footer.ValueType = fvtSum
                    Footers = <>
                  end
                  item
                    EditButtons = <>
                    FieldName = 'ovhd_cost'
                    Footer.ValueType = fvtSum
                    Footers = <>
                  end
                  item
                    EditButtons = <>
                    FieldName = 'amount'
                    Footer.ValueType = fvtSum
                    Footers = <>
                  end
                  item
                    EditButtons = <>
                    FieldName = 'square'
                    Footer.ValueType = fvtSum
                    Footers = <>
                    Width = 79
                  end
                  item
                    EditButtons = <>
                    FieldName = 'sqft_amount'
                    Footers = <>
                  end
                  item
                    EditButtons = <>
                    FieldName = 'qty_amount'
                    Footers = <>
                    Width = 57
                  end>
              end
            end
            object TabSheet34: TTabSheet
              Caption = #25353#20316#19994#21333
              ImageIndex = 1
              OnShow = TabSheet31Show
              object DBGridEh6: TDBGridEh
                Left = 0
                Top = 0
                Width = 747
                Height = 375
                Align = alClient
                DataSource = DataSource6
                FooterColor = clWindow
                FooterFont.Charset = GB2312_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -13
                FooterFont.Name = #23435#20307
                FooterFont.Style = []
                FooterRowCount = 1
                PopupMenu = PopupMenu3
                ReadOnly = True
                SumList.Active = True
                TabOrder = 0
                TitleFont.Charset = GB2312_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -13
                TitleFont.Name = #23435#20307
                TitleFont.Style = []
                OnTitleClick = DBGridEh6TitleClick
                Columns = <
                  item
                    EditButtons = <>
                    FieldName = 'WORK_ORDER_NUMBER'
                    Footers = <>
                    ReadOnly = False
                    Width = 117
                  end
                  item
                    EditButtons = <>
                    FieldName = 'MANU_PART_NUMBER'
                    Footers = <>
                    ReadOnly = False
                    Title.Color = clRed
                    Width = 79
                  end
                  item
                    EditButtons = <>
                    FieldName = 'MANU_PART_DESC'
                    Footers = <>
                    ReadOnly = False
                    Width = 109
                  end
                  item
                    EditButtons = <>
                    FieldName = 'PROD_CODE'
                    Footers = <>
                    ReadOnly = False
                    Width = 57
                  end
                  item
                    EditButtons = <>
                    FieldName = 'PRODUCT_NAME'
                    Footers = <>
                    ReadOnly = False
                    Width = 72
                  end
                  item
                    EditButtons = <>
                    FieldName = 'matl_cost'
                    Footer.ValueType = fvtSum
                    Footers = <>
                    Width = 59
                  end
                  item
                    EditButtons = <>
                    FieldName = 'ovhd_cost'
                    Footer.ValueType = fvtSum
                    Footers = <>
                    Width = 59
                  end
                  item
                    EditButtons = <>
                    FieldName = 'quan_prod'
                    Footer.ValueType = fvtSum
                    Footers = <>
                  end
                  item
                    EditButtons = <>
                    FieldName = 'amount'
                    Footer.ValueType = fvtSum
                    Footers = <>
                  end
                  item
                    EditButtons = <>
                    FieldName = 'square'
                    Footer.ValueType = fvtSum
                    Footers = <>
                  end
                  item
                    EditButtons = <>
                    FieldName = 'sqft_amount'
                    Footers = <>
                  end
                  item
                    EditButtons = <>
                    FieldName = 'qty_amount'
                    Footers = <>
                    Width = 59
                  end>
              end
            end
          end
        end
      end
    end
    object TabSheet35: TTabSheet
      Caption = #38144#21806#25104#26412#20998#26512
      ImageIndex = 8
      TabVisible = False
      object PageControl15: TPageControl
        Left = 0
        Top = 0
        Width = 791
        Height = 452
        ActivePage = TabSheet36
        Align = alClient
        TabOrder = 0
        object TabSheet36: TTabSheet
          Caption = #27719#24635#25968#25454
          OnShow = TabSheet36Show
          object StringGrid22: TStringGrid
            Left = 0
            Top = 0
            Width = 783
            Height = 424
            Align = alClient
            ColCount = 13
            DefaultRowHeight = 19
            FixedCols = 3
            RowCount = 2
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
            ParentFont = False
            TabOrder = 0
            RowHeights = (
              19
              19)
          end
        end
        object TabSheet37: TTabSheet
          Caption = #26126#32454#25968#25454
          ImageIndex = 1
          OnShow = TabSheet36Show
          object StringGrid23: TStringGrid
            Left = 0
            Top = 0
            Width = 775
            Height = 413
            Align = alClient
            ColCount = 15
            DefaultRowHeight = 19
            FixedCols = 3
            RowCount = 2
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
            ParentFont = False
            TabOrder = 0
            OnDrawCell = StringGrid23DrawCell
            RowHeights = (
              19
              19)
          end
        end
      end
    end
    object TabSheet38: TTabSheet
      Caption = #26448#26009#21457#20986#27719#24635
      ImageIndex = 9
      TabVisible = False
      OnShow = TabSheet38Show
      object StringGrid24: TStringGrid
        Left = 0
        Top = 0
        Width = 791
        Height = 452
        Align = alClient
        ColCount = 8
        DefaultRowHeight = 19
        FixedCols = 2
        RowCount = 2
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
        ParentFont = False
        TabOrder = 0
        OnDrawCell = StringGrid23DrawCell
        ColWidths = (
          64
          64
          89
          73
          85
          73
          86
          96)
        RowHeights = (
          19
          19)
      end
    end
    object TabSheet39: TTabSheet
      Caption = #26448#26009#36141#20837#27719#24635
      ImageIndex = 10
      TabVisible = False
      OnShow = TabSheet39Show
      object StringGrid25: TStringGrid
        Left = 0
        Top = 0
        Width = 791
        Height = 452
        Align = alClient
        ColCount = 9
        DefaultRowHeight = 19
        FixedCols = 2
        RowCount = 2
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
        ParentFont = False
        TabOrder = 0
        OnDrawCell = StringGrid23DrawCell
        ColWidths = (
          64
          64
          102
          113
          96
          73
          86
          81
          90)
        RowHeights = (
          19
          19)
      end
    end
    object TabSheet15: TTabSheet
      Caption = #22312#21046#21697#36827#20986#23384
      ImageIndex = 11
      object PageControl6: TPageControl
        Left = 0
        Top = 33
        Width = 791
        Height = 419
        ActivePage = TabSheet16
        Align = alClient
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        MultiLine = True
        ParentFont = False
        TabOrder = 0
        TabPosition = tpLeft
        OnChange = PageControl6Change
        object TabSheet16: TTabSheet
          Caption = #27719#24635#25968#25454
          OnShow = TabSheet16Show
          object DBGridEh7: TDBGridEh
            Left = 0
            Top = 0
            Width = 763
            Height = 411
            Align = alClient
            DataSource = DataSource7
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -13
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            FooterRowCount = 1
            ReadOnly = True
            SumList.Active = True
            TabOrder = 0
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            UseMultiTitle = True
            OnTitleClick = DBGridEh7TitleClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'PROD_CODE'
                Footers = <>
                ReadOnly = False
                Title.Caption = #20135#21697#20195#30721
                Title.Color = clRed
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'PRODUCT_NAME'
                Footers = <>
                ReadOnly = False
                Title.Caption = #20135#21697#21517#31216
                Width = 150
              end
              item
                EditButtons = <>
                FieldName = 'PRODUCT_DESC'
                Footers = <>
                ReadOnly = False
                Title.Caption = #20135#21697#35268#26684
                Width = 200
              end
              item
                EditButtons = <>
                FieldName = 'qty_opening'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26399#21021#22312#32447#25968#37327
                Width = 150
              end
              item
                EditButtons = <>
                FieldName = 'qty_input'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#25237#20135#25968#37327
                Width = 150
              end
              item
                EditButtons = <>
                FieldName = 'qty_output'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#20837#24211#25968#37327
                Width = 150
              end
              item
                EditButtons = <>
                FieldName = 'qyt_closed'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26399#26411#22312#32447#25968#37327
                Width = 150
              end
              item
                EditButtons = <>
                FieldName = 'material_opening'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26399#21021#26448#26009#25104#26412
                Width = 150
              end
              item
                EditButtons = <>
                FieldName = 'material_input'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#25237#20135#26448#26009#25104#26412
                Width = 150
              end
              item
                EditButtons = <>
                FieldName = 'material_output'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#20837#24211#26448#26009#25104#26412
                Width = 150
              end
              item
                EditButtons = <>
                FieldName = 'material_closed'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26399#26411#22312#32447#26448#26009#25104#26412
                Width = 150
              end
              item
                EditButtons = <>
                FieldName = 'workhouse_opening'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26399#21021#24037#26102
                Width = 150
              end
              item
                EditButtons = <>
                FieldName = 'workhouse_input'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#25237#20837#24037#26102
                Width = 150
              end
              item
                EditButtons = <>
                FieldName = 'workhouse_output'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#20837#24211#24037#26102
                Width = 150
              end
              item
                EditButtons = <>
                FieldName = 'workhouse_closed'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26399#26411#22312#32447#24037#26102
                Width = 150
              end
              item
                EditButtons = <>
                FieldName = 'whcost_opening'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26399#21021#24037#26102#25104#26412
                Width = 150
              end
              item
                EditButtons = <>
                FieldName = 'whcost_input'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#25237#20837#24037#26102#25104#26412
                Width = 150
              end
              item
                EditButtons = <>
                FieldName = 'whcost_output'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#20837#24211#24037#26102#25104#26412
                Width = 150
              end
              item
                EditButtons = <>
                FieldName = 'whcost_closed'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26399#26411#22312#32447#24037#26102#25104#26412
                Width = 150
              end
              item
                EditButtons = <>
                FieldName = 'ovhdcost_opening'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26399#21021#21046#36896#36153#29992
                Width = 150
              end
              item
                EditButtons = <>
                FieldName = 'ovhdcost_input'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#25237#20837#21046#36896#36153#29992'|'#21378#20869
                Width = 111
              end
              item
                EditButtons = <>
                FieldName = 'ovhdcost_inputSC'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#25237#20837#21046#36896#36153#29992'|'#22806#21457
                Width = 111
              end
              item
                EditButtons = <>
                FieldName = 'ovhdcost_output'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#20837#24211#21046#36896#36153#29992
                Width = 150
              end
              item
                EditButtons = <>
                FieldName = 'ovhdcost_closed'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26399#26411#22312#32447#21046#36896#36153#29992
                Width = 150
              end>
          end
        end
        object TabSheet17: TTabSheet
          Caption = #26126#32454#25968#25454
          ImageIndex = 1
          OnShow = TabSheet16Show
          object DBGridEh8: TDBGridEh
            Left = 0
            Top = 0
            Width = 763
            Height = 411
            Align = alClient
            DataSource = DataSource8
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -13
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            FooterRowCount = 1
            ReadOnly = True
            SumList.Active = True
            TabOrder = 0
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            UseMultiTitle = True
            OnTitleClick = DBGridEh8TitleClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'PROD_CODE'
                Footers = <>
                ReadOnly = False
                Title.Caption = #20135#21697#20195#30721
                Title.Color = clRed
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'PRODUCT_NAME'
                Footers = <>
                ReadOnly = False
                Title.Caption = #20135#21697#21517#31216
                Width = 150
              end
              item
                EditButtons = <>
                FieldName = 'PRODUCT_DESC'
                Footers = <>
                ReadOnly = False
                Title.Caption = #20135#21697#35268#26684
                Width = 200
              end
              item
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
                ReadOnly = False
                Title.Caption = #23458#25143#31616#31216
              end
              item
                EditButtons = <>
                FieldName = 'DEPT_NAME'
                Footers = <>
                ReadOnly = False
                Title.Caption = #29983#20135#37096#38376
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'CUT_NO'
                Footers = <>
                ReadOnly = False
                Title.Caption = #29983#20135#35746#21333
              end
              item
                EditButtons = <>
                FieldName = 'SO_NO'
                Footers = <>
                ReadOnly = False
                Title.Caption = #38144#21806#35746#21333
              end
              item
                EditButtons = <>
                FieldName = 'qty_opening'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26399#21021#22312#32447#25968#37327
                Width = 130
              end
              item
                EditButtons = <>
                FieldName = 'qty_input'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#25237#20837#25968#37327
                Width = 130
              end
              item
                EditButtons = <>
                FieldName = 'qty_output'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#20837#24211#25968#37327
                Width = 130
              end
              item
                EditButtons = <>
                FieldName = 'qyt_closed'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26399#26411#22312#32447#25968#37327
                Width = 130
              end
              item
                EditButtons = <>
                FieldName = 'material_opening'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26399#21021#26448#26009#25104#26412
                Width = 130
              end
              item
                EditButtons = <>
                FieldName = 'material_input'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#25237#20837#26448#26009#25104#26412
                Width = 130
              end
              item
                EditButtons = <>
                FieldName = 'material_output'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#20837#24211#26448#26009#25104#26412
                Width = 130
              end
              item
                EditButtons = <>
                FieldName = 'material_closed'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26399#26411#22312#32447#26448#26009#25104#26412
                Width = 130
              end
              item
                EditButtons = <>
                FieldName = 'workhouse_opening'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26399#21021#24037#26102
                Width = 130
              end
              item
                EditButtons = <>
                FieldName = 'workhouse_input'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#25237#20837#24037#26102
                Width = 130
              end
              item
                EditButtons = <>
                FieldName = 'workhouse_output'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#20837#24211#24037#26102
                Width = 130
              end
              item
                EditButtons = <>
                FieldName = 'workhouse_closed'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26399#26411#22312#32447#24037#26102
                Width = 130
              end
              item
                EditButtons = <>
                FieldName = 'whcost_opening'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26399#21021#24037#26102#25104#26412
                Width = 130
              end
              item
                EditButtons = <>
                FieldName = 'whcost_input'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#25237#20837#24037#26102#25104#26412
                Width = 130
              end
              item
                EditButtons = <>
                FieldName = 'whcost_output'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#20837#24211#24037#26102#25104#26412
                Width = 130
              end
              item
                EditButtons = <>
                FieldName = 'whcost_closed'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26399#26411#22312#32447#24037#26102#25104#26412
                Width = 130
              end
              item
                EditButtons = <>
                FieldName = 'ovhdcost_opening'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26399#21021#21046#36896#36153#29992
                Width = 130
              end
              item
                EditButtons = <>
                FieldName = 'ovhdcost_input'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#25237#20837#21046#36896#36153#29992'|'#21378#20869
                Width = 111
              end
              item
                EditButtons = <>
                FieldName = 'ovhdcost_inputSC'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#25237#20837#21046#36896#36153#29992'|'#22806#21457
                Width = 111
              end
              item
                EditButtons = <>
                FieldName = 'ovhdcost_output'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#20837#24211#21046#36896#36153#29992
                Width = 130
              end
              item
                EditButtons = <>
                FieldName = 'ovhdcost_closed'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26399#26411#22312#32447#21046#36896#36153#29992
                Width = 130
              end>
          end
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 791
        Height = 33
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Label4: TLabel
          Left = 198
          Top = 11
          Width = 52
          Height = 13
          Alignment = taRightJustify
          Caption = #20135#21697#20195#30721
        end
        object Edit4: TEdit
          Left = 256
          Top = 8
          Width = 153
          Height = 21
          TabOrder = 0
          OnChange = Edit4Change
        end
      end
    end
  end
  object ComboBox1: TComboBox
    Left = 288
    Top = 11
    Width = 209
    Height = 24
    Style = csDropDownList
    Font.Charset = GB2312_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 1
    OnChange = ComboBox1Change
  end
  object PopupMenu1: TPopupMenu
    Left = 280
    Top = 262
    object N1: TMenuItem
      Caption = #26597#23436#24037#24037#21333#25104#26412
      OnClick = N1Click
    end
    object N26: TMenuItem
      Caption = #23548#20986'EXCEL'
      OnClick = N26Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 96
    Top = 6
    object m1: TMenuItem
      Caption = #26448#26009#25104#26412'('#37096#38376')'
      OnClick = m1Click
    end
    object m2: TMenuItem
      Caption = #26448#26009#25104#26412'('#26377#29983#20135#21333')'
      OnClick = m2Click
    end
    object m3: TMenuItem
      Caption = #26448#26009#25104#26412'('#26080#29983#20135#21333')'
      OnClick = m3Click
    end
    object dfh1: TMenuItem
      Caption = '-'
    end
    object N17: TMenuItem
      Caption = #26448#26009#32467#26500#25968#25454
      Visible = False
      OnClick = N17Click
    end
    object N18: TMenuItem
      Caption = '-'
    end
    object N19: TMenuItem
      Caption = #21046#36896#36153#29992#32467#26500
      OnClick = N19Click
    end
    object N21: TMenuItem
      Caption = '-'
    end
    object MenuItem1: TMenuItem
      Caption = 'WIP'#36820#24037#25104#26412
      Visible = False
      OnClick = MenuItem1Click
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object N22: TMenuItem
      Caption = #26448#26009#36827#20986#23384#27719#24635
      OnClick = N22Click
    end
    object N24: TMenuItem
      Caption = #26448#26009#36827#20986#23384#26126#32454
      OnClick = N24Click
    end
    object N23: TMenuItem
      Caption = '-'
    end
    object N12: TMenuItem
      Caption = #25104#21697#36827#20986#23384#27719#24635
      OnClick = N12Click
    end
    object N13: TMenuItem
      Caption = #25104#21697#36827#20986#23384#26126#32454
      OnClick = N13Click
    end
    object N20: TMenuItem
      Caption = '-'
    end
    object N27: TMenuItem
      Caption = #22312#21046#21697#36827#20986#23384#27719#24635
      OnClick = N27Click
    end
    object N28: TMenuItem
      Caption = #22312#21046#21697#36827#20986#23384#26126#32454
      OnClick = N28Click
    end
    object N8: TMenuItem
      Caption = '-'
      GroupIndex = 1
    end
    object N14: TMenuItem
      Caption = #25253#24223#25104#26412#27719#24635
      GroupIndex = 1
      Visible = False
      OnClick = N14Click
    end
    object N16: TMenuItem
      Caption = #25253#24223#25104#26412#26126#32454
      GroupIndex = 1
      Visible = False
      OnClick = N16Click
    end
    object N15: TMenuItem
      Caption = '-'
      GroupIndex = 1
    end
    object N2: TMenuItem
      Caption = #23436#24037#25104#26412#25353#23458#25143#27719#24635
      GroupIndex = 1
      Visible = False
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #23436#24037#25104#26412#25353#31867#21035#27719#24635' '
      GroupIndex = 1
      Visible = False
      OnClick = N3Click
    end
    object N9: TMenuItem
      Caption = '-'
      GroupIndex = 2
    end
    object N4: TMenuItem
      Caption = #38144#21806#25104#26412#27719#24635
      GroupIndex = 2
      Visible = False
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #38144#21806#25104#26412#26126#32454
      GroupIndex = 2
      Visible = False
      OnClick = N5Click
    end
    object N10: TMenuItem
      Caption = '-'
      GroupIndex = 3
    end
    object N6: TMenuItem
      Caption = #26448#26009#21457#20986#21435#21521
      GroupIndex = 3
      Visible = False
      OnClick = N6Click
    end
    object N7: TMenuItem
      Caption = #26448#26009#36141#20837#26469#28304
      GroupIndex = 3
      Visible = False
      OnClick = N7Click
    end
  end
  object ADS451_total: TADODataSet
    Connection = DM.Conn
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     TOP (100) PERCENT dbo.Data0019.inv_group_name, dbo.Da' +
      'ta0496.GROUP_NAME, dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.IN' +
      'V_PART_DESCRIPTION, '#13#10'                      dbo.Data0002.UNIT_CO' +
      'DE, dbo.Data0017.STOCK_SELL, SUM(dbo.Data0446.OPEN_QUANTITY) AS ' +
      'open_quantity, '#13#10'                      SUM(dbo.Data0446.OPEN_QUA' +
      'NTITY * dbo.Data0446.UNIT_PRICE) AS open_amount, SUM(dbo.Data044' +
      '6.IN_QUANTITY) AS in_quantity, '#13#10'                      SUM(dbo.D' +
      'ata0446.IN_QUANTITY * dbo.Data0446.UNIT_PRICE) AS in_amount, SUM' +
      '(dbo.Data0446.OUT_QUANTITY) AS out_quantity, '#13#10'                 ' +
      '     SUM(dbo.Data0446.OUT_QUANTITY * dbo.Data0446.UNIT_PRICE) AS' +
      ' out_amount, SUM(dbo.Data0446.REJECT_QUANTITY) AS reject_quantit' +
      'y, '#13#10'                      SUM(dbo.Data0446.REJECT_QUANTITY * db' +
      'o.Data0446.UNIT_PRICE) AS reject_amount, SUM(dbo.Data0446.RETURN' +
      '_QUANTITY) AS return_quantity, '#13#10'                      SUM(dbo.D' +
      'ata0446.RETURN_QUANTITY * dbo.Data0446.UNIT_PRICE) AS return_amo' +
      'unt, SUM(dbo.Data0446.CLOSED_QUANTITY) AS closed_quantity, '#13#10'   ' +
      '                   SUM(dbo.Data0446.CLOSED_QUANTITY * dbo.Data04' +
      '46.UNIT_PRICE) AS closed_amount, dbo.Data0015.ABBR_NAME'#13#10'FROM   ' +
      '      dbo.Data0002 INNER JOIN'#13#10'                      dbo.Data001' +
      '7 INNER JOIN'#13#10'                      dbo.Data0446 ON dbo.Data0017' +
      '.RKEY = dbo.Data0446.INVENT_PTR INNER JOIN'#13#10'                    ' +
      '  dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY INN' +
      'ER JOIN'#13#10'                      dbo.Data0019 ON dbo.Data0496.grou' +
      'p_ptr = dbo.Data0019.rkey INNER JOIN'#13#10'                      dbo.' +
      'Data0022 ON dbo.Data0446.D0022_PTR = dbo.Data0022.RKEY ON dbo.Da' +
      'ta0002.RKEY = dbo.Data0022.LOCATION_PTR_FROM INNER JOIN'#13#10'       ' +
      '               dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data04' +
      '56.RKEY INNER JOIN'#13#10'                      dbo.Data0015 ON dbo.Da' +
      'ta0456.warehouse_ptr = dbo.Data0015.RKEY'#13#10'WHERE     (dbo.Data044' +
      '6.D0451_PTR = :rkey451)'#13#10'GROUP BY dbo.Data0019.inv_group_name, d' +
      'bo.Data0496.GROUP_NAME, dbo.Data0017.INV_PART_NUMBER, dbo.Data00' +
      '17.INV_PART_DESCRIPTION, '#13#10'                      dbo.Data0002.UN' +
      'IT_CODE, dbo.Data0017.STOCK_SELL, dbo.Data0015.ABBR_NAME'#13#10'ORDER ' +
      'BY dbo.Data0019.inv_group_name, dbo.Data0496.GROUP_NAME, dbo.Dat' +
      'a0017.INV_PART_NUMBER'
    Parameters = <
      item
        Name = 'rkey451'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 295
      end>
    Left = 180
    Top = 294
    object ADS451_totalinv_group_name: TStringField
      DisplayLabel = #32452#21035#20195#30721
      DisplayWidth = 10
      FieldName = 'inv_group_name'
    end
    object ADS451_totalGROUP_NAME: TStringField
      DisplayLabel = #31867#22411#20195#30721
      FieldName = 'GROUP_NAME'
      Size = 10
    end
    object ADS451_totalINV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADS451_totalINV_PART_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#21517#31216#35268#26684
      FieldName = 'INV_PART_DESCRIPTION'
      Size = 100
    end
    object ADS451_totalUNIT_CODE: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object ADS451_totalSTOCK_SELL: TFloatField
      DisplayLabel = #21333#20301#38754#31215
      FieldName = 'STOCK_SELL'
    end
    object ADS451_totalopen_quantity: TBCDField
      DisplayLabel = #26399#21021#25968#37327
      FieldName = 'open_quantity'
      Precision = 32
    end
    object ADS451_totalopen_amount: TFloatField
      DisplayLabel = #26399#21021#37329#39069
      FieldName = 'open_amount'
    end
    object ADS451_totalin_quantity: TBCDField
      DisplayLabel = #26412#26399#20837#24211
      FieldName = 'in_quantity'
      Precision = 32
    end
    object ADS451_totalin_amount: TFloatField
      DisplayLabel = #20837#24211#37329#39069
      FieldName = 'in_amount'
    end
    object ADS451_totalout_quantity: TBCDField
      DisplayLabel = #26412#26399#20986#24211
      FieldName = 'out_quantity'
      Precision = 32
    end
    object ADS451_totalout_amount: TFloatField
      DisplayLabel = #20986#24211#37329#39069
      FieldName = 'out_amount'
    end
    object ADS451_totalreject_quantity: TBCDField
      DisplayLabel = #26412#26399#25253#24223
      FieldName = 'reject_quantity'
      Precision = 32
    end
    object ADS451_totalreject_amount: TFloatField
      DisplayLabel = #25253#24223#37329#39069
      FieldName = 'reject_amount'
    end
    object ADS451_totalreturn_quantity: TBCDField
      DisplayLabel = #26412#26399#36864#36135
      FieldName = 'return_quantity'
      Precision = 32
    end
    object ADS451_totalreturn_amount: TFloatField
      DisplayLabel = #36864#36135#37329#39069
      FieldName = 'return_amount'
    end
    object ADS451_totalclosed_quantity: TBCDField
      DisplayLabel = #26399#26411#24211#23384
      FieldName = 'closed_quantity'
      Precision = 32
    end
    object ADS451_totalclosed_amount: TFloatField
      DisplayLabel = #24211#23384#37329#39069
      FieldName = 'closed_amount'
    end
    object ADS451_totalABBR_NAME: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS451_total
    Left = 148
    Top = 294
  end
  object ADS451_list: TADODataSet
    Connection = DM.Conn
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     TOP (100) PERCENT dbo.Data0019.inv_group_name, dbo.Da' +
      'ta0496.GROUP_NAME, dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.ST' +
      'OCK_SELL, '#13#10'                      dbo.Data0017.INV_PART_DESCRIPT' +
      'ION, dbo.Data0002.UNIT_CODE, dbo.Data0023.ABBR_NAME, dbo.Data001' +
      '6.LOCATION, dbo.Data0022.rohs, '#13#10'                      dbo.Data0' +
      '022.SUPPLIER2, dbo.Data0446.OPEN_QUANTITY, dbo.Data0446.IN_QUANT' +
      'ITY, dbo.Data0446.OUT_QUANTITY, dbo.Data0446.CLOSED_QUANTITY, '#13#10 +
      '                      dbo.Data0446.REJECT_QUANTITY, dbo.Data0446' +
      '.RETURN_QUANTITY, dbo.Data0446.UNIT_PRICE, dbo.Data0446.tax_2, '#13 +
      #10'                      dbo.Data0446.OPEN_QUANTITY * dbo.Data0446' +
      '.UNIT_PRICE AS OPEN_amount, dbo.Data0446.IN_QUANTITY * dbo.Data0' +
      '446.UNIT_PRICE AS in_amount, '#13#10'                      dbo.Data044' +
      '6.OUT_QUANTITY * dbo.Data0446.UNIT_PRICE AS out_amount, dbo.Data' +
      '0446.CLOSED_QUANTITY * dbo.Data0446.UNIT_PRICE AS closed_amount,' +
      ' '#13#10'                      dbo.Data0446.REJECT_QUANTITY * dbo.Data' +
      '0446.UNIT_PRICE AS reject_amount, dbo.Data0446.RETURN_QUANTITY *' +
      ' dbo.Data0446.UNIT_PRICE AS return_amount, '#13#10'                   ' +
      '   dbo.Data0015.ABBR_NAME AS abbrname15'#13#10'FROM         dbo.Data00' +
      '23 INNER JOIN'#13#10'                      dbo.Data0456 ON dbo.Data002' +
      '3.RKEY = dbo.Data0456.SUPP_PTR INNER JOIN'#13#10'                     ' +
      ' dbo.Data0017 INNER JOIN'#13#10'                      dbo.Data0446 ON ' +
      'dbo.Data0017.RKEY = dbo.Data0446.INVENT_PTR INNER JOIN'#13#10'        ' +
      '              dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0' +
      '496.RKEY INNER JOIN'#13#10'                      dbo.Data0019 ON dbo.D' +
      'ata0496.group_ptr = dbo.Data0019.rkey INNER JOIN'#13#10'              ' +
      '        dbo.Data0022 ON dbo.Data0446.D0022_PTR = dbo.Data0022.RK' +
      'EY INNER JOIN'#13#10'                      dbo.Data0002 ON dbo.Data002' +
      '2.LOCATION_PTR_FROM = dbo.Data0002.RKEY ON dbo.Data0456.RKEY = d' +
      'bo.Data0022.GRN_PTR INNER JOIN'#13#10'                      dbo.Data00' +
      '16 ON dbo.Data0022.LOCATION_PTR = dbo.Data0016.RKEY INNER JOIN'#13#10 +
      '                      dbo.Data0015 ON dbo.Data0456.warehouse_ptr' +
      ' = dbo.Data0015.RKEY'#13#10'WHERE     (dbo.Data0446.D0451_PTR = :rkey4' +
      '51)'#13#10'ORDER BY dbo.Data0019.inv_group_name, dbo.Data0496.GROUP_NA' +
      'ME, dbo.Data0017.INV_PART_NUMBER'
    Parameters = <
      item
        Name = 'rkey451'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 295
      end>
    Left = 180
    Top = 326
    object ADS451_listinv_group_name: TStringField
      DisplayLabel = #32452#21035#20195#30721
      DisplayWidth = 10
      FieldName = 'inv_group_name'
    end
    object ADS451_listGROUP_NAME: TStringField
      DisplayLabel = #31867#22411#20195#30721
      FieldName = 'GROUP_NAME'
      Size = 10
    end
    object ADS451_listINV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADS451_listSTOCK_SELL: TFloatField
      DisplayLabel = #21333#20301#38754#31215
      FieldName = 'STOCK_SELL'
    end
    object ADS451_listINV_PART_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#21517#31216#35268#26684
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ADS451_listUNIT_CODE: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object ADS451_listABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADS451_listLOCATION: TStringField
      DisplayLabel = #20179#24211
      FieldName = 'LOCATION'
    end
    object ADS451_listrohs: TStringField
      DisplayLabel = 'ROHS'
      FieldName = 'rohs'
      Size = 10
    end
    object ADS451_listSUPPLIER2: TStringField
      DisplayLabel = #21407#20379#24212#21830
      FieldName = 'SUPPLIER2'
      Size = 10
    end
    object ADS451_listOPEN_QUANTITY: TBCDField
      DisplayLabel = #26399#21021#25968#37327
      FieldName = 'OPEN_QUANTITY'
      Precision = 18
    end
    object ADS451_listIN_QUANTITY: TBCDField
      DisplayLabel = #26412#26399#20837#24211
      FieldName = 'IN_QUANTITY'
      Precision = 18
    end
    object ADS451_listOUT_QUANTITY: TBCDField
      DisplayLabel = #26412#26399#20986#24211
      FieldName = 'OUT_QUANTITY'
      Precision = 18
    end
    object ADS451_listCLOSED_QUANTITY: TBCDField
      DisplayLabel = #26399#26411#24211#23384
      FieldName = 'CLOSED_QUANTITY'
      Precision = 18
    end
    object ADS451_listREJECT_QUANTITY: TBCDField
      DisplayLabel = #25253#24223#25968#37327
      FieldName = 'REJECT_QUANTITY'
      Precision = 18
    end
    object ADS451_listRETURN_QUANTITY: TBCDField
      DisplayLabel = #36864#36135#25968#37327
      FieldName = 'RETURN_QUANTITY'
      Precision = 18
    end
    object ADS451_listUNIT_PRICE: TFloatField
      DisplayLabel = #21333#20215
      FieldName = 'UNIT_PRICE'
    end
    object ADS451_listtax_2: TFloatField
      DisplayLabel = #31246#29575'%'
      FieldName = 'tax_2'
    end
    object ADS451_listOPEN_amount: TFloatField
      DisplayLabel = #26399#21021#37329#39069
      FieldName = 'OPEN_amount'
      ReadOnly = True
    end
    object ADS451_listin_amount: TFloatField
      DisplayLabel = #26412#26399#37329#39069
      FieldName = 'in_amount'
      ReadOnly = True
    end
    object ADS451_listout_amount: TFloatField
      DisplayLabel = #20986#24211#37329#39069
      FieldName = 'out_amount'
      ReadOnly = True
    end
    object ADS451_listclosed_amount: TFloatField
      DisplayLabel = #26399#26411#37329#39069
      FieldName = 'closed_amount'
      ReadOnly = True
    end
    object ADS451_listreject_amount: TFloatField
      DisplayLabel = #25253#24223#37329#39069
      FieldName = 'reject_amount'
      ReadOnly = True
    end
    object ADS451_listreturn_amount: TFloatField
      DisplayLabel = #36864#36135#37329#39069
      FieldName = 'return_amount'
      ReadOnly = True
    end
    object ADS451_listabbrname15: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'abbrname15'
      Size = 10
    end
  end
  object DataSource2: TDataSource
    DataSet = ADS451_list
    Left = 148
    Top = 326
  end
  object ADS372_total: TADODataSet
    Connection = DM.Conn
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT t8.PROD_CODE,t8.PRODUCT_NAME,t8.PRODUCT_DESC,t372.UNIT_PR' +
      'ICE,'#13#10'SUM(t372.OPEN_QUANTITY) AS OPEN_QUANTITY,OPEN_AMOUNT = SUM' +
      '(t372.OPEN_QUANTITY * t372.UNIT_PRICE),'#13#10'SUM(t372.IN_QUANTITY) A' +
      'S IN_QUANTITY,IN_AMOUNT = SUM(t372.IN_QUANTITY * t372.UNIT_PRICE' +
      '),'#13#10'SUM(t372.OUT_QUANTITY) AS OUT_QUANTITY,OUT_AMOUNT = SUM(t372' +
      '.OUT_QUANTITY * t372.UNIT_PRICE),'#13#10'SUM(t372.CLOSED_QUANTITY) AS ' +
      'CLOSED_QUANTITY,CLOSED_AMOUNT = SUM(t372.CLOSED_QUANTITY * t372.' +
      'UNIT_PRICE),'#13#10'SUM(t372.TRANS_QUANTITY) AS TRANS_QUANTITY,TRANS_A' +
      'MOUNT = SUM(t372.TRANS_QUANTITY * t372.UNIT_PRICE)'#13#10'FROM dbo.Dat' +
      'a0372 t372'#13#10'INNER JOIN dbo.Data0008 t8 ON t372.customer_part_PTR' +
      ' = t8.RKEY'#13#10'INNER JOIN dbo.Data0016 t16 ON t372.location_ptr = t' +
      '16.RKEY'#13#10'WHERE t372.D0451_PTR = :rkey451'#13#10'GROUP BY t8.PROD_CODE,' +
      't8.PRODUCT_NAME,t8.PRODUCT_DESC,t372.UNIT_PRICE'
    Parameters = <
      item
        Name = 'rkey451'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 295
      end>
    Left = 180
    Top = 365
    object ADS372_totalPROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 15
    end
    object ADS372_totalPRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADS372_totalPRODUCT_DESC: TStringField
      FieldName = 'PRODUCT_DESC'
      Size = 200
    end
    object ADS372_totalUNIT_PRICE: TFloatField
      FieldName = 'UNIT_PRICE'
    end
    object ADS372_totalOPEN_QUANTITY: TBCDField
      FieldName = 'OPEN_QUANTITY'
      ReadOnly = True
      Precision = 32
      Size = 3
    end
    object ADS372_totalOPEN_AMOUNT: TFloatField
      FieldName = 'OPEN_AMOUNT'
      ReadOnly = True
    end
    object ADS372_totalIN_QUANTITY: TBCDField
      FieldName = 'IN_QUANTITY'
      ReadOnly = True
      Precision = 32
      Size = 3
    end
    object ADS372_totalIN_AMOUNT: TFloatField
      FieldName = 'IN_AMOUNT'
      ReadOnly = True
    end
    object ADS372_totalOUT_QUANTITY: TBCDField
      FieldName = 'OUT_QUANTITY'
      ReadOnly = True
      Precision = 32
      Size = 3
    end
    object ADS372_totalOUT_AMOUNT: TFloatField
      FieldName = 'OUT_AMOUNT'
      ReadOnly = True
    end
    object ADS372_totalCLOSED_QUANTITY: TBCDField
      FieldName = 'CLOSED_QUANTITY'
      ReadOnly = True
      Precision = 32
      Size = 3
    end
    object ADS372_totalCLOSED_AMOUNT: TFloatField
      FieldName = 'CLOSED_AMOUNT'
      ReadOnly = True
    end
    object ADS372_totalTRANS_QUANTITY: TBCDField
      FieldName = 'TRANS_QUANTITY'
      ReadOnly = True
      Precision = 32
      Size = 3
    end
    object ADS372_totalTRANS_AMOUNT: TFloatField
      FieldName = 'TRANS_AMOUNT'
      ReadOnly = True
    end
  end
  object DataSource3: TDataSource
    DataSet = ADS372_total
    Left = 148
    Top = 365
  end
  object ADS372_list: TADODataSet
    Connection = DM.Conn
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT t8.PROD_CODE,t8.PRODUCT_NAME,t8.PRODUCT_DESC,t16.LOCATION' +
      ',t372.UNIT_PRICE,'#13#10't372.OPEN_QUANTITY,OPEN_AMOUNT = t372.OPEN_QU' +
      'ANTITY * t372.UNIT_PRICE,'#13#10't372.IN_QUANTITY,IN_AMOUNT = t372.IN_' +
      'QUANTITY * t372.UNIT_PRICE,'#13#10't372.OUT_QUANTITY,OUT_AMOUNT = t372' +
      '.OUT_QUANTITY * t372.UNIT_PRICE,'#13#10't372.CLOSED_QUANTITY,CLOSED_AM' +
      'OUNT = t372.CLOSED_QUANTITY * t372.UNIT_PRICE,'#13#10't372.TRANS_QUANT' +
      'ITY,TRANS_AMOUNT = t372.TRANS_QUANTITY * t372.UNIT_PRICE'#13#10'FROM d' +
      'bo.Data0372 t372'#13#10'INNER JOIN dbo.Data0008 t8 ON t372.customer_pa' +
      'rt_PTR = t8.RKEY'#13#10'INNER JOIN dbo.Data0016 t16 ON t372.location_p' +
      'tr = t16.RKEY'#13#10'WHERE t372.D0451_PTR = :rkey451'
    IndexFieldNames = 'PROD_CODE'
    Parameters = <
      item
        Name = 'rkey451'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 180
    Top = 405
    object ADS372_listPROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 15
    end
    object ADS372_listPRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADS372_listPRODUCT_DESC: TStringField
      FieldName = 'PRODUCT_DESC'
      Size = 200
    end
    object ADS372_listLOCATION: TStringField
      FieldName = 'LOCATION'
    end
    object ADS372_listUNIT_PRICE: TFloatField
      FieldName = 'UNIT_PRICE'
    end
    object ADS372_listOPEN_QUANTITY: TBCDField
      FieldName = 'OPEN_QUANTITY'
      Precision = 10
      Size = 3
    end
    object ADS372_listOPEN_AMOUNT: TFloatField
      FieldName = 'OPEN_AMOUNT'
      ReadOnly = True
    end
    object ADS372_listIN_QUANTITY: TBCDField
      FieldName = 'IN_QUANTITY'
      Precision = 10
      Size = 3
    end
    object ADS372_listIN_AMOUNT: TFloatField
      FieldName = 'IN_AMOUNT'
      ReadOnly = True
    end
    object ADS372_listOUT_QUANTITY: TBCDField
      FieldName = 'OUT_QUANTITY'
      Precision = 10
      Size = 3
    end
    object ADS372_listOUT_AMOUNT: TFloatField
      FieldName = 'OUT_AMOUNT'
      ReadOnly = True
    end
    object ADS372_listCLOSED_QUANTITY: TBCDField
      FieldName = 'CLOSED_QUANTITY'
      Precision = 10
      Size = 3
    end
    object ADS372_listCLOSED_AMOUNT: TFloatField
      FieldName = 'CLOSED_AMOUNT'
      ReadOnly = True
    end
    object ADS372_listTRANS_QUANTITY: TBCDField
      FieldName = 'TRANS_QUANTITY'
      Precision = 10
      Size = 3
    end
    object ADS372_listTRANS_AMOUNT: TFloatField
      FieldName = 'TRANS_AMOUNT'
      ReadOnly = True
    end
  end
  object DataSource4: TDataSource
    DataSet = ADS372_list
    Left = 148
    Top = 405
  end
  object ADS464_SO: TADODataSet
    Connection = DM.Conn
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT TOP 100 PERCENT dbo.Data0008.PROD_CODE, dbo.Data0008.PROD' +
      'UCT_NAME, '#13#10'      dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MA' +
      'NU_PART_DESC, '#13#10'      dbo.Data0010.CUST_CODE, dbo.Data0060.SALES' +
      '_ORDER, dbo.Data0060.SCH_DATE, '#13#10'      dbo.Data0060.PARTS_ORDERE' +
      'D, dbo.Data0060.ISSUED_QTY, '#13#10'      SUM(dbo.Data0464.QUAN_PROD) ' +
      'AS quan_prod, dbo.Data0464.so_ptr, '#13#10'       SUM(dbo.Data0464.MAT' +
      'L_COST) AS matl_cost, '#13#10'      SUM(dbo.Data0464.OVHD_COST) AS ovh' +
      'd_cost, '#13#10'round(SUM(dbo.Data0464.AMOUNT),2 ) AS amount,'#13#10' round(' +
      'SUM(dbo.Data0464.square),3) AS square, '#13#10'case when SUM(dbo.Data0' +
      '464.square)>0 then'#13#10'      ROUND(SUM(dbo.Data0464.MATL_COST + dbo' +
      '.Data0464.OVHD_COST) '#13#10'      / SUM(dbo.Data0464.square),3)  else' +
      ' 0 end AS sqft_amount, '#13#10'case when SUM(dbo.Data0464.AMOUNT)>0 th' +
      'en'#13#10'      ROUND(SUM(dbo.Data0464.MATL_COST + dbo.Data0464.OVHD_C' +
      'OST) '#13#10'      / SUM(dbo.Data0464.AMOUNT)*100, 2) else 0 end AS qt' +
      'y_amount,'#13#10'case dbo.Data0060.so_tp'#13#10'when 0 then '#39#33258#21046#39' when 1 then' +
      ' '#39#22806#21457#39' when 2 then '#39#20195#21152#24037#39' end so_type'#13#10'FROM dbo.Data0060 INNER JOI' +
      'N'#13#10'      dbo.Data0010 ON '#13#10'      dbo.Data0060.CUSTOMER_PTR = dbo' +
      '.Data0010.RKEY RIGHT OUTER JOIN'#13#10'      dbo.Data0008 INNER JOIN'#13#10 +
      '      dbo.Data0025 ON '#13#10'      dbo.Data0008.RKEY = dbo.Data0025.P' +
      'ROD_CODE_PTR INNER JOIN'#13#10'      dbo.Data0464 ON dbo.Data0025.RKEY' +
      ' = dbo.Data0464.cust_part_ptr ON '#13#10'      dbo.Data0060.RKEY = dbo' +
      '.Data0464.so_ptr'#13#10'WHERE (dbo.Data0464.D0451_PTR = :rkey451)'#13#10'GRO' +
      'UP BY dbo.Data0008.PROD_CODE, dbo.Data0008.PRODUCT_NAME, '#13#10'     ' +
      ' dbo.Data0010.CUST_CODE, dbo.Data0060.SALES_ORDER, dbo.Data0060.' +
      'SCH_DATE, '#13#10'      dbo.Data0060.PARTS_ORDERED, dbo.Data0060.ISSUE' +
      'D_QTY, dbo.Data0464.so_ptr, '#13#10'      dbo.Data0060.so_tp, dbo.Data' +
      '0025.MANU_PART_NUMBER, '#13#10'      dbo.Data0025.MANU_PART_DESC'#13#10'ORDE' +
      'R BY dbo.Data0008.PROD_CODE, dbo.Data0008.PRODUCT_NAME, '#13#10'      ' +
      'dbo.Data0060.SALES_ORDER'
    Parameters = <
      item
        Name = 'rkey451'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 295
      end>
    Left = 313
    Top = 303
    object ADS464_SOPROD_CODE: TStringField
      DisplayLabel = #31867#22411#20195#30721
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADS464_SOPRODUCT_NAME: TStringField
      DisplayLabel = #31867#22411#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADS464_SOMANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADS464_SOMANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADS464_SOCUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADS464_SOSALES_ORDER: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADS464_SOSCH_DATE: TDateTimeField
      DisplayLabel = #22238#22797#20132#26399
      FieldName = 'SCH_DATE'
    end
    object ADS464_SOPARTS_ORDERED: TFloatField
      DisplayLabel = #35746#21333#25968#37327
      FieldName = 'PARTS_ORDERED'
    end
    object ADS464_SOISSUED_QTY: TIntegerField
      DisplayLabel = #25237#20135#25968#37327
      FieldName = 'ISSUED_QTY'
    end
    object ADS464_SOquan_prod: TIntegerField
      DisplayLabel = #20837#24211#25968#37327
      FieldName = 'quan_prod'
    end
    object ADS464_SOso_ptr: TIntegerField
      FieldName = 'so_ptr'
    end
    object ADS464_SOmatl_cost: TFloatField
      DisplayLabel = #26448#26009#25104#26412
      FieldName = 'matl_cost'
    end
    object ADS464_SOovhd_cost: TFloatField
      DisplayLabel = #21046#36896#36153#29992
      FieldName = 'ovhd_cost'
    end
    object ADS464_SOamount: TFloatField
      DisplayLabel = #20837#24211#37329#39069
      FieldName = 'amount'
      ReadOnly = True
    end
    object ADS464_SOsquare: TFloatField
      DisplayLabel = #20837#24211#38754#31215
      FieldName = 'square'
      ReadOnly = True
    end
    object ADS464_SOsqft_amount: TFloatField
      DisplayLabel = #38754#31215#25104#26412
      FieldName = 'sqft_amount'
      ReadOnly = True
    end
    object ADS464_SOqty_amount: TFloatField
      DisplayLabel = #25104#26412#29575'%'
      FieldName = 'qty_amount'
      ReadOnly = True
    end
    object ADS464_SOso_type: TStringField
      DisplayLabel = #35746#21333#31867#22411
      FieldName = 'so_type'
      ReadOnly = True
      Size = 6
    end
  end
  object DataSource5: TDataSource
    DataSet = ADS464_SO
    Left = 280
    Top = 302
  end
  object ADS464_WO: TADODataSet
    Connection = DM.Conn
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT TOP 100 PERCENT dbo.Data0464.WO_PTR, '#13#10'      dbo.Data0006' +
      '.WORK_ORDER_NUMBER, dbo.Data0025.MANU_PART_NUMBER, '#13#10'      dbo.D' +
      'ata0025.MANU_PART_DESC, dbo.Data0008.PROD_CODE, '#13#10'      dbo.Data' +
      '0008.PRODUCT_NAME, SUM(dbo.Data0464.MATL_COST) AS matl_cost, '#13#10' ' +
      '     SUM(dbo.Data0464.OVHD_COST) AS ovhd_cost, SUM(dbo.Data0464.' +
      'QUAN_PROD) '#13#10'      AS quan_prod, SUM(dbo.Data0464.AMOUNT) AS amo' +
      'unt, SUM(dbo.Data0464.square) '#13#10'      AS square,'#13#10'case when SUM(' +
      'Data0464.square)>0 then'#13#10'      ROUND(SUM(Data0464.MATL_COST + Da' +
      'ta0464.OVHD_COST) '#13#10'      / SUM(Data0464.square),3) else 0 end A' +
      'S sqft_amount, '#13#10'case when SUM(Data0464.AMOUNT)>0 then'#13#10'      RO' +
      'UND(SUM(Data0464.MATL_COST + Data0464.OVHD_COST) '#13#10'      / SUM(D' +
      'ata0464.AMOUNT)*100, 2) else 0 end AS qty_amount'#13#10'FROM dbo.Data0' +
      '025 INNER JOIN'#13#10'      dbo.Data0464 INNER JOIN'#13#10'      dbo.Data000' +
      '6 ON dbo.Data0464.WO_PTR = dbo.Data0006.RKEY ON '#13#10'      dbo.Data' +
      '0025.RKEY = dbo.Data0464.cust_part_ptr INNER JOIN'#13#10'      dbo.Dat' +
      'a0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY'#13#10'WHERE (' +
      'dbo.Data0464.D0451_PTR = :rkey451)'#13#10'GROUP BY dbo.Data0464.WO_PTR' +
      ', dbo.Data0006.WORK_ORDER_NUMBER, '#13#10'      dbo.Data0025.MANU_PART' +
      '_NUMBER, dbo.Data0025.MANU_PART_DESC, '#13#10'      dbo.Data0008.PROD_' +
      'CODE, dbo.Data0008.PRODUCT_NAME'#13#10'ORDER BY dbo.Data0006.WORK_ORDE' +
      'R_NUMBER'
    Parameters = <
      item
        Name = 'rkey451'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 295
      end>
    Left = 312
    Top = 341
    object ADS464_WOWO_PTR: TIntegerField
      FieldName = 'WO_PTR'
    end
    object ADS464_WOWORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20316#19994#21333#21495
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ADS464_WOMANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADS464_WOMANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADS464_WOPROD_CODE: TStringField
      DisplayLabel = #31867#22411#20195#30721
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADS464_WOPRODUCT_NAME: TStringField
      DisplayLabel = #31867#22411#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADS464_WOmatl_cost: TFloatField
      DisplayLabel = #26448#26009#25104#26412
      FieldName = 'matl_cost'
    end
    object ADS464_WOovhd_cost: TFloatField
      DisplayLabel = #21046#36896#36153#29992
      FieldName = 'ovhd_cost'
    end
    object ADS464_WOquan_prod: TIntegerField
      DisplayLabel = #20837#24211#25968#37327
      FieldName = 'quan_prod'
    end
    object ADS464_WOamount: TFloatField
      DisplayLabel = #20837#24211#37329#39069
      FieldName = 'amount'
    end
    object ADS464_WOsquare: TFloatField
      DisplayLabel = #20837#24211#38754#31215
      FieldName = 'square'
    end
    object ADS464_WOsqft_amount: TFloatField
      DisplayLabel = #38754#31215#25104#26412
      FieldName = 'sqft_amount'
      ReadOnly = True
    end
    object ADS464_WOqty_amount: TFloatField
      DisplayLabel = #25104#26412#29575'%'
      FieldName = 'qty_amount'
      ReadOnly = True
    end
  end
  object DataSource6: TDataSource
    DataSet = ADS464_WO
    Left = 280
    Top = 340
  end
  object PopupMenu3: TPopupMenu
    Left = 312
    Top = 262
    object N25: TMenuItem
      Caption = #20316#19994#21333#25104#26412#26126#32454
      OnClick = N25Click
    end
    object EXCEL1: TMenuItem
      Caption = #23548#20986'EXCEL'
      OnClick = EXCEL1Click
    end
  end
  object DataSource7: TDataSource
    DataSet = ADS75_total
    Left = 148
    Top = 207
  end
  object DataSource8: TDataSource
    DataSet = ADS75_list
    Left = 148
    Top = 239
  end
  object ADS75_list: TADODataSet
    Connection = DM.Conn
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT t8.PROD_CODE,t8.PRODUCT_NAME,t8.PRODUCT_DESC,t10.ABBR_NAM' +
      'E,t75.CUT_NO,t75.SO_NO,'#13#10't492.mrb_ptr,DEPT_NAME=IsNull(t34.DEPT_' +
      'NAME,'#39#39'),t75.qty_opening,t75.qty_input,t75.qty_output,t75.qyt_cl' +
      'osed,'#13#10't75.material_opening,t75.material_input,t75.material_outp' +
      'ut,t75.material_closed,'#13#10't75.workhouse_opening,t75.workhouse_inp' +
      'ut,t75.workhouse_output,t75.workhouse_closed,'#13#10't75.whcost_openin' +
      'g,t75.whcost_input,t75.whcost_output,t75.whcost_closed,'#13#10't75.ovh' +
      'dcost_opening,t75.ovhdcost_input,t75.ovhdcost_inputSC,t75.ovhdco' +
      'st_output,t75.ovhdcost_closed'#13#10'FROM dbo.wzcp0075 t75'#13#10'INNER JOIN' +
      ' dbo.Data0008 t8 ON t75.CUSTOMER_PART_PTR = t8.RKEY'#13#10'LEFT JOIN d' +
      'bo.Data0010 t10 ON t75.CUSTOMER_PTR = t10.RKEY'#13#10'INNER JOIN dbo.D' +
      'ata0492 t492 ON t75.CUT_NO = t492.CUT_NO'#13#10'LEFT JOIN dbo.Data0034' +
      ' t34 ON t492.mrb_ptr = t34.RKEY'#13#10'WHERE t75.D0451_PTR = :rkey451'
    Parameters = <
      item
        Name = 'rkey451'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 295
      end>
    Left = 180
    Top = 239
    object ADS75_listPROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 15
    end
    object ADS75_listPRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADS75_listPRODUCT_DESC: TStringField
      FieldName = 'PRODUCT_DESC'
      Size = 200
    end
    object ADS75_listABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADS75_listDEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      ReadOnly = True
      Size = 30
    end
    object ADS75_listCUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ADS75_listSO_NO: TStringField
      FieldName = 'SO_NO'
      Size = 12
    end
    object ADS75_listqty_opening: TBCDField
      FieldName = 'qty_opening'
      Precision = 10
      Size = 2
    end
    object ADS75_listqty_input: TBCDField
      FieldName = 'qty_input'
      Precision = 10
      Size = 2
    end
    object ADS75_listqty_output: TBCDField
      FieldName = 'qty_output'
      Precision = 10
      Size = 2
    end
    object ADS75_listqyt_closed: TBCDField
      FieldName = 'qyt_closed'
      Precision = 10
      Size = 2
    end
    object ADS75_listmaterial_opening: TBCDField
      FieldName = 'material_opening'
      Precision = 10
      Size = 2
    end
    object ADS75_listmaterial_input: TBCDField
      FieldName = 'material_input'
      Precision = 10
      Size = 2
    end
    object ADS75_listmaterial_output: TBCDField
      FieldName = 'material_output'
      Precision = 10
      Size = 2
    end
    object ADS75_listmaterial_closed: TBCDField
      FieldName = 'material_closed'
      Precision = 10
      Size = 2
    end
    object ADS75_listworkhouse_opening: TBCDField
      FieldName = 'workhouse_opening'
      Precision = 10
      Size = 2
    end
    object ADS75_listworkhouse_input: TBCDField
      FieldName = 'workhouse_input'
      Precision = 10
      Size = 2
    end
    object ADS75_listworkhouse_output: TBCDField
      FieldName = 'workhouse_output'
      Precision = 10
      Size = 2
    end
    object ADS75_listworkhouse_closed: TBCDField
      FieldName = 'workhouse_closed'
      Precision = 10
      Size = 2
    end
    object ADS75_listwhcost_opening: TBCDField
      FieldName = 'whcost_opening'
      Precision = 10
      Size = 2
    end
    object ADS75_listwhcost_input: TBCDField
      FieldName = 'whcost_input'
      Precision = 10
      Size = 2
    end
    object ADS75_listwhcost_output: TBCDField
      FieldName = 'whcost_output'
      Precision = 10
      Size = 2
    end
    object ADS75_listwhcost_closed: TBCDField
      FieldName = 'whcost_closed'
      Precision = 10
      Size = 2
    end
    object ADS75_listovhdcost_opening: TBCDField
      FieldName = 'ovhdcost_opening'
      Precision = 10
      Size = 2
    end
    object ADS75_listovhdcost_input: TBCDField
      FieldName = 'ovhdcost_input'
      Precision = 10
      Size = 2
    end
    object ADS75_listovhdcost_inputSC: TBCDField
      FieldName = 'ovhdcost_inputSC'
      Precision = 10
      Size = 2
    end
    object ADS75_listovhdcost_output: TBCDField
      FieldName = 'ovhdcost_output'
      Precision = 10
      Size = 2
    end
    object ADS75_listovhdcost_closed: TBCDField
      FieldName = 'ovhdcost_closed'
      Precision = 10
      Size = 2
    end
  end
  object ADS75_total: TADODataSet
    Connection = DM.Conn
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT t8.PROD_CODE,t8.PRODUCT_NAME,t8.PRODUCT_DESC,'#13#10'qty_openin' +
      'g=SUM(t75.qty_opening),qty_input=SUM(t75.qty_input),qty_output=S' +
      'UM(t75.qty_output),qyt_closed=SUM(t75.qyt_closed),'#13#10'material_ope' +
      'ning=SUM(t75.material_opening),material_input=SUM(t75.material_i' +
      'nput),material_output=SUM(t75.material_output),material_closed=S' +
      'UM(t75.material_closed),'#13#10'workhouse_opening=SUM(t75.workhouse_op' +
      'ening),workhouse_input=SUM(t75.workhouse_input),workhouse_output' +
      '=SUM(t75.workhouse_output),workhouse_closed=SUM(t75.workhouse_cl' +
      'osed),'#13#10'whcost_opening=SUM(t75.whcost_opening),whcost_input=SUM(' +
      't75.whcost_input),whcost_output=SUM(t75.whcost_output),whcost_cl' +
      'osed=SUM(t75.whcost_closed),'#13#10'ovhdcost_opening=SUM(t75.ovhdcost_' +
      'opening),ovhdcost_input=SUM(t75.ovhdcost_input),ovhdcost_inputSC' +
      '=SUM(t75.ovhdcost_inputSC),ovhdcost_output=SUM(t75.ovhdcost_outp' +
      'ut),ovhdcost_closed=SUM(t75.ovhdcost_closed)'#13#10'FROM dbo.wzcp0075 ' +
      't75'#13#10'INNER JOIN dbo.Data0008 t8 ON t75.CUSTOMER_PART_PTR = t8.RK' +
      'EY'#13#10'LEFT JOIN dbo.Data0010 t10 ON t75.CUSTOMER_PTR = t10.RKEY'#13#10'W' +
      'HERE t75.D0451_PTR = :rkey451'#13#10'GROUP BY t8.PROD_CODE,t8.PRODUCT_' +
      'NAME,t8.PRODUCT_DESC'
    Parameters = <
      item
        Name = 'rkey451'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 295
      end>
    Left = 180
    Top = 207
    object ADS75_totalPROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 15
    end
    object ADS75_totalPRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADS75_totalPRODUCT_DESC: TStringField
      FieldName = 'PRODUCT_DESC'
      Size = 200
    end
    object ADS75_totalqty_opening: TBCDField
      FieldName = 'qty_opening'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
    object ADS75_totalqty_input: TBCDField
      FieldName = 'qty_input'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
    object ADS75_totalqty_output: TBCDField
      FieldName = 'qty_output'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
    object ADS75_totalqyt_closed: TBCDField
      FieldName = 'qyt_closed'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
    object ADS75_totalmaterial_opening: TBCDField
      FieldName = 'material_opening'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
    object ADS75_totalmaterial_input: TBCDField
      FieldName = 'material_input'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
    object ADS75_totalmaterial_output: TBCDField
      FieldName = 'material_output'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
    object ADS75_totalmaterial_closed: TBCDField
      FieldName = 'material_closed'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
    object ADS75_totalworkhouse_opening: TBCDField
      FieldName = 'workhouse_opening'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
    object ADS75_totalworkhouse_input: TBCDField
      FieldName = 'workhouse_input'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
    object ADS75_totalworkhouse_output: TBCDField
      FieldName = 'workhouse_output'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
    object ADS75_totalworkhouse_closed: TBCDField
      FieldName = 'workhouse_closed'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
    object ADS75_totalwhcost_opening: TBCDField
      FieldName = 'whcost_opening'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
    object ADS75_totalwhcost_input: TBCDField
      FieldName = 'whcost_input'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
    object ADS75_totalwhcost_output: TBCDField
      FieldName = 'whcost_output'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
    object ADS75_totalwhcost_closed: TBCDField
      FieldName = 'whcost_closed'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
    object ADS75_totalovhdcost_opening: TBCDField
      FieldName = 'ovhdcost_opening'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
    object ADS75_totalovhdcost_input: TBCDField
      FieldName = 'ovhdcost_input'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
    object ADS75_totalovhdcost_inputSC: TBCDField
      FieldName = 'ovhdcost_inputSC'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object ADS75_totalovhdcost_output: TBCDField
      FieldName = 'ovhdcost_output'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
    object ADS75_totalovhdcost_closed: TBCDField
      FieldName = 'ovhdcost_closed'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
  end
  object DataSource9: TDataSource
    DataSet = ads428
    Left = 280
    Top = 395
  end
  object DataSource10: TDataSource
    DataSet = ads428_1
    Left = 280
    Top = 443
  end
  object ads428: TADODataSet
    Connection = DM.Conn
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ads428CalcFields
    CommandText = 
      'select Data0428.*,dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV' +
      '_PART_DESCRIPTION,'#13#10#9#9'dbo.Data0017.STD_COST AS matl_std_cost,Dat' +
      'a0015.ABBR_NAME'#13#10'from Data0428'#13#10'left join Data0017 on Data0428.I' +
      'NVENT_PTR = Data0017.RKEY'#13#10'left join Data0015 on Data0428.wareho' +
      'use_ptr = Data0015.RKEY'#13#10'where Isnull(CUT_NO,'#39#39')<>'#39#39#13#10'and D0451_' +
      'PTR = :rkey451'
    Parameters = <
      item
        Name = 'rkey451'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 295
      end>
    Left = 312
    Top = 395
    object ads428RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ads428D0451_PTR: TIntegerField
      FieldName = 'D0451_PTR'
    end
    object ads428CUT_NO: TStringField
      DisplayLabel = #29983#20135#21333#21495
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ads428INVENT_PTR: TIntegerField
      FieldName = 'INVENT_PTR'
    end
    object ads428OPEN_QUANTITY: TFloatField
      FieldName = 'OPEN_QUANTITY'
    end
    object ads428OPEN_AMOUNT: TBCDField
      FieldName = 'OPEN_AMOUNT'
      Precision = 18
      Size = 2
    end
    object ads428IN_QUANTITY: TFloatField
      DisplayLabel = #26412#26399#39046#29992
      FieldName = 'IN_QUANTITY'
    end
    object ads428IN_AMOUNT: TBCDField
      DisplayLabel = #26412#26399#37329#39069
      FieldName = 'IN_AMOUNT'
      Precision = 18
      Size = 2
    end
    object ads428CLOSED_QTY: TFloatField
      FieldName = 'CLOSED_QTY'
    end
    object ads428CLOSED_AMOUNT: TBCDField
      FieldName = 'CLOSED_AMOUNT'
      Precision = 18
      Size = 2
    end
    object ads428QUAN_YIELD_SQFT: TFloatField
      FieldName = 'QUAN_YIELD_SQFT'
    end
    object ads428QUAN_YIELD_AMT: TBCDField
      FieldName = 'QUAN_YIELD_AMT'
      Precision = 18
      Size = 2
    end
    object ads428std_quan_yield: TBCDField
      FieldName = 'std_quan_yield'
      Precision = 12
      Size = 3
    end
    object ads428BUDGET_COST: TBCDField
      FieldName = 'BUDGET_COST'
      Precision = 18
      Size = 2
    end
    object ads428STD_COST: TBCDField
      DisplayLabel = #23454#38469#26631#20934#25104#26412
      FieldName = 'STD_COST'
      Precision = 18
      Size = 2
    end
    object ads428ACTUAL_COST: TBCDField
      DisplayLabel = #23454#38469#32791#29992#25104#26412
      FieldName = 'ACTUAL_COST'
      Precision = 18
      Size = 2
    end
    object ads428warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object ads428INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#20195#21495
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ads428INV_PART_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ads428matl_std_cost: TFloatField
      DisplayLabel = #35745#21010#20215#26684
      FieldName = 'matl_std_cost'
    end
    object ads428ABBR_NAME: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ads428Price: TFloatField
      DisplayLabel = #23454#38469#20215#26684
      FieldKind = fkCalculated
      FieldName = 'Price'
      Calculated = True
    end
    object ads428Diff: TFloatField
      DisplayLabel = #26631#20934#37329#39069#24046#24322
      FieldKind = fkCalculated
      FieldName = 'Diff'
      Calculated = True
    end
  end
  object ads428_1: TADODataSet
    Connection = DM.Conn
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ads428_1CalcFields
    CommandText = 
      'select Data0428.*,dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV' +
      '_PART_DESCRIPTION,'#13#10#9#9'dbo.Data0017.STD_COST AS matl_std_cost,Dat' +
      'a0015.ABBR_NAME'#13#10'from Data0428'#13#10'left join Data0017 on Data0428.I' +
      'NVENT_PTR = Data0017.RKEY'#13#10'left join Data0015 on Data0428.wareho' +
      'use_ptr = Data0015.RKEY'#13#10'where Isnull(CUT_NO,'#39#39')='#39#39#13#10'and D0451_P' +
      'TR = :rkey451'
    Parameters = <
      item
        Name = 'rkey451'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 295
      end>
    Left = 312
    Top = 443
    object IntegerField1: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'D0451_PTR'
    end
    object StringField1: TStringField
      DisplayLabel = #29983#20135#21333#21495
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object IntegerField3: TIntegerField
      FieldName = 'INVENT_PTR'
    end
    object FloatField1: TFloatField
      FieldName = 'OPEN_QUANTITY'
    end
    object BCDField1: TBCDField
      FieldName = 'OPEN_AMOUNT'
      Precision = 18
      Size = 2
    end
    object FloatField2: TFloatField
      DisplayLabel = #26412#26399#39046#29992
      FieldName = 'IN_QUANTITY'
    end
    object BCDField2: TBCDField
      DisplayLabel = #26412#26399#37329#39069
      FieldName = 'IN_AMOUNT'
      Precision = 18
      Size = 2
    end
    object FloatField3: TFloatField
      FieldName = 'CLOSED_QTY'
    end
    object BCDField3: TBCDField
      FieldName = 'CLOSED_AMOUNT'
      Precision = 18
      Size = 2
    end
    object FloatField4: TFloatField
      FieldName = 'QUAN_YIELD_SQFT'
    end
    object BCDField4: TBCDField
      FieldName = 'QUAN_YIELD_AMT'
      Precision = 18
      Size = 2
    end
    object BCDField5: TBCDField
      FieldName = 'std_quan_yield'
      Precision = 12
      Size = 3
    end
    object BCDField6: TBCDField
      FieldName = 'BUDGET_COST'
      Precision = 18
      Size = 2
    end
    object BCDField7: TBCDField
      DisplayLabel = #23454#38469#26631#20934#25104#26412
      FieldName = 'STD_COST'
      Precision = 18
      Size = 2
    end
    object BCDField8: TBCDField
      DisplayLabel = #23454#38469#32791#29992#25104#26412
      FieldName = 'ACTUAL_COST'
      Precision = 18
      Size = 2
    end
    object IntegerField4: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object StringField2: TStringField
      DisplayLabel = #26448#26009#20195#21495
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object StringField3: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object FloatField5: TFloatField
      DisplayLabel = #35745#21010#20215#26684
      FieldName = 'matl_std_cost'
    end
    object StringField4: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object FloatField6: TFloatField
      DisplayLabel = #23454#38469#20215#26684
      FieldKind = fkCalculated
      FieldName = 'Price'
      Calculated = True
    end
    object FloatField7: TFloatField
      DisplayLabel = #26631#20934#37329#39069#24046#24322
      FieldKind = fkCalculated
      FieldName = 'Diff'
      Calculated = True
    end
  end
end
