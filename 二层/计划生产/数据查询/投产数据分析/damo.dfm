object dm: Tdm
  OldCreateOrder = True
  Left = 343
  Top = 243
  Height = 285
  Width = 340
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 16
  end
  object ds492: TDataSource
    DataSet = aq492
    Left = 72
    Top = 96
  end
  object aq492: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select top 1 PERCENT SUM'
      '(case when D492.upanel1 >0 then D492.ISSUED_QTY*'
      
        'cast(substring(pnl1_size,1,CHARINDEX('#39'*'#39',pnl1_size)-4) as money)' +
        '*'
      
        'cast(substring(pnl1_size,CHARINDEX('#39'*'#39',pnl1_size)+2,len(pnl1_siz' +
        'e)-'
      '(CHARINDEX('#39'*'#39',pnl1_size)+3)) as money)*0.000001/d492.upanel1'
      'when d492.upanel2 >0 then d492.ISSUED_QTY*'
      
        'cast(substring(pnl2_size,1,CHARINDEX('#39'*'#39',pnl2_size)-4) as money)' +
        '*'
      
        'cast(substring(pnl2_size,CHARINDEX('#39'*'#39',pnl2_size)+2,len(pnl2_siz' +
        'e)-'
      '(CHARINDEX('#39'*'#39',pnl2_size)+3)) as money)*0.000001/d492.upanel2'
      
        'else D25.unit_sq * d492.ISSUED_QTY end) as area1_1,d25.manu_part' +
        '_number as code,d25.manu_part_desc as name,'
      
        'SUM(d492.ISSUED_QTY) as pcs,SUM(d492.ISSUED_QTY*D25.unit_sq) as ' +
        'area,'
      
        'sum(d492.ord_req_qty) as ord_pcs,sum(d492.ord_req_qty*D25.unit_s' +
        'q) as ord_area    '
      
        'from data0492 d492 inner join data0025 d25 on d492.bom_ptr=d25.r' +
        'key '
      
        'inner join data0010 d10 on d25.customer_ptr=d10.rkey inner join ' +
        'data0008 d08 '
      'on d25.prod_code_ptr=d08.rkey where 1=1  and d25.parent_ptr>0  '
      'and d492.issue_date>='#39'2008-6-1'#39' and d492.issue_date<='#39'2008-7-2'#39' '
      'group by d25.manu_part_number,d25.manu_part_desc  '
      'order by area desc,d25.manu_part_number')
    Left = 8
    Top = 96
    object aq492code: TStringField
      DisplayWidth = 10
      FieldName = 'code'
      Size = 16
    end
    object aq492name: TStringField
      DisplayWidth = 50
      FieldName = 'name'
      Size = 40
    end
    object aq492pcs: TIntegerField
      DisplayWidth = 20
      FieldName = 'pcs'
      ReadOnly = True
    end
    object aq492area: TFloatField
      DisplayWidth = 20
      FieldName = 'area'
      ReadOnly = True
    end
    object aq492ord_pcs: TIntegerField
      FieldName = 'ord_pcs'
      ReadOnly = True
    end
    object aq492ord_area: TFloatField
      FieldName = 'ord_area'
      ReadOnly = True
    end
    object aq492area1_1: TFloatField
      FieldName = 'area1_1'
      ReadOnly = True
    end
  end
  object aqtmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 8
    Top = 168
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    SQL.Strings = (
      ', SUM'
      '(case when D492.upanel1 >0 then D492.ISSUED_QTY*'
      
        'cast(substring(pnl1_size,1,CHARINDEX('#39'*'#39',pnl1_size)-4) as money)' +
        '*'
      
        'cast(substring(pnl1_size,CHARINDEX('#39'*'#39',pnl1_size)+2,len(pnl1_siz' +
        'e)-'
      '(CHARINDEX('#39'*'#39',pnl1_size)+3)) as money)*0.000001/d492.upanel1'
      'when d492.upanel2 >0 then d492.ISSUED_QTY*'
      
        'cast(substring(pnl2_size,1,CHARINDEX('#39'*'#39',pnl2_size)-4) as money)' +
        '*'
      
        'cast(substring(pnl2_size,CHARINDEX('#39'*'#39',pnl2_size)+2,len(pnl2_siz' +
        'e)-'
      '(CHARINDEX('#39'*'#39',pnl2_size)+3)) as money)*0.000001/d492.upanel2'
      'else D25.unit_sq * d492.ISSUED_QTY end) as area1_1')
    Left = 168
    Top = 160
  end
end
