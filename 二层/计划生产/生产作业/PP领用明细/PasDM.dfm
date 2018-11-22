object DM: TDM
  OldCreateOrder = False
  Left = 499
  Top = 219
  Height = 392
  Width = 368
  object ADOConnection1: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 80
    Top = 40
  end
  object Ado734: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT case dbo.DATA0734.ttype when 0 then '#39#27491#24120#39046#26009#39' when 1 then '#39#25439 +
        #32791#39046#26009#39' end as ttype, '
      
        '      dbo.DATA0734.pick_mater_qty, dbo.DATA0734.create_date, dbo' +
        '.Data0005.EMPLOYEE_NAME, '
      
        '      Data0005_1.EMPLOYEE_NAME AS Expr1, dbo.Data0006.WORK_ORDER' +
        '_NUMBER, dbo.Data0017.INV_PART_NUMBER, '
      
        '      dbo.Data0017.INV_NAME,dbo.DATA0734.user_ptr,dbo.DATA0734.c' +
        'reate_ptr,'
      
        '      dbo.data0734.Rkey,dbo.DATA0734.rkey732,dbo.data0734.rkey73' +
        '3,dbo.data0731.Rkey as rkey731 '
      'FROM dbo.DATA0734 INNER JOIN'
      
        #9' dbo.Data0005 ON dbo.DATA0734.user_ptr = dbo.Data0005.RKEY INNE' +
        'R JOIN'
      
        #9' dbo.Data0005 AS Data0005_1 ON dbo.DATA0734.create_ptr = Data00' +
        '05_1.RKEY INNER JOIN'
      
        #9' dbo.DATA0732 ON dbo.DATA0734.rkey732 = dbo.DATA0732.rkey INNER' +
        ' JOIN'
      
        '     dbo.data0731 on dbo.data0732.rkey731=dbo.data0731.Rkey inne' +
        'r join'
      
        '     dbo.data0733 on dbo.data0734.rkey733=dbo.data0733.Rkey inne' +
        'r join'
      
        #9' dbo.Data0006 ON dbo.DATA0732.rkey06 = dbo.Data0006.RKEY INNER ' +
        'JOIN'
      #9' dbo.Data0017 ON dbo.DATA0732.rkey17 = dbo.Data0017.RKEY')
    Left = 208
    Top = 40
    object Ado734ttype: TStringField
      FieldName = 'ttype'
      ReadOnly = True
      Size = 8
    end
    object Ado734pick_mater_qty: TIntegerField
      FieldName = 'pick_mater_qty'
    end
    object Ado734create_date: TDateTimeField
      FieldName = 'create_date'
    end
    object Ado734EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object Ado734Expr1: TStringField
      FieldName = 'Expr1'
      Size = 16
    end
    object Ado734WORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object Ado734INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object Ado734INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object Ado734user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object Ado734create_ptr: TIntegerField
      FieldName = 'create_ptr'
    end
    object Ado734Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object Ado734rkey732: TIntegerField
      FieldName = 'rkey732'
    end
    object Ado734rkey733: TIntegerField
      FieldName = 'rkey733'
    end
    object Ado734rkey731: TIntegerField
      FieldName = 'rkey731'
      ReadOnly = True
    end
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 208
    Top = 120
  end
  object Ado732: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT  Cast(0 as tinyint) as IsSelected,dbo.Data0025.MANU_PART_' +
        'NUMBER, dbo.Data0025.MANU_PART_DESC, dbo.Data0034.DEPT_CODE, dbo' +
        '.Data0034.DEPT_NAME, '
      
        '      dbo.Data0006.WORK_ORDER_NUMBER, dbo.Data0017.INV_PART_NUMB' +
        'ER, dbo.Data0017.INV_NAME, '
      
        '      case dbo.DATA0731.TTYPE when 0 then '#39#27491#24120#37197#26009#21333#39' when 1 then '#39#34917 +
        #26009#37197#26009#21333#39' end as TTYPE731, '
      
        '      dbo.DATA0731.manuf_qty as manuf_qty731, dbo.DATA0731.panel' +
        '_qty as panel_qty731, dbo.DATA0731.pp_quota_len as pp_quota_len7' +
        '31, dbo.DATA0731.lam2, dbo.DATA0731.lam_ty_gp, '
      
        '      dbo.DATA0732.manuf_qty AS manuf_qty732, dbo.DATA0732.pp_qu' +
        'ota, dbo.DATA0732.panel_qty AS panel_qty732, dbo.DATA0732.panel_' +
        'ln, dbo.DATA0732.panel_wd, '
      
        '      dbo.DATA0732.PP_TYP, dbo.DATA0732.pp_rc, dbo.DATA0732.pp_t' +
        'g, dbo.DATA0732.pp_quota_len AS pp_quota_len732, dbo.DATA0732.pp' +
        '_quota_roll, '
      
        '      case dbo.DATA0731.TSTATUS when 0 then '#39#26410#30830#35748#39' when 1 then '#39#24050 +
        #30830#35748#39' end as TSTATUS,'
      
        '      case dbo.DATA0732.qg_flag when 0 then '#39#26410#20999#21106#39' when 1 then '#39#24050 +
        #20999#21106#39' end as qg_flag, '
      
        '      case dbo.DATA0732.matrece_flag  when 0 then '#39#26410#39046#26009#39' when 1 t' +
        'hen '#39#24050#39046#26009#39' end as matrece_flag,'
      
        '      dbo.data0025.layers_info,dbo.data0025.layers_image,dbo.DAT' +
        'A0732.Rkey as Rkey732,dbo.DATA0731.RKey as Rkey731,dbo.data0733.' +
        'rkey as Rkey733'
      'FROM  dbo.DATA0732 INNER JOIN'
      
        '      dbo.DATA0731 ON dbo.DATA0732.rkey731 = dbo.DATA0731.rkey I' +
        'NNER JOIN'
      
        '      dbo.Data0025 ON dbo.DATA0731.rkey25 = dbo.Data0025.RKEY IN' +
        'NER JOIN'
      
        '      dbo.Data0034 ON dbo.DATA0731.dept_ptr = dbo.Data0034.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0006 ON dbo.DATA0732.rkey06 = dbo.Data0006.RKEY IN' +
        'NER JOIN'
      
        '      dbo.Data0017 ON dbo.DATA0732.rkey17 = dbo.Data0017.RKEY in' +
        'ner join'
      '     dbo.data0733 on dbo.data0732.Rkey733=dbo.data0733.Rkey'
      'where dbo.data0732.qg_flag=1 and dbo.data0732.matrece_flag=0'
      'and  dbo.Data0006.WORK_ORDER_NUMBER=:NUMBER')
    Left = 272
    Top = 192
    object Ado732IsSelected: TWordField
      FieldName = 'IsSelected'
    end
    object Ado732MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
      ReadOnly = True
    end
    object Ado732MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      ReadOnly = True
      Size = 80
    end
    object Ado732DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      ReadOnly = True
      Size = 10
    end
    object Ado732DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      ReadOnly = True
      Size = 30
    end
    object Ado732WORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      ReadOnly = True
      Size = 22
    end
    object Ado732INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      ReadOnly = True
      Size = 25
    end
    object Ado732INV_NAME: TStringField
      FieldName = 'INV_NAME'
      ReadOnly = True
      Size = 30
    end
    object Ado732TTYPE731: TStringField
      FieldName = 'TTYPE731'
      Size = 10
    end
    object Ado732manuf_qty731: TIntegerField
      FieldName = 'manuf_qty731'
      ReadOnly = True
    end
    object Ado732panel_qty731: TIntegerField
      FieldName = 'panel_qty731'
      ReadOnly = True
    end
    object Ado732pp_quota_len731: TBCDField
      FieldName = 'pp_quota_len731'
      ReadOnly = True
      Precision = 10
      Size = 5
    end
    object Ado732lam2: TStringField
      FieldName = 'lam2'
      ReadOnly = True
      Size = 30
    end
    object Ado732lam_ty_gp: TStringField
      FieldName = 'lam_ty_gp'
      ReadOnly = True
      Size = 30
    end
    object Ado732manuf_qty732: TIntegerField
      FieldName = 'manuf_qty732'
      ReadOnly = True
    end
    object Ado732pp_quota: TIntegerField
      FieldName = 'pp_quota'
      ReadOnly = True
    end
    object Ado732panel_qty732: TIntegerField
      FieldName = 'panel_qty732'
      ReadOnly = True
    end
    object Ado732panel_ln: TBCDField
      FieldName = 'panel_ln'
      ReadOnly = True
      Precision = 7
      Size = 2
    end
    object Ado732panel_wd: TBCDField
      FieldName = 'panel_wd'
      ReadOnly = True
      Precision = 7
      Size = 2
    end
    object Ado732PP_TYP: TStringField
      FieldName = 'PP_TYP'
      ReadOnly = True
      Size = 30
    end
    object Ado732pp_rc: TStringField
      FieldName = 'pp_rc'
      ReadOnly = True
      Size = 30
    end
    object Ado732pp_tg: TStringField
      FieldName = 'pp_tg'
      ReadOnly = True
      Size = 30
    end
    object Ado732pp_quota_len732: TBCDField
      FieldName = 'pp_quota_len732'
      ReadOnly = True
      Precision = 10
      Size = 5
    end
    object Ado732pp_quota_roll: TBCDField
      FieldName = 'pp_quota_roll'
      ReadOnly = True
      Precision = 10
      Size = 5
    end
    object Ado732TSTATUS: TStringField
      FieldName = 'TSTATUS'
      ReadOnly = True
      Size = 6
    end
    object Ado732qg_flag: TStringField
      FieldName = 'qg_flag'
      ReadOnly = True
      Size = 6
    end
    object Ado732matrece_flag: TStringField
      FieldName = 'matrece_flag'
      ReadOnly = True
      Size = 6
    end
    object Ado732layers_info: TMemoField
      FieldName = 'layers_info'
      ReadOnly = True
      BlobType = ftMemo
    end
    object Ado732layers_image: TBlobField
      FieldName = 'layers_image'
      ReadOnly = True
    end
    object Ado732Rkey732: TAutoIncField
      FieldName = 'Rkey732'
      ReadOnly = True
    end
    object Ado732Rkey731: TAutoIncField
      FieldName = 'Rkey731'
      ReadOnly = True
    end
    object Ado732Rkey733: TAutoIncField
      FieldName = 'Rkey733'
      ReadOnly = True
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Ado732
    Left = 192
    Top = 192
  end
  object cds732: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'NUMBER'
        ParamType = ptUnknown
      end>
    ProviderName = 'DataSetProvider1'
    Left = 104
    Top = 192
    object cds732IsSelected: TSmallintField
      FieldName = 'IsSelected'
    end
    object cds732MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
      ReadOnly = True
    end
    object cds732MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      ReadOnly = True
      Size = 80
    end
    object cds732DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      ReadOnly = True
      Size = 10
    end
    object cds732DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      ReadOnly = True
      Size = 30
    end
    object cds732WORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      ReadOnly = True
      Size = 22
    end
    object cds732INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      ReadOnly = True
      Size = 25
    end
    object cds732INV_NAME: TStringField
      FieldName = 'INV_NAME'
      ReadOnly = True
      Size = 30
    end
    object cds732TTYPE731: TStringField
      FieldName = 'TTYPE731'
      Size = 10
    end
    object cds732manuf_qty731: TIntegerField
      FieldName = 'manuf_qty731'
      ReadOnly = True
    end
    object cds732panel_qty731: TIntegerField
      FieldName = 'panel_qty731'
      ReadOnly = True
    end
    object cds732pp_quota_len731: TBCDField
      FieldName = 'pp_quota_len731'
      ReadOnly = True
      Precision = 10
      Size = 5
    end
    object cds732lam2: TStringField
      FieldName = 'lam2'
      ReadOnly = True
      Size = 30
    end
    object cds732lam_ty_gp: TStringField
      FieldName = 'lam_ty_gp'
      ReadOnly = True
      Size = 30
    end
    object cds732manuf_qty732: TIntegerField
      FieldName = 'manuf_qty732'
      ReadOnly = True
    end
    object cds732pp_quota: TIntegerField
      FieldName = 'pp_quota'
      ReadOnly = True
    end
    object cds732panel_qty732: TIntegerField
      FieldName = 'panel_qty732'
      ReadOnly = True
    end
    object cds732panel_ln: TBCDField
      FieldName = 'panel_ln'
      ReadOnly = True
      Precision = 7
      Size = 2
    end
    object cds732panel_wd: TBCDField
      FieldName = 'panel_wd'
      ReadOnly = True
      Precision = 7
      Size = 2
    end
    object cds732PP_TYP: TStringField
      FieldName = 'PP_TYP'
      ReadOnly = True
      Size = 30
    end
    object cds732pp_rc: TStringField
      FieldName = 'pp_rc'
      ReadOnly = True
      Size = 30
    end
    object cds732pp_tg: TStringField
      FieldName = 'pp_tg'
      ReadOnly = True
      Size = 30
    end
    object cds732pp_quota_len732: TBCDField
      FieldName = 'pp_quota_len732'
      ReadOnly = True
      Precision = 10
      Size = 5
    end
    object cds732pp_quota_roll: TBCDField
      FieldName = 'pp_quota_roll'
      ReadOnly = True
      Precision = 10
      Size = 5
    end
    object cds732TSTATUS: TStringField
      FieldName = 'TSTATUS'
      ReadOnly = True
      Size = 6
    end
    object cds732qg_flag: TStringField
      FieldName = 'qg_flag'
      ReadOnly = True
      Size = 6
    end
    object cds732matrece_flag: TStringField
      FieldName = 'matrece_flag'
      ReadOnly = True
      Size = 6
    end
    object cds732layers_info: TMemoField
      FieldName = 'layers_info'
      ReadOnly = True
      BlobType = ftMemo
    end
    object cds732layers_image: TBlobField
      FieldName = 'layers_image'
      ReadOnly = True
    end
    object cds732Rkey732: TAutoIncField
      FieldName = 'Rkey732'
      ReadOnly = True
    end
    object cds732Rkey731: TAutoIncField
      FieldName = 'Rkey731'
      ReadOnly = True
    end
    object cds732Rkey733: TAutoIncField
      FieldName = 'Rkey733'
      ReadOnly = True
    end
  end
  object Ado734s: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from dbo.data0734')
    Left = 272
    Top = 40
    object Ado734srkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object Ado734srkey732: TIntegerField
      FieldName = 'rkey732'
    end
    object Ado734srkey733: TIntegerField
      FieldName = 'rkey733'
    end
    object Ado734suser_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object Ado734screate_ptr: TIntegerField
      FieldName = 'create_ptr'
    end
    object Ado734screate_date: TDateTimeField
      FieldName = 'create_date'
    end
    object Ado734sttype: TWordField
      FieldName = 'ttype'
    end
    object Ado734spick_mater_qty: TIntegerField
      FieldName = 'pick_mater_qty'
    end
  end
  object Ado732hao: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'NUMBER'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 22
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT  Cast(0 as tinyint) as IsSelected,dbo.Data0025.MANU_PART_' +
        'NUMBER, dbo.Data0025.MANU_PART_DESC, dbo.Data0034.DEPT_CODE, dbo' +
        '.Data0034.DEPT_NAME, '
      
        '      dbo.Data0006.WORK_ORDER_NUMBER, dbo.Data0017.INV_PART_NUMB' +
        'ER, dbo.Data0017.INV_NAME, '
      
        '      case dbo.DATA0731.TTYPE when 0 then '#39#27491#24120#37197#26009#21333#39' when 1 then '#39#34917 +
        #26009#37197#26009#21333#39' end as TTYPE731, '
      
        '      dbo.DATA0731.manuf_qty as manuf_qty731, dbo.DATA0731.panel' +
        '_qty as panel_qty731, dbo.DATA0731.pp_quota_len as pp_quota_len7' +
        '31, dbo.DATA0731.lam2, dbo.DATA0731.lam_ty_gp, '
      
        '      dbo.DATA0732.manuf_qty AS manuf_qty732, dbo.DATA0732.pp_qu' +
        'ota, dbo.DATA0732.panel_qty AS panel_qty732, dbo.DATA0732.panel_' +
        'ln, dbo.DATA0732.panel_wd, '
      
        '      dbo.DATA0732.PP_TYP, dbo.DATA0732.pp_rc, dbo.DATA0732.pp_t' +
        'g, dbo.DATA0732.pp_quota_len AS pp_quota_len732, dbo.DATA0732.pp' +
        '_quota_roll, '
      
        '      case dbo.DATA0731.TSTATUS when 0 then '#39#26410#30830#35748#39' when 1 then '#39#24050 +
        #30830#35748#39' end as TSTATUS,'
      
        '      case dbo.DATA0732.qg_flag when 0 then '#39#26410#20999#21106#39' when 1 then '#39#24050 +
        #20999#21106#39' end as qg_flag, '
      
        '      case dbo.DATA0732.matrece_flag  when 0 then '#39#26410#39046#26009#39' when 1 t' +
        'hen '#39#24050#39046#26009#39' end as matrece_flag,'
      
        '      dbo.data0025.layers_info,dbo.data0025.layers_image,dbo.DAT' +
        'A0732.Rkey as Rkey732,dbo.DATA0731.RKey as Rkey731,dbo.data0733.' +
        'rkey as Rkey733,dbo.data0733.*'
      'FROM  dbo.DATA0732 INNER JOIN'
      
        '      dbo.DATA0731 ON dbo.DATA0732.rkey731 = dbo.DATA0731.rkey I' +
        'NNER JOIN'
      
        '      dbo.Data0025 ON dbo.DATA0731.rkey25 = dbo.Data0025.RKEY IN' +
        'NER JOIN'
      
        '      dbo.Data0034 ON dbo.DATA0731.dept_ptr = dbo.Data0034.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0006 ON dbo.DATA0732.rkey06 = dbo.Data0006.RKEY IN' +
        'NER JOIN'
      
        '      dbo.Data0017 ON dbo.DATA0732.rkey17 = dbo.Data0017.RKEY in' +
        'ner join'
      '     dbo.data0733 on dbo.data0732.Rkey733=dbo.data0733.Rkey'
      
        'where dbo.data0732.qg_flag=1 and dbo.data0732.matrece_flag=1  an' +
        'd dbo.data0731.ttype=0'
      'and  dbo.Data0006.WORK_ORDER_NUMBER=:NUMBER')
    Left = 272
    Top = 256
    object Ado732haoIsSelected: TWordField
      FieldName = 'IsSelected'
    end
    object Ado732haoMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
      ReadOnly = True
    end
    object Ado732haoMANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      ReadOnly = True
      Size = 80
    end
    object Ado732haoDEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      ReadOnly = True
      Size = 10
    end
    object Ado732haoDEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      ReadOnly = True
      Size = 30
    end
    object Ado732haoWORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      ReadOnly = True
      Size = 22
    end
    object Ado732haoINV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      ReadOnly = True
      Size = 25
    end
    object Ado732haoINV_NAME: TStringField
      FieldName = 'INV_NAME'
      ReadOnly = True
      Size = 30
    end
    object Ado732haoTTYPE731: TStringField
      FieldName = 'TTYPE731'
      ReadOnly = True
      Size = 10
    end
    object Ado732haomanuf_qty731: TIntegerField
      FieldName = 'manuf_qty731'
      ReadOnly = True
    end
    object Ado732haopanel_qty731: TIntegerField
      FieldName = 'panel_qty731'
      ReadOnly = True
    end
    object Ado732haopp_quota_len731: TBCDField
      FieldName = 'pp_quota_len731'
      ReadOnly = True
      Precision = 10
      Size = 5
    end
    object Ado732haolam2: TStringField
      FieldName = 'lam2'
      ReadOnly = True
      Size = 30
    end
    object Ado732haolam_ty_gp: TStringField
      FieldName = 'lam_ty_gp'
      ReadOnly = True
      Size = 30
    end
    object Ado732haomanuf_qty732: TIntegerField
      FieldName = 'manuf_qty732'
      ReadOnly = True
    end
    object Ado732haopp_quota: TIntegerField
      FieldName = 'pp_quota'
      ReadOnly = True
    end
    object Ado732haopanel_qty732: TIntegerField
      FieldName = 'panel_qty732'
      ReadOnly = True
    end
    object Ado732haopanel_ln: TBCDField
      FieldName = 'panel_ln'
      ReadOnly = True
      Precision = 7
      Size = 2
    end
    object Ado732haopanel_wd: TBCDField
      FieldName = 'panel_wd'
      ReadOnly = True
      Precision = 7
      Size = 2
    end
    object Ado732haoPP_TYP: TStringField
      FieldName = 'PP_TYP'
      ReadOnly = True
      Size = 30
    end
    object Ado732haopp_rc: TStringField
      FieldName = 'pp_rc'
      ReadOnly = True
      Size = 30
    end
    object Ado732haopp_tg: TStringField
      FieldName = 'pp_tg'
      ReadOnly = True
      Size = 30
    end
    object Ado732haopp_quota_len732: TBCDField
      FieldName = 'pp_quota_len732'
      ReadOnly = True
      Precision = 10
      Size = 5
    end
    object Ado732haopp_quota_roll: TBCDField
      FieldName = 'pp_quota_roll'
      ReadOnly = True
      Precision = 10
      Size = 5
    end
    object Ado732haoTSTATUS: TStringField
      FieldName = 'TSTATUS'
      ReadOnly = True
      Size = 6
    end
    object Ado732haoqg_flag: TStringField
      FieldName = 'qg_flag'
      ReadOnly = True
      Size = 6
    end
    object Ado732haomatrece_flag: TStringField
      FieldName = 'matrece_flag'
      ReadOnly = True
      Size = 6
    end
    object Ado732haolayers_info: TMemoField
      FieldName = 'layers_info'
      ReadOnly = True
      BlobType = ftMemo
    end
    object Ado732haolayers_image: TBlobField
      FieldName = 'layers_image'
      ReadOnly = True
    end
    object Ado732haoRkey732: TAutoIncField
      FieldName = 'Rkey732'
      ReadOnly = True
    end
    object Ado732haoRkey731: TAutoIncField
      FieldName = 'Rkey731'
      ReadOnly = True
    end
    object Ado732haoRkey733: TAutoIncField
      FieldName = 'Rkey733'
      ReadOnly = True
    end
    object Ado732haorkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object Ado732haoTYPE: TWordField
      FieldName = 'TYPE'
    end
    object Ado732haoempl_ptr: TIntegerField
      FieldName = 'empl_ptr'
    end
    object Ado732haocreate_empl_ptr: TIntegerField
      FieldName = 'create_empl_ptr'
    end
    object Ado732haocreare_date: TDateTimeField
      FieldName = 'creare_date'
    end
    object Ado732haorkey25: TIntegerField
      FieldName = 'rkey25'
    end
    object Ado732haolam2_1: TStringField
      FieldName = 'lam2_1'
      Size = 30
    end
    object Ado732haolam_ty_gp_1: TStringField
      FieldName = 'lam_ty_gp_1'
      Size = 30
    end
    object Ado732haorkey17: TIntegerField
      FieldName = 'rkey17'
    end
    object Ado732haopanel_ln_1: TBCDField
      FieldName = 'panel_ln_1'
      Precision = 7
      Size = 2
    end
    object Ado732haopanel_wd_1: TBCDField
      FieldName = 'panel_wd_1'
      Precision = 7
      Size = 2
    end
    object Ado732haomanuf_qty: TIntegerField
      FieldName = 'manuf_qty'
    end
    object Ado732haopanel_qty: TIntegerField
      FieldName = 'panel_qty'
    end
    object Ado732haopp_quota_len: TBCDField
      FieldName = 'pp_quota_len'
      Precision = 10
      Size = 5
    end
    object Ado732haopp_quota_roll_1: TBCDField
      FieldName = 'pp_quota_roll_1'
      Precision = 10
      Size = 5
    end
    object Ado732haoremark: TWideStringField
      FieldName = 'remark'
      Size = 100
    end
    object Ado732haorkey733_1: TIntegerField
      FieldName = 'rkey733_1'
    end
    object Ado732haopanel_qty_e: TIntegerField
      FieldName = 'panel_qty_e'
    end
    object Ado732haopp_quota_len_e: TBCDField
      FieldName = 'pp_quota_len_e'
      Precision = 10
      Size = 5
    end
    object Ado732haopp_quota_roll_e: TBCDField
      FieldName = 'pp_quota_roll_e'
      Precision = 10
      Size = 5
    end
    object Ado732haopick_material_qty: TIntegerField
      FieldName = 'pick_material_qty'
    end
    object Ado732haopick_material_qty_e: TIntegerField
      FieldName = 'pick_material_qty_e'
    end
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = Ado732hao
    Left = 192
    Top = 256
  end
  object cds732hao: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'NUMBER'
        ParamType = ptUnknown
      end>
    ProviderName = 'DataSetProvider2'
    Left = 96
    Top = 256
    object cds732haoIsSelected: TSmallintField
      FieldName = 'IsSelected'
      ReadOnly = True
    end
    object cds732haoMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object cds732haoMANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object cds732haoDEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object cds732haoDEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object cds732haoWORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object cds732haoINV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object cds732haoINV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object cds732haoTTYPE731: TStringField
      FieldName = 'TTYPE731'
      ReadOnly = True
      Size = 10
    end
    object cds732haomanuf_qty731: TIntegerField
      FieldName = 'manuf_qty731'
    end
    object cds732haopanel_qty731: TIntegerField
      FieldName = 'panel_qty731'
    end
    object cds732haopp_quota_len731: TBCDField
      FieldName = 'pp_quota_len731'
      Precision = 10
      Size = 5
    end
    object cds732haolam2: TStringField
      FieldName = 'lam2'
      Size = 30
    end
    object cds732haolam_ty_gp: TStringField
      FieldName = 'lam_ty_gp'
      Size = 30
    end
    object cds732haomanuf_qty732: TIntegerField
      FieldName = 'manuf_qty732'
    end
    object cds732haopp_quota: TIntegerField
      FieldName = 'pp_quota'
    end
    object cds732haopanel_qty732: TIntegerField
      FieldName = 'panel_qty732'
    end
    object cds732haopanel_ln: TBCDField
      FieldName = 'panel_ln'
      Precision = 7
      Size = 2
    end
    object cds732haopanel_wd: TBCDField
      FieldName = 'panel_wd'
      Precision = 7
      Size = 2
    end
    object cds732haoPP_TYP: TStringField
      FieldName = 'PP_TYP'
      Size = 30
    end
    object cds732haopp_rc: TStringField
      FieldName = 'pp_rc'
      Size = 30
    end
    object cds732haopp_tg: TStringField
      FieldName = 'pp_tg'
      Size = 30
    end
    object cds732haopp_quota_len732: TBCDField
      FieldName = 'pp_quota_len732'
      Precision = 10
      Size = 5
    end
    object cds732haopp_quota_roll: TBCDField
      FieldName = 'pp_quota_roll'
      Precision = 10
      Size = 5
    end
    object cds732haoTSTATUS: TStringField
      FieldName = 'TSTATUS'
      ReadOnly = True
      Size = 6
    end
    object cds732haoqg_flag: TStringField
      FieldName = 'qg_flag'
      ReadOnly = True
      Size = 6
    end
    object cds732haomatrece_flag: TStringField
      FieldName = 'matrece_flag'
      ReadOnly = True
      Size = 6
    end
    object cds732haolayers_info: TMemoField
      FieldName = 'layers_info'
      BlobType = ftMemo
    end
    object cds732haolayers_image: TBlobField
      FieldName = 'layers_image'
    end
    object cds732haoRkey732: TAutoIncField
      FieldName = 'Rkey732'
      ReadOnly = True
    end
    object cds732haoRkey731: TAutoIncField
      FieldName = 'Rkey731'
      ReadOnly = True
    end
    object cds732haoRkey733: TAutoIncField
      FieldName = 'Rkey733'
      ReadOnly = True
    end
    object cds732haorkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object cds732haoTYPE: TSmallintField
      FieldName = 'TYPE'
    end
    object cds732haoempl_ptr: TIntegerField
      FieldName = 'empl_ptr'
    end
    object cds732haocreate_empl_ptr: TIntegerField
      FieldName = 'create_empl_ptr'
    end
    object cds732haocreare_date: TDateTimeField
      FieldName = 'creare_date'
    end
    object cds732haorkey25: TIntegerField
      FieldName = 'rkey25'
    end
    object cds732haolam2_1: TStringField
      FieldName = 'lam2_1'
      Size = 30
    end
    object cds732haolam_ty_gp_1: TStringField
      FieldName = 'lam_ty_gp_1'
      Size = 30
    end
    object cds732haorkey17: TIntegerField
      FieldName = 'rkey17'
    end
    object cds732haopanel_ln_1: TBCDField
      FieldName = 'panel_ln_1'
      Precision = 7
      Size = 2
    end
    object cds732haopanel_wd_1: TBCDField
      FieldName = 'panel_wd_1'
      Precision = 7
      Size = 2
    end
    object cds732haomanuf_qty: TIntegerField
      FieldName = 'manuf_qty'
    end
    object cds732haopanel_qty: TIntegerField
      FieldName = 'panel_qty'
    end
    object cds732haopp_quota_len: TBCDField
      FieldName = 'pp_quota_len'
      Precision = 10
      Size = 5
    end
    object cds732haopp_quota_roll_1: TBCDField
      FieldName = 'pp_quota_roll_1'
      Precision = 10
      Size = 5
    end
    object cds732haoremark: TWideStringField
      FieldName = 'remark'
      Size = 100
    end
    object cds732haorkey733_1: TIntegerField
      FieldName = 'rkey733_1'
    end
    object cds732haopanel_qty_e: TIntegerField
      FieldName = 'panel_qty_e'
    end
    object cds732haopp_quota_len_e: TBCDField
      FieldName = 'pp_quota_len_e'
      Precision = 10
      Size = 5
    end
    object cds732haopp_quota_roll_e: TBCDField
      FieldName = 'pp_quota_roll_e'
      Precision = 10
      Size = 5
    end
    object cds732haopick_material_qty: TIntegerField
      FieldName = 'pick_material_qty'
    end
    object cds732haopick_material_qty_e: TIntegerField
      FieldName = 'pick_material_qty_e'
    end
  end
end
