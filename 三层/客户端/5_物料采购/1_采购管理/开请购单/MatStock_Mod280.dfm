inherited frmMatStock_Mod280: TfrmMatStock_Mod280
  Caption = #24211#23384#26597#35810
  ClientHeight = 375
  ClientWidth = 744
  ExplicitWidth = 752
  ExplicitHeight = 402
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 344
    Width = 744
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Button1: TButton
      Left = 323
      Top = 5
      Width = 75
      Height = 25
      Caption = #20851#38381
      ModalResult = 2
      TabOrder = 0
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 744
    Height = 344
    Align = alClient
    DataSource = dsStock
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Title.Caption = #26448#26009#32534#30721
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inv_name'
        Title.Caption = #26448#26009#21517#31216
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Title.Caption = #26448#26009#35268#26684
        Width = 152
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Title.Caption = #20379#24212#21830
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GROUP_NAME'
        Title.Caption = #26448#26009#31867#21035
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quan_total'
        Title.Caption = #24211#23384#25968#37327
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCATION'
        Title.Caption = #20179#24211
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'type'
        Title.Caption = #24211#23384#31867#22411
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_CODE'
        Title.Caption = #21333#20301
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BARCODE_ID'
        Title.Caption = #22791#27880
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'reason'
        Title.Caption = #35831#36141#21407#22240
        Width = 104
        Visible = True
      end>
  end
  object dsStock: TDataSource
    DataSet = cdsStock
    Left = 512
    Top = 176
  end
  object cdsStock: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT  dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo' +
      '.Data0017.INV_DESCRIPTION, dbo.Data0016.LOCATION,'#13#10'        dbo.D' +
      'ata0017.REPORT_VALUE2,dbo.Data0017.CONSIGN_ONHAND_QTY,  '#13#10'      ' +
      '  dbo.Data0496.GROUP_NAME, SUM(dbo.Data0022.QUAN_ON_HAND-data002' +
      '2.QUAN_TO_BE_STOCKED) AS quan_total,'#13#10'        dbo.Data0002.UNIT_' +
      'CODE,dbo.Data0071.reason, dbo.Data0022.BARCODE_ID, dbo.Data0023.' +
      'ABBR_NAME,'#39#36890#29992#24211#23384#39' AS type'#13#10'FROM         dbo.Data0022 INNER JOIN'#13#10 +
      '                      dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR' +
      ' = dbo.Data0017.RKEY INNER JOIN'#13#10'                      dbo.Data0' +
      '496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY INNER JOIN'#13#10'  ' +
      '                    dbo.Data0002 ON dbo.Data0022.LOCATION_PTR_FR' +
      'OM = dbo.Data0002.RKEY INNER JOIN'#13#10'                      dbo.Dat' +
      'a0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER JOIN'#13#10'  ' +
      '                    dbo.Data0015 ON dbo.Data0456.warehouse_ptr =' +
      ' dbo.Data0015.RKEY INNER JOIN'#13#10'                      dbo.Data002' +
      '3 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY INNER JOIN'#13#10'     ' +
      '                 dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo' +
      '.Data0016.RKEY left join'#13#10'                      dbo.Data0071 ON ' +
      'dbo.Data0022.SOURCE_PTR = dbo.Data0071.RKEY'#13#10'WHERE     (dbo.Data' +
      '0022.QUAN_ON_HAND > 0) AND (Data0022.INVENTORY_PTR=:INVT_PTR)'#13#10'G' +
      'ROUP BY dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo' +
      '.Data0017.INV_DESCRIPTION, dbo.Data0496.GROUP_NAME, dbo.Data0002' +
      '.UNIT_CODE, '#13#10'                      dbo.Data0017.REPORT_VALUE2,d' +
      'bo.Data0017.CONSIGN_ONHAND_QTY,dbo.Data0071.reason, dbo.Data0022' +
      '.BARCODE_ID,dbo.Data0023.ABBR_NAME, dbo.Data0016.LOCATION'#13#10#13#10'uni' +
      'on all'#13#10#13#10'SELECT     dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.' +
      'INV_NAME, dbo.Data0017.INV_DESCRIPTION, dbo.Data0016.LOCATION, '#13 +
      #10'                 dbo.Data0017.REPORT_VALUE2,dbo.Data0017.CONSIG' +
      'N_ONHAND_QTY,'#13#10'                      dbo.Data0496.GROUP_NAME, SU' +
      'M(dbo.DATA0134.QUAN_ON_HAND) AS quan_total, '#13#10'           dbo.Dat' +
      'a0002.UNIT_CODE,dbo.Data0071.reason, dbo.Data0134.BARCODE_ID, db' +
      'o.Data0023.ABBR_NAME,'#39'VMI'#24211#23384#39' AS type'#13#10'FROM         dbo.Data0017 ' +
      'INNER JOIN'#13#10'                      dbo.Data0496 ON dbo.Data0017.G' +
      'ROUP_PTR = dbo.Data0496.RKEY INNER JOIN'#13#10'                      d' +
      'bo.DATA0134 ON dbo.Data0017.RKEY = dbo.DATA0134.INVENTORY_PTR IN' +
      'NER JOIN'#13#10'                      dbo.Data0002 ON dbo.DATA0134.UNI' +
      'T_PTR = dbo.Data0002.RKEY INNER JOIN'#13#10'                      dbo.' +
      'DATA0133 INNER JOIN'#13#10'                      dbo.Data0015 ON dbo.D' +
      'ATA0133.warehouse_ptr = dbo.Data0015.RKEY INNER JOIN'#13#10'          ' +
      '            dbo.Data0023 ON dbo.DATA0133.SUPP_PTR = dbo.Data0023' +
      '.RKEY ON dbo.DATA0134.GRN_PTR = dbo.DATA0133.RKEY INNER JOIN'#13#10'  ' +
      '                    dbo.Data0016 ON dbo.DATA0134.LOCATION_PTR = ' +
      'dbo.Data0016.RKEY LEFT JOIN'#13#10'                      dbo.Data0071 ' +
      'ON dbo.DATA0134.SOURCE_PTR = dbo.Data0071.RKEY'#13#10'WHERE   (data013' +
      '4.quan_on_hand>0)  and  (dbo.DATA0134.INVENTORY_ptr = :rkey17)'#13#10 +
      'GROUP BY dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, db' +
      'o.Data0017.INV_DESCRIPTION, dbo.Data0496.GROUP_NAME, dbo.Data000' +
      '2.UNIT_CODE, '#13#10'                     dbo.Data0017.REPORT_VALUE2,d' +
      'bo.Data0017.CONSIGN_ONHAND_QTY, dbo.Data0071.reason, dbo.Data013' +
      '4.BARCODE_ID,dbo.Data0023.ABBR_NAME, dbo.Data0016.LOCATION'#13#10
    Params = <
      item
        DataType = ftUnknown
        Name = 'INVT_PTR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rkey17'
        ParamType = ptUnknown
      end>
    Left = 344
    Top = 176
  end
end
