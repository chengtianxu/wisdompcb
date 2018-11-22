inherited frmCLoseOrders: TfrmCLoseOrders
  Caption = #37319#36141#35746#21333#25628#32034
  ClientHeight = 477
  ClientWidth = 1119
  ExplicitWidth = 1127
  ExplicitHeight = 504
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 1119
    Height = 477
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 894
    ExplicitHeight = 467
    inherited pnl1: TPanel
      Width = 1117
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 892
      object Label1: TLabel [0]
        Left = 248
        Top = 9
        Width = 72
        Height = 13
        Caption = #37319#36141#35746#21333#21495#30721
      end
      inherited btnSave: TBitBtn
        Hint = #32467#26463#25910#36135#24182#36864#20986
        Caption = #32467#26463#25910#36135
        Glyph.Data = {00000000}
        Visible = False
      end
      inherited btnClose: TBitBtn
        Visible = False
      end
      object Edit1: TEdit
        Left = 323
        Top = 5
        Width = 147
        Height = 21
        TabOrder = 5
        OnChange = Edit1Change
      end
    end
    inherited pnl2: TPanel
      Width = 1117
      Height = 442
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 892
      ExplicitHeight = 432
      object Splitter1: TSplitter
        Left = 1
        Top = 157
        Width = 1115
        Height = 4
        Cursor = crVSplit
        Align = alBottom
        ExplicitTop = 187
        ExplicitWidth = 890
      end
      object ehMain: TDBGridEh
        Left = 1
        Top = 1
        Width = 1115
        Height = 156
        Align = alClient
        DataSource = dsMain
        DynProps = <>
        ReadOnly = True
        TabOrder = 0
        OnDblClick = Button1Click
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
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object DBGridEh1: TDBGridEh
        Left = 1
        Top = 161
        Width = 1115
        Height = 239
        Align = alBottom
        DataSource = dsDetail
        DynProps = <>
        TabOrder = 1
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
      object Panel3: TPanel
        Left = 1
        Top = 400
        Width = 1115
        Height = 41
        Align = alBottom
        TabOrder = 2
        ExplicitLeft = 2
        ExplicitTop = 417
        object Button1: TButton
          Left = 440
          Top = 6
          Width = 75
          Height = 28
          Hint = #20851#38381#35746#21333
          Caption = #32467#26463#25910#36135
          TabOrder = 0
          OnClick = Button1Click
        end
        object Button2: TButton
          Left = 544
          Top = 6
          Width = 75
          Height = 28
          Caption = #21462' '#28040
          ModalResult = 2
          TabOrder = 1
          OnClick = Button2Click
        end
      end
    end
  end
  object cdsMain: TClientDataSet
    Aggregates = <>
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
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    Params = <>
    AfterScroll = cdsMainAfterScroll
    Left = 392
    Top = 152
  end
  object dsMain: TDataSource
    DataSet = cdsMain
    Left = 448
    Top = 152
  end
  object cdsDetail: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 304
  end
  object dsDetail: TDataSource
    DataSet = cdsDetail
    Left = 280
    Top = 304
  end
end
