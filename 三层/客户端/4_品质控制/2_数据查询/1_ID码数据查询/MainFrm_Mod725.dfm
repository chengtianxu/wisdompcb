inherited frmMain_Mod725: TfrmMain_Mod725
  Caption = 'ID'#30721#25968#25454#26597#35810
  ClientHeight = 487
  ClientWidth = 757
  ExplicitWidth = 773
  ExplicitHeight = 526
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 757
    Height = 487
    ExplicitWidth = 693
    ExplicitHeight = 439
    inherited pnlDisplayMain: TPanel
      Width = 757
      Height = 487
      ExplicitWidth = 693
      ExplicitHeight = 439
      inherited pnlChildMain: TPanel
        Width = 755
        Height = 485
        ExplicitWidth = 691
        ExplicitHeight = 437
        inherited pnlEhMainDisplay: TPanel
          Width = 753
          Height = 454
          ExplicitWidth = 689
          ExplicitHeight = 406
          inherited ehMain: TDBGridEh
            Width = 751
            Height = 452
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DEPT_CODE'
                Footers = <>
                Title.Caption = #24037#24207#20195#30721
                Width = 64
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DEPT_NAME'
                Footers = <>
                Title.Caption = #24037#24207#21517#31216
                Width = 61
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'FASSET_DESC'
                Footers = <>
                Title.Caption = #35774#22791#32452#21035
                Width = 85
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'FASSET_NAME'
                Footers = <>
                Title.Caption = #35774#22791#32447#21035
                Width = 68
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'panel_id'
                Footers = <>
                Title.Caption = 'ID'#30721
                Width = 90
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'WORK_ORDER_NUMBER'
                Footers = <>
                Title.Caption = #20316#19994#21333#21495
                Width = 105
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'T_DATE'
                Footers = <>
                Title.Caption = #36807#26495#26085#26399
                Width = 68
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ccd_code'
                Footers = <>
                Title.Caption = 'CCD'#30721
                Width = 112
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'abbr_NAME'
                Footers = <>
                Title.Caption = #24037#21378#31616#31216
                Width = 78
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'COMPUTER_IP'
                Footers = <>
                Title.Caption = #30005#33041'IP'
                Width = 81
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'WAREHOUSE_CODE'
                Footers = <>
                Title.Caption = #24037#21378#20195#30721
                Width = 57
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 753
          ExplicitWidth = 689
          inherited edtFliter: TEdit
            Width = 125
            ExplicitWidth = 125
          end
          inherited btnDY: TBitBtn
            Left = 623
            Align = alRight
          end
          inherited btnAuthDispatch: TBitBtn
            Left = 688
            Align = alRight
            Visible = False
          end
          object btnSummary: TBitBtn
            Left = 325
            Top = 0
            Width = 65
            Height = 29
            Align = alLeft
            Caption = #27719#24635
            Glyph.Data = {
              F6060000424DF606000000000000360000002800000018000000180000000100
              180000000000C0060000C40E0000C40E00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FD00FDF300F3F700F7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFE200E29902994C164C711271E100E1FE00FEFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFD700D7B600B62B1A2B616F617A947A687D682320239D099DD2
              00D2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFDE00DEB500B55128512C532CABB7ABFCFFFCBAB8BA9A9C
              9A9CA79C446244422B42AA04AAD300D3FE00FEFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFD400D4A000A05D2B5D525A52A4B5A4E7E7E7F9F8F9
              BBBBBBD4D4D4666666A5A5A5ACABAC8E9D8E2C512C5B3A5B9C0C9CC800C8F500
              F5FF00FFFF00FFFF00FFFF00FFE500E57D007D572257666166A2BDA2D1D4D1FF
              FFFFC0BFC0AAAAAA8C8C8CC5C5C5272727BDBDBD4E4F4ED5D0D5C1B0C1808D80
              5B605B381C38CB00CBFF00FFFF00FFFF00FF560056581458586558B9C5B9D1D8
              D1F2F0F2E1E1E17A7A7AAEAEAEA1A1A13C3C3CEDEDED3333338E8E8EC1BCC1C2
              CEC2509A50A7BAA7C8C8C8144614B400B4FF00FFFF00FFFF00FF5E835EC2D4C2
              EDEEEDDFE0DFD4D4D49F9F9F9999998181819797976C6C6CA5A5A5333333EBEB
              EBCCCDCCE6DBE6B1DEB100E600519C51474347740674F500F5FF00FFFF00FFFF
              00FFB56DB5B7A3B7B7E1B7D9DAD97E787E6F716FB2B1B26262628484848D8D8D
              BFBFBFDBDBDBCECECEE0E0E0D4D2D48485843954394751469796965F655FA809
              A8FD00FDFF00FFFF00FFFC02FCEB13EBC152C194B7949DB69DA19DA14A494A99
              9999B7B7B7E2E2E2D4D4D4CFCFCFEFEFEF919191202020535153928C95D6D6E9
              DEDDE9A1B1A01B1D1BE200E2FF00FFFF00FFFF00FFFF00FFFE00FEF606F6B558
              B588DC88EEFFEEEEF0EEDCDCDCD1D1D0E8E8EAF6F6F6000000222222A0A0A9CB
              CCDDFFFFFFFFFFBAEAEABDD4D4DF6B816B700D70F800F8FF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFF600F6994699A4A5A4C8CCC8B4B4B42E2E2C000000F3F3
              F8F2F2FFFFFFFFFFFFC4FFFF00FFFF26EFEFC2D7D6E48A9E8A4E124EF500F5FF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9527953A463A262729
              4B4B4A7A7A89FFFFFFFFFF9CFCFC13D4D4008F8F07D8D800FFFF6BDFDFDDDAD6
              E1447B44830783FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF96
              3F965B6B5952526C939326969600FFFF68C6C6008F8F0B71715B6B6B947F7F00
              FFFF0DFAFABCD2D2DFA4ACA42E272EFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFCE4DCE9CA39BB0B5D1EEEE5FFFFF00E5E50019195AB1B1BEBD
              BDFAC4C4E1949464C7C700FFFF7DE1E1DBD1CED4285F28BB00BBFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBA83B9B4C3C5595824FBFB00FFFF
              13EEEEDAECECFF6565EE9292D4ACAC9BABAB03FFFF00F5F5B8D4D4E0D2CED200
              0800FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD430D4C4CEC0
              464C87ADAD00FFFF00EBEB3CE1E1FFFFFFFEFDFDC0E2E27BC1C10DC5C5009896
              7AC5C9D1AACAA9350935FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFB671B5C5CFCD000000FFFF00F9F914E8E883EAEA87FFFF18C2C200
              878614838253769876ABADAEB576B5D304D3FF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFCE30CEC1D4BF8387A2686700FFFF00FFFF03DB
              DA004F4F007A7F5187999481AC8DC568C8E12FE1F609F6FF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFA00FAA963A8E9F9F20000
              00FFFF007472004A503595A9A796A39FBF6DC3DF35DEFB04FAFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              D328D3B6BBB7AEB2B0474637819C899EB0AAC56EC5DB3ADBF802F8FF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FF748774DDF0DF81BA89BE73C0DE36DDFD00FDFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84A484FF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            TabOrder = 8
            OnClick = btnSummaryClick
            ExplicitLeft = 328
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'SELECT     dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME, dbo.Y' +
      '1417.FASSET_DESC'#13#10#9#9', dbo.Y1417.FASSET_NAME, dbo.Data0015.abbr_N' +
      'AME, dbo.Data0015.WAREHOUSE_CODE'#13#10#9#9', dbo.Y1408.panel_id, dbo.Y1' +
      '408.ccd_code, dbo.Y1408.T_DATE, dbo.Y1408.COMPUTER_IP'#13#10#9#9', dbo.Y' +
      '1406.WORK_ORDER_NUMBER'#13#10'FROM         dbo.Data0015 INNER JOIN'#13#10'  ' +
      '                    dbo.Y1408 INNER JOIN'#13#10'                      ' +
      'dbo.Y1417 ON dbo.Y1408.Y1417_RKEY = dbo.Y1417.RKEY ON dbo.Data00' +
      '15.RKEY = dbo.Y1417.warehouse_ptr INNER JOIN'#13#10'                  ' +
      '    dbo.Data0034 ON dbo.Y1417.DEPT_PTR = dbo.Data0034.RKEY LEFT ' +
      'OUTER JOIN'#13#10'                      dbo.Y1406 ON dbo.Y1408.Y1406_R' +
      'KEY = dbo.Y1406.rkey'#13#10'WHERE 1=1'
    Left = 400
  end
  inherited pmZD: TPopupMenu
    Left = 288
    Top = 64
  end
  inherited pmMain: TPopupMenu
    Left = 456
    Top = 120
  end
  inherited cdsMainWhereInit: TClientDataSet
    Left = 336
    Top = 72
  end
end
