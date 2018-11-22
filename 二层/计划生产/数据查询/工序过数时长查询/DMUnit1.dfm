object DM: TDM
  OldCreateOrder = False
  Left = 579
  Top = 231
  Height = 351
  Width = 283
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdompcb1077;Persist Security Info' +
      '=True;User ID=sa;Initial Catalog=wisdompcb_bak;Data Source=W0080' +
      '08'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 8
  end
  object ADODataSet2: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT TOP 100 PERCENT '#13#10'      AVG(DATEDIFF(hh,Data0048.INTIME,D' +
      'ata0048.OUTTIME)) as hours, '#13#10'      AVG(Data0048.QTY_PROD) as QT' +
      'Y_PROD,  '#13#10'      FrData0034.DEPT_CODE AS frDEPT_CODE,FrData0034.' +
      'DEPT_NAME AS frDEPT_NAME, '#13#10'      case when data0048.TO_DEPT_PTR' +
      ' is null then '#39#39' else  ToData0034.DEPT_CODE end AS toDEPT_CODE, ' +
      #13#10'      case when data0048.TO_DEPT_PTR is null then '#39#20179#24211#39' else  T' +
      'oData0034.DEPT_NAME end AS toDEPT_NAME '#13#10'FROM  Data0006 INNER JO' +
      'IN Data0048 ON Data0006.RKEY = Data0048.WO_PTR '#13#10'      INNER JOI' +
      'N Data0034 frdata0034 ON Data0048.FM_DEPT_PTR = frData0034.RKEY ' +
      #13#10'      INNER JOIN Data0034 toData0034 ON Data0048.TO_DEPT_PTR =' +
      ' toData0034.RKEY '#13#10'WHERE data0006.cut_no=:cut_no'#13#10'group by data0' +
      '006.cut_no,FrData0034.DEPT_CODE,FrData0034.DEPT_NAME,'#13#10'      cas' +
      'e when data0048.TO_DEPT_PTR is null then '#39#39' else  ToData0034.DEP' +
      'T_CODE end, '#13#10'      case when data0048.TO_DEPT_PTR is null then ' +
      #39#20179#24211#39' else  ToData0034.DEPT_NAME end '
    MasterFields = 'cut_no'
    Parameters = <
      item
        Name = 'cut_no'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 12
        Value = Null
      end>
    Left = 24
    Top = 128
    object ADODataSet2hours: TIntegerField
      DisplayLabel = #24179#22343#20572#30041#23567#26102
      FieldName = 'hours'
    end
    object ADODataSet2QTY_PROD: TIntegerField
      DisplayLabel = #24179#22343#20135#20986#25968#37327#65288'PCS'#65289
      FieldName = 'QTY_PROD'
    end
    object ADODataSet2frDEPT_CODE: TStringField
      DisplayLabel = #20174#37096#38376#20195#30721
      FieldName = 'frDEPT_CODE'
      Size = 10
    end
    object ADODataSet2frDEPT_NAME: TStringField
      DisplayLabel = #20174#37096#38376#21517#31216
      FieldName = 'frDEPT_NAME'
      Size = 30
    end
    object ADODataSet2toDEPT_CODE: TStringField
      DisplayLabel = #21040#37096#38376#20195#30721
      FieldName = 'toDEPT_CODE'
      Size = 10
    end
    object ADODataSet2toDEPT_NAME: TStringField
      DisplayLabel = #21040#37096#38376#21517#31216
      FieldName = 'toDEPT_NAME'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 104
    Top = 64
  end
  object ADODataSet3: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT  Data0006.WORK_ORDER_NUMBER,Data0048.INTIME,Data0048.OUTT' +
      'IME, '#13#10'       DATEDIFF(hh,Data0048.INTIME,Data0048.OUTTIME) as h' +
      'ours,'#13#10'       Data0048.QTY_PROD,  '#13#10'       FrData0034.DEPT_CODE ' +
      'AS frDEPT_CODE,FrData0034.DEPT_NAME AS frDEPT_NAME, '#13#10'       cas' +
      'e when data0048.TO_DEPT_PTR is null then '#39#39' else  ToData0034.DEP' +
      'T_CODE end AS toDEPT_CODE, '#13#10'       case when data0048.TO_DEPT_P' +
      'TR is null then '#39#20179#24211#39' else  ToData0034.DEPT_NAME end AS toDEPT_NA' +
      'ME '#13#10'FROM  Data0006 INNER JOIN'#13#10'      Data0048 ON Data0006.RKEY ' +
      '= Data0048.WO_PTR INNER JOIN'#13#10'      Data0034 frdata0034 ON Data0' +
      '048.FM_DEPT_PTR = frData0034.RKEY INNER JOIN'#13#10'      data0034 tod' +
      'ata0034 ON toData0034.RKEY = Data0048.TO_DEPT_PTR '#13#10'where data00' +
      '06.cut_no = :cut_no'#13#10'order by data0006.WORK_ORDER_NUMBER,data004' +
      '8.STEP_NO'
    MasterFields = 'cut_no'
    Parameters = <
      item
        Name = 'cut_no'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 12
        Value = Null
      end>
    Left = 24
    Top = 192
    object ADODataSet3WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20316#19994#21333#21495
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ADODataSet3INTIME: TDateTimeField
      DisplayLabel = #20837#26102#38388
      FieldName = 'INTIME'
    end
    object ADODataSet3OUTTIME: TDateTimeField
      DisplayLabel = #20986#26102#38388
      FieldName = 'OUTTIME'
    end
    object ADODataSet3hours: TIntegerField
      DisplayLabel = #20572#30041#23567#26102
      FieldName = 'hours'
      ReadOnly = True
    end
    object ADODataSet3QTY_PROD: TIntegerField
      DisplayLabel = #20135#20986#25968#37327'(PCS)'
      FieldName = 'QTY_PROD'
    end
    object ADODataSet3frDEPT_CODE: TStringField
      DisplayLabel = #20174#37096#38376#20195#30721
      FieldName = 'frDEPT_CODE'
      Size = 10
    end
    object ADODataSet3frDEPT_NAME: TStringField
      DisplayLabel = #20174#37096#38376#21517#31216
      FieldName = 'frDEPT_NAME'
      Size = 30
    end
    object ADODataSet3toDEPT_CODE: TStringField
      DisplayLabel = #21040#37096#38376#20195#30721
      FieldName = 'toDEPT_CODE'
      ReadOnly = True
      Size = 10
    end
    object ADODataSet3toDEPT_NAME: TStringField
      DisplayLabel = #21040#37096#38376#21517#31216
      FieldName = 'toDEPT_NAME'
      ReadOnly = True
      Size = 30
    end
  end
  object aqtmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 24
    Top = 256
  end
  object ADODataSet1: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    AfterOpen = ADODataSet1AfterOpen
    AfterScroll = ADODataSet1AfterScroll
    CommandText = 
      'SELECT Data0060.rkey,Data0025.MANU_PART_NUMBER,Data0025.MANU_PAR' +
      'T_DESC, '#13#10'              Data0060.ENT_DATE,Data0060.SCH_DATE,Data' +
      '0010.CUST_CODE,'#13#10'              Data0005_1.EMPLOYEE_NAME AS ENAME' +
      '60,'#13#10'              Data0005.EMPLOYEE_NAME AS ENAME492,Data0060.P' +
      'ARTS_ORDERED,'#13#10'              Data0060.set_ordered,Data0060.FOB,D' +
      'ata0492.CUT_NO,Data0492.ISSUE_DATE,'#13#10'              Data0492.ISSU' +
      'ED_QTY,Data0060.SALES_ORDER'#13#10'FROM    Data0005 Data0005_1 INNER J' +
      'OIN Data0025 INNER JOIN Data0060 ON '#13#10'              Data0025.RKE' +
      'Y = Data0060.CUST_PART_PTR INNER JOIN Data0010 ON '#13#10'            ' +
      '  Data0060.CUSTOMER_PTR = Data0010.RKEY ON'#13#10'              Data00' +
      '05_1.RKEY = Data0060.ENTERED_BY_EMPL_PTR INNER JOIN'#13#10'           ' +
      '   Data0005 INNER JOIN data0492 ON '#13#10'              Data0005.RKEY' +
      ' = data0492.CREATED_BY_PTR ON '#13#10'              Data0060.SALES_ORD' +
      'ER = data0492.SO_NO '#13#10'WHERE 1=1 '
    MasterFields = 'cut_no'
    Parameters = <>
    Left = 24
    Top = 64
    object ADODataSet1rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADODataSet1MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADODataSet1MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADODataSet1ENT_DATE: TDateTimeField
      FieldName = 'ENT_DATE'
    end
    object ADODataSet1SCH_DATE: TDateTimeField
      FieldName = 'SCH_DATE'
    end
    object ADODataSet1CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADODataSet1ENAME60: TStringField
      FieldName = 'ENAME60'
      Size = 16
    end
    object ADODataSet1ENAME492: TStringField
      FieldName = 'ENAME492'
      Size = 16
    end
    object ADODataSet1PARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
    end
    object ADODataSet1set_ordered: TIntegerField
      FieldName = 'set_ordered'
    end
    object ADODataSet1FOB: TStringField
      FieldName = 'FOB'
      Size = 50
    end
    object ADODataSet1CUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ADODataSet1ISSUE_DATE: TDateTimeField
      FieldName = 'ISSUE_DATE'
    end
    object ADODataSet1ISSUED_QTY: TIntegerField
      FieldName = 'ISSUED_QTY'
    end
    object ADODataSet1SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
  end
  object DataSource2: TDataSource
    DataSet = ADODataSet2
    Left = 104
    Top = 128
  end
  object DataSource3: TDataSource
    DataSet = ADODataSet3
    Left = 104
    Top = 192
  end
end
