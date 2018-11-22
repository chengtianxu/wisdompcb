inherited frmQry250: TfrmQry250
  Left = 113
  Top = 151
  Caption = #35746#21333#20215#26684#20998#26512'_New'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 50
  end
  inherited Panel2: TPanel
    Top = 50
    Height = 453
    inherited Splitter1: TSplitter
      Left = 281
      Height = 449
    end
    inherited Panel3: TPanel
      Width = 279
      Height = 449
      inherited Panel4: TPanel
        Top = 395
        Width = 279
      end
      inherited RzPageControl1: TRzPageControl
        Width = 279
        Height = 395
        FixedDimension = 19
        inherited TabSheet1: TRzTabSheet
          inherited DBGrid1: TDBGridEh
            Width = 275
            Height = 372
            Columns = <
              item
                EditButtons = <>
                FieldName = 'nType'
                Footers = <>
                PickList.Strings = (
                  'AND'
                  'OR')
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #20851#31995
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'FieldCaption'
                Footers = <>
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #26597#23547#26465#20214
                Width = 58
              end
              item
                DropDownRows = 8
                DropDownShowTitles = True
                EditButtons = <>
                FieldName = 'nOperator'
                Footers = <>
                KeyList.Strings = (
                  '='
                  '<>'
                  '<'
                  '<='
                  '>'
                  '>='
                  'LIKE'
                  'BETWEEN')
                PickList.Strings = (
                  #31561#20110
                  #19981#31561#20110
                  #23567#20110
                  #23567#20110#31561#20110
                  #22823#20110
                  #22823#20110#31561#20110
                  #30456#20284
                  #33539#22260#20043#20869)
                Title.Alignment = taCenter
                Title.Caption = #26465#20214#22240#23376
                Width = 57
              end
              item
                EditButtons = <>
                FieldName = 'InputValue'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26597#35810#20540
                Width = 121
              end>
          end
        end
      end
    end
    inherited Panel5: TPanel
      Left = 285
      Width = 497
      Height = 449
      inherited DBGrid3: TDBGridEh
        Width = 495
        Height = 428
        FooterColor = clMoneyGreen
        FooterRowCount = 1
        FrozenCols = 3
        OptionsEh = [dghFixed3D, dghFooter3D, dghHighlightFocus, dghClearSelection]
        ParentFont = False
        SumList.Active = True
        Columns = <
          item
            EditButtons = <>
            FieldName = 'PROD_CODE'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20135#21697#31867#21035
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'CUST_CODE'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #23458#25143#32534#21495
            Width = 59
          end
          item
            EditButtons = <>
            FieldName = 'CUSTOMER_PART_NUMBER'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26412#21378#32534#21495
            Width = 69
          end
          item
            EditButtons = <>
            FieldName = 'PART_PRICE'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #21333#20215
            Width = 55
          end
          item
            EditButtons = <>
            FieldName = 'TOTAL_COST'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20986#21378#20215
            Width = 57
          end
          item
            DisplayFormat = '00.00'#39'%'#39
            EditButtons = <>
            FieldName = 'MARKUP_RATE'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #25240#29575'/'#27611#21033#29575
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'TTYPE'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #25253#20215#27169#24335
            Width = 51
          end
          item
            EditButtons = <>
            FieldName = 'PARTS_ORDERED'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #35746#36135#25968#37327
            Width = 57
          end
          item
            EditButtons = <>
            FieldName = 'DATE_SHIPPED'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20986#36135#26085#26399
            Width = 66
          end
          item
            EditButtons = <>
            FieldName = 'quan_shipped'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20132#36135#25968#37327
            Width = 55
          end
          item
            EditButtons = <>
            FieldName = 'TotalArea'
            Footer.FieldName = 'TotalArea'
            Footer.ValueType = fvtSum
            Footer.WordWrap = True
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20132#36135#38754#31215
            Width = 54
          end
          item
            EditButtons = <>
            FieldName = 'ShippedAmt'
            Footer.DisplayFormat = '###,###,###,##0.##'
            Footer.FieldName = 'ShippedAmt'
            Footer.ValueType = fvtSum
            Footer.WordWrap = True
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20132#36135#37329#39069
            Width = 59
          end
          item
            EditButtons = <>
            FieldName = 'CURR_CODE'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #36135#24065
            Width = 44
          end
          item
            EditButtons = <>
            FieldName = 'REP_CODE'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #19994#21153#20195#34920
            Width = 59
          end
          item
            EditButtons = <>
            FieldName = 'supervisor'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #19994#21153#20027#31649
            Width = 59
          end
          item
            EditButtons = <>
            FieldName = 'CUSTOMER_PART_DESC'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #23458#25143#22411#21495
            Width = 75
          end>
      end
      inherited StatusBar1: TStatusBar
        Top = 429
        Width = 495
        Panels = <
          item
            Text = #35760#24405#24635#25968
            Width = 55
          end
          item
            Width = 50
          end
          item
            Text = #21152#26435#25240#29575'/'#27611#21033#29575
            Width = 100
          end
          item
            Width = 50
          end
          item
            Text = #20135#37327#21512#35745
            Width = 60
          end
          item
            Width = 80
          end
          item
            Text = #20135#20540#21512#35745
            Width = 60
          end
          item
            Width = 100
          end
          item
            Width = 100
          end>
      end
    end
  end
  inherited cdsQueryData: TClientDataSet
    Aggregates = <
      item
        Visible = False
      end>
  end
  inherited cdsItems: TClientDataSet
    inherited cdsItemsFieldName: TStringField
      Size = 50
    end
  end
  inherited ImageList1: TImageList
    Left = 224
    Top = 104
  end
  inherited PopupMenu1: TPopupMenu
    Left = 538
  end
  inherited PopupMenu2: TPopupMenu
    Left = 594
  end
end
