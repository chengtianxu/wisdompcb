object frm_subdetail: Tfrm_subdetail
  Left = 269
  Top = 198
  Width = 928
  Height = 480
  Caption = #21333#39033#27719#24635#26126#32454#25968#25454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 912
    Height = 444
    Align = alClient
    AllowedOperations = []
    ColumnDefValues.Title.Alignment = taCenter
    DataSource = ds
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking]
    PopupMenu = PopupMenu1
    SortLocal = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'SALES_ORDER'
        Footers = <>
        Title.Caption = #38144#21806#35746#21333
      end
      item
        EditButtons = <>
        FieldName = 'so_type'
        Footers = <>
        KeyList.Strings = (
          '0'
          '1'
          '2')
        PickList.Strings = (
          #33258#21046
          #22806#21457
          #21322#21046#31243)
        Title.Caption = #35746#21333#31867#22411
      end
      item
        EditButtons = <>
        FieldName = 'CUST_CODE'
        Footers = <>
        Title.Caption = #23458#25143#20195#30721
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_NUMBER'
        Footers = <>
        Title.Caption = #26412#21378#32534#21495
        Width = 96
      end
      item
        EditButtons = <>
        FieldName = 'REFERENCE_NUMBER'
        Footers = <>
        Title.Caption = #21442#32771#21495
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'PRODUCT_NAME'
        Footers = <>
        Title.Caption = #20135#21697#31867#22411
        Width = 96
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_DESC'
        Footers = <>
        Title.Caption = #23458#25143#22411#21495
        Width = 96
      end
      item
        EditButtons = <>
        EditMask = '#0.000'
        EndEllipsis = True
        FieldName = 'pcs_sq'
        Footers = <>
        Title.Caption = #21333#29255#38754#31215
        Width = 76
      end
      item
        EditButtons = <>
        FieldName = 'PO_NUMBER'
        Footers = <>
        Title.Caption = #23458#25143#35746#21333#21495
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'ENT_DATE'
        Footers = <>
        Title.Caption = #19979#21333#26085#26399
      end
      item
        EditButtons = <>
        FieldName = 'PARTS_ORDERED'
        Footers = <>
        Title.Caption = #35746#21333#25968#37327
        Width = 56
      end
      item
        EditButtons = <>
        FieldName = 'ISSUED_QTY'
        Footers = <>
        Title.Caption = #25237#20135#25968#37327
        Width = 56
      end
      item
        EditButtons = <>
        EditMask = '#0.000#'
        FieldName = 'total_sq'
        Footers = <>
        Title.Caption = #35746#21333#38754#31215
      end
      item
        EditButtons = <>
        FieldName = 'sch_date'
        Footers = <>
        Title.Caption = #35745#21010#20132#26399
      end
      item
        EditButtons = <>
        FieldName = 'quantity'
        Footers = <>
        Title.Caption = #20132#26399#20132#36135#25968
      end
      item
        EditButtons = <>
        FieldName = 'complete_date'
        Footers = <>
        Title.Caption = #23436#25104#26102#38388
      end
      item
        EditButtons = <>
        FieldName = 'income'
        Footers = <>
        Title.Caption = #20837#20179#25968#37327
      end
      item
        EditButtons = <>
        FieldName = 'flag'
        Footers = <>
        KeyList.Strings = (
          '0'
          '1'
          '2')
        PickList.Strings = (
          #21542
          #26159
          #26080#27861#21028#26029)
        Title.Caption = #26159#21542#20934#26399
      end
      item
        EditButtons = <>
        FieldName = 'rkey'
        Footers = <>
        Visible = False
      end>
  end
  object ds: TDataSource
    DataSet = qry
    Left = 213
    Top = 68
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = PopupMenu1Popup
    Left = 252
    Top = 35
    object N3: TMenuItem
      Caption = #22797#21046#21253#21547#34920#22836
      Checked = True
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N1: TMenuItem
      Tag = 1
      Caption = #22797#21046#24403#21069#34892
      OnClick = N1Click
    end
    object N2: TMenuItem
      Tag = 2
      Caption = #22797#21046#25152#36873#34892
      OnClick = N1Click
    end
    object N0: TMenuItem
      Tag = 3
      Caption = #23548#20986'EXCEL'
      OnClick = N1Click
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Caption = #22797#21046#35828#26126
      OnClick = N5Click
    end
  end
  object qry: TADOQuery
    Parameters = <
      item
        Name = 'bd'
        Size = -1
        Value = Null
      end
      item
        Name = 'ed'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT    dbo.Data0060.SALES_ORDER,  so_tp AS so_type, dbo.Data0' +
        '010.CUST_CODE, dbo.Data0025.MANU_PART_NUMBER, '
      
        '                      dbo.Data0060.REFERENCE_NUMBER, dbo.Data000' +
        '8.PRODUCT_NAME, dbo.Data0025.MANU_PART_DESC, dbo.Data0025.pcs_sq' +
        ', dbo.Data0097.PO_NUMBER, dbo.Data0060.ENT_DATE, '
      
        '                      dbo.Data0060.PARTS_ORDERED, dbo.Data0060.I' +
        'SSUED_QTY, dbo.Data0025.pcs_sq * dbo.Data0060.PARTS_ORDERED AS t' +
        'otal_sq, d360.sch_date, d360.quantity, '
      
        '                      d360.complete_date, ISNULL(d360.complete_q' +
        'ty, 0) AS income, d360.flag, data0060.rkey'
      'FROM         dbo.Data0060 INNER JOIN'
      
        '                      dbo.Data0010 ON dbo.Data0060.CUSTOMER_PTR ' +
        '= dbo.Data0010.RKEY INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR' +
        ' = dbo.Data0025.RKEY INNER JOIN'
      
        '                      dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR' +
        ' = dbo.Data0008.RKEY INNER JOIN'
      
        '                     dbo.Data0015 ON dbo.Data0060.SHIP_REG_TAX_I' +
        'D = dbo.Data0015.RKEY INNER JOIN'
      
        '                      dbo.Data0097 ON dbo.Data0097.RKEY = dbo.Da' +
        'ta0060.PURCHASE_ORDER_PTR INNER JOIN'
      
        '                      data0005 on data0060.COMM_ASSIGNED_BY_E_P ' +
        '= data0005.rkey inner join '
      
        '                      data0007 on data0008.PR_GRP_POINTER= data0' +
        '007.rkey inner join'
      
        '                      (SELECT     *, CONVERT(int, CASE WHEN comp' +
        'lete_flag IS NULL THEN CASE WHEN sch_date < getdate() THEN 0 ELS' +
        'E 2 '
      
        '                                              END ELSE complete_' +
        'flag END) AS flag'
      '                       FROM          dbo.data0360'
      
        '                       WHERE      (  sch_date BETWEEN :bd AND :e' +
        'd ) ) AS d360 ON d360.so_ptr = dbo.Data0060.RKEY '
      '')
    Left = 214
    Top = 35
  end
end
