inherited FrmMain_Mod38ReBackAndReprt: TFrmMain_Mod38ReBackAndReprt
  Caption = 'FrmMain_Mod38ReBackAndReprt'
  ClientHeight = 491
  ClientWidth = 1191
  ExplicitWidth = 1207
  ExplicitHeight = 530
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 1191
    Height = 491
    ExplicitWidth = 1191
    ExplicitHeight = 491
    inherited pnlDisplayMain: TPanel
      Width = 1191
      Height = 491
      ExplicitWidth = 1191
      ExplicitHeight = 491
      inherited pnlChildMain: TPanel
        Width = 1189
        Height = 489
        ExplicitWidth = 1189
        ExplicitHeight = 489
        inherited pnlEhMainDisplay: TPanel
          Top = 41
          Width = 1187
          Height = 447
          ExplicitTop = 41
          ExplicitWidth = 1187
          ExplicitHeight = 447
          inherited ehMain: TDBGridEh
            Width = 1185
            Height = 192
            Align = alTop
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'GON_NUMBER'
                Footers = <>
                Title.Caption = #20986#20179#21333#21495
                Width = 67
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'REF_NUMBER'
                Footers = <>
                Title.Caption = #39046#26009#21333#21495
                Width = 74
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CREATE_DATE'
                Footers = <>
                Title.Caption = #39046#26009#26085#26399
                Width = 104
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
                Title.Caption = #24037#21378#31616#31216
                Width = 70
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DEPT_CODE'
                Footers = <>
                Title.Caption = #37096#38376#20195#30721
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DEPT_NAME'
                Footers = <>
                Title.Caption = #37096#38376#21517#31216
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'EMPLOYEE_NAME'
                Footers = <>
                Title.Caption = #39046#26009#20154#21592
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = #20986#20179#31867#22411
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = #29366#24577
                Footers = <>
              end>
          end
          object eh208: TDBGridEh
            Left = 1
            Top = 193
            Width = 1185
            Height = 253
            Align = alClient
            DataSource = ds208
            DynProps = <>
            PopupMenu = pm208
            TabOrder = 1
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'goods_name'
                Footers = <>
                Title.Caption = #29289#21697#21517#31216
                Width = 99
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'goods_guige'
                Footers = <>
                Title.Caption = #29289#21697#35268#26684
                Width = 167
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'goods_type'
                Footers = <>
                Title.Caption = #31867#22411
                Width = 90
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'UNIT_NAME'
                Footers = <>
                Title.Caption = #21333#20301
                Width = 89
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUANTITY'
                Footers = <>
                Title.Caption = #21457#25918#25968#37327
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'RTN_QUANTITY'
                Footers = <>
                Title.Caption = #36864#20179#25968#37327
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'rohs'
                Footers = <>
                Title.Caption = #29615#20445#26631#35782
                Width = 42
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'REF_NUMBER'
                Footers = <>
                Title.Caption = #22791#27880
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
          object eh207: TDBGridEh
            Left = 1
            Top = 193
            Width = 1185
            Height = 253
            Align = alClient
            DataSource = ds207
            DynProps = <>
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            PopupMenu = pm207
            ReadOnly = True
            TabOrder = 2
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_PART_NUMBER'
                Footers = <>
                Title.Caption = #29289#26009#32534#21495
                Width = 64
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_NAME'
                Footers = <>
                Title.Caption = #29289#26009#21517#31216
                Width = 64
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_DESCRIPTION'
                Footers = <>
                Title.Caption = #29289#26009#35268#26684
                Width = 132
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUANTITY'
                Footers = <>
                Title.Caption = #21457#25918#25968#37327
                Width = 59
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'RTN_QUANTITY'
                Footers = <>
                Title.Caption = #36864#20179#25968#37327
                Width = 62
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'UNIT_NAME'
                Footers = <>
                Title.Caption = #21333#20301
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'rohs'
                Footers = <>
                Title.Caption = #29615#20445#26631#35782
                Width = 75
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'SUPPLIER2'
                Footers = <>
                Title.Caption = #21407#21046#36896#21830
                Width = 120
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 1187
          Height = 40
          ExplicitWidth = 1187
          ExplicitHeight = 40
          inherited lblFilter: TLabel
            Left = 475
            Top = 12
            ExplicitLeft = 475
            ExplicitTop = 12
          end
          inherited btnExit: TBitBtn
            Height = 40
            ExplicitHeight = 40
          end
          inherited btnRefresh: TBitBtn
            Width = 59
            Height = 40
            ExplicitWidth = 59
            ExplicitHeight = 40
          end
          inherited btnExportToExcel: TBitBtn
            Left = 319
            Height = 40
            Visible = False
            ExplicitLeft = 319
            ExplicitHeight = 40
          end
          inherited btnQry: TBitBtn
            Left = 124
            Height = 40
            ExplicitLeft = 124
            ExplicitHeight = 40
          end
          inherited edtFliter: TEdit [5]
            Left = 529
            Top = 9
            Width = 88
            TabOrder = 4
            ExplicitLeft = 529
            ExplicitTop = 9
            ExplicitWidth = 88
          end
          object btnSendDetail: TBitBtn [6]
            Left = 319
            Top = 0
            Width = 88
            Height = 40
            Caption = #21457#26009#26126#32454
            Glyph.Data = {
              F2060000424DF206000000000000360400002800000019000000190000000100
              080000000000BC0200001217000012170000000100000000000000000000F8F8
              0000B0B0B00080808000F8600000F0F8F80060606000C8F8C80048484800D0E0
              E00098300000F8C89800F8F8980060000000F898000098989800F86060003030
              3000F8F83000F8F8C800F8E8C800C8C8C800F8F8F8001818180070707000C0C0
              C000E8E8E8005050500000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000013000088331700000000000000E400F712000035A6FC00770000001300
              0700A7FC7700080613000083A600FC7700000000000035A5FC0077FFFF000000
              7C00010000000000000000000000000000000000000000000000000000000000
              4300000000000039F000008800008A0098006317000078011300009863001700
              78000113000090631700000000000000C000F7120000C8F3EB007770F5001200
              0000ECFD7F0002000000000000001300F2000100000001000A0000884000F877
              8800331700000100000000998400E6775400F71200000101010001D8F8001200
              450090FB7700801FF80077FFFF00FFFF6000F8120000AD84E6007760F8001200
              D80084E677000000000000FFFF000000E40039F00000E439F000001800000000
              00000000000044F8120000400000000000000000000028F81200000000000000
              00000000000000000000000C000000000200000000000101120000872B00F877
              0000ECFD7F00000000000002000000009000001A020090331700007FFF00FFFF
              00000000000090331700000500000000870031E6770084F8120000218600E677
              9800F81200006713000010FFFF0000007C0001000000E439F000000000000000
              7000F8120000ACF8120000D8F8001200100030001000F8400000105F5400E677
              7C0001000000D0F8120000D8F80012000800000000000E000000161616161616
              1616161616161616161616161616161616161600000016161616161616161616
              1616161616161616161616161616160000001616161616161616161616161616
              16161616161616161616160000001616161616161616161616161616161616F9
              0F161616161616000000161616161616161616161616161616160A0E040D1616
              1616160000001616161616161616181B1B1B1B1B1B0A0E0ED90D1B0816161600
              00001616161616161616181515151515B50E010E0D030F181616160000001616
              16161616161618050505050F0EFB048302151A0F051616000000161616161616
              1616180909090A0E0E040D0F090505031616160000001616161616161616180F
              150600010E0D03150505050F051616000000161616161602020318A318030211
              E30F19191905050316161600000016161616180B0C1513070B181706030F0F0F
              0F05050F05161600000016161616180C0715130FE90B18171909090909050503
              161616000000161616020B1A14151312120B0B170F0F0F0F0F05050F05161600
              00001616160213131A0907AA0F12191702190219020509031616160000001616
              160213050515140F0F0F0B1802090909A709191816161600000016161602131A
              0515071212121818191A050509190F06161616000000161616090F0C14091319
              0B0F18190219051903061B08161616000000161616161618180B0B0B0F18091A
              0505051505091902051616000000161616161616031818180F14050505050515
              09191B05161616000000161616161616161603091A05050505050515191B1616
              1616160000001616161616161616031902191902190219020F16161616161600
              0000161616161616161616161605161616160505161616161616160000001616
              1616161616161616161616161616161616161616161616000000161616161616
              16161616161616161616161616161616161616000000}
            TabOrder = 7
            OnClick = btnSendDetailClick
          end
          object grp1: TGroupBox [7]
            Left = 630
            Top = -3
            Width = 281
            Height = 38
            Caption = #26102#38388#33539#22260
            TabOrder = 8
            object Label8: TLabel
              Left = 10
              Top = 17
              Width = 16
              Height = 13
              Alignment = taRightJustify
              Caption = #20174':'
            end
            object Label9: TLabel
              Left = 138
              Top = 18
              Width = 16
              Height = 13
              Alignment = taRightJustify
              Caption = #21040':'
            end
            object dtp1: TDateTimePicker
              Left = 40
              Top = 13
              Width = 92
              Height = 21
              Date = 42677.649889027780000000
              Format = 'yyyy-MM-dd hh:mm:ss'
              Time = 42677.649889027780000000
              TabOrder = 0
              OnChange = dtp1Change
            end
            object dtp2: TDateTimePicker
              Left = 176
              Top = 14
              Width = 92
              Height = 21
              Date = 42677.649889027780000000
              Format = 'yyyy-MM-dd hh:mm:ss'
              Time = 42677.649889027780000000
              TabOrder = 1
              OnChange = dtp2Change
            end
          end
          inherited btnAuthDispatch: TBitBtn [8]
            Left = 254
            Height = 40
            TabOrder = 6
            ExplicitLeft = 254
            ExplicitHeight = 40
          end
          inherited btnDY: TBitBtn
            Left = 189
            Height = 40
            TabOrder = 5
            Visible = True
            OnClick = btnDYClick
            ExplicitLeft = 189
            ExplicitHeight = 40
          end
          inherited btnZD: TBitBtn [10]
            Left = 384
            Width = 67
            Height = 40
            TabOrder = 9
            Visible = False
            ExplicitLeft = 384
            ExplicitWidth = 67
            ExplicitHeight = 40
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    AfterScroll = cdsMainAfterScroll
    Left = 88
    Top = 80
  end
  inherited dsMain: TDataSource
    Left = 152
    Top = 80
  end
  inherited pmZD: TPopupMenu
    Left = 224
    Top = 64
  end
  inherited pmMain: TPopupMenu
    Left = 832
    Top = 88
    object mniReAll: TMenuItem
      Caption = #20840#37096#36864#20179
      OnClick = mniReAllClick
    end
    object mniPrt: TMenuItem
      Caption = #25171#21360#20986#20179#21333
      OnClick = mniPrtClick
    end
  end
  inherited cdsMainWhereInit: TClientDataSet
    Left = 296
    Top = 72
  end
  object cds207: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, '#13#10'  ' +
      '    dbo.Data0017.INV_DESCRIPTION, dbo.Data0207.QUANTITY, '#13#10'     ' +
      ' dbo.Data0207.RTN_QUANTITY, dbo.Data0002.UNIT_NAME, dbo.Data0022' +
      '.rohs, '#13#10'      dbo.Data0022.SUPPLIER2, dbo.Data0207.D0022_PTR, '#13 +
      #10'      dbo.Data0207.STANDARD_COST, dbo.Data0022.QUAN_ON_HAND, '#13#10 +
      '      dbo.Data0207.INVENTORY_PTR, dbo.Data0207.RKEY, '#13#10'      dbo' +
      '.Data0017.QUAN_ON_HAND AS hand17, dbo.Data0207.TTYPE, '#13#10'      db' +
      'o.Data0468.QUAN_ISSUED, data0468.STATUS,Data0207.D0468_PTR'#13#10'FROM' +
      ' dbo.Data0207 INNER JOIN'#13#10'      dbo.Data0017 ON dbo.Data0207.INV' +
      'ENTORY_PTR = dbo.Data0017.RKEY INNER JOIN'#13#10'      dbo.Data0022 ON' +
      ' dbo.Data0207.D0022_PTR = dbo.Data0022.RKEY INNER JOIN'#13#10'      db' +
      'o.Data0002 ON '#13#10'      dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0' +
      '002.RKEY LEFT OUTER JOIN'#13#10'      dbo.Data0468 ON dbo.Data0207.D04' +
      '68_PTR = dbo.Data0468.RKEY'#13#10'where gon_ptr=:rkey'
    Params = <
      item
        DataType = ftUnknown
        Name = 'rkey'
        ParamType = ptUnknown
      end>
    ReadOnly = True
    Left = 144
    Top = 368
  end
  object ds207: TDataSource
    DataSet = cds207
    Left = 192
    Top = 368
  end
  object cds208: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT dbo.Data0235.goods_name, dbo.Data0235.goods_guige, '#13#10'    ' +
      '  dbo.Data0235.goods_type, dbo.Data0002.UNIT_NAME, dbo.Data0235.' +
      'rohs, '#13#10'      dbo.Data0235.REF_NUMBER, dbo.DATA0208.QUANTITY, '#13#10 +
      '      dbo.DATA0208.RTN_QUANTITY, dbo.DATA0208.SOURCE_PTR,'#13#10'data0' +
      '235.QUAN_ON_HAND,data0208.rkey, data0208.DEPT_PTR, data0208.GON_' +
      'PTR'#13#10'FROM dbo.DATA0208 INNER JOIN'#13#10'      dbo.Data0235 ON dbo.DAT' +
      'A0208.SOURCE_PTR = dbo.Data0235.RKEY INNER JOIN'#13#10'      dbo.Data0' +
      '002 ON dbo.Data0235.unit_ptr = dbo.Data0002.RKEY'#13#10'where data0208' +
      '.gon_ptr=:rkey'
    Params = <
      item
        DataType = ftUnknown
        Name = 'rkey'
        ParamType = ptUnknown
      end>
    Left = 320
    Top = 368
  end
  object ds208: TDataSource
    DataSet = cds208
    Left = 360
    Top = 360
  end
  object pm207: TPopupMenu
    Left = 520
    Top = 331
    object mniRet207: TMenuItem
      Caption = #21333#39033#36864#20179
      OnClick = mniRet207Click
    end
  end
  object pm208: TPopupMenu
    Left = 576
    Top = 331
    object mniRet208: TMenuItem
      Caption = #21333#39033#36864#20179
      OnClick = mniRet208Click
    end
  end
  object cdstemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 672
    Top = 120
  end
  object frxrprt1: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42704.716279097220000000
    ReportOptions.LastChange = 42704.716279097220000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 656
    Top = 120
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
    end
  end
  object pm_Rpt: TPopupMenu
    Left = 392
    Top = 48
    object mni_BM: TMenuItem
      Caption = #23450#20041#32534#30721#29289#26009#39046#26009#21333
      OnClick = mni_BMClick
    end
    object mni_ORrt: TMenuItem
      Caption = #23450#20041#38750#32534#30721#29289#26009#39046#26009#21333
      OnClick = mni_ORrtClick
    end
  end
end
