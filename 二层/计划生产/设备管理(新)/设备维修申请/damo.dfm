object DM: TDM
  OldCreateOrder = False
  Left = 626
  Top = 256
  Height = 303
  Width = 262
  object DataSource1: TDataSource
    DataSet = ADS567
    Left = 32
    Top = 56
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 8
  end
  object ADS567: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterScroll = ADS567AfterScroll
    CommandText = 
      'SELECT  DATA0567.RKEY,              DATA0567.NUMBER, '#13#10'         ' +
      '       DATA0567.STATUS,          DATA0567.DEPT_PTR,             ' +
      '    '#13#10'                    DATA0567.FASSET_PTR,     DATA0567.PLAC' +
      'E,                          '#13#10'               DATA0567.equipment_' +
      'grade,DATA0567.failure_grade,'#13#10'                DATA0567.failure_' +
      'degree,  convert(datetime,(convert(varchar,DATA0567.failure_date' +
      ',101)),101) as failure_dat,              '#13#10'                  DAT' +
      'A0567.EMPL_PTR, DATA0567.ent_date,'#13#10'                DATA0567.ref' +
      'erring_date, DATA0567.CONTACT_NAME,                 '#13#10'          ' +
      ' DATA0567.CONTACT_PHONE,DATA0567.failure_circs,'#13#10'               ' +
      ' DATA0567.disposal_emplptr,DATA0567.disposal_date,              ' +
      '  '#13#10'                DATA0567.maintain_empl, DATA0567.maintain_te' +
      'xt,                  '#13#10'                  DATA0567.validate_emplp' +
      'tr,DATA0567.complete_date,'#13#10'                DATA0567.validate_da' +
      'te,   DATA0567.validate_appraise,      '#13#10'                      D' +
      'ATA0567.fail_type,DATA0567.WHOUSE_PTR,                       '#13#10' ' +
      '                 DATA0567.suspended_reason,DATA0567.stoppage_tim' +
      'e,       '#13#10'                    DATA0567.recovery_time,DATA0567.c' +
      'ompletion_emplptr,'#13#10'                DATA0567.stop_house, DATA056' +
      '7.maintain_house,                        '#13#10'            DATA0567.' +
      'validate_Description,DATA0567.D846_ptr,'#13#10'                DATA056' +
      '7.Staff_Sum_house,DATA0567.D840_ptr,'#13#10'                DATA0567.D' +
      '073_ptr,Data0034.DEPT_CODE,'#13#10'                Data0034.DEPT_NAME,' +
      'Data0417.FASSET_CODE,'#13#10'                Data0417.FASSET_NAME,Data' +
      '0417.FASSET_DESC,'#13#10'                Data0005.EMPL_CODE,Data0005.E' +
      'MPLOYEE_NAME,'#13#10'                Data0015.warehouse_code,Data0015.' +
      'ABBR_NAME,'#13#10'                Data0514.FASSET_TYPE,'#13#10'       case D' +
      'ata0567.status when 0 then '#39#26410#25552#20132#39' when 1 then '#39#24453#21463#29702#39'              ' +
      '    '#13#10'      when 2 then '#39#24050#21463#29702#39'   when 3 then '#39#24050#23436#24037#39' '#13#10'            ' +
      '    when 4 then '#39#24050#39564#25910#39' when 5 then '#39#34987#36864#22238#39' '#13#10'                when 6' +
      ' then '#39#24050#26242#20572#39'  end status_c,'#13#10'                d5.EMPLOYEE_NAME as ' +
      'vali_name, Data0034.rkey as rkey34,           '#13#10'       d5_1.EMPL' +
      'OYEE_NAME as   dispodalMan,'#13#10'                '#39'tslr'#39'=convert(varc' +
      'har(500),STUFF((SELECT '#39';'#39' + remark from                        ' +
      #13#10' data0841 where data0841.D567_ptr=data0567.rkey and           ' +
      '                '#13#10'   Status_ptr=7  FOR XML PATH('#39#39')), 1, 1, '#39#39'))' +
      #13#10'FROM   DATA0567 INNER JOIN Data0034 ON   '#13#10'             DATA05' +
      '67.DEPT_PTR = Data0034.rkey INNER JOIN'#13#10'             Data0417 ON' +
      ' dbo.DATA0567.FASSET_PTR = Data0417.RKEY               '#13#10'  LEFT ' +
      'OUTER JOIN Data0514 ON '#13#10'             DATA0417.FASSET_TYPE_PTR =' +
      ' Data0514.RKEY INNER JOIN'#13#10'             Data0005 ON dbo.DATA0567' +
      '.EMPL_PTR = Data0005.RKEY'#13#10'             left join data0005 d5 on' +
      ' DATA0567.validate_emplPTR=d5.rkey          '#13#10'          left joi' +
      'n data0005 d5_1 on                  '#13#10'                      DATA' +
      '0567.disposal_emplPTR=d5_1.rkey inner join'#13#10'             Data001' +
      '5 ON Data0567.whouse_ptr=Data0015.rkey'
    IndexFieldNames = 'NUMBER'
    Parameters = <>
    Left = 88
    Top = 56
    object ADS567RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS567NUMBER: TStringField
      FieldName = 'NUMBER'
      Size = 15
    end
    object ADS567STATUS: TWordField
      FieldName = 'STATUS'
    end
    object ADS567DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADS567FASSET_PTR: TIntegerField
      FieldName = 'FASSET_PTR'
    end
    object ADS567PLACE: TStringField
      FieldName = 'PLACE'
      Size = 40
    end
    object ADS567equipment_grade: TStringField
      FieldName = 'equipment_grade'
      Size = 10
    end
    object ADS567failure_grade: TStringField
      FieldName = 'failure_grade'
      Size = 4
    end
    object ADS567failure_degree: TStringField
      FieldName = 'failure_degree'
      Size = 8
    end
    object ADS567EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object ADS567ent_date: TDateTimeField
      FieldName = 'ent_date'
    end
    object ADS567referring_date: TDateTimeField
      FieldName = 'referring_date'
    end
    object ADS567CONTACT_NAME: TStringField
      FieldName = 'CONTACT_NAME'
      Size = 10
    end
    object ADS567CONTACT_PHONE: TStringField
      FieldName = 'CONTACT_PHONE'
      Size = 15
    end
    object ADS567failure_circs: TStringField
      FieldName = 'failure_circs'
      Size = 200
    end
    object ADS567disposal_emplptr: TIntegerField
      FieldName = 'disposal_emplptr'
    end
    object ADS567disposal_date: TDateTimeField
      FieldName = 'disposal_date'
    end
    object ADS567maintain_empl: TStringField
      FieldName = 'maintain_empl'
      Size = 50
    end
    object ADS567maintain_text: TStringField
      FieldName = 'maintain_text'
      Size = 400
    end
    object ADS567complete_date: TDateTimeField
      FieldName = 'complete_date'
    end
    object ADS567validate_emplptr: TIntegerField
      FieldName = 'validate_emplptr'
    end
    object ADS567validate_date: TDateTimeField
      FieldName = 'validate_date'
    end
    object ADS567validate_appraise: TStringField
      FieldName = 'validate_appraise'
      Size = 50
    end
    object ADS567fail_type: TStringField
      FieldName = 'fail_type'
      Size = 30
    end
    object ADS567WHOUSE_PTR: TIntegerField
      FieldName = 'WHOUSE_PTR'
    end
    object ADS567suspended_reason: TWideStringField
      FieldName = 'suspended_reason'
      Size = 50
    end
    object ADS567stoppage_time: TDateTimeField
      FieldName = 'stoppage_time'
    end
    object ADS567recovery_time: TDateTimeField
      FieldName = 'recovery_time'
    end
    object ADS567completion_emplptr: TIntegerField
      FieldName = 'completion_emplptr'
    end
    object ADS567stop_house: TBCDField
      FieldName = 'stop_house'
      Precision = 8
      Size = 2
    end
    object ADS567maintain_house: TBCDField
      FieldName = 'maintain_house'
      Precision = 8
      Size = 2
    end
    object ADS567validate_Description: TStringField
      FieldName = 'validate_Description'
      Size = 100
    end
    object ADS567D846_ptr: TIntegerField
      FieldName = 'D846_ptr'
    end
    object ADS567Staff_Sum_house: TBCDField
      FieldName = 'Staff_Sum_house'
      Precision = 8
      Size = 2
    end
    object ADS567D840_ptr: TIntegerField
      FieldName = 'D840_ptr'
    end
    object ADS567D073_ptr: TIntegerField
      FieldName = 'D073_ptr'
    end
    object ADS567DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADS567DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADS567FASSET_CODE: TStringField
      FieldName = 'FASSET_CODE'
    end
    object ADS567FASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object ADS567FASSET_DESC: TStringField
      FieldName = 'FASSET_DESC'
      Size = 40
    end
    object ADS567EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object ADS567EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS567warehouse_code: TStringField
      FieldName = 'warehouse_code'
      Size = 5
    end
    object ADS567ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADS567FASSET_TYPE: TStringField
      FieldName = 'FASSET_TYPE'
    end
    object ADS567status_c: TStringField
      FieldName = 'status_c'
      ReadOnly = True
      Size = 6
    end
    object ADS567vali_name: TStringField
      FieldName = 'vali_name'
      Size = 16
    end
    object ADS567rkey34: TIntegerField
      FieldName = 'rkey34'
      ReadOnly = True
    end
    object ADS567dispodalMan: TStringField
      FieldName = 'dispodalMan'
      Size = 16
    end
    object ADS567tslr: TStringField
      FieldName = 'tslr'
      ReadOnly = True
      Size = 500
    end
    object ADS567failure_dat: TDateTimeField
      FieldName = 'failure_dat'
      ReadOnly = True
    end
  end
  object DataSource2: TDataSource
    DataSet = ADS568
    Left = 32
    Top = 104
  end
  object ADS568: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT      rkey,failure_ptr, part_name, part_desc, quantity, su' +
      'pplier_name, amout, remart'#13#10'FROM         DATA0568 '#13#10'where  failu' +
      're_ptr=:rkey567'
    Parameters = <
      item
        Name = 'rkey567'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 88
    Top = 104
    object ADS568rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS568failure_ptr: TIntegerField
      FieldName = 'failure_ptr'
    end
    object ADS568part_name: TStringField
      FieldName = 'part_name'
    end
    object ADS568part_desc: TStringField
      FieldName = 'part_desc'
      Size = 50
    end
    object ADS568quantity: TBCDField
      FieldName = 'quantity'
      Precision = 8
      Size = 2
    end
    object ADS568supplier_name: TStringField
      FieldName = 'supplier_name'
      Size = 50
    end
    object ADS568amout: TBCDField
      FieldName = 'amout'
      Precision = 8
      Size = 2
    end
    object ADS568remart: TStringField
      FieldName = 'remart'
      Size = 100
    end
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 144
    Top = 56
  end
end
