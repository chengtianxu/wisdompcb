inherited frm_VMIpiciMX: Tfrm_VMIpiciMX
  Caption = 'VMI'#25209#27425#26126#32454
  ClientHeight = 472
  ClientWidth = 1097
  ExplicitWidth = 1113
  ExplicitHeight = 511
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 1097
    Height = 472
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 1097
    ExplicitHeight = 472
    inherited pnl1: TPanel
      Width = 1095
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 1095
      object Label1: TLabel [0]
        Left = 272
        Top = 10
        Width = 66
        Height = 13
        Caption = 'VMI'#20837#24211#21333#21495
      end
      inherited btnSave: TBitBtn
        Caption = #30830#23450
        Visible = False
      end
      inherited btnClose: TBitBtn
        Visible = False
      end
      object Edit1: TEdit
        Left = 340
        Top = 6
        Width = 121
        Height = 21
        TabOrder = 5
        OnChange = Edit1Change
      end
    end
    inherited pnl2: TPanel
      Width = 1095
      Height = 437
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 1095
      ExplicitHeight = 437
      object Splitter1: TSplitter
        Left = 1
        Top = 259
        Width = 1093
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        ExplicitTop = 185
        ExplicitWidth = 225
      end
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 1093
        Height = 258
        Align = alClient
        TabOrder = 0
        object ehMain: TDBGridEh
          Left = 1
          Top = 1
          Width = 1091
          Height = 256
          Align = alClient
          DataSource = dsMain
          DynProps = <>
          ReadOnly = True
          TabOrder = 0
          OnDblClick = Button1Click
          OnTitleClick = ehMainTitleClick
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'GRN_NUMBER'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = 'VMI'#20837#24211#21333#21495
              Width = 80
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'stype'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #20837#24211#31867#22411
              Width = 60
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'PO_NUMBER'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #37319#36141#35746#21333#21495
              Width = 120
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'deliver_number'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #36865#36135#21333#21495
              Width = 120
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'SUPPLIER_NAME'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #20379#24212#21830
              Width = 120
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'WAREHOUSE_NAME'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #24037#21378
              Width = 100
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'CURR_NAME'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #36135#24065
              Width = 45
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'EXCH_RATE'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #27719#29575
              Width = 60
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'REF_NUMBER'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #22791#27880
              Width = 120
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'CREATE_DATE'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #21019#24314#26085#26399
              Width = 120
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object Panel2: TPanel
        Left = 1
        Top = 262
        Width = 1093
        Height = 133
        Align = alBottom
        TabOrder = 1
        object DBGridEh1: TDBGridEh
          Left = 1
          Top = 1
          Width = 1091
          Height = 131
          Align = alClient
          DataSource = dsDetail
          DynProps = <>
          TabOrder = 0
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'inv_part_number'
              Footers = <>
              Title.Caption = #26448#26009#32534#30721
              Width = 150
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'inv_name'
              Footers = <>
              Title.Caption = #26448#26009#21517#31216
              Width = 200
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'INV_DESCRIPTION'
              Footers = <>
              Title.Caption = #29289#26009#35268#26684
              Width = 220
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'QUANTITY'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #24050#25509#25910#25968#37327
              Width = 70
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'VMI_ON_HAND'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #21487#29992#25968#37327
              Width = 60
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'location'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #20179#24211
              Width = 68
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'UNIT_NAME'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #21333#20301
              Width = 40
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'rohs'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #29615#20445#26631#24535
              Width = 45
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'price'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #20215#26684#19981#21547#31246
              Width = 65
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'TAX_PRICE'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #20215#26684#21547#31246
              Width = 60
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'TAX_2'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #31246#29575
              Width = 51
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'MANU_DATE'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #21046#36896#26085#26399
              Width = 95
            end
            item
              DisplayFormat = 'yyyy-MM-dd'
              DynProps = <>
              EditButtons = <>
              FieldName = 'EXPIRE_DATE'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #26377#25928#26399
              Width = 90
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'SUPPLIER2'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #29289#26009#25209#27425
              Width = 75
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'BARCODE_ID'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #22791#27880
              Width = 150
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object Panel3: TPanel
        Left = 1
        Top = 395
        Width = 1093
        Height = 41
        Align = alBottom
        TabOrder = 2
        object Button1: TButton
          Left = 440
          Top = 6
          Width = 75
          Height = 28
          Caption = #30830' '#23450
          ModalResult = 1
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
      'SELECT Data0133.RKEY,Data0133.GRN_NUMBER,Data0070.PO_NUMBER,Data' +
      '0070.SECOND_WHSE_PTR,'#13#10'      Data0070.CONFIRMATION_NUMBER, Data0' +
      '070.PO_DATE,data0133.deliver_number,'#13#10'      Data0023.CODE, Data0' +
      '023.SUPPLIER_NAME,Data0023.ABBR_NAME AS abbr_suppname,'#13#10'      Da' +
      'ta0015.ABBR_NAME AS abbr_warename,Data0133.WAREHOUSE_PTR,data013' +
      '3.supp_ptr,'#13#10'      Data0015.WAREHOUSE_CODE,Data0015.WAREHOUSE_NA' +
      'ME,data0133.po_ptr,'#13#10'      Data0133.CURRENCY_PTR,Data0001.CURR_C' +
      'ODE, Data0001.CURR_NAME,'#13#10'      Data0133.EXCH_RATE, Data0133.REF' +
      '_NUMBER,DATA0133.SHIP_BY,'#13#10'      DATA0133.SHIP_DATE,DATA0133.CRE' +
      'ATE_DATE,DATA0133.TTYPE,'#13#10'      CASE'#13#10'      WHEN DATA0133.TTYPE=' +
      '3 THEN '#39#30452#25509#20837#24211#39#13#10'      WHEN DATA0133.TTYPE=1 THEN '#39#32534#30721#20837#24211#39' end as st' +
      'ype'#13#10'FROM dbo.Data0133 INNER JOIN'#13#10'      dbo.Data0023 ON '#13#10'     ' +
      ' dbo.Data0133.SUPP_PTR = dbo.Data0023.RKEY INNER JOIN'#13#10'      dbo' +
      '.Data0015 ON '#13#10'      dbo.Data0133.WAREHOUSE_PTR = dbo.Data0015.R' +
      'KEY INNER JOIN'#13#10'      dbo.Data0001 ON '#13#10'      dbo.Data0133.CURRE' +
      'NCY_PTR = dbo.Data0001.RKEY LEFT OUTER JOIN'#13#10'      dbo.Data0070 ' +
      'ON dbo.Data0133.PO_PTR = dbo.Data0070.RKEY'#13#10'where data0133.rkey ' +
      'in(select distinct data0133.rkey from data0133 inner join data01' +
      '34 on data0133.rkey=data0134.grn_ptr where data0134.quan_on_hand' +
      '>0)'#13#10#13#10'order by RKEY desc'
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    Params = <>
    AfterScroll = cdsMainAfterScroll
    Left = 392
    Top = 200
  end
  object dsMain: TDataSource
    DataSet = cdsMain
    Left = 448
    Top = 200
  end
  object cdsDetail: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 376
    Top = 360
  end
  object dsDetail: TDataSource
    DataSet = cdsDetail
    Left = 432
    Top = 360
  end
end
