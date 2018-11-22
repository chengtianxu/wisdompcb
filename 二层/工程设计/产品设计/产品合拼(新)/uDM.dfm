object DM: TDM
  OldCreateOrder = False
  Left = 357
  Top = 209
  Height = 330
  Width = 492
  object con1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 56
    Top = 32
  end
  object aq60: TADOQuery
    Connection = con1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        'exec PCBJointLayout '#39' and DATEDIFF(DAY,Convert(varchar(10),getda' +
        'te(),120),Data0060.ENT_DATE)>=-3  '#39)
    Left = 152
    Top = 32
  end
  object qryTmp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 280
    Top = 48
  end
  object ds60: TDataSource
    DataSet = aq60
    Left = 200
    Top = 33
  end
  object aqParamList: TADOQuery
    Connection = con1
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select t278.PARAMETER_NAME'
      
        'from SpellCondition t0 inner join Data0278 t278 on t0.Param_PTR=' +
        't278.RKEY '
      
        'where CalcValueType=0 and IsNULL(IsDifferent,0)=1 order by seqNo' +
        ';')
    Left = 64
    Top = 128
  end
  object aqOrderChosen: TADOQuery
    Connection = con1
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 152
    Top = 128
  end
  object dsOrderChosen: TDataSource
    DataSet = aqOrderChosen
    Left = 224
    Top = 128
  end
end
