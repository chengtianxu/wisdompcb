object frmShow: TfrmShow
  Left = 242
  Top = 156
  Width = 952
  Height = 581
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
    Width = 936
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
    Width = 936
    Height = 502
    ActivePage = TabSheet28
    Align = alClient
    TabOrder = 1
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = #26448#26009#28040#32791#20998#26512
      object PageControl2: TPageControl
        Left = 0
        Top = 0
        Width = 928
        Height = 474
        ActivePage = TabSheet6
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
          Caption = #30452#25509#26448#26009#25104#26412
          object PageControl3: TPageControl
            Left = 0
            Top = 0
            Width = 900
            Height = 466
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
                Width = 900
                Height = 442
                Align = alClient
                ColCount = 10
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
                Width = 840
                Height = 438
                Align = alClient
                ColCount = 22
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
          object PageControl4: TPageControl
            Left = 0
            Top = 0
            Width = 900
            Height = 466
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
                Width = 840
                Height = 438
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
              end
            end
            object TabSheet12: TTabSheet
              Caption = #26126#32454#34920
              ImageIndex = 1
              OnShow = TabSheet11Show
              object StringGrid4: TStringGrid
                Left = 0
                Top = 0
                Width = 840
                Height = 438
                Align = alClient
                ColCount = 22
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
          object PageControl5: TPageControl
            Left = 0
            Top = 0
            Width = 900
            Height = 466
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
                Width = 840
                Height = 438
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
                Width = 840
                Height = 438
                Align = alClient
                ColCount = 21
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
      end
    end
    object TabSheet2: TTabSheet
      Caption = #26448#26009#25104#26412#32467#26500
      ImageIndex = 1
      OnShow = TabSheet2Show
      object StringGrid7: TStringGrid
        Left = 0
        Top = 0
        Width = 936
        Height = 478
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
        Width = 936
        Height = 478
        Align = alClient
        ColCount = 18
        DefaultRowHeight = 19
        FixedCols = 2
        RowCount = 3
        FixedRows = 2
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
          111
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
          64
          64
          64
          64
          64)
        RowHeights = (
          19
          19
          19)
      end
    end
    object TabSheet4: TTabSheet
      Caption = #36820#24037#25104#26412#20998#26512
      ImageIndex = 3
      object PageControl8: TPageControl
        Left = 0
        Top = 0
        Width = 928
        Height = 474
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
            Width = 900
            Height = 466
            ActivePage = TabSheet40
            Align = alClient
            TabOrder = 0
            object TabSheet40: TTabSheet
              Caption = #27719#24635#25968#25454
              OnShow = TabSheet18Show
              object StringGrid10: TStringGrid
                Left = 0
                Top = 0
                Width = 900
                Height = 442
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
                Width = 840
                Height = 438
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
            Width = 848
            Height = 466
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
        Width = 928
        Height = 441
        ActivePage = TabSheet21
        Align = alClient
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        MultiLine = True
        ParentFont = False
        TabOrder = 1
        TabPosition = tpLeft
        OnChange = PageControl9Change
        object TabSheet20: TTabSheet
          Caption = #27719#24635#25968#25454
          OnShow = TabSheet20Show
          object DBGridEh1: TDBGridEh
            Left = 0
            Top = 0
            Width = 908
            Height = 437
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
            Width = 908
            Height = 437
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
        Width = 928
        Height = 33
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
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
        Width = 928
        Height = 442
        ActivePage = TabSheet23
        Align = alClient
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        MultiLine = True
        ParentFont = False
        TabOrder = 1
        TabPosition = tpLeft
        OnChange = PageControl10Change
        object TabSheet23: TTabSheet
          Caption = #27719#24635#25968#25454
          OnShow = TabSheet23Show
          object DBGridEh3: TDBGridEh
            Left = 0
            Top = 0
            Width = 908
            Height = 438
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
            OnKeyDown = DBGridEh3KeyDown
            OnTitleClick = DBGridEh3TitleClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
                ReadOnly = False
              end
              item
                EditButtons = <>
                FieldName = 'PR_GRP_CODE'
                Footers = <>
                ReadOnly = False
                Width = 51
              end
              item
                EditButtons = <>
                FieldName = 'PROD_CODE'
                Footers = <>
                ReadOnly = False
                Width = 54
              end
              item
                EditButtons = <>
                FieldName = 'MANU_PART_NUMBER'
                Footers = <>
                ReadOnly = False
                Title.Color = clRed
                Width = 77
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
                FieldName = 'open_quantity'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'open_amount_cost'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'in_quantity'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'in_amount_cost'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'out_quantity'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'out_amount_cost'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'spec_out_quantity'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'spec_out_amount_cost'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'closed_quantity'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'closed_amount_cost'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'transfer_quantity'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'transfer_amount_cost'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'scrap_quantity'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'scrap_amount_cost'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'abbr_name10'
                Footers = <>
                ReadOnly = False
              end
              item
                EditButtons = <>
                FieldName = 'ORIG_CUSTOMER'
                Footers = <>
                ReadOnly = False
                Width = 78
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
            Width = 908
            Height = 438
            Align = alClient
            DataSource = DataSource4
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -13
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            FooterRowCount = 1
            PopupMenu = PopupMenu7
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
                FieldName = 'abbr_name'
                Footers = <>
                ReadOnly = False
              end
              item
                EditButtons = <>
                FieldName = 'WORK_ORDER_NUMBER'
                Footers = <>
                ReadOnly = False
                Width = 116
              end
              item
                EditButtons = <>
                FieldName = 'MANU_PART_NUMBER'
                Footers = <>
                ReadOnly = False
                Title.Color = clRed
                Width = 77
              end
              item
                EditButtons = <>
                FieldName = 'MANU_PART_DESC'
                Footers = <>
                ReadOnly = False
                Width = 102
              end
              item
                EditButtons = <>
                FieldName = 'PR_GRP_CODE'
                Footers = <>
                ReadOnly = False
                Width = 54
              end
              item
                EditButtons = <>
                FieldName = 'PROD_CODE'
                Footers = <>
                ReadOnly = False
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'PRODUCT_NAME'
                Footers = <>
                ReadOnly = False
                Width = 94
              end
              item
                EditButtons = <>
                FieldName = 'inDATE'
                Footers = <>
                Width = 73
              end
              item
                EditButtons = <>
                FieldName = 'LOCATION'
                Footers = <>
                ReadOnly = False
                Width = 84
              end
              item
                EditButtons = <>
                FieldName = 'unit_sq'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'OPEN_QUANTITY'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'open_amount_cost'
                Footer.ValueType = fvtSum
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
                FieldName = 'in_amount_cost'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'OUT_QUANTITY'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'out_amount_cost'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'SPEC_OUT_QUANTITY'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'spec_out_amount_cost'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 79
              end
              item
                EditButtons = <>
                FieldName = 'CLOSED_QUANTITY'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'closed_amount_cost'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'transfer_quantity'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'transfer_amount_cost'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'scrap_quantity'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'scrap_amount_cost'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'abbr_name10'
                Footers = <>
                ReadOnly = False
              end
              item
                EditButtons = <>
                FieldName = 'ORIG_CUSTOMER'
                Footers = <>
                ReadOnly = False
                Width = 92
              end
              item
                EditButtons = <>
                FieldName = 'c_type'
                Footers = <>
                ReadOnly = False
              end
              item
                EditButtons = <>
                FieldName = 'closed_cost_per_pcs'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'abbr_name23'
                Footers = <>
                ReadOnly = False
                Width = 120
              end>
          end
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 928
        Height = 32
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          928
          32)
        object Label6: TLabel
          Left = 512
          Top = 11
          Width = 65
          Height = 13
          Caption = #35745#31639#20215#26684#65306
        end
        object Label3: TLabel
          Left = 167
          Top = 9
          Width = 52
          Height = 13
          Alignment = taRightJustify
          Caption = #26412#21378#32534#21495
        end
        object ComboBox3: TComboBox
          Left = 755
          Top = 7
          Width = 81
          Height = 21
          Style = csDropDownList
          Anchors = [akTop, akRight]
          ItemHeight = 13
          ItemIndex = 1
          TabOrder = 2
          Text = #25104#26412#20215
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
          TabOrder = 0
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
      object PageControl11: TPageControl
        Left = 0
        Top = 34
        Width = 928
        Height = 440
        ActivePage = TabSheet26
        Align = alClient
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        MultiLine = True
        ParentFont = False
        TabOrder = 1
        TabPosition = tpLeft
        OnChange = PageControl11Change
        object TabSheet26: TTabSheet
          Caption = #27719#24635#25968#25454
          OnShow = TabSheet26Show
          object StringGrid16: TStringGrid
            Left = 0
            Top = 0
            Width = 908
            Height = 436
            Align = alClient
            ColCount = 11
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
              84
              64
              64
              64
              64)
            RowHeights = (
              19
              19)
          end
        end
        object TabSheet27: TTabSheet
          Caption = #26126#32454#25968#25454
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ImageIndex = 1
          ParentFont = False
          OnShow = TabSheet26Show
          object DBGridEh7: TDBGridEh
            Left = 0
            Top = 0
            Width = 908
            Height = 443
            Align = alClient
            DataSource = DataSource7
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
            FooterFont.Style = []
            FooterRowCount = 1
            ParentFont = False
            PopupMenu = PopupMenu6
            ReadOnly = True
            SumList.Active = True
            TabOrder = 0
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = #23435#20307
            TitleFont.Style = [fsBold]
            OnKeyDown = DBGridEh7KeyDown
            OnTitleClick = DBGridEh7TitleClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'DEPT_CODE'
                Footer.Value = #21512#35745
                Footer.ValueType = fvtStaticText
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #24037#24207#20195#30721
                Width = 70
              end
              item
                EditButtons = <>
                FieldName = 'DEPT_NAME'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #24037#24207#21517#31216
                Width = 80
              end
              item
                EditButtons = <>
                FieldName = 'MANU_PART_NUMBER'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26412#21378#32534#21495
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'MANU_PART_DESC'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #23458#25143#22411#21495
                Width = 140
              end
              item
                EditButtons = <>
                FieldName = 'PRODUCT_NAME'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20135#21697#31867#22411
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'LAYERS'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #23618#25968
                Width = 35
              end
              item
                DisplayFormat = '0.00'
                EditButtons = <>
                FieldName = 'QTY_REJECTED'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #25968#37327'(Pcs)'
                Width = 70
              end
              item
                DisplayFormat = '0.0000'
                EditButtons = <>
                FieldName = 'SQFT_REJECTED'
                Footer.DisplayFormat = '0.0000'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Alignment = taCenter
                Width = 100
              end
              item
                DisplayFormat = '0.0000'
                EditButtons = <>
                FieldName = 'unit_bbsq'
                Footer.FieldName = 'unit_bbsq'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = #25253#24223#38754#31215#39030#23618
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #39030#23618#19981#21547#26495#36793#38754#31215
                Width = 70
              end
              item
                EditButtons = <>
                FieldName = #39030#23618#21547#26495#36793#38754#31215
                Footer.FieldName = #39030#23618#21547#26495#36793#38754#31215
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 80
              end
              item
                EditButtons = <>
                FieldName = 'TOT_STD_MATL_COST'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26448#26009#25104#26412
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'TOT_STD_OVHD_COST'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #21046#36896#36153#29992
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'TOT_ovhd1_pcs'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 94
              end
              item
                EditButtons = <>
                FieldName = 'TOT_outsource_pcs'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 95
              end
              item
                EditButtons = <>
                FieldName = 'total_cost'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #24635#25104#26412
                Width = 113
              end
              item
                EditButtons = <>
                FieldName = 'WORK_ORDER_NUMBER'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20316#19994#21333#21495
                Width = 120
              end
              item
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #23458#25143#31616#31216
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'ORIG_CUSTOMER'
                Footers = <>
                Title.Caption = #20851#32852#21407#23458#25143
              end
              item
                EditButtons = <>
                FieldName = 'dragin_cost'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #24102#20837#25104#26412
                Width = 85
              end
              item
                EditButtons = <>
                FieldName = 'abbrname15'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #24037#21378#31616#31216
                Width = 70
              end
              item
                EditButtons = <>
                FieldName = 'REJECT_DESCRIPTION'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #25253#24223#32570#38519
                Width = 60
              end>
          end
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 928
        Height = 34
        Align = alTop
        TabOrder = 0
        object Label4: TLabel
          Left = 160
          Top = 10
          Width = 52
          Height = 13
          Alignment = taRightJustify
          Caption = #26412#21378#32534#21495
        end
        object Edit4: TEdit
          Left = 217
          Top = 6
          Width = 121
          Height = 21
          TabOrder = 0
          OnChange = Edit4Change
        end
      end
    end
    object TabSheet28: TTabSheet
      Caption = #23436#24037#25104#26412#20998#26512
      ImageIndex = 7
      object PageControl12: TPageControl
        Left = 0
        Top = 0
        Width = 928
        Height = 474
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
          object PageControl13: TPageControl
            Left = 0
            Top = 0
            Width = 900
            Height = 466
            ActivePage = TabSheet32
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
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
              OnShow = TabSheet31Show
              object StringGrid18: TStringGrid
                Left = 0
                Top = 0
                Width = 892
                Height = 438
                Align = alClient
                ColCount = 15
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
                Width = 892
                Height = 438
                Align = alClient
                ColCount = 16
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
            Width = 900
            Height = 22
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
              Top = 5
              Width = 52
              Height = 13
              Alignment = taRightJustify
              Caption = #26412#21378#32534#21495
            end
            object Edit3: TEdit
              Left = 209
              Top = 1
              Width = 121
              Height = 21
              TabOrder = 0
              OnChange = Edit3Change
            end
          end
          object PageControl14: TPageControl
            Left = 0
            Top = 22
            Width = 900
            Height = 444
            ActivePage = TabSheet34
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
                Width = 892
                Height = 416
                Align = alClient
                DataSource = DataSource5
                FooterColor = clWindow
                FooterFont.Charset = GB2312_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -13
                FooterFont.Name = #23435#20307
                FooterFont.Style = []
                FooterRowCount = 1
                OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
                PopupMenu = PopupMenu1
                ReadOnly = True
                SumList.Active = True
                TabOrder = 0
                TitleFont.Charset = GB2312_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -13
                TitleFont.Name = #23435#20307
                TitleFont.Style = []
                OnKeyDown = DBGridEh5KeyDown
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
                    FieldName = 'CPJS'
                    Footers = <>
                    Title.Caption = #20135#21697#38454#25968
                    Width = 120
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
                    FieldName = 'ABBR_NAME'
                    Footers = <>
                  end
                  item
                    EditButtons = <>
                    FieldName = 'ORIG_CUSTOMER'
                    Footers = <>
                    Title.Caption = #20851#32852#21407#23458#25143
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
                    FieldName = 'dragin_cost'
                    Footer.ValueType = fvtSum
                    Footers = <>
                  end
                  item
                    EditButtons = <>
                    FieldName = 'scap_cost'
                    Footer.ValueType = fvtSum
                    Footers = <>
                    Width = 107
                  end
                  item
                    EditButtons = <>
                    FieldName = 'outsource_cost'
                    Footer.ValueType = fvtSum
                    Footers = <>
                    Width = 83
                  end
                  item
                    EditButtons = <>
                    FieldName = 'ovhd1_cost'
                    Footer.ValueType = fvtSum
                    Footers = <>
                  end
                  item
                    EditButtons = <>
                    FieldName = 'outsource_pcs'
                    Footer.ValueType = fvtSum
                    Footers = <>
                  end
                  item
                    EditButtons = <>
                    FieldName = 'total_cost'
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
                    Footer.ValueType = fvtStaticText
                    Footers = <>
                    Width = 57
                  end
                  item
                    EditButtons = <>
                    FieldName = 'abbr_name15'
                    Footers = <>
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
                Width = 892
                Height = 416
                Align = alClient
                DataSource = DataSource6
                FooterColor = clWindow
                FooterFont.Charset = GB2312_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -13
                FooterFont.Name = #23435#20307
                FooterFont.Style = []
                FooterRowCount = 1
                OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
                PopupMenu = PopupMenu3
                ReadOnly = True
                SumList.Active = True
                TabOrder = 0
                TitleFont.Charset = GB2312_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -13
                TitleFont.Name = #23435#20307
                TitleFont.Style = []
                OnKeyDown = DBGridEh6KeyDown
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
                    FieldName = 'CPJS'
                    Footers = <>
                    Title.Caption = #20135#21697#38454#25968
                    Width = 80
                  end
                  item
                    EditButtons = <>
                    FieldName = 'cust_code'
                    Footers = <>
                    Title.Caption = #23458#25143#20195#30721
                    Width = 60
                  end
                  item
                    EditButtons = <>
                    FieldName = 'ABBR_NAME2'
                    Footers = <>
                    Title.Caption = #23458#25143#31616#31216
                    Width = 80
                  end
                  item
                    EditButtons = <>
                    FieldName = 'ORIG_CUSTOMER'
                    Footers = <>
                    Title.Caption = #20851#32852#21407#23458#25143
                    Width = 80
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
                    FieldName = 'dragin_cost'
                    Footer.ValueType = fvtSum
                    Footers = <>
                  end
                  item
                    EditButtons = <>
                    FieldName = 'scap_cost'
                    Footer.ValueType = fvtSum
                    Footers = <>
                  end
                  item
                    EditButtons = <>
                    FieldName = 'outsource_cost'
                    Footer.ValueType = fvtSum
                    Footers = <>
                  end
                  item
                    EditButtons = <>
                    FieldName = 'ovhd1_cost'
                    Footer.ValueType = fvtSum
                    Footers = <>
                  end
                  item
                    EditButtons = <>
                    FieldName = 'outsource_pcs'
                    Footer.ValueType = fvtSum
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
                    FieldName = 'total_cost'
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
                    Footer.ValueType = fvtStaticText
                    Footers = <>
                    Width = 59
                  end
                  item
                    EditButtons = <>
                    FieldName = 'RMA_PTR2'
                    Footers = <>
                    Title.Caption = #20837#24211#31867#22411
                    Width = 70
                  end
                  item
                    EditButtons = <>
                    FieldName = 'ABBR_NAME'
                    Footers = <>
                  end
                  item
                    EditButtons = <>
                    FieldName = 'LOCATION'
                    Footers = <>
                    Title.Caption = #20179#24211
                    Width = 80
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
      object PageControl15: TPageControl
        Left = 0
        Top = 0
        Width = 928
        Height = 474
        ActivePage = TabSheet36
        Align = alClient
        TabOrder = 0
        object TabSheet36: TTabSheet
          Caption = #27719#24635#25968#25454
          OnShow = TabSheet36Show
          object StringGrid22: TStringGrid
            Left = 0
            Top = 0
            Width = 920
            Height = 446
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
            PopupMenu = PopupMenu5
            TabOrder = 0
            RowHeights = (
              19
              19)
          end
          object DBGridEh8: TDBGridEh
            Left = 0
            Top = 0
            Width = 920
            Height = 446
            Align = alClient
            DataSource = DataSource8
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -13
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            FooterRowCount = 1
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
            PopupMenu = PopupMenu5
            SumList.Active = True
            TabOrder = 1
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            OnKeyDown = DBGridEh8KeyDown
            Columns = <
              item
                EditButtons = <>
                FieldName = 'SALES_ORDER'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'so_type'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'CUST_CODE'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'MANU_PART_NUMBER'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'MANU_PART_DESC'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'PROD_CODE'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'PRODUCT_NAME'
                Footers = <>
                Width = 115
              end
              item
                EditButtons = <>
                FieldName = 'sales_sqft'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ship_total52'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'sales_amount'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'matl_cost'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ovhd_cost'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'cost_pcs'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'planned_qty'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ovhd1_cost'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'outsource_pcs'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'sales_cost'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = #38144#21806#21033#28070
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 130
              end
              item
                EditButtons = <>
                FieldName = 'cost_rate'
                Footer.ValueType = fvtStaticText
                Footers = <>
                Width = 62
              end
              item
                EditButtons = <>
                FieldName = 'ORIG_CUSTOMER'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'abbr_name15'
                Footers = <>
              end>
          end
        end
        object TabSheet37: TTabSheet
          Caption = #26126#32454#25968#25454
          ImageIndex = 1
          OnShow = TabSheet36Show
          object StringGrid23: TStringGrid
            Left = 0
            Top = 0
            Width = 920
            Height = 446
            Align = alClient
            ColCount = 21
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
            PopupMenu = PopupMenu4
            TabOrder = 0
            OnDrawCell = StringGrid23DrawCell
            RowHeights = (
              19
              19)
          end
          object DBGridEh9: TDBGridEh
            Left = 0
            Top = 0
            Width = 920
            Height = 446
            Align = alClient
            DataSource = DataSource9
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -13
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            FooterRowCount = 1
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
            PopupMenu = PopupMenu4
            SumList.Active = True
            TabOrder = 1
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            Columns = <
              item
                EditButtons = <>
                FieldName = 'SALES_ORDER'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'so_type'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'DATE_ASSIGN'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'CUST_CODE'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'MANU_PART_NUMBER'
                Footers = <>
                Width = 81
              end
              item
                EditButtons = <>
                FieldName = 'MANU_PART_DESC'
                Footers = <>
                Width = 181
              end
              item
                EditButtons = <>
                FieldName = 'PROD_CODE'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'PRODUCT_NAME'
                Footers = <>
                Width = 104
              end
              item
                EditButtons = <>
                FieldName = 'WORK_ORDER_NUMBER'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'QUAN_SHP'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'sales_square'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'sales_amount'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'matl_ovhd_pcs'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'OVHD_COST'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'cost_pcs'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'PLANNED_QTY'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ovhd1_pcs'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'outsource_pcs'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'MATL_COST'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'sales_matl_cost'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = #38144#21806#27611#21033
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'cost_rate'
                Footer.ValueType = fvtStaticText
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ORIG_CUSTOMER'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'MFG_DATE'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'abbr_name15'
                Footers = <>
              end>
          end
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
    TabOrder = 0
    OnChange = ComboBox1Change
  end
  object PopupMenu1: TPopupMenu
    Left = 248
    Top = 302
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
      Caption = #30452#25509#26448#26009#27719#24635
      OnClick = m1Click
    end
    object m2: TMenuItem
      Caption = #38388#25509#26448#26009#27719#24635
      OnClick = m2Click
    end
    object m3: TMenuItem
      Caption = #20854#23427#26448#26009#27719#24635
      OnClick = m3Click
    end
    object dfh1: TMenuItem
      Caption = '-'
    end
    object N17: TMenuItem
      Caption = #26448#26009#32467#26500#25968#25454
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
    object N8: TMenuItem
      Caption = '-'
      GroupIndex = 1
    end
    object N14: TMenuItem
      Caption = #25253#24223#25104#26412#27719#24635
      GroupIndex = 1
      OnClick = N14Click
    end
    object N16: TMenuItem
      Caption = #25253#24223#25104#26412#26126#32454
      GroupIndex = 1
      OnClick = N16Click
    end
    object N15: TMenuItem
      Caption = '-'
      GroupIndex = 1
    end
    object N2: TMenuItem
      Caption = #23436#24037#25104#26412#25353#23458#25143#27719#24635
      GroupIndex = 1
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #23436#24037#25104#26412#25353#31867#21035#27719#24635' '
      GroupIndex = 1
      OnClick = N3Click
    end
    object N9: TMenuItem
      Caption = '-'
      GroupIndex = 2
    end
    object N4: TMenuItem
      Caption = #38144#21806#25104#26412#27719#24635
      GroupIndex = 2
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #38144#21806#25104#26412#26126#32454
      GroupIndex = 2
      OnClick = N5Click
    end
    object N10: TMenuItem
      Caption = '-'
      GroupIndex = 3
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
      'SELECT     dbo.Data0007.PR_GRP_CODE, dbo.Data0008.PROD_CODE, dbo' +
      '.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC, '#13#10'     ' +
      '                 SUM(dbo.Data0372.OPEN_QUANTITY) AS open_quantit' +
      'y, SUM(dbo.Data0372.OPEN_QUANTITY * dbo.Data0372.UNIT_PRICE) AS ' +
      'open_amount, '#13#10'                      SUM(dbo.Data0372.OPEN_QUANT' +
      'ITY * dbo.Data0372.closed_cost_per_pcs) AS open_amount_cost, SUM' +
      '(dbo.Data0372.IN_QUANTITY) AS in_quantity, '#13#10'                   ' +
      '   SUM(dbo.Data0372.IN_QUANTITY * dbo.Data0372.UNIT_PRICE) AS in' +
      '_amount, SUM(dbo.Data0372.IN_QUANTITY * dbo.Data0372.closed_cost' +
      '_per_pcs) '#13#10'                      AS in_amount_cost, SUM(dbo.Dat' +
      'a0372.OUT_QUANTITY) AS out_quantity, SUM(dbo.Data0372.OUT_QUANTI' +
      'TY * dbo.Data0372.UNIT_PRICE) AS out_amount, '#13#10'                 ' +
      '     SUM(dbo.Data0372.OUT_QUANTITY * dbo.Data0372.closed_cost_pe' +
      'r_pcs) AS out_amount_cost, SUM(dbo.Data0372.SPEC_OUT_QUANTITY) A' +
      'S spec_out_quantity, '#13#10'                      SUM(dbo.Data0372.SP' +
      'EC_OUT_QUANTITY * dbo.Data0372.UNIT_PRICE) AS spec_out_amount, d' +
      'ata0010.abbr_name as abbr_name10,'#13#10'                      SUM(dbo' +
      '.Data0372.SPEC_OUT_QUANTITY * dbo.Data0372.closed_cost_per_pcs) ' +
      'AS spec_out_amount_cost, SUM(dbo.Data0372.CLOSED_QUANTITY) '#13#10'   ' +
      '                   AS closed_quantity, SUM(dbo.Data0372.CLOSED_Q' +
      'UANTITY * dbo.Data0372.UNIT_PRICE) AS closed_amount, '#13#10'         ' +
      '             SUM(dbo.Data0372.CLOSED_QUANTITY * dbo.Data0372.clo' +
      'sed_cost_per_pcs) AS closed_amount_cost, SUM(dbo.Data0372.transf' +
      'er_quantity) AS transfer_quantity, '#13#10'                      SUM(d' +
      'bo.Data0372.transfer_quantity * dbo.Data0372.UNIT_PRICE) AS tran' +
      'sfer_amount, SUM(dbo.Data0372.transfer_quantity * dbo.Data0372.c' +
      'losed_cost_per_pcs) '#13#10'                      AS transfer_amount_c' +
      'ost, SUM(dbo.Data0372.scrap_quantity) AS scrap_quantity, SUM(dbo' +
      '.Data0372.scrap_quantity * dbo.Data0372.UNIT_PRICE) AS scrap_amo' +
      'unt, '#13#10'                      SUM(dbo.Data0372.scrap_quantity * d' +
      'bo.Data0372.closed_cost_per_pcs) AS scrap_amount_cost, dbo.Data0' +
      '015.ABBR_NAME, data0025.ORIG_CUSTOMER'#13#10'FROM         dbo.Data0372' +
      ' INNER JOIN'#13#10'                      dbo.Data0025 ON dbo.Data0372.' +
      'customer_part_PTR = dbo.Data0025.RKEY INNER JOIN'#13#10'              ' +
      '        dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data000' +
      '8.RKEY INNER JOIN'#13#10'                      dbo.Data0007 ON dbo.Dat' +
      'a0008.PR_GRP_POINTER = dbo.Data0007.RKEY INNER JOIN'#13#10'           ' +
      '           dbo.Data0053 ON dbo.Data0372.d0053_ptr = dbo.Data0053' +
      '.RKEY INNER JOIN'#13#10'                      dbo.Data0015 ON dbo.Data' +
      '0053.WHSE_PTR = dbo.Data0015.RKEY inner join '#13#10'                 ' +
      '    data0010 on data0025.CUSTOMER_PTR=data0010.rkey'#13#10'WHERE     (' +
      'dbo.Data0372.D0451_PTR = :rkey451)'#13#10'GROUP BY dbo.Data0007.PR_GRP' +
      '_CODE, dbo.Data0008.PROD_CODE, data0025.ORIG_CUSTOMER,'#13#10'dbo.Data' +
      '0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC, dbo.Data0015' +
      '.ABBR_NAME,data0010.abbr_name'#13#10
    Parameters = <
      item
        Name = 'rkey451'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 295
      end>
    Left = 188
    Top = 365
    object ADS372_totalPR_GRP_CODE: TStringField
      DisplayLabel = #32452#21035#20195#30721
      FieldName = 'PR_GRP_CODE'
      Size = 5
    end
    object ADS372_totalPROD_CODE: TStringField
      DisplayLabel = #31867#21035#20195#30721
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADS372_totalMANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADS372_totalMANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADS372_totalopen_quantity: TIntegerField
      DisplayLabel = #26399#21021#24211#23384
      FieldName = 'open_quantity'
    end
    object ADS372_totalopen_amount: TFloatField
      DisplayLabel = #26399#21021#37329#39069
      FieldName = 'open_amount'
    end
    object ADS372_totalopen_amount_cost: TFloatField
      DisplayLabel = #26399#21021#37329#39069
      FieldName = 'open_amount_cost'
    end
    object ADS372_totalin_quantity: TIntegerField
      DisplayLabel = #26412#26399#20837#24211
      FieldName = 'in_quantity'
    end
    object ADS372_totalin_amount: TFloatField
      DisplayLabel = #20837#24211#37329#39069
      FieldName = 'in_amount'
    end
    object ADS372_totalin_amount_cost: TFloatField
      DisplayLabel = #20837#24211#37329#39069
      FieldName = 'in_amount_cost'
    end
    object ADS372_totalout_quantity: TIntegerField
      DisplayLabel = #26412#26399#20986#24211
      FieldName = 'out_quantity'
    end
    object ADS372_totalout_amount: TFloatField
      DisplayLabel = #20986#24211#37329#39069
      FieldName = 'out_amount'
    end
    object ADS372_totalout_amount_cost: TFloatField
      DisplayLabel = #20986#24211#37329#39069
      FieldName = 'out_amount_cost'
    end
    object ADS372_totalspec_out_quantity: TIntegerField
      DisplayLabel = #29305#27530#20986#20179
      FieldName = 'spec_out_quantity'
    end
    object ADS372_totalspec_out_amount: TFloatField
      DisplayLabel = #29305#27530#20986#20179#37329#39069
      FieldName = 'spec_out_amount'
    end
    object ADS372_totalspec_out_amount_cost: TFloatField
      DisplayLabel = #29305#27530#20986#20179#37329#39069
      FieldName = 'spec_out_amount_cost'
    end
    object ADS372_totalclosed_quantity: TIntegerField
      DisplayLabel = #26399#26411#24211#23384
      FieldName = 'closed_quantity'
    end
    object ADS372_totalclosed_amount: TFloatField
      DisplayLabel = #24211#23384#37329#39069
      FieldName = 'closed_amount'
    end
    object ADS372_totalclosed_amount_cost: TFloatField
      DisplayLabel = #24211#23384#37329#39069
      FieldName = 'closed_amount_cost'
    end
    object ADS372_totaltransfer_quantity: TIntegerField
      DisplayLabel = #36716#31227#25968#37327
      FieldName = 'transfer_quantity'
    end
    object ADS372_totaltransfer_amount: TFloatField
      DisplayLabel = #36716#31227#37329#39069
      FieldName = 'transfer_amount'
    end
    object ADS372_totaltransfer_amount_cost: TFloatField
      DisplayLabel = #36716#31227#37329#39069
      FieldName = 'transfer_amount_cost'
    end
    object ADS372_totalscrap_quantity: TIntegerField
      DisplayLabel = #25253#24223#25968#37327
      FieldName = 'scrap_quantity'
    end
    object ADS372_totalscrap_amount: TFloatField
      DisplayLabel = #25253#24223#37329#39069
      FieldName = 'scrap_amount'
    end
    object ADS372_totalscrap_amount_cost: TFloatField
      DisplayLabel = #25253#24223#37329#39069
      FieldName = 'scrap_amount_cost'
    end
    object ADS372_totalABBR_NAME: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADS372_totalabbr_name10: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'abbr_name10'
      Size = 10
    end
    object ADS372_totalORIG_CUSTOMER: TStringField
      DisplayLabel = #20851#32852#21407#23458#25143
      DisplayWidth = 10
      FieldName = 'ORIG_CUSTOMER'
      Size = 30
    end
  end
  object DataSource3: TDataSource
    DataSet = ADS372_total
    Left = 132
    Top = 365
  end
  object ADS372_list: TADODataSet
    Connection = DM.Conn
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.Data0006.WORK_ORDER_NUMBER, dbo.Data0025.MANU_PART_NU' +
      'MBER, '#13#10'      dbo.Data0025.MANU_PART_DESC, dbo.Data0007.PR_GRP_C' +
      'ODE, '#13#10'      dbo.Data0008.PROD_CODE, dbo.Data0372.inDATE, dbo.Da' +
      'ta0016.LOCATION, '#13#10'      dbo.Data0008.PRODUCT_NAME, dbo.Data0025' +
      '.unit_sq, '#13#10'      dbo.Data0372.OPEN_QUANTITY, dbo.Data0372.IN_QU' +
      'ANTITY, '#13#10'      dbo.Data0372.OUT_QUANTITY, dbo.Data0372.SPEC_OUT' +
      '_QUANTITY, '#13#10'      dbo.Data0372.CLOSED_QUANTITY, dbo.Data0372.tr' +
      'ansfer_quantity, '#13#10'      dbo.Data0372.scrap_quantity, data0015.a' +
      'bbr_name,data0010.abbr_name as abbr_name10,'#13#10'      dbo.Data0372.' +
      'OPEN_QUANTITY * dbo.Data0372.UNIT_PRICE AS open_amount, '#13#10'      ' +
      'dbo.Data0372.OPEN_QUANTITY * dbo.Data0372.closed_cost_per_pcs AS' +
      ' open_amount_cost,'#13#10'       dbo.Data0372.IN_QUANTITY * dbo.Data03' +
      '72.UNIT_PRICE AS in_amount, '#13#10'      dbo.Data0372.IN_QUANTITY * d' +
      'bo.Data0372.closed_cost_per_pcs AS in_amount_cost,'#13#10'       dbo.D' +
      'ata0372.OUT_QUANTITY * dbo.Data0372.UNIT_PRICE AS out_amount, '#13#10 +
      '      dbo.Data0372.OUT_QUANTITY * dbo.Data0372.closed_cost_per_p' +
      'cs AS out_amount_cost,'#13#10'       dbo.Data0372.SPEC_OUT_QUANTITY * ' +
      'dbo.Data0372.UNIT_PRICE AS spec_out_amount,'#13#10'       dbo.Data0372' +
      '.SPEC_OUT_QUANTITY * dbo.Data0372.closed_cost_per_pcs AS spec_ou' +
      't_amount_cost,'#13#10'       dbo.Data0372.CLOSED_QUANTITY * dbo.Data03' +
      '72.UNIT_PRICE AS closed_amount, '#13#10'      dbo.Data0372.CLOSED_QUAN' +
      'TITY * dbo.Data0372.closed_cost_per_pcs AS closed_amount_cost,'#13#10 +
      '       dbo.Data0372.transfer_quantity * dbo.Data0372.UNIT_PRICE ' +
      'AS transfer_amount, '#13#10'      dbo.Data0372.transfer_quantity * dbo' +
      '.Data0372.closed_cost_per_pcs AS transfer_amount_cost,'#13#10'       d' +
      'bo.Data0372.scrap_quantity * dbo.Data0372.UNIT_PRICE AS scrap_am' +
      'ount, '#13#10'      dbo.Data0372.scrap_quantity * dbo.Data0372.closed_' +
      'cost_per_pcs AS scrap_amount_cost,'#13#10'CASE data0053.rma_ptr WHEN 0' +
      ' THEN '#39#27491#24120#36807#25968#20837#20179#39' WHEN 1 THEN '#39#36864#36135#37325#26816#20837#20179#39' WHEN 2 THEN '#39#36820#20462#37325#26816#20837#20179#39' WHEN 3 ' +
      'THEN '#39#30452#25509#20837#20179#39' '#13#10'WHEN 4 THEN '#39#22996#22806#21152#24037#20837#20179#39' WHEN 5 THEN '#39#22996#22806#21152#24037#36864#36135#20837#20179#39' WHEN 6' +
      ' THEN '#39#38144#21806#36864#36135#20837#20179#39' WHEN 7 THEN '#39#36716#25442#20837#20179#39' '#13#10'WHEN 8 THEN '#39#30424#28857#20837#20179#39' END AS c_' +
      'type, data0025.ORIG_CUSTOMER, data0372.UNIT_PRICE, data0372.clos' +
      'ed_cost_per_pcs,'#13#10'd23.ABBR_NAME as abbr_name23,Data0053.rkey'#13#10'FR' +
      'OM dbo.Data0016 INNER JOIN'#13#10'      dbo.Data0372 INNER JOIN'#13#10'     ' +
      ' dbo.Data0053 ON dbo.Data0372.d0053_ptr = dbo.Data0053.RKEY INNE' +
      'R JOIN'#13#10'      dbo.Data0025 ON '#13#10'      dbo.Data0372.customer_part' +
      '_PTR = dbo.Data0025.RKEY INNER JOIN'#13#10'      dbo.Data0007 INNER JO' +
      'IN'#13#10'      dbo.Data0008 ON dbo.Data0007.RKEY = dbo.Data0008.PR_GR' +
      'P_POINTER ON '#13#10'      dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.R' +
      'KEY ON '#13#10'      dbo.Data0016.RKEY = dbo.Data0053.LOC_PTR LEFT OUT' +
      'ER JOIN'#13#10'      dbo.Data0006 ON dbo.Data0372.WO_PTR = dbo.Data000' +
      '6.RKEY inner join '#13#10'data0015 on data0053.WHSE_PTR=data0015.rkey ' +
      'inner join '#13#10'data0010 on data0025.CUSTOMER_PTR=data0010.rkey'#13#10'le' +
      'ft join data0060 d60 on data0053.barcode_ptr = d60.rkey'#13#10'left jo' +
      'in data0023 d23 on d60.supplier_ptr = d23.rkey'#13#10'WHERE (dbo.Data0' +
      '372.D0451_PTR = :rkey451)'
    IndexFieldNames = 'MANU_PART_NUMBER'
    Parameters = <
      item
        Name = 'rkey451'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 666
      end>
    Left = 204
    Top = 421
    object ADS372_listWORK_ORDER_NUMBER: TStringField
      DisplayLabel = #24037#20316#23450#21333
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ADS372_listMANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADS372_listMANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADS372_listPR_GRP_CODE: TStringField
      DisplayLabel = #32452#21035#20195#30721
      FieldName = 'PR_GRP_CODE'
      Size = 5
    end
    object ADS372_listPROD_CODE: TStringField
      DisplayLabel = #31867#21035#20195#30721
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADS372_listinDATE: TDateTimeField
      DisplayLabel = #20837#24211#26085#26399
      FieldName = 'inDATE'
    end
    object ADS372_listLOCATION: TStringField
      DisplayLabel = #20179#24211
      FieldName = 'LOCATION'
    end
    object ADS372_listPRODUCT_NAME: TStringField
      DisplayLabel = #31867#22411#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADS372_listunit_sq: TFloatField
      DisplayLabel = #21333#20803#38754#31215
      FieldName = 'unit_sq'
      DisplayFormat = '0.0000000'
    end
    object ADS372_listOPEN_QUANTITY: TIntegerField
      DisplayLabel = #26399#21021#24211#23384
      FieldName = 'OPEN_QUANTITY'
    end
    object ADS372_listopen_amount: TFloatField
      DisplayLabel = #26399#21021#37329#39069
      FieldName = 'open_amount'
      ReadOnly = True
    end
    object ADS372_listopen_amount_cost: TFloatField
      DisplayLabel = #26399#21021#37329#39069
      FieldName = 'open_amount_cost'
      ReadOnly = True
    end
    object ADS372_listIN_QUANTITY: TIntegerField
      DisplayLabel = #26412#26399#20837#24211
      FieldName = 'IN_QUANTITY'
    end
    object ADS372_listin_amount: TFloatField
      DisplayLabel = #20837#24211#37329#39069
      FieldName = 'in_amount'
      ReadOnly = True
    end
    object ADS372_listin_amount_cost: TFloatField
      DisplayLabel = #20837#24211#37329#39069
      FieldName = 'in_amount_cost'
      ReadOnly = True
    end
    object ADS372_listOUT_QUANTITY: TIntegerField
      DisplayLabel = #26412#26399#20986#24211
      FieldName = 'OUT_QUANTITY'
    end
    object ADS372_listout_amount: TFloatField
      DisplayLabel = #20986#24211#37329#39069
      FieldName = 'out_amount'
      ReadOnly = True
    end
    object ADS372_listout_amount_cost: TFloatField
      DisplayLabel = #20986#24211#37329#39069
      FieldName = 'out_amount_cost'
      ReadOnly = True
    end
    object ADS372_listSPEC_OUT_QUANTITY: TIntegerField
      DisplayLabel = #29305#27530#20986#20179
      FieldName = 'SPEC_OUT_QUANTITY'
    end
    object ADS372_listspec_out_amount: TFloatField
      DisplayLabel = #29305#27530#20986#20179#37329#39069
      FieldName = 'spec_out_amount'
      ReadOnly = True
    end
    object ADS372_listspec_out_amount_cost: TFloatField
      DisplayLabel = #29305#27530#20986#20179#37329#39069
      FieldName = 'spec_out_amount_cost'
      ReadOnly = True
    end
    object ADS372_listCLOSED_QUANTITY: TIntegerField
      DisplayLabel = #26399#26411#24211#23384
      FieldName = 'CLOSED_QUANTITY'
    end
    object ADS372_listclosed_amount: TFloatField
      DisplayLabel = #24211#23384#37329#39069
      FieldName = 'closed_amount'
      ReadOnly = True
    end
    object ADS372_listclosed_amount_cost: TFloatField
      DisplayLabel = #24211#23384#37329#39069
      FieldName = 'closed_amount_cost'
      ReadOnly = True
    end
    object ADS372_listtransfer_quantity: TIntegerField
      DisplayLabel = #36716#31227#25968#37327
      FieldName = 'transfer_quantity'
    end
    object ADS372_listtransfer_amount: TFloatField
      DisplayLabel = #36716#31227#37329#39069
      FieldName = 'transfer_amount'
      ReadOnly = True
    end
    object ADS372_listtransfer_amount_cost: TFloatField
      DisplayLabel = #36716#31227#37329#39069
      FieldName = 'transfer_amount_cost'
      ReadOnly = True
    end
    object ADS372_listscrap_quantity: TIntegerField
      DisplayLabel = #25253#24223#25968#37327
      FieldName = 'scrap_quantity'
    end
    object ADS372_listscrap_amount: TFloatField
      DisplayLabel = #25253#24223#37329#39069
      FieldName = 'scrap_amount'
      ReadOnly = True
    end
    object ADS372_listscrap_amount_cost: TFloatField
      DisplayLabel = #25253#24223#37329#39069
      FieldName = 'scrap_amount_cost'
      ReadOnly = True
    end
    object ADS372_listabbr_name: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADS372_listabbr_name10: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'abbr_name10'
      Size = 10
    end
    object ADS372_listc_type: TStringField
      DisplayLabel = #20837#24211#31867#22411
      FieldName = 'c_type'
      ReadOnly = True
      Size = 16
    end
    object ADS372_listORIG_CUSTOMER: TStringField
      DisplayLabel = #20851#32852#21407#23458#25143
      DisplayWidth = 10
      FieldName = 'ORIG_CUSTOMER'
      Size = 30
    end
    object ADS372_listUNIT_PRICE: TFloatField
      DisplayLabel = #21333#20215
      FieldName = 'UNIT_PRICE'
    end
    object ADS372_listclosed_cost_per_pcs: TFloatField
      DisplayLabel = #21333#20215
      FieldName = 'closed_cost_per_pcs'
    end
    object ADS372_listabbr_name23: TStringField
      DisplayLabel = #22806#21327#21378#21830
      FieldName = 'abbr_name23'
      Size = 16
    end
    object ADS372_listrkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object DataSource4: TDataSource
    DataSet = ADS372_list
    Left = 140
    Top = 421
  end
  object ADS464_SO: TADODataSet
    Connection = DM.Conn
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     TOP (100) PERCENT dbo.Data0008.PROD_CODE, dbo.Data000' +
      '8.PRODUCT_NAME, dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU' +
      '_PART_DESC, CASE WHEN isnull(data0464.so_ptr, 0) '#13#10'             ' +
      '         = 0 THEN data0010_1.cust_code ELSE data0010.cust_code E' +
      'ND AS cust_code, CASE WHEN isnull(data0464.so_ptr, 0) '#13#10'        ' +
      '              = 0 THEN data0010_1.ABBR_NAME ELSE data0010.ABBR_N' +
      'AME END AS ABBR_NAME, dbo.Data0060.SALES_ORDER, dbo.Data0060.SCH' +
      '_DATE, dbo.Data0060.PARTS_ORDERED, '#13#10'                      dbo.D' +
      'ata0060.ISSUED_QTY, SUM(dbo.Data0464.QUAN_PROD) AS quan_prod, db' +
      'o.Data0464.so_ptr, SUM(dbo.Data0464.MATL_COST) AS matl_cost, SUM' +
      '(dbo.Data0464.OVHD_COST) AS ovhd_cost, '#13#10'                      S' +
      'UM(dbo.Data0464.PLANNED_QTY) AS dragin_cost, SUM(dbo.Data0464.sc' +
      'ap_cost) AS scap_cost, SUM(dbo.Data0464.outsource_cost) AS outso' +
      'urce_cost, SUM(dbo.Data0464.OVHD1_COST) '#13#10'                      ' +
      'AS ovhd1_cost, SUM(dbo.Data0464.outsource_pcs) AS outsource_pcs,' +
      ' ROUND(SUM(dbo.Data0464.AMOUNT), 2) AS amount, ROUND(SUM(dbo.Dat' +
      'a0464.square), 3) AS square, '#13#10'                      CASE WHEN S' +
      'UM(Data0464.square) '#13#10'                      > 0 THEN ROUND(SUM(D' +
      'ata0464.MATL_COST + Data0464.OVHD_COST + Data0464.scap_cost + Da' +
      'ta0464.outsource_cost + Data0464.PLANNED_QTY + data0464.ovhd1_co' +
      'st + data0464.outsource_pcs)'#13#10'                       / SUM(dbo.D' +
      'ata0464.square), 3) ELSE 0 END AS sqft_amount, CASE WHEN SUM(dbo' +
      '.Data0464.AMOUNT) '#13#10'                      > 0 THEN ROUND(SUM(dbo' +
      '.Data0464.MATL_COST + dbo.Data0464.OVHD_COST + Data0464.scap_cos' +
      't + Data0464.outsource_cost + dbo.Data0464.PLANNED_QTY + data046' +
      '4.ovhd1_cost + data0464.outsource_pcs)'#13#10'                       /' +
      ' SUM(dbo.Data0464.AMOUNT) * 100, 2) ELSE 0 END AS qty_amount, '#13#10 +
      '                       CASE dbo.Data0060.so_tp WHEN 0 THEN '#39#33258#21046#39' ' +
      'WHEN 1 THEN '#39#22806#21457#39' WHEN 2 THEN '#39#21322#21046#31243#39' END AS so_type, '#13#10'           ' +
      '           SUM(dbo.Data0464.MATL_COST + dbo.Data0464.OVHD_COST +' +
      ' dbo.Data0464.scap_cost + dbo.Data0464.outsource_cost + dbo.Data' +
      '0464.PLANNED_QTY + dbo.Data0464.OVHD1_COST + dbo.Data0464.outsou' +
      'rce_pcs)'#13#10'                       AS total_cost, dbo.Data0015.ABB' +
      'R_NAME AS abbr_name15, '#13#10'                       ISNULL(dbo.Data0' +
      '060.ORIG_CUSTOMER, dbo.Data0025.ORIG_CUSTOMER) AS ORIG_CUSTOMER,' +
      ' dbo.Data0025.CPJS'#13#10'FROM         dbo.Data0010 RIGHT OUTER JOIN'#13#10 +
      '                      dbo.Data0060 RIGHT OUTER JOIN'#13#10'           ' +
      '           dbo.Data0006 INNER JOIN'#13#10'                      dbo.Da' +
      'ta0008 INNER JOIN'#13#10'                      dbo.Data0025 ON dbo.Dat' +
      'a0008.RKEY = dbo.Data0025.PROD_CODE_PTR INNER JOIN'#13#10'            ' +
      '          dbo.Data0464 ON dbo.Data0025.RKEY = dbo.Data0464.cust_' +
      'part_ptr ON dbo.Data0006.RKEY = dbo.Data0464.WO_PTR INNER JOIN'#13#10 +
      '                      dbo.Data0053 ON dbo.Data0464.d0053_ptr = d' +
      'bo.Data0053.RKEY INNER JOIN'#13#10'                      dbo.Data0015 ' +
      'ON dbo.Data0053.WHSE_PTR = dbo.Data0015.RKEY INNER JOIN'#13#10'       ' +
      '               dbo.Data0010 AS Data0010_1 ON dbo.Data0025.CUSTOM' +
      'ER_PTR = Data0010_1.RKEY ON dbo.Data0060.RKEY = dbo.Data0464.so_' +
      'ptr ON '#13#10'                      dbo.Data0010.RKEY = dbo.Data0060.' +
      'CUSTOMER_PTR'#13#10'WHERE     (dbo.Data0464.D0451_PTR =:rkey451)'#13#10'GROU' +
      'P BY dbo.Data0008.PROD_CODE, dbo.Data0008.PRODUCT_NAME, dbo.Data' +
      '0010.CUST_CODE, dbo.Data0010.ABBR_NAME, dbo.Data0060.SALES_ORDER' +
      ', dbo.Data0060.SCH_DATE, '#13#10'                      dbo.Data0060.PA' +
      'RTS_ORDERED, dbo.Data0060.ISSUED_QTY, dbo.Data0464.so_ptr, dbo.D' +
      'ata0060.so_tp, dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_' +
      'PART_DESC, '#13#10'                      dbo.Data0015.ABBR_NAME, dbo.D' +
      'ata0060.ORIG_CUSTOMER, dbo.Data0025.CPJS, Data0010_1.CUST_CODE, ' +
      'Data0010_1.ABBR_NAME, data0025.ORIG_CUSTOMER'#13#10'ORDER BY dbo.Data0' +
      '008.PROD_CODE, dbo.Data0008.PRODUCT_NAME, dbo.Data0060.SALES_ORD' +
      'ER'
    Parameters = <
      item
        Name = 'rkey451'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 295
      end>
    Prepared = True
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
    object ADS464_SOABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
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
    object ADS464_SOdragin_cost: TFloatField
      DisplayLabel = #24102#20837#25104#26412
      FieldName = 'dragin_cost'
      ReadOnly = True
    end
    object ADS464_SOscap_cost: TFloatField
      DisplayLabel = #25253#24223#26448#26009#36153#29992#25104#26412
      FieldName = 'scap_cost'
      ReadOnly = True
    end
    object ADS464_SOoutsource_cost: TFloatField
      DisplayLabel = #25253#24223#24102#20837#25104#26412
      FieldName = 'outsource_cost'
      ReadOnly = True
    end
    object ADS464_SOtotal_cost: TFloatField
      DisplayLabel = #24635#25104#26412
      FieldName = 'total_cost'
      ReadOnly = True
    end
    object ADS464_SOovhd1_cost: TFloatField
      DisplayLabel = #30452#25509#20154#24037
      FieldName = 'ovhd1_cost'
      ReadOnly = True
    end
    object ADS464_SOoutsource_pcs: TFloatField
      DisplayLabel = #20108#31867#26448#26009#25104#26412
      FieldName = 'outsource_pcs'
      ReadOnly = True
    end
    object ADS464_SOabbr_name15: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'abbr_name15'
      Size = 10
    end
    object ADS464_SOCPJS: TStringField
      FieldName = 'CPJS'
      Size = 30
    end
    object ADS464_SOORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      Size = 10
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
      'SELECT     TOP (100) PERCENT dbo.Data0464.WO_PTR, dbo.Data0006.W' +
      'ORK_ORDER_NUMBER, dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MA' +
      'NU_PART_DESC, dbo.Data0008.PROD_CODE, '#13#10'                      db' +
      'o.Data0008.PRODUCT_NAME, SUM(dbo.Data0464.MATL_COST) AS matl_cos' +
      't, SUM(dbo.Data0464.OVHD_COST) AS ovhd_cost, SUM(dbo.Data0464.QU' +
      'AN_PROD) AS quan_prod, '#13#10'                      SUM(dbo.Data0464.' +
      'AMOUNT) AS amount, SUM(dbo.Data0464.square) AS square, SUM(dbo.D' +
      'ata0464.PLANNED_QTY) AS dragin_cost, SUM(dbo.Data0464.scap_cost)' +
      ' AS scap_cost, '#13#10'                      SUM(dbo.Data0464.outsourc' +
      'e_cost) AS outsource_cost, SUM(dbo.Data0464.OVHD1_COST) AS ovhd1' +
      '_cost, SUM(dbo.Data0464.outsource_pcs) AS outsource_pcs, '#13#10'     ' +
      '                 CASE WHEN SUM(dbo.Data0464.square) '#13#10'          ' +
      '            > 0 THEN ROUND(SUM(dbo.Data0464.MATL_COST + dbo.Data' +
      '0464.OVHD_COST + Data0464.scap_cost + Data0464.outsource_cost + ' +
      'Data0464.PLANNED_QTY + data0464.OVHD1_COST + data0464.outsource_' +
      'pcs)'#13#10'                       / SUM(dbo.Data0464.square), 3) ELSE' +
      ' 0 END AS sqft_amount, CASE WHEN SUM(dbo.Data0464.AMOUNT) '#13#10'    ' +
      '                  > 0 THEN ROUND(SUM(dbo.Data0464.MATL_COST + db' +
      'o.Data0464.OVHD_COST + Data0464.scap_cost + Data0464.outsource_c' +
      'ost + Data0464.PLANNED_QTY + data0464.OVHD1_COST + data0464.outs' +
      'ource_pcs)'#13#10'                       / SUM(dbo.Data0464.AMOUNT) * ' +
      '100, 2) ELSE 0 END AS qty_amount, '#13#10'                      SUM(db' +
      'o.Data0464.MATL_COST + dbo.Data0464.OVHD_COST + dbo.Data0464.sca' +
      'p_cost + dbo.Data0464.outsource_cost + dbo.Data0464.PLANNED_QTY ' +
      '+ dbo.Data0464.OVHD1_COST + dbo.Data0464.outsource_pcs)'#13#10'       ' +
      '                AS total_cost, dbo.Data0015.ABBR_NAME, CASE data' +
      '0053.RMA_PTR WHEN 0 THEN '#39'0'#39' WHEN 1 THEN '#39'1'#39' WHEN 2 THEN '#39'2'#39' WHE' +
      'N 8 THEN '#39'8'#39' END AS RMA_PTR2, dbo.Data0016.LOCATION, '#13#10'         ' +
      '             CASE WHEN data0464.so_ptr IS NOT NULL THEN data0010' +
      '_1.cust_code ELSE data0010.cust_code END AS cust_code, CASE WHEN' +
      ' data0464.so_ptr IS NOT NULL '#13#10'                      THEN data00' +
      '10_1.ABBR_NAME ELSE data0010.ABBR_NAME END AS ABBR_NAME2, ISNULL' +
      '(dbo.Data0060.ORIG_CUSTOMER, dbo.Data0025.ORIG_CUSTOMER) AS ORIG' +
      '_CUSTOMER, '#13#10'                      dbo.Data0025.CPJS'#13#10'FROM      ' +
      '   dbo.Data0025 INNER JOIN'#13#10'                      dbo.Data0464 I' +
      'NNER JOIN'#13#10'                      dbo.Data0006 ON dbo.Data0464.WO' +
      '_PTR = dbo.Data0006.RKEY ON dbo.Data0025.RKEY = dbo.Data0464.cus' +
      't_part_ptr INNER JOIN'#13#10'                      dbo.Data0008 ON dbo' +
      '.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY INNER JOIN'#13#10'        ' +
      '              dbo.Data0053 ON dbo.Data0464.d0053_ptr = dbo.Data0' +
      '053.RKEY INNER JOIN'#13#10'                      dbo.Data0015 ON dbo.D' +
      'ata0053.WHSE_PTR = dbo.Data0015.RKEY INNER JOIN'#13#10'               ' +
      '       dbo.Data0016 ON dbo.Data0053.LOC_PTR = dbo.Data0016.RKEY ' +
      'INNER JOIN'#13#10'                      dbo.Data0010 ON dbo.Data0025.C' +
      'USTOMER_PTR = dbo.Data0010.RKEY LEFT OUTER JOIN'#13#10'               ' +
      '       dbo.Data0060 ON dbo.Data0464.so_ptr = dbo.Data0060.RKEY L' +
      'EFT OUTER JOIN'#13#10'                      dbo.Data0010 AS Data0010_1' +
      ' ON dbo.Data0060.CUSTOMER_PTR = Data0010_1.RKEY'#13#10'WHERE     (dbo.' +
      'Data0464.D0451_PTR =:rkey451)'#13#10'GROUP BY dbo.Data0464.WO_PTR, dbo' +
      '.Data0006.WORK_ORDER_NUMBER, dbo.Data0025.MANU_PART_NUMBER, dbo.' +
      'Data0025.MANU_PART_DESC, dbo.Data0008.PROD_CODE, '#13#10'             ' +
      '         dbo.Data0008.PRODUCT_NAME, dbo.Data0015.ABBR_NAME, dbo.' +
      'Data0053.RMA_PTR, dbo.Data0016.LOCATION, dbo.Data0464.so_ptr, db' +
      'o.Data0010.CUST_CODE, Data0010_1.CUST_CODE, '#13#10'                  ' +
      '    dbo.Data0010.ABBR_NAME, Data0010_1.ABBR_NAME, dbo.Data0025.C' +
      'PJS, dbo.Data0060.ORIG_CUSTOMER, dbo.Data0025.ORIG_CUSTOMER'#13#10'ORD' +
      'ER BY dbo.Data0006.WORK_ORDER_NUMBER'#13#10
    Parameters = <
      item
        Name = 'rkey451'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 295
      end>
    Prepared = True
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
    object ADS464_WOdragin_cost: TFloatField
      DisplayLabel = #24102#20837#25104#26412
      FieldName = 'dragin_cost'
      ReadOnly = True
    end
    object ADS464_WOscap_cost: TFloatField
      DisplayLabel = #25253#24223#26448#26009#36153#29992#25104#26412
      FieldName = 'scap_cost'
      ReadOnly = True
    end
    object ADS464_WOoutsource_cost: TFloatField
      DisplayLabel = #25253#24223#24102#20837#25104#26412
      FieldName = 'outsource_cost'
      ReadOnly = True
    end
    object ADS464_WOtotal_cost: TFloatField
      DisplayLabel = #24635#25104#26412
      FieldName = 'total_cost'
      ReadOnly = True
    end
    object ADS464_WOovhd1_cost: TFloatField
      DisplayLabel = #30452#25509#20154#24037
      FieldName = 'ovhd1_cost'
      ReadOnly = True
    end
    object ADS464_WOoutsource_pcs: TFloatField
      DisplayLabel = #20108#31867#26448#26009#25104#26412
      FieldName = 'outsource_pcs'
      ReadOnly = True
    end
    object ADS464_WOABBR_NAME: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADS464_WORMA_PTR2: TStringField
      FieldName = 'RMA_PTR2'
      ReadOnly = True
      Size = 12
    end
    object ADS464_WOLOCATION: TStringField
      FieldName = 'LOCATION'
    end
    object ADS464_WOcust_code: TStringField
      FieldName = 'cust_code'
      ReadOnly = True
      Size = 10
    end
    object ADS464_WOORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      ReadOnly = True
      Size = 10
    end
    object ADS464_WOCPJS: TStringField
      FieldName = 'CPJS'
      Size = 30
    end
    object ADS464_WOABBR_NAME2: TStringField
      FieldName = 'ABBR_NAME2'
      ReadOnly = True
      Size = 10
    end
  end
  object DataSource6: TDataSource
    DataSet = ADS464_WO
    Left = 280
    Top = 340
  end
  object PopupMenu3: TPopupMenu
    Left = 248
    Top = 342
    object N25: TMenuItem
      Caption = #20316#19994#21333#25104#26412#26126#32454
      OnClick = N25Click
    end
    object EXCEL1: TMenuItem
      Caption = #23548#20986'EXCEL'
      OnClick = EXCEL1Click
    end
  end
  object PopupMenu4: TPopupMenu
    OnPopup = PopupMenu4Popup
    Left = 384
    Top = 353
    object N20: TMenuItem
      Caption = #20316#19994#21333#25104#26412#26126#32454
      OnClick = N20Click
    end
  end
  object PopupMenu5: TPopupMenu
    OnPopup = PopupMenu5Popup
    Left = 384
    Top = 313
    object N27: TMenuItem
      Caption = #20986#36135#26126#32454#21450#25104#26412
      OnClick = N27Click
    end
  end
  object Ado451_12: TADODataSet
    Connection = DM.Conn
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT TOP (100) PERCENT dbo.Data0006.WORK_ORDER_NUMBER, dbo.Dat' +
      'a0034.DEPT_CODE,dbo.Data0034.DEPT_NAME,'#13#10'   dbo.Data0025.MANU_PA' +
      'RT_NUMBER, dbo.Data0441.QTY_REJECTED,'#13#10'   Data0441.QTY_REJECTED*' +
      'data0006.PLANNED_QTY as dragin_cost,'#13#10'   dbo.Data0441.SQFT_REJEC' +
      'TED, dbo.Data0441.TOT_STD_MATL_COST,'#13#10'   data0441.TOT_outsource_' +
      'pcs,data0441.TOT_ovhd1_pcs,'#13#10'   dbo.Data0441.TOT_STD_OVHD_COST, ' +
      #13#10'   Data0441.TOT_STD_MATL_COST+Data0441.TOT_STD_OVHD_COST+'#13#10'   ' +
      'data0441.TOT_outsource_pcs+data0441.TOT_ovhd1_pcs as total_cost,' +
      #13#10'   dbo.Data0010.ABBR_NAME,data0015.abbr_name as abbrname15,'#13#10' ' +
      '  dbo.Data0025.MANU_PART_DESC, dbo.Data0025.LAYERS, dbo.Data0008' +
      '.PRODUCT_NAME,'#13#10'   dbo.data0039.REJ_CODE,dbo.data0039.REJECT_DES' +
      'CRIPTION,dbo.data0441.wo_ptr,dbo.data0441.step,'#13#10'  dbo.Data0025.' +
      'ORIG_CUSTOMER,dbo.Data0441.SQFT_REJECTED/dbo.GetParentNum(data00' +
      '25.rkey) as '#25253#24223#38754#31215#39030#23618','#13#10'Data0441.QTY_REJECTED*(data0006.panel_ln * ' +
      'data0006.panel_wd * 0.000001) / data0006.PARTS_PER_PANEL as unit' +
      '_bbsq,'#13#10'(Data0441.QTY_REJECTED*(data0006.panel_ln * data0006.pan' +
      'el_wd * 0.000001) / data0006.PARTS_PER_PANEL)/dbo.GetParentNum(d' +
      'ata0025.rkey) as '#39030#23618#21547#26495#36793#38754#31215#13#10'FROM  dbo.Data0034 INNER JOIN'#13#10'      d' +
      'bo.Data0441 ON dbo.Data0034.RKEY = dbo.Data0441.DEPT_PTR INNER J' +
      'OIN'#13#10'      dbo.Data0025 ON dbo.Data0441.BOM_PTR = dbo.Data0025.R' +
      'KEY INNER JOIN'#13#10'      dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR' +
      ' = dbo.Data0008.RKEY INNER JOIN'#13#10'      dbo.Data0006 ON dbo.Data0' +
      '441.wo_ptr = dbo.Data0006.RKEY INNER JOIN'#13#10#9'  dbo.Data0492 ON db' +
      'o.Data0006.CUT_NO = dbo.Data0492.CUT_NO INNER JOIN'#13#10#9'  dbo.Data0' +
      '010 ON dbo.Data0492.COMPLETED = dbo.Data0010.RKEY INNER JOIN'#13#10'  ' +
      '    dbo.data0015 ON dbo.data0441.warehouse_ptr = dbo.data0015.rk' +
      'ey LEFT OUTER JOIN'#13#10'      dbo.data0039 ON dbo.Data0441.REJECT_PT' +
      'R = dbo.data0039.RKEY'#13#10'WHERE (dbo.Data0441.D0451_PTR = :vptr) an' +
      'd (data0441.if_stock=0)'#13#10'ORDER BY dbo.Data0034.DEPT_CODE, dbo.Da' +
      'ta0025.MANU_PART_NUMBER'#13#10
    EnableBCD = False
    Parameters = <
      item
        Name = 'vptr'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 886
      end>
    Left = 316
    Top = 383
    object Ado451_12WORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object Ado451_12DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object Ado451_12MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object Ado451_12QTY_REJECTED: TIntegerField
      FieldName = 'QTY_REJECTED'
    end
    object Ado451_12SQFT_REJECTED: TFloatField
      DisplayLabel = #19981#21547#26495#36793#38754#31215
      FieldName = 'SQFT_REJECTED'
    end
    object Ado451_12dragin_cost: TFloatField
      FieldName = 'dragin_cost'
      ReadOnly = True
    end
    object Ado451_12TOT_STD_MATL_COST: TBCDField
      FieldName = 'TOT_STD_MATL_COST'
      Precision = 18
      Size = 2
    end
    object Ado451_12ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object Ado451_12TOT_STD_OVHD_COST: TBCDField
      FieldName = 'TOT_STD_OVHD_COST'
      Precision = 18
      Size = 2
    end
    object Ado451_12abbrname15: TStringField
      FieldName = 'abbrname15'
      Size = 10
    end
    object Ado451_12MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object Ado451_12LAYERS: TWordField
      FieldName = 'LAYERS'
    end
    object Ado451_12PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object Ado451_12REJ_CODE: TStringField
      FieldName = 'REJ_CODE'
      Size = 5
    end
    object Ado451_12REJECT_DESCRIPTION: TStringField
      FieldName = 'REJECT_DESCRIPTION'
      Size = 30
    end
    object Ado451_12wo_ptr: TIntegerField
      FieldName = 'wo_ptr'
    end
    object Ado451_12step: TIntegerField
      FieldName = 'step'
    end
    object Ado451_12ORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      Size = 10
    end
    object Ado451_12DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
    end
    object Ado451_12TOT_outsource_pcs: TBCDField
      DisplayLabel = #20108#31867#26448#26009
      FieldName = 'TOT_outsource_pcs'
      Precision = 18
      Size = 2
    end
    object Ado451_12TOT_ovhd1_pcs: TBCDField
      DisplayLabel = #30452#25509#20154#24037
      FieldName = 'TOT_ovhd1_pcs'
      Precision = 18
      Size = 2
    end
    object Ado451_12total_cost: TBCDField
      FieldName = 'total_cost'
      ReadOnly = True
      Precision = 21
      Size = 2
    end
    object Ado451_12DSDesigner: TFloatField
      FieldName = #25253#24223#38754#31215#39030#23618
      ReadOnly = True
    end
    object Ado451_12unit_bbsq: TFloatField
      DisplayLabel = #21547#26495#36793#38754#31215
      FieldName = 'unit_bbsq'
      ReadOnly = True
    end
    object Ado451_12DSDesigner2: TFloatField
      FieldName = #39030#23618#21547#26495#36793#38754#31215
      ReadOnly = True
    end
  end
  object DataSource7: TDataSource
    DataSet = Ado451_12
    Left = 284
    Top = 383
  end
  object PopupMenu6: TPopupMenu
    Left = 252
    Top = 383
    object N6: TMenuItem
      Caption = #20316#19994#21333#25104#26412#26126#32454
      OnClick = N6Click
    end
  end
  object ads60_total: TADODataSet
    Connection = DM.Conn
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.Data0060.SALES_ORDER, dbo.Data0025.MANU_PART_NUMBER, ' +
      '  '#13#10'      dbo.Data0025.MANU_PART_DESC, dbo.Data0010.CUST_CODE,  ' +
      ' '#13#10'      dbo.Data0010.ABBR_NAME, dbo.Data0008.PROD_CODE,Data0060' +
      '.ORIG_CUSTOMER,'#13#10'      dbo.Data0008.PRODUCT_NAME, SUM(dbo.Data00' +
      '52.QUAN_SHP) AS ship_total52,   '#13#10'      SUM(dbo.Data0052.QUAN_SH' +
      'P * dbo.Data0025.unit_sq) AS sales_sqft,   '#13#10'SUM(dbo.Data0052.QU' +
      'AN_SHP * dbo.Data0060.PARTS_ALLOC / dbo.Data0060.EXCH_RATE) AS s' +
      'ales_amount,   '#13#10' SUM(dbo.Data0052.QUAN_SHP *   '#13#10'(data0053.matl' +
      '_ovhd_pcs+data0053.cost_pcs+data0053.OVHD_COST+data0053.PLANNED_' +
      'QTY+'#13#10' data0053.ovhd1_pcs+data0053.outsource_pcs)) AS sales_cost' +
      ','#13#10' SUM(dbo.Data0052.QUAN_SHP * dbo.Data0053.matl_ovhd_pcs) AS m' +
      'atl_cost,'#13#10' SUM(dbo.Data0052.QUAN_SHP *  dbo.Data0053.cost_pcs) ' +
      'AS cost_pcs,'#13#10' SUM(dbo.Data0052.QUAN_SHP *  dbo.Data0053.OVHD_CO' +
      'ST) AS ovhd_cost,'#13#10' SUM(dbo.Data0052.QUAN_SHP * Data0053.PLANNED' +
      '_QTY) AS planned_qty,'#13#10' SUM(dbo.Data0052.QUAN_SHP *  dbo.Data005' +
      '3.ovhd1_pcs) AS ovhd1_cost,'#13#10' SUM(dbo.Data0052.QUAN_SHP * Data00' +
      '53.outsource_pcs) AS outsource_pcs,  '#13#10'case when sum(Data0060.PA' +
      'RTS_ALLOC) > 0 then  '#13#10'  round( SUM(Data0052.QUAN_SHP *   '#13#10'(dat' +
      'a0053.matl_ovhd_pcs+data0053.cost_pcs+data0053.OVHD_COST+data005' +
      '3.PLANNED_QTY+data0053.ovhd1_pcs+data0053.outsource_pcs))*100 / ' +
      ' '#13#10'         SUM(dbo.Data0052.QUAN_SHP * Data0060.PARTS_ALLOC / D' +
      'ata0060.EXCH_RATE),2)   '#13#10'else 0 end as cost_rate,  '#13#10'case Data0' +
      '060.so_tp when 0 then '#39#33258#21046#39' when 1 then '#39#22806#21457#39' when 2 then '#39#21322#21046#31243#39' en' +
      'd so_type ,'#13#10' data0015.abbr_name  as abbr_name15 ,'#13#10'SUM(dbo.Data' +
      '0052.QUAN_SHP * dbo.Data0060.PARTS_ALLOC / dbo.Data0060.EXCH_RAT' +
      'E) -'#13#10' SUM(dbo.Data0052.QUAN_SHP *   '#13#10'(data0053.matl_ovhd_pcs+d' +
      'ata0053.cost_pcs+data0053.OVHD_COST+data0053.PLANNED_QTY+'#13#10' data' +
      '0053.ovhd1_pcs+data0053.outsource_pcs))  as '#38144#21806#21033#28070#13#10'FROM         d' +
      'bo.Data0053 INNER JOIN  '#13#10'      dbo.Data0052 INNER JOIN  '#13#10'     ' +
      ' dbo.Data0064 ON dbo.Data0052.SO_SHP_PTR = dbo.Data0064.RKEY INN' +
      'ER JOIN  '#13#10'      dbo.Data0060 ON dbo.Data0064.SO_PTR = dbo.Data0' +
      '060.RKEY INNER JOIN  '#13#10'      dbo.Data0010 ON dbo.Data0060.CUSTOM' +
      'ER_PTR = dbo.Data0010.RKEY ON  '#13#10'   dbo.Data0053.RKEY = dbo.Data' +
      '0052.DATA0053_PTR INNER JOIN  '#13#10'      dbo.Data0008 INNER JOIN  '#13 +
      #10'      dbo.Data0025 ON dbo.Data0008.RKEY = dbo.Data0025.PROD_COD' +
      'E_PTR ON  '#13#10'   dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY IN' +
      'NER JOIN'#13#10'                      dbo.Data0015 ON dbo.Data0060.SHI' +
      'P_REG_TAX_ID = dbo.Data0015.RKEY '#13#10'WHERE (dbo.Data0064.DATE_ASSI' +
      'GN > :vdate1) AND   '#13#10'      (dbo.Data0064.DATE_ASSIGN <= :vdate2' +
      ')  '#13#10'GROUP BY dbo.Data0060.SALES_ORDER, dbo.Data0025.MANU_PART_N' +
      'UMBER,  '#13#10'      dbo.Data0025.MANU_PART_DESC, dbo.Data0010.CUST_C' +
      'ODE,   '#13#10'      dbo.Data0010.ABBR_NAME, dbo.Data0008.PROD_CODE,  ' +
      ' data0015.abbr_name,'#13#10'      dbo.Data0008.PRODUCT_NAME,data0060.s' +
      'o_tp,Data0060.ORIG_CUSTOMER'#13#10'order by Data0060.SALES_ORDER  '
    Parameters = <
      item
        Name = 'vdate1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 42248d
      end
      item
        Name = 'vdate2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 42262d
      end>
    Prepared = True
    Left = 448
    Top = 313
    object ads60_totalSALES_ORDER: TStringField
      DisplayLabel = #38144#21806#35746#21333
      DisplayWidth = 12
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ads60_totalso_type: TStringField
      DisplayLabel = #35746#21333#31867#22411
      DisplayWidth = 6
      FieldName = 'so_type'
      ReadOnly = True
      Size = 6
    end
    object ads60_totalCUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      DisplayWidth = 10
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ads60_totalABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      DisplayWidth = 10
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ads60_totalMANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      DisplayWidth = 20
      FieldName = 'MANU_PART_NUMBER'
    end
    object ads60_totalMANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      DisplayWidth = 20
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ads60_totalPROD_CODE: TStringField
      DisplayLabel = #20135#21697#31867#22411#20195#30721
      DisplayWidth = 10
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ads60_totalPRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#31867#22411#21517#31216
      DisplayWidth = 30
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ads60_totalsales_sqft: TFloatField
      DisplayLabel = #38144#21806#38754#31215
      DisplayWidth = 10
      FieldName = 'sales_sqft'
      ReadOnly = True
    end
    object ads60_totalship_total52: TFloatField
      DisplayLabel = #25968#37327
      DisplayWidth = 10
      FieldName = 'ship_total52'
      ReadOnly = True
    end
    object ads60_totalsales_amount: TFloatField
      DisplayLabel = #38144#21806#37329#39069
      DisplayWidth = 10
      FieldName = 'sales_amount'
      ReadOnly = True
    end
    object ads60_totalmatl_cost: TFloatField
      DisplayLabel = #26448#26009#25104#26412
      DisplayWidth = 10
      FieldName = 'matl_cost'
      ReadOnly = True
    end
    object ads60_totalovhd_cost: TFloatField
      DisplayLabel = #21046#36896#36153#29992
      DisplayWidth = 10
      FieldName = 'ovhd_cost'
      ReadOnly = True
    end
    object ads60_totalcost_pcs: TFloatField
      DisplayLabel = #22996#22806#25110#25253#24223#25104#26412
      DisplayWidth = 10
      FieldName = 'cost_pcs'
      ReadOnly = True
    end
    object ads60_totalplanned_qty: TFloatField
      DisplayLabel = #24102#20837#25104#26412
      DisplayWidth = 10
      FieldName = 'planned_qty'
      ReadOnly = True
    end
    object ads60_totalovhd1_cost: TFloatField
      DisplayLabel = #30452#25509#20154#24037
      DisplayWidth = 10
      FieldName = 'ovhd1_cost'
      ReadOnly = True
    end
    object ads60_totaloutsource_pcs: TFloatField
      DisplayLabel = #20108#31867#26448#26009#25104#26412
      DisplayWidth = 10
      FieldName = 'outsource_pcs'
      ReadOnly = True
    end
    object ads60_totalsales_cost: TFloatField
      DisplayLabel = #24635#25104#26412
      DisplayWidth = 10
      FieldName = 'sales_cost'
      ReadOnly = True
    end
    object ads60_totalDSDesigner: TFloatField
      FieldName = #38144#21806#21033#28070
      ReadOnly = True
    end
    object ads60_totalcost_rate: TFloatField
      DisplayLabel = #25104#26412#29575'%'
      DisplayWidth = 10
      FieldName = 'cost_rate'
      ReadOnly = True
    end
    object ads60_totalORIG_CUSTOMER: TStringField
      DisplayLabel = #20851#32852#21407#23458#25143
      DisplayWidth = 10
      FieldName = 'ORIG_CUSTOMER'
      Size = 10
    end
    object ads60_totalabbr_name15: TStringField
      DisplayLabel = #24037#21378#31616#31216
      DisplayWidth = 10
      FieldName = 'abbr_name15'
      Size = 10
    end
  end
  object DataSource8: TDataSource
    DataSet = ads60_total
    Left = 416
    Top = 313
  end
  object ads52_list: TADODataSet
    Connection = DM.Conn
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT     TOP (100) PERCENT dbo.Data0053.WORK_ORDER_PTR, dbo.Da' +
      'ta0006.WORK_ORDER_NUMBER, dbo.Data0060.SALES_ORDER, dbo.Data0064' +
      '.DATE_ASSIGN, '#13#10'                      dbo.Data0025.MANU_PART_NUM' +
      'BER, dbo.Data0025.MANU_PART_DESC, dbo.Data0010.CUST_CODE, dbo.Da' +
      'ta0010.ABBR_NAME, dbo.Data0008.PROD_CODE, '#13#10'                    ' +
      '  dbo.Data0008.PRODUCT_NAME, dbo.Data0052.QUAN_SHP,dbo.Data0052.' +
      'QUAN_SHP * dbo.Data0025.unit_sq AS sales_square, '#13#10'             ' +
      'Data0053.matl_ovhd_pcs + Data0053.cost_pcs + Data0053.OVHD_COST ' +
      '+ Data0053.PLANNED_QTY+Data0053.ovhd1_pcs+ Data0053.outsource_pc' +
      's AS MATL_COST,                       '#13#10'             Data0052.QU' +
      'AN_SHP *'#13#10'           (Data0053.matl_ovhd_pcs + Data0053.cost_pcs' +
      ' + Data0053.OVHD_COST + Data0053.PLANNED_QTY+Data0053.ovhd1_pcs+' +
      ' Data0053.outsource_pcs)  AS sales_matl_cost, '#13#10'          ROUND(' +
      'Data0052.QUAN_SHP * Data0060.PARTS_ALLOC / dbo.Data0060.EXCH_RAT' +
      'E, 4) AS sales_amount, '#13#10'          CASE WHEN Data0060.PARTS_ALLO' +
      'C > 0 THEN '#13#10'         round((data0053.matl_ovhd_pcs + data0053.c' +
      'ost_pcs + data0053.OVHD_COST + data0053.PLANNED_QTY+Data0053.ovh' +
      'd1_pcs+ Data0053.outsource_pcs) '#13#10'                      * 100 / ' +
      '(dbo.Data0060.PARTS_ALLOC / dbo.Data0060.EXCH_RATE), 2) ELSE 0 E' +
      'ND AS cost_rate, '#13#10'   Data0053.cost_pcs, Data0053.matl_ovhd_pcs,' +
      ' Data0053.OVHD_COST, Data0053.PLANNED_QTY, Data0053.ovhd1_pcs, D' +
      'ata0053.outsource_pcs,'#13#10'   dbo.Data0060.ORIG_CUSTOMER, dbo.Data0' +
      '015.ABBR_NAME AS abbr_name15, '#13#10'   CASE Data0060.so_tp WHEN 0 TH' +
      'EN '#39#33258#21046#39' WHEN 1 THEN '#39#22806#21457#39' WHEN 2 THEN '#39#21322#21046#31243#39' END AS so_type, dbo.D' +
      'ata0053.MFG_DATE,'#13#10#13#10'ROUND(Data0052.QUAN_SHP * (Data0060.PARTS_A' +
      'LLOC / dbo.Data0060.EXCH_RATE-'#13#10'                   (Data0053.mat' +
      'l_ovhd_pcs + Data0053.cost_pcs + Data0053.OVHD_COST + Data0053.P' +
      'LANNED_QTY+Data0053.ovhd1_pcs+ Data0053.outsource_pcs) )'#13#10',4) as' +
      ' '#38144#21806#27611#21033#13#10'FROM         dbo.Data0006 RIGHT OUTER JOIN'#13#10'             ' +
      '         dbo.Data0053 INNER JOIN'#13#10'                      dbo.Data' +
      '0052 INNER JOIN'#13#10'                      dbo.Data0064 ON dbo.Data0' +
      '052.SO_SHP_PTR = dbo.Data0064.RKEY INNER JOIN'#13#10'                 ' +
      '     dbo.Data0060 ON dbo.Data0064.SO_PTR = dbo.Data0060.RKEY INN' +
      'ER JOIN'#13#10'                      dbo.Data0010 ON dbo.Data0060.CUST' +
      'OMER_PTR = dbo.Data0010.RKEY ON dbo.Data0053.RKEY = dbo.Data0052' +
      '.DATA0053_PTR INNER JOIN'#13#10'                      dbo.Data0008 INN' +
      'ER JOIN'#13#10'                      dbo.Data0025 ON dbo.Data0008.RKEY' +
      ' = dbo.Data0025.PROD_CODE_PTR ON dbo.Data0060.CUST_PART_PTR = db' +
      'o.Data0025.RKEY ON '#13#10'                      dbo.Data0006.RKEY = d' +
      'bo.Data0053.WORK_ORDER_PTR INNER JOIN'#13#10'                      dbo' +
      '.Data0015 ON dbo.Data0060.SHIP_REG_TAX_ID = dbo.Data0015.RKEY'#13#10'W' +
      'HERE     (dbo.Data0064.DATE_ASSIGN > :vdate1) AND (dbo.Data0064.' +
      'DATE_ASSIGN <= :vdate2)'#13#10'ORDER BY dbo.Data0060.SALES_ORDER'
    Parameters = <
      item
        Name = 'vdate1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 42248d
      end
      item
        Name = 'vdate2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 42262d
      end>
    Prepared = True
    Left = 448
    Top = 353
    object ads52_listSALES_ORDER: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ads52_listso_type: TStringField
      DisplayLabel = #35746#21333#31867#22411
      FieldName = 'so_type'
      ReadOnly = True
      Size = 6
    end
    object ads52_listDATE_ASSIGN: TDateTimeField
      DisplayLabel = #25351#27966#26085#26399
      FieldName = 'DATE_ASSIGN'
    end
    object ads52_listCUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ads52_listABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ads52_listMANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ads52_listMANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ads52_listWORK_ORDER_PTR: TIntegerField
      FieldName = 'WORK_ORDER_PTR'
    end
    object ads52_listPROD_CODE: TStringField
      DisplayLabel = #20135#21697#31867#22411#20195#30721
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ads52_listPRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#31867#22411#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ads52_listWORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20316#19994#21333#21495
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ads52_listQUAN_SHP: TFloatField
      DisplayLabel = #25351#27966#25968#37327
      FieldName = 'QUAN_SHP'
    end
    object ads52_listsales_square: TFloatField
      DisplayLabel = #38144#21806#38754#31215
      FieldName = 'sales_square'
      ReadOnly = True
    end
    object ads52_listsales_amount: TFloatField
      DisplayLabel = #38144#21806#37329#39069
      FieldName = 'sales_amount'
      ReadOnly = True
    end
    object ads52_listmatl_ovhd_pcs: TFloatField
      DisplayLabel = #27599'PCS'#26448#26009#25104#26412
      FieldName = 'matl_ovhd_pcs'
    end
    object ads52_listOVHD_COST: TFloatField
      DisplayLabel = #27599'PCS'#21046#36896#36153#29992
      FieldName = 'OVHD_COST'
    end
    object ads52_listcost_pcs: TFloatField
      DisplayLabel = #22996#22806#25110#25253#24223#25104#26412
      FieldName = 'cost_pcs'
    end
    object ads52_listPLANNED_QTY: TFloatField
      DisplayLabel = #24102#20837#25104#26412
      FieldName = 'PLANNED_QTY'
    end
    object ads52_listovhd1_pcs: TFloatField
      DisplayLabel = #27599'PCS'#30452#25509#20154#24037
      FieldName = 'ovhd1_pcs'
    end
    object ads52_listoutsource_pcs: TFloatField
      DisplayLabel = #27599'PCS'#20108#31867#26448#26009#25104#26412
      FieldName = 'outsource_pcs'
    end
    object ads52_listMATL_COST: TFloatField
      DisplayLabel = #27599'PCS'#24635#25104#26412
      FieldName = 'MATL_COST'
      ReadOnly = True
    end
    object ads52_listsales_matl_cost: TFloatField
      DisplayLabel = #38144#21806#25104#26412
      FieldName = 'sales_matl_cost'
      ReadOnly = True
    end
    object ads52_listDSDesigner: TFloatField
      FieldName = #38144#21806#27611#21033
      ReadOnly = True
    end
    object ads52_listcost_rate: TFloatField
      DisplayLabel = #25104#26412#29575'%'
      FieldName = 'cost_rate'
      ReadOnly = True
    end
    object ads52_listORIG_CUSTOMER: TStringField
      DisplayLabel = #20851#32852#21407#23458#25143
      FieldName = 'ORIG_CUSTOMER'
      Size = 10
    end
    object ads52_listMFG_DATE: TDateTimeField
      DisplayLabel = #23436#24037#26085#26399
      FieldName = 'MFG_DATE'
    end
    object ads52_listabbr_name15: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'abbr_name15'
      Size = 10
    end
  end
  object DataSource9: TDataSource
    DataSet = ads52_list
    Left = 416
    Top = 353
  end
  object PopupMenu7: TPopupMenu
    Left = 588
    Top = 205
    object N7: TMenuItem
      Caption = #20986#20179#26126#32454
      OnClick = N7Click
    end
  end
end
