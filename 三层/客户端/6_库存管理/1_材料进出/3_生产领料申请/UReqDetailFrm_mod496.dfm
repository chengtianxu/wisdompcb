inherited FrmReqDetail_mod496: TFrmReqDetail_mod496
  Caption = #30003#39046#26126#32454
  ClientHeight = 522
  ClientWidth = 861
  OnCreate = FormCreate
  ExplicitWidth = 877
  ExplicitHeight = 561
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl1: TPanel
    Width = 861
    ExplicitWidth = 861
    inherited edtFilter: TLabeledEdit
      Left = 346
      EditLabel.ExplicitLeft = 303
      EditLabel.ExplicitTop = 15
      ExplicitLeft = 346
    end
    object grp1: TGroupBox
      Left = 597
      Top = 1
      Width = 263
      Height = 39
      Align = alRight
      Caption = #26085#26399#33539#22260
      TabOrder = 1
      object lbl1: TLabel
        Left = 9
        Top = 20
        Width = 20
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20174':'
      end
      object lbl2: TLabel
        Left = 136
        Top = 20
        Width = 21
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #21040':'
      end
      object dtp1: TDateTimePicker
        Left = 32
        Top = 16
        Width = 97
        Height = 21
        Date = 37600.000000000000000000
        Format = 'yyyy-MM-dd'
        Time = 37600.000000000000000000
        TabOrder = 0
        OnChange = dtp1Change
        OnExit = dtp1Exit
      end
      object dtp2: TDateTimePicker
        Left = 158
        Top = 16
        Width = 97
        Height = 21
        Date = 37600.000000000000000000
        Format = 'yyyy-MM-dd'
        Time = 37600.000000000000000000
        TabOrder = 1
        OnExit = dtp2Exit
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
      TabOrder = 2
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
      TabOrder = 3
      OnClick = btnExportToExcelClick
    end
  end
  inherited pnl2: TPanel
    Top = 481
    Width = 861
    ExplicitTop = 481
    ExplicitWidth = 861
    inherited btnOK: TButton
      Visible = False
    end
  end
  inherited pnl3: TPanel
    Width = 861
    Height = 440
    ExplicitWidth = 861
    ExplicitHeight = 440
    inherited eh1: TDBGridEh
      Width = 859
      Height = 438
      OnDblClick = nil
    end
  end
  inherited cdsPick: TClientDataSet
    CommandText = 
      'SELECT     dbo.DATA0268.rkey, dbo.DATA0268.number AS '#39046#26009#21333#21495', dbo.D' +
      'ata0005.EMPLOYEE_NAME AS '#30003#39046#20154#21592', dbo.Data0034.DEPT_NAME AS '#37096#38376','#13#10' d' +
      'bo.Data0017.INV_PART_NUMBER AS '#26448#26009#32534#30721', dbo.Data0017.INV_NAME AS '#26448#26009 +
      #21517#31216', dbo.Data0017.INV_DESCRIPTION AS '#26448#26009#35268#26684', '#13#10'dbo.Data0468.VENDOR ' +
      'AS '#20379#24212#21830', dbo.Data0002.UNIT_NAME AS '#21333#20301', dbo.Data0468.QUAN_BOM AS '#30003 +
      #39046#25968#37327','#13#10' dbo.Data0468.QUAN_ISSUED AS '#24050#21457#25918#25968#37327', dbo.DATA0268.DATE AS '#30003 +
      #39046#26085#26399', dbo.DATA0268.DATE, dbo.DATA0268.reference AS '#22791#27880','#13#10' dbo.Data' +
      '0015.WAREHOUSE_CODE AS '#24037#21378#20195#30721', dbo.Data0015.ABBR_NAME AS '#24037#21378#31616#31216' '#13#10'  ' +
      'FROM   dbo.Data0468 '#13#10'  INNER JOIN  dbo.Data0017 ON dbo.Data0468' +
      '.INVENT_PTR = dbo.Data0017.RKEY'#13#10'   INNER JOIN  dbo.DATA0268 ON ' +
      'dbo.Data0468.FLOW_NO = dbo.DATA0268.rkey '#13#10'   INNER JOIN   dbo.D' +
      'ata0002 ON dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY '#13#10'   ' +
      'INNER JOIN    dbo.Data0034 ON dbo.DATA0268.dept_ptr = dbo.Data00' +
      '34.RKEY'#13#10'    INNER JOIN    dbo.Data0005 ON dbo.DATA0268.EMPL_PTR' +
      ' = dbo.Data0005.RKEY'#13#10'     INNER JOIN   dbo.Data0015 ON dbo.DATA' +
      '0268.warehouse_ptr = dbo.Data0015.RKEY '#13#10' where 1=1 and dbo.DATA' +
      '0268.DATE>=dateadd(dd,-7,getdate()) and  dbo.DATA0268.DATE<=getd' +
      'ate() '
    Left = 512
    Top = 88
  end
  inherited dsPick: TDataSource
    Left = 560
    Top = 88
  end
end
