inherited frmHistoryPrice: TfrmHistoryPrice
  Caption = #21382#21490#35746#21333#20215#26684#25628#32034
  ClientHeight = 420
  ClientWidth = 741
  ExplicitWidth = 749
  ExplicitHeight = 447
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 741
    Height = 379
    Align = alClient
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 739
      Height = 377
      Align = alClient
      DataSource = ds60_Price
      DynProps = <>
      TabOrder = 0
      Columns = <
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'sales_order'
          Footers = <>
          Title.Caption = #38144#21806#35746#21333
          Width = 100
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'ent_date'
          Footers = <>
          Title.Caption = #36755#20837#26085#26399
          Width = 91
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'po_number'
          Footers = <>
          Title.Caption = #23458#25143#35746#21333#21495
          Width = 200
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'parts_ordered'
          Footers = <>
          Title.Caption = #35746#36141#25968#37327
          Width = 60
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'part_price'
          Footers = <>
          Title.Caption = #20215#26684
          Width = 70
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'sotp'
          Footers = <>
          Title.Caption = #21152#24037#24418#24335
          Width = 70
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'code'
          Footers = <>
          Title.Caption = #20379#24212#21830#20195#30721
          Width = 75
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 379
    Width = 741
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 328
      Top = 6
      Width = 71
      Height = 29
      Caption = #20851' '#38381
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object ds60_Price: TDataSource
    DataSet = cds60_Price
    Left = 256
    Top = 120
  end
  object cds60_Price: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select sales_order,ent_date,po_number,parts_ordered,part_price,'#13 +
      #10'case data0060.so_tp when 0 then '#39#33258#21046#39' when 1 then '#39#22806#21457#39' when 2 th' +
      'en '#39#21322#21046#31243#39' end as sotp,data0023.code'#13#10'from data0060 inner join dat' +
      'a0097 on data0060.purchase_order_ptr=data0097.rkey '#13#10'left outer ' +
      'join data0023 on Data0060.supplier_ptr = data0023.RKEY'#13#10'where da' +
      'ta0060.part_price<>0'
    Params = <>
    Left = 336
    Top = 120
  end
end
