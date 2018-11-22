inherited frmQtyEdit_mod354: TfrmQtyEdit_mod354
  Caption = #35746#21333#25968#37327#31561#20462#25913
  ClientHeight = 450
  ClientWidth = 652
  Font.Height = -13
  Font.Name = #23435#20307
  ExplicitWidth = 668
  ExplicitHeight = 489
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 652
    Height = 450
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 652
    ExplicitHeight = 450
    inherited pnl1: TPanel
      Width = 650
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 650
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnSaveAll: TBitBtn
        Left = 589
        Align = alRight
        ExplicitLeft = 589
      end
      inherited btnCheck: TBitBtn
        Left = 559
        Align = alRight
        ExplicitLeft = 559
      end
      inherited btnPrint: TBitBtn
        Left = 619
        Align = alRight
        ExplicitLeft = 619
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 650
      Height = 415
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 650
      ExplicitHeight = 415
      object pnl3: TPanel
        Left = 1
        Top = 1
        Width = 463
        Height = 413
        Align = alClient
        TabOrder = 0
        object lbl1: TLabel
          Left = 7
          Top = 72
          Width = 87
          Height = 13
          Alignment = taRightJustify
          Caption = ' '#35746#21333#25968#37327'PCS:'
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object lbl2: TLabel
          Left = 33
          Top = 128
          Width = 61
          Height = 13
          Alignment = taRightJustify
          Caption = ' '#20215#26684'PCS:'
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object lbl3: TLabel
          Left = 35
          Top = 163
          Width = 59
          Height = 13
          Alignment = taRightJustify
          Caption = #23458#25143#20132#26399':'
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object lbl4: TLabel
          Left = 14
          Top = 41
          Width = 80
          Height = 13
          Alignment = taRightJustify
          Caption = #35746#21333#25968#37327'SET:'
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object lbl5: TLabel
          Left = 103
          Top = 219
          Width = 7
          Height = 13
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object lbl6: TLabel
          Left = 22
          Top = 219
          Width = 72
          Height = 13
          Alignment = taRightJustify
          Caption = #20986#36135#26495#26041#24335':'
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object lbl7: TLabel
          Left = 40
          Top = 100
          Width = 54
          Height = 13
          Alignment = taRightJustify
          Caption = #20215#26684'SET:'
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object lbl8: TLabel
          Left = 28
          Top = 190
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Caption = ' '#35745#21010#20132#26399':'
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object lbl9: TLabel
          Left = 22
          Top = 14
          Width = 72
          Height = 13
          Alignment = taRightJustify
          Caption = #20851#32852#25991#20214#21495':'
        end
        object lbl10: TLabel
          Left = 61
          Top = 245
          Width = 33
          Height = 13
          Caption = #36135#24065':'
        end
        object lbl11: TLabel
          Left = 162
          Top = 244
          Width = 33
          Height = 13
          Caption = #27719#29575':'
        end
        object lbl12: TLabel
          Left = 223
          Top = 192
          Width = 53
          Height = 13
          Caption = #22686#20540#31246'%:'
        end
        object btn_del: TSpeedButton
          Left = 297
          Top = 159
          Width = 57
          Height = 22
          Caption = #21462#28040
          OnClick = btn_delClick
        end
        object dbedt_PARTS_ORDERED: TDBEdit
          Left = 101
          Top = 68
          Width = 102
          Height = 21
          DataField = 'PARTS_ORDERED'
          DataSource = ds60
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnExit = dbedt_PARTS_ORDEREDExit
          OnKeyDown = dbedt_PARTS_ORDEREDKeyDown
          OnKeyPress = dbedt_PARTS_ORDEREDKeyPress
        end
        object dbedt_part_price: TDBEdit
          Left = 101
          Top = 124
          Width = 102
          Height = 21
          DataField = 'part_price'
          DataSource = ds60
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnExit = dbedt_part_priceExit
          OnKeyDown = dbedt_part_priceKeyDown
        end
        object dbedt_ORIG_REQUEST_DATE: TDBEdit
          Left = 101
          Top = 158
          Width = 102
          Height = 21
          DataField = 'ORIG_REQUEST_DATE'
          DataSource = ds60
          Enabled = False
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          OnKeyDown = dbedt_ORIG_REQUEST_DATEKeyDown
        end
        object dbedt_set_ordered: TDBEdit
          Left = 101
          Top = 37
          Width = 102
          Height = 21
          DataField = 'set_ordered'
          DataSource = ds60
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnKeyDown = dbedt_set_orderedKeyDown
          OnKeyPress = dbedt_set_orderedKeyPress
        end
        object dbedt_set_price: TDBEdit
          Left = 100
          Top = 97
          Width = 102
          Height = 21
          DataField = 'set_price'
          DataSource = ds60
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnExit = dbedt_set_priceExit
          OnKeyDown = dbedt_set_priceKeyDown
        end
        object dbedt_ORIG_SCHED_SHIP_DATE: TDBEdit
          Left = 100
          Top = 185
          Width = 102
          Height = 21
          DataField = 'ORIG_SCHED_SHIP_DATE'
          DataSource = ds60
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnExit = dbedt_ORIG_SCHED_SHIP_DATEExit
          OnKeyDown = dbedt_ORIG_SCHED_SHIP_DATEKeyDown
        end
        object edt_file: TEdit
          Left = 101
          Top = 10
          Width = 101
          Height = 21
          MaxLength = 50
          TabOrder = 6
          OnKeyDown = edt_fileKeyDown
        end
        object btn_quote: TBitBtn
          Left = 45
          Top = 315
          Width = 77
          Height = 25
          Caption = #25253#20215#21333#21495
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
            333333777777777F33333330B00000003333337F7777777F3333333000000000
            333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
            333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
            03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
            03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
            3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
            333333333377F7F33333333333330F03333333333337F7F33333333333330B03
            3333333333373733333333333333303333333333333373333333}
          NumGlyphs = 2
          TabOrder = 7
          OnClick = btn_quoteClick
        end
        object edt_TNumber: TEdit
          Left = 207
          Top = 159
          Width = 87
          Height = 21
          Color = cl3DLight
          Enabled = False
          ReadOnly = True
          TabOrder = 8
        end
        object dbedt_CURR_CODE: TDBEdit
          Left = 104
          Top = 239
          Width = 49
          Height = 21
          DataField = 'CURR_CODE'
          DataSource = ds60
          Enabled = False
          TabOrder = 9
        end
        object dbedt_EXCH_RATE: TDBEdit
          Left = 203
          Top = 238
          Width = 84
          Height = 21
          DataField = 'EXCH_RATE'
          DataSource = ds60
          Enabled = False
          TabOrder = 10
        end
        object dbedt_RUSH_CHARGE: TDBEdit
          Left = 287
          Top = 186
          Width = 45
          Height = 21
          DataField = 'RUSH_CHARGE'
          DataSource = ds60
          Enabled = False
          TabOrder = 11
        end
        object dbchk_COMMISION_ON_TOOLING: TDBCheckBox
          Left = 185
          Top = 269
          Width = 79
          Height = 17
          Caption = #36716#21378#35746#21333
          DataField = 'COMMISION_ON_TOOLING'
          DataSource = ds60
          Enabled = False
          ReadOnly = True
          TabOrder = 12
          ValueChecked = 'Y'
          ValueUnchecked = 'N'
        end
        object dbchk_tax_in_price: TDBCheckBox
          Left = 82
          Top = 269
          Width = 97
          Height = 17
          Caption = #20215#26684#21547#31246
          DataField = 'tax_in_price'
          DataSource = ds60
          Enabled = False
          ReadOnly = True
          TabOrder = 13
          ValueChecked = 'Y'
          ValueUnchecked = 'N'
        end
        object btn_BOMQoute: TBitBtn
          Left = 128
          Top = 315
          Width = 75
          Height = 25
          Caption = 'BOM'#21333#21495
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
            333333777777777F33333330B00000003333337F7777777F3333333000000000
            333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
            333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
            03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
            03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
            3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
            333333333377F7F33333333333330F03333333333337F7F33333333333330B03
            3333333333373733333333333333303333333333333373333333}
          NumGlyphs = 2
          TabOrder = 14
          OnClick = btn_BOMQouteClick
        end
      end
      object pnl4: TPanel
        Left = 464
        Top = 1
        Width = 185
        Height = 413
        Align = alRight
        TabOrder = 1
        object eh360: TDBGridEh
          Left = 1
          Top = 1
          Width = 183
          Height = 411
          Align = alClient
          DataSource = ds360
          DynProps = <>
          FooterRowCount = 1
          FooterParams.Color = clRed
          FrozenCols = 1
          PopupMenu = pm1
          SumList.Active = True
          TabOrder = 0
          OnExit = eh360Exit
          OnKeyDown = eh360KeyDown
          Columns = <
            item
              Color = clScrollBar
              DynProps = <>
              EditButtons = <>
              FieldName = 'sch_date'
              Footer.Value = #21512#35745
              Footer.ValueType = fvtStaticText
              Footers = <>
              ReadOnly = True
              Title.Caption = #23436#24037#26085#26399
              Width = 68
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'quantity'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #23436#24037#25968#37327
              Width = 85
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
  end
  object pm1: TPopupMenu
    Left = 432
    Top = 160
    object mniN1: TMenuItem
      Caption = #21024#38500
      OnClick = mniN1Click
    end
  end
  object ds60: TDataSource
    DataSet = cds60
    Left = 296
    Top = 40
  end
  object cds60: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT data0060.*,Data0010.rkey as rkey10,Data0010.CUST_CODE,Dat' +
      'a0010.customer_name,data0010.quote_flag,'#13#10'       Data0012.ship_t' +
      'o_address_1,Data0025.MANU_PART_NUMBER,Data0025.MANU_PART_DESC, '#13 +
      #10'       Data0097.PO_NUMBER,Data0005.EMPLOYEE_NAME  ,data0012.LOC' +
      'ATION,       '#13#10'case data0060.status when  1 then '#39#26377#25928#30340#39' when  2 t' +
      'hen '#39#26242#32531#39' when  5 then '#39#24050#21462#28040#39' when  6 then '#39#26410#25552#20132#39' end as v_status,'#13 +
      #10' Data0025.set_qty, Data0097.PO_DATE,Data0025.ttype,'#13#10'case data0' +
      '060.so_tp when 0 then '#39#33258#21046#39' when 1 then '#39#22806#21457#39' when 2 then '#39#21322#21046#31243#39' en' +
      'd sotp,'#13#10' Data0001.CURR_CODE,Data0025.ONHOLD_SALES_FLAG '#13#10'FROM  ' +
      '       dbo.Data0005 INNER JOIN'#13#10'                      dbo.Data00' +
      '97 INNER JOIN'#13#10'                      dbo.Data0060 INNER JOIN'#13#10'  ' +
      '                    dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR =' +
      ' dbo.Data0025.RKEY INNER JOIN'#13#10'                      dbo.Data001' +
      '0 ON dbo.Data0060.CUSTOMER_PTR = dbo.Data0010.RKEY ON dbo.Data00' +
      '97.RKEY = dbo.Data0060.PURCHASE_ORDER_PTR ON '#13#10'                 ' +
      '     dbo.Data0005.RKEY = dbo.Data0060.ENTERED_BY_EMPL_PTR INNER ' +
      'JOIN'#13#10'                      dbo.Data0001 ON dbo.Data0060.CURRENC' +
      'Y_PTR = dbo.Data0001.RKEY INNER JOIN'#13#10'                      dbo.' +
      'Data0012 ON dbo.Data0060.CUST_SHIP_ADDR_PTR = dbo.Data0012.RKEY'#13 +
      #10'WHERE (Data0060.STATUS not in(3,4))'
    Params = <>
    Left = 336
    Top = 40
  end
  object ds360: TDataSource
    DataSet = cds360
    Left = 456
    Top = 256
  end
  object cds360: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from Data0360  where 1=1'
    Params = <>
    Left = 496
    Top = 256
  end
  object cdstemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 72
  end
  object cdstemp2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 432
    Top = 56
  end
end
