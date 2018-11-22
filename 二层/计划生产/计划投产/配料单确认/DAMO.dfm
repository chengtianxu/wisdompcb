object DM: TDM
  OldCreateOrder = False
  Left = 359
  Top = 198
  Height = 319
  Width = 254
  object ADOConnection1: TADOConnection
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 40
  end
  object ADS492: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.data0492.rkey, data0492.CUT_NO, dbo.data0492.SO_NO, '#13 +
      #10'      dbo.Data0005.EMPLOYEE_NAME, data0492.CUT_NO as cutno,'#13#10'  ' +
      '    dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC, ' +
      #13#10'      data0492.ISSUED_QTY, data0492.ISSUE_DATE,data0492.tstatu' +
      's, '#13#10'      data0492.pnl1_size, data0492.PANEL_1_QTY, data0492.UP' +
      'ANEL1, '#13#10'      data0492.pnl2_size, data0492.PANEL_2_QTY, data049' +
      '2.UPANEL2, '#13#10'case data0492.Con_Flag when 0 then '#39#26410#30830#35748#39'  when 2 th' +
      'en '#39#24050#30830#35748#39' end as '#29366#24577','#13#10'case data0492.TTYPE when 0 then '#39#27491#24120#39'  WHEN ' +
      '1 THEN '#39#34917#26009#39' '#13#10'when 2 then '#39'MRB'#37325#25237#39' when 3 then '#39'MRB'#36820#20462#39' when 4 the' +
      'n '#39#25353#26495#21495#25237#20135#39#13#10' end AS '#25237#20135#24615#36136', data0015.WAREHOUSE_CODE,d05.employee_na' +
      'me as '#30830#35748#20154#21592','#13#10'case   when  Data0025.PARENT_PTR is null then '#39#22806#23618#39' ' +
      ' else '#39#20869#23618#39' end as '#20135#21697#24615#36136','#13#10'data0492.con_date'#13#10'FROM dbo.data0492 IN' +
      'NER JOIN'#13#10'      dbo.Data0005 ON '#13#10'      dbo.data0492.CREATED_BY_' +
      'PTR = dbo.Data0005.RKEY INNER JOIN'#13#10'      dbo.Data0025 ON dbo.da' +
      'ta0492.BOM_PTR = dbo.Data0025.RKEY inner join'#13#10'      data0015 on' +
      ' data0492.WHOUSE_PTR = data0015.rkey left join data0005'#13#10'as d05 ' +
      'on data0492.con_user_ptr=d05.rkey'#13#10'where data0492.ISSUE_DATE >= ' +
      ':dtpk1 and data0492.ISSUE_DATE <= :dtpk2'#13#10'and data0492.TSTATUS<>' +
      '3'
    IndexFieldNames = 'cut_no'
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 38718d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 39020d
      end>
    Left = 72
    Top = 104
    object ADS492rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS492CUT_NO: TStringField
      DisplayLabel = #37197#26009#21333#21495
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ADS492SO_NO: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'SO_NO'
      FixedChar = True
      Size = 12
    end
    object ADS492EMPLOYEE_NAME: TStringField
      DisplayLabel = #25237#20135#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS492MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADS492MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADS492ISSUED_QTY: TIntegerField
      DisplayLabel = #25237#20135#25968#37327
      FieldName = 'ISSUED_QTY'
    end
    object ADS492ISSUE_DATE: TDateTimeField
      DisplayLabel = #25237#20135#26085#26399
      FieldName = 'ISSUE_DATE'
    end
    object ADS492DSDesigner: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 6
    end
    object ADS492DSDesigner2: TStringField
      DisplayWidth = 8
      FieldName = #25237#20135#24615#36136
      ReadOnly = True
      Size = 10
    end
    object ADS492DSDesigner3: TStringField
      FieldName = #20135#21697#24615#36136
      ReadOnly = True
      Size = 4
    end
    object ADS492pnl1_size: TStringField
      DisplayLabel = 'A'#26495#23610#23544
      FieldName = 'pnl1_size'
    end
    object ADS492PANEL_1_QTY: TIntegerField
      DisplayLabel = 'A'#26495#25968#37327
      FieldName = 'PANEL_1_QTY'
    end
    object ADS492UPANEL1: TIntegerField
      DisplayLabel = 'PCS/A'#26495
      FieldName = 'UPANEL1'
    end
    object ADS492pnl2_size: TStringField
      DisplayLabel = 'B'#26495#23610#23544
      FieldName = 'pnl2_size'
    end
    object ADS492PANEL_2_QTY: TIntegerField
      DisplayLabel = 'B'#26495#25968#37327
      FieldName = 'PANEL_2_QTY'
    end
    object ADS492UPANEL2: TIntegerField
      DisplayLabel = 'PCS/B'#26495
      FieldName = 'UPANEL2'
    end
    object ADS492cutno: TStringField
      FieldName = 'cutno'
      FixedChar = True
      Size = 12
    end
    object ADS492tstatus: TWordField
      DisplayLabel = #36229#25237#23457#26680#29366#24577
      FieldName = 'tstatus'
    end
    object ADS492WAREHOUSE_CODE: TStringField
      DisplayLabel = #24037#21378#20195#30721
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADS492con_date: TDateTimeField
      DisplayLabel = #30830#35748#26085#26399
      FieldName = 'con_date'
    end
    object ADS492DSDesigner4: TStringField
      FieldName = #30830#35748#20154#21592
      Size = 16
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS492
    Left = 19
    Top = 103
  end
  object ADS468: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME, '#13#10'      d' +
      'bo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, '#13#10'      dbo.' +
      'Data0017.INV_DESCRIPTION, dbo.Data0468.QUAN_BOM, '#13#10'      dbo.Dat' +
      'a0468.QUAN_ISSUED,  dbo.Data0002.UNIT_NAME, '#13#10'      dbo.Data0017' +
      '.QUAN_ON_HAND,data0468.step,'#13#10'case dbo.Data0468.STATUS when 0 th' +
      'en '#39#26377#25928#39' when 1 then '#39#20851#38381#39' end  as '#29366#24577','#13#10'     case data0468.invent_' +
      'or when 0 then '#39#26631#20934#39' when 1 then '#39#20313#26009#39' end as '#26469#28304#24211#23384', data0468.VENDO' +
      'R,Data0468.RKEY'#13#10'FROM dbo.Data0468 INNER JOIN'#13#10'      dbo.Data001' +
      '7 ON dbo.Data0468.INVENT_PTR = dbo.Data0017.RKEY INNER JOIN'#13#10'   ' +
      '   dbo.Data0034 ON dbo.Data0468.DEPT_PTR = dbo.Data0034.RKEY INN' +
      'ER JOIN'#13#10'      dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PTR = dbo' +
      '.Data0002.RKEY'#13#10'where   (data0468.cut_no=:cut_no) and data0468.I' +
      'nvent_or=0'#13#10#13#10'union '#13#10#13#10'SELECT dbo.Data0034.DEPT_CODE, dbo.Data0' +
      '034.DEPT_NAME, '#13#10'      dbo.DATA0556.MAT_CODE, dbo.DATA0556.mat_d' +
      'esc, '#13#10'      CAST(dbo.DATA0556.LEN_SIZE AS varchar) '#13#10'      + '#39'*' +
      #39' + CAST(dbo.DATA0556.WEI_SIZE AS varchar) AS invname, '#13#10'      D' +
      'ata0468.QUAN_BOM, Data0468.QUAN_ISSUED, '#13#10'      Data0002.UNIT_NA' +
      'ME,DATA0556.QUAN_ON_HAND,data0468.step,'#13#10'case Data0468.STATUS wh' +
      'en 0 then '#39#26377#25928#39' when 1 then '#39#20851#38381#39' end  as '#29366#24577','#13#10'case data0468.inven' +
      't_or when 0 then '#39#26631#20934#39' when 1 then '#39#20313#26009#39' end as '#26469#28304#24211#23384','#13#10'data0468.VE' +
      'NDOR,Data0468.RKEY'#13#10'FROM dbo.DATA0556 INNER JOIN'#13#10'      dbo.Data' +
      '0002 INNER JOIN'#13#10'      dbo.Data0017 ON dbo.Data0002.RKEY = dbo.D' +
      'ata0017.STOCK_UNIT_PTR ON '#13#10'      dbo.DATA0556.RKEY17 = dbo.Data' +
      '0017.RKEY INNER JOIN'#13#10'      dbo.Data0468 INNER JOIN'#13#10'      dbo.D' +
      'ata0034 ON dbo.Data0468.DEPT_PTR = dbo.Data0034.RKEY ON '#13#10'      ' +
      'dbo.DATA0556.RKEY = dbo.Data0468.INVENT_PTR'#13#10'WHERE   (data0468.c' +
      'ut_no=:cutno) and data0468.Invent_or=1'#13#10'order by Data0468.RKEY'
    DataSource = DataSource1
    MasterFields = 'cut_no;cutno'
    Parameters = <
      item
        Name = 'cut_no'
        DataType = ftString
        Size = 12
        Value = 'B0006588-0  '
      end
      item
        Name = 'cutno'
        DataType = ftString
        Size = 12
        Value = Null
      end>
    Left = 72
    Top = 168
    object ADS468DEPT_CODE: TStringField
      DisplayLabel = #24037#24207#20195#30721
      DisplayWidth = 13
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADS468INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      DisplayWidth = 23
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADS468DEPT_NAME: TStringField
      DisplayLabel = #24037#24207#21517#31216
      DisplayWidth = 13
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADS468INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      DisplayWidth = 23
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADS468INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      DisplayWidth = 25
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADS468QUAN_BOM: TFloatField
      DisplayLabel = #37197#39069#25968#37327
      DisplayWidth = 12
      FieldName = 'QUAN_BOM'
    end
    object ADS468QUAN_ISSUED: TFloatField
      DisplayLabel = #21457#25918#25968#37327
      DisplayWidth = 16
      FieldName = 'QUAN_ISSUED'
    end
    object ADS468UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      DisplayWidth = 14
      FieldName = 'UNIT_NAME'
    end
    object ADS468QUAN_ON_HAND: TFloatField
      DisplayLabel = #24403#21069#24211#23384
      DisplayWidth = 18
      FieldName = 'QUAN_ON_HAND'
    end
    object ADS468DSDesigner: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 5
    end
    object ADS468step: TSmallintField
      DisplayLabel = #27493#39588#21495
      FieldName = 'step'
    end
    object ADS468VENDOR: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'VENDOR'
      ReadOnly = True
      Size = 15
    end
    object ADS468DSDesigner2: TStringField
      FieldName = #26469#28304#24211#23384
      ReadOnly = True
      Size = 4
    end
  end
  object DataSource2: TDataSource
    DataSet = ADS468
    Left = 16
    Top = 168
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 128
    Top = 48
  end
end
