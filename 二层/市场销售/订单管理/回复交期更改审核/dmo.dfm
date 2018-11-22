object DM: TDM
  OldCreateOrder = False
  Left = 470
  Top = 213
  Height = 392
  Width = 287
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 112
  end
  object ADO60: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterScroll = ADO60AfterScroll
    CommandText = 
      'SELECT D60.SALES_ORDER,D25.MANU_PART_NUMBER,D25.MANU_PART_DESC,D' +
      '10.CUST_CODE,D97.PO_NUMBER,'#13#10'       D60.PARTS_ORDERED,D60.ENT_DA' +
      'TE,D60.RKEY,D174.oldReply_Date,D174.newReply_Date,D174.RKEY as r' +
      'key174,'#13#10'       D05.employee_name as proposer_name,D174.proposer' +
      '_Date,D05_1.employee_name as approval_name,'#13#10'       D174.approva' +
      'l_Date,case D174.status when 0 then '#39#24453#23457#26680#39' when 1 then '#39#24050#23457#26680#39' else' +
      ' '#39#39' end as status,'#13#10'       D174.remark,D60.set_ordered,D60.ORIG_' +
      'REQUEST_DATE,D60.ORIG_SCHED_SHIP_DATE,D25.spell_qty,D60.SCH_DATE' +
      ',D60.complete_date,'#13#10'       D25.MFG_LEAD_TIME,D10.DAYS_EARLY_SCH' +
      'EDULE,D25.unit_sq,D60.PARTS_ORDERED*D25.unit_sq as dArea,D174.pl' +
      'anned_FLAG'#13#10'FROM   Data0174 AS D174 INNER JOIN'#13#10'       Data0060 ' +
      'AS D60 ON D174.so_ptr=D60.Rkey INNER JOIN'#13#10'       Data0025 AS D2' +
      '5 ON D60.CUST_PART_PTR=D25.Rkey INNER JOIN'#13#10'       Data0097 AS D' +
      '97 ON D60.PURCHASE_ORDER_PTR=D97.Rkey INNER JOIN'#13#10'       Data001' +
      '0 AS D10 ON D60.CUSTOMER_PTR=D10.Rkey LEFT OUTER JOIN '#13#10'       D' +
      'ata0005 AS D05 ON D174.proposer=D05.Rkey LEFT OUTER JOIN '#13#10'     ' +
      '  Data0005 AS D05_1 ON D174.approval=D05_1.Rkey'#13#10'WHERE  D174.pro' +
      'poser_Date between :dtpk1 and :dtpk2 '#13#10'ORDER BY D174.RKEY,D60.SA' +
      'LES_ORDER'
    IndexFieldNames = 'rkey174'
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    Left = 128
    Top = 24
    object ADO60SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADO60MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADO60MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADO60CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADO60PO_NUMBER: TStringField
      DisplayWidth = 32
      FieldName = 'PO_NUMBER'
      Size = 32
    end
    object ADO60PARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
    end
    object ADO60ENT_DATE: TDateTimeField
      FieldName = 'ENT_DATE'
    end
    object ADO60RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO60oldReply_Date: TDateTimeField
      FieldName = 'oldReply_Date'
    end
    object ADO60newReply_Date: TDateTimeField
      FieldName = 'newReply_Date'
    end
    object ADO60rkey174: TAutoIncField
      FieldName = 'rkey174'
      ReadOnly = True
    end
    object ADO60proposer_name: TStringField
      FieldName = 'proposer_name'
      Size = 16
    end
    object ADO60proposer_Date: TDateTimeField
      FieldName = 'proposer_Date'
    end
    object ADO60approval_name: TStringField
      FieldName = 'approval_name'
      Size = 16
    end
    object ADO60approval_Date: TDateTimeField
      FieldName = 'approval_Date'
    end
    object ADO60status: TStringField
      FieldName = 'status'
      ReadOnly = True
      Size = 6
    end
    object ADO60remark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
    object ADO60set_ordered: TIntegerField
      FieldName = 'set_ordered'
    end
    object ADO60ORIG_REQUEST_DATE: TDateTimeField
      FieldName = 'ORIG_REQUEST_DATE'
    end
    object ADO60ORIG_SCHED_SHIP_DATE: TDateTimeField
      FieldName = 'ORIG_SCHED_SHIP_DATE'
    end
    object ADO60spell_qty: TIntegerField
      FieldName = 'spell_qty'
    end
    object ADO60SCH_DATE: TDateTimeField
      FieldName = 'SCH_DATE'
    end
    object ADO60MFG_LEAD_TIME: TSmallintField
      FieldName = 'MFG_LEAD_TIME'
    end
    object ADO60DAYS_EARLY_SCHEDULE: TIntegerField
      FieldName = 'DAYS_EARLY_SCHEDULE'
    end
    object ADO60unit_sq: TFloatField
      FieldName = 'unit_sq'
    end
    object ADO60dArea: TFloatField
      FieldName = 'dArea'
      ReadOnly = True
    end
    object ADO60complete_date: TDateTimeField
      FieldName = 'complete_date'
    end
    object ADO60planned_FLAG: TWideStringField
      FieldName = 'planned_FLAG'
      FixedChar = True
      Size = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO60
    Left = 208
    Top = 24
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 128
    Top = 248
  end
  object ADO360: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT rkey,so_ptr,quantity,sch_date,planned_qty FROM data0360'#13#10 +
      'WHERE so_ptr=:so_ptr'
    IndexFieldNames = 'sch_date'
    Parameters = <
      item
        Name = 'so_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 128
    Top = 192
    object ADO360rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO360so_ptr: TIntegerField
      FieldName = 'so_ptr'
    end
    object ADO360quantity: TIntegerField
      FieldName = 'quantity'
    end
    object ADO360sch_date: TDateTimeField
      FieldName = 'sch_date'
    end
    object ADO360planned_qty: TIntegerField
      FieldName = 'planned_qty'
    end
  end
  object DataSource2: TDataSource
    DataSet = ADO360
    Left = 208
    Top = 192
  end
  object ADO174: TADODataSet
    AutoCalcFields = False
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'SELECT *'#13#10'FROM    Data0174 where rkey=:rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 128
    Top = 136
    object ADO174rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO174so_ptr: TIntegerField
      FieldName = 'so_ptr'
    end
    object ADO174proposer: TIntegerField
      FieldName = 'proposer'
    end
    object ADO174proposer_Date: TDateTimeField
      FieldName = 'proposer_Date'
    end
    object ADO174oldReply_Date: TDateTimeField
      FieldName = 'oldReply_Date'
    end
    object ADO174newReply_Date: TDateTimeField
      FieldName = 'newReply_Date'
    end
    object ADO174approval: TIntegerField
      FieldName = 'approval'
    end
    object ADO174approval_Date: TDateTimeField
      FieldName = 'approval_Date'
    end
    object ADO174status: TIntegerField
      FieldName = 'status'
    end
    object ADO174remark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
    object ADO174planned_FLAG: TWideStringField
      FieldName = 'planned_FLAG'
      FixedChar = True
      Size = 1
    end
  end
  object ADO175: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT rkey174,finish_Date as sch_date,finish_quantity as quanti' +
      'ty'#13#10'FROM Data0175'#13#10'WHERE rkey174=:rkey174'
    IndexFieldNames = 'sch_date'
    Parameters = <
      item
        Name = 'rkey174'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 128
    Top = 88
    object ADO175rkey174: TIntegerField
      FieldName = 'rkey174'
    end
    object ADO175sch_date: TDateTimeField
      FieldName = 'sch_date'
    end
    object ADO175quantity: TIntegerField
      FieldName = 'quantity'
    end
  end
  object DataSource3: TDataSource
    DataSet = ADO175
    Left = 208
    Top = 88
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 128
    Top = 304
  end
end
