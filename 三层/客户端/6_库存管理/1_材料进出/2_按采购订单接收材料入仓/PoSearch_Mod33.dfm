inherited frmPoSearch_Mod33: TfrmPoSearch_Mod33
  Caption = #37319#36141#35746#21333#25628#32034
  ClientHeight = 507
  ClientWidth = 1000
  ExplicitWidth = 1016
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 1000
    Height = 507
    ExplicitWidth = 1000
    ExplicitHeight = 507
    inherited pnlDisplayMain: TPanel
      Width = 1000
      Height = 507
      ExplicitWidth = 1000
      ExplicitHeight = 507
      inherited pnlChildMain: TPanel
        Width = 998
        Height = 505
        ExplicitWidth = 998
        ExplicitHeight = 505
        inherited pnlEhMainDisplay: TPanel
          Width = 996
          Height = 474
          ExplicitWidth = 996
          ExplicitHeight = 474
          object Splitter1: TSplitter [0]
            Left = 1
            Top = 277
            Width = 994
            Height = 4
            Cursor = crVSplit
            Align = alBottom
            ExplicitTop = 217
          end
          inherited ehMain: TDBGridEh
            Width = 994
            Height = 276
            OnDblClick = ehMainDblClick
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PO_NUMBER'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #37319#36141#35746#21333#21495#30721
                Width = 100
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PO_DATE'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #35746#21333#26085#26399
                Width = 90
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'abbr_warename'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #24037#21378#31616#31216
                Width = 80
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DEPT_NAME'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #35831#36141#37096#38376
                Width = 100
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ANALYSIS_CODE_1'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #35831#36141#20154#21592
                Width = 65
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CONFIRMATION_NUMBER'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26368#21518#23457#26680#20154
                Width = 65
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CODE'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20379#24212#21830#20195#30721
                Width = 65
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'abbr_suppname'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20379#24212#21830#31616#31216
                Width = 120
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'v_type'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #31867#22411
                Width = 70
              end>
          end
          object Panel1: TPanel
            Left = 1
            Top = 427
            Width = 994
            Height = 46
            Align = alBottom
            TabOrder = 1
            object Button1: TButton
              Left = 336
              Top = 8
              Width = 75
              Height = 28
              Caption = #30830' '#23450
              ModalResult = 1
              TabOrder = 0
              OnClick = ehMainDblClick
            end
            object Button2: TButton
              Left = 424
              Top = 8
              Width = 75
              Height = 28
              Caption = #21462' '#28040
              ModalResult = 2
              TabOrder = 1
              OnClick = Button2Click
            end
          end
          object Panel2: TPanel
            Left = 1
            Top = 281
            Width = 994
            Height = 146
            Align = alBottom
            TabOrder = 2
            object DBGridEh1: TDBGridEh
              Left = 1
              Top = 1
              Width = 992
              Height = 144
              Align = alClient
              DataSource = dsDetail
              DynProps = <>
              TabOrder = 0
              Columns = <
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'INV_NAME'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #26448#26009#21517#31216
                  Width = 100
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'INV_DESCRIPTION'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #26448#26009#35268#26684
                  Width = 145
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'QUAN_ORD'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #35746#36141#25968#37327
                  Width = 65
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = #27424#36135#25968#37327
                  Footers = <>
                  Title.Alignment = taCenter
                  Width = 65
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'tax_price'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #21547#31246#20215
                  Width = 60
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'TAX_2'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #31246#29575
                  Width = 40
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'UNIT_NAME'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #23384#36135#21333#20301
                  Width = 55
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'pr_unitname'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #37319#36141#21333#20301
                  Width = 55
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'REQ_DATE'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #38656#27714#26085#26399
                  Width = 85
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'avl_flag'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #38656#35201'IQC'
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'QUAN_IN_INSP'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #36890#36807#25968#37327
                  Width = 65
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'rohs'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #29615#20445#26631#35782
                  Width = 65
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'extra_req'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #29305#27530#35828#26126
                  Width = 100
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'if_caf'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #32784'CAF'
                  Width = 40
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'DEPT_NAME'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #35831#36141#37096#38376
                  Width = 80
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'EMPLOYEE_NAME'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #35831#36141#20154#21592
                  Width = 60
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'reason'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #35831#36141#21407#22240
                  Width = 90
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
            object DBGridEh2: TDBGridEh
              Left = 1
              Top = 1
              Width = 992
              Height = 144
              Align = alClient
              DataSource = dsDetail2
              DynProps = <>
              TabOrder = 1
              Columns = <
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'goods_name'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #29289#21697#21517#31216
                  Width = 121
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'goods_guige'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #29289#21697#35268#26684
                  Width = 140
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'goods_type'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #29289#21697#31867#21035
                  Width = 60
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'QUAN_ORD'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #37319#36141#25968#37327
                  Width = 65
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = #27424#36135#25968#37327
                  Footers = <>
                  Title.Alignment = taCenter
                  Width = 65
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'unit_price'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #21547#31246#21333#20215
                  Width = 70
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'STATE_TAX'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #31246#29575'%'
                  Width = 60
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'UNIT_NAME'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #37319#36141#21333#20301
                  Width = 60
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'DEL_DATE'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #38656#27714#26085#26399
                  Width = 90
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'rohs'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #29615#20445#26631#35782
                  Width = 60
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'DEPT_NAME'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #35831#36141#37096#38376
                  Width = 90
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'EMPLOYEE_NAME'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #35831#36141#20154#21592
                  Width = 60
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'reason'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #35831#36141#21407#22240
                  Width = 120
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 996
          ExplicitWidth = 996
          inherited btnExit: TBitBtn
            Visible = False
          end
          inherited btnRefresh: TBitBtn
            Visible = False
          end
          inherited btnExportToExcel: TBitBtn
            Visible = False
          end
          inherited btnQry: TBitBtn
            Visible = False
          end
          inherited btnZD: TBitBtn
            Visible = False
          end
          inherited btnAuthDispatch: TBitBtn
            Visible = False
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'SELECT Data0070.RKEY,Data0070.PO_TYPE,Data0070.PO_NUMBER,'#13#10'     ' +
      ' Data0070.CONFIRMATION_NUMBER, Data0070.PO_DATE,'#13#10'      Data0023' +
      '.CODE, Data0023.SUPPLIER_NAME,Data0023.ABBR_NAME AS abbr_suppnam' +
      'e,'#13#10'      Data0015.ABBR_NAME AS abbr_warename,Data0070.WAREHOUSE' +
      '_POINTER,'#13#10'      Data0015.WAREHOUSE_CODE,Data0015.WAREHOUSE_NAME' +
      ','#13#10'      Data0070.CURRENCY_PTR,Data0001.CURR_CODE, Data0001.CURR' +
      '_NAME,'#13#10'      Data0001.BASE_TO_OTHER as EXCHANGE_RATE, Data0034.' +
      'DEPT_NAME,'#13#10'      Data0070.SHIPTO_ADDRESS,Data0070.SUPPLIER_POIN' +
      'TER,Data0070.ANALYSIS_CODE_1,'#13#10'case Data0070.PO_TYPE when '#39'S'#39'  t' +
      'hen '#39#29983#20135#29289#26009#39#13#10'                                           when '#39'M'#39' ' +
      'then '#39#38750#29983#20135#29289#26009#39#13#10'end as v_type, Data0070.PURCHASE_TYPE,Data0023.RKE' +
      'Y as rkey23,Data0015.RKEY as rkey15,Data0001.RKEY as rkey01'#13#10'FRO' +
      'M dbo.Data0070 INNER JOIN'#13#10'      dbo.Data0023 ON '#13#10'      dbo.Dat' +
      'a0070.SUPPLIER_POINTER = dbo.Data0023.RKEY INNER JOIN'#13#10'      dbo' +
      '.Data0015 ON '#13#10'      dbo.Data0070.WAREHOUSE_POINTER = dbo.Data00' +
      '15.RKEY INNER JOIN'#13#10'      dbo.Data0001 ON '#13#10'      dbo.Data0070.C' +
      'URRENCY_PTR = dbo.Data0001.RKEY LEFT OUTER JOIN'#13#10'      dbo.Data0' +
      '034 ON dbo.Data0070.PO_REV_NO = dbo.Data0034.DEPT_CODE'#13#10'WHERE (d' +
      'bo.Data0070.STATUS = 5)  and (STATE_INVT_TAX_FLAG='#39'N'#39') '
    AfterScroll = cdsMainAfterScroll
  end
  inherited pmMain: TPopupMenu
    Left = 176
    Top = 176
  end
  object cdsDetail: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 352
  end
  object dsDetail: TDataSource
    DataSet = cdsDetail
    Left = 280
    Top = 352
  end
  object cdsDetail2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 408
    Top = 352
  end
  object dsDetail2: TDataSource
    DataSet = cdsDetail2
    Left = 488
    Top = 352
  end
  object Lcds: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 536
    Top = 200
  end
end
