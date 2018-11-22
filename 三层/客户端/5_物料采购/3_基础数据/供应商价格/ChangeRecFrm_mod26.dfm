inherited frmChangeRec_mod26: TfrmChangeRec_mod26
  Caption = 'frmChangeRec_mod26'
  ClientHeight = 535
  ClientWidth = 1093
  ExplicitWidth = 1109
  ExplicitHeight = 574
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl1: TPanel
    Width = 1093
    ExplicitWidth = 1093
    object pnl4: TPanel [0]
      Left = 744
      Top = 1
      Width = 348
      Height = 39
      Align = alRight
      TabOrder = 3
      object lbl1: TLabel
        Left = 14
        Top = 17
        Width = 60
        Height = 13
        Alignment = taRightJustify
        Caption = #26356#25913#26085#26399#20174
      end
      object lbl2: TLabel
        Left = 187
        Top = 17
        Width = 17
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #21040
      end
      object dtpk1: TDateTimePicker
        Left = 80
        Top = 13
        Width = 105
        Height = 21
        Date = 38595.000000000000000000
        Time = 38595.000000000000000000
        TabOrder = 0
        OnExit = dtpk1Exit
      end
      object dtpk2: TDateTimePicker
        Left = 208
        Top = 13
        Width = 105
        Height = 21
        Date = 38595.000000000000000000
        Time = 38595.000000000000000000
        TabOrder = 1
        OnExit = dtpk2Exit
      end
    end
    object btnExit: TBitBtn
      Left = 1
      Top = 1
      Width = 65
      Height = 39
      Hint = #36864#20986#31995#32479
      Align = alLeft
      Caption = #36864#20986
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
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnExitClick
    end
    object btnExportToExcel: TBitBtn
      Left = 66
      Top = 1
      Width = 65
      Height = 39
      Hint = #23548#20986#25968#25454#21040'Excel'
      Align = alLeft
      Caption = #23548#20986
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
        EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
        DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
        70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnExportToExcelClick
    end
  end
  inherited pnl2: TPanel
    Top = 41
    Width = 1093
    Align = alTop
    ExplicitTop = 41
    ExplicitWidth = 1093
    inherited btnOK: TButton
      Left = 1017
      Top = 1
      Height = 39
      Align = alRight
      Visible = False
      ExplicitLeft = 1017
      ExplicitTop = 1
      ExplicitHeight = 39
    end
    inherited btnCancelPick: TButton
      Left = 942
      Top = 1
      Height = 39
      Align = alRight
      Visible = False
      ExplicitLeft = 942
      ExplicitTop = 1
      ExplicitHeight = 39
    end
    object btn_detail: TButton
      Left = 1
      Top = 1
      Width = 175
      Height = 39
      Align = alLeft
      Caption = #20215#26684#21464#21160#26126#32454
      Style = bsCommandLink
      TabOrder = 2
      OnClick = btn_detailClick
    end
    object btn_AVGChange: TButton
      Left = 176
      Top = 1
      Width = 175
      Height = 39
      Align = alLeft
      Caption = #24179#22343#20215#26684#21464#21160
      Style = bsCommandLink
      TabOrder = 3
      OnClick = btn_AVGChangeClick
    end
  end
  inherited pnl3: TPanel
    Top = 82
    Width = 1093
    Height = 453
    ExplicitTop = 82
    ExplicitWidth = 1093
    ExplicitHeight = 453
    inherited eh1: TDBGridEh
      Width = 1091
      Height = 451
    end
    object eh_Avg: TDBGridEh
      Left = 1
      Top = 1
      Width = 1091
      Height = 451
      Align = alClient
      DataSource = ds_AVGP
      DynProps = <>
      ReadOnly = True
      TabOrder = 1
      OnKeyDown = eh_AvgKeyDown
      Columns = <
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'GROUP_NAME'
          Footers = <>
          Title.Caption = #26448#26009#31867#22411
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'GROUP_DESC'
          Footers = <>
          Title.Caption = #31867#22411#21517#31216
          Width = 150
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'old_price'
          Footers = <>
          Title.Caption = #21407#24179#22343#20215#26684
          Width = 68
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'new_price'
          Footers = <>
          Title.Caption = #26032#24179#22343#20215#26684
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'change_price'
          Footers = <>
          Title.Caption = #24179#22343#21464#21160#37329#39069
          Width = 75
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'change_rate'
          Footers = <>
          Title.Caption = #24179#22343#21464#21160#29575
          Width = 65
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  inherited cdsPick: TClientDataSet
    Left = 560
    Top = 176
  end
  inherited dsPick: TDataSource
    Left = 512
    Top = 184
  end
  object cdsAVGP: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT Data0496.GROUP_NAME, Data0496.GROUP_DESC,  Data0017.INV_P' +
      'ART_NUMBER, Data0017.INV_PART_DESCRIPTION,  Data0023.CODE, data0' +
      '328.old_price,'#13#10'data0023.abbr_name,  data0328.new_price, data032' +
      '8.sys_longdate, data0328.reason,  Data0005.EMPLOYEE_NAME,  '#13#10'dat' +
      'a0328.new_price-data0328.old_price as change_price,  round((data' +
      '0328.new_price-data0328.old_price)*100/data0328.old_price,2)  as' +
      ' change_rate,'#13#10'Data0001.CURR_CODE,data0002.unit_code  FROM Data0' +
      '017 INNER JOIN  Data0028 ON Data0017.RKEY = Data0028.INVENTORY_P' +
      'TR '#13#10'INNER JOIN  data0328 ON Data0028.RKEY = data0328.price_ptr ' +
      'INNER JOIN  Data0496 ON Data0017.GROUP_PTR = Data0496.RKEY'#13#10' INN' +
      'ER JOIN  Data0023 ON Data0028.SUPPLIER_PTR = Data0023.RKEY INNER' +
      ' JOIN  Data0005 ON data0328.user_ptr = Data0005.RKEY'#13#10'  INNER JO' +
      'IN  dbo.Data0001 ON dbo.Data0028.CURRENCY_PTR = dbo.Data0001.RKE' +
      'Y'#13#10'   INNER JOIN  dbo.Data0002 ON dbo.Data0028.PURCHASE_UNIT_PTR' +
      ' = dbo.Data0002.RKEY '#13#10'    where   (data0328.old_price > 0)'
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ReadOnly = True
    Left = 704
    Top = 144
  end
  object ds_AVGP: TDataSource
    DataSet = cdsAVGP
    Left = 656
    Top = 144
  end
  object qrytemp: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security In' +
      'fo=True;User ID=WZPCBConnect;Initial Catalog=sj_v20_live;Data So' +
      'urce=172.16.8.112'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT Data0496.GROUP_NAME, Data0496.GROUP_DESC,  Data0017.INV_P' +
        'ART_NUMBER, Data0017.INV_PART_DESCRIPTION,  Data0023.CODE, data0' +
        '328.old_price,'
      
        'data0023.abbr_name,  data0328.new_price, data0328.sys_longdate, ' +
        'data0328.reason,  Data0005.EMPLOYEE_NAME,  '
      
        'data0328.new_price-data0328.old_price as change_price,  round((d' +
        'ata0328.new_price-data0328.old_price)*100/data0328.old_price,2) ' +
        ' as change_rate,'
      
        'Data0001.CURR_CODE,data0002.unit_code  FROM Data0017 INNER JOIN ' +
        ' Data0028 ON Data0017.RKEY = Data0028.INVENTORY_PTR '
      
        'INNER JOIN  data0328 ON Data0028.RKEY = data0328.price_ptr INNER' +
        ' JOIN  Data0496 ON Data0017.GROUP_PTR = Data0496.RKEY'
      
        ' INNER JOIN  Data0023 ON Data0028.SUPPLIER_PTR = Data0023.RKEY I' +
        'NNER JOIN  Data0005 ON data0328.user_ptr = Data0005.RKEY'
      
        '  INNER JOIN  dbo.Data0001 ON dbo.Data0028.CURRENCY_PTR = dbo.Da' +
        'ta0001.RKEY'
      
        '   INNER JOIN  dbo.Data0002 ON dbo.Data0028.PURCHASE_UNIT_PTR = ' +
        'dbo.Data0002.RKEY '
      '    where   (data0328.old_price > 0)  and 1=2')
    Left = 680
    Top = 288
    object strngfldGROUP_NAME: TStringField
      FieldName = 'GROUP_NAME'
      Size = 10
    end
    object strngfldGROUP_DESC: TStringField
      FieldName = 'GROUP_DESC'
      Size = 30
    end
    object qrytempold_price: TFloatField
      FieldName = 'old_price'
    end
    object qrytempnew_price: TFloatField
      FieldName = 'new_price'
    end
    object qrytempchange_price: TFloatField
      FieldName = 'change_price'
      ReadOnly = True
    end
    object qrytempchange_rate: TFloatField
      FieldName = 'change_rate'
      ReadOnly = True
    end
  end
end
