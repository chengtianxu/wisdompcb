object TDM: TTDM
  OldCreateOrder = False
  Left = 547
  Top = 228
  Height = 291
  Width = 318
  object ADOConn: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security In' +
      'fo=True;User ID=WZPCBConnect;Initial Catalog=sj_v20_live;Data So' +
      'urce=172.16.0.8'
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 24
  end
  object Adods224: TADODataSet
    Connection = ADOConn
    CommandText = 
      'select Rkey,d0223_PTR,d0160_Prt,StockDrill,Difference_Number,sTy' +
      'pe from dbo.data0224 '#13#10'where d0223_PTR=:d223'
    Parameters = <
      item
        Name = 'd223'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 104
    Top = 152
  end
  object Adosd220: TADODataSet
    Connection = ADOConn
    CommandText = 
      'select dbo.data0160.Location_code,dbo.data0160.Location_Name,dbo' +
      '.data0160.type,dbo.data0220.inventory_ptr,sum(dbo.data0220.Quant' +
      'ity) as iSum '#13#10'from dbo.data0220 left join dbo.data0160 on dbo.d' +
      'ata0160.Rkey=dbo.data0220.Location_Ptr '#13#10'inner JOIN dbo.data0219' +
      ' on dbo.data0220.GRN_Ptr=dbo.data0219.Rkey'#13#10'where exists(select ' +
      'distinct Location_ptr from dbo.data0220) and dbo.data0219.TType=' +
      ':TType '#13#10'and dbo.data0219.CREATE_DATE>=:dBeinDate and dbo.data02' +
      '19.CREATE_DATE<=:dEndDate'#13#10'and (dbo.data0219.REMARK='#39#39' OR dbo.da' +
      'ta0219.REMARK=NUll)'#13#10'group by dbo.data0160.Location_code,dbo.dat' +
      'a0160.Location_Name,dbo.data0160.type,dbo.data0220.inventory_ptr'
    Parameters = <
      item
        Name = 'TType'
        Size = -1
        Value = Null
      end
      item
        Name = 'dBeinDate'
        Size = -1
        Value = Null
      end
      item
        Name = 'dEndDate'
        Size = -1
        Value = Null
      end>
    Left = 104
    Top = 88
  end
  object Ado0223: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'D1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'D2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'select * from dbo.data0223'
      'where dBeginDate>=:D1 and dEndDate<=:D2')
    Left = 184
    Top = 152
    object Ado0223Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object Ado0223Data0017_prt: TIntegerField
      FieldName = 'Data0017_prt'
    end
    object Ado0223StockDrill: TIntegerField
      FieldName = 'StockDrill'
    end
    object Ado0223dBeginDate: TDateTimeField
      FieldName = 'dBeginDate'
    end
    object Ado0223dEndDate: TDateTimeField
      FieldName = 'dEndDate'
    end
    object Ado0223dDate: TDateTimeField
      FieldName = 'dDate'
    end
    object Ado0223dMonth: TIntegerField
      FieldName = 'dMonth'
    end
    object Ado0223Data0005_Prt: TIntegerField
      FieldName = 'Data0005_Prt'
      OnGetText = Ado0223Status05_PtrGetText
    end
    object Ado0223iStatus: TIntegerField
      FieldName = 'iStatus'
      OnGetText = Ado0223iStatusGetText
    end
    object Ado0223Status05_Ptr: TIntegerField
      FieldName = 'Status05_Ptr'
      OnGetText = Ado0223Status05_PtrGetText
    end
    object Ado0223dStatusDate: TDateTimeField
      FieldName = 'dStatusDate'
    end
    object Ado0223Remark: TStringField
      FieldName = 'Remark'
      Size = 50
    end
  end
  object DataSource1: TDataSource
    DataSet = Ado0223
    Left = 256
    Top = 152
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 176
    Top = 88
  end
  object ado04: TADOQuery
    Connection = ADOConn
    Parameters = <>
    SQL.Strings = (
      'select SEED_VALUE,SEED_FLAG from data0004'
      'where rkey=63')
    Left = 149
    Top = 13
    object ado04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object ado04SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
  end
end
