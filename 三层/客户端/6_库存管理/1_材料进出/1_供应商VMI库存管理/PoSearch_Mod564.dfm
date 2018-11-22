inherited frmPoSearch_Mod564: TfrmPoSearch_Mod564
  Caption = #37319#36141'PO'#25628#32034
  ClientHeight = 480
  ClientWidth = 1051
  ExplicitWidth = 1059
  ExplicitHeight = 507
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 1051
    Height = 480
    ExplicitWidth = 1051
    ExplicitHeight = 480
    inherited pnlDisplayMain: TPanel
      Width = 1051
      Height = 480
      ExplicitWidth = 1051
      ExplicitHeight = 480
      inherited pnlChildMain: TPanel
        Width = 1049
        Height = 478
        ExplicitWidth = 1049
        ExplicitHeight = 478
        inherited pnlEhMainDisplay: TPanel
          Width = 1047
          Height = 447
          ExplicitWidth = 1047
          ExplicitHeight = 447
          object Splitter1: TSplitter [0]
            Left = 1
            Top = 248
            Width = 1045
            Height = 4
            Cursor = crVSplit
            Align = alBottom
            ExplicitTop = 392
            ExplicitWidth = 802
          end
          inherited ehMain: TDBGridEh
            Width = 1045
            Height = 247
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
                Footers = <>
                Visible = False
              end
              item
                DynProps = <>
                EditButtons = <>
                Footers = <>
                Visible = False
              end>
          end
          object DBGridEh1: TDBGridEh
            Left = 1
            Top = 252
            Width = 1045
            Height = 148
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
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
          object Panel1: TPanel
            Left = 1
            Top = 400
            Width = 1045
            Height = 46
            Align = alBottom
            TabOrder = 2
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
        end
        inherited pnlTopOperator: TPanel
          Width = 1047
          ExplicitWidth = 1047
          inherited lblFilter: TLabel
            Left = 399
            Top = 6
            Width = 60
            Caption = #37319#36141#35746#21333#21495
            ExplicitLeft = 399
            ExplicitTop = 6
            ExplicitWidth = 60
          end
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
          inherited edtFliter: TEdit
            Left = 468
            Top = 2
            ExplicitLeft = 468
            ExplicitTop = 2
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
      '_NAME,'#13#10'      Data0070.EXCHANGE_RATE, Data0034.DEPT_NAME,'#13#10'     ' +
      ' Data0070.SHIPTO_ADDRESS,Data0070.SUPPLIER_POINTER,'#13#10'      Data0' +
      '023.RKEY as rkey23,Data0015.RKEY as rkey15,Data0001.RKEY as rkey' +
      '01'#13#10#13#10'FROM dbo.Data0070 INNER JOIN'#13#10'      dbo.Data0023 ON '#13#10'    ' +
      '  dbo.Data0070.SUPPLIER_POINTER = dbo.Data0023.RKEY INNER JOIN'#13#10 +
      '      dbo.Data0015 ON '#13#10'      dbo.Data0070.WAREHOUSE_POINTER = d' +
      'bo.Data0015.RKEY INNER JOIN'#13#10'      dbo.Data0001 ON '#13#10'      dbo.D' +
      'ata0070.CURRENCY_PTR = dbo.Data0001.RKEY LEFT OUTER JOIN'#13#10'      ' +
      'dbo.Data0034 ON dbo.Data0070.PO_REV_NO = dbo.Data0034.DEPT_CODE'#13 +
      #10'WHERE (dbo.Data0070.STATUS = 5)  and  Data0070.PO_TYPE='#39'S'#39'  and' +
      ' '#13#10'  Data0070.STATE_INVT_TAX_FLAG='#39'Y'#39#13#10#13#10#13#10
    AfterScroll = cdsMainAfterScroll
  end
  inherited pmMain: TPopupMenu
    Left = 160
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
end
