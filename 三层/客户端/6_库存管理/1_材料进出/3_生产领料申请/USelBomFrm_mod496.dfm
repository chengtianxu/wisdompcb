inherited FrmSelBom_mod496: TFrmSelBom_mod496
  Caption = #36873#25321#37197#26009#21333
  ClientHeight = 451
  ClientWidth = 714
  OnCreate = FormCreate
  ExplicitWidth = 730
  ExplicitHeight = 489
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl1: TPanel
    Width = 714
    ExplicitWidth = 714
    inherited edtFilter: TLabeledEdit
      EditLabel.ExplicitLeft = 0
      EditLabel.ExplicitTop = -16
    end
    object grp1: TGroupBox
      Left = 450
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
        Left = 33
        Top = 14
        Width = 97
        Height = 21
        Date = 37600.000000000000000000
        Format = 'yyyy-MM-dd'
        Time = 37600.000000000000000000
        TabOrder = 0
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
  end
  inherited pnl2: TPanel
    Top = 410
    Width = 714
    ExplicitTop = 410
    ExplicitWidth = 714
    inherited btnOK: TButton
      Visible = False
    end
  end
  inherited pnl3: TPanel
    Width = 714
    Height = 369
    ExplicitWidth = 714
    ExplicitHeight = 369
    inherited eh1: TDBGridEh
      Width = 712
      Height = 367
    end
  end
  inherited cdsPick: TClientDataSet
    CommandText = 
      'SELECT     dbo.data0492.CUT_NO, dbo.data0492.SO_NO, dbo.Data0025' +
      '.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC, '#13#10'data0492.ISSUE' +
      '_DATE,case data0492.TTYPE when 0 then '#39#27491#24120#25237#20135#39' when 1 then '#39#34917#26009#25237#20135#39#13 +
      #10'when 2 then '#39'MRB'#37325#25237#39' when 3 then '#39'MRB'#36820#20462#39' when 4 then '#39#25353#26009#21495#25237#20135#39' end' +
      ' '#25237#20135#31867#22411','#13#10'dbo.data0492.ISSUED_QTY, '#13#10'                      dbo.dat' +
      'a0492.PANEL_1_QTY  as A'#26495#22359#25968', dbo.data0492.PANEL_2_QTY as B'#26495#22359#25968#13#10'FR' +
      'OM         dbo.data0492 INNER JOIN'#13#10'                      dbo.Da' +
      'ta0025 ON dbo.data0492.BOM_PTR = dbo.Data0025.RKEY'#13#10'WHERE     (d' +
      'bo.data0492.TSTATUS IN (0, 2)) AND  data0492.TTYPE <>3'#13#10' and dbo' +
      '.data0492.ISSUE_DATE>=getdate() and dbo.data0492.ISSUE_DATE<=dat' +
      'eadd(dd,1,getdate())'
    Left = 368
    Top = 96
  end
  inherited dsPick: TDataSource
    Left = 432
    Top = 96
  end
end
