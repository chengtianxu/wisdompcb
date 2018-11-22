object Form2: TForm2
  Left = 196
  Top = 143
  Width = 810
  Height = 560
  Caption = #36235#21183#20998#26512#26126#32454#21450#22270#34920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 35
    Width = 802
    Height = 498
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #38144#21806#25104#26412#36235#21183
      object PageControl2: TPageControl
        Left = 0
        Top = 0
        Width = 794
        Height = 470
        ActivePage = TabSheet3
        Align = alClient
        MultiLine = True
        TabOrder = 0
        TabPosition = tpLeft
        object TabSheet3: TTabSheet
          Caption = #25104#26412#26126#32454
          object DBGridEh1: TDBGridEh
            Left = 0
            Top = 0
            Width = 766
            Height = 462
            Align = alClient
            DataSource = DM.DataSource1
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -13
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            FooterRowCount = 1
            FrozenCols = 2
            ReadOnly = True
            SumList.Active = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            UseMultiTitle = True
            Columns = <
              item
                EditButtons = <>
                FieldName = 'FM_DATE'
                Footers = <>
                Title.Caption = #26399#38388'|'#20174
                Width = 79
              end
              item
                EditButtons = <>
                FieldName = 'END_DATE'
                Footers = <>
                Title.Caption = #26399#38388'|'#21040
                Width = 76
              end
              item
                DisplayFormat = '#,##0.00'#9
                EditButtons = <>
                FieldName = 'stock_matl_cost'
                Footer.Color = clYellow
                Footer.DisplayFormat = '#,##0.00'#9
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#25237#20837'|'#26448#26009'|'#26399#21021#20179#24211#32467#23384
                Width = 89
              end
              item
                DisplayFormat = '#,##0.00'#9
                EditButtons = <>
                FieldName = 'stock_matl_in_wip_cost'
                Footer.Color = clYellow
                Footer.DisplayFormat = '#,##0.00'#9
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#25237#20837'|'#26448#26009'|('#21152')'#26399#21021#24037#24207#32467#23384
                Width = 116
              end
              item
                DisplayFormat = '#,##0.00'#9
                EditButtons = <>
                FieldName = 'purchased_matl_cost'
                Footer.Color = clYellow
                Footer.DisplayFormat = '#,##0.00'#9
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#25237#20837'|'#26448#26009'|('#21152')'#26412#26399#20837#24211
                Width = 92
              end
              item
                DisplayFormat = '#,##0.00'#9
                EditButtons = <>
                FieldName = 'returned_matl_cost'
                Footer.Color = clYellow
                Footer.DisplayFormat = '#,##0.00'#9
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#25237#20837'|'#26448#26009'|('#20943')'#26412#26399#36864#36135
                Width = 99
              end
              item
                DisplayFormat = '#,##0.00'#9
                EditButtons = <>
                FieldName = 'misc_used_matl_cost'
                Footer.Color = clYellow
                Footer.DisplayFormat = '#,##0.00'#9
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#25237#20837'|'#26448#26009'|('#20943')'#38750#35746#21333#32791#29992
                Width = 107
              end
              item
                DisplayFormat = '#,##0.00'#9
                EditButtons = <>
                FieldName = 'closed_stock_matl_cost'
                Footer.Color = clYellow
                Footer.DisplayFormat = '#,##0.00'#9
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#25237#20837'|'#26448#26009'|('#20943')'#26399#26411#20179#24211#32467#23384
                Width = 113
              end
              item
                DisplayFormat = '#,##0.00'#9
                EditButtons = <>
                FieldName = 'closed_stock_matl_in_wip_cost'
                Footer.Color = clYellow
                Footer.DisplayFormat = '#,##0.00'#9
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#25237#20837'|'#26448#26009'|('#20943')'#26399#26411#24037#24207#32467#23384
                Width = 119
              end
              item
                DisplayFormat = '#,##0.00'#9
                EditButtons = <>
                FieldName = 'ovhd1_cost'
                Footer.Color = clYellow
                Footer.DisplayFormat = '#,##0.00'#9
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#25237#20837'|'#36153#29992'|('#21152')'#36153#29992#19968
                Width = 81
              end
              item
                DisplayFormat = '#,##0.00'#9
                EditButtons = <>
                FieldName = 'ovhd2_cost'
                Footer.Color = clYellow
                Footer.DisplayFormat = '#,##0.00'#9
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#25237#20837'|'#36153#29992'|('#21152')'#36153#29992#20108
                Width = 83
              end
              item
                DisplayFormat = '#,##0.00'#9
                EditButtons = <>
                FieldName = 'ovhd3_cost'
                Footer.Color = clYellow
                Footer.DisplayFormat = '#,##0.00'#9
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#26399#25237#20837'|'#36153#29992'|('#21152')'#36153#29992#19977
                Width = 86
              end
              item
                DisplayFormat = '#,##0.00'#9
                EditButtons = <>
                FieldName = 'open_wip_cost'
                Footer.Color = clYellow
                Footer.DisplayFormat = '#,##0.00'#9
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #22312#21046#21697'|('#21152')'#26399#21021#22312#21046#21697
                Width = 106
              end
              item
                DisplayFormat = '#,##0.00'#9
                EditButtons = <>
                FieldName = 'closed_wip_cost'
                Footer.Color = clYellow
                Footer.DisplayFormat = '#,##0.00'#9
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #22312#21046#21697'|('#20943')'#26399#26411#22312#21046#21697
                Width = 104
              end
              item
                DisplayFormat = '#,##0.00'#9
                EditButtons = <>
                FieldName = 'open_fg_cost'
                Footer.Color = clYellow
                Footer.DisplayFormat = '#,##0.00'#9
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #20135#25104#21697'|('#21152')'#26399#21021#20135#25104#21697
                Width = 112
              end
              item
                DisplayFormat = '#,##0.00'#9
                EditButtons = <>
                FieldName = 'closed_fg_cost'
                Footer.Color = clYellow
                Footer.DisplayFormat = '#,##0.00'#9
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #20135#25104#21697'|('#20943')'#26399#26411#20135#25104#21697
                Width = 107
              end
              item
                DisplayFormat = '#,##0.00'#9
                EditButtons = <>
                FieldName = 'SALES_COST'
                Footer.Color = clYellow
                Footer.DisplayFormat = '#,##0.00'#9
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #38144#21806#25104#26412
                Width = 94
              end
              item
                DisplayFormat = '#,##0.00'#9
                EditButtons = <>
                FieldName = 'YIELD_IN_AMOUNT'
                Footer.Color = clYellow
                Footer.DisplayFormat = '#,##0.00'#9
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #38144#21806#37329#39069
                Width = 92
              end
              item
                EditButtons = <>
                FieldName = 'cost_scale'
                Footers = <>
                Title.Caption = #25104#26412#27604#29575'%'
              end>
          end
        end
        object TabSheet4: TTabSheet
          Caption = #20998#26512#22270#34920
          ImageIndex = 1
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #23384#36135#36235#21183
      ImageIndex = 1
      object PageControl3: TPageControl
        Left = 0
        Top = 0
        Width = 794
        Height = 470
        ActivePage = TabSheet5
        Align = alClient
        MultiLine = True
        TabOrder = 0
        TabPosition = tpLeft
        object TabSheet5: TTabSheet
          Caption = #23384#36135#26126#32454
          object sgrid1: TStringGrid
            Left = 0
            Top = 0
            Width = 766
            Height = 462
            Align = alClient
            ColCount = 2
            RowCount = 9
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
            TabOrder = 0
            ColWidths = (
              97
              110)
          end
        end
        object TabSheet6: TTabSheet
          Caption = #20998#26512#22270#34920
          ImageIndex = 1
        end
      end
    end
    object TabSheet7: TTabSheet
      Caption = #26448#26009#28040#32791#36235#21183
      ImageIndex = 2
      object PageControl4: TPageControl
        Left = 0
        Top = 0
        Width = 794
        Height = 470
        ActivePage = TabSheet9
        Align = alClient
        MultiLine = True
        TabOrder = 0
        TabPosition = tpLeft
        object TabSheet9: TTabSheet
          Caption = #28040#32791#26126#32454
          object Sgrid2: TStringGrid
            Left = 0
            Top = 0
            Width = 766
            Height = 462
            Align = alClient
            ColCount = 3
            DefaultColWidth = 74
            FixedCols = 2
            RowCount = 3
            FixedRows = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing]
            TabOrder = 0
            ColWidths = (
              58
              74
              97)
          end
        end
        object TabSheet10: TTabSheet
          Caption = #20998#26512#22270#34920
          ImageIndex = 1
        end
      end
    end
    object TabSheet8: TTabSheet
      Caption = #21046#36896#36153#29992#36235#21183
      ImageIndex = 3
      object PageControl5: TPageControl
        Left = 0
        Top = 0
        Width = 794
        Height = 470
        ActivePage = TabSheet11
        Align = alClient
        MultiLine = True
        TabOrder = 0
        TabPosition = tpLeft
        object TabSheet11: TTabSheet
          Caption = #36153#29992#26126#32454
          object Sgrid3: TStringGrid
            Left = 0
            Top = 0
            Width = 766
            Height = 462
            Align = alClient
            ColCount = 3
            DefaultColWidth = 74
            FixedCols = 2
            RowCount = 3
            FixedRows = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing]
            TabOrder = 0
            ColWidths = (
              58
              74
              97)
          end
        end
        object TabSheet12: TTabSheet
          Caption = #20998#26512#22270#34920
          ImageIndex = 1
        end
      end
    end
    object TabSheet13: TTabSheet
      Caption = #26448#26009#31867#22411#28040#32791#36235#21183
      ImageIndex = 4
      object PageControl6: TPageControl
        Left = 0
        Top = 0
        Width = 794
        Height = 470
        ActivePage = TabSheet14
        Align = alClient
        MultiLine = True
        TabOrder = 0
        TabPosition = tpLeft
        object TabSheet14: TTabSheet
          Caption = #36153#29992#26126#32454
          object Sgrid4: TStringGrid
            Left = 0
            Top = 0
            Width = 766
            Height = 462
            Align = alClient
            ColCount = 3
            DefaultColWidth = 74
            FixedCols = 2
            RowCount = 3
            FixedRows = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing]
            TabOrder = 0
            ColWidths = (
              58
              74
              149)
          end
        end
        object TabSheet15: TTabSheet
          Caption = #20998#26512#22270#34920
          ImageIndex = 1
        end
      end
    end
    object TabSheet16: TTabSheet
      Caption = #25253#24223#25104#26412#36235#20998#26512
      ImageIndex = 5
      object PageControl7: TPageControl
        Left = 0
        Top = 0
        Width = 794
        Height = 470
        ActivePage = TabSheet17
        Align = alClient
        MultiLine = True
        TabOrder = 0
        TabPosition = tpLeft
        object TabSheet17: TTabSheet
          Caption = #25253#24223#25968#25454
          object Sgrid5: TStringGrid
            Left = 0
            Top = 0
            Width = 766
            Height = 462
            Align = alClient
            ColCount = 9
            FixedCols = 2
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing]
            TabOrder = 0
            ColWidths = (
              49
              88
              86
              85
              85
              84
              88
              89
              89)
          end
        end
        object TabSheet18: TTabSheet
          Caption = #20998#26512#22270#34920
          ImageIndex = 1
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 802
    Height = 35
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 6
      Top = 5
      Width = 55
      Height = 25
      Hint = #36864#20986
      Caption = #36864#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
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
      Left = 63
      Top = 5
      Width = 59
      Height = 25
      Caption = #23548#20986
      PopupMenu = PopupMenu1
      TabOrder = 1
      OnClick = BitBtn2Click
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
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    Left = 152
    object N1: TMenuItem
      Caption = #38144#21806#25104#26412#26126#32454
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #23384#36135#36235#21183#26126#32454
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #26448#26009#28040#32791#26126#32454
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #21046#36896#36153#29992#26126#32454
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #26448#26009#28040#32791#31867#22411#26126#32454
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #25253#24223#25104#26412#26126#32454
      OnClick = N6Click
    end
  end
end
