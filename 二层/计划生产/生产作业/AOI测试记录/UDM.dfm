object DM: TDM
  OldCreateOrder = False
  Left = 380
  Top = 137
  Height = 423
  Width = 515
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdompcb1077;Persist Security Info' +
      '=True;User ID=sa;Initial Catalog=wisdompcb_bak;Data Source=172.1' +
      '6.68.8'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 16
  end
  object ADO686: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     Rkey, Record_No, Cust_Ptr, Dep_Ptr, Rec_date, Machine' +
        '_No, Runs, Emp_In_Ptr, In_Time, Out_Time, Type, outer_inside, Co' +
        'mp_Quantity, Layers, '
      
        '                      Tot_PNL, Tot_PAS, PNL, Tot_PCS, PCS_Pas, T' +
        'ot_Quantity, Result, Remark'
      'FROM         dbo.Data0686')
    Left = 104
    Top = 96
    object ADO686Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object ADO686Record_No: TStringField
      FieldName = 'Record_No'
    end
    object ADO686Cust_Ptr: TIntegerField
      FieldName = 'Cust_Ptr'
    end
    object ADO686Dep_Ptr: TIntegerField
      FieldName = 'Dep_Ptr'
    end
    object ADO686Rec_date: TDateTimeField
      FieldName = 'Rec_date'
    end
    object ADO686Machine_No: TIntegerField
      FieldName = 'Machine_No'
    end
    object ADO686Runs: TBooleanField
      FieldName = 'Runs'
    end
    object ADO686Emp_In_Ptr: TIntegerField
      FieldName = 'Emp_In_Ptr'
    end
    object ADO686In_Time: TDateTimeField
      FieldName = 'In_Time'
    end
    object ADO686Out_Time: TDateTimeField
      FieldName = 'Out_Time'
    end
    object ADO686Type: TStringField
      FieldName = 'Type'
      Size = 100
    end
    object ADO686outer_inside: TBooleanField
      FieldName = 'outer_inside'
    end
    object ADO686Comp_Quantity: TIntegerField
      FieldName = 'Comp_Quantity'
    end
    object ADO686Layers: TStringField
      FieldName = 'Layers'
      Size = 5
    end
    object ADO686Tot_PNL: TIntegerField
      FieldName = 'Tot_PNL'
    end
    object ADO686Tot_PAS: TIntegerField
      FieldName = 'Tot_PAS'
    end
    object ADO686PNL: TIntegerField
      FieldName = 'PNL'
    end
    object ADO686Tot_PCS: TIntegerField
      FieldName = 'Tot_PCS'
    end
    object ADO686PCS_Pas: TIntegerField
      FieldName = 'PCS_Pas'
    end
    object ADO686Tot_Quantity: TIntegerField
      FieldName = 'Tot_Quantity'
    end
    object ADO686Result: TStringField
      FieldName = 'Result'
      Size = 100
    end
    object ADO686Remark: TStringField
      FieldName = 'Remark'
      Size = 200
    end
  end
  object ADO686_1: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'rkey686'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     Rkey, Record_No, Cust_Ptr, Dep_Ptr, Rec_date, Machine' +
        '_No, Runs, Emp_In_Ptr, In_Time, Out_Time, Type, outer_inside, Co' +
        'mp_Quantity, Layers, '
      
        '                      Tot_PNL, Tot_PAS, PNL, Tot_PCS, PCS_Pas, T' +
        'ot_Quantity, Result, Remark'
      'FROM         dbo.Data0686'
      'WHERE Rkey = :rkey686')
    Left = 176
    Top = 96
  end
  object ADO687: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'SELECT     Rkey, rec_ptr, Problem_ptr, LOT_No, quantity, Remark'
      'FROM         dbo.Data0687')
    Left = 104
    Top = 176
    object ADO687Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object ADO687rec_ptr: TIntegerField
      FieldName = 'rec_ptr'
    end
    object ADO687Problem_ptr: TIntegerField
      FieldName = 'Problem_ptr'
    end
    object ADO687LOT_No: TStringField
      FieldName = 'LOT_No'
      Size = 50
    end
    object ADO687quantity: TIntegerField
      FieldName = 'quantity'
    end
    object ADO687Remark: TStringField
      FieldName = 'Remark'
      Size = 200
    end
  end
  object ADO687_1: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'rkey687'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT     Rkey, rec_ptr, Problem_ptr, LOT_No, quantity, Remark'
      'FROM         dbo.Data0687'
      'WHERE rkey= :rkey687')
    Left = 176
    Top = 176
  end
  object ADOQuery5: TADOQuery
    Parameters = <>
    Left = 104
    Top = 248
  end
  object ADOQuery6: TADOQuery
    Parameters = <>
    Left = 176
    Top = 248
  end
  object DataSource1: TDataSource
    DataSet = ADO686
    Left = 32
    Top = 96
  end
  object DataSource2: TDataSource
    DataSet = ADO687
    Left = 32
    Top = 176
  end
end
