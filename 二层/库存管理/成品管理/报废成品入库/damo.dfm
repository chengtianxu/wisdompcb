object DM: TDM
  OldCreateOrder = False
  Left = 861
  Top = 224
  Height = 219
  Width = 215
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = ADS416
    Left = 40
    Top = 56
  end
  object DataSource2: TDataSource
    DataSet = ADS53
    Left = 32
    Top = 112
  end
  object ADS416: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.data0416.number, dbo.data0416.type, dbo.data0416.' +
      'empl_ptr, dbo.data0416.sys_date,'#13#10'                  dbo.data0416' +
      '.quantity, dbo.data0416.reference, dbo.Data0005.EMPLOYEE_NAME,da' +
      'ta0416.rkey'#13#10'FROM         dbo.data0416 left JOIN'#13#10'              ' +
      '      dbo.Data0005 ON dbo.data0416.empl_ptr = dbo.Data0005.RKEY ' +
      #13#10'where  type=6 and status=2 '
    IndexFieldNames = 'number'
    Parameters = <>
    Left = 104
    Top = 56
    object ADS416number: TStringField
      FieldName = 'number'
      Size = 15
    end
    object ADS416type: TWordField
      FieldName = 'type'
    end
    object ADS416empl_ptr: TIntegerField
      FieldName = 'empl_ptr'
    end
    object ADS416sys_date: TDateTimeField
      FieldName = 'sys_date'
    end
    object ADS416quantity: TIntegerField
      FieldName = 'quantity'
    end
    object ADS416reference: TStringField
      FieldName = 'reference'
      Size = 50
    end
    object ADS416EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS416rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object ADS53: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DES' +
      'C, dbo.Data0006.WORK_ORDER_NUMBER, '#13#10'               dbo.Data0015' +
      '.ABBR_NAME, dbo.Data0016.LOCATION,  dbo.Data0053.QTY_ON_HAND,'#13#10' ' +
      '              dbo.Data0053.MFG_DATE, dbo.Data0053.RMA_PTR, dbo.D' +
      'ata0053.REFERENCE_NUMBER, dbo.Data0053.spec_place,'#13#10'            ' +
      '    data0053.rkey58,data0053.CUST_PART_PTR,data0053.rkey,data002' +
      '5.QTY_ON_HAND as vQTY_ON_HAND,data0053.QUANTITY,'#13#10'             D' +
      'ata0053.NPAD_PTR'#13#10'FROM    dbo.Data0053 INNER JOIN'#13#10'             ' +
      '  dbo.data0416 ON dbo.Data0053.NPAD_PTR = dbo.data0416.rkey INNE' +
      'R JOIN'#13#10'               dbo.Data0006 ON dbo.Data0053.WORK_ORDER_P' +
      'TR = dbo.Data0006.RKEY INNER JOIN'#13#10'               dbo.Data0016 O' +
      'N dbo.Data0053.LOC_PTR = dbo.Data0016.RKEY INNER JOIN'#13#10'         ' +
      '      dbo.Data0025 ON dbo.Data0053.CUST_PART_PTR = dbo.Data0025.' +
      'RKEY INNER JOIN'#13#10'               dbo.Data0015 ON dbo.Data0053.WHS' +
      'E_PTR = dbo.Data0015.RKEY'#13#10'where      Data0053.NPAD_PTR =:rkey  ' +
      '  '
    DataSource = DataSource1
    IndexFieldNames = 'NPAD_PTR'
    MasterFields = 'Rkey'
    Parameters = <
      item
        Name = 'Rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 82667
      end>
    Left = 104
    Top = 112
    object ADS53MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADS53MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADS53WORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ADS53ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADS53LOCATION: TStringField
      FieldName = 'LOCATION'
    end
    object ADS53QTY_ON_HAND: TFloatField
      FieldName = 'QTY_ON_HAND'
    end
    object ADS53MFG_DATE: TDateTimeField
      FieldName = 'MFG_DATE'
    end
    object ADS53RMA_PTR: TIntegerField
      FieldName = 'RMA_PTR'
    end
    object ADS53REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
    end
    object ADS53spec_place: TStringField
      FieldName = 'spec_place'
    end
    object ADS53rkey58: TIntegerField
      FieldName = 'rkey58'
    end
    object ADS53CUST_PART_PTR: TIntegerField
      FieldName = 'CUST_PART_PTR'
    end
    object ADS53rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS53vQTY_ON_HAND: TIntegerField
      FieldName = 'vQTY_ON_HAND'
    end
    object ADS53NPAD_PTR: TIntegerField
      FieldName = 'NPAD_PTR'
    end
    object ADS53QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 160
    Top = 80
  end
end
