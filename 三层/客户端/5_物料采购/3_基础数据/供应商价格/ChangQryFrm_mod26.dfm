inherited frmChangQry_mod26: TfrmChangQry_mod26
  Caption = #21464#21160#26597#35810
  ClientHeight = 534
  ClientWidth = 804
  ExplicitWidth = 820
  ExplicitHeight = 573
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl1: TPanel
    Width = 804
    ExplicitWidth = 804
    object pnl4: TPanel
      Left = 455
      Top = 1
      Width = 348
      Height = 39
      Align = alRight
      TabOrder = 1
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
      TabOrder = 3
      OnClick = btnExitClick
    end
  end
  inherited pnl2: TPanel
    Top = 41
    Width = 804
    Height = 40
    Align = alTop
    ExplicitTop = 41
    ExplicitWidth = 804
    ExplicitHeight = 40
    inherited btnOK: TButton
      Left = 738
      Top = 6
      Width = 8
      Visible = False
      ExplicitLeft = 738
      ExplicitTop = 6
      ExplicitWidth = 8
    end
    inherited btnCancelPick: TButton
      Left = 752
      Top = 6
      Width = 9
      Visible = False
      ExplicitLeft = 752
      ExplicitTop = 6
      ExplicitWidth = 9
    end
    object btn_detail: TButton
      Left = 1
      Top = 1
      Width = 120
      Height = 38
      Align = alLeft
      Caption = #21464#21160#26126#32454
      Style = bsCommandLink
      TabOrder = 2
      OnClick = btn_detailClick
    end
    object btn_AVGChange: TButton
      Left = 121
      Top = 1
      Width = 139
      Height = 38
      Align = alLeft
      Caption = #21464#21160#26126#32454#26354#32447
      Style = bsCommandLink
      TabOrder = 3
      OnClick = btn_AVGChangeClick
    end
  end
  inherited pnl3: TPanel
    Top = 81
    Width = 804
    Height = 453
    ExplicitTop = 81
    ExplicitWidth = 804
    ExplicitHeight = 453
    inherited eh1: TDBGridEh
      Width = 802
      Height = 451
      OnDblClick = nil
      Columns = <
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'EMPLOYEE_NAME'
          Footers = <>
          Title.Caption = #21464#21160#20154#21592
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'sys_longdate'
          Footers = <>
          Title.Caption = #21464#21160#26085#26399
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'old_price'
          Footers = <>
          Title.Caption = #26087#20215#26684
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'new_price'
          Footers = <>
          Title.Caption = #26032#20215#26684
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'reason'
          Footers = <>
          Title.Caption = #21464#21160#21407#22240
          Width = 137
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'change'
          Footers = <>
          Title.Caption = #21464#21160#39069
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'rand'
          Footers = <>
          Title.Caption = #21464#21160#24133#24230
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'sys_sortdate'
          Footers = <>
          Title.Caption = #21464#21160#26085#26399
        end>
    end
    object pnl_chart: TPanel
      Left = 1
      Top = 1
      Width = 802
      Height = 451
      Align = alClient
      TabOrder = 1
    end
  end
  inherited cdsPick: TClientDataSet
    Left = 544
    Top = 136
  end
  inherited dsPick: TDataSource
    Left = 504
    Top = 136
  end
  object qrytemp: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security In' +
      'fo=True;User ID=WZPCBConnect;Initial Catalog=sj_v20_live;Data So' +
      'urce=172.16.8.112'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select data0005.EMPLOYEE_NAME, data0328.sys_longdate,  data0328.' +
        'old_price, data0328.new_price,data0328.reason,  '
      
        'round(data0328.new_price-data0328.old_price,2) as change,  case ' +
        'when data0328.old_price>0 then '
      
        ' round((data0328.new_price-data0328.old_price)*100/data0328.old_' +
        'price,2)  else 100 end as rand, '
      
        '  CONVERT(datetime, CONVERT(varchar, sys_longdate, 102))  as sys' +
        '_sortdate  '
      
        '  from data0328 inner join data0005  on data0328.user_ptr=data00' +
        '05.rkey  where 1=2  ')
    Left = 560
    Top = 240
    object strngfldEMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object qrytempsys_longdate: TDateTimeField
      FieldName = 'sys_longdate'
    end
    object qrytempold_price: TFloatField
      FieldName = 'old_price'
    end
    object qrytempnew_price: TFloatField
      FieldName = 'new_price'
    end
    object strngfldqrytempreason: TStringField
      FieldName = 'reason'
      Size = 50
    end
    object qrytempchange: TFloatField
      FieldName = 'change'
      ReadOnly = True
    end
    object qrytemprand: TFloatField
      FieldName = 'rand'
      ReadOnly = True
    end
    object qrytempsys_sortdate: TDateTimeField
      FieldName = 'sys_sortdate'
      ReadOnly = True
    end
  end
end
