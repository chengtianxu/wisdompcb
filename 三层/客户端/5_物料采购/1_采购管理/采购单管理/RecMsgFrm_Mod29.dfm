inherited frmRecMsg_Mod29: TfrmRecMsg_Mod29
  Left = 321
  Top = 237
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #25910#36135#20449#24687
  ClientHeight = 553
  ClientWidth = 831
  ExplicitTop = -74
  ExplicitWidth = 847
  ExplicitHeight = 592
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 831
    Height = 41
    Align = alTop
    TabOrder = 0
    object btnClose: TBitBtn
      Left = 2
      Top = 2
      Width = 70
      Height = 35
      Caption = #20851#38381
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
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 0
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 41
    Width = 831
    Height = 512
    Align = alClient
    TabOrder = 1
    object grpPO: TGroupBox
      Left = 1
      Top = 169
      Width = 829
      Height = 175
      Align = alClient
      Caption = #27491#24335#20179#24211#25910#36135#20449#24687
      TabOrder = 0
      object eh1: TDBGridEh
        Left = 2
        Top = 15
        Width = 825
        Height = 158
        Align = alClient
        DataSource = ds456
        DynProps = <>
        ReadOnly = True
        TabOrder = 0
        Columns = <
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'GRN_NUMBER'
            Footers = <>
            Title.Caption = #25910#36135#21333#21495
            Width = 90
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'DELIVER_NUMBER'
            Footers = <>
            Title.Caption = #36865#36135#21333#21495
            Width = 97
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'ship_DATE'
            Footers = <>
            Title.Caption = #36865#36135#26085#26399
            Width = 118
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'QUANTITY'
            Footers = <>
            Title.Caption = #25509#25910#25968#37327
            Width = 59
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'WAREHOUSE_CODE'
            Footers = <>
            Title.Caption = #23384#36135#24037#21378
            Width = 90
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'LOCATION'
            Footers = <>
            Title.Caption = #23384#36135#20179#24211
            Width = 96
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'EMPLOYEE_NAME'
            Footers = <>
            Title.Caption = #25910#36135#21592#24037
            Width = 72
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'BARCODE_ID'
            Footers = <>
            Title.Caption = #22791#27880
            Width = 110
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object grpRec: TGroupBox
      Left = 1
      Top = 1
      Width = 829
      Height = 168
      Align = alTop
      Caption = #35746#36141#20449#24687
      TabOrder = 1
      object eh71: TDBGridEh
        Left = 2
        Top = 15
        Width = 825
        Height = 151
        Align = alClient
        DataSource = ds71
        DynProps = <>
        ReadOnly = True
        TabOrder = 0
        Columns = <
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'PO_NUMBER'
            Footers = <>
            Title.Caption = #37319#36141#21333#21495
            Width = 104
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'INV_PART_NUMBER'
            Footers = <>
            Title.Caption = #26448#26009#32534#30721
            Width = 133
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'INV_PART_DESCRIPTION'
            Footers = <>
            Title.Caption = #26448#26009#25551#36848
            Width = 328
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'QUAN_ORD'
            Footers = <>
            Title.Caption = #37319#36141#25968#37327
            Width = 92
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'QUAN_RECD'
            Footers = <>
            Title.Caption = #25910#36135#25968#37327
            Width = 75
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object grpVMI: TGroupBox
      Left = 1
      Top = 344
      Width = 829
      Height = 167
      Align = alBottom
      Caption = 'VMI'#20179#25910#36135#20449#24687
      TabOrder = 2
      object ehVMI: TDBGridEh
        Left = 2
        Top = 15
        Width = 825
        Height = 150
        Align = alClient
        DataSource = dsVMI
        DynProps = <>
        ReadOnly = True
        TabOrder = 0
        Columns = <
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'GRN_NUMBER'
            Footers = <>
            Title.Caption = #25910#36135#21333#21495
            Width = 90
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'DELIVER_NUMBER'
            Footers = <>
            Title.Caption = #36865#36135#21333#21495
            Width = 97
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'CREATE_DATE'
            Footers = <>
            Title.Caption = #36865#36135#26085#26399
            Width = 118
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'QUANTITY'
            Footers = <>
            Title.Caption = #25509#25910#25968#37327
            Width = 64
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'WAREHOUSE_CODE'
            Footers = <>
            Title.Caption = #23384#36135#24037#21378
            Width = 90
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'LOCATION'
            Footers = <>
            Title.Caption = #23384#36135#20179#24211
            Width = 96
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'EMPLOYEE_NAME'
            Footers = <>
            Title.Caption = #25910#36135#21592#24037
            Width = 72
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'BARCODE_ID'
            Footers = <>
            Title.Caption = #22791#27880
            Width = 110
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object cds71: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT Data0070.PO_NUMBER, dbo.Data0017.INV_PART_NUMBER,'#13#10'      ' +
      ' Data0017.INV_PART_DESCRIPTION, dbo.Data0071.QUAN_ORD,'#13#10'       D' +
      'ata0071.QUAN_RECD,data0071.rkey,Data0070.PO_TYPE,data0070.STATE_' +
      'INVT_TAX_FLAG'#13#10'FROM   Data0070 INNER JOIN'#13#10'       Data0071 ON db' +
      'o.Data0070.RKEY = Data0071.PO_PTR INNER JOIN'#13#10'       Data0017 ON' +
      ' dbo.Data0071.INVT_PTR = Data0017.RKEY'
    Params = <>
    ReadOnly = True
    AfterScroll = cds71AfterScroll
    Left = 569
    Top = 162
  end
  object ds71: TDataSource
    DataSet = cds71
    Left = 625
    Top = 162
  end
  object cds456: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT dbo.Data0456.GRN_NUMBER, dbo.Data0456.ship_DATE'#13#10'        ' +
      '           , dbo.Data0022.QUANTITY,dbo.Data0015.WAREHOUSE_CODE'#13#10 +
      '                   , dbo.Data0016.LOCATION,dbo.Data0022.BARCODE_' +
      'ID'#13#10'                   , dbo.Data0005.EMPLOYEE_NAME,data0456.DEL' +
      'IVER_NUMBER'#13#10'FROM dbo.Data0456 INNER JOIN'#13#10'      dbo.Data0022 ON' +
      ' dbo.Data0456.RKEY = dbo.Data0022.GRN_PTR INNER JOIN'#13#10'      dbo.' +
      'Data0005 ON dbo.Data0456.CREATE_BY = dbo.Data0005.RKEY INNER JOI' +
      'N'#13#10'      dbo.Data0015 ON dbo.Data0456.warehouse_ptr = dbo.Data00' +
      '15.RKEY LEFT OUTER JOIN'#13#10'      dbo.Data0016 ON dbo.Data0022.LOCA' +
      'TION_PTR = dbo.Data0016.RKEY'
    Params = <>
    ReadOnly = True
    Left = 577
    Top = 338
  end
  object ds456: TDataSource
    DataSet = cds456
    Left = 625
    Top = 338
  end
  object cdsVMI: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT     dbo.DATA0133.GRN_NUMBER, dbo.DATA0133.DELIVER_NUMBER,' +
      ' dbo.DATA0133.CREATE_DATE'#13#10#9#9', dbo.DATA0134.QUANTITY, dbo.Data00' +
      '15.WAREHOUSE_NAME, dbo.Data0016.LOCATION '#13#10'        ,dbo.Data0005' +
      '.EMPLOYEE_NAME, dbo.DATA0134.BARCODE_ID'#13#10'FROM         dbo.DATA01' +
      '33 INNER JOIN'#13#10'                      dbo.DATA0134 ON dbo.DATA013' +
      '3.RKEY = dbo.DATA0134.GRN_PTR INNER JOIN'#13#10'                      ' +
      'dbo.Data0016 ON dbo.DATA0134.LOCATION_PTR = dbo.Data0016.RKEY IN' +
      'NER JOIN'#13#10'                      dbo.Data0015 ON dbo.DATA0133.war' +
      'ehouse_ptr = dbo.Data0015.RKEY INNER JOIN'#13#10'                     ' +
      ' dbo.Data0005 ON dbo.DATA0133.CREATE_BY = dbo.Data0005.RKEY'#13#10'WHE' +
      'RE 1=1 '
    Params = <>
    Left = 576
    Top = 504
  end
  object dsVMI: TDataSource
    DataSet = cdsVMI
    Left = 624
    Top = 504
  end
end
