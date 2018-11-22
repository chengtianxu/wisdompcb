inherited FrmMain_mod496: TFrmMain_mod496
  Caption = #29983#20135#39046#26009#30003#35831
  ClientHeight = 568
  ClientWidth = 1051
  ExplicitWidth = 1067
  ExplicitHeight = 607
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 1051
    Height = 568
    ExplicitWidth = 1051
    ExplicitHeight = 568
    inherited pnlDisplayMain: TPanel
      Width = 1051
      Height = 568
      ExplicitWidth = 1051
      ExplicitHeight = 568
      inherited pnlChildMain: TPanel
        Width = 1049
        Height = 566
        ExplicitWidth = 1049
        ExplicitHeight = 566
        inherited pnlEhMainDisplay: TPanel
          Width = 1047
          Height = 535
          ExplicitWidth = 1047
          ExplicitHeight = 535
          object eh468: TDBGridEh [0]
            Left = 1
            Top = 297
            Width = 1045
            Height = 237
            Align = alClient
            DataSource = ds468
            DynProps = <>
            TabOrder = 1
            OnDrawColumnCell = eh468DrawColumnCell
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_PART_NUMBER'
                Footers = <>
                Title.Caption = #26448#26009#32534#30721
                Width = 71
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_PART_DESCRIPTION'
                Footers = <>
                Title.Caption = #26448#26009#21517#31216'/'#35268#26684
                Width = 160
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUAN_BOM'
                Footers = <>
                Title.Caption = #30003#39046#25968#37327
                Width = 59
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'VENDOR'
                Footers = <>
                Title.Caption = #20379#24212#21830
                Width = 67
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'unit_name'
                Footers = <>
                Title.Caption = #21333#20301
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUAN_ISSUED'
                Footers = <>
                Title.Caption = #24050#21457#25918#25968#37327
                Width = 76
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PRINTIT_S'
                Footers = <>
                Title.Caption = #26159#21542'VMI'
                Width = 65
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'control_name'
                Footers = <>
                Title.Caption = #25511#21046#39033#30446
                Width = 63
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'standards'
                Footers = <>
                Title.Caption = #39046#26009#26631#20934
                Width = 90
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'remark'
                Footers = <>
                Title.Caption = #22791#27880
                Width = 226
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ExReason'
                Footers = <>
                Title.Caption = #36229#39046#29702#30001
                Width = 185
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'overproof'
                Footers = <>
                Visible = False
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'RKEY'
                Footers = <>
                Visible = False
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
          inherited ehMain: TDBGridEh
            Width = 1045
            Height = 296
            Align = alTop
            OnDrawColumnCell = ehMainDrawColumnCell
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'number'
                Footers = <>
                Title.Caption = #39046#26009#21333#21495
                Width = 71
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DATE'
                Footers = <>
                Title.Caption = #30003#35831#26085#26399
                Width = 90
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DEPT_CODE'
                Footers = <>
                Title.Caption = #37096#38376#32534#21495
                Width = 55
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DEPT_NAME'
                Footers = <>
                Title.Caption = #37096#38376#21517#31216
                Width = 76
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'abbr_name'
                Footers = <>
                Title.Caption = #30003#39046#20154
                Width = 65
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'status_c'
                Footers = <>
                Title.Caption = #23457#26680#29366#24577
                Width = 58
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'Auditname'
                Footers = <>
                Title.Caption = #23457#26680#20154
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'auth_date'
                Footers = <>
                Title.Caption = #23457#26680#26085#26399
                Width = 87
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'fac_name'
                Footers = <>
                Title.Caption = #24037#21378#21517#31216
                Width = 88
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'reference'
                Footers = <>
                Title.Caption = #22791#27880
                Width = 72
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PRINTITS'
                Footers = <>
                Title.Caption = #25171#21360
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'allow_submit_c'
                Footers = <>
                Title.Caption = #30830#35748#29366#24577
                Width = 57
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'allow_submit_person_name'
                Footers = <>
                Title.Caption = #20801#35768#25552#20132#20154#21592
                Width = 56
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'allow_submit_time'
                Footers = <>
                Title.Caption = #20801#35768#25552#20132#26102#38388
                Width = 83
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 1047
          ExplicitWidth = 1047
          inherited btnDY: TBitBtn
            Visible = True
            OnClick = btnDYClick
          end
          inherited btnAuthDispatch: TBitBtn
            TabOrder = 8
          end
          object btn_DetailQry: TBitBtn
            Left = 740
            Top = 2
            Width = 117
            Height = 27
            Hint = #37325#26032#23450#20041#26597#35810#26465#20214
            Caption = #39046#26009#26126#32454#26597#35810
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
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
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 7
            OnClick = btn_DetailQryClick
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'SELECT     dbo.DATA0268.rkey, dbo.DATA0268.number, dbo.DATA0268.' +
      'dept_ptr, dbo.DATA0268.DATE, dbo.DATA0268.EMPL_PTR, dbo.DATA0268' +
      '.status, '#13#10'                      dbo.DATA0268.auth_emplptr, dbo.' +
      'DATA0268.auth_date, dbo.DATA0268.reference, dbo.Data0034.DEPT_CO' +
      'DE, dbo.Data0034.DEPT_NAME, '#13#10'                      dbo.Data0005' +
      '.EMPL_CODE, dbo.Data0005.EMPLOYEE_NAME AS abbr_name, Data0005_1.' +
      'EMPL_CODE AS Auditcode, '#13#10'                      Data0005_1.EMPLO' +
      'YEE_NAME AS Auditname, dbo.Data0268.cut_no,'#13#10'                   ' +
      '   CASE WHEN data0268.status = 0 THEN '#39#24453#25552#20132#39' WHEN data0268.status' +
      ' = 1 THEN '#39#24453#23457#26680#39' WHEN data0268.status = 2 THEN '#39#24050#23457#26680#39' WHEN data026' +
      '8.status'#13#10'                       = 3 THEN '#39#34987#36864#22238#39' WHEN data0268.st' +
      'atus = 4 THEN '#39#24050#21457#26009#39' END AS status_c, dbo.DATA0268.auth_ptr, dbo.' +
      'Data0094.RKEY AS rkey94, '#13#10'                      dbo.Data0094.CO' +
      'DE, dbo.Data0094.PURCHASE_APPROV_DESC, dbo.Data0015.ABBR_NAME AS' +
      ' fac_name, dbo.DATA0268.warehouse_ptr, '#13#10'                      d' +
      'bo.DATA0268.Prted, dbo.DATA0268.allow_submit, '#13#10'                ' +
      '      CASE WHEN data0268.allow_submit = 0 THEN '#39#19981#30830#35748#39' WHEN data02' +
      '68.allow_submit = 1 THEN '#39#24453#30830#35748#39' WHEN data0268.allow_submit = 2 TH' +
      'EN '#39#24050#30830#35748#39#13#10'                               WHEN data0268.allow_sub' +
      'mit = 3 THEN '#39#24453#30830#35748#39#13#10'                       END AS allow_submit_c' +
      ', Data0005_2.EMPL_CODE AS allow_submit_person_code, Data0005_2.E' +
      'MPLOYEE_NAME AS allow_submit_person_name, '#13#10'                    ' +
      '  dbo.DATA0268.allow_submit_time, dbo.DATA0268.control_ptr,dbo.D' +
      'ATA0268.IsMsgSended '#13#10'FROM         dbo.DATA0268 INNER JOIN'#13#10'    ' +
      '                  dbo.Data0034 ON dbo.DATA0268.dept_ptr = dbo.Da' +
      'ta0034.RKEY INNER JOIN'#13#10'                      dbo.Data0005 ON db' +
      'o.DATA0268.EMPL_PTR = dbo.Data0005.RKEY LEFT JOIN'#13#10'             ' +
      '         dbo.Data0005 AS Data0005_1 ON dbo.DATA0268.auth_emplptr' +
      ' = Data0005_1.RKEY INNER JOIN'#13#10'                      dbo.Data009' +
      '4 ON dbo.DATA0268.auth_ptr = dbo.Data0094.RKEY INNER JOIN'#13#10'     ' +
      '                 dbo.Data0015 ON dbo.DATA0268.warehouse_ptr = db' +
      'o.Data0015.RKEY LEFT JOIN'#13#10'                      dbo.Data0005 AS' +
      ' Data0005_2 ON dbo.DATA0268.allow_submit_person = Data0005_2.RKE' +
      'Y'#13#10'where 1=1'#13#10
    ProviderName = 'dtstprvdr1'
    ReadOnly = True
    AfterScroll = cdsMainAfterScroll
    Left = 432
    Top = 96
  end
  inherited dsMain: TDataSource
    Left = 496
    Top = 96
  end
  inherited pmZD: TPopupMenu
    Left = 536
    Top = 56
  end
  inherited xpmnfst1: TXPManifest
    Left = 608
    Top = 80
  end
  inherited pmMain: TPopupMenu
    OnPopup = pmMainPopup
    Left = 96
    Top = 192
    object mniAdd: TMenuItem
      Caption = #26032#22686
      OnClick = mniAddClick
    end
    object mniEdit: TMenuItem
      Caption = #32534#36753
      OnClick = mniEditClick
    end
    object mniView: TMenuItem
      Caption = #26597#30475
      OnClick = mniViewClick
    end
    object mniDel: TMenuItem
      Caption = #21024#38500
      OnClick = mniDelClick
    end
    object N1: TMenuItem
      Caption = '----------------'
    end
    object mniSubmit: TMenuItem
      Caption = #25552#20132#30003#25209
      OnClick = mniSubmitClick
    end
    object mniCancelAudidt: TMenuItem
      Caption = #21462#28040#23457#25209
      OnClick = mniCancelAudidtClick
    end
    object N2: TMenuItem
      Caption = '----------------'
    end
    object mniPrint: TMenuItem
      Caption = #25171#21360
      OnClick = mniPrintClick
    end
    object mniRePrint: TMenuItem
      Caption = #20801#35768#37325#26032#25171#21360
      OnClick = mniRePrintClick
    end
    object mniN6: TMenuItem
      Caption = '----------------'
    end
    object mniASubmit: TMenuItem
      Caption = #20801#35768#25552#20132
      OnClick = mniASubmitClick
    end
    object mniAuditInfo: TMenuItem
      Caption = #23457#25209#20449#24687
      OnClick = mniAuditInfoClick
    end
  end
  inherited cdsMainWhereInit: TClientDataSet
    Left = 336
    Top = 96
  end
  object ds468: TDataSource
    DataSet = cds468
    Left = 456
    Top = 256
  end
  object cds468: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT      dbo.Data0468.RKEY, dbo.Data0468.CUT_NO, dbo.Data0468' +
      '.SO_NO, dbo.Data0468.FLOW_NO, dbo.Data0468.STEP, '#13#10'dbo.Data0468.' +
      'DEPT_PTR, dbo.Data0468.INVENT_PTR, dbo.Data0468.QUAN_BOM, dbo.Da' +
      'ta0468.QUAN_ISSUED, '#13#10'dbo.Data0468.STATUS, dbo.Data0468.PRINTIT,' +
      ' dbo.Data0468.VENDOR, dbo.Data0468.Invent_or,dbo.Data0468.quan_a' +
      'lloc,'#13#10'dbo.Data0468.overproof, dbo.Data0017.INV_PART_NUMBER, dbo' +
      '.Data0017.INV_PART_DESCRIPTION,data0002.unit_name,'#13#10'case dbo.Dat' +
      'a0468.PRINTIT when '#39'Y'#39' then '#39#26222#36890#24211#23384#39' when '#39'N'#39' then '#39'VMI'#24211#23384#39' END AS ' +
      'PRINTIT_S, '#13#10'data0468.control_ptr,d136.control_name,dbo.Data0468' +
      '.remark,data0468.supplier_ptr,data0468.ExReason,data0468.standar' +
      'ds'#13#10'FROM         dbo.Data0468 '#13#10'INNER JOIN    dbo.Data0017 ON db' +
      'o.Data0468.INVENT_PTR = dbo.Data0017.RKEY'#13#10' inner join data0002 ' +
      'on data0017.STOCK_UNIT_PTR=data0002.rkey'#13#10' left join data0136 d1' +
      '36 on data0468.control_ptr=d136.rkey'#13#10'where  1=1'#13#10
    Params = <>
    ReadOnly = True
    Left = 392
    Top = 264
  end
  object cds14: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT   *   FROM         dbo.Data0014'#13#10'where  1=0'
    Params = <>
    Left = 224
    Top = 88
  end
  object cds314: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT  *'#13#10'FROM         dbo.data0314'#13#10'where 1=0'
    Params = <>
    Left = 264
    Top = 88
  end
  object frxrprt2: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42669.611309213000000000
    ReportOptions.LastChange = 42718.404510023100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnAfterPrintReport = frxrprt2AfterPrintReport
    Left = 672
    Top = 64
    Datasets = <
      item
        DataSetName = 'frxDBDataset1'
      end
      item
        DataSetName = 'frxDBDataset2'
      end>
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
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Height = 37.795300000000000000
        Top = 181.417440000000000000
        Width = 755.906000000000000000
        DataSetName = 'frxDBDataset2'
        RowCount = 0
        object frxDBDataset2INVENT_PTR: TfrxMemoView
          Left = 1.338590000000000000
          Width = 83.149660000000000000
          Height = 37.795300000000000000
          DataField = 'INVENT_PTR'
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset2."INVENT_PTR"]')
          ParentFont = False
        end
        object frxDBDataset2INV_PART_DESCRIPTION: TfrxMemoView
          Left = 83.708720000000000000
          Width = 192.756030000000000000
          Height = 37.795300000000000000
          DataField = 'INV_PART_DESCRIPTION'
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset2."INV_PART_DESCRIPTION"]')
          ParentFont = False
        end
        object frxDBDataset2QUAN_BOM: TfrxMemoView
          Left = 276.244280000000000000
          Width = 79.370130000000000000
          Height = 37.795300000000000000
          DataField = 'QUAN_BOM'
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset2."QUAN_BOM"]')
          ParentFont = False
        end
        object frxDBDataset2unit_name: TfrxMemoView
          Left = 442.323130000000000000
          Width = 71.811070000000000000
          Height = 37.795300000000000000
          DataField = 'unit_name'
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset2."unit_name"]')
          ParentFont = False
        end
        object frxDBDataset2QUAN_ISSUED: TfrxMemoView
          Left = 354.614410000000000000
          Width = 86.929190000000000000
          Height = 37.795300000000000000
          DataField = 'QUAN_ISSUED'
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset2."QUAN_ISSUED"]')
          ParentFont = False
        end
        object frxDBDataset2remark: TfrxMemoView
          Left = 514.134200000000000000
          Width = 241.889920000000000000
          Height = 37.795300000000000000
          DataField = 'remark'
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset2."remark"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 90.708720000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo1: TfrxMemoView
          Left = 249.448980000000000000
          Top = 3.779530000000000000
          Width = 158.740260000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #29983#20135#39046#26009#30003#35831#21333)
          ParentFont = False
        end
        object frxDBDataset1number1: TfrxMemoView
          Left = 619.842920000000000000
          Top = 26.456710000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          DataField = 'number'
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."number"]')
        end
        object Memo8: TfrxMemoView
          Left = 10.897650000000000000
          Top = 11.338590000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #24037#21378#21517':')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 10.897650000000000000
          Top = 41.574830000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #30003#35831#20154':')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 10.897650000000000000
          Top = 71.811070000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #25209#20934#20154':')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 241.889920000000000000
          Top = 41.574830000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #37096#38376#21517#31216)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 551.811380000000000000
          Top = 26.456710000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #30003#35831#21333#21495':')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 551.811380000000000000
          Top = 56.692950000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #30003#35831#26085#26399)
          ParentFont = False
        end
        object frxDBDataset1DEPT_NAME: TfrxMemoView
          Left = 309.921460000000000000
          Top = 41.574830000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          DataField = 'DEPT_NAME'
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."DEPT_NAME"]')
          ParentFont = False
        end
        object frxDBDataset1fac_name: TfrxMemoView
          Left = 68.031540000000000000
          Top = 11.338590000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          DataField = 'fac_name'
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."fac_name"]')
          ParentFont = False
        end
        object frxDBDataset1abbr_name: TfrxMemoView
          Left = 68.031540000000000000
          Top = 41.574830000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DataField = 'abbr_name'
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."abbr_name"]')
          ParentFont = False
        end
        object frxDBDataset1Auditname: TfrxMemoView
          Left = 64.252010000000000000
          Top = 69.811070000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DataField = 'Auditname'
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."Auditname"]')
          ParentFont = False
        end
        object frxDBDataset1DATE: TfrxMemoView
          Left = 623.622450000000000000
          Top = 56.692950000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DataField = 'DATE'
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."DATE"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 132.283550000000000000
        Width = 755.906000000000000000
        object Memo2: TfrxMemoView
          Top = 3.779529999999990000
          Width = 83.149660000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #29289#26009#32534#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 83.149660000000000000
          Top = 3.779529999999990000
          Width = 192.756030000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #21517#31216'/'#35268#26684)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 275.464750000000000000
          Top = 3.559059999999990000
          Width = 79.370130000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #30003#39046#25968#37327)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 354.275820000000000000
          Top = 3.779529999999990000
          Width = 86.929190000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #23454#21457#25968)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 441.205010000000000000
          Top = 3.779529999999990000
          Width = 71.811070000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #21333#20301)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 513.016080000000000000
          Top = 3.779529999999990000
          Width = 241.889920000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #22791#27880)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 71.811070000000000000
        Top = 279.685220000000000000
        Width = 755.906000000000000000
        object Memo3: TfrxMemoView
          Left = 18.897650000000000000
          Top = 7.559059999999990000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #21457#26009#20154':')
        end
        object frxDBDataset1reference: TfrxMemoView
          Left = 480.000310000000000000
          Top = 7.559059999999990000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          DataField = 'reference'
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."reference"]')
        end
        object Memo4: TfrxMemoView
          Left = 15.118120000000000000
          Top = 37.795300000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #20801#35768#25552#20132#20154#21592':')
        end
        object Memo5: TfrxMemoView
          Left = 203.417440000000000000
          Top = 3.779530000000020000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #39046#26009#31614#25910':')
        end
        object Memo6: TfrxMemoView
          Left = 376.378170000000000000
          Top = 38.015770000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #20801#35768#25552#20132#26102#38388':')
        end
        object Line1: TfrxLineView
          Left = 86.929190000000000000
          Top = 26.456710000000000000
          Width = 113.385900000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          Left = 282.787570000000000000
          Top = 26.456710000000000000
          Width = 124.724490000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo7: TfrxMemoView
          Left = 423.307360000000000000
          Top = 7.559059999999990000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #22791#27880':')
        end
        object frxDBDataset1allow_submit_person_name: TfrxMemoView
          Left = 113.385900000000000000
          Top = 36.795300000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          DataField = 'allow_submit_person_name'
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."allow_submit_person_name"]')
        end
        object frxDBDataset1allow_submit_time: TfrxMemoView
          Left = 476.425480000000000000
          Top = 36.015770000000000000
          Width = 143.622140000000000000
          Height = 26.456710000000000000
          DataField = 'allow_submit_time'
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."allow_submit_time"]')
        end
      end
    end
  end
  object cdstempt: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 680
    Top = 208
  end
  object qrytemp: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security In' +
      'fo=True;User ID=WZPCBConnect;Initial Catalog=sj_v20_live;Data So' +
      'urce=172.16.8.112'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT  top 10     dbo.Data0468.RKEY, dbo.Data0468.CUT_NO, dbo.D' +
        'ata0468.SO_NO, dbo.Data0468.FLOW_NO, dbo.Data0468.STEP, '
      
        'dbo.Data0468.DEPT_PTR, dbo.Data0468.INVENT_PTR, dbo.Data0468.QUA' +
        'N_BOM, dbo.Data0468.QUAN_ISSUED, '
      
        'dbo.Data0468.STATUS, dbo.Data0468.PRINTIT, dbo.Data0468.VENDOR, ' +
        'dbo.Data0468.Invent_or,dbo.Data0468.quan_alloc,'
      
        'dbo.Data0468.overproof, dbo.Data0017.INV_PART_NUMBER, dbo.Data00' +
        '17.INV_PART_DESCRIPTION,data0002.unit_name,'
      
        'case dbo.Data0468.PRINTIT when '#39'Y'#39' then '#39#26222#36890#24211#23384#39' when '#39'N'#39' then '#39'VM' +
        'I'#24211#23384#39' END AS PRINTIT_S, '
      
        'data0468.control_ptr,d136.control_name,dbo.Data0468.remark,data0' +
        '468.supplier_ptr,data0468.ExReason,data0468.standards'
      'FROM         dbo.Data0468 '
      
        'INNER JOIN    dbo.Data0017 ON dbo.Data0468.INVENT_PTR = dbo.Data' +
        '0017.RKEY'
      ' left join data0002 on data0468.RUnit=data0002.rkey'
      ' left join data0136 d136 on data0468.control_ptr=d136.rkey'
      'where  1=1')
    Left = 632
    Top = 368
    object atncfldRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object strngfldCUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object strngfldSO_NO: TStringField
      FieldName = 'SO_NO'
      FixedChar = True
      Size = 12
    end
    object intgrfldFLOW_NO: TIntegerField
      FieldName = 'FLOW_NO'
    end
    object smlntfldSTEP: TSmallintField
      FieldName = 'STEP'
    end
    object intgrfldDEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object intgrfldINVENT_PTR: TIntegerField
      FieldName = 'INVENT_PTR'
    end
    object fltfldQUAN_BOM: TFloatField
      FieldName = 'QUAN_BOM'
    end
    object fltfldQUAN_ISSUED: TFloatField
      FieldName = 'QUAN_ISSUED'
    end
    object smlntfldSTATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object strngfldPRINTIT: TStringField
      FieldName = 'PRINTIT'
      FixedChar = True
      Size = 1
    end
    object strngfldVENDOR: TStringField
      FieldName = 'VENDOR'
      Size = 30
    end
    object smlntfldInvent_or: TSmallintField
      FieldName = 'Invent_or'
    end
    object qrytempquan_alloc: TBCDField
      FieldName = 'quan_alloc'
      Precision = 9
      Size = 2
    end
    object wrdfldqrytempoverproof: TWordField
      FieldName = 'overproof'
    end
    object strngfldINV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object strngfldINV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object strngfld_name: TStringField
      FieldName = 'unit_name'
    end
    object strngfldPRINTIT_S: TStringField
      FieldName = 'PRINTIT_S'
      ReadOnly = True
      Size = 8
    end
    object intgrfld_ptr: TIntegerField
      FieldName = 'control_ptr'
    end
    object strngfld_name1: TStringField
      FieldName = 'control_name'
      Size = 50
    end
    object strngfldqrytempremark: TStringField
      FieldName = 'remark'
      Size = 500
    end
    object intgrfld_ptr1: TIntegerField
      FieldName = 'supplier_ptr'
    end
    object strngfldExReason: TStringField
      FieldName = 'ExReason'
      Size = 200
    end
    object strngfldqrytempstandards: TStringField
      FieldName = 'standards'
    end
  end
end
